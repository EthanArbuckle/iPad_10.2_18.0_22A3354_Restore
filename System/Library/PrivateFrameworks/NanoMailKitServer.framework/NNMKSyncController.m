@implementation NNMKSyncController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canSyncMailbox:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "mailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    v6 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncController canSyncMailbox:].cold.1(v6, v3);
  }
  v7 = objc_msgSend(v3, "shouldFilter") ^ 1;
  if (v5)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_validateMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "accountId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "mailboxId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)filterMessages:(id)a3 byAlreadySynced:(BOOL)a4 byMailbox:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  __int128 v46;
  _BOOL4 v47;
  id v48;
  id v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v11 = objc_msgSend(v8, "count");
  v12 = v10;
  v13 = v9;
  objc_msgSend(v12, "arrayWithCapacity:", v11);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v52;
    *(_QWORD *)&v15 = 138543618;
    v46 = v15;
    v47 = v6;
    v48 = v9;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (-[NNMKSyncController _validateMessage:](self, "_validateMessage:", v19, v46))
        {
          if (v6)
          {
            -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "messageId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "containsSyncedMessageForMessageWithId:", v21);

            if (v22)
            {
              -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "messageId");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "syncedMessageForMessageWithId:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v19, "isThreadSpecific") & 1) != 0)
                v26 = 0;
              else
                v26 = objc_msgSend(v25, "isThreadSpecific");
              v33 = objc_msgSend(v19, "isSpecialMailboxSpecific");
              v34 = objc_msgSend(v25, "isSpecialMailboxSpecific");
              v35 = objc_msgSend(v19, "status");
              v36 = objc_msgSend(v25, "status");
              if (v33 == v34 && v35 == v36)
                v38 = v26;
              else
                v38 = 1;
              if (!v38)
              {
                v39 = (void *)qword_253E87A90;
                if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_INFO))
                {
                  v40 = v39;
                  objc_msgSend(v19, "messageId");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v56 = v41;
                  _os_log_impl(&dword_22E161000, v40, OS_LOG_TYPE_INFO, "Dropping message because it already exist. %{public}@", buf, 0xCu);

                }
              }

              v32 = v38 != 0;
              v6 = v47;
              v13 = v48;
            }
            else
            {
              v32 = 1;
            }
            if (!v13)
            {
LABEL_32:
              if (!v32)
                continue;
LABEL_33:
              objc_msgSend(v49, "addObject:", v19);
              continue;
            }
          }
          else
          {
            v32 = 1;
            if (!v13)
              goto LABEL_32;
          }
          if (!v32)
            goto LABEL_32;
          if (-[NNMKSyncController canSyncMessage:forMailbox:](self, "canSyncMessage:forMailbox:", v19, v13))
            goto LABEL_33;
          v42 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
          {
            v43 = v42;
            objc_msgSend(v19, "messageId");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v46;
            v56 = v44;
            v57 = 2114;
            v58 = v48;
            _os_log_debug_impl(&dword_22E161000, v43, OS_LOG_TYPE_DEBUG, "Dropping message because it does not belong to mailbox. Message: %{public}@, Mailbox: %{public}@", buf, 0x16u);

            v13 = v48;
            v6 = v47;
          }
        }
        else
        {
          v27 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
          {
            v28 = v27;
            objc_msgSend(v19, "messageId");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "accountId");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "mailboxId");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v56 = v29;
            v57 = 2114;
            v58 = v30;
            v59 = 2114;
            v60 = v31;
            _os_log_error_impl(&dword_22E161000, v28, OS_LOG_TYPE_ERROR, "Dropping message because it is missing identifiers. (id:%{public}@, a-id:%{public}@, ma-id:%{public}@)", buf, 0x20u);

          }
        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v16);
  }

  return v49;
}

- (id)removeInvalidMailboxesFromMailboxSelection:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NNMKMailboxSelection *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  objc_msgSend(v15, "allMailboxesSyncEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NNMKSyncController canSyncMailbox:](self, "canSyncMailbox:", v7))
      {
        v8 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          objc_msgSend(v7, "mailboxId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v17 = v10;
          _os_log_impl(&dword_22E161000, v9, OS_LOG_TYPE_DEFAULT, "Received invalid mailbox from mailbox selection. Id: %{public}@", buf, 0xCu);

        }
        if (!v5)
          v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
        objc_msgSend(v5, "addIndex:", v6);
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }
  if (objc_msgSend(v5, "count"))
  {
    v11 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v11, "removeObjectsAtIndexes:", v5);
    v12 = -[NNMKMailboxSelection initWithMailboxes:]([NNMKMailboxSelection alloc], "initWithMailboxes:", v11);

    v13 = v15;
  }
  else
  {
    v13 = v15;
    v12 = (NNMKMailboxSelection *)v15;
  }

  return v12;
}

- (id)filterMessages:(id)a3 receivedBeforeDate:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "dateReceived");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "compare:", v6);

          if (v15 == -1)
          {
            v16 = (void *)qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_INFO))
            {
              v17 = v16;
              objc_msgSend(v13, "messageId");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "dateReceived");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v27 = v6;
              v28 = 2114;
              v29 = v18;
              v30 = 2114;
              v31 = v19;
              _os_log_impl(&dword_22E161000, v17, OS_LOG_TYPE_INFO, "Dropping message because it is older than %{public}@. Id: %{public}@, Date: %{public}@", buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v10);
    }

    v5 = v21;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (BOOL)canSyncMessage:(id)a3 forMailbox:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  v8 = -[NNMKSyncController isMessage:fromMailbox:](self, "isMessage:fromMailbox:", v7, v6);
  if (objc_msgSend(v6, "filterType") == 64)
  {
    objc_msgSend(v7, "dateReceived");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v8 & objc_msgSend(v9, "nnmk_isToday");
  }
  else
  {
    v11 = objc_msgSend(v7, "status");

    v10 = -[NNMKSyncController isValidMessageStatus:forMailbox:](self, "isValidMessageStatus:forMailbox:", v11, v6)
       && v8;
  }

  return v10;
}

- (BOOL)isValidMessageStatus:(unint64_t)a3 forMailbox:(id)a4
{
  __int16 v4;
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;

  v4 = a3;
  v5 = a4;
  v6 = v5;
  if ((v4 & 0x600) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = 1;
    if ((objc_msgSend(v5, "hasFilterType:", 1) & 1) == 0)
    {
      if ((objc_msgSend(v6, "hasCompoundFilters") & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        v8 = objc_msgSend(v6, "hasFilterType:", 4) & ((v4 & 8) != 0);
        if (objc_msgSend(v6, "hasFilterType:", 8))
          v8 = (v4 & 1 | v8) != 0;
        else
          v8 = v8;
        if (objc_msgSend(v6, "hasFilterType:", 2))
          v8 = (v4 & 0x40 | v8) != 0;
        else
          v8 = v8;
        if (objc_msgSend(v6, "hasFilterType:", 16))
          v9 = (v4 & 0x20 | v8) != 0;
        else
          v9 = v8;
        v7 = v9;
        if (objc_msgSend(v6, "hasFilterType:", 32))
          v7 = (v4 & 0x80 | v9) != 0;
      }
    }
  }

  return v7;
}

- (BOOL)doesMessageBelongToSyncedMailboxes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncEnabledMailboxes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        if (-[NNMKSyncController isMessage:fromMailbox:](self, "isMessage:fromMailbox:", v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
        {

          v13 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    -[NNMKSyncController doesMessageBelongToSyncedMailboxes:].cold.1(v12, v4);
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)shouldAddsDeletesMessagesByStatusUpdatesForMailbox:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "filterType");
  return (v3 < 0x21) & (0x100000114uLL >> v3);
}

- (id)watchMessageIdFromMessageId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NNMKSyncController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pairedDeviceSupportsMultipleMailboxes");

  if ((v6 & 1) != 0)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(v4, "nnmk_sanitizedFileNameString");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)messageIdFromWatchMessageId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a3;
  -[NNMKSyncController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pairedDeviceSupportsMultipleMailboxes");

  if ((v6 & 1) != 0)
  {
    v7 = v4;
  }
  else
  {
    -[NNMKSyncController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDeviceRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageIdForSanitizedMessageId:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    if (!v10)
    {
      v12 = qword_253E87A90;
      v13 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR);
      v11 = v4;
      if (v13)
      {
        -[NNMKSyncController messageIdFromWatchMessageId:].cold.1((uint64_t)v4, v12, v14);
        v11 = v4;
      }
    }
    v7 = v11;

  }
  return v7;
}

- (id)watchAttachmentContentIdFromContentId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[NNMKSyncController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pairedDeviceSupportsMultipleMailboxes");

  v7 = v4;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "nnmk_sanitizedFileNameString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)isMessage:(id)a3 fromMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[NNMKSyncController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "pairedDeviceSupportsMultipleMailboxes"))
  {
    objc_msgSend(v7, "accountId");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v7, "mailboxId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_5;
    }
    else
    {

    }
    -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mailboxId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mailboxWithId:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v16 = objc_msgSend(v12, "type") == 1;
    else
      v16 = 0;
    goto LABEL_13;
  }

LABEL_5:
  objc_msgSend(v6, "accountId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", v13))
  {
    objc_msgSend(v6, "mailboxId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mailboxId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

  }
  else
  {
    v16 = 0;
  }

LABEL_13:
  return v16;
}

- (id)mailboxesToSync
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[NNMKSyncController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pairedDeviceSupportsMultipleMailboxes");

  if (v4)
  {
    -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncEnabledMailboxes");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NNMKSyncController mailboxWithId:](self, "mailboxWithId:", CFSTR("-1"));
    v7 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v7;
    if (!v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v10[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;
LABEL_6:

  return v8;
}

- (id)deviceRegistry
{
  void *v2;
  void *v3;

  -[NNMKSyncController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)groupMessagesByMailboxId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NNMKSyncController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pairedDeviceSupportsMultipleMailboxes");

  if (!v4 || (v7 & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "mailboxId", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "mailboxId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v19);

          }
          objc_msgSend(v18, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

  }
  else
  {
    v8 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
      -[NNMKSyncController groupMessagesByMailboxId:].cold.1(v8, v9, v10);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("-1"));
  }

  return v5;
}

- (void)groupMessagesByMailbox:(id)a3 mailboxes:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, void *);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t j;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *log;
  id obj;
  void *v44;
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
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, void *))a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v16, "mailboxId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v16, "mailboxId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v18);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v13);
  }

  v40 = v8;
  -[NNMKSyncController groupMessagesByMailboxId:](self, "groupMessagesByMailboxId:", v8);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v50;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v23);
        -[NNMKSyncController mailboxWithId:](self, "mailboxWithId:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "mailboxId");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObjectForKey:", v27);

          objc_msgSend(v44, "objectForKeyedSubscript:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, v28, v26);
LABEL_17:

          goto LABEL_19;
        }
        v29 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        {
          log = v29;
          objc_msgSend(v44, "objectForKeyedSubscript:", v24);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[NNMKMessage messageIdsFromMessages:](NNMKMessage, "messageIdsFromMessages:", v41);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v24;
          v60 = 2114;
          v61 = v30;
          v28 = log;
          _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Could not find mailbox for messages. (Mailbox: %{public}@, Dropping messages: %{public}@)", buf, 0x16u);

          goto LABEL_17;
        }
LABEL_19:

        ++v23;
      }
      while (v21 != v23);
      v31 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
      v21 = v31;
    }
    while (v31);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v11, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v46;
    v36 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        v39 = qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
          -[NNMKSyncController groupMessagesByMailbox:mailboxes:block:].cold.1(buf, &buf[1], v39);
        v10[2](v10, v36, v38);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v34);
  }

}

- (id)mailboxForMessageWithId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;

  v4 = a3;
  -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncedMessageForMessageWithId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mailboxId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncController mailboxWithId:](self, "mailboxWithId:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncController mailboxForMessageWithId:].cold.1((uint64_t)v4, v9, v10);
  }

  return v8;
}

- (id)mailboxWithId:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v4 = (__CFString *)a3;
  -[NNMKSyncController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "pairedDeviceSupportsMultipleMailboxes"))
  {
    v6 = -[__CFString length](v4, "length");

    if (v6)
    {
      -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = v4;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v10 = (void *)qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
    -[NNMKSyncController mailboxWithId:].cold.1(v10, self, (uint64_t)v4);
  -[NNMKSyncController deviceRegistry](self, "deviceRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = CFSTR("-1");
LABEL_8:
  objc_msgSend(v7, "mailboxWithId:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NNMKDeviceRegistryHolder)delegate
{
  return (NNMKDeviceRegistryHolder *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)canSyncMailbox:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_22(a1);
  objc_msgSend(a2, "mailboxId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, v3, v5, "It will not sync mailbox because it does not have a valid mailbox id: \"%{public}@\", (uint8_t *)&v6);

}

- (void)doesMessageBelongToSyncedMailboxes:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v3 = OUTLINED_FUNCTION_22(a1);
  objc_msgSend(a2, "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "mailboxId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_2_0(&dword_22E161000, v3, v6, "Dropping message because it does not belong to synced mailboxes. Id: %{public}@, mailboxId: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_4();
}

- (void)messageIdFromWatchMessageId:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, a2, a3, "Could not find message id for watch message id. Returning watch wessage id... %{public}@", (uint8_t *)&v3);
}

- (void)groupMessagesByMailboxId:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_3_0(&dword_22E161000, a1, a3, "Grouping message with default mailbox id. Multiple mailboxes is not supported with paired device", v3);
}

- (void)groupMessagesByMailbox:(uint8_t *)a1 mailboxes:(_BYTE *)a2 block:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_0(&dword_22E161000, a3, (uint64_t)a3, "Executing block for mailbox without messages", a1);
}

- (void)mailboxForMessageWithId:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_22E161000, a2, a3, "No mailbox for message id %{public}@", (uint8_t *)&v3);
}

- (void)mailboxWithId:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v5 = OUTLINED_FUNCTION_22(a1);
  objc_msgSend(a2, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = objc_msgSend(v6, "pairedDeviceSupportsMultipleMailboxes");
  v10 = 2114;
  v11 = a3;
  OUTLINED_FUNCTION_2_0(&dword_22E161000, v5, v7, "Retrieving default mailbox. (Paired device supports multiple mailboxes: %lu, MailboxId: %{public}@)", (uint8_t *)&v8);

  OUTLINED_FUNCTION_4();
}

@end
