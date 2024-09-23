@implementation JTLayer

- (JTLayer)initWithDebugEnabled
{
  JTLayer *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JTLayer;
  v2 = -[JTLayer init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[JTLayer setBorderColor:](v2, "setBorderColor:", objc_msgSend(v3, "CGColor"));

    -[JTLayer setBorderWidth:](v2, "setBorderWidth:", 2.0);
    -[JTLayer setDebuggingUIEnabled:](v2, "setDebuggingUIEnabled:", 1);
  }
  return v2;
}

- (BOOL)debuggingUIEnabled
{
  return self->_debuggingUIEnabled;
}

- (void)setDebuggingUIEnabled:(BOOL)a3
{
  self->_debuggingUIEnabled = a3;
}

@end
