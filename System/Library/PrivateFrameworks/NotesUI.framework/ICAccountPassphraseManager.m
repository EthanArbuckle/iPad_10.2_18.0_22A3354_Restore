@implementation ICAccountPassphraseManager

- (ICAccountPassphraseManager)initWithAccount:(id)a3
{
  id v5;
  ICAccountPassphraseManager *v6;
  ICAccountPassphraseManager *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICAccountPassphraseManager;
  v6 = -[ICAccountPassphraseManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

  }
  return v7;
}

- (BOOL)setPassphrase:(id)a3 hint:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICAccountPassphraseManager setPassphrase:hint:].cold.1(self, v6, v8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D635C0];
  -[ICAccountPassphraseManager account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", v10, v11);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "crossProcessChangeCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postCrossProcessNotificationName:", v10);

  LOBYTE(v12) = -[ICAccountPassphraseManager setPassphrase:hint:isReset:](self, "setPassphrase:hint:isReset:", v7, v6, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D635A0];
  -[ICAccountPassphraseManager account](self, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", v15, v16);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "crossProcessChangeCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postCrossProcessNotificationName:", v15);

  return (char)v12;
}

- (BOOL)setPassphrase:(id)a3 hint:(id)a4 isReset:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[ICAccountPassphraseManager account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cryptoStrategy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPassphraseSet");

  objc_msgSend(MEMORY[0x1E0D63AA8], "sharedController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancelAndWaitWithReason:", CFSTR("Setting passphrase"));

  -[ICAccountPassphraseManager account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "isPassphraseCorrect:", v8);

  if ((_DWORD)v11)
  {
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:].cold.1(self, v15);
    v16 = 1;
LABEL_13:
    v22 = v15;
    goto LABEL_18;
  }
  -[ICAccountPassphraseManager account](self, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cryptoStrategy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "setPassphrase:hint:", v8, v9);

  if ((v19 & 1) == 0)
  {
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:].cold.4(self, v15);
    v16 = 0;
    goto LABEL_13;
  }
  v20 = os_log_create("com.apple.notes", "Analytics");
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if ((v12 & 1) != 0)
  {
    if (v21)
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:].cold.2(self, v5, v20);

    objc_msgSend(MEMORY[0x1E0D63B48], "incrementRecentPasswordChangeCountAsReset:", v5);
  }
  else
  {
    if (v21)
      -[ICAccountPassphraseManager setPassphrase:hint:isReset:].cold.3(self, v20);

  }
  objc_msgSend(MEMORY[0x1E0D63C18], "sharedController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccountPassphraseManager account](self, "account");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "enrollInReaskForAccount:", v24);

  -[ICAccountPassphraseManager account](self, "account");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "managedObjectContext");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = -[NSObject ic_saveWithLogDescription:](v15, "ic_saveWithLogDescription:", CFSTR("Set account passphrase"));
LABEL_18:

  return v16;
}

- (void)changePassphrase:(id)a3 toPassphrase:(id)a4 hint:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
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
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _BYTE location[12];
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v48 = a5;
  v12 = a6;
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[ICAccountPassphraseManager account](self, "account");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "shortLoggingDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "length") != 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v48, "length") != 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138413314;
    *(_QWORD *)&location[4] = v45;
    v53 = 2112;
    v54 = v46;
    v55 = 2112;
    v57 = 2080;
    v56 = v47;
    v58 = "-[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:]";
    v59 = 1024;
    v60 = 104;
    _os_log_debug_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_DEBUG, "Changing passphrase for account… {account: %@, hasDivergedKey: %@, hasHint: %@}%s:%d", location, 0x30u);

  }
  -[ICAccountPassphraseManager window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.window");
  if (v10
    && (-[ICAccountPassphraseManager account](self, "account"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "cryptoStrategy"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "authenticateWithPassphrase:", v10),
        v17,
        v16,
        (v18 & 1) == 0))
  {
    v38 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:].cold.2(self, v38);

    if (v12)
      goto LABEL_13;
  }
  else
  {
    -[ICAccountPassphraseManager account](self, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isAuthenticated");

    if ((v20 & 1) != 0)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0D63AB0]);
      objc_msgSend(v21, "setPassphrase:", v11);
      objc_msgSend(v21, "setDivergedPassphrase:", v10);
      objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccountPassphraseManager account](self, "account");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cachedMainKeyForIdentifier:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDivergedV1MainKey:", v25);

      objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccountPassphraseManager account](self, "account");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "accountDataCreateIfNecessary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "cachedMainKeyForIdentifier:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDivergedV1NeoMainKey:", v30);

      objc_msgSend(v21, "setIncludeAllAuthenticatedObjects:", 1);
      objc_msgSend(v21, "setUserInitiated:", 1);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccountPassphraseManager account](self, "account");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x1E0D635C0];
      objc_msgSend(v31, "postNotificationName:object:", *MEMORY[0x1E0D635C0], v32);

      objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "crossProcessChangeCoordinator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "postCrossProcessNotificationName:", v33);

      if (-[ICAccountPassphraseManager setPassphrase:hint:isReset:](self, "setPassphrase:hint:isReset:", v11, v48, 0))
      {
        -[ICAccountPassphraseManager account](self, "account");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)location, v36);

        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __76__ICAccountPassphraseManager_changePassphrase_toPassphrase_hint_completion___block_invoke;
        v49[3] = &unk_1E5C231E0;
        objc_copyWeak(&v51, (id *)location);
        v50 = v12;
        -[ICAccountPassphraseManager updateDivergedNotesWithConfiguration:completion:](self, "updateDivergedNotesWithConfiguration:completion:", v21, v49);

        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)location);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAccountPassphraseManager account](self, "account");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *MEMORY[0x1E0D635A0];
        objc_msgSend(v39, "postNotificationName:object:", *MEMORY[0x1E0D635A0], v40);

        objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "crossProcessChangeCoordinator");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "postCrossProcessNotificationName:", v41);

        if (v12)
          (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
      }

      goto LABEL_21;
    }
    v37 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[ICAccountPassphraseManager changePassphrase:toPassphrase:hint:completion:].cold.1(self, v37);

    if (v12)
LABEL_13:
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }
LABEL_21:

}

uint64_t __76__ICAccountPassphraseManager_changePassphrase_toPassphrase_hint_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D635A0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "postNotificationName:object:", v3, WeakRetained);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "crossProcessChangeCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postCrossProcessNotificationName:", v3);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)removePassphrase
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICAccountPassphraseManager removePassphrase].cold.1(self);

  objc_msgSend(MEMORY[0x1E0D63AA8], "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAndWaitWithReason:", CFSTR("Removing passphrase"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D635C0];
  -[ICAccountPassphraseManager account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", v6, v7);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "crossProcessChangeCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postCrossProcessNotificationName:", v6);

  -[ICAccountPassphraseManager account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cryptoStrategy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removePassphrase");

  -[ICAccountPassphraseManager account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v13, "ic_saveWithLogDescription:", CFSTR("Removed account passphrase"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D635A0];
  -[ICAccountPassphraseManager account](self, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", v15, v16);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "crossProcessChangeCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postCrossProcessNotificationName:", v15);

  return (char)v10;
}

- (void)updateDivergedNotesFromPassphrase:(id)a3 toAccountPassphrase:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ICAccountPassphraseManager updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:].cold.2(self);

  -[ICAccountPassphraseManager window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.window) != nil)", "-[ICAccountPassphraseManager updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.window");
  -[ICAccountPassphraseManager account](self, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cryptoStrategy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "authenticateWithPassphrase:", v9);

  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0D635C0];
    -[ICAccountPassphraseManager account](self, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", v17, v18);

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "crossProcessChangeCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postCrossProcessNotificationName:", v17);

    v21 = objc_alloc_init(MEMORY[0x1E0D63AB0]);
    objc_msgSend(v21, "setPassphrase:", v9);
    objc_msgSend(v21, "setDivergedPassphrase:", v8);
    objc_msgSend(v21, "setIncludeAllAuthenticatedObjects:", 1);
    objc_msgSend(v21, "setUserInitiated:", 1);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __95__ICAccountPassphraseManager_updateDivergedNotesFromPassphrase_toAccountPassphrase_completion___block_invoke;
    v23[3] = &unk_1E5C21CC8;
    v23[4] = self;
    v24 = v10;
    -[ICAccountPassphraseManager updateDivergedNotesWithConfiguration:completion:](self, "updateDivergedNotesWithConfiguration:completion:", v21, v23);

  }
  else
  {
    v22 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[ICAccountPassphraseManager updateDivergedNotesFromPassphrase:toAccountPassphrase:completion:].cold.1(self, v22);

    if (v10)
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __95__ICAccountPassphraseManager_updateDivergedNotesFromPassphrase_toAccountPassphrase_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D635A0];
  objc_msgSend(*(id *)(a1 + 32), "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crossProcessChangeCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postCrossProcessNotificationName:", v5);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)updateDivergedNotesWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ICLongRunningTaskController *v14;
  void *v15;
  ICLongRunningTaskController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC4730];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", v10, &__block_literal_global_72);

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  -[ICAccountPassphraseManager account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [ICLongRunningTaskController alloc];
  -[ICAccountPassphraseManager window](self, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:](v14, "initWithWindow:intervalBeforeOpeningProgressDialog:", v15, 1.0);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Changing Password…"), CFSTR("Changing Password…"), 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLongRunningTaskController setProgressString:](v16, "setProgressString:", v17);

  -[ICLongRunningTaskController setIndeterminate:](v16, "setIndeterminate:", 1);
  -[ICLongRunningTaskController setShouldShowCircularProgress:](v16, "setShouldShowCircularProgress:", 1);
  -[ICAccountPassphraseManager window](self, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rootViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ic_topViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLongRunningTaskController setViewControllerToPresentFrom:](v16, "setViewControllerToPresentFrom:", v20);

  v21 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_36;
  v29[3] = &unk_1E5C23228;
  v32 = v33;
  v22 = v13;
  v30 = v22;
  v23 = v6;
  v31 = v23;
  v25[0] = v21;
  v25[1] = 3221225472;
  v25[2] = __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_2;
  v25[3] = &unk_1E5C23250;
  v28 = v11;
  v24 = v7;
  v26 = v24;
  v27 = v33;
  -[ICLongRunningTaskController startTask:completionBlock:](v16, "startTask:completionBlock:", v29, v25);

  _Block_object_dispose(v33, 8);
}

void __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke()
{
  NSObject *v0;

  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_cold_1(v0);

}

void __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_36(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D63AA8];
  v4 = a2;
  objc_msgSend(v3, "sharedController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "convergeNotesInAccountWithID:configuration:progress:", a1[4], a1[5], v4);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

uint64_t __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", a1[6]);
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24));
  return result;
}

- (void)applicationDidEnterBackground:(id)a3
{
  NSObject *v3;

  dispatch_get_global_queue(-32768, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_38_0);

}

void __60__ICAccountPassphraseManager_applicationDidEnterBackground___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D63AA8], "sharedController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cancelAndWaitWithReason:", CFSTR("Application entered background"));

}

- (ICAccount)account
{
  return self->_account;
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)setPassphrase:(NSObject *)a3 hint:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "length") != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = v6;
  v10 = 2112;
  v12 = 2080;
  v11 = v7;
  v13 = "-[ICAccountPassphraseManager setPassphrase:hint:]";
  v14 = 1024;
  v15 = 45;
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "Setting passphrase for account… {account: %@, hasHint: %@}%s:%d", (uint8_t *)&v8, 0x26u);

}

- (void)setPassphrase:(void *)a1 hint:(NSObject *)a2 isReset:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v5, "Not setting passphrase because it is the same as the current passphrase {account: %@}", v6);

  OUTLINED_FUNCTION_4();
}

- (void)setPassphrase:(void *)a1 hint:(char)a2 isReset:(NSObject *)a3 .cold.2(void *a1, char a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "Incrementing password change count {account: %@, isReset: %@}", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_4();
}

- (void)setPassphrase:(void *)a1 hint:(NSObject *)a2 isReset:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v5, "Not incrementing passphrase change count for initial passphrase {account: %@}", v6);

  OUTLINED_FUNCTION_4();
}

- (void)setPassphrase:(void *)a1 hint:(NSObject *)a2 isReset:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Cannot set passphrase for account {account: %@}", v5, 0xCu);

  OUTLINED_FUNCTION_4();
}

- (void)changePassphrase:(void *)a1 toPassphrase:(NSObject *)a2 hint:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v5, "Not setting passphrase because account is not authenticated {account: %@}", v6);

  OUTLINED_FUNCTION_4();
}

- (void)changePassphrase:(void *)a1 toPassphrase:(NSObject *)a2 hint:completion:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v5, "Not setting passphrase because diverged passphrase does not authenticate account {account: %@}", v6);

  OUTLINED_FUNCTION_4();
}

- (void)removePassphrase
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "account");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v3, v4, "Removing passphrase for account… {account: %@}%s:%d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_12();
}

- (void)updateDivergedNotesFromPassphrase:(void *)a1 toAccountPassphrase:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, v5, "Not updating passphrase for diverged notes because account is not authenticated {account: %@}", v6);

  OUTLINED_FUNCTION_4();
}

- (void)updateDivergedNotesFromPassphrase:(void *)a1 toAccountPassphrase:completion:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "account");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_3(&dword_1AC7A1000, v3, v4, "Updating passphrase for diverged notes in account… {account: %@}%s:%d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_12();
}

void __78__ICAccountPassphraseManager_updateDivergedNotesWithConfiguration_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Background task for notes convergence expired", v1, 2u);
}

@end
