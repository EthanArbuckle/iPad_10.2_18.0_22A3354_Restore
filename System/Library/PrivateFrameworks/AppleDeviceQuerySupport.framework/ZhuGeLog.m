@implementation ZhuGeLog

void __ZhuGeLog_block_invoke()
{
  uint64_t v0;
  void *v1;
  __uint64_t v2;

  v2 = 0;
  if (pthread_threadid_np(0, &v2))
    v2 = MEMORY[0x23B7F2F74]();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%d:0x%llx}"), getpid(), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ZhuGeLog_prefixPidTid;
  ZhuGeLog_prefixPidTid = v0;

}

void __ZhuGeLog_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.zhuge", "AppleDeviceQueryArmory");
  v1 = (void *)ZhuGeLog_logObj;
  ZhuGeLog_logObj = (uint64_t)v0;

}

@end
