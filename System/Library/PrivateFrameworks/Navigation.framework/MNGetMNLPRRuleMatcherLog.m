@implementation MNGetMNLPRRuleMatcherLog

void __MNGetMNLPRRuleMatcherLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNLPRRuleMatcher");
  v1 = (void *)_MergedGlobals_26;
  _MergedGlobals_26 = (uint64_t)v0;

}

@end
