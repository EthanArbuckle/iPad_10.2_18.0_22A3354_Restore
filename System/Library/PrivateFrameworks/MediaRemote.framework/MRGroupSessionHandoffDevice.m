@implementation MRGroupSessionHandoffDevice

- (MRGroupSessionHandoffDevice)initWithDiscoveredSession:(id)a3
{
  id v4;
  MRGroupSessionHandoffDevice *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRGroupSessionHandoffDevice;
  v5 = -[MRGroupSessionHandoffDevice init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MRGroupSessionHandoffDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MRGroupSessionHandoffDevice *v4;
  MRGroupSessionHandoffDevice *v5;
  id v6;
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;

  v4 = (MRGroupSessionHandoffDevice *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRGroupSessionHandoffDevice identifier](self, "identifier");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[MRGroupSessionHandoffDevice identifier](v5, "identifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      -[MRGroupSessionHandoffDevice bluetoothAddress](self, "bluetoothAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRGroupSessionHandoffDevice bluetoothAddress](v5, "bluetoothAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        v9 = 1;
      else
        v9 = objc_msgSend(v10, "isEqual:", v11);

      goto LABEL_13;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
