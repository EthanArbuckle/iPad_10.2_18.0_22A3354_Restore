@implementation _DPRandomizedBit

- (_DPRandomizedBit)init
{

  return 0;
}

- (id)initBit:(int64_t)a3 atIndex:(unint64_t)a4
{
  _DPRandomizedBit *v6;
  _DPRandomizedBit *v7;
  objc_super v9;

  if (a3 == 1 || a3 == -1)
  {
    v9.receiver = self;
    v9.super_class = (Class)_DPRandomizedBit;
    v6 = -[_DPRandomizedBit init](&v9, sel_init);
    if (v6)
    {
      v6->_index = a4;
      v6->_value = a3;
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)randomizedBit:(int64_t)a3 atIndex:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initBit:atIndex:", a3, a4);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { index=%ld ; value=%ld }"), v5, self->_index, self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)index
{
  return self->_index;
}

- (int64_t)value
{
  return self->_value;
}

@end
