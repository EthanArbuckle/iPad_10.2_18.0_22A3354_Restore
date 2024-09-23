@implementation MFRangedDataFilter

+ (id)rangedFilterWithConsumers:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a4.length;
  location = a4.location;
  objc_msgSend(a1, "filterWithConsumers:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setRange:", location, length);
  return v7;
}

+ (id)rangedFilterWithConsumer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a4.length;
  location = a4.location;
  objc_msgSend(a1, "filterWithConsumer:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setRange:", location, length);
  return v7;
}

- (int64_t)appendData:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger consumedLength;
  NSRange v7;
  NSUInteger v8;
  MFData *v9;
  int64_t v10;
  NSUInteger v11;
  objc_super v13;
  objc_super v14;
  NSRange v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  consumedLength = self->_consumedLength;
  v15.location = consumedLength;
  v15.length = v5;
  v7 = NSIntersectionRange(self->_range, v15);
  if (v7.length)
  {
    v8 = v7.location - self->_consumedLength;
    if (v7.length < v5)
    {
      v9 = -[MFData initWithBytesNoCopy:length:freeWhenDone:]([MFData alloc], "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v4), "bytes") + v8, v7.length, 0);
      v13.receiver = self;
      v13.super_class = (Class)MFRangedDataFilter;
      v10 = -[MFBaseFilterDataConsumer appendData:](&v13, sel_appendData_, v9);

      if (v10 < 0)
        goto LABEL_13;
      goto LABEL_8;
    }
    v14.receiver = self;
    v14.super_class = (Class)MFRangedDataFilter;
    v10 = -[MFBaseFilterDataConsumer appendData:](&v14, sel_appendData_, v4);
    if ((v10 & 0x8000000000000000) == 0)
    {
LABEL_8:
      if (v5 == v10)
        v11 = 0;
      else
        v11 = v8;
      v5 = v11 + v10;
      goto LABEL_12;
    }
  }
  else
  {
    if (consumedLength + v5 < self->_range.location)
    {
LABEL_12:
      self->_consumedLength += v5;
      v10 = v5;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end
