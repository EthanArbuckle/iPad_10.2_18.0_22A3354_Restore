@implementation NNMKBatchRequestHandler

- (void)setSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_syncController, a3);
}

- (void)setResendScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_resendScheduler, a3);
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NNMKBatchRequestHandler)init
{
  NNMKBatchRequestHandler *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *batchedRequestByMailboxId;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NNMKBatchRequestHandler;
  v2 = -[NNMKBatchRequestHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    batchedRequestByMailboxId = v2->_batchedRequestByMailboxId;
    v2->_batchedRequestByMailboxId = v3;

  }
  return v2;
}

- (void)handleBatchRequest:(id)a3
{
  NNMKBatchedRequest *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "wantsBatchedResponse"))
  {
    -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
    v4 = (NNMKBatchedRequest *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mailboxId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKBatchedRequest objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
    }
    else
    {
      objc_msgSend(v12, "mailboxId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_7:
        -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mailboxId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setLatestFetchRequest:", v12);

        goto LABEL_8;
      }
      v4 = objc_alloc_init(NNMKBatchedRequest);
      -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mailboxId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v7);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)handleMessageAdded:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mailboxId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mailboxId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messagesToBeSentInBatch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v11);

  }
}

- (void)handleMessageDeleted:(id)a3 mailboxId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messagesToBeSentInBatch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
}

- (void)startFetchTimeout
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E161000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling time out for #FETCH #BATCHED_RESPONSE.", v4, 2u);
  }
  -[NNMKBatchRequestHandler _rescheduleFetchTimeout](self, "_rescheduleFetchTimeout");
}

- (id)checkBatchFetchedMessages
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NNMKBatchRequestHandlerResult *v20;
  void *v21;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[NNMKBatchRequestHandler cancelFetchTimeout](self, "cancelFetchTimeout");
  -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138543362;
    v23 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        -[NNMKBatchRequestHandler syncController](self, "syncController", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mailboxWithId:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 || (objc_msgSend(0, "syncActive") & 1) != 0)
        {
          buf[0] = 0;
          v27 = 0;
          -[NNMKBatchRequestHandler _checkBatchFetchedMessagesWithMailbox:messageHeadersToFetch:attemptsFailed:](self, "_checkBatchFetchedMessagesWithMailbox:messageHeadersToFetch:attemptsFailed:", v13, &v27, buf);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v27;
          if (v14)
            objc_msgSend(v25, "addObject:", v14);
          if (buf[0])
            objc_msgSend(v26, "addObject:", v13);
          if (objc_msgSend(v15, "count"))
            objc_msgSend(v24, "addObjectsFromArray:", v15);
          if (v14)
            v16 = 0;
          else
            v16 = buf[0] == 0;
          if (!v16)
          {
            -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeObjectForKey:", v11);

            -[NNMKBatchRequestHandler setRetryCountForRequestingMissingHeadersInBatchedResponse:](self, "setRetryCountForRequestingMissingHeadersInBatchedResponse:", 0);
            -[NNMKBatchRequestHandler setLastRetryDate:](self, "setLastRetryDate:", 0);
          }

        }
        else
        {
          v18 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v33 = v11;
            _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring mailbox for fetch response because it does not exist or is inactive, %{public}@", buf, 0xCu);
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      v8 = v19;
    }
    while (v19);
  }

  v20 = objc_alloc_init(NNMKBatchRequestHandlerResult);
  -[NNMKBatchRequestHandlerResult setFetchResults:](v20, "setFetchResults:", v25);
  -[NNMKBatchRequestHandlerResult setMailboxesToTriggerFullSync:](v20, "setMailboxesToTriggerFullSync:", v26);
  -[NNMKBatchRequestHandlerResult setMissingMessageHeaderIds:](v20, "setMissingMessageHeaderIds:", v24);
  -[NNMKBatchRequestHandler firstMessageIds:fromBatchedFetchResults:](self, "firstMessageIds:fromBatchedFetchResults:", 5, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKBatchRequestHandlerResult setMessageIdsForRequestingContentDownload:](v20, "setMessageIdsForRequestingContentDownload:", v21);

  return v20;
}

- (id)_checkBatchFetchedMessagesWithMailbox:(id)a3 messageHeadersToFetch:(id *)a4 attemptsFailed:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  unint64_t v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  BOOL *v76;
  _BYTE *v77;
  id *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_37;
  v76 = a5;
  v78 = a4;
  v12 = (void *)MEMORY[0x24BDD1620];
  v13 = objc_opt_class();
  objc_msgSend(v11, "latestFetchRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentDateForRequestingMoreMessages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unarchivedObjectOfClass:fromData:error:", v13, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[NNMKBatchRequestHandler delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentDeviceRegistry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mailboxId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oldestDateReceivedForMailboxId:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NNMKBatchRequestHandler delegate](self, "delegate", v76);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentDeviceRegistry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "syncedMessagesKeyedByMessageIdAfterDateReceived:mailboxId:", v16, v22);
  v23 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "diffFromMessages:maxMessagesToAdd:", v23, 40);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v23;
  v81 = v8;
  if (objc_msgSend(v24, "trimed"))
  {
    v25 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      objc_msgSend(v8, "mailboxId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v88 = (uint64_t)v27;
      _os_log_impl(&dword_22E161000, v26, OS_LOG_TYPE_DEFAULT, "Too many new messages to send as a Batch Response to Watch. We're sending only 40 first new messages... %{public}@", buf, 0xCu);

    }
    objc_msgSend(v24, "messageToAddToWatch");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dateReceived");
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "latestFetchRequest");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCurrentDateForRequestingMoreMessages:", v31);

    objc_msgSend(v11, "latestFetchRequest");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWillTrimDatabaseAfterResults:", 1);

    v82 = (void *)v30;
  }
  else
  {
    v82 = v16;
  }
  v34 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v24, "messageIdsToAddToWatch");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v79 = v24;
  objc_msgSend(v24, "messageIdsToAddToWatch");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v84 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v11, "messagesToBeSentInBatch");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
          objc_msgSend(v36, "addObject:", v42);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    }
    while (v39);
  }

  v45 = objc_msgSend(v36, "count");
  if (v45)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "timeIntervalSince1970");
    v48 = v47;
    -[NNMKBatchRequestHandler lastRetryDate](self, "lastRetryDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "timeIntervalSince1970");
    v51 = v48 - v50;

    v8 = v81;
    if (v51 >= 3600.0)
      -[NNMKBatchRequestHandler setRetryCountForRequestingMissingHeadersInBatchedResponse:](self, "setRetryCountForRequestingMissingHeadersInBatchedResponse:", 0);
    -[NNMKBatchRequestHandler setRetryCountForRequestingMissingHeadersInBatchedResponse:](self, "setRetryCountForRequestingMissingHeadersInBatchedResponse:", -[NNMKBatchRequestHandler retryCountForRequestingMissingHeadersInBatchedResponse](self, "retryCountForRequestingMissingHeadersInBatchedResponse")+ 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKBatchRequestHandler setLastRetryDate:](self, "setLastRetryDate:", v52);

    v53 = -[NNMKBatchRequestHandler retryCountForRequestingMissingHeadersInBatchedResponse](self, "retryCountForRequestingMissingHeadersInBatchedResponse");
    v54 = (void *)qword_253E87A90;
    v55 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
    if (v53 > 3)
    {
      v56 = v79;
      if (v55)
      {
        v73 = v54;
        objc_msgSend(v81, "mailboxId");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v88 = (uint64_t)v74;
        _os_log_impl(&dword_22E161000, v73, OS_LOG_TYPE_DEFAULT, "Exceed attempts to request headers for messages missing it. We're triggering a full sync, so watch gets in sync with companion. Mailbox Id: %{public}@", buf, 0xCu);

      }
      v59 = v82;
      if (v77)
        *v77 = 1;
    }
    else
    {
      v56 = v79;
      if (v55)
      {
        v57 = v54;
        v58 = objc_msgSend(v36, "count");
        objc_msgSend(v81, "mailboxId");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v88 = v58;
        v89 = 2114;
        v90 = v54;
        _os_log_impl(&dword_22E161000, v57, OS_LOG_TYPE_DEFAULT, "Tried to send fetch response, but there are %lu messages that we don't have full headers for. Asking MobileMail for these headers... Mailbox id: %{public}@", buf, 0x16u);

      }
      v59 = v82;
      if (v78)
        *v78 = objc_retainAutorelease(v36);
    }
    v72 = v80;
  }
  else
  {
    v60 = (void *)qword_253E87A90;
    v8 = v81;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v61 = v60;
      objc_msgSend(v81, "mailboxId");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v88 = (uint64_t)v62;
      _os_log_impl(&dword_22E161000, v61, OS_LOG_TYPE_DEFAULT, "Sending batched response back. (Mailbox id: %{public}@)", buf, 0xCu);

    }
    objc_msgSend(v11, "latestFetchRequest");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "willTrimDatabaseAfterResults");

    v56 = v79;
    if (v64)
    {
      -[NNMKBatchRequestHandler delegate](self, "delegate");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "currentDeviceRegistry");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "removeSyncedMessagesBeforeDateReceived:mailbox:", v82, v81);

      -[NNMKBatchRequestHandler resendScheduler](self, "resendScheduler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "mailboxId");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "deletePendingIDSMessagesForMailboxId:", v68);

      -[NNMKBatchRequestHandler delegate](self, "delegate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "currentDeviceRegistry");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "mailboxId");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "incrementSyncVersionForMailboxId:", v71);

    }
    v72 = v80;
    -[NNMKBatchRequestHandler _batchedFetchResultForBatchedRequest:mailbox:diff:localSyncedMessagesByMessageId:](self, "_batchedFetchResultForBatchedRequest:mailbox:diff:localSyncedMessagesByMessageId:", v11, v81, v79, v80);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v82;
  }

  if (v45)
LABEL_37:
    v54 = 0;

  return v54;
}

- (id)_batchedFetchResultForBatchedRequest:(id)a3 mailbox:(id)a4 diff:(id)a5 localSyncedMessagesByMessageId:(id)a6
{
  id v10;
  id v11;
  id v12;
  NNMKProtoBatchedFetchResult *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t i;
  NNMKProtoBatchedFetchResult *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  NNMKProtoMessageStatusUpdate *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  uint64_t v52;
  NNMKProtoMessageDeletion *v53;
  void *v55;
  void *v56;
  id obj;
  uint64_t v58;
  NNMKBatchRequestHandler *v59;
  void *v60;
  uint64_t v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v62 = a6;
  v13 = objc_alloc_init(NNMKProtoBatchedFetchResult);
  -[NNMKBatchRequestHandler delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentDeviceRegistry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoBatchedFetchResult setFullSyncVersion:](v13, "setFullSyncVersion:", objc_msgSend(v15, "fullSyncVersion"));

  v16 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoBatchedFetchResult setDateSynced:](v13, "setDateSynced:", v18);

  objc_msgSend(v10, "latestFetchRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoBatchedFetchResult setShouldTrimDatabase:](v13, "setShouldTrimDatabase:", objc_msgSend(v19, "willTrimDatabaseAfterResults"));

  v60 = v10;
  objc_msgSend(v10, "latestFetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentDateForRequestingMoreMessages");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoBatchedFetchResult setDateForRequestingMoreMessages:](v13, "setDateForRequestingMoreMessages:", v21);

  objc_msgSend(v11, "mailboxId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoBatchedFetchResult setMailboxId:](v13, "setMailboxId:", v22);

  v59 = self;
  -[NNMKBatchRequestHandler delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentDeviceRegistry");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v11;
  objc_msgSend(v11, "mailboxId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoBatchedFetchResult setMailboxSyncVersion:](v13, "setMailboxSyncVersion:", objc_msgSend(v24, "syncVersionForMailboxId:", v25));

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v55 = v12;
  objc_msgSend(v12, "messageIdsToAddToWatch");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v61)
  {
    v58 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        v27 = v13;
        if (*(_QWORD *)v72 != v58)
          objc_enumerationMutation(obj);
        v28 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v60, "messagesToBeSentInBatch");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v62, "objectForKeyedSubscript:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setStatus:", objc_msgSend(v31, "status"));

        -[NNMKBatchRequestHandler delegate](v59, "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "currentDeviceRegistry");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "organizeByThread");
        -[NNMKBatchRequestHandler delegate](v59, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "pairedDeviceSupportsMultipleMailboxes") ^ 1;
        -[NNMKBatchRequestHandler delegate](v59, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[NNMKProtoMessage protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:](NNMKProtoMessage, "protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:", v30, v34, v36, objc_msgSend(v37, "pairedDeviceSupportsStandaloneMode"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v27;
        -[NNMKProtoBatchedFetchResult addMessageAddition:](v27, "addMessageAddition:", v38);

      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v61);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v55, "messageIdsToUpdateOnWatch");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v68 != v42)
          objc_enumerationMutation(v39);
        v44 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend(v62, "objectForKeyedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_alloc_init(NNMKProtoMessageStatusUpdate);
        -[NNMKProtoMessageStatusUpdate setMessageId:](v46, "setMessageId:", v44);
        -[NNMKProtoMessageStatusUpdate setUpdatedStatus:](v46, "setUpdatedStatus:", objc_msgSend(v45, "status"));
        -[NNMKProtoMessageStatusUpdate setStatusVersion:](v46, "setStatusVersion:", objc_msgSend(v45, "statusVersion"));
        -[NNMKProtoBatchedFetchResult addMessageUpdate:](v13, "addMessageUpdate:", v46);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v41);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  objc_msgSend(v55, "messageIdsToDeleteFromWatch");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v64 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k);
        v53 = objc_alloc_init(NNMKProtoMessageDeletion);
        -[NNMKProtoMessageDeletion setMessageId:](v53, "setMessageId:", v52);
        -[NNMKProtoBatchedFetchResult addMessageDeletion:](v13, "addMessageDeletion:", v53);

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    }
    while (v49);
  }

  return v13;
}

- (id)firstMessageIds:(unint64_t)a3 fromBatchedFetchResults:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v25 = v5;
    obj = v5;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v38;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(obj);
          v29 = v8;
          v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v8);
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v9, "messageAdditions");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v34;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v34 != v12)
                  objc_enumerationMutation(v30);
                v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
                v15 = (void *)MEMORY[0x24BDD1620];
                v16 = objc_opt_class();
                objc_msgSend(v14, "dateReceived");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "unarchivedObjectOfClass:fromData:error:", v16, v17, 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v14, "messageId");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);

                objc_msgSend(v14, "messageId");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v6, "count");
                v31[0] = MEMORY[0x24BDAC760];
                v31[1] = 3221225472;
                v31[2] = __67__NNMKBatchRequestHandler_firstMessageIds_fromBatchedFetchResults___block_invoke;
                v31[3] = &unk_24F9F6508;
                v32 = v7;
                v22 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, v21, 1024, v31);

                if (objc_msgSend(v6, "count") != a3 || v22 != objc_msgSend(v6, "count"))
                {
                  objc_msgSend(v14, "messageId");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "insertObject:atIndex:", v23, v22);

                  if (objc_msgSend(v6, "count") > a3)
                    objc_msgSend(v6, "removeLastObject");
                }

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v11);
          }

          v8 = v29 + 1;
        }
        while (v29 + 1 != v28);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v28);
    }

    v5 = v25;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __67__NNMKBatchRequestHandler_firstMessageIds_fromBatchedFetchResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (void)reset
{
  id v2;

  -[NNMKBatchRequestHandler batchedRequestByMailboxId](self, "batchedRequestByMailboxId");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)cancelFetchTimeout
{
  void *v3;
  NSObject *v4;

  -[NNMKBatchRequestHandler fetchTimeoutTimer](self, "fetchTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NNMKBatchRequestHandler fetchTimeoutTimer](self, "fetchTimeoutTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
}

- (void)_rescheduleFetchTimeout
{
  void *v3;
  dispatch_source_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[5];

  -[NNMKBatchRequestHandler fetchTimeoutTimer](self, "fetchTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_executionQueue);
    -[NNMKBatchRequestHandler setFetchTimeoutTimer:](self, "setFetchTimeoutTimer:", v4);

    -[NNMKBatchRequestHandler fetchTimeoutTimer](self, "fetchTimeoutTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __50__NNMKBatchRequestHandler__rescheduleFetchTimeout__block_invoke;
    handler[3] = &unk_24F9F6270;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);

    -[NNMKBatchRequestHandler fetchTimeoutTimer](self, "fetchTimeoutTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v6);

  }
  -[NNMKBatchRequestHandler fetchTimeoutTimer](self, "fetchTimeoutTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NNMKBatchRequestHandler fetchTimeoutTimer](self, "fetchTimeoutTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);

  }
}

void __50__NNMKBatchRequestHandler__rescheduleFetchTimeout__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "batchRequestHandlerDidTimeoutFetchRequest:", *(_QWORD *)(a1 + 32));

}

- (NNMKBatchRequestHandlerDelegate)delegate
{
  return (NNMKBatchRequestHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NNMKResendScheduler)resendScheduler
{
  return self->_resendScheduler;
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (OS_dispatch_source)fetchTimeoutTimer
{
  return self->_fetchTimeoutTimer;
}

- (void)setFetchTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fetchTimeoutTimer, a3);
}

- (NSMutableDictionary)batchedRequestByMailboxId
{
  return self->_batchedRequestByMailboxId;
}

- (void)setBatchedRequestByMailboxId:(id)a3
{
  objc_storeStrong((id *)&self->_batchedRequestByMailboxId, a3);
}

- (unint64_t)retryCountForRequestingMissingHeadersInBatchedResponse
{
  return self->_retryCountForRequestingMissingHeadersInBatchedResponse;
}

- (void)setRetryCountForRequestingMissingHeadersInBatchedResponse:(unint64_t)a3
{
  self->_retryCountForRequestingMissingHeadersInBatchedResponse = a3;
}

- (NSDate)lastRetryDate
{
  return self->_lastRetryDate;
}

- (void)setLastRetryDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRetryDate, 0);
  objc_storeStrong((id *)&self->_batchedRequestByMailboxId, 0);
  objc_storeStrong((id *)&self->_fetchTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_resendScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
