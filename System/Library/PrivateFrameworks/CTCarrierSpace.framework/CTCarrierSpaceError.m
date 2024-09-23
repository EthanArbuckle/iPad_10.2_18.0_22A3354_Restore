@implementation CTCarrierSpaceError

+ (id)errorForCode:(int64_t)a3
{
  void *v5;
  void *v6;

  errorDescription(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForCode:withDescription:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForCode:(int64_t)a3 withDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
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
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CTCarrierSpaceError"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForCode:(int64_t)a3 subdomain:(int64_t)a4 subdomainError:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  errorDescription(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    +[CTCarrierSpaceDataPlanMetricsError errorDescriptionForCode:](CTCarrierSpaceDataPlanMetricsError, "errorDescriptionForCode:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FC8]);
  if (v9)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD0FD8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CTCarrierSpaceError"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
