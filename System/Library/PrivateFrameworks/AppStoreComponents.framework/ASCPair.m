@implementation ASCPair

- (ASCPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  ASCPair *v9;
  ASCPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASCPair;
  v9 = -[ASCPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc((Class)objc_opt_class());
  -[ASCPair first](self, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[ASCPair second](self, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (void *)objc_msgSend(v5, "initWithFirst:second:", v7, v9);

  return v10;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCPair first](self, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCPair second](self, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCPair first](self, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_10;
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      -[ASCPair second](self, "second");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "second");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11 && v12)
        v14 = objc_msgSend(v11, "isEqual:", v12);
      else
        v14 = v11 == (void *)v12;

      goto LABEL_18;
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ASCPair first](self, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCPair second](self, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@, %@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)first
{
  return self->_first;
}

- (id)second
{
  return self->_second;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
