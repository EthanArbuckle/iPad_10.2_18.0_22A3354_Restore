@implementation MAKGWeightConversion

+ (void)maPropertiesAndWeightForKGProperties:(id)a3 maProperties:(id *)a4 maWeight:(float *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = 1.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(CFSTR("__weight"), "isEqualToString:", v14))
        {
          objc_msgSend(v15, "value");
          v12 = v16;
        }
        else
        {
          objc_msgSend(v15, "kgPropertyValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1.0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v7);
  if (a5)
    *a5 = v12;

}

+ (id)kgPropertiesForMAProperties:(void *)a3 weight:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  KGDoublePropertyValue *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138412290;
    v18 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12, v18, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[KGPropertyValue kgPropertyValueWithMAPropertyValue:](KGPropertyValue, "kgPropertyValueWithMAPropertyValue:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);
        }
        else
        {
          KGLoggingConnection();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v18;
            v24 = v13;
            _os_log_fault_impl(&dword_1CA0A5000, v15, OS_LOG_TYPE_FAULT, "Invalid matisse property value %@", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }

  if (a1 != 1.0)
  {
    v16 = -[KGDoublePropertyValue initWithValue:]([KGDoublePropertyValue alloc], "initWithValue:", a1);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("__weight"));

  }
  return v5;
}

@end
