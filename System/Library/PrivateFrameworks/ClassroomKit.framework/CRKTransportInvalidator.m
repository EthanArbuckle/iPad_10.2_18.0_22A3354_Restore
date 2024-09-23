@implementation CRKTransportInvalidator

+ (void)invalidateTransport:(id)a3
{
  id v4;
  void *v5;
  CRKInvalidateTransportOperation *v6;

  v4 = a3;
  v6 = -[CRKInvalidateTransportOperation initWithTransport:]([CRKInvalidateTransportOperation alloc], "initWithTransport:", v4);

  -[CRKInvalidateTransportOperation addTarget:selector:forOperationEvents:](v6, "addTarget:selector:forOperationEvents:", a1, sel_invalidateTransportOperationDidFinish_, 6);
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v6);

}

+ (void)invalidateTransportOperationDidFinish:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (_CRKLogGeneral_onceToken_4 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_4, &__block_literal_global_19);
    v4 = (void *)_CRKLogGeneral_logObj_4;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_4, OS_LOG_TYPE_ERROR))
      +[CRKTransportInvalidator invalidateTransportOperationDidFinish:].cold.1(v4, v3);
  }

}

+ (void)invalidateTransportOperationDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Transport invalidator failed to invalidate transport: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
