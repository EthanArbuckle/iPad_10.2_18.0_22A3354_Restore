@implementation AFBluetoothHeadGestureConfiguration

- (AFBluetoothHeadGestureConfiguration)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFBluetoothHeadGestureConfigurationMutation *);
  AFBluetoothHeadGestureConfiguration *v5;
  AFBluetoothHeadGestureConfiguration *v6;
  _AFBluetoothHeadGestureConfigurationMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFBluetoothHeadGestureConfigurationMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBluetoothHeadGestureConfiguration;
  v5 = -[AFBluetoothHeadGestureConfiguration init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFBluetoothHeadGestureConfigurationMutation initWithBase:]([_AFBluetoothHeadGestureConfigurationMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFBluetoothHeadGestureConfigurationMutation isDirty](v7, "isDirty"))
    {
      v6->_isEnabled = -[_AFBluetoothHeadGestureConfigurationMutation getIsEnabled](v7, "getIsEnabled");
      v6->_isSupported = -[_AFBluetoothHeadGestureConfigurationMutation getIsSupported](v7, "getIsSupported");
      v6->_acceptGesture = -[_AFBluetoothHeadGestureConfigurationMutation getAcceptGesture](v7, "getAcceptGesture");
      v6->_rejectGesture = -[_AFBluetoothHeadGestureConfigurationMutation getRejectGesture](v7, "getRejectGesture");
    }

  }
  return v6;
}

- (AFBluetoothHeadGestureConfiguration)init
{
  return -[AFBluetoothHeadGestureConfiguration initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFBluetoothHeadGestureConfiguration)initWithIsEnabled:(BOOL)a3 isSupported:(BOOL)a4 acceptGesture:(int64_t)a5 rejectGesture:(int64_t)a6
{
  _QWORD v7[6];
  BOOL v8;
  BOOL v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__AFBluetoothHeadGestureConfiguration_initWithIsEnabled_isSupported_acceptGesture_rejectGesture___block_invoke;
  v7[3] = &__block_descriptor_50_e55_v16__0___AFBluetoothHeadGestureConfigurationMutating__8l;
  v8 = a3;
  v9 = a4;
  v7[4] = a5;
  v7[5] = a6;
  return -[AFBluetoothHeadGestureConfiguration initWithBuilder:](self, "initWithBuilder:", v7);
}

- (id)description
{
  return -[AFBluetoothHeadGestureConfiguration _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t acceptGesture;
  __CFString *v7;
  _BOOL4 isEnabled;
  _BOOL4 isSupported;
  __CFString *v10;
  unint64_t rejectGesture;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  objc_super v18;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v18.receiver = self;
  v18.super_class = (Class)AFBluetoothHeadGestureConfiguration;
  -[AFBluetoothHeadGestureConfiguration description](&v18, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  acceptGesture = self->_acceptGesture;
  if (acceptGesture > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A30230[acceptGesture];
  isEnabled = self->_isEnabled;
  isSupported = self->_isSupported;
  v10 = v7;
  rejectGesture = self->_rejectGesture;
  if (rejectGesture > 2)
    v12 = CFSTR("(unknown)");
  else
    v12 = off_1E3A30230[rejectGesture];
  if (isSupported)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (isEnabled)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = v12;
  v16 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {isEnabled = %@, isSupported = %@, acceptGesture = %@, rejectGesture = %@}"), v5, v14, v13, v10, v15);

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSupported);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_acceptGesture);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rejectGesture);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  AFBluetoothHeadGestureConfiguration *v4;
  AFBluetoothHeadGestureConfiguration *v5;
  _BOOL4 isEnabled;
  _BOOL4 isSupported;
  int64_t acceptGesture;
  int64_t rejectGesture;
  BOOL v10;

  v4 = (AFBluetoothHeadGestureConfiguration *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isEnabled = self->_isEnabled;
      if (isEnabled == -[AFBluetoothHeadGestureConfiguration isEnabled](v5, "isEnabled")
        && (isSupported = self->_isSupported,
            isSupported == -[AFBluetoothHeadGestureConfiguration isSupported](v5, "isSupported"))
        && (acceptGesture = self->_acceptGesture,
            acceptGesture == -[AFBluetoothHeadGestureConfiguration acceptGesture](v5, "acceptGesture")))
      {
        rejectGesture = self->_rejectGesture;
        v10 = rejectGesture == -[AFBluetoothHeadGestureConfiguration rejectGesture](v5, "rejectGesture");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFBluetoothHeadGestureConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadGestureConfiguration::isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadGestureConfiguration::isSupported"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadGestureConfiguration::acceptGesture"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadGestureConfiguration::rejectGesture"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  return -[AFBluetoothHeadGestureConfiguration initWithIsEnabled:isSupported:acceptGesture:rejectGesture:](self, "initWithIsEnabled:isSupported:acceptGesture:rejectGesture:", v6, v8, v10, v12);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 isEnabled;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  isEnabled = self->_isEnabled;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", isEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFBluetoothHeadGestureConfiguration::isEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSupported);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFBluetoothHeadGestureConfiguration::isSupported"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_acceptGesture);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFBluetoothHeadGestureConfiguration::acceptGesture"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rejectGesture);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("AFBluetoothHeadGestureConfiguration::rejectGesture"));

}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (int64_t)acceptGesture
{
  return self->_acceptGesture;
}

- (int64_t)rejectGesture
{
  return self->_rejectGesture;
}

void __97__AFBluetoothHeadGestureConfiguration_initWithIsEnabled_isSupported_acceptGesture_rejectGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "setIsEnabled:", v3);
  objc_msgSend(v4, "setIsSupported:", *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(v4, "setAcceptGesture:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setRejectGesture:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFBluetoothHeadGestureConfigurationMutation *);
  _AFBluetoothHeadGestureConfigurationMutation *v5;
  AFBluetoothHeadGestureConfiguration *v6;

  v4 = (void (**)(id, _AFBluetoothHeadGestureConfigurationMutation *))a3;
  if (v4)
  {
    v5 = -[_AFBluetoothHeadGestureConfigurationMutation initWithBase:]([_AFBluetoothHeadGestureConfigurationMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFBluetoothHeadGestureConfigurationMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFBluetoothHeadGestureConfiguration);
      v6->_isEnabled = -[_AFBluetoothHeadGestureConfigurationMutation getIsEnabled](v5, "getIsEnabled");
      v6->_isSupported = -[_AFBluetoothHeadGestureConfigurationMutation getIsSupported](v5, "getIsSupported");
      v6->_acceptGesture = -[_AFBluetoothHeadGestureConfigurationMutation getAcceptGesture](v5, "getAcceptGesture");
      v6->_rejectGesture = -[_AFBluetoothHeadGestureConfigurationMutation getRejectGesture](v5, "getRejectGesture");
    }
    else
    {
      v6 = (AFBluetoothHeadGestureConfiguration *)-[AFBluetoothHeadGestureConfiguration copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFBluetoothHeadGestureConfiguration *)-[AFBluetoothHeadGestureConfiguration copy](self, "copy");
  }

  return v6;
}

@end
