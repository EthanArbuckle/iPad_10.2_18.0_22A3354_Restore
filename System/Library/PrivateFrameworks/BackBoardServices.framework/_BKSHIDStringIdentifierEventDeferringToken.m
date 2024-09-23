@implementation _BKSHIDStringIdentifierEventDeferringToken

- (_BKSHIDStringIdentifierEventDeferringToken)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  _BKSHIDStringIdentifierEventDeferringToken *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BKSHIDStringIdentifierEventDeferringToken *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on _BKSHIDStringIdentifierEventDeferringToken"));
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
    v18 = 137;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (_BKSHIDStringIdentifierEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithString:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BKSHIDStringIdentifierEventDeferringToken;
  v5 = -[BKSHIDEventDeferringToken _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (BOOL)_isString
{
  return self->_stringIdentifier != 0;
}

- (id)_string
{
  return self->_stringIdentifier;
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
  v10.super_class = (Class)_BKSHIDStringIdentifierEventDeferringToken;
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
      v20 = 175;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A121EBCLL);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSString length](self->_stringIdentifier, "length"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_stringIdentifier, CFSTR("stringIdentifier"));

}

- (_BKSHIDStringIdentifierEventDeferringToken)initWithCoder:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BKSHIDStringIdentifierEventDeferringToken *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_BKSHIDStringIdentifierEventDeferringToken;
  v5 = -[BKSHIDEventDeferringToken _init](&v21, sel__init);
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)v5[1];
      v5[1] = v13;

      v12 = v5;
      goto LABEL_6;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB28A8];
    v24 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringToken: empty string"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4866, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v20);

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB28A8];
    v22 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode BKSHIDEventDeferringToken: subclasses are not allowed : %@"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4866, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v11);

  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_stringIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _BKSHIDStringIdentifierEventDeferringToken *v4;
  uint64_t v5;
  char v6;

  v4 = (_BKSHIDStringIdentifierEventDeferringToken *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
      v6 = -[NSString isEqual:](self->_stringIdentifier, "isEqual:", v4->_stringIdentifier);
    else
      v6 = 0;
  }

  return v6;
}

- (id)description
{
  return self->_stringIdentifier;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[_BKSHIDStringIdentifierEventDeferringToken _string](self, "_string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v4, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___BKSHIDStringIdentifierEventDeferringToken_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_47 != -1)
    dispatch_once(&protobufSchema_onceToken_47, block);
  return (id)protobufSchema_schema_46;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
