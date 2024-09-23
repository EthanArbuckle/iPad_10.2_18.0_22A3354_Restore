@implementation _BKSHIDCAContextEventDeferringToken

- (_BKSHIDCAContextEventDeferringToken)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  _BKSHIDCAContextEventDeferringToken *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BKSHIDCAContextEventDeferringToken *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on _BKSHIDCAContextEventDeferringToken"));
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
    v16 = CFSTR("BKSHIDEventDeferringToken.m");
    v17 = 1024;
    v18 = 29;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (_BKSHIDCAContextEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithIdentifier:(unsigned int)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_BKSHIDCAContextEventDeferringToken;
  result = -[BKSHIDEventDeferringToken _init](&v5, sel__init);
  if (result)
    *((_DWORD *)result + 2) = a3;
  return result;
}

- (BOOL)_isIdentifierOfCAContext
{
  return self->_CAContextID != 0;
}

- (unsigned)_identifierOfCAContext
{
  return self->_CAContextID;
}

- (id)initForProtobufDecoding
{
  id v3;
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
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)_BKSHIDCAContextEventDeferringToken;
  v3 = -[BKSHIDEventDeferringToken _init](&v10, sel__init);
  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot subclass BKSHIDEventDeferringToken"));
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
      v18 = CFSTR("BKSHIDEventDeferringToken.m");
      v19 = 1024;
      v20 = 67;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A120F9CLL);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt32:forKey:", self->_CAContextID, CFSTR("CAContext"));
}

- (_BKSHIDCAContextEventDeferringToken)initWithCoder:(id)a3
{
  id v4;
  _DWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  _BKSHIDCAContextEventDeferringToken *v15;
  int v16;
  objc_super v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BKSHIDCAContextEventDeferringToken;
  v5 = -[BKSHIDEventDeferringToken _init](&v18, sel__init);
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v16 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("CAContext"));
    if (v16)
    {
      v5[2] = v16;
      v15 = v5;
      goto LABEL_6;
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v21 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringToken: invalid contextID : %i"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (void **)v22;
    v12 = &v21;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v19 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringToken: subclasses are not allowed : %@"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v20;
    v12 = &v19;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v14);

  v15 = 0;
LABEL_6:

  return v15;
}

- (unint64_t)hash
{
  return self->_CAContextID ^ 0x191FFLL;
}

- (BOOL)isEqual:(id)a3
{
  _BKSHIDCAContextEventDeferringToken *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (_BKSHIDCAContextEventDeferringToken *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && self->_CAContextID == v4->_CAContextID;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x"), self->_CAContextID);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", -[_BKSHIDCAContextEventDeferringToken _identifierOfCAContext](self, "_identifierOfCAContext"), 0, 1);

}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___BKSHIDCAContextEventDeferringToken_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_3498 != -1)
    dispatch_once(&protobufSchema_onceToken_3498, block);
  return (id)protobufSchema_schema_3499;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
