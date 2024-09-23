@implementation CRKEmptySubscription

+ (id)errorSubscriptionWithReason:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  if (_CRKLogGeneral_onceToken_13 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_13, &__block_literal_global_51);
  v4 = _CRKLogGeneral_logObj_13;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_13, OS_LOG_TYPE_ERROR))
    +[CRKEmptySubscription errorSubscriptionWithReason:].cold.1((uint64_t)v3, v4);
  v5 = (void *)objc_opt_new();

  return v5;
}

+ (void)errorSubscriptionWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Creating empty subscription for reason: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
