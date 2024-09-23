@implementation NSError(MFAAError)

+ (id)MFAA_errorWithDomain:()MFAAError code:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a3;
  errorDescription(v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MFAA_errorWithDomain:code:description:", v6, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)MFAA_errorWithDomain:()MFAAError code:description:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)MFAA_errorWithDomain:()MFAAError code:failureReason:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (v8)
  {
    v13[0] = *MEMORY[0x24BDD0FC8];
    errorDescription(v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = *MEMORY[0x24BDD0FD8];
    v14[0] = v9;
    v14[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v7, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
