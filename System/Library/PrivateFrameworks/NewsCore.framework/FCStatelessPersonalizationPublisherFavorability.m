@implementation FCStatelessPersonalizationPublisherFavorability

void __65__FCStatelessPersonalizationPublisherFavorability_initWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        FCAppConfigurationStringValue(v9, (uint64_t)CFSTR("publisherID"), 0);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          FCAppConfigurationNumberValue(v9, (uint64_t)CFSTR("favorability"), 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              v13 = (void *)FCStatelessPersonalizationLog;
              if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_ERROR))
              {
                v14 = v13;
                objc_msgSend(v3, "objectForKeyedSubscript:", v10);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v23 = v10;
                v24 = 2114;
                v25 = v15;
                v26 = 2114;
                v27 = v11;
                _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "Stateless personalization publisher favorability has duplicate entry for publisherID %{public}@. Existing favorability %{public}@, duplicate favorability %{public}@", buf, 0x20u);

              }
            }
            else
            {
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
            }
          }
          else
          {
            v17 = FCStatelessPersonalizationLog;
            if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v23 = CFSTR("favorability");
              v24 = 2114;
              v25 = v9;
              _os_log_error_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_ERROR, "Stateless personalization publisher favorability entry missing %{public}@: %{public}@", buf, 0x16u);
            }
          }

        }
        else
        {
          v16 = FCStatelessPersonalizationLog;
          if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v23 = CFSTR("publisherID");
            v24 = 2114;
            v25 = v9;
            _os_log_error_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_ERROR, "Stateless personalization publisher favorability entry missing %{public}@: %{public}@", buf, 0x16u);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorabilityByPublisherID, 0);
}

- (FCStatelessPersonalizationPublisherFavorability)initWithArray:(id)a3
{
  id v4;
  FCStatelessPersonalizationPublisherFavorability *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *favorabilityByPublisherID;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCStatelessPersonalizationPublisherFavorability;
  v5 = -[FCStatelessPersonalizationPublisherFavorability init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__FCStatelessPersonalizationPublisherFavorability_initWithArray___block_invoke;
    v10[3] = &unk_1E463AA78;
    v11 = v4;
    objc_msgSend(v6, "fc_dictionary:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    favorabilityByPublisherID = v5->_favorabilityByPublisherID;
    v5->_favorabilityByPublisherID = (NSDictionary *)v7;

  }
  return v5;
}

- (NSDictionary)favorabilityByPublisherID
{
  return self->_favorabilityByPublisherID;
}

- (void)setFavorabilityByPublisherID:(id)a3
{
  objc_storeStrong((id *)&self->_favorabilityByPublisherID, a3);
}

@end
