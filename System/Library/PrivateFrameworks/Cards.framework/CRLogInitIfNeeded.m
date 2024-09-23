@implementation CRLogInitIfNeeded

void __CRLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)CRLoggingSubsystem, (const char *)CRContextCards);
  v1 = (void *)CRLogContextCards;
  CRLogContextCards = (uint64_t)v0;

}

@end
