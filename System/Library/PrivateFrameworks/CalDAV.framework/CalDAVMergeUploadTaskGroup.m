@implementation CalDAVMergeUploadTaskGroup

- (CalDAVMergeUploadTaskGroup)initWithCalendar:(id)a3 principal:(id)a4 accountInfoProvider:(id)a5 taskManager:(id)a6
{
  id v11;
  id v12;
  CalDAVMergeUploadTaskGroup *v13;
  CalDAVMergeUploadTaskGroup *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CalDAVMergeUploadTaskGroup;
  v13 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v16, sel_initWithAccountInfoProvider_taskManager_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_calendar, a3);
    objc_storeStrong((id *)&v14->_principal, a4);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[CoreDAVTaskGroup cancelTaskGroup](self->_uploadTaskGroup, "cancelTaskGroup");
  v3.receiver = self;
  v3.super_class = (Class)CalDAVMergeUploadTaskGroup;
  -[CoreDAVTaskGroup dealloc](&v3, sel_dealloc);
}

- (id)dataContentType
{
  return CFSTR("text/calendar; charset=utf-8");
}

- (void)_performBulkUpload
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  CalDAVBulkUploadTaskGroup *v19;
  void *v20;
  void *v21;
  void *v22;
  CalDAVPrincipal *principal;
  void *v24;
  CalDAVBulkUploadTaskGroup *v25;
  CalDAVBulkUploadTaskGroup *uploadTaskGroup;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v3, "logHandleForAccountInfoProvider:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[CalDAVCalendar uuidsToAddActions](self->_calendar, "uuidsToAddActions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      -[CalDAVCalendar hrefsToModDeleteActions](self->_calendar, "hrefsToModDeleteActions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v35 = v8;
      v36 = 2048;
      v37 = v10;
      v38 = 2112;
      v39 = v11;
      _os_log_impl(&dword_2096EB000, v6, OS_LOG_TYPE_INFO, "Performing a bulk upload of %lu/%lu items to the server at %@", buf, 0x20u);

    }
  }

  -[CalDAVCalendar bulkRequests](self->_calendar, "bulkRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BE1AEA8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BE1AEB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BE1AEB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  -[CalDAVCalendar ctag](self->_calendar, "ctag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldTrySyncTokenForBulkUpload)
  {
    -[CalDAVCalendar syncToken](self->_calendar, "syncToken");
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  v19 = [CalDAVBulkUploadTaskGroup alloc];
  -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendar uuidsToAddActions](self->_calendar, "uuidsToAddActions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendar hrefsToModDeleteActions](self->_calendar, "hrefsToModDeleteActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  principal = self->_principal;
  -[CoreDAVTaskGroup taskManager](self, "taskManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CalDAVBulkUploadTaskGroup initWithFolderURL:checkCTag:uuidsToAddActions:hrefsToModDeleteActions:context:accountInfoProvider:taskManager:](v19, "initWithFolderURL:checkCTag:uuidsToAddActions:hrefsToModDeleteActions:context:accountInfoProvider:taskManager:", v20, v17, v21, v22, 0, principal, v24);
  uploadTaskGroup = self->_uploadTaskGroup;
  self->_uploadTaskGroup = v25;

  if (v14)
  {
    if (v14 >= 25)
      v27 = 25;
    else
      v27 = v14;
    -[CoreDAVBulkUploadTaskGroup setMultiPutBatchMaxNumResources:](self->_uploadTaskGroup, "setMultiPutBatchMaxNumResources:", v27);
  }
  if (v16)
    -[CoreDAVBulkUploadTaskGroup setMultiPutBatchMaxSize:](self->_uploadTaskGroup, "setMultiPutBatchMaxSize:", v16);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, self->_uploadTaskGroup);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke;
  v30[3] = &unk_24C1FB248;
  objc_copyWeak(&v31, &location);
  objc_copyWeak(&v32, (id *)buf);
  -[CalDAVMergeUploadTaskGroup uploadTaskGroup](self, "uploadTaskGroup");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCompletionBlock:", v30);

  -[CoreDAVBulkUploadTaskGroup startTaskGroup](self->_uploadTaskGroup, "startTaskGroup");
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  char v40;
  id v41;
  id v42;
  id *location;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "uuidToHREF");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_2;
    v46[3] = &unk_24C1FB720;
    objc_copyWeak(&v47, (id *)(a1 + 40));
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v46);

    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "hrefToETag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v9;
    v44[1] = 3221225472;
    v44[2] = __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_3;
    v44[3] = &unk_24C1FB720;
    objc_copyWeak(&v45, (id *)(a1 + 40));
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v44);

    v12 = objc_loadWeakRetained(v2);
    objc_msgSend(v12, "nextCTag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_loadWeakRetained(v2);
      objc_msgSend(v14, "nextCTag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v16, "calendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCtag:", v15);

    }
    objc_destroyWeak(&v45);
    objc_destroyWeak(&v47);
    v18 = objc_loadWeakRetained(v2);
    v19 = objc_msgSend(v18, "validCTag");

    if ((v19 & 1) == 0)
      goto LABEL_9;
    v4 = 0;
LABEL_20:
    v38 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v38, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", v4, 0);
    goto LABEL_21;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1AAB8]) & 1) == 0)
  {

    goto LABEL_20;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 412)
    goto LABEL_20;
LABEL_9:
  location = (id *)(a1 + 40);
  v20 = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(v20, "shouldTrySyncTokenForBulkUpload") & 1) != 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  v42 = objc_loadWeakRetained(location);
  objc_msgSend(v42, "calendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "syncToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "length"))
  {

    goto LABEL_18;
  }
  v41 = objc_loadWeakRetained(location);
  objc_msgSend(v41, "calendar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "syncToken");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_loadWeakRetained(location);
  objc_msgSend(v25, "calendar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ctag");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v24, "isEqualToString:", v27);

  if ((v40 & 1) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CalDAVErrorDomain"), 1, 0);
    v39 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v39;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logHandleForAccountInfoProvider:", 0);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v31 = objc_loadWeakRetained(location);
    objc_msgSend(v31, "calendar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "ctag");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_loadWeakRetained(location);
    objc_msgSend(v34, "calendar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "syncToken");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v33;
    v50 = 2114;
    v51 = v36;
    _os_log_impl(&dword_2096EB000, v30, OS_LOG_TYPE_INFO, "Bulk upload failed with a precondition error for ctag %{public}@, but we have sync-token %{public}@ that just might work. Retrying with that value.", buf, 0x16u);

  }
  v37 = objc_loadWeakRetained(location);
  objc_msgSend(v37, "setShouldTrySyncTokenForBulkUpload:", 1);

  v38 = objc_loadWeakRetained(location);
  objc_msgSend(v38, "_performBulkUpload");
LABEL_21:

}

void __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURL:forResourceWithUUID:", v5, v6);

}

void __48__CalDAVMergeUploadTaskGroup__performBulkUpload__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEtag:forItemAtURL:", v5, v6);

}

- (void)_performRegularUpload
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v4, "logHandleForAccountInfoProvider:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[CalDAVCalendar uuidsToAddActions](self->_calendar, "uuidsToAddActions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      -[CalDAVCalendar hrefsToModDeleteActions](self->_calendar, "hrefsToModDeleteActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      -[CalDAVCalendar calendarURL](self->_calendar, "calendarURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v36 = v9;
      v37 = 2048;
      v38 = v11;
      v39 = 2112;
      v40 = v12;
      _os_log_impl(&dword_2096EB000, v7, OS_LOG_TYPE_INFO, "Performing PUT uploads of %lu/%lu items to the server at %@", buf, 0x20u);

    }
  }

  -[CalDAVCalendar uuidsToAddActions](self->_calendar, "uuidsToAddActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke;
  v32[3] = &unk_24C1FB6F0;
  v32[4] = self;
  v15 = v3;
  v33 = v15;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v32);

  -[CalDAVCalendar hrefsToModDeleteActions](self->_calendar, "hrefsToModDeleteActions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_3;
  v30[3] = &unk_24C1FB6F0;
  v30[4] = self;
  v17 = v15;
  v31 = v17;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v30);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    v22 = (int *)MEMORY[0x24BE1AC90];
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23);
        -[CoreDAVTaskGroup taskManager](self, "taskManager", (_QWORD)v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "submitQueuedCoreDAVTask:", v24);

        objc_msgSend(*(id *)((char *)&self->super.super.isa + *v22), "addObject:", v24);
        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  CalDAVPutCalendarItemTask *v9;
  void *v10;
  void *v11;
  CalDAVPutCalendarItemTask *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id from;
  id location;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CalDAVPutCalendarItemTask alloc];
  objc_msgSend(v7, "dataPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v9, "initWithDataPayload:dataContentType:atURL:previousETag:", v10, v11, v8, 0);

  objc_msgSend(*(id *)(a1 + 32), "accountInfoProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPutCalendarItemTask setAccountInfoProvider:](v12, "setAccountInfoProvider:", v13);

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v12);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_2;
  v15[3] = &unk_24C1FB488;
  objc_copyWeak(&v17, &from);
  objc_copyWeak(&v18, &location);
  v14 = v8;
  v16 = v14;
  -[CalDAVPutCalendarItemTask setCompletionBlock:](v12, "setCompletionBlock:", v15);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "nextETag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtag:forItemAtURL:", v8, *(_QWORD *)(a1 + 32));

  }
  v9 = (id *)(a1 + 48);
  v10 = objc_loadWeakRetained(v9);
  objc_msgSend(v10, "outstandingTasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "removeObject:", v12);

  v13 = objc_loadWeakRetained(v9);
  objc_msgSend(v13, "outstandingTasks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    v16 = objc_loadWeakRetained(v9);
    objc_msgSend(v16, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, 0);

  }
}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  CalDAVPutCalendarItemTask *v9;
  void *v10;
  void *v11;
  void *v12;
  CalDAVPutCalendarItemTask *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  objc_msgSend(v6, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CalDAVPutCalendarItemTask alloc];
  objc_msgSend(v8, "dataPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CoreDAVPostOrPutTask initWithDataPayload:dataContentType:atURL:previousETag:](v9, "initWithDataPayload:dataContentType:atURL:previousETag:", v10, v11, v7, v12);

  objc_msgSend(*(id *)(a1 + 32), "accountInfoProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPutCalendarItemTask setAccountInfoProvider:](v13, "setAccountInfoProvider:", v14);

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, v13);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_4;
  v16[3] = &unk_24C1FB488;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  v15 = v7;
  v17 = v15;
  -[CalDAVPutCalendarItemTask setCompletionBlock:](v13, "setCompletionBlock:", v16);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __51__CalDAVMergeUploadTaskGroup__performRegularUpload__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "nextETag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtag:forItemAtURL:", v8, *(_QWORD *)(a1 + 32));

  }
  v9 = (id *)(a1 + 48);
  v10 = objc_loadWeakRetained(v9);
  objc_msgSend(v10, "outstandingTasks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "removeObject:", v12);

  v13 = objc_loadWeakRetained(v9);
  objc_msgSend(v13, "outstandingTasks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    v16 = objc_loadWeakRetained(v9);
    objc_msgSend(v16, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, 0);

  }
}

- (void)startTaskGroup
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id WeakRetained;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  -[CalDAVCalendar uuidsToAddActions](self->_calendar, "uuidsToAddActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    -[CalDAVCalendar bulkRequests](self->_calendar, "bulkRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE1AEA8]);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[CalDAVMergeUploadTaskGroup _performBulkUpload](self, "_performBulkUpload");
    else
      -[CalDAVMergeUploadTaskGroup _performRegularUpload](self, "_performRegularUpload");

    return;
  }
  -[CalDAVCalendar hrefsToModDeleteActions](self->_calendar, "hrefsToModDeleteActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2096EB000, v9, OS_LOG_TYPE_INFO, "There's nothing for CalDAVMergeUploadTaskGroup to do. Exiting early", buf, 2u);
  }

  -[CoreDAVTaskGroup finishCoreDAVTaskGroupWithError:delegateCallbackBlock:](self, "finishCoreDAVTaskGroupWithError:delegateCallbackBlock:", 0, 0);
}

- (void)cancelTaskGroup
{
  objc_super v3;

  -[CoreDAVTaskGroup cancelTaskGroup](self->_uploadTaskGroup, "cancelTaskGroup");
  v3.receiver = self;
  v3.super_class = (Class)CalDAVMergeUploadTaskGroup;
  -[CoreDAVTaskGroup cancelTaskGroup](&v3, sel_cancelTaskGroup);
}

- (CalDAVBulkUploadTaskGroup)uploadTaskGroup
{
  return self->_uploadTaskGroup;
}

- (void)setUploadTaskGroup:(id)a3
{
  objc_storeStrong((id *)&self->_uploadTaskGroup, a3);
}

- (CalDAVCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (CalDAVPrincipal)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
  objc_storeStrong((id *)&self->_principal, a3);
}

- (BOOL)shouldTrySyncTokenForBulkUpload
{
  return self->_shouldTrySyncTokenForBulkUpload;
}

- (void)setShouldTrySyncTokenForBulkUpload:(BOOL)a3
{
  self->_shouldTrySyncTokenForBulkUpload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principal, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_uploadTaskGroup, 0);
}

@end
