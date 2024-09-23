@implementation AMSExportMultiUserStateTask

- (AMSExportMultiUserStateTask)initWithHomeIdentifier:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  AMSExportMultiUserStateTask *v8;

  v6 = a3;
  +[AMSMultiUserService proxyObjectAsync](AMSMultiUserService, "proxyObjectAsync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AMSExportMultiUserStateTask initWithHomeIdentifier:options:multiUserService:](self, "initWithHomeIdentifier:options:multiUserService:", v6, a4, v7);

  return v8;
}

- (AMSExportMultiUserStateTask)initWithHomeIdentifier:(id)a3 options:(unint64_t)a4 multiUserService:(id)a5
{
  id v9;
  id v10;
  AMSExportMultiUserStateTask *v11;
  AMSExportMultiUserStateTask *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AMSExportMultiUserStateTask;
  v11 = -[AMSTask init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeIdentifier, a3);
    v12->_options = a4;
    objc_storeStrong((id *)&v12->_multiUserService, a5);
  }

  return v12;
}

- (id)performTask
{
  char v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  AMSPromise *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[AMSExportMultiUserStateTask options](self, "options");
  v4 = -[AMSExportMultiUserStateTask options](self, "options");
  -[AMSExportMultiUserStateTask multiUserService](self, "multiUserService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v3 & 1;
    v7 = objc_alloc_init(AMSPromise);
    -[AMSExportMultiUserStateTask homeIdentifier](self, "homeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v7, "completionHandlerAdapter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exportMultiUserTokenForHomeIdentifier:generateIfMissing:generateIfInvalid:completion:", v9, v6, (v4 >> 1) & 1, v10);

  }
  else
  {
    AMSError(0, CFSTR("Could not create proxy object"), CFSTR("We couldn't create the proxy object."), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v8);
    v7 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (unint64_t)options
{
  return self->_options;
}

- (AMSMultiUserServiceProtocol)multiUserService
{
  return self->_multiUserService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserService, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
}

@end
