@implementation NSError(HMUAdditions)

+ (uint64_t)hmu_errorWithDomain:()HMUAdditions code:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", a3, a4, 0);
}

+ (id)hmu_errorWithDomain:()HMUAdditions code:description:
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD0FC8];
  v15[0] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v10, a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)hmu_IDSValidationErrorWithCode:()HMUAdditions
{
  return objc_msgSend(MEMORY[0x24BDD1540], "hmu_errorWithDomain:code:", CFSTR("com.apple.homeMessagingUtils.IDSValidation"), a3);
}

+ (uint64_t)hmu_IDSValidationErrorWithCode:()HMUAdditions description:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "hmu_errorWithDomain:code:description:", CFSTR("com.apple.homeMessagingUtils.IDSValidation"), a3, a4);
}

@end
