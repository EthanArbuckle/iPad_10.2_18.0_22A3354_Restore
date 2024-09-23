@implementation ICAuthorHighlightValueAttribute

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightValueAttribute value](self, "value");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightValueAttribute color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, value: %@, color: %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  BOOL v17;
  char v18;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v7 = v6;
  -[ICAuthorHighlightValueAttribute value](self, "value");
  if (v7 == v8)
  {
    -[ICAuthorHighlightValueAttribute color](self, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v9)
      v12 = 0;
    else
      v12 = v9;
    v13 = v12;
    if (v11 == v10)
      v14 = 0;
    else
      v14 = v10;
    v15 = v14;
    v16 = (void *)v15;
    if (v13 | v15)
    {
      if (v13)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (v17)
        v18 = 0;
      else
        v18 = objc_msgSend((id)v13, "isEqual:", v15);
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ICAuthorHighlightValueAttribute value](self, "value");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[ICAuthorHighlightValueAttribute color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v15 = ICHashWithHashKeys(v5, v8, v9, v10, v11, v12, v13, v14, v7);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICAuthorHighlightValueAttribute *v4;
  void *v5;

  v4 = -[ICAuthorHighlightValueAttribute init](+[ICAuthorHighlightValueAttribute allocWithZone:](ICAuthorHighlightValueAttribute, "allocWithZone:", a3), "init");
  -[ICAuthorHighlightValueAttribute value](self, "value");
  -[ICAuthorHighlightValueAttribute setValue:](v4, "setValue:");
  -[ICAuthorHighlightValueAttribute color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightValueAttribute setColor:](v4, "setColor:", v5);

  return v4;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
