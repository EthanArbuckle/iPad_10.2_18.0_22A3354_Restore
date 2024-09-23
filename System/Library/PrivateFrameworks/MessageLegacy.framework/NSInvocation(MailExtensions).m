@implementation NSInvocation(MailExtensions)

+ (void)mf_invocationWithSelector:()MailExtensions target:object:
{
  void *v5;
  uint64_t v7;

  v7 = a5;
  v5 = (void *)objc_msgSend(a1, "mf_invocationWithSelector:target:");
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v5, "methodSignature"), "numberOfArguments") >= 3)
    objc_msgSend(v5, "setArgument:atIndex:", &v7, 2);
  return v5;
}

+ (void)mf_invocationWithSelector:()MailExtensions target:
{
  uint64_t v7;
  void *v8;

  v7 = objc_msgSend(a4, "methodSignatureForSelector:");
  if (!v7)
    return 0;
  v8 = (void *)objc_msgSend(a1, "invocationWithMethodSignature:", v7);
  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "setSelector:", a3);
  objc_msgSend(v8, "setTarget:", a4);
  return v8;
}

+ (void)mf_invocationWithSelector:()MailExtensions target:object1:object2:
{
  void *v6;
  uint64_t v8;

  v8 = a6;
  v6 = (void *)objc_msgSend(a1, "mf_invocationWithSelector:target:object:");
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "methodSignature"), "numberOfArguments") >= 4)
    objc_msgSend(v6, "setArgument:atIndex:", &v8, 3);
  return v6;
}

- (uint64_t)mf_shouldLogInvocation
{
  return 0;
}

@end
