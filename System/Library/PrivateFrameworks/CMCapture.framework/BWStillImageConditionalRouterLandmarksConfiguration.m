@implementation BWStillImageConditionalRouterLandmarksConfiguration

+ (id)landmarksConfiguration
{
  return objc_alloc_init(BWStillImageConditionalRouterLandmarksConfiguration);
}

- (BWStillImageConditionalRouterLandmarksConfiguration)init
{
  BWStillImageConditionalRouterLandmarksConfiguration *v2;
  BWStillImageConditionalRouterLandmarksConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterLandmarksConfiguration;
  v2 = -[BWStillImageConditionalRouterConfiguration initWithNumberOfOutputs:](&v5, sel_initWithNumberOfOutputs_, 2);
  v3 = v2;
  if (v2)
    -[BWStillImageConditionalRouterConfiguration setShouldEmitSampleBufferDecisionProvider:](v2, "setShouldEmitSampleBufferDecisionProvider:", &__block_literal_global_30);
  return v3;
}

uint64_t __59__BWStillImageConditionalRouterLandmarksConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;

  v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v6 = (void *)CMGetAttachment(target, CFSTR("BWStillImageCaptureSettings"), 0);
  v7 = (void *)objc_msgSend(v6, "captureStreamSettingsForPortType:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  if (objc_msgSend(v6, "captureType") == 2)
  {
    v8 = objc_msgSend(v7, "captureFlags");
    v9 = (objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D60]), "BOOLValue") ^ 1) & HIWORD(v8);
    if (!a3)
      return 1;
    goto LABEL_5;
  }
  v9 = 0;
  if (a3)
LABEL_5:
    *a3 = v9;
  return 1;
}

- (unsigned)defaultOutputIndex
{
  return 0;
}

- (unsigned)landmarksOutputIndex
{
  return 1;
}

@end
