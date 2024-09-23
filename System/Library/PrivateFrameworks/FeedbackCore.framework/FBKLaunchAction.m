@implementation FBKLaunchAction

+ (id)actionWithURL:(id)a3
{
  id v3;
  FBKLaunchAction *v4;

  v3 = a3;
  v4 = -[FBKLaunchAction initWithURL:]([FBKLaunchAction alloc], "initWithURL:", v3);

  return v4;
}

+ (id)mappingForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  id v16;

  v3 = a3;
  objc_msgSend(CFSTR("bundle-mapping"), "stringByAppendingString:", CFSTR("-iOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("json"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataWithContentsOfURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    v11 = &stru_24E15EAF8;
    if (v3 && (objc_msgSend(v3, "isEqualToString:", &stru_24E15EAF8) & 1) == 0)
    {
      objc_msgSend(v3, "rangeOfString:options:", CFSTR("com.apple."), 8);
      if (v12)
      {
        if (v10)
        {
          v13 = &stru_24E15EAF8;
        }
        else
        {
          objc_msgSend(v9, "valueForKey:", v3);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v13 = CFSTR("seedios:3rdpartyapps");
      }
      v11 = v13;
    }

    v14 = v11;
  }
  else
  {
    v14 = 0;
    v11 = &stru_24E15EAF8;
  }

  return v14;
}

- (FBKLaunchAction)initWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  FBKLaunchAction *v6;
  FBKLaunchAction *v7;
  uint64_t v8;
  NSString *action;
  id *p_action;
  NSMutableDictionary *attachments;
  void *v12;
  void *v13;
  id *p_queryItemsFromURL;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *loginToken;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *questionAnswerPairsFromURL;
  void *v25;
  void *v26;
  void *v27;
  NSDictionary *v28;
  uint64_t v29;
  NSDictionary *questionAnswersPairsFromURLV2;
  NSDictionary *v31;
  void *v32;
  uint64_t v33;
  NSString *bundleID;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSNumber *bugformIDFromURL;
  void *v40;
  void *v41;
  uint64_t v42;
  NSMutableDictionary *v43;
  uint64_t v44;
  NSString *formIdentifier;
  id v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSNumber *itemID;
  NSObject *v54;
  uint64_t v55;
  NSNumber *ffuID;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  FBKURLExtension *v65;
  void *v66;
  FBKURLExtension *v67;
  uint64_t v68;
  NSSet *extensions;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  NSString *configurationToken;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  NSDictionary *v83;
  void *v84;
  void *v85;
  FBKURLExtension *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  int v92;
  NSObject *v93;
  void *v94;
  void *v95;
  FBKLaunchAction *v96;
  id v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  objc_super v109;
  const __CFString *v110;
  void *v111;
  uint8_t v112[128];
  uint8_t buf[16];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Creating URL action with URL [%{public}@]", buf, 0xCu);
  }

  v109.receiver = self;
  v109.super_class = (Class)FBKLaunchAction;
  v6 = -[FBKLaunchAction init](&v109, sel_init);
  v7 = v6;
  if (v6)
  {
    -[FBKLaunchAction setUrl:](v6, "setUrl:", v4);
    objc_msgSend(v4, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    p_action = (id *)&v7->_action;
    action = v7->_action;
    v7->_action = (NSString *)v8;

    attachments = v7->_attachments;
    v7->_attachments = 0;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v4, 1);
    objc_msgSend(v12, "queryItemsAsDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    p_queryItemsFromURL = (id *)&v7->_queryItemsFromURL;
    objc_storeStrong((id *)&v7->_queryItemsFromURL, v13);
    if (FBKIsInternalInstall(v15, v16))
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("login_token"));
      v17 = objc_claimAutoreleasedReturnValue();
      loginToken = v7->_loginToken;
      v7->_loginToken = (NSString *)v17;

    }
    objc_msgSend(*p_queryItemsFromURL, "objectForKeyedSubscript:", CFSTR("is_captive"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v7->_isCaptiveFromURL, v19);
    }
    objc_msgSend(*p_queryItemsFromURL, "objectForKeyedSubscript:", CFSTR("make_visible"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v7->_shouldMakeVisibleFromURL, v20);
    }
    objc_msgSend(*p_queryItemsFromURL, "objectForKeyedSubscript:", CFSTR("notify_on_upload"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v7->_shouldNotifyOnUploadFromURL, v21);
    }
    v101 = v21;
    -[NSDictionary objectForKeyedSubscript:](v7->_queryItemsFromURL, "objectForKeyedSubscript:", CFSTR("team_type"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_teamType = 1000;
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7->_teamType = FBKTeamTypeFromString(v22);
    }
    v104 = v22;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("answers"));
    v23 = objc_claimAutoreleasedReturnValue();
    questionAnswerPairsFromURL = v7->_questionAnswerPairsFromURL;
    v7->_questionAnswerPairsFromURL = (NSDictionary *)v23;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("question"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("questions"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v25, "transformValueToArray");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v102 = v27;
      if (v26)
      {
        v28 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v27);
        -[NSDictionary addEntriesFromDictionary:](v28, "addEntriesFromDictionary:", v26);
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v28);
        v29 = objc_claimAutoreleasedReturnValue();
        questionAnswersPairsFromURLV2 = v7->_questionAnswersPairsFromURLV2;
        v7->_questionAnswersPairsFromURLV2 = (NSDictionary *)v29;

      }
      else
      {
        v31 = v27;
        v28 = v7->_questionAnswersPairsFromURLV2;
        v7->_questionAnswersPairsFromURLV2 = v31;
      }

    }
    else
    {
      v102 = 0;
    }
    v103 = v20;
    v32 = v104;
    if ((objc_msgSend(*p_action, "isEqualToString:", CFSTR("new")) & 1) != 0
      || objc_msgSend(*p_action, "isEqualToString:", CFSTR("launchFeedback")))
    {
      v98 = v26;
      objc_msgSend(v13, "objectForKey:", CFSTR("bundleID"));
      v33 = objc_claimAutoreleasedReturnValue();
      bundleID = v7->_bundleID;
      v7->_bundleID = (NSString *)v33;

      objc_msgSend(v13, "objectForKey:", CFSTR("formID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v13, "objectForKey:", CFSTR("formID"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "numberWithInteger:", objc_msgSend(v37, "integerValue"));
        v38 = objc_claimAutoreleasedReturnValue();
        bugformIDFromURL = v7->_bugformIDFromURL;
        v7->_bugformIDFromURL = (NSNumber *)v38;

      }
      else
      {
        v37 = v7->_bugformIDFromURL;
        v7->_bugformIDFromURL = 0;
      }

      v40 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v13, "objectForKey:", CFSTR("attach"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "dictionaryWithDictionary:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v7->_attachments;
      v7->_attachments = (NSMutableDictionary *)v42;

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("form_identifier"));
      v44 = objc_claimAutoreleasedReturnValue();
      formIdentifier = v7->_formIdentifier;
      v7->_formIdentifier = (NSString *)v44;

      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("extension"));
      v46 = (id)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        objc_opt_class();
        v32 = v104;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v47 = v46;
        }
        else
        {
          *(_QWORD *)buf = v46;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
          v47 = objc_claimAutoreleasedReturnValue();
        }
        v48 = v47;
      }
      else
      {
        v48 = 0;
        v32 = v104;
      }

      v100 = v48;
      if (-[NSObject count](v48, "count"))
      {
        v94 = v19;
        v95 = v12;
        v96 = v7;
        v97 = v4;
        v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", -[NSObject count](v48, "count"));
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v59 = v48;
        v60 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v106;
          do
          {
            for (i = 0; i != v61; ++i)
            {
              if (*(_QWORD *)v106 != v62)
                objc_enumerationMutation(v59);
              v64 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
              v65 = [FBKURLExtension alloc];
              objc_msgSend(v13, "objectForKeyedSubscript:", v64);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = -[FBKURLExtension initWithExtensionIdentifier:parameters:](v65, "initWithExtensionIdentifier:parameters:", v64, v66);

              objc_msgSend(v58, "addObject:", v67);
            }
            v61 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
          }
          while (v61);
        }

        v68 = objc_msgSend(v58, "copy");
        v7 = v96;
        extensions = v96->_extensions;
        v96->_extensions = (NSSet *)v68;

        v4 = v97;
        v19 = v94;
        v12 = v95;
        v20 = v103;
        v32 = v104;
        v48 = v100;
      }
      -[FBKLaunchAction bundleID](v7, "bundleID", v94, v95);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
      {
        v71 = (void *)objc_opt_class();
        -[FBKLaunchAction bundleID](v7, "bundleID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "mappingForBundleID:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73 && (objc_msgSend(v73, "isEqualToString:", &stru_24E15EAF8) & 1) == 0)
        {
          v74 = (void *)-[NSDictionary mutableCopy](v7->_questionAnswerPairsFromURL, "mutableCopy");
          v75 = v74;
          if (v74)
            v76 = v74;
          else
            v76 = (id)objc_opt_new();
          v80 = v76;

          v110 = CFSTR(":area");
          v111 = v73;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addEntriesFromDictionary:", v81);

          v82 = objc_msgSend(v80, "copy");
          v83 = v7->_questionAnswerPairsFromURL;
          v7->_questionAnswerPairsFromURL = (NSDictionary *)v82;

          v48 = v100;
        }

      }
      if (-[FBKLaunchAction hasPendingSysdiagnoseInAttachments](v7, "hasPendingSysdiagnoseInAttachments"))
      {
        v84 = v19;
        v85 = v12;
        v86 = -[FBKURLExtension initWithExtensionIdentifier:parameters:]([FBKURLExtension alloc], "initWithExtensionIdentifier:parameters:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"), &unk_24E18D270);
        -[FBKLaunchAction extensions](v7, "extensions");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v87;
        if (!v87)
          v88 = (void *)objc_opt_new();
        objc_msgSend(v88, "setByAddingObject:", v86);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKLaunchAction setExtensions:](v7, "setExtensions:", v89);

        if (!v87)
        -[FBKLaunchAction attachments](v7, "attachments");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "removeObjectForKey:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"));

        v12 = v85;
        v19 = v84;
        v20 = v103;
        v32 = v104;
        v48 = v100;
        v57 = v101;
      }
      else
      {
        v57 = v101;
      }
      v26 = v98;
      goto LABEL_74;
    }
    if (objc_msgSend(*p_action, "isEqualToString:", CFSTR("show")))
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("item"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v50 = v49;
        if (objc_msgSend(v49, "hasPrefix:", CFSTR("FB")))
        {
          objc_msgSend(v50, "stringByReplacingOccurrencesOfString:withString:", CFSTR("FB"), &stru_24E15EAF8);
          v51 = objc_claimAutoreleasedReturnValue();

          v50 = (void *)v51;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v50, "longLongValue"));
        v52 = objc_claimAutoreleasedReturnValue();
        itemID = v7->_itemID;
        v7->_itemID = (NSNumber *)v52;

        v32 = v104;
      }
      objc_msgSend(v13, "objectForKey:", CFSTR("ffu"));
      v54 = objc_claimAutoreleasedReturnValue();
      v48 = v54;
      if (v54)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[NSObject longLongValue](v54, "longLongValue"));
        v55 = objc_claimAutoreleasedReturnValue();
        ffuID = v7->_ffuID;
        v7->_ffuID = (NSNumber *)v55;

      }
    }
    else
    {
      if (objc_msgSend(*p_action, "isEqualToString:", CFSTR("login")))
      {
        objc_msgSend(v13, "objectForKey:", CFSTR("config"));
        v77 = objc_claimAutoreleasedReturnValue();
        configurationToken = v7->_configurationToken;
        v7->_configurationToken = (NSString *)v77;

        v57 = v101;
        if (v7->_configurationToken)
        {
LABEL_75:

          goto LABEL_76;
        }
        +[FBKLog appHandle](FBKLog, "appHandle");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[FBKLaunchAction initWithURL:].cold.1(v48);
LABEL_74:

        goto LABEL_75;
      }
      if (objc_msgSend(*p_action, "isEqualToString:", CFSTR("launchSurvey")))
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("form_identifier"));
        v79 = objc_claimAutoreleasedReturnValue();
        v48 = v7->_formIdentifier;
        v7->_formIdentifier = (NSString *)v79;
      }
      else
      {
        v99 = v26;
        v92 = objc_msgSend(*p_action, "isEqualToString:", CFSTR("evaluate"));
        +[FBKLog appHandle](FBKLog, "appHandle");
        v93 = objc_claimAutoreleasedReturnValue();
        v48 = v93;
        if (v92)
        {
          v26 = v99;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21D9A9000, v48, OS_LOG_TYPE_DEFAULT, "Parsed show batch UI launch action", buf, 2u);
          }
        }
        else
        {
          v26 = v99;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            -[FBKLaunchAction initWithURL:].cold.2((uint64_t *)&v7->_action, v48);
        }
      }
    }
    v57 = v101;
    goto LABEL_74;
  }
LABEL_76:

  return v7;
}

- (BOOL)isShowContentItemAction
{
  void *v3;
  BOOL v4;

  if (!-[FBKLaunchAction showsItem](self, "showsItem"))
    return 0;
  -[FBKLaunchAction itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isFFUAction
{
  void *v3;
  BOOL v4;

  if (!-[FBKLaunchAction isShowContentItemAction](self, "isShowContentItemAction"))
    return 0;
  -[FBKLaunchAction ffuID](self, "ffuID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSString)loginToken
{
  NSString *v3;

  if (FBKIsInternalInstall(self, a2))
    v3 = self->_loginToken;
  else
    v3 = 0;
  return v3;
}

- (BOOL)handlesLogin
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;

  -[FBKLaunchAction action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("login")) & 1) != 0)
  {
    -[FBKLaunchAction configurationToken](self, "configurationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return 1;
  }
  else
  {

  }
  if (!FBKIsInternalInstall(v5, v6))
    return 0;
  -[FBKLaunchAction loginToken](self, "loginToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 != 0;

  return v7;
}

- (void)addCustomBehavior:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  FBKLaunchAction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[FBKLaunchAction customBehavior](self, "customBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = self;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "Adding [%{public}@] to Launch Action [%{public}@]", (uint8_t *)&v7, 0x16u);

  }
  -[FBKLaunchAction setCustomBehavior:](self, "setCustomBehavior:", v4);

}

+ (id)hostBundleIdentifier
{
  if (hostBundleIdentifier_onceToken != -1)
    dispatch_once(&hostBundleIdentifier_onceToken, &__block_literal_global_25);
  return (id)hostBundleIdentifier__hostBundleID;
}

void __39__FBKLaunchAction_hostBundleIdentifier__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBD288]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hostBundleIdentifier__hostBundleID;
  hostBundleIdentifier__hostBundleID = v1;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FBKLaunchAction url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKLaunchAction customBehavior](self, "customBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FBKLaunchAction %@, customBehavior: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isCaptive
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[FBKLaunchAction isCaptiveFromURL](self, "isCaptiveFromURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKLaunchAction isCaptiveFromURL](self, "isCaptiveFromURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));
LABEL_5:
    LOBYTE(v6) = v5;

    return (char)v6;
  }
  -[FBKLaunchAction customBehavior](self, "customBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FBKLaunchAction customBehavior](self, "customBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCaptive");
    goto LABEL_5;
  }
  return (char)v6;
}

- (BOOL)shouldNotifyOnUpload
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[FBKLaunchAction shouldNotifyOnUploadFromURL](self, "shouldNotifyOnUploadFromURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKLaunchAction shouldNotifyOnUploadFromURL](self, "shouldNotifyOnUploadFromURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));
LABEL_5:
    LOBYTE(v6) = v5;

    return (char)v6;
  }
  -[FBKLaunchAction customBehavior](self, "customBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FBKLaunchAction customBehavior](self, "customBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "notifyOnUpload");
    goto LABEL_5;
  }
  return (char)v6;
}

- (BOOL)shouldMakeFBAVisible
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[FBKLaunchAction shouldMakeVisibleFromURL](self, "shouldMakeVisibleFromURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKLaunchAction shouldMakeVisibleFromURL](self, "shouldMakeVisibleFromURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));
LABEL_5:
    LOBYTE(v6) = v5;

    return (char)v6;
  }
  -[FBKLaunchAction customBehavior](self, "customBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FBKLaunchAction customBehavior](self, "customBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "makeVisible");
    goto LABEL_5;
  }
  return (char)v6;
}

- (NSNumber)bugFormID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FBKLaunchAction bugformIDFromURL](self, "bugformIDFromURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKLaunchAction bugformIDFromURL](self, "bugformIDFromURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBKLaunchAction customBehavior](self, "customBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FBKLaunchAction customBehavior](self, "customBehavior");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "formId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return (NSNumber *)v4;
}

- (NSDictionary)questionAnswerPairs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  -[FBKLaunchAction questionAnswerPairsFromURL](self, "questionAnswerPairsFromURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[FBKLaunchAction questionAnswerPairsFromURL](self, "questionAnswerPairsFromURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBKLaunchAction customBehavior](self, "customBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FBKLaunchAction customBehavior](self, "customBehavior");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "answers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[FBKLaunchAction questionAnswersPairsFromURLV2](self, "questionAnswersPairsFromURLV2");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[FBKLaunchAction questionAnswersPairsFromURLV2](self, "questionAnswersPairsFromURLV2");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        return (NSDictionary *)v7;
      }
      v4 = 0;
    }
  }
  objc_msgSend(v4, "transformValueToArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (BOOL)shouldUndoMakeFBAVisible
{
  void *v2;
  char v3;

  -[FBKLaunchAction shouldMakeVisibleFromURL](self, "shouldMakeVisibleFromURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("0"));

  return v3;
}

- (BOOL)launchesInbox
{
  void *v2;
  char v3;

  -[FBKLaunchAction action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("inbox"));

  return v3;
}

- (BOOL)launchesFeedback
{
  void *v2;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[FBKLaunchAction action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("new")) & 1) == 0)
  {
    -[FBKLaunchAction action](self, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("launchFeedback")) & 1) != 0)
    {
      v5 = 1;
LABEL_12:

      goto LABEL_13;
    }
    -[FBKLaunchAction customBehavior](self, "customBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (-[FBKLaunchAction customBehavior](self, "customBehavior"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v2, "launchNewDraft") & 1) != 0))
    {
      v5 = 1;
    }
    else
    {
      -[FBKLaunchAction customBehavior](self, "customBehavior");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        -[FBKLaunchAction customBehavior](self, "customBehavior");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v10, "isCaptive");

        if (!v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v5 = 0;
        if (!v7)
          goto LABEL_11;
      }
    }

    goto LABEL_11;
  }
  v5 = 1;
LABEL_13:

  return v5;
}

- (BOOL)launchesSurvey
{
  void *v2;
  char v3;

  -[FBKLaunchAction action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("launchSurvey"));

  return v3;
}

- (BOOL)launchesBatchUI
{
  void *v2;
  char v3;

  -[FBKLaunchAction action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("evaluate"));

  return v3;
}

+ (id)validateURLSchemeFilePathsDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  void *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v21 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v25;
      *(_QWORD *)&v5 = 138412802;
      v20 = v5;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKeyedSubscript:", v9, v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          v12 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", &v23);
          v13 = v23;
          if (v12)
          {
            objc_msgSend(v21, "setObject:forKey:", v11, v9);
          }
          else
          {
            +[FBKLog appHandle](FBKLog, "appHandle");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              v29 = v10;
              v30 = 2112;
              v31 = v11;
              v32 = 2112;
              v33 = v13;
              _os_log_error_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_ERROR, "Cannot attach local file path [%@] url: [%@] error? [%@]", buf, 0x20u);
            }

          }
          +[FBKLog appHandle](FBKLog, "appHandle");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v29 = v10;
            v30 = 2112;
            v31 = v11;
            v32 = 2112;
            v33 = v13;
            _os_log_debug_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_DEBUG, "Validated local file path [%@] url: [%@] error? [%@]", buf, 0x20u);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v6);
    }

    objc_msgSend(v21, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v21, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
        v16 = (void *)objc_msgSend(v21, "copy");
      else
        v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)hasPendingSysdiagnoseInAttachments
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FBKLaunchAction attachments](self, "attachments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose")))
        {
          -[FBKLaunchAction attachments](self, "attachments");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 && (objc_msgSend(v3, "fileExistsAtPath:", v12) & 1) == 0)
          {
            +[FBKLog attachHandle](FBKLog, "attachHandle");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v21 = v12;
              _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "Found key-chord sysdiagnose [%{public}@]", buf, 0xCu);
            }

            v13 = 1;
            goto LABEL_16;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

+ (id)urlSchemeForFeedbackID:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://%@?item=%@"), CFSTR("applefeedback"), CFSTR("show"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKLog appHandle](FBKLog, "appHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_INFO, "Building URL from string [%{public}@]", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)findExactMatchFormStubAndTeamWithFormStubs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[FBKLaunchAction formIdentifier](self, "formIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKLaunchAction formStubsWithIdentifier:bugFormStubs:](FBKLaunchAction, "formStubsWithIdentifier:bugFormStubs:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[FBKLaunchAction preferredTeamForLaunchAction:withFormStubs:](FBKLaunchAction, "preferredTeamForLaunchAction:withFormStubs:", self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKLaunchAction setTeamForExactMatchFormStub:](self, "setTeamForExactMatchFormStub:", v7);

    -[FBKLaunchAction teamForExactMatchFormStub](self, "teamForExactMatchFormStub");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__FBKLaunchAction_findExactMatchFormStubAndTeamWithFormStubs___block_invoke;
    v11[3] = &unk_24E158DD0;
    v12 = v6;
    objc_msgSend(v9, "ded_findWithBlock:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKLaunchAction setExactMatchFormStub:](self, "setExactMatchFormStub:", v10);

  }
}

uint64_t __62__FBKLaunchAction_findExactMatchFormStubAndTeamWithFormStubs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

+ (id)formStubsWithIdentifier:(id)a3 bugFormStubs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __56__FBKLaunchAction_formStubsWithIdentifier_bugFormStubs___block_invoke;
  v26[3] = &unk_24E158DD0;
  v6 = v5;
  v27 = v6;
  objc_msgSend(a4, "ded_selectItemsPassingTest:", v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("serverID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    v20 = v7;
  }
  else
  {
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("teams.ID"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          if (*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17))
            objc_msgSend(v11, "addObjectsFromArray:");
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v15);
    }

    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKLog model](FBKLog, "model");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v29 = v6;
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v18;
      _os_log_error_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_ERROR, "form_identifier [%{public}@] matched more than one From Stub [%{public}@] in teams [%{public}@]", buf, 0x20u);
    }

    v20 = 0;
  }

  return v20;
}

uint64_t __56__FBKLaunchAction_formStubsWithIdentifier_bugFormStubs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "tat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)preferredTeamForLaunchAction:(id)a3 withFormStubs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 4);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "teams");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unionSet:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count") == 1 || (unint64_t)objc_msgSend(v7, "count") < 2)
    goto LABEL_14;
  if (objc_msgSend(v5, "teamType") == 1000)
  {
    objc_msgSend(v7, "ded_findWithBlock:", &__block_literal_global_119);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __62__FBKLaunchAction_preferredTeamForLaunchAction_withFormStubs___block_invoke;
    v19[3] = &unk_24E158DF8;
    v20 = v5;
    objc_msgSend(v7, "ded_findWithBlock:", v19);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  if (v15 | v14)
  {
    if (v15)
      v18 = (void *)v15;
    else
      v18 = (void *)v14;
    v16 = v18;

  }
  else
  {
LABEL_14:
    objc_msgSend(v7, "anyObject");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

BOOL __62__FBKLaunchAction_preferredTeamForLaunchAction_withFormStubs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "teamType");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "teamType");
}

BOOL __62__FBKLaunchAction_preferredTeamForLaunchAction_withFormStubs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "teamType") == 0;
}

- (BOOL)hasFormItemTatToFetch
{
  void *v3;
  BOOL v4;

  if (!-[FBKLaunchAction launchesFeedback](self, "launchesFeedback"))
    return 0;
  -[FBKLaunchAction formIdentifier](self, "formIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAttachments
{
  void *v2;
  BOOL v3;

  -[FBKLaunchAction attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)showsItem
{
  void *v2;
  char v3;

  -[FBKLaunchAction action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("show"));

  return v3;
}

- (BOOL)comesFromFeedbackd
{
  void *v3;
  char v4;
  void *v5;

  -[FBKLaunchAction action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("launchSurvey")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[FBKLaunchAction action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("launchFeedback"));

  }
  return v4;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (NSNumber)ffuID
{
  return self->_ffuID;
}

- (void)setFfuID:(id)a3
{
  objc_storeStrong((id *)&self->_ffuID, a3);
}

- (NSSet)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (NSMutableDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)configurationToken
{
  return self->_configurationToken;
}

- (NSString)formIdentifier
{
  return self->_formIdentifier;
}

- (void)setFormIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_formIdentifier, a3);
}

- (unint64_t)teamType
{
  return self->_teamType;
}

- (void)setTeamType:(unint64_t)a3
{
  self->_teamType = a3;
}

- (FBKBugFormStub)exactMatchFormStub
{
  return self->_exactMatchFormStub;
}

- (void)setExactMatchFormStub:(id)a3
{
  objc_storeStrong((id *)&self->_exactMatchFormStub, a3);
}

- (FBKTeam)teamForExactMatchFormStub
{
  return self->_teamForExactMatchFormStub;
}

- (void)setTeamForExactMatchFormStub:(id)a3
{
  objc_storeStrong((id *)&self->_teamForExactMatchFormStub, a3);
}

- (NSDictionary)queryItemsFromURL
{
  return self->_queryItemsFromURL;
}

- (void)setQueryItemsFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_queryItemsFromURL, a3);
}

- (NSString)shouldMakeVisibleFromURL
{
  return self->_shouldMakeVisibleFromURL;
}

- (void)setShouldMakeVisibleFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_shouldMakeVisibleFromURL, a3);
}

- (NSString)isCaptiveFromURL
{
  return self->_isCaptiveFromURL;
}

- (void)setIsCaptiveFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_isCaptiveFromURL, a3);
}

- (NSString)shouldNotifyOnUploadFromURL
{
  return self->_shouldNotifyOnUploadFromURL;
}

- (void)setShouldNotifyOnUploadFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_shouldNotifyOnUploadFromURL, a3);
}

- (NSNumber)bugformIDFromURL
{
  return self->_bugformIDFromURL;
}

- (void)setBugformIDFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_bugformIDFromURL, a3);
}

- (NSDictionary)questionAnswerPairsFromURL
{
  return self->_questionAnswerPairsFromURL;
}

- (void)setQuestionAnswerPairsFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_questionAnswerPairsFromURL, a3);
}

- (NSDictionary)questionAnswersPairsFromURLV2
{
  return self->_questionAnswersPairsFromURLV2;
}

- (void)setQuestionAnswersPairsFromURLV2:(id)a3
{
  objc_storeStrong((id *)&self->_questionAnswersPairsFromURLV2, a3);
}

- (FBKSCustomBehavior)customBehavior
{
  return self->_customBehavior;
}

- (void)setCustomBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_customBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBehavior, 0);
  objc_storeStrong((id *)&self->_questionAnswersPairsFromURLV2, 0);
  objc_storeStrong((id *)&self->_questionAnswerPairsFromURL, 0);
  objc_storeStrong((id *)&self->_bugformIDFromURL, 0);
  objc_storeStrong((id *)&self->_shouldNotifyOnUploadFromURL, 0);
  objc_storeStrong((id *)&self->_isCaptiveFromURL, 0);
  objc_storeStrong((id *)&self->_shouldMakeVisibleFromURL, 0);
  objc_storeStrong((id *)&self->_queryItemsFromURL, 0);
  objc_storeStrong((id *)&self->_teamForExactMatchFormStub, 0);
  objc_storeStrong((id *)&self->_exactMatchFormStub, 0);
  objc_storeStrong((id *)&self->_formIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationToken, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_ffuID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_loginToken, 0);
}

- (void)initWithURL:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "No configuration token found. Will not login", v1, 2u);
}

- (void)initWithURL:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Action [%@] in URL not supported", (uint8_t *)&v3, 0xCu);
}

@end
