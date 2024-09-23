@implementation AVTAvatarPose(AvatarUI)

- (const)_avtui_identifier
{
  if ((objc_msgSend(a1, "isNeutralPose") & 1) != 0)
    return CFSTR("neutral");
  if (objc_msgSend(a1, "isFriendlyPose"))
    return CFSTR("friendly2");
  return CFSTR("custom");
}

@end
