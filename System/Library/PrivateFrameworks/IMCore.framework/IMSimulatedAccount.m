@implementation IMSimulatedAccount

- (void)setLoginHandle:(id)a3
{
  void *v5;
  IMHandle *v6;

  v6 = (IMHandle *)a3;
  if (self->_loginHandle != v6)
  {
    objc_storeStrong((id *)&self->_loginHandle, a3);
    -[IMHandle ID](v6, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount setLogin:](self, "setLogin:", v5);

  }
}

- (BOOL)supportsRegistration
{
  return 1;
}

- (BOOL)isOperational
{
  return 1;
}

- (BOOL)isConnected
{
  return 1;
}

- (IMHandle)loginHandle
{
  return self->_loginHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginHandle, 0);
}

@end
