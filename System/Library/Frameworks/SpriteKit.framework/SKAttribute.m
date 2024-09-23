@implementation SKAttribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKAttribute)init
{
  return -[SKAttribute initWithName:type:](self, "initWithName:type:", &stru_1EA5021F8, 0);
}

- (SKAttribute)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SKAttribute *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v8 = -[SKAttribute initWithName:type:](self, "initWithName:type:", v5, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_type"));

}

- (BOOL)isEqualToAttribute:(id)a3
{
  SKAttribute *v4;
  SKAttribute *v5;
  NSString *name;
  void *v7;
  int64_t type;
  BOOL v9;

  v4 = (SKAttribute *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    name = self->_name;
    -[SKAttribute name](v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(name) = -[NSString isEqualToString:](name, "isEqualToString:", v7);

    if ((name & 1) != 0)
    {
      type = self->_type;
      v9 = type == -[SKAttribute type](v5, "type");
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (SKAttribute)attributeWithName:(NSString *)name type:(SKAttributeType)type
{
  NSString *v6;
  void *v7;

  v6 = name;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:type:", v6, type);

  return (SKAttribute *)v7;
}

- (SKAttribute)initWithName:(NSString *)name type:(SKAttributeType)type
{
  NSString *v7;
  SKAttribute *v8;
  SKAttribute *v9;
  id v10;
  void **p_nameString;
  __int128 v13;
  uint64_t v14;
  objc_super v15;

  v7 = name;
  v15.receiver = self;
  v15.super_class = (Class)SKAttribute;
  v8 = -[SKAttribute init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, name);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("a_%@"), v9->_name);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v13, (char *)objc_msgSend(v10, "UTF8String"));
    p_nameString = (void **)&v9->_nameString;
    if (*((char *)&v9->_nameString.__r_.__value_.var0.__l + 23) < 0)
      operator delete(*p_nameString);
    *(_OWORD *)p_nameString = v13;
    *((_QWORD *)&v9->_nameString.__r_.__value_.var0.__l + 2) = v14;
    HIBYTE(v14) = 0;
    LOBYTE(v13) = 0;

    v9->_type = type;
    if ((unint64_t)(type - 5) < 4)
      v9->_type = type - 4;
  }

  return v9;
}

- (const)getNameString
{
  return &self->_nameString;
}

- (NSString)name
{
  return self->_name;
}

- (SKAttributeType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_nameString.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_nameString.__r_.__value_.var0.__l.__data_);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
