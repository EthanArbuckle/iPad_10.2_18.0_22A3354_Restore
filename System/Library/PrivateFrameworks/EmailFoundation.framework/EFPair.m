@implementation EFPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFirst:second:", v6, v7);

  return v8;
}

- (EFPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  EFPair *v9;
  EFPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EFPair;
  v9 = -[EFPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> (%@, %@)"), objc_opt_class(), self, self->_first, self->_second);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSObject hash](self->_first, "hash");
  return 33 * v3 + -[NSObject hash](self->_second, "hash") + 1089;
}

- (BOOL)isEqual:(id)a3
{
  EFPair *v4;
  BOOL v5;

  v4 = (EFPair *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[EFPair isEqualToPair:](self, "isEqualToPair:", v4);
  }

  return v5;
}

- (NSObject)second
{
  return self->_second;
}

- (BOOL)isEqualToPair:(id)a3
{
  void *v3;
  EFPair *v5;
  EFPair *v6;
  NSObject *first;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *second;
  NSObject *v12;
  void *v13;
  char v14;

  v5 = (EFPair *)a3;
  v6 = v5;
  if (self == v5)
  {
    v14 = 1;
    goto LABEL_18;
  }
  if (!v5)
    goto LABEL_15;
  first = self->_first;
  v8 = first;
  if (first)
  {
LABEL_6:
    -[EFPair first](v6, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject isEqual:](v8, "isEqual:", v9);

    if (first)
    {
      if ((v10 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

      if ((v10 & 1) != 0)
        goto LABEL_8;
    }
LABEL_15:
    v14 = 0;
    goto LABEL_18;
  }
  -[EFPair first](v5, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = self->_first;
    goto LABEL_6;
  }
LABEL_8:
  second = self->_second;
  v12 = second;
  if (!second)
  {
    -[EFPair second](v6, "second");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v14 = 1;
LABEL_17:

      goto LABEL_18;
    }
    v12 = self->_second;
  }
  -[EFPair second](v6, "second");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSObject isEqual:](v12, "isEqual:", v13);

  if (!second)
    goto LABEL_17;
LABEL_18:

  return v14;
}

- (NSObject)first
{
  return self->_first;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EFPair first](self, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_first"));

  -[EFPair second](self, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_second"));

}

- (EFPair)initWithCoder:(id)a3
{
  id v4;
  EFPair *v5;
  uint64_t v6;
  NSObject *first;
  uint64_t v8;
  NSObject *second;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFPair;
  v5 = -[EFPair init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_first"));
    v6 = objc_claimAutoreleasedReturnValue();
    first = v5->_first;
    v5->_first = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_second"));
    v8 = objc_claimAutoreleasedReturnValue();
    second = v5->_second;
    v5->_second = v8;

  }
  return v5;
}

@end
