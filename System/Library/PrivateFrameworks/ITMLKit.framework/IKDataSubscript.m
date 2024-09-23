@implementation IKDataSubscript

- (IKDataSubscript)initWithSubscriptIndex:(int64_t)a3
{
  IKDataSubscript *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IKDataSubscript;
  result = -[IKDataSubscript init](&v5, sel_init);
  if (result)
    result->_subscriptIndex = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "subscriptIndex");
    v6 = v5 == -[IKDataSubscript subscriptIndex](self, "subscriptIndex");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)subscriptIndex
{
  return self->_subscriptIndex;
}

@end
