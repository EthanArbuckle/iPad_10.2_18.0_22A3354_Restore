@implementation KGBinaryPredicate

- (KGBinaryPredicate)initWithComparator:(unint64_t)a3 value:(id)a4
{
  id v7;
  KGBinaryPredicate *v8;
  KGBinaryPredicate *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KGBinaryPredicate;
  v8 = -[KGBinaryPredicate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_comparator = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

- (id)description
{
  unint64_t v2;
  const __CFString *v3;

  v2 = self->_comparator - 1;
  if (v2 > 7)
    v3 = CFSTR("_");
  else
    v3 = off_1E83E3310[v2];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v3, self->_value);
}

- (unint64_t)comparator
{
  return self->_comparator;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
