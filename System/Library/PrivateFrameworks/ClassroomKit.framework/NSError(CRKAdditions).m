@implementation NSError(CRKAdditions)

+ (id)crk_errorForSecurityOSStatus:()CRKAdditions
{
  CFStringRef v4;
  __CFString *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!status)
    return 0;
  v4 = SecCopyErrorMessageString(status, 0);
  v5 = (__CFString *)v4;
  if (v4)
  {
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], status, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)crk_errorWithPOSIXCode:()CRKAdditions
{
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = strerror(__errnum);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v10 = *MEMORY[0x24BDD0FC8];
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], __errnum, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
