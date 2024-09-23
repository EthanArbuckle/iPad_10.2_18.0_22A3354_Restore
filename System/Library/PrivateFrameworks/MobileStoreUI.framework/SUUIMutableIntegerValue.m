@implementation SUUIMutableIntegerValue

- (unint64_t)hash
{
  return ~self->_integerValue;
}

- (BOOL)isEqual:(id)a3
{
  SUUIMutableIntegerValue *v4;
  BOOL v5;

  v4 = (SUUIMutableIntegerValue *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_integerValue == self->_integerValue;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIntegerValue:", self->_integerValue);
  return v4;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (void)setIntegerValue:(int64_t)a3
{
  self->_integerValue = a3;
}

@end
