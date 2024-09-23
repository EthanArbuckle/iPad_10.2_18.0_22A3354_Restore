@implementation WFReminderContentItemChangeTransaction

- (WFReminderContentItemChangeTransaction)initWithContentItem:(id)a3
{
  id v4;
  WFReminderContentItemChangeTransaction *v5;
  uint64_t v6;
  REMStore *store;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  REMSaveRequest *saveRequest;
  REMSaveRequest *v12;
  void *v13;
  uint64_t v14;
  REMReminderChangeItem *mutableReminder;
  WFReminderContentItemChangeTransaction *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFReminderContentItemChangeTransaction;
  v5 = -[WFContentItemChangeTransaction initWithContentItem:](&v18, sel_initWithContentItem_, v4);
  if (v5)
  {
    WFGetWorkflowReminderStore();
    v6 = objc_claimAutoreleasedReturnValue();
    store = v5->_store;
    v5->_store = (REMStore *)v6;

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v8 = (void *)getREMSaveRequestClass_softClass;
    v23 = getREMSaveRequestClass_softClass;
    if (!getREMSaveRequestClass_softClass)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __getREMSaveRequestClass_block_invoke;
      v19[3] = &unk_24C4E3118;
      v19[4] = &v20;
      __getREMSaveRequestClass_block_invoke((uint64_t)v19);
      v8 = (void *)v21[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v20, 8);
    v10 = objc_msgSend([v9 alloc], "initWithStore:", v5->_store);
    saveRequest = v5->_saveRequest;
    v5->_saveRequest = (REMSaveRequest *)v10;

    v12 = v5->_saveRequest;
    objc_msgSend(v4, "reminder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSaveRequest updateReminder:](v12, "updateReminder:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    mutableReminder = v5->_mutableReminder;
    v5->_mutableReminder = (REMReminderChangeItem *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)updateList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromList");

  -[WFReminderContentItemChangeTransaction saveRequest](self, "saveRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateList:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addReminderChangeItem:", v7);

}

- (void)updateSubtasks:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Append"));

  if (v5)
    goto LABEL_5;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Remove"));

  if (!v7)
  {
    -[WFContentItemChangeTransaction mode](self, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("RemoveAll"));

    -[WFReminderContentItemChangeTransaction removeAllSubtasks](self, "removeAllSubtasks");
    if ((v9 & 1) != 0)
      goto LABEL_6;
LABEL_5:
    -[WFReminderContentItemChangeTransaction addSubtasks:](self, "addSubtasks:", v10);
    goto LABEL_6;
  }
  -[WFReminderContentItemChangeTransaction removeSubtasks:](self, "removeSubtasks:", v10);
LABEL_6:

}

- (void)addSubtasks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[WFReminderContentItemChangeTransaction saveRequest](self, "saveRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateReminder:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "listChangeItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addReminderChangeItem:", v11);

        -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setParentReminderID:", v15);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)removeSubtasks:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[WFReminderContentItemChangeTransaction saveRequest](self, "saveRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateReminder:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setParentReminderID:", 0);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)removeAllSubtasks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[WFReminderContentItemChangeTransaction store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRemindersWithParentReminderIDs:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFReminderContentItemChangeTransaction removeSubtasks:](self, "removeSubtasks:", v7);
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  -[WFReminderContentItemChangeTransaction saveRequest](self, "saveRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__WFReminderContentItemChangeTransaction_saveWithCompletionHandler_isNew___block_invoke;
  v9[3] = &unk_24C4DEC10;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "saveWithQueue:completion:", v7, v9);

}

- (void)updateImageFiles:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Append"));

  if ((v5 & 1) != 0
    || (-[WFContentItemChangeTransaction mode](self, "mode"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RemoveAll")),
        v6,
        -[WFReminderContentItemChangeTransaction removeAllImageAttachments](self, "removeAllImageAttachments"),
        (v7 & 1) == 0))
  {
    -[WFReminderContentItemChangeTransaction addImageFiles:](self, "addImageFiles:", v8);
  }

}

- (void)addImageFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addImageFiles:toAttachmentContext:", v4, v6);

}

- (void)removeAllImageAttachments
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "imageAttachments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeAttachment:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateTags:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Append"));

  if (v6)
    goto LABEL_14;
  -[WFContentItemChangeTransaction mode](self, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Remove"));

  if (!v8)
  {
    -[WFContentItemChangeTransaction mode](self, "mode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("RemoveAll"));

    -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hashtagContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeAllHashtags");

    if ((v22 & 1) != 0)
      goto LABEL_15;
LABEL_14:
    -[WFReminderContentItemChangeTransaction addTags:](self, "addTags:", v4);
    goto LABEL_15;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hashtagContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hashtags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v4, "containsObject:", v17);

        if (v18)
        {
          -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hashtagContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeHashtag:", v16);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

LABEL_15:
}

- (void)addTags:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[WFReminderContentItemChangeTransaction mutableReminder](self, "mutableReminder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hashtagContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v11, "addHashtagWithType:name:", 0, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (REMReminderChangeItem)mutableReminder
{
  return self->_mutableReminder;
}

- (REMStore)store
{
  return self->_store;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (void)setSaveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_saveRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRequest, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_mutableReminder, 0);
}

void __74__WFReminderContentItemChangeTransaction_saveWithCompletionHandler_isNew___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mutableReminder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v5, "fetchReminderWithObjectID:error:", v7, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v11;

    v9 = *(_QWORD *)(a1 + 40);
    +[WFContentItem itemWithObject:](WFContentItem, "itemWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
}

+ (void)addImageFiles:(id)a3 toAttachmentContext:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__WFReminderContentItemChangeTransaction_addImageFiles_toAttachmentContext___block_invoke;
  v7[3] = &unk_24C4DEC38;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __76__WFReminderContentItemChangeTransaction_addImageFiles_toAttachmentContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WFImageSizeFromFile(v3, 0);
  v7 = v6;

  v8 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v8, "addImageAttachmentWithURL:width:height:error:", v4, (unint64_t)v5, (unint64_t)v7, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (!v9)
  {
    getWFActionsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[WFReminderContentItemChangeTransaction addImageFiles:toAttachmentContext:]_block_invoke";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_ERROR, "%s Adding image attachment failed with error %@", buf, 0x16u);
    }

  }
}

@end
