@implementation _GEOConfigStorageRemote

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  GEOConfig_stripEntitlement(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _getValue(GeoServicesConfig_DebugActiveExperimentBranch, (uint64_t)off_1EDF4DB88, 1, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ClientConfig"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  v13 = v28;
  v14 = v28[5];
  if (a6 && v14)
  {
    *a6 = 3;
    v14 = v13[5];
  }
  if (!v14)
  {
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clientConfigurationValueForKey:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v28[5];
    v28[5] = v16;

    v18 = v28;
    v19 = v28[5];
    if (a6 && v19)
    {
      *a6 = 3;
      v19 = v18[5];
    }
    if (!v19)
    {
      +[GEONetworkDefaults sharedNetworkDefaults](GEONetworkDefaults, "sharedNetworkDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __75___GEOConfigStorageRemote_getConfigValueForKey_countryCode_options_source___block_invoke;
      v23[3] = &unk_1E1C035C0;
      v26 = &v27;
      v24 = v9;
      v25 = v10;
      objc_msgSend(v20, "allKeysAndValues:", v23);

      if (a6 && v28[5])
        *a6 = 4;

    }
  }
  if (a6)
    *a6 = 0;
  v21 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v21;
}

@end
