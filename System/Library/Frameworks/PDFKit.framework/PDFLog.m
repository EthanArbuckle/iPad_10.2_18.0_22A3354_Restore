@implementation PDFLog

void ___PDFLog_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = getprogname();
  v1 = os_log_create("com.apple.PDFKit", v0);
  v2 = (void *)sLog;
  sLog = (uint64_t)v1;

}

@end
