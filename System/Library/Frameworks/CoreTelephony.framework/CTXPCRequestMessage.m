@implementation CTXPCRequestMessage

- (CTXPCRequestMessage)init
{
  return -[CTXPCMessage initWithNamedArguments:](self, "initWithNamedArguments:", MEMORY[0x1E0C9AA70]);
}

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (int)requiredEntitlement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

@end
