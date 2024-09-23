@implementation BRPair

+ (id)pairWithLeft:(id)a3 andRight:(id)a4
{
  id v5;
  id v6;
  BRPair *v7;
  id left;
  id v9;
  id right;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(BRPair);
  left = v7->_left;
  v7->_left = v5;
  v9 = v5;

  right = v7->_right;
  v7->_right = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  BRPair *v4;
  BRPair *v5;
  unint64_t left;
  unint64_t right;
  char v8;

  v4 = (BRPair *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      left = (unint64_t)self->_left;
      if (left | (unint64_t)v5->_left && !objc_msgSend((id)left, "isEqual:"))
      {
        v8 = 0;
      }
      else
      {
        right = (unint64_t)self->_right;
        if (right | (unint64_t)v5->_right)
          v8 = objc_msgSend((id)right, "isEqual:");
        else
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_left, "hash");
  return objc_msgSend(self->_right, "hash") ^ v3;
}

- (id)left
{
  return self->_left;
}

- (id)right
{
  return self->_right;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_right, 0);
  objc_storeStrong(&self->_left, 0);
}

@end
