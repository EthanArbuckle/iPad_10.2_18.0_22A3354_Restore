@implementation CKLogInit

void __CKLogInit_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create(CKLoggingSubsystem, kCKLogContextFramework);
  v1 = (void *)CKLogContextFramework;
  CKLogContextFramework = (uint64_t)v0;

  v2 = os_log_create(CKLoggingSubsystem, (const char *)kCKLogContextDaemon);
  v3 = (void *)CKLogContextDaemon;
  CKLogContextDaemon = (uint64_t)v2;

  v4 = os_log_create("com.apple.siri.vocabulary", "CoreKnowledge");
  v5 = (void *)CKLogContextVocabulary;
  CKLogContextVocabulary = (uint64_t)v4;

}

@end
