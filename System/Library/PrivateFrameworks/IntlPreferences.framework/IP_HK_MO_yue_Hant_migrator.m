@implementation IP_HK_MO_yue_Hant_migrator

- (id)performMigrationForPreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ISMigrator previousSchemaVersion](self, "previousSchemaVersion") >= 0x3E8)
  {
    v17 = v4;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HK")) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("MO")) & 1) != 0)
    {
      v23 = v7;
      v24 = v6;
      v25 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v26 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v30;
        v12 = *MEMORY[0x1E0C997E8];
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v30 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("yue"));

            if ((v16 & 1) != 0)
            {
              v4 = v26;
              v17 = v26;

              goto LABEL_15;
            }

            ++v13;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v10)
            continue;
          break;
        }
      }

      v4 = v26;
      v17 = (id)objc_msgSend(v26, "mutableCopy");
      objc_msgSend(v26, "objectForKeyedSubscript:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __61__IP_HK_MO_yue_Hant_migrator_performMigrationForPreferences___block_invoke;
      v27[3] = &unk_1E7068F28;
      v28 = v19;
      v20 = v19;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v27);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, v22);

LABEL_15:
      v6 = v24;
      v5 = v25;
      v7 = v23;
    }
    else
    {
      v17 = v4;
    }

  }
  return v17;
}

@end
