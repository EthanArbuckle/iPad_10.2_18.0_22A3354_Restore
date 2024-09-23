@implementation NE

void ___NE_DNSMessageExtractDomainNameString_block_invoke()
{
  void *v0;
  NSObject *v1;
  const char *v2;
  NSObject *v3;
  uint32_t v4;
  char *v5;
  int v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = dlopen("/usr/lib/libmdns.dylib", 5);
  _NE_DNSMessageExtractDomainNameString_mdnsImage = (uint64_t)v0;
  if (v0)
  {
    _NE_DNSMessageExtractDomainNameString__mdns_DNSMessageExtractDomainNameString = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "DNSMessageExtractDomainNameString");
    if (_NE_DNSMessageExtractDomainNameString__mdns_DNSMessageExtractDomainNameString)
      return;
    ne_log_obj();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v6) = 0;
      v2 = "dlsym libmdns DNSMessageExtractDomainNameString";
      v3 = v1;
      v4 = 2;
LABEL_9:
      _os_log_fault_impl(&dword_19BD16000, v3, OS_LOG_TYPE_FAULT, v2, (uint8_t *)&v6, v4);
    }
  }
  else
  {
    v5 = dlerror();
    ne_log_obj();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = v5;
      v2 = "dlopen libmdns failed: %s";
      v3 = v1;
      v4 = 12;
      goto LABEL_9;
    }
  }

}

@end
