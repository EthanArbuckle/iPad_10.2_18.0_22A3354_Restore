@implementation SmartStyleRendererPlist

- (SmartStyleRendererPlist)init
{
  SmartStyleRendererPlist *v2;
  NSDictionary *v3;
  NSDictionary *tuningVariants;
  SmartStyleRendererPlist *v5;
  NSObject *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SmartStyleRendererPlist;
  v2 = -[SmartStyleRendererPlist init](&v8, sel_init);
  if (v2
    && (v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]),
        tuningVariants = v2->_tuningVariants,
        v2->_tuningVariants = v3,
        tuningVariants,
        v2->_tuningVariants))
  {
    v5 = v2;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v5 = 0;
  }

  return v5;
}

- (int)readPlist:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  SmartStyleRendererTuning *v13;
  SmartStyleRendererTuning *v14;
  SmartStyleRendererTuning *v15;
  SmartStyleRendererTuning *defaultTuning;
  int v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SmartStyleRendererTuning initWithParams:keypath:]([SmartStyleRendererTuning alloc], "initWithParams:keypath:", v12, v11);
          if (!v13)
          {

            goto LABEL_13;
          }
          v14 = v13;
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_storeStrong((id *)&self->_tuningVariants, v5);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DefaultParameters"));
    v15 = (SmartStyleRendererTuning *)objc_claimAutoreleasedReturnValue();
    defaultTuning = self->_defaultTuning;
    self->_defaultTuning = v15;

    if (self->_defaultTuning)
      v17 = 0;
    else
LABEL_13:
      v17 = 4;
    v4 = v19;
  }
  else
  {
    v17 = -12786;
  }

  return v17;
}

- (NSDictionary)tuningVariants
{
  return self->_tuningVariants;
}

- (SmartStyleRendererTuning)defaultTuning
{
  return self->_defaultTuning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTuning, 0);
  objc_storeStrong((id *)&self->_tuningVariants, 0);
}

@end
