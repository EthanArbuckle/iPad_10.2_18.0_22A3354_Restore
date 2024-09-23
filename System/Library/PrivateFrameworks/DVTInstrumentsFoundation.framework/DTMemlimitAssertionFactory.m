@implementation DTMemlimitAssertionFactory

- (id)assertionForPid:(int)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel__removeMemoryLimitsForPid_);
}

- (id)_removeMemoryLimitsForPid:(int)a3
{
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  os_log_type_t v8;
  void *v9;
  int v10;
  __int128 v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)((char *)&v12 + 4) = 0xFFFFFFFF00000000;
  LODWORD(v12) = -1;
  HIDWORD(v12) = 0;
  v4 = memorystatus_control();
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v14 = a3;
      v15 = 1024;
      v16 = v5;
      v6 = MEMORY[0x24BDACB70];
      v7 = "DTMemlimitAssertionFactory: failed to remove active and inactive memory limits for pid %d (result = %d)";
      v8 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_222B17000, v6, v8, v7, buf, 0xEu);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("DTMemlimitAssertionFactoryLog"));

    if (v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v14 = a3;
      v15 = 1024;
      v16 = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "DTMemlimitAssertionFactory: removed active and inactive memory limits for pid %d (result = %d)";
      v8 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }
  return 0;
}

@end
