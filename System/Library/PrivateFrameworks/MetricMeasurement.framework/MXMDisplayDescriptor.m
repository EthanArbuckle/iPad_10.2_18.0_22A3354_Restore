@implementation MXMDisplayDescriptor

- (double)refreshRate
{
  double result;

  -[CADisplay refreshRate](self->_display, "refreshRate");
  return result;
}

- (NSString)name
{
  return (NSString *)-[CADisplay name](self->_display, "name");
}

- (BOOL)main
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayId");
  LOBYTE(self) = v4 == -[CADisplay displayId](self->_display, "displayId");

  return (char)self;
}

- (MXMDisplayDescriptor)initWithDisplay:(id)a3
{
  id v5;
  MXMDisplayDescriptor *v6;
  MXMDisplayDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMDisplayDescriptor;
  v6 = -[MXMDisplayDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_display, a3);

  return v7;
}

- (CADisplay)display
{
  return self->_display;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_display, 0);
}

@end
