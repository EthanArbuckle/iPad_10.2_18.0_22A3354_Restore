@implementation CESRAudioSamplingConfig

- (CESRAudioSamplingConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  CESRAudioSamplingConfig *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  CESRSamplingDimension *v18;
  void *v19;
  CESRSamplingDimension *v20;
  CESRAudioSamplingPolicy *v21;
  NSObject *v22;
  NSArray *samplingPolicies;
  CESRAudioSamplingConfig *v25;
  id v26;
  NSArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  CESRAudioSamplingPolicy *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CESRAudioSamplingConfig;
  v5 = -[CESRAudioSamplingConfig init](&v32, sel_init);
  if (v5)
  {
    v27 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v4)
    {
      v25 = v5;
      v26 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("samplingPolicies"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v29 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("samplingRate"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v13)
              {
                objc_msgSend(v13, "floatValue");
                if (v15 >= 0.0)
                {
                  objc_msgSend(v14, "floatValue");
                  if (v16 <= 1.0)
                  {
                    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("filterDimensions"));
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = [CESRSamplingDimension alloc];
                    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("asrLocale"));
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = -[CESRSamplingDimension initWithAsrLocale:](v18, "initWithAsrLocale:", v19);

                    v21 = -[CESRAudioSamplingPolicy initWithRuleDimension:samplingRate:numDimension:]([CESRAudioSamplingPolicy alloc], "initWithRuleDimension:samplingRate:numDimension:", v20, v14, objc_msgSend(v17, "count"));
                    -[NSArray addObject:](v27, "addObject:", v21);
                    v22 = *MEMORY[0x1E0CFE6C0];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v34 = "-[CESRAudioSamplingConfig initWithConfigDictionary:]";
                      v35 = 2112;
                      v36 = v21;
                      _os_log_debug_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_DEBUG, "%s Added Policy: %@", buf, 0x16u);
                    }

                  }
                }
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v9);
        }
      }

      v5 = v25;
      v4 = v26;
    }
    -[NSArray sortWithOptions:usingComparator:](v27, "sortWithOptions:usingComparator:", 16, &__block_literal_global_1912);
    samplingPolicies = v5->_samplingPolicies;
    v5->_samplingPolicies = v27;

  }
  return v5;
}

- (CESRAudioSamplingConfig)initWithConfigPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  CESRAudioSamplingConfig *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v4, 0, &v16);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v6)
      v7 = 1;
    else
      v7 = v5 == 0;
    if (v7)
    {
      v8 = v6;
      v9 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[CESRAudioSamplingConfig initWithConfigPath:]";
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = v8;
        _os_log_error_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_ERROR, "%s Can't Read File From %@, Error: %@", buf, 0x20u);
      }
    }
    else
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v8 = v12;
      if (!v12 && v11)
      {
        self = -[CESRAudioSamplingConfig initWithConfigDictionary:](self, "initWithConfigDictionary:", v11);
        v8 = (void *)v5;
        v10 = self;
LABEL_17:

        goto LABEL_18;
      }
      v13 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[CESRAudioSamplingConfig initWithConfigPath:]";
        v19 = 2112;
        v20 = v4;
        v21 = 2112;
        v22 = v8;
        _os_log_error_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_ERROR, "%s Can't Parse JSON From %@, Error: %@", buf, 0x20u);
      }

    }
    v10 = 0;
    v11 = (void *)v5;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (id)getSamplingRateFromDimension:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_samplingPolicies;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "isMatchedSamplingDimension:", v4, (_QWORD)v15))
        {
          v13 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v20 = "-[CESRAudioSamplingConfig getSamplingRateFromDimension:]";
            v21 = 2112;
            v22 = v4;
            v23 = 2112;
            v24 = v10;
            _os_log_debug_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_DEBUG, "%s The dimension %@ matches the sampling policy %@ .", buf, 0x20u);
          }
          objc_msgSend(v10, "samplingRate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CESRAudioSamplingConfig getSamplingRateFromDimension:]";
    _os_log_debug_impl(&dword_1B3E5F000, v11, OS_LOG_TYPE_DEBUG, "%s No Sampling Policy Available", buf, 0xCu);
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (NSArray)samplingPolicies
{
  return self->_samplingPolicies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingPolicies, 0);
}

uint64_t __52__CESRAudioSamplingConfig_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "numDimension");
  if (v6 >= objc_msgSend(v5, "numDimension"))
  {
    v8 = objc_msgSend(v4, "numDimension");
    if (v8 <= objc_msgSend(v5, "numDimension"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
