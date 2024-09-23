@implementation BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration

- (unsigned)personSegmentationAndMattingOuputIndex
{
  return 1;
}

- (unsigned)defaultOutputIndex
{
  return 0;
}

+ (id)personSegmentationAndMattingConfiguration
{
  return objc_alloc_init(BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration);
}

- (BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration)init
{
  BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration *v2;
  BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration;
  v2 = -[BWStillImageConditionalRouterConfiguration initWithNumberOfOutputs:](&v5, sel_initWithNumberOfOutputs_, 2);
  v3 = v2;
  if (v2)
    -[BWStillImageConditionalRouterConfiguration setShouldEmitSampleBufferDecisionProvider:](v2, "setShouldEmitSampleBufferDecisionProvider:", &__block_literal_global_39);
  return v3;
}

uint64_t __78__BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, int *a3)
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  char HasDetectedFaces;
  char v9;
  char v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v12;

  v5 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
  if (v5)
  {
    v6 = v5;
    v7 = (objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "portraitEffectsMatteDeliveryEnabled") & 1) != 0
      || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count") != 0;
    HasDetectedFaces = BWSampleBufferHasDetectedFaces(target, 0, 0, 1, -[FigCaptureCameraParameters complementMatteSuppressionDecisionWithISPDetectedFaces](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "complementMatteSuppressionDecisionWithISPDetectedFaces"), 1);
    if ((BWStillImageProcessingFlagsForSampleBuffer(target) & 0x200000) != 0)
      v9 = 0;
    else
      v9 = HasDetectedFaces;
    if (v7)
      v10 = v9;
    else
      v10 = 0;
    if (dword_1ECFE9870)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ((v10 & 1) != 0)
    {
      v12 = 1;
      if (!a3)
        return 1;
      goto LABEL_18;
    }
  }
  else
  {
    FigDebugAssert3();
  }
  BWSampleBufferRemoveAttachedMedia(target, 0x1E49511B8);
  v12 = 0;
  if (a3)
LABEL_18:
    *a3 = v12;
  return 1;
}

@end
