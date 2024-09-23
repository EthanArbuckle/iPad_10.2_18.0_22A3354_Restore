@implementation CertUILoggingInitialize

void __CertUILoggingInitialize_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.CertUI", "CertUI");
  v1 = (void *)_CertUILogObjects;
  _CertUILogObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.CertUI", "CertUIRelay");
  v3 = (void *)qword_253E87250;
  qword_253E87250 = (uint64_t)v2;

  v4 = os_log_create("com.apple.CertUI", "TrustMe");
  v5 = (void *)qword_253E87258;
  qword_253E87258 = (uint64_t)v4;

}

@end
