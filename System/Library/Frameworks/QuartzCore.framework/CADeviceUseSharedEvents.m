@implementation CADeviceUseSharedEvents

void __CADeviceUseSharedEvents_block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  const char *v7;
  void **p_buf;
  __int128 buf;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v2 = x_log_category_sharedevent;
    if (os_log_type_enabled((os_log_t)x_log_category_sharedevent, OS_LOG_TYPE_DEBUG))
    {
      if (*(_BYTE *)(a1 + 32))
        v3 = "Enabled";
      else
        v3 = "Disabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_184457000, v2, OS_LOG_TYPE_DEBUG, "CA SharedEvent (default): %s\n", (uint8_t *)&buf, 0xCu);
    }
  }
  CABootArgGetArray(&buf);
  CADeviceUseSharedEvents::ca_shared_event_enabled = CABootArgGetInt((const std::string *)buf, *((const std::string **)&buf + 1), *(_BYTE *)(a1 + 32) == 0, "disable_ca_shared_event") == 0;
  p_buf = (void **)&buf;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&p_buf);
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v4 = x_log_category_sharedevent;
    if (os_log_type_enabled((os_log_t)x_log_category_sharedevent, OS_LOG_TYPE_DEBUG))
    {
      if (CADeviceUseSharedEvents::ca_shared_event_enabled)
        v5 = "Enabled";
      else
        v5 = "Disabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_184457000, v4, OS_LOG_TYPE_DEBUG, "CA SharedEvent (boot-arg): %s\n", (uint8_t *)&buf, 0xCu);
    }
  }
  if (x_log_hook_p())
  {
    x_log_();
  }
  else
  {
    v6 = x_log_category_sharedevent;
    if (os_log_type_enabled((os_log_t)x_log_category_sharedevent, OS_LOG_TYPE_INFO))
    {
      if (CADeviceUseSharedEvents::ca_shared_event_enabled)
        v7 = "Enabled";
      else
        v7 = "Disabled";
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_184457000, v6, OS_LOG_TYPE_INFO, "CA SharedEvent: %s\n", (uint8_t *)&buf, 0xCu);
    }
  }
}

@end
