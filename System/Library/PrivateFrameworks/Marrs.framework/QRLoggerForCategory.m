@implementation QRLoggerForCategory

void __QRLoggerForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.siri.marrs.QueryRewrite", "QueryRewrite");
  v1 = (void *)QRLoggerForCategory::logObjects[0];
  QRLoggerForCategory::logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.siri.marrs.QueryRewrite", "RD");
  v3 = (void *)qword_1EF786200;
  qword_1EF786200 = (uint64_t)v2;

  v4 = os_log_create("com.apple.siri.marrs.QueryRewrite", "CCQR");
  v5 = (void *)qword_1EF786208;
  qword_1EF786208 = (uint64_t)v4;

}

@end
