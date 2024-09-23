@implementation NSConstraintCacheKey

- (void)dealloc
{
  objc_super v3;

  self->_values = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSConstraintCacheKey;
  -[NSConstraintCacheKey dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSConstraintCacheKey: %@>"), self->_values);
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_values, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int v6;
  void *v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  BOOL v11;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (void *)*((_QWORD *)a3 + 1);
    v8 = -[NSArray count](self->_values, "count");
    if (v8)
    {
      v9 = 0;
      v10 = v8 - 1;
      do
      {
        v6 = objc_msgSend(-[NSArray objectAtIndex:](self->_values, "objectAtIndex:", v9), "isEqual:", objc_msgSend(v7, "objectAtIndex:", v9));
        if (v6)
          v11 = v10 == v9;
        else
          v11 = 1;
        ++v9;
      }
      while (!v11);
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end
