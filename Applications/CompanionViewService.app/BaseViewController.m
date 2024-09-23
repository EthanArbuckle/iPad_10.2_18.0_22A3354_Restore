@implementation BaseViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  id v9;
  CPSViewServicePresentationContext *v10;
  CPSViewServicePresentationContext *presentationContext;
  id v12;
  NSObject *v13;
  CPSViewServicePresentationContext *v14;
  int v15;
  CPSViewServicePresentationContext *v16;

  v6 = (void (**)(_QWORD))a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "xpcEndpoint"));
  sub_100005728((id *)self, v8);

  v9 = sub_100005858((uint64_t)self, v7);
  v10 = (CPSViewServicePresentationContext *)objc_claimAutoreleasedReturnValue(v9);

  presentationContext = self->_presentationContext;
  self->_presentationContext = v10;

  v12 = sub_100005968();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_presentationContext;
    v15 = 138412290;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received presentation context: %@", (uint8_t *)&v15, 0xCu);
  }

  v6[2](v6);
}

- (SBUIRemoteAlertHostInterface)viewServiceHost
{
  return (SBUIRemoteAlertHostInterface *)-[BaseViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_10000C448);
}

- (CPSViewServicePresenterInterface)viewServicePresenter
{
  return (CPSViewServicePresenterInterface *)-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_presenterConnection, "remoteObjectProxyWithErrorHandler:", &stru_10000C468);
}

- (CPSViewServicePresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_presenterConnection, 0);
}

@end
