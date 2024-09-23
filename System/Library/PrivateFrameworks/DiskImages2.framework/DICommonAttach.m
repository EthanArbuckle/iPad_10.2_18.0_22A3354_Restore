@implementation DICommonAttach

+ (BOOL)DI2_attachWithParams:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  id v7;
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  int v17;
  NSObject *v18;
  void *v19;
  char *v20;
  NSObject *v21;
  void *v22;
  uint8_t *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = *__error();
  if (DIForwardLogs())
  {
    v27 = 0;
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v29 = 53;
    v30 = 2080;
    v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
    LODWORD(v25) = 18;
    v24 = buf;
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    getDIOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v29 = 53;
      v30 = 2080;
      v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
      _os_log_impl(&dword_212EB0000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }

  }
  LOBYTE(v12) = 0;
  *__error() = v8;
  if (v7 && a4 && a5)
  {
    objc_msgSend(v7, "inputURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pathExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("sparseimage"));

    if (v15)
    {
      LOBYTE(v12) = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 45, CFSTR("Sparse images are not supported by DI2"), a5);
    }
    else
    {
      v26 = 0;
      v12 = +[DiskImages2 attachWithParams:handle:error:](DiskImages2, "attachWithParams:handle:error:", v7, &v26, a5);
      v16 = v26;
      if (v12)
      {
        v17 = *__error();
        if (DIForwardLogs())
        {
          v27 = 0;
          getDIOSLog();
          v18 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          objc_msgSend(v16, "BSDName", v24, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158210;
          v29 = 53;
          v30 = 2080;
          v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
          v32 = 2114;
          v33 = v19;
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
            objc_msgSend(v16, "BSDName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158210;
            v29 = 53;
            v30 = 2080;
            v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
            v32 = 2114;
            v33 = v22;
            _os_log_impl(&dword_212EB0000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image attached (with DI2) as %{public}@", buf, 0x1Cu);

          }
        }
        *__error() = v17;
        objc_msgSend(v16, "BSDName");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }

  return v12;
}

+ (BOOL)DI1_attachWithDictionary:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  int *v12;
  BOOL result;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v15 = 57;
    v16 = 2080;
    v17 = "+[DICommonAttach DI1_attachWithDictionary:BSDName:error:]";
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    getDIOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v15 = 57;
      v16 = 2080;
      v17 = "+[DICommonAttach DI1_attachWithDictionary:BSDName:error:]";
      _os_log_impl(&dword_212EB0000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }

  }
  v12 = __error();
  result = 0;
  *v12 = v8;
  if (a3 && a4)
  {
    if (a5)
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 45, CFSTR("Attach with legacy DiskImages framework is not supported on embedded platforms"), a5);
  }
  return result;
}

+ (BOOL)defaultDiskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  if (a3)
    return objc_msgSend(a1, "diskImageAttach:readOnly:autoMount:BSDName:error:", a3, 0, 1, a4, a5);
  else
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("nil URL specified"), a5);
}

+ (BOOL)diskImageAttach:(id)a3 readOnly:(BOOL)a4 autoMount:(BOOL)a5 BSDName:(id *)a6 error:(id *)a7
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  char *v16;
  char v17;
  NSObject *v18;
  void *v19;
  int *v20;
  uint64_t v21;
  void *v22;
  DIAttachParams *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  int v29;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  void *v33;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v9 = a5;
  v10 = a4;
  v49 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (v12)
  {
    v13 = *__error();
    if (DIForwardLogs())
    {
      v42 = 0;
      getDIOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v12, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      v44 = 67;
      v45 = 2080;
      v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
      v47 = 2113;
      v48 = v15;
      LODWORD(v36) = 28;
      v35 = buf;
      v16 = (char *)_os_log_send_and_compose_impl();

      if (v16)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v16);
        free(v16);
      }
    }
    else
    {
      getDIOSLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        v44 = 67;
        v45 = 2080;
        v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
        v47 = 2113;
        v48 = v19;
        _os_log_impl(&dword_212EB0000, v18, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);

      }
    }
    v20 = __error();
    *v20 = v13;
    v22 = (void *)MEMORY[0x2199A8FE8](v20, v21);
    v41 = 0;
    v23 = -[DIAttachParams initWithURL:error:]([DIAttachParams alloc], "initWithURL:error:", v12, &v41);
    v24 = v41;
    v25 = v24;
    if (v23)
    {
      -[DIAttachParams setAutoMount:](v23, "setAutoMount:", v9);
      if (v10)
        v26 = 2;
      else
        v26 = 1;
      -[DIAttachParams setFileMode:](v23, "setFileMode:", v26, v35, v36);
      v39 = v25;
      v40 = 0;
      v17 = objc_msgSend(a1, "diskImageAttach:BSDName:error:", v23, &v40, &v39);
      v27 = v40;
      v28 = v39;

      v25 = v28;
    }
    else if (objc_msgSend(v24, "code") == 45)
    {

      v29 = *__error();
      if (DIForwardLogs())
      {
        v42 = 0;
        getDIOSLog();
        v30 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        v44 = 67;
        v45 = 2080;
        v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
        v31 = (char *)_os_log_send_and_compose_impl();

        if (v31)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v31);
          free(v31);
        }
      }
      else
      {
        getDIOSLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v44 = 67;
          v45 = 2080;
          v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
          _os_log_impl(&dword_212EB0000, v32, OS_LOG_TYPE_DEFAULT, "%.*s: Falling back to attach with di1", buf, 0x12u);
        }

      }
      *__error() = v29;
      v37 = 0;
      v38 = 0;
      v17 = objc_msgSend(a1, "DI1_attachWithDictionary:BSDName:error:", MEMORY[0x24BDBD1B8], &v38, &v37);
      v27 = v38;
      v25 = v37;
    }
    else
    {
      v17 = 0;
      v27 = 0;
    }

    objc_autoreleasePoolPop(v22);
    if (a7 && (v33 = v25) != 0 || a6 && (v33 = v27, a7 = a6, !v25))
      *a7 = objc_retainAutorelease(v33);

  }
  else
  {
    v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("nil URL specified"), a7);
  }

  return v17;
}

+ (BOOL)diskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  char *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int *v17;
  uint64_t v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  id v23;
  int v24;
  NSObject *v25;
  char *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    v9 = *__error();
    if (DIForwardLogs())
    {
      v38 = 0;
      getDIOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v8, "inputURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      *(_DWORD *)buf = 68158211;
      v40 = 48;
      v41 = 2080;
      v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
      v43 = 2113;
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      getDIOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "inputURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        v40 = 48;
        v41 = 2080;
        v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
        v43 = 2113;
        v44 = v16;
        _os_log_impl(&dword_212EB0000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);

      }
    }
    v17 = __error();
    *v17 = v9;
    v19 = (void *)MEMORY[0x2199A8FE8](v17, v18);
    v36 = 0;
    v37 = 0;
    v20 = objc_msgSend(a1, "DI2_attachWithParams:BSDName:error:", v8, &v37, &v36);
    v21 = v37;
    v22 = v36;
    v23 = v22;
    if ((v20 & 1) != 0)
    {
      v13 = 1;
    }
    else if (objc_msgSend(v22, "code") == 45 || objc_msgSend(v23, "code") == 35)
    {

      v24 = *__error();
      if (DIForwardLogs())
      {
        v38 = 0;
        getDIOSLog();
        v25 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        v40 = 48;
        v41 = 2080;
        v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
        v26 = (char *)_os_log_send_and_compose_impl();

        if (v26)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v26);
          free(v26);
        }
      }
      else
      {
        getDIOSLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v40 = 48;
          v41 = 2080;
          v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
          _os_log_impl(&dword_212EB0000, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Falling back to attach with di1", buf, 0x12u);
        }

      }
      *__error() = v24;
      v35 = 0;
      objc_msgSend(v8, "toDI1ParamsWithError:", &v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v35;
      v33 = v29;
      v34 = v21;
      v13 = objc_msgSend(a1, "DI1_attachWithDictionary:BSDName:error:", v28, &v34, &v33);
      v30 = v34;

      v23 = v33;
      v21 = v30;
    }
    else
    {
      v13 = 0;
    }
    objc_autoreleasePoolPop(v19);
    if (a5 && (v31 = v23) != 0 || a4 && (v31 = v21, a5 = a4, !v23))
      *a5 = objc_retainAutorelease(v31);

  }
  else
  {
    v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("nil params specified"), a5);
  }

  return v13;
}

@end
