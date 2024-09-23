@implementation IDSHomeKitManager

+ (id)sharedInstance
{
  if (qword_1ECDD6740 != -1)
    dispatch_once(&qword_1ECDD6740, &unk_1E2C5FB90);
  return (id)qword_1ECDD6700;
}

- (IDSHomeKitManager)init
{
  IDSHomeKitManager *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSHomeKitManager;
  v2 = -[IDSHomeKitManager init](&v6, sel_init);
  if (v2)
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addHandler:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandler:", self);

  v5.receiver = self;
  v5.super_class = (Class)IDSHomeKitManager;
  -[IDSHomeKitManager dealloc](&v5, sel_dealloc);
}

- (void)getServiceUserIDsWithCompletionBlock:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  IDSHomeKitManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907676B4;
  v11[3] = &unk_1E2C60EC8;
  v13 = self;
  v14 = v6;
  v12 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)getAdminAccessTokensWithWithServiceUserID:(id)a3 accessoryID:(id)a4 pairingToken:(id)a5 completionBlock:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  IDSHomeKitManager *v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_190767860;
  v23[3] = &unk_1E2C63130;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v16;
  v28 = self;
  v29 = v15;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  objc_msgSend(v17, "performBlock:", v23);

}

- (void)getConsentTokensWithServiceUserID:(id)a3 accessoryIDs:(id)a4 adminID:(id)a5 completionBlock:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  IDSHomeKitManager *v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_190767AAC;
  v23[3] = &unk_1E2C63130;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v16;
  v28 = self;
  v29 = v15;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  objc_msgSend(v17, "performBlock:", v23);

}

- (void)getUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 userHandle:(id)a5 accessoryRequests:(id)a6 completionBlock:(id)a7 queue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  IDSHomeKitManager *v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_190767D98;
  v27[3] = &unk_1E2C63158;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v33 = self;
  v34 = v18;
  v32 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  objc_msgSend(v20, "performBlock:", v27);

}

- (void)refreshUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 accessoryRequests:(id)a5 completionBlock:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  IDSHomeKitManager *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_190767FFC;
  v23[3] = &unk_1E2C63180;
  v24 = v16;
  v25 = self;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v16;
  v22 = v15;
  objc_msgSend(v17, "performBlock:", v23);

}

- (void)serviceUserIDs:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _IDSGenericCompletionHandler *getServiceUserIDsCompletion;
  _IDSGenericCompletionHandler *v9;
  _IDSGenericCompletionHandler *v10;
  NSObject *v11;
  _IDSGenericCompletionHandler *v12;
  _QWORD block[4];
  _IDSGenericCompletionHandler *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  getServiceUserIDsCompletion = self->_getServiceUserIDsCompletion;
  if (getServiceUserIDsCompletion)
  {
    v9 = getServiceUserIDsCompletion;
    v10 = self->_getServiceUserIDsCompletion;
    self->_getServiceUserIDsCompletion = 0;

    -[IDSDelegateInfo queue](v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190768164;
    block[3] = &unk_1E2C602B8;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    v12 = v9;
    dispatch_async(v11, block);

  }
}

- (void)adminAccessTokens:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _IDSGenericCompletionHandler *getAdminAccessTokensCompletion;
  _IDSGenericCompletionHandler *v9;
  _IDSGenericCompletionHandler *v10;
  NSObject *v11;
  _IDSGenericCompletionHandler *v12;
  _QWORD block[4];
  _IDSGenericCompletionHandler *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  getAdminAccessTokensCompletion = self->_getAdminAccessTokensCompletion;
  if (getAdminAccessTokensCompletion)
  {
    v9 = getAdminAccessTokensCompletion;
    v10 = self->_getAdminAccessTokensCompletion;
    self->_getAdminAccessTokensCompletion = 0;

    -[IDSDelegateInfo queue](v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190768290;
    block[3] = &unk_1E2C602B8;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    v12 = v9;
    dispatch_async(v11, block);

  }
}

- (void)consentTokens:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _IDSGenericCompletionHandler *getConsentTokensCompletion;
  _IDSGenericCompletionHandler *v9;
  _IDSGenericCompletionHandler *v10;
  NSObject *v11;
  _IDSGenericCompletionHandler *v12;
  _QWORD block[4];
  _IDSGenericCompletionHandler *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  getConsentTokensCompletion = self->_getConsentTokensCompletion;
  if (getConsentTokensCompletion)
  {
    v9 = getConsentTokensCompletion;
    v10 = self->_getConsentTokensCompletion;
    self->_getConsentTokensCompletion = 0;

    -[IDSDelegateInfo queue](v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1907683BC;
    block[3] = &unk_1E2C602B8;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    v12 = v9;
    dispatch_async(v11, block);

  }
}

- (void)userAccessTokens:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _IDSGenericCompletionHandler *getUserAccessTokensCompletion;
  _IDSGenericCompletionHandler *v9;
  _IDSGenericCompletionHandler *v10;
  NSObject *v11;
  _IDSGenericCompletionHandler *v12;
  _QWORD block[4];
  _IDSGenericCompletionHandler *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  getUserAccessTokensCompletion = self->_getUserAccessTokensCompletion;
  if (getUserAccessTokensCompletion)
  {
    v9 = getUserAccessTokensCompletion;
    v10 = self->_getUserAccessTokensCompletion;
    self->_getUserAccessTokensCompletion = 0;

    -[IDSDelegateInfo queue](v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1907684E8;
    block[3] = &unk_1E2C602B8;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    v12 = v9;
    dispatch_async(v11, block);

  }
}

- (void)refreshUserAccessTokens:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _IDSGenericCompletionHandler *refreshUserAccessTokensCompletion;
  _IDSGenericCompletionHandler *v9;
  _IDSGenericCompletionHandler *v10;
  NSObject *v11;
  _IDSGenericCompletionHandler *v12;
  _QWORD block[4];
  _IDSGenericCompletionHandler *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  refreshUserAccessTokensCompletion = self->_refreshUserAccessTokensCompletion;
  if (refreshUserAccessTokensCompletion)
  {
    v9 = refreshUserAccessTokensCompletion;
    v10 = self->_refreshUserAccessTokensCompletion;
    self->_refreshUserAccessTokensCompletion = 0;

    -[IDSDelegateInfo queue](v9, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190768614;
    block[3] = &unk_1E2C602B8;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    v12 = v9;
    dispatch_async(v11, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshUserAccessTokensCompletion, 0);
  objc_storeStrong((id *)&self->_getUserAccessTokensCompletion, 0);
  objc_storeStrong((id *)&self->_getConsentTokensCompletion, 0);
  objc_storeStrong((id *)&self->_getAdminAccessTokensCompletion, 0);
  objc_storeStrong((id *)&self->_getServiceUserIDsCompletion, 0);
}

@end
