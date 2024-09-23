@implementation LAPasscodeServiceErrorBuilder

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
  id v12;
  uint64_t v13;
  void *v14;
  void **v15;
  uint64_t *v16;
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
    goto LABEL_17;
  }
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.LocalAuthentication.LAPasscodeServiceErrorDomain"));

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
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = a1;
        v13 = 0;
        goto LABEL_16;
      }
      if (objc_msgSend(v5, "code") == 1)
      {
        objc_msgSend(v5, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = a1;
        v13 = 1;
LABEL_16:
        objc_msgSend(v12, "_errorWithCode:userInfo:", v13, v11);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      if (objc_msgSend(v5, "code") == 2)
      {
        objc_msgSend(v5, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = a1;
        v13 = 3;
        goto LABEL_16;
      }
      if (objc_msgSend(v5, "code") == 3)
      {
        objc_msgSend(v5, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = a1;
        v13 = 2;
        goto LABEL_16;
      }
      v18 = *MEMORY[0x24BDD1398];
      v19 = v5;
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v19;
      v16 = &v18;
    }
    else
    {
      v20 = *MEMORY[0x24BDD1398];
      v21[0] = v5;
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = (void **)v21;
      v16 = &v20;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1;
    v13 = 4;
    goto LABEL_16;
  }
  v8 = v5;
LABEL_17:

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

  objc_msgSend(a1, "_errorWithCode:userInfo:", 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.LocalAuthentication.LAPasscodeServiceErrorDomain"), a3, a4);
}

@end
