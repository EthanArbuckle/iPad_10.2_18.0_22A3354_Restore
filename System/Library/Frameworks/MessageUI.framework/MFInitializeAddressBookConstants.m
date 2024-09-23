@implementation MFInitializeAddressBookConstants

void __MFInitializeAddressBookConstants_block_invoke()
{
  ABRecordRef v0;

  v0 = ABPersonCreate();
  CFRelease(v0);
}

@end
