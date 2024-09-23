@implementation AXLogShouldIncludeBacktrace

void ___AXLogShouldIncludeBacktrace_block_invoke()
{
  void *v0;

  objc_msgSend(getAXSettingsClass_1(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerUpdateBlock:forRetrieveSelector:withListener:", &__block_literal_global_31_0, sel_includeBacktraceInLogs, 0);

  ___AXLogShouldIncludeBacktrace_block_invoke_2();
}

void ___AXLogShouldIncludeBacktrace_block_invoke_2()
{
  id v0;

  objc_msgSend(getAXSettingsClass_1(), "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _AXLogShouldIncludeBacktrace_IncludeBacktraceInLogs = objc_msgSend(v0, "includeBacktraceInLogs");

}

@end
