@implementation LDCMMobileAssetDistributor

- (void)receiveBehaviorDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LDCMBehaviorV4"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LDCMBehaviorV4"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v19 = v4;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LDCMBehaviorV4"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = (id)ldcmManagerStore;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              objc_msgSend((id)ldcmManagerStore, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v17 = objc_opt_isKindOfClass();

              if ((v17 & 1) != 0)
              {
                objc_msgSend((id)ldcmManagerStore, "objectForKeyedSubscript:", v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "processBehaviorDictionary:", v9);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v12);
        }

        v4 = v19;
      }
    }
  }

}

@end
