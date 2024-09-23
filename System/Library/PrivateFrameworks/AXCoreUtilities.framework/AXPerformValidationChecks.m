@implementation AXPerformValidationChecks

void __AXPerformValidationChecks_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(getAXSettingsClass_0(), "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "appValidationTestingMode"))
  {
    AXPerformValidationChecks_CachedSetting = 1;
  }
  else
  {
    objc_msgSend(getAXSettingsClass_0(), "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v0, "shouldPerformValidationsAtRuntime") & 1) != 0)
    {
      AXPerformValidationChecks_CachedSetting = 1;
    }
    else
    {
      objc_msgSend(getAXSettingsClass_0(), "sharedInstance");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      AXPerformValidationChecks_CachedSetting = objc_msgSend(v1, "isAXValidationRunnerCollectingValidations");

    }
  }

}

@end
