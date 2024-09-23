@implementation DIStatFS

- (DIStatFS)initWithCoder:(id)a3
{
  id v4;
  DIStatFS *v5;
  uint64_t v6;
  NSURL *mountedOnURL;
  uint64_t v8;
  NSString *mountedFrom;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIStatFS;
  v5 = -[DIStatFS init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mountedOnURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    mountedOnURL = v5->_mountedOnURL;
    v5->_mountedOnURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mountedFrom"));
    v8 = objc_claimAutoreleasedReturnValue();
    mountedFrom = v5->_mountedFrom;
    v5->_mountedFrom = (NSString *)v8;

    v5->_blockSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("blockSize"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DIStatFS mountedOnURL](self, "mountedOnURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("mountedOnURL"));

  -[DIStatFS mountedFrom](self, "mountedFrom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("mountedFrom"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[DIStatFS blockSize](self, "blockSize"), CFSTR("blockSize"));
}

- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  DIStatFS *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *mountedOnURL;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  char *v15;
  DIStatFS *v16;
  NSObject *v17;
  DIStatFS *v18;
  objc_super v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *f_fstypename;
  statfs v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)DIStatFS;
  v6 = -[DIStatFS init](&v20, sel_init);
  if (!v6)
  {
LABEL_14:
    v16 = v6;
    goto LABEL_15;
  }
  if ((fstatfs(a3, &v27) & 0x80000000) == 0)
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v27.f_mntonname);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    mountedOnURL = v6->_mountedOnURL;
    v6->_mountedOnURL = (NSURL *)v9;

    v6->_blockSize = v27.f_bsize;
    v11 = +[DIHelpers copyDevicePathWithStatfs:](DIHelpers, "copyDevicePathWithStatfs:", &v27);
    v12 = v11;
    if ((v27.f_flags & 0x1000) != 0 && objc_msgSend(v11, "hasPrefix:", CFSTR("/dev/disk")))
      objc_storeStrong((id *)&v6->_mountedFrom, v12);
    v13 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v14 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      v22 = 41;
      v23 = 2080;
      v24 = "-[DIStatFS initWithFileDescriptor:error:]";
      v25 = 2082;
      f_fstypename = v27.f_fstypename;
      v15 = (char *)_os_log_send_and_compose_impl();

      if (v15)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v15);
        free(v15);
      }
    }
    else
    {
      getDIOSLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v22 = 41;
        v23 = 2080;
        v24 = "-[DIStatFS initWithFileDescriptor:error:]";
        v25 = 2082;
        f_fstypename = v27.f_fstypename;
        _os_log_impl(&dword_212EB0000, v17, OS_LOG_TYPE_DEFAULT, "%.*s: File system is %{public}s", buf, 0x1Cu);
      }

    }
    *__error() = v13;

    goto LABEL_14;
  }
  +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", *__error(), CFSTR("fstatfs failed"), a4);
  v16 = (DIStatFS *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v18 = v16;

  return v18;
}

- (void)logWithHeader:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  __CFString *v20;
  char *v21;
  int v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    -[DIStatFS mountedOnURL](self, "mountedOnURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DIStatFS blockSize](self, "blockSize");
    -[DIStatFS mountedFrom](self, "mountedFrom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      -[DIStatFS mountedFrom](self, "mountedFrom");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("locally mounted from %@"), v4);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("remote mount");
    }
    *(_DWORD *)buf = 68158979;
    v24 = 26;
    v25 = 2080;
    v26 = "-[DIStatFS logWithHeader:]";
    v27 = 2114;
    v28 = v6;
    v29 = 2113;
    v30 = v9;
    v31 = 1024;
    v32 = v10;
    v33 = 2114;
    v34 = v13;
    v21 = (char *)_os_log_send_and_compose_impl();
    if (v11)
    {

    }
    if (v21)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v21);
      free(v21);
    }
  }
  else
  {
    getDIOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[DIStatFS mountedOnURL](self, "mountedOnURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[DIStatFS blockSize](self, "blockSize");
      -[DIStatFS mountedFrom](self, "mountedFrom");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        -[DIStatFS mountedFrom](self, "mountedFrom");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("locally mounted from %@"), v3);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = CFSTR("remote mount");
      }
      *(_DWORD *)buf = 68158979;
      v24 = 26;
      v25 = 2080;
      v26 = "-[DIStatFS logWithHeader:]";
      v27 = 2114;
      v28 = v6;
      v29 = 2113;
      v30 = v16;
      v31 = 1024;
      v32 = v17;
      v33 = 2114;
      v34 = v20;
      _os_log_impl(&dword_212EB0000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: %{public}@: mounted on %{private}@, %u bytes block size, %{public}@", buf, 0x36u);
      if (v18)
      {

      }
    }

  }
  *__error() = v22;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)mountedOnURL
{
  return self->_mountedOnURL;
}

- (NSString)mountedFrom
{
  return self->_mountedFrom;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountedFrom, 0);
  objc_storeStrong((id *)&self->_mountedOnURL, 0);
}

@end
