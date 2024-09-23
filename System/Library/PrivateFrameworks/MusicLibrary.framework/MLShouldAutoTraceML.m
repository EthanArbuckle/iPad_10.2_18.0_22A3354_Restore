@implementation MLShouldAutoTraceML

void ___MLShouldAutoTraceML_block_invoke()
{
  char *v0;
  int v1;
  id v2;

  v0 = getenv("SQLITE_AUTO_TRACE_ML");
  if (!v0)
  {
    _MLShouldAutoTraceML_shouldAutoTraceML = 0;
    goto LABEL_5;
  }
  v1 = strcmp(v0, "1");
  _MLShouldAutoTraceML_shouldAutoTraceML = v1 == 0;
  if (v1)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _MLShouldAutoTraceML_shouldAutoTraceML = objc_msgSend(v2, "BOOLForKey:", CFSTR("SQLITE_AUTO_TRACE_ML"));

  }
}

@end
