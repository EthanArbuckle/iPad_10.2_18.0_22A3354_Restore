@implementation CSSelfTriggerDetectorEnabledPolicyFactory

+ (id)selfTriggerDetectorEnabledPolicy
{
  int v2;
  __objc2_class **v3;

  v2 = objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS");
  v3 = off_1E7C21BB8;
  if (!v2)
    v3 = off_1E7C21BC8;
  return objc_alloc_init(*v3);
}

+ (id)studioDisplaySelfTriggerEnabledPolicy
{
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportRemoteDarwinVoiceTrigger"))
    return objc_alloc_init(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy);
  else
    return 0;
}

+ (id)selfTriggerDetectorEnabledPolicyWithAudioSourceType:(unint64_t)a3
{
  CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS *v3;

  if (a3 == 1)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "supportAudioTappingSelfTrigger")
      && CSIsIOS()
      && (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) == 0)
    {
      v3 = objc_alloc_init(CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS);
      return v3;
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    v3 = 0;
    return v3;
  }
  +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicy](CSSelfTriggerDetectorEnabledPolicyFactory, "selfTriggerDetectorEnabledPolicy");
  v3 = (CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS *)objc_claimAutoreleasedReturnValue();
  return v3;
}

@end
