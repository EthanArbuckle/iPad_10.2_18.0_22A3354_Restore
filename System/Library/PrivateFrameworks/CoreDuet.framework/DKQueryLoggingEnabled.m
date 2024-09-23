@implementation DKQueryLoggingEnabled

void ___DKQueryLoggingEnabled_block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  _DKQueryLoggingEnabled_disableQueryLogging = objc_msgSend(v0, "BOOLForKey:", CFSTR("KnowledgeStoreQueryLoggingDisabled"));

}

@end
