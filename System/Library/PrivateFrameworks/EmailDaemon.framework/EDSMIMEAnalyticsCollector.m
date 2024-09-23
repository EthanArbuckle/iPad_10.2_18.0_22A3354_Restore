@implementation EDSMIMEAnalyticsCollector

- (EDSMIMEAnalyticsCollector)initWithAnalyticsCollector:(id)a3 smimeConfigurationProvider:(id)a4 messagePersistence:(id)a5
{
  id v8;
  id v9;
  id v10;
  EDSMIMEAnalyticsCollector *v11;
  EDSMIMEAnalyticsCollector *v12;
  id v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EDSMIMEAnalyticsCollector;
  v11 = -[EDSMIMEAnalyticsCollector init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_smimeConfigurationProvider, a4);
    objc_storeStrong((id *)&v12->_messagePersistence, a5);
    v13 = (id)objc_msgSend(v8, "registerForLogEventsWithPeriodicDataProvider:", v12);
  }

  return v12;
}

- (id)coreAnalyticsPeriodicEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[4];
  _QWORD v68[2];
  _QWORD v69[5];

  v69[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "ef_midnightNdaysAgo:", 30);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("date_received"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v58, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "greaterThan:", v4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSMIMEAnalyticsCollector messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailboxPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailboxObjectIDsForMailboxType:", 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDSMIMEAnalyticsCollector messagePersistence](self, "messagePersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailboxPersistence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mailboxDatabaseIDsForMailboxObjectIDs:createIfNecessary:", v56, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("mailbox"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "in:", v55);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v10, "initWithResult:table:", v11, v12);

  v13 = (void *)MEMORY[0x1E0D1EFB0];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flags"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFB0], "leftShift:by:", &unk_1E94E4B20, &unk_1E94E4B38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "and:with:", v14, v15);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v69[0] = v62;
  v69[1] = v64;
  v69[2] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v16, "initWithExpressions:", v17);

  objc_msgSend(v61, "setWhere:", v54);
  v18 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v18, "initWithResult:table:", v19, v20);

  v21 = (void *)MEMORY[0x1E0D1EFB0];
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("flags"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFB0], "leftShift:by:", &unk_1E94E4B20, &unk_1E94E4B50);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "and:with:", v22, v23);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v68[0] = v60;
  v68[1] = v64;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v24, "initWithExpressions:", v25);

  objc_msgSend(v59, "setWhere:", v53);
  v26 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "initWithResult:table:", v27, v28);

  v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F010]), "initWithExpression:", v62);
  v30 = objc_alloc(MEMORY[0x1E0D1EF90]);
  v67[0] = v60;
  v67[1] = v51;
  v67[2] = v64;
  v67[3] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithExpressions:", v31);

  objc_msgSend(v29, "setWhere:", v32);
  -[EDSMIMEAnalyticsCollector messagePersistence](self, "messagePersistence");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countOfMessageStatement:", v61);

  -[EDSMIMEAnalyticsCollector messagePersistence](self, "messagePersistence");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countOfMessageStatement:", v59);

  -[EDSMIMEAnalyticsCollector messagePersistence](self, "messagePersistence");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countOfMessageStatement:", v29);

  -[EDSMIMEAnalyticsCollector smimeConfigurationProvider](self, "smimeConfigurationProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "signingIsConfigured");
  v41 = objc_msgSend(v39, "encryptionIsConfigured");
  LODWORD(v21) = objc_msgSend(v39, "signingEnabledByDefault");
  v42 = v40 & v21 | v41 & objc_msgSend(v39, "encryptionIsEnabledByDefault");
  if (v34 < 1)
    v43 = 1;
  else
    v43 = v40;
  if (v43 == 1)
  {
    if (v36 > 0)
      v44 = v41 ^ 1u;
    else
      v44 = 0;
  }
  else
  {
    v44 = 1;
  }
  v65[0] = CFSTR("usesSMIME");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v42, v51);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v45;
  v65[1] = CFSTR("usesSMIMEButNotOnThisDevice");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v46;
  v65[2] = CFSTR("sendsEncryptedNotSignedMessages");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38 > 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.smime.usage"), v48);
  return v49;
}

- (EDSMIMEConfigurationProvider)smimeConfigurationProvider
{
  return self->_smimeConfigurationProvider;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_smimeConfigurationProvider, 0);
}

@end
