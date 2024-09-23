@implementation AVServerWrapper

- (AVServerWrapper)initWithServerInstance:(id)a3
{
  id v4;
  AVServerWrapper *v5;
  AVServerWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVServerWrapper;
  v5 = -[AVServerWrapper init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_serverInstance, v4);

  return v6;
}

- (BOOL)contains:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVServerWrapper serverInstance](self, "serverInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == v4;

  return (char)self;
}

- (AVHapticServerInstance)serverInstance
{
  return (AVHapticServerInstance *)objc_loadWeakRetained((id *)&self->_serverInstance);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverInstance);
}

@end
