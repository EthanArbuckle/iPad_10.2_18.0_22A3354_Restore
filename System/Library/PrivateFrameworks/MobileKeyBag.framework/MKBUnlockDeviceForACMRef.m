@implementation MKBUnlockDeviceForACMRef

void __MKBUnlockDeviceForACMRef_block_invoke(uint64_t a1)
{
  id v2;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Event:", *(unsigned int *)(a1 + 32));

}

@end
