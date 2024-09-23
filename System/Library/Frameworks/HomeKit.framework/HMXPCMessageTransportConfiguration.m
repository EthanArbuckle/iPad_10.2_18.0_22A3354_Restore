@implementation HMXPCMessageTransportConfiguration

- (NSString)machServiceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

- (BOOL)requiresHomeDataAccess
{
  return self->_requiresHomeDataAccess;
}

- (NSString)serverStartNotification
{
  void *v2;
  void *v3;

  -[HMXPCMessageTransportConfiguration machServiceName](self, "machServiceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".start.notification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HMXPCMessageTransportConfiguration)initWithMachServiceName:(id)a3
{
  id v4;
  void *v5;
  HMXPCMessageTransportConfiguration *v6;
  uint64_t v7;
  NSString *machServiceName;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  HMXPCMessageTransportConfiguration *result;
  HMXPCMessageTransportConfiguration *v15;
  SEL v16;
  BOOL v17;
  objc_super v18;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v18.receiver = self;
    v18.super_class = (Class)HMXPCMessageTransportConfiguration;
    v6 = -[HMXPCMessageTransportConfiguration init](&v18, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      machServiceName = v6->_machServiceName;
      v6->_machServiceName = (NSString *)v7;

      v6->_requiredEntitlements = 1;
      v6->_requiresHomeDataAccess = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.HomeKit.XPC.%@"), v5);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (const char *)objc_msgSend(v9, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_queue_create(v10, v11);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v12;

    }
    return v6;
  }
  else
  {
    v15 = (HMXPCMessageTransportConfiguration *)_HMFPreconditionFailure();
    -[HMXPCMessageTransportConfiguration setRequiresHomeDataAccess:](v15, v16, v17);
  }
  return result;
}

- (void)setRequiresHomeDataAccess:(BOOL)a3
{
  self->_requiresHomeDataAccess = a3;
}

- (unint64_t)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (void)setRequiredEntitlements:(unint64_t)a3
{
  self->_requiredEntitlements = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  char v11;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMXPCMessageTransportConfiguration machServiceName](self, "machServiceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "machServiceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8)
      && (v9 = -[HMXPCMessageTransportConfiguration requiredEntitlements](self, "requiredEntitlements"),
          v9 == objc_msgSend(v6, "requiredEntitlements"))
      && (v10 = -[HMXPCMessageTransportConfiguration requiresHomeDataAccess](self, "requiresHomeDataAccess"),
          v10 == objc_msgSend(v6, "requiresHomeDataAccess")))
    {
      -[HMXPCMessageTransportConfiguration queue](self, "queue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "queue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "isEqual:", v14);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMXPCMessageTransportConfiguration machServiceName](self, "machServiceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableXPCMessageTransportConfiguration *v4;
  void *v5;
  HMMutableXPCMessageTransportConfiguration *v6;
  void *v7;

  v4 = +[HMMutableXPCMessageTransportConfiguration allocWithZone:](HMMutableXPCMessageTransportConfiguration, "allocWithZone:", a3);
  -[HMXPCMessageTransportConfiguration machServiceName](self, "machServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMXPCMessageTransportConfiguration initWithMachServiceName:](v4, "initWithMachServiceName:", v5);

  -[HMXPCMessageTransportConfiguration setRequiredEntitlements:](v6, "setRequiredEntitlements:", -[HMXPCMessageTransportConfiguration requiredEntitlements](self, "requiredEntitlements"));
  -[HMXPCMessageTransportConfiguration setRequiresHomeDataAccess:](v6, "setRequiresHomeDataAccess:", -[HMXPCMessageTransportConfiguration requiresHomeDataAccess](self, "requiresHomeDataAccess"));
  -[HMXPCMessageTransportConfiguration queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMXPCMessageTransportConfiguration setQueue:](v6, "setQueue:", v7);

  return v6;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMXPCMessageTransportConfiguration machServiceName](self, "machServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Mach Service Name"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  HMXPCClientEntitlementsShortDescription(-[HMXPCMessageTransportConfiguration requiredEntitlements](self, "requiredEntitlements", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Required Entitlements"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMXPCMessageTransportConfiguration requiresHomeDataAccess](self, "requiresHomeDataAccess");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Requires Home Data Access"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
