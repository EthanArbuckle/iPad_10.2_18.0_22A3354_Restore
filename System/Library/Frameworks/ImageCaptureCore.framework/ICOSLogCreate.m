@implementation ICOSLogCreate

void ____ICOSLogCreate_block_invoke()
{
  void *v0;
  const char *v1;
  id v2;
  os_log_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (const char *)objc_msgSend((id)ICLoggingDomain, "UTF8String");
  v2 = objc_retainAutorelease(v0);
  v3 = os_log_create(v1, (const char *)objc_msgSend(v2, "UTF8String"));
  v4 = (void *)_gICOSLog;
  _gICOSLog = (uint64_t)v3;

}

@end
