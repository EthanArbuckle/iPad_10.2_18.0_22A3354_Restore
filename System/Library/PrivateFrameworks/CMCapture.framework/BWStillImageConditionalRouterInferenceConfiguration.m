@implementation BWStillImageConditionalRouterInferenceConfiguration

- (unsigned)inferenceOuputIndex
{
  return 1;
}

- (unsigned)defaultOutputIndex
{
  return 0;
}

+ (id)inferenceConfiguration
{
  return objc_alloc_init(BWStillImageConditionalRouterInferenceConfiguration);
}

- (BWStillImageConditionalRouterInferenceConfiguration)init
{
  BWStillImageConditionalRouterInferenceConfiguration *v2;
  BWStillImageConditionalRouterInferenceConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWStillImageConditionalRouterInferenceConfiguration;
  v2 = -[BWStillImageConditionalRouterConfiguration initWithNumberOfOutputs:](&v5, sel_initWithNumberOfOutputs_, 2);
  v3 = v2;
  if (v2)
    -[BWStillImageConditionalRouterConfiguration setShouldEmitSampleBufferDecisionProvider:](v2, "setShouldEmitSampleBufferDecisionProvider:", &__block_literal_global_71);
  return v3;
}

uint64_t __59__BWStillImageConditionalRouterInferenceConfiguration_init__block_invoke(int a1, CMAttachmentBearerRef target, int *a3)
{
  void *v5;
  __int16 v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  char v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v6 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntegerValue");
  v7 = v6 & 0x400;
  v8 = v6 & 0x1000;
  v9 = objc_msgSend((id)CMGetAttachment(target, CFSTR("HasUnreliableBracketingMetadata"), 0), "BOOLValue");
  v10 = (void *)CMGetAttachment(target, CFSTR("BWStillImageCaptureSettings"), 0);
  if (objc_msgSend(v10, "captureType") == 1 || objc_msgSend(v10, "captureType") == 2)
  {
    if (((v9 | (v7 >> 10) | (v8 >> 12)) & 1) != 0)
    {
      v11 = 1;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v12 = objc_msgSend(v10, "captureType");
  if (v12 == 7)
    v13 = v9 | (v7 >> 10) | (v8 >> 12);
  else
    v13 = 1;
  if (v12 == 7)
    v11 = 1;
  else
    v11 = v9 | (v7 >> 10) | (v8 >> 12);
  if ((v13 & 1) == 0)
LABEL_12:
    v11 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UB")) != 0;
LABEL_13:
  if (dword_1ECFE9870)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3)
    *a3 = v11;
  return 1;
}

@end
