@implementation FMDBluetoothDiscoveryToken

- (FMDBluetoothDiscoveryToken)init
{
  FMDBluetoothDiscoveryToken *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDBluetoothDiscoveryToken;
  v2 = -[FMDBluetoothDiscoveryToken init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    -[FMDBluetoothDiscoveryToken setUuid:](v2, "setUuid:", v3);

  }
  return v2;
}

- (void)startDiscoveryForDuration:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
  -[FMDBluetoothDiscoveryToken setEndDate:](self, "setEndDate:", v4);

  v5 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken delegate](self, "delegate"));
  v6 = (void *)v5;
  if (v5)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector(v5, "discoveryRequestedStart:");
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "discoveryRequestedStart:", self);
      v6 = v8;
    }
  }

}

- (void)stopDiscovery
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken delegate](self, "delegate"));
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector(v3, "discoveryRequestedStop:");
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "discoveryRequestedStop:", self);
      v4 = v6;
    }
  }

}

- (BOOL)isDiscoveryActive
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken delegate](self, "delegate"));
  v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "isDiscoveryActive:") & 1) != 0)
    v5 = objc_msgSend(v4, "isDiscoveryActive:", self);
  else
    v5 = 0;

  return v5;
}

- (NSString)description
{
  FMDBluetoothDiscoveryToken *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken endDate](v2, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p-%@"), v2, v3));

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  FMDBluetoothDiscoveryToken *v4;
  uint64_t v5;
  FMDBluetoothDiscoveryToken *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = (FMDBluetoothDiscoveryToken *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[FMDBluetoothDiscoveryToken hash](self, "hash");
      v8 = -[FMDBluetoothDiscoveryToken hash](v6, "hash");

      v9 = v7 == v8;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothDiscoveryToken uuid](self, "uuid"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)tokenDiscoveryEnded
{
  return self->_tokenDiscoveryEnded;
}

- (void)setTokenDiscoveryEnded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FMDBluetoothDiscoveryTokenDelegate)delegate
{
  return (FMDBluetoothDiscoveryTokenDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_tokenDiscoveryEnded, 0);
}

@end
