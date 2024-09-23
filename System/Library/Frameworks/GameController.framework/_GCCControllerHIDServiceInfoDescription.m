@implementation _GCCControllerHIDServiceInfoDescription

- (_GCCControllerHIDServiceInfoDescription)initWithServiceInfo:(id)a3
{
  void *v4;
  _GCCControllerHIDServiceInfoDescription *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_GCImplicitIPCObjectDescription initWithIdentifier:](self, "initWithIdentifier:", v4);

  return v5;
}

- (id)materializeWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GCCControllerHIDServiceInfoDescription;
  -[_GCImplicitIPCObjectDescription materializeWithContext:](&v4, sel_materializeWithContext_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
