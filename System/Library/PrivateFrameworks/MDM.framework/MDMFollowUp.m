@implementation MDMFollowUp

- (MDMFollowUp)initWithStyle:(int64_t)a3 clientIdentifier:(id)a4 itemIdentifier:(id)a5 url:(id)a6 title:(id)a7 notificationInfo:(id)a8 userInfo:(id)a9
{
  id v15;
  id v16;
  id v17;
  MDMFollowUp *v18;
  uint64_t v19;
  FLFollowUpController *followUpController;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v15 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MDMFollowUp;
  v18 = -[MDMFollowUp init](&v26, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", v15);
    followUpController = v18->_followUpController;
    v18->_followUpController = (FLFollowUpController *)v19;

    objc_storeStrong((id *)&v18->_clientIdentifier, a4);
    objc_storeStrong((id *)&v18->_itemIdentifier, a5);
    objc_storeStrong((id *)&v18->_url, a6);
    v18->_style = a3;
    objc_storeStrong((id *)&v18->_title, a7);
    objc_storeStrong((id *)&v18->_notificationInfo, a8);
    objc_storeStrong((id *)&v18->_userInfo, a9);
  }

  return v18;
}

- (void)presentFollowUp
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[MDMFollowUp clearFollowUp](self, "clearFollowUp");
  -[MDMFollowUp _constructFollowUp](self, "_constructFollowUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMFollowUp followUpController](self, "followUpController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "postFollowUpItem:error:", v3, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      -[MDMFollowUp clientIdentifier](self, "clientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_ERROR, "Failed to post FollowUp for '%{public}@' with error: %{public}@", buf, 0x16u);

    }
  }

}

- (void)clearFollowUp
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[MDMFollowUp followUpController](self, "followUpController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v4 = objc_msgSend(v3, "clearPendingFollowUpItems:", &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      -[MDMFollowUp clientIdentifier](self, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "Failed to clear pending FollowUp for '%{public}@' with error: %{public}@", buf, 0x16u);

    }
  }

}

+ (void)clearFollowUpWithClientID:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", v3);
  v8 = 0;
  v5 = objc_msgSend(v4, "clearPendingFollowUpItems:", &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v3;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "Failed to clear pending FollowUp for '%{public}@' with error: %{public}@", buf, 0x16u);
    }
  }

}

- (id)_constructFollowUp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE1B3A0];
  -[MDMFollowUp title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMFollowUp url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithLabel:url:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MDMFollowUp userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v7);

  v8 = (void *)objc_opt_new();
  -[MDMFollowUp title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  v22[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActions:", v10);

  objc_msgSend(v8, "setGroupIdentifier:", *MEMORY[0x24BE1B2E8]);
  -[MDMFollowUp itemIdentifier](self, "itemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUniqueIdentifier:", v11);

  if (-[MDMFollowUp style](self, "style") == 1)
    v12 = 8;
  else
    v12 = 18;
  objc_msgSend(v8, "setDisplayStyle:", v12);
  -[MDMFollowUp notificationInfo](self, "notificationInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_opt_new();
    -[MDMFollowUp title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v15);

    -[MDMFollowUp notificationInfo](self, "notificationInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInformativeText:", v16);

    objc_msgSend(v14, "setActivateAction:", v6);
    objc_msgSend(v14, "options");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BE1B320];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setByAddingObjectsFromArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOptions:", v19);

    objc_msgSend(v8, "setNotification:", v14);
  }

  return v8;
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifier, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setNotificationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_notificationInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end
