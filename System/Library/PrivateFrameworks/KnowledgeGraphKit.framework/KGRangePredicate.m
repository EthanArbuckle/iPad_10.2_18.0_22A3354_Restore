@implementation KGRangePredicate

- (KGRangePredicate)initWithComparator:(unint64_t)a3 value1:(id)a4 value2:(id)a5
{
  id v9;
  id v10;
  KGRangePredicate *v11;
  KGRangePredicate *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KGRangePredicate;
  v11 = -[KGRangePredicate init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_comparator = a3;
    objc_storeStrong(&v11->_value1, a4);
    objc_storeStrong(&v12->_value2, a5);
  }

  return v12;
}

- (id)leftParen:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("_");
  else
    return off_1E83E3350[a3 - 1];
}

- (id)rightParen:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("_");
  else
    return off_1E83E3390[a3 - 1];
}

- (id)description
{
  void *v3;
  void *v4;
  id value2;
  id value1;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[KGRangePredicate leftParen:](self, "leftParen:", self->_comparator);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  value1 = self->_value1;
  value2 = self->_value2;
  -[KGRangePredicate rightParen:](self, "rightParen:", self->_comparator);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@,%@%@"), v4, value1, value2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)comparator
{
  return self->_comparator;
}

- (id)value1
{
  return self->_value1;
}

- (id)value2
{
  return self->_value2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value2, 0);
  objc_storeStrong(&self->_value1, 0);
}

@end
