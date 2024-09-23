@implementation NNMKResendScheduler

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_syncController, a3);
}

- (void)forceRetryingAllPendingIDSMessages
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "Forcing retrying all pending ids messages", v9, 2u);
    }
    -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareIDSIdentifiersForResendForErrorCode:", 27);

    -[NNMKResendScheduler delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "datesForIDSIdentifiersScheduledToBeResent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resendScheduler:didRequestEnqueueIDSIdentifiersForResend:", self, v8);

    -[NNMKResendScheduler _executePendingResendsAndContentRequests](self, "_executePendingResendsAndContentRequests");
    -[NNMKResendScheduler _failPendingComposedMessages](self, "_failPendingComposedMessages");
  }
}

- (id)deviceRegistry
{
  void *v2;
  void *v3;

  -[NNMKResendScheduler delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NNMKResendSchedulerDelegate)delegate
{
  return (NNMKResendSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)registerIDSIdentifier:(id)a3 objectIds:(id)a4 type:(id)a5 resendInterval:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    -[NNMKResendScheduler registerIDSIdentifier:objectIds:type:resendInterval:].cold.1((uint64_t)v10, (uint64_t)v12, v13);
  if (!objc_msgSend(v11, "count"))
  {

    v11 = &unk_24FA10DE8;
  }
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectIds:type:resendInterval:forIDSIdentifierNotYetAckd:", v11, v12, a6, v10);

}

- (void)resendObjectsForIDSIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v9 = 0;
  v4 = a3;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "objectIdsForIDSIdentifierNotYetAckd:type:resendInterval:", v4, &v8, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  -[NNMKResendScheduler _resendObjectIds:type:resendInterval:idsIdentifier:](self, "_resendObjectIds:type:resendInterval:idsIdentifier:", v6, v7, v9, v4);
}

- (void)handleIDSMessageFailedWithId:(id)a3 errorCode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v16 = 0;
    -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v8, "objectIdsForIDSIdentifierNotYetAckd:type:resendInterval:", v6, &v15, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;

    v11 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v18 = v6;
      v19 = 2114;
      v20 = v10;
      v21 = 2048;
      v22 = v16;
      v23 = 2048;
      v24 = a4;
      _os_log_error_impl(&dword_22E161000, v11, OS_LOG_TYPE_ERROR, "Error sending IDS Messages (IDS Identifier: %{public}@ - Object Type: %{public}@ - Resend Interval: %lu - Error code: %li).", buf, 0x2Au);
    }
    -[NNMKResendScheduler delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "resendScheduler:didRequestNewResendIntervalForPreviousResendInterval:errorCode:", self, v16, a4);

    if (a4 == 27)
    {
      v16 = v13;
      v14 = v13;
    }
    else
    {
      v14 = v16;
    }
    if (v14)
      -[NNMKResendScheduler _scheduleIdsIdentifierForResend:currentResendInterval:newResendInterval:errorCode:](self, "_scheduleIdsIdentifierForResend:currentResendInterval:newResendInterval:errorCode:", v6, v14, v13, a4);
    else
      -[NNMKResendScheduler _resendObjectIds:type:resendInterval:idsIdentifier:](self, "_resendObjectIds:type:resendInterval:idsIdentifier:", v9, v10, v13, v6);

  }
}

- (void)handleIDSMessageSentSuccessfullyWithId:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
      -[NNMKResendScheduler handleIDSMessageSentSuccessfullyWithId:].cold.1((uint64_t)v4, v6);
    -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markIDSIdentifierAsAckd:", v4);

    -[NNMKResendScheduler delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resendScheduler:didRequestDequeueIDSIdentifierForResend:", self, v4);

  }
}

- (void)deletePendingIDSMessagesForMailboxId:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v4 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = v44;
    _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "Deleting pending IDS messages for mailbox. (Id: %{public}@)", buf, 0xCu);
  }
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUpdates");

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectIdsForType:", CFSTR("InitialSync"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEqualToString:", v13))
        {
          -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deleteObjectId:fromIDSIdentifiersNotYetAckdOfType:", v13, CFSTR("InitialSync"));

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v10);
  }
  v43 = v8;

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectIdsForType:", CFSTR("Message"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v50 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "syncedMessageForMessageWithId:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24
          || (objc_msgSend(v24, "mailboxId"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v26 = objc_msgSend(v25, "isEqualToString:", v44),
              v25,
              v26))
        {
          -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "deleteObjectId:fromIDSIdentifiersNotYetAckdOfType:", v22, CFSTR("Message"));

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v19);
  }
  v42 = v17;

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectIdsForType:", CFSTR("MessageContent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
        -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "syncedMessageForMessageWithId:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37
          || (objc_msgSend(v37, "mailboxId"),
              v38 = (void *)objc_claimAutoreleasedReturnValue(),
              v39 = objc_msgSend(v38, "isEqualToString:", v44),
              v38,
              v39))
        {
          -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "deleteObjectId:fromIDSIdentifiersNotYetAckdOfType:", v35, CFSTR("MessageContent"));

        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v32);
  }

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "endUpdates");

}

- (id)messageTypeForIDSIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeForIDSIdentifierNotYetAckd:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectIdsForPendingIDSIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectIdsForIDSIdentifierNotYetAckd:type:resendInterval:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)resetInitialSyncResendInterval
{
  self->_initialSyncResendInterval = 0;
}

- (void)_executePendingResendsAndContentRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncedMessageIdsResendRequested");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    -[NNMKResendScheduler delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resendScheduler:didRequestRetrySendingMessageWithIds:", self, v4);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncedAccountIdsResendRequested");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[NNMKResendScheduler delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resendScheduler:didRequestRetrySendingAccountWithId:", self, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v9);
  }

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "syncedMessageIdsContentRequestedByUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          -[NNMKResendScheduler delegate](self, "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "resendScheduler:didRequestRetrySendingContentForMessageId:highPriority:", self, v21, 1);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v18);
    }
  }
  else
  {
    v32 = 0uLL;
    v33 = 0uLL;
    *((_QWORD *)&v30 + 1) = 0;
    v31 = 0uLL;
    -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstSyncedMessageIdsContentNotSyncedOrRequestedByUser:", 20);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v16);
          v28 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k);
          -[NNMKResendScheduler delegate](self, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "resendScheduler:didRequestRetrySendingContentForMessageId:highPriority:", self, v28, 0);

        }
        v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v25);
    }
  }

}

- (void)_failPendingComposedMessages
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pendingComposedMessageIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[NNMKResendScheduler delegate](self, "delegate", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resendScheduler:didRequestRetrySendingComposeMessageProgress:messageId:resendInterval:", self, -1, v10, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removePendingComposedMessages");

}

- (void)_scheduleIdsIdentifierForResend:(id)a3 currentResendInterval:(unint64_t)a4 newResendInterval:(unint64_t)a5 errorCode:(int64_t)a6
{
  void *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v9 = (void *)MEMORY[0x24BDBCE60];
  v10 = (double)a4;
  v11 = a3;
  objc_msgSend(v9, "dateWithTimeIntervalSinceNow:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rescheduleIDSIdentifier:resendInterval:withDateToResend:errorCode:", v11, a5, v14, a6);

  -[NNMKResendScheduler delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resendScheduler:didRequestEnqueueIDSIdentifierForResend:date:silent:", self, v11, v14, 0);

}

- (void)_resendObjectIds:(id)a3 type:(id)a4 resendInterval:(unint64_t)a5 idsIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138544130;
    v22 = v12;
    v23 = 2114;
    v24 = v11;
    v25 = 2114;
    v26 = v10;
    v27 = 2048;
    v28 = a5;
    _os_log_impl(&dword_22E161000, v13, OS_LOG_TYPE_DEFAULT, "Resending IDS messages. (IDS id: %{public}@, Type: %{public}@, objects: %{public}@, resend interval: %lu)", (uint8_t *)&v21, 0x2Au);
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("InitialSync")))
  {
    -[NNMKResendScheduler _resendInitialSyncWithIDSIdentifier:newResendInterval:mailboxIds:](self, "_resendInitialSyncWithIDSIdentifier:newResendInterval:mailboxIds:", v12, a5, v10);
    goto LABEL_23;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Message")))
  {
    -[NNMKResendScheduler _resendPendingMessagesWithIds:forIDSIdentifier:newResendInterval:](self, "_resendPendingMessagesWithIds:forIDSIdentifier:newResendInterval:", v10, v12, a5);
    goto LABEL_23;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("MessageContent")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("Account")))
    {
      -[NNMKResendScheduler _resendPendingAccountWithIds:forIDSIdentifier:newResendInterval:](self, "_resendPendingAccountWithIds:forIDSIdentifier:newResendInterval:", v10, v12, a5);
      goto LABEL_23;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("SendingProgress")))
    {
      objc_msgSend(v10, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKResendScheduler _resendSendingProgressForComposedMessageWithId:forIDSIdentifier:newResendInterval:](self, "_resendSendingProgressForComposedMessageWithId:forIDSIdentifier:newResendInterval:", v14, v12, a5);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("MailboxSelection")))
    {
      -[NNMKResendScheduler delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resendScheduler:didRequestRetrySendingMailboxSelectionWithResendInterval:", self, a5);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AccountIdentity")))
    {
      objc_msgSend(v10, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKResendScheduler delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resendScheduler:didRequestRetrySendingAccountIdentifier:resendInterval:", self, v14, a5);

    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("VIPList")))
        goto LABEL_23;
      -[NNMKResendScheduler delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resendScheduler:didRequestRetrySendingVIPListWithResendInterval:", self, a5);
    }
LABEL_22:

    goto LABEL_23;
  }
  if (objc_msgSend(v10, "count") == 2)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    -[NNMKResendScheduler _resendPendingMessageContentWithId:sentBecauseUserRequested:idsIdentifier:newResendInterval:](self, "_resendPendingMessageContentWithId:sentBecauseUserRequested:idsIdentifier:newResendInterval:", v14, v16, v12, a5);
    goto LABEL_22;
  }
  v17 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
    -[NNMKResendScheduler _resendObjectIds:type:resendInterval:idsIdentifier:].cold.1((uint64_t)v12, v17);
LABEL_23:
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "markIDSIdentifierAsAckd:", v12);

  -[NNMKResendScheduler delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resendScheduler:didRequestDequeueIDSIdentifierForResend:", self, v12);

}

- (void)_resendInitialSyncWithIDSIdentifier:(id)a3 newResendInterval:(unint64_t)a4 mailboxIds:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mailboxWithId:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    -[NNMKResendScheduler delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resendScheduler:didRequestRetryFullSyncForMailboxes:", self, v8);

    self->_initialSyncResendInterval = a4;
  }

}

- (void)_resendPendingMessagesWithIds:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NNMKProtoMessageDeletion *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NNMKProtoMessageDeletions *v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  unint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v45 = a4;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginUpdates");

  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v49;
    *(_QWORD *)&v10 = 138543362;
    v41 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v13);
        -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry", v41);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "syncedMessageForMessageWithId:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_msgSend(v16, "resendRequested");
          v18 = qword_253E87A90;
          v19 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              *(_DWORD *)buf = 138543874;
              v53 = v14;
              v54 = 2114;
              v55 = (uint64_t)v45;
              v56 = 2048;
              v57 = a5;
              _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Requested to resend message but a resend has already been requested. Ignoring. (Id: %{public}@ - Last IDS Identifier: %{public}@ - New Resend Interval: %lu)...", buf, 0x20u);
            }
          }
          else
          {
            if (v19)
            {
              *(_DWORD *)buf = 138543874;
              v53 = v14;
              v54 = 2114;
              v55 = (uint64_t)v45;
              v56 = 2048;
              v57 = a5;
              _os_log_impl(&dword_22E161000, v18, OS_LOG_TYPE_DEFAULT, "Resending Message (Id: %{public}@ - Last IDS Identifier: %{public}@ - New Resend Interval: %lu)...", buf, 0x20u);
            }
            if (objc_msgSend(v16, "usedNotificationPriorityForMessageSync"))
            {
              objc_msgSend(v16, "dateReceived");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "timeIntervalSinceNow");
              v31 = -v30;
              v32 = *(double *)&kIntervalBeforeDowngradingMessagesToDefaultPriority;

              if (v32 < v31)
              {
                v33 = qword_253E87A90;
                if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  v53 = kIntervalBeforeDowngradingMessagesToDefaultPriority;
                  v54 = 2114;
                  v55 = v14;
                  _os_log_impl(&dword_22E161000, v33, OS_LOG_TYPE_DEFAULT, "Message is older than %.0f seconds. Downgrading to Default Priority (Id: %{public}@).", buf, 0x16u);
                }
                objc_msgSend(v16, "setUsedNotificationPriorityForMessageSync:", 0);
              }
            }
            objc_msgSend(v16, "setResendRequested:", 1);
            objc_msgSend(v16, "setResendInterval:", a5);
            -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addOrUpdateSyncedMessage:", v16);

            -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "deleteObjectId:fromIDSIdentifiersNotYetAckdOfType:", v14, CFSTR("Message"));

            objc_msgSend(v42, "addObject:", v14);
          }
        }
        else
        {
          v20 = objc_alloc_init(NNMKProtoMessageDeletion);
          -[NNMKResendScheduler syncController](self, "syncController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "watchMessageIdFromMessageId:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoMessageDeletion setMessageId:](v20, "setMessageId:", v22);

          -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "mailboxIdForDeletedMessageId:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            goto LABEL_12;
          -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "mailboxWithId:", CFSTR("-1"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "mailboxId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
LABEL_12:
            objc_msgSend(v44, "objectForKeyedSubscript:", v24);
            v27 = (NNMKProtoMessageDeletions *)objc_claimAutoreleasedReturnValue();
            if (!v27)
            {
              v27 = objc_alloc_init(NNMKProtoMessageDeletions);
              objc_msgSend(v44, "setObject:forKeyedSubscript:", v27, v24);
            }
            -[NNMKProtoMessageDeletions addMessageDeletion:](v27, "addMessageDeletion:", v20);
            objc_msgSend(v43, "addObject:", v14);
            v28 = qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v53 = v14;
              v54 = 2114;
              v55 = (uint64_t)v45;
              v56 = 2048;
              v57 = a5;
              _os_log_impl(&dword_22E161000, v28, OS_LOG_TYPE_DEFAULT, "Resending Message Deletion (Id: %{public}@ - Last IDS Identifier: %{public}@ - New Resend Interval: %lu)...", buf, 0x20u);
            }

          }
          else
          {
            v36 = qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v41;
              v53 = v14;
              _os_log_error_impl(&dword_22E161000, v36, OS_LOG_TYPE_ERROR, "Could not find mailbox for deleted message with id %{public}@", buf, 0xCu);
            }
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      v11 = v37;
    }
    while (v37);
  }

  if (objc_msgSend(v42, "count"))
  {
    -[NNMKResendScheduler delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "resendScheduler:didRequestRetrySendingMessageWithIds:", self, v42);

  }
  if (objc_msgSend(v43, "count"))
  {
    -[NNMKResendScheduler delegate](self, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "resendScheduler:didRequestRetrySendingMessageDeletions:deletionsMessageIds:resendInterval:", self, v44, v43, a5);

  }
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "endUpdates");

}

- (void)_resendPendingMessageContentWithId:(id)a3 sentBecauseUserRequested:(BOOL)a4 idsIdentifier:(id)a5 newResendInterval:(unint64_t)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BYTE v28[24];
  uint64_t v29;
  uint64_t v30;

  v8 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginUpdates");

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncedMessageForMessageWithId:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (objc_msgSend(v14, "usedNotificationPriorityForMessageSync"))
    {
      objc_msgSend(v14, "dateReceived");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceNow");
      v17 = -v16;
      v18 = *(double *)&kIntervalBeforeDowngradingMessagesToDefaultPriority;

      if (v18 < v17)
      {
        v19 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v28 = 134218242;
          *(_QWORD *)&v28[4] = kIntervalBeforeDowngradingMessagesToDefaultPriority;
          *(_WORD *)&v28[12] = 2114;
          *(_QWORD *)&v28[14] = v10;
          _os_log_impl(&dword_22E161000, v19, OS_LOG_TYPE_DEFAULT, "Message is older than %.0f seconds. Downgrading to Default Priority (Id: %{public}@).", v28, 0x16u);
        }
        objc_msgSend(v14, "setUsedNotificationPriorityForMessageSync:", 0);
      }
    }
    if (v8)
    {
      objc_msgSend(v14, "setContentRequestedByUser:", 1);
      objc_msgSend(v14, "setContentSyncedUsingNotificationPriority:", 0);
      objc_msgSend(v14, "setContentSyncedBecauseUserRequested:", 0);
      objc_msgSend(v14, "setContentSynced:", 0);
    }
    else
    {
      objc_msgSend(v14, "setContentSyncedUsingNotificationPriority:", 0);
      objc_msgSend(v14, "setContentSyncedBecauseUserRequested:", 0);
      objc_msgSend(v14, "setContentSynced:", 0);
      if (!objc_msgSend(v14, "usedNotificationPriorityForMessageSync"))
      {
        objc_msgSend(v14, "setContentResendInterval:", 0);
        v25 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v28 = 138543618;
          *(_QWORD *)&v28[4] = v10;
          *(_WORD *)&v28[12] = 2114;
          *(_QWORD *)&v28[14] = v11;
          v22 = "Not resending content for message, as it's not for a notification and the user didn't request it (Id: %{"
                "public}@ - IDS Identifier: %{public}@).";
          v23 = v25;
          v24 = 22;
          goto LABEL_14;
        }
LABEL_15:
        -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry", *(_OWORD *)v28, *(_QWORD *)&v28[16], v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addOrUpdateSyncedMessage:", v14);

        goto LABEL_16;
      }
    }
    objc_msgSend(v14, "setContentResendInterval:", a6);
    -[NNMKResendScheduler delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resendScheduler:didRequestRetrySendingContentForMessageId:highPriority:", self, v10, v8);

    v21 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v28 = 138543874;
      *(_QWORD *)&v28[4] = v10;
      *(_WORD *)&v28[12] = 2114;
      *(_QWORD *)&v28[14] = v11;
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = v8;
      v22 = "Resending content for message (Id: %{public}@ - IDS Identifier: %{public}@ - User Requested: %d)...";
      v23 = v21;
      v24 = 28;
LABEL_14:
      _os_log_impl(&dword_22E161000, v23, OS_LOG_TYPE_DEFAULT, v22, v28, v24);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "endUpdates");

}

- (void)_resendPendingAccountWithIds:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24 = a4;
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginUpdates");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v26;
    *(_QWORD *)&v12 = 138543618;
    v23 = v12;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15);
        v17 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v30 = v16;
          v31 = 2114;
          v32 = v24;
          _os_log_impl(&dword_22E161000, v17, OS_LOG_TYPE_DEFAULT, "Resending account (Id: %{public}@ - IDS Identifier: %{public}@)...", buf, 0x16u);
        }
        -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "syncedAccountForAccountWithId:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v19, "setResendRequested:", 1);
          objc_msgSend(v19, "setResendInterval:", a5);
          -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addOrUpdateSyncedAccount:", v19);

          -[NNMKResendScheduler delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "resendScheduler:didRequestRetrySendingAccountWithId:", self, v16);
        }
        else
        {
          -[NNMKResendScheduler delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "resendScheduler:didRequestRetrySendingDeletionForAccountWithId:resendInterval:", self, v16, a5);
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "endUpdates");

}

- (void)_resendSendingProgressForComposedMessageWithId:(id)a3 forIDSIdentifier:(id)a4 newResendInterval:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_22E161000, v10, OS_LOG_TYPE_DEFAULT, "Resending progress for composed message (Id: %{public}@ - IDS Identifier: %{public}@)...", (uint8_t *)&v15, 0x16u);
  }
  -[NNMKResendScheduler deviceRegistry](self, "deviceRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "progressForComposedMessageWithId:", v8);

  if (v12)
    v13 = v12;
  else
    v13 = 0x7FFFFFFFLL;
  -[NNMKResendScheduler delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resendScheduler:didRequestRetrySendingComposeMessageProgress:messageId:resendInterval:", self, v13, v8, a5);

}

- (unint64_t)initialSyncResendInterval
{
  return self->_initialSyncResendInterval;
}

- (void)setInitialSyncResendInterval:(unint64_t)a3
{
  self->_initialSyncResendInterval = a3;
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerIDSIdentifier:(os_log_t)log objectIds:type:resendInterval:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_22E161000, log, OS_LOG_TYPE_DEBUG, "IDS message sent. (IDS Identifier: %{public}@, Type:%{public}@)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_15();
}

- (void)handleIDSMessageSentSuccessfullyWithId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_22E161000, a2, OS_LOG_TYPE_DEBUG, "IDS Message Sent Successfully (IDS Identifier: %{public}@).", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_15();
}

- (void)_resendObjectIds:(uint64_t)a1 type:(NSObject *)a2 resendInterval:idsIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_22E161000, a2, OS_LOG_TYPE_ERROR, "Error re-sending content, as object IDs were corrupt (IDS Identifier: %{public}@).", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_15();
}

@end
