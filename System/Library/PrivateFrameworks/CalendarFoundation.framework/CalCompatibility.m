@implementation CalCompatibility

+ (BOOL)isProgramSDKAtLeast:(id)a3
{
  if ((objc_msgSend(a1, "simulateLegacyBehaviors") & 1) != 0)
    return 0;
  else
    return dyld_program_sdk_at_least();
}

+ (void)performWhileSimulatingLegacyBehaviors:(id)a3
{
  objc_msgSend(a1, "perform:whileSimulatingLegacyBehaviors:", a3, 1);
}

+ (void)perform:(id)a3 whileSimulatingLegacyBehaviors:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void (**v7)(void);

  v4 = a4;
  v7 = (void (**)(void))a3;
  v6 = objc_msgSend(a1, "simulateLegacyBehaviors");
  objc_msgSend(a1, "setSimulateLegacyBehaviors:", v4);
  v7[2]();
  objc_msgSend(a1, "setSimulateLegacyBehaviors:", v6);

}

+ (BOOL)simulateLegacyBehaviors
{
  return _simulateLegacyBehaviors;
}

+ (void)setSimulateLegacyBehaviors:(BOOL)a3
{
  _simulateLegacyBehaviors = a3;
}

@end
