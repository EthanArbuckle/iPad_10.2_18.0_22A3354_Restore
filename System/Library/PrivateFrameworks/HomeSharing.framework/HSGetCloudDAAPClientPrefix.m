@implementation HSGetCloudDAAPClientPrefix

void __HSGetCloudDAAPClientPrefix_block_invoke()
{
  __CFString *v0;

  if (MSVDeviceIsAppleTV())
    v0 = CFSTR("ATV-");
  else
    v0 = CFSTR("iOS-");
  objc_storeStrong((id *)&HSGetCloudDAAPClientPrefix_cloudDAAPClientPrefix, v0);
}

@end
