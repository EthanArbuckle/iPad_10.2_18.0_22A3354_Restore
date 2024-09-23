@implementation LAPasscodeChangeErrorBuilder

+ (id)redactError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPasscodeChangeErrorDomain"));

  if (!v7)
  {
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPSErrorDomain"));

    if ((v10 & 1) != 0)
    {
      if (!objc_msgSend(v5, "code"))
      {
        objc_msgSend(v5, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = a1;
        v16 = 0;
        goto LABEL_10;
      }
      v18 = *MEMORY[0x24BDD1398];
      v19 = v5;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = &v19;
      v13 = &v18;
    }
    else
    {
      v20 = *MEMORY[0x24BDD1398];
      v21[0] = v5;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = (void **)v21;
      v13 = &v20;
    }
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = a1;
    v16 = 1;
LABEL_10:
    objc_msgSend(v15, "_errorWithCode:userInfo:", v16, v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v8 = v5;
LABEL_11:

  return v8;
}

+ (id)genericErrorWithDebugDescription:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD0BA0];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.LocalAuthentication.LAPasscodeChangeErrorDomain"), a3, a4);
}

@end
