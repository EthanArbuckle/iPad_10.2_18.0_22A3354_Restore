@implementation CKContextCountedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)string:(id)a3 withCount:(unint64_t)a4
{
  id v5;
  CKContextCountedString *v6;

  v5 = a3;
  v6 = objc_alloc_init(CKContextCountedString);
  -[CKContextCountedString setString:](v6, "setString:", v5);

  -[CKContextCountedString setCount:](v6, "setCount:", a4);
  return v6;
}

- (CKContextCountedString)initWithCoder:(id)a3
{
  id v4;
  CKContextCountedString *v5;
  uint64_t v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKContextCountedString;
  v5 = -[CKContextCountedString init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
    v6 = objc_claimAutoreleasedReturnValue();
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *string;
  id v5;

  string = self->_string;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", string, CFSTR("string"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_count, CFSTR("count"));

}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
