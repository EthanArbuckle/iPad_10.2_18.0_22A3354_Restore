@implementation IMSharedMessagePhotosSummary

+ (id)pluginPath
{
  return CFSTR("/System/Library/Messages/iMessageBalloons/HandwritingProvider.bundle");
}

+ (id)previewSummary
{
  return (id)objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("Photo Message"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
}

@end
