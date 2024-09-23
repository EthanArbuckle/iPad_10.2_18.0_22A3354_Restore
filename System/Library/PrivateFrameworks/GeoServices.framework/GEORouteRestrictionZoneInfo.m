@implementation GEORouteRestrictionZoneInfo

- (GEORouteRestrictionZoneInfo)init
{
  GEORouteRestrictionZoneInfo *result;

  result = (GEORouteRestrictionZoneInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORouteRestrictionZoneInfo)initWithGeoWaypointRoute:(id)a3
{
  id v4;
  GEORouteRestrictionZoneInfo *v5;
  void *v6;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  GEORouteRestrictionZoneID *v13;
  NSArray *zoneIDs;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "restrictionZoneInfo");
  v5 = (GEORouteRestrictionZoneInfo *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v20.receiver = self;
    v20.super_class = (Class)GEORouteRestrictionZoneInfo;
    self = -[GEORouteRestrictionZoneInfo init](&v20, sel_init);
    if (self)
    {
      objc_msgSend(v4, "restrictionZoneInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "restrictedZoneIdsCount"));
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v6, "restrictedZoneIds", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = -[GEORouteRestrictionZoneID initWithGeoRestrictedZoneId:]([GEORouteRestrictionZoneID alloc], "initWithGeoRestrictedZoneId:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
            if (v13)
              -[NSArray addObject:](v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }

      zoneIDs = self->_zoneIDs;
      self->_zoneIDs = v7;

      self->_restrictionZoneImpact = objc_msgSend(v6, "licensePlateRestrictionImpact");
      self = self;

      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (GEORouteRestrictionZoneInfo)initWithGeoRoute:(id)a3
{
  id v4;
  GEORouteRestrictionZoneInfo *v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEORouteRestrictionZoneID *v12;
  NSArray *zoneIDs;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "restrictedZoneIds");
  v5 = (GEORouteRestrictionZoneInfo *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)GEORouteRestrictionZoneInfo;
    self = -[GEORouteRestrictionZoneInfo init](&v19, sel_init);
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "restrictedZoneIdsCount"));
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v4, "restrictedZoneIds", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = -[GEORouteRestrictionZoneID initWithGeoRestrictedZoneId:]([GEORouteRestrictionZoneID alloc], "initWithGeoRestrictedZoneId:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
            if (v12)
              -[NSArray addObject:](v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v9);
      }

      zoneIDs = self->_zoneIDs;
      self->_zoneIDs = v6;

      self = self;
      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteRestrictionZoneInfo)initWithCoder:(id)a3
{
  id v4;
  GEORouteRestrictionZoneInfo *v5;
  uint64_t v6;
  NSArray *zoneIDs;
  GEORouteRestrictionZoneInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORouteRestrictionZoneInfo;
  v5 = -[GEORouteRestrictionZoneInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_zoneIDs"));
    v6 = objc_claimAutoreleasedReturnValue();
    zoneIDs = v5->_zoneIDs;
    v5->_zoneIDs = (NSArray *)v6;

    v5->_restrictionZoneImpact = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_restrictionZoneImpact"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *zoneIDs;
  id v5;

  zoneIDs = self->_zoneIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zoneIDs, CFSTR("_zoneIDs"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_restrictionZoneImpact, CFSTR("_restrictionZoneImpact"));

}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (int)restrictionZoneImpact
{
  return self->_restrictionZoneImpact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

@end
