@implementation ICCryptoConvergenceController

- (ICCryptoConvergenceController)initWithWorkerContext:(id)a3
{
  id v5;
  ICCryptoConvergenceController *v6;
  ICCryptoConvergenceController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCryptoConvergenceController;
  v6 = -[ICCryptoConvergenceController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workerContext, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_authenticationStateDidDeauthenticate_, CFSTR("ICAuthenticationStateDidDeauthenticateNotification"), v9);

  }
  return v7;
}

+ (ICCryptoConvergenceController)sharedController
{
  _BOOL4 v2;
  void *v3;

  v2 = +[ICNoteContext hasSharedContext](ICNoteContext, "hasSharedContext");
  v3 = (void *)_sharedController;
  if (v2 && _sharedController == 0)
  {
    if (sharedController_onceToken_0 != -1)
      dispatch_once(&sharedController_onceToken_0, &__block_literal_global_16);
    v3 = (void *)_sharedController;
  }
  return (ICCryptoConvergenceController *)v3;
}

void __49__ICCryptoConvergenceController_sharedController__block_invoke()
{
  void *v0;
  ICCryptoConvergenceController *v1;
  void *v2;
  id v3;

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "workerManagedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = -[ICCryptoConvergenceController initWithWorkerContext:]([ICCryptoConvergenceController alloc], "initWithWorkerContext:", v3);
  v2 = (void *)_sharedController;
  _sharedController = (uint64_t)v1;

}

+ (void)setSharedController:(id)a3
{
  objc_storeStrong((id *)&_sharedController, a3);
}

- (BOOL)convergeNotesInAccountWithID:(id)a3 configuration:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  void *v10;
  ICCryptoConvergenceController *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(a4, "copy");
  v11 = self;
  objc_sync_enter(v11);
  -[ICCryptoConvergenceController progress](v11, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (v13 = objc_msgSend(v10, "isUserInitiated"), v12, (v13 & 1) == 0))
  {
    objc_sync_exit(v11);

    v18 = 0;
  }
  else
  {
    -[ICCryptoConvergenceController progress](v11, "progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      -[ICCryptoConvergenceController cancelAndWaitWithReason:](v11, "cancelAndWaitWithReason:", CFSTR("User-initiated operation"));
    -[ICCryptoConvergenceController progress](v11, "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.progress) == nil)", "-[ICCryptoConvergenceController convergeNotesInAccountWithID:configuration:progress:]", 1, 0, CFSTR("Expected nil value for '%s'"), "self.progress");
    v16 = v9;
    if (!v9)
      v16 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
    -[ICCryptoConvergenceController setProgress:](v11, "setProgress:", v16);
    if (!v9)

    objc_sync_exit(v11);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    -[ICCryptoConvergenceController workerContext](v11, "workerContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke;
    v20[3] = &unk_1E76C93F0;
    v20[4] = v11;
    v21 = v8;
    v22 = v10;
    v23 = &v24;
    objc_msgSend(v17, "performBlockAndWait:", v20);

    v18 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }

  return v18;
}

void __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAllObjects");

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "unsafelyConvergeNotesInAccount:configuration:", v5, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "workerContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.progress) != nil)", "-[ICCryptoConvergenceController convergeNotesInAccountWithID:configuration:progress:]_block_invoke", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.progress");
    objc_msgSend(*(id *)(a1 + 32), "setProgress:", 0);
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke_cold_1((uint64_t *)(a1 + 40), a1, v8);

  }
}

- (BOOL)unsafelyConvergeNotesInAccount:(id)a3 configuration:(id)a4
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
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  id v33;
  uint64_t i;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  BOOL v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[4];
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:].cold.5(v6);

  if ((objc_msgSend(v6, "isAuthenticated") & 1) == 0)
  {
    objc_msgSend(v7, "passphrase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "beginBlockingDeauthentication");

      objc_msgSend(v6, "cryptoStrategy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "passphrase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "authenticateWithPassphrase:", v13);

      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endBlockingDeauthentication");

    }
  }
  objc_msgSend(v7, "v1MainKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v7, "setV1MainKey:", v15);
  }
  else
  {
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cachedMainKeyForIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setV1MainKey:", v18);

  }
  objc_msgSend(v7, "v1NeoMainKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v7, "setV1NeoMainKey:", v19);
  }
  else
  {
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cachedMainKeyForIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setV1NeoMainKey:", v23);

  }
  objc_msgSend(v7, "v1MainKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {

  }
  else
  {
    objc_msgSend(v7, "v1NeoMainKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v50 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:].cold.1(v6);
      v32 = 0;
      obj = v50;
      goto LABEL_38;
    }
  }
  objc_msgSend(v6, "passwordProtectedNotes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");
  -[ICCryptoConvergenceController progress](self, "progress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTotalUnitCount:", v27);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v26;
  v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (!v29)
  {
    v32 = 1;
    goto LABEL_35;
  }
  v30 = v29;
  v31 = *(_QWORD *)v54;
  v32 = 1;
  while (2)
  {
    v33 = v7;
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v54 != v31)
        objc_enumerationMutation(obj);
      v35 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      -[ICCryptoConvergenceController progress](self, "progress");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isCancelled");

      if (v37)
      {
        v49 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:].cold.3(v6);

        v7 = v33;
        goto LABEL_35;
      }
      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "beginBlockingDeauthentication");

      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isAuthenticated");

      if (v40)
      {
        v41 = -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:](self, "unsafelyConvergeNote:configuration:", v35, v33);
        +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "endBlockingDeauthentication");

        if (v41)
        {
          -[ICCryptoConvergenceController workerContext](self, "workerContext");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "shortLoggingDescription");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v43, "ic_saveWithLogDescription:", CFSTR("Saved after converging note {note: %@}"), v44);

          goto LABEL_28;
        }
      }
      else
      {
        v46 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:].cold.4(v57, v6, &v58, v46);

        +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "endBlockingDeauthentication");

      }
      -[ICCryptoConvergenceController workerContext](self, "workerContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "rollback");
      v45 = 0;
LABEL_28:

      v32 &= v45;
      -[ICCryptoConvergenceController progress](self, "progress");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setCompletedUnitCount:", objc_msgSend(v48, "completedUnitCount") + 1);

    }
    v30 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    v7 = v33;
    if (v30)
      continue;
    break;
  }
LABEL_35:

  v50 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    -[ICCryptoConvergenceController unsafelyConvergeNotesInAccount:configuration:].cold.2(v6, v32 & 1);

LABEL_38:
  return v32 & 1;
}

- (BOOL)unsafelyConvergeNote:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
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
  char v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  int v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = +[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", v5);
  v8 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C978A8];
  objc_msgSend(v5, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, v11, 0, &__block_literal_global_24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "passphrase");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v6, "v1MainKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || v7)
      goto LABEL_6;
    objc_msgSend(v6, "passphrase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isPassphraseCorrect:", v16))
    {

LABEL_6:
      goto LABEL_7;
    }
    objc_msgSend(v5, "cryptoStrategy");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "v1MainKey");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "mainKeyDecryptsPrimaryData:", v33);

    v8 = 0x1E0CB3000;
    if (v34)
    {
      v35 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "shortLoggingDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138412290;
        v53 = v36;
        _os_log_impl(&dword_1BD918000, v35, OS_LOG_TYPE_INFO, "Fixing v1 note crypto goo using account main key… {note: %@}", (uint8_t *)&v52, 0xCu);

      }
      objc_msgSend(v6, "v1MainKey");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "metadata");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "passphraseSalt");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCryptoSalt:", v39);

      objc_msgSend(v6, "v1MainKey");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "metadata");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setCryptoIterationCount:", objc_msgSend(v41, "passphraseIterationCount"));

      objc_msgSend(v6, "v1MainKey");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "metadata");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "passphraseHint");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPasswordHint:", v44);

      objc_msgSend(v5, "updateChangeCountWithReason:", CFSTR("Fixed v1 Crypto Goo"));
    }
  }
LABEL_7:
  if (objc_msgSend(v6, "shouldConvergeObject:", v5))
  {
    objc_msgSend(v6, "v1MainKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17 || v7)
    {

    }
    else
    {
      objc_msgSend(v5, "cryptoStrategy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "v1MainKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "mainKeyDecryptsPrimaryData:", v20);

      if ((v21 & 1) == 0)
      {
        objc_opt_class();
        objc_msgSend(v5, "cryptoStrategy");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "v1MainKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "rewrapWithMainKey:", v24);

        v26 = os_log_create("com.apple.notes", "Crypto");
        v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:].cold.3(v5);
LABEL_26:
          v28 = 1;
LABEL_32:

LABEL_33:
          goto LABEL_34;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:].cold.4(v5);
        goto LABEL_31;
      }
    }
    objc_msgSend(v6, "v1NeoMainKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 1;
    if (!v27 || v7 != 2)
      goto LABEL_33;
    objc_msgSend(v5, "cryptoStrategy");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "v1NeoMainKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "mainKeyDecryptsPrimaryData:", v30);

    if ((v31 & 1) == 0)
    {
      objc_opt_class();
      objc_msgSend(v5, "cryptoStrategy");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "v1NeoMainKey");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "rewrapWithMainKey:", v47);

      v49 = os_log_create("com.apple.notes", "Crypto");
      v27 = v49;
      if (v48)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:].cold.1(v5);
        goto LABEL_26;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        -[ICCryptoConvergenceController unsafelyConvergeNote:configuration:].cold.2(v5);
LABEL_31:
      v28 = 0;
      goto LABEL_32;
    }
  }
  v28 = 1;
LABEL_34:
  objc_msgSend(*(id *)(v8 + 2000), "defaultCenter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "removeObserver:", v12);

  return v28;
}

uint64_t __68__ICCryptoConvergenceController_unsafelyConvergeNote_configuration___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCryptoConvergenceController unsafelyConvergeNote:configuration:]_block_invoke", 1, 1, CFSTR("Saved while converging note"));
}

- (BOOL)convergeAttachmentsInNoteWithID:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[ICCryptoConvergenceController workerContext](self, "workerContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke;
  v12[3] = &unk_1E76C9458;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v15 = &v16;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v8, "performBlockAndWait:", v12);

  LOBYTE(v8) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

void __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAllObjects");

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)(a1 + 40);
  objc_msgSend(v3, "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "unsafelyConvergeAttachmentsInNote:configuration:", v6, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "workerContext");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject refreshAllObjects](v7, "refreshAllObjects");
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke_cold_1(v4, v7);
  }

}

- (BOOL)unsafelyConvergeAttachmentsInNote:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICCryptoConvergenceController unsafelyConvergeAttachmentsInNote:configuration:].cold.3(v6);

  if ((objc_msgSend(v6, "isPasswordProtected") & 1) == 0)
  {
    v19 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICCryptoConvergenceController unsafelyConvergeAttachmentsInNote:configuration:].cold.2(v6);

    goto LABEL_12;
  }
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginBlockingDeauthentication");

  if ((objc_msgSend(v6, "isAuthenticated") & 1) == 0)
  {
    objc_msgSend(v7, "passphrase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      objc_msgSend(v6, "cryptoStrategy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "passphrase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "authenticateWithPassphrase:", v13);

      if ((v14 & 1) == 0)
      {
        +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject endBlockingDeauthentication](v19, "endBlockingDeauthentication");
LABEL_12:
        LOBYTE(v20) = 0;
        goto LABEL_38;
      }
    }
  }
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cachedMainKeyForIdentifier:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "v1MainKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v7, "setV1MainKey:", v18);
  }
  else
  {
    -[NSObject metadata](v17, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "cipherVersion"))
      v22 = 0;
    else
      v22 = v17;
    objc_msgSend(v7, "setV1MainKey:", v22);

  }
  objc_msgSend(v7, "v1NeoMainKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v7, "setV1NeoMainKey:", v23);
  }
  else
  {
    -[NSObject metadata](v17, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "cipherVersion") == 2)
      v25 = v17;
    else
      v25 = 0;
    objc_msgSend(v7, "setV1NeoMainKey:", v25);

  }
  v46 = v17;

  objc_msgSend(v6, "attachments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v6, "inlineAttachments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");
  objc_msgSend(v27, "setByAddingObjectsFromSet:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __81__ICCryptoConvergenceController_unsafelyConvergeAttachmentsInNote_configuration___block_invoke;
  v53[3] = &unk_1E76C9480;
  v47 = v7;
  v31 = v7;
  v54 = v31;
  v45 = v30;
  objc_msgSend(v30, "ic_objectsPassingTest:", v53);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  v48 = v6;
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v50;
    v20 = 1;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v50 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v38 = -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:](self, "unsafelyConvergeAttachment:configuration:", v37, v31);
        -[ICCryptoConvergenceController workerContext](self, "workerContext");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v38)
        {
          objc_msgSend(v37, "shortLoggingDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v20 &= objc_msgSend(v40, "ic_saveWithLogDescription:", CFSTR("Saved after converging attachment {attachment: %@}"), v41);

        }
        else
        {
          objc_msgSend(v39, "rollback");
          v20 = 0;
        }

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v34);
  }
  else
  {
    LOBYTE(v20) = 1;
  }
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "endBlockingDeauthentication");

  v43 = os_log_create("com.apple.notes", "Crypto");
  v6 = v48;
  v19 = v46;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    -[ICCryptoConvergenceController unsafelyConvergeAttachmentsInNote:configuration:].cold.1(v48, v20);

  v7 = v47;
LABEL_38:

  return v20;
}

uint64_t __81__ICCryptoConvergenceController_unsafelyConvergeAttachmentsInNote_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "parentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 0;
  else
    v5 = objc_msgSend(*(id *)(a1 + 32), "shouldConvergeObject:", v3);

  return v5;
}

- (BOOL)unsafelyConvergeAttachment:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
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
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  BOOL v33;
  void *v34;

  v5 = a3;
  v6 = a4;
  v7 = +[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C978A8];
  objc_msgSend(v5, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, v10, 0, &__block_literal_global_36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "v1MainKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12 || v7)
  {

  }
  else
  {
    objc_msgSend(v5, "cryptoStrategy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "v1MainKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "mainKeyDecryptsPrimaryData:", v15);

    if ((v16 & 1) == 0)
    {
      objc_opt_class();
      objc_msgSend(v5, "cryptoStrategy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "v1MainKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "rewrapWithMainKey:", v19);

      v21 = os_log_create("com.apple.notes", "Crypto");
      v22 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:].cold.3(v5);
LABEL_14:

        goto LABEL_16;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:].cold.4(v5);
      goto LABEL_21;
    }
  }
  objc_msgSend(v6, "v1NeoMainKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23 || v7 != 2)
  {

    goto LABEL_16;
  }
  objc_msgSend(v5, "cryptoStrategy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "v1NeoMainKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "mainKeyDecryptsPrimaryData:", v26);

  if ((v27 & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend(v5, "cryptoStrategy");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "v1NeoMainKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "rewrapWithMainKey:", v30);

    v32 = os_log_create("com.apple.notes", "Crypto");
    v22 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:].cold.1(v5);
      goto LABEL_14;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:].cold.2(v5);
LABEL_21:

    v33 = 0;
    goto LABEL_22;
  }
LABEL_16:
  v33 = 1;
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeObserver:", v11);

  return v33;
}

uint64_t __74__ICCryptoConvergenceController_unsafelyConvergeAttachment_configuration___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCryptoConvergenceController unsafelyConvergeAttachment:configuration:]_block_invoke", 1, 1, CFSTR("Saved while converging diverged attachment"));
}

- (void)cancelAndWaitWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v12 = v4;
    v13 = 2080;
    v14 = "-[ICCryptoConvergenceController cancelAndWaitWithReason:]";
    v15 = 1024;
    v16 = 347;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling converging notes… {reason: %@}%s:%d", buf, 0x1Cu);
  }

  -[ICCryptoConvergenceController progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[ICCryptoConvergenceController workerContext](self, "workerContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke;
  v9[3] = &unk_1E76C73F8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

void __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke_cold_1(a1, v2);

}

- (void)authenticationStateDidDeauthenticate:(id)a3
{
  void *v3;
  char v4;
  NSObject *v5;

  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticated");

  if ((v4 & 1) == 0)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, &__block_literal_global_41);

  }
}

void __70__ICCryptoConvergenceController_authenticationStateDidDeauthenticate___block_invoke()
{
  id v0;

  +[ICCryptoConvergenceController sharedController](ICCryptoConvergenceController, "sharedController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cancelAndWaitWithReason:", CFSTR("Notes was deauthenticated"));

}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

void __85__ICCryptoConvergenceController_convergeNotesInAccountWithID_configuration_progress___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Cannot fetch account for converging notes {accountID: %@, configuration: %@}", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not converging notes because there are no account main keys {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:(char)a2 .cold.2(void *a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_5(&dword_1BD918000, v5, v6, "Converged notes in account {account: %@, success: %@}%s:%d", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7();
}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Cancelled converging notes {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeNotesInAccount:(_QWORD *)a3 configuration:(NSObject *)a4 .cold.4(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "shortLoggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BD918000, a4, OS_LOG_TYPE_DEBUG, "Not converging note because Notes is not authenticated {account: %@}", a1, 0xCu);

}

- (void)unsafelyConvergeNotesInAccount:(void *)a1 configuration:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_5(&dword_1BD918000, v2, v3, "Converging notes in account… {account: %@, configuration: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Converged v1 Neo note {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot converge v1 Neo note {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Converged v1 note {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeNote:(void *)a1 configuration:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot converge v1 note {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __79__ICCryptoConvergenceController_convergeAttachmentsInNoteWithID_configuration___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Cannot fetch note for converging attachments {noteID: %@}", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)unsafelyConvergeAttachmentsInNote:(void *)a1 configuration:(char)a2 .cold.1(void *a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2 & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_5(&dword_1BD918000, v5, v6, "Converged attachments in note {note: %@, success: %@}%s:%d", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7();
}

- (void)unsafelyConvergeAttachmentsInNote:(void *)a1 configuration:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot converge note that is not password-protected {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeAttachmentsInNote:(void *)a1 configuration:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_5(&dword_1BD918000, v2, v3, "Converging attachments in note… {note: %@, configuration: %@}%s:%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Converged v1 Neo diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot converge v1 Neo diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Converged v1 diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)unsafelyConvergeAttachment:(void *)a1 configuration:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot converge v1 diverged attachment {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __57__ICCryptoConvergenceController_cancelAndWaitWithReason___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Cancelled converging notes {reason: %@}", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
