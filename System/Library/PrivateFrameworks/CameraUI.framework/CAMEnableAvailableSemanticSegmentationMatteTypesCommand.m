@implementation CAMEnableAvailableSemanticSegmentationMatteTypesCommand

- (CAMEnableAvailableSemanticSegmentationMatteTypesCommand)init
{
  CAMEnableAvailableSemanticSegmentationMatteTypesCommand *v2;
  CAMEnableAvailableSemanticSegmentationMatteTypesCommand *v3;
  CAMEnableAvailableSemanticSegmentationMatteTypesCommand *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMEnableAvailableSemanticSegmentationMatteTypesCommand;
  v2 = -[CAMCaptureCommand initWithSubcommands:](&v6, sel_initWithSubcommands_, 0);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMEnableAvailableSemanticSegmentationMatteTypesCommand;
  return -[CAMCaptureCommand copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)executeWithContext:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "currentStillImageOutput");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableSemanticSegmentationMatteTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "setEnabledSemanticSegmentationMatteTypes:", v3);

}

@end
