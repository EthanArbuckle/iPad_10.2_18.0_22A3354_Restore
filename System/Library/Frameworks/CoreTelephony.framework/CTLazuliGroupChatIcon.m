@implementation CTLazuliGroupChatIcon

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliGroupChatIcon name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", name = %@"), v4);

  -[CTLazuliGroupChatIcon data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", data = %@"), v5);

  -[CTLazuliGroupChatIcon type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", type = %@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatIcon:(id)a3
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
  -[CTLazuliGroupChatIcon name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[CTLazuliGroupChatIcon data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToData:", v8))
    {
      -[CTLazuliGroupChatIcon type](self, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "type");
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
  CTLazuliGroupChatIcon *v4;
  CTLazuliGroupChatIcon *v5;
  BOOL v6;

  v4 = (CTLazuliGroupChatIcon *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliGroupChatIcon isEqualToCTLazuliGroupChatIcon:](self, "isEqualToCTLazuliGroupChatIcon:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliGroupChatIcon *v4;

  v4 = +[CTLazuliGroupChatIcon allocWithZone:](CTLazuliGroupChatIcon, "allocWithZone:", a3);
  -[CTLazuliGroupChatIcon setName:](v4, "setName:", self->_name);
  -[CTLazuliGroupChatIcon setData:](v4, "setData:", self->_data);
  -[CTLazuliGroupChatIcon setType:](v4, "setType:", self->_type);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("kNameKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("kDataKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("kTypeKey"));

}

- (CTLazuliGroupChatIcon)initWithCoder:(id)a3
{
  id v4;
  CTLazuliGroupChatIcon *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  NSString *type;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliGroupChatIcon;
  v5 = -[CTLazuliGroupChatIcon init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDataKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTypeKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v10;

  }
  return v5;
}

- (CTLazuliGroupChatIcon)initWithReflection:(const void *)a3
{
  CTLazuliGroupChatIcon *v4;
  const void *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSData *data;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  NSString *type;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CTLazuliGroupChatIcon;
  v4 = -[CTLazuliGroupChatIcon init](&v17, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    name = v4->_name;
    v4->_name = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *((_QWORD *)a3 + 3), *((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSData *)v8;

    v12 = (char *)*((_QWORD *)a3 + 6);
    v11 = (char *)a3 + 48;
    v10 = v12;
    if (v11[23] >= 0)
      v13 = v11;
    else
      v13 = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    type = v4->_type;
    v4->_type = (NSString *)v14;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
