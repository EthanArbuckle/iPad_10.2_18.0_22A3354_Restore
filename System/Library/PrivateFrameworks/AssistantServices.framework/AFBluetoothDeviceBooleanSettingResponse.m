@implementation AFBluetoothDeviceBooleanSettingResponse

- (AFBluetoothDeviceBooleanSettingResponse)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFBluetoothDeviceBooleanSettingResponseMutation *);
  AFBluetoothDeviceBooleanSettingResponse *v5;
  AFBluetoothDeviceBooleanSettingResponse *v6;
  _AFBluetoothDeviceBooleanSettingResponseMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFBluetoothDeviceBooleanSettingResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBluetoothDeviceBooleanSettingResponse;
  v5 = -[AFBluetoothDeviceBooleanSettingResponse init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFBluetoothDeviceBooleanSettingResponseMutation initWithBase:]([_AFBluetoothDeviceBooleanSettingResponseMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFBluetoothDeviceBooleanSettingResponseMutation isDirty](v7, "isDirty"))
    {
      v6->_value = -[_AFBluetoothDeviceBooleanSettingResponseMutation getValue](v7, "getValue");
      v6->_status = -[_AFBluetoothDeviceBooleanSettingResponseMutation getStatus](v7, "getStatus");
    }

  }
  return v6;
}

- (AFBluetoothDeviceBooleanSettingResponse)init
{
  return -[AFBluetoothDeviceBooleanSettingResponse initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFBluetoothDeviceBooleanSettingResponse)initWithValue:(int64_t)a3 status:(int64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__AFBluetoothDeviceBooleanSettingResponse_initWithValue_status___block_invoke;
  v5[3] = &__block_descriptor_48_e59_v16__0___AFBluetoothDeviceBooleanSettingResponseMutating__8l;
  v5[4] = a3;
  v5[5] = a4;
  return -[AFBluetoothDeviceBooleanSettingResponse initWithBuilder:](self, "initWithBuilder:", v5);
}

- (id)description
{
  return -[AFBluetoothDeviceBooleanSettingResponse _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t value;
  __CFString *v7;
  __CFString *v8;
  unint64_t status;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_super v14;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14.receiver = self;
  v14.super_class = (Class)AFBluetoothDeviceBooleanSettingResponse;
  -[AFBluetoothDeviceBooleanSettingResponse description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A2DBC0[value];
  v8 = v7;
  status = self->_status;
  if (status > 4)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E3A2EEA0[status];
  v11 = v10;
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {value = %@, status = %@}"), v5, v8, v11);

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_value);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFBluetoothDeviceBooleanSettingResponse *v4;
  AFBluetoothDeviceBooleanSettingResponse *v5;
  int64_t value;
  int64_t status;
  BOOL v8;

  v4 = (AFBluetoothDeviceBooleanSettingResponse *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      value = self->_value;
      if (value == -[AFBluetoothDeviceBooleanSettingResponse value](v5, "value"))
      {
        status = self->_status;
        v8 = status == -[AFBluetoothDeviceBooleanSettingResponse status](v5, "status");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (AFBluetoothDeviceBooleanSettingResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceBooleanSettingResponse::value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceBooleanSettingResponse::status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  return -[AFBluetoothDeviceBooleanSettingResponse initWithValue:status:](self, "initWithValue:status:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t value;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  value = self->_value;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFBluetoothDeviceBooleanSettingResponse::value"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_status);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFBluetoothDeviceBooleanSettingResponse::status"));

}

- (int64_t)value
{
  return self->_value;
}

- (int64_t)status
{
  return self->_status;
}

void __64__AFBluetoothDeviceBooleanSettingResponse_initWithValue_status___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setValue:", v3);
  objc_msgSend(v4, "setStatus:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFBluetoothDeviceBooleanSettingResponseMutation *);
  _AFBluetoothDeviceBooleanSettingResponseMutation *v5;
  AFBluetoothDeviceBooleanSettingResponse *v6;

  v4 = (void (**)(id, _AFBluetoothDeviceBooleanSettingResponseMutation *))a3;
  if (v4)
  {
    v5 = -[_AFBluetoothDeviceBooleanSettingResponseMutation initWithBase:]([_AFBluetoothDeviceBooleanSettingResponseMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFBluetoothDeviceBooleanSettingResponseMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFBluetoothDeviceBooleanSettingResponse);
      v6->_value = -[_AFBluetoothDeviceBooleanSettingResponseMutation getValue](v5, "getValue");
      v6->_status = -[_AFBluetoothDeviceBooleanSettingResponseMutation getStatus](v5, "getStatus");
    }
    else
    {
      v6 = (AFBluetoothDeviceBooleanSettingResponse *)-[AFBluetoothDeviceBooleanSettingResponse copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFBluetoothDeviceBooleanSettingResponse *)-[AFBluetoothDeviceBooleanSettingResponse copy](self, "copy");
  }

  return v6;
}

@end
