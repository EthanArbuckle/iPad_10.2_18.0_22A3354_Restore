@implementation FAFollowupActionViewController_iOS

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FAFollowupActionViewController_iOS;
  -[FAFollowupActionViewController_iOS viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[FAFollowupActionViewController_iOS _beginLoadingFamilyCircleUI](self, "_beginLoadingFamilyCircleUI");
}

- (void)handleActionWithURLKey:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);

  objc_storeStrong((id *)&self->_urlEndpoint, a3);
  v5 = (void (**)(id, _QWORD))a4;
  v5[2](v5, 0);

}

- (void)handleAKAction:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  NSString *v14;
  NSString *urlEndpoint;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v10 = _FALogSystem(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "handleAKAction called with context: %@", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "akAction"));
  v13 = objc_msgSend(v12, "isEqualToString:", AKActionContinue);

  if (v13)
  {
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(-[FAFollowupActionViewController_iOS _urlEndpointForFollowpItem](self, "_urlEndpointForFollowpItem"));
    urlEndpoint = self->_urlEndpoint;
    self->_urlEndpoint = v14;

    v7[2](v7, 0);
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100002CB0;
    v16[3] = &unk_100004198;
    v17 = v7;
    +[FAFollowupManager teardownFollowUpWithContext:completion:](FAFollowupManager, "teardownFollowUpWithContext:completion:", v6, v16);

  }
}

- (void)handleActionWithURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v11 = 0;
  objc_msgSend(v4, "openSensitiveURL:withOptions:error:", v3, 0, &v11);

  v5 = v11;
  if (v5)
  {
    v9 = _FALogSystem(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000321C(v5);

  }
}

- (void)_beginLoadingFamilyCircleUI
{
  FACircleStateController *v3;
  FACircleStateController *circleStateController;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FACircleStateController *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  const __CFString *v17;
  void *v18;

  if (self->_urlEndpoint)
  {
    v3 = (FACircleStateController *)objc_msgSend(objc_alloc((Class)FACircleStateController), "initWithPresenter:", self);
    circleStateController = self->_circleStateController;
    self->_circleStateController = v3;

    v5 = objc_alloc((Class)FACircleContext);
    v6 = objc_msgSend(v5, "initWithEventType:", FACircleEventTypeURLEndpoint);
    objc_msgSend(v6, "setUrlEndpoint:", self->_urlEndpoint);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FAFollowupActionViewController followupItem](self, "followupItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", AKFollowUpIDMSDataKey));

    if (v9)
    {
      v17 = CFSTR("requestParameters");
      v18 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      objc_msgSend(v6, "setAdditionalParameters:", v10);

    }
    v11 = self->_circleStateController;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100002F58;
    v16[3] = &unk_1000041C0;
    v16[4] = self;
    -[FACircleStateController performOperationWithContext:completion:](v11, "performOperationWithContext:completion:", v6, v16);

  }
  else
  {
    v12 = _FALogSystem(self, a2);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100003298(v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FAFollowupActionViewController followupItem](self, "followupItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIdentifier"));
    +[FAFollowupManager tearDownFollowupItemWithIdentifier:completion:](FAFollowupManager, "tearDownFollowupItemWithIdentifier:completion:", v15, 0);

    -[FAFollowupActionViewController_iOS finishProcessing](self, "finishProcessing");
  }
}

- (id)_urlEndpointForFollowpItem
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FAFollowupActionViewController followupItem](self, "followupItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actions"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = AKFollowUpURLKey;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo", (_QWORD)v16));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v8));

        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v8));

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleStateController, 0);
  objc_storeStrong((id *)&self->_urlEndpoint, 0);
}

@end
