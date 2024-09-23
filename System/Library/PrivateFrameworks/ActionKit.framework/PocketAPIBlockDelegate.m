@implementation PocketAPIBlockDelegate

- (void)pocketAPILoggedIn:(id)a3
{
  void (**v5)(id, id, _QWORD);

  if (-[PocketAPIBlockDelegate loginHandler](self, "loginHandler"))
  {
    v5 = -[PocketAPIBlockDelegate loginHandler](self, "loginHandler");
    v5[2](v5, a3, 0);
  }
}

- (void)pocketAPI:(id)a3 hadLoginError:(id)a4
{
  void (**v7)(id, id, id);

  if (-[PocketAPIBlockDelegate loginHandler](self, "loginHandler"))
  {
    v7 = -[PocketAPIBlockDelegate loginHandler](self, "loginHandler");
    v7[2](v7, a3, a4);
  }
}

- (void)pocketAPI:(id)a3 savedURL:(id)a4
{
  void (**v7)(id, id, id, _QWORD);

  if (-[PocketAPIBlockDelegate saveHandler](self, "saveHandler"))
  {
    v7 = -[PocketAPIBlockDelegate saveHandler](self, "saveHandler");
    v7[2](v7, a3, a4, 0);
  }
}

- (void)pocketAPI:(id)a3 failedToSaveURL:(id)a4 error:(id)a5
{
  void (**v9)(id, id, id, id);

  if (-[PocketAPIBlockDelegate saveHandler](self, "saveHandler"))
  {
    v9 = -[PocketAPIBlockDelegate saveHandler](self, "saveHandler");
    v9[2](v9, a3, a4, a5);
  }
}

- (void)pocketAPI:(id)a3 receivedResponse:(id)a4 forAPIMethod:(id)a5 error:(id)a6
{
  void (**v11)(id, id, id, id, id);

  if (-[PocketAPIBlockDelegate responseHandler](self, "responseHandler"))
  {
    v11 = -[PocketAPIBlockDelegate responseHandler](self, "responseHandler");
    v11[2](v11, a3, a5, a4, a6);
  }
}

- (void)dealloc
{
  objc_super v3;

  self->loginHandler = 0;
  self->saveHandler = 0;

  self->responseHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)PocketAPIBlockDelegate;
  -[PocketAPIBlockDelegate dealloc](&v3, sel_dealloc);
}

- (id)loginHandler
{
  return self->loginHandler;
}

- (void)setLoginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)saveHandler
{
  return self->saveHandler;
}

- (void)setSaveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)responseHandler
{
  return self->responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)delegateWithLoginHandler:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setLoginHandler:", (id)objc_msgSend(a3, "copy"));
  return v4;
}

+ (id)delegateWithSaveHandler:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setSaveHandler:", (id)objc_msgSend(a3, "copy"));
  return v4;
}

+ (id)delegateWithResponseHandler:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setResponseHandler:", (id)objc_msgSend(a3, "copy"));
  return v4;
}

@end
