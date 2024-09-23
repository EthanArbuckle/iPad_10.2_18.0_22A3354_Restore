@implementation BKSHIDEventKeyCommandsRegistration

- (BKSHIDEventKeyCommandsRegistration)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventKeyCommandsRegistration *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventKeyCommandsRegistration *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventKeyCommandsRegistration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
    v17 = 1024;
    v18 = 30;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventKeyCommandsRegistration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithEnvironment:(id)a3 token:(id)a4 keyCommands:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BKSHIDEventKeyCommandsRegistration *v14;
  uint64_t v15;
  BKSHIDEventDeferringEnvironment *environment;
  uint64_t v17;
  BKSHIDEventDeferringToken *token;
  uint64_t v19;
  NSSet *keyCommands;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  BKSHIDEventKeyCommandsRegistration *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_class();
  if (v12 != objc_opt_class())
  {
    v13 = objc_opt_class();
    if (v13 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventKeyCommandsRegistration cannot be subclassed"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v28 = v23;
        v29 = 2114;
        v30 = v25;
        v31 = 2048;
        v32 = self;
        v33 = 2114;
        v34 = CFSTR("BKSHIDEventKeyCommandsRegistration.m");
        v35 = 1024;
        v36 = 35;
        v37 = 2114;
        v38 = v22;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A12B584);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)BKSHIDEventKeyCommandsRegistration;
  v14 = -[BKSHIDEventKeyCommandsRegistration init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v9, "copy");
    environment = v14->_environment;
    v14->_environment = (BKSHIDEventDeferringEnvironment *)v15;

    v17 = objc_msgSend(v10, "copy");
    token = v14->_token;
    v14->_token = (BKSHIDEventDeferringToken *)v17;

    v19 = objc_msgSend(v11, "copy");
    keyCommands = v14->_keyCommands;
    v14->_keyCommands = (NSSet *)v19;

  }
  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventKeyCommandsRegistration _initWithEnvironment:token:keyCommands:](+[BKSMutableHIDEventKeyCommandsRegistration allocWithZone:](BKSMutableHIDEventKeyCommandsRegistration, "allocWithZone:", a3), "_initWithEnvironment:token:keyCommands:", self->_environment, self->_token, self->_keyCommands);
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventDeferringEnvironment *environment;
  id v5;

  environment = self->_environment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", environment, CFSTR("environment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("token"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyCommands, CFSTR("keyCommands"));

}

- (BKSHIDEventKeyCommandsRegistration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BKSHIDEventKeyCommandsRegistration *v28;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v9 = (void *)v12;
      v13 = (void *)MEMORY[0x1E0C99E60];
      v14 = objc_opt_class();
      objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("keyCommands"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!objc_msgSend(v10, "bs_containsObjectPassingTest:", &__block_literal_global_5494))
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          self = (BKSHIDEventKeyCommandsRegistration *)-[BKSHIDEventKeyCommandsRegistration _initWithEnvironment:token:keyCommands:](self, "_initWithEnvironment:token:keyCommands:", v9, v30, v10);

          v28 = self;
          goto LABEL_12;
        }
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB28A8];
        v37 = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsRegistration: keyCommands contains non-BKSHIDEventKeyCommand elements : %@"), v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v18;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = (void **)v38;
        v21 = &v37;
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB28A8];
        v35 = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsRegistration: keyCommands not of class NSSet : %@"), v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v18;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = &v36;
        v21 = &v35;
      }
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4866, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v27);

    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB28A8];
      v33 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsRegistration: invalid environment : environment=%@"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 4866, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v25);

      v9 = 0;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v31 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventKeyCommandsRegistration: subclasses are not allowed : %@"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v11);

  }
  v28 = 0;
LABEL_12:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[BKSHIDEventDeferringEnvironment hash](self->_environment, "hash");
  v4 = -[BKSHIDEventDeferringToken hash](self->_token, "hash");
  return v3 ^ v4 ^ -[NSSet hash](self->_keyCommands, "hash") ^ 0x1E5B1;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventKeyCommandsRegistration *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = (BKSHIDEventKeyCommandsRegistration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualObjects()
      && BSEqualObjects())
    {
      v7 = BSEqualObjects();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)-[BKSHIDEventKeyCommandsRegistration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSHIDEventKeyCommandsRegistration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_environment, CFSTR("environment"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_token, CFSTR("token"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSHIDEventKeyCommandsRegistration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BKSHIDEventKeyCommandsRegistration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_keyCommands, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, CFSTR("keyCommands"), v4, 0);

  return v5;
}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  return self->_environment;
}

- (BKSHIDEventDeferringToken)deferringToken
{
  return self->_token;
}

- (NSSet)keyCommands
{
  return self->_keyCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

BOOL __52__BKSHIDEventKeyCommandsRegistration_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
