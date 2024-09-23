@implementation AVCaptureIsRunningInXCTest

void __AVCaptureIsRunningInXCTest_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  CFIndex Length;
  CFIndex v3;
  const __CFString *v4;
  CFRange v5;
  BOOL v6;
  char v7;

  v0 = AVCaptureCopyClientCodeSigningIdentifier();
  if (v0)
  {
    v1 = v0;
    Length = CFStringGetLength(v0);
    v3 = Length;
    if (Length <= 63)
    {
      if (Length == 16)
      {
        v4 = CFSTR("com.apple.xctest");
        goto LABEL_14;
      }
      if (Length == 24)
      {
        v4 = CFSTR("com.apple.dt.xctest.tool");
        goto LABEL_14;
      }
    }
    else
    {
      switch(Length)
      {
        case '@':
          v4 = CFSTR("com.apple.avfoundation.AVFCaptureTests-Embedded-Runner.xctrunner");
          goto LABEL_14;
        case 'D':
          v4 = CFSTR("com.apple.avfoundation.AVFoundation-OSX-Capture-Unit-Tests.xctrunner");
          goto LABEL_14;
        case 'L':
          v4 = CFSTR("com.apple.avfoundation.AVFoundation-macCatalyst-Capture-Unit-Tests.xctrunner");
LABEL_14:
          v5 = CFStringFind(v1, v4, 0);
          if (v5.location)
            v6 = 0;
          else
            v6 = v5.length == v3;
          v7 = v6;
          AVCaptureIsRunningInXCTest_sAnswer = v7;
          break;
      }
    }
    CFRelease(v1);
  }
}

@end
