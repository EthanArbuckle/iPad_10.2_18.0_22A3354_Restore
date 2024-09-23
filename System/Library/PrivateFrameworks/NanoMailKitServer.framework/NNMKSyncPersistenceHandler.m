@implementation NNMKSyncPersistenceHandler

- (void)setSyncStateManager:(id)a3
{
  objc_storeWeak((id *)&self->_syncStateManager, a3);
}

- (void)setSyncController:(id)a3
{
  objc_storeStrong((id *)&self->_syncController, a3);
}

- (void)setSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_sessionController, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setBatchRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_batchRequestHandler, a3);
}

- (id)addAccountAuthenticationStatusRequest:(double)a3
{
  NNMKProtoAccountAuthenticationStatusRequest *v4;

  v4 = objc_alloc_init(NNMKProtoAccountAuthenticationStatusRequest);
  -[NNMKProtoAccountAuthenticationStatusRequest setRequestTime:](v4, "setRequestTime:", a3);
  return v4;
}

- (id)persistAccounts:(id)a3
{
  id v4;
  NNMKProtoInitialAccountsSync *v5;
  id v6;
  uint64_t *v7;
  int *v8;
  uint64_t v9;
  void *v10;
  NNMKProtoAccountAdditionOrUpdate *v11;
  void *v12;
  void *v13;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  void *v31;
  char v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NNMKSyncPersistenceHandler *v39;
  int *v40;
  uint64_t *v41;
  uint64_t v42;
  unsigned int v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NNMKSyncedAccount *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v60;
  void *v61;
  NNMKProtoInitialAccountsSync *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSObject *log;
  NNMKProtoAccountAdditionOrUpdate *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(NNMKProtoInitialAccountsSync);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v6 = v4;
  v63 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  if (v63)
  {
    v60 = *(_QWORD *)v78;
    v7 = &__logCategories;
    v8 = &dword_22E161000;
    v61 = v6;
    v62 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v78 != v60)
          objc_enumerationMutation(v6);
        v65 = v9;
        v10 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v9);
        v11 = objc_alloc_init(NNMKProtoAccountAdditionOrUpdate);
        objc_msgSend(v10, "accountId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setAccountId:](v11, "setAccountId:", v12);

        objc_msgSend(v10, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setDisplayName:](v11, "setDisplayName:", v13);

        -[NNMKProtoAccountAdditionOrUpdate setShouldArchive:](v11, "setShouldArchive:", objc_msgSend(v10, "shouldArchive"));
        -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setFullSyncVersion:](v11, "setFullSyncVersion:", objc_msgSend(v14, "fullSyncVersion"));

        objc_msgSend(v10, "username");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setUsername:](v11, "setUsername:", v15);

        objc_msgSend(v10, "localId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setLocalId:](v11, "setLocalId:", v16);

        objc_msgSend(v10, "parentAccountIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setParentId:](v11, "setParentId:", v17);

        objc_msgSend(v10, "defaultEmailAddress");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setDefaultEmail:](v11, "setDefaultEmail:", v18);

        objc_msgSend(v10, "typeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setTypeIdentifier:](v11, "setTypeIdentifier:", v19);

        objc_msgSend(v10, "emailAddressToken");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setEmailAddressToken:](v11, "setEmailAddressToken:", v20);

        objc_msgSend(v10, "pccEmailAddress");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoAccountAdditionOrUpdate setPccEmailAddress:](v11, "setPccEmailAddress:", v21);

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v10, "emailAddresses");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v74 != v25)
                objc_enumerationMutation(v22);
              -[NNMKProtoAccountAdditionOrUpdate addEmail:](v11, "addEmail:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i), v60);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
          }
          while (v24);
        }

        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v64 = v10;
        objc_msgSend(v10, "mailboxes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
        if (v68)
        {
          v28 = *(_QWORD *)v70;
          v67 = v11;
          do
          {
            for (j = 0; j != v68; ++j)
            {
              if (*(_QWORD *)v70 != v28)
                objc_enumerationMutation(v27);
              v30 = *(id *)(*((_QWORD *)&v69 + 1) + 8 * j);
              -[NNMKSyncPersistenceHandler syncController](self, "syncController");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "canSyncMailbox:", v30);

              v33 = v7[1];
              v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
              if ((v32 & 1) != 0)
              {
                if (v34)
                {
                  log = v33;
                  objc_msgSend(v30, "mailboxId");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v30, "type");
                  v37 = v28;
                  v38 = v27;
                  v39 = self;
                  v40 = v8;
                  v41 = v7;
                  v42 = objc_msgSend(v30, "filterType");
                  v43 = objc_msgSend(v30, "syncEnabled");
                  *(_DWORD *)buf = 138544130;
                  v82 = v35;
                  v83 = 2048;
                  v84 = v36;
                  v85 = 2048;
                  v86 = v42;
                  v7 = v41;
                  v8 = v40;
                  self = v39;
                  v27 = v38;
                  v28 = v37;
                  v87 = 2048;
                  v88 = v43;
                  _os_log_impl(v8, log, OS_LOG_TYPE_DEFAULT, "Mailbox received. (Mailbox id: %{public}@, Type: %lu, Filter: %lu, Sync enabled: %lu)", buf, 0x2Au);

                }
                -[NNMKSyncPersistenceHandler delegate](self, "delegate", v60);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "pairedDeviceSupportsMultipleMailboxes");

                if ((v45 & 1) == 0)
                {
                  v46 = (void *)objc_msgSend(v30, "copy");

                  objc_msgSend(v46, "setSyncActive:", 0);
                  objc_msgSend(v46, "setSyncEnabled:", 0);
                  v30 = v46;
                }
                -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "addOrUpdateMailbox:", v30);

                +[NNMKProtoMailbox protoMailboxFromMailbox:](NNMKProtoMailbox, "protoMailboxFromMailbox:", v30);
                v48 = objc_claimAutoreleasedReturnValue();
                v11 = v67;
                -[NNMKProtoAccountAdditionOrUpdate addMailboxes:](v67, "addMailboxes:", v48);
              }
              else
              {
                if (!v34)
                  goto LABEL_27;
                v48 = v33;
                objc_msgSend(v30, "mailboxId");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v30, "type");
                *(_DWORD *)buf = 138543618;
                v82 = v49;
                v83 = 2048;
                v84 = v50;
                _os_log_impl(v8, v48, OS_LOG_TYPE_DEFAULT, "Mailbox will not be synced. (Id: %{public}@, Type: %lu)", buf, 0x16u);

              }
LABEL_27:

            }
            v68 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v89, 16);
          }
          while (v68);
        }

        v5 = v62;
        -[NNMKProtoInitialAccountsSync addInitialAccount:](v62, "addInitialAccount:", v11);
        -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = -[NNMKSyncedAccount initWithAccount:]([NNMKSyncedAccount alloc], "initWithAccount:", v64);
        objc_msgSend(v51, "addOrUpdateSyncedAccount:", v52);

        v9 = v65 + 1;
        v6 = v61;
      }
      while (v65 + 1 != v63);
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    }
    while (v63);
  }

  -[NNMKSyncPersistenceHandler delegate](self, "delegate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "pairedDeviceSupportsMultipleMailboxes");

  if ((v54 & 1) == 0)
    -[NNMKSyncPersistenceHandler _createDefaultMailbox:](self, "_createDefaultMailbox:", v6);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry", v60);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoInitialAccountsSync setFullSyncVersion:](v5, "setFullSyncVersion:", objc_msgSend(v55, "fullSyncVersion"));

  v56 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "archivedDataWithRootObject:requiringSecureCoding:error:", v57, 1, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoInitialAccountsSync setDateSynced:](v5, "setDateSynced:", v58);

  return v5;
}

- (void)_createDefaultMailbox:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NNMKMailbox *v7;
  NNMKMailboxSelection *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v17[16];

  v4 = a3;
  v5 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22E161000, v5, OS_LOG_TYPE_DEFAULT, "Creating default mailbox because device does not support multiple mailboxes", v17, 2u);
  }
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxWithId:", CFSTR("-1"));
  v7 = (NNMKMailbox *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(NNMKMailbox);
    -[NNMKMailbox setMailboxId:](v7, "setMailboxId:", CFSTR("-1"));
  }
  v8 = -[NNMKMailboxSelection initWithAccounts:]([NNMKMailboxSelection alloc], "initWithAccounts:", v4);
  -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabled](v8, "mailboxesWithAllMessagesSyncEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 == 1)
  {
    -[NNMKMailboxSelection mailboxesWithAllMessagesSyncEnabled](v8, "mailboxesWithAllMessagesSyncEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NNMKMailbox setType:](v7, "setType:", objc_msgSend(v12, "type"));
    -[NNMKMailbox setFilterType:](v7, "setFilterType:", objc_msgSend(v12, "filterType"));
    objc_msgSend(v12, "accountId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKMailbox setAccountId:](v7, "setAccountId:", v13);

    objc_msgSend(v12, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKMailbox setUrl:](v7, "setUrl:", v14);

    objc_msgSend(v12, "customName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKMailbox setCustomName:](v7, "setCustomName:", v15);

  }
  else
  {
    -[NNMKMailbox setFilterType:](v7, "setFilterType:", -[NNMKMailboxSelection aggregatedMailboxesFilterTypes](v8, "aggregatedMailboxesFilterTypes"));
    -[NNMKMailbox setType:](v7, "setType:", 1);
    -[NNMKMailbox resetURL](v7, "resetURL");
  }
  -[NNMKMailbox setSyncEnabled:](v7, "setSyncEnabled:", 1);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOrUpdateMailbox:", v7);

}

- (id)updateMailboxListForAccount:(id)a3 mailboxListChanged:(BOOL *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NNMKSyncPersistenceHandler *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  BOOL *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  char v84;
  NNMKSyncPersistenceHandler *v85;
  id v86;
  void *v87;
  id obj;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  uint64_t v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NNMKSyncPersistenceHandler delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pairedDeviceSupportsMultipleMailboxes");

  if ((v8 & 1) != 0)
  {
    v79 = a4;
    v85 = self;
    -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v6;
    objc_msgSend(v6, "accountId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxesForAccountId:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v98 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          objc_msgSend(v17, "mailboxId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v18);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
      }
      while (v14);
    }

    v19 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v80, "mailboxes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v86 = (id)objc_claimAutoreleasedReturnValue();

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    objc_msgSend(v80, "mailboxes");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
    v82 = v12;
    if (v21)
    {
      v22 = v21;
      v84 = 0;
      v23 = *(_QWORD *)v94;
      v24 = v85;
      v81 = *(_QWORD *)v94;
      do
      {
        v25 = 0;
        v83 = v22;
        do
        {
          if (*(_QWORD *)v94 != v23)
            objc_enumerationMutation(v87);
          v26 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v25);
          -[NNMKSyncPersistenceHandler syncController](v24, "syncController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "canSyncMailbox:", v26);

          if ((v28 & 1) != 0)
          {
            objc_msgSend(v26, "mailboxId");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "mailboxId");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObjectForKey:", v31);

            if (v30)
            {
              objc_msgSend(v30, "customName");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "customName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v32, "isEqualToString:", v33);

              v35 = objc_msgSend(v30, "syncEnabled");
              v36 = objc_msgSend(v26, "syncEnabled");
              objc_msgSend(v26, "url");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                objc_msgSend(v26, "url");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "url");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v38, "isEqual:", v39) ^ 1;

              }
              else
              {
                objc_msgSend(v30, "url");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = v38 != 0;
              }
              v50 = v34 ^ 1u;
              v51 = (void *)(v35 ^ v36);

              if (((v50 | v51) & 1) != 0 || v40)
              {
                v52 = (void *)qword_253E87A90;
                if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
                {
                  v53 = v52;
                  objc_msgSend(v26, "mailboxId");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v103 = v54;
                  v104 = 2048;
                  v105 = v50;
                  v106 = 2048;
                  v107 = v51;
                  v108 = 2048;
                  v109 = v40;
                  _os_log_impl(&dword_22E161000, v53, OS_LOG_TYPE_DEFAULT, "Mailbox updated. (Id: %{public}@, customNameChanged: %lu, syncEnabledChanged: %lu, urlChanged: %lu)", buf, 0x2Au);

                }
                if (v40)
                {
                  v55 = (void *)qword_253E87A90;
                  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
                  {
                    v56 = v55;
                    objc_msgSend(v26, "mailboxId");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "url");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "absoluteString");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "url");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "absoluteString");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v103 = v57;
                    v104 = 2114;
                    v105 = (uint64_t)v59;
                    v106 = 2114;
                    v107 = v61;
                    _os_log_impl(&dword_22E161000, v56, OS_LOG_TYPE_DEFAULT, "Mailbox URL changed. (Id: %{public}@, old URL: %{public}@, new URL: %{public}@)", buf, 0x20u);

                  }
                }
                objc_msgSend(v26, "customName");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setCustomName:", v62);

                objc_msgSend(v30, "setSyncEnabled:", objc_msgSend(v26, "syncEnabled"));
                objc_msgSend(v26, "url");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "setUrl:", v63);

                -[NNMKSyncPersistenceHandler currentDeviceRegistry](v85, "currentDeviceRegistry");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "addOrUpdateMailbox:", v30);

                v84 = 1;
              }
              +[NNMKProtoMailbox protoMailboxFromMailbox:](NNMKProtoMailbox, "protoMailboxFromMailbox:", v30);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "addObject:", v65);

              v24 = v85;
              v23 = v81;
              v12 = v82;
              v22 = v83;
            }
            else
            {
              -[NNMKSyncPersistenceHandler currentDeviceRegistry](v24, "currentDeviceRegistry");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addOrUpdateMailbox:", v26);

              +[NNMKProtoMailbox protoMailboxFromMailbox:](NNMKProtoMailbox, "protoMailboxFromMailbox:", v26);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "addObject:", v46);

              v47 = (void *)qword_253E87A90;
              if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
              {
                v48 = v47;
                objc_msgSend(v26, "mailboxId");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v103 = v49;
                _os_log_impl(&dword_22E161000, v48, OS_LOG_TYPE_DEFAULT, "Mailbox added. (Id: %{public}@)", buf, 0xCu);

              }
              v84 = 1;
            }

          }
          else
          {
            v41 = (void *)qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            {
              v42 = v41;
              objc_msgSend(v26, "mailboxId");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v26, "type");
              *(_DWORD *)buf = 138543618;
              v103 = v43;
              v104 = 2048;
              v105 = v44;
              _os_log_impl(&dword_22E161000, v42, OS_LOG_TYPE_DEFAULT, "Mailbox will not be synced. (Id: %{public}@, Type: %lu)", buf, 0x16u);

            }
          }
          ++v25;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
      }
      while (v22);
    }
    else
    {
      v84 = 0;
      v24 = v85;
    }

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v12, "allValues");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    v68 = v84;
    if (v67)
    {
      v69 = v67;
      v70 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v69; ++j)
        {
          if (*(_QWORD *)v90 != v70)
            objc_enumerationMutation(v66);
          v72 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
          -[NNMKSyncPersistenceHandler currentDeviceRegistry](v24, "currentDeviceRegistry");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "mailboxId");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "deleteMailboxWithId:", v74);

          v75 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v76 = v75;
            objc_msgSend(v72, "mailboxId");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v103 = v77;
            _os_log_impl(&dword_22E161000, v76, OS_LOG_TYPE_DEFAULT, "Mailbox deleted. (Id: %{public}@)", buf, 0xCu);

          }
        }
        v69 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
      }
      while (v69);
      v68 = 1;
      v12 = v82;
    }

    v6 = v80;
    if (v79)
      *v79 = v68 & 1;

  }
  else
  {
    v86 = 0;
    if (a4)
      *a4 = 0;
  }

  return v86;
}

- (id)addStandaloneAccountIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NNMKProtoStandaloneAccountIdentity *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;

  v4 = a3;
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
    goto LABEL_9;
  objc_msgSend(v4, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v4, "refreshToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountIdForUsername:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "username");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "syncedAccountForAccountWithId:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "accountId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v10, "length"))
    {
      -[NNMKSyncPersistenceHandler sessionController](self, "sessionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateStandaloneState:forAccountId:", 1, v10);

      v15 = objc_alloc_init(NNMKProtoStandaloneAccountIdentity);
      objc_msgSend(v4, "username");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoStandaloneAccountIdentity setUsername:](v15, "setUsername:", v16);

      objc_msgSend(v4, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoStandaloneAccountIdentity setDisplayName:](v15, "setDisplayName:", v17);

      objc_msgSend(v4, "token");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoStandaloneAccountIdentity setToken:](v15, "setToken:", v18);

      objc_msgSend(v4, "refreshToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoStandaloneAccountIdentity setRefreshToken:](v15, "setRefreshToken:", v19);

      -[NNMKProtoStandaloneAccountIdentity setIdentityType:](v15, "setIdentityType:", objc_msgSend(v4, "identityType"));
      objc_msgSend(v4, "accountId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoStandaloneAccountIdentity setAccountIdentifier:](v15, "setAccountIdentifier:", v20);

    }
    else
    {
      v22 = (void *)qword_253E87AA0;
      if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
        -[NNMKSyncPersistenceHandler addStandaloneAccountIdentity:].cold.2(v22, v4);
      v15 = 0;
    }

    goto LABEL_17;
  }
LABEL_10:
  v21 = qword_253E87AA0;
  if (os_log_type_enabled((os_log_t)qword_253E87AA0, OS_LOG_TYPE_ERROR))
    -[NNMKSyncPersistenceHandler addStandaloneAccountIdentity:].cold.1(v21);
  v15 = 0;
LABEL_17:

  return v15;
}

- (id)addMessages:(id)a3 containsNewMessages:(BOOL)a4 mailbox:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NNMKProtoMessageAdditions *v40;
  void *v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NNMKSyncedMessage *v52;
  void *v53;
  NNMKSyncedMessage *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  NSObject *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NNMKProtoMessageAdditions *v99;
  void *v100;
  NNMKProtoMessageAdditions *v101;
  unsigned int v102;
  id obj;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t buf[4];
  uint64_t v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  _BYTE v120[128];
  uint64_t v121;

  v6 = a4;
  v121 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  -[NNMKSyncPersistenceHandler syncController](self, "syncController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filterMessages:byAlreadySynced:byMailbox:", v8, 1, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v97 = v8;
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v102 = v6;
    if (!(_DWORD)v6)
      goto LABEL_4;
    objc_msgSend(v14, "dateReceived");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mailboxId");
    v18 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oldestDateReceivedForMailboxId:", v19);
    v20 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "compare:", v21);

    v9 = v20;
    v6 = v102;

    v15 = v18;
    if (v22 == -1)
    {
      v89 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        v90 = v89;
        v91 = objc_msgSend(v97, "count");
        objc_msgSend(v18, "dateReceived");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v111 = v91;
        v112 = 2114;
        v113 = v92;
        _os_log_impl(&dword_22E161000, v90, OS_LOG_TYPE_DEFAULT, "Dropping messages. Receiving an old batch of messages from MobileMail. Ignoring so we don't create a gap between the current messages we have and the old batch. (Count: %lu, Newest message received date: %{public}@", buf, 0x16u);

        v15 = v18;
      }
      objc_msgSend(v10, "setReceivedOldMessages:", 1);
      v8 = v97;
    }
    else
    {
LABEL_4:
      -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "beginUpdates");

      v99 = objc_alloc_init(NNMKProtoMessageAdditions);
      v101 = objc_alloc_init(NNMKProtoMessageAdditions);
      -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mailboxId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "oldestDateReceivedForMailboxId:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v27 = objc_msgSend(v13, "count");
        if ((unint64_t)(v27 - 1) >= 0x13)
          v28 = 19;
        else
          v28 = v27 - 1;
        objc_msgSend(v13, "objectAtIndexedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dateReceived");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoMessageAdditions setDateForRequestingMoreMessages:](v99, "setDateForRequestingMoreMessages:", v30);

        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoMessageAdditions setDateForRequestingMoreMessages:](v101, "setDateForRequestingMoreMessages:", v31);

        v32 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v32;
          objc_msgSend(v29, "dateReceived");
          v34 = v15;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v111 = (uint64_t)v35;
          _os_log_impl(&dword_22E161000, v33, OS_LOG_TYPE_DEFAULT, "New received messages changed date cap (New date: %{public}@).", buf, 0xCu);

          v15 = v34;
        }

      }
      v36 = objc_msgSend(v13, "count");
      -[NNMKSyncPersistenceHandler syncController](self, "syncController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "filterMessages:receivedBeforeDate:", v13, v26);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v38, "count") < v36)
        objc_msgSend(v10, "setReceivedOldMessages:", 1);
      v39 = objc_msgSend(v38, "count");
      v40 = v101;
      v41 = v38;
      v8 = v97;
      if (v39)
      {
        v94 = v15;
        v95 = v9;
        v96 = v10;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v41, "count"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v41, "count"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v93 = v41;
        obj = v41;
        v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
        if (!v105)
          goto LABEL_35;
        v104 = *(_QWORD *)v107;
        while (1)
        {
          for (i = 0; i != v105; ++i)
          {
            if (*(_QWORD *)v107 != v104)
              objc_enumerationMutation(obj);
            v43 = v26;
            v44 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
            v45 = (void *)qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            {
              v46 = v45;
              objc_msgSend(v44, "messageId");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "accountId");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "dateReceived");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v44, "status"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "messageIdHeader");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v111 = (uint64_t)v47;
              v112 = 2114;
              v113 = v48;
              v114 = 2114;
              v115 = v49;
              v116 = 2112;
              v117 = v50;
              v118 = 2114;
              v119 = v51;
              _os_log_impl(&dword_22E161000, v46, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: New)", buf, 0x34u);

              v6 = v102;
            }
            v52 = [NNMKSyncedMessage alloc];
            -[NNMKSyncPersistenceHandler delegate](self, "delegate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = -[NNMKSyncedMessage initWithMessage:useDefaultMailbox:](v52, "initWithMessage:useDefaultMailbox:", v44, objc_msgSend(v53, "pairedDeviceSupportsMultipleMailboxes") ^ 1);

            -[NNMKSyncedMessage setUsedProtectedChannelForMessageSync:](v54, "setUsedProtectedChannelForMessageSync:", 0);
            -[NNMKSyncPersistenceHandler sessionController](self, "sessionController");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v55, "deviceInStandalone"))
            {
              -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "accountId");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend(v56, "accountSourceTypeForAccountId:", v57) == 0;

            }
            else
            {
              v58 = 1;
            }

            if ((_DWORD)v6)
            {
              -[NNMKSyncPersistenceHandler syncStateManager](self, "syncStateManager");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "willPresentNotificationForMessage:", v44);

              if (v60)
              {
                -[NNMKSyncPersistenceHandler protoMessageFromMessage:](self, "protoMessageFromMessage:", v44);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[NNMKProtoMessageAdditions addMessageAddition:](v99, "addMessageAddition:", v61);

                objc_msgSend(v44, "messageId");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "addObject:", v62);
                v63 = 1;
LABEL_29:

                -[NNMKSyncedMessage setUsedNotificationPriorityForMessageSync:](v54, "setUsedNotificationPriorityForMessageSync:", v63);
                -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "addOrUpdateSyncedMessage:", v54);

                -[NNMKSyncPersistenceHandler sessionController](self, "sessionController");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "messageIdsToIgnoreStatusUpdates");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "messageId");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "removeObject:", v68);

                -[NNMKSyncPersistenceHandler batchRequestHandler](self, "batchRequestHandler");
                v69 = objc_claimAutoreleasedReturnValue();
                -[NSObject handleMessageAdded:](v69, "handleMessageAdded:", v44);
                goto LABEL_32;
              }
            }
            if (v58)
            {
              -[NNMKSyncPersistenceHandler protoMessageFromMessage:](self, "protoMessageFromMessage:", v44);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions addMessageAddition:](v101, "addMessageAddition:", v64);

              objc_msgSend(v44, "messageId");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "addObject:", v62);
              v63 = 0;
              goto LABEL_29;
            }
            v70 = (void *)qword_253E87A90;
            if (!os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
              goto LABEL_33;
            v69 = v70;
            objc_msgSend(v44, "accountId");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "messageId");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v111 = (uint64_t)v71;
            v112 = 2114;
            v113 = v72;
            _os_log_impl(&dword_22E161000, v69, OS_LOG_TYPE_DEFAULT, "Dropping message added because account source type does not allow sync. Account Id: %{public}@, Message Id: %{public}@", buf, 0x16u);

LABEL_32:
LABEL_33:

            v26 = v43;
          }
          v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
          if (!v105)
          {
LABEL_35:

            v9 = v95;
            if (-[NNMKProtoMessageAdditions messageAdditionsCount](v99, "messageAdditionsCount"))
            {
              objc_msgSend(v95, "mailboxId");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setMailboxId:](v99, "setMailboxId:", v73);

              -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "mailboxId");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setMailboxSyncVersion:](v99, "setMailboxSyncVersion:", objc_msgSend(v74, "syncVersionForMailboxId:", v75));

              -[NNMKProtoMessageAdditions setMessagesAreNew:](v99, "setMessagesAreNew:", v6);
              -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setFullSyncVersion:](v99, "setFullSyncVersion:", objc_msgSend(v76, "fullSyncVersion"));

              v77 = (void *)MEMORY[0x24BDD1618];
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "archivedDataWithRootObject:requiringSecureCoding:error:", v78, 1, 0);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setDateSynced:](v99, "setDateSynced:", v79);

            }
            v40 = v101;
            v10 = v96;
            v8 = v97;
            v15 = v94;
            if (-[NNMKProtoMessageAdditions messageAdditionsCount](v101, "messageAdditionsCount"))
            {
              objc_msgSend(v95, "mailboxId");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setMailboxId:](v101, "setMailboxId:", v80);

              -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "mailboxId");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setMailboxSyncVersion:](v101, "setMailboxSyncVersion:", objc_msgSend(v81, "syncVersionForMailboxId:", v82));

              -[NNMKProtoMessageAdditions setMessagesAreNew:](v101, "setMessagesAreNew:", v6);
              -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setFullSyncVersion:](v101, "setFullSyncVersion:", objc_msgSend(v83, "fullSyncVersion"));

              v84 = (void *)MEMORY[0x24BDD1618];
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "archivedDataWithRootObject:requiringSecureCoding:error:", v85, 1, 0);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[NNMKProtoMessageAdditions setDateSynced:](v101, "setDateSynced:", v86);

              v40 = v101;
            }
            objc_msgSend(v96, "setMessageIdsWithNotificationPriority:", v98);
            objc_msgSend(v96, "setMessageIdsWithDefaultPriority:", v100);
            objc_msgSend(v96, "setProtoMessagesWithNotificationPriority:", v99);
            objc_msgSend(v96, "setProtoMessagesWithDefaultPriority:", v40);

            v41 = v93;
            break;
          }
        }
      }
      -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "endUpdates");

      v13 = v41;
    }

  }
  return v10;
}

uint64_t __70__NNMKSyncPersistenceHandler_addMessages_containsNewMessages_mailbox___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "dateReceived");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateReceived");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)addMoreMessages:(id)a3 mailbox:(id)a4 isProtectedData:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  NNMKProtoMoreMessages *v11;
  void *v12;
  void *v13;
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
  uint64_t *v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t *v33;
  void *v34;
  void *v35;
  void *v36;
  NNMKSyncedMessage *v37;
  void *v38;
  NNMKSyncedMessage *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  uint64_t v46;
  NNMKProtoMoreMessages *v47;
  NNMKSyncPersistenceHandler *v48;
  unsigned int v49;
  id obj;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v5 = a5;
  v67 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginUpdates");

  v11 = objc_alloc_init(NNMKProtoMoreMessages);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessages setFullSyncVersion:](v11, "setFullSyncVersion:", objc_msgSend(v12, "fullSyncVersion"));

  v13 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessages setDateSynced:](v11, "setDateSynced:", v15);

  objc_msgSend(v9, "mailboxId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessages setMailboxId:](v11, "setMailboxId:", v16);

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v9;
  objc_msgSend(v9, "mailboxId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessages setMailboxSyncVersion:](v11, "setMailboxSyncVersion:", objc_msgSend(v17, "syncVersionForMailboxId:", v18));

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateReceived");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NNMKProtoMoreMessages setDateForRequestingMoreMessages:](v11, "setDateForRequestingMoreMessages:", v21);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v8;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
  if (v51)
  {
    v23 = *(_QWORD *)v53;
    v24 = &__logCategories;
    v49 = v5;
    v47 = v11;
    v48 = self;
    v46 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v27 = v24[1];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = v27;
          objc_msgSend(v26, "messageId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "accountId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dateReceived");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v26, "status"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "messageIdHeader");
          v33 = v24;
          v34 = v22;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v57 = v29;
          v58 = 2114;
          v59 = v30;
          v60 = 2114;
          v61 = v31;
          v62 = 2112;
          v63 = v32;
          v64 = 2114;
          v65 = v35;
          _os_log_impl(&dword_22E161000, v28, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: #LOAD_MORE_MESSAGES)", buf, 0x34u);

          v22 = v34;
          v24 = v33;

          v23 = v46;
          v11 = v47;
          self = v48;

          v5 = v49;
        }
        -[NNMKSyncPersistenceHandler protoMessageFromMessage:](self, "protoMessageFromMessage:", v26);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoMoreMessages addAddedMessage:](v11, "addAddedMessage:", v36);

        v37 = [NNMKSyncedMessage alloc];
        -[NNMKSyncPersistenceHandler delegate](self, "delegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[NNMKSyncedMessage initWithMessage:useDefaultMailbox:](v37, "initWithMessage:useDefaultMailbox:", v26, objc_msgSend(v38, "pairedDeviceSupportsMultipleMailboxes") ^ 1);

        -[NNMKSyncedMessage setUsedProtectedChannelForMessageSync:](v39, "setUsedProtectedChannelForMessageSync:", v5);
        -[NNMKSyncPersistenceHandler batchRequestHandler](self, "batchRequestHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleMessageAdded:", v26);

        -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addOrUpdateSyncedMessage:", v39);

        objc_msgSend(v26, "messageId");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v42);

      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    }
    while (v51);
  }

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "endUpdates");

  return v11;
}

- (id)addMoreConversationSpecificMessages:(id)a3 conversationId:(id)a4 mailbox:(id)a5 isProtectedData:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  NNMKProtoMoreMessagesForConversation *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NNMKSyncedMessage *v36;
  void *v37;
  NNMKSyncedMessage *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  unsigned int v46;
  NNMKProtoMoreMessagesForConversation *v47;
  NNMKSyncPersistenceHandler *v48;
  id obj;
  uint64_t v50;
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
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v6 = a6;
  v66 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginUpdates");

  v14 = objc_alloc_init(NNMKProtoMoreMessagesForConversation);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessagesForConversation setFullSyncVersion:](v14, "setFullSyncVersion:", objc_msgSend(v15, "fullSyncVersion"));

  v16 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessagesForConversation setDateSynced:](v14, "setDateSynced:", v18);

  v45 = v11;
  -[NNMKProtoMoreMessagesForConversation setConversationId:](v14, "setConversationId:", v11);
  objc_msgSend(v12, "mailboxId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessagesForConversation setMailboxId:](v14, "setMailboxId:", v19);

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v12;
  objc_msgSend(v12, "mailboxId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMoreMessagesForConversation setMailboxSyncVersion:](v14, "setMailboxSyncVersion:", objc_msgSend(v20, "syncVersionForMailboxId:", v21));

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v10;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v50)
  {
    v23 = *(_QWORD *)v52;
    v47 = v14;
    v48 = self;
    v46 = v6;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v26 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          objc_msgSend(v25, "messageId");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "accountId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dateReceived");
          v30 = v23;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v25, "status"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "messageIdHeader");
          v33 = v22;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v56 = v28;
          v57 = 2114;
          v58 = v29;
          v59 = 2114;
          v60 = v31;
          v61 = 2112;
          v62 = v32;
          v63 = 2114;
          v64 = v34;
          _os_log_impl(&dword_22E161000, v27, OS_LOG_TYPE_DEFAULT, "Message ADDED (Id: %{public}@ - Account Id: %{public}@ - Date Received: %{public}@ - Status: %@ - Message ID Header %{public}@ - Reason: #LOAD_MORE_MESSAGES for Conversation)", buf, 0x34u);

          v22 = v33;
          v23 = v30;

          v6 = v46;
          v14 = v47;
          self = v48;

        }
        -[NNMKSyncPersistenceHandler protoMessageFromMessage:](self, "protoMessageFromMessage:", v25);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NNMKProtoMoreMessagesForConversation addAddedMessage:](v14, "addAddedMessage:", v35);

        v36 = [NNMKSyncedMessage alloc];
        -[NNMKSyncPersistenceHandler delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[NNMKSyncedMessage initWithMessage:useDefaultMailbox:](v36, "initWithMessage:useDefaultMailbox:", v25, objc_msgSend(v37, "pairedDeviceSupportsMultipleMailboxes") ^ 1);

        -[NNMKSyncedMessage setUsedProtectedChannelForMessageSync:](v38, "setUsedProtectedChannelForMessageSync:", v6);
        -[NNMKSyncPersistenceHandler batchRequestHandler](self, "batchRequestHandler");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleMessageAdded:", v25);

        -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addOrUpdateSyncedMessage:", v38);

        objc_msgSend(v25, "messageId");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v41);

      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v50);
  }

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "endUpdates");

  return v14;
}

- (id)addMessagesToResend:(id)a3 mailbox:(id)a4 isProtectedData:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NNMKProtoMessageAdditions *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  NNMKSyncPersistenceHandler *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NNMKAdditionResult *v41;
  void *v42;
  NNMKProtoMessageAdditions *v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v5 = a5;
  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginUpdates");

  v41 = objc_alloc_init(NNMKAdditionResult);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(NNMKProtoMessageAdditions);
  -[NNMKProtoMessageAdditions setMessagesAreNew:](v11, "setMessagesAreNew:", 0);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageAdditions setFullSyncVersion:](v11, "setFullSyncVersion:", objc_msgSend(v12, "fullSyncVersion"));

  v13 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageAdditions setDateSynced:](v11, "setDateSynced:", v15);

  objc_msgSend(v9, "mailboxId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageAdditions setMailboxId:](v11, "setMailboxId:", v16);

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v9;
  objc_msgSend(v9, "mailboxId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageAdditions setMailboxSyncVersion:](v11, "setMailboxSyncVersion:", objc_msgSend(v17, "syncVersionForMailboxId:", v18));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v19 = v8;
  v47 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  v20 = 0;
  if (v47)
  {
    v46 = *(_QWORD *)v49;
    v43 = v11;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(v19);
        v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "messageId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "syncedMessageForMessageWithId:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 && objc_msgSend(v25, "resendRequested"))
        {
          if (!v20)
            v20 = objc_msgSend(v25, "resendInterval");
          objc_msgSend(v22, "setIsThreadSpecific:", objc_msgSend(v25, "isThreadSpecific"));
          objc_msgSend(v22, "setIsSpecialMailboxSpecific:", objc_msgSend(v25, "isSpecialMailboxSpecific"));
          v26 = objc_msgSend(v25, "resendInterval");
          if (v26 < v20)
            v20 = v26;
          objc_msgSend(v25, "setStatus:", objc_msgSend(v22, "status"));
          objc_msgSend(v25, "setResendRequested:", 0);
          objc_msgSend(v25, "setResendInterval:", 0);
          objc_msgSend(v25, "setUsedProtectedChannelForMessageSync:", v5);
          objc_msgSend(v25, "setUsedNotificationPriorityForMessageSync:", 0);
          -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addOrUpdateSyncedMessage:", v25);

          objc_msgSend(v22, "messageId");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v28);

          objc_msgSend(v22, "setStatusVersion:", objc_msgSend(v25, "statusVersion"));
          -[NNMKSyncPersistenceHandler protoMessageFromMessage:](self, "protoMessageFromMessage:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoMessageAdditions addMessageAddition:](v11, "addMessageAddition:", v29);

          v30 = (void *)qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            v31 = v30;
            objc_msgSend(v22, "messageId");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "dateReceived");
            v44 = v20;
            v33 = v19;
            v34 = self;
            v35 = v5;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v22, "status"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v22, "statusVersion");
            *(_DWORD *)buf = 138544130;
            v53 = v32;
            v54 = 2114;
            v55 = v36;
            v56 = 2112;
            v57 = v37;
            v58 = 2048;
            v59 = v38;
            _os_log_impl(&dword_22E161000, v31, OS_LOG_TYPE_DEFAULT, "Message being RESENT (Id: %{public}@ - Date Received: %{public}@ - Status: %@ - StatusVersion: %lu).", buf, 0x2Au);

            v5 = v35;
            self = v34;
            v19 = v33;
            v20 = v44;

            v11 = v43;
          }
        }

      }
      v47 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v47);
  }

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "endUpdates");

  -[NNMKAdditionResult setProtoMessagesWithDefaultPriority:](v41, "setProtoMessagesWithDefaultPriority:", v11);
  -[NNMKAdditionResult setMessageIdsWithDefaultPriority:](v41, "setMessageIdsWithDefaultPriority:", v45);
  -[NNMKAdditionResult setResendInterval:](v41, "setResendInterval:", v20);

  return v41;
}

- (id)updateMessagesStatus:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NNMKProtoMessageStatusUpdate *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  _BOOL4 v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void (**v75)(_QWORD, _QWORD);
  void *v76;
  __int128 v78;
  void *v79;
  void *v80;
  void *v81;
  NNMKProtoMessageStatusUpdates *v82;
  NNMKProtoMessageStatusUpdates *v83;
  NNMKProtoMessageStatusUpdates *v84;
  void *v85;
  void *v86;
  id obj;
  uint64_t v88;
  id v89;
  _QWORD v90[5];
  id v91;
  int v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  NSObject *v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginUpdates");

  v84 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  v83 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  v82 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
  if (v9)
  {
    v11 = v9;
    v88 = *(_QWORD *)v94;
    *(_QWORD *)&v10 = 138544130;
    v78 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v94 != v88)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        -[NNMKSyncPersistenceHandler sessionController](self, "sessionController", v78);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "messageIdsToIgnoreStatusUpdates");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "messageId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "containsObject:", v16);

        if (v17)
        {
          v18 = (void *)qword_253E87A90;
          if (!os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            continue;
          v19 = v18;
          objc_msgSend(v13, "messageId");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dateReceived");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v13, "status"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v98 = v20;
          v99 = 2114;
          v100 = v21;
          v101 = 2112;
          v102 = v22;
          _os_log_impl(&dword_22E161000, v19, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED but updates are being ignored for it. Dropping... (Id: %{public}@ - Date Received: %{public}@ - Status: %@).", buf, 0x20u);

        }
        else
        {
          -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "messageId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "syncedMessageForMessageWithId:", v24);
          v19 = objc_claimAutoreleasedReturnValue();

          -[NNMKSyncPersistenceHandler syncController](self, "syncController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          if (objc_msgSend(v25, "shouldAddsDeletesMessagesByStatusUpdatesForMailbox:", v7) && v19)
          {
            -[NNMKSyncPersistenceHandler syncController](self, "syncController");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v27, "isValidMessageStatus:forMailbox:", -[NSObject status](v19, "status"), v7) & 1) != 0)
            {
              v26 = 0;
            }
            else
            {
              -[NNMKSyncPersistenceHandler syncController](self, "syncController");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v28, "isValidMessageStatus:forMailbox:", objc_msgSend(v13, "status"), v7);

            }
          }

          if (!v19 || (v26 & 1) != 0)
          {
            -[NNMKSyncPersistenceHandler syncController](self, "syncController");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v33, "shouldAddsDeletesMessagesByStatusUpdatesForMailbox:", v7) & 1) != 0)
            {
              -[NNMKSyncPersistenceHandler syncController](self, "syncController");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "canSyncMessage:forMailbox:", v13, v7);

              if (v35)
              {
                v36 = (void *)qword_253E87A90;
                if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
                {
                  v37 = v36;
                  objc_msgSend(v13, "messageId");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "dateReceived");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v13, "status"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v98 = v38;
                  v99 = 2114;
                  v100 = v39;
                  v101 = 2112;
                  v102 = v40;
                  _os_log_impl(&dword_22E161000, v37, OS_LOG_TYPE_DEFAULT, "Received Message Status UPDATE, but it still hadn't been synced or it is about to be removed on the client. Will try to re-add message if not too old. (Id: %{public}@ - Date Received: %{public}@ - Status: %@).", buf, 0x20u);

                }
                -[NNMKSyncPersistenceHandler batchRequestHandler](self, "batchRequestHandler");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "messageId");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "mailboxId");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "handleMessageDeleted:mailboxId:", v42, v43);

                -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "messageId");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "removeSyncedMessageForMessageWithId:", v45);

                objc_msgSend(v86, "addObject:", v13);
                goto LABEL_42;
              }
            }
            else
            {

            }
            v46 = (void *)qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
            {
              v47 = v46;
              objc_msgSend(v13, "messageId");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "dateReceived");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v13, "status"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v78;
              v98 = v48;
              v99 = 2114;
              v100 = v49;
              v101 = 2112;
              v102 = v50;
              v103 = 2114;
              v104 = v19;
              _os_log_debug_impl(&dword_22E161000, &v47->super.super, OS_LOG_TYPE_DEBUG, "Dropping Message Status UPDATE. Message is not being tracked. (Id: %{public}@ - Date Received: %{public}@ - Status: %@ - MessageSynced: %{public}@).", buf, 0x2Au);

LABEL_41:
            }
          }
          else
          {
            v29 = -[NSObject status](v19, "status");
            if (v29 != objc_msgSend(v13, "status"))
            {
              -[NNMKSyncPersistenceHandler syncController](self, "syncController");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "isValidMessageStatus:forMailbox:", objc_msgSend(v13, "status"), v7);

              v53 = (void *)qword_253E87A90;
              v54 = os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT);
              if (v52)
              {
                if (v54)
                {
                  v55 = v53;
                  objc_msgSend(v13, "messageId");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v13, "status"));
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "dateReceived");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v98 = v56;
                  v99 = 2112;
                  v100 = v57;
                  v101 = 2114;
                  v102 = v58;
                  _os_log_impl(&dword_22E161000, v55, OS_LOG_TYPE_DEFAULT, "Message Status UPDATED (Id: %{public}@ - Status: %@ - Date Received: %{public}@ - Source: MobileMail).", buf, 0x20u);

                }
                -[NSObject setStatusVersion:](v19, "setStatusVersion:", -[NSObject statusVersion](v19, "statusVersion") + 1);
                -[NSObject setStatus:](v19, "setStatus:", objc_msgSend(v13, "status"));
                v47 = objc_alloc_init(NNMKProtoMessageStatusUpdate);
                -[NNMKSyncPersistenceHandler syncController](self, "syncController");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "messageId");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "watchMessageIdFromMessageId:", v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[NNMKProtoMessageStatusUpdate setMessageId:](v47, "setMessageId:", v61);

                -[NNMKProtoMessageStatusUpdate setUpdatedStatus:](v47, "setUpdatedStatus:", objc_msgSend(v13, "status"));
                -[NNMKProtoMessageStatusUpdate setStatusVersion:](v47, "setStatusVersion:", -[NSObject statusVersion](v19, "statusVersion"));
                if (-[NSObject usedProtectedChannelForMessageSync](v19, "usedProtectedChannelForMessageSync"))
                {
                  -[NNMKProtoMessageStatusUpdates addMessageStatusUpdate:](v84, "addMessageStatusUpdate:", v47);
                  objc_msgSend(v13, "messageId");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "addObject:", v62);

                }
                if (-[NSObject usedNotificationPriorityForMessageSync](v19, "usedNotificationPriorityForMessageSync"))
                {
                  -[NNMKProtoMessageStatusUpdates addMessageStatusUpdate:](v83, "addMessageStatusUpdate:", v47);
                  objc_msgSend(v13, "messageId");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = v80;
                }
                else
                {
                  -[NNMKProtoMessageStatusUpdates addMessageStatusUpdate:](v82, "addMessageStatusUpdate:", v47);
                  objc_msgSend(v13, "messageId");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = v79;
                }
                objc_msgSend(v64, "addObject:", v63);

                -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "addOrUpdateSyncedMessage:", v19);

                goto LABEL_41;
              }
              if (v54)
              {
                v65 = v53;
                objc_msgSend(v13, "messageId");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "dateReceived");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                +[NNMKMessage stringFromMailboxItemState:](NNMKMessage, "stringFromMailboxItemState:", objc_msgSend(v13, "status"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v98 = v66;
                v99 = 2114;
                v100 = v67;
                v101 = 2112;
                v102 = v68;
                _os_log_impl(&dword_22E161000, v65, OS_LOG_TYPE_DEFAULT, "Removing message that does not belong to current mailbox due to status change. (Id: %{public}@ - Date Received: %{public}@ - Status: %@).", buf, 0x20u);

              }
              objc_msgSend(v13, "messageId");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "addObject:", v69);

              -[NNMKSyncPersistenceHandler batchRequestHandler](self, "batchRequestHandler");
              v31 = objc_claimAutoreleasedReturnValue();
              -[NSObject handleMessageAdded:](v31, "handleMessageAdded:", v13);
              goto LABEL_38;
            }
            v30 = (void *)qword_253E87A90;
            if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
            {
              v31 = v30;
              objc_msgSend(v13, "messageId");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v98 = v32;
              _os_log_impl(&dword_22E161000, v31, OS_LOG_TYPE_DEFAULT, "Dropping Message Status UPDATE because status did not change. %{public}@", buf, 0xCu);

LABEL_38:
            }
          }
        }
LABEL_42:

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
    }
    while (v11);
  }

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "endUpdates");

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxId");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v72, "syncVersionForMailboxId:", v73);

  v90[0] = MEMORY[0x24BDAC760];
  v90[1] = 3221225472;
  v90[2] = __59__NNMKSyncPersistenceHandler_updateMessagesStatus_mailbox___block_invoke;
  v90[3] = &unk_24F9F6C08;
  v90[4] = self;
  v91 = v7;
  v92 = v74;
  v89 = v7;
  v75 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E327EE4](v90);
  ((void (**)(_QWORD, NNMKProtoMessageStatusUpdates *))v75)[2](v75, v84);
  ((void (**)(_QWORD, NNMKProtoMessageStatusUpdates *))v75)[2](v75, v83);
  ((void (**)(_QWORD, NNMKProtoMessageStatusUpdates *))v75)[2](v75, v82);
  v76 = (void *)objc_opt_new();
  objc_msgSend(v76, "setProtoMessageUpdatesWithNotificationPriority:", v83);
  objc_msgSend(v76, "setProtoMessageUpdatesWithDefaultPriority:", v82);
  objc_msgSend(v76, "setProtoMessageUpdatesWithDefaultPriorityAndProtectedChannel:", v84);
  objc_msgSend(v76, "setMessageIdsWithNotificationPriority:", v80);
  objc_msgSend(v76, "setMessageIdsWithDefaultPriority:", v79);
  objc_msgSend(v76, "setMessageIdsWithDefaultPriorityAndProtectedChannel:", v81);
  objc_msgSend(v76, "setMessagesToAdd:", v86);
  objc_msgSend(v76, "setMessageIdsToDelete:", v85);

  return v76;
}

void __59__NNMKSyncPersistenceHandler_updateMessagesStatus_mailbox___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "messageStatusUpdatesCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentDeviceRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFullSyncVersion:", objc_msgSend(v3, "fullSyncVersion"));

    v4 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDateSynced:", v6);

    objc_msgSend(*(id *)(a1 + 40), "mailboxId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMailboxId:", v7);

    objc_msgSend(v8, "setMailboxSyncVersion:", *(unsigned int *)(a1 + 48));
  }

}

- (id)deleteMessagesWithIds:(id)a3 mailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NNMKProtoMessageDeletion *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  NNMKProtoMessageDeletions *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void (**v36)(_QWORD, _QWORD);
  NNMKDeletionResult *v37;
  void *v38;
  uint64_t v40;
  id v41;
  void *v42;
  NNMKProtoMessageDeletions *v43;
  id obj;
  void *v45;
  void *v46;
  NNMKProtoMessageDeletions *v47;
  NNMKProtoMessageDeletions *v48;
  _QWORD v49[5];
  id v50;
  int v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginUpdates");

  v43 = objc_alloc_init(NNMKProtoMessageDeletions);
  v48 = objc_alloc_init(NNMKProtoMessageDeletions);
  v47 = objc_alloc_init(NNMKProtoMessageDeletions);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
    v40 = 138543362;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry", v40);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "syncedMessageForMessageWithId:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = qword_253E87A90;
          if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v40;
            v57 = v13;
            _os_log_impl(&dword_22E161000, v16, OS_LOG_TYPE_DEFAULT, "Message DELETED (Id: %{public}@).", buf, 0xCu);
          }
          v17 = objc_alloc_init(NNMKProtoMessageDeletion);
          -[NNMKSyncPersistenceHandler syncController](self, "syncController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "watchMessageIdFromMessageId:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoMessageDeletion setMessageId:](v17, "setMessageId:", v19);

          if (objc_msgSend(v15, "usedProtectedChannelForMessageSync"))
          {
            -[NNMKProtoMessageDeletions addMessageDeletion:](v43, "addMessageDeletion:", v17);
            objc_msgSend(v42, "addObject:", v13);
          }
          v20 = objc_msgSend(v15, "usedNotificationPriorityForMessageSync");
          v21 = v20 == 0;
          if (v20)
            v22 = v48;
          else
            v22 = v47;
          if (v21)
            v23 = v45;
          else
            v23 = v46;
          -[NNMKProtoMessageDeletions addMessageDeletion:](v22, "addMessageDeletion:", v17);
          objc_msgSend(v23, "addObject:", v13);
          -[NNMKSyncPersistenceHandler batchRequestHandler](self, "batchRequestHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "mailboxId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleMessageDeleted:mailboxId:", v13, v25);

          -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "mailboxId");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "insertDeletedMessageId:mailboxId:", v13, v27);

          -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "removeSyncedMessageForMessageWithId:", v13);

          -[NNMKSyncPersistenceHandler sessionController](self, "sessionController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "notificationPayloadAcks");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeObjectForKey:", v13);

        }
        -[NNMKSyncPersistenceHandler sessionController](self, "sessionController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "messageIdsToIgnoreStatusUpdates");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "removeObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v10);
  }

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "syncVersionForMailboxId:", v34);

  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __60__NNMKSyncPersistenceHandler_deleteMessagesWithIds_mailbox___block_invoke;
  v49[3] = &unk_24F9F6C30;
  v49[4] = self;
  v50 = v7;
  v51 = v35;
  v41 = v7;
  v36 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E327EE4](v49);
  ((void (**)(_QWORD, NNMKProtoMessageDeletions *))v36)[2](v36, v43);
  ((void (**)(_QWORD, NNMKProtoMessageDeletions *))v36)[2](v36, v48);
  ((void (**)(_QWORD, NNMKProtoMessageDeletions *))v36)[2](v36, v47);
  v37 = objc_alloc_init(NNMKDeletionResult);
  -[NNMKDeletionResult setProtectedProtobuf:](v37, "setProtectedProtobuf:", v43);
  -[NNMKDeletionResult setProtectedMessageIds:](v37, "setProtectedMessageIds:", v42);
  -[NNMKDeletionResult setUnprotectedNotificationProtobuf:](v37, "setUnprotectedNotificationProtobuf:", v48);
  -[NNMKDeletionResult setUnprotectedNotificationMessageIds:](v37, "setUnprotectedNotificationMessageIds:", v46);
  -[NNMKDeletionResult setUnprotectedDefaultProtobuf:](v37, "setUnprotectedDefaultProtobuf:", v47);
  -[NNMKDeletionResult setUnprotectedDefaultMessageIds:](v37, "setUnprotectedDefaultMessageIds:", v45);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "endUpdates");

  return v37;
}

void __60__NNMKSyncPersistenceHandler_deleteMessagesWithIds_mailbox___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "messageDeletionsCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentDeviceRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFullSyncVersion:", objc_msgSend(v3, "fullSyncVersion"));

    v4 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDateSynced:", v6);

    objc_msgSend(*(id *)(a1 + 40), "mailboxId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMailboxId:", v7);

    objc_msgSend(v8, "setMailboxSyncVersion:", *(unsigned int *)(a1 + 48));
  }

}

- (id)updateMessagesFromConversation:(id)a3 withState:(unint64_t)a4 include:(BOOL)a5 mailbox:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  void *v19;
  NNMKProtoMessageStatusUpdate *v20;
  uint64_t v21;
  _BOOL8 v22;
  unint64_t v23;
  NNMKSyncPersistenceHandler *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void (**v37)(_QWORD, _QWORD);
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NNMKProtoMessageStatusUpdates *v45;
  NNMKProtoMessageStatusUpdates *v46;
  NNMKProtoMessageStatusUpdates *v47;
  id v48;
  uint64_t v49;
  char v50;
  id obj;
  _QWORD v52[5];
  id v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v7 = a5;
  v60 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v48 = a6;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginUpdates");

  v47 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  v46 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  v45 = objc_alloc_init(NNMKProtoMessageStatusUpdates);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v10;
  objc_msgSend(v12, "syncedMessagesForConversationWithId:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v56;
    v17 = a4 != 128 || v7;
    v50 = v17;
    v49 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (((objc_msgSend(v19, "status") & a4) == 0) == v7)
        {
          if ((v50 & 1) != 0 || objc_msgSend(v48, "filterType") != 32)
          {
            objc_msgSend(v19, "setStatusVersion:", objc_msgSend(v19, "statusVersion") + 1);
            v21 = objc_msgSend(v19, "status");
            v22 = v7;
            if (v7)
              v23 = v21 | a4;
            else
              v23 = v21 ^ a4;
            objc_msgSend(v19, "setStatus:", v23);
            v20 = objc_alloc_init(NNMKProtoMessageStatusUpdate);
            v24 = self;
            -[NNMKSyncPersistenceHandler syncController](self, "syncController");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "messageId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "watchMessageIdFromMessageId:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NNMKProtoMessageStatusUpdate setMessageId:](v20, "setMessageId:", v27);

            -[NNMKProtoMessageStatusUpdate setUpdatedStatus:](v20, "setUpdatedStatus:", objc_msgSend(v19, "status"));
            -[NNMKProtoMessageStatusUpdate setStatusVersion:](v20, "setStatusVersion:", objc_msgSend(v19, "statusVersion"));
            if (objc_msgSend(v19, "usedProtectedChannelForMessageSync"))
            {
              -[NNMKProtoMessageStatusUpdates addMessageStatusUpdate:](v47, "addMessageStatusUpdate:", v20);
              objc_msgSend(v19, "messageId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v28);

            }
            if (objc_msgSend(v19, "usedNotificationPriorityForMessageSync"))
            {
              -[NNMKProtoMessageStatusUpdates addMessageStatusUpdate:](v46, "addMessageStatusUpdate:", v20);
              objc_msgSend(v19, "messageId");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v43;
            }
            else
            {
              -[NNMKProtoMessageStatusUpdates addMessageStatusUpdate:](v45, "addMessageStatusUpdate:", v20);
              objc_msgSend(v19, "messageId");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v42;
            }
            objc_msgSend(v30, "addObject:", v29);
            self = v24;
            v7 = v22;

            -[NNMKSyncPersistenceHandler currentDeviceRegistry](v24, "currentDeviceRegistry");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addOrUpdateSyncedMessage:", v19);

            v16 = v49;
          }
          else
          {
            objc_msgSend(v19, "messageId");
            v20 = (NNMKProtoMessageStatusUpdate *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v20);
          }

        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v15);
  }

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "endUpdates");

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "mailboxId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "syncVersionForMailboxId:", v34);

  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __87__NNMKSyncPersistenceHandler_updateMessagesFromConversation_withState_include_mailbox___block_invoke;
  v52[3] = &unk_24F9F6C08;
  v52[4] = self;
  v53 = v48;
  v54 = v35;
  v36 = v48;
  v37 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E327EE4](v52);
  ((void (**)(_QWORD, NNMKProtoMessageStatusUpdates *))v37)[2](v37, v47);
  ((void (**)(_QWORD, NNMKProtoMessageStatusUpdates *))v37)[2](v37, v46);
  ((void (**)(_QWORD, NNMKProtoMessageStatusUpdates *))v37)[2](v37, v45);
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setProtoMessageUpdatesWithNotificationPriority:", v46);
  objc_msgSend(v38, "setProtoMessageUpdatesWithDefaultPriority:", v45);
  objc_msgSend(v38, "setProtoMessageUpdatesWithDefaultPriorityAndProtectedChannel:", v47);
  objc_msgSend(v38, "setMessageIdsWithNotificationPriority:", v43);
  objc_msgSend(v38, "setMessageIdsWithDefaultPriority:", v42);
  objc_msgSend(v38, "setMessageIdsWithDefaultPriorityAndProtectedChannel:", v44);
  objc_msgSend(v38, "setMessageIdsToDelete:", v41);

  return v38;
}

void __87__NNMKSyncPersistenceHandler_updateMessagesFromConversation_withState_include_mailbox___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "messageStatusUpdatesCount"))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentDeviceRegistry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFullSyncVersion:", objc_msgSend(v3, "fullSyncVersion"));

    v4 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDateSynced:", v6);

    objc_msgSend(*(id *)(a1 + 40), "mailboxId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMailboxId:", v7);

    objc_msgSend(v8, "setMailboxSyncVersion:", *(unsigned int *)(a1 + 48));
  }

}

- (id)addMessageContent:(id)a3 forMessage:(id)a4 mailbox:(id)a5 isProtectedData:(BOOL)a6
{
  id v8;
  id v9;
  NNMKMessageContentResult *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NNMKProtoMessageContentSync *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  char v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  void *v72;
  NNMKProtoAttachmentMetadata *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  int v92;
  void *v93;
  void *v94;
  id v95;
  NNMKMessageContentResult *v96;
  id v97;
  uint64_t v98;
  void *v99;
  NNMKProtoMessageContentSync *v100;
  NNMKSyncPersistenceHandler *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t v106[128];
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(NNMKMessageContentResult);
  v101 = self;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syncedMessageForMessageWithId:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "usedNotificationPriorityForMessageSync");
  v15 = objc_msgSend(v13, "contentRequestedByUser");
  if ((v15 & 1) == 0)
  {
    if (v14)
      v16 = objc_msgSend(v13, "contentSyncedUsingNotificationPriority");
    else
      v16 = objc_msgSend(v13, "contentSynced");
    -[NNMKMessageContentResult setAlreadySyncedWithCurrentPriority:](v10, "setAlreadySyncedWithCurrentPriority:", v16);
  }
  -[NNMKMessageContentResult setMessageDoesNotExist:](v10, "setMessageDoesNotExist:", v13 == 0);
  if (!v13 || -[NNMKMessageContentResult alreadySyncedWithCurrentPriority](v10, "alreadySyncedWithCurrentPriority"))
    goto LABEL_71;
  v92 = v15;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](v101, "currentDeviceRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "beginUpdates");

  if (objc_msgSend(v8, "mainAlternativeValid"))
  {
    objc_msgSend(v9, "preview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_msgSend(v8, "hasTextData");
    objc_msgSend(v9, "preview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_15;
  }
  if ((unint64_t)objc_msgSend(v18, "length") >= 0x65)
  {
    v20 = qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEBUG))
      -[NNMKSyncPersistenceHandler addMessageContent:forMessage:mailbox:isProtectedData:].cold.1(v20);
    objc_msgSend(v18, "substringToIndex:", 100);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
LABEL_15:
  v96 = v10;
  v93 = v18;
  objc_msgSend(v18, "dataUsingEncoding:", 10);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "compressedData");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(NNMKProtoMessageContentSync);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](v101, "currentDeviceRegistry");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageContentSync setFullSyncVersion:](v23, "setFullSyncVersion:", objc_msgSend(v24, "fullSyncVersion"));

  v25 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageContentSync setDateSynced:](v23, "setDateSynced:", v27);

  -[NNMKSyncPersistenceHandler syncController](v101, "syncController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "watchMessageIdFromMessageId:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageContentSync setMessageId:](v23, "setMessageId:", v30);

  objc_msgSend(v9, "mailboxId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoMessageContentSync setMailboxId:](v23, "setMailboxId:", v31);

  -[NNMKProtoMessageContentSync setMainAlternativeValid:](v23, "setMainAlternativeValid:", objc_msgSend(v8, "mainAlternativeValid"));
  v89 = (void *)v22;
  -[NNMKProtoMessageContentSync setPreview:](v23, "setPreview:", v22);
  v100 = v23;
  -[NNMKProtoMessageContentSync setPartiallyLoaded:](v23, "setPartiallyLoaded:", objc_msgSend(v8, "partiallyLoaded"));
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](v101, "currentDeviceRegistry");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "supportsWebKit");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = v13;
  v88 = v33;
  if (v33)
  {
    v34 = objc_msgSend(v33, "BOOLValue");
    v35 = objc_msgSend(v33, "BOOLValue") ^ 1;
    if (!v34)
      goto LABEL_20;
  }
  else
  {
    v35 = 1;
  }
  if (!-[NNMKProtoMessageContentSync mainAlternativeValid](v100, "mainAlternativeValid"))
  {
    v36 = v9;
    objc_msgSend(v8, "htmlContentData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "compressedData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "htmlContentData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v39, "length") >> 21)
    {

    }
    else
    {
      if ((objc_msgSend(v38, "length") & 0xFFFFFFFFFFF00000) != 0)
        v40 = v14;
      else
        v40 = 0;

      if ((v40 & 1) == 0)
      {
        v41 = (void *)qword_253E87A90;
        if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_INFO))
        {
          v42 = v41;
          objc_msgSend(v8, "messageId");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "htmlContentData");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v108 = v43;
          v109 = 2048;
          v110 = objc_msgSend(v44, "length");
          v111 = 2048;
          v112 = objc_msgSend(v38, "length");
          _os_log_impl(&dword_22E161000, v42, OS_LOG_TYPE_INFO, "Message content will sync html content. %{public}@ - size: %lu - compressed: %lu", buf, 0x20u);

        }
        -[NNMKProtoMessageContentSync setHtmlContentData:](v100, "setHtmlContentData:", v38);
        v98 = objc_msgSend(v38, "length");

        v9 = v36;
        if ((v35 & 1) != 0)
          goto LABEL_36;
        goto LABEL_21;
      }
    }
    v45 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      objc_msgSend(v8, "messageId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "htmlContentData");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v108 = v47;
      v109 = 2048;
      v110 = objc_msgSend(v48, "length");
      v111 = 2048;
      v112 = objc_msgSend(v38, "length");
      _os_log_impl(&dword_22E161000, v46, OS_LOG_TYPE_DEFAULT, "Html Message content size is too large. It will sync text attribute instead. %{public}@ - size: %lu - compressed %lu", buf, 0x20u);

    }
    v98 = 0;
    v9 = v36;
    goto LABEL_36;
  }
LABEL_20:
  v98 = 0;
  if ((v35 & 1) != 0)
    goto LABEL_36;
LABEL_21:
  if (-[NNMKProtoMessageContentSync mainAlternativeValid](v100, "mainAlternativeValid"))
  {
LABEL_36:
    objc_msgSend(v8, "textData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "length");

    if (v50 >> 21)
    {
      v60 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
      {
        v61 = v60;
        objc_msgSend(v8, "messageId");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textData");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "length");
        *(_DWORD *)buf = 138543618;
        v108 = v62;
        v109 = 2048;
        v110 = v64;
        _os_log_impl(&dword_22E161000, v61, OS_LOG_TYPE_DEFAULT, "Message content too large won't sync. %{public}@ - size: %lu)", buf, 0x16u);

      }
      -[NNMKProtoMessageContentSync setMainAlternativeValid:](v100, "setMainAlternativeValid:", 0);
    }
    else
    {
      objc_msgSend(v8, "textData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "compressedData");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = (void *)qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_INFO))
      {
        v54 = v53;
        objc_msgSend(v8, "messageId");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "htmlContentData");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v14;
        v58 = objc_msgSend(v56, "length");
        v59 = objc_msgSend(v52, "length");
        *(_DWORD *)buf = 138543874;
        v108 = v55;
        v109 = 2048;
        v110 = v58;
        v14 = v57;
        v111 = 2048;
        v112 = v59;
        _os_log_impl(&dword_22E161000, v54, OS_LOG_TYPE_INFO, "Message content will sync text attribute. %{public}@ - size: %lu - compressed %lu", buf, 0x20u);

      }
      -[NNMKProtoMessageContentSync setText:](v100, "setText:", v52);
      v98 = objc_msgSend(v52, "length");

    }
  }
  v91 = v14;
  if (v14)
  {
    -[NNMKSyncPersistenceHandler protoMessageFromMessage:](v101, "protoMessageFromMessage:", v9);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NNMKProtoMessageContentSync setNotificationMessage:](v100, "setNotificationMessage:", v65);

  }
  v95 = v9;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v97 = v8;
  objc_msgSend(v8, "attachments");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v68; ++i)
      {
        if (*(_QWORD *)v103 != v69)
          objc_enumerationMutation(v66);
        v71 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v71, "contentId");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          v73 = objc_alloc_init(NNMKProtoAttachmentMetadata);
          objc_msgSend(v71, "fileName");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoAttachmentMetadata setFileName:](v73, "setFileName:", v74);

          -[NNMKProtoAttachmentMetadata setFileSize:](v73, "setFileSize:", objc_msgSend(v71, "fileSize"));
          -[NNMKProtoAttachmentMetadata setType:](v73, "setType:", objc_msgSend(v71, "type"));
          -[NNMKSyncPersistenceHandler syncController](v101, "syncController");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "contentId");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "watchAttachmentContentIdFromContentId:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoAttachmentMetadata setContentId:](v73, "setContentId:", v77);

          objc_msgSend(v71, "mimePartNumber");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[NNMKProtoAttachmentMetadata setMimePartNumber:](v73, "setMimePartNumber:", v78);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v79 = v71;
            if (objc_msgSend(v79, "renderOnClient"))
            {
              objc_msgSend(v79, "contentId");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "addObject:", v80);

            }
            -[NNMKProtoAttachmentMetadata setRenderOnClient:](v73, "setRenderOnClient:", objc_msgSend(v79, "renderOnClient"));
            objc_msgSend(v79, "imageSize");
            *(float *)&v81 = v81;
            -[NNMKProtoAttachmentMetadata setImageWidth:](v73, "setImageWidth:", v81);
            objc_msgSend(v79, "imageSize");
            *(float *)&v83 = v82;
            -[NNMKProtoAttachmentMetadata setImageHeight:](v73, "setImageHeight:", v83);
LABEL_57:

          }
          else if (objc_msgSend(v71, "isActionable"))
          {
            objc_msgSend(v71, "contentId");
            v79 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "addObject:", v79);
            goto LABEL_57;
          }
          -[NNMKProtoMessageContentSync addAttachment:](v100, "addAttachment:", v73);

          continue;
        }
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v102, v106, 16);
    }
    while (v68);
  }

  v13 = v94;
  if (!objc_msgSend(v94, "contentSynced") || objc_msgSend(v94, "contentRequestedByUser"))
    objc_msgSend(v94, "setAttachmentsContentIdsNotYetSynced:", v99);
  if (v91)
    objc_msgSend(v94, "setContentSyncedUsingNotificationPriority:", 1);
  v9 = v95;
  if (v92)
    objc_msgSend(v94, "setContentSyncedBecauseUserRequested:", 1);
  objc_msgSend(v94, "setContentSynced:", 1);
  v84 = objc_msgSend(v94, "contentResendInterval");
  objc_msgSend(v94, "setContentResendInterval:", 0);
  v8 = v97;
  if (objc_msgSend(v94, "isContentCompletelySynced"))
    objc_msgSend(v94, "setContentRequestedByUser:", 0);
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](v101, "currentDeviceRegistry");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "addOrUpdateSyncedMessage:", v94);

  -[NNMKSyncPersistenceHandler currentDeviceRegistry](v101, "currentDeviceRegistry");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "endUpdates");

  v10 = v96;
  -[NNMKMessageContentResult setProtoMessageContentSync:](v96, "setProtoMessageContentSync:", v100);
  -[NNMKMessageContentResult setResendInterval:](v96, "setResendInterval:", v84);
  -[NNMKMessageContentResult setCompressedTextDataLength:](v96, "setCompressedTextDataLength:", v98);
  -[NNMKMessageContentResult setIsContentCompletelySynced:](v96, "setIsContentCompletelySynced:", objc_msgSend(v94, "isContentCompletelySynced"));
  -[NNMKMessageContentResult setIsNotificationPriority:](v96, "setIsNotificationPriority:", objc_msgSend(v94, "contentSyncedUsingNotificationPriority"));
  -[NNMKMessageContentResult setIsUserRequest:](v96, "setIsUserRequest:", objc_msgSend(v94, "contentSyncedBecauseUserRequested"));

LABEL_71:
  return v10;
}

- (id)protoMessageFromMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[NNMKSyncPersistenceHandler currentDeviceRegistry](self, "currentDeviceRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "organizeByThread");
  -[NNMKSyncPersistenceHandler delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pairedDeviceSupportsMultipleMailboxes") ^ 1;
  -[NNMKSyncPersistenceHandler delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NNMKProtoMessage protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:](NNMKProtoMessage, "protoMessageFromMessage:organizedByThread:sanitizeMessageId:supportsStandaloneMode:", v4, v6, v8, objc_msgSend(v9, "pairedDeviceSupportsStandaloneMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)currentDeviceRegistry
{
  void *v2;
  void *v3;

  -[NNMKSyncPersistenceHandler delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NNMKDeviceRegistryHolder)delegate
{
  return (NNMKDeviceRegistryHolder *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NNMKSyncStateManager)syncStateManager
{
  return (NNMKSyncStateManager *)objc_loadWeakRetained((id *)&self->_syncStateManager);
}

- (NNMKSyncController)syncController
{
  return self->_syncController;
}

- (NNMKBatchRequestHandler)batchRequestHandler
{
  return self->_batchRequestHandler;
}

- (NNMKSyncSessionController)sessionController
{
  return self->_sessionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_batchRequestHandler, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_destroyWeak((id *)&self->_syncStateManager);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addStandaloneAccountIdentity:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Username, token or refreshToken is empty. Standalone account information won't be synced.", v1, 2u);
}

- (void)addStandaloneAccountIdentity:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_22E161000, v3, OS_LOG_TYPE_ERROR, "No account for username. Standalone account information won't be synced. %@", (uint8_t *)&v5, 0xCu);

}

- (void)addMessageContent:(os_log_t)log forMessage:mailbox:isProtectedData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22E161000, log, OS_LOG_TYPE_DEBUG, "Clipping message preview because text or main alternative is available", v1, 2u);
}

@end
