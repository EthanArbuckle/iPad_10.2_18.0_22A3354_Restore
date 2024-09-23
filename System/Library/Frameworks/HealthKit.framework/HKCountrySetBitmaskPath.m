@implementation HKCountrySetBitmaskPath

+ (id)pathWithBitmask:(unint64_t)a3 index:(int64_t)a4
{
  HKCountrySetBitmaskPath *v6;
  objc_super v8;

  v6 = [HKCountrySetBitmaskPath alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)HKCountrySetBitmaskPath;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6)
    {
      v6->_bitmask = a3;
      v6->_index = a4;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return self->_index ^ self->_bitmask;
}

- (BOOL)isEqual:(id)a3
{
  HKCountrySetBitmaskPath *v4;
  BOOL v5;

  v4 = (HKCountrySetBitmaskPath *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[HKCountrySetBitmaskPath _isEqualToMask:]((_BOOL8)self, v4);
  }

  return v5;
}

- (BOOL)_isEqualToMask:(_BOOL8)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "index");
    if (v5 == objc_msgSend((id)a1, "index"))
    {
      v6 = objc_msgSend(v4, "bitmask");
      a1 = v6 == objc_msgSend((id)a1, "bitmask");
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (unint64_t)bitmask
{
  return self->_bitmask;
}

- (int64_t)index
{
  return self->_index;
}

@end
