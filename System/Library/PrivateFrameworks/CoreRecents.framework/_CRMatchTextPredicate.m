@implementation _CRMatchTextPredicate

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_comparison, CFSTR("comparison"));

}

- (_CRMatchTextPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _CRMatchTextPredicate *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("comparison"));

  v8 = -[_CRMatchTextPredicate initWithKey:text:comparison:](self, "initWithKey:text:comparison:", v5, v6, v7);
  return v8;
}

- (_CRMatchTextPredicate)initWithKey:(id)a3 text:(id)a4 comparison:(unint64_t)a5
{
  id v8;
  id v9;
  _CRMatchTextPredicate *v10;
  uint64_t v11;
  NSString *key;
  uint64_t v13;
  NSString *text;
  _CRMatchTextPredicate *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CRMatchTextPredicate;
  v10 = -[CRSearchPredicate init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    key = v10->_key;
    v10->_key = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    text = v10->_text;
    v10->_text = (NSString *)v13;

    v10->_comparison = a5;
    v15 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (id)asNSPredicate
{
  unint64_t v2;
  const __CFString *v3;

  v2 = self->_comparison - 1;
  if (v2 > 2)
    v3 = CFSTR("%K ==[cd] %@");
  else
    v3 = off_1E4D322F8[v2];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, self->_key, self->_text);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _CRMatchTextPredicate *v4;
  NSString *key;
  NSString *text;
  BOOL v7;

  v4 = (_CRMatchTextPredicate *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && ((key = self->_key, !((unint64_t)key | (unint64_t)v4->_key))
       || -[NSString isEqual:](key, "isEqual:"))
      && ((text = self->_text, !((unint64_t)text | (unint64_t)v4->_text))
       || -[NSString isEqual:](text, "isEqual:"))
      && self->_comparison == v4->_comparison;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_key);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_text);
  return self->_comparison - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3) + 506447;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)comparison
{
  return self->_comparison;
}

@end
