@implementation CHHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%ld"), v4, -[CHHandle type](self, "type"));

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHHandle value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v5, v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_normalizedValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHHandle normalizedValue](self, "normalizedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v7, v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (CHHandle)initWithHandle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CHHandle *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CHHandle initWithType:value:normalizedValue:](self, "initWithType:value:normalizedValue:", v5, v6, v7);
  return v8;
}

- (CHHandle)initWithType:(int64_t)a3 value:(id)a4 normalizedValue:(id)a5
{
  id v8;
  CHHandle *v9;
  uint64_t v10;
  NSString *normalizedValue;

  v8 = a5;
  v9 = -[CHHandle initWithType:value:](self, "initWithType:value:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    normalizedValue = v9->_normalizedValue;
    v9->_normalizedValue = (NSString *)v10;

  }
  return v9;
}

- (CHHandle)initWithType:(int64_t)a3 value:(id)a4
{
  id v6;
  CHHandle *v7;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHHandle;
  v7 = -[CHHandle init](&v11, sel_init);
  if (v7)
  {
    if (a3)
    {
      if (v6)
      {
LABEL_4:
        v7->_type = a3;
        v8 = objc_msgSend(v6, "copy");
        value = v7->_value;
        v7->_value = (NSString *)v8;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CHHandle initWithType:value:]", CFSTR("type"));
      if (v6)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[CHHandle initWithType:value:]", CFSTR("value"));
    goto LABEL_4;
  }
LABEL_5:

  return v7;
}

- (BOOL)isPseudonym
{
  void *v2;
  char v3;

  -[CHHandle value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("pseud:"));

  return v3;
}

- (BOOL)isTemporary
{
  void *v2;
  char v3;

  -[CHHandle value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("temp:"));

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v3 = -[CHHandle type](self, "type");
  -[CHHandle value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[CHHandle normalizedValue](self, "normalizedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hash");
  v14 = CHHash(3uLL, v7, v8, v9, v10, v11, v12, v13, v3, v5);

  return v14;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)normalizedValue
{
  return self->_normalizedValue;
}

- (int64_t)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHHandle initWithHandle:](+[CHHandle allocWithZone:](CHHandle, "allocWithZone:", a3), "initWithHandle:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  NSString *value;
  void *v8;
  NSString *normalizedValue;
  id v10;

  type = self->_type;
  v5 = a3;
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v6);

  value = self->_value;
  NSStringFromSelector(sel_value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", value, v8);

  normalizedValue = self->_normalizedValue;
  NSStringFromSelector(sel_normalizedValue);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", normalizedValue, v10);

}

- (CHHandle)initWithCoder:(id)a3
{
  id v4;
  CHHandle *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *value;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *normalizedValue;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHHandle;
  v5 = -[CHHandle init](&v16, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_normalizedValue);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    normalizedValue = v5->_normalizedValue;
    v5->_normalizedValue = (NSString *)v13;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CHHandle *v4;
  BOOL v5;

  v4 = (CHHandle *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CHHandle isEqualToHandle:](self, "isEqualToHandle:", v4);
  }

  return v5;
}

- (BOOL)isEqualToHandle:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = -[CHHandle type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[CHHandle value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = (void *)v9;
    if (v8 | v9)
    {
      if (!v9)
      {
        v14 = 0;
        v12 = v8;
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      v11 = objc_msgSend((id)v8, "isEqualToString:", v9);

      if (!v11)
      {
        v14 = 0;
        goto LABEL_11;
      }
    }
    -[CHHandle normalizedValue](self, "normalizedValue");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalizedValue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (v12 | v13) == 0;
    if (v13)
      v14 = objc_msgSend((id)v12, "isEqualToString:", v13);

    goto LABEL_10;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

+ (id)normalizedEmailAddressHandleForValue:(id)a3
{
  id v3;
  CHHandle *v4;
  void *v5;
  CHHandle *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = [CHHandle alloc];
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CHHandle initWithType:value:normalizedValue:](v4, "initWithType:value:normalizedValue:", 3, v3, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)normalizedGenericHandleForValue:(id)a3
{
  id v3;
  CHHandle *v4;
  void *v5;
  CHHandle *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = [CHHandle alloc];
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CHHandle initWithType:value:normalizedValue:](v4, "initWithType:value:normalizedValue:", 1, v3, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)normalizedPhoneNumberHandleForValue:(id)a3 isoCountryCode:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  CHHandle *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = v6;
    if (!objc_msgSend(v7, "length"))
    {
      v8 = PNCopyBestGuessCountryCodeForNumber();

      v7 = (id)v8;
    }
    if (objc_msgSend(v7, "length"))
    {
      CHPhoneNumberNormalizedPhoneNumberString((uint64_t)v5, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CHHandle initWithType:value:normalizedValue:]([CHHandle alloc], "initWithType:value:normalizedValue:", 2, v5, v9);

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

  return v10;
}

+ (int64_t)handleTypeForValue:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "containsString:", CFSTR("@")))
    return 3;
  return 2;
}

@end
