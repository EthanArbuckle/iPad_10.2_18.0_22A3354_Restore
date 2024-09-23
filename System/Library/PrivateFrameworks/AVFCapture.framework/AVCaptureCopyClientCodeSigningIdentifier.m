@implementation AVCaptureCopyClientCodeSigningIdentifier

void __AVCaptureCopyClientCodeSigningIdentifier_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    AVCaptureCopyClientCodeSigningIdentifier_sClientCodeSigningIdentifier = (uint64_t)SecTaskCopySigningIdentifier(v0, 0);
    CFRelease(v1);
  }
}

@end
