@implementation PSVoiceTriggerRootController

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isiPad"))
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

@end
