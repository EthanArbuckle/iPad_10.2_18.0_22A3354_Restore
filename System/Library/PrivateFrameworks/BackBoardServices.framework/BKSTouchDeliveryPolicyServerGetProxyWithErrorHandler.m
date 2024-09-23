@implementation BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler

void __BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_block_invoke()
{
  _BKSTouchDeliveryPolicyConcreteServerInterface *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(_BKSTouchDeliveryPolicyConcreteServerInterface);
  v1 = (void *)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server;
  BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server = (uint64_t)v0;

  if (!BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need a server instance"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BKSTouchDeliveryPolicyServerInterface> BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler(void (^__strong)(NSError *__strong))_block_invoke");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138544130;
      v5 = v3;
      v6 = 2114;
      v7 = CFSTR("BKSTouchDeliveryPolicyServerInterface.m");
      v8 = 1024;
      v9 = 70;
      v10 = 2114;
      v11 = v2;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v4, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10CB0CLL);
  }
}

@end
