@implementation AROrientationTrackingConfiguration

- (AROrientationTrackingConfiguration)init
{
  AROrientationTrackingConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AROrientationTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v4, sel_initPrivate);
  if (v2 && ARShouldSupport1440pAndAutofocus())
    -[ARConfiguration setAutoFocusEnabled:](v2, "setAutoFocusEnabled:", 1);
  return v2;
}

+ (id)supportedVideoFormats
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD block[5];

  if (supportedVideoFormats_supportedFormats_1 && !objc_msgSend((id)supportedVideoFormats_supportedFormats_1, "count"))
  {
    objc_msgSend(a1, "_querySupportedVideoFormats");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)supportedVideoFormats_supportedFormats_1;
    supportedVideoFormats_supportedFormats_1 = v3;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedVideoFormats_onceToken_2 != -1)
    dispatch_once(&supportedVideoFormats_onceToken_2, block);
  v5 = (id)supportedVideoFormats_supportedFormats_1;
  if ((objc_msgSend((id)objc_opt_class(), "shouldProvideX420VideoFormat") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_46);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  if ((objc_msgSend((id)objc_opt_class(), "shouldProvideNonBinnedVideoFormats") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  return v5;
}

void __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_querySupportedVideoFormats");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)supportedVideoFormats_supportedFormats_1;
  supportedVideoFormats_supportedFormats_1 = v1;

}

uint64_t __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isX420PixelFormat") ^ 1;
}

uint64_t __59__AROrientationTrackingConfiguration_supportedVideoFormats__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "deviceFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVideoBinned");

  return v3;
}

+ (id)_querySupportedVideoFormats
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  +[ARVideoFormat supportedVideoFormatsForDevicePosition:deviceType:](ARVideoFormat, "supportedVideoFormatsForDevicePosition:deviceType:", 1, *MEMORY[0x1E0C89FA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  if (ARLinkedOnOrAfterSydney())
  {
    +[ARVideoFormat supportedVideoFormatsForStillImageCapture](ARVideoFormat, "supportedVideoFormatsForStillImageCapture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v4);

    +[ARVideoFormat supportedVideoFormatsForHiResOrX420](ARVideoFormat, "supportedVideoFormatsForHiResOrX420");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v5);

  }
  return v2;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatFor4KResolution](ARWorldTrackingConfiguration, "recommendedVideoFormatFor4KResolution");
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatForHighResolutionFrameCapturing](ARWorldTrackingConfiguration, "recommendedVideoFormatForHighResolutionFrameCapturing");
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ARConfiguration isAutoFocusEnabled](self, "isAutoFocusEnabled");
  v8 = CFSTR("Disabled");
  if (v7)
    v8 = CFSTR("Enabled");
  objc_msgSend(v6, "appendFormat:", CFSTR(" autoFocus=%@"), v8);
  -[ARConfiguration descriptionWithoutBrackets](self, "descriptionWithoutBrackets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

@end
