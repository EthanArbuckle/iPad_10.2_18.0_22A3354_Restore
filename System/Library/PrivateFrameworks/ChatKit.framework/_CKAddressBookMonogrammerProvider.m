@implementation _CKAddressBookMonogrammerProvider

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___CKAddressBookMonogrammerProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, block);
  return (id)sharedInstance_sharedInstance_3;
}

- (id)monogrammerForStyle:(int64_t)a3 diameter:(double)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", a3, a4);
}

@end
