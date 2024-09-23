@implementation FedStatsPluginError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = a4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDD1540]);

  v9 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("com.apple.FedStats"), a3, v7);
  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v7 = *MEMORY[0x24BDD1398];
    v18[0] = *MEMORY[0x24BDD0FC8];
    v18[1] = v7;
    v19[0] = a5;
    v19[1] = a4;
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = a5;
    v10 = a4;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDD1540]);

    v13 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("com.apple.FedStats"), a3, v11);
    return v13;
  }
  else
  {
    v15 = a5;
    v16 = 0;
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", a3, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v7 = *MEMORY[0x24BDD10D8];
    v18[0] = *MEMORY[0x24BDD0FC8];
    v18[1] = v7;
    v19[0] = a5;
    v19[1] = a4;
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = a5;
    v10 = a4;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDD1540]);

    v13 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("com.apple.FedStats"), a3, v11);
    return v13;
  }
  else
  {
    v15 = a5;
    v16 = 0;
    +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", a3, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
}

@end
