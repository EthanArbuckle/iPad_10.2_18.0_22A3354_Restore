@implementation HMFMessage(InternalMessages)

- (uint64_t)isInternal
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("internal"));
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

+ (id)internalMessageWithName:()InternalMessages messagePayload:
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE3F1D0], "internalMessageWithName:messagePayload:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

+ (id)internalMessageWithName:()InternalMessages messagePayload:responseHandler:
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE3F1D0], "internalMessageWithName:messagePayload:responseHandler:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

+ (id)internalMessageWithName:()InternalMessages destination:messagePayload:
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE3F1D0], "internalMessageWithName:destination:messagePayload:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

@end
