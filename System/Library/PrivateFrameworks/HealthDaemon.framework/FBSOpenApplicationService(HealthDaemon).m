@implementation FBSOpenApplicationService(HealthDaemon)

+ (uint64_t)hd_defaultService
{
  return objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
}

+ (void)hd_openApplication:()HealthDaemon optionsDictionary:completion:
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "hd_defaultService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "hd_openApplication:optionsDictionary:completion:", v16, v8, v9);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_error:format:", 100, CFSTR("Missing default %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v15);

  }
}

- (void)hd_openApplication:()HealthDaemon optionsDictionary:completion:
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0D23158];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "optionsWithDictionary:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "openApplication:withOptions:completion:", v10, v11, v9);

}

+ (uint64_t)hd_canOpenApplication:()HealthDaemon reason:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  objc_msgSend(a1, "hd_defaultService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "canOpenApplication:reason:", v6, a4);
  else
    v9 = 0;

  return v9;
}

@end
