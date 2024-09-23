@implementation _DPValueRange

- (_DPValueRange)init
{

  return 0;
}

- (_DPValueRange)initWithMin:(id)a3 max:(id)a4
{
  id v7;
  id v8;
  _DPValueRange *v9;
  _DPValueRange *v10;
  _DPValueRange *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  NSNumber *range;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "compare:", v8) == 1)
  {
    v9 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_DPValueRange;
    v10 = -[_DPValueRange init](&v20, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_minPossible, a3);
      objc_storeStrong((id *)&v11->_maxPossible, a4);
      objc_msgSend(v7, "doubleValue");
      v13 = v12;
      objc_msgSend(v8, "doubleValue");
      if (v14 >= 0.0)
      {
        v15 = (void *)MEMORY[0x1E0CB37E8];
        if (v13 <= 0.0)
          v16 = v14 + fabs(v13);
        else
          v16 = v14 - v13;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB37E8];
        v16 = fabs(v13) - fabs(v14);
      }
      objc_msgSend(v15, "numberWithDouble:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      range = v11->_range;
      v11->_range = (NSNumber *)v17;

    }
    self = v11;
    v9 = self;
  }

  return v9;
}

+ (id)rangeWithMin:(id)a3 max:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMin:max:", v7, v6);

  return v8;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { min=%@ ; max=%@ ; range=%@ }"),
    v5,
    self->_minPossible,
    self->_maxPossible,
    self->_range);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqualToValueRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  if (!a3)
    return 0;
  v4 = a3;
  -[_DPValueRange maxPossible](self, "maxPossible");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxPossible");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  -[_DPValueRange minPossible](self, "minPossible");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minPossible");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  -[_DPValueRange range](self, "range");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "range");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v11, "isEqual:", v12);
  return v7 & v10 & v4;
}

- (BOOL)isEqual:(id)a3
{
  _DPValueRange *v4;
  _DPValueRange *v5;
  BOOL v6;

  v4 = (_DPValueRange *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_DPValueRange isEqualToValueRange:](self, "isEqualToValueRange:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[_DPValueRange maxPossible](self, "maxPossible");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  -[_DPValueRange minPossible](self, "minPossible");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue") ^ v4;
  -[_DPValueRange range](self, "range");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "unsignedIntegerValue");

  return v8;
}

- (NSNumber)minPossible
{
  return self->_minPossible;
}

- (NSNumber)maxPossible
{
  return self->_maxPossible;
}

- (NSNumber)range
{
  return self->_range;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_maxPossible, 0);
  objc_storeStrong((id *)&self->_minPossible, 0);
}

@end
