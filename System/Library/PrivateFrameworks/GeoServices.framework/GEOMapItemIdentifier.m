@implementation GEOMapItemIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsIdentifierString, 0);
  objc_storeStrong((id *)&self->_mapsIdentifier, 0);
}

- (GEOMapItemIdentifier)initWithMapsIdentifier:(id)a3
{
  id v4;
  GEOMapItemIdentifier *v5;
  uint64_t v6;
  GEOPDMapsIdentifier *mapsIdentifier;
  GEOMapItemIdentifier *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOMapItemIdentifier;
    v5 = -[GEOMapItemIdentifier init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      mapsIdentifier = v5->_mapsIdentifier;
      v5->_mapsIdentifier = (GEOPDMapsIdentifier *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (GEOMapItemIdentifier)initWithPlace:(id)a3
{
  id v4;
  uint64_t v5;
  GEOMapItemIdentifier *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  GEOMapItemIdentifier *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;

  v4 = a3;
  if (!objc_msgSend(v4, "hasMapsId"))
  {
    if (objc_msgSend(v4, "hasPreferredMuid"))
    {
      v7 = objc_msgSend(v4, "preferredMuid");
    }
    else
    {
      if (!objc_msgSend(v4, "hasMuid"))
      {
        if (objc_msgSend(v4, "hasMapsId"))
        {
          objc_msgSend(v4, "mapsId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "shardedId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v24, "muid");

        }
        else
        {
          v8 = 0;
        }
        goto LABEL_8;
      }
      v7 = objc_msgSend(v4, "muid");
    }
    v8 = v7;
LABEL_8:
    if (objc_msgSend(v4, "hasResultProviderId"))
      v9 = objc_msgSend(v4, "resultProviderId");
    else
      v9 = 0;
    +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v10)
    {
      -[GEOPDPlaceInfo _readCenter](v10);
      if (*(_QWORD *)(v5 + 40))
      {
        -[GEOPDPlaceInfo center]((id *)v5);
        v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        v13 = v12;
        v15 = v14;
LABEL_23:

        v6 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v8, v9, v13, v15);
        goto LABEL_24;
      }
    }
    objc_msgSend(v4, "mapsId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shardedId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasCenter");

    if (v18)
    {
      objc_msgSend(v4, "mapsId");
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shardedId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "center");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "coordinate");
      v13 = v21;
      v15 = v22;
    }
    else
    {
      +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:](GEOPDSpatialLookupResult, "spatialLookupResultForPlaceData:", v4);
      v25 = objc_claimAutoreleasedReturnValue();
      v11 = (_QWORD *)v25;
      if (v25)
      {
        -[GEOPDSpatialLookupResult _readCenter](v25);
        if (v11[7])
        {
          -[GEOPDSpatialLookupResult center]((id *)v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "coordinate");
          v13 = v26;
          v15 = v27;
          goto LABEL_22;
        }
      }
      +[GEOPDRoadAccessInfo roadAccessInfoForPlaceData:](GEOPDRoadAccessInfo, "roadAccessInfoForPlaceData:", v4);
      v30 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v30;
      v13 = -180.0;
      if (!v30 || !objc_msgSend(*(id *)(v30 + 16), "count"))
      {
        v15 = -180.0;
        goto LABEL_22;
      }
      -[GEOPDRoadAccessInfo roadAccessPointAtIndex:]((id *)v19, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v31;
      if (v31)
      {
        objc_msgSend(v31, "location");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "coordinate");
        v13 = v33;
        v15 = v34;

      }
      else
      {
        v13 = -180.0;
        v15 = -180.0;
      }
    }

LABEL_22:
    goto LABEL_23;
  }
  objc_msgSend(v4, "mapsId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:](self, "initWithMapsIdentifier:", v5);
LABEL_24:
  v28 = v6;

  return v28;
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(id)a5
{
  double var1;
  double var0;
  uint64_t v7;
  GEOMapItemIdentifier *v9;
  GEOPDMapsIdentifier *v10;
  GEOPDMapsIdentifier *mapsIdentifier;
  GEOPDShardedId *v12;
  GEOPDShardedId *v13;
  GEOLatLng *v14;
  objc_super v16;

  var1 = a5.var1;
  var0 = a5.var0;
  v7 = *(_QWORD *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOMapItemIdentifier;
  v9 = -[GEOMapItemIdentifier init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(GEOPDMapsIdentifier);
    mapsIdentifier = v9->_mapsIdentifier;
    v9->_mapsIdentifier = v10;

    v12 = objc_alloc_init(GEOPDShardedId);
    v13 = v12;
    if (a3)
      -[GEOPDShardedId setMuid:](v12, "setMuid:", a3);
    if ((_DWORD)v7)
      -[GEOPDShardedId setResultProviderId:](v13, "setResultProviderId:", v7);
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      v14 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      -[GEOPDShardedId setCenter:](v13, "setCenter:", v14);

    }
    -[GEOPDMapsIdentifier setShardedId:](v9->_mapsIdentifier, "setShardedId:", v13);

  }
  return v9;
}

- (unint64_t)muid
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasMuid"))
  {
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "muid");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mapsIdentifier
{
  return (id)-[GEOPDMapsIdentifier copy](self->_mapsIdentifier, "copy");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  double v12;
  NSString *mapsIdentifierString;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  double v20;
  NSString *v21;
  id v22;

  v22 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v22;
    if (self)
    {
      -[GEOPDMapsIdentifier data](self->_mapsIdentifier, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "geo_encodeXPCData:forKey:", v5, CFSTR("identifier"));

      -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasMuid");

      if (v7)
        objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", -[GEOMapItemIdentifier muid](self, "muid"), CFSTR("muid"));
      -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasResultProviderId");

      if (v9)
        objc_msgSend(v4, "geo_encodeXPCInt64:forKey:", -[GEOMapItemIdentifier resultProviderID](self, "resultProviderID"), CFSTR("rpi"));
      -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasCenter");

      if (v11)
      {
        -[GEOMapItemIdentifier coordinate](self, "coordinate");
        objc_msgSend(v4, "geo_encodeXPCDouble:forKey:", CFSTR("lat"));
        -[GEOMapItemIdentifier coordinate](self, "coordinate");
        objc_msgSend(v4, "geo_encodeXPCDouble:forKey:", CFSTR("lng"), v12);
      }
      mapsIdentifierString = self->_mapsIdentifierString;
      if (mapsIdentifierString)
        objc_msgSend(v4, "geo_encodeXPCString:forKey:", mapsIdentifierString, CFSTR("mis"));
    }

  }
  else
  {
    objc_msgSend(v22, "encodeObject:forKey:", self->_mapsIdentifier, CFSTR("identifier"));
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasMuid");

    if (v15)
      objc_msgSend(v22, "encodeInt64:forKey:", -[GEOMapItemIdentifier muid](self, "muid"), CFSTR("muid"));
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasResultProviderId");

    if (v17)
      objc_msgSend(v22, "encodeInt32:forKey:", -[GEOMapItemIdentifier resultProviderID](self, "resultProviderID"), CFSTR("rpi"));
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasCenter");

    if (v19)
    {
      -[GEOMapItemIdentifier coordinate](self, "coordinate");
      objc_msgSend(v22, "encodeDouble:forKey:", CFSTR("lat"));
      -[GEOMapItemIdentifier coordinate](self, "coordinate");
      objc_msgSend(v22, "encodeDouble:forKey:", CFSTR("lng"), v20);
    }
    v21 = self->_mapsIdentifierString;
    if (v21)
      objc_msgSend(v22, "encodeObject:forKey:", v21, CFSTR("mis"));
  }

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (-[GEOMapItemIdentifier hasCoordinate](self, "hasCoordinate"))
  {
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "center");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lat");
    v6 = v5;

    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "center");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lng");
    v10 = v9;

  }
  else
  {
    v10 = 0xC066800000000000;
    v6 = 0xC066800000000000;
  }
  v11 = *(double *)&v6;
  v12 = *(double *)&v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (BOOL)hasCoordinate
{
  void *v2;
  char v3;

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCenter");

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  unint64_t v10;
  int v12;
  GEOPDMapsIdentifier *mapsIdentifier;
  void *v14;
  void *v15;
  unint64_t v16;

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasMuid");

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "muid");
LABEL_5:
    v10 = v7;

    return v10;
  }
  v8 = objc_msgSend(v5, "hasBasemapId");

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v8)
  {
    v7 = objc_msgSend(v9, "basemapId");
    goto LABEL_5;
  }
  v12 = objc_msgSend(v9, "hasCenter");

  mapsIdentifier = self->_mapsIdentifier;
  if (!v12)
    return -[GEOPDMapsIdentifier hash](mapsIdentifier, "hash");
  -[GEOPDMapsIdentifier shardedId](mapsIdentifier, "shardedId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");

  return v16;
}

- (int)resultProviderID
{
  void *v3;
  void *v4;
  int v5;

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasResultProviderId"))
  {
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "resultProviderId");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOMapItemIdentifier)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  GEOPDMapsIdentifier *v8;
  GEOPDMapsIdentifier *v9;
  uint64_t v10;
  void *v11;
  GEOMapItemIdentifier *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSString *v20;
  NSString *mapsIdentifierString;
  GEOMapItemIdentifier *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSString *v28;
  NSString *v29;
  char v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self)
    {
      objc_msgSend(v5, "geo_decodeXPCDataForKey:", CFSTR("identifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && (v8 = -[GEOPDMapsIdentifier initWithData:]([GEOPDMapsIdentifier alloc], "initWithData:", v7)) != 0)
      {
        v9 = v8;
        self = -[GEOMapItemIdentifier initWithMapsIdentifier:](self, "initWithMapsIdentifier:", v8);

      }
      else
      {
        v14 = objc_msgSend(v6, "geo_decodeXPCInt64ForKey:defaultValue:", CFSTR("muid"), 0);
        v15 = objc_msgSend(v6, "geo_decodeXPCInt64ForKey:defaultValue:", CFSTR("rpi"), 0);
        v31 = 1;
        objc_msgSend(v6, "geo_decodeXPCDoubleForKey:success:", CFSTR("lat"), &v31);
        v17 = v16;
        objc_msgSend(v6, "geo_decodeXPCDoubleForKey:success:", CFSTR("lng"), &v31);
        if (v31)
        {
          v19 = v18;
        }
        else
        {
          v17 = -180.0;
          v19 = -180.0;
        }
        objc_msgSend(v6, "geo_decodeXPCStringForKey:", CFSTR("mis"));
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        mapsIdentifierString = self->_mapsIdentifierString;
        self->_mapsIdentifierString = v20;

        self = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v14, v15, v17, v19);
      }

    }
    v22 = self;
LABEL_28:
    v12 = v22;
    goto LABEL_29;
  }
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("identifier"))
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier")),
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("muid")))
      v13 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("muid"));
    else
      v13 = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rpi")))
      v23 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("rpi"));
    else
      v23 = 0;
    v24 = -180.0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("lat")))
    {
      v25 = -180.0;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("lng")))
      {
        objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lat"));
        v24 = v26;
        objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lng"));
        v25 = v27;
      }
    }
    else
    {
      v25 = -180.0;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mis")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mis"));
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      v29 = self->_mapsIdentifierString;
      self->_mapsIdentifierString = v28;

    }
    v22 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v13, v23, v24, v25);
    goto LABEL_28;
  }
  v11 = (void *)v10;
  v12 = -[GEOMapItemIdentifier initWithMapsIdentifier:](self, "initWithMapsIdentifier:", v10);

LABEL_29:
  return v12;
}

- (BOOL)isValid
{
  return -[GEOPDMapsIdentifier isValidMapsIdentifier](self->_mapsIdentifier, "isValidMapsIdentifier");
}

+ (id)mapItemIdentifiersFromMapsIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOMapItemIdentifier *v11;
  GEOMapItemIdentifier *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = [GEOMapItemIdentifier alloc];
          v12 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v11, "initWithMapsIdentifier:", v10, (_QWORD)v14);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEOMapItemIdentifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOMapItemIdentifier;

  return 0;
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3
{
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", a3, 0, -180.0, -180.0);
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 coordinate:(id)a4
{
  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", a3, 0, a4.var0, a4.var1);
}

- (GEOMapItemIdentifier)initWithMUID:(unint64_t)a3 sourceID:(unsigned int)a4
{
  uint64_t v4;
  GEOMapItemIdentifier *v6;
  GEOPDMapsIdentifier *v7;
  GEOPDMapsIdentifier *mapsIdentifier;
  GEOPDShardedId *v9;
  GEOMapItemIdentifier *v10;
  objc_super v12;

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    v12.receiver = self;
    v12.super_class = (Class)GEOMapItemIdentifier;
    v6 = -[GEOMapItemIdentifier init](&v12, sel_init);
    if (v6)
    {
      v7 = objc_alloc_init(GEOPDMapsIdentifier);
      mapsIdentifier = v6->_mapsIdentifier;
      v6->_mapsIdentifier = v7;

      v9 = objc_alloc_init(GEOPDShardedId);
      -[GEOPDShardedId setMuid:](v9, "setMuid:", a3);
      if ((_DWORD)v4)
        -[GEOPDShardedId setSourceId:](v9, "setSourceId:", v4);
      -[GEOPDMapsIdentifier setShardedId:](v6->_mapsIdentifier, "setShardedId:", v9);

    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GEOMapItemIdentifier)initWithBasemapId:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(id)a5
{
  double var1;
  double var0;
  uint64_t v7;
  GEOMapItemIdentifier *v9;
  GEOPDMapsIdentifier *v10;
  GEOPDMapsIdentifier *mapsIdentifier;
  GEOPDShardedId *v12;
  GEOPDShardedId *v13;
  GEOLatLng *v14;
  objc_super v16;

  var1 = a5.var1;
  var0 = a5.var0;
  v7 = *(_QWORD *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOMapItemIdentifier;
  v9 = -[GEOMapItemIdentifier init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(GEOPDMapsIdentifier);
    mapsIdentifier = v9->_mapsIdentifier;
    v9->_mapsIdentifier = v10;

    v12 = objc_alloc_init(GEOPDShardedId);
    v13 = v12;
    if (a3)
      -[GEOPDShardedId setBasemapId:](v12, "setBasemapId:", a3);
    if ((_DWORD)v7)
      -[GEOPDShardedId setResultProviderId:](v13, "setResultProviderId:", v7);
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      v14 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      -[GEOPDShardedId setCenter:](v13, "setCenter:", v14);

    }
    -[GEOPDMapsIdentifier setShardedId:](v9->_mapsIdentifier, "setShardedId:", v13);

  }
  return v9;
}

- (GEOMapItemIdentifier)initWithMapItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "_muid");
  v6 = objc_msgSend(v4, "_resultProviderID");
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  v10 = v9;

  return -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](self, "initWithMUID:resultProviderID:coordinate:", v5, v6, v8, v10);
}

- (GEOMapItemIdentifier)initWithMapsIdentifierString:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  unsigned __int16 v7;
  char v8;
  char v9;
  unint64_t v10;
  unsigned int v11;
  unsigned __int16 v12;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  GEOMapItemIdentifier *v20;
  GEOMapItemIdentifier *v21;
  GEOPDMapsIdentifier *v22;
  GEOPDMapsIdentifier *mapsIdentifier;
  GEOPDShardedId *v24;
  uint64_t v25;
  NSString *mapsIdentifierString;
  objc_super v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;

  v4 = a3;
  v37 = 0;
  v36 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __53__GEOMapItemIdentifier_initWithMapsIdentifierString___block_invoke;
  v29[3] = &unk_1E1C0A3C0;
  v31 = &v32;
  v5 = v4;
  v30 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x18D765024](v29);
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = v33[3];
  while (v10 < objc_msgSend(v5, "length"))
  {
    v11 = objc_msgSend(v5, "characterAtIndex:", v33[3]);
    v12 = v11;
    if (v11 <= v7)
      goto LABEL_22;
    switch(v11)
    {
      case 'H':
        ++v33[3];
        v6[2](v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "length")
          || (objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v15),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "scanHexInt:", &v37),
              v16,
              (v17 & 1) == 0))
        {
LABEL_21:

LABEL_22:
          v20 = 0;
          goto LABEL_29;
        }
        v9 = 1;
        goto LABEL_19;
      case 'I':
        ++v33[3];
        v6[2](v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "length"))
          goto LABEL_21;
        objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "scanHexLongLong:", &v36);

        if ((v19 & 1) == 0)
          goto LABEL_21;
        v8 = 1;
LABEL_19:

        goto LABEL_20;
      case 'G':
        goto LABEL_22;
    }
    if (v11 - 48 < 0xA || (unsigned __int16)(v11 - 65) < 6u)
      goto LABEL_22;
    ++v33[3];
    v14 = (id)((uint64_t (*)(_QWORD))v6[2])(v6);
LABEL_20:
    v10 = v33[3] + 1;
    v33[3] = v10;
    v7 = v12;
  }
  if ((v8 & 1) == 0)
    goto LABEL_22;
  v28.receiver = self;
  v28.super_class = (Class)GEOMapItemIdentifier;
  v21 = -[GEOMapItemIdentifier init](&v28, sel_init);
  if (v21)
  {
    v22 = objc_alloc_init(GEOPDMapsIdentifier);
    mapsIdentifier = v21->_mapsIdentifier;
    v21->_mapsIdentifier = v22;

    v24 = objc_alloc_init(GEOPDShardedId);
    -[GEOPDShardedId setMuid:](v24, "setMuid:", v36);
    -[GEOPDShardedId setIsExternalVisibleId:](v24, "setIsExternalVisibleId:", 1);
    if ((v9 & 1) != 0)
      -[GEOPDShardedId setSourceId:](v24, "setSourceId:", v37);
    -[GEOPDMapsIdentifier setShardedId:](v21->_mapsIdentifier, "setShardedId:", v24);
    v25 = objc_msgSend(v5, "copy");
    mapsIdentifierString = v21->_mapsIdentifierString;
    v21->_mapsIdentifierString = (NSString *)v25;

  }
  self = v21;
  v20 = self;
LABEL_29:

  _Block_object_dispose(&v32, 8);
  return v20;
}

id __53__GEOMapItemIdentifier_initWithMapsIdentifierString___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  void *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2 >= objc_msgSend(*(id *)(a1 + 32), "length"))
    goto LABEL_9;
  v3 = v2;
  do
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v3);
    if ((v4 - 48) >= 0xA && (v4 - 65) > 5)
      break;
    ++v3;
  }
  while (v3 < objc_msgSend(*(id *)(a1 + 32), "length"));
  if (v3 == v2)
  {
LABEL_9:
    v6 = 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 - 1;
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v2, v3 - v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)hasMapsIdentifierString
{
  char v2;
  void *v4;
  void *v5;

  if (self->_mapsIdentifierString)
    return 1;
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasMuid"))
  {
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "isExternalVisibleId");

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (NSString)mapsIdentifierString
{
  NSString *mapsIdentifierString;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;

  mapsIdentifierString = self->_mapsIdentifierString;
  if (mapsIdentifierString)
  {
    v16 = mapsIdentifierString;
    return v16;
  }
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasMuid") & 1) == 0)
  {

    goto LABEL_11;
  }
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExternalVisibleId");

  if (!v6)
  {
LABEL_11:
    v16 = 0;
    return v16;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "hasSourceId"))
  {
LABEL_7:

    goto LABEL_8;
  }
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sourceId");

  if (v10)
  {
    objc_msgSend(v7, "appendString:", CFSTR("H"));
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __44__GEOMapItemIdentifier_mapsIdentifierString__block_invoke(objc_msgSend(v8, "sourceId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v11);

    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v7, "appendString:", CFSTR("I"));
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __44__GEOMapItemIdentifier_mapsIdentifierString__block_invoke(objc_msgSend(v12, "muid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v13);

  v14 = (NSString *)objc_msgSend(v7, "copy");
  v15 = self->_mapsIdentifierString;
  self->_mapsIdentifierString = v14;

  v16 = self->_mapsIdentifierString;
  return v16;
}

id __44__GEOMapItemIdentifier_mapsIdentifierString__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llX"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v2 = 0;
    while (objc_msgSend(v1, "characterAtIndex:", v2) == 48)
    {
      if (++v2 >= (unint64_t)objc_msgSend(v1, "length"))
        goto LABEL_7;
    }
    if (!v2)
      goto LABEL_8;
LABEL_7:
    objc_msgSend(v1, "substringFromIndex:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    v3 = v1;
  }
  v4 = v3;

  return v4;
}

- (id)debugDescription
{
  GEOPDMapsIdentifier *mapsIdentifier;
  uint64_t v4;

  mapsIdentifier = self->_mapsIdentifier;
  if (self->_mapsIdentifierString)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GEOMapItemIdentifier %p { %@ : %@ }>"), self, self->_mapsIdentifierString, mapsIdentifier);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GEOMapItemIdentifier %p { %@ }>"), self, mapsIdentifier, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)shortDebugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __CFString *v15;

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;

  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v9, "hasMuid");

  if ((_DWORD)v4)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("muid: %llu %.04f,%.04f"), objc_msgSend(v11, "muid"), v6, v8);
  }
  else
  {
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasBasemapId");

    if (!v13)
    {
      v15 = &stru_1E1C241D0;
      return v15;
    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("basemap_id: %llu %.04f,%.04f"), objc_msgSend(v11, "basemapId"), v6, v8);
  }
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p:"), objc_opt_class(), self);
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasMuid");

  if (v5)
    objc_msgSend(v3, "appendFormat:", CFSTR(" muid: %llu"), -[GEOMapItemIdentifier muid](self, "muid"));
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasBasemapId");

  if (v7)
  {
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" bmid: %llu"), objc_msgSend(v8, "basemapId"));

  }
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasResultProviderId");

  if (v10)
    objc_msgSend(v3, "appendFormat:", CFSTR(" rpi: %d"), -[GEOMapItemIdentifier resultProviderID](self, "resultProviderID"));
  -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasCenter");

  if (v12)
  {
    -[GEOMapItemIdentifier coordinate](self, "coordinate");
    v14 = v13;
    -[GEOMapItemIdentifier coordinate](self, "coordinate");
    objc_msgSend(v3, "appendFormat:", CFSTR(" lat,lng: %f,%f"), v14, v15);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  GEOMapItemIdentifier *v4;
  GEOMapItemIdentifier *v5;
  BOOL v6;

  v4 = (GEOMapItemIdentifier *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[GEOMapItemIdentifier isEqualToGEOMapItemIdentifier:](self, "isEqualToGEOMapItemIdentifier:", v5);

  return v6;
}

- (BOOL)isEqualToGEOMapItemIdentifier:(id)a3
{
  id *v4;
  NSString *mapsIdentifierString;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v28;
  int v29;
  void *v30;
  void *v31;

  v4 = (id *)a3;
  if (!v4)
    goto LABEL_20;
  mapsIdentifierString = self->_mapsIdentifierString;
  if (!mapsIdentifierString || !v4[2])
  {
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasMuid") & 1) != 0)
    {
      objc_msgSend(v4[1], "shardedId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasMuid");

      if (v9)
      {
        -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "muid");
        objc_msgSend(v4[1], "shardedId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "muid");
        goto LABEL_12;
      }
    }
    else
    {

    }
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "hasBasemapId") & 1) != 0)
    {
      objc_msgSend(v4[1], "shardedId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasBasemapId");

      if (v16)
      {
        -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "basemapId");
        objc_msgSend(v4[1], "shardedId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "basemapId");
LABEL_12:
        v17 = v13;

        if (v11 == v17)
        {
          -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "hasResultProviderId") & 1) != 0)
          {
            objc_msgSend(v4[1], "shardedId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "hasResultProviderId");

            if (v20)
            {
              -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "resultProviderId");
              objc_msgSend(v4[1], "shardedId");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v22 == objc_msgSend(v23, "resultProviderId");
LABEL_25:

              goto LABEL_21;
            }
          }
          else
          {

          }
          v6 = 1;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "hasMuid"))
      goto LABEL_18;
    objc_msgSend(v4[1], "shardedId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "hasMuid");

    if ((v26 & 1) != 0)
      goto LABEL_20;
    -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "hasCenter") & 1) == 0)
    {
LABEL_18:

    }
    else
    {
      objc_msgSend(v4[1], "shardedId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "hasCenter");

      if (v29)
      {
        -[GEOPDMapsIdentifier shardedId](self->_mapsIdentifier, "shardedId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "center");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4[1], "shardedId");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "center");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v23, "isEqual:", v31);

        goto LABEL_25;
      }
    }
LABEL_20:
    v6 = 0;
    goto LABEL_21;
  }
  v6 = -[NSString isEqual:](mapsIdentifierString, "isEqual:");
LABEL_21:

  return v6;
}

- (NSData)comparableRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v2 = (void *)-[GEOPDMapsIdentifier copy](self->_mapsIdentifier, "copy");
  objc_msgSend(v2, "shardedId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasMuid"))
  {

LABEL_4:
    objc_msgSend(v2, "shardedId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCenter:", 0);

    goto LABEL_5;
  }
  objc_msgSend(v2, "shardedId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasBasemapId");

  if (v5)
    goto LABEL_4;
LABEL_5:
  objc_msgSend(v2, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v7;
}

- (BOOL)isValidForOfflineUse
{
  return -[GEOPDMapsIdentifier isValidOfflineMapsIdentifier](self->_mapsIdentifier, "isValidOfflineMapsIdentifier");
}

@end
