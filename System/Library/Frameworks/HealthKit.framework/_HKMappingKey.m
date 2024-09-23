@implementation _HKMappingKey

- (id)initWithObject:(void *)a3 andKey:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_HKMappingKey;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), v5);
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (uint64_t)objectMatches:(uint64_t)result
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v2 = result;
    v3 = (objc_class *)MEMORY[0x1E0CB3940];
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%p"), v4);

    v6 = objc_msgSend(*(id *)(v2 + 8), "isEqualToString:", v5);
    return v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _HKMappingKey *v4;
  void *v5;
  id *v6;
  char v7;

  v4 = (_HKMappingKey *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
    {
      v6 = v4;
      if (objc_msgSend(v6[1], "isEqual:", self->_addressOfObject))
        v7 = objc_msgSend(v6[2], "isEqual:", self->_key);
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_key, "hash");
  return -[NSString hash](self->_addressOfObject, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong((id *)&self->_addressOfObject, 0);
}

@end
