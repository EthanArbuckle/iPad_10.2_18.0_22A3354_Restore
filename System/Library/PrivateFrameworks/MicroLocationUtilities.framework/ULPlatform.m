@implementation ULPlatform

+ (BOOL)isMac
{
  return 0;
}

+ (BOOL)isMacBook
{
  return 0;
}

+ (BOOL)isIphone
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__ULPlatform_isIphone__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIphone_onceToken != -1)
    dispatch_once(&isIphone_onceToken, block);
  return objc_msgSend((id)isIphone_value, "isEqual:", CFSTR("iPhone"));
}

void __22__ULPlatform_isIphone__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_mobileGestaltAnswerForQuestion:", CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isIphone_value;
  isIphone_value = v1;

}

+ (BOOL)isIpad
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__ULPlatform_isIpad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIpad_onceToken != -1)
    dispatch_once(&isIpad_onceToken, block);
  return objc_msgSend((id)isIpad_value, "isEqual:", CFSTR("iPad"));
}

void __20__ULPlatform_isIpad__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_mobileGestaltAnswerForQuestion:", CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isIpad_value;
  isIpad_value = v1;

}

+ (BOOL)isIpod
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__ULPlatform_isIpod__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isIpod_onceToken != -1)
    dispatch_once(&isIpod_onceToken, block);
  return objc_msgSend((id)isIpod_value, "isEqual:", CFSTR("iPod"));
}

void __20__ULPlatform_isIpod__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_mobileGestaltAnswerForQuestion:", CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isIpod_value;
  isIpod_value = v1;

}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_2);
  return isInternalInstall_isInternalInstall;
}

uint64_t __31__ULPlatform_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  isInternalInstall_isInternalInstall = result;
  return result;
}

+ (id)buildVersion
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ULPlatform_buildVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buildVersion_onceToken != -1)
    dispatch_once(&buildVersion_onceToken, block);
  return (id)buildVersion_value;
}

void __26__ULPlatform_buildVersion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_mobileGestaltAnswerForQuestion:", CFSTR("BuildVersion"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)buildVersion_value;
  buildVersion_value = v1;

}

+ (id)platformInfo
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isMac"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isMac: %@"), v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isMacBook"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isMacBook: %@"), v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isIphone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isIphone: %@"), v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isIpad"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isIpad: %@"), v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isIpod"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isIpod: %@"), v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "isInternalInstall"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isInternalInstall: %@"), v12);

  objc_msgSend(a1, "buildVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", buildVersion: %@"), v13);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v14 = (void *)objc_msgSend(v6, "copy");

  return v14;
}

+ (BOOL)isRunningInXCTestEnvironment
{
  if (isRunningInXCTestEnvironment_onceToken != -1)
    dispatch_once(&isRunningInXCTestEnvironment_onceToken, &__block_literal_global_30);
  return 0;
}

+ (id)_mobileGestaltAnswerForQuestion:(__CFString *)a3
{
  void *v3;
  id v4;

  v3 = (void *)MGCopyAnswer();
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;

  return v4;
}

@end
