@implementation ATXDetailedActionLoggingEnabled

void __ATXDetailedActionLoggingEnabled_block_invoke()
{
  id v0;

  if ((objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) != 0)
  {
    v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
    ATXDetailedActionLoggingEnabled_enabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("detailedActionLogging"));

  }
  else
  {
    ATXDetailedActionLoggingEnabled_enabled = 0;
  }
}

@end
