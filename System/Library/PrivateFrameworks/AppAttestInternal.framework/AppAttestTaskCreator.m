@implementation AppAttestTaskCreator

+ (id)create
{
  DCBGSTask *v2;

  v2 = -[DCBGSTask initWithTaskIdentifier:observerIdentifier:]([DCBGSTask alloc], "initWithTaskIdentifier:observerIdentifier:", CFSTR("com.apple.devicecheck.notify.attest"), CFSTR("AAACleanupInterval"));
  -[DCBGSTask setTaskHandler:](v2, "setTaskHandler:", &__block_literal_global);
  return v2;
}

void __30__AppAttestTaskCreator_create__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    v2 = a2;
    removeAllKeychainItemsForMissingApps();
    objc_msgSend(v2, "setTaskCompleted");

  }
}

@end
