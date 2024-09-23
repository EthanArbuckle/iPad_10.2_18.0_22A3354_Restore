@implementation FCPersonalizationDataMigrator

- (FCPersonalizationDataMigrator)initWithTreatmentProvider:(id)a3
{
  id v4;
  FCPersonalizationDataMigrator *v5;
  void *v6;
  id treatmentProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationDataMigrator;
  v5 = -[FCPersonalizationDataMigrator init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    treatmentProvider = v5->_treatmentProvider;
    v5->_treatmentProvider = v6;

  }
  return v5;
}

- (BOOL)keyValueStore:(id)a3 canMigrateFromVersion:(unint64_t)a4
{
  return 1;
}

- (void)upgradeFromVersion2:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void (**v10)(void);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "upgrading personalization data store from v2 to v3", buf, 2u);
  }
  objc_msgSend(v4, "remoteRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "ignoring locally-cached PersonalizationProfile record since it lost its data when decoding", v16, 2u);
      }

      v7 = 0;
    }
  }
  -[FCPersonalizationDataMigrator treatmentProvider](self, "treatmentProvider");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCModifyPersonalizationOperation personalizationProfileFromRecord:](FCModifyPersonalizationOperation, "personalizationProfileFromRecord:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closedChangeGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCModifyPersonalizationOperation applyChangeGroups:toProfile:treatment:prune:](FCModifyPersonalizationOperation, "applyChangeGroups:toProfile:treatment:prune:", v13, v12, v11, 0);

  objc_msgSend(v4, "openChangeGroupDeltas");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCModifyPersonalizationOperation applyDeltas:toProfile:treatment:prune:](FCModifyPersonalizationOperation, "applyDeltas:toProfile:treatment:prune:", v14, v12, v11, 1);

  objc_msgSend(v4, "setClosedChangeGroups:", 0);
  objc_msgSend(v4, "setOpenChangeGroupDeltas:", 0);
  objc_msgSend(v12, "aggregates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAggregates:", v15);

}

- (id)keyValueStore:(id)a3 migrateObject:(id)a4 forKey:(id)a5 fromVersion:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  FCPersonalizationDataMigrator *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  v14 = v13;
  if (a6 == 1)
  {
    v14 = v13;
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("pb-data")))
      goto LABEL_14;
    v26 = self;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62778]), "initWithData:", v13);
    objc_msgSend(v15, "openChangeGroupDeltas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __80__FCPersonalizationDataMigrator_keyValueStore_migrateObject_forKey_fromVersion___block_invoke(v16);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v15, "closedChangeGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v21), "deltas");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          __80__FCPersonalizationDataMigrator_keyValueStore_migrateObject_forKey_fromVersion___block_invoke(v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v19);
    }

    self = v26;
    -[FCPersonalizationDataMigrator upgradeFromVersion2:](v26, "upgradeFromVersion2:", v15);
    objc_msgSend(v15, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a6 == 2 && objc_msgSend(v12, "isEqualToString:", CFSTR("pb-data")))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62778]), "initWithData:", v13);
    -[FCPersonalizationDataMigrator upgradeFromVersion2:](self, "upgradeFromVersion2:", v23);
    objc_msgSend(v23, "data");
    v24 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v24;
  }
LABEL_14:

  return v14;
}

void __80__FCPersonalizationDataMigrator_keyValueStore_migrateObject_forKey_fromVersion___block_invoke(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "eventsCount");
        if (v7)
        {
          v8 = v7;
          for (j = 0; j != v8; ++j)
          {
            v10 = objc_msgSend(v6, "events");
            v11 = *(_DWORD *)(v10 + 4 * j) & 0x1F | (*(_DWORD *)(v10 + 4 * j) >> 5 << 6);
            *(_DWORD *)(objc_msgSend(v6, "events") + 4 * j) = v11;
          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

- (id)treatmentProvider
{
  return self->_treatmentProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_treatmentProvider, 0);
}

@end
