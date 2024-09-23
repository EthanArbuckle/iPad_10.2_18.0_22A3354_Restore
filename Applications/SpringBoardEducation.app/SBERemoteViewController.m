@implementation SBERemoteViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBERemoteViewController;
  -[SBERemoteViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SBERemoteViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBERemoteViewController;
  -[SBERemoteViewController dealloc](&v3, "dealloc");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSXPCConnection *v11;
  NSXPCConnection *connection;
  NSXPCConnection *v13;
  void *v14;
  NSXPCConnection *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SBERemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", 0));
  objc_msgSend(v7, "setReachabilityDisabled:", 1);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  objc_msgSend(v7, "setAllowsControlCenter:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "xpcEndpoint"));

  if (v8)
  {
    v9 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "xpcEndpoint"));
    objc_msgSend(v9, "_setEndpoint:", v10);

    v11 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v9);
    connection = self->_connection;
    self->_connection = v11;

    v13 = self->_connection;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SBExternalDisplayHardwareRequirementsChangedProtocol));
    -[NSXPCConnection setExportedInterface:](v13, "setExportedInterface:", v14);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v15 = self->_connection;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SBRemoteHandshakeProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v15, "setRemoteObjectInterface:", v16);

    -[NSXPCConnection resume](self->_connection, "resume");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    objc_msgSend(v17, "wakeUpConnection");

  }
  if (v6)
    v6[2](v6);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SBEExternalDisplayContentViewController *v12;
  id *v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SBERemoteViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SBEducationRemoteViewControllerEducationTypeKey")));
  v11 = (int)objc_msgSend(v10, "intValue");

  if (v11 == 1)
  {
    v12 = objc_alloc_init(SBEExternalDisplayContentViewController);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_10000472C;
    v21 = &unk_10000C288;
    v13 = &v22;
    v15 = v6;
    v22 = v15;
    v14 = &v23;
    v23 = v8;
    -[SBEExternalDisplayContentViewController setCompletionHandler:](v12, "setCompletionHandler:", &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo", v18, v19, v20, v21));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("SBEducationRemoteViewControllerHasPointerAndKeyboardConnectedKey")));
    -[SBEExternalDisplayContentViewController externalDisplayHardwareRequirementsSatisfiedChanged:](v12, "externalDisplayHardwareRequirementsSatisfiedChanged:", objc_msgSend(v17, "BOOLValue"));

    objc_storeWeak((id *)&self->_hardwareRequirementsSublistener, v12);
  }
  else
  {
    if (v11)
      goto LABEL_6;
    v12 = objc_alloc_init(SBEChamoisContentViewController);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100004688;
    v24[3] = &unk_10000C260;
    v13 = &v25;
    v25 = v6;
    v14 = &v26;
    v26 = v8;
    -[SBEExternalDisplayContentViewController setCompletionHandler:](v12, "setCompletionHandler:", v24);
  }
  -[SBERemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

LABEL_6:
  if (v7)
    v7[2](v7);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)externalDisplayHardwareRequirementsSatisfiedChanged:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  id WeakRetained;
  BOOL v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000487C;
  v5[3] = &unk_10000C2B0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareRequirementsSublistener);
  v7 = a3;
  v4 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)dismissAnimated:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  id WeakRetained;
  BOOL v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004918;
  v5[3] = &unk_10000C2B0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareRequirementsSublistener);
  v7 = a3;
  v4 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_hardwareRequirementsSublistener);
}

@end
