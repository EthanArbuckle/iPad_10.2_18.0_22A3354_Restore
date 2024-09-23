@implementation BRAccount

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  id v4;
  const char *v5;
  int *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  uint32_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)();
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  int v25;
  _QWORD handler[4];
  id v27;
  uint64_t *v28;
  const char *v29;

  v22 = 0;
  v23 = (int *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("account-token-change-observer", v1);

  v3 = (void *)startAccountTokenChangeObserverIfNeeded_tokenChangeObserverQueue;
  startAccountTokenChangeObserverIfNeeded_tokenChangeObserverQueue = (uint64_t)v2;

  BRAccountTokenChangedNotification();
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = v23;
  v7 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2;
  v20 = &unk_1E3DA4838;
  v21 = &v22;
  v8 = (id)startAccountTokenChangeObserverIfNeeded_tokenChangeObserverQueue;
  v9 = &v17;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager", v17, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "br_currentPersonaID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  handler[0] = v7;
  handler[1] = 3221225472;
  handler[2] = __br_notify_register_dispatch_block_invoke;
  handler[3] = &unk_1E3DA49A8;
  v12 = v11;
  v27 = v12;
  v29 = v5;
  v13 = v9;
  v28 = v13;
  v14 = notify_register_dispatch(v5, v6 + 6, v8, handler);

  if (v14)
  {
    brc_bread_crumbs((uint64_t)"+[BRAccount(BRPrivate) startAccountTokenChangeObserverIfNeeded]_block_invoke", 273);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_cold_1((uint64_t)v15, v14, v16);

  }
  _Block_object_dispose(&v22, 8);
}

+ (id)currentCachedLoggedInAccountWithError:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_currentPersonaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_refreshCurrentLoggedInAccountForcingRefresh:personaID:error:", 0, v6, a3);
  objc_msgSend((id)currentLoggedInAccountOrNullByPersonaID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_sync_exit(v4);
  return v8;
}

+ (BOOL)_refreshCurrentLoggedInAccountForcingRefresh:(BOOL)a3 personaID:(id)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BRAccount *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BRAccount *v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  NSObject *v39;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v6 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!currentLoggedInAccountOrNullByPersonaID)
  {
    v9 = objc_opt_new();
    v10 = (void *)currentLoggedInAccountOrNullByPersonaID;
    currentLoggedInAccountOrNullByPersonaID = v9;

  }
  if (a5)
    *a5 = 0;
  objc_msgSend(a1, "startAccountTokenChangeObserverIfNeeded");
  objc_msgSend((id)currentLoggedInAccountOrNullByPersonaID, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;
  if (!v11 || v6)
  {
    v41 = brc_monotonic_time_now();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v44 = v15;
    objc_msgSend(v15, "infoDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = -[BRDaemonConnection initUsingUserLocalDaemonTokenService]([BRDaemonConnection alloc], "initUsingUserLocalDaemonTokenService");
    v20 = (void *)objc_msgSend(v19, "newSyncTokenProxy");
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __74__BRAccount__refreshCurrentLoggedInAccountForcingRefresh_personaID_error___block_invoke;
    v45[3] = &unk_1E3DA4780;
    v21 = v20;
    v46 = v21;
    v42 = (void *)v18;
    v43 = (void *)v16;
    objc_msgSend(v21, "currentAccountCopyTokenWithBundleID:version:reply:", v16, v18, v45);
    objc_msgSend(v21, "result");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      objc_msgSend(v21, "error");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 109);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        +[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:].cold.3(v21, (uint64_t)v24, v25);

    }
    objc_msgSend(v19, "invalidate");
    -[BRAccount perAppAccountIdentifier](v13, "perAppAccountIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 == v26 || (objc_msgSend(v22, "isEqual:", v26) & 1) != 0)
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)currentLoggedInAccountOrNullByPersonaID, "setObject:forKeyedSubscript:", v27, v8);

      }
      v14 = 0;
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 122);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v48 = v26;
        v49 = 2112;
        v50 = v22;
        v51 = 2112;
        v52 = v28;
        _os_log_debug_impl(&dword_19CBF0000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] got an account change (previous token %@, new token %@)%@", buf, 0x20u);
      }

      +[BRDaemonConnection defaultConnectionIfExists](BRDaemonConnection, "defaultConnectionIfExists");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "remoteObjectProxy");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "updatePrivilegesDescriptor");

      +[BRDaemonConnection secondaryConnectionIfExists](BRDaemonConnection, "secondaryConnectionIfExists");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "remoteObjectProxy");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "updatePrivilegesDescriptor");

      if (v22)
      {
        v34 = objc_alloc_init(BRAccount);

        -[BRAccount setPerAppAccountIdentifier:](v34, "setPerAppAccountIdentifier:", v22);
        objc_msgSend((id)currentLoggedInAccountOrNullByPersonaID, "setObject:forKeyedSubscript:", v34, v8);
        v14 = 1;
        v13 = v34;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)currentLoggedInAccountOrNullByPersonaID, "setObject:forKeyedSubscript:", v35, v8);

        v14 = 1;
      }
    }
    v36 = brc_monotonic_time_now();
    v37 = brc_monotonic_time_diff_to_interval(v36 - v41);
    if (v37 <= 0.5 || qos_class_self() < QOS_CLASS_USER_INITIATED)
    {
      brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 143);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        +[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:].cold.2(v37);
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 141);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
        +[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:].cold.1(v37);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)startAccountTokenChangeObserverIfNeeded
{
  if (startAccountTokenChangeObserverIfNeeded_onceToken != -1)
    dispatch_once(&startAccountTokenChangeObserverIfNeeded_onceToken, &__block_literal_global_58);
}

- (NSData)perAppAccountIdentifier
{
  return self->_perAppAccountIdentifier;
}

- (void)setPerAppAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BRAccount)init
{
  BRAccount *v2;
  void *v3;
  uint64_t v4;
  NSString *personaID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRAccount;
  v2 = -[BRAccount init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "br_currentPersonaID");
    v4 = objc_claimAutoreleasedReturnValue();
    personaID = v2->_personaID;
    v2->_personaID = (NSString *)v4;

  }
  return v2;
}

uint64_t __74__BRAccount__refreshCurrentLoggedInAccountForcingRefresh_personaID_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

+ (id)currentLoggedInAccountWithError:(id *)a3
{
  objc_msgSend(a1, "refreshCurrentLoggedInAccount");
  return (id)objc_msgSend(a1, "currentCachedLoggedInAccountWithError:", a3);
}

+ (BOOL)refreshCurrentLoggedInAccountWithError:(id *)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11[3];

  v4 = a1;
  objc_sync_enter(v4);
  memset(v11, 0, sizeof(v11));
  __brc_create_section(0, (uint64_t)"+[BRAccount refreshCurrentLoggedInAccountWithError:]", 172, v11);
  brc_bread_crumbs((uint64_t)"+[BRAccount refreshCurrentLoggedInAccountWithError:]", 172);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[BRAccount refreshCurrentLoggedInAccountWithError:].cold.1(v11);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "br_currentPersonaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "_refreshCurrentLoggedInAccountForcingRefresh:personaID:error:", 1, v8, a3);
  __brc_leave_section((uint64_t)v11);
  objc_sync_exit(v4);

  return v9;
}

+ (BOOL)refreshCurrentLoggedInAccount
{
  return objc_msgSend(a1, "refreshCurrentLoggedInAccountWithError:", 0);
}

- (BRAccount)initWithAccountID:(id)a3
{
  id v5;
  BRAccount *v6;
  BRAccount *v7;
  void *v8;
  uint64_t v9;
  NSString *personaID;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRAccount;
  v6 = -[BRAccount init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountID, a3);
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "br_currentPersonaID");
    v9 = objc_claimAutoreleasedReturnValue();
    personaID = v7->_personaID;
    v7->_personaID = (NSString *)v9;

  }
  return v7;
}

- (id)containerWithPendingChanges
{
  NSString *v3;
  NSString *v4;
  int v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSString *personaID;
  void *v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  char v36[32];
  uint8_t buf[24];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v3 = self->_personaID) == 0)
  {
    if (containerWithPendingChanges___personaOnceToken != -1)
      dispatch_once(&containerWithPendingChanges___personaOnceToken, &__block_literal_global_0);
    v4 = (NSString *)(id)containerWithPendingChanges___personalPersona;
    v5 = 1;
  }
  else
  {
    v4 = v3;
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  objc_msgSend(v7, "userPersonaUniqueString");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == v4 || -[NSString isEqualToString:](v8, "isEqualToString:", v4))
  {
    v10 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v34 = 0;
    v22 = (void *)objc_msgSend(v7, "copyCurrentPersonaContextWithError:", &v34);
    v23 = v34;
    v24 = v35;
    v35 = v22;

    if (v23)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        -[BRAccount containerWithPendingChanges].cold.3();

    }
    objc_msgSend(v7, "generateAndRestorePersonaContextWithPersonaUniqueString:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = personaID;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        v38 = v27;
        _os_log_error_impl(&dword_19CBF0000, v28, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_33:

    }
  }
  else
  {
    if (v5 && (objc_msgSend(v7, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();
      v10 = 0;
      goto LABEL_33;
    }
    brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[BRAccount containerWithPendingChanges].cold.4();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRAccount containerWithPendingChanges]", 211, buf);
  brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 211);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[BRAccount containerWithPendingChanges].cold.2((uint64_t *)buf);

  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "newSyncProxy");

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __40__BRAccount_containerWithPendingChanges__block_invoke_26;
  v32[3] = &unk_1E3DA47A8;
  v15 = v14;
  v33 = v15;
  objc_msgSend(v15, "getContainersNeedingUpload:", v32);
  objc_msgSend(v15, "result");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 218);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      objc_msgSend(v15, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRAccount containerWithPendingChanges].cold.1(v20, (uint64_t)v18, (uint64_t)v36);
    }

  }
  __brc_leave_section((uint64_t)buf);

  _BRRestorePersona(&v35);
  return v16;
}

void __40__BRAccount_containerWithPendingChanges__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)containerWithPendingChanges___personalPersona;
  containerWithPendingChanges___personalPersona = v0;

}

uint64_t __40__BRAccount_containerWithPendingChanges__block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", a2, a3);
}

- (BOOL)iCloudDesktopSettingsChangedWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  NSString *v8;
  int v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSString *personaID;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v7 = self->_personaID) == 0)
  {
    if (iCloudDesktopSettingsChangedWithAttributes_error____personaOnceToken != -1)
      dispatch_once(&iCloudDesktopSettingsChangedWithAttributes_error____personaOnceToken, &__block_literal_global_28);
    v8 = (NSString *)(id)iCloudDesktopSettingsChangedWithAttributes_error____personalPersona;
    v9 = 1;
  }
  else
  {
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentPersona");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  objc_msgSend(v11, "userPersonaUniqueString");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 == v8 || -[NSString isEqualToString:](v12, "isEqualToString:", v8))
  {
    v14 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v33 = 0;
    v21 = (void *)objc_msgSend(v11, "copyCurrentPersonaContextWithError:", &v33);
    v22 = v33;
    v23 = v34;
    v34 = v21;

    if (v22)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        -[BRAccount containerWithPendingChanges].cold.3();

    }
    objc_msgSend(v11, "generateAndRestorePersonaContextWithPersonaUniqueString:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        v36 = personaID;
        v37 = 2112;
        v38 = v14;
        v39 = 2112;
        v40 = v26;
        _os_log_error_impl(&dword_19CBF0000, v27, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:

    }
  }
  else
  {
    if (v9 && (objc_msgSend(v11, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();
      v14 = 0;
      goto LABEL_29;
    }
    brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[BRAccount containerWithPendingChanges].cold.4();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newSyncProxy");

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __62__BRAccount_iCloudDesktopSettingsChangedWithAttributes_error___block_invoke_29;
  v31[3] = &unk_1E3DA47F0;
  v17 = v16;
  v32 = v17;
  objc_msgSend(v17, "iCloudDesktopSettingsChangedWithAttributes:reply:", v6, v31);
  if (a4)
  {
    objc_msgSend(v17, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  _BRRestorePersona(&v34);
  return v19;
}

void __62__BRAccount_iCloudDesktopSettingsChangedWithAttributes_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)iCloudDesktopSettingsChangedWithAttributes_error____personalPersona;
  iCloudDesktopSettingsChangedWithAttributes_error____personalPersona = v0;

}

void __62__BRAccount_iCloudDesktopSettingsChangedWithAttributes_error___block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2 == 0;
  v5 = a2;
  objc_msgSend(v3, "numberWithInt:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObjResult:error:", v6, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAppAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  brc_bread_crumbs((uint64_t)"+[BRAccount(BRPrivate) startAccountTokenChangeObserverIfNeeded]_block_invoke_2", 258);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2_cold_1();

  v2 = (void *)MEMORY[0x1A1AD841C]();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("BRAccountTokenWillChangeNotification"), 0);

  objc_autoreleasePoolPop(v2);
  v4 = (void *)MEMORY[0x1A1AD841C]();
  +[BRAccount refreshCurrentLoggedInAccount](BRAccount, "refreshCurrentLoggedInAccount");
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateAccountForPersonaCache");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("BRAccountTokenDidChangeNotification"), 0);

  objc_autoreleasePoolPop(v4);
}

- (BOOL)hasOptimizeStorageWithError:(id *)a3
{
  NSString *v4;
  NSString *v5;
  int v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSString *personaID;
  void *v29;
  NSObject *v30;
  const char *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v4 = self->_personaID) == 0)
  {
    if (hasOptimizeStorageWithError____personaOnceToken != -1)
      dispatch_once(&hasOptimizeStorageWithError____personaOnceToken, &__block_literal_global_63);
    v5 = (NSString *)(id)hasOptimizeStorageWithError____personalPersona;
    v6 = 1;
  }
  else
  {
    v5 = v4;
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(v8, "userPersonaUniqueString");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == v5 || -[NSString isEqualToString:](v9, "isEqualToString:", v5))
  {
    v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v35 = 0;
    v21 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v35);
    v22 = v35;
    v23 = v36;
    v36 = v21;

    if (v22)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        -[BRAccount containerWithPendingChanges].cold.3();

    }
    objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v5);
    v11 = (char *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        v38 = (const char *)personaID;
        v39 = 2112;
        v40 = v11;
        v41 = 2112;
        v42 = v26;
        _os_log_error_impl(&dword_19CBF0000, v27, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:

    }
  }
  else
  {
    if (v6 && (objc_msgSend(v8, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();
      v11 = 0;
      goto LABEL_32;
    }
    brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[BRAccount containerWithPendingChanges].cold.4();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v11 = (char *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newSyncProxy");

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __52__BRAccount_BRPrivate__hasOptimizeStorageWithError___block_invoke_64;
  v33[3] = &unk_1E3DA4880;
  v14 = v13;
  v34 = v14;
  objc_msgSend(v14, "hasOptimizeStorageWithReply:", v33);
  objc_msgSend(v14, "result");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v14, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 290);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v31 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v38 = "-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]";
      v39 = 2080;
      if (!a3)
        v31 = "(ignored by caller)";
      v40 = v31;
      v41 = 2112;
      v42 = v17;
      v43 = 2112;
      v44 = v18;
      _os_log_error_impl(&dword_19CBF0000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a3)
    *a3 = objc_retainAutorelease(v17);

  _BRRestorePersona(&v36);
  return v16;
}

void __52__BRAccount_BRPrivate__hasOptimizeStorageWithError___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hasOptimizeStorageWithError____personalPersona;
  hasOptimizeStorageWithError____personalPersona = v0;

}

uint64_t __52__BRAccount_BRPrivate__hasOptimizeStorageWithError___block_invoke_64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2, a3);
}

- (BOOL)setOptimizeStorageEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  NSString *v6;
  NSString *v7;
  int v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSString *personaID;
  void *v30;
  NSObject *v31;
  const char *v32;
  _QWORD v34[4];
  id v35;
  id location;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v4 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v6 = self->_personaID) == 0)
  {
    if (setOptimizeStorageEnabled_error____personaOnceToken != -1)
      dispatch_once(&setOptimizeStorageEnabled_error____personaOnceToken, &__block_literal_global_68);
    v7 = (NSString *)(id)setOptimizeStorageEnabled_error____personalPersona;
    v8 = 1;
  }
  else
  {
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentPersona");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  objc_msgSend(v10, "userPersonaUniqueString");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == v7 || -[NSString isEqualToString:](v11, "isEqualToString:", v7))
  {
    v13 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v37 = 0;
    v22 = (void *)objc_msgSend(v10, "copyCurrentPersonaContextWithError:", &v37);
    v23 = v37;
    v24 = v38;
    v38 = v22;

    if (v23)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        -[BRAccount containerWithPendingChanges].cold.3();

    }
    objc_msgSend(v10, "generateAndRestorePersonaContextWithPersonaUniqueString:", v7);
    v13 = (char *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        v40 = (const char *)personaID;
        v41 = 2112;
        v42 = v13;
        v43 = 2112;
        v44 = v27;
        _os_log_error_impl(&dword_19CBF0000, v28, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:

    }
  }
  else
  {
    if (v8 && (objc_msgSend(v10, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();
      v13 = 0;
      goto LABEL_32;
    }
    brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[BRAccount containerWithPendingChanges].cold.4();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "newSyncProxy");

  objc_initWeak(&location, v15);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __56__BRAccount_BRPrivate__setOptimizeStorageEnabled_error___block_invoke_69;
  v34[3] = &unk_1E3DA48A8;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v15, "setStorageOpimizationEnabled:reply:", v4, v34);
  objc_msgSend(v15, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 304);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      v32 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v40 = "-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]";
      v41 = 2080;
      if (!a4)
        v32 = "(ignored by caller)";
      v42 = v32;
      v43 = 2112;
      v44 = v16;
      v45 = 2112;
      v46 = v17;
      _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v16);

  objc_msgSend(v15, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  _BRRestorePersona(&v38);
  return v20;
}

void __56__BRAccount_BRPrivate__setOptimizeStorageEnabled_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)setOptimizeStorageEnabled_error____personalPersona;
  setOptimizeStorageEnabled_error____personalPersona = v0;

}

void __56__BRAccount_BRPrivate__setOptimizeStorageEnabled_error___block_invoke_69(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setBoolResult:error:", v3 == 0, v3);

}

- (BOOL)getEvictableSpace:(id *)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  NSString *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSString *personaID;
  void *v32;
  NSObject *v33;
  const char *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!BRIsFPFSEnabled(self, a2))
  {
    if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
      || (v11 = self->_personaID) == 0)
    {
      if (getEvictableSpace_error____personaOnceToken != -1)
        dispatch_once(&getEvictableSpace_error____personaOnceToken, &__block_literal_global_72);
      v7 = (id)getEvictableSpace_error____personalPersona;
      v12 = 1;
    }
    else
    {
      v7 = v11;
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentPersona");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    objc_msgSend(v14, "userPersonaUniqueString");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 == v7 || (objc_msgSend(v15, "isEqualToString:", v7) & 1) != 0)
    {
      v17 = 0;
      goto LABEL_16;
    }
    if (voucher_process_can_use_arbitrary_personas())
    {
      v37 = 0;
      v24 = (void *)objc_msgSend(v14, "copyCurrentPersonaContextWithError:", &v37);
      v25 = v37;
      v26 = v38;
      v38 = v24;

      if (v25)
      {
        brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
          -[BRAccount containerWithPendingChanges].cold.3();

      }
      objc_msgSend(v14, "generateAndRestorePersonaContextWithPersonaUniqueString:", v7);
      v17 = (char *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          personaID = self->_personaID;
          *(_DWORD *)buf = 138412802;
          v40 = (const char *)personaID;
          v41 = 2112;
          v42 = v17;
          v43 = 2112;
          v44 = v29;
          _os_log_error_impl(&dword_19CBF0000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
LABEL_40:

      }
    }
    else
    {
      if (v12 && (objc_msgSend(v14, "isDataSeparatedPersona") & 1) == 0)
      {
        brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[BRAccount containerWithPendingChanges].cold.5();
        v17 = 0;
        goto LABEL_40;
      }
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v17 = (char *)objc_claimAutoreleasedReturnValue();
    }
LABEL_16:
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "newLegacySyncProxy");

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __48__BRAccount_BRPrivate__getEvictableSpace_error___block_invoke_73;
    v35[3] = &unk_1E3DA48D0;
    v20 = v19;
    v36 = v20;
    objc_msgSend(v20, "getEvictableSpaceWithReply:", v35);
    objc_msgSend(v20, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v21 == 0;
    if (v21)
    {
      if (!a4)
      {
LABEL_22:

        _BRRestorePersona(&v38);
        goto LABEL_23;
      }
      objc_msgSend(v20, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "result");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = a3;
    }
    *a4 = v22;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_getEvictableSpaceWithReply_);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 311);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      v34 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v40 = "-[BRAccount(BRPrivate) getEvictableSpace:error:]";
      v41 = 2080;
      if (!a4)
        v34 = "(ignored by caller)";
      v42 = v34;
      v43 = 2112;
      v44 = v7;
      v45 = 2112;
      v46 = v8;
      _os_log_error_impl(&dword_19CBF0000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a4)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    *a4 = v7;
  }
  else
  {
    v10 = 0;
  }
LABEL_23:

  return v10;
}

void __48__BRAccount_BRPrivate__getEvictableSpace_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getEvictableSpace_error____personalPersona;
  getEvictableSpace_error____personalPersona = v0;

}

void __48__BRAccount_BRPrivate__getEvictableSpace_error___block_invoke_73(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjResult:error:", v7, v6);

}

- (void)evictOldDocumentsWithHandler:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  int v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSString *personaID;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v5 = self->_personaID) == 0)
  {
    if (evictOldDocumentsWithHandler____personaOnceToken != -1)
      dispatch_once(&evictOldDocumentsWithHandler____personaOnceToken, &__block_literal_global_75);
    v6 = (NSString *)(id)evictOldDocumentsWithHandler____personalPersona;
    v7 = 1;
  }
  else
  {
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  objc_msgSend(v9, "userPersonaUniqueString");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v6 || -[NSString isEqualToString:](v10, "isEqualToString:", v6))
  {
    v12 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v32 = 0;
    v18 = (void *)objc_msgSend(v9, "copyCurrentPersonaContextWithError:", &v32);
    v19 = v32;
    v20 = v33;
    v33 = v18;

    if (v19)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
        -[BRAccount containerWithPendingChanges].cold.3();

    }
    objc_msgSend(v9, "generateAndRestorePersonaContextWithPersonaUniqueString:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        v35 = personaID;
        v36 = 2112;
        v37 = v12;
        v38 = 2112;
        v39 = v23;
        _os_log_error_impl(&dword_19CBF0000, v24, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_27:

    }
  }
  else
  {
    if (v7 && (objc_msgSend(v9, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[BRAccount containerWithPendingChanges].cold.5();
      v12 = 0;
      goto LABEL_27;
    }
    brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[BRAccount containerWithPendingChanges].cold.4();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_76;
  v30[3] = &unk_1E3DA48F8;
  v15 = v4;
  v31 = v15;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_2;
  v28[3] = &unk_1E3DA48F8;
  v17 = v15;
  v29 = v17;
  objc_msgSend(v16, "evictOldDocumentsWithReply:", v28);

  _BRRestorePersona(&v33);
}

void __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)evictOldDocumentsWithHandler____personalPersona;
  evictOldDocumentsWithHandler____personalPersona = v0;

}

uint64_t __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_76(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)_refreshCurrentLoggedInAccountForcingRefresh:(double)a1 personaID:error:.cold.1(double a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19CBF0000, v1, v2, "[ERROR] Took %0.2fs to get the token%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)_refreshCurrentLoggedInAccountForcingRefresh:(double)a1 personaID:error:.cold.2(double a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v1, v2, "[DEBUG] token fetch returned in %0.2fs%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)_refreshCurrentLoggedInAccountForcingRefresh:(void *)a1 personaID:(uint64_t)a2 error:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_5(&dword_19CBF0000, a3, v6, "[ERROR] error while getting ubiquityIdentityToken: %@%@", (uint8_t *)&v7);

}

+ (void)refreshCurrentLoggedInAccountWithError:(uint64_t *)a1 .cold.1(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 134218242;
  v4 = v1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v2, (uint64_t)v2, "[DEBUG] ┏%llx refreshing current logged in account%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)containerWithPendingChanges
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] can't register to account token changed; error: %d%@",
    (uint8_t *)v3,
    0x12u);
  OUTLINED_FUNCTION_1();
}

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] account state changed, notifying clients%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
