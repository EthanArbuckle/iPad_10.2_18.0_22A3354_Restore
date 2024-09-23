@implementation FedStatsError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1540];
  v6 = a4;
  v7 = [v5 alloc];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("com.apple.FedStats"), a3, v8);
  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v7 = (objc_class *)MEMORY[0x24BDD1540];
    v8 = a5;
    v9 = a4;
    v10 = [v7 alloc];
    v11 = *MEMORY[0x24BDD1398];
    v18[0] = *MEMORY[0x24BDD0FC8];
    v18[1] = v11;
    v19[0] = v8;
    v19[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("com.apple.FedStats"), a3, v12);
    return v13;
  }
  else
  {
    v15 = a5;
    v16 = 0;
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", a3, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDD1540];
  v8 = a5;
  v9 = a4;
  v10 = [v7 alloc];
  v11 = *MEMORY[0x24BDD10D8];
  v15[0] = *MEMORY[0x24BDD0FC8];
  v15[1] = v11;
  v16[0] = v8;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("com.apple.FedStats"), a3, v12);
  return v13;
}

@end
