@implementation ACDAccountNotifier

+ (NSArray)allNotificationEntries
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  _ACDNotificationSignpostSystem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _ACSignpostCreate();

  _ACDNotificationSignpostSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FaultPlugins", ", buf, 2u);
  }

  _ACDNotificationSignpostSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[ACDAccountNotifier allNotificationEntries].cold.2(v3, v6);

  +[ACPluginLoader pluginBundlesAtSubpath:](ACDPluginLoader, "pluginBundlesAtSubpath:", CFSTR("Notification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ac_mapNullable:", &__block_literal_global_29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v11, OS_SIGNPOST_INTERVAL_END, v3, "FaultPlugins", ", v14, 2u);
  }

  _ACDNotificationSignpostSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[ACDAccountNotifier allNotificationEntries].cold.1();

  return (NSArray *)v9;
}

ACDPluginEntry *__44__ACDAccountNotifier_allNotificationEntries__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ACDPluginEntry *v3;

  v2 = a2;
  v3 = -[ACDPluginEntry initWithBundle:]([ACDPluginEntry alloc], "initWithBundle:", v2);

  return v3;
}

- (ACDAccountNotifier)init
{
  return -[ACDAccountNotifier initWithNotificationEntries:](self, "initWithNotificationEntries:", MEMORY[0x24BDBD1A8]);
}

- (ACDAccountNotifier)initWithNotificationEntries:(id)a3
{
  id v5;
  ACDAccountNotifier *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *notificationEntryQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACDAccountNotifier;
  v6 = -[ACDAccountNotifier init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.accounts.notifierworkq", v7);
    notificationEntryQueue = v6->_notificationEntryQueue;
    v6->_notificationEntryQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_notificationEntries, a3);
  }

  return v6;
}

- (BOOL)canSaveAccount:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  _BOOL4 v30;
  NSObject *v31;
  unint64_t v32;
  void *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t Nanoseconds;
  NSObject *v53;
  NSObject *v54;
  const __CFString *v55;
  NSObject *v56;
  const __CFString *v58;
  void *v59;
  void *v60;
  SEL v61;
  os_signpost_id_t v62;
  id *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  id obj;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  os_signpost_id_t v74;
  __int16 v75;
  double v76;
  __int16 v77;
  const __CFString *v78;
  _QWORD v79[2];
  _QWORD v80[2];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v66 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  v65 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

  }
  v61 = a2;
  _ACDNotificationSignpostSystem();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = _ACSignpostCreate();

  _ACDNotificationSignpostSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    v74 = (os_signpost_id_t)v66;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CanSaveAccount", "account: %@", buf, 0xCu);
  }
  v64 = v12 - 1;

  _ACDNotificationSignpostSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACDAccountNotifier canSaveAccount:inStore:error:].cold.1();

  -[ACDAccountNotifier _pluginsRegisteredForAccount:](self, "_pluginsRegisteredForAccount:", v66);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (!v16)
  {
    v18 = 0;
    v30 = 1;
LABEL_38:
    v32 = v64;
    goto LABEL_44;
  }
  v17 = v16;
  v62 = v12;
  v63 = a5;
  v18 = 0;
  v19 = *(_QWORD *)v70;
  v20 = v65;
LABEL_12:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v70 != v19)
      objc_enumerationMutation(obj);
    v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v21);
    if (objc_msgSend(v22, "principalObjectRespondsToSelector:", sel_canSaveAccount_inStore_error_))
      break;
    if (objc_msgSend(v22, "principalObjectRespondsToSelector:", sel_canSaveAccount_inStore_))
    {
      objc_msgSend(v22, "principalObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v27;
      if (v27)
      {
        if ((objc_msgSend(v27, "canSaveAccount:inStore:", v66, v20) & 1) == 0)
        {
          _ACDNotificationLogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v74 = (os_signpost_id_t)v66;
            v75 = 2112;
            v76 = *(double *)&v22;
            _os_log_impl(&dword_20D8CB000, v34, OS_LOG_TYPE_DEFAULT, "Entry reported inability to save account: %@, entry: %@", buf, 0x16u);
          }

          v36 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_CANNOT_SAVE_ERROR_FORMAT"), &stru_24C7E3E98, CFSTR("Localizable"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "accountType");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "accountTypeDescription");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "accountType");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "accountTypeDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", v38, v40, v42);
          v43 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)MEMORY[0x24BDD17C8];
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("The account save was rejected by '%@'."), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = (void *)MEMORY[0x24BDD1540];
          v49 = *MEMORY[0x24BDB4200];
          v50 = *MEMORY[0x24BDD0BA0];
          v79[0] = *MEMORY[0x24BDD0FC8];
          v79[1] = v50;
          v80[0] = v43;
          v80[1] = v47;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, 5, v51);
          v26 = (id)objc_claimAutoreleasedReturnValue();

          v33 = (void *)v43;
          v12 = v62;
          a5 = v63;
          v32 = v64;
          goto LABEL_42;
        }
        goto LABEL_27;
      }
      _ACDNotificationLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        goto LABEL_27;
      }
LABEL_30:
      *(_DWORD *)buf = 138412290;
      v74 = (os_signpost_id_t)v22;
      _os_log_error_impl(&dword_20D8CB000, v28, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
      goto LABEL_26;
    }
LABEL_28:
    if (v17 == ++v21)
    {
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      v17 = v29;
      if (!v29)
      {
        v30 = 1;
        v12 = v62;
        a5 = v63;
        goto LABEL_38;
      }
      goto LABEL_12;
    }
  }
  objc_msgSend(v22, "principalObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    _ACDNotificationLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    goto LABEL_30;
  }
  v68 = v18;
  v25 = objc_msgSend(v23, "canSaveAccount:inStore:error:", v66, v20, &v68);
  v26 = v68;

  if ((v25 & 1) != 0)
  {
    v18 = v26;
    v20 = v65;
LABEL_27:

    goto LABEL_28;
  }
  _ACDNotificationLogSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v74 = (os_signpost_id_t)v66;
    v75 = 2112;
    v76 = *(double *)&v22;
    _os_log_impl(&dword_20D8CB000, v31, OS_LOG_TYPE_DEFAULT, "Entry reported inability to save account: %@, entry: %@", buf, 0x16u);
  }

  v12 = v62;
  a5 = v63;
  v32 = v64;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v61, self, CFSTR("ACDAccountNotifier.m"), 120, CFSTR("Plugin denied account save but provided no error: %@"), v22);
LABEL_42:

  }
  v30 = 0;
  v18 = v26;
LABEL_44:

  Nanoseconds = _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    v55 = CFSTR("NO");
    if (v30)
      v55 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v74 = (os_signpost_id_t)v55;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v54, OS_SIGNPOST_INTERVAL_END, v12, "CanSaveAccount", "%{public}@", buf, 0xCu);
  }

  _ACDNotificationSignpostSystem();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    v58 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v74 = v12;
    if (v30)
      v58 = CFSTR("YES");
    v75 = 2048;
    v76 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v77 = 2114;
    v78 = v58;
    _os_log_debug_impl(&dword_20D8CB000, v56, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanSaveAccount %{public}@", buf, 0x20u);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v18);

  return v30;
}

- (BOOL)canRemoveAccount:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  char **v19;
  char **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  int v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t Nanoseconds;
  NSObject *v52;
  NSObject *v53;
  const __CFString *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  const __CFString *v61;
  void *v62;
  uint64_t v63;
  _BOOL4 v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  const __CFString *v68;
  NSObject *v69;
  const __CFString *v71;
  void *v72;
  void *v73;
  ACDAccountNotifier *v74;
  SEL v75;
  unint64_t v76;
  os_signpost_id_t v77;
  id *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  void *v83;
  id obj;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  void *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  os_signpost_id_t v95;
  __int16 v96;
  double v97;
  __int16 v98;
  _BYTE v99[38];
  _QWORD v100[2];
  _QWORD v101[2];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v88 = v9;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

LABEL_3:
  _ACDNotificationSignpostSystem();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _ACSignpostCreate();

  _ACDNotificationSignpostSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412290;
    v95 = (os_signpost_id_t)v88;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CanRemoveAccount", "account: %@", buf, 0xCu);
  }

  _ACDNotificationSignpostSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[ACDAccountNotifier canRemoveAccount:inStore:error:].cold.1();
  v83 = v11;

  -[ACDAccountNotifier _pluginsRegisteredForAccount:](self, "_pluginsRegisteredForAccount:", v88);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
  if (!v86)
  {
    v18 = 0;
    v64 = 1;
    goto LABEL_62;
  }
  v76 = v13 - 1;
  v74 = self;
  v75 = a2;
  v77 = v13;
  v78 = a5;
  v18 = 0;
  v19 = &selRef__limitVimeoToOneAccount;
  v20 = &selRef__limitVimeoToOneAccount;
  v85 = *(_QWORD *)v91;
  v81 = *MEMORY[0x24BDB4200];
  v80 = *MEMORY[0x24BDD0FC8];
  v79 = *MEMORY[0x24BDD0BA0];
LABEL_10:
  v21 = 0;
  v87 = v19[276];
  v82 = v20[275];
  while (1)
  {
    if (*(_QWORD *)v91 != v85)
      objc_enumerationMutation(obj);
    v22 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v21);
    _ACDNotificationSignpostSystem();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _ACSignpostCreate();

    _ACDNotificationSignpostSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      objc_msgSend(v22, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "accountType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v95 = (os_signpost_id_t)v28;
      v96 = 2114;
      v97 = *(double *)&v30;
      v98 = 1026;
      *(_DWORD *)v99 = 3;
      *(_WORD *)&v99[4] = 2112;
      *(_QWORD *)&v99[6] = CFSTR("deleted");
      *(_WORD *)&v99[14] = 2112;
      *(_QWORD *)&v99[16] = v88;
      _os_signpost_emit_with_name_impl(&dword_20D8CB000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "CanRemoveAccountPlugin", " PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x30u);

    }
    _ACDNotificationSignpostSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v22, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "accountType");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "identifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v95 = v24;
      v96 = 2114;
      v97 = *(double *)&v57;
      v98 = 2114;
      *(_QWORD *)v99 = v59;
      *(_WORD *)&v99[8] = 1026;
      *(_DWORD *)&v99[10] = 3;
      *(_WORD *)&v99[14] = 2112;
      *(_QWORD *)&v99[16] = CFSTR("deleted");
      *(_WORD *)&v99[24] = 2112;
      *(_QWORD *)&v99[26] = v88;
      _os_log_debug_impl(&dword_20D8CB000, v31, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: CanRemoveAccountPlugin  PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x3Au);

    }
    if (objc_msgSend(v22, "principalObjectRespondsToSelector:", v87))
    {
      objc_msgSend(v22, "principalObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v89 = v18;
        v34 = objc_msgSend(v32, "canRemoveAccount:inStore:error:", v88, v83, &v89);
        v35 = v89;

        if ((v34 & 1) != 0)
        {
          v36 = 1;
LABEL_40:

          v18 = v35;
          goto LABEL_41;
        }
        _ACDNotificationLogSystem();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v95 = (os_signpost_id_t)v88;
          v96 = 2112;
          v97 = *(double *)&v22;
          _os_log_impl(&dword_20D8CB000, v39, OS_LOG_TYPE_DEFAULT, "Entry reported inability to remove account: %@, entry: %@", buf, 0x16u);
        }

        if (v35)
        {
          v36 = 0;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v38 = objc_claimAutoreleasedReturnValue();
        -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v38, "handleFailureInMethod:object:file:lineNumber:description:", v75, v74, CFSTR("ACDAccountNotifier.m"), 166, CFSTR("Plugin denied account remove but provided no error: %@"), v22);
        v18 = 0;
        v36 = 0;
        goto LABEL_38;
      }
      _ACDNotificationLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      goto LABEL_55;
    }
    if (objc_msgSend(v22, "principalObjectRespondsToSelector:", v82))
    {
      objc_msgSend(v22, "principalObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v37;
      if (v37)
      {
        if ((objc_msgSend(v37, "canRemoveAccount:inStore:", v88, v83) & 1) != 0)
        {
          v36 = 1;
LABEL_39:
          v35 = v18;
          goto LABEL_40;
        }
        _ACDNotificationLogSystem();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v95 = (os_signpost_id_t)v88;
          v96 = 2112;
          v97 = *(double *)&v22;
          _os_log_impl(&dword_20D8CB000, v40, OS_LOG_TYPE_DEFAULT, "Entry reported inability to remove account: %@, entry: %@", buf, 0x16u);
        }

        v41 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v88, "accountType");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "accountTypeDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringWithFormat:", CFSTR("Can't remove account with identifier %@ because one plugin doesn't allow it."), v43);
        v38 = objc_claimAutoreleasedReturnValue();

        v44 = (void *)MEMORY[0x24BDD17C8];
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", CFSTR("The account removal was rejected by '%@'."), v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = (void *)MEMORY[0x24BDD1540];
        v100[0] = v80;
        v100[1] = v79;
        v101[0] = v38;
        v101[1] = v47;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v101, v100, 2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", v81, 17, v49);
        v50 = objc_claimAutoreleasedReturnValue();

        v36 = 0;
        v18 = (void *)v50;
        v27 = v24 - 1;
LABEL_38:

        goto LABEL_39;
      }
      _ACDNotificationLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
LABEL_34:
        v36 = 1;
        goto LABEL_38;
      }
LABEL_55:
      *(_DWORD *)buf = 138412290;
      v95 = (os_signpost_id_t)v22;
      _os_log_error_impl(&dword_20D8CB000, v38, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
      goto LABEL_34;
    }
    v36 = 1;
LABEL_41:
    Nanoseconds = _ACSignpostGetNanoseconds();
    _ACDNotificationSignpostSystem();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v27 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      if (v36)
        v54 = CFSTR("YES");
      else
        v54 = CFSTR("NO");
      objc_msgSend(v22, "identifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v95 = (os_signpost_id_t)v54;
      v96 = 2112;
      v97 = *(double *)&v55;
      v98 = 2112;
      *(_QWORD *)v99 = CFSTR("deleted");
      *(_WORD *)&v99[8] = 2112;
      *(_QWORD *)&v99[10] = v88;
      _os_signpost_emit_with_name_impl(&dword_20D8CB000, v53, OS_SIGNPOST_INTERVAL_END, v24, "CanRemoveAccountPlugin", "%@ %@ (changeType: %@, account: %@)", buf, 0x2Au);

    }
    _ACDNotificationSignpostSystem();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v60 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      if (v36)
        v61 = CFSTR("YES");
      else
        v61 = CFSTR("NO");
      objc_msgSend(v22, "identifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v95 = v24;
      v96 = 2048;
      v97 = v60;
      v98 = 2112;
      *(_QWORD *)v99 = v61;
      *(_WORD *)&v99[8] = 2112;
      *(_QWORD *)&v99[10] = v62;
      *(_WORD *)&v99[18] = 2112;
      *(_QWORD *)&v99[20] = CFSTR("deleted");
      *(_WORD *)&v99[28] = 2112;
      *(_QWORD *)&v99[30] = v88;
      _os_log_debug_impl(&dword_20D8CB000, v56, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanRemoveAccountPlugin %@ %@ (changeType: %@, account: %@)", buf, 0x3Eu);

    }
    if (!v36)
      break;
    if (v86 == ++v21)
    {
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      v86 = v63;
      v19 = &selRef__limitVimeoToOneAccount;
      v20 = &selRef__limitVimeoToOneAccount;
      if (!v63)
      {
        v64 = 1;
        goto LABEL_60;
      }
      goto LABEL_10;
    }
  }
  v64 = 0;
LABEL_60:
  v13 = v77;
  a5 = v78;
  v16 = v76;
LABEL_62:

  v65 = _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
  {
    v68 = CFSTR("NO");
    if (v64)
      v68 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v95 = (os_signpost_id_t)v68;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v67, OS_SIGNPOST_INTERVAL_END, v13, "CanRemoveAccount", "%{public}@", buf, 0xCu);
  }

  _ACDNotificationSignpostSystem();
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    v71 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v95 = v13;
    if (v64)
      v71 = CFSTR("YES");
    v96 = 2048;
    v97 = (double)(unint64_t)v65 / 1000000000.0;
    v98 = 2114;
    *(_QWORD *)v99 = v71;
    _os_log_debug_impl(&dword_20D8CB000, v69, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: CanRemoveAccount %{public}@", buf, 0x20u);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v18);

  return v64;
}

- (BOOL)postWillChangeNotificationForType:(int)a3 inStore:(id)a4 newAccount:(id)a5 oldAccount:(id)a6
{
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  uint64_t Nanoseconds;
  NSObject *v39;
  NSObject *v40;
  double v41;
  double v42;
  const __CFString *v43;
  const __CFString *v44;
  NSObject *v45;
  double v46;
  double v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  const __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  const __CFString *v57;
  NSObject *v58;
  const __CFString *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  uint64_t spid;
  char v65;
  uint64_t v66;
  unsigned int v67;
  void *v68;
  id v69;
  id obj;
  double v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  double v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  _BYTE v88[38];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v71 = COERCE_DOUBLE(a5);
  v69 = a6;
  v67 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeType"));

  }
  v68 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

  }
  _ACDNotificationSignpostSystem();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  spid = _ACSignpostCreate();

  _ACDNotificationSignpostSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    if ((a3 - 1) > 4)
      *(double *)&v15 = COERCE_DOUBLE(CFSTR("unknown"));
    else
      v15 = off_24C7E2A80[a3 - 1];
    *(_DWORD *)buf = 138412802;
    v84 = v71;
    v85 = 2112;
    v86 = *(double *)&v15;
    v87 = 2112;
    *(_QWORD *)v88 = v69;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountWillChange", "%@ (changeType: %@, oldAccount: %@)", buf, 0x20u);
  }

  _ACDNotificationSignpostSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if ((a3 - 1) > 4)
      v60 = CFSTR("unknown");
    else
      v60 = off_24C7E2A80[a3 - 1];
    *(_DWORD *)buf = 134218754;
    v84 = *(double *)&spid;
    v85 = 2112;
    v86 = v71;
    v87 = 2112;
    *(_QWORD *)v88 = v60;
    *(_WORD *)&v88[8] = 2112;
    *(_QWORD *)&v88[10] = v69;
    _os_log_debug_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillChange %@ (changeType: %@, oldAccount: %@)", buf, 0x2Au);
  }

  -[ACDAccountNotifier _pluginsRegisteredForNewAccount:oldAccount:changeType:](self, "_pluginsRegisteredForNewAccount:oldAccount:changeType:", *(_QWORD *)&v71, v69, a3);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
  if (v73)
  {
    v65 = 0;
    v66 = a3 - 1;
    v72 = *(_QWORD *)v79;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v79 != v72)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v17);
        if (objc_msgSend(v18, "principalObjectRespondsToSelector:", sel_account_willChangeWithType_inStore_oldAccount_))
        {
          v19 = (void *)objc_msgSend(*(id *)&v71, "copy");
          v20 = (void *)objc_msgSend(v69, "copy");
          v77 = v18;
          v76 = v68;
          v21 = v19;
          v22 = v20;
          v23 = v22;
          if (v21)
            v24 = v21;
          else
            v24 = v22;
          v74 = v24;
          objc_msgSend(v74, "accountType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v75 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

          _ACDNotificationSignpostSystem();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = _ACSignpostCreate();

          _ACDNotificationSignpostSystem();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
          {
            objc_msgSend(v77, "identifier");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            v32 = CFSTR("unknown");
            if (v66 < 5)
              v32 = off_24C7E2A80[v66];
            *(_DWORD *)buf = 138544386;
            v84 = *(double *)&v30;
            v85 = 2114;
            v86 = v75;
            v87 = 1026;
            *(_DWORD *)v88 = v67;
            *(_WORD *)&v88[4] = 2112;
            *(_QWORD *)&v88[6] = v32;
            *(_WORD *)&v88[14] = 2112;
            *(_QWORD *)&v88[16] = v74;
            _os_signpost_emit_with_name_impl(&dword_20D8CB000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "AccountWillChangePlugin", " PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x30u);

          }
          _ACDNotificationSignpostSystem();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v77, "identifier");
            v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v47 = v46;
            v48 = CFSTR("unknown");
            if (v66 < 5)
              v48 = off_24C7E2A80[v66];
            *(_DWORD *)buf = 134219266;
            v84 = *(double *)&v27;
            v85 = 2114;
            v86 = v46;
            v87 = 2114;
            *(double *)v88 = v75;
            *(_WORD *)&v88[8] = 1026;
            *(_DWORD *)&v88[10] = v67;
            *(_WORD *)&v88[14] = 2112;
            *(_QWORD *)&v88[16] = v48;
            *(_WORD *)&v88[24] = 2112;
            *(_QWORD *)&v88[26] = v74;
            _os_log_debug_impl(&dword_20D8CB000, v33, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillChangePlugin  PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x3Au);

          }
          objc_msgSend(v77, "principalObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            v36 = objc_msgSend(v34, "account:willChangeWithType:inStore:oldAccount:", v21, v67, v76, v23);
          }
          else
          {
            _ACDNotificationLogSystem();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v84 = *(double *)&v77;
              _os_log_error_impl(&dword_20D8CB000, v37, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }

            v36 = 0;
          }

          Nanoseconds = _ACSignpostGetNanoseconds();
          _ACDNotificationSignpostSystem();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
          {
            objc_msgSend(v77, "identifier");
            v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v42 = v41;
            v43 = CFSTR("NO");
            if (v36)
              v43 = CFSTR("YES");
            v44 = CFSTR("unknown");
            if (v66 <= 4)
              v44 = off_24C7E2A80[v66];
            *(_DWORD *)buf = 138413058;
            v84 = *(double *)&v43;
            v85 = 2112;
            v86 = v41;
            v87 = 2112;
            *(_QWORD *)v88 = v44;
            *(_WORD *)&v88[8] = 2112;
            *(_QWORD *)&v88[10] = v23;
            _os_signpost_emit_with_name_impl(&dword_20D8CB000, v40, OS_SIGNPOST_INTERVAL_END, v27, "AccountWillChangePlugin", "%@ %@ (changeType: %@, oldAccount: %@)", buf, 0x2Au);

          }
          _ACDNotificationSignpostSystem();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v77, "identifier");
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v49;
            v51 = CFSTR("NO");
            if (v36)
              v51 = CFSTR("YES");
            v52 = CFSTR("unknown");
            if (v66 <= 4)
              v52 = off_24C7E2A80[v66];
            *(_DWORD *)buf = 134219266;
            v84 = *(double *)&v27;
            v85 = 2048;
            v86 = (double)(unint64_t)Nanoseconds / 1000000000.0;
            v87 = 2112;
            *(_QWORD *)v88 = v51;
            *(_WORD *)&v88[8] = 2112;
            *(_QWORD *)&v88[10] = v49;
            *(_WORD *)&v88[18] = 2112;
            *(_QWORD *)&v88[20] = v52;
            *(_WORD *)&v88[28] = 2112;
            *(_QWORD *)&v88[30] = v23;
            _os_log_debug_impl(&dword_20D8CB000, v45, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWillChangePlugin %@ %@ (changeType: %@, oldAccount: %@)", buf, 0x3Eu);

          }
          if (v36)
          {
            objc_msgSend(*(id *)&v71, "takeValuesFromModifiedAccount:", v21);
            v65 = 1;
          }

        }
        ++v17;
      }
      while (v73 != v17);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
      v73 = v53;
    }
    while (v53);
  }
  else
  {
    v65 = 0;
  }

  v54 = _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v55))
  {
    v57 = CFSTR("NO");
    if ((v65 & 1) != 0)
      v57 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v84 = *(double *)&v57;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v56, OS_SIGNPOST_INTERVAL_END, spid, "AccountWillChange", "%{public}@", buf, 0xCu);
  }

  _ACDNotificationSignpostSystem();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    v61 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v84 = *(double *)&spid;
    if ((v65 & 1) != 0)
      v61 = CFSTR("YES");
    v85 = 2048;
    v86 = (double)(unint64_t)v54 / 1000000000.0;
    v87 = 2114;
    *(_QWORD *)v88 = v61;
    _os_log_debug_impl(&dword_20D8CB000, v58, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWillChange %{public}@", buf, 0x20u);
  }

  return v65 & 1;
}

- (void)postDidChangeNotificationForType:(int)a3 inStore:(id)a4 newAccount:(id)a5 oldAccount:(id)a6
{
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t Nanoseconds;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  NSObject *v45;
  double v46;
  double v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  uint64_t spid;
  uint64_t v60;
  unsigned int v61;
  void *v62;
  id v63;
  double v64;
  id obj;
  uint64_t v66;
  uint64_t v67;
  double v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  double v76;
  __int16 v77;
  double v78;
  __int16 v79;
  _BYTE v80[34];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v64 = COERCE_DOUBLE(a5);
  v63 = a6;
  v61 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeType"));

  }
  v62 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

  }
  _ACDNotificationSignpostSystem();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  spid = _ACSignpostCreate();

  _ACDNotificationSignpostSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    if ((a3 - 1) > 4)
      *(double *)&v15 = COERCE_DOUBLE(CFSTR("unknown"));
    else
      v15 = off_24C7E2A80[a3 - 1];
    *(_DWORD *)buf = 138412802;
    v76 = v64;
    v77 = 2112;
    v78 = *(double *)&v15;
    v79 = 2112;
    *(_QWORD *)v80 = v63;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountDidChange", "%@ (changeType: %@, oldAccount: %@)", buf, 0x20u);
  }

  _ACDNotificationSignpostSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if ((a3 - 1) > 4)
      v56 = CFSTR("unknown");
    else
      v56 = off_24C7E2A80[a3 - 1];
    *(_DWORD *)buf = 134218754;
    v76 = *(double *)&spid;
    v77 = 2112;
    v78 = v64;
    v79 = 2112;
    *(_QWORD *)v80 = v56;
    *(_WORD *)&v80[8] = 2112;
    *(_QWORD *)&v80[10] = v63;
    _os_log_debug_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidChange %@ (changeType: %@, oldAccount: %@)", buf, 0x2Au);
  }

  -[ACDAccountNotifier _pluginsRegisteredForNewAccount:oldAccount:changeType:](self, "_pluginsRegisteredForNewAccount:oldAccount:changeType:", *(_QWORD *)&v64, v63, a3);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v67)
  {
    v60 = a3 - 1;
    v66 = *(_QWORD *)v71;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v71 != v66)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v17);
        if (objc_msgSend(v18, "principalObjectRespondsToSelector:", sel_account_didChangeWithType_inStore_oldAccount_))
        {
          v19 = (void *)objc_msgSend(*(id *)&v64, "copy");
          v20 = (void *)objc_msgSend(v63, "copy");
          v21 = v18;
          v69 = v62;
          v22 = v19;
          v23 = v20;
          v24 = v23;
          if (v22)
            v25 = v22;
          else
            v25 = v23;
          v26 = v25;
          objc_msgSend(v26, "accountType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "identifier");
          v68 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

          _ACDNotificationSignpostSystem();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = _ACSignpostCreate();

          _ACDNotificationSignpostSystem();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            objc_msgSend(v21, "identifier");
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)v32;
            v34 = CFSTR("unknown");
            if (v60 < 5)
              v34 = off_24C7E2A80[v60];
            *(_DWORD *)buf = 138544386;
            v76 = *(double *)&v32;
            v77 = 2114;
            v78 = v68;
            v79 = 1026;
            *(_DWORD *)v80 = v61;
            *(_WORD *)&v80[4] = 2112;
            *(_QWORD *)&v80[6] = v34;
            *(_WORD *)&v80[14] = 2112;
            *(_QWORD *)&v80[16] = v26;
            _os_signpost_emit_with_name_impl(&dword_20D8CB000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "AccountDidChangePlugin", " PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x30u);

          }
          _ACDNotificationSignpostSystem();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v21, "identifier");
            v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v47 = v46;
            v48 = CFSTR("unknown");
            if (v60 < 5)
              v48 = off_24C7E2A80[v60];
            *(_DWORD *)buf = 134219266;
            v76 = *(double *)&v29;
            v77 = 2114;
            v78 = v46;
            v79 = 2114;
            *(double *)v80 = v68;
            *(_WORD *)&v80[8] = 1026;
            *(_DWORD *)&v80[10] = v61;
            *(_WORD *)&v80[14] = 2112;
            *(_QWORD *)&v80[16] = v48;
            *(_WORD *)&v80[24] = 2112;
            *(_QWORD *)&v80[26] = v26;
            _os_log_debug_impl(&dword_20D8CB000, v35, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidChangePlugin  PluginIdentifier=%{public,signpost.telemetry:string1,name=PluginIdentifier}@  AccountType=%{public,signpost.telemetry:string2,name=AccountType}@  ChangeType=%{public,signpost.telemetry:number1,name=ChangeType}d  enableTelemetry=YES (changeType: %@, account: %@)", buf, 0x3Au);

          }
          objc_msgSend(v21, "principalObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v36)
          {
            objc_msgSend(v36, "account:didChangeWithType:inStore:oldAccount:", v22, v61, v69, v24);
          }
          else
          {
            _ACDNotificationLogSystem();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v76 = *(double *)&v21;
              _os_log_error_impl(&dword_20D8CB000, v38, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }

          }
          Nanoseconds = _ACSignpostGetNanoseconds();
          _ACDNotificationSignpostSystem();
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            objc_msgSend(v21, "identifier");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = (void *)v42;
            *(double *)&v44 = COERCE_DOUBLE(CFSTR("unknown"));
            if (v60 <= 4)
              v44 = off_24C7E2A80[v60];
            *(_DWORD *)buf = 138412802;
            v76 = *(double *)&v42;
            v77 = 2112;
            v78 = *(double *)&v44;
            v79 = 2112;
            *(_QWORD *)v80 = v24;
            _os_signpost_emit_with_name_impl(&dword_20D8CB000, v41, OS_SIGNPOST_INTERVAL_END, v29, "AccountDidChangePlugin", "%@ (changeType: %@, oldAccount: %@)", buf, 0x20u);

          }
          _ACDNotificationSignpostSystem();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v21, "identifier");
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v49;
            v51 = CFSTR("unknown");
            if (v60 <= 4)
              v51 = off_24C7E2A80[v60];
            *(_DWORD *)buf = 134219010;
            v76 = *(double *)&v29;
            v77 = 2048;
            v78 = (double)(unint64_t)Nanoseconds / 1000000000.0;
            v79 = 2112;
            *(_QWORD *)v80 = v49;
            *(_WORD *)&v80[8] = 2112;
            *(_QWORD *)&v80[10] = v51;
            *(_WORD *)&v80[18] = 2112;
            *(_QWORD *)&v80[20] = v24;
            _os_log_debug_impl(&dword_20D8CB000, v45, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountDidChangePlugin %@ (changeType: %@, oldAccount: %@)", buf, 0x34u);

          }
        }
        ++v17;
      }
      while (v67 != v17);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      v67 = v52;
    }
    while (v52);
  }

  _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v54, OS_SIGNPOST_INTERVAL_END, spid, "AccountDidChange", ", buf, 2u);
  }

  _ACDNotificationSignpostSystem();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    -[ACDAccountNotifier postDidChangeNotificationForType:inStore:newAccount:oldAccount:].cold.1();

}

- (void)postWillPerformDataclassActionsOnAccount:(id)a3 forDataclasses:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t Nanoseconds;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t spid;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  os_signpost_id_t v45;
  __int16 v46;
  double v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v37 = v7;
  if (!v7)
  {
    v32 = v8;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    v8 = v32;
  }
  v36 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclasses"));

  }
  _ACDNotificationSignpostSystem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  spid = _ACSignpostCreate();

  _ACDNotificationSignpostSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412546;
    v45 = (os_signpost_id_t)v37;
    v46 = 2112;
    v47 = *(double *)&v36;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountWillPerform", "%@ (dataclasses: %@)", buf, 0x16u);
  }

  _ACDNotificationSignpostSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v45 = spid;
    v46 = 2112;
    v47 = *(double *)&v37;
    v48 = 2112;
    v49 = v36;
    _os_log_debug_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillPerform %@ (dataclasses: %@)", buf, 0x20u);
  }

  -[ACDAccountNotifier _pluginsRegisteredForAccount:](self, "_pluginsRegisteredForAccount:", v37);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v13)
  {
    v39 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v39)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v15, "principalObjectRespondsToSelector:", sel_account_willPerformActionsForDataclasses_))
        {
          objc_msgSend(v15, "principalObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            _ACDNotificationSignpostSystem();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = _ACSignpostCreate();

            _ACDNotificationSignpostSystem();
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
            {
              objc_msgSend(v15, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v45 = (os_signpost_id_t)v21;
              v46 = 2112;
              v47 = *(double *)&v37;
              v48 = 2112;
              v49 = v36;
              _os_signpost_emit_with_name_impl(&dword_20D8CB000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AccountWillPerformPlugin", "%@ : %@ (dataclasses: %@)", buf, 0x20u);

            }
            _ACDNotificationSignpostSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v15, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v45 = v18;
              v46 = 2112;
              v47 = *(double *)&v28;
              v48 = 2112;
              v49 = v37;
              v50 = 2112;
              v51 = v36;
              _os_log_debug_impl(&dword_20D8CB000, v22, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountWillPerformPlugin %@ : %@ (dataclasses: %@)", buf, 0x2Au);

            }
            objc_msgSend(v16, "account:willPerformActionsForDataclasses:", v37, v36);
            Nanoseconds = _ACSignpostGetNanoseconds();
            _ACDNotificationSignpostSystem();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_20D8CB000, v25, OS_SIGNPOST_INTERVAL_END, v18, "AccountWillPerformPlugin", ", buf, 2u);
            }

            _ACDNotificationSignpostSystem();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              v45 = v18;
              v46 = 2048;
              v47 = (double)(unint64_t)Nanoseconds / 1000000000.0;
              _os_log_debug_impl(&dword_20D8CB000, v26, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountWillPerformPlugin ", buf, 0x16u);
            }

          }
          else
          {
            _ACDNotificationLogSystem();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = (os_signpost_id_t)v15;
              _os_log_error_impl(&dword_20D8CB000, v27, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }

          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v13);
  }

  _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v30, OS_SIGNPOST_INTERVAL_END, spid, "AccountWillPerform", ", buf, 2u);
  }

  _ACDNotificationSignpostSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[ACDAccountNotifier postWillPerformDataclassActionsOnAccount:forDataclasses:].cold.1();

}

- (void)postDidPerformDataclassActionsOnAccount:(id)a3 forDataclasses:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t Nanoseconds;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t spid;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  os_signpost_id_t v45;
  __int16 v46;
  double v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v37 = v7;
  if (!v7)
  {
    v32 = v8;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    v8 = v32;
  }
  v36 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountNotifier.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclasses"));

  }
  _ACDNotificationSignpostSystem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  spid = _ACSignpostCreate();

  _ACDNotificationSignpostSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412546;
    v45 = (os_signpost_id_t)v37;
    v46 = 2112;
    v47 = *(double *)&v36;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AccountDidPerform", "%@ (dataclasses: %@)", buf, 0x16u);
  }

  _ACDNotificationSignpostSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v45 = spid;
    v46 = 2112;
    v47 = *(double *)&v37;
    v48 = 2112;
    v49 = v36;
    _os_log_debug_impl(&dword_20D8CB000, v12, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidPerform %@ (dataclasses: %@)", buf, 0x20u);
  }

  -[ACDAccountNotifier _pluginsRegisteredForAccount:](self, "_pluginsRegisteredForAccount:", v37);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v13)
  {
    v39 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v39)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v15, "principalObjectRespondsToSelector:", sel_account_didPerformActionsForDataclasses_))
        {
          objc_msgSend(v15, "principalObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            _ACDNotificationSignpostSystem();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = _ACSignpostCreate();

            _ACDNotificationSignpostSystem();
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
            {
              objc_msgSend(v15, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v45 = (os_signpost_id_t)v21;
              v46 = 2112;
              v47 = *(double *)&v37;
              v48 = 2112;
              v49 = v36;
              _os_signpost_emit_with_name_impl(&dword_20D8CB000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "AccountDidPerformPlugin", "%@ : %@ (dataclasses: %@)", buf, 0x20u);

            }
            _ACDNotificationSignpostSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v15, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v45 = v18;
              v46 = 2112;
              v47 = *(double *)&v28;
              v48 = 2112;
              v49 = v37;
              v50 = 2112;
              v51 = v36;
              _os_log_debug_impl(&dword_20D8CB000, v22, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: AccountDidPerformPlugin %@ : %@ (dataclasses: %@)", buf, 0x2Au);

            }
            objc_msgSend(v16, "account:didPerformActionsForDataclasses:", v37, v36);
            Nanoseconds = _ACSignpostGetNanoseconds();
            _ACDNotificationSignpostSystem();
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_20D8CB000, v25, OS_SIGNPOST_INTERVAL_END, v18, "AccountDidPerformPlugin", ", buf, 2u);
            }

            _ACDNotificationSignpostSystem();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              v45 = v18;
              v46 = 2048;
              v47 = (double)(unint64_t)Nanoseconds / 1000000000.0;
              _os_log_debug_impl(&dword_20D8CB000, v26, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: AccountDidPerformPlugin ", buf, 0x16u);
            }

          }
          else
          {
            _ACDNotificationLogSystem();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = (os_signpost_id_t)v15;
              _os_log_error_impl(&dword_20D8CB000, v27, OS_LOG_TYPE_ERROR, "Failed to load principal object for entry: %@", buf, 0xCu);
            }

          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v13);
  }

  _ACSignpostGetNanoseconds();
  _ACDNotificationSignpostSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if ((unint64_t)(spid - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D8CB000, v30, OS_SIGNPOST_INTERVAL_END, spid, "AccountDidPerform", ", buf, 2u);
  }

  _ACDNotificationSignpostSystem();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[ACDAccountNotifier postDidPerformDataclassActionsOnAccount:forDataclasses:].cold.1();

}

- (void)addNotificationEntry:(id)a3
{
  NSArray *v4;
  NSArray *notificationEntries;

  -[NSArray arrayByAddingObject:](self->_notificationEntries, "arrayByAddingObject:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  notificationEntries = self->_notificationEntries;
  self->_notificationEntries = v4;

}

- (void)removeAllNotificationEntries
{
  NSArray *v3;
  NSArray *notificationEntries;

  v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
  notificationEntries = self->_notificationEntries;
  self->_notificationEntries = v3;

}

- (id)_pluginsRegisteredForAccount:(id)a3
{
  void *v4;
  NSObject *notificationEntryQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;

  -[ACDAccountNotifier _unsafe_pluginsRegisteredForNewAccount:oldAccount:changeType:](self, "_unsafe_pluginsRegisteredForNewAccount:oldAccount:changeType:", a3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    notificationEntryQueue = self->_notificationEntryQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__ACDAccountNotifier__pluginsRegisteredForAccount___block_invoke;
    block[3] = &unk_24C7E2130;
    v6 = v4;
    v10 = v6;
    dispatch_sync(notificationEntryQueue, block);
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __51__ACDAccountNotifier__pluginsRegisteredForAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_87);
}

void __51__ACDAccountNotifier__pluginsRegisteredForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v4 = a2;
  v2 = (void *)MEMORY[0x212BABD44]();
  v3 = (id)objc_msgSend(v4, "principalObject");
  objc_autoreleasePoolPop(v2);

}

- (id)_pluginsRegisteredForNewAccount:(id)a3 oldAccount:(id)a4 changeType:(int)a5
{
  uint64_t v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *notificationEntryQueue;
  id v14;
  id v15;
  _QWORD block[4];
  id v18;

  v5 = *(_QWORD *)&a5;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountNotifier _unsafe_pluginsRegisteredForNewAccount:oldAccount:changeType:](self, "_unsafe_pluginsRegisteredForNewAccount:oldAccount:changeType:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    notificationEntryQueue = self->_notificationEntryQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__ACDAccountNotifier__pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke;
    block[3] = &unk_24C7E2130;
    v14 = v12;
    v18 = v14;
    dispatch_sync(notificationEntryQueue, block);
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __76__ACDAccountNotifier__pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_principalObject);
}

- (id)_unsafe_pluginsRegisteredForNewAccount:(id)a3 oldAccount:(id)a4 changeType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unsigned int v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "accountType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDAccountNotifier _provisionedDataclassesForNewAccount:oldAccount:](self, "_provisionedDataclassesForNewAccount:oldAccount:", v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    ExplicitAllowedPluginsByChangeType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)MEMORY[0x24BDD1758];
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __83__ACDAccountNotifier__unsafe_pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke;
  v32 = &unk_24C7E2A60;
  v19 = v12;
  v33 = v19;
  v20 = v14;
  v34 = v20;
  v21 = v15;
  v35 = v21;
  v22 = v17;
  v36 = v22;
  objc_msgSend(v18, "predicateWithBlock:", &v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](self->_notificationEntries, "filteredArrayUsingPredicate:", v23, v29, v30, v31, v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v27 = objc_msgSend(v10, "intValue") - 1;
    if (v27 > 4)
      v28 = CFSTR("unknown");
    else
      v28 = off_24C7E2A80[v27];
    *(_DWORD *)buf = 138413058;
    v38 = v8;
    v39 = 2112;
    v40 = v9;
    v41 = 2112;
    v42 = v28;
    v43 = 2114;
    v44 = v24;
    _os_log_debug_impl(&dword_20D8CB000, v25, OS_LOG_TYPE_DEBUG, "\"_unsafe_pluginsRegisteredForNewAccount returning plugins for newAccount %@, oldAccount %@, changeType %@:\\n%{public}@ \", buf, 0x2Au);
  }

  return v24;
}

uint64_t __83__ACDAccountNotifier__unsafe_pluginsRegisteredForNewAccount_oldAccount_changeType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "supportedAccountTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = !v4
    || *(_QWORD *)(a1 + 32) && (objc_msgSend(v4, "containsObject:") & 1) != 0
    || *(_QWORD *)(a1 + 40) && (objc_msgSend(v5, "containsObject:") & 1) != 0;
  objc_msgSend(v3, "supportedDataclasses");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "intersectsSet:", v7) & 1) == 0)
    {
LABEL_11:
      v9 = 0;
      goto LABEL_17;
    }
  }
  else if (!v6)
  {
    goto LABEL_11;
  }
  v10 = *(void **)(a1 + 56);
  if (v10 && objc_msgSend(v10, "count"))
  {
    v11 = *(void **)(a1 + 56);
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "containsObject:", v12);

  }
  else
  {
    v9 = 1;
  }
LABEL_17:

  return v9;
}

- (id)_provisionedDataclassesForNewAccount:(id)a3 oldAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "provisionedDataclasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provisionedDataclasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v7)
  {
    objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    v8 = v6;
  }
  else
  {
    if (!v7)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v8 = v7;
  }
  v9 = v8;
LABEL_9:

  return v9;
}

- (NSArray)notificationEntries
{
  return self->_notificationEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationEntries, 0);
  objc_storeStrong((id *)&self->_notificationEntryQueue, 0);
}

+ (void)allNotificationEntries
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: FaultPlugins ", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)canSaveAccount:inStore:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, (uint64_t)v0, "BEGIN [%lld]: CanSaveAccount account: %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)canRemoveAccount:inStore:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, (uint64_t)v0, "BEGIN [%lld]: CanRemoveAccount account: %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)postDidChangeNotificationForType:inStore:newAccount:oldAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, v1, "END [%lld] %fs: AccountDidChange ", v2);
  OUTLINED_FUNCTION_2();
}

- (void)postWillPerformDataclassActionsOnAccount:forDataclasses:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, v1, "END [%lld] %fs: AccountWillPerform ", v2);
  OUTLINED_FUNCTION_2();
}

- (void)postDidPerformDataclassActionsOnAccount:forDataclasses:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, v1, "END [%lld] %fs: AccountDidPerform ", v2);
  OUTLINED_FUNCTION_2();
}

@end
