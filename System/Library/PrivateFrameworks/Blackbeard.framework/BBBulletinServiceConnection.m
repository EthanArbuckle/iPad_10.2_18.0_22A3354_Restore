@implementation BBBulletinServiceConnection

+ (id)sharedBulletinServiceWithDelegate:(id)a3
{
  if (sharedBulletinServiceWithDelegate__onceToken[0] != -1)
    dispatch_once(sharedBulletinServiceWithDelegate__onceToken, &__block_literal_global);
  return (id)sharedBulletinServiceWithDelegate__service;
}

void __65__BBBulletinServiceConnection_sharedBulletinServiceWithDelegate___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BBBulletinService initNoop]([BBBulletinService alloc], "initNoop");
  v1 = (void *)sharedBulletinServiceWithDelegate__service;
  sharedBulletinServiceWithDelegate__service = (uint64_t)v0;

}

@end
