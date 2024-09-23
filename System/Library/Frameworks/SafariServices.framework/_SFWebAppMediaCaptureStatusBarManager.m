@implementation _SFWebAppMediaCaptureStatusBarManager

+ (_SFWebAppMediaCaptureStatusBarManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_15);
  return (_SFWebAppMediaCaptureStatusBarManager *)(id)sharedManager_sharedInstance;
}

- (id)statusString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMediaCaptureStatusBarManager simplifiedURLString](self, "simplifiedURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)overrideStyleForAudioOnly:(BOOL)a3
{
  if (a3)
    return 0x4000000;
  else
    return 0x2000000;
}

@end
