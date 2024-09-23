@implementation MFAAIsDeveloperBuild

void __MFAAIsDeveloperBuild_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    gbIsDeveloperBuild = CFEqual(v0, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
}

@end
