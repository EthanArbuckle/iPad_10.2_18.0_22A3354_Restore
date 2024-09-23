@implementation HMCameraUserSettings(HUAdditions)

- (__CFString)hu_indicatorImageNameForCurrentAccessMode
{
  __CFString *v2;

  if (objc_msgSend(a1, "currentAccessMode") == 2)
  {
    objc_msgSend(a1, "hu_indicatorImageNameForLiveStreaming");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("circle.fill");
  }
  return v2;
}

- (id)hu_indicatorColorForCurrentAccessMode
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "currentAccessMode");
  switch((unint64_t)v1)
  {
    case 0uLL:
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v1;
  }
  return v1;
}

- (uint64_t)hu_indicatorColorForLiveStreaming
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
}

- (const)hu_indicatorImageNameForLiveStreaming
{
  if (UIAccessibilityShouldDifferentiateWithoutColor())
    return CFSTR("triangle.fill");
  else
    return CFSTR("circle.fill");
}

- (const)hu_currentAccessModeDescription
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "currentAccessMode");
  if ((unint64_t)(v1 - 1) > 2)
    return CFSTR("Off");
  else
    return off_1E6F58AB8[v1 - 1];
}

@end
