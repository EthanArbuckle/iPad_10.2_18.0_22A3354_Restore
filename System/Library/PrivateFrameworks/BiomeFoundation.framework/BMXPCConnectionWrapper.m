@implementation BMXPCConnectionWrapper

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BMXPCConnectionWrapper invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BMXPCConnectionWrapper;
  -[BMXPCConnectionWrapper dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[BMXPCConnectionWrapper setIsValid:](self, "setIsValid:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (id)_initWithConnection:(id)a3
{
  id v5;
  BMXPCConnectionWrapper *v6;
  BMXPCConnectionWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMXPCConnectionWrapper;
  v6 = -[BMXPCConnectionWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isValid = v5 != 0;
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

@end
