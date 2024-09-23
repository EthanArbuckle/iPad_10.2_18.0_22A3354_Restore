@implementation HFTriggerBuilder(AutomationBuilders)

- (BOOL)supportsHomeKitAutomationBuilders
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HFTriggerBuilder trigger](self, "trigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_copyAsBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 0;
  }
  -[HFItemBuilder home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "areAutomationBuildersSupported");

  return v8;
}

@end
