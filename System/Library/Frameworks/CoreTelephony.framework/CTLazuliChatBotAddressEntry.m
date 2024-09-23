@implementation CTLazuliChatBotAddressEntry

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotAddressEntry address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", address = %@"), v4);

  -[CTLazuliChatBotAddressEntry label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", label = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotAddressEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliChatBotAddressEntry address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliChatBotAddressEntry label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotAddressEntry *v4;
  CTLazuliChatBotAddressEntry *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotAddressEntry *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotAddressEntry isEqualToCTLazuliChatBotAddressEntry:](self, "isEqualToCTLazuliChatBotAddressEntry:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotAddressEntry *v4;

  v4 = +[CTLazuliChatBotAddressEntry allocWithZone:](CTLazuliChatBotAddressEntry, "allocWithZone:", a3);
  -[CTLazuliChatBotAddressEntry setAddress:](v4, "setAddress:", self->_address);
  -[CTLazuliChatBotAddressEntry setLabel:](v4, "setLabel:", self->_label);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_address, CFSTR("kAddressKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("kLabelKey"));

}

- (CTLazuliChatBotAddressEntry)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotAddressEntry *v5;
  uint64_t v6;
  NSString *address;
  uint64_t v8;
  NSString *label;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotAddressEntry;
  v5 = -[CTLazuliChatBotAddressEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAddressKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLabelKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

  }
  return v5;
}

- (CTLazuliChatBotAddressEntry)initWithReflection:(const void *)a3
{
  CTLazuliChatBotAddressEntry *v4;
  const void *v5;
  uint64_t v6;
  NSString *address;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  NSString *label;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotAddressEntry;
  v4 = -[CTLazuliChatBotAddressEntry init](&v15, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    address = v4->_address;
    v4->_address = (NSString *)v6;

    v10 = (char *)*((_QWORD *)a3 + 3);
    v9 = (char *)a3 + 24;
    v8 = v10;
    if (v9[23] >= 0)
      v11 = v9;
    else
      v11 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    label = v4->_label;
    v4->_label = (NSString *)v12;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
