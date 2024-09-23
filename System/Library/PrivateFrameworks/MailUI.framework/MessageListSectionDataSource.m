@implementation MessageListSectionDataSource

uint64_t __56__MessageListSectionDataSource__enumerateItemIDs_block___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  const __CFString *v45;
  int v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  _BYTE v61[10];
  uint64_t v62;
  _BYTE v63[6];
  _BYTE v64[6];
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = objc_msgSend(*(id *)(a1 + 40), "count");
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      if (*(_BYTE *)(a1 + 96))
        v13 = CFSTR("before");
      else
        v13 = CFSTR("after");
      v14 = *(void **)(a1 + 64);
      v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v16 = *(unsigned __int8 *)(a1 + 97);
      v17 = *(unsigned __int8 *)(a1 + 98);
      v18 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v19 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v46 = 134220802;
      v47 = v9;
      v48 = 2048;
      v49 = v10;
      v50 = 2114;
      v51 = v13;
      v52 = 2112;
      v53 = v11;
      v54 = 2112;
      v55 = (uint64_t)v7;
      v56 = 2112;
      v57 = v12;
      v58 = 2048;
      v59 = v14;
      v60 = 1024;
      *(_DWORD *)v61 = v15;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v16;
      LOWORD(v62) = 1024;
      *(_DWORD *)((char *)&v62 + 2) = v17;
      HIWORD(v62) = 1024;
      *(_DWORD *)v63 = v18;
      *(_WORD *)&v63[4] = 1024;
      *(_DWORD *)v64 = v19;
      v20 = "%p: Added %lu item IDs %{public}@ %@: %@. To Thread: %@ for Message List: %p. Should deselect expanding item"
            "s: %d (Select All: %d, Initial Load Completed: %d, Is Expanding: %d, Parent is selected: %d)";
      v21 = v8;
      v22 = OS_LOG_TYPE_DEFAULT;
      v23 = 102;
      goto LABEL_24;
    }
  }
  else
  {
    if (a3 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "log");
      v35 = objc_claimAutoreleasedReturnValue();
      v8 = v35;
      if (a3 == a4)
      {
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        v36 = *(_QWORD *)(a1 + 32);
        v37 = objc_msgSend(*(id *)(a1 + 40), "count");
        v38 = *(unsigned __int8 *)(a1 + 96);
        v39 = *(_QWORD *)(a1 + 48);
        v46 = 134219522;
        if (v38)
          v40 = CFSTR("before");
        else
          v40 = CFSTR("after");
        v47 = v36;
        v48 = 2048;
        v49 = v37;
        v50 = 2114;
        v51 = v40;
        v52 = 2112;
        v53 = v39;
        v54 = 2048;
        v55 = a4;
        v56 = 2048;
        v57 = a4;
        v58 = 2112;
        v59 = v7;
        v20 = "%p: Added %lu item IDs %{public}@ %@ (log %lu/%lu): %@.";
        v21 = v8;
        v22 = OS_LOG_TYPE_DEFAULT;
      }
      else
      {
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          goto LABEL_25;
        v41 = *(_QWORD *)(a1 + 32);
        v42 = objc_msgSend(*(id *)(a1 + 40), "count");
        v43 = *(unsigned __int8 *)(a1 + 96);
        v44 = *(_QWORD *)(a1 + 48);
        v46 = 134219522;
        if (v43)
          v45 = CFSTR("before");
        else
          v45 = CFSTR("after");
        v47 = v41;
        v48 = 2048;
        v49 = v42;
        v50 = 2114;
        v51 = v45;
        v52 = 2112;
        v53 = v44;
        v54 = 2048;
        v55 = a3;
        v56 = 2048;
        v57 = a4;
        v58 = 2112;
        v59 = v7;
        v20 = "%p: Added %lu item IDs %{public}@ %@ (log %lu/%lu): %@.";
        v21 = v8;
        v22 = OS_LOG_TYPE_INFO;
      }
      v23 = 72;
LABEL_24:
      _os_log_impl(&dword_1D5522000, v21, v22, v20, (uint8_t *)&v46, v23);
      goto LABEL_25;
    }
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = objc_msgSend(*(id *)(a1 + 40), "count");
      v26 = CFSTR("before");
      v27 = *(_QWORD *)(a1 + 48);
      v28 = *(_QWORD *)(a1 + 56);
      if (!*(_BYTE *)(a1 + 96))
        v26 = CFSTR("after");
      v29 = *(_QWORD *)(a1 + 64);
      v30 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v31 = *(unsigned __int8 *)(a1 + 97);
      v32 = *(unsigned __int8 *)(a1 + 98);
      v33 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v34 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      v46 = 134221314;
      v47 = v24;
      v48 = 2048;
      v49 = v25;
      v50 = 2114;
      v51 = v26;
      v52 = 2112;
      v53 = v27;
      v54 = 2048;
      v55 = 1;
      v56 = 2048;
      v57 = a4;
      v58 = 2112;
      v59 = v7;
      v60 = 2112;
      *(_QWORD *)v61 = v28;
      *(_WORD *)&v61[8] = 2048;
      v62 = v29;
      *(_WORD *)v63 = 1024;
      *(_DWORD *)&v63[2] = v30;
      *(_WORD *)v64 = 1024;
      *(_DWORD *)&v64[2] = v31;
      v65 = 1024;
      v66 = v32;
      v67 = 1024;
      v68 = v33;
      v69 = 1024;
      v70 = v34;
      v20 = "%p: Added %lu item IDs %{public}@ %@ (log %lu/%lu): %@. To Thread: %@ for Message List: %p. Should deselect "
            "expanding items: %d (Select All: %d, Initial Load Completed: %d, Is Expanding: %d, Parent is selected: %d)";
      v21 = v8;
      v22 = OS_LOG_TYPE_DEFAULT;
      v23 = 122;
      goto LABEL_24;
    }
  }
LABEL_25:

}

- (OS_os_log)log
{
  return self->_log;
}

- (MessageListThreadHelper)threadHelper
{
  return self->_threadHelper;
}

- (BOOL)messageListItemHelper:(id)a3 isItemIDSelected:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[MessageListSectionDataSource selectionModelProvider](self, "selectionModelProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionModelForMessageListSectionDataSource:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSelectedItemID:", v5);

  return v8;
}

- (MessageListSectionDataSourceSelectionModelProvider)selectionModelProvider
{
  return (MessageListSectionDataSourceSelectionModelProvider *)objc_loadWeakRetained((id *)&self->_selectionModelProvider);
}

- (BOOL)messageListItemHelper:(id)a3 isItemIDExpandedThread:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  -[MessageListSectionDataSource messageList](self, "messageList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandedThreadItemIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  return v8;
}

- (BOOL)messageListItemHelper:(id)a3 anyExpandedThreadContainsItemID:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[MessageListSectionDataSource messageList](self, "messageList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "anyExpandedThreadContainsItemID:", v5);

  return v7;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (MessageListSectionDataSourceProvider)provider
{
  return (MessageListSectionDataSourceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (MessageListSectionDataSourceDelegate)delegate
{
  return (MessageListSectionDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MessageListViewControllerState)state
{
  return self->_state;
}

- (id)messageListItemForItemID:(id)a3 indexPath:(id)a4 receiver:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id val;
  char *spid;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48[2];
  _QWORD v49[4];
  id v50;
  id v51;
  MessageListSectionDataSource *v52;
  id v53;
  id v54;
  id v55;
  char *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62[2];
  id location;
  _BYTE buf[12];
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MessageListSectionDataSource signpostLog](self, "signpostLog");
  v14 = objc_claimAutoreleasedReturnValue();
  spid = (char *)os_signpost_id_generate(v14);

  -[MessageListSectionDataSource signpostLog](self, "signpostLog");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    objc_msgSend(v11, "ef_publicDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    v65 = 2114;
    v66 = v17;
    _os_signpost_emit_with_name_impl(&dword_1D5522000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "MessageListViewControllerItemFetch", "itemID=%{public}@, indexPath=%{public}@", buf, 0x16u);

  }
  -[MessageListSectionDataSource messageList](self, "messageList");
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "messageListItemForItemID:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setItemID:", v10);
  objc_msgSend(v12, "setMessageListItemFuture:", v18);
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke;
  v57[3] = &unk_1E99E1B40;
  objc_copyWeak(&v61, (id *)buf);
  objc_copyWeak(v62, &location);
  v20 = v10;
  v58 = v20;
  v21 = v11;
  v59 = v21;
  v62[1] = spid;
  v22 = v13;
  v60 = v22;
  objc_msgSend(v19, "afterDelay:performBlock:", v57, 2.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMessageListItemFetchTimeoutCancelable:", v23);

  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_70;
  v49[3] = &unk_1E99E1B68;
  v25 = v12;
  v50 = v25;
  v26 = v18;
  v51 = v26;
  v52 = self;
  v56 = spid;
  v27 = v20;
  v53 = v27;
  v28 = v21;
  v54 = v28;
  v29 = v22;
  v55 = v29;
  objc_msgSend(v26, "onScheduler:addSuccessBlock:", v24, v49);

  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_72;
  v41[3] = &unk_1E99E1B90;
  objc_copyWeak(&v47, (id *)buf);
  objc_copyWeak(v48, &location);
  v31 = v27;
  v42 = v31;
  v32 = v28;
  v43 = v32;
  v33 = v25;
  v44 = v33;
  v48[1] = spid;
  v34 = v26;
  v45 = v34;
  v35 = v29;
  v46 = v35;
  objc_msgSend(v34, "onScheduler:addFailureBlock:", v30, v41);

  v36 = v46;
  v37 = v34;

  objc_destroyWeak(v48);
  objc_destroyWeak(&v47);

  objc_destroyWeak(v62);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v37;
}

- (OS_os_log)signpostLog
{
  return self->_signpostLog;
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (MessageListItemHelper)itemHelper
{
  MessageListItemHelper *itemHelper;
  void *v4;
  void *v5;
  MessageListItemHelper *v6;
  MessageListItemHelper *v7;

  itemHelper = self->_itemHelper;
  if (!itemHelper)
  {
    -[MessageListSectionDataSource threadHelper](self, "threadHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = -[MessageListItemHelper initWithDelegate:]([MessageListItemHelper alloc], "initWithDelegate:", self);
    v7 = self->_itemHelper;
    self->_itemHelper = v6;

    itemHelper = self->_itemHelper;
  }
  return itemHelper;
}

- (NSString)section
{
  return self->_section;
}

- (BOOL)hasSupplementaryViewOfKind:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0DC48A8])
      && -[MessageListSectionDataSource _isSectionHeaderAllowed](self, "_isSectionHeaderAllowed");
}

void __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    v8 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_94;
    v9[3] = &unk_1E99E1600;
    v9[4] = v4;
    v10 = v8;
    objc_msgSend(v4, "_recoverFailedItemIDsIfNeededForCollection:completion:", v10, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore did finish initial load", buf, 0x16u);

    }
  }
}

- (void)_recoverFailedItemIDsIfNeededForCollection:(id)a3 excluding:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  void (**v27)(void);
  id v28;
  id v29;
  _QWORD v30[5];
  void (**v31)(void);
  uint64_t *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD aBlock[4];
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  MessageListSectionDataSource *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v28 = a4;
  v8 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke;
  aBlock[3] = &unk_1E99E1808;
  v26 = v8;
  v45 = v26;
  v27 = (void (**)(void))_Block_copy(aBlock);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  -[MessageListSectionDataSource failedItemIDs](self, "failedItemIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_2;
  v37[3] = &unk_1E99E1DE8;
  v37[4] = &v38;
  objc_msgSend(v9, "performWhileLocked:", v37);

  if (!objc_msgSend((id)v39[5], "count")
    || (-[MessageListSectionDataSource messageList](self, "messageList", v26),
        v10 = (id)objc_claimAutoreleasedReturnValue(),
        v11 = v10 == v29,
        v10,
        v11))
  {
    -[MessageListSectionDataSource messageList](self, "messageList", v26);
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = (id)v39[5];
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((-[NSObject containsItemID:](v12, "containsItemID:", v19) & 1) == 0)
          {
            -[MessageListSectionDataSource log](self, "log");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v48 = self;
              v49 = 2114;
              v50 = (uint64_t)v19;
              _os_log_impl(&dword_1D5522000, v20, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ is not part of collection - do not attempt recovery", buf, 0x16u);
            }

            objc_msgSend(v14, "addObject:", v19);
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v16);
    }

    objc_msgSend((id)v39[5], "ef_removeObjectsInArray:", v14);
    if (objc_msgSend((id)v39[5], "count"))
    {
      if (objc_msgSend(v28, "count"))
      {
        v21 = objc_msgSend((id)v39[5], "count");
        objc_msgSend((id)v39[5], "ef_removeObjectsInArray:", v28);
        if (objc_msgSend((id)v39[5], "count") != v21)
        {
          -[MessageListSectionDataSource log](self, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_msgSend((id)v39[5], "count");
            *(_DWORD *)buf = 134218240;
            v48 = self;
            v49 = 2048;
            v50 = v21 - v23;
            _os_log_impl(&dword_1D5522000, v22, OS_LOG_TYPE_DEFAULT, "%p: Skipping reloading of %ld failedItemIDs", buf, 0x16u);
          }

        }
      }
      if (objc_msgSend((id)v39[5], "count"))
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_129;
        v30[3] = &unk_1E99E1E10;
        v30[4] = self;
        v32 = &v38;
        v31 = v27;
        -[MessageListSectionDataSource _performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:](self, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", 0, 0, 0, v30, 0);

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {
      -[MessageListSectionDataSource log](self, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v29, "ef_publicDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v48 = self;
        v49 = 2114;
        v50 = (uint64_t)v25;
        _os_log_impl(&dword_1D5522000, v24, OS_LOG_TYPE_DEFAULT, "%p: Skip recovery of collection:%{public}@, no failed item ids", buf, 0x16u);

      }
    }
    v27[2]();
    goto LABEL_28;
  }
  -[MessageListSectionDataSource log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v29, "ef_publicDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v48 = self;
    v49 = 2112;
    v50 = (uint64_t)v13;
    _os_log_impl(&dword_1D5522000, v12, OS_LOG_TYPE_DEFAULT, "%p: Skip recovery, collection stale:%@", buf, 0x16u);

  }
LABEL_29:

  _Block_object_dispose(&v38, 8);
}

uint64_t __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (EFLocked)failedItemIDs
{
  return self->_failedItemIDs;
}

- (void)_recoverFailedItemIDsIfNeededForCollection:(id)a3 completion:(id)a4
{
  -[MessageListSectionDataSource _recoverFailedItemIDsIfNeededForCollection:excluding:completion:](self, "_recoverFailedItemIDsIfNeededForCollection:excluding:completion:", a3, 0, a4);
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke;
  v9[3] = &unk_1E99E1600;
  v9[4] = self;
  v10 = v4;
  v5 = v9;
  v6 = (void *)MEMORY[0x1E0D1F070];
  v7 = v4;
  objc_msgSend(v6, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performBlock:", v5);

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __96__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_before_unreadItemIDs___block_invoke;
  v21[3] = &unk_1E99E1BB8;
  v21[4] = self;
  v22 = v12;
  v23 = v14;
  v24 = v13;
  v25 = v11;
  v15 = (void *)MEMORY[0x1E0D1F070];
  v16 = v12;
  v17 = v14;
  v18 = v13;
  v19 = v11;
  objc_msgSend(v15, "mainThreadScheduler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performBlock:", v21);

}

- (void)_addedItemIDs:(id)a3 before:(BOOL)a4 existingItemID:(id)a5 toThreadWithItemID:(id)a6 inCollection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  os_signpost_id_t v33;
  _BOOL4 v34;
  _QWORD v35[4];
  id v36;
  MessageListSectionDataSource *v37;
  _BYTE *v38;
  _QWORD *v39;
  _QWORD *v40;
  os_signpost_id_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _BYTE *v45;
  _QWORD *v46;
  BOOL v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _BYTE *v56;
  BOOL v57;
  _QWORD v58[3];
  char v59;
  _QWORD v60[3];
  char v61;
  _QWORD v62[3];
  char v63;
  uint8_t v64[4];
  uint64_t v65;
  _BYTE buf[24];
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v34 = a4;
  v72 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[MessageListSectionDataSource messageList](self, "messageList");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v15)
  {
    -[MessageListSectionDataSource provider](self, "provider");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListSectionDataSource.m"), 764, CFSTR("provider cannot be nil"));

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v67 = __Block_byref_object_copy__0;
    v68 = __Block_byref_object_dispose__0;
    v69 = (id)0xAAAAAAAAAAAAAAAALL;
    v69 = (id)objc_msgSend(v12, "copy");
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x2020000000;
    v63 = -86;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    v61 = -86;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v59 = -86;
    -[MessageListSectionDataSource signpostLog](self, "signpostLog");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);

    -[MessageListSectionDataSource signpostLog](self, "signpostLog");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v24 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
      *(_DWORD *)v64 = 134217984;
      v65 = v24;
      _os_signpost_emit_with_name_impl(&dword_1D5522000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "MessageListViewControllerAddedItemsBatch", "itemIDsCount=%ld enableTelemetry=YES ", v64, 0xCu);
    }

    -[MessageListSectionDataSource delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "messageListSectionDataSource:willAddMessagesWithItemIdentifiers:", self, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    v26 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke;
    v48[3] = &unk_1E99E1CA8;
    v48[4] = self;
    v53 = v62;
    v49 = v14;
    v54 = v60;
    v55 = v58;
    v56 = buf;
    v50 = v12;
    v57 = v34;
    v27 = v13;
    v33 = v21;
    v17 = v19;
    v28 = v13;
    v29 = v12;
    v30 = v27;
    v51 = v27;
    v52 = v15;
    v42[0] = v26;
    v42[1] = 3221225472;
    v42[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_117;
    v42[3] = &unk_1E99E1CD0;
    v47 = v34;
    v42[4] = self;
    v45 = buf;
    v31 = v30;
    v12 = v29;
    v13 = v28;
    v43 = v31;
    v44 = v49;
    v46 = v58;
    v35[0] = v26;
    v35[1] = 3221225472;
    v35[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2_118;
    v35[3] = &unk_1E99E1CF8;
    v36 = v52;
    v37 = self;
    v38 = buf;
    v39 = v62;
    v40 = v60;
    v41 = v33;
    -[MessageListSectionDataSource _performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:](self, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", 1, 0, v48, v42, v35);

    _Block_object_dispose(v58, 8);
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(v62, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    -[MessageListSectionDataSource log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "ef_publicDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v67 = (uint64_t (*)(uint64_t, uint64_t))v12;
      LOWORD(v68) = 1024;
      *(_DWORD *)((char *)&v68 + 2) = v34;
      HIWORD(v68) = 2114;
      v69 = v13;
      v70 = 2114;
      v71 = v14;
      _os_log_impl(&dword_1D5522000, v17, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore added item ids: %{public}@, before: %{BOOL}d, existingItemID: %{public}@, threadItemID: %{public}@", buf, 0x3Au);

    }
  }

}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 cleanSnapshot:(BOOL)a4 prepare:(id)a5 update:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v9 = a4;
  v10 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  os_unfair_lock_lock(&self->_nextUpdateNeedsCleanSnapshotLock);
  if (-[MessageListSectionDataSource nextUpdateNeedsCleanSnapshot](self, "nextUpdateNeedsCleanSnapshot"))
  {
    -[MessageListSectionDataSource setNextUpdateNeedsCleanSnapshot:](self, "setNextUpdateNeedsCleanSnapshot:", 0);
    v9 = 1;
  }
  os_unfair_lock_unlock(&self->_nextUpdateNeedsCleanSnapshotLock);
  -[MessageListSectionDataSource provider](self, "provider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke;
  v17[3] = &unk_1E99E1DC0;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "messageListSectionDataSource:performUpdateAnimated:cleanSnapshot:prepare:update:completion:", self, v10, v9, v12, v17, v14);

}

- (BOOL)nextUpdateNeedsCleanSnapshot
{
  return self->_nextUpdateNeedsCleanSnapshot;
}

- (MessageListSectionDataSource)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MessageListSectionDataSource *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialLoadCompletedPromise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutValuesHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MessageListSectionDataSource initWithIdentifier:section:collectionView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:](self, "initWithIdentifier:section:collectionView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:", v5, v6, v7, v8, v9, v10, v11);

  if (v12)
  {
    objc_msgSend(v4, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_delegate, v13);

    objc_msgSend(v4, "selectionModelProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_selectionModelProvider, v14);

  }
  return v12;
}

void __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 134218240;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "%p: Finish initial load for collection: %p", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "initialLoadCompletedPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "messageListSectionDataSource:collectionFinishedSearching:remote:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "messageListSectionDataSourceDidFinishInitialLoad:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("kMessageListItemsFinishedLoad"), *(_QWORD *)(a1 + 40));

}

- (EFPromise)initialLoadCompletedPromise
{
  return self->_initialLoadCompletedPromise;
}

+ (BOOL)isFirstChange:(id)a3
{
  return objc_msgSend(a3, "isFirstChange");
}

+ (BOOL)isValidChange:(id)a3
{
  return objc_msgSend(a3, "isValid");
}

+ (BOOL)isEmptyChange:(id)a3
{
  return objc_msgSend(a3, "isEmpty");
}

+ (id)publicDescriptionForChange:(id)a3
{
  return (id)objc_msgSend(a3, "ef_publicDescription");
}

uint64_t __96__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_before_unreadItemIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addedItemIDs:before:existingItemID:toThreadWithItemID:inCollection:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v6, "removeAllObjects");
}

- (void)setIsRefreshing:(BOOL)a3
{
  self->_isRefreshing = a3;
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (EMObjectID)objectID
{
  return self->_objectID;
}

id __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "threadHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popItemIDsNeedingReloadPostUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_2;
    v15[3] = &unk_1E99E13B0;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "ef_filter:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_3;
    v12[3] = &unk_1E99E1600;
    v7 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v14 = v7;
    v8 = (void *)MEMORY[0x1E0D1F070];
    v9 = v6;
    objc_msgSend(v8, "mainThreadScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performBlock:", v12);

  }
  return v2;
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  char v28;
  char v29;
  char v30;

  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "threadHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*v2, "selectionModelProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionModelForMessageListSectionDataSource:", *v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(v2[5] + 8) + 24) = objc_msgSend(v3, "isThreadExpandingWithItemID:", v2[1]);
  v6 = objc_msgSend(v5, "isSelectAll");
  *(_BYTE *)(*(_QWORD *)(v2[6] + 8) + 24) = objc_msgSend(v5, "isSelectedItemID:", v2[1]);
  if (*(_BYTE *)(*(_QWORD *)(v2[5] + 8) + 24) || (v6 & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      LOBYTE(v7) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 0;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v7;
  v8 = a1 + 96;
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2;
  v21[3] = &unk_1E99E1C80;
  v21[4] = v9;
  v22 = *(id *)(a1 + 48);
  v28 = *(_BYTE *)(a1 + 104);
  v23 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 88);
  v25 = v11;
  v26 = v12;
  v29 = v6;
  v30 = 1;
  v27 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v9, "_enumerateItemIDs:block:", v10, v21);
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isInternal");

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (v16 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 40), "count"))
    {
      objc_msgSend((id)*v2, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_cold_1();

      objc_msgSend(v15, "array");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)v8 + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }

}

- (MessageListCollectionHelper)collectionHelper
{
  return self->_collectionHelper;
}

- (void)_updateSelectionStateForItemsWithIDs:(id)a3 inThreadWithItemID:(id)a4 snapshot:(id)a5 shouldDeselectMessages:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__MessageListSectionDataSource__updateSelectionStateForItemsWithIDs_inThreadWithItemID_snapshot_shouldDeselectMessages___block_invoke;
  v19[3] = &unk_1E99E1E38;
  v23 = a6;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v13 = v19;
  v14 = (void *)MEMORY[0x1E0D1F070];
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "mainThreadScheduler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performBlock:", v13);

}

- (void)_enumerateItemIDs:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD v13[4];

  v5 = a3;
  v6 = a4;
  v7 = vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v5, "count") / 200.0);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MessageListSectionDataSource__enumerateItemIDs_block___block_invoke;
  v9[3] = &unk_1E99E1D20;
  v8 = v6;
  v10 = v8;
  v11 = v13;
  v12 = v7;
  objc_msgSend(v5, "ef_enumerateObjectsInBatchesOfSize:block:", 200, v9);

  _Block_object_dispose(v13, 8);
}

void __120__MessageListSectionDataSource__updateSelectionStateForItemsWithIDs_inThreadWithItemID_snapshot_shouldDeselectMessages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selectionModelProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionModelForMessageListSectionDataSource:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 64);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      v32 = v6;
      v33 = 1024;
      v34 = v5;
      v35 = 2112;
      v36 = v7;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "%p: Update selection (should deselect: %d) for %@ in thread %@", buf, 0x26u);
    }

    objc_msgSend(*(id *)(a1 + 56), "mui_validItemIDFromExistingItemID:updateReason:", *(_QWORD *)(a1 + 48), CFSTR("Adding items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v3, "deselectItemWithItemID:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v11);

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = *(id *)(a1 + 40);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v3, "deselectItemWithItemID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObjectsFromArray:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v14);
      }

    }
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "threadHelper");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "itemIDsForReloadAfterInsertingItemsAfterItemID:snapshot:", v9, *(_QWORD *)(a1 + 56));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = *(void **)(a1 + 32);
        objc_msgSend(v10, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_reloadItemsWithItemIDs:", v22);

        objc_msgSend(v3, "didExpandThreadItemID:addedItemIDs:", v9, *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 40), "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addItemIDsNeedingReloadPostUpdate:", v24);

      }
    }

  }
}

+ (id)skippedChange
{
  return +[MessageListSectionDataSourceChange skipped](_TtC6MailUI34MessageListSectionDataSourceChange, "skipped");
}

+ (id)changeWithCount:(int64_t)a3
{
  return +[MessageListSectionDataSourceChange withCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withCount:", a3);
}

- (MessageListSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9
{
  id v16;
  id v17;
  id v18;
  MessageListSectionDataSource *v19;
  MessageListSectionDataSource *v20;
  id v21;
  id v22;
  uint64_t v23;
  EFLocked *failedItemIDs;
  NSMutableSet *v25;
  NSMutableSet *timedOutItemIDs;
  objc_class *v27;
  id v28;
  os_log_t v29;
  OS_os_log *log;
  objc_class *v31;
  id v32;
  os_log_t v33;
  OS_os_log *signpostLog;
  MessageListCollectionHelper *v35;
  MessageListCollectionHelper *collectionHelper;
  MessageListThreadHelper *v37;
  MessageListThreadHelper *threadHelper;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  EFCancelable *shouldAlertOnBlankCellToken;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id location;
  objc_super v52;

  v16 = a3;
  v48 = a4;
  v17 = a5;
  v18 = a6;
  v47 = a7;
  v46 = a8;
  v45 = a9;
  v52.receiver = self;
  v52.super_class = (Class)MessageListSectionDataSource;
  v19 = -[MessageListSectionDataSource init](&v52, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_objectID, a3);
    objc_storeStrong((id *)&v20->_section, a4);
    objc_storeWeak((id *)&v20->_collectionView, v17);
    objc_storeStrong((id *)&v20->_messageList, a6);
    objc_storeStrong((id *)&v20->_initialLoadCompletedPromise, a7);
    objc_storeStrong((id *)&v20->_layoutValuesHelper, a8);
    objc_storeStrong((id *)&v20->_state, a9);
    v21 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = objc_msgSend(v21, "initWithObject:", v22);
    failedItemIDs = v20->_failedItemIDs;
    v20->_failedItemIDs = (EFLocked *)v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    timedOutItemIDs = v20->_timedOutItemIDs;
    v20->_timedOutItemIDs = v25;

    *(_QWORD *)&v20->_timedOutItemIDsLock._os_unfair_lock_opaque = 0;
    v20->_isRefreshingLock._os_unfair_lock_opaque = 0;
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = os_log_create("com.apple.email", (const char *)objc_msgSend(v28, "UTF8String"));
    log = v20->_log;
    v20->_log = (OS_os_log *)v29;

    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v32, "UTF8String"));
    signpostLog = v20->_signpostLog;
    v20->_signpostLog = (OS_os_log *)v33;

    v35 = -[MessageListCollectionHelper initWithLog:updateQueueName:sectionObjectID:]([MessageListCollectionHelper alloc], "initWithLog:updateQueueName:sectionObjectID:", v20->_log, CFSTR("remove.me"), v16);
    collectionHelper = v20->_collectionHelper;
    v20->_collectionHelper = v35;

    if (objc_msgSend(v18, "isThreaded"))
    {
      v37 = -[MessageListThreadHelper initWithDelegate:]([MessageListThreadHelper alloc], "initWithDelegate:", v20);
      threadHelper = v20->_threadHelper;
      v20->_threadHelper = v37;

    }
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isInternal");

    if (v40)
    {
      v20->_shouldAlertOnBlankCell = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 24);
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v20);
      v41 = (void *)MEMORY[0x1E0D1E1A8];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __139__MessageListSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke;
      v49[3] = &unk_1E99E1AF8;
      objc_copyWeak(&v50, &location);
      objc_msgSend(v41, "observeChangesForPreference:usingBlock:", 24, v49);
      v42 = objc_claimAutoreleasedReturnValue();
      shouldAlertOnBlankCellToken = v20->_shouldAlertOnBlankCellToken;
      v20->_shouldAlertOnBlankCellToken = (EFCancelable *)v42;

      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
    }
  }

  return v20;
}

void __139__MessageListSectionDataSource_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[23] = a3;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MessageListSectionDataSource shouldAlertOnBlankCellToken](self, "shouldAlertOnBlankCellToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[MessageListSectionDataSource setShouldAlertOnBlankCellToken:](self, "setShouldAlertOnBlankCellToken:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MessageListSectionDataSource;
  -[MessageListSectionDataSource dealloc](&v4, sel_dealloc);
}

- (void)replaceMessageList:(id)a3 initialLoadCompletedPromise:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  MessageListThreadHelper *v13;
  int v14;
  MessageListSectionDataSource *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MessageListSectionDataSource messageList](self, "messageList");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 == v6)
  {
    if (v10)
    {
      v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "%p: Message list is the same - no need to replace", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    if (v10)
    {
      v14 = 134218498;
      v15 = self;
      v16 = 2114;
      v17 = v6;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "%p: replace message list: %{public}@, old: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    if (v8)
      objc_msgSend(v8, "stopObserving:", self);
    -[MessageListSectionDataSource failedItemIDs](self, "failedItemIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performWhileLocked:", &__block_literal_global_7);

    os_unfair_lock_lock(&self->_timedOutItemIDsLock);
    -[MessageListSectionDataSource timedOutItemIDs](self, "timedOutItemIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    -[MessageListSectionDataSource setHasReloadedForTimeOut:](self, "setHasReloadedForTimeOut:", 0);
    os_unfair_lock_unlock(&self->_timedOutItemIDsLock);
    -[MessageListSectionDataSource setMessageList:](self, "setMessageList:", v6);
    if (objc_msgSend(v6, "isThreaded"))
    {
      v13 = -[MessageListThreadHelper initWithDelegate:]([MessageListThreadHelper alloc], "initWithDelegate:", self);
      -[MessageListSectionDataSource setThreadHelper:](self, "setThreadHelper:", v13);

    }
    else
    {
      -[MessageListSectionDataSource setThreadHelper:](self, "setThreadHelper:", 0);
    }
    -[MessageListSectionDataSource setInitialLoadCompletedPromise:](self, "setInitialLoadCompletedPromise:", v7);
  }

}

uint64_t __79__MessageListSectionDataSource_replaceMessageList_initialLoadCompletedPromise___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)refresh
{
  os_unfair_lock_s *p_isRefreshingLock;
  void *v4;

  p_isRefreshingLock = &self->_isRefreshingLock;
  os_unfair_lock_lock(&self->_isRefreshingLock);
  if (!-[MessageListSectionDataSource isRefreshing](self, "isRefreshing"))
  {
    -[MessageListSectionDataSource setIsRefreshing:](self, "setIsRefreshing:", 1);
    -[MessageListSectionDataSource messageList](self, "messageList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refresh");

  }
  os_unfair_lock_unlock(p_isRefreshingLock);
}

- (void)beginObservingAnimated:(BOOL)a3 nextUpdateNeedsCleanSnapshot:(BOOL)a4
{
  id v5;

  if (a4)
  {
    os_unfair_lock_lock(&self->_nextUpdateNeedsCleanSnapshotLock);
    -[MessageListSectionDataSource setNextUpdateNeedsCleanSnapshot:](self, "setNextUpdateNeedsCleanSnapshot:", 1);
    os_unfair_lock_unlock(&self->_nextUpdateNeedsCleanSnapshotLock);
  }
  os_unfair_lock_lock(&self->_isRefreshingLock);
  -[MessageListSectionDataSource setIsRefreshing:](self, "setIsRefreshing:", 0);
  os_unfair_lock_unlock(&self->_isRefreshingLock);
  -[MessageListSectionDataSource messageList](self, "messageList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginObserving:", self);

}

- (void)stopObserving
{
  id v3;

  -[MessageListSectionDataSource messageList](self, "messageList");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopObserving:", self);

}

- (void)reconfigureItemsAtIndexPaths:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  MessageListSectionDataSource *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MessageListSectionDataSource log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Reconfigure items at index paths: %{public}@", buf, 0x16u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__MessageListSectionDataSource_reconfigureItemsAtIndexPaths___block_invoke;
  v10[3] = &unk_1E99E1600;
  v10[4] = self;
  v11 = v4;
  v6 = v10;
  v7 = (void *)MEMORY[0x1E0D1F070];
  v8 = v4;
  objc_msgSend(v7, "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v6);

}

void __61__MessageListSectionDataSource_reconfigureItemsAtIndexPaths___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __int128 v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  _BOOL4 v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;
  CGRect v64;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v2, "mui_indexPathsForPreparedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v42;
    *(_QWORD *)&v6 = 134218242;
    v33 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v2, "cellForItemAtIndexPath:", v10, v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 || !objc_msgSend(v39, "containsObject:", v10))
        {
          objc_msgSend(v11, "frame");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend(v2, "bounds");
          v64.origin.x = v23;
          v64.origin.y = v24;
          v64.size.width = v25;
          v64.size.height = v26;
          v63.origin.x = v16;
          v63.origin.y = v18;
          v63.size.width = v20;
          v63.size.height = v22;
          if (CGRectIntersectsRect(v63, v64))
          {
            if ((objc_msgSend(v11, "isHidden") & 1) != 0 || (objc_msgSend(v11, "isHiddenOrHasHiddenAncestor") & 1) != 0)
              goto LABEL_29;
            objc_msgSend(v11, "alpha");
            if (v27 < 0.0)
              v27 = -v27;
            if (v27 < 2.22044605e-16)
            {
LABEL_29:
              if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFF84780))
              {
                objc_msgSend(v11, "messageListItem");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v28 = 0;
              }
              objc_msgSend(*(id *)(a1 + 32), "log");
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
              {
                v38 = *(_QWORD *)(a1 + 32);
                v37 = objc_msgSend(v10, "section");
                v36 = objc_msgSend(v10, "item");
                objc_msgSend(v11, "_layoutAttributes");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v11, "isHidden");
                v34 = objc_msgSend(v11, "isHiddenOrHasHiddenAncestor");
                objc_msgSend(v11, "alpha");
                *(_DWORD *)buf = 134219778;
                v46 = v38;
                v47 = 2048;
                v48 = v37;
                v49 = 2048;
                v50 = v36;
                v51 = 1024;
                v52 = v28 != 0;
                v53 = 2114;
                v54 = v31;
                v55 = 1024;
                v56 = v35;
                v57 = 1024;
                v58 = v34;
                v59 = 2048;
                v60 = v32;
                _os_log_fault_impl(&dword_1D5522000, v29, OS_LOG_TYPE_FAULT, "%p: Cell is unexpectedly hidden:\n\tindexPath: (%ld, %ld)\n\thasItem: %{BOOL}d\n\tlayoutAttributes: %{public}@\n\tisHidden: %{BOOL}d\n\tisHiddenOrHasHiddenAncestor: %{BOOL}d\n\talpha: %f", buf, 0x46u);

              }
            }
          }
          v30 = *(void **)(a1 + 32);
          objc_msgSend(v30, "provider");
          v12 = objc_claimAutoreleasedReturnValue();
          -[NSObject messageListSectionDataSource:itemIdentifierForIndexPath:](v12, "messageListSectionDataSource:itemIdentifierForIndexPath:", *(_QWORD *)(a1 + 32), v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_configureCell:atIndexPath:itemID:", v11, v10, v14);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          v13 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v10, "ef_publicDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v33;
          v46 = v13;
          v47 = 2114;
          v48 = (uint64_t)v14;
          _os_log_error_impl(&dword_1D5522000, v12, OS_LOG_TYPE_ERROR, "%p: Unable to reconfigure cell at %{public}@ - cell is nil", buf, 0x16u);
        }

LABEL_24:
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
    }
    while (v7);
  }

}

- (void)deleteItemsWithIDs:(id)a3 animated:(BOOL)a4 useImmediateCompletion:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v11 = a3;
  -[MessageListSectionDataSource messageList](self, "messageList");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource _deleteItemsWithIDs:fromCollection:animated:useImmediateCompletion:completionHandler:](self, "_deleteItemsWithIDs:fromCollection:animated:useImmediateCompletion:completionHandler:", v11, v12, v7, v6, v10);

}

- (id)relatedItemIDsForSelectedItemID:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[MessageListSectionDataSource itemHelper](self, "itemHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIDBeforeItemID:snapshot:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_addOptionalObject:", v10);

  objc_msgSend(v9, "itemIDAfterItemID:snapshot:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_addOptionalObject:", v11);

  -[MessageListSectionDataSource messageList](self, "messageList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource threadHelper](self, "threadHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "expandedThreadItemIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v6);

    if (v15)
    {
      objc_msgSend(v13, "itemIDsInExpandedThread:snapshot:", v6, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v8, "addObject:", v17);
        objc_msgSend(v13, "itemIDAfterItemID:snapshot:", v17, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ef_addOptionalObject:", v18);

      }
      goto LABEL_8;
    }
    if (objc_msgSend(v12, "anyExpandedThreadContainsItemID:", v6))
    {
      objc_msgSend(v13, "threadItemIDForItemInExpandedThread:snapshot:", v6, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v8, "addObject:", v16);
      objc_msgSend(v13, "itemIDBeforeItemID:snapshot:", v16, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_addOptionalObject:", v17);
LABEL_8:

      goto LABEL_9;
    }
  }
LABEL_10:
  objc_msgSend(v8, "addObject:", v6);

  return v8;
}

- (void)applyFilterPredicate:(id)a3 userFiltered:(BOOL)a4 ignoreMessagesPredicate:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  -[MessageListSectionDataSource messageList](self, "messageList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unfilteredMessageList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v16)
  {
    objc_msgSend(v10, "filteredMessageListWithPredicate:ignoredMessagesPredicate:userFiltered:", v16, v8, v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }

  -[MessageListSectionDataSource messageList](self, "messageList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v13)
  {
    -[MessageListSectionDataSource delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "initialLoadCompletedPromiseForMessageListSectionDataSource:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MessageListSectionDataSource replaceMessageList:initialLoadCompletedPromise:](self, "replaceMessageList:initialLoadCompletedPromise:", v11, v15);
    -[MessageListSectionDataSource beginObservingAnimated:nextUpdateNeedsCleanSnapshot:](self, "beginObservingAnimated:nextUpdateNeedsCleanSnapshot:", 1, 1);

  }
}

- (void)didScheduleReadInteractionForItemID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MessageListSectionDataSource collectionHelper](self, "collectionHelper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didScheduleReadInteractionForItemID:", v4);

}

- (id)threadItemIDForItemInExpandedThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MessageListSectionDataSource threadHelper](self, "threadHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotForMessageListSectionDataSource:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadItemIDForItemInExpandedThread:snapshot:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)itemIDsInExpandedThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MessageListSectionDataSource threadHelper](self, "threadHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListSectionDataSource provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshotForMessageListSectionDataSource:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIDsInExpandedThread:snapshot:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[MessageListSectionDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListSectionDataSource configuredCollectionViewCellForCollectionView:indexPath:itemID:cellIdentifier:]", "MessageListSectionDataSource.m", 316, "0");
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MessageListSectionDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListSectionDataSource _configureCell:atIndexPath:itemID:]", "MessageListSectionDataSource.m", 320, "0");
}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 64));
    if (v3)
    {
      if (EFContentProtectionGetObservedState())
      {
        -[os_unfair_lock_s log](WeakRetained, "log");
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          EFContentProtectionStateDescription();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543874;
          v19 = v5;
          v20 = 2114;
          v21 = v6;
          v22 = 2114;
          v23[0] = v7;
          _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "Skip timeout for item (id=%{public}@) at indexPath=%{public}@ - device is not unlocked (%{public}@)", (uint8_t *)&v18, 0x20u);

        }
      }
      else
      {
        -[os_unfair_lock_s messageList](WeakRetained, "messageList");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v3 == v8)
        {
          -[os_unfair_lock_s signpostLog](WeakRetained, "signpostLog");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = *(_QWORD *)(a1 + 72);
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
          {
            v14 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 138544130;
            v19 = v14;
            v20 = 2114;
            v21 = v15;
            v22 = 1026;
            LODWORD(v23[0]) = 1;
            WORD2(v23[0]) = 1026;
            *(_DWORD *)((char *)v23 + 6) = 0;
            _os_signpost_emit_with_name_impl(&dword_1D5522000, v12, OS_SIGNPOST_INTERVAL_END, v13, "MessageListViewControllerItemFetch", "itemID=%{public}@, indexPath=%{public}@, TimedOut=%{public,signpost.telemetry:number1}u Error=%{public,signpost.telemetry:number2}u enableTelemetry=YES ", (uint8_t *)&v18, 0x22u);

          }
          -[os_unfair_lock_s log](WeakRetained, "log");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_cold_1((uint64_t)WeakRetained, a1, v16);

          objc_msgSend(MEMORY[0x1E0CB35C8], "em_itemTimeoutError");
          v4 = objc_claimAutoreleasedReturnValue();
          -[MessageListSectionDataSource _recordTailspinForBlankCellWithError:](WeakRetained, v4);
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          os_unfair_lock_lock(WeakRetained + 2);
          -[os_unfair_lock_s timedOutItemIDs](WeakRetained, "timedOutItemIDs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", *(_QWORD *)(a1 + 32));

          os_unfair_lock_unlock(WeakRetained + 2);
          -[os_unfair_lock_s _maybeReloadForTimedOutItemIDs](WeakRetained, "_maybeReloadForTimedOutItemIDs");
          if (HIBYTE(WeakRetained[5]._os_unfair_lock_opaque))
            -[MessageListSectionDataSource _showBlankCellAlertWithItemID:indexPath:reason:](WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), CFSTR("Message list item fetch timeout."));
        }
        else
        {
          -[os_unfair_lock_s log](WeakRetained, "log");
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v9 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 138543618;
            v19 = v9;
            v20 = 2114;
            v21 = v10;
            _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "Stale message list item (%{public}@) - skip timeout for message at index path: %{public}@", (uint8_t *)&v18, 0x16u);

          }
        }
      }

    }
  }

}

- (void)_recordTailspinForBlankCellWithError:(void *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "didRecordTailspin") & 1) != 0)
    {
      objc_msgSend(a1, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v10 = a1;
        _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Tailspin has already been generated in this session", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v4, "setDidRecordTailspin:", 1);
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Blank Cell - Error %ld"), objc_msgSend(v3, "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ef_underlyingError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v3, "ef_underlyingError");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR(" (%ld)"), objc_msgSend(v8, "code"));

      }
      EFSaveTailspin();

    }
  }

}

- (void)_showBlankCellAlertWithItemID:(void *)a3 indexPath:(void *)a4 reason:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(a1, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "didAlertOnBlankCell"))
    {
      objc_msgSend(a1, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134218498;
        v13 = a1;
        v14 = 2114;
        v15 = v7;
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1D5522000, v11, OS_LOG_TYPE_DEFAULT, "%p: Blank cell alert controller was already visible. Don't show for itemID: %{public}@, indexPath: %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }
    else
    {
      objc_msgSend(v10, "setDidAlertOnBlankCell:", 1);
      objc_msgSend(a1, "delegate");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject showBlankCellAlertForMessageListSectionDataSource:itemID:indexPath:reason:](v11, "showBlankCellAlertForMessageListSectionDataSource:itemID:indexPath:reason:", a1, v7, v8, v9);
    }

  }
}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "messageListItemFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "messageListItemFetchTimeoutCancelable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "setMessageListItemFetchTimeoutCancelable:", 0);
    objc_msgSend(*(id *)(a1 + 48), "signpostLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 80);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v13 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "ef_publicDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      v19 = 1026;
      v20 = 0;
      v21 = 1026;
      v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D5522000, v11, OS_SIGNPOST_INTERVAL_END, v12, "MessageListViewControllerItemFetch", "itemID=%{public}@, indexPath=%{public}@, TimedOut=%{public,signpost.telemetry:number1}u Error=%{public,signpost.telemetry:number2}u enableTelemetry=YES ", (uint8_t *)&v15, 0x22u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setMessageListItemFuture:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "Skip updating cell for message with itemID=%{public}@ at indexPath=%{public}@ - cell has already been configured", (uint8_t *)&v15, 0x16u);

    }
  }

}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  id v5;
  id v6;
  NSObject *v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  _BYTE *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  _BYTE *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  _BYTE v42[18];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 80));
    if (v5)
    {
      objc_msgSend(WeakRetained, "messageList");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        objc_msgSend(*(id *)(a1 + 48), "messageListItemFetchTimeoutCancelable");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cancel");

        if ((objc_msgSend(v3, "ef_isCancelledError") & 1) == 0 && (objc_msgSend(v3, "em_isItemNotFoundError") & 1) == 0)
        {
          objc_msgSend(WeakRetained, "signpostLog");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v12;
          v14 = *(_QWORD *)(a1 + 88);
          if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
          {
            v15 = *(_BYTE **)(a1 + 32);
            v16 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138413058;
            v38 = v15;
            v39 = 2112;
            v40 = v16;
            v41 = 1026;
            *(_DWORD *)v42 = 0;
            *(_WORD *)&v42[4] = 2050;
            *(_QWORD *)&v42[6] = objc_msgSend(v3, "code");
            _os_signpost_emit_with_name_impl(&dword_1D5522000, v13, OS_SIGNPOST_INTERVAL_END, v14, "MessageListViewControllerItemFetch", "itemID=%@, indexPath=%@, TimedOut=%{public,signpost.telemetry:number1}u Error=%{public,signpost.telemetry:number2}lu enableTelemetry=YES ", buf, 0x26u);
          }

          objc_msgSend(WeakRetained, "log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v31 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "ef_publicDescription");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v38 = WeakRetained;
            v39 = 2114;
            v40 = v31;
            v41 = 2114;
            *(_QWORD *)v42 = v32;
            *(_WORD *)&v42[8] = 2114;
            *(_QWORD *)&v42[10] = v33;
            _os_log_error_impl(&dword_1D5522000, v17, OS_LOG_TYPE_ERROR, "%p: [Blank cell] Message list item fetch failed (id:%{public}@, indexPath:%{public}@) with error: %{public}@", buf, 0x2Au);

          }
          -[MessageListSectionDataSource _recordTailspinForBlankCellWithError:](WeakRetained, v3);
          objc_msgSend(WeakRetained, "failedItemIDs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_73;
          v34[3] = &unk_1E99E1300;
          v35 = *(id *)(a1 + 32);
          objc_msgSend(v18, "performWhileLocked:", v34);

          if (WeakRetained[23])
          {
            v19 = *(void **)(a1 + 32);
            v20 = *(void **)(a1 + 40);
            v21 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v3, "ef_publicDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("Message list item fetch failed with error: %@."), v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MessageListSectionDataSource _showBlankCellAlertWithItemID:indexPath:reason:](WeakRetained, v19, v20, v23);

          }
        }
        objc_msgSend(*(id *)(a1 + 48), "messageListItemFuture");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 56);

        if (v24 == v25)
          objc_msgSend(*(id *)(a1 + 48), "setMessageListItemFuture:", 0);
        if (objc_msgSend(v3, "em_isItemNotFoundError"))
        {
          objc_msgSend(WeakRetained, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(_QWORD *)(a1 + 32);
            objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v38 = WeakRetained;
            v39 = 2114;
            v40 = v27;
            v41 = 2114;
            *(_QWORD *)v42 = v28;
            _os_log_impl(&dword_1D5522000, v26, OS_LOG_TYPE_DEFAULT, "%p: Deleting itemID:%{public}@ at indexPath:%{public}@ from the data source because we could not find the item", buf, 0x20u);

          }
          if (*(_QWORD *)(a1 + 32))
          {
            v36 = *(_QWORD *)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "messageList");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_deleteItemsWithIDs:fromCollection:animated:useImmediateCompletion:completionHandler:", v29, v30, 1, 0, 0);

          }
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
      else
      {
        objc_msgSend(WeakRetained, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_BYTE **)(a1 + 32);
          v9 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v3, "ef_publicDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v8;
          v39 = 2114;
          v40 = v9;
          v41 = 2114;
          *(_QWORD *)v42 = v10;
          _os_log_impl(&dword_1D5522000, v7, OS_LOG_TYPE_DEFAULT, "Stale message list item (%{public}@) - skip message list item at index path: %{public}@, failure: %{public}@", buf, 0x20u);

        }
      }
    }

  }
}

uint64_t __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_73(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_after_unreadItemIDs___block_invoke;
  v21[3] = &unk_1E99E1BB8;
  v21[4] = self;
  v22 = v12;
  v23 = v14;
  v24 = v13;
  v25 = v11;
  v15 = (void *)MEMORY[0x1E0D1F070];
  v16 = v12;
  v17 = v14;
  v18 = v13;
  v19 = v11;
  objc_msgSend(v15, "mainThreadScheduler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performBlock:", v21);

}

uint64_t __95__MessageListSectionDataSource_collection_addedItemIDs_toThreadWithItemID_after_unreadItemIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addedItemIDs:before:existingItemID:toThreadWithItemID:inCollection:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke;
  v17[3] = &unk_1E99E12D0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v11 = v17;
  v12 = (void *)MEMORY[0x1E0D1F070];
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performBlock:", v11);

}

void __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "messageList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];

  v4 = a1[4];
  if (v2 == v3)
  {
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_84;
    v15[3] = &unk_1E99E1BE0;
    v11 = a1[6];
    v12 = a1[4];
    v16 = v11;
    v17 = v12;
    v18 = a1[7];
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_2;
    v13[3] = &unk_1E99E1600;
    v13[4] = a1[4];
    v14 = a1[6];
    objc_msgSend(v4, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", 1, 0, 0, v15, v13);

    v5 = v16;
  }
  else
  {
    objc_msgSend(a1[4], "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      objc_msgSend(a1[5], "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[6];
      v9 = a1[7];
      *(_DWORD *)buf = 134218754;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore moved item ids: %{public}@, before: %{public}@", buf, 0x2Au);

    }
  }

}

id __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "collectionHelper", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 += objc_msgSend(v14, "moveItemID:before:snapshot:section:", v13, *(_QWORD *)(a1 + 48), v5, v6);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  +[MessageListSectionDataSourceChange withCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withCount:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __63__MessageListSectionDataSource_collection_movedItemIDs_before___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageListSectionDataSource:handleRowSelectionAfterMovingMessagesWithItemIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke;
  v17[3] = &unk_1E99E12D0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v11 = v17;
  v12 = (void *)MEMORY[0x1E0D1F070];
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performBlock:", v11);

}

void __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "messageList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];

  v4 = a1[4];
  if (v2 == v3)
  {
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_87;
    v15[3] = &unk_1E99E1BE0;
    v11 = a1[6];
    v12 = a1[4];
    v16 = v11;
    v17 = v12;
    v18 = a1[7];
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_2;
    v13[3] = &unk_1E99E1600;
    v13[4] = a1[4];
    v14 = a1[6];
    objc_msgSend(v4, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", 1, 0, 0, v15, v13);

    v5 = v16;
  }
  else
  {
    objc_msgSend(a1[4], "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      objc_msgSend(a1[5], "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[6];
      v9 = a1[7];
      *(_DWORD *)buf = 134218754;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v8;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore moved item ids: %{public}@, after: %{public}@", buf, 0x2Au);

    }
  }

}

id __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "collectionHelper", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 += objc_msgSend(v14, "moveItemID:after:snapshot:section:", v13, *(_QWORD *)(a1 + 48), v5, v6);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  +[MessageListSectionDataSourceChange withCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withCount:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __62__MessageListSectionDataSource_collection_movedItemIDs_after___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageListSectionDataSource:handleRowSelectionAfterMovingMessagesWithItemIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)collection:(id)a3 changedItemIDs:(id)a4 itemIDsWithCountChanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__MessageListSectionDataSource_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke;
  v17[3] = &unk_1E99E12D0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v11 = v17;
  v12 = (void *)MEMORY[0x1E0D1F070];
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performBlock:", v11);

}

void __82__MessageListSectionDataSource_collection_changedItemIDs_itemIDsWithCountChanges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    objc_msgSend(v4, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshotForMessageListSectionDataSource:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "collectionHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeItemIDs:snapshot:", *(_QWORD *)(a1 + 48), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v34 = v13;
      v35 = 2048;
      v36 = objc_msgSend(v7, "count");
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_1D5522000, v12, OS_LOG_TYPE_DEFAULT, "%p: Reloading itemIDs(%ld): %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "initialLoadCompletedPromise");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "future");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resultIfAvailable");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      v19 = v18 ^ 1;
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "selectionModelProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectionModelForMessageListSectionDataSource:", *(_QWORD *)(a1 + 32));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "isSelectAll") && (v19 & 1) == 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v22 = *(id *)(a1 + 56);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v29 != v25)
              objc_enumerationMutation(v22);
            v27 = (id)objc_msgSend(v21, "deselectItemWithItemID:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v24);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_reloadItemsWithItemIDs:", v7, (_QWORD)v28);

    goto LABEL_20;
  }
  objc_msgSend(v4, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218754;
    v34 = v6;
    v35 = 2114;
    v36 = (uint64_t)v7;
    v37 = 2114;
    v38 = v8;
    v39 = 2114;
    v40 = v9;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore changed item ids: %{public}@, item ids with count changes: %{public}@", buf, 0x2Au);
LABEL_20:

  }
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke;
  v17[3] = &unk_1E99E12D0;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v11 = v17;
  v12 = (void *)MEMORY[0x1E0D1F070];
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performBlock:", v11);

}

void __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke(id *a1)
{
  id v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  size_t v18;
  uint8_t buf[648];
  int v20[2];
  int v21;
  pid_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "messageList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];

  if (v2 == v3)
  {
    v9 = objc_msgSend(a1[6], "isEqual:", a1[7]);
    v10 = a1[4];
    if (v9)
    {
      objc_msgSend(a1[4], "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = a1[4];
        v13 = a1[6];
        v14 = a1[7];
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v14;
        _os_log_error_impl(&dword_1D5522000, v11, OS_LOG_TYPE_ERROR, "%p: Replaced existingItemID: %@ same as newItemID %@", buf, 0x20u);
      }

      memset(buf, 170, sizeof(buf));
      *(_DWORD *)&buf[32] = 0;
      *(_QWORD *)v20 = 0xE00000001;
      v21 = 1;
      v22 = getpid();
      v18 = 648;
      if (!sysctl(v20, 4u, buf, &v18, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0)
      {
        __debugbreak();
        JUMPOUT(0x1D553FCF0);
      }
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_88;
      v15[3] = &unk_1E99E1BE0;
      v15[4] = v10;
      v16 = a1[6];
      v17 = a1[7];
      objc_msgSend(v10, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", 0, 0, 0, v15, 0);

    }
  }
  else
  {
    objc_msgSend(a1[4], "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      objc_msgSend(a1[5], "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[6];
      v8 = a1[7];
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v7;
      *(_WORD *)&buf[32] = 2114;
      *(_QWORD *)&buf[34] = v8;
      _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore replaced item id: %{public}@, with new item id: %{public}@", buf, 0x2Au);

    }
  }
}

id __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_88_cold_1();

  if (objc_msgSend(v3, "indexOfItemIdentifier:", *(_QWORD *)(a1 + 40)) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v12[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v6, *(_QWORD *)(a1 + 40));

    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteItemsWithIdentifiers:", v7);

    objc_msgSend(*(id *)(a1 + 32), "collectionHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removePendingReadCancelablesForItemID:", *(_QWORD *)(a1 + 40));

    v5 = 2;
  }
  +[MessageListSectionDataSourceChange withCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withCount:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MessageListSectionDataSource_collection_deletedItemIDs___block_invoke;
  v13[3] = &unk_1E99E1C08;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v13;
  v9 = (void *)MEMORY[0x1E0D1F070];
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performBlock:", v8);

}

void __58__MessageListSectionDataSource_collection_deletedItemIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    objc_msgSend(v4, "_deleteItemsWithIDs:fromCollection:animated:useImmediateCompletion:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1, 0, 0);
  }
  else
  {
    objc_msgSend(v4, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 134218498;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore deleted item ids: %{public}@", (uint8_t *)&v9, 0x20u);

    }
  }
}

- (void)didFinishRecoveryForCollection:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke;
  v9[3] = &unk_1E99E1600;
  v9[4] = self;
  v10 = v4;
  v5 = v9;
  v6 = (void *)MEMORY[0x1E0D1F070];
  v7 = v4;
  objc_msgSend(v6, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performBlock:", v5);

}

void __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke(uint64_t a1)
{
  os_unfair_lock_s **v2;
  void *v3;
  void *v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  os_unfair_lock_s *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "messageList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  v5 = *v2;
  if (v3 == v4)
  {
    v9 = v5 + 4;
    os_unfair_lock_lock(v5 + 4);
    v10 = objc_msgSend(*(id *)(a1 + 32), "isRefreshing");
    objc_msgSend(*(id *)(a1 + 32), "setIsRefreshing:", 0);
    os_unfair_lock_unlock(v9);
    objc_msgSend(*(id *)(a1 + 32), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 1024;
      v23 = v10;
      _os_log_impl(&dword_1D5522000, v11, OS_LOG_TYPE_DEFAULT, "%p: Did finish recovery for collection: %@ from refresh: %{BOOL}d", buf, 0x1Cu);

    }
    v15 = *(void **)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "_recoverFailedItemIDsIfNeededForCollection:excluding:completion:", v14, 0, 0);
    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke_89;
      v16[3] = &unk_1E99E1C30;
      v16[4] = v15;
      v17 = v14;
      objc_msgSend(v15, "_reloadPreparedItemIDsForCollection:completion:", v17, v16);

    }
  }
  else
  {
    -[os_unfair_lock_s log](v5, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore did finish recover for collection", buf, 0x16u);

    }
  }
}

uint64_t __63__MessageListSectionDataSource_didFinishRecoveryForCollection___block_invoke_89(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverFailedItemIDsIfNeededForCollection:excluding:completion:", *(_QWORD *)(a1 + 40), a2, 0);
}

- (void)didFinishRemoteSearchForCollection:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__MessageListSectionDataSource_didFinishRemoteSearchForCollection___block_invoke;
  v9[3] = &unk_1E99E1600;
  v9[4] = self;
  v10 = v4;
  v5 = v9;
  v6 = (void *)MEMORY[0x1E0D1F070];
  v7 = v4;
  objc_msgSend(v6, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performBlock:", v5);

}

void __67__MessageListSectionDataSource_didFinishRemoteSearchForCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    objc_msgSend(v4, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "messageListSectionDataSource:collectionFinishedSearching:remote:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

  }
  else
  {
    objc_msgSend(v4, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore did finish remove search for collection", buf, 0x16u);

    }
  }
}

- (void)collection:(id)a3 didFinishInitialLoadForThreadWithItemID:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke;
  v13[3] = &unk_1E99E1C08;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v13;
  v9 = (void *)MEMORY[0x1E0D1F070];
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performBlock:", v8);

}

void __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "messageList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];

  v4 = a1[4];
  if (v2 == v3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_93;
    v10[3] = &unk_1E99E1600;
    v10[4] = v4;
    v9 = a1[5];
    v11 = a1[6];
    objc_msgSend(v4, "_recoverFailedItemIDsIfNeededForCollection:completion:", v9, v10);

  }
  else
  {
    objc_msgSend(a1[4], "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      objc_msgSend(a1[5], "ef_publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[6];
      *(_DWORD *)buf = 134218498;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - did finish initial load for thread with item id: %{public}@", buf, 0x20u);

    }
  }
}

void __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_93(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  uint64_t v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_2;
  v3[3] = &unk_1E99E1600;
  v1 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v1;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v3[0], 3221225472, __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_2, &unk_1E99E1600, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", v3);

}

void __83__MessageListSectionDataSource_collection_didFinishInitialLoadForThreadWithItemID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "%p: Finish initial load for thread: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "threadHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeExpandingThreadWithItemID:", *(_QWORD *)(a1 + 40));

}

void __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_94(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  uint64_t v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_2;
  v3[3] = &unk_1E99E1600;
  v1 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v1;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v3[0], 3221225472, __63__MessageListSectionDataSource_collectionDidFinishInitialLoad___block_invoke_2, &unk_1E99E1600, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", v3);

}

- (void)collection:(id)a3 oldestItemsUpdatedForMailboxes:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__MessageListSectionDataSource_collection_oldestItemsUpdatedForMailboxes___block_invoke;
  v13[3] = &unk_1E99E1C08;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v13;
  v9 = (void *)MEMORY[0x1E0D1F070];
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performBlock:", v8);

}

void __74__MessageListSectionDataSource_collection_oldestItemsUpdatedForMailboxes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      v8 = *(void **)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = v9;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "%p: Update oldest items for mailboxes: %{public}@, collection: %{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject messageListSectionDataSource:updatedOldestItemsForMailboxes:](v4, "messageListSectionDataSource:updatedOldestItemsForMailboxes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "%p: Collection (%{public}@) is stale - ignore updated oldest items", (uint8_t *)&v11, 0x16u);

  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MessageListSectionDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListSectionDataSource collection:addedItemIDs:after:]", "MessageListSectionDataSource.m", 668, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MessageListSectionDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListSectionDataSource collection:addedItemIDs:before:]", "MessageListSectionDataSource.m", 672, "0");
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[MessageListSectionDataSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListSectionDataSource collection:changedItemIDs:]", "MessageListSectionDataSource.m", 676, "0");
}

- (NSSet)expandedThreadItemIDs
{
  void *v2;
  void *v3;

  -[MessageListSectionDataSource messageList](self, "messageList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandedThreadItemIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)messageListThreadHelper:(id)a3 didCollapseMessageListItem:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MessageListSectionDataSource messageList](self, "messageList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collapseThread:", v6);

  }
}

- (void)messageListThreadHelper:(id)a3 didExpandMessageListItem:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MessageListSectionDataSource messageList](self, "messageList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandThread:", v6);

  }
}

- (void)_maybeReloadForTimedOutItemIDs
{
  os_unfair_lock_s *p_timedOutItemIDsLock;
  void *v4;
  char v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  NSObject *v13;
  uint8_t buf[4];
  MessageListSectionDataSource *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_timedOutItemIDsLock = &self->_timedOutItemIDsLock;
  os_unfair_lock_lock(&self->_timedOutItemIDsLock);
  -[MessageListSectionDataSource provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldReloadMessageListSectionDataSource:", self);

  if ((v5 & 1) == 0)
  {
    -[MessageListSectionDataSource log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = self;
      _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "%p: Skip reload for timed out item ids", buf, 0xCu);
    }
    goto LABEL_10;
  }
  -[MessageListSectionDataSource timedOutItemIDs](self, "timedOutItemIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 0xB)
  {
    EFSaveTailspin();
    if (!-[MessageListSectionDataSource hasReloadedForTimeOut](self, "hasReloadedForTimeOut"))
    {
      -[MessageListSectionDataSource log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[MessageListSectionDataSource timedOutItemIDs](self, "timedOutItemIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v15 = self;
        v16 = 2048;
        v17 = objc_msgSend(v9, "count");
        _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "%p: Triggering a reload for %lu timed out itemIDs", buf, 0x16u);

      }
      -[MessageListSectionDataSource setHasReloadedForTimeOut:](self, "setHasReloadedForTimeOut:", 1);
      -[MessageListSectionDataSource timedOutItemIDs](self, "timedOutItemIDs");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListSectionDataSource setTimedOutItemIDs:](self, "setTimedOutItemIDs:", v11);

      if (-[NSObject count](v10, "count"))
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke;
        v12[3] = &unk_1E99E1C58;
        v12[4] = self;
        v10 = v10;
        v13 = v10;
        -[MessageListSectionDataSource _performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:](self, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", 0, 0, 0, v12, 0);

      }
LABEL_10:

    }
  }
  os_unfair_lock_unlock(p_timedOutItemIDsLock);
}

id __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mui_validItemIDsFromExistingItemIDs:updateReason:", v6, CFSTR("Reload timedOutitemIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *v4;
    *(_DWORD *)buf = 134218242;
    v20 = v9;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "%p: Reloading itemIDs: %@", buf, 0x16u);
  }

  v10 = objc_msgSend(v7, "count");
  v11 = objc_msgSend(v7, "count");
  if (v11 == objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(v3, "reloadItemsWithIdentifiers:", v7);
  }
  else
  {
    objc_msgSend(*v4, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 32);
      v17 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_1D5522000, v12, OS_LOG_TYPE_ERROR, "%p: timedOutItemIDs: %@ has diverged from itemIDs: %@, reload data source", buf, 0x20u);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_105;
    v18[3] = &unk_1E99E1258;
    v18[4] = *v4;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performBlock:", v18);

  }
  +[MessageListSectionDataSourceChange withInitialCount:validCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withInitialCount:validCount:", objc_msgSend(*(id *)(a1 + 40), "count"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_105(uint64_t a1)
{
  -[MessageListSectionDataSource _reloadDataSource](*(void **)(a1 + 32));
}

- (void)_reloadDataSource
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a1, "stopObserving");
    objc_msgSend(a1, "messageList");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_alloc(MEMORY[0x1E0D1E238]);
    objc_msgSend(v8, "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "repository");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "initWithQuery:repository:", v3, v4);

    objc_msgSend(a1, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "initialLoadCompletedPromiseForMessageListSectionDataSource:", a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "replaceMessageList:initialLoadCompletedPromise:", v5, v7);

    objc_msgSend(a1, "beginObservingAnimated:nextUpdateNeedsCleanSnapshot:", 1, 1);
  }
}

id __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "numberOfItemsInSection:", v6);
  v8 = *(unsigned __int8 *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "collectionHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v12 = *(_QWORD *)(a1 + 40);
  if (v8)
    v13 = objc_msgSend(v9, "addItemIDs:before:snapshot:section:validateOtherSections:", v11, v12, v5, v6, 1);
  else
    v13 = objc_msgSend(v9, "addItemIDs:after:snapshot:section:validateOtherSections:", v11, v12, v5, v6, 1);
  v14 = v13;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 32), "_updateSelectionStateForItemsWithIDs:inThreadWithItemID:snapshot:shouldDeselectMessages:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48), v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
  if (v7)
    v16 = 1;
  else
    v16 = v14 <= 0;
  v17 = !v16;
  +[MessageListSectionDataSourceChange withInitialCount:validCount:isFirstChange:](_TtC6MailUI34MessageListSectionDataSourceChange, "withInitialCount:validCount:isFirstChange:", v15, v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_2_118(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("kMessageListItemsFirstBatchRetrieved"), *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageListSectionDataSource:didAddMessagesWithItemIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(v3, "messageListSectionDataSource:addMessagesToStackWithItemIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  objc_msgSend(*(id *)(a1 + 40), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D5522000, v5, OS_SIGNPOST_INTERVAL_END, v6, "MessageListViewControllerAddedItemsBatch", ", v7, 2u);
  }

}

- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 animated:(BOOL)a5 useImmediateCompletion:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[6];
  _QWORD v24[5];
  id v25;

  v8 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__0;
  v24[4] = __Block_byref_object_dispose__0;
  v25 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke;
  v23[3] = &unk_1E99E1D48;
  v23[4] = self;
  v23[5] = v24;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2;
  v21[3] = &unk_1E99E1C58;
  v21[4] = self;
  v22 = v11;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_122;
  v17[3] = &unk_1E99E1D70;
  v15 = v13;
  v19 = v15;
  v17[4] = self;
  v16 = v22;
  v18 = v16;
  v20 = v24;
  -[MessageListSectionDataSource _performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:](self, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", v8, 0, v23, v21, v17);

  _Block_object_dispose(v24, 8);
}

void __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "threadHelper");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = *(_QWORD *)(a1 + 40);
    v16 = 134218498;
    v17 = v9;
    v18 = 2048;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "%p: deletedItemIDs(%ld): %@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v5, "mui_validItemIDsFromExistingItemIDs:section:updateReason:", *(_QWORD *)(a1 + 40), v7, CFSTR("Deleting itemIDs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v13)
    objc_msgSend(v5, "deleteItemsWithIdentifiers:", v12);
  +[MessageListSectionDataSourceChange withInitialCount:validCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withInitialCount:validCount:", objc_msgSend(*(id *)(a1 + 40), "count"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_122(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotForMessageListSectionDataSource:", *(_QWORD *)(a1 + 32));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "mui_validItemIDsFromExistingItemIDs:updateReason:", *(_QWORD *)(a1 + 40), CFSTR("Reloading itemIDs after Delete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "itemIDsForReloadAfterDeletingItemIDs:snapshot:", v4, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_reloadItemsWithItemIDs:", v5);
  objc_msgSend(*(id *)(a1 + 32), "failedItemIDs", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2_125;
  v12[3] = &unk_1E99E1300;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v6, "performWhileLocked:", v12);

  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(v7);
  objc_msgSend(*(id *)(a1 + 32), "timedOutItemIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_removeObjectsInArray:", *(_QWORD *)(a1 + 40));

  os_unfair_lock_unlock(v7);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageListSectionDataSource:deletedMessagesWithItemIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __117__MessageListSectionDataSource__deleteItemsWithIDs_fromCollection_animated_useImmediateCompletion_completionHandler___block_invoke_2_125(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_removeObjectsInArray:", *(_QWORD *)(a1 + 32));
}

- (void)_reloadPreparedItemIDsForCollection:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  MessageListSectionDataSource *v9;
  id v10;

  v5 = a4;
  -[MessageListSectionDataSource _preparedMessageListItemIDs](self, "_preparedMessageListItemIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__MessageListSectionDataSource__reloadPreparedItemIDsForCollection_completion___block_invoke;
    v7[3] = &unk_1E99E1D98;
    v8 = v6;
    v9 = self;
    v10 = v5;
    -[MessageListSectionDataSource _performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:](self, "_performDataSourceUpdateAnimated:cleanSnapshot:prepare:update:completion:", 0, 0, 0, v7, 0);

  }
  else
  {
    (*((void (**)(id, void *))v5 + 2))(v5, v6);
  }

}

id __79__MessageListSectionDataSource__reloadPreparedItemIDsForCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "mui_validItemIDsFromExistingItemIDs:updateReason:", v3, CFSTR("Reloading visible itemIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 40), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 == v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v23 = 134218498;
      v24 = v10;
      v25 = 2048;
      v26 = objc_msgSend(v5, "count");
      v27 = 2112;
      v28 = (uint64_t)v5;
      v11 = "%p: Reloading prepared itemIDs (%ld): %@";
      v12 = v8;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1D5522000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v23, v13);
    }
  }
  else if (v9)
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = objc_msgSend(v5, "count");
    v16 = objc_msgSend(*(id *)(a1 + 32), "count");
    v23 = 134218754;
    v24 = v14;
    v25 = 2048;
    v26 = v15;
    v27 = 2048;
    v28 = v16;
    v29 = 2112;
    v30 = v5;
    v11 = "%p: Reloading prepared itemIDs (%ld valid out of %ld total): %@";
    v12 = v8;
    v13 = 42;
    goto LABEL_6;
  }

  objc_msgSend(v4, "reloadItemsWithIdentifiers:", v5);
  (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v17, v18, v19, v20);
  +[MessageListSectionDataSourceChange withInitialCount:validCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withInitialCount:validCount:", objc_msgSend(*(id *)(a1 + 32), "count"), objc_msgSend(v5, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

BOOL __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageListSectionDataSource:indexPathForItemIdentifier:", *(_QWORD *)(a1 + 32), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

uint64_t __105__MessageListSectionDataSource__performDataSourceUpdateAnimated_cleanSnapshot_prepare_update_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "_reloadItemsWithItemIDs:", *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_preparedMessageListItemIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MessageListSectionDataSource collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mui_indexPathsForPreparedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListSectionDataSource provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotForMessageListSectionDataSource:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mui_validItemIDsFromIndexPaths:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_reloadItemsWithItemIDs:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke;
  v9[3] = &unk_1E99E1600;
  v9[4] = self;
  v10 = v4;
  v5 = v9;
  v6 = (void *)MEMORY[0x1E0D1F070];
  v7 = v4;
  objc_msgSend(v6, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performBlock:", v5);

}

void __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageListSectionDataSource:indexPathsForItemIdentifiers:", *v2, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  v6 = (void *)*v2;
  if (v5)
  {
    objc_msgSend(v6, "reconfigureItemsAtIndexPaths:", v4);
  }
  else
  {
    objc_msgSend(v6, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke_cold_1();

  }
}

id __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_129_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mui_validItemIDsFromExistingItemIDs:updateReason:", v6, CFSTR("Recovery itemIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *v4;
    *(_DWORD *)buf = 134218498;
    v22 = v9;
    v23 = 2048;
    v24 = objc_msgSend(v7, "count");
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "%p: Reloading itemIDs(%ld): %@", buf, 0x20u);
  }

  v10 = objc_msgSend(v7, "count");
  v11 = objc_msgSend(v7, "count");
  if (v11 == objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    objc_msgSend(v3, "reloadItemsWithIdentifiers:", v7);
  }
  else
  {
    objc_msgSend(*v4, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 32);
      v17 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v19 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134219010;
      v22 = v16;
      v23 = 2048;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      v27 = 2048;
      v28 = v19;
      v29 = 2112;
      v30 = v7;
      _os_log_error_impl(&dword_1D5522000, v12, OS_LOG_TYPE_ERROR, "%p: failedItemIDs(%ld): %@ has diverged from itemIDs(%ld): %@, reload data source", buf, 0x34u);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_132;
    v20[3] = &unk_1E99E1258;
    v20[4] = *v4;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performBlock:", v20);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  +[MessageListSectionDataSourceChange withInitialCount:validCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withInitialCount:validCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"), v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_132(uint64_t a1)
{
  -[MessageListSectionDataSource _reloadDataSource](*(void **)(a1 + 32));
}

- (void)didSelectDisclosureButtonForMessageListItem:(id)a3 disclosureEnabled:(BOOL)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  MessageListSectionDataSource *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MessageListSectionDataSource messageList](self, "messageList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expandedThreadItemIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v7);

    if (v10 == v4)
    {
      -[MessageListSectionDataSource provider](self, "provider");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject messageListSectionDataSource:indexPathForItemIdentifier:](v11, "messageListSectionDataSource:indexPathForItemIdentifier:", self, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      -[MessageListSectionDataSource collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)v12;
      objc_msgSend(v13, "cellForItemAtIndexPath:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EFF44B58))
        objc_msgSend(v14, "setDisclosureEnabled:animated:", v4 ^ 1u, 1);
      -[MessageListSectionDataSource threadHelper](self, "threadHelper", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "itemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject snapshotForMessageListSectionDataSource:](v11, "snapshotForMessageListSectionDataSource:", self);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "itemIDBeforeItemID:snapshot:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend(v16, "addObject:", v19);
      objc_msgSend(v15, "addItemIDsNeedingReloadPostUpdate:", v16);
      -[MessageListSectionDataSource log](self, "log");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v21)
        {
          objc_msgSend(v6, "itemID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v31 = self;
          v32 = 2112;
          v33 = v22;
          _os_log_impl(&dword_1D5522000, v20, OS_LOG_TYPE_DEFAULT, "%p: Collapse thread: %@", buf, 0x16u);

        }
        -[MessageListSectionDataSource selectionModelProvider](self, "selectionModelProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "selectionModelForMessageListSectionDataSource:", self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "itemID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "willCollapseThreadItemID:", v25);

        objc_msgSend(v15, "collapseMessageListItem:", v6);
      }
      else
      {
        if (v21)
        {
          objc_msgSend(v6, "itemID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v31 = self;
          v32 = 2112;
          v33 = v26;
          _os_log_impl(&dword_1D5522000, v20, OS_LOG_TYPE_DEFAULT, "%p: Expand thread: %@", buf, 0x16u);

        }
        objc_msgSend(v6, "itemID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addExpandingThreadWithItemID:", v27);

        objc_msgSend(v15, "expandMessageListItem:", v6);
      }

    }
    else
    {
      -[MessageListSectionDataSource log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v31 = self;
        _os_log_impl(&dword_1D5522000, v11, OS_LOG_TYPE_DEFAULT, "%p: Skipping attempting to expand or collapse thread that is already expanded or collapsed", buf, 0xCu);
      }
    }
  }
  else
  {
    -[MessageListSectionDataSource log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MessageListSectionDataSource didSelectDisclosureButtonForMessageListItem:disclosureEnabled:].cold.1((uint64_t)self, v11);
  }

}

- (BOOL)_isSectionHeaderAllowed
{
  return 0;
}

- (BOOL)shouldShowSupplementaryViewOfKindIfEmpty:(id)a3 isIndexing:(BOOL)a4
{
  return 0;
}

- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0DC48A8])
    && -[MessageListSectionDataSource _isSectionHeaderAllowed](self, "_isSectionHeaderAllowed"))
  {
    -[MessageListSectionDataSource headerRegistration](self, "headerRegistration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  MessageListSectionDataSource *v4;
  MessageListSectionDataSource *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (MessageListSectionDataSource *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MessageListSectionDataSource section](self, "section");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListSectionDataSource section](v5, "section");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MessageListSectionDataSource section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)setMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_messageList, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSelectionModelProvider:(id)a3
{
  objc_storeWeak((id *)&self->_selectionModelProvider, a3);
}

- (void)setInitialLoadCompletedPromise:(id)a3
{
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, a3);
}

- (void)setFailedItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_failedItemIDs, a3);
}

- (NSMutableSet)timedOutItemIDs
{
  return self->_timedOutItemIDs;
}

- (void)setTimedOutItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_timedOutItemIDs, a3);
}

- (BOOL)hasReloadedForTimeOut
{
  return self->_hasReloadedForTimeOut;
}

- (void)setHasReloadedForTimeOut:(BOOL)a3
{
  self->_hasReloadedForTimeOut = a3;
}

- (void)setNextUpdateNeedsCleanSnapshot:(BOOL)a3
{
  self->_nextUpdateNeedsCleanSnapshot = a3;
}

- (BOOL)isRefreshing
{
  return self->_isRefreshing;
}

- (EFCancelable)shouldAlertOnBlankCellToken
{
  return self->_shouldAlertOnBlankCellToken;
}

- (void)setShouldAlertOnBlankCellToken:(id)a3
{
  objc_storeStrong((id *)&self->_shouldAlertOnBlankCellToken, a3);
}

- (UICollectionViewSupplementaryRegistration)headerRegistration
{
  return self->_headerRegistration;
}

- (void)setHeaderRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_headerRegistration, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void)setLayoutValuesHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutValuesHelper, a3);
}

- (void)setThreadHelper:(id)a3
{
  objc_storeStrong((id *)&self->_threadHelper, a3);
}

- (void)setItemHelper:(id)a3
{
  objc_storeStrong((id *)&self->_itemHelper, a3);
}

- (void)setCollectionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_collectionHelper, a3);
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void)setSignpostLog:(id)a3
{
  objc_storeStrong((id *)&self->_signpostLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_collectionHelper, 0);
  objc_storeStrong((id *)&self->_itemHelper, 0);
  objc_storeStrong((id *)&self->_threadHelper, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_headerRegistration, 0);
  objc_storeStrong((id *)&self->_shouldAlertOnBlankCellToken, 0);
  objc_storeStrong((id *)&self->_timedOutItemIDs, 0);
  objc_storeStrong((id *)&self->_failedItemIDs, 0);
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, 0);
  objc_destroyWeak((id *)&self->_selectionModelProvider);
  objc_destroyWeak((id *)&self->_provider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

void __87__MessageListSectionDataSource_messageListItemForItemID_indexPath_receiver_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a2 + 32);
  objc_msgSend(*(id *)(a2 + 40), "ef_publicDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218754;
  v8 = a1;
  v9 = 2048;
  v10 = 0x4000000000000000;
  v11 = 2114;
  v12 = v5;
  v13 = 2114;
  v14 = v6;
  _os_log_error_impl(&dword_1D5522000, a3, OS_LOG_TYPE_ERROR, "%p: [Blank cell] Message list item fetch timeout after %.2fs (itemID: %{public}@, indexPath: %{public}@)", (uint8_t *)&v7, 0x2Au);

}

void __80__MessageListSectionDataSource_collection_replacedExistingItemID_withNewItemID___block_invoke_88_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_2();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEBUG, "%p: replacedExistingItemID: %@ with %@", v3, 0x20u);
}

void __62__MessageListSectionDataSource__maybeReloadForTimedOutItemIDs__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1D5522000, v0, v1, "%p: Reload for timedOutItemIDs: %@");
  OUTLINED_FUNCTION_4();
}

void __100__MessageListSectionDataSource__addedItemIDs_before_existingItemID_toThreadWithItemID_inCollection___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_1D5522000, v0, OS_LOG_TYPE_FAULT, "%p: Adding objectIDs but duplicate found %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __56__MessageListSectionDataSource__reloadItemsWithItemIDs___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_1D5522000, v0, OS_LOG_TYPE_ERROR, "%p: No indexPaths found to reload itemIDs: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __96__MessageListSectionDataSource__recoverFailedItemIDsIfNeededForCollection_excluding_completion___block_invoke_129_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1D5522000, v0, v1, "%p: Recovery for failedItemIDs: %@");
  OUTLINED_FUNCTION_4();
}

- (void)didSelectDisclosureButtonForMessageListItem:(uint64_t)a1 disclosureEnabled:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D5522000, a2, OS_LOG_TYPE_ERROR, "%p: Message list item id is nil, ignore disclosure button tap", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
