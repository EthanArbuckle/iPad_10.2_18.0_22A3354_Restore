@implementation MBIsInternalInstall

void __MBIsInternalInstall_block_invoke()
{
  void *v0;

  v0 = (void *)MGCopyAnswer();
  MBIsInternalInstall_sMBIsInternalInstall = objc_msgSend(v0, "BOOLValue");
  if (v0)
    CFRelease(v0);
}

@end
