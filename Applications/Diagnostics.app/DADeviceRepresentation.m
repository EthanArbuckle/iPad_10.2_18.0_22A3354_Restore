@implementation DADeviceRepresentation

- (DADeviceRepresentation)initWithSerialNumber:(id)a3 isLocal:(BOOL)a4 attributes:(id)a5
{
  id v8;
  id v9;
  DADeviceRepresentation *v10;
  void *v11;
  id v12;
  DADeviceState *v13;
  DADeviceState *state;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceRepresentation;
  v10 = -[DADeviceRepresentation init](&v16, "init");
  if (v10)
  {
    v11 = &__NSDictionary0__struct;
    if (v9)
      v11 = v9;
    v12 = v11;

    v10->_local = a4;
    v13 = -[DADeviceState initWithSerialNumber:attributes:]([DADeviceState alloc], "initWithSerialNumber:attributes:", v8, v12);
    state = v10->_state;
    v10->_state = v13;

    v9 = v12;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceRepresentation state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serialNumber"));
  v4 = objc_msgSend(v3, "hash");

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___DADevice))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceRepresentation state](self, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceRepresentation state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serialNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@; %p: %@>"),
                   v5,
                   self,
                   v7));

  return (NSString *)v8;
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (BOOL)isLocal
{
  return self->_local;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
