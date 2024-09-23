@implementation HAP2AccessoryServerSecureTransportPairSetup

- (HAP2AccessoryServerSecureTransportPairSetup)initWithTransport:(id)a3 operationQueue:(id)a4 encryptedSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  HAP2AccessoryServerSecureTransportPairSetup *v14;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (const char *)HAPDispatchQueueName(self, CFSTR("delegateQueue"));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create(v11, v12);

  v16.receiver = self;
  v16.super_class = (Class)HAP2AccessoryServerSecureTransportPairSetup;
  v14 = -[HAP2AccessoryServerSecureTransportBase initWithOperationQueue:delegateQueue:transport:encryptedSession:](&v16, sel_initWithOperationQueue_delegateQueue_transport_encryptedSession_, v10, v13, v8, v9);

  if (v14)
    objc_msgSend(v8, "setDelegate:", v14);

  return v14;
}

- (void)transport:(id)a3 didReceiveEvent:(id)a4
{
  NSObject *v5;
  int v6;
  HAP2AccessoryServerSecureTransportPairSetup *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%@ Unexpected event received", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)defaultEncryptedSession
{
  return (id)objc_opt_new();
}

@end
