@implementation SFTelephonyURLRequest

- (SFTelephonyURLRequest)initWithCompletionHandler:(id)a3
{
  id v4;
  SFTelephonyURLRequest *v5;
  uint64_t v6;
  id completionHandler;
  void *v8;
  uint64_t v9;
  NSString *successNotificationName;
  void *v11;
  uint64_t v12;
  NSString *failureNotificationName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFTelephonyURLRequest;
  v5 = -[SFTelephonyURLRequest init](&v15, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1A8598C40](v4);
    completionHandler = v5->_completionHandler;
    v5->_completionHandler = (id)v6;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    successNotificationName = v5->_successNotificationName;
    v5->_successNotificationName = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    failureNotificationName = v5->_failureNotificationName;
    v5->_failureNotificationName = (NSString *)v12;

  }
  return v5;
}

- (NSString)successNotificationName
{
  return self->_successNotificationName;
}

- (void)setSuccessNotificationName:(id)a3
{
  objc_storeStrong((id *)&self->_successNotificationName, a3);
}

- (NSString)failureNotificationName
{
  return self->_failureNotificationName;
}

- (void)setFailureNotificationName:(id)a3
{
  objc_storeStrong((id *)&self->_failureNotificationName, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_failureNotificationName, 0);
  objc_storeStrong((id *)&self->_successNotificationName, 0);
}

@end
