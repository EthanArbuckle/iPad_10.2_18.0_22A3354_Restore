@implementation DIHandle

- (DIHandle)initWithType:(unint64_t)a3 value:(id)a4
{
  id v7;
  DIHandle *v8;
  DIHandle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DIHandle;
  v8 = -[DIHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  DIHandle *v4;
  DIHandle *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (DIHandle *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DIHandle type](self, "type");
      if (v6 == -[DIHandle type](v5, "type"))
      {
        -[DIHandle value](self, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIHandle value](v5, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)stringForHandleType:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 > 2)
    v3 = CFSTR("Unknown");
  else
    v3 = off_250B96858[a3];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%lu) %@"), a3, v3);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[DIHandle type](self, "type");
  -[DIHandle value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[DIHandle type](self, "type");
  +[DIHandle stringForHandleType:](DIHandle, "stringForHandleType:", -[DIHandle type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIHandle value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Type = %lu (%@), Value = %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[DIHandle type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("Type"));

  -[DIHandle value](self, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("Value"));

}

- (DIHandle)initWithCoder:(id)a3
{
  id v4;
  DIHandle *v5;
  DIHandle *v6;
  DIHandle *v7;
  uint64_t v8;
  NSString *value;

  v4 = a3;
  v5 = -[DIHandle init](self, "init");
  if (!v5)
  {
LABEL_5:
    v7 = v5;
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Type"));
  v6 = (DIHandle *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v5->_type = -[DIHandle unsignedIntegerValue](v6, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {

      v7 = 0;
      goto LABEL_7;
    }
    value = v5->_value;
    v5->_value = (NSString *)v8;

    goto LABEL_5;
  }
LABEL_7:

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
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
}

@end
