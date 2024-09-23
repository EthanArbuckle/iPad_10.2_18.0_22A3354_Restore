@implementation GEORestaurantFeaturesLink

- (GEORestaurantFeaturesLink)initWithRestaurantReservationLink:(id)a3 attributionMap:(id)a4
{
  id v7;
  id v8;
  GEORestaurantFeaturesLink *v9;
  GEORestaurantFeaturesLink *v10;
  GEORestaurantFeaturesLink *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEORestaurantFeaturesLink;
  v9 = -[GEORestaurantFeaturesLink init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_restaurantReservationLink, a3);
    objc_storeStrong((id *)&v10->_attributionMap, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)hasFeatures
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  -[GEORestaurantFeaturesLink restaurantReservationLink](self, "restaurantReservationLink");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = objc_msgSend(*(id *)(v2 + 16), "count") != 0;
  else
    v4 = 0;

  return v4;
}

- (NSArray)featureProviders
{
  void *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEORestaurantFeaturesLink restaurantReservationLink](self, "restaurantReservationLink", 0);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRestaurantReservationLink restaurantLinks](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[GEOPDVendorIDLink vendorId](v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v11;
        -[GEOPDVendorIDLink externalItemId](v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)applicationsForVendorID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOAttributionApp *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _getValue(GeoServicesConfig_DebugOverrideAppsForVendorID, (uint64_t)off_1EDF4D578, 1, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("restaurantReservationExtensionSupport"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v9 = objc_alloc_init(GEOAttributionApp);
              -[GEOAttributionApp setAppBundleIdentifier:](v9, "setAppBundleIdentifier:", v7);
              if (v8)
                -[GEOAttributionApp setRestaurantReservationExtensionSupport:](v9, "setRestaurantReservationExtensionSupport:", objc_msgSend(v8, "integerValue"));
              v12[0] = v9;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_15;
            }
          }

        }
      }

    }
    -[NSMapTable objectForKey:](self->_attributionMap, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributionApps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (id)displayNameForVendorID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    _getValue(GeoServicesConfig_DebugOverrideAppsForVendorID, (uint64_t)off_1EDF4D578, 1, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayName"));
          v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
          v8 = (void *)v7;

          goto LABEL_10;
        }
      }

    }
    -[NSMapTable objectForKey:](self->_attributionMap, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)extensionModeForVendorID:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  unint64_t v6;

  -[GEORestaurantFeaturesLink applicationsForVendorID:](self, "applicationsForVendorID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (v5 = objc_msgSend(v4, "restaurantReservationExtensionSupport") - 1, v5 <= 2))
    v6 = qword_189CD2450[v5];
  else
    v6 = 0;

  return v6;
}

- (NSArray)featureTypes
{
  void *v3;
  id *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t i;
  unsigned int v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORestaurantFeaturesLink restaurantReservationLink](self, "restaurantReservationLink");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRestaurantReservationLink restaurantLinks](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (!v6)
    goto LABEL_7;
LABEL_2:
  -[GEOPDVendorIDLink _readReservationTypes]((uint64_t)v6);
  for (i = v6[4]; v7 < i; i = 0)
  {
    v9 = -[GEOPDVendorIDLink reservationTypeAtIndex:]((uint64_t)v6, v7);
    if (v9 <= 2)
      objc_msgSend(v3, "addObject:", qword_1E1C08E70[v9]);
    ++v7;
    if (v6)
      goto LABEL_2;
LABEL_7:
    ;
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

- (GEOPDRestaurantReservationLink)restaurantReservationLink
{
  return self->_restaurantReservationLink;
}

- (void)setRestaurantReservationLink:(id)a3
{
  objc_storeStrong((id *)&self->_restaurantReservationLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_restaurantReservationLink, 0);
}

@end
