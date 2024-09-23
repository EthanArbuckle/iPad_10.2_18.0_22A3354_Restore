@implementation GEOVenueIdentifier

+ (id)componentIdentifiersFromVenueIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOVenueComponentIdentifier *v11;
  GEOVenueComponentIdentifier *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [GEOVenueComponentIdentifier alloc];
        v12 = -[GEOVenueComponentIdentifier initWithVenueIdentifier:](v11, "initWithVenueIdentifier:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (GEOVenueIdentifier)init
{
  GEOVenueIdentifier *result;

  result = (GEOVenueIdentifier *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOVenueIdentifier)initWithVenueIdentifiers:(id)a3
{
  id v4;
  _WORD *v5;
  __int16 v6;
  GEOVenueIdentifier *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  GEOVenueIdentifier *v20;
  uint64_t v21;
  NSArray *originalIdentifiers;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (_WORD *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v6 = v5[76], v5, (v6 & 0x80) == 0))
  {
LABEL_3:
    v7 = 0;
    v8 = v4;
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "count") != 1)
  {
    objc_msgSend(v4, "firstObject");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = v9 ? v9[16] : 0;

    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      v11 = 0;
      v12 = 1;
      while (1)
      {
        v13 = (void *)v11;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
        v11 = objc_claimAutoreleasedReturnValue();

        if (!v11 || (*(_WORD *)(v11 + 152) & 0x80) == 0 || *(_QWORD *)(v11 + 128) != v10)
          break;
        if (++v12 >= (unint64_t)objc_msgSend(v4, "count"))
        {

          goto LABEL_14;
        }
      }

      goto LABEL_3;
    }
  }
LABEL_14:

  objc_msgSend(v4, "firstObject");
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = v14[16];
  else
    v15 = 0;

  objc_msgSend(v4, "firstObject");
  v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = v16[10];
  else
    v17 = 0;

  objc_msgSend(v4, "firstObject");
  v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = v18[12];
  else
    v19 = 0;

  +[GEOVenueIdentifier componentIdentifiersFromVenueIdentifiers:](GEOVenueIdentifier, "componentIdentifiersFromVenueIdentifiers:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[GEOVenueIdentifier initWithVenueID:featureID:businessID:componentIdentifiers:](self, "initWithVenueID:featureID:businessID:componentIdentifiers:", v15, v17, v19, v8);
  v21 = objc_msgSend(v4, "copy");
  originalIdentifiers = v20->_originalIdentifiers;
  v20->_originalIdentifiers = (NSArray *)v21;

  self = v20;
  v7 = self;
LABEL_21:

  return v7;
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 componentIdentifiers:(id)a4
{
  return -[GEOVenueIdentifier initWithVenueID:featureID:businessID:componentIdentifiers:](self, "initWithVenueID:featureID:businessID:componentIdentifiers:", a3, 0, 0, a4);
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5 componentIdentifiers:(id)a6
{
  id v10;
  GEOVenueIdentifier *v11;
  GEOVenueIdentifier *v12;
  uint64_t v13;
  NSArray *componentIdentifiers;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)GEOVenueIdentifier;
  v11 = -[GEOVenueIdentifier init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_hasVenueID = 1;
    v11->_venueID = a3;
    v11->_hasFeatureID = a4 != 0;
    v11->_featureID = a4;
    v11->_hasBusinessID = a5 != 0;
    v11->_businessID = a5;
    v13 = objc_msgSend(v10, "copy");
    componentIdentifiers = v12->_componentIdentifiers;
    v12->_componentIdentifiers = (NSArray *)v13;

  }
  return v12;
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3
{
  return -[GEOVenueIdentifier initWithVenueID:featureID:businessID:componentIdentifiers:](self, "initWithVenueID:featureID:businessID:componentIdentifiers:", a3, 0, 0, MEMORY[0x1E0C9AA60]);
}

- (GEOVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5
{
  return -[GEOVenueIdentifier initWithVenueID:featureID:businessID:componentIdentifiers:](self, "initWithVenueID:featureID:businessID:componentIdentifiers:", a3, a4, a5, MEMORY[0x1E0C9AA60]);
}

- (id)placeDataVenueIdentifier
{
  GEOPDVenueIdentifier *v3;

  if (-[NSArray count](self->_originalIdentifiers, "count"))
  {
    -[NSArray firstObject](self->_originalIdentifiers, "firstObject");
    v3 = (GEOPDVenueIdentifier *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = -[GEOPDVenueIdentifier initWithIdentifier:]([GEOPDVenueIdentifier alloc], "initWithIdentifier:", self);
  }
  return v3;
}

- (id)placeDataVenueIdentifierForVenue
{
  GEOPDVenueIdentifier *v2;

  if (self->_hasVenueID)
    v2 = -[GEOPDVenueIdentifier initWithVenueID:featureID:businessID:]([GEOPDVenueIdentifier alloc], "initWithVenueID:featureID:businessID:", self->_venueID, self->_featureID, self->_businessID);
  else
    v2 = 0;
  return v2;
}

- (BOOL)_hasVenueID
{
  return self->_hasVenueID;
}

- (unint64_t)venueID
{
  return self->_venueID;
}

- (BOOL)_hasFeatureID
{
  return self->_hasFeatureID;
}

- (unint64_t)featureID
{
  return self->_featureID;
}

- (BOOL)_hasBusinessID
{
  return self->_hasBusinessID;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (NSArray)componentIdentifiers
{
  return self->_componentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalIdentifiers, 0);
  objc_storeStrong((id *)&self->_componentIdentifiers, 0);
}

@end
