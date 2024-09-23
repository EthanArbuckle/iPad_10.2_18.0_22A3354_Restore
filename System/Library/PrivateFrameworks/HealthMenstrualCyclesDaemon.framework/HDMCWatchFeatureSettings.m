@implementation HDMCWatchFeatureSettings

- (_QWORD)initWithFeatureIdentifier:(void *)a3 changeComputer:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)HDMCWatchFeatureSettings;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[2];
      a1[2] = v7;

      v9 = _Block_copy(v6);
      v10 = (void *)a1[1];
      a1[1] = v9;

    }
  }

  return a1;
}

- (id)userDefaultsChangesFromFeatureSettings:(id)a3 currentUserDefaults:(id)a4
{
  return (id)(*((uint64_t (**)(void))self->_changeComputer + 2))();
}

+ (id)algorithmicProjectionsSettings
{
  _QWORD *v2;

  v2 = objc_alloc((Class)a1);
  return -[HDMCWatchFeatureSettings initWithFeatureIdentifier:changeComputer:](v2, (void *)*MEMORY[0x24BDD2E28], &__block_literal_global_7);
}

id __58__HDMCWatchFeatureSettings_algorithmicProjectionsSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BE46840]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", CFSTR("MenstruationProjectionsEnabled"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_msgSend(v7, "isEqualToNumber:", v8) & 1) == 0)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("MenstruationProjectionsEnabled"));

  }
  objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BE46828]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", CFSTR("FertileWindowProjectionsEnabled"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || (objc_msgSend(v9, "isEqualToNumber:", v10) & 1) == 0)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("FertileWindowProjectionsEnabled"));

  }
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

+ (id)hiddenLoggingRowsSettings
{
  _QWORD *v2;

  v2 = objc_alloc((Class)a1);
  return -[HDMCWatchFeatureSettings initWithFeatureIdentifier:changeComputer:](v2, (void *)*MEMORY[0x24BDD2E28], &__block_literal_global_279);
}

id __53__HDMCWatchFeatureSettings_hiddenLoggingRowsSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  const __CFString *v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  HKMCAllDisplayTypeIdentifiers();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "numberForKey:", v13, (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "hk_safeDictionaryIfExistsForKeyPath:error:", CFSTR("ShouldHideByDisplayTypeIdentifier"), 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = (void *)MEMORY[0x24BDBD1B8];
  if (v15)
    v18 = v15;
  else
    v18 = MEMORY[0x24BDBD1B8];
  if ((objc_msgSend(v6, "isEqualToDictionary:", v18, (_QWORD)v20) & 1) == 0)
  {
    v24 = CFSTR("ShouldHideByDisplayTypeIdentifier");
    v25 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong(&self->_changeComputer, 0);
}

@end
