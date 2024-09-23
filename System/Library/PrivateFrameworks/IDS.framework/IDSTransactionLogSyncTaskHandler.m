@implementation IDSTransactionLogSyncTaskHandler

- (IDSTransactionLogSyncTaskHandler)initWithTask:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  IDSTransactionLogSyncTaskHandler *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSTransactionLogSyncTaskHandler;
  v12 = -[IDSTransactionLogTaskHandler _init](&v15, sel__init);
  v13 = (IDSTransactionLogSyncTaskHandler *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeWeak((id *)&v13->_delegate, v10);
  }

  return v13;
}

- (void)perform
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  os_activity_scope_state_s state;
  NSObject *v7;

  -[IDSTransactionLogSyncTaskHandler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v7 = _os_activity_create(&dword_1906E0000, "IDSTransactionLogSync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  -[IDSTransactionLogSyncTaskHandler delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1907E3A38;
  v5[3] = &unk_1E2C65360;
  v5[4] = self;
  objc_msgSend(v4, "persistedTokenForTaskHandler:completion:", self, v5);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)qPerformWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v4 = a3;
  +[IDSLogging transactionLog](IDSLogging, "transactionLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_INFO, "Fetching messages", buf, 2u);
  }

  -[IDSTransactionLogSyncTaskHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1907E3CAC;
  v7[3] = &unk_1E2C653D8;
  v7[4] = self;
  objc_msgSend(v6, "taskHandler:messagesFromToken:completion:", self, v4, v7);

}

- (void)qIngestMessages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v15, "groupID", v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          v17 = v7;
        else
          v17 = v8;
        objc_msgSend(v17, "addObject:", v15);
        objc_msgSend(v15, "recipientAlias");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v15, "recipientAlias");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  -[IDSTransactionLogSyncTaskHandler delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1907E43D0;
  v26[3] = &unk_1E2C65478;
  v26[4] = self;
  v27 = v8;
  v28 = v7;
  v29 = v10;
  v30 = v25;
  v21 = v25;
  v22 = v10;
  v23 = v7;
  v24 = v8;
  objc_msgSend(v20, "taskHandler:accountInfoForAliases:completion:", self, v9, v26);

}

- (void)qFetchParticipantsFromDeviceMessges:(id)a3 andGroupsFromGroupMessages:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _BYTE *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  NSObject *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  NSObject *v40;
  _BYTE *v41;
  _QWORD *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSLogging transactionLog](IDSLogging, "transactionLog");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v8, "count");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v9, "count");
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_INFO, "Fetching participants/groups for deviceMessges {deviceMessages.count: %ld, groupMessages.count: %ld}", buf, 0x16u);
  }

  v12 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = sub_1906EE354;
  v49 = sub_1906EE17C;
  v50 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_1906EE354;
  v45[4] = sub_1906EE17C;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_1906EE354;
  v43[4] = sub_1906EE17C;
  v44 = 0;
  -[IDSTransactionLogSyncTaskHandler _destinationsInMessages:](self, "_destinationsInMessages:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v12);
  -[IDSTransactionLogSyncTaskHandler delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1907E4D14;
  v37[3] = &unk_1E2C654A0;
  v37[4] = self;
  v16 = v13;
  v38 = v16;
  v41 = buf;
  v17 = v8;
  v39 = v17;
  v42 = v43;
  v18 = v12;
  v40 = v18;
  objc_msgSend(v14, "taskHandler:participantsWithDestinations:completion:", self, v16, v37);

  -[IDSTransactionLogSyncTaskHandler _groupIDsFromMessages:](self, "_groupIDsFromMessages:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v18);
  -[IDSTransactionLogSyncTaskHandler delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = sub_1907E4EBC;
  v31[3] = &unk_1E2C654A0;
  v31[4] = self;
  v21 = v19;
  v32 = v21;
  v35 = v45;
  v22 = v9;
  v33 = v22;
  v36 = v43;
  v23 = v18;
  v34 = v23;
  objc_msgSend(v20, "taskHandler:groupsWithGroupIDs:completion:", self, v21, v31);

  -[IDSTransactionLogSyncTaskHandler queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = sub_1907E5064;
  v26[3] = &unk_1E2C654C8;
  v27 = v10;
  v28 = v43;
  v29 = buf;
  v30 = v45;
  v25 = v10;
  dispatch_group_notify(v23, v24, v26);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_transactionMessagesFromTransportMessages:(id)a3 withParticipants:(id)a4 groups:(id)a5 accountInfo:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void (**v24)(id, void *, _QWORD);
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v24 = (void (**)(id, void *, _QWORD))a7;
  -[IDSTransactionLogSyncTaskHandler _groupsByGroupIDFromGroups:](self, "_groupsByGroupIDFromGroups:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v13;
  -[IDSTransactionLogSyncTaskHandler _participantsByAliasFromParticipants:](self, "_participantsByAliasFromParticipants:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        -[IDSTransactionLogSyncTaskHandler _transactionMessageFromTransportMessage:groups:participants:accountInfo:](self, "_transactionMessageFromTransportMessage:groups:participants:accountInfo:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22), v15, v16, v14);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }

  v24[2](v24, v17, 0);
}

- (IDSTransactionLogTaskHandlerDelegate)delegate
{
  IDSTransactionLogTaskHandlerDelegate **p_delegate;
  id WeakRetained;
  void *v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSTransactionLogTaskHandler.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_delegate"));

  }
  return (IDSTransactionLogTaskHandlerDelegate *)objc_loadWeakRetained((id *)p_delegate);
}

- (void)_completeWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IDSTransactionLogSyncTaskHandler syncTask](self, "syncTask");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_completeWithError:", v4);

}

- (id)_destinationsInMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "destination", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_groupIDsFromMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "groupID", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_groupsByGroupIDFromGroups:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "groupID", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_participantsByAliasFromParticipants:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v10, "aliases", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 groups:(id)a4 participants:(id)a5 accountInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v13, "groupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    -[IDSTransactionLogSyncTaskHandler _transactionMessageFromTransportMessage:withGroupID:groups:accountInfo:](self, "_transactionMessageFromTransportMessage:withGroupID:groups:accountInfo:", v13, v14, v10, v12);
  else
    -[IDSTransactionLogSyncTaskHandler _transactionMessageFromTransportMessage:withParticipants:accountInfo:](self, "_transactionMessageFromTransportMessage:withParticipants:accountInfo:", v13, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 withGroupID:(id)a4 groups:(id)a5 accountInfo:(id)a6
{
  return 0;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 withParticipants:(id)a4 accountInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alias");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pushToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "encryptedPayload");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cypherIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)v16;
    v25 = 0;
    objc_msgSend(v15, "verifyAndRevealData:withReceipient:cypherIdentifier:error:", v16, v17, v18, &v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;

    if (v19)
    {
      -[IDSTransactionLogSyncTaskHandler _transactionMessageFromTransportMessage:withDecryptedPayload:accountInfo:](self, "_transactionMessageFromTransportMessage:withDecryptedPayload:accountInfo:", v8, v19, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[IDSLogging transactionLog](IDSLogging, "transactionLog");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Failed to decrypt device message {error: %{public}@}", buf, 0xCu);
      }

      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_transactionMessageFromTransportMessage:(id)a3 withDecryptedPayload:(id)a4 accountInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  IDSTransactionLogDictionaryMessage *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  IDSTransactionLogDictionaryMessage *v25;
  const __CFString *v26;
  const __CFString *v27;
  NSObject *v28;
  id v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "senderAlias");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipientAlias");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v10 || !v11)
  {
    +[IDSLogging transactionLog](IDSLogging, "transactionLog");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v26 = CFSTR("NO");
      *(_DWORD *)buf = 138478851;
      v33 = v10;
      if (v10)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      if (v12)
        v26 = CFSTR("YES");
      v34 = 2113;
      v35 = v12;
      v36 = 2113;
      v37 = v7;
      v38 = 2114;
      v39 = v27;
      v40 = 2114;
      v41 = v26;
      _os_log_error_impl(&dword_1906E0000, v13, OS_LOG_TYPE_ERROR, "Message missing sender/recipient alias {senderAlias: %{private}@, recipientAlias: %{private}@, message: %{private}@, senderAlias==nil: %{public}@, recipientAlias==nil: %{public}@}", buf, 0x34u);
    }
    goto LABEL_15;
  }
  objc_msgSend(v9, "accountForAlias:", v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[IDSLogging transactionLog](IDSLogging, "transactionLog");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1907FED64(v7, v9, v28);

LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D34890]);

  objc_msgSend(v7, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("E"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D34888]);

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D34870]);
  v18 = [IDSTransactionLogDictionaryMessage alloc];
  -[NSObject uniqueID](v13, "uniqueID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "senderAlias");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject loginID](v13, "loginID");
  v30 = v8;
  v31 = v10;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceName");
  v22 = v12;
  v23 = v9;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[IDSTransactionLogDictionaryMessage initWithDictionary:accountUniqueID:fromID:loginID:serviceName:](v18, "initWithDictionary:accountUniqueID:fromID:loginID:serviceName:", v14, v19, v20, v21, v24);

  v9 = v23;
  v12 = v22;

  v8 = v30;
  v10 = v31;

LABEL_16:
  return v25;
}

- (IDSTransactionLogSyncTask)syncTask
{
  return self->_syncTask;
}

- (void)setSyncTask:(id)a3
{
  objc_storeStrong((id *)&self->_syncTask, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncTask, 0);
}

@end
