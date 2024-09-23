@implementation SMSScreenshotTestInfo

+ (BOOL)isValidScreenshotTestName:(id)a3
{
  return +[SMSScreenshotTestInfo screenshotTestNameEnumValue:](SMSScreenshotTestInfo, "screenshotTestNameEnumValue:", a3) != -1;
}

+ (int64_t)screenshotTestNameEnumValue:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SMSApplicationTranscriptOnly")) - 1;
}

+ (id)screenshotTestName_IsolatedTranscriptUI
{
  return CFSTR("SMSApplicationTranscriptOnly");
}

@end
