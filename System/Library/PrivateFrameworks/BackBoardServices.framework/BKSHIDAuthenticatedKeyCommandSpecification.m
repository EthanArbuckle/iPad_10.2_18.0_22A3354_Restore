@implementation BKSHIDAuthenticatedKeyCommandSpecification

- (id)_init
{
  BKSHIDAuthenticatedKeyCommandSpecification *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BKSHIDAuthenticatedKeyCommandSpecification *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDAuthenticatedKeyCommandSpecification;
  v3 = -[BKSHIDAuthenticatedKeyCommandSpecification init](&v10, sel_init);
  if (v3)
  {
    v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no subclassing"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v12 = v7;
        v13 = 2114;
        v14 = v9;
        v15 = 2048;
        v16 = v3;
        v17 = 2114;
        v18 = CFSTR("BKSHIDAuthenticatedKeyCommandSpecification.m");
        v19 = 1024;
        v20 = 28;
        v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A14966CLL);
    }
  }
  return v3;
}

- (unint64_t)hash
{
  return -[BKSHIDEventKeyCommand hash](self->_keyCommand, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_context)
    v5 = BSEqualObjects();
  else
    v5 = 0;

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (BKSHIDAuthenticatedKeyCommandSpecification)initWithCoder:(id)a3
{
  id v4;
  BKSHIDAuthenticatedKeyCommandSpecification *v5;
  uint64_t v6;
  BKSHIDEventKeyCommand *keyCommand;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BKSHIDAuthenticatedKeyCommandSpecification _init]([BKSHIDAuthenticatedKeyCommandSpecification alloc], "_init");

  if (v5)
  {
    v5->_context = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("context"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyCommand"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyCommand = v5->_keyCommand;
    v5->_keyCommand = (BKSHIDEventKeyCommand *)v6;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2FE0];
      v17 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_keyCommand invalid class:%@"), objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 22, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        BKLogEventDelivery();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v12;
          _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, "error decoding authenticated key command spec:%{public}@", buf, 0xCu);
        }

        objc_msgSend(v4, "failWithError:", v12);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BKSHIDEventKeyCommand *keyCommand;
  id v5;

  keyCommand = self->_keyCommand;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyCommand, CFSTR("keyCommand"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_context, CFSTR("context"));

}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDAuthenticatedKeyCommandSpecification;
  return -[BKSHIDAuthenticatedKeyCommandSpecification init](&v3, sel_init);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_msgSend(v6, "appendUInt64:withName:format:", self->_context, CFSTR("context"), 1);
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", self->_keyCommand, CFSTR("keyCommands"));

}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BKSHIDEventKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (void)setKeyCommand:(id)a3
{
  objc_storeStrong((id *)&self->_keyCommand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommand, 0);
}

+ (id)specificationWithKeyCommand:(id)a3 context:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = -[BKSHIDAuthenticatedKeyCommandSpecification _init]([BKSHIDAuthenticatedKeyCommandSpecification alloc], "_init");
  objc_msgSend(v6, "setContext:", a4);
  objc_msgSend(v6, "setKeyCommand:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BKSHIDAuthenticatedKeyCommandSpecification_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_10576 != -1)
    dispatch_once(&protobufSchema_onceToken_10576, block);
  return (id)protobufSchema_schema_10577;
}

void __60__BKSHIDAuthenticatedKeyCommandSpecification_protobufSchema__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", objc_opt_class(), &__block_literal_global_10579);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)protobufSchema_schema_10577;
  protobufSchema_schema_10577 = v0;

}

void __60__BKSHIDAuthenticatedKeyCommandSpecification_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_context");
  objc_msgSend(v2, "addRepeatingField:containsClass:", "_keyCommands", objc_opt_class());

}

@end
