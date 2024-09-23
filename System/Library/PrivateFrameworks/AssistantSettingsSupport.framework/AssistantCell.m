@implementation AssistantCell

+ (int64_t)cellStyle
{
  return 0;
}

+ (id)bundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)bundle_sAssistantBundle_1;
  if (!bundle_sAssistantBundle_1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)bundle_sAssistantBundle_1;
    bundle_sAssistantBundle_1 = v3;

    v2 = (void *)bundle_sAssistantBundle_1;
  }
  return v2;
}

- (BOOL)canReload
{
  return 1;
}

@end
