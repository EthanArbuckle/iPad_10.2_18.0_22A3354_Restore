@implementation VettingAcceptor

- (VettingAcceptor)initWithCloudKitURL:(id)a3
{
  id v4;
  VettingAcceptor *v5;
  NSURL *v6;
  NSURL *url;
  VettingHandler *v8;
  VettingHandler *vettingHandler;
  RetrievingDialog *v10;
  RetrievingDialog *retrievingDialog;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VettingAcceptor;
  v5 = -[VettingAcceptor init](&v13, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = v6;

    v8 = -[VettingHandler initWithCloudKitURL:]([VettingHandler alloc], "initWithCloudKitURL:", v4);
    vettingHandler = v5->_vettingHandler;
    v5->_vettingHandler = v8;

    v10 = objc_alloc_init(RetrievingDialog);
    retrievingDialog = v5->_retrievingDialog;
    v5->_retrievingDialog = v10;

    -[RetrievingDialog setDelegate:](v5->_retrievingDialog, "setDelegate:", v5);
  }

  return v5;
}

- (BOOL)retrievingDialogShouldDisplay
{
  return 1;
}

- (void)retrievingDialogCancelled
{
  VettingAcceptor *obj;

  obj = self;
  objc_sync_enter(obj);
  -[VettingAcceptor setCancelled:](obj, "setCancelled:", 1);
  objc_sync_exit(obj);

}

- (void)completeVettingWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VettingAcceptor retrievingDialog](self, "retrievingDialog"));
  objc_msgSend(v5, "schedule");

  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VettingAcceptor vettingHandler](self, "vettingHandler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000144E8;
  v10[3] = &unk_100024B98;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014998;
  v8[3] = &unk_1000246B0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "completeVettingWithCompletionHandler:willIssueCompletionOperationHandler:", v10, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  objc_super v3;

  -[RetrievingDialog abort](self->_retrievingDialog, "abort");
  v3.receiver = self;
  v3.super_class = (Class)VettingAcceptor;
  -[VettingAcceptor dealloc](&v3, "dealloc");
}

- (unint64_t)backgroundTaskID
{
  return self->_backgroundTaskID;
}

- (void)setBackgroundTaskID:(unint64_t)a3
{
  self->_backgroundTaskID = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (VettingHandler)vettingHandler
{
  return self->_vettingHandler;
}

- (RetrievingDialog)retrievingDialog
{
  return self->_retrievingDialog;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retrievingDialog, 0);
  objc_storeStrong((id *)&self->_vettingHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
