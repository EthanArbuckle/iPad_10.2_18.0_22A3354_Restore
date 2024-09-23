@implementation TKUITokenAccessPromptVC

- (TKUITokenAccessPromptVC)init
{
  TKUITokenAccessPromptVC *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKUITokenAccessPromptVC;
  result = -[TKUITokenAccessPromptVC init](&v3, "init");
  if (result)
    result->_tokenAccess = 0;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKUITokenAccessPromptVC;
  -[TKUITokenAccessPromptVC viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TKUITokenAccessPromptVC _presentAlert](self, "_presentAlert");
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TKUITokenAccessPromptVC traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v4 = objc_msgSend(v2, "containsTraitsInCollection:", v3);

  if (v4)
    return 1;
  else
    return 3;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcEndpoint"));

  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKUITokenAccessPromptVC.m"), 57, CFSTR("Host must inject endpoint to receive user choice"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "xpcEndpoint"));
  -[TKUITokenAccessPromptVC _connectToHostWithEndpoint:](self, "_connectToHostWithEndpoint:", v9);

  if (v7)
    v7[2](v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  TKTokenAccessUserPromptInfo *v14;
  id v15;
  TKTokenAccessUserPromptInfo *info;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v7 = (void (**)(_QWORD))a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));

  if (!v9)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKUITokenAccessPromptVC.m"), 65, CFSTR("Host must provide request info"));

  }
  v10 = objc_opt_class(TKTokenAccessUserPromptInfo);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kTKTokenAccessUserPromptInfo));
  v13 = v12;
  if (!v12)
    v13 = objc_alloc_init((Class)NSData);
  v26 = 0;
  v14 = (TKTokenAccessUserPromptInfo *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v10, v13, &v26));
  v15 = v26;
  info = self->_info;
  self->_info = v14;

  if (!v12)
  if (!self->_info)
  {
    v17 = sub_10000512C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000059BC((uint64_t)v15, v18, v19, v20, v21, v22, v23, v24);

  }
  if (v7)
    v7[2](v7);

}

- (void)_presentAlert
{
  TKTokenAccessUserPromptInfo *info;
  void *v4;
  id v5;

  info = self->_info;
  if (info)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[TKTokenAccessUserPromptInfo clientDisplayName](info, "clientDisplayName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenAccessUserPromptInfo providerDisplayName](self->_info, "providerDisplayName"));
    -[TKUITokenAccessPromptVC _presentAlertWithClientName:providerName:](self, "_presentAlertWithClientName:providerName:", v5, v4);

  }
  else
  {
    -[TKUITokenAccessPromptVC _invalidate](self, "_invalidate");
  }
}

- (void)_presentAlertWithClientName:(id)a3 providerName:(id)a4
{
  id v6;
  id v7;
  NSBundle *v8;
  void *v9;
  uint64_t v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  void *v19;
  NSBundle *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CTKUI.TOKEN_ACCESS_PROMPT.TITLE"), &stru_100008410, CFSTR("ctkui")));

  v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CTKUI.TOKEN_ACCESS_PROMPT.MESSAGE"), &stru_100008410, CFSTR("ctkui")));
  v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v6, v7));

  v24 = (void *)v14;
  v25 = (void *)v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v14, 1));
  objc_initWeak(location, self);
  v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CTKUI.TOKEN_ACCESS_PROMPT.ACCESS_DENY"), &stru_100008410, CFSTR("ctkui")));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100005528;
  v28[3] = &unk_1000081D8;
  objc_copyWeak(&v29, location);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, v28));
  objc_msgSend(v15, "addAction:", v19);

  v20 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CTKUI.TOKEN_ACCESS_PROMPT.ACCESS_GRANT"), &stru_100008410, CFSTR("ctkui")));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100005554;
  v26[3] = &unk_1000081D8;
  objc_copyWeak(&v27, location);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, 0, v26));
  objc_msgSend(v15, "addAction:", v23);

  -[TKUITokenAccessPromptVC presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, &stru_100008218);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(location);

}

- (void)_connectToHostWithEndpoint:(id)a3
{
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *uiServerConnection;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self->_uiServerConnection)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKUITokenAccessPromptVC.m"), 121, CFSTR("Multiple connections to the the UI server are not supported"));

  }
  v5 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  objc_msgSend(v5, "_setEndpoint:", v10);
  v6 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v5);
  uiServerConnection = self->_uiServerConnection;
  self->_uiServerConnection = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___TKUIServerProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](self->_uiServerConnection, "setRemoteObjectInterface:", v8);

  -[NSXPCConnection resume](self->_uiServerConnection, "resume");
}

- (void)_denyTokenAccess
{
  self->_tokenAccess = 2;
  -[TKUITokenAccessPromptVC _finishTokenAccess](self, "_finishTokenAccess");
}

- (void)_grantTokenAccess
{
  self->_tokenAccess = 1;
  -[TKUITokenAccessPromptVC _finishTokenAccess](self, "_finishTokenAccess");
}

- (void)_finishTokenAccess
{
  id v3;
  NSObject *v4;
  NSXPCConnection *uiServerConnection;
  void *v6;
  void *v7;
  int64_t tokenAccess;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = sub_10000512C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100005A24((uint64_t)self, v4);

  uiServerConnection = self->_uiServerConnection;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000057AC;
  v10[3] = &unk_100008240;
  v10[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](uiServerConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v10));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenAccessUserPromptInfo correlationID](self->_info, "correlationID"));
  tokenAccess = self->_tokenAccess;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005810;
  v9[3] = &unk_100008268;
  v9[4] = self;
  objc_msgSend(v6, "registerTokenAccessRequestCorrelationID:access:reply:", v7, tokenAccess, v9);

}

- (void)_invalidate
{
  NSXPCConnection *uiServerConnection;
  NSXPCConnection *v4;
  void *v5;
  id v6;

  uiServerConnection = self->_uiServerConnection;
  if (uiServerConnection)
  {
    -[NSXPCConnection invalidate](uiServerConnection, "invalidate");
    v4 = self->_uiServerConnection;
    self->_uiServerConnection = 0;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKUITokenAccessPromptVC _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "deactivate");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TKUITokenAccessPromptVC _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiServerConnection, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
