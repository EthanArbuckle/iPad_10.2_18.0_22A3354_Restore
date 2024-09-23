@implementation ASCAdamID

- (ASCAdamID)initWithStringValue:(id)a3
{
  id v4;
  ASCAdamID *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v9.receiver = self;
  v9.super_class = (Class)ASCAdamID;
  v5 = -[ASCAdamID init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

- (ASCAdamID)initWithNumberValue:(id)a3
{
  void *v4;
  ASCAdamID *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASCAdamID initWithStringValue:](self, "initWithStringValue:", v4);

  return v5;
}

- (ASCAdamID)initWithInt64:(int64_t)a3
{
  void *v4;
  ASCAdamID *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), a3);
  v5 = -[ASCAdamID initWithStringValue:](self, "initWithStringValue:", v4);

  return v5;
}

+ (ASCAdamID)invalidAdamID
{
  return (ASCAdamID *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithInt64:", 0x8000000000000000);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAdamID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASCAdamID *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[ASCAdamID initWithStringValue:](self, "initWithStringValue:", v5);
    v6 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ASCAdamID initWithCoder:].cold.1();
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCAdamID stringValue](self, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stringValue"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASCAdamID stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") + 47;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCAdamID stringValue](self, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
      v11 = objc_msgSend(v8, "isEqual:", v9);
    else
      v11 = v8 == (void *)v9;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCAdamID stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v4, CFSTR("stringValue"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNumber)numberValue
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB37E8]);
  -[ASCAdamID stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLongLong:", objc_msgSend(v4, "longLongValue"));

  return (NSNumber *)v5;
}

- (int64_t)int64value
{
  void *v2;
  int64_t v3;

  -[ASCAdamID stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (void)initWithCoder:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not decode ASCAdamID because stringValue was missing", v0, 2u);
}

@end
