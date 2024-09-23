@implementation AFDeviceContextHistoryConfiguration

- (AFDeviceContextHistoryConfiguration)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFDeviceContextHistoryConfigurationMutation *);
  AFDeviceContextHistoryConfiguration *v5;
  AFDeviceContextHistoryConfiguration *v6;
  _AFDeviceContextHistoryConfigurationMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFDeviceContextHistoryConfigurationMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFDeviceContextHistoryConfiguration;
  v5 = -[AFDeviceContextHistoryConfiguration init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFDeviceContextHistoryConfigurationMutation initWithBase:]([_AFDeviceContextHistoryConfigurationMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFDeviceContextHistoryConfigurationMutation isDirty](v7, "isDirty"))
    {
      v6->_keepsHistory = -[_AFDeviceContextHistoryConfigurationMutation getKeepsHistory](v7, "getKeepsHistory");
      v6->_historyBufferSize = -[_AFDeviceContextHistoryConfigurationMutation getHistoryBufferSize](v7, "getHistoryBufferSize");
    }

  }
  return v6;
}

- (AFDeviceContextHistoryConfiguration)init
{
  return -[AFDeviceContextHistoryConfiguration initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFDeviceContextHistoryConfiguration)initWithKeepsHistory:(BOOL)a3 historyBufferSize:(unint64_t)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__AFDeviceContextHistoryConfiguration_initWithKeepsHistory_historyBufferSize___block_invoke;
  v5[3] = &__block_descriptor_41_e55_v16__0___AFDeviceContextHistoryConfigurationMutating__8l;
  v6 = a3;
  v5[4] = a4;
  return -[AFDeviceContextHistoryConfiguration initWithBuilder:](self, "initWithBuilder:", v5);
}

- (NSString)description
{
  return (NSString *)-[AFDeviceContextHistoryConfiguration _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)AFDeviceContextHistoryConfiguration;
  -[AFDeviceContextHistoryConfiguration description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_keepsHistory)
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {keepsHistory = %@, historyBufferSize = %llu}"), v5, v7, self->_historyBufferSize);

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_keepsHistory);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_historyBufferSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFDeviceContextHistoryConfiguration *v4;
  AFDeviceContextHistoryConfiguration *v5;
  _BOOL4 keepsHistory;
  unint64_t historyBufferSize;
  BOOL v8;

  v4 = (AFDeviceContextHistoryConfiguration *)a3;
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
      keepsHistory = self->_keepsHistory;
      if (keepsHistory == -[AFDeviceContextHistoryConfiguration keepsHistory](v5, "keepsHistory"))
      {
        historyBufferSize = self->_historyBufferSize;
        v8 = historyBufferSize == -[AFDeviceContextHistoryConfiguration historyBufferSize](v5, "historyBufferSize");
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

- (AFDeviceContextHistoryConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeviceContextHistoryConfiguration::keepsHistory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFDeviceContextHistoryConfiguration::historyBufferSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  return -[AFDeviceContextHistoryConfiguration initWithKeepsHistory:historyBufferSize:](self, "initWithKeepsHistory:historyBufferSize:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 keepsHistory;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  keepsHistory = self->_keepsHistory;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", keepsHistory);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFDeviceContextHistoryConfiguration::keepsHistory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_historyBufferSize);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFDeviceContextHistoryConfiguration::historyBufferSize"));

}

- (AFDeviceContextHistoryConfiguration)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AFDeviceContextHistoryConfiguration *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("keepsHistory"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    v8 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("historyBufferSize"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v11 = objc_msgSend(v10, "unsignedIntegerValue");
    self = -[AFDeviceContextHistoryConfiguration initWithKeepsHistory:historyBufferSize:](self, "initWithKeepsHistory:historyBufferSize:", v8, v11);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_keepsHistory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("keepsHistory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_historyBufferSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("historyBufferSize"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (BOOL)keepsHistory
{
  return self->_keepsHistory;
}

- (unint64_t)historyBufferSize
{
  return self->_historyBufferSize;
}

void __78__AFDeviceContextHistoryConfiguration_initWithKeepsHistory_historyBufferSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setKeepsHistory:", v3);
  objc_msgSend(v4, "setHistoryBufferSize:", *(_QWORD *)(a1 + 32));

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
  void (**v4)(id, _AFDeviceContextHistoryConfigurationMutation *);
  _AFDeviceContextHistoryConfigurationMutation *v5;
  AFDeviceContextHistoryConfiguration *v6;

  v4 = (void (**)(id, _AFDeviceContextHistoryConfigurationMutation *))a3;
  if (v4)
  {
    v5 = -[_AFDeviceContextHistoryConfigurationMutation initWithBase:]([_AFDeviceContextHistoryConfigurationMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFDeviceContextHistoryConfigurationMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFDeviceContextHistoryConfiguration);
      v6->_keepsHistory = -[_AFDeviceContextHistoryConfigurationMutation getKeepsHistory](v5, "getKeepsHistory");
      v6->_historyBufferSize = -[_AFDeviceContextHistoryConfigurationMutation getHistoryBufferSize](v5, "getHistoryBufferSize");
    }
    else
    {
      v6 = (AFDeviceContextHistoryConfiguration *)-[AFDeviceContextHistoryConfiguration copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFDeviceContextHistoryConfiguration *)-[AFDeviceContextHistoryConfiguration copy](self, "copy");
  }

  return v6;
}

@end
