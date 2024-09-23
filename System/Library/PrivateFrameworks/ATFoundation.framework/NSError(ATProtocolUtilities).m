@implementation NSError(ATProtocolUtilities)

- (id)initWithATPError:()ATProtocolUtilities
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "errorDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "code");
  v8 = v7;
  if (v5)
  {
    v9 = v7;
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v4, "errorDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(a1, "initWithDomain:code:userInfo:", v6, v9, v11);

  }
  else
  {

    v12 = (id)objc_msgSend(a1, "initWithDomain:code:userInfo:", v6, v8, 0);
  }

  return v12;
}

- (id)ATPError
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setCode:", objc_msgSend(a1, "code"));
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDomain:", v3);

  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setErrorDescription:", v4);

  return v2;
}

@end
