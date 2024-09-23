@implementation DTBKSWatchdogAssertionFactory

- (id)assertionForPid:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  int v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  sub_222B491B4();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v22 = v3;
    _os_log_impl(&dword_222B17000, v4, OS_LOG_TYPE_INFO, "acquiring assertion for pid %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.DTServiceHub"), CFSTR("DeveloperToolsDebugging"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BE80B10]);
  objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithExplanation:target:attributes:", CFSTR("Target is being analyzed by developer tools"), v8, v6);

  v19 = 0;
  v10 = objc_msgSend(v9, "acquireWithError:", &v19);
  v11 = v19;
  if ((v10 & 1) != 0)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_222B491F4;
    v16[3] = &unk_24EB28028;
    v18 = v3;
    v17 = v9;
    v12 = _Block_copy(v16);
    v13 = _Block_copy(v12);

    v14 = v17;
  }
  else
  {
    sub_222B491B4();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_222BC6558((uint64_t)v11, v3, v14);
    v13 = 0;
  }

  return v13;
}

@end
