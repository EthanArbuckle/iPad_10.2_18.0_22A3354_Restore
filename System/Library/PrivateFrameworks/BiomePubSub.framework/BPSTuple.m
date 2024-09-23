@implementation BPSTuple

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (id)first
{
  return self->_first;
}

- (BPSTuple)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BPSTuple *v10;

  v4 = (void *)MEMORY[0x1E0CB3510];
  v5 = a3;
  objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("first"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3510], "bm_allowedClassesForSecureCodingBMBookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("second"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BPSTuple initWithFirst:second:](self, "initWithFirst:second:", v7, v9);
  return v10;
}

- (BPSTuple)initWithFirst:(id)a3 second:(id)a4
{
  id v7;
  id v8;
  BPSTuple *v9;
  BPSTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSTuple;
  v9 = -[BPSTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BPSTuple first](self, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("first"));

  -[BPSTuple second](self, "second");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("second"));

}

- (id)second
{
  return self->_second;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  -[BPSTuple first](self, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "first"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BPSTuple first](self, "first");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v9 = 1;
  }
  else
  {
    v17 = 0;
    v9 = 0;
  }
  -[BPSTuple second](self, "second");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v7, "second"), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BPSTuple second](self, "second", v15, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "second");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqual:", v13);

    if (v11)
      goto LABEL_15;
  }
  else
  {
    v16 = 0;
    v10 = 1;
  }

LABEL_15:
  if (v9)
    goto LABEL_16;
LABEL_17:
  if (!v8)

LABEL_20:
  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("First: %@, Secound: %@"), self->_first, self->_second);
}

@end
