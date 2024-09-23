@implementation EMMessageListChangeObserverHelper

+ (void)collection:(id)a3 notifyChangeObserversAboutChangedItemIDs:(id)a4 extraInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("changesByObjectID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke;
  v14[3] = &unk_1E70F42F8;
  v17 = &v18;
  v12 = v11;
  v15 = v12;
  v13 = v8;
  v16 = v13;
  objc_msgSend(v13, "enumerateObserversWithBlock:", v14);
  objc_msgSend(a1, "collection:notifyChangeObserversAboutChangedItemIDs:itemIDsWithCountChanges:", v13, v9, v19[5]);

  _Block_object_dispose(&v18, 8);
}

void __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v12 = v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v12;
    if ((v5 & 1) != 0)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke_2;
      v13[3] = &unk_1E70F42D0;
      v9 = *(void **)(a1 + 32);
      v10 = *(id *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v14 = v10;
      v15 = v11;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);

      v4 = v12;
    }
  }

}

void __99__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_extraInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemIDForObjectID:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);

  }
}

+ (void)collection:(id)a3 notifyChangeObserversAboutChangedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  SEL v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_itemIDsWithCountChanges___block_invoke;
  v15[3] = &unk_1E70F4320;
  v19 = a2;
  v20 = a1;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v11;
  objc_msgSend(v12, "enumerateObserversWithBlock:", v15);

}

void __113__EMMessageListChangeObserverHelper_collection_notifyChangeObserversAboutChangedItemIDs_itemIDsWithCountChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), CFSTR("EMMessageList.m"), 1302, CFSTR("itemIDsWithCountChanges cannot be nil if changeObserver responds to collection:changedItemIDs:itemIDsWithCountChanges:"));

    }
    +[EMMessageList log](EMMessageList, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "count");
      v6 = objc_msgSend(*(id *)(a1 + 32), "count");
      v7 = (void *)objc_opt_class();
      v8 = *(_QWORD *)(a1 + 64);
      v16 = 134219010;
      v17 = v5;
      v18 = 2048;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v22 = 2048;
      v23 = v3;
      v24 = 2112;
      v25 = v8;
      v9 = v7;
      _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "Notifying observer of %lu changed itemIDs (%lu with count changes): <%@: %p>\n%@", (uint8_t *)&v16, 0x34u);

    }
    objc_msgSend(v3, "collection:changedItemIDs:itemIDsWithCountChanges:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    +[EMMessageList log](EMMessageList, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(a1 + 40), "count");
      v12 = (void *)objc_opt_class();
      v13 = *(void **)(a1 + 64);
      v16 = 134218754;
      v17 = v11;
      v18 = 2112;
      v19 = (uint64_t)v12;
      v20 = 2048;
      v21 = v3;
      v22 = 2112;
      v23 = v13;
      v14 = v12;
      _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "Notifying observer of %lu changed itemIDs: <%@: %p>\n%@", (uint8_t *)&v16, 0x2Au);

    }
    objc_msgSend(v3, "collection:changedItemIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

@end
