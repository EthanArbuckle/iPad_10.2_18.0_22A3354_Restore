@implementation CSVoiceTriggerAOPModeEnabledPolicyFactory

+ (id)voiceTriggerAOPModeEnabledPolicy
{
  int v2;
  Class *v3;

  v2 = objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS");
  v3 = (Class *)0x1E0D18FB0;
  if (!v2)
    v3 = (Class *)&off_1E7C21DB8;
  return objc_alloc_init(*v3);
}

@end
