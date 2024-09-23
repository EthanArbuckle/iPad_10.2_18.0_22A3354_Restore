@implementation NSBundle(ControlCenterUIPrototyping)

- (uint64_t)ccui_prototypeModuleSize
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeDictionaryForKey:", CFSTR("_CCModuleSizePROTOTYPE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = CCUIMakeLayoutSizeFromDictionary(v2, 1);
  else
    v3 = -1;

  return v3;
}

@end
