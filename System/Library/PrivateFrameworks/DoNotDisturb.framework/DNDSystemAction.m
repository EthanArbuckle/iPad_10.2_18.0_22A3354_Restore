@implementation DNDSystemAction

+ (BOOL)runtimeIsSupported:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (NSClassFromString(CFSTR("WFToggleSettingContextualAction"))
    && NSClassFromString(CFSTR("WFReverseContextualAction")))
  {
    return 1;
  }
  v5 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
  {
    +[DNDSystemAction runtimeIsSupported:].cold.1(v5);
    if (!a3)
      return 0;
    goto LABEL_6;
  }
  if (a3)
  {
LABEL_6:
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Failed to store system action: VoiceShortcutClient framework is not loaded.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1006, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (DNDSystemAction)initWithAction:(id)a3 enabled:(BOOL)a4
{
  id v7;
  DNDSystemAction *v8;
  DNDSystemAction *v9;
  DNDSystemAction *v10;
  objc_super v12;

  v7 = a3;
  if (objc_msgSend((id)objc_opt_class(), "runtimeIsSupported:", 0))
  {
    v12.receiver = self;
    v12.super_class = (Class)DNDSystemAction;
    v8 = -[DNDSystemAction init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_action, a3);
      v9->_enabled = a4;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (DNDSystemAction)initWithAction:(id)a3 reverseAction:(id)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  DNDSystemAction *v10;
  DNDSystemAction *v11;

  v5 = a5;
  v9 = a4;
  v10 = -[DNDSystemAction initWithAction:enabled:](self, "initWithAction:enabled:", a3, v5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_reverseAction, a4);

  return v11;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[DNDSystemAction action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSystemAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  DNDSystemAction *v9;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "runtimeIsSupported:", 0))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DNDActionEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", NSClassFromString(CFSTR("WFToggleSettingContextualAction")), CFSTR("DNDActionAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", NSClassFromString(CFSTR("WFReverseContextualAction")), CFSTR("DNDActionReverseAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[DNDSystemAction initWithAction:reverseAction:enabled:](self, "initWithAction:reverseAction:enabled:", v7, v8, v6);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 enabled;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  enabled = self->_enabled;
  v7 = a3;
  objc_msgSend(v4, "numberWithBool:", enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("DNDActionEnabled"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_action, CFSTR("DNDActionAction"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_reverseAction, CFSTR("DNDActionReverseAction"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[DNDSystemAction action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSystemAction reverseAction](self, "reverseAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[DNDSystemAction isEnabled](self, "isEnabled");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  DNDSystemAction *v7;
  DNDSystemAction *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = (DNDSystemAction *)a3;
  if (self == v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[DNDSystemAction action](self, "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSystemAction action](v8, "action");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[DNDSystemAction action](self, "action");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        -[DNDSystemAction action](v8, "action");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          LOBYTE(v14) = 0;
LABEL_27:

          goto LABEL_28;
        }
        v4 = (void *)v12;
        -[DNDSystemAction action](self, "action");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSystemAction action](v8, "action");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v5))
        {
          LOBYTE(v14) = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      -[DNDSystemAction reverseAction](self, "reverseAction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSystemAction reverseAction](v8, "reverseAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
        goto LABEL_16;
      -[DNDSystemAction reverseAction](self, "reverseAction");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

        LOBYTE(v14) = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      -[DNDSystemAction reverseAction](v8, "reverseAction");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        LOBYTE(v14) = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      -[DNDSystemAction reverseAction](self, "reverseAction");
      v19 = objc_claimAutoreleasedReturnValue();
      -[DNDSystemAction reverseAction](v8, "reverseAction");
      v20 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v19;
      v21 = (void *)v19;
      v4 = (void *)v20;
      if (objc_msgSend(v21, "isEqual:", v20))
      {
LABEL_16:
        v22 = -[DNDSystemAction isEnabled](self, "isEnabled");
        v14 = v22 ^ -[DNDSystemAction isEnabled](v8, "isEnabled") ^ 1;
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          v13 = v27;
          v4 = v28;
          v5 = v26;
          if (v9 != v10)
            goto LABEL_26;
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    LOBYTE(v14) = 0;
  }
LABEL_29:

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSystemAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSystemAction isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSystemAction action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSystemAction reverseAction](self, "reverseAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@; enabled: %@; action: %@; reverse: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAction:reverseAction:enabled:", self->_action, self->_reverseAction, self->_enabled);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSystemAction initWithAction:reverseAction:enabled:](+[DNDMutableSystemAction allocWithZone:](DNDMutableSystemAction, "allocWithZone:", a3), "initWithAction:reverseAction:enabled:", self->_action, self->_reverseAction, self->_enabled);
}

- (WFToggleSettingContextualAction)action
{
  return self->_action;
}

- (WFReverseContextualAction)reverseAction
{
  return self->_reverseAction;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (void)runtimeIsSupported:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19ABEB000, log, OS_LOG_TYPE_ERROR, "Failed to store system action: VoiceShortcutClient framework is not loaded.", v1, 2u);
}

@end
