@implementation UIApplication(PhotoBoothCategory)

- (uint64_t)accessibilityStartStopToggle
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("_photoBoothController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("_effectsController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "takePicture:", 0);

  return 1;
}

@end
