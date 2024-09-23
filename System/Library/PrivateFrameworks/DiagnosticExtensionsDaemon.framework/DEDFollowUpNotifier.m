@implementation DEDFollowUpNotifier

- (DEDFollowUpNotifier)initWithConfiguration:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  DEDFollowUpNotifier *v8;
  void *v9;
  uint64_t v10;
  NSString *bugSessionIdentifier;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  FLFollowUpController *followUpController;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DEDFollowUpNotifier;
  v8 = -[DEDFollowUpNotifier init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "notifierConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_config, v9);

    objc_msgSend(v7, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    bugSessionIdentifier = v8->_bugSessionIdentifier;
    v8->_bugSessionIdentifier = (NSString *)v10;

    v12 = objc_alloc(MEMORY[0x24BE1B3A8]);
    -[DEDFollowUpNotifier config](v8, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hostAppIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithClientIdentifier:", v14);
    followUpController = v8->_followUpController;
    v8->_followUpController = (FLFollowUpController *)v15;

  }
  return v8;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[DEDFollowUpNotifier config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "followupUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)presentNotificationForSession:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
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
  void *v33;
  void *v34;
  void *v35;
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
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
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
  id v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  -[DEDFollowUpNotifier identifier](self, "identifier", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDFollowUpNotifier bugSessionIdentifier](self, "bugSessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v4;
    v71 = 2114;
    v72 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling followup notification: %{public}@ for session [%{public}@]", buf, 0x16u);

  }
  v7 = (void *)objc_opt_new();
  v66 = (void *)v4;
  objc_msgSend(v7, "setUniqueIdentifier:", v4);
  -[DEDFollowUpNotifier config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "followupLocalizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v9);

  -[DEDFollowUpNotifier config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "followupLocalizedInformativeText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInformativeText:", v11);

  objc_msgSend(v7, "setDisplayStyle:", 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDFollowUpNotifier config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reviewActionLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BE1B3A0];
    -[DEDFollowUpNotifier config](self, "config");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reviewActionLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDFollowUpNotifier config](self, "config");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "followupReviewActionURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithLabel:url:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDFollowUpNotifier config](self, "config");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "followupReviewActionUserInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[DEDFollowUpNotifier config](self, "config");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "followupReviewActionUserInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUserInfo:", v24);

    }
    objc_msgSend(v12, "addObject:", v20);

  }
  -[DEDFollowUpNotifier config](self, "config");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendActionLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)MEMORY[0x24BE1B3A0];
    -[DEDFollowUpNotifier config](self, "config");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sendActionLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDFollowUpNotifier config](self, "config");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "followupSendActionURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "actionWithLabel:url:", v29, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDFollowUpNotifier config](self, "config");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "followupSendActionUserInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[DEDFollowUpNotifier config](self, "config");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "followupSendActionUserInfo");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setUserInfo:", v36);

    }
    objc_msgSend(v12, "addObject:", v32);

  }
  objc_msgSend(v7, "setActions:", v12);
  -[DEDFollowUpNotifier config](self, "config");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "followupExtensionIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[DEDFollowUpNotifier config](self, "config");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "followupExtensionIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExtensionIdentifier:", v40);

  }
  v41 = (void *)objc_opt_new();
  -[DEDFollowUpNotifier config](self, "config");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedNotificationTitle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTitle:", v43);

  -[DEDFollowUpNotifier config](self, "config");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "localizedNotificationBody");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setInformativeText:", v45);

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", *MEMORY[0x24BE1B348], *MEMORY[0x24BE1B350], 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDFollowUpNotifier config](self, "config");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "followupUseSpringboardNotification");

  if (v48)
    objc_msgSend(v46, "addObject:", *MEMORY[0x24BE1B358]);
  -[DEDFollowUpNotifier config](self, "config");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "followupNotificationActionURL");
  v50 = objc_claimAutoreleasedReturnValue();
  if (!v50)
    goto LABEL_18;
  v51 = (void *)v50;
  -[DEDFollowUpNotifier config](self, "config");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "followupNotificationActionTitle");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = (void *)MEMORY[0x24BE1B3A0];
    -[DEDFollowUpNotifier config](self, "config");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "followupNotificationActionTitle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDFollowUpNotifier config](self, "config");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "followupNotificationActionURL");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "actionWithLabel:url:", v55, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActivateAction:", v58);

LABEL_18:
  }
  objc_msgSend(v41, "setOptions:", v46);
  -[DEDFollowUpNotifier config](self, "config");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "followupFrequency");
  objc_msgSend(v41, "setFrequency:");

  objc_msgSend(v41, "setFirstNotificationDelay:", 0.0);
  -[DEDFollowUpNotifier config](self, "config");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "followupNotificationBundlePath");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRepresentingBundlePath:", v61);

  -[DEDFollowUpNotifier config](self, "config");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "followupNotificationBundleIconName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleIconName:", v63);

  objc_msgSend(v7, "setNotification:", v41);
  -[DEDFollowUpNotifier followUpController](self, "followUpController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke;
  v67[3] = &unk_24D1E4B00;
  v68 = v66;
  v65 = v66;
  objc_msgSend(v64, "postFollowUpItem:completion:", v7, v67);

}

void __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    Log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v16 = 138543362;
      v17 = v7;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "Followup item posted: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    Log();
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v8)
        __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_2(v5, v6);
    }
    else if (v8)
    {
      __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_1(v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }

}

- (void)removeNotificationForSession:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[DEDFollowUpNotifier identifier](self, "identifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[DEDFollowUpNotifier bugSessionIdentifier](self, "bugSessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v4;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling followup notification: %{public}@ for bug session [%{public}@]", buf, 0x16u);

  }
  -[DEDFollowUpNotifier followUpController](self, "followUpController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v7, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v8, &v18);
  v9 = v18;

  if (v9)
  {
    Log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[DEDFollowUpNotifier removeNotificationForSession:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

+ (id)archivedClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DEDFollowUpNotifier config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("config"));

  -[DEDFollowUpNotifier bugSessionIdentifier](self, "bugSessionIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bugSessionIdentifier"));

}

- (DEDFollowUpNotifier)initWithCoder:(id)a3
{
  id v4;
  DEDFollowUpNotifier *v5;
  void *v6;
  uint64_t v7;
  NSString *bugSessionIdentifier;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  FLFollowUpController *followUpController;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DEDFollowUpNotifier;
  v5 = -[DEDFollowUpNotifier init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("config"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_config, v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bugSessionIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bugSessionIdentifier = v5->_bugSessionIdentifier;
    v5->_bugSessionIdentifier = (NSString *)v7;

    v9 = objc_alloc(MEMORY[0x24BE1B3A8]);
    -[DEDFollowUpNotifier config](v5, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hostAppIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "initWithClientIdentifier:", v11);
    followUpController = v5->_followUpController;
    v5->_followUpController = (FLFollowUpController *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)forceRemoveNotificationWithIdentifier:(id)a3 hostIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  Log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Will force remove notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", v6);
  v21 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v8, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v9, &v20);
  v10 = v20;

  Log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DEDFollowUpNotifier removeNotificationForSession:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "Removed notification with identifier [%{public}@] for app [%{public}@]", buf, 0x16u);
  }

}

- (DEDNotifierConfiguration)config
{
  return (DEDNotifierConfiguration *)objc_loadWeakRetained((id *)&self->_config);
}

- (void)setConfig:(id)a3
{
  objc_storeWeak((id *)&self->_config, a3);
}

- (NSString)bugSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBugSessionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (FLFollowUpController)followUpController
{
  return (FLFollowUpController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFollowUpController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_config);
}

void __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "Followup item not posted, but no error was given.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

void __53__DEDFollowUpNotifier_presentNotificationForSession___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "Followup item was not posted.\n[error info] %{public}@", (uint8_t *)&v4, 0xCu);

}

- (void)removeNotificationForSession:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21469E000, a1, a3, "Error clearing followup items.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_3();
}

@end
