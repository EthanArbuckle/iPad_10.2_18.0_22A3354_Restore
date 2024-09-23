@implementation FBKSeedPortalAPI

- (FBKSeedPortalAPI)initWithEnvironment:(signed __int16)a3 client:(id)a4
{
  uint64_t v5;
  id v7;
  id *v8;
  FBKSeedPortalAPI *v9;
  uint64_t v10;
  NSMutableArray *deletedResponseIDs;
  objc_super v13;

  v5 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FBKSeedPortalAPI;
  v8 = -[FBKSSeedPortalAPI initClient:](&v13, sel_initClient_, v7);
  v9 = (FBKSeedPortalAPI *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 6, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    deletedResponseIDs = v9->_deletedResponseIDs;
    v9->_deletedResponseIDs = (NSMutableArray *)v10;

    -[FBKSSeedPortalAPI setEnvironment:](v9, "setEnvironment:", v5);
  }

  return v9;
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD15B0], "sharedHTTPCookieStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKSharedConstants portalURL](FBKSharedConstants, "portalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cookiesForURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  -[FBKSeedPortalAPI setLoggedInUser:](self, "setLoggedInUser:", 0);
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __44__FBKSeedPortalAPI_didLogOutWithCompletion___block_invoke;
  v15[3] = &unk_24E156F80;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v13, "didLogOutWithCompletion:", v15);

}

void __44__FBKSeedPortalAPI_didLogOutWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[FBKLog net](FBKLog, "net");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[FBKSeedPortalAPI didLogInWithLoginUserInfo:completion:].cold.1();

  }
  objc_initWeak(&location, self);
  -[FBKSeedPortalAPI managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke;
  v13[3] = &unk_24E157510;
  objc_copyWeak(&v16, &location);
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "performBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKUser entityName](FBKUser, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "participantID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findFeedbackObjectWithEntityName:remoteID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "setLoggedInUser:", v7);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "loggedInUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[FBKLog net](FBKLog, "net");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_cold_1();

  }
  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "foregroundClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_16;
  v15[3] = &unk_24E156F80;
  v14 = a1[4];
  v16 = a1[5];
  objc_msgSend(v13, "didLogInWithLoginUserInfo:completion:", v14, v15);

}

void __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_16(uint64_t a1)
{
  dispatch_async(MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

- (id)loginWithDSURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("login/with_ds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)loginWithConfigURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("login/with_config"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)registerAPNSTokenURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("notify/register"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unregisterAPNSTokenURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("notify/unregister"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bugFormURLForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("forms/%@.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bugFormURLForID:(id)a3 requestPlugIns:(id)a4 appToken:(id)a5
{
  id v8;
  id v9;
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
  NSObject *v20;
  void *v21;
  id v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[FBKSeedPortalAPI bugFormURLForID:](self, "bugFormURLForID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v10, 0);
    v13 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v12, "queryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("app_token"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

    if (v8 && objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("plugform_ids"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v18);

    }
    objc_msgSend(v12, "setQueryItems:", v15);
    objc_msgSend(v12, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    Log_1();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "absoluteURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v21;
      _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_DEFAULT, "Using App Token to load Form in: [%@]", (uint8_t *)&v24, 0xCu);

    }
    v22 = v19;

  }
  else
  {
    v22 = v10;
  }

  return v22;
}

- (id)formResponseURLForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("form_responses/%@.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createResponseURLForBugFormID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("forms/%@/form_responses/start.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createResponseURLForBugFormID:(id)a3 appToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[FBKSeedPortalAPI createResponseURLForBugFormID:](self, "createResponseURLForBugFormID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v7, 0);
    v10 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v9, "queryItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("app_token"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    objc_msgSend(v9, "setQueryItems:", v12);
    objc_msgSend(v9, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    Log_1();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "absoluteURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v16;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_DEFAULT, "Using App Token to start FormResponse in: [%@]", (uint8_t *)&v19, 0xCu);

    }
    v17 = v14;

  }
  else
  {
    v17 = v7;
  }

  return v17;
}

- (id)formResponsePutAnswersURLForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("form_responses/%@/answers.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)updateAnswerURLForQuestionID:(id)a3 answerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("questions/%@/answers/%@.json"), v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)formResponseUpdateURLForID:(id)a3 bugFormID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("forms/%@/form_responses/%@.json"), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)announcementURLForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("announcements/%@.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)announcementAcknowledgementURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("acknowledgements.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)unsolicitedFollowupResponseURLForFeedbackID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/feedback_followups/add_unsolicited.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)enhancedLoggingFollowupResponseURLForFeedbackID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/feedback_followups/add_enhanced_logging.json"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)deleteFollowupURLForFollowupID:(id)a3 feedbackID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/feedback_followups/%@.json"), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createFollowupResponseURLForFeedbackID:(id)a3 followupID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/feedback_followups/%@.json"), v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)generateDeviceTokenForRemoteURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("/device_token/generate.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)heartbeatURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("application_versions/alive.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)loginWithAuthKitURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("login/with_authkit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)loginWithAppleConnectURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("login/with_ac"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentItemsURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__FBKSeedPortalAPI_contentItemsURL__block_invoke;
  block[3] = &unk_24E156D78;
  block[4] = self;
  if (contentItemsURL_onceToken != -1)
    dispatch_once(&contentItemsURL_onceToken, block);
  return (id)contentItemsURL_url;
}

void __35__FBKSeedPortalAPI_contentItemsURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "feedbackURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("content_items.json"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)contentItemsURL_url;
  contentItemsURL_url = v3;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", contentItemsURL_url, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(*(id *)(a1 + 32), "_filterForValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("filter_for"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v9);

  objc_msgSend(v5, "URL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)contentItemsURL_url;
  contentItemsURL_url = v10;

}

- (id)formResponseStubURLForID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("form_response_details/%@.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)feedbackStatusURLForFeedbackID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/status.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)feedbackFollowupURLForID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("feedback_followup/%@.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)feedbackDetailsURLForFormResponseID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("feedback_details/form_response/%@.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)feedbackDetailsURLForFeedbackID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("feedback_details/feedback/%@.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)feedbackDetailsURLForFollowupID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("feedback_details/feedback_followup/%@.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)feedbackDetailsURLForSurveyFeedbackID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("feedback_details/survey_feedback/%@.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)closeFeedbackURLForID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/close.json"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)filePromiseDownloadURLForUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file_promise/%@/download"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pendingConsentURL
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("pending-consents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filePromiseDeleteURLForUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("file_promise/%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSSeedPortalAPI feedbackURL](self, "feedbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)seedPortalLoginWithAuthKitSession:(id)a3 device:(id)a4 authenticationResults:(id)a5 success:(id)a6 error:(id)a7
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;

  v12 = *MEMORY[0x24BE0AB98];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v15, "objectForKeyedSubscript:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("com.apple.gs.beta.auth"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  Log_1();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:].cold.3();

  Log_1();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:].cold.2();

  Log_1();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:].cold.1();

  -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:idmsToken:alternateDSID:success:error:](self, "seedPortalLoginWithAuthKitSession:device:idmsToken:alternateDSID:success:error:", v17, v16, v19, v20, v14, v13);
}

- (void)seedPortalLoginWithAuthKitSession:(id)a3 device:(id)a4 idmsToken:(id)a5 alternateDSID:(id)a6 success:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)MEMORY[0x24BDD16B0];
  -[FBKSeedPortalAPI loginWithAuthKitURL](self, "loginWithAuthKitURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "requestWithURL:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setHTTPMethod:", CFSTR("POST"));
  v23 = v16;
  if (v23)
  {
    v31 = v14;
    objc_msgSend(v14, "appleIDHeadersForRequest:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", CFSTR("application/json"), CFSTR("Content-Type"));
    objc_msgSend(v15, "uniqueDeviceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v26, CFSTR("X-Mme-Device-Id"));

    objc_msgSend(v15, "serverFriendlyDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setValue:forKey:", v27, CFSTR("X-Mme-Client-Info"));

    objc_msgSend(v25, "setValue:forKey:", v17, CFSTR("X-Mme-ADSID"));
    objc_msgSend(v25, "setValue:forKey:", v23, CFSTR("X-Apple-GS-Token"));
    Log_1();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v25;
      _os_log_impl(&dword_21D9A9000, v28, OS_LOG_TYPE_INFO, "AuthKit headers: %@", buf, 0xCu);
    }

    objc_msgSend(v22, "setAllHTTPHeaderFields:", v25);
    -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __99__FBKSeedPortalAPI_seedPortalLoginWithAuthKitSession_device_idmsToken_alternateDSID_success_error___block_invoke;
    v32[3] = &unk_24E157538;
    v33 = v18;
    v34 = v19;
    objc_msgSend(v29, "jsonForURLRequest:success:error:", v22, v32, v34);

    v14 = v31;
    goto LABEL_9;
  }
  Log_1();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[FBKSeedPortalAPI seedPortalLoginWithAuthKitSession:device:idmsToken:alternateDSID:success:error:].cold.1();

  if (v19)
  {
    FBKErrorOfType(16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v19 + 2))(v19, v24);
LABEL_9:

  }
}

void __99__FBKSeedPortalAPI_seedPortalLoginWithAuthKitSession_device_idmsToken_alternateDSID_success_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BE31388];
  v4 = a2;
  v9 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  objc_msgSend(v9, "deviceToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], 10, MEMORY[0x24BDBD1B8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
  }

}

- (id)appleConnectEnvironment
{
  if (+[FBKSharedConstants isProductionEnvironment](FBKSharedConstants, "isProductionEnvironment"))
    return CFSTR("acack");
  else
    return CFSTR("acack-uat");
}

- (void)seedPortalLoginWithAppleConnectSession:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD16B0];
  v11 = a3;
  -[FBKSeedPortalAPI loginWithAppleConnectURL](self, "loginWithAppleConnectURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI appleConnectEnvironment](self, "appleConnectEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x24BDD0D98]);

  objc_msgSend(v14, "setObject:forKey:", v11, *MEMORY[0x24BDD0DB0]);
  objc_msgSend(v14, "setObject:forKey:", CFSTR("/"), *MEMORY[0x24BDD0DA0]);
  objc_msgSend(v14, "setObject:forKey:", CFSTR(".apple.com"), *MEMORY[0x24BDD0D80]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateByAddingTimeInterval:", 28800.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKey:", v17, *MEMORY[0x24BDD0D88]);
  objc_msgSend(v14, "setObject:forKey:", CFSTR("TRUE"), *MEMORY[0x24BDD0DA8]);
  objc_msgSend(v14, "setObject:forKey:", CFSTR("TRUE"), *MEMORY[0x24BDD0D78]);
  objc_msgSend(MEMORY[0x24BDD15A8], "cookieWithProperties:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15A8], "requestHeaderFieldsWithCookies:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  Log_1();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[FBKSeedPortalAPI seedPortalLoginWithAppleConnectSession:success:error:].cold.1();

  objc_msgSend(v13, "setAllHTTPHeaderFields:", v20);
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __73__FBKSeedPortalAPI_seedPortalLoginWithAppleConnectSession_success_error___block_invoke;
  v25[3] = &unk_24E157538;
  v26 = v8;
  v27 = v9;
  v23 = v9;
  v24 = v8;
  objc_msgSend(v22, "jsonForURLRequest:success:error:", v13, v25, v23);

}

void __73__FBKSeedPortalAPI_seedPortalLoginWithAppleConnectSession_success_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BE31388];
  v4 = a2;
  v9 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  objc_msgSend(v9, "setIsAppleConnectLogin:", 1);
  objc_msgSend(v9, "deviceToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], 10, MEMORY[0x24BDBD1B8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
  }

}

- (void)seedPortalLoginAsAnonymousUserWithConfigurationToken:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(id, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, id);
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDD16B0];
  v11 = (void (**)(id, id))a5;
  -[FBKSeedPortalAPI loginWithConfigURL](self, "loginWithConfigURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v22 = CFSTR("config");
  v23[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v14, 0, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (v16)
  {
    Log_1();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FBKSeedPortalAPI seedPortalLoginAsAnonymousUserWithConfigurationToken:success:error:].cold.1();

    v11[2](v11, v16);
  }
  else
  {
    objc_msgSend(v13, "setHTTPBody:", v15);
    objc_msgSend(v13, "setHTTPContentType:", CFSTR("application/json; charset=utf-8"));
    -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __87__FBKSeedPortalAPI_seedPortalLoginAsAnonymousUserWithConfigurationToken_success_error___block_invoke;
    v19[3] = &unk_24E157560;
    v20 = (void (**)(id, id))v9;
    objc_msgSend(v18, "jsonForURLRequest:success:error:", v13, v19, v11);

    v11 = v20;
  }

}

void __87__FBKSeedPortalAPI_seedPortalLoginAsAnonymousUserWithConfigurationToken_success_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BE31388];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerAPNSWithRequestDictionary:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI registerAPNSTokenURL](self, "registerAPNSTokenURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "putToURL:parameters:encoding:success:error:", v11, v10, 2, v9, v8);

}

- (void)deregisterAPNSWithDeviceToken:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKSeedPortalAPI unregisterAPNSTokenURL](self, "unregisterAPNSTokenURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("deviceToken");
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "deleteAtURL:parameters:encoding:success:error:", v12, v13, 2, v9, v8);
  }
}

- (void)updateFormItemsForUser:(id)a3 inTeam:(id)a4 formTat:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  FBKSeedPortalAPI *v36;
  id v37;
  id v38;
  BOOL v39;
  id location[2];

  v27 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "teamType"))
  {
    objc_msgSend(v10, "ID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKSeedPortalAPI formItemsURLForTeamID:formTat:](self, "formItemsURLForTeamID:formTat:", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKSSeedPortalAPI formItemsURLFormTat:](self, "formItemsURLFormTat:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v14;
  objc_initWeak(location, self);
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11 != 0;
  v19 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke;
  v31[3] = &unk_24E1575B0;
  v20 = v11;
  v32 = v20;
  objc_copyWeak(&v38, location);
  v21 = v12;
  v37 = v21;
  v39 = v18;
  v22 = v27;
  v33 = v22;
  v23 = v10;
  v34 = v23;
  v24 = v16;
  v35 = v24;
  v36 = self;
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_130;
  v28[3] = &unk_24E1575D8;
  objc_copyWeak(&v30, location);
  v25 = v21;
  v29 = v25;
  objc_msgSend(v17, "jsonForURL:success:error:", v24, v31, v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v38);

  objc_destroyWeak(location);
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  char v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  char v20;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (!*(_QWORD *)(a1 + 32))
    {
      v5 = 0;
      goto LABEL_5;
    }
  }
  objc_opt_class();
  v5 = objc_opt_isKindOfClass();
LABEL_5:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v7 = WeakRetained;
  if ((isKindOfClass & 1) != 0 || (v5 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_127;
    v12[3] = &unk_24E157588;
    v13 = v3;
    objc_copyWeak(&v19, (id *)(a1 + 80));
    v18 = *(id *)(a1 + 72);
    v20 = *(_BYTE *)(a1 + 88);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    v16 = v10;
    v17 = v11;
    objc_msgSend(v9, "performBlock:", v12);

    objc_destroyWeak(&v19);
    v8 = v13;
  }
  else
  {
    objc_msgSend(WeakRetained, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", 0, -1001, *(_QWORD *)(a1 + 72));

    Log_1();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_cold_1();
  }

}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_127(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = *(id *)(a1 + 32);
  }
  v3 = v2;
  +[FBKManagedLocalIDObject transformJSONArrayIntoLocalIDJSON:uniquingPrefix:](FBKBugFormStub, "transformJSONArrayIntoLocalIDJSON:uniquingPrefix:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKBugFormStub, "importFromJSONArray:intoContext:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[FBKSharedConstants isFormItemsDisabled](FBKSharedConstants, "isFormItemsDisabled"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (v7)
  {
    if (*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(v7, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWasFetchedByTat:", 1);

    }
    objc_msgSend(*(id *)(a1 + 40), "bugFormStubs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 40);
    if (v10)
    {
      objc_msgSend(v11, "bugFormStubs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setByAddingObjectsFromSet:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setBugFormStubs:", v13);

    }
    else
    {
      objc_msgSend(v11, "setBugFormStubs:", v7);
    }
    v16 = *(void **)(a1 + 48);
    if (*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(v16, "forms");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setByAddingObjectsFromSet:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setForms:", v18);

    }
    else
    {
      objc_msgSend(v16, "setForms:", v7);
    }
    objc_msgSend(*(id *)(a1 + 48), "setDidFetchFormItems:", 1);
    v19 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v19, "managedObjectContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "saveChangesIntoContext:URLUsed:", v20, *(_QWORD *)(a1 + 56));
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      Log_1();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_127_cold_2();

      v23 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v23, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v21, -1003, *(_QWORD *)(a1 + 72));

      goto LABEL_24;
    }
    v24 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v24, "_managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v25, "save:", &v48);
    v21 = v48;

    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 64), "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v21, -1003, *(_QWORD *)(a1 + 72));
LABEL_24:

      goto LABEL_25;
    }
    v42 = v4;
    v43 = v3;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v26 = v7;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v32 = objc_loadWeakRetained((id *)(a1 + 80));
          objc_msgSend(v32, "managedObjectContext");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "refreshObject:mergeChanges:", v31, 1);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v28);
    }

    v34 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v34, "managedObjectContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "refreshObject:mergeChanges:", *(_QWORD *)(a1 + 40), 1);

    v36 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v36, "managedObjectContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "saveChangesIntoContext:URLUsed:", v37, *(_QWORD *)(a1 + 56));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      Log_1();
      v39 = objc_claimAutoreleasedReturnValue();
      v4 = v42;
      v3 = v43;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_127_cold_2();

      v40 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v40, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v38, -1003, *(_QWORD *)(a1 + 72));

    }
    else
    {
      v41 = *(_QWORD *)(a1 + 72);
      v4 = v42;
      v3 = v43;
      if (v41)
        (*(void (**)(uint64_t, id, _QWORD))(v41 + 16))(v41, v26, 0);
    }
  }
  else
  {
    Log_1();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_127_cold_1();

    v15 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v15, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", 0, -1002, *(_QWORD *)(a1 + 72));

  }
LABEL_25:

}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_130(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v4, -1004, *(_QWORD *)(a1 + 32));

}

- (void)updateContentItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FBKSeedPortalAPI loggedInUser](self, "loggedInUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[FBKSeedPortalAPI updateContentItemsForTeam:withCompletion:](self, "updateContentItemsForTeam:withCompletion:", v7, v4);
}

- (void)updateContentItemsForTeam:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  FBKSeedPortalAPI *val;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29 = a4;
  val = self;
  if (objc_msgSend(v6, "teamType"))
  {
    objc_msgSend(v6, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKSeedPortalAPI contentItemsURLForTeamID:](self, "contentItemsURLForTeamID:", v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKSeedPortalAPI contentItemsURL](self, "contentItemsURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[FBKTargetedSurvey inboxTargetedSurveysWithTeamType:](_TtC12FeedbackCore17FBKTargetedSurvey, "inboxTargetedSurveysWithTeamType:", objc_msgSend(v6, "teamType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v30, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v28, "queryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v12 = v31;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v12);
          v16 = (void *)MEMORY[0x24BDD1838];
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "queryItemWithName:value:", CFSTR("tats[]"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "addObject:", v18);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v13);
    }

    objc_msgSend(v28, "setQueryItems:", v11);
    objc_msgSend(v28, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    Log_1();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[FBKSeedPortalAPI updateContentItemsForTeam:withCompletion:].cold.1();

  }
  else
  {
    v19 = v30;
  }
  objc_msgSend(v6, "ID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, val);
  -[FBKSeedPortalAPI foregroundClient](val, "foregroundClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke;
  v36[3] = &unk_24E157650;
  objc_copyWeak(&v41, &location);
  v40 = v29;
  v24 = v21;
  v37 = v24;
  v25 = v6;
  v38 = v25;
  v26 = v19;
  v39 = v26;
  v33[0] = v23;
  v33[1] = 3221225472;
  v33[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_149;
  v33[3] = &unk_24E157678;
  v27 = v40;
  v34 = v27;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v22, "jsonForURL:success:error:", v26, v36, v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2;
  v7[3] = &unk_24E157628;
  v6 = v3;
  v8 = v6;
  objc_copyWeak(&v13, a1 + 8);
  v12 = a1[7];
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v13);
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint8_t v69[128];
  uint8_t buf[4];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("items"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id *)(a1 + 72);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "insertContentItemsFromJsonData:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v6, "setMinute:", -1);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v10, "loggedInUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_3;
    v65[3] = &unk_24E157600;
    v57 = v9;
    v66 = v57;
    v13 = v5;
    v67 = v13;
    v68 = *(id *)(a1 + 40);
    objc_msgSend(v12, "ded_selectItemsPassingTest:", v65);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v13;
    objc_msgSend(*(id *)(a1 + 48), "setContentItems:", v13);
    if (objc_msgSend(v14, "count"))
    {
      Log_1();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "valueForKeyPath:", CFSTR("ID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v71 = (uint64_t)v19;
        _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "Update items while drafting. Found draft content items that we need to keep [%{public}@]", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 48), "addContentItems:", v14);
    }
    v58 = v14;
    v20 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v20, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v22, "loggedInUser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "refreshObject:mergeChanges:", v23, 1);

    v24 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v24, "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "saveChangesIntoContext:URLUsed:", v25, *(_QWORD *)(a1 + 56));
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      Log_1();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_3();

      v28 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v28, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v26, -1003, *(_QWORD *)(a1 + 64));
      v29 = v57;
    }
    else
    {
      +[FBKContentItem fetchRequest](FBKContentItem, "fetchRequest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("teams.@count == 0"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPredicate:", v30);

      v31 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v31, "managedObjectContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0;
      objc_msgSend(v32, "executeFetchRequest:error:", v28, &v64);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v64;

      if (v26)
      {
        Log_1();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_2();

        v35 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v35, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v26, -1003, *(_QWORD *)(a1 + 64));

        v29 = v57;
      }
      else
      {
        v52 = v28;
        v53 = v15;
        v55 = v2;
        v56 = a1;
        v54 = v6;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v36 = v33;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v61 != v39)
                objc_enumerationMutation(v36);
              v41 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              Log_1();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v41, "ID");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v43, "unsignedLongValue");
                *(_DWORD *)buf = 134217984;
                v71 = v44;
                _os_log_impl(&dword_21D9A9000, v42, OS_LOG_TYPE_INFO, "Purging old item %lu", buf, 0xCu);

              }
              v45 = objc_loadWeakRetained(v3);
              objc_msgSend(v45, "managedObjectContext");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "deleteObject:", v41);

            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          }
          while (v38);
        }

        v47 = objc_loadWeakRetained(v3);
        objc_msgSend(v47, "managedObjectContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "saveChangesIntoContext:URLUsed:", v48, *(_QWORD *)(v56 + 56));
        v26 = (id)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          Log_1();
          v49 = objc_claimAutoreleasedReturnValue();
          v6 = v54;
          v2 = v55;
          v15 = v53;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_1();

          v50 = objc_loadWeakRetained(v3);
          objc_msgSend(v50, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v26, -1003, *(_QWORD *)(v56 + 64));

        }
        else
        {
          v51 = *(_QWORD *)(v56 + 64);
          v6 = v54;
          v2 = v55;
          v15 = v53;
          if (v51)
            (*(void (**)(uint64_t, void *, _QWORD))(v51 + 16))(v51, v53, 0);
          v26 = 0;
        }
        v29 = v57;
        v28 = v52;
      }

    }
  }
  else
  {
    v59 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v59, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", 0, -1001, *(_QWORD *)(a1 + 64));

  }
}

uint64_t __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "createdAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEarlierThan:", v5)
    && objc_msgSend(v3, "itemType") == 1
    && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(v3, "teams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("ID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    Log_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_149_cold_1();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v3, -1004, *(_QWORD *)(a1 + 32));

  }
}

- (id)insertContentItemsFromJsonData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKSeedPortalAPI managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKContentItem, "importFromJSONArray:intoContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKSeedPortalAPI loggedInUser](self, "loggedInUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setUser:", v7, (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v8;
}

- (void)_reportUnderlyingError:(id)a3 withFBKErrorCode:(int64_t)a4 withCompletion:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = (void (**)(id, _QWORD, void *))a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNEXPECTED_SERVER_DATA_ERROR"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FC8]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UNEXPECTED_SERVER_DATA_ERROR_RECOVERY"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD0FF0]);

  if (v14)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], a4, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, 0, v13);

}

- (void)fetchBugFormWithID:(id)a3 forTeamID:(id)a4 success:(id)a5 error:(id)a6
{
  -[FBKSeedPortalAPI fetchBugFormWithID:forTeamID:requestPlugIns:appToken:success:error:](self, "fetchBugFormWithID:forTeamID:requestPlugIns:appToken:success:error:", a3, a4, 0, 0, a5, a6);
}

- (void)fetchBugFormWithID:(id)a3 forTeamID:(id)a4 requestPlugIns:(id)a5 appToken:(id)a6 success:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v15)
    -[FBKSeedPortalAPI bugFormURLForID:teamID:](self, "bugFormURLForID:teamID:", v14, v15);
  else
    -[FBKSeedPortalAPI bugFormURLForID:requestPlugIns:appToken:](self, "bugFormURLForID:requestPlugIns:appToken:", v14, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[FBKSeedPortalAPI managedObjectContext](self, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke;
  v26[3] = &unk_24E1576F0;
  objc_copyWeak(&v31, &location);
  v22 = v14;
  v27 = v22;
  v23 = v20;
  v28 = v23;
  v24 = v18;
  v29 = v24;
  v25 = v19;
  v30 = v25;
  objc_msgSend(v21, "performBlock:", v26);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 8;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKBugForm entityName](FBKBugForm, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findFeedbackObjectWithEntityName:remoteID:", v5, a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    Log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(a1[4], "intValue");
      *(_DWORD *)buf = 67109120;
      v20 = v8;
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "Deleting stale form [%i]", buf, 8u);
    }

    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteObject:", v6);

  }
  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "foregroundClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a1[5];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_159;
  v14[3] = &unk_24E1576C8;
  objc_copyWeak(&v18, v2);
  v15 = a1[5];
  v16 = a1[6];
  v17 = a1[7];
  objc_msgSend(v12, "jsonForURL:success:error:", v13, v14, a1[7]);

  objc_destroyWeak(&v18);
}

void __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_159(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_2;
  v7[3] = &unk_24E1576A0;
  v6 = v3;
  v8 = v6;
  objc_copyWeak(&v12, a1 + 7);
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v12);
}

void __87__FBKSeedPortalAPI_fetchBugFormWithID_forTeamID_requestPlugIns_appToken_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKBugForm, "importFromJSONObject:intoContext:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveChangesIntoContext:URLUsed:", v8, *(_QWORD *)(a1 + 40));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_6:
      v10();
    }
  }
  else
  {
    v11 = objc_loadWeakRetained(v3);
    objc_msgSend(v11, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "refreshObject:mergeChanges:", v6, 1);

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      v10 = *(void (**)(void))(v13 + 16);
      goto LABEL_6;
    }
  }

}

- (void)updateFormResponseWithID:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  -[FBKSeedPortalAPI formResponseURLForID:](self, "formResponseURLForID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke;
  v18[3] = &unk_24E157740;
  v18[4] = self;
  v19 = v10;
  v20 = v8;
  v21 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_3;
  v16[3] = &unk_24E157188;
  v17 = v21;
  v13 = v21;
  v14 = v8;
  v15 = v10;
  objc_msgSend(v11, "jsonForURL:success:error:", v15, v18, v16);

}

void __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_2;
  v8[3] = &unk_24E157718;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFormResponse, "importFromJSONObject:intoContext:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveChangesIntoContext:URLUsed:", v6, *(_QWORD *)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_6:
      v8();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "refreshObject:mergeChanges:", v4, 1);

    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
    {
      v8 = *(void (**)(void))(v10 + 16);
      goto LABEL_6;
    }
  }

}

uint64_t __59__FBKSeedPortalAPI_updateFormResponseWithID_success_error___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteFollowupWithID:(id)a3 feedbackID:(id)a4 success:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI deleteFollowupURLForFollowupID:feedbackID:](self, "deleteFollowupURLForFollowupID:feedbackID:", v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __66__FBKSeedPortalAPI_deleteFollowupWithID_feedbackID_success_error___block_invoke;
  v17[3] = &unk_24E157768;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v14, "deleteResourceAtURL:success:error:", v15, v17, v11);

}

uint64_t __66__FBKSeedPortalAPI_deleteFollowupWithID_feedbackID_success_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteFormResponseWithID:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBKSeedPortalAPI deletedResponseIDs](self, "deletedResponseIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  if (v8)
  {
    -[FBKSeedPortalAPI deletedResponseIDs](self, "deletedResponseIDs");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v12, "addObject:", v8);
  }
  else
  {
    Log_1();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FBKSeedPortalAPI deleteFormResponseWithID:success:error:].cold.1();
  }

  objc_sync_exit(v11);
  -[FBKSeedPortalAPI formResponseURLForID:](self, "formResponseURLForID:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__FBKSeedPortalAPI_deleteFormResponseWithID_success_error___block_invoke;
  v16[3] = &unk_24E157790;
  objc_copyWeak(&v19, &location);
  v14 = v10;
  v17 = v14;
  v15 = v9;
  v18 = v15;
  -[FBKSeedPortalAPI envelopedDELETEForURL:success:errorHandler:](self, "envelopedDELETEForURL:success:errorHandler:", v13, v16, v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __59__FBKSeedPortalAPI_deleteFormResponseWithID_success_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "save:", &v7);
  v4 = v7;

  if (v4 && (v5 = *(_QWORD *)(a1 + 32)) != 0)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
  }

}

- (void)createFormResponseForBugForm:(id)a3 inTeam:(id)a4 appToken:(id)a5 success:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  FBKSeedPortalAPI *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v13, "teamType");
  objc_msgSend(v12, "ID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "ID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKSeedPortalAPI createResponseURLForBugFormID:teamID:](self, "createResponseURLForBugFormID:teamID:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FBKSeedPortalAPI createResponseURLForBugFormID:appToken:](self, "createResponseURLForBugFormID:appToken:", v18, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v21 = v12;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke;
  v26[3] = &unk_24E1577E0;
  v27 = v21;
  objc_copyWeak(&v33, &location);
  v28 = self;
  v22 = v16;
  v31 = v22;
  v23 = v27;
  v29 = v23;
  v24 = v20;
  v30 = v24;
  v25 = v15;
  v32 = v25;
  -[FBKSeedPortalAPI envelopedGETForURL:success:errorHandler:](self, "envelopedGETForURL:success:errorHandler:", v24, v26, v22);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2;
  v17[3] = &unk_24E1577B8;
  v13 = v7;
  v14 = *(_QWORD *)(a1 + 40);
  v18 = v13;
  v19 = v14;
  v15 = v8;
  v20 = v15;
  objc_copyWeak(&v26, (id *)(a1 + 80));
  v16 = v10;
  v21 = v16;
  v24 = *(id *)(a1 + 64);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v25 = *(id *)(a1 + 72);
  objc_msgSend(v12, "performBlock:", v17);

  objc_destroyWeak(&v26);
}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id *v30;
  id v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void (*v40)(void);
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFormResponse, "importFromJSONObject:intoContext:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setFormResponse:", v4);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    -[NSObject loggedInUser](WeakRetained, "loggedInUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUser:", v8);

  }
  else
  {
    +[FBKLog net](FBKLog, "net");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_3(v4, WeakRetained);
  }

  objc_msgSend(v4, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKLog model](FBKLog, "model");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9 == v10)
  {
    v46 = v6;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_INFO, "Form response and bug form context match, continuing.", buf, 2u);
    }

    objc_msgSend(v4, "setBugForm:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v4, "setCompleted:", 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCreatedAt:", v14);

    objc_msgSend(v4, "setUploadTask:", 0);
    objc_msgSend(v4, "answers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("questionID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v45 = a1;
    objc_msgSend(*(id *)(a1 + 64), "questionGroups");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    if (v49)
    {
      v48 = *(_QWORD *)v58;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v58 != v48)
            objc_enumerationMutation(obj);
          v50 = v17;
          v18 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v17);
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          objc_msgSend(v18, "questions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v54;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v54 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                objc_msgSend(v24, "ID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "member:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                {
                  objc_msgSend(v4, "answers");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v52[0] = MEMORY[0x24BDAC760];
                  v52[1] = 3221225472;
                  v52[2] = __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_166;
                  v52[3] = &unk_24E156A58;
                  v52[4] = v24;
                  objc_msgSend(v27, "ded_findWithBlock:", v52);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v28, "setQuestion:", v24);
                  if (v28)
                  {
                    objc_msgSend(v24, "addAnswer:", v28);
                  }
                  else
                  {
                    +[FBKLog model](FBKLog, "model");
                    v29 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                      __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_1(buf, v24, &v62, v29);

                  }
                }
                else
                {
                  +[FBKAnswer emptyLocalAnswerForQuestion:inFormResponse:](FBKAnswer, "emptyLocalAnswerForQuestion:inFormResponse:", v24, v4);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setQuestion:", v24);
                }

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
            }
            while (v21);
          }

          v17 = v50 + 1;
        }
        while (v50 + 1 != v49);
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v49);
    }

    v30 = (id *)(a1 + 96);
    v31 = objc_loadWeakRetained((id *)(a1 + 96));
    objc_msgSend(v31, "managedObjectContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hasChanges");

    if (v33)
    {
      v34 = objc_loadWeakRetained(v30);
      objc_msgSend(v34, "managedObjectContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v35, "save:", &v51);
      v36 = v51;

    }
    else
    {
      v36 = 0;
    }
    v37 = *(void **)(a1 + 40);
    objc_msgSend(v37, "managedObjectContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "saveChangesIntoContext:URLUsed:", v38, *(_QWORD *)(v45 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v39 = *(_QWORD *)(v45 + 80);
      v6 = v46;
      if (v39)
      {
        v40 = *(void (**)(void))(v39 + 16);
LABEL_40:
        v40();
      }
    }
    else
    {
      objc_msgSend(*(id *)(v45 + 40), "managedObjectContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_loadWeakRetained(v30);
      objc_msgSend(v42, "loggedInUser");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "refreshObject:mergeChanges:", v43, 1);

      v44 = *(_QWORD *)(v45 + 88);
      v6 = v46;
      if (v44)
      {
        v40 = *(void (**)(void))(v44 + 16);
        goto LABEL_40;
      }
    }

    goto LABEL_42;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_2(v4, (id *)(a1 + 56), v12);

  FBKErrorOfType(-1002);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_42:

}

uint64_t __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_166(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "questionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  return v5;
}

- (void)saveAnswersForFormResponseWithID:(id)a3 answers:(id)a4 success:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  FBKSeedPortalAPI *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[FBKSeedPortalAPI formResponsePutAnswersURLForID:](self, "formResponsePutAnswersURLForID:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  +[FBKLog net](FBKLog, "net");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[FBKSeedPortalAPI saveAnswersForFormResponseWithID:answers:success:error:].cold.1();

  if (v11)
    v16 = v11;
  else
    v16 = (id)MEMORY[0x24BDBD1B8];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke;
  v21[3] = &unk_24E157830;
  objc_copyWeak(&v27, &location);
  v17 = v10;
  v22 = v17;
  v23 = self;
  v18 = v13;
  v25 = v18;
  v19 = v14;
  v24 = v19;
  v20 = v12;
  v26 = v20;
  -[FBKSeedPortalAPI envelopedPUTForURL:parameters:success:errorHandler:](self, "envelopedPUTForURL:parameters:success:errorHandler:", v19, v16, v21, v18);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke_2;
  v15[3] = &unk_24E157808;
  v12 = v7;
  v16 = v12;
  v13 = *(id *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v17 = v13;
  v18 = v14;
  v20 = *(id *)(a1 + 56);
  objc_copyWeak(&v22, (id *)(a1 + 72));
  v19 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 64);
  objc_msgSend(v11, "performBlock:", v15);

  objc_destroyWeak(&v22);
}

void __75__FBKSeedPortalAPI_saveAnswersForFormResponseWithID_answers_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 32) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    FBKErrorOfType(-1001);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);

    goto LABEL_9;
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[FBKAnswer _importByQuestionIDFromJSONArray:withFormResponseID:intoContext:](FBKAnswer, "_importByQuestionIDFromJSONArray:withFormResponseID:intoContext:", v2, v3, v4);

  v6 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveChangesIntoContext:URLUsed:", v7, *(_QWORD *)(a1 + 56));
  v13 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v13;
  if (!v13)
  {
    v12 = *(_QWORD *)(a1 + 72);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v9 = *(_QWORD *)(a1 + 64);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v13);
    v8 = (void *)v13;
  }
LABEL_10:

}

- (void)markCompleteForFormResponseWithID:(id)a3 bugFormID:(id)a4 withFiles:(BOOL)a5 metadata:(id)a6 success:(id)a7 error:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id location;
  const __CFString *v32;
  _QWORD v33[2];

  v11 = a5;
  v33[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v11)
    v19 = &unk_24E18D1F8;
  else
    v19 = &unk_24E18D220;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addEntriesFromDictionary:", v16);
  v32 = CFSTR("form_response");
  v33[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI formResponseUpdateURLForID:bugFormID:](self, "formResponseUpdateURLForID:bugFormID:", v14, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke;
  v26[3] = &unk_24E157880;
  objc_copyWeak(&v30, &location);
  v23 = v14;
  v27 = v23;
  v24 = v22;
  v28 = v24;
  v25 = v17;
  v29 = v25;
  -[FBKSeedPortalAPI envelopedPUTForURL:parameters:success:errorHandler:](self, "envelopedPUTForURL:parameters:success:errorHandler:", v24, v21, v26, v18);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

void __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2;
  v13[3] = &unk_24E157858;
  objc_copyWeak(&v18, a1 + 7);
  v14 = a1[4];
  v12 = v8;
  v15 = v12;
  v16 = a1[5];
  v17 = a1[6];
  objc_msgSend(v11, "performBlock:", v13);

  objc_destroyWeak(&v18);
}

void __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKFormResponse entityName](FBKFormResponse, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findFeedbackObjectWithEntityName:remoteID:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setFormResponse:", v6);
  }
  else
  {
    +[FBKLog net](FBKLog, "net");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2_cold_1((id *)(a1 + 32), v8, v9);

  }
  objc_msgSend(v6, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bugForm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "refreshObject:mergeChanges:", v11, 1);

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "saveChangesIntoContext:URLUsed:", v13, *(_QWORD *)(a1 + 48));

  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(void))(v15 + 16))();

}

- (void)getFormResponseStubWithID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI formResponseStubURLForID:](self, "formResponseStubURLForID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke;
  v16[3] = &unk_24E1578D0;
  objc_copyWeak(&v20, &location);
  v11 = v6;
  v17 = v11;
  v19 = v7;
  v12 = v8;
  v18 = v12;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_179;
  v14[3] = &unk_24E157188;
  v13 = v19;
  v15 = v13;
  objc_msgSend(v9, "jsonForURL:success:error:", v12, v16, v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_2;
  v7[3] = &unk_24E1578A8;
  objc_copyWeak(&v12, a1 + 7);
  v8 = a1[4];
  v11 = a1[6];
  v6 = v3;
  v9 = v6;
  v10 = a1[5];
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v12);
}

void __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "deletedResponseIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v4);
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "deletedResponseIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    Log_1();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
      v20 = 134217984;
      v21 = v9;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Fetched FormResponseStub [%lu] has been deleted. Will not insert", (uint8_t *)&v20, 0xCu);
    }

    FBKErrorOfType(-1010);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(v4);

  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v10);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFormResponseStub, "importFromJSONObject:intoContext:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_loadWeakRetained(v2);
    objc_msgSend(v16, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v16, "saveChangesIntoContext:URLUsed:", v17, *(_QWORD *)(a1 + 48));

    v19 = *(_QWORD *)(a1 + 56);
    if (v19)
      (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v15, 0);

  }
}

uint64_t __61__FBKSeedPortalAPI_getFormResponseStubWithID_withCompletion___block_invoke_179(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)getFeedbackStatusForFeedbackID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI feedbackStatusURLForFeedbackID:](self, "feedbackStatusURLForFeedbackID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke;
  v15[3] = &unk_24E157920;
  objc_copyWeak(&v18, &location);
  v17 = v7;
  v11 = v8;
  v16 = v11;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_3;
  v13[3] = &unk_24E157188;
  v12 = v17;
  v14 = v12;
  objc_msgSend(v9, "jsonForURL:success:error:", v11, v15, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_2;
  v7[3] = &unk_24E1578F8;
  v6 = v3;
  v8 = v6;
  objc_copyWeak(&v11, a1 + 6);
  v10 = a1[5];
  v9 = a1[4];
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v11);
}

void __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFeedbackStatus, "importFromJSONObject:intoContext:", v2, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "saveChangesIntoContext:URLUsed:", v6, *(_QWORD *)(a1 + 40));

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v9, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", 0, -1001, *(_QWORD *)(a1 + 48));
  }

}

uint64_t __62__FBKSeedPortalAPI_getFeedbackStatusForFeedbackID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)createFollowupWithType:(unint64_t)a3 forFeedbackWithID:(id)a4 success:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (a3 == 7)
  {
    -[FBKSeedPortalAPI enhancedLoggingFollowupResponseURLForFeedbackID:](self, "enhancedLoggingFollowupResponseURLForFeedbackID:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Wrong Feedback Followup Type"), CFSTR("%s received invalid type %lu"), "-[FBKSeedPortalAPI createFollowupWithType:forFeedbackWithID:success:error:]", a3);
      v14 = 0;
      goto LABEL_7;
    }
    -[FBKSeedPortalAPI unsolicitedFollowupResponseURLForFeedbackID:](self, "unsolicitedFollowupResponseURLForFeedbackID:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_7:
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke;
  v22[3] = &unk_24E157948;
  v22[4] = self;
  v23 = v14;
  v24 = v11;
  v25 = v12;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_3;
  v20[3] = &unk_24E157188;
  v21 = v25;
  v17 = v25;
  v18 = v11;
  v19 = v14;
  objc_msgSend(v15, "postToURL:parameters:encoding:success:error:", v19, MEMORY[0x24BDBD1B8], 2, v22, v20);

}

void __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_2;
  v8[3] = &unk_24E157718;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 0, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFeedbackFollowup, "importFromJSONObject:intoContext:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "saveChangesIntoContext:URLUsed:", v8, *(_QWORD *)(a1 + 48));

  if (v4)
  {
    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_9:
      v11();
    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_9;
    }
  }

}

uint64_t __75__FBKSeedPortalAPI_createFollowupWithType_forFeedbackWithID_success_error___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendFollowupResponseWithData:(id)a3 forFollowupID:(id)a4 feedbackID:(id)a5 success:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v12 = a6;
  v13 = a7;
  v14 = a3;
  -[FBKSeedPortalAPI createFollowupResponseURLForFeedbackID:followupID:](self, "createFollowupResponseURLForFeedbackID:followupID:", a5, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke;
  v19[3] = &unk_24E157970;
  v19[4] = self;
  v20 = v15;
  v21 = v12;
  v22 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v15;
  -[FBKSeedPortalAPI envelopedPUTForURL:parameters:success:errorHandler:](self, "envelopedPUTForURL:parameters:success:errorHandler:", v18, v14, v19, v16);

}

void __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke_2;
  v8[3] = &unk_24E157718;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __88__FBKSeedPortalAPI_sendFollowupResponseWithData_forFollowupID_feedbackID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFeedbackFollowup, "importFromJSONObject:intoContext:", v2, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "saveChangesIntoContext:URLUsed:", v5, *(_QWORD *)(a1 + 48));

  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (void)getFeedbackFollowupWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI feedbackFollowupURLForID:](self, "feedbackFollowupURLForID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke;
  v15[3] = &unk_24E1579C0;
  objc_copyWeak(&v18, &location);
  v11 = v8;
  v16 = v11;
  v17 = v7;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_3;
  v13[3] = &unk_24E157188;
  v12 = v17;
  v14 = v12;
  objc_msgSend(v9, "jsonForURL:success:error:", v11, v15, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_2;
  v7[3] = &unk_24E157998;
  v6 = v3;
  v8 = v6;
  objc_copyWeak(&v11, a1 + 6);
  v9 = a1[4];
  v10 = a1[5];
  objc_msgSend(v5, "performBlock:", v7);

  objc_destroyWeak(&v11);
}

void __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFeedbackFollowup, "importFromJSONObject:intoContext:", v2, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "saveChangesIntoContext:URLUsed:", v7, *(_QWORD *)(a1 + 40));

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v10, 0);

}

uint64_t __57__FBKSeedPortalAPI_getFeedbackFollowupWithID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)closeFeedbackItemWithID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI closeFeedbackURLForID:](self, "closeFeedbackURLForID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke;
  v14[3] = &unk_24E1579E8;
  objc_copyWeak(&v17, &location);
  v10 = v8;
  v15 = v10;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke_2;
  v12[3] = &unk_24E157188;
  v11 = v16;
  v13 = v11;
  -[FBKSeedPortalAPI envelopedPUTForURL:parameters:success:errorHandler:](self, "envelopedPUTForURL:parameters:success:errorHandler:", v10, MEMORY[0x24BDBD1B8], v14, v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveChangesIntoContext:URLUsed:", v3, *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

uint64_t __59__FBKSeedPortalAPI_closeFeedbackItemWithID_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)feedbackForFormResponseID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[FBKSeedPortalAPI feedbackDetailsURLForFormResponseID:](self, "feedbackDetailsURLForFormResponseID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI feedbackFromURL:completion:](self, "feedbackFromURL:completion:", v7, v6);

}

- (void)feedbackForFeedbackID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[FBKSeedPortalAPI feedbackDetailsURLForFeedbackID:](self, "feedbackDetailsURLForFeedbackID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI feedbackFromURL:completion:](self, "feedbackFromURL:completion:", v7, v6);

}

- (void)feedbackForFollowupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[FBKSeedPortalAPI feedbackDetailsURLForFollowupID:](self, "feedbackDetailsURLForFollowupID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI feedbackFromURL:completion:](self, "feedbackFromURL:completion:", v7, v6);

}

- (void)feedbackForSurveyFeedbackID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[FBKSeedPortalAPI feedbackDetailsURLForSurveyFeedbackID:](self, "feedbackDetailsURLForSurveyFeedbackID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI feedbackFromURL:completion:](self, "feedbackFromURL:completion:", v7, v6);

}

- (void)feedbackFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke;
  v13[3] = &unk_24E1579E8;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_3;
  v11[3] = &unk_24E157188;
  v10 = v15;
  v12 = v10;
  -[FBKSeedPortalAPI envelopedGETForURL:success:errorHandler:](self, "envelopedGETForURL:success:errorHandler:", v9, v13, v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_2;
  v13[3] = &unk_24E157998;
  v12 = v7;
  v14 = v12;
  objc_copyWeak(&v17, a1 + 6);
  v15 = a1[4];
  v16 = a1[5];
  objc_msgSend(v11, "performBlock:", v13);

  objc_destroyWeak(&v17);
}

void __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKFeedback, "importFromJSONObject:intoContext:", v2, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "saveChangesIntoContext:URLUsed:", v7, *(_QWORD *)(a1 + 40));

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v10, 0);

}

uint64_t __47__FBKSeedPortalAPI_feedbackFromURL_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchAnnouncementForContentItem:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  -[FBKSeedPortalAPI managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke;
  v26[3] = &unk_24E157A10;
  v28 = &v29;
  v10 = v6;
  v27 = v10;
  objc_msgSend(v8, "performBlockAndWait:", v26);

  -[FBKSeedPortalAPI announcementURLForID:](self, "announcementURLForID:", v30[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_2;
  v20[3] = &unk_24E157650;
  objc_copyWeak(&v24, &location);
  v13 = v7;
  v23 = v13;
  v20[4] = self;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_189;
  v17[3] = &unk_24E1575D8;
  objc_copyWeak(&v19, &location);
  v16 = v13;
  v18 = v16;
  objc_msgSend(v12, "jsonForURL:success:error:", v15, v20, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v29, 8);
}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "ID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3;
  v10[3] = &unk_24E157628;
  v6 = v3;
  v11 = v6;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v15 = v7;
  v12 = v8;
  v13 = v9;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v5, "performBlock:", v10);

  objc_destroyWeak(&v16);
}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  NSObject *v9;
  id v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKAnnouncement, "importFromJSONObject:intoContext:", v2, v3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "setAnnouncement:", v10);
    v4 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "saveChangesIntoContext:URLUsed:", v5, *(_QWORD *)(a1 + 56));

    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v10, 0);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", 0, -1001, *(_QWORD *)(a1 + 64));

    Log_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3_cold_1();

  }
}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_189(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_reportUnderlyingError:withFBKErrorCode:withCompletion:", v4, -1004, *(_QWORD *)(a1 + 32));

}

- (void)updateAnnouncementWithID:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  -[FBKSeedPortalAPI announcementURLForID:](self, "announcementURLForID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke;
  v18[3] = &unk_24E157740;
  v18[4] = self;
  v19 = v10;
  v20 = v8;
  v21 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_3;
  v16[3] = &unk_24E157188;
  v17 = v21;
  v13 = v21;
  v14 = v8;
  v15 = v10;
  objc_msgSend(v11, "jsonForURL:success:error:", v15, v18, v16);

}

void __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_2;
  v8[3] = &unk_24E157718;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v4, "performBlock:", v8);

}

void __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONObject:intoContext:](FBKAnnouncement, "importFromJSONObject:intoContext:", v2, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "saveChangesIntoContext:URLUsed:", v5, *(_QWORD *)(a1 + 48));

  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

uint64_t __59__FBKSeedPortalAPI_updateAnnouncementWithID_success_error___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)acknowledgeAnnouncementWithID:(id)a3 success:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v17[0] = CFSTR("id");
  v17[1] = CFSTR("type");
  v18[0] = a3;
  v18[1] = CFSTR("Announcement");
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI announcementAcknowledgementURL](self, "announcementAcknowledgementURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__FBKSeedPortalAPI_acknowledgeAnnouncementWithID_success_error___block_invoke;
  v15[3] = &unk_24E157A38;
  v16 = v8;
  v14 = v8;
  -[FBKSeedPortalAPI envelopedPOSTForURL:parameters:success:errorHandler:](self, "envelopedPOSTForURL:parameters:success:errorHandler:", v13, v12, v15, v10);

}

uint64_t __64__FBKSeedPortalAPI_acknowledgeAnnouncementWithID_success_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getRemoteDeviceTokenWithSuccess:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI generateDeviceTokenForRemoteURL](self, "generateDeviceTokenForRemoteURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__FBKSeedPortalAPI_getRemoteDeviceTokenWithSuccess_error___block_invoke;
  v12[3] = &unk_24E157A60;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "postToURL:parameters:encoding:success:error:", v9, MEMORY[0x24BDBD1B8], 0, v12, v10);

}

void __58__FBKSeedPortalAPI_getRemoteDeviceTokenWithSuccess_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("token"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)hostUrl
{
  void *v2;
  void *v3;

  -[FBKSSeedPortalAPI seedPortalURL](self, "seedPortalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)getFileDownloadURLForFilePromiseUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  -[FBKSeedPortalAPI filePromiseDownloadURLForUUID:](self, "filePromiseDownloadURLForUUID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke;
  v13[3] = &unk_24E157A88;
  v14 = v6;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_202;
  v11[3] = &unk_24E157188;
  v12 = v14;
  v10 = v14;
  objc_msgSend(v8, "dataForURL:successWithResponse:error:", v7, v13, v11);

}

void __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;

  objc_msgSend(a3, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, 0);
  }
  else
  {
    Log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 32);
    FBKErrorOfType(-1012);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v6);
  }

}

uint64_t __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteFilePromiseWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  -[FBKSeedPortalAPI filePromiseDeleteURLForUUID:](self, "filePromiseDeleteURLForUUID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke;
  v13[3] = &unk_24E157768;
  v14 = v6;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke_2;
  v11[3] = &unk_24E157188;
  v12 = v14;
  v10 = v14;
  objc_msgSend(v8, "deleteResourceAtURL:success:error:", v7, v13, v11);

}

uint64_t __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__FBKSeedPortalAPI_deleteFilePromiseWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performHeartbeatWithSuccess:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI heartbeatURL](self, "heartbeatURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__FBKSeedPortalAPI_performHeartbeatWithSuccess_error___block_invoke;
  v11[3] = &unk_24E157560;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "jsonForURL:success:error:", v9, v11, v7);

}

uint64_t __54__FBKSeedPortalAPI_performHeartbeatWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)respondToConsent:(id)a3 didAgree:(BOOL)a4 success:(id)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v7 = a4;
  v25[4] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v24[0] = CFSTR("type");
  v11 = a6;
  v12 = a3;
  objc_msgSend(v12, "consentTypeString");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("unknown");
  if (v13)
    v15 = (const __CFString *)v13;
  v25[0] = v15;
  v24[1] = CFSTR("id");
  objc_msgSend(v12, "ID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v25[1] = v16;
  v25[2] = MEMORY[0x24BDBD1A8];
  v24[2] = CFSTR("agreement_ids");
  v24[3] = CFSTR("agree");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKSeedPortalAPI foregroundClient](self, "foregroundClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI pendingConsentURL](self, "pendingConsentURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__FBKSeedPortalAPI_respondToConsent_didAgree_success_error___block_invoke;
  v22[3] = &unk_24E157768;
  v23 = v10;
  v21 = v10;
  objc_msgSend(v19, "postToURL:parameters:encoding:success:error:", v20, v18, 2, v22, v11);

}

uint64_t __60__FBKSeedPortalAPI_respondToConsent_didAgree_success_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)managedObjectContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  -[FBKSeedPortalAPI loginManager](self, "loginManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "loginState");

  if (v4)
  {
    -[FBKSeedPortalAPI _managedObjectContext](self, "_managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[FBKLog net](FBKLog, "net");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "sp2 will return nil managed object context because FBK is logged out", v8, 2u);
    }

    v5 = 0;
  }
  return v5;
}

- (id)_filterForValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBKSeedPortalAPI;
  -[FBKSSeedPortalAPI _filterForValue](&v3, sel__filterForValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)saveChangesIntoContext:(id)a3 URLUsed:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t *v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  -[FBKSeedPortalAPI loginManager](self, "loginManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loginState");

  if (v9)
  {
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__FBKSeedPortalAPI_saveChangesIntoContext_URLUsed___block_invoke;
    v13[3] = &unk_24E157AB0;
    v14 = v6;
    v16 = buf;
    v15 = v7;
    objc_msgSend(v14, "performBlockAndWait:", v13);
    v10 = *((id *)v18 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[FBKLog net](FBKLog, "net");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "not logged in, will not save changes", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

void __51__FBKSeedPortalAPI_saveChangesIntoContext_URLUsed___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id obj;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v3 + 40);
    objc_msgSend(v2, "save:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    Log_1();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "code");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2048;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_ERROR, "Error saving to context: [%{public}@] endpoint: [%{public}@] domain: [%{public}@] error code [%li] reason [%{public}@]", buf, 0x34u);

    }
  }
}

- (FBKLoginManager)loginManager
{
  return (FBKLoginManager *)objc_loadWeakRetained((id *)&self->_loginManager);
}

- (void)setLoginManager:(id)a3
{
  objc_storeWeak((id *)&self->_loginManager, a3);
}

- (FBKForegroundDataClient)foregroundClient
{
  return self->_foregroundClient;
}

- (void)setForegroundClient:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundClient, a3);
}

- (NSMutableArray)deletedResponseIDs
{
  return self->_deletedResponseIDs;
}

- (void)setDeletedResponseIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedResponseIDs, a3);
}

- (FBKUser)loggedInUser
{
  return self->_loggedInUser;
}

- (void)setLoggedInUser:(id)a3
{
  objc_storeStrong((id *)&self->_loggedInUser, a3);
}

- (NSManagedObjectContext)_managedObjectContext
{
  return (NSManagedObjectContext *)objc_loadWeakRetained((id *)&self->__managedObjectContext);
}

- (void)set_managedObjectContext:(id)a3
{
  objc_storeWeak((id *)&self->__managedObjectContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__managedObjectContext);
  objc_storeStrong((id *)&self->_loggedInUser, 0);
  objc_storeStrong((id *)&self->_deletedResponseIDs, 0);
  objc_storeStrong((id *)&self->_foregroundClient, 0);
  objc_destroyWeak((id *)&self->_loginManager);
}

+ (NSString)upsertedKey
{
  return (NSString *)(id)sub_21DAC4810();
}

+ (NSString)deletedKey
{
  return (NSString *)(id)sub_21DAC4810();
}

+ (NSString)itemsKey
{
  return (NSString *)(id)sub_21DAC4810();
}

- (void)envelopedGETForURL:(id)a3 success:(id)a4 errorHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  FBKSeedPortalAPI *v16;
  uint64_t v17;

  v8 = sub_21DAC3E44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = _Block_copy(a5);
  sub_21DAC3E20();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = self;
  sub_21DA38564((uint64_t)v11, (uint64_t)sub_21DA3C250, v14, (uint64_t)sub_21DA3C198, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)envelopedPUTForURL:(id)a3 parameters:(id)a4 success:(id)a5 errorHandler:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FBKSeedPortalAPI *v18;
  uint64_t v19;

  v9 = sub_21DAC3E44();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = _Block_copy(a6);
  sub_21DAC3E20();
  v15 = sub_21DAC47EC();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v13;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v14;
  v18 = self;
  sub_21DA38AF8((uint64_t)v12, v15, (uint64_t)sub_21DA3C250, v16, (uint64_t)sub_21DA3C198, v17);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)envelopedPOSTForURL:(id)a3 parameters:(id)a4 success:(id)a5 errorHandler:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FBKSeedPortalAPI *v18;
  uint64_t v19;

  v9 = sub_21DAC3E44();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = _Block_copy(a6);
  sub_21DAC3E20();
  v15 = sub_21DAC47EC();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v13;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v14;
  v18 = self;
  sub_21DA38EE0((uint64_t)v12, v15, (uint64_t)sub_21DA3C250, v16, (uint64_t)sub_21DA3C198, v17);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)envelopedDELETEForURL:(id)a3 success:(id)a4 errorHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  FBKSeedPortalAPI *v16;
  uint64_t v17;

  v8 = sub_21DAC3E44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = _Block_copy(a5);
  sub_21DAC3E20();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = self;
  sub_21DA392C8((uint64_t)v11, (uint64_t)sub_21DA3C250, v14, (uint64_t)sub_21DA3C198, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)handleDataResponseFor:(id)a3 data:(id)a4 success:(id)a5 errorHandler:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  void *v15;
  FBKSeedPortalAPI *v16;
  uint64_t v17;
  _BYTE v18[32];

  v9 = sub_21DAC3E44();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = _Block_copy(a5);
  v15 = _Block_copy(a6);
  sub_21DAC3E20();
  swift_unknownObjectRetain();
  v16 = self;
  sub_21DAC4BB8();
  swift_unknownObjectRelease();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(swift_allocObject() + 16) = v15;
  sub_21DA397D8((uint64_t)v13, (uint64_t)v18, (uint64_t)sub_21DA3B9E4, v17, (void (*)(void))sub_21DA3B9EC);

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v13, v9);
}

- (id)envelopedObjectFrom:(id)a3
{
  uint64_t v4;
  FBKSeedPortalAPI *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = sub_21DAC47EC();
  v5 = self;
  sub_21DA3ACDC(v4, (uint64_t)v13);

  swift_bridgeObjectRelease();
  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_0(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v7, v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_21DAC4E70();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v11;
}

- (NSURL)teamsURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  FBKSeedPortalAPI *v12;
  NSURL *v13;
  void (*v14)(char *, uint64_t);
  void *v15;
  uint64_t v17;

  v3 = sub_21DAC3E44();
  v4 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x24BDAC7A8](v3, v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)&v17 - v10;
  v12 = self;
  v13 = -[FBKSSeedPortalAPI feedbackURL](v12, sel_feedbackURL);
  sub_21DAC3E20();

  sub_21DAC3E14();
  v14 = *(void (**)(char *, uint64_t))(v4 + 8);
  v14(v8, v3);

  v15 = (void *)sub_21DAC3DFC();
  v14(v11, v3);
  return (NSURL *)v15;
}

- (id)contentItemsURLForTeamID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  FBKSeedPortalAPI *v11;
  void *v12;
  uint64_t v14;

  v5 = sub_21DAC3E44();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = self;
  sub_21DA540B8(v10, (uint64_t)v9);

  v12 = (void *)sub_21DAC3DFC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v12;
}

- (id)formItemsURLForTeamID:(id)a3 formTat:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  FBKSeedPortalAPI *v14;
  void *v15;
  uint64_t v17;

  v7 = sub_21DAC3E44();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_21DA54330(v12, a4, (uint64_t)v11);

  v15 = (void *)sub_21DAC3DFC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (id)bugFormURLForID:(id)a3 teamID:(id)a4
{
  return sub_21DA547CC(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_bugFormURLForID_);
}

- (id)createResponseURLForBugFormID:(id)a3 teamID:(id)a4
{
  return sub_21DA547CC(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_createResponseURLForBugFormID_);
}

- (id)promoteURLForTeamID:(id)a3
{
  return sub_21DA54928(self, (uint64_t)a2, a3);
}

- (id)demoteURLForTeamID:(id)a3
{
  return sub_21DA54928(self, (uint64_t)a2, a3);
}

- (id)participantsURLForTeamID:(id)a3
{
  return sub_21DA54928(self, (uint64_t)a2, a3);
}

- (id)assignURLForTeamID:(id)a3 participantID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  FBKSeedPortalAPI *v14;
  void *v15;
  uint64_t v17;

  v7 = sub_21DAC3E44();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_21DA54BF4((uint64_t)v12, v13);

  v15 = (void *)sub_21DAC3DFC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (void)updateTeamsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(void *, uint64_t);
  FBKSeedPortalAPI *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_21DA58A8C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  FBKSeedPortalAPI.updateTeams(completion:)((uint64_t)v7, v6);
  sub_21DA589F8((uint64_t)v7);

}

- (void)promoteFeedback:(id)a3 toTeamID:(int64_t)a4 success:(id)a5 error:(id)a6
{
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FBKSeedPortalAPI *v14;

  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = (uint64_t (*)())_Block_copy(a6);
  v11 = sub_21DAC496C();
  if (!v9)
  {
    v12 = 0;
    if (v10)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  v9 = sub_21DA58D60;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v10;
  v10 = sub_21DA3C198;
LABEL_6:
  v14 = self;
  FBKSeedPortalAPI.promoteFeedback(feedbackIDs:toTeamID:success:error:)(v11, a4, (uint64_t)v9, v12, (uint64_t)v10, v13);
  sub_21DA589F8((uint64_t)v10);
  sub_21DA589F8((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)demoteFeedback:(id)a3 fromTeamID:(int64_t)a4 success:(id)a5 error:(id)a6
{
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FBKSeedPortalAPI *v14;

  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = (uint64_t (*)())_Block_copy(a6);
  v11 = sub_21DAC496C();
  if (!v9)
  {
    v12 = 0;
    if (v10)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  v9 = sub_21DA58D60;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v10;
  v10 = sub_21DA3C198;
LABEL_6:
  v14 = self;
  FBKSeedPortalAPI.demoteFeedback(feedbackIDs:fromTeamID:success:error:)(v11, a4, (uint64_t)v9, v12, (uint64_t)v10, v13);
  sub_21DA589F8((uint64_t)v10);
  sub_21DA589F8((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)getParticipantsForTeamID:(int64_t)a3 success:(id)a4 error:(id)a5
{
  void *v8;
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  FBKSeedPortalAPI *v13;

  v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v8 = sub_21DA58A5C;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v10 = sub_21DA3C198;
LABEL_6:
  v13 = self;
  FBKSeedPortalAPI.getParticipants(teamID:success:error:)(a3, (uint64_t)v8, v11, (uint64_t)v10, v12);
  sub_21DA589F8((uint64_t)v10);
  sub_21DA589F8((uint64_t)v8);

}

- (void)assignFeedback:(id)a3 inTeamID:(int64_t)a4 toParticipantID:(int64_t)a5 success:(id)a6 error:(id)a7
{
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  FBKSeedPortalAPI *v16;

  v11 = _Block_copy(a6);
  v12 = _Block_copy(a7);
  v13 = sub_21DAC496C();
  if (!v11)
  {
    v14 = 0;
    if (v12)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  v11 = sub_21DA58A2C;
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  v12 = sub_21DA3B9EC;
LABEL_6:
  v16 = self;
  FBKSeedPortalAPI.assignFeedback(feedbackIDs:inTeamID:toParticipantID:success:error:)(v13, a4, a5, (uint64_t)v11, v14, (uint64_t)v12, v15);
  sub_21DA589F8((uint64_t)v12);
  sub_21DA589F8((uint64_t)v11);

  swift_bridgeObjectRelease();
}

- (id)wrapFeedbackIDs:(id)a3
{
  uint64_t v3;
  uint64_t inited;
  void *v5;

  v3 = sub_21DAC496C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553994B0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DACF660;
  strcpy((char *)(inited + 32), "feedback_ids");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(_QWORD *)(inited + 48) = v3;
  sub_21DA456D0(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553994A8);
  v5 = (void *)sub_21DAC47E0();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)didLogInWithLoginUserInfo:completion:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_FAULT, "Private queue context is nil after logging in", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __57__FBKSeedPortalAPI_didLogInWithLoginUserInfo_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Could not fetch private queue context user", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "adsid: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "BetaToken: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)seedPortalLoginWithAuthKitSession:device:authenticationResults:success:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "IDMS Tokens: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)seedPortalLoginWithAuthKitSession:device:idmsToken:alternateDSID:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "IDMS Tokens returned did not contain beta.auth token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)seedPortalLoginWithAppleConnectSession:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "AppleConnect headers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)seedPortalLoginAsAnonymousUserWithConfigurationToken:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Encountered an error serializing JSON: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "bad data format in forms index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_127_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "in stub forms loaded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__FBKSeedPortalAPI_updateFormItemsForUser_inTeam_formTat_withCompletion___block_invoke_127_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "updateForms core data error [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)updateContentItemsForTeam:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "Using URL with form identifiers [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Purging old contents failed. [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Fetching contents to purge failed. [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Saving contents failed. [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __61__FBKSeedPortalAPI_updateContentItemsForTeam_withCompletion___block_invoke_149_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "HTTP client returned error. [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)deleteFormResponseWithID:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Given nil FormResponse ID to delete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_fault_impl(&dword_21D9A9000, a4, OS_LOG_TYPE_FAULT, "No existing answer for question [%{public}@]", a1, 0xCu);

}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_2(void *a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_ERROR, "Form response context is %{public}@, but bug form context is %{public}@", (uint8_t *)&v9, 0x16u);

}

void __79__FBKSeedPortalAPI_createFormResponseForBugForm_inTeam_appToken_success_error___block_invoke_2_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "intValue");
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "nil upserted item for new FR [%i]", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_7();
}

- (void)saveAnswersForFormResponseWithID:answers:success:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_21D9A9000, v0, v1, "Saving answers [%{private}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __97__FBKSeedPortalAPI_markCompleteForFormResponseWithID_bugFormID_withFiles_metadata_success_error___block_invoke_2_cold_1(id *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(*a1, "intValue");
  objc_msgSend(a2, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109376;
  v7[1] = v5;
  v8 = 1024;
  v9 = objc_msgSend(v6, "intValue");
  _os_log_error_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_ERROR, "Could not find FR [%i] for upserted Feedback Item [%i]", (uint8_t *)v7, 0xEu);

}

void __67__FBKSeedPortalAPI_fetchAnnouncementForContentItem_withCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "bad data format in announcement fetch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__FBKSeedPortalAPI_getFileDownloadURLForFilePromiseUUID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Failed to get download path from redirected link.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
