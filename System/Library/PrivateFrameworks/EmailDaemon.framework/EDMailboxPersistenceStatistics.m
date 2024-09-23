@implementation EDMailboxPersistenceStatistics

- (EDMailboxPersistenceStatistics)initWithMessagesInLargestMailbox:(int64_t)a3 messagesInSecondLargestMailbox:(int64_t)a4 messagesPerMailbox:(id)a5 mailboxesPerAccount:(id)a6 messagesPerAccount:(id)a7 accountTypePerAccount:(id)a8 messagesPerInbox:(id)a9 accountPerInbox:(id)a10
{
  id v16;
  id v17;
  EDMailboxPersistenceStatistics *v18;
  EDMailboxPersistenceStatistics *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v26.receiver = self;
  v26.super_class = (Class)EDMailboxPersistenceStatistics;
  v18 = -[EDMailboxPersistenceStatistics init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountTypePerAccount, a8);
    v19->_messagesInLargestMailbox = a3;
    v19->_messagesInSecondLargestMailbox = a4;
    objc_storeStrong((id *)&v19->_messagesPerMailbox, a5);
    objc_storeStrong((id *)&v19->_mailboxesPerAccount, a6);
    objc_storeStrong((id *)&v19->_messagesPerAccount, a7);
    objc_storeStrong((id *)&v19->_messagesPerInbox, a9);
    objc_storeStrong((id *)&v19->_accountPerInbox, a10);
  }

  return v19;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EDMailboxPersistenceStatistics messagesInLargestMailbox](self, "messagesInLargestMailbox"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Largest mailbox: %@ messages\n"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EDMailboxPersistenceStatistics messagesInSecondLargestMailbox](self, "messagesInSecondLargestMailbox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Second Largest mailbox: %@ messages\n"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("Mailboxes per account:\n"));
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[EDMailboxPersistenceStatistics mailboxesPerAccount](self, "mailboxesPerAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keysSortedByValueUsingComparator:", &__block_literal_global_29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v55;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v10);
        -[EDMailboxPersistenceStatistics mailboxesPerAccount](self, "mailboxesPerAccount");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@: %lu\n"), v11, objc_msgSend(v13, "count"));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("Messages per account:\n"));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[EDMailboxPersistenceStatistics messagesPerAccount](self, "messagesPerAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keysSortedByValueUsingComparator:", &__block_literal_global_12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v51;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v18);
        -[EDMailboxPersistenceStatistics messagesPerAccount](self, "messagesPerAccount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@: %@\n"), v19, v21);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("Messages per inbox:\n"));
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[EDMailboxPersistenceStatistics messagesPerInbox](self, "messagesPerInbox");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "keysSortedByValueUsingComparator:", &__block_literal_global_17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v47;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v23);
        v27 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v26);
        -[EDMailboxPersistenceStatistics messagesPerInbox](self, "messagesPerInbox");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@: %@\n"), v27, v29);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    }
    while (v24);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("Messages per mailbox:\n"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[EDMailboxPersistenceStatistics messagesPerMailbox](self, "messagesPerMailbox");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "keysSortedByValueUsingComparator:", &__block_literal_global_20);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v43;
LABEL_24:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v32)
        objc_enumerationMutation(obj);
      v34 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v33);
      -[EDMailboxPersistenceStatistics messagesPerMailbox](self, "messagesPerMailbox");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "integerValue") > 0;

      if (!v37)
        break;
      -[EDMailboxPersistenceStatistics messagesPerMailbox](self, "messagesPerMailbox");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\t%@: %@\n"), v34, v39);

      if (v31 == ++v33)
      {
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        if (v31)
          goto LABEL_24;
        break;
      }
    }
  }

  return (NSString *)v3;
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __50__EDMailboxPersistenceStatistics_debugDescription__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (NSString)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  id obja;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v44 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v44, "appendFormat:", CFSTR("Largest mailbox: %ld messages\n"), objc_msgSend(MEMORY[0x1E0D1EF48], "roundedInteger:", -[EDMailboxPersistenceStatistics messagesInLargestMailbox](self, "messagesInLargestMailbox")));
  objc_msgSend(v44, "appendFormat:", CFSTR("Second Largest mailbox: %ld messages\n"), objc_msgSend(MEMORY[0x1E0D1EF48], "roundedInteger:", -[EDMailboxPersistenceStatistics messagesInSecondLargestMailbox](self, "messagesInSecondLargestMailbox")));
  objc_msgSend(v44, "appendFormat:", CFSTR("Mailboxes per account:\n"));
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[EDMailboxPersistenceStatistics mailboxesPerAccount](self, "mailboxesPerAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keysSortedByValueUsingComparator:", &__block_literal_global_26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v58;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v58 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1E0D1EF48];
        -[EDMailboxPersistenceStatistics mailboxesPerAccount](self, "mailboxesPerAccount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "appendFormat:", CFSTR("\t%@: %ld\n"), v9, objc_msgSend(v10, "roundedInteger:", objc_msgSend(v12, "count")));

        ++v8;
      }
      while (v6 != v8);
      v4 = v5;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v6);
  }

  objc_msgSend(v44, "appendFormat:", CFSTR("Messages per account:\n"));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[EDMailboxPersistenceStatistics messagesPerAccount](self, "messagesPerAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keysSortedByValueUsingComparator:", &__block_literal_global_29);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v54;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v54 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1E0D1EF48];
        -[EDMailboxPersistenceStatistics messagesPerAccount](self, "messagesPerAccount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "appendFormat:", CFSTR("\t%@: %ld\n"), v17, objc_msgSend(v18, "roundedInteger:", objc_msgSend(v20, "integerValue")));

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v14);
  }

  objc_msgSend(v44, "appendFormat:", CFSTR("Messages per inbox:\n"));
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[EDMailboxPersistenceStatistics messagesPerInbox](self, "messagesPerInbox");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keysSortedByValueUsingComparator:", &__block_literal_global_30_0);
  obja = (id)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v50;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v50 != v23)
          objc_enumerationMutation(obja);
        v25 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v24);
        v26 = (void *)MEMORY[0x1E0D1EF48];
        -[EDMailboxPersistenceStatistics messagesPerInbox](self, "messagesPerInbox");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "appendFormat:", CFSTR("\t%@: %ld\n"), v25, objc_msgSend(v26, "roundedInteger:", objc_msgSend(v28, "integerValue")));

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    }
    while (v22);
  }

  objc_msgSend(v44, "appendFormat:", CFSTR("Messages per mailbox:\n"));
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[EDMailboxPersistenceStatistics messagesPerMailbox](self, "messagesPerMailbox");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "keysSortedByValueUsingComparator:", &__block_literal_global_31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v46;
LABEL_24:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v32)
        objc_enumerationMutation(v30);
      v34 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v33);
      -[EDMailboxPersistenceStatistics messagesPerMailbox](self, "messagesPerMailbox");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "integerValue") > 0;

      if (!v37)
        break;
      v38 = (void *)MEMORY[0x1E0D1EF48];
      -[EDMailboxPersistenceStatistics messagesPerMailbox](self, "messagesPerMailbox");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "appendFormat:", CFSTR("\t%@: %ld\n"), v34, objc_msgSend(v38, "roundedInteger:", objc_msgSend(v40, "integerValue")));

      if (v31 == ++v33)
      {
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
        if (v31)
          goto LABEL_24;
        break;
      }
    }
  }

  return (NSString *)v44;
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __53__EDMailboxPersistenceStatistics_redactedDescription__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (NSDictionary)accountTypePerAccount
{
  return self->_accountTypePerAccount;
}

- (NSDictionary)accountPerInbox
{
  return self->_accountPerInbox;
}

- (int64_t)messagesInLargestMailbox
{
  return self->_messagesInLargestMailbox;
}

- (int64_t)messagesInSecondLargestMailbox
{
  return self->_messagesInSecondLargestMailbox;
}

- (NSDictionary)messagesPerMailbox
{
  return self->_messagesPerMailbox;
}

- (NSDictionary)mailboxesPerAccount
{
  return self->_mailboxesPerAccount;
}

- (NSDictionary)messagesPerAccount
{
  return self->_messagesPerAccount;
}

- (NSDictionary)messagesPerInbox
{
  return self->_messagesPerInbox;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesPerInbox, 0);
  objc_storeStrong((id *)&self->_messagesPerAccount, 0);
  objc_storeStrong((id *)&self->_mailboxesPerAccount, 0);
  objc_storeStrong((id *)&self->_messagesPerMailbox, 0);
  objc_storeStrong((id *)&self->_accountPerInbox, 0);
  objc_storeStrong((id *)&self->_accountTypePerAccount, 0);
}

@end
