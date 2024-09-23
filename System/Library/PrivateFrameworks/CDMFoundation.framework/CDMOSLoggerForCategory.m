@implementation CDMOSLoggerForCategory

void __CDMOSLoggerForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;

  v0 = os_log_create("com.apple.siri.cdm", "CDM");
  v1 = (void *)CDMOSLoggerForCategory::logObjects[0];
  CDMOSLoggerForCategory::logObjects[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.siri.cdm", "DAG");
  v3 = (void *)qword_253E457C0;
  qword_253E457C0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.siri.cdm", "ServiceCenter");
  v5 = (void *)qword_253E457C8;
  qword_253E457C8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.siri.cdm", "Common");
  v7 = (void *)qword_253E457B8;
  qword_253E457B8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.siri.cdm", "CDM-External");
  v9 = (void *)qword_253E457D0;
  qword_253E457D0 = (uint64_t)v8;

}

@end
