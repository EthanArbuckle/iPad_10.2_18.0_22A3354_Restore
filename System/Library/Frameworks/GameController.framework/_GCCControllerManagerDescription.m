@implementation _GCCControllerManagerDescription

- (_GCCControllerManagerDescription)initWithControllerManager:(id)a3
{
  void *v4;
  _GCCControllerManagerDescription *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_GCImplicitIPCObjectDescription initWithIdentifier:](self, "initWithIdentifier:", v4);

  return v5;
}

- (_GCCControllerManagerDescription)init
{
  void *v3;
  _GCCControllerManagerDescription *v4;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GCCControllerManagerDescription initWithControllerManager:](self, "initWithControllerManager:", v3);

  return v4;
}

- (id)materializeWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GCCControllerManagerDescription;
  -[_GCImplicitIPCObjectDescription materializeWithContext:](&v4, sel_materializeWithContext_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
