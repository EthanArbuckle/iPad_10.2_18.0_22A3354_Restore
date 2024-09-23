@implementation CMSServiceError

+ (id)serviceErrorFromCause:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  +[CMSServiceError _supportedDomains](CMSServiceError, "_supportedDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6
    && (objc_msgSend(v3, "domain"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.cloudmediaservices.errorDomain")),
        v7,
        v8)
    && (v9 = objc_msgSend(v3, "code"), (unint64_t)(v9 - 1004) <= 5))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sirikitcloudmedia.errorDomain"), qword_21DE66B28[v9 - 1004], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)serviceError:(int64_t)a3 withUnderlyingIssue:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDD1398];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.sirikitcloudmedia.errorDomain"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_supportedDomains
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("com.apple.cloudmediaservices.errorDomain");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
