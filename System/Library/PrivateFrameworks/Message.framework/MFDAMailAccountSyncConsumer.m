@implementation MFDAMailAccountSyncConsumer

- (MFDAMailAccountSyncConsumer)initWithCurrentTag:(id)a3 accountID:(id)a4 requests:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  MFDAMailAccountSyncConsumer *v13;
  MFDAMailAccountSyncConsumer *v14;
  MFDAMailAccountSyncConsumer *v15;
  uint64_t v16;
  MFActivityMonitor *monitor;
  _QWORD v19[4];
  MFDAMailAccountSyncConsumer *v20;
  id v21;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  objc_storeStrong((id *)&self->_requestPairs, a5);
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke;
  v23[3] = &unk_1E4E8BDE0;
  v23[4] = &v24;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);
  v12 = *((unsigned __int8 *)v25 + 24);
  v22.receiver = self;
  v22.super_class = (Class)MFDAMailAccountSyncConsumer;
  v13 = -[MFDAMailAccountConsumer initWithAlwaysReportFailures:](&v22, sel_initWithAlwaysReportFailures_, v12);
  v14 = v13;
  if (v13)
  {
    -[MFDAMailAccountSyncConsumer setTag:](v13, "setTag:", v8);
    v14->_firstSyncBatch = 1;
    objc_storeStrong((id *)&v14->_accountID, a4);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke_2;
    v19[3] = &unk_1E4E8BE08;
    v15 = v14;
    v20 = v15;
    v21 = v10;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v19);
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v16 = objc_claimAutoreleasedReturnValue();
    monitor = v15->_monitor;
    v15->_monitor = (MFActivityMonitor *)v16;

  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "first");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "mf_alwaysReportFailures"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

void __69__MFDAMailAccountSyncConsumer_initWithCurrentTag_accountID_requests___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "second");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE819A40))
  {
    objc_msgSend(v10, "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      if (!v6)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 72);
        *(_QWORD *)(v8 + 72) = v7;

        v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, v5);
    }

  }
}

- (void)reset
{
  objc_super v2;

  self->_moreAvailable = 0;
  self->_firstSyncBatch = 0;
  v2.receiver = self;
  v2.super_class = (Class)MFDAMailAccountSyncConsumer;
  -[MFDAMailAccountConsumer setDone:](&v2, sel_setDone_, 0);
}

- (id)originalThreadMonitor
{
  return self->_monitor;
}

- (id)actionsConsumer
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_requestPairs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v4)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "second", (_QWORD)v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE8197D8) & 1) != 0)
        break;

      if (v3 == ++v5)
      {
        v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (void)handleSyncResponses:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[MFDAMailAccountSyncConsumer actionsConsumer](self, "actionsConsumer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = v23;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v9, "status", v22) == 12)
          {
            objc_msgSend(v9, "message");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_alloc(MEMORY[0x1E0D1C260]);
            objc_msgSend(v10, "remoteID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v11, "initWithItemChangeType:changedItem:serverId:", 2, v10, v12);

            objc_msgSend(v4, "addObject:", v13);
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v4, "count"))
      objc_msgSend(v22, "receiveSyncActions:", v4);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v23;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v18, "serverId", v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19
          || (-[NSMutableDictionary objectForKeyedSubscript:](self->_syncResponseConsumersByMessageId, "objectForKeyedSubscript:", v19), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          if (-[NSArray count](self->_requestPairs, "count") == 1)
          {
            -[NSArray objectAtIndexedSubscript:](self->_requestPairs, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "second");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v20 = 0;
          }
        }
        if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EE819A40))
          objc_msgSend(v20, "handleResponse:error:", v18, 0);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

}

- (void)partialResultsForMailbox:(id)a3 actions:(id)a4 responses:(id)a5 percentComplete:(double)a6 moreAvailable:(BOOL)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  if (self->_firstSyncBatch && !a7)
  {
    -[MFDAMailAccountSyncConsumer originalThreadMonitor](self, "originalThreadMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPercentDone:", a6);

  }
  if (objc_msgSend(v13, "count"))
  {
    -[MFDAMailAccountSyncConsumer actionsConsumer](self, "actionsConsumer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMailAccountSyncConsumer.m"), 163, CFSTR("we failed to find a sync actions consumer! requests: %@"), self->_requestPairs, v20);

    }
    if (!self->_receivedFirstItem)
    {
      if (!self->_tag)
        objc_msgSend(v16, "drainMailbox");
      -[MFDAMailAccountSyncConsumer originalThreadMonitor](self, "originalThreadMonitor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      MFLookupLocalizedString(CFSTR("DOWNLOADING_STATUS"), CFSTR("Downloading"), CFSTR("Delayed"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDisplayName:", v18);

      self->_receivedFirstItem = 1;
    }
    objc_msgSend(v16, "receiveSyncActions:", v13);

  }
  if (objc_msgSend(v14, "count"))
    -[MFDAMailAccountSyncConsumer handleSyncResponses:](self, "handleSyncResponses:", v14);

}

- (void)resultsForMailbox:(id)a3 newTag:(id)a4 actions:(id)a5 responses:(id)a6 percentComplete:(double)a7 moreAvailable:(BOOL)a8 sentBytesCount:(unint64_t)a9 receivedBytesCount:(unint64_t)a10
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  v16 = a5;
  v17 = a6;
  -[MFActivityMonitor recordBytesWritten:](self->_monitor, "recordBytesWritten:", a9);
  -[MFActivityMonitor recordBytesRead:](self->_monitor, "recordBytesRead:", a10);
  -[MFDAMailAccountSyncConsumer actionsConsumer](self, "actionsConsumer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMailAccountSyncConsumer.m"), 198, CFSTR("we failed to find a sync actions consumer! requests: %@"), self->_requestPairs);

    }
    if (!self->_receivedFirstItem)
    {
      if (!self->_tag)
        objc_msgSend(v18, "drainMailbox");
      -[MFDAMailAccountSyncConsumer originalThreadMonitor](self, "originalThreadMonitor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      MFLookupLocalizedString(CFSTR("DOWNLOADING_STATUS"), CFSTR("Downloading"), CFSTR("Delayed"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDisplayName:", v20);

      self->_receivedFirstItem = 1;
    }
    objc_msgSend(v18, "receiveSyncActions:", v16);
  }
  if (objc_msgSend(v17, "count"))
    -[MFDAMailAccountSyncConsumer handleSyncResponses:](self, "handleSyncResponses:", v17);
  objc_msgSend(v18, "commitSyncActions");
  self->_moreAvailable = a8;
  -[MFDAMailAccountSyncConsumer setTag:](self, "setTag:", v22);
  -[MFDAMailAccountConsumer setDone:](self, "setDone:", 1);

}

- (BOOL)shouldBeginStreamingForMailMessage:(id)a3 format:(int)a4
{
  id v6;
  NSArray *requestPairs;
  id v8;
  _QWORD v10[4];
  id v11;
  MFDAMailAccountSyncConsumer *v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[MFDAMailAccountSyncConsumer setStreamConsumer:](self, "setStreamConsumer:", 0);
  requestPairs = self->_requestPairs;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__MFDAMailAccountSyncConsumer_shouldBeginStreamingForMailMessage_format___block_invoke;
  v10[3] = &unk_1E4E8BE30;
  v8 = v6;
  v11 = v8;
  v12 = self;
  v13 = &v15;
  v14 = a4;
  -[NSArray enumerateObjectsUsingBlock:](requestPairs, "enumerateObjectsUsingBlock:", v10);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __73__MFDAMailAccountSyncConsumer_shouldBeginStreamingForMailMessage_format___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "requestType") == 3)
  {
    objc_msgSend(v6, "messageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "remoteID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      objc_msgSend(v13, "second");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "streamingContentConsumer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setStreamConsumer:", v11);

        objc_msgSend(*(id *)(a1 + 40), "streamConsumer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "shouldBeginStreamingForMailMessage:format:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56));

        *a4 = 1;
      }

    }
  }

}

- (void)consumeData:(char *)a3 length:(int)a4 format:(int)a5 mailMessage:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v11 = a6;
  -[MFDAMailAccountSyncConsumer streamConsumer](self, "streamConsumer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "consumeData:length:format:mailMessage:", a3, v7, v6, v11);

}

- (void)didEndStreamingForMailMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFDAMailAccountSyncConsumer streamConsumer](self, "streamConsumer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didEndStreamingForMailMessage:", v5);

}

- (void)taskFailed:(id)a3 statusCode:(int64_t)a4 error:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  __CFString **v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int serverErrors;
  NSObject *v16;
  int v17;
  int syncKeyResets;
  NSObject *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  NSArray *requestPairs;
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  _BYTE v30[18];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 <= 62)
  {
    v11 = MFMessageErrorDomain;
    v12 = 1033;
    switch(a4)
    {
      case -1:
        v12 = 1028;
        goto LABEL_27;
      case 0:
        objc_msgSend(v10, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
        {

          goto LABEL_26;
        }
        v14 = objc_msgSend(v10, "code");

        if (v14 != -1001)
          goto LABEL_26;
        v11 = (__CFString **)MEMORY[0x1E0CB2FE0];
        v12 = 60;
        goto LABEL_27;
      case 5:
        serverErrors = self->_serverErrors;
        self->_serverErrors = serverErrors + 1;
        if (serverErrors <= 0)
        {
          self->_moreAvailable = 1;
        }
        else if (!self->_moreAvailable)
        {
          DALoggingwithCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = self->_serverErrors;
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v30 = v17;
            *(_WORD *)&v30[4] = 2112;
            *(_QWORD *)&v30[6] = v8;
            _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "encounter server error %d times for task %@, giving up.", buf, 0x12u);
          }

          v11 = MFMessageErrorDomain;
          v12 = 1040;
          goto LABEL_27;
        }
        DALoggingwithCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v30 = v8;
          _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_DEFAULT, "encounter server error for task %@.", buf, 0xCu);
        }
        goto LABEL_33;
      case 6:
      case 9:
        goto LABEL_27;
      case 8:
        -[MFDAMailAccountSyncConsumer setTag:](self, "setTag:", 0, 1033);
        syncKeyResets = self->_syncKeyResets;
        self->_syncKeyResets = syncKeyResets + 1;
        self->_moreAvailable = syncKeyResets < 1;
        if (syncKeyResets > 0)
        {
          DALoggingwithCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = self->_syncKeyResets;
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v30 = v20;
            *(_WORD *)&v30[4] = 2112;
            *(_QWORD *)&v30[6] = v8;
            _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "server has reset the sync state %d times for task %@ in the same sync attempt, giving up.", buf, 0x12u);
          }

          goto LABEL_24;
        }
        DALoggingwithCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v30 = v8;
          *(_WORD *)&v30[8] = 2048;
          *(_QWORD *)&v30[10] = 8;
          _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_DEFAULT, "server indicated invalid sync state for task %@ (code %ld).  resetting mailbox sync key.", buf, 0x16u);
        }
LABEL_33:

        break;
      case 12:
        objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:", self->_accountID, 1, 1, 1);

        goto LABEL_24;
      default:
        goto LABEL_26;
    }
    goto LABEL_29;
  }
  if (a4 == 63)
    goto LABEL_7;
  if (a4 != 67)
  {
    if (a4 == 79)
    {
LABEL_7:
      v11 = MFMessageErrorDomain;
      v12 = 1055;
      goto LABEL_27;
    }
LABEL_26:
    v11 = MFMessageErrorDomain;
    v12 = 1045;
LABEL_27:
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", *v11, v12, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      self->_moreAvailable = 0;
      requestPairs = self->_requestPairs;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __59__MFDAMailAccountSyncConsumer_taskFailed_statusCode_error___block_invoke;
      v27[3] = &unk_1E4E88E40;
      v28 = v23;
      v25 = v23;
      -[NSArray enumerateObjectsUsingBlock:](requestPairs, "enumerateObjectsUsingBlock:", v27);

    }
    goto LABEL_29;
  }
  if (!-[MFDAMailAccountSyncConsumer refreshFolderHierarchyAndWait:](self, "refreshFolderHierarchyAndWait:", 5))
  {
LABEL_24:
    v11 = MFMessageErrorDomain;
    v12 = 1033;
    goto LABEL_27;
  }
  v22 = self->_serverErrors;
  self->_serverErrors = v22 + 1;
  if (v22 <= 0)
    self->_moreAvailable = 1;
LABEL_29:

}

void __59__MFDAMailAccountSyncConsumer_taskFailed_statusCode_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "second");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleResponse:error:", 0, *(_QWORD *)(a1 + 32));

}

- (void)accountHierarchyChanged:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", self->_accountID);

  if (v5)
  {
    -[NSConditionLock lock](self->_accountHierarchyLock, "lock");
    -[NSConditionLock unlockWithCondition:](self->_accountHierarchyLock, "unlockWithCondition:", 1);
  }

}

- (BOOL)refreshFolderHierarchyAndWait:(unint64_t)a3
{
  NSConditionLock *v5;
  NSConditionLock *accountHierarchyLock;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  NSConditionLock *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (NSConditionLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  accountHierarchyLock = self->_accountHierarchyLock;
  self->_accountHierarchyLock = v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_accountHierarchyChanged_, *MEMORY[0x1E0D1C208], 0);

  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateFolderListForAccountID:andDataclasses:requireChangedFolders:isUserRequested:", self->_accountID, 1, 1, 1);

  if (a3)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = self->_accountHierarchyLock;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSConditionLock lockWhenCondition:beforeDate:](v11, "lockWhenCondition:beforeDate:", 1, v12);

      -[NSConditionLock unlock](self->_accountHierarchyLock, "unlock");
      if (-[NSConditionLock condition](self->_accountHierarchyLock, "condition") == 1)
        break;
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.01);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "runUntilDate:", v14);

      v10 = ++v9 < a3;
    }
    while (a3 != v9);
  }
  else
  {
    return 0;
  }
  return v10;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (DAMailboxStreamingContentConsumer)streamConsumer
{
  return self->_streamConsumer;
}

- (void)setStreamConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_streamConsumer, a3);
}

- (BOOL)moreAvailable
{
  return self->_moreAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamConsumer, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_accountHierarchyLock, 0);
  objc_storeStrong((id *)&self->_syncResponseConsumersByMessageId, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_requestPairs, 0);
}

@end
