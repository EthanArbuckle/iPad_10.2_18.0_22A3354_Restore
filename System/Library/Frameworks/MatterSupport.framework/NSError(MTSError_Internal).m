@implementation NSError(MTSError_Internal)

+ (uint64_t)mts_errorWithCode:()MTSError_Internal
{
  return objc_msgSend(MEMORY[0x24BDD1540], "mts_errorWithCode:underlyingError:description:", a3, 0, 0);
}

+ (uint64_t)mts_errorWithCode:()MTSError_Internal description:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "mts_errorWithCode:underlyingError:description:", a3, 0, a4);
}

+ (uint64_t)mts_errorWithCode:()MTSError_Internal underlyingError:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "mts_errorWithCode:underlyingError:description:", a3, a4, 0);
}

+ (id)mts_errorWithCode:()MTSError_Internal underlyingError:description:
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v8)
    {
      if (v7)
      {
        v10 = *MEMORY[0x24BDD0FC8];
        v18[0] = *MEMORY[0x24BDD1398];
        v18[1] = v10;
        v19[0] = v7;
        v19[1] = v8;
        v11 = (void *)MEMORY[0x24BDBCE70];
        v12 = v19;
        v13 = v18;
        v14 = 2;
LABEL_9:
        objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v20 = *MEMORY[0x24BDD0FC8];
      v21 = v8;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = &v21;
      v13 = &v20;
    }
    else
    {
      v22 = *MEMORY[0x24BDD1398];
      v23[0] = v7;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v23;
      v13 = &v22;
    }
    v14 = 1;
    goto LABEL_9;
  }
  v15 = 0;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MatterSupport"), a3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)mts_stubErrorForMethod:()MTSError_Internal
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Temporary Stub: %@"), a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mts_errorWithCode:description:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
