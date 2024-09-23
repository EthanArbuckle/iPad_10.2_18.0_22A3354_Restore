@implementation CTLazuliChatBotTelephoneInformation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotTelephoneInformation label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", label = %@"), v4);

  -[CTLazuliChatBotTelephoneInformation telNumber](self, "telNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", telNumber = %@"), v5);

  -[CTLazuliChatBotTelephoneInformation telephoneType](self, "telephoneType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", telephoneType = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotTelephoneInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[CTLazuliChatBotTelephoneInformation label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliChatBotTelephoneInformation telNumber](self, "telNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "telNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToCTLazuliChatBotTelephoneNumber:", v8))
    {
      -[CTLazuliChatBotTelephoneInformation telephoneType](self, "telephoneType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "telephoneType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotTelephoneInformation *v4;
  CTLazuliChatBotTelephoneInformation *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotTelephoneInformation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotTelephoneInformation isEqualToCTLazuliChatBotTelephoneInformation:](self, "isEqualToCTLazuliChatBotTelephoneInformation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotTelephoneInformation *v4;

  v4 = +[CTLazuliChatBotTelephoneInformation allocWithZone:](CTLazuliChatBotTelephoneInformation, "allocWithZone:", a3);
  -[CTLazuliChatBotTelephoneInformation setLabel:](v4, "setLabel:", self->_label);
  -[CTLazuliChatBotTelephoneInformation setTelNumber:](v4, "setTelNumber:", self->_telNumber);
  -[CTLazuliChatBotTelephoneInformation setTelephoneType:](v4, "setTelephoneType:", self->_telephoneType);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("kLabelKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_telNumber, CFSTR("kTelNumberKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_telephoneType, CFSTR("kTelephoneTypeKey"));

}

- (CTLazuliChatBotTelephoneInformation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotTelephoneInformation *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  CTLazuliChatBotTelephoneNumber *telNumber;
  uint64_t v10;
  NSString *telephoneType;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotTelephoneInformation;
  v5 = -[CTLazuliChatBotTelephoneInformation init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLabelKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTelNumberKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    telNumber = v5->_telNumber;
    v5->_telNumber = (CTLazuliChatBotTelephoneNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTelephoneTypeKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    telephoneType = v5->_telephoneType;
    v5->_telephoneType = (NSString *)v10;

  }
  return v5;
}

- (CTLazuliChatBotTelephoneInformation)initWithReflection:(const void *)a3
{
  CTLazuliChatBotTelephoneInformation *v4;
  const void *v5;
  uint64_t v6;
  NSString *label;
  CTLazuliChatBotTelephoneNumber *v8;
  CTLazuliChatBotTelephoneNumber *telNumber;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  NSString *telephoneType;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CTLazuliChatBotTelephoneInformation;
  v4 = -[CTLazuliChatBotTelephoneInformation init](&v17, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    label = v4->_label;
    v4->_label = (NSString *)v6;

    v8 = -[CTLazuliChatBotTelephoneNumber initWithReflection:]([CTLazuliChatBotTelephoneNumber alloc], "initWithReflection:", (char *)a3 + 24);
    telNumber = v4->_telNumber;
    v4->_telNumber = v8;

    v12 = (char *)*((_QWORD *)a3 + 6);
    v11 = (char *)a3 + 48;
    v10 = v12;
    if (v11[23] >= 0)
      v13 = v11;
    else
      v13 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    telephoneType = v4->_telephoneType;
    v4->_telephoneType = (NSString *)v14;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CTLazuliChatBotTelephoneNumber)telNumber
{
  return self->_telNumber;
}

- (void)setTelNumber:(id)a3
{
  objc_storeStrong((id *)&self->_telNumber, a3);
}

- (NSString)telephoneType
{
  return self->_telephoneType;
}

- (void)setTelephoneType:(id)a3
{
  objc_storeStrong((id *)&self->_telephoneType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephoneType, 0);
  objc_storeStrong((id *)&self->_telNumber, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
