@implementation AppleDeviceQueryBasebandConnectionArmory

+ (id)getCoreTelephonyClient
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v9;

  if (objc_opt_class())
  {
    if (getCoreTelephonyClient_aToken != -1)
      dispatch_once(&getCoreTelephonyClient_aToken, &__block_literal_global);
    dispatch_semaphore_wait((dispatch_semaphore_t)getCoreTelephonyClient_aSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (!getCoreTelephonyClient__client)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2818]), "initWithQueue:", 0);
      v6 = (void *)getCoreTelephonyClient__client;
      getCoreTelephonyClient__client = v5;

    }
    dispatch_semaphore_signal((dispatch_semaphore_t)getCoreTelephonyClient_aSemaphore);
    v7 = (id)getCoreTelephonyClient__client;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[AppleDeviceQueryBasebandConnectionArmory getCoreTelephonyClient]", 101, CFSTR("Failed to weak link core telephony client framework!"), v2, v3, v4, v9);
    v7 = 0;
  }
  return v7;
}

void __66__AppleDeviceQueryBasebandConnectionArmory_getCoreTelephonyClient__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)getCoreTelephonyClient_aSemaphore;
  getCoreTelephonyClient_aSemaphore = (uint64_t)v0;

}

+ (__CTServerConnection)getCTServerConnection
{
  void *v2;

  if (getCTServerConnection_aToken != -1)
    dispatch_once(&getCTServerConnection_aToken, &__block_literal_global_3);
  dispatch_semaphore_wait((dispatch_semaphore_t)getCTServerConnection_aSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (!getCTServerConnection__connection)
  {
    dispatch_get_global_queue(0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    getCTServerConnection__connection = _CTServerConnectionCreateOnTargetQueue();

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)getCTServerConnection_aSemaphore);
  CFRetain((CFTypeRef)getCTServerConnection__connection);
  return (__CTServerConnection *)getCTServerConnection__connection;
}

void __65__AppleDeviceQueryBasebandConnectionArmory_getCTServerConnection__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)getCTServerConnection_aSemaphore;
  getCTServerConnection_aSemaphore = (uint64_t)v0;

}

@end
