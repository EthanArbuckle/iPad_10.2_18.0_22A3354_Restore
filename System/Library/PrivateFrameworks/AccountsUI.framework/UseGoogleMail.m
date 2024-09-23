@implementation UseGoogleMail

void ____UseGoogleMail_block_invoke()
{
  const __CFBoolean *BOOLean;

  BOOLean = (const __CFBoolean *)MGCopyAnswer();
  if (BOOLean)
  {
    __UseGoogleMail__useGoogleMail = CFBooleanGetValue(BOOLean) != 0;
    CFRelease(BOOLean);
  }
}

@end
