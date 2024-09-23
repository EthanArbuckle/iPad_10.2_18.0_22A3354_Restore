@implementation EFSQLVerboseDebugLoggingEnabled

char *__EFSQLVerboseDebugLoggingEnabled_block_invoke()
{
  void *v0;
  char v1;
  char *result;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("EFSQLVerboseDebugLoggingEnabled"));

  result = getenv("OS_ACTIVITY_DT_MODE");
  if (result)
    v3 = v1;
  else
    v3 = 1;
  EFSQLVerboseDebugLoggingEnabled_enabled = v3;
  return result;
}

@end
