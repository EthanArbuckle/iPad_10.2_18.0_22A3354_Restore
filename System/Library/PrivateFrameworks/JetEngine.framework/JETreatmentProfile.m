@implementation JETreatmentProfile

- (id)performTreatments:(id)a3
{
  id v4;
  NSArray *treatments;
  NSArray *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  if (self)
    treatments = self->_treatments;
  else
    treatments = 0;
  v6 = treatments;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v8 = v4;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v15;
    v8 = v4;
    while (2)
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        if (!v12)
        {
          v8 = 0;
          goto LABEL_13;
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "performTreatment:", v12, (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v8;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

+ (id)treatmentProfileWithConfiguration:(id)a3 topic:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  JETreatmentProfile *v9;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v7)
    v9 = -[JETreatmentProfile initWithConfigDictionary:topic:]([JETreatmentProfile alloc], "initWithConfigDictionary:topic:", v8, v6);
  else
    v9 = 0;

  return v9;
}

- (JETreatmentProfile)initWithConfigDictionary:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  JETreatmentProfile *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  JETreatmentProfile *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  NSArray *treatments;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)JETreatmentProfile;
  v8 = -[JETreatmentProfile init](&v33, sel_init);
  if (!v8)
    goto LABEL_28;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (v10 && objc_msgSend(v10, "integerValue") > 1)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("treatments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("treatments"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && !v15)
    {
      JEMetricsOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v12 = "JetEngine: Treatment profile doesn't have valid treatments configuration";
      goto LABEL_9;
    }
    v27 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          +[JETreatment treatmentWithConfiguration:topic:](JETreatment, "treatmentWithConfiguration:topic:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v7);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v20);
    }

    v24 = objc_msgSend(v17, "copy");
    treatments = v8->_treatments;
    v8->_treatments = (NSArray *)v24;

LABEL_28:
    v13 = v8;
    goto LABEL_29;
  }
  JEMetricsOSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v12 = "JetEngine: Treatment profile configuration is empty or the format version is not supported";
LABEL_9:
    _os_log_impl(&dword_19CCBB000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
  }
LABEL_10:

  v13 = 0;
LABEL_29:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatments, 0);
}

+ (id)treatmentProfileWithConfiguration:(id)a3
{
  return (id)objc_msgSend(a1, "treatmentProfileWithConfiguration:topic:", a3, 0);
}

@end
