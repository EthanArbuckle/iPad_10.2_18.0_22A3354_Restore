@implementation CSBuiltInVoiceTriggerEnabledPolicy

+ (id)builtInVoiceTriggerEnabledPolicy
{
  __objc2_class **v2;
  int v3;

  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
  {
    v2 = off_1E7C21E20;
  }
  else if ((CSIsHorseman() & 1) != 0)
  {
    v2 = off_1E7C21E30;
  }
  else
  {
    v3 = CSHasAOP();
    v2 = &off_1E7C21E38;
    if (v3)
      v2 = off_1E7C21E18;
  }
  return objc_alloc_init(*v2);
}

@end
