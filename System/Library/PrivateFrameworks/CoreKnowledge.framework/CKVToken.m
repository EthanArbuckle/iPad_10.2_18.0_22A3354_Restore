@implementation CKVToken

- (CKVToken)initWithValue:(id)a3 cleanValue:(id)a4 beginIndex:(unint64_t)a5 endIndex:(unint64_t)a6 isSignificant:(BOOL)a7 isWhitespace:(BOOL)a8
{
  return -[CKVToken initWithValue:cleanValue:beginIndex:endIndex:isSignificant:isWhitespace:normalizedValues:](self, "initWithValue:cleanValue:beginIndex:endIndex:isSignificant:isWhitespace:normalizedValues:", a3, a4, a5, a6, a7, a8, 0);
}

- (CKVToken)initWithValue:(id)a3 cleanValue:(id)a4 beginIndex:(unint64_t)a5 endIndex:(unint64_t)a6 isSignificant:(BOOL)a7 isWhitespace:(BOOL)a8 normalizedValues:(id)a9
{
  id v15;
  id v16;
  id v17;
  CKVToken *v18;
  uint64_t v19;
  NSString *value;
  NSString *v21;
  uint64_t v22;
  NSString *cleanValue;
  uint64_t v24;
  NSArray *normalizedValues;
  CKVToken *v26;
  NSObject *v27;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CKVToken;
  v18 = -[CKVToken init](&v29, sel_init);
  if (!v18)
  {
LABEL_6:
    v26 = v18;
    goto LABEL_10;
  }
  v19 = objc_msgSend(v15, "copy");
  value = v18->_value;
  v18->_value = (NSString *)v19;

  v21 = v18->_value;
  if (v21 && -[NSString length](v21, "length"))
  {
    v22 = objc_msgSend(v16, "copy");
    cleanValue = v18->_cleanValue;
    v18->_cleanValue = (NSString *)v22;

    v18->_beginIndex = a5;
    v18->_endIndex = a6;
    v18->_isSignificant = a7;
    v18->_isWhitespace = a8;
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v17);
      v24 = objc_claimAutoreleasedReturnValue();
      normalizedValues = v18->_normalizedValues;
      v18->_normalizedValues = (NSArray *)v24;

    }
    goto LABEL_6;
  }
  v27 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CKVToken initWithValue:cleanValue:beginIndex:endIndex:isSignificant:isWhitespace:normalizedValues:]";
    _os_log_error_impl(&dword_1A48B3000, v27, OS_LOG_TYPE_ERROR, "%s Cannot construct token with nil value", buf, 0xCu);
  }
  v26 = 0;
LABEL_10:

  return v26;
}

- (CKVToken)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use -initWithValue:"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  NSString *value;
  NSString *cleanValue;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKVToken;
  -[CKVToken description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  cleanValue = self->_cleanValue;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_beginIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_endIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" value: %@, cleanValue: %@, beginIndex: %@, endIndex: %@, isSignificant: %d, isWhitespace: %d, normalizedValues: %@"), value, cleanValue, v6, v7, self->_isSignificant, self->_isWhitespace, self->_normalizedValues);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  void *v5;
  void *v6;
  id v7;

  value = self->_value;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_cleanValue, CFSTR("cleanValue"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_beginIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("b"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_endIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("e"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_isSignificant, CFSTR("isSignificant"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isWhitespace, CFSTR("isWhitespace"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_normalizedValues, CFSTR("normalizedValues"));

}

- (CKVToken)initWithCoder:(id)a3
{
  id v4;
  CKVToken *v5;
  uint64_t v6;
  NSString *value;
  uint64_t v8;
  NSString *cleanValue;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *normalizedValues;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKVToken;
  v5 = -[CKVToken init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cleanValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    cleanValue = v5->_cleanValue;
    v5->_cleanValue = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_beginIndex = objc_msgSend(v10, "unsignedLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endIndex = objc_msgSend(v11, "unsignedLongValue");

    v5->_isSignificant = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSignificant"));
    v5->_isWhitespace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isWhitespace"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("normalizedValues"));
    v12 = objc_claimAutoreleasedReturnValue();
    normalizedValues = v5->_normalizedValues;
    v5->_normalizedValues = (NSArray *)v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_cleanValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(_QWORD *)(v5 + 32) = self->_beginIndex;
  *(_QWORD *)(v5 + 40) = self->_endIndex;
  *(_BYTE *)(v5 + 8) = self->_isSignificant;
  *(_BYTE *)(v5 + 9) = self->_isWhitespace;
  objc_storeStrong((id *)(v5 + 48), self->_normalizedValues);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  CKVToken *v4;
  CKVToken *v5;
  BOOL v6;

  v4 = (CKVToken *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVToken isEqualToToken:](self, "isEqualToToken:", v5);

  return v6;
}

- (BOOL)isEqualToToken:(id)a3
{
  id v4;
  NSString *value;
  void *v6;
  NSString *cleanValue;
  void *v8;
  unint64_t beginIndex;
  unint64_t endIndex;
  int isSignificant;
  uint64_t isWhitespace;
  NSArray *normalizedValues;
  NSArray *v14;
  void *v15;
  int v16;
  char v17;

  v4 = a3;
  value = self->_value;
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(value) = -[NSString isEqualToString:](value, "isEqualToString:", v6);

  if ((_DWORD)value)
  {
    cleanValue = self->_cleanValue;
    objc_msgSend(v4, "cleanValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(cleanValue) = -[NSString isEqualToString:](cleanValue, "isEqualToString:", v8);

    if ((_DWORD)cleanValue)
    {
      beginIndex = self->_beginIndex;
      if (beginIndex == objc_msgSend(v4, "beginIndex"))
      {
        endIndex = self->_endIndex;
        if (endIndex == objc_msgSend(v4, "endIndex"))
        {
          isSignificant = self->_isSignificant;
          if (isSignificant == objc_msgSend(v4, "isSignificant"))
          {
            isWhitespace = self->_isWhitespace;
            if ((_DWORD)isWhitespace == objc_msgSend(v4, "isWhitespace"))
            {
              normalizedValues = self->_normalizedValues;
              v14 = normalizedValues;
              if (!normalizedValues)
              {
                objc_msgSend(v4, "normalizedValues");
                isWhitespace = objc_claimAutoreleasedReturnValue();
                if (!isWhitespace)
                {
                  LOBYTE(v16) = 0;
                  goto LABEL_15;
                }
                v14 = self->_normalizedValues;
              }
              objc_msgSend(v4, "normalizedValues");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = -[NSArray isEqual:](v14, "isEqual:", v15) ^ 1;

              if (normalizedValues)
              {
LABEL_16:
                v17 = v16 ^ 1;
                goto LABEL_13;
              }
LABEL_15:

              goto LABEL_16;
            }
          }
        }
      }
    }
  }
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  v3 = -[NSString hash](self->_value, "hash");
  v4 = -[NSString hash](self->_cleanValue, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_beginIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_endIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSignificant);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWhitespace);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v10 ^ v12 ^ -[NSArray hash](self->_normalizedValues, "hash");

  return v13;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (unint64_t)beginIndex
{
  return self->_beginIndex;
}

- (unint64_t)endIndex
{
  return self->_endIndex;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (NSArray)normalizedValues
{
  return self->_normalizedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValues, 0);
  objc_storeStrong((id *)&self->_cleanValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
