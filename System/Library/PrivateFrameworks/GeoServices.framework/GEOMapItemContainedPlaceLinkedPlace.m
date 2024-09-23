@implementation GEOMapItemContainedPlaceLinkedPlace

- (GEOMapItemContainedPlaceLinkedPlace)initWithLinkedPlace:(id)a3
{
  id v5;
  GEOMapItemContainedPlaceLinkedPlace *v6;
  GEOMapItemContainedPlaceLinkedPlace *v7;
  uint64_t *p_linkedPlace;
  uint64_t v9;
  GEOMapItemIdentifier *v10;
  void *v11;
  uint64_t v12;
  GEOMapItemIdentifier *identifier;
  uint64_t v14;
  GEOFeatureStyleAttributes *v15;
  void *v16;
  uint64_t v17;
  GEOFeatureStyleAttributes *styleAttributes;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOMapItemContainedPlaceLinkedPlace;
  v6 = -[GEOMapItemContainedPlaceLinkedPlace init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    p_linkedPlace = (uint64_t *)&v6->_linkedPlace;
    objc_storeStrong((id *)&v6->_linkedPlace, a3);
    v9 = *p_linkedPlace;
    if (*p_linkedPlace)
    {
      -[GEOPDLinkedPlace _readMapsId](*p_linkedPlace);
      if (*(_QWORD *)(v9 + 40))
      {
        v10 = [GEOMapItemIdentifier alloc];
        -[GEOPDLinkedPlace mapsId]((id *)*p_linkedPlace);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v10, "initWithMapsIdentifier:", v11);
        identifier = v7->_identifier;
        v7->_identifier = (GEOMapItemIdentifier *)v12;

      }
      v14 = *p_linkedPlace;
      if (*p_linkedPlace)
      {
        -[GEOPDLinkedPlace _readStyleAttributes](*p_linkedPlace);
        if (*(_QWORD *)(v14 + 56))
        {
          v15 = [GEOFeatureStyleAttributes alloc];
          -[GEOPDLinkedPlace styleAttributes]((id *)*p_linkedPlace);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[GEOFeatureStyleAttributes initWithPlaceDataStyleAttributes:](v15, "initWithPlaceDataStyleAttributes:", v16);
          styleAttributes = v7->_styleAttributes;
          v7->_styleAttributes = (GEOFeatureStyleAttributes *)v17;

        }
      }
    }
  }

  return v7;
}

- (BOOL)isValid
{
  return 1;
}

- (id)name
{
  return -[GEOPDLinkedPlace name]((id *)&self->_linkedPlace->super.super.isa);
}

- (int)referenceFrame
{
  -[GEOMapItemContainedPlaceLinkedPlace coordinate](self, "coordinate");
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  GEOMapItemIdentifier *identifier;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOPDLinkedPlace center]((id *)&self->_linkedPlace->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lat");
    v6 = v5;
    objc_msgSend(v4, "lng");
    v8 = v7;
  }
  else
  {
    identifier = self->_identifier;
    if (identifier)
    {
      -[GEOMapItemIdentifier coordinate](identifier, "coordinate");
      v6 = v10;
      v8 = v11;
    }
    else
    {
      v6 = 0xC066800000000000;
      v8 = 0xC066800000000000;
    }
  }

  v12 = *(double *)&v6;
  v13 = *(double *)&v8;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (BOOL)_hasResolvablePartialInformation
{
  return 1;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (BOOL)_hasMUID
{
  GEOPDLinkedPlace *linkedPlace;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  linkedPlace = self->_linkedPlace;
  if (!linkedPlace)
    return 0;
  -[GEOPDLinkedPlace _readMapsId]((uint64_t)self->_linkedPlace);
  if (!linkedPlace->_mapsId)
    return 0;
  -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasShardedId"))
  {
    -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shardedId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasMuid");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_muid
{
  return -[GEOMapItemIdentifier muid](self->_identifier, "muid");
}

- (id)_identifier
{
  return self->_identifier;
}

- (BOOL)_hasResultProviderID
{
  GEOPDLinkedPlace *linkedPlace;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  linkedPlace = self->_linkedPlace;
  if (!linkedPlace)
    return 0;
  -[GEOPDLinkedPlace _readMapsId]((uint64_t)self->_linkedPlace);
  if (!linkedPlace->_mapsId)
    return 0;
  -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasShardedId"))
  {
    -[GEOPDLinkedPlace mapsId]((id *)&self->_linkedPlace->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shardedId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasResultProviderId");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)_resultProviderID
{
  return -[GEOMapItemIdentifier resultProviderID](self->_identifier, "resultProviderID");
}

- (id)_styleAttributes
{
  return self->_styleAttributes;
}

- (BOOL)_isInLinkedPlaceRelationship
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p %@>\n%@"), self, v5, self->_linkedPlace);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_linkedPlace, 0);
}

@end
