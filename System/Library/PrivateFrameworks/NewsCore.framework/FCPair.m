@implementation FCPair

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FCPair first](self, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPair second](self, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[FCPair first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", a3);

  -[FCPair second](self, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);

  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v9;
}

- (FCPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  FCPair *v8;
  FCPair *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCPair;
  v8 = -[FCPair init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FCPair p_SetFirst:](v8, "p_SetFirst:", v6);
    -[FCPair p_SetSecond:](v9, "p_SetSecond:", v7);
  }

  return v9;
}

- (void)p_SetSecond:(id)a3
{
  objc_storeStrong(&self->mSecond, a3);
}

- (void)p_SetFirst:(id)a3
{
  objc_storeStrong(&self->mFirst, a3);
}

- (id)first
{
  return self->mFirst;
}

- (id)second
{
  return self->mSecond;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[FCPair first](self, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCPair second](self, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mSecond, 0);
  objc_storeStrong(&self->mFirst, 0);
}

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFirst:second:", v7, v6);

  return v8;
}

+ (id)pairWithPair:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPair:", v4);

  return v5;
}

+ (id)pair
{
  return objc_alloc_init((Class)a1);
}

- (FCPair)initWithPair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCPair *v7;

  v4 = a3;
  objc_msgSend(v4, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCPair initWithFirst:second:](self, "initWithFirst:second:", v5, v6);
  return v7;
}

- (FCPair)init
{
  return -[FCPair initWithFirst:second:](self, "initWithFirst:second:", 0, 0);
}

- (FCPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCPair *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCPair initWithFirst:second:](self, "initWithFirst:second:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCPair first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:", v5);

  -[FCPair second](self, "second");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:", v6);

}

- (BOOL)isEqual:(id)a3
{
  FCPair *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (FCPair *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FCPair first](self, "first");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPair first](v4, "first");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[FCPair second](self, "second");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCPair second](v4, "second");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[FCPair first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", a3);

  -[FCPair second](self, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);

  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirst:second:", v6, v8);
  return v9;
}

@end
