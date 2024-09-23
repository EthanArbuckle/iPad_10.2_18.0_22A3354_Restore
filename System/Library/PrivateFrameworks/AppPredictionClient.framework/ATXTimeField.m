@implementation ATXTimeField

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeField)initWithTitle:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  ATXTimeField *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *value;
  ATXTimeField *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXTimeField;
  v8 = -[ATXTimeField init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (ATXTimeField)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXTimeField *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXTimeField initWithTitle:value:](self, "initWithTitle:value:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (NSString)title
{
  return self->_title;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
