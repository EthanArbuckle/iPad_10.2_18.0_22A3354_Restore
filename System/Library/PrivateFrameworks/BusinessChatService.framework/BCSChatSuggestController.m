@implementation BCSChatSuggestController

- (id)initWithUserDefaults:(void *)a3 identityService:(void *)a4 localeHelper:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BCSChatSuggestController;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (BOOL)chatSuggestVisibilityForBusinessItem:(id)a3
{
  id v4;
  BCSLocaleHelperProtocol *localeHelper;
  BCSLocaleHelperProtocol *v6;
  void *v7;
  void *v8;
  BCSLocaleHelperProtocol *v9;
  BCSLocaleHelperProtocol *v10;
  void *v11;
  void *v12;
  void *v13;
  BCSUserDefaultsProviding *userDefaults;
  void *v15;
  NSObject *v16;
  id v17;
  BCSIdentityServiceProtocol *identityService;
  void *v19;
  BCSIdentityServiceProtocol *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  BCSLocaleHelperProtocol *v44;
  BCSLocaleHelperProtocol *v45;
  void *v46;
  void *v47;
  BCSLocaleHelperProtocol *v48;
  BCSLocaleHelperProtocol *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    localeHelper = self->_localeHelper;
  else
    localeHelper = 0;
  v6 = localeHelper;
  -[BCSLocaleHelperProtocol currentLocale](v6, "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLocale language](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v9 = self->_localeHelper;
  else
    v9 = 0;
  v10 = v9;
  -[BCSLocaleHelperProtocol currentLocale](v10, "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLocale country](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_selectedVisibilityItemForLanguage:country:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    userDefaults = self->_userDefaults;
  else
    userDefaults = 0;
  -[BCSUserDefaultsProviding stringForKey:](userDefaults, "stringForKey:", CFSTR("BCSCustomMessagesIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    ABSLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
      v58 = 2114;
      v59 = v13;
      _os_log_impl(&dword_20ACAD000, v16, OS_LOG_TYPE_DEFAULT, "%s Using custom messages identifier for Chat Suggest with visibilityItem:%{public}@", buf, 0x16u);
    }

    v17 = v15;
    goto LABEL_37;
  }
  if (!self || (identityService = self->_identityService) == 0)
  {
    ABSLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
      v24 = "%s Identity Service is nil";
LABEL_48:
      _os_log_error_impl(&dword_20ACAD000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
    }
LABEL_19:
    v17 = 0;
    goto LABEL_30;
  }
  -[BCSIdentityServiceProtocol businessChatAccount](identityService, "businessChatAccount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    ABSLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
      v24 = "%s BusinessChat account is nil";
      goto LABEL_48;
    }
    goto LABEL_19;
  }
  v20 = self->_identityService;
  -[BCSIdentityServiceProtocol businessChatAccount](v20, "businessChatAccount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "profileID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "length"))
  {
    -[BCSIdentityServiceProtocol businessChatAccount](self->_identityService, "businessChatAccount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "loginID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    if (v27)
      goto LABEL_21;
    ABSLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
      v24 = "%s Both profileID and loginID have 0 length";
      goto LABEL_48;
    }
    goto LABEL_19;
  }

LABEL_21:
  -[BCSIdentityServiceProtocol businessChatAccount](self->_identityService, "businessChatAccount");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "profileID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v30)
  {
    ABSLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
      v58 = 2114;
      v59 = v13;
      _os_log_impl(&dword_20ACAD000, v31, OS_LOG_TYPE_DEFAULT, "%s Using iCloud DSID identifier for Chat Suggest with visibilityItem:%{public}@", buf, 0x16u);
    }

    -[BCSIdentityServiceProtocol businessChatAccount](self->_identityService, "businessChatAccount");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject profileID](v23, "profileID");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BCSIdentityServiceProtocol businessChatAccount](self->_identityService, "businessChatAccount");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "loginID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length");

    if (!v35)
    {
      v17 = 0;
      goto LABEL_31;
    }
    ABSLogCommon();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
      v58 = 2114;
      v59 = v13;
      _os_log_impl(&dword_20ACAD000, v36, OS_LOG_TYPE_DEFAULT, "%s Using SIM phone number identifier for Chat Suggest with visibilityItem:%{public}@", buf, 0x16u);
    }

    -[BCSIdentityServiceProtocol businessChatAccount](self->_identityService, "businessChatAccount");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject loginID](v23, "loginID");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (id)v32;
LABEL_30:

LABEL_31:
  v37 = objc_msgSend(v17, "length");
  ABSLogCommon();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v37)
  {
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
      v58 = 2114;
      v59 = v13;
      _os_log_impl(&dword_20ACAD000, v39, OS_LOG_TYPE_DEFAULT, "%s Messages Identifier is valid -- visibilityItem:%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
    _os_log_error_impl(&dword_20ACAD000, v39, OS_LOG_TYPE_ERROR, "%s Messsages identifier has 0 length", buf, 0xCu);
  }

LABEL_37:
  objc_msgSend(v4, "bizID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v4, "_isChatSuggestVisibleForVisibilityItem:messagesIdentifier:bizID:", v13, v17, v40);

  ABSLogCommon();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v13;
    if (self)
      v44 = self->_localeHelper;
    else
      v44 = 0;
    v45 = v44;
    -[BCSLocaleHelperProtocol currentLocale](v45, "currentLocale");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLocale language](v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v4;
    v53 = v15;
    if (self)
      v48 = self->_localeHelper;
    else
      v48 = 0;
    v49 = v48;
    -[BCSLocaleHelperProtocol currentLocale](v49, "currentLocale");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLocale country](v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v57 = "-[BCSChatSuggestController chatSuggestVisibilityForBusinessItem:]";
    v58 = 2114;
    v59 = v43;
    v60 = 2114;
    v61 = v47;
    v62 = 2114;
    v63 = v51;
    _os_log_impl(&dword_20ACAD000, v42, OS_LOG_TYPE_DEFAULT, "%s isChatSuggestVisible: %{public}@ device language:%{public}@ device country:%{public}@", buf, 0x2Au);

    v13 = v54;
    v4 = v55;
    v15 = v53;
  }

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeHelper, 0);
  objc_storeStrong((id *)&self->_identityService, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
