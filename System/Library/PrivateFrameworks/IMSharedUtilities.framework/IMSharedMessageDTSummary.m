@implementation IMSharedMessageDTSummary

+ (id)pluginPath
{
  return CFSTR("/System/Library/Messages/iMessageBalloons/DigitalTouchBalloonProvider.bundle");
}

+ (id)previewSummary
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___IMSharedMessageDTSummary;
  v2 = objc_msgSendSuper2(&v4, sel_previewSummary);
  if (!objc_msgSend(v2, "length"))
    return (id)objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("Digital Touch Message"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
  return v2;
}

@end
