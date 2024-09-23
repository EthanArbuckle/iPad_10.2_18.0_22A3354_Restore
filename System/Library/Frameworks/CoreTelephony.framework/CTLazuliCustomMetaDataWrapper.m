@implementation CTLazuliCustomMetaDataWrapper

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliCustomMetaDataWrapper header](self, "header");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", header = %@"), v4);

  -[CTLazuliCustomMetaDataWrapper value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", value = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliCustomMetaDataWrapper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliCustomMetaDataWrapper header](self, "header");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "header");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliCustomMetaDataWrapper value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
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
  CTLazuliCustomMetaDataWrapper *v4;
  CTLazuliCustomMetaDataWrapper *v5;
  BOOL v6;

  v4 = (CTLazuliCustomMetaDataWrapper *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliCustomMetaDataWrapper isEqualToCTLazuliCustomMetaDataWrapper:](self, "isEqualToCTLazuliCustomMetaDataWrapper:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliCustomMetaDataWrapper *v4;

  v4 = +[CTLazuliCustomMetaDataWrapper allocWithZone:](CTLazuliCustomMetaDataWrapper, "allocWithZone:", a3);
  -[CTLazuliCustomMetaDataWrapper setHeader:](v4, "setHeader:", self->_header);
  -[CTLazuliCustomMetaDataWrapper setValue:](v4, "setValue:", self->_value);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_header, CFSTR("kHeaderKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("kValueKey"));

}

- (CTLazuliCustomMetaDataWrapper)initWithCoder:(id)a3
{
  id v4;
  CTLazuliCustomMetaDataWrapper *v5;
  uint64_t v6;
  NSString *header;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliCustomMetaDataWrapper;
  v5 = -[CTLazuliCustomMetaDataWrapper init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHeaderKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kValueKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v8;

  }
  return v5;
}

- (CTLazuliCustomMetaDataWrapper)initWithReflection:(const void *)a3
{
  CTLazuliCustomMetaDataWrapper *v4;
  const void *v5;
  uint64_t v6;
  NSString *header;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  NSString *value;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTLazuliCustomMetaDataWrapper;
  v4 = -[CTLazuliCustomMetaDataWrapper init](&v15, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    header = v4->_header;
    v4->_header = (NSString *)v6;

    v10 = (char *)*((_QWORD *)a3 + 3);
    v9 = (char *)a3 + 24;
    v8 = v10;
    if (v9[23] >= 0)
      v11 = v9;
    else
      v11 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    value = v4->_value;
    v4->_value = (NSString *)v12;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
