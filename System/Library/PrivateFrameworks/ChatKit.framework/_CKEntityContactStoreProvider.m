@implementation _CKEntityContactStoreProvider

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___CKEntityContactStoreProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, block);
  return (id)sharedInstance_sharedInstance_0;
}

- (id)contactStore
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getContactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
