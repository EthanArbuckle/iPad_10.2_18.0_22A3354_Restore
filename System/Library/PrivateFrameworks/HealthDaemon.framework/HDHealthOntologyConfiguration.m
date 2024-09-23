@implementation HDHealthOntologyConfiguration

- (HDHealthOntologyConfiguration)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHealthOntologyConfiguration)initWithCountryConfigurations:(id)a3
{
  id v5;
  HDHealthOntologyConfiguration *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *countryConfigurations;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthOntologyConfiguration;
  v6 = -[HDHealthOntologyConfiguration init](&v24, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "countryCode", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v13, "countryCode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    v17 = objc_msgSend(v7, "copy");
    countryConfigurations = v6->_countryConfigurations;
    v6->_countryConfigurations = (NSDictionary *)v17;

  }
  return v6;
}

+ (id)bundledHealthOntologyConfiguration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HDHealthOntologyConfiguration_bundledHealthOntologyConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED552450 != -1)
    dispatch_once(&qword_1ED552450, block);
  return (id)_MergedGlobals_214;
}

void __67__HDHealthOntologyConfiguration_bundledHealthOntologyConfiguration__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDHealthOntologyCountryConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  HDHealthOntologyCountryConfiguration *v21;
  void *v22;
  void *v23;
  void *v24;
  HDHealthOntologyCountryConfiguration *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[3];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v2 = objc_msgSend(&unk_1E6DF9C68, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v32;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v32 != v4)
          objc_enumerationMutation(&unk_1E6DF9C68);
        v6 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(MEMORY[0x1E0CB6838], "codeSystemWithIdentifier:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "addObject:", v8);

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E6DF9C68, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v3);
  }
  v9 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0CB6838], "CVXSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "LOINCCodeSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "RxNormCodeSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "SNOMEDCodeSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "ICD9System");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "ICD10System");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addObjectsFromArray:", v1);
  v17 = -[HDHealthOntologyCountryConfiguration initWithCountryCode:supportedCodingSystems:analyticsOptions:]([HDHealthOntologyCountryConfiguration alloc], "initWithCountryCode:supportedCodingSystems:analyticsOptions:", CFSTR("US"), v16, 3);
  v18 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0CB6838], "LOINCCodeSystem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObjects:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addObjectsFromArray:", v1);
  v21 = -[HDHealthOntologyCountryConfiguration initWithCountryCode:supportedCodingSystems:analyticsOptions:]([HDHealthOntologyCountryConfiguration alloc], "initWithCountryCode:supportedCodingSystems:analyticsOptions:", CFSTR("CA"), v20, 0);
  v22 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0CB6838], "LOINCCodeSystem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithObjects:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addObjectsFromArray:", v1);
  v25 = -[HDHealthOntologyCountryConfiguration initWithCountryCode:supportedCodingSystems:analyticsOptions:]([HDHealthOntologyCountryConfiguration alloc], "initWithCountryCode:supportedCodingSystems:analyticsOptions:", CFSTR("GB"), v24, 0);
  v26 = objc_alloc(*(Class *)(a1 + 32));
  v35[0] = v17;
  v35[1] = v21;
  v35[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "initWithCountryConfigurations:", v27);
  v29 = (void *)_MergedGlobals_214;
  _MergedGlobals_214 = v28;

}

- (id)configurationForCountryCode:(id)a3
{
  NSDictionary *countryConfigurations;

  countryConfigurations = self->_countryConfigurations;
  if (!a3)
    a3 = (id)*MEMORY[0x1E0CB4AD0];
  return -[NSDictionary objectForKeyedSubscript:](countryConfigurations, "objectForKeyedSubscript:", a3);
}

- (NSArray)allCountryConfigurations
{
  return -[NSDictionary allValues](self->_countryConfigurations, "allValues");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryConfigurations, 0);
}

@end
