@implementation CTXPCSubscriptionContextRequest

- (CTXPCSubscriptionContextRequest)initWithContext:(id)a3 namedArguments:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  CTXPCSubscriptionContextRequest *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v8 = CTLogClientXPC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:].cold.1(v8);
  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("context"));
  objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  v10 = (void *)objc_msgSend(v9, "copy");
  v13.receiver = self;
  v13.super_class = (Class)CTXPCSubscriptionContextRequest;
  v11 = -[CTXPCMessage initWithNamedArguments:](&v13, sel_initWithNamedArguments_, v10);

  return v11;
}

- (CTXPCSubscriptionContextRequest)initWithContext:(id)a3
{
  return -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](self, "initWithContext:namedArguments:", a3, MEMORY[0x1E0C9AA70]);
}

- (CTXPCSubscriptionContextRequest)initWithDescriptor:(id)a3 namedArguments:(id)a4
{
  id v6;
  void *v7;
  CTXPCSubscriptionContextRequest *v8;

  v6 = a4;
  +[CTXPCServiceSubscriptionContext contextWithServiceDescriptor:](CTXPCServiceSubscriptionContext, "contextWithServiceDescriptor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CTXPCSubscriptionContextRequest initWithContext:namedArguments:](self, "initWithContext:namedArguments:", v7, v6);

  return v8;
}

- (CTXPCSubscriptionContextRequest)initWithDescriptor:(id)a3
{
  return -[CTXPCSubscriptionContextRequest initWithDescriptor:namedArguments:](self, "initWithDescriptor:namedArguments:", a3, MEMORY[0x1E0C9AA70]);
}

- (CTXPCServiceSubscriptionContext)context
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("context"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CTXPCServiceSubscriptionContext *)v4;
}

- (CTServiceDescriptor)descriptor
{
  void *v2;
  void *v3;

  -[CTXPCSubscriptionContextRequest context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[CTServiceDescriptor descriptorWithSubscriptionContext:](CTServiceDescriptor, "descriptorWithSubscriptionContext:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (CTServiceDescriptor *)v3;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCSubscriptionContextRequest;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)initWithContext:(os_log_t)log namedArguments:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18425C000, log, OS_LOG_TYPE_FAULT, "CTXPCSubscriptionContextRequest was initialized with a nil context", v1, 2u);
}

@end
