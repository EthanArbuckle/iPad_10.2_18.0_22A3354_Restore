@implementation MTVisualStylingProvider(ControlCenterAdditionsPrivate)

- (uint64_t)_controlCenterKeyLineOnLightVisualStyling
{
  return objc_msgSend(a1, "_visualStylingForStyleNamed:", CFSTR("moduleRuleOnLight"));
}

- (uint64_t)_controlCenterPrimaryOnLightVisualStyling
{
  return objc_msgSend(a1, "_visualStylingForStyleNamed:", CFSTR("modulePrimaryOnLight"));
}

- (uint64_t)_controlCenterSecondaryOnLightVisualStyling
{
  return objc_msgSend(a1, "_visualStylingForStyleNamed:", CFSTR("moduleSecondaryOnLight"));
}

- (uint64_t)_controlCenterScrollViewDarkeningVisualStyling
{
  return objc_msgSend(a1, "_visualStylingForStyleNamed:", CFSTR("moduleListTint"));
}

@end
