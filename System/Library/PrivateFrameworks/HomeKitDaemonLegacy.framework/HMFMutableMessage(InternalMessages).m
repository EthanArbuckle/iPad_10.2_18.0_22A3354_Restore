@implementation HMFMutableMessage(InternalMessages)

- (void)setInternal:()InternalMessages
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
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

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:messagePayload:responseHandler:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("internal"));
  return v0;
}

+ (id)internalMessageWithName:()InternalMessages destination:messagePayload:
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("internal"));
  return v0;
}

@end
