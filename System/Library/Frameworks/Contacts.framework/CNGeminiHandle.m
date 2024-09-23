@implementation CNGeminiHandle

- (CNGeminiHandle)initWithString:(id)a3 type:(int64_t)a4
{
  id v6;
  CNGeminiHandle *v7;
  CNGeminiHandle *v8;
  void *v9;
  uint64_t v10;
  NSString *stringValue;
  uint64_t v12;
  NSString *v13;
  CNGeminiHandle *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNGeminiHandle;
  v7 = -[CNGeminiHandle init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_handleType = a4;
    if (a4)
      goto LABEL_4;
    +[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unformattedInternationalStringValue");
    v10 = objc_claimAutoreleasedReturnValue();
    stringValue = v8->_stringValue;
    v8->_stringValue = (NSString *)v10;

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    {
LABEL_4:
      v12 = objc_msgSend(v6, "copy");
      v13 = v8->_stringValue;
      v8->_stringValue = (NSString *)v12;

    }
    v14 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGeminiHandle)initWithCoder:(id)a3
{
  id v4;
  CNGeminiHandle *v5;
  void *v6;
  uint64_t v7;
  NSString *stringValue;
  CNGeminiHandle *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNGeminiHandle;
  v5 = -[CNGeminiHandle init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stringValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v7;

    v5->_handleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_handleType"));
    v9 = v5;
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_handleType, CFSTR("_handleType"));

}

- (int64_t)handleType
{
  return self->_handleType;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
