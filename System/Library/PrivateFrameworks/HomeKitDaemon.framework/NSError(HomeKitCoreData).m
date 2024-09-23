@implementation NSError(HomeKitCoreData)

+ (id)hmd_validationErrorWithDescription:()HomeKitCoreData
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0B88];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 1550, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)hmd_validationErrorWithDescription:()HomeKitCoreData managedObject:attributeName:
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDBB5A8];
  v15[0] = *MEMORY[0x24BDD0FC8];
  v15[1] = v7;
  v16[0] = a3;
  v16[1] = a4;
  v15[2] = *MEMORY[0x24BDBB5A0];
  v16[2] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 1550, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
