@implementation AMSGeneratePartialFDSTask

- (AMSGeneratePartialFDSTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSGeneratePartialFDSTask *v9;
  AMSGeneratePartialFDSTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSGeneratePartialFDSTask;
  v9 = -[AMSTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_request, a3);
  }

  return v10;
}

- (ACAccount)account
{
  void *v2;
  void *v3;

  -[AMSGeneratePartialFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (unint64_t)action
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AMSGeneratePartialFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "action");

  return v4;
}

- (NSString)logKey
{
  void *v2;
  void *v3;

  -[AMSGeneratePartialFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)purchaseIdentifier
{
  void *v2;
  void *v3;

  -[AMSGeneratePartialFDSTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchaseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)runTask
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__AMSGeneratePartialFDSTask_runTask__block_invoke;
  v3[3] = &unk_1E253DB80;
  v3[4] = self;
  -[AMSTask performTaskWithPromiseBlock:](self, "performTaskWithPromiseBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __36__AMSGeneratePartialFDSTask_runTask__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSFDSService partialFDSAssessmentForRequest:](AMSFDSService, "partialFDSAssessmentForRequest:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSFDSRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
