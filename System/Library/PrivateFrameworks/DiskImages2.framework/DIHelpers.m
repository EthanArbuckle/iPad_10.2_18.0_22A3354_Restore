@implementation DIHelpers

+ (id)stringWithImageFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 0;
  else
    return off_24CEF0868[a3 - 1];
}

+ (unint64_t)numBlocksWithSizeStr:(id)a3 blockSize:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  const char *v10;
  double v11;
  char *v12;
  unint64_t v13;
  void *v15;
  int v16;
  char *v17;

  v5 = a3;
  v17 = 0;
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v5, "length") - 1);

  if ((int)v7 <= 106)
  {
    if ((_DWORD)v7 == 98)
    {
      v8 = 1;
      goto LABEL_12;
    }
    if ((_DWORD)v7 == 103)
    {
      v8 = 0x40000000;
      goto LABEL_12;
    }
  }
  else
  {
    switch((_DWORD)v7)
    {
      case 'k':
        v8 = 1024;
        goto LABEL_12;
      case 'm':
        v8 = 0x100000;
        goto LABEL_12;
      case 't':
        v8 = 0x10000000000;
LABEL_12:
        objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - 1);
        v9 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v9;
        goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "characterIsMember:", v7);

  if (!v16)
  {
    v13 = 0;
    goto LABEL_16;
  }
  v8 = a4;
LABEL_13:
  v5 = objc_retainAutorelease(v5);
  v10 = (const char *)objc_msgSend(v5, "UTF8String");
  v11 = strtod(v10, &v17);
  v12 = (char *)(v17 - v10);
  v13 = 0;
  if (v12 == (char *)objc_msgSend(v5, "length") && v11 > 0.0)
    v13 = (a4 + vcvtpd_u64_f64(v11 * (double)v8) - 1) / a4;
LABEL_16:

  return v13;
}

+ (BOOL)executeWithPath:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17D8];
  v9 = (void *)MEMORY[0x24BDBCF48];
  v10 = a4;
  objc_msgSend(v9, "fileURLWithPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "launchedTaskWithExecutableURL:arguments:error:terminationHandler:", v11, v10, a5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "waitUntilExit");
    if (objc_msgSend(v12, "terminationStatus"))
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ failed with error code %d"), v14, objc_msgSend(v12, "terminationStatus"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, v15, a5);

    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)copyDevicePathWithStatfs:(statfs *)a3
{
  id v3;
  void *v4;
  void *v5;
  char v7[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a3 || _FSGetLocationFromStatfs((uint64_t)a3, v7, 0x400uLL))
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("/dev/%s"), v7);
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("/dev/disk")))
    v5 = v4;
  else
    v5 = 0;
  v3 = v5;

  return v3;
}

@end
