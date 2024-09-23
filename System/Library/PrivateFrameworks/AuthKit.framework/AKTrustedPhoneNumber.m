@implementation AKTrustedPhoneNumber

- (AKTrustedPhoneNumber)initWithJSONDictionary:(id)a3
{
  id v4;
  AKTrustedPhoneNumber *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSNumber *identifier;
  uint64_t v10;
  NSString *numberWithDialCode;
  uint64_t v12;
  NSString *number;
  uint64_t v14;
  NSString *obfuscatedNumber;
  uint64_t v16;
  NSString *pushMode;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AKTrustedPhoneNumber;
  v5 = -[AKTrustedPhoneNumber init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberWithDialCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    numberWithDialCode = v5->_numberWithDialCode;
    v5->_numberWithDialCode = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("number"));
    v12 = objc_claimAutoreleasedReturnValue();
    number = v5->_number;
    v5->_number = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("obfuscatedNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    obfuscatedNumber = v5->_obfuscatedNumber;
    v5->_obfuscatedNumber = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pushMode"));
    v16 = objc_claimAutoreleasedReturnValue();
    pushMode = v5->_pushMode;
    v5->_pushMode = (NSString *)v16;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("id: %@\nnumber with dial code: %@\nmode: %@"), self->_identifier, self->_numberWithDialCode, self->_pushMode);
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (AKTrustedPhoneNumber)numberWithDialCode
{
  return (AKTrustedPhoneNumber *)self->_numberWithDialCode;
}

- (void)setNumberWithDialCode:(id)a3
{
  objc_storeStrong((id *)&self->_numberWithDialCode, a3);
}

- (NSString)obfuscatedNumber
{
  return self->_obfuscatedNumber;
}

- (void)setObfuscatedNumber:(id)a3
{
  objc_storeStrong((id *)&self->_obfuscatedNumber, a3);
}

- (NSString)pushMode
{
  return self->_pushMode;
}

- (void)setPushMode:(id)a3
{
  objc_storeStrong((id *)&self->_pushMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushMode, 0);
  objc_storeStrong((id *)&self->_obfuscatedNumber, 0);
  objc_storeStrong((id *)&self->_numberWithDialCode, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
