@implementation AFBluetoothWirelessSplitterSessionInfo

- (AFBluetoothWirelessSplitterSessionInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFBluetoothWirelessSplitterSessionInfoMutation *);
  AFBluetoothWirelessSplitterSessionInfo *v5;
  AFBluetoothWirelessSplitterSessionInfo *v6;
  _AFBluetoothWirelessSplitterSessionInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSArray *deviceAddresses;
  objc_super v12;

  v4 = (void (**)(id, _AFBluetoothWirelessSplitterSessionInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFBluetoothWirelessSplitterSessionInfo;
  v5 = -[AFBluetoothWirelessSplitterSessionInfo init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFBluetoothWirelessSplitterSessionInfoMutation initWithBase:]([_AFBluetoothWirelessSplitterSessionInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFBluetoothWirelessSplitterSessionInfoMutation isDirty](v7, "isDirty"))
    {
      v6->_state = -[_AFBluetoothWirelessSplitterSessionInfoMutation getState](v7, "getState");
      -[_AFBluetoothWirelessSplitterSessionInfoMutation getDeviceAddresses](v7, "getDeviceAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      deviceAddresses = v6->_deviceAddresses;
      v6->_deviceAddresses = (NSArray *)v9;

    }
  }

  return v6;
}

- (AFBluetoothWirelessSplitterSessionInfo)init
{
  return -[AFBluetoothWirelessSplitterSessionInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFBluetoothWirelessSplitterSessionInfo)initWithState:(int64_t)a3 deviceAddresses:(id)a4
{
  id v6;
  id v7;
  AFBluetoothWirelessSplitterSessionInfo *v8;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__AFBluetoothWirelessSplitterSessionInfo_initWithState_deviceAddresses___block_invoke;
  v10[3] = &unk_1E3A2D080;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  v8 = -[AFBluetoothWirelessSplitterSessionInfo initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (id)description
{
  return -[AFBluetoothWirelessSplitterSessionInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t state;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFBluetoothWirelessSplitterSessionInfo;
  -[AFBluetoothWirelessSplitterSessionInfo description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  if (state > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A30148[state];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {state = %@, deviceAddresses = %@}"), v5, v8, self->_deviceAddresses);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSArray hash](self->_deviceAddresses, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFBluetoothWirelessSplitterSessionInfo *v4;
  AFBluetoothWirelessSplitterSessionInfo *v5;
  int64_t state;
  NSArray *v7;
  NSArray *deviceAddresses;
  BOOL v9;

  v4 = (AFBluetoothWirelessSplitterSessionInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      state = self->_state;
      if (state == -[AFBluetoothWirelessSplitterSessionInfo state](v5, "state"))
      {
        -[AFBluetoothWirelessSplitterSessionInfo deviceAddresses](v5, "deviceAddresses");
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
        deviceAddresses = self->_deviceAddresses;
        v9 = deviceAddresses == v7 || -[NSArray isEqual:](deviceAddresses, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (AFBluetoothWirelessSplitterSessionInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  AFBluetoothWirelessSplitterSessionInfo *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothWirelessSplitterSessionInfo::state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("AFBluetoothWirelessSplitterSessionInfo::deviceAddresses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[AFBluetoothWirelessSplitterSessionInfo initWithState:deviceAddresses:](self, "initWithState:deviceAddresses:", v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t state;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  state = self->_state;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFBluetoothWirelessSplitterSessionInfo::state"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_deviceAddresses, CFSTR("AFBluetoothWirelessSplitterSessionInfo::deviceAddresses"));
}

- (int64_t)state
{
  return self->_state;
}

- (NSArray)deviceAddresses
{
  return self->_deviceAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAddresses, 0);
}

void __72__AFBluetoothWirelessSplitterSessionInfo_initWithState_deviceAddresses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setState:", v3);
  objc_msgSend(v4, "setDeviceAddresses:", *(_QWORD *)(a1 + 32));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFBluetoothWirelessSplitterSessionInfoMutation *);
  _AFBluetoothWirelessSplitterSessionInfoMutation *v5;
  AFBluetoothWirelessSplitterSessionInfo *v6;
  void *v7;
  uint64_t v8;
  NSArray *deviceAddresses;

  v4 = (void (**)(id, _AFBluetoothWirelessSplitterSessionInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFBluetoothWirelessSplitterSessionInfoMutation initWithBase:]([_AFBluetoothWirelessSplitterSessionInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFBluetoothWirelessSplitterSessionInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFBluetoothWirelessSplitterSessionInfo);
      v6->_state = -[_AFBluetoothWirelessSplitterSessionInfoMutation getState](v5, "getState");
      -[_AFBluetoothWirelessSplitterSessionInfoMutation getDeviceAddresses](v5, "getDeviceAddresses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      deviceAddresses = v6->_deviceAddresses;
      v6->_deviceAddresses = (NSArray *)v8;

    }
    else
    {
      v6 = (AFBluetoothWirelessSplitterSessionInfo *)-[AFBluetoothWirelessSplitterSessionInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFBluetoothWirelessSplitterSessionInfo *)-[AFBluetoothWirelessSplitterSessionInfo copy](self, "copy");
  }

  return v6;
}

@end
