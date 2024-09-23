@implementation CTLazuliChatBotMediaFingerprint

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliChatBotMediaFingerprint data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", data = %@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotMediaFingerprint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[CTLazuliChatBotMediaFingerprint data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToData:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliChatBotMediaFingerprint *v4;
  CTLazuliChatBotMediaFingerprint *v5;
  BOOL v6;

  v4 = (CTLazuliChatBotMediaFingerprint *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliChatBotMediaFingerprint isEqualToCTLazuliChatBotMediaFingerprint:](self, "isEqualToCTLazuliChatBotMediaFingerprint:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliChatBotMediaFingerprint *v4;

  v4 = +[CTLazuliChatBotMediaFingerprint allocWithZone:](CTLazuliChatBotMediaFingerprint, "allocWithZone:", a3);
  -[CTLazuliChatBotMediaFingerprint setData:](v4, "setData:", self->_data);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_data, CFSTR("kDataKey"));
}

- (CTLazuliChatBotMediaFingerprint)initWithCoder:(id)a3
{
  id v4;
  CTLazuliChatBotMediaFingerprint *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotMediaFingerprint;
  v5 = -[CTLazuliChatBotMediaFingerprint init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDataKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

- (CTLazuliChatBotMediaFingerprint)initWithReflection:(const void *)a3
{
  CTLazuliChatBotMediaFingerprint *v4;
  uint64_t v5;
  NSData *data;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTLazuliChatBotMediaFingerprint;
  v4 = -[CTLazuliChatBotMediaFingerprint init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)a3, *((_QWORD *)a3 + 1) - *(_QWORD *)a3);
    v5 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSData *)v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
