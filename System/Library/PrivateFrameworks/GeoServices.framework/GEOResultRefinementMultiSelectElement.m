@implementation GEOResultRefinementMultiSelectElement

- (GEOResultRefinementMultiSelectElement)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 metadata:(id)a5 elementType:(unint64_t)a6 evChargingConnectorType:(int)a7 selectionSequenceNumber:(id)a8
{
  id v14;
  id v15;
  id v16;
  GEOResultRefinementMultiSelectElement *v17;
  _BOOL4 v19;
  GEOResultRefinementMultiSelectElement *v20;
  uint64_t v21;
  NSString *displayName;
  objc_super v24;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  v17 = 0;
  v19 = a6 != 1 || a7 != 0;
  if (v15 && v19)
  {
    v24.receiver = self;
    v24.super_class = (Class)GEOResultRefinementMultiSelectElement;
    v20 = -[GEOResultRefinementMultiSelectElement init](&v24, sel_init);
    if (v20)
    {
      v21 = objc_msgSend(v14, "copy");
      displayName = v20->_displayName;
      v20->_displayName = (NSString *)v21;

      v20->_isSelected = a4;
      objc_storeStrong((id *)&v20->_metadata, a5);
      v20->_elementType = a6;
      v20->_evChargingConnectorType = a7;
      objc_storeStrong((id *)&v20->_selectionSequenceNumber, a8);
    }
    self = v20;
    v17 = self;
  }

  return v17;
}

- (NSString)refinementKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[GEOResultRefinementMultiSelectElement metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasMetadataDefault"))
  {
    -[GEOResultRefinementMultiSelectElement metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadataDefault");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasRefinementKey"))
    {
      -[GEOResultRefinementMultiSelectElement metadata](self, "metadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "metadataDefault");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "refinementKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (GEOResultRefinementMultiSelectElement)initWithResultRefinementMultiSelectElement:(id)a3
{
  id *v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  GEOResultRefinementMultiSelectElement *v12;

  v4 = (id *)a3;
  v5 = -[GEOPDResultRefinementMultiSelectElement elementType]((uint64_t)v4);
  v6 = -[GEOPDResultRefinementMultiSelectElement evChargingConnectorType]((uint64_t)v4) - 1;
  if (v6 > 9)
    v7 = 0;
  else
    v7 = dword_189CD2E00[v6];
  if (v4)
  {
    if ((*((_WORD *)v4 + 38) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v4 + 17));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    -[GEOPDResultRefinementMultiSelectElement displayName](v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *((_BYTE *)v4 + 72) != 0;
  }
  else
  {
    -[GEOPDResultRefinementMultiSelectElement displayName](0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v10 = 0;
  }
  -[GEOPDResultRefinementMultiSelectElement metadata](v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEOResultRefinementMultiSelectElement initWithDisplayName:isSelected:metadata:elementType:evChargingConnectorType:selectionSequenceNumber:](self, "initWithDisplayName:isSelected:metadata:elementType:evChargingConnectorType:selectionSequenceNumber:", v9, v10, v11, v5 == 1, v7, v8);

  return v12;
}

- (id)convertToGEOPDResultRefinementMultiSelectElement
{
  GEOPDResultRefinementMultiSelectElement *v3;
  void *v4;
  BOOL v5;
  void *v6;
  unint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v3 = objc_alloc_init(GEOPDResultRefinementMultiSelectElement);
  -[GEOResultRefinementMultiSelectElement displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelectElement setDisplayName:]((uint64_t)v3, v4);

  v5 = -[GEOResultRefinementMultiSelectElement isSelected](self, "isSelected");
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 8u;
    v3->_isSelected = v5;
  }
  -[GEOResultRefinementMultiSelectElement metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelectElement setMetadata:]((uint64_t)v3, v6);

  v7 = -[GEOResultRefinementMultiSelectElement elementType](self, "elementType");
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 1u;
    v3->_elementType = v7 == 1;
  }
  v8 = -[GEOResultRefinementMultiSelectElement evChargingConnectorType](self, "evChargingConnectorType") - 1;
  if (v8 > 8)
    v9 = 0;
  else
    v9 = dword_189CD2E28[v8];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 2u;
    v3->_evChargingConnectorType = v9;
  }
  -[GEOResultRefinementMultiSelectElement selectionSequenceNumber](self, "selectionSequenceNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GEOResultRefinementMultiSelectElement selectionSequenceNumber](self, "selectionSequenceNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");
    if (v3)
    {
      *(_WORD *)&v3->_flags |= 0x100u;
      *(_WORD *)&v3->_flags |= 4u;
      v3->_selectionSequenceNumber = v12;
    }

  }
  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (GEOPDResultRefinementMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (int)evChargingConnectorType
{
  return self->_evChargingConnectorType;
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
