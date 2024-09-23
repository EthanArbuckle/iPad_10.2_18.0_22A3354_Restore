@implementation SecAreQARootCertificatesEnabled

void __SecAreQARootCertificatesEnabled_block_invoke()
{
  int v0;
  int v1;
  NSObject *v2;
  size_t v3;
  int v4;
  uint8_t buf[4];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v3 = 4;
  v0 = sysctlbyname("security.mac.amfi.qa_root_certs_allowed", &v4, &v3, 0, 0);
  if (v0)
  {
    v1 = v0;
    v2 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v6 = v1;
      _os_log_impl(&dword_18A900000, v2, OS_LOG_TYPE_DEFAULT, "Unable to check QA certificate status: %d", buf, 8u);
    }
  }
  else
  {
    SecAreQARootCertificatesEnabled_sQACertsEnabled = v4 == 1;
  }
}

@end
