@implementation CAMOverlayTitleRange

- (CAMOverlayTitleRange)initWithTitles:(id)a3
{
  id v5;
  CAMOverlayTitleRange *v6;
  CAMOverlayTitleRange *v7;
  CAMOverlayTitleRange *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMOverlayTitleRange;
  v6 = -[CAMOverlayTitleRange init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__titles, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayTitleRange)initWithCoder:(id)a3
{
  id v4;
  CAMOverlayTitleRange *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *titles;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMOverlayTitleRange;
  v5 = -[CAMOverlayTitleRange init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.%@"), v11, CFSTR("_titles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    titles = v5->__titles;
    v5->__titles = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CAMOverlayTitleRange _titles](self, "_titles");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, CFSTR("_titles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v8);

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[CAMOverlayTitleRange _titles](self, "_titles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)rangeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 2;
}

- (BOOL)isFloatingPoint
{
  return 0;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (BOOL)isEqualToRange:(id)a3
{
  CAMOverlayTitleRange *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (CAMOverlayTitleRange *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v7 = 1;
    }
    else
    {
      -[CAMOverlayTitleRange _titles](v4, "_titles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMOverlayTitleRange _titles](self, "_titles");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToArray:", v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)containsValue:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CAMOverlayTitleRange _titles](self, "_titles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isValueExpectedType:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)indexOfValue:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CAMOverlayTitleRange _titles](self, "_titles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)valueAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CAMOverlayTitleRange _titles](self, "_titles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CAMOverlayIndexedRange)indexedRange
{
  return -[CAMOverlayIndexedRange initWithCount:]([CAMOverlayIndexedRange alloc], "initWithCount:", -[CAMOverlayTitleRange count](self, "count"));
}

- (NSArray)_titles
{
  return self->__titles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titles, 0);
}

@end
