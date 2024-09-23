@implementation CAMOverlayIndexedRange

- (CAMOverlayIndexedRange)initWithCount:(unint64_t)a3
{
  CAMOverlayIndexedRange *v4;
  CAMOverlayIndexedRange *v5;
  CAMOverlayIndexedRange *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMOverlayIndexedRange;
  v4 = -[CAMOverlayIndexedRange init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %lu values>"), v5, self, self->_count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayIndexedRange)initWithCoder:(id)a3
{
  id v4;
  CAMOverlayIndexedRange *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayIndexedRange;
  v5 = -[CAMOverlayIndexedRange init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v8, CFSTR("count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = -[CAMOverlayIndexedRange count](self, "count");
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v9, CFSTR("count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v8);

}

- (unint64_t)rangeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 1;
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
  CAMOverlayIndexedRange *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (CAMOverlayIndexedRange *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v6 = 1;
    }
    else
    {
      v5 = -[CAMOverlayIndexedRange count](v4, "count");
      v6 = v5 == -[CAMOverlayIndexedRange count](self, "count");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)containsValue:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CAMOverlayIndexedRange count](self, "count");
    v6 = objc_msgSend(v4, "unsignedIntegerValue") <= v5 - 1 && v5 != 0;
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
  return objc_msgSend(a3, "unsignedIntegerValue");
}

- (id)valueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
}

- (unint64_t)count
{
  return self->_count;
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
