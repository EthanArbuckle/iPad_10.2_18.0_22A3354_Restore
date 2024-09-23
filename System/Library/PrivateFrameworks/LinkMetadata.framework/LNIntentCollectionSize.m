@implementation LNIntentCollectionSize

- (LNIntentCollectionSize)initWithMin:(id)a3 max:(id)a4
{
  id v7;
  id v8;
  LNIntentCollectionSize *v9;
  LNIntentCollectionSize *v10;
  LNIntentCollectionSize *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNIntentCollectionSize;
  v9 = -[LNIntentCollectionSize init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_min, a3);
    objc_storeStrong((id *)&v10->_max, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNIntentCollectionSize min](self, "min");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  -[LNIntentCollectionSize max](self, "max");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, min: %ld max: %ld>"), v5, self, v7, objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNIntentCollectionSize *v4;
  LNIntentCollectionSize *v5;
  LNIntentCollectionSize *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (LNIntentCollectionSize *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[LNIntentCollectionSize min](self, "min");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNIntentCollectionSize min](v6, "min");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNIntentCollectionSize max](self, "max");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNIntentCollectionSize max](v6, "max");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNIntentCollectionSize)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNIntentCollectionSize *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("min"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("max"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNIntentCollectionSize initWithMin:max:](self, "initWithMin:max:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNIntentCollectionSize min](self, "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("min"));

  -[LNIntentCollectionSize max](self, "max");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("max"));

}

- (NSNumber)min
{
  return self->_min;
}

- (NSNumber)max
{
  return self->_max;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
