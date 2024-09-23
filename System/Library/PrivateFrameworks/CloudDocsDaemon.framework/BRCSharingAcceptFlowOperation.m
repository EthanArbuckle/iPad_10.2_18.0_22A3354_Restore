@implementation BRCSharingAcceptFlowOperation

- (BRCSharingAcceptFlowOperation)initWithShareMetadata:(id)a3 client:(id)a4 session:(id)a5 userNotifier:(id)a6 userActionsNavigator:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  BRCSharingAcceptFlowOperation *v17;
  void *v18;
  uint64_t v19;
  NSURL *shareURL;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v13 = a3;
  v29 = a4;
  v14 = a5;
  v28 = a6;
  v27 = a7;
  objc_msgSend(v14, "syncContextProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sharedMetadataSyncContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  v17 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v30, sel_initWithName_syncContext_sessionContext_, CFSTR("sharing/accept-flow"), v16, v14);

  if (v17)
  {
    objc_msgSend(v13, "share");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URL");
    v19 = objc_claimAutoreleasedReturnValue();
    shareURL = v17->_shareURL;
    v17->_shareURL = (NSURL *)v19;

    objc_storeStrong((id *)&v17->_shareMetadata, a3);
    objc_storeStrong((id *)&v17->_session, a5);
    -[_BRCOperation setNonDiscretionary:](v17, "setNonDiscretionary:", 1);
    -[BRCSharingAcceptFlowOperation setQueuePriority:](v17, "setQueuePriority:", 8);
    objc_storeStrong((id *)&v17->_xpcClient, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("accept-flow-next-step", v21);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x1E0C94F88], "br_sharingMisc");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v17, "setGroup:", v24);

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_allowsDirectoryFaults = objc_msgSend(v25, "forceDeltaInitialSync") ^ 1;

    objc_storeStrong((id *)&v17->_userNotification, a6);
    objc_storeStrong((id *)&v17->_userActionsNavigator, a7);
    v17->_hadProcessedCompletionError = 0;
  }

  return v17;
}

- (void)moveDialogToFront
{
  -[BRCUserNotifier moveToFront](self->_userNotification, "moveToFront");
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sharing/accept-flow", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.clouddocs.accept-shared-url");
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)_stepNameAtIndex:(unint64_t)a3 withPrefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v6 = a4;
  if (-[NSArray count](self->_acceptationFlow, "count"))
  {
    if (-[NSArray count](self->_acceptationFlow, "count") <= a3)
    {
      v10 = CFSTR("complete");
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_acceptationFlow, "objectAtIndexedSubscript:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_1E8769030);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v6, v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = v8;
      }
      v10 = v9;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  unint64_t stepIndex;
  BOOL v4;
  unint64_t v5;
  unint64_t v6;

  stepIndex = self->_stepIndex;
  v4 = stepIndex != 0;
  v5 = stepIndex - 1;
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  return -[BRCSharingAcceptFlowOperation _stepNameAtIndex:withPrefix:](self, "_stepNameAtIndex:withPrefix:", v6, CFSTR("step:"));
}

- (void)_completeWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  int v8;
  uint64_t v9;
  const __CFString *v10;
  BRCUserNotifier *v11;
  CKShareMetadata *v12;
  void *v13;
  void *v14;
  int v15;
  BRCUserNotifier *userNotification;
  CKShareMetadata *shareMetadata;
  BRCUserNotifier *v18;
  CKShareMetadata *v19;
  void *v20;
  int v21;
  uint64_t v22;
  BRCUserNotifier *v23;
  CKShareMetadata *v24;
  BRCUserNotifier *v25;
  CKShareMetadata *v26;
  BRCUserNotifier *v27;
  CKShareMetadata *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  char v39;
  BRCUserNotifier *v40;
  CKShareMetadata *v41;
  BRCUserNotifier *v42;
  CKShareMetadata *v43;
  BRCUserNotifier *v44;
  CKShareMetadata *v45;
  BRCUserNotifier *v46;
  CKShareMetadata *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  void (**v61)(_QWORD, _QWORD);
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  void (**v66)(_QWORD, _QWORD);
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[5];
  id v72;
  void (**v73)(_QWORD, _QWORD);
  _QWORD v74[5];
  id v75;
  void (**v76)(_QWORD, _QWORD);
  _QWORD v77[5];
  id v78;
  void (**v79)(_QWORD, _QWORD);
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.5();

  }
  self->_hadProcessedCompletionError = 1;
  v5 = MEMORY[0x1E0C809B0];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke;
  v82[3] = &unk_1E875EBE8;
  v82[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A6DB0](v82);
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D10B70]);

  if (!v8)
  {
    objc_msgSend(v4, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C947D8]);

    if (v15)
    {
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 3))
      {
        userNotification = self->_userNotification;
        shareMetadata = self->_shareMetadata;
        v69[0] = v5;
        v69[1] = 3221225472;
        v69[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_36;
        v69[3] = &unk_1E875D470;
        v69[4] = self;
        v70 = v4;
        -[BRCUserNotifier showErrorDeviceOfflineForShareMetadata:reply:](userNotification, "showErrorDeviceOfflineForShareMetadata:reply:", shareMetadata, v69);
        v13 = v70;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 4))
      {
        v27 = self->_userNotification;
        v28 = self->_shareMetadata;
        v67[0] = v5;
        v67[1] = 3221225472;
        v67[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_37;
        v67[3] = &unk_1E875D470;
        v67[4] = self;
        v68 = v4;
        -[BRCUserNotifier showErrorServerNotReachableForShareMetadata:reply:](v27, "showErrorServerNotReachableForShareMetadata:reply:", v28, v67);
        v13 = v68;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 29))
      {
        v42 = self->_userNotification;
        v43 = self->_shareMetadata;
        v64[0] = v5;
        v64[1] = 3221225472;
        v64[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3;
        v64[3] = &unk_1E8764E38;
        v66 = v6;
        v64[4] = self;
        v65 = v4;
        -[BRCUserNotifier showErrorParticipantLimitReachedForShareMetadata:reply:](v42, "showErrorParticipantLimitReachedForShareMetadata:reply:", v43, v64);

        v13 = v66;
        goto LABEL_41;
      }
      if ((objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
        || (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
        || objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 10))
      {
        v46 = self->_userNotification;
        v47 = self->_shareMetadata;
        v62[0] = v5;
        v62[1] = 3221225472;
        v62[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4;
        v62[3] = &unk_1E875D470;
        v62[4] = self;
        v63 = v4;
        -[BRCUserNotifier showErrorItemUnavailableOrAccessRestrictedForShareMetadata:reply:](v46, "showErrorItemUnavailableOrAccessRestrictedForShareMetadata:reply:", v47, v62);
        v13 = v63;
        goto LABEL_41;
      }
    }
    else
    {
      objc_msgSend(v4, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

      if (v21)
      {
        v22 = objc_msgSend(v4, "code");
        if (v22 == 35)
        {
          v44 = self->_userNotification;
          v45 = self->_shareMetadata;
          v57[0] = v5;
          v57[1] = 3221225472;
          v57[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6;
          v57[3] = &unk_1E875D470;
          v57[4] = self;
          v58 = v4;
          -[BRCUserNotifier showErrorReasonUnknownForShareMetadata:reply:](v44, "showErrorReasonUnknownForShareMetadata:reply:", v45, v57);
          v13 = v58;
          goto LABEL_41;
        }
        if (v22 == 1)
        {
          v23 = self->_userNotification;
          v24 = self->_shareMetadata;
          v59[0] = v5;
          v59[1] = 3221225472;
          v59[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5;
          v59[3] = &unk_1E8764E60;
          v61 = v6;
          v59[4] = self;
          v60 = v4;
          -[BRCUserNotifier showErrorNativeAppDisabledByProfileForShareMetadata:reply:](v23, "showErrorNativeAppDisabledByProfileForShareMetadata:reply:", v24, v59);

          v13 = v61;
          goto LABEL_41;
        }
      }
    }
    goto LABEL_42;
  }
  v9 = objc_msgSend(v4, "code");
  v10 = CFSTR("appMissing");
  if (v9 <= 32)
  {
    if (v9 <= 22)
    {
      if (v9 != 1)
      {
        if (v9 == 2)
        {
          v11 = self->_userNotification;
          v12 = self->_shareMetadata;
          v74[0] = v5;
          v74[1] = 3221225472;
          v74[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34;
          v74[3] = &unk_1E8764E10;
          v74[4] = self;
          v76 = v6;
          v75 = v4;
          -[BRCUserNotifier showErrorSignInToiCloudForShareMetadata:reply:](v11, "showErrorSignInToiCloudForShareMetadata:reply:", v12, v74);

          v13 = v76;
LABEL_41:

          goto LABEL_45;
        }
        goto LABEL_42;
      }
LABEL_43:
      ((void (**)(_QWORD, const __CFString *))v6)[2](v6, v10);
      goto LABEL_44;
    }
    if (v9 != 23)
    {
      if (v9 == 29)
      {
        v25 = self->_userNotification;
        v26 = self->_shareMetadata;
        v77[0] = v5;
        v77[1] = 3221225472;
        v77[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2;
        v77[3] = &unk_1E8764E10;
        v77[4] = self;
        v79 = v6;
        v78 = v4;
        -[BRCUserNotifier showErrorInstallNativeAppForShareMetadata:reply:](v25, "showErrorInstallNativeAppForShareMetadata:reply:", v26, v77);

        v13 = v79;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
LABEL_44:
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v4);
    goto LABEL_45;
  }
  if (v9 <= 129)
  {
    if (v9 != 33)
    {
      if (v9 == 35)
      {
        v18 = self->_userNotification;
        v19 = self->_shareMetadata;
        v71[0] = v5;
        v71[1] = 3221225472;
        v71[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_35;
        v71[3] = &unk_1E8764E10;
        v71[4] = self;
        v73 = v6;
        v72 = v4;
        -[BRCUserNotifier showErrorTurnOniCloudDriveForShareMetadata:reply:](v18, "showErrorTurnOniCloudDriveForShareMetadata:reply:", v19, v71);

        v13 = v73;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if (v9 == 138)
    goto LABEL_43;
  if (v9 != 130)
  {
LABEL_42:
    v10 = CFSTR("other");
    goto LABEL_43;
  }
  v29 = v4;
  objc_msgSend(v29, "underlyingErrors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31 != 1)
  {
    brc_bread_crumbs();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.4();

  }
  objc_msgSend(v29, "underlyingErrors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33 == 1)
  {
    objc_msgSend(v29, "underlyingErrors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = objc_claimAutoreleasedReturnValue();

    v29 = (id)v35;
  }
  if (!self->_shareMetadata)
  {
    brc_bread_crumbs();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.3();

  }
  brc_bread_crumbs();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
    -[BRCSharingAcceptFlowOperation _completeWithError:].cold.2((uint64_t)v29);

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isNetworkReachable");

  if ((v39 & 1) != 0)
  {
    v40 = self->_userNotification;
    v41 = self->_shareMetadata;
    v80[0] = v5;
    v80[1] = 3221225472;
    v80[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_31;
    v80[3] = &unk_1E875D470;
    v80[4] = self;
    v81 = v29;
    -[BRCUserNotifier showErrorReasonUnknownForShareMetadata:reply:](v40, "showErrorReasonUnknownForShareMetadata:reply:", v41, v80);

  }
  else
  {
    brc_bread_crumbs();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C947D8], 3, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v50);

  }
LABEL_45:

}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1((uint64_t)v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "openShareURLInWebBrowser:withReason:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544), v3);
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;

  v7 = a4;
  if (a2 && a3)
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2();

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 544);
    if (!v9)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 544);
    }
    v10 = *(void **)(v8 + 512);
    objc_msgSend(v9, "brc_applicationBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openAppStoreForBundleID:", v11);

    goto LABEL_11;
  }
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));

}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;

  v7 = a4;
  if (a2 && a3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34_cold_1();

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "openiCloudSettings");
    goto LABEL_10;
  }
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));

}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_35(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;

  v7 = a4;
  if (a2 && a3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34_cold_1();

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "openiCloudSettings");
    goto LABEL_10;
  }
  if (a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));

}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_36(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5(uint64_t a1, int a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSURL *shareURL;
  NSObject *v14;
  BRCAccountSession *session;
  NSObject *v16;
  NSURL *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  objc_super v30;
  _QWORD block[5];
  uint8_t buf[4];
  NSURL *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    v8 = CFSTR("folderShare-");
  }
  else if (-[BRCSharingAcceptFlowOperation _isiWorkShare](self, "_isiWorkShare"))
  {
    v8 = CFSTR("iWorkShare-");
  }
  else
  {
    v8 = CFSTR("documentShare-");
  }
  -[BRCSharingAcceptFlowOperation _stepNameAtIndex:withPrefix:](self, "_stepNameAtIndex:withPrefix:", self->_stepIndex, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    brc_bread_crumbs();
    v11 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      shareURL = self->_shareURL;
      *(_DWORD *)buf = 138412802;
      v33 = shareURL;
      v34 = 2112;
      v35 = v7;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ failed with error %@%@", buf, 0x20u);
    }

    if ((-[BRCSharingAcceptFlowOperation isCancelled](self, "isCancelled") & 1) == 0
      && !self->_hadProcessedCompletionError)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[BRCSharingAcceptFlowOperation finishWithResult:error:].cold.2();

    }
    -[BRCSharingAcceptFlowOperation _activateSharedZoneIfNeeded](self, "_activateSharedZoneIfNeeded");
    -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v14 = objc_claimAutoreleasedReturnValue();
    session = self->_session;
    if (session && !-[BRCAccountSession isCancelled](session, "isCancelled"))
    {
      if (v14)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke;
        block[3] = &unk_1E875D500;
        block[4] = self;
        dispatch_async(v14, block);
      }
      else
      {
        brc_bread_crumbs();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          -[BRCSharingAcceptFlowOperation finishWithResult:error:].cold.1();

      }
    }
  }
  else
  {
    brc_bread_crumbs();
    v14 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_shareURL;
      -[NSURL path](self->_liveFileURL, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ succeed and document is now live on disk at %@%@", buf, 0x20u);

    }
  }

  +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCClientZone mangledID](self->_clientZone, "mangledID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[BRCClientZone enhancedDrivePrivacyEnabled](self->_clientZone, "enhancedDrivePrivacyEnabled");
  -[BRCItemID itemIDString](self->_linkItemID, "itemIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession analyticsReporter](self->_session, "analyticsReporter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerAndSendNewShareAcceptationWithLastStep:zoneMangledID:enhancedDrivePrivacyEnabled:itemIDString:error:analyticsReporter:", v10, v20, v21, v22, v7, v23);

  -[BRCAppLibrary removeForegroundClient:](self->_appLibrary, "removeForegroundClient:", self);
  if (!-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
  {
    -[BRCClientZone serverZone](self->_clientZone, "serverZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeForegroundClient:", self);

  }
  -[BRCUserNotifier close](self->_userNotification, "close");
  if (self->_shareID)
  {
    +[BRCSharingAcceptFlowOperation _runningShareIDs](BRCSharingAcceptFlowOperation, "_runningShareIDs");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v25);
    objc_msgSend(v25, "removeObject:", self->_shareID);
    objc_sync_exit(v25);

  }
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  -[_BRCOperation finishWithResult:error:](&v30, sel_finishWithResult_error_, v6, v7);

}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 576))
  {
    objc_msgSend(*(id *)(v2 + 600), "itemByItemID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "isShareAcceptationFault"))
    {
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();

      objc_msgSend(v4, "asShareAcceptationFault");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteShareAcceptationFault");

    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend((id)v2, "_isLinkInsideFolderShare"))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v8 + 584))
    {
      objc_msgSend(*(id *)(v8 + 600), "itemByItemID:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && objc_msgSend(v9, "isShareAcceptationFault"))
      {
        brc_bread_crumbs();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();

        objc_msgSend(v10, "asShareAcceptationFault");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deleteShareAcceptationFault");

      }
    }
  }
}

- (void)main
{
  void *v3;
  NSObject *v4;
  NSURL *shareURL;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *acceptationFlow;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
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
  _QWORD v35[18];
  _QWORD v36[21];
  _QWORD v37[21];
  uint8_t buf[4];
  NSURL *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    shareURL = self->_shareURL;
    *(_DWORD *)buf = 138412546;
    v39 = shareURL;
    v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] User clicked on share link %@%@", buf, 0x16u);
  }

  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    NSStringFromSelector(sel__isAppInstalled_step);
    v24 = objc_claimAutoreleasedReturnValue();
    v37[0] = v24;
    NSStringFromSelector(sel__isFolderSharingSupported_step);
    v22 = objc_claimAutoreleasedReturnValue();
    v37[1] = v22;
    NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v34;
    NSStringFromSelector(sel__showSharingJoinDialog_step);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v33;
    NSStringFromSelector(sel__parseShareMetadata_step);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v32;
    NSStringFromSelector(sel__startShareAccept_step);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v31;
    NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v30;
    NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[7] = v29;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[8] = v28;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[9] = v27;
    NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[10] = v26;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[11] = v25;
    NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[12] = v6;
    NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37[13] = v7;
    NSStringFromSelector(sel__finishShareAccept_step);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[14] = v8;
    NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[15] = v9;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[16] = v10;
    NSStringFromSelector(sel__locateSharedItemOnDisk_step);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[17] = v11;
    NSStringFromSelector(sel__setSpotlightAttribute_step);
    acceptationFlow = (void *)objc_claimAutoreleasedReturnValue();
    v37[18] = acceptationFlow;
    NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[19] = v13;
    NSStringFromSelector(sel__endAcceptationFlow_step);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37[20] = v14;
    v15 = (void *)MEMORY[0x1E0C99D20];
    v16 = v37;
  }
  else
  {
    if (!-[BRCSharingAcceptFlowOperation _isiWorkShare](self, "_isiWorkShare"))
    {
      NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v20;
      NSStringFromSelector(sel__showSharingJoinDialog_step);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v19;
      NSStringFromSelector(sel__parseShareMetadata_step);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v34;
      NSStringFromSelector(sel__startShareAccept_step);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[3] = v33;
      NSStringFromSelector(sel__locateSharedItemOnOwner_step);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35[4] = v32;
      NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[5] = v31;
      NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[6] = v30;
      NSStringFromSelector(sel__createSideFaultOnDisk_step);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35[7] = v29;
      NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35[8] = v28;
      NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[9] = v27;
      NSStringFromSelector(sel__openSharedSideFaultFile_step);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[10] = v26;
      NSStringFromSelector(sel__finishShareAccept_step);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[11] = v25;
      NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v35[12] = v6;
      NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v35[13] = v7;
      NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v35[14] = v8;
      NSStringFromSelector(sel__setSpotlightAttribute_step);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35[15] = v9;
      NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35[16] = v10;
      NSStringFromSelector(sel__endAcceptationFlow_step);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35[17] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 18);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
      acceptationFlow = self->_acceptationFlow;
      self->_acceptationFlow = v21;
      goto LABEL_9;
    }
    NSStringFromSelector(sel__isAppInstalled_step);
    v24 = objc_claimAutoreleasedReturnValue();
    v36[0] = v24;
    NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v22 = objc_claimAutoreleasedReturnValue();
    v36[1] = v22;
    NSStringFromSelector(sel__isAccountRestricted_step);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v34;
    NSStringFromSelector(sel__showSharingJoinDialog_step);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v33;
    NSStringFromSelector(sel__parseShareMetadata_step);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v32;
    NSStringFromSelector(sel__startShareAccept_step);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v31;
    NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[6] = v30;
    NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[7] = v29;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[8] = v28;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[9] = v27;
    NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[10] = v26;
    NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[11] = v25;
    NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36[12] = v6;
    NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36[13] = v7;
    NSStringFromSelector(sel__finishShareAccept_step);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[14] = v8;
    NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[15] = v9;
    NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[16] = v10;
    NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[17] = v11;
    NSStringFromSelector(sel__setSpotlightAttribute_step);
    acceptationFlow = (void *)objc_claimAutoreleasedReturnValue();
    v36[18] = acceptationFlow;
    NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[19] = v13;
    NSStringFromSelector(sel__endAcceptationFlow_step);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[20] = v14;
    v15 = (void *)MEMORY[0x1E0C99D20];
    v16 = v36;
  }
  objc_msgSend(v15, "arrayWithObjects:count:", v16, 21, v22);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_acceptationFlow;
  self->_acceptationFlow = v17;

  v19 = v23;
  v20 = (void *)v24;
LABEL_9:

  self->_stepIndex = 0;
  -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
}

- (void)_performNextStepInQueue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Accept flow completed successfully.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_performNextStep
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStepInQueue");
}

- (void)_jumpToSelectorInQueue:(SEL)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSStringFromSelector(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](self->_acceptationFlow, "indexOfObject:");
  if (v5 >= -[NSArray count](self->_acceptationFlow, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 84, CFSTR("can't fast forward to download step (currentIndex: %lu, downloadIndex: %lu, stepCount: %lu)"), self->_stepIndex, v5, -[NSArray count](self->_acceptationFlow, "count"));
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v6;
    -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v6);

    goto LABEL_7;
  }
  if (self->_stepIndex >= v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10B70], 10, CFSTR("can't fast forward to download step from current position (currentIndex: %lu)"), self->_stepIndex);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  self->_stepIndex = v5;
  -[BRCSharingAcceptFlowOperation _performNextStepInQueue](self, "_performNextStepInQueue");
LABEL_7:

}

- (void)_jumpToSelector:(SEL)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke;
  v4[3] = &unk_1E875F828;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_jumpToSelectorInQueue:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_isOwner
{
  CKShareMetadata *shareMetadata;
  void *v5;
  NSObject *v6;

  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.3();

    shareMetadata = self->_shareMetadata;
  }
  return -[CKShareMetadata participantRole](shareMetadata, "participantRole") == CKShareParticipantRoleOwner;
}

- (BOOL)_isOwnerOrShareAlreadyAccepted
{
  CKShareMetadata *shareMetadata;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.3();

    shareMetadata = self->_shareMetadata;
  }
  v4 = -[CKShareMetadata participantRole](shareMetadata, "participantRole");
  if (v4 != 1)
    LOBYTE(v4) = -[CKShareMetadata participantStatus](self->_shareMetadata, "participantStatus") == CKShareParticipantAcceptanceStatusAccepted;
  return v4;
}

- (BOOL)_isFolderShare
{
  void *v2;
  char v3;

  -[CKShareMetadata share](self->_shareMetadata, "share");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFolderShare");

  return v3;
}

- (BOOL)_isLinkInsideFolderShare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    -[CKShareMetadata sharedItemHierarchyIDs](self->_shareMetadata, "sharedItemHierarchyIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRecordID brc_shareItemID](self->_shareID, "brc_shareItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v7 = objc_msgSend(v5, "isEqualToItemID:", v6) ^ 1;
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_isDocumentLinkInsideFolderShare
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[BRCSharingAcceptFlowOperation _isLinkInsideFolderShare](self, "_isLinkInsideFolderShare");
  if (v3)
  {
    -[CKShareMetadata sharedItemHierarchyIDs](self->_shareMetadata, "sharedItemHierarchyIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("documentContent/"));

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_isDirectoryLinkInsideFolderShare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (!-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
    return 0;
  -[CKShareMetadata sharedItemHierarchyIDs](self->_shareMetadata, "sharedItemHierarchyIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecordID brc_shareItemID](self->_shareID, "brc_shareItemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToItemID:", v6))
  {
    objc_msgSend(v4, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("directory/"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isiWorkLinkInsideFolderShare
{
  void *v3;
  BOOL v4;

  if (!-[BRCSharingAcceptFlowOperation _isDocumentLinkInsideFolderShare](self, "_isDocumentLinkInsideFolderShare"))
    return 0;
  -[NSURL brc_applicationContainerID](self->_shareURL, "brc_applicationContainerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)_isiWorkShare
{
  CKShareMetadata *shareMetadata;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSURL *shareURL;
  void *v16;
  void *v18;
  NSObject *v19;

  shareMetadata = self->_shareMetadata;
  if (shareMetadata)
  {
    -[CKShareMetadata share](shareMetadata, "share");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFolderShare");

    if ((v5 & 1) != 0)
      return 0;
    -[CKShareMetadata share](self->_shareMetadata, "share");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "brc_applicationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      return 0;
    }
    else
    {
      -[CKShareMetadata share](self->_shareMetadata, "share");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "brc_sharedRootExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(MEMORY[0x1E0D10F00], "iWorkShareableExtensions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "containsObject:", v10);
      }
      else
      {
        v14 = 1;
      }

    }
  }
  else
  {
    shareURL = self->_shareURL;
    if (!shareURL)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[BRCSharingAcceptFlowOperation _isiWorkShare].cold.1();

      shareURL = self->_shareURL;
    }
    -[NSURL brc_applicationContainerID](shareURL, "brc_applicationContainerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16 != 0;

  }
  return v14;
}

- (void)_captureOpenInfoFromItem:(id)a3
{
  id v4;
  BRCItemToPathLookup *v5;
  NSURL *v6;
  NSURL *liveFileURL;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v4);
  -[BRCItemToPathLookup coordinatedWriteURL](v5, "coordinatedWriteURL");
  v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
  liveFileURL = self->_liveFileURL;
  self->_liveFileURL = v6;

  -[BRCItemToPathLookup closePaths](v5, "closePaths");
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[NSURL path](self->_liveFileURL, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v10;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] share item URL is %@ for %@%@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)_activateSharedZoneIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx activating shared zone%@");
  OUTLINED_FUNCTION_2();
}

uint64_t __60__BRCSharingAcceptFlowOperation__activateSharedZoneIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "resume");
}

- (void)openResourceOperationDidComplete:(id)a3
{
  void *v4;
  NSObject *v5;

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRCSharingAcceptFlowOperation openResourceOperationDidComplete:].cold.1();

  -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a4;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    -[BRCSharingAcceptFlowOperation openResourceOperation:didFailWithError:].cold.1((uint64_t)v5);

  objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v8);

}

- (void)_isFolderSharingSupported_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx checking if document sharing is supported%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isAppInstalled_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Check if app is installed%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isUserSignedInToiCloudDrive_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Check if a user is signed in to iCloud and iCloud Drive is turned on%@");
  OUTLINED_FUNCTION_2();
}

- (void)_isAccountRestricted_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Check if app is profile disabled%@");
  OUTLINED_FUNCTION_2();
}

- (void)_showSharingJoinDialog_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Show sharing join dialog%@");
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v5);
  }
  else
  {
    if ((a2 & 1) != 0)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has accepted to open shared document at %@%@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_118;
      block[3] = &unk_1E875D500;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v9, block);
    }
    else
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has refused to open shared document at %@%@", buf, 0x16u);
      }

      v13 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorOperationCancelled");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_completeWithError:", v9);
    }

  }
}

uint64_t __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_parseShareMetadata_step
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Pre-creating accept operation to block next sync down %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __57__BRCSharingAcceptFlowOperation__parseShareMetadata_step__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 520);
  objc_msgSend(*(id *)(v1 + 560), "share");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "learnParticipantIdentitiesForShare:forceUpdate:", v3, 1);

}

- (void)_startShareAccept_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Start accepting share URL%@");
  OUTLINED_FUNCTION_2();
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = *(_OWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 56);
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v22 = (id)v19;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v7;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received share access completion - metadata %@, operationError - %@%@", buf, 0x2Au);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
      goto LABEL_5;
    objc_msgSend(v5, "share");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)WeakRetained + 69);
    *((_QWORD *)WeakRetained + 69) = v14;

    if (*((_QWORD *)WeakRetained + 69))
      goto LABEL_9;
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: No operation error and no share id"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v6;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to accept share - %@%@", buf, 0x16u);
      }

      v6 = v6;
      v12 = (void *)*((_QWORD *)WeakRetained + 86);
      *((_QWORD *)WeakRetained + 86) = v6;
    }
    else
    {
LABEL_9:
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1();

      v6 = 0;
    }

    dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 81));
  }

  __brc_leave_section((uint64_t *)&v19);
}

- (void)_openiWorkAppPreemptively_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _linkItemID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BRCSharingAcceptFlowOperation__openiWorkAppPreemptively_step__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isLive") & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v3, "isLost") ^ 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (void)_locateSharedItemOnOwner_step
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  BRCAccountSession *v8;
  BRCItemID *v9;
  BRCClientZone *v10;
  BRCItemID *v11;
  BRCClientZone *v12;
  BRCAccountSession *v13;
  _QWORD v14[5];
  BRCAccountSession *v15;
  BRCClientZone *v16;
  BRCItemID *v17;

  if (!-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
    goto LABEL_3;
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 & objc_msgSend(v6, "state");

  if ((v7 & 4) == 0)
  {
    v8 = self->_session;
    v9 = self->_linkItemID;
    v10 = self->_clientZone;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke;
    v14[3] = &unk_1E8760988;
    v14[4] = self;
    v15 = v8;
    v16 = v10;
    v17 = v9;
    v11 = v9;
    v12 = v10;
    v13 = v8;
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:](self, "_createServerFaultIfPossibleWithCompletion:", v14);

  }
  else
  {
LABEL_3:
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_completeWithError:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "clientDB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2;
    block[3] = &unk_1E875DD30;
    v11 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v12 = v6;
    v13 = v7;
    v14 = v8;
    dispatch_async(v5, block);

  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "itemByItemID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "st");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serverItemByItemID:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentItemIDOnServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 48), "_performNextStep");
      goto LABEL_10;
    }
  }
  if ((objc_msgSend(v2, "isOnDisk") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3;
    v10[3] = &unk_1E875E948;
    v8 = *(id *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v7, "addFetchParentChainCompletionBlock:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_performNextStep");
  }

LABEL_10:
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4;
  block[3] = &unk_1E875D500;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v3, block);

}

uint64_t __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_waitForSharedItemToSyncDownOnOwner_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Wait for shared item to sync down%@");
  OUTLINED_FUNCTION_2();
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2;
  v5[3] = &unk_1E8760EE0;
  v6 = a2;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_with_logs_12(v4, v5);

}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
  }
  else
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1();

    v4 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_sharedRootDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "brc_errorItemNotFound:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "brc_errorItemNotFound:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_completeWithError:", v10);

  }
}

- (void)_waitForSharedItemToBeOnDiskOnOwner_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Wait for item to be on disk%@");
  OUTLINED_FUNCTION_2();
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2;
  v6[3] = &unk_1E8760EE0;
  v7 = a2;
  v6[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_with_logs_12(v5, v6);

}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_3;
    v13[3] = &unk_1E875D500;
    v13[4] = *(_QWORD *)(a1 + 32);
    dispatch_async_with_logs_12(v2, v13);

  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576);
      *(_DWORD *)buf = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found as a fault.  We must have reset or be broken structure or it was deleted locally.%@", buf, 0x16u);
    }

    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "brc_sharedRootDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "brc_errorItemNotFound:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "brc_errorItemNotFound:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_completeWithError:", v12);

  }
}

uint64_t __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_createSideFaultOnDisk_step
{
  NSObject *v3;
  _QWORD block[5];

  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(v3, block);

}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  dispatch_group_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29[3];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 544))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 560))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_3();

  }
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createSideFaultOnDisk_step]_block_invoke", 1385, v29);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2();

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v5 = dispatch_group_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126;
  v17[3] = &unk_1E8764EB0;
  v17[4] = *(_QWORD *)(a1 + 32);
  v19 = &v21;
  v20 = &v25;
  v8 = v5;
  v18 = v8;
  objc_msgSend(v6, "groupInBatch:", v17);

  if (!*((_BYTE *)v26 + 24))
  {
    if (*((_BYTE *)v22 + 24))
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_jumpToSelector:", sel__openSharedSideFaultFile_step);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientTruthWorkloop");
      v11 = objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_142;
      v16[3] = &unk_1E875D500;
      v16[4] = *(_QWORD *)(a1 + 32);
      dispatch_group_notify(v8, v11, v16);

    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  __brc_leave_section(v29);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  BRCShareAcceptationDocumentFault *v5;
  BRCShareAcceptationDocumentFault *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  BRCShareAcceptationDocumentFault *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BRCShareAcceptationDocumentFault *v29;
  BRCShareAcceptationDocumentFault *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  BRCShareAcceptationDirectoryFault *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  BRCShareAcceptationDirectoryFault *v39;
  uint64_t v40;
  __objc2_class *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  BRCItemToPathLookup *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  BRCURLToItemLookup *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  BRCItemToPathLookup *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  BRCShareAcceptationDocumentFault *v74;
  void *v75;
  int v76;
  id v77;
  void *v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  BRCItemToPathLookup *v83;
  BRCShareAcceptationDocumentFault *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  id v89;
  void *v90;
  NSObject *v91;
  void *v92;
  int v93;
  id v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  id v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  id v109;
  void *v110;
  NSObject *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  BRCURLToItemLookup *v116;
  void *v117;
  void *v118;
  BRCItemToPathLookup *v119;
  BRCItemToPathLookup *v120;
  uint64_t v121;
  BRCShareAcceptationDocumentFault *v122;
  uint64_t v123;
  BRCShareAcceptationDocumentFault *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  int v131;
  id v132;
  _QWORD block[6];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 576);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 584);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "itemByItemID:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_isLinkInsideFolderShare") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "itemByItemID:", v3);
    v5 = (BRCShareAcceptationDocumentFault *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 656);
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 664);
  v9 = v8;
  if (!v4)
  {
    v126 = v8;
    v12 = objc_msgSend(*(id *)(a1 + 32), "_isOwner");
    v13 = *(id **)(a1 + 32);
    v127 = v7;
    if (v12)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: document doesn't exists anymore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_completeWithError:", v16);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v7 = v127;
      goto LABEL_94;
    }
    v125 = v3;
    objc_msgSend(v13[76], "recreateDocumentsFolderIfNeededOnDisk");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "participantPermission") == 2)
      v21 = 100;
    else
      v21 = 68;
    v124 = v6;
    if (objc_msgSend(*(id *)(a1 + 32), "_isFolderShare"))
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "_isLinkInsideFolderShare") & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v3, 1, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "beginObservingChangesWithDelegate:", 0);

      }
      v23 = *(NSObject **)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "serverTruthWorkloop");
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_133;
      block[3] = &unk_1E875D500;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_group_async(v23, v24, block);

      if (v6)
      {
        v121 = 0;
        v7 = v127;
      }
      else
      {
        v35 = [BRCShareAcceptationDirectoryFault alloc];
        v36 = *(_QWORD *)(a1 + 32);
        v37 = *(_QWORD *)(v36 + 608);
        objc_msgSend(*(id *)(v36 + 600), "asSharedClientZone");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v35;
        v7 = v127;
        v121 = -[BRCShareAcceptationDirectoryFault initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:](v39, "initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:", v127, v3, 0, v37, v38, v21);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "_isLinkInsideFolderShare"))
      {
        v40 = v21 & 0x60;
        if (objc_msgSend(*(id *)(a1 + 32), "_isDocumentLinkInsideFolderShare"))
        {
          v41 = BRCShareAcceptationDocumentFault;
        }
        else
        {
          if (!objc_msgSend(*(id *)(a1 + 32), "_isDirectoryLinkInsideFolderShare"))
          {
            v99 = *(void **)(a1 + 32);
            brc_bread_crumbs();
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_10();

            objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: item isn't a document or directory"));
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "_completeWithError:", v102);

            v51 = 0;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
            v6 = v124;
            v7 = v127;
            v30 = (BRCShareAcceptationDocumentFault *)v121;
            goto LABEL_93;
          }
          v41 = BRCShareAcceptationDirectoryFault;
        }
        v42 = [v41 alloc];
        v43 = *(_QWORD *)(a1 + 32);
        v44 = *(_QWORD *)(v43 + 608);
        objc_msgSend(*(id *)(v43 + 600), "asSharedClientZone");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v42, "initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:", v126, v2, v3, v44, v45, v40);

        v7 = v127;
        v30 = (BRCShareAcceptationDocumentFault *)v121;
        v31 = (void *)v46;
      }
      else
      {
        v31 = 0;
        v30 = (BRCShareAcceptationDocumentFault *)v121;
      }
    }
    else
    {
      v25 = [BRCShareAcceptationDocumentFault alloc];
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(_QWORD *)(v26 + 608);
      objc_msgSend(*(id *)(v26 + 600), "asSharedClientZone");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v25;
      v7 = v127;
      v30 = -[BRCShareAcceptationDocumentFault initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:](v29, "initWithFilename:itemID:parentIDWhenSubitem:appLibrary:clientZone:sharingOptions:", v127, v3, 0, v27, v28, v21);

      v31 = 0;
    }
    -[BRCShareAcceptationDocumentFault stageShareAcceptationFaultWithName:](v30, "stageShareAcceptationFaultWithName:", v7);
    -[BRCLocalItem saveToDBForServerEdit:keepAliases:](v30, "saveToDBForServerEdit:keepAliases:", 1, 0);
    objc_msgSend(v31, "stageShareAcceptationFaultWithName:", v126);
    objc_msgSend(v31, "saveToDBForServerEdit:keepAliases:", 1, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "flush");

    brc_bread_crumbs();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v49 = (uint64_t)v31;
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_9((uint64_t)v30);

    v6 = v124;
    v51 = (void *)v49;
    v123 = v49;
    if (v49)
    {
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_8(v49);

      v51 = (void *)v49;
    }
    if (!v30)
      goto LABEL_65;
    v54 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v30);
    -[BRCItemToPathLookup byPath](v54, "byPath");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](v30, "st");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "logicalName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "logicalURLWithLogicalName:", v57);
    v58 = objc_claimAutoreleasedReturnValue();

    v117 = (void *)v58;
    v59 = -[BRCURLToItemLookup initWithURL:session:]([BRCURLToItemLookup alloc], "initWithURL:session:", v58, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));
    if (-[BRCURLToItemLookup resolveAndKeepOpenWithError:](v59, "resolveAndKeepOpenWithError:", 0))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "fsWriter");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "computeSourceBounceNumberIfNecessaryWithLookup:localItem:serverItem:", v59, v30, 0);

      if (v61)
      {
        -[BRCLocalItem bounceReservedItemWithBounceNumber:](v30, "bounceReservedItemWithBounceNumber:", v61);
        -[BRCLocalItem st](v30, "st");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "logicalName");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCShareAcceptationDocumentFault stageShareAcceptationFaultWithName:](v30, "stageShareAcceptationFaultWithName:", v63);

        -[BRCLocalItem saveToDBForServerEdit:keepAliases:](v30, "saveToDBForServerEdit:keepAliases:", 1, 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "flush");

        v65 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v30);
        -[BRCLocalItem st](v30, "st");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "logicalName");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = v65;
      }
      else
      {
        v67 = v127;
      }
      -[BRCURLToItemLookup closePaths](v59, "closePaths");
    }
    else
    {
      v67 = v127;
    }
    v128 = v67;
    v116 = v59;
    if (objc_msgSend(*(id *)(a1 + 32), "_isFolderShare"))
    {
      v68 = v67;
    }
    else
    {
      objc_msgSend(v67, "br_sideFaultName");
      v68 = (id)objc_claimAutoreleasedReturnValue();
    }
    v69 = v68;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "stageRegistry");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCLocalItem st](v30, "st");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "stagedFileID");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "unsignedLongLongValue");
    v119 = v54;
    -[BRCItemToPathLookup byPath](v54, "byPath");
    v74 = v30;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = 0;
    v115 = v69;
    v76 = objc_msgSend(v70, "moveFromStage:toPath:fileName:error:", v73, v75, v69, &v132);
    v77 = v132;

    if ((v76 & 1) != 0)
    {
      -[BRCShareAcceptationDocumentFault markLiveFromStageAsShareAcceptationFault](v74, "markLiveFromStageAsShareAcceptationFault");
      -[BRCLocalItem saveToDB](v74, "saveToDB");
      brc_bread_crumbs();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v79 = objc_claimAutoreleasedReturnValue();
      v30 = v74;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_6((uint64_t)v74);

    }
    else
    {
      brc_bread_crumbs();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, (os_log_type_t)0x90u))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_4((uint64_t)v77);

      objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v77);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v30 = v74;
    }

    v6 = v124;
    v3 = v125;
    v7 = v128;
    v51 = (void *)v123;
    if (v76)
    {
LABEL_65:
      v82 = v30;
      if (!v51)
        goto LABEL_92;
      v83 = [BRCItemToPathLookup alloc];
      v84 = v30 ? v30 : v6;
      v120 = -[BRCItemToPathLookup initWithItem:](v83, "initWithItem:", v84);
      -[BRCItemToPathLookup byPath](v120, "byPath");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "pathWithChildAtPath:", v126);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v131 = 0;
      if ((objc_msgSend(v86, "resolveMustExist:error:", 0, &v131) & 1) != 0)
      {
        v87 = objc_msgSend(v86, "exists");
        v88 = *(void **)(a1 + 32);
        v122 = v30;
        if (v87)
        {
          v89 = v7;
          brc_bread_crumbs();
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
            __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_2();

          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: child path already exists even though we should have just created the parent"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "_completeWithError:", v92);

          v93 = 1;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          v7 = v89;
          v30 = v122;
        }
        else
        {
          v129 = v7;
          if ((objc_msgSend(v88, "_isDocumentLinkInsideFolderShare") & 1) != 0)
          {
            objc_msgSend(v126, "br_sideFaultName");
            v98 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v98 = v126;
          }
          v103 = v98;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "stageRegistry");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "st");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "stagedFileID");
          v106 = v51;
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = 0;
          v118 = v103;
          v108 = objc_msgSend(v104, "moveFromStage:toPath:fileName:error:", objc_msgSend(v107, "unsignedLongLongValue"), v86, v103, &v130);
          v109 = v130;

          if ((v108 & 1) != 0)
          {
            objc_msgSend(v106, "markLiveFromStageAsShareAcceptationFault");
            objc_msgSend(v106, "saveToDB");
            brc_bread_crumbs();
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v111 = objc_claimAutoreleasedReturnValue();
            v30 = v122;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_3(v123);

            v93 = 0;
          }
          else
          {
            brc_bread_crumbs();
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v113 = objc_claimAutoreleasedReturnValue();
            v30 = v122;
            if (os_log_type_enabled(v113, (os_log_type_t)0x90u))
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_4((uint64_t)v109);

            objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v109);
            v93 = 1;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          }

          v6 = v124;
          v7 = v129;
        }
      }
      else
      {
        v94 = v7;
        brc_bread_crumbs();
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, (os_log_type_t)0x90u))
          __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_5((uint64_t)v95, v96, v97);

        objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", 0);
        v93 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        v7 = v94;
      }
      v51 = (void *)v123;

      v82 = (void *)v123;
      v3 = v125;
      if (!v93)
      {
LABEL_92:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "flushToMakeEditsVisibleToIPCReaders");

        objc_msgSend(*(id *)(a1 + 32), "_captureOpenInfoFromItem:", v82);
      }
    }
LABEL_93:

LABEL_94:
    v9 = v126;
    goto LABEL_95;
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_13((uint64_t)v4);

  if (objc_msgSend(v4, "isLive"))
  {
    if ((objc_msgSend(v4, "isShareAcceptationFault") & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_captureOpenInfoFromItem:", v4);
  }
  else
  {
    if ((objc_msgSend(v4, "isAlmostDead") & 1) != 0 || objc_msgSend(v4, "isReserved"))
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_11((uint64_t)v4);

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0CB2FE0], 35, CFSTR("Share %@ can not be accepted right now."), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 32);
    }
    else
    {
      v32 = *(void **)(a1 + 32);
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_12((uint64_t)v4);

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: item is in an unknown state: %@:"), v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v32;
    }
    objc_msgSend(v20, "_completeWithError:", v19);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_95:

}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_133(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "serverZone");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearStateBits:", 4);

}

uint64_t __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_142(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_openSharedSideFaultFileWithAppID:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *v7;
  void *v8;
  NSObject *v9;
  NSURL *v10;
  id v11;
  id v12;

  v4 = a3;
  -[CKRecordID recordName](self->_shareID, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_liveFileURL;
  v7 = v6;
  if (self->_skipOpenInApp)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:].cold.1();

    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    v10 = v6;
    v11 = v4;
    v12 = v5;
    FPExtendBookmarkForDocumentURL();

  }
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v5;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Got bookmark string %@ for URL %@%@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CA5818];
    v21[0] = *MEMORY[0x1E0CA57E0];
    v21[1] = v9;
    v22[0] = v5;
    v22[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(a1, (uint64_t)v11, v12);

    objc_msgSend(v8, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), BRCurrentPersonaIsDataSeparated(), 0, v10, 0, *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addSubOperation:", v13);

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D10B70];
    if (a3)
    {
      v29 = *MEMORY[0x1E0CB3388];
      v30[0] = a3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(*(id *)(a1 + 32), "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "br_errorWithDomain:code:userInfo:description:", v15, 10, v16, CFSTR("Can't get bookmark string at %@"), v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v18, v19);

    objc_msgSend(*(id *)(a1 + 40), "_completeWithError:", v8);
  }

}

- (void)_openDocumentInDocumentsAppIfInstalled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BRCUserNotifier *userNotification;
  NSURL *shareURL;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  if (self->_skipOpenInApp)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:].cold.1();

    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.DocumentsApp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInstalled");

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v4, 0);
      objc_msgSend(v11, "setScheme:", CFSTR("shareddocuments"));
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v10, "openSensitiveURL:withOptions:error:", v12, 0, &v18);
      v13 = v18;

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v14);

      }
      else
      {
        -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
      }

    }
    else
    {
      userNotification = self->_userNotification;
      shareURL = self->_shareURL;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke;
      v17[3] = &unk_1E875D500;
      v17[4] = self;
      -[BRCUserNotifier showErrorDocumentsAppNotVisibleForShareURL:reply:](userNotification, "showErrorDocumentsAppNotVisibleForShareURL:reply:", shareURL, v17);
    }

  }
}

uint64_t __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_openSharedSideFaultFile_step
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _liveFileURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_finishShareAccept_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Waiting for share accept to finish%@");
  OUTLINED_FUNCTION_2();
}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 688);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1((uint64_t)v2);

  if ((objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 3) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 4) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 29) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
    || objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 10))
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v2);
    goto LABEL_10;
  }
  if (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 9))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v8 = (void *)v6;
    objc_msgSend(v5, "_completeWithError:", v6);

    goto LABEL_10;
  }
  v7 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(v7, "_performNextStep");
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "finishIfCancelled") & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v2);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_10:

}

- (void)_createServerFaultIfPossibleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  uint64_t v15[3];

  v4 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]", 1844, v15);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:].cold.3();

  if (!self->_clientZone)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:].cold.2();

  }
  if (!self->_linkItemID)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _openiWorkAppPreemptively_step].cold.1();

  }
  if (self->_allowsDirectoryFaults)
  {
    -[BRCClientZone db](self->_clientZone, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke;
    block[3] = &unk_1E875EAA8;
    block[4] = self;
    v14 = v4;
    dispatch_async(v8, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }
  __brc_leave_section(v15);

}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  int v30;
  id *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_performNextStep");
    return;
  }
  v4 = objc_msgSend(v3, "_isDocumentLinkInsideFolderShare");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "sharedItemHierarchyIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v4)
    v7 = 2;
  else
    v7 = 1;

  if (v6 <= v7)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_isOwner")
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "isEqualToItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584)) & 1) == 0&& (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584)), v33 = (void *)objc_claimAutoreleasedReturnValue(), v33, v33))
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
      return;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "serverZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "rootRecordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]([BRCFetchRecordSubResourcesOperation alloc], "initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:", v8, *(_QWORD *)(a1 + 32), 0, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(v10, "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552));
  objc_msgSend(v9, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "hasPrefix:", CFSTR("documentContent/")))
    goto LABEL_10;
  v13 = objc_msgSend(v8, "isPrivateZone");

  if (v13)
  {
    objc_msgSend(v9, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "substringFromIndex:", objc_msgSend(CFSTR("documentContent/"), "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("documentStructure/"), "stringByAppendingString:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v9, "zoneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithRecordName:zoneID:", v15, v17);

    objc_msgSend(v10, "addObject:", v18);
LABEL_10:

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "sharedItemHierarchyIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v21);
  }

  if (!v9)
  {
    brc_bread_crumbs();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1();

  }
  v24 = objc_alloc(MEMORY[0x1E0C94E18]);
  objc_msgSend(v10, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithRecordIDs:", v25);

  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 185);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDesiredKeys:", v27);

  objc_msgSend(v26, "setShouldFetchAssetContent:", 0);
  objc_msgSend(v11, "callbackQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCallbackQueue:", v28);

  v38 = MEMORY[0x1E0C809B0];
  v39 = 3221225472;
  v40 = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_159;
  v41 = &unk_1E8761C20;
  v43 = *(id *)(a1 + 40);
  v29 = v11;
  v42 = v29;
  objc_msgSend(v26, "setFetchRecordsCompletionBlock:", &v38);
  v30 = objc_msgSend(v8, "isPrivateZone", v38, v39, v40, v41);
  v31 = *(id **)(a1 + 32);
  if (v30)
  {
    objc_msgSend(v31[76], "transferSyncContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubOperation:overrideContext:allowsCellularAccess:", v26, v32, 0);

  }
  else
  {
    objc_msgSend(v31, "addSubOperation:", v26);
  }

}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_159_cold_1((uint64_t)v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a2, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 32), "addRecord:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_160;
    v14[3] = &unk_1E875EAA8;
    v15 = v13;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v15, "notifyWhenRecordsAreFetchedAndFinish:", v14);

  }
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_160(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_160_cold_2();

  v4 = objc_msgSend(*(id *)(a1 + 32), "saveRecordsWithQueryCursor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 40), 0);
      return;
    }
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_160_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: couldn't save to server truth when creating server fault"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);

}

- (void)_locateSharedItemOnRecipient_step
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v8[5];

  if (-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
    goto LABEL_3;
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");
  -[BRCAppLibrary defaultClientZone](self->_appLibrary, "defaultClientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 & objc_msgSend(v6, "state");

  if ((v7 & 4) != 0)
  {
LABEL_3:
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke;
    v8[3] = &unk_1E875D850;
    v8[4] = self;
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:](self, "_createServerFaultIfPossibleWithCompletion:", v8);
  }
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientTruthWorkloop");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2;
  block[3] = &unk_1E875D500;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "serverItemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "serverAliasItemForSharedItem:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(id **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "_performNextStep");
    }
    else
    {
      objc_msgSend(v4[76], "defaultClientZone");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "itemGlobalID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serverZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCItemID shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:](BRCItemID, "shareAliasRecordIDFromTargetItemID:zone:hasDerivedShareAlias:", v8, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_165;
        v14[3] = &unk_1E875E868;
        v12 = v10;
        v13 = *(_QWORD *)(a1 + 32);
        v15 = v12;
        v16 = v13;
        objc_msgSend(v11, "addLocateRecordCompletionBlock:", v14);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
      }

    }
  }
  else
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't create a directory fault%@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
  }

}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_165(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("fail");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138413058;
    if (a2)
      v8 = CFSTR("success");
    v11 = v9;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 40), "_performNextStep");
}

- (void)_waitForSharedItemToSyncDownOnRecipient_step
{
  void *v3;
  NSObject *v4;
  BRCClientZone *clientZone;
  _QWORD v6[5];
  uint64_t v7[3];

  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnRecipient_step]", 1964, v7);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnOwner_step].cold.1();

  if (-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
  {
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    clientZone = self->_clientZone;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke;
    v6[3] = &unk_1E8764450;
    v6[4] = self;
    -[BRCClientZone performBlock:whenSyncDownCompletesLookingForItemID:](clientZone, "performBlock:whenSyncDownCompletesLookingForItemID:", v6, self->_linkItemID);
    -[BRCSharingAcceptFlowOperation _activateSharedZoneIfNeeded](self, "_activateSharedZoneIfNeeded");
  }
  __brc_leave_section(v7);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2;
  v5[3] = &unk_1E8760EE0;
  v6 = a2;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_with_logs_12(v4, v5);

}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
  }
  else
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, (os_log_type_t)0x90u))
      __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1();

    v4 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brc_sharedRootDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "brc_errorItemNotFound:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "brc_errorItemNotFound:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_completeWithError:", v10);

  }
}

- (void)_waitForSharedItemToBeOnDiskOnRecipient_step
{
  void *v3;
  NSObject *v4;
  BRCClientZone *clientZone;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint64_t v9[3];

  if (!self->_linkItemID)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _openiWorkAppPreemptively_step].cold.1();

  }
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _waitForSharedItemToBeOnDiskOnRecipient_step]", 2004, v9);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BRCSharingAcceptFlowOperation _waitForSharedItemToBeOnDiskOnOwner_step].cold.1();

  if (-[BRCSharingAcceptFlowOperation _isOwner](self, "_isOwner"))
  {
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    clientZone = self->_clientZone;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke;
    v8[3] = &unk_1E8764450;
    v8[4] = self;
    -[BRCClientZone performBlock:whenItemWithRecordIDIsOnDisk:](clientZone, "performBlock:whenItemWithRecordIDIsOnDisk:", v8, self->_linkItemRecordID);
  }
  __brc_leave_section(v9);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_2;
  v6[3] = &unk_1E8760EE0;
  v7 = a2;
  v6[4] = *(_QWORD *)(a1 + 32);
  dispatch_async_with_logs_12(v5, v6);

}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_3;
    v13[3] = &unk_1E875D500;
    v13[4] = *(_QWORD *)(a1 + 32);
    dispatch_async_with_logs_12(v2, v13);

  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576);
      *(_DWORD *)buf = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found as a fault.  We must have reset or be broken structure or it was deleted locally.%@", buf, 0x16u);
    }

    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "brc_sharedRootDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "brc_errorItemNotFound:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "brc_errorItemNotFound:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_completeWithError:", v12);

  }
}

uint64_t __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
}

- (void)_locateSharedItemOnDisk_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Locate shared folder on disk%@");
  OUTLINED_FUNCTION_2();
}

void __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BRCItemToPathLookup *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isOnDisk") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientDB");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flushToMakeEditsVisibleToIPCReaders");

    v4 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", v2);
    -[BRCItemToPathLookup coordinatedWriteURL](v4, "coordinatedWriteURL");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 640);
    *(_QWORD *)(v6 + 640) = v5;

    objc_msgSend(*(id *)(a1 + 32), "_performNextStep");
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576);
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found on disk.  We must have reset or be broken structure or it was deleted locally.%@", (uint8_t *)&v18, 0x16u);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brc_sharedRootDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "brc_errorItemNotFound:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "brc_errorItemNotFound:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v16 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_completeWithError:", v17);

  }
}

- (void)_prepareToDownloadSharedDocument_step
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx prepare to open shared document%@");
  OUTLINED_FUNCTION_2();
}

void __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_2((uint64_t)v2);

    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("itemID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_16;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 640))
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v2;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not compute the coordinated read URL of the item %@.  It must have been deleted locally%@", buf, 0x16u);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "share");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "brc_sharedRootDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v11, "brc_errorItemNotFound:", v13);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "itemIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "brc_errorItemNotFound:", v14);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0CB35C8];
LABEL_16:
    objc_msgSend(v8, "brc_errorAcceptShareFailedWithUnderlyingError:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_completeWithError:", v15);

    goto LABEL_17;
  }
  if (objc_msgSend(v2, "isReserved"))
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_1();

  }
  v18 = 0;
  v3 = objc_msgSend(v2, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", 0, 8, 0, 0, &v18);
  v4 = v18;
  if ((v3 & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  else
    objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v4);
LABEL_17:

}

- (void)_setSpotlightAttribute_step
{
  NSObject *v3;
  _QWORD block[5];

  if (-[BRCSharingAcceptFlowOperation _isOwnerOrShareAlreadyAccepted](self, "_isOwnerOrShareAlreadyAccepted"))
  {
    -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
  }
  else
  {
    -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__BRCSharingAcceptFlowOperation__setSpotlightAttribute_step__block_invoke;
    block[3] = &unk_1E875D500;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

void __60__BRCSharingAcceptFlowOperation__setSpotlightAttribute_step__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isOwner");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 600), "itemByItemID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "ownerKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCAccountSession userIdentityForKey:db:](BRCAccountSession, "userIdentityForKey:db:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nameComponentsAcceptUnknownUser:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "br_formattedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "br_physicalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationIdentifierIfComputable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = BRCSetAllShareAttributesAtURL(v10);

  if ((v12 & 1) == 0)
  {
    v13 = *__error();
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v16;
      v19 = 1024;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] could not set share attributes for share at path: %@ %{errno}d%@", (uint8_t *)&v17, 0x1Cu);

    }
    *__error() = v13;
  }
  objc_msgSend(*(id *)(a1 + 32), "_performNextStep");

}

- (void)_openSharedItemIfStillNeeded_step
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11[3];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_liveFileURL)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFile_step].cold.2();

  }
  memset(v11, 0, sizeof(v11));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _openSharedItemIfStillNeeded_step]", 2223, v11);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = v11[0];
    -[NSURL path](self->_liveFileURL, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Open shared document if still needed at %@%@", buf, 0x20u);

  }
  if (!self->_liveFileURL)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorInvalidParameter:value:", CFSTR("_liveFileURL"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSharingAcceptFlowOperation _completeWithError:](self, "_completeWithError:", v6);

LABEL_11:
    goto LABEL_12;
  }
  if (-[BRCSharingAcceptFlowOperation _isFolderShare](self, "_isFolderShare"))
  {
    -[NSURL brc_applicationContainerID](self->_shareURL, "brc_applicationContainerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:](self, "_openSharedSideFaultFileWithAppID:", v5);
    else
      -[BRCSharingAcceptFlowOperation _openDocumentInDocumentsAppIfInstalled:](self, "_openDocumentInDocumentsAppIfInstalled:", self->_liveFileURL);
    goto LABEL_11;
  }
  -[BRCSharingAcceptFlowOperation _performNextStep](self, "_performNextStep");
LABEL_12:
  __brc_leave_section(v11);
}

- (void)_endAcceptationFlow_step
{
  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", self->_liveFileURL, 0);
}

+ (id)_runningShareIDs
{
  if (_runningShareIDs_onceToken != -1)
    dispatch_once(&_runningShareIDs_onceToken, &__block_literal_global_47);
  return (id)_runningShareIDs_ret;
}

void __49__BRCSharingAcceptFlowOperation__runningShareIDs__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_runningShareIDs_ret;
  _runningShareIDs_ret = v0;

}

- (BOOL)skipOpenInApp
{
  return self->_skipOpenInApp;
}

- (void)setSkipOpenInApp:(BOOL)a3
{
  self->_skipOpenInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareAcceptationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_linkFilename, 0);
  objc_storeStrong((id *)&self->_rootFilename, 0);
  objc_storeStrong((id *)&self->_shareAcceptGroup, 0);
  objc_storeStrong((id *)&self->_liveFileURL, 0);
  objc_storeStrong((id *)&self->_acceptOperation, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_unsaltedBookmarkData, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_linkItemID, 0);
  objc_storeStrong((id *)&self->_linkItemRecordID, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_acceptationFlow, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_userActionsNavigator, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

- (void)_completeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] network is unreachable, replacing error with generic network error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_completeWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] failing share acceptation with %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_completeWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _shareMetadata%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_completeWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: error.underlyingErrors.count == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_completeWithError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: error _completeWithError must be called only in case we should complete with an error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] fallback to iCloud Web with reason: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self->_shareURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !(goToAppStore && openWebPreview)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_34_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !(goToSettings && openWebPreview)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finishWithResult:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Session is not cancelled but DBs serial queue is nil!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finishWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _hadProcessedCompletionError completedWithResult:error: called with error directly. Should call _completeWithError: instead.%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] delete share acceptation fault because operation failed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_isiWorkShare
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _shareURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)openResourceOperationDidComplete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Open application completed successfully%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)openResourceOperation:(uint64_t)a1 didFailWithError:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] Failed to open the target app - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] accept operation completed with success%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: No operation error and no share id%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: %@ wasn't found after syncing down on the owner%@");
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] item is on disk, jump to prepare to open shared document%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Preparing side fault%@");
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self->_shareMetadata%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: document doesn't exists anymore%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: child path already exists even though we should have just created the parent%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] created link shared item-to-be on disk: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] can't make the file live: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_5(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = 0;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_3(&dword_1CBD43000, a2, a3, "[ERROR] can't resolve child path %@%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_6(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] created shared item-to-be on disk: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_8(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] created link shared item-to-be in db: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_9(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] created shared item-to-be in db: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: item isn't a document or directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_11(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] share item %@ is in transient state, should try again later%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_12(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_1CBD43000, v1, v2, "[CRIT] UNREACHABLE: item is in an unknown state: %@:%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_126_cold_13(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] found share item %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_openSharedSideFaultFileWithAppID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Skipping open in app%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1CBD43000, a3, v5, "[ERROR] can't get bookmark string at %@%@", v6);

  OUTLINED_FUNCTION_6();
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v8 = 2112;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] doing open operation on \"%@\" with \"%@\"%@", v7, 0x20u);

}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Share accept finished with error %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _clientZone%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx Creating server fault if possible%@");
  OUTLINED_FUNCTION_2();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: rootRecordID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] We don't have need to fetch deeply into the folder. Letting the list directory take care of fetching%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_159_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Failed to fetch record for server fault - %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_160_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: couldn't save to server truth when creating server fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_160_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Finished fetching records for server fault%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] %@ wasn't found after syncing down%@");
  OUTLINED_FUNCTION_2();
}

void __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !li.isReserved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] Invalid kind of item; %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
