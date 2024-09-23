@implementation AKToken

+ (id)tokenWithValue:(id)a3 lifetime:(id)a4
{
  return (id)objc_msgSend(a1, "tokenWithValue:lifetime:creationTime:", a3, a4, 0);
}

+ (id)tokenWithValue:(id)a3 lifetime:(id)a4 creationTime:(id)a5
{
  id v7;
  id v8;
  id v9;
  AKToken *v10;
  uint64_t v11;
  NSString *stringValue;
  void *v13;
  uint64_t v14;
  NSDate *expirationDate;
  void *v16;
  double v17;
  uint64_t v18;
  NSDate *creationDate;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(AKToken);
  v11 = objc_msgSend(v9, "copy");

  stringValue = v10->_stringValue;
  v10->_stringValue = (NSString *)v11;

  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v13, "dateWithTimeIntervalSinceNow:");
    v14 = objc_claimAutoreleasedReturnValue();
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v14;

  }
  if (v8)
  {
    v16 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v16, "dateWithTimeIntervalSince1970:", v17 / 1000.0);
    v18 = objc_claimAutoreleasedReturnValue();
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v18;

  }
  return v10;
}

+ (id)tokenWithBase64String:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(a1, "_tokenComponentsFromBase64String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 4)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "tokenWithValue:lifetime:creationTime:", v8, v12, v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "tokenWithValue:lifetime:", v8, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "setName:", v9);

  }
  else
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[AKToken tokenWithBase64String:].cold.1();

    v7 = 0;
  }

  return v7;
}

+ (id)tokenWithDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cts"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (v6 || !v10)
  {
    if (!v6)
    {
      v13 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v6 = v10;
  }
  objc_msgSend(a1, "tokenWithValue:lifetime:creationTime:", v6, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v13;
}

+ (id)idmsTokenWithBase64String:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(a1, "_tokenComponentsFromBase64String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (objc_msgSend(v5, "count") == 2)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[AKToken tokenWithValue:lifetime:creationTime:](AKToken, "tokenWithValue:lifetime:creationTime:", v6, 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[AKToken idmsTokenWithBase64String:].cold.1();

    v10 = 0;
  }

  return v10;
}

+ (id)_tokenComponentsFromBase64String:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tstringValue: %@,\n\texpirationDate: %@,\n\tcreationDate: %@,\n\tname: %@,\n}>"), v5, self, self->_stringValue, self->_expirationDate, self->_creationDate, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AKToken)initWithCoder:(id)a3
{
  id v4;
  AKToken *v5;
  uint64_t v6;
  NSString *stringValue;
  uint64_t v8;
  NSDate *expirationDate;
  uint64_t v10;
  NSDate *creationDate;
  uint64_t v12;
  NSString *name;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKToken;
  v5 = -[AKToken init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stringValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expirationDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_creationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v12 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *stringValue;
  id v5;

  stringValue = self->_stringValue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stringValue, CFSTR("_stringValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("_expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("_creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

+ (void)tokenWithBase64String:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Invalid token string! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)idmsTokenWithBase64String:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Invalid IdMS token string! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
