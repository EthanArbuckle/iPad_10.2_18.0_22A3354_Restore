@implementation IMSharedMessageHandwritingSummary

+ (id)pluginPath
{
  return CFSTR("/System/Library/Messages/iMessageBalloons/HandwritingProvider.bundle");
}

+ (id)previewSummary
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___IMSharedMessageHandwritingSummary;
  v2 = objc_msgSendSuper2(&v4, sel_previewSummary);
  if (!objc_msgSend(v2, "length"))
    return (id)objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("Handwritten Message"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
  return v2;
}

@end
