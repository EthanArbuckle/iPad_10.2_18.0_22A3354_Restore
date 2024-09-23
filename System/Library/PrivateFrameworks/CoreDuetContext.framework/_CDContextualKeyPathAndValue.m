@implementation _CDContextualKeyPathAndValue

- (void)encodeWithCoder:(id)a3
{
  _CDContextualKeyPath *keyPath;
  id v5;

  keyPath = self->_keyPath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyPath, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("val"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (_CDContextualKeyPathAndValue)initWithKeyPath:(id)a3 andValue:(id)a4
{
  id v7;
  id v8;
  _CDContextualKeyPathAndValue *v9;
  _CDContextualKeyPathAndValue *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDContextualKeyPathAndValue;
  v9 = -[_CDContextualKeyPathAndValue init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (_CDContextualKeyPathAndValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _CDContextualKeyPathAndValue *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("val"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[_CDContextualKeyPathAndValue initWithKeyPath:andValue:](self, "initWithKeyPath:andValue:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (_CDContextualKeyPath)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_keyPath, a3);
}

- (_CDContextValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

@end
