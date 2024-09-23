@implementation HKAxisLabel

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = -[HKAxisLabel labelType](self, "labelType");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_1E9C44FF0[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)HKAxisLabel;
  -[HKAxisLabel description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisLabel text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisLabel location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ text=%@ location=%@ type=%@"), v6, v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HKAxisLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HKAxisLabel *)a3;
  if (-[HKAxisLabel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    if (self == v4)
    {
      v9 = 1;
    }
    else
    {
      -[HKAxisLabel location](self, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAxisLabel location](v4, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (HKUIObjectsAreEqual(v5, v6))
      {
        -[HKAxisLabel text](self, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAxisLabel text](v4, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = HKUIObjectsAreEqual(v7, v8);

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[HKAxisLabel location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HKAxisLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  if ((isKindOfClass & 1) != 0)
  {
    -[HKAxisLabel location](self, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    -[HKAxisLabel location](self, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueWithPointer:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "hash");

  }
  return v8 ^ v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (id)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong(&self->_location, a3);
}

- (int64_t)labelType
{
  return self->_labelType;
}

- (void)setLabelType:(int64_t)a3
{
  self->_labelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_location, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
