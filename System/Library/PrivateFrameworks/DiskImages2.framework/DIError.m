@implementation DIError

+ (id)copyDefaultLocalizedStringForDIErrorCode:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 160:
      result = CFSTR("The disk image format is obsolete. Please convert it to a new format using Disk Utility");
      break;
    case 161:
      result = CFSTR("The disk image format is not supported by this OS");
      break;
    case 162:
    case 163:
    case 164:
      goto LABEL_5;
    case 165:
      result = CFSTR("Failed to mount filesystems");
      break;
    case 166:
      result = CFSTR("Corrupted shadow file(s) chain");
      break;
    default:
      if (a3 == 152)
      {
        result = CFSTR("The disk image is corrupted");
      }
      else
      {
LABEL_5:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Disk image operation failed with error code %d"), a3);
        result = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return result;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 verboseInfo:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  char *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint8_t *v34;
  uint64_t v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD1128]);
  if (a4 >= 0)
    v16 = a4;
  else
    v16 = -a4;
  if (v15)
    v17 = v16;
  else
    v17 = a4;
  if (!v12)
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.DiskImages2.ErrorDomain")))
      v12 = +[DIError copyDefaultLocalizedStringForDIErrorCode:](DIError, "copyDefaultLocalizedStringForDIErrorCode:", v17);
    else
      v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(err code %d)"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD0FC8]);
    if (v13)
    {
      v19 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158722;
          v37 = 62;
          v38 = 2080;
          v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          v40 = 2114;
          v41 = v12;
          v42 = 2114;
          v43 = v13;
          v44 = 2114;
          v45 = v18;
          _os_log_impl(&dword_212EB0000, v26, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ - %{public}@ %{public}@", buf, 0x30u);
        }

        goto LABEL_33;
      }
      getDIOSLog();
      v20 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158722;
      v37 = 62;
      v38 = 2080;
      v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      v40 = 2114;
      v41 = v12;
      v42 = 2114;
      v43 = v13;
      v44 = 2114;
      v45 = v18;
      LODWORD(v35) = 48;
      v34 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21)
        goto LABEL_19;
      goto LABEL_33;
    }
    v23 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        v37 = 62;
        v38 = 2080;
        v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        v40 = 2114;
        v41 = v12;
        v42 = 2114;
        v43 = v18;
        _os_log_impl(&dword_212EB0000, v29, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
      }

      goto LABEL_41;
    }
    getDIOSLog();
    v24 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68158466;
    v37 = 62;
    v38 = 2080;
    v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    v40 = 2114;
    v41 = v12;
    v42 = 2114;
    v43 = v18;
    LODWORD(v35) = 38;
    v34 = buf;
    v25 = (char *)_os_log_send_and_compose_impl();

    if (v25)
      goto LABEL_29;
  }
  else
  {
    if (v13)
    {
      v19 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158466;
          v37 = 62;
          v38 = 2080;
          v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          v40 = 2114;
          v41 = v13;
          v42 = 2114;
          v43 = v18;
          _os_log_impl(&dword_212EB0000, v28, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
        }

        goto LABEL_33;
      }
      getDIOSLog();
      v22 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158466;
      v37 = 62;
      v38 = 2080;
      v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      v40 = 2114;
      v41 = v13;
      v42 = 2114;
      v43 = v18;
      LODWORD(v35) = 38;
      v34 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21)
      {
LABEL_19:
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v21);
        free(v21);
      }
LABEL_33:
      *__error() = v19;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("DIErrorVerboseInfo"), v34, v35);
      goto LABEL_42;
    }
    v23 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        v37 = 62;
        v38 = 2080;
        v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        v40 = 2114;
        v41 = v11;
        v42 = 2114;
        v43 = v18;
        _os_log_impl(&dword_212EB0000, v30, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ error %{public}@", buf, 0x26u);
      }

      goto LABEL_41;
    }
    getDIOSLog();
    v27 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68158466;
    v37 = 62;
    v38 = 2080;
    v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    v40 = 2114;
    v41 = v11;
    v42 = 2114;
    v43 = v18;
    LODWORD(v35) = 38;
    v34 = buf;
    v25 = (char *)_os_log_send_and_compose_impl();

    if (v25)
    {
LABEL_29:
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v25);
      free(v25);
    }
  }
LABEL_41:
  *__error() = v23;
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v11, v17, v14, v34, v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (a7)
    *a7 = objc_retainAutorelease(v31);

  return v32;
}

+ (id)errorWithPOSIXCode:(int)a3 verboseInfo:(id)a4
{
  +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1128], a3, 0, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)failWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1128], a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1128], a3, 0, a4, a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4;

  v4 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1128], a3, 0, 0, a4);
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1128], a3, a4, 0, a5);
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1128], a3, 0, a4, a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1100], a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1100], a3, 0, a4, a5);
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1100], a3, 0, a4, a5);
  return 0;
}

+ (id)errorWithEnumValue:(int64_t)a3 verboseInfo:(id)a4
{
  +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, 0, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)failWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, 0, a4, a5);
  return 0;
}

+ (id)nilWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, a4, 0, a5);
  return 0;
}

+ (id)nilWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, 0, a4, a5);
  return 0;
}

+ (BOOL)mandatoryArgumentFailWithError:(id *)a3
{
  id v3;

  v3 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", *MEMORY[0x24BDD1128], 22, 0, CFSTR("A mandatory argument is null in a DiskImages2 API call. Remember to check if init succeeded"), a3);
  return 0;
}

+ (NSBundle)frameworkBundle
{
  if (+[DIError frameworkBundle]::onceToken != -1)
    dispatch_once(&+[DIError frameworkBundle]::onceToken, &__block_literal_global_0);
  return (NSBundle *)(id)+[DIError frameworkBundle]::_bundle;
}

void __26__DIError_frameworkBundle__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/DiskImages2.framework"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithURL:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[DIError frameworkBundle]::_bundle;
  +[DIError frameworkBundle]::_bundle = v1;

}

+ (id)errorWithDIException:(const void *)a3 description:(id)a4 prefix:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v9 = a4;
  v10 = a5;
  v11 = *((_DWORD *)a3 + 2);
  if (v11 >= 0)
    v12 = v11;
  else
    v12 = -v11;
  v13 = (__CFString *)*MEMORY[0x24BDD1128];
  if (v12 >= 0x6B)
    v13 = CFSTR("com.apple.DiskImages2.ErrorDomain");
  v14 = v13;
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (*(uint64_t (**)(const void *))(*(_QWORD *)a3 + 16))(a3);
  if (v10)
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: %s"), v10, v16);
  else
    objc_msgSend(v15, "stringWithUTF8String:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", v14, v12, v9, v17, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)failWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, a4, 0, a5);
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, 0, a4, a5);
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, 0, a4, a5);
  return 0;
}

@end
