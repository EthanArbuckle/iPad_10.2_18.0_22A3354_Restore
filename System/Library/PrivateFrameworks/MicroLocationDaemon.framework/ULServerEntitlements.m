@implementation ULServerEntitlements

+ (BOOL)allowConnection:(id)a3
{
  return objc_msgSend(a1, "_checkEntitlement:forConnection:", CFSTR("com.apple.microlocation.connection"), a3);
}

+ (BOOL)allowPrivateDataAccess:(id)a3
{
  return objc_msgSend(a1, "_checkEntitlement:forConnection:", CFSTR("com.apple.microlocation.private_info"), a3);
}

+ (BOOL)_checkEntitlement:(id)a3 forConnection:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "hasBooleanEntitlement:", v5);
  if ((v7 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_71);
    v8 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      objc_msgSend(v6, "signingIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_ERROR, "Missing entitlement: %@ is missing required entitlement: %@, rejecting connection.", (uint8_t *)&v12, 0x16u);

    }
  }

  return v7;
}

@end
