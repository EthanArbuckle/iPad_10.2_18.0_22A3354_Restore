@implementation NSError(KCJoiningError)

- (uint64_t)initWithJoiningError:()KCJoiningError userInfo:
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", KCErrorDomain, a3, a4);
}

+ (id)errorWithJoiningError:()KCJoiningError format:arguments:
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDD1540];
  v8 = a4;
  v9 = [v7 alloc];
  v14 = *MEMORY[0x24BDD0FC8];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v8, a5);

  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithJoiningError:userInfo:", a3, v11);

  return v12;
}

+ (id)errorWithJoiningError:()KCJoiningError format:
{
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithJoiningError:format:arguments:", a3, a4, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
