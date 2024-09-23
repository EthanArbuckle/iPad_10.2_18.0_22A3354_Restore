@implementation ASDRepairApplicationRequest

- (ASDRepairApplicationRequest)initWithOptions:(id)a3
{
  id v4;
  ASDRepairApplicationRequest *v5;
  ASDRepairOptions *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ASDRepairOptions *options;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDRepairApplicationRequest;
  v5 = -[ASDRepairApplicationRequest init](&v12, sel_init);
  if (v5)
  {
    v6 = [ASDRepairOptions alloc];
    objc_msgSend(v4, "bundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ASDRepairOptions initWithBundleID:accountIdentifier:claimStyle:](v6, "initWithBundleID:accountIdentifier:claimStyle:", v7, v8, objc_msgSend(v4, "claimStyle"));
    options = v5->_options;
    v5->_options = (ASDRepairOptions *)v9;

  }
  return v5;
}

- (void)sendRequestWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ASDRepairService defaultService](ASDRepairService, "defaultService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repairAppWithOptions:replyHandler:", self->_options, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
