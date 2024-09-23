@implementation VCViewpointCorrection

intptr_t __VCViewpointCorrection_CorrectViewpoint_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40))
    FigCFDictionaryGetBooleanIfPresent();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (VCViewpointCorrection)init
{
  VCViewpointCorrection *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCViewpointCorrection;
  v2 = -[VCViewpointCorrection init](&v7, sel_init);
  if (v2)
  {
    if (loadAppleCVAViewpointCorrectionSymbols_onceToken != -1)
      dispatch_once(&loadAppleCVAViewpointCorrectionSymbols_onceToken, &__block_literal_global_5);
    if (loadAppleCVAViewpointCorrectionSymbols_loaded != 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCViewpointCorrection init].cold.2();
      }
      goto LABEL_12;
    }
    v6 = 0;
    v2->_viewpointCorrectionRef = (CVAViewpointCorrection *)sVC_CVAViewpointCorrectionCreateFunc(*MEMORY[0x1E0C9AE00], 0, &v6);
    if (v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCViewpointCorrection init].cold.1(v3, (uint64_t)&v6, v4);
      }
LABEL_12:

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  CVAViewpointCorrection *viewpointCorrectionRef;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  viewpointCorrectionRef = self->_viewpointCorrectionRef;
  if (viewpointCorrectionRef)
    CFRelease(viewpointCorrectionRef);
  v4.receiver = self;
  v4.super_class = (Class)VCViewpointCorrection;
  -[VCViewpointCorrection dealloc](&v4, sel_dealloc);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not load AppleCVA Viewpoint Correction symbols", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
