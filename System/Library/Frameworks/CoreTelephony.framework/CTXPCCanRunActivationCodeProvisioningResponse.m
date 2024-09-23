@implementation CTXPCCanRunActivationCodeProvisioningResponse

- (CTXPCCanRunActivationCodeProvisioningResponse)initWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CTXPCCanRunActivationCodeProvisioningResponse *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("title"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("message"));
  v11.receiver = self;
  v11.super_class = (Class)CTXPCCanRunActivationCodeProvisioningResponse;
  v9 = -[CTXPCMessage initWithNamedArguments:](&v11, sel_initWithNamedArguments_, v8);

  return v9;
}

- (NSString)title
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("title"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSString)message
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("message"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCCanRunActivationCodeProvisioningResponse;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
