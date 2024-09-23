@implementation HMFMutableMessage(InternalMessages)

- (void)setInternal:()InternalMessages
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("internal"));

}

+ (uint64_t)internalMessageWithName:()InternalMessages messagePayload:
{
  return objc_msgSend(a1, "internalMessageWithName:messagePayload:responseHandler:", a3, a4, 0);
}

+ (id)internalMessageWithName:()InternalMessages messagePayload:responseHandler:
{
  void *v0;

  objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:messagePayload:responseHandler:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserInfoValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("internal"));
  return v0;
}

+ (id)internalMessageWithName:()InternalMessages destination:messagePayload:
{
  void *v0;

  objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserInfoValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("internal"));
  return v0;
}

@end
