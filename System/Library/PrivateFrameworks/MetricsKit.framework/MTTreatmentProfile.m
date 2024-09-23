@implementation MTTreatmentProfile

+ (id)treatmentProfileWithConfigData:(id)a3
{
  id v3;
  id v4;
  id v5;
  MTTreatmentProfile *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (treatmentProfileWithConfigData__onceToken != -1)
      dispatch_once(&treatmentProfileWithConfigData__onceToken, &__block_literal_global_20);
    v5 = (id)treatmentProfileWithConfigData__treatmentProfileCache;
    objc_sync_enter(v5);
    objc_msgSend((id)treatmentProfileWithConfigData__treatmentProfileCache, "objectForKeyedSubscript:", v4);
    v6 = (MTTreatmentProfile *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[MTTreatmentProfile initWithConfigDictionary:]([MTTreatmentProfile alloc], "initWithConfigDictionary:", v4);
      objc_msgSend((id)treatmentProfileWithConfigData__treatmentProfileCache, "setObject:forKeyedSubscript:", v6, v4);
    }
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __53__MTTreatmentProfile_treatmentProfileWithConfigData___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)treatmentProfileWithConfigData__treatmentProfileCache;
  treatmentProfileWithConfigData__treatmentProfileCache = v0;

}

- (MTTreatmentProfile)initWithConfigDictionary:(id)a3
{
  id v4;
  MTTreatmentProfile *v5;
  void *v6;
  NSObject *v7;
  MTTreatmentProfile *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[16];
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MTTreatmentProfile;
  v5 = -[MTTreatmentProfile init](&v25, sel_init);
  if (!v5)
    goto LABEL_18;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend(v6, "intValue") > 1)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("treatments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        MTMetricsKitOSLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D758000, v19, OS_LOG_TYPE_ERROR, "MetricsKit: Treatment profile doesn't have valid treatments configuration", buf, 2u);
        }

        goto LABEL_7;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          +[MTTreatment treatmentWithConfigData:](MTTreatment, "treatmentWithConfigData:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_msgSend(v10, "copy");
    -[MTTreatmentProfile setTreatments:](v5, "setTreatments:", v17);

LABEL_18:
    v8 = v5;
    goto LABEL_19;
  }
  MTMetricsKitOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Treatment profile configuration is empty or the format version is not supported", buf, 2u);
  }

LABEL_7:
  v8 = 0;
LABEL_19:

  return v8;
}

- (id)performTreatments:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v4 = a3;
  v14 = v4;
  -[MTTreatmentProfile treatments](self, "treatments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__MTTreatmentProfile_performTreatments___block_invoke;
  v8[3] = &unk_24C7A1958;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __40__MTTreatmentProfile_performTreatments___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(a2, "performTreatment:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    *a4 = 1;
  }
}

- (NSArray)treatments
{
  return self->_treatments;
}

- (void)setTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_treatments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatments, 0);
}

@end
