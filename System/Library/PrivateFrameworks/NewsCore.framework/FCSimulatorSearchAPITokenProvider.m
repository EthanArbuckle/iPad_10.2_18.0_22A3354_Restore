@implementation FCSimulatorSearchAPITokenProvider

+ (id)apiToken
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (FeldsparCoreInternalExtrasEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "fc_feldsparCoreInternalExtrasBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "load");

    objc_msgSend(MEMORY[0x1E0CB34D0], "fc_feldsparCoreInternalExtrasBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "classNamed:", CFSTR("FCSimulatorSearchAPITokenProvider_Internal"));

    objc_msgSend(v4, "apiToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
