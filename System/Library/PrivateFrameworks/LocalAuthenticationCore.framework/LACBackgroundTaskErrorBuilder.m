@implementation LACBackgroundTaskErrorBuilder

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", a3, 0);
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0BA0];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("LACBackgroundTaskErrorDomain"), a3, a4);
}

@end
