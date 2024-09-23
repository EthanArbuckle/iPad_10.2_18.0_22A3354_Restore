@implementation DeviceWithGreymatterSupport

void __DeviceWithGreymatterSupport_block_invoke()
{
  int domain_answer;
  int v1;
  char *v2;
  uint8_t buf[4];
  int v4;
  __int16 v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    v1 = domain_answer;
    v2 = strerror(domain_answer);
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v4 = v1;
      v5 = 2080;
      v6 = v2;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "os_eligibility_get_domain_answer failed with errno %d: %s", buf, 0x12u);
    }
  }
  else
  {
    DeviceWithGreymatterSupport::hasSupport = 0;
  }
}

@end
