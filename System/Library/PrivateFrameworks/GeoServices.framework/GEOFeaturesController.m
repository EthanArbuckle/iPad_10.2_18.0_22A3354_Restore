@implementation GEOFeaturesController

- (GEOFeaturesController)init
{
  GEOFeaturesController *v2;
  void *v3;
  GEOFeaturesController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOFeaturesController;
  v2 = -[GEOFeaturesController init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C80D38];
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08, MEMORY[0x1E0C80D38], v2);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8, v3, v2);

    -[GEOFeaturesController _initializeFeatures](v2, "_initializeFeatures");
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, self);
  v3.receiver = self;
  v3.super_class = (Class)GEOFeaturesController;
  -[GEOFeaturesController dealloc](&v3, sel_dealloc);
}

- (void)_initializeFeatures
{
  NSArray *features;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  NSObject *v12;
  GEOFeatureInfo *v13;
  NSObject *p_super;
  NSObject *v15;
  NSArray *v16;
  void *v17;
  NSObject *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  features = self->_features;
  self->_features = (NSArray *)MEMORY[0x1E0C9AA60];

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  _getValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("clientFeatureFlags"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOGetMapsFeatureFlagsAuthLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = CFSTR("clientFeatureFlags");
      _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_ERROR, "featuresInfo %@ retrieved from key %@ is not NSArray", buf, 0x16u);
    }
    goto LABEL_21;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v6;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
    goto LABEL_20;
  v8 = v7;
  v9 = *(_QWORD *)v20;
  v17 = v5;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(obj);
      v11 = *(NSObject **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        GEOGetMapsFeatureFlagsAuthLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v11;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "featureDetails %@ is not NSDictionary", buf, 0xCu);
        }
        goto LABEL_19;
      }
      -[NSObject objectForKey:](v11, "objectForKey:", CFSTR("name"));
      v12 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        GEOGetMapsFeatureFlagsAuthLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v12;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "featureName %@ is not NSString", buf, 0xCu);
        }

LABEL_19:
        v5 = v17;

        goto LABEL_20;
      }
      v13 = -[GEOFeatureInfo initWithName:]([GEOFeatureInfo alloc], "initWithName:", v12);
      objc_msgSend(v4, "addObject:", v13);

    }
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v5 = v17;
    if (v8)
      continue;
    break;
  }
LABEL_20:

  v16 = (NSArray *)objc_msgSend(v4, "copy");
  p_super = &self->_features->super;
  self->_features = v16;
LABEL_21:

}

- (NSArray)features
{
  return self->_features;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id WeakRetained;

  -[GEOFeaturesController _initializeFeatures](self, "_initializeFeatures", *(_QWORD *)&a3.var0, a3.var1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "featuresControllerDidReloadFeatureList:", self);

}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (GEOFeaturesControllerDelegate)delegate
{
  return (GEOFeaturesControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_features, 0);
}

@end
