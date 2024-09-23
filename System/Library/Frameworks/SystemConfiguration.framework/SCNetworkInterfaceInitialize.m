@implementation SCNetworkInterfaceInitialize

void ____SCNetworkInterfaceInitialize_block_invoke()
{
  int v0;
  int v1;
  NSObject *v2;
  uint64_t v3;
  char *v4;
  _DWORD *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  pthread_mutex_init(&lock_1, 0);
  __kSCNetworkInterfaceTypeID = _CFRuntimeRegisterClass();
  _CFRuntimeInitStaticInstance();
  qword_1ECDA0C80 = (uint64_t)CFSTR("IPv4");
  qword_1ECDA0CA0 = (uint64_t)CFSTR("ipv4");
  _CFRuntimeInitStaticInstance();
  qword_1ECDA0E18 = (uint64_t)CFSTR("Loopback");
  qword_1ECDA0E38 = (uint64_t)CFSTR("loopback");
  qword_1ECDA0E78 = (uint64_t)CFRetain(CFSTR("lo0"));
  qword_1ECDA0E88 = (uint64_t)CFSTR("Loopback");
  bundle = _SC_CFBundleGet();
  v0 = MEMORY[0x18D78C384](0, &masterPort);
  if (v0)
  {
    v1 = v0;
    v2 = __log_SCNetworkConfiguration();
    v3 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v2, (os_log_type_t)v3))
    {
      v4 = (char *)v6 - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      v5 = (_DWORD *)_os_log_pack_fill();
      *v5 = 67109120;
      v5[1] = v1;
      __SC_log_send(5, (uint64_t)v2, v3, v4);
    }
  }
}

@end
