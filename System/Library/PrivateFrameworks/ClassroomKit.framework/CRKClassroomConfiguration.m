@implementation CRKClassroomConfiguration

+ (id)configurationSource
{
  id v2;
  const char *v3;
  dispatch_queue_t v4;
  CRKCurrentPlatformProfileConfigurationSource *v5;

  NSStringFromClass((Class)a1);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  v4 = dispatch_queue_create(v3, MEMORY[0x24BDAC9C0]);

  v5 = -[CRKCurrentPlatformProfileConfigurationSource initWithCallbackQueue:]([CRKCurrentPlatformProfileConfigurationSource alloc], "initWithCallbackQueue:", v4);
  return v5;
}

+ (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "configurationSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__CRKClassroomConfiguration_setConfiguration_completion___block_invoke;
  v10[3] = &unk_24D9C6EB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "setConfiguration:completion:", v7, v10);

}

uint64_t __57__CRKClassroomConfiguration_setConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)fetchConfiguration:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "configurationSource");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchConfiguration:", v4);

  }
}

+ (id)setOfActiveRestrictionUUIDs:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "crk_isStudentdInstalled");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setOfActiveRestrictionUUIDs:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_opt_new();
  }

  return v7;
}

@end
