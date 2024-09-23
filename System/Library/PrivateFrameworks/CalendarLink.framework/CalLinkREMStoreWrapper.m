@implementation CalLinkREMStoreWrapper

- (CalLinkREMStoreWrapper)init
{
  CalLinkREMStoreWrapper *v2;
  void *v3;
  id v4;
  uint64_t v5;
  REMStore *reminderStore;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)CalLinkREMStoreWrapper;
  v2 = -[CalLinkREMStoreWrapper init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getREMStoreClass_softClass;
    v13 = getREMStoreClass_softClass;
    if (!getREMStoreClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getREMStoreClass_block_invoke;
      v9[3] = &unk_24E0934D8;
      v9[4] = &v10;
      __getREMStoreClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = objc_opt_new();
    reminderStore = v2->_reminderStore;
    v2->_reminderStore = (REMStore *)v5;

  }
  return v2;
}

- (id)fetchReminderListNamesForReminderURLs:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v11 = (void *)getREMObjectIDClass_softClass;
        v30 = getREMObjectIDClass_softClass;
        if (!getREMObjectIDClass_softClass)
        {
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __getREMObjectIDClass_block_invoke;
          v26[3] = &unk_24E0934D8;
          v26[4] = &v27;
          __getREMObjectIDClass_block_invoke((uint64_t)v26);
          v11 = (void *)v28[3];
        }
        v12 = objc_retainAutorelease(v11);
        _Block_object_dispose(&v27, 8);
        objc_msgSend(v12, "objectIDWithURL:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v7);
  }

  -[REMStore fetchRemindersWithObjectIDs:error:](self->_reminderStore, "fetchRemindersWithObjectIDs:error:", v5, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)objc_opt_new();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __70__CalLinkREMStoreWrapper_fetchReminderListNamesForReminderURLs_error___block_invoke;
    v20[3] = &unk_24E0934B0;
    v16 = v15;
    v21 = v16;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v20);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __70__CalLinkREMStoreWrapper_fetchReminderListNamesForReminderURLs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "urlRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderStore, 0);
}

@end
