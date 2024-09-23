@implementation _DASActivityGroup

- (unint64_t)maxConcurrent
{
  return self->_maxConcurrent;
}

- (NSString)name
{
  return self->_name;
}

- (_DASActivityGroup)initWithName:(id)a3 maxConcurrent:(unint64_t)a4
{
  id v7;
  _DASActivityGroup *v8;
  _DASActivityGroup *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASActivityGroup;
  v8 = -[_DASActivityGroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_maxConcurrent = a4;
  }

  return v9;
}

- (_DASActivityGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _DASActivityGroup *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("max"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = 0;
  else
    v8 = (_DASActivityGroup *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:maxConcurrent:", v5, objc_msgSend(v6, "unsignedIntegerValue"));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  id v6;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxConcurrent);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("max"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)groupWithName:(id)a3 maxConcurrent:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:maxConcurrent:", v5, a4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[_DASActivityGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:maxConcurrent:", v5, -[_DASActivityGroup maxConcurrent](self, "maxConcurrent"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  NSString *name;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxConcurrent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<_DASActivityGroup: %@ (%@)>"), name, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _DASActivityGroup *v4;
  NSString *name;
  void *v6;
  char v7;

  v4 = (_DASActivityGroup *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      name = self->_name;
      -[_DASActivityGroup name](v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](name, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setMaxConcurrent:(unint64_t)a3
{
  self->_maxConcurrent = a3;
}

@end
