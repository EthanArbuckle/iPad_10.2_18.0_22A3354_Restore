@implementation DIDiskArbEmulation

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  return 1;
}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    v24 = 45;
    v25 = 2080;
    v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    v27 = 2112;
    v28 = v5;
    v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v24 = 45;
      v25 = 2080;
      v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }

  }
  *__error() = v6;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/dev/%@"), v5);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0);
  if (v11 < 0)
  {
    v16 = *__error();
    v15 = CFSTR("Failed to eject - cannot open device");
    goto LABEL_11;
  }
  v12 = v11;
  v13 = ioctl(v11, 0x20006415uLL, 0);
  v14 = *__error();
  close(v12);
  if (v13)
  {
    v15 = CFSTR("Failed to eject");
    v16 = v14;
LABEL_11:
    v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v16, v15, a4);
    goto LABEL_19;
  }
  close(v12);
  v18 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v19 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    v24 = 45;
    v25 = 2080;
    v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    v27 = 2112;
    v28 = v5;
    v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v20);
      free(v20);
    }
  }
  else
  {
    getDIOSLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v24 = 45;
      v25 = 2080;
      v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_212EB0000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
    }

  }
  *__error() = v18;
  v17 = 1;
LABEL_19:

  return v17;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158211;
    v15 = 50;
    v16 = 2080;
    v17 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
    v18 = 2113;
    v19 = v5;
    v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158211;
      v15 = 50;
      v16 = 2080;
      v17 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
      v18 = 2113;
      v19 = v5;
      _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %{private}@", buf, 0x1Cu);
    }

  }
  *__error() = v6;
  v13 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[DIHelpers executeWithPath:arguments:error:](DIHelpers, "executeWithPath:arguments:error:", CFSTR("/sbin/umount"), v10, a4);

  return v11;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  return 0;
}

@end
