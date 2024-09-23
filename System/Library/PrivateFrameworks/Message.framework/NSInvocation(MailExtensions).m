@implementation NSInvocation(MailExtensions)

+ (id)mf_invocationWithSelector:()MailExtensions target:object:
{
  void *v8;
  void *v9;
  unint64_t v10;
  id v12;

  v12 = a5;
  objc_msgSend(a1, "mf_invocationWithSelector:target:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "methodSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfArguments");

  if (v10 >= 3)
    objc_msgSend(v8, "setArgument:atIndex:", &v12, 2);

  return v8;
}

+ (id)mf_invocationWithSelector:()MailExtensions target:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(v6, "methodSignatureForSelector:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "invocationWithMethodSignature:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "retainArguments");
    objc_msgSend(v8, "setSelector:", a3);
    objc_msgSend(v8, "setTarget:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__NSInvocation_MailExtensions__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_34 != -1)
    dispatch_once(&log_onceToken_34, block);
  return (id)log_log_34;
}

+ (id)mf_invocationWithSelector:()MailExtensions target:object1:object2:
{
  void *v10;
  void *v11;
  unint64_t v12;
  id v14;

  v14 = a6;
  objc_msgSend(a1, "mf_invocationWithSelector:target:object:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "methodSignature");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfArguments");

  if (v12 >= 4)
    objc_msgSend(v10, "setArgument:atIndex:", &v14, 3);

  return v10;
}

- (uint64_t)mf_shouldLogInvocation
{
  return 0;
}

@end
