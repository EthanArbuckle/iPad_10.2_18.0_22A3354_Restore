@implementation UIColorEffect

+ (id)inCallControls
{
  return static UIColorEffect.inCallControls.getter();
}

+ (id)inCallControlsButtonAvatarOnly
{
  return static UIColorEffect.inCallControlsButtonNoPhotoNoAvatar.getter();
}

+ (id)inCallControlsKeypadButton
{
  return static UIColorEffect.inCallControlsKeypadButton.getter();
}

+ (id)inCallControlsEmergencyCallButton
{
  return static UIColorEffect.inCallControlsEmergencyCallButton.getter();
}

@end
