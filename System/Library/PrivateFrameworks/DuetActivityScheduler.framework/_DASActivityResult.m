@implementation _DASActivityResult

- (_DASActivityResult)initWithIdentifier:(id)a3
{
  id v5;
  _DASActivityResult *v6;
  _DASActivityResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASActivityResult;
  v6 = -[_DASActivityResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_count = 0;
  }

  return v7;
}

- (_DASActivityResult)initWithIdentifier:(id)a3 count:(int64_t)a4
{
  id v7;
  _DASActivityResult *v8;
  _DASActivityResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASActivityResult;
  v8 = -[_DASActivityResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_count = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _DASActivityResult *v4;
  void *v5;
  char v6;

  v4 = (_DASActivityResult *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_DASActivityResult identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", self->_identifier);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@: count: %ld>"), objc_opt_class(), self->_identifier, self->_count);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:count:", self->_identifier, self->_count);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:count:", self->_identifier, self->_count);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_count);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("count"));

}

- (_DASActivityResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _DASActivityResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = 0;
  else
    v8 = (_DASActivityResult *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:count:", v5, (int)objc_msgSend(v6, "intValue"));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)dictionary
{
  int64_t count;
  void *v3;
  void *v4;
  NSString *identifier;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  count = self->_count;
  identifier = self->_identifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", count);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &identifier, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
