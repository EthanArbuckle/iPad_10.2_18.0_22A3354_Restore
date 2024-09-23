@implementation HMFMessage(LocationMessage)

- (uint64_t)isLocationAuthorized
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("locationAuthorized"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresHomeLocationEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("HMDMessageRequiresHomeLocationEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

+ (id)locationAuthorizedMessageWithName:()LocationMessage messagePayload:
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:messagePayload:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserInfoValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("locationAuthorized"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

+ (id)homeLocationAuthorizedAndEntitledMessageWithName:()LocationMessage target:messagePayload:
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BE3F1D0];
  v8 = a4;
  objc_msgSend(v7, "entitledMessageWithName:messagePayload:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v9, "setUserInfoValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("locationAuthorized"));
  objc_msgSend(v9, "setUserInfoValue:forKey:", v10, CFSTR("HMDMessageRequiresHomeLocationEntitlement"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1B8]), "initWithTarget:", v8);

  objc_msgSend(v9, "setDestination:", v11);
  v12 = (void *)objc_msgSend(v9, "copy");

  return v12;
}

@end
