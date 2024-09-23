@implementation HMDActiveXPCConnectionLogEvent

+ (id)initWithNewXPCConnectionAdded:(id)a3
{
  id v3;
  HMDActiveXPCConnectionLogEvent *v4;

  v3 = a3;
  v4 = -[HMDActiveXPCConnectionLogEvent initWithXPCConnection:added:]([HMDActiveXPCConnectionLogEvent alloc], "initWithXPCConnection:added:", v3, 1);

  return v4;
}

- (HMDActiveXPCConnectionLogEvent)initWithXPCConnection:(id)a3 added:(BOOL)a4
{
  id v6;
  HMDActiveXPCConnectionLogEvent *v7;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDActiveXPCConnectionLogEvent;
  v7 = -[HMMLogEvent init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_activated = objc_msgSend(v6, "isActivated");
    v7->_added = a4;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (BOOL)added
{
  return self->_added;
}

+ (id)initWithXPCConnectionRemoved:(id)a3
{
  id v3;
  HMDActiveXPCConnectionLogEvent *v4;

  v3 = a3;
  v4 = -[HMDActiveXPCConnectionLogEvent initWithXPCConnection:added:]([HMDActiveXPCConnectionLogEvent alloc], "initWithXPCConnection:added:", v3, 0);

  return v4;
}

@end
