@implementation AVCaptureIsRunningInMediaserverd

void __AVCaptureIsRunningInMediaserverd_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  CFRange v2;
  BOOL v3;
  char v4;

  v0 = AVCaptureCopyClientCodeSigningIdentifier();
  if (v0)
  {
    v1 = v0;
    if (CFStringGetLength(v0) == 22)
    {
      v2 = CFStringFind(v1, CFSTR("com.apple.mediaserverd"), 0);
      if (v2.location)
        v3 = 0;
      else
        v3 = v2.length == 22;
      v4 = v3;
      AVCaptureIsRunningInMediaserverd_sAnswer = v4;
    }
    CFRelease(v1);
  }
}

@end
