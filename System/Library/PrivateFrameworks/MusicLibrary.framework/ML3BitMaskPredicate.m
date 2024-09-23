@implementation ML3BitMaskPredicate

- (ML3BitMaskPredicate)initWithProperty:(id)a3 mask:(int64_t)a4 value:(int64_t)a5
{
  ML3BitMaskPredicate *v7;
  ML3BitMaskPredicate *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ML3BitMaskPredicate;
  v7 = -[ML3PropertyPredicate initWithProperty:](&v10, sel_initWithProperty_, a3);
  v8 = v7;
  if (v7)
  {
    -[ML3BitMaskPredicate setMask:](v7, "setMask:", a4);
    -[ML3BitMaskPredicate setValue:](v8, "setValue:", a5);
  }
  return v8;
}

- (ML3BitMaskPredicate)initWithCoder:(id)a3
{
  id v4;
  ML3BitMaskPredicate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ML3BitMaskPredicate;
  v5 = -[ML3PropertyPredicate initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    -[ML3BitMaskPredicate setMask:](v5, "setMask:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("mask")));
    -[ML3BitMaskPredicate setValue:](v5, "setValue:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("value")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ML3BitMaskPredicate;
  v4 = a3;
  -[ML3PropertyPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[ML3BitMaskPredicate mask](self, "mask", v5.receiver, v5.super_class), CFSTR("mask"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[ML3BitMaskPredicate value](self, "value"), CFSTR("value"));

}

- (BOOL)isEqual:(id)a3
{
  ML3BitMaskPredicate *v4;
  int64_t v5;
  int64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = (ML3BitMaskPredicate *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3BitMaskPredicate;
    if (-[ML3PropertyPredicate isEqual:](&v9, sel_isEqual_, v4)
      && (v5 = -[ML3BitMaskPredicate mask](self, "mask"), v5 == -[ML3BitMaskPredicate mask](v4, "mask")))
    {
      v6 = -[ML3BitMaskPredicate value](self, "value");
      v7 = v6 == -[ML3BitMaskPredicate value](v4, "value");
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)ML3BitMaskPredicate;
  -[ML3PropertyPredicate description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@((%@ & 0x%llx) = 0x%llx)"), v4, self->super._property, self->_mask, self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  NSString *property;
  id v6;
  id v7;

  property = self->super._property;
  v6 = a3;
  -[objc_class disambiguatedSQLForProperty:](a4, "disambiguatedSQLForProperty:", property);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", CFSTR("(("));
  objc_msgSend(v6, "appendString:", v7);
  objc_msgSend(v6, "appendString:", CFSTR(" & ?) = ?)"));

}

- (id)databaseStatementParameters
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_mask);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)mask
{
  return self->_mask;
}

- (void)setMask:(int64_t)a3
{
  self->_mask = a3;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithProperty:(id)a3 mask:(int64_t)a4 value:(int64_t)a5
{
  id v7;
  void *v8;

  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:mask:value:", v7, a4, a5);

  return v8;
}

@end
