@implementation _PFResultObjectKeyEnumerator

- (_PFResultObjectKeyEnumerator)initWithArray:(const void *)a3 forTarget:(id)a4 withReferenceValues:(unint64_t *)a5 andRange:(_NSRange)a6
{
  int64_t length;
  NSUInteger location;
  _PFResultObjectKeyEnumerator *v11;
  _PFResultObjectKeyEnumerator *v12;
  objc_super v14;

  length = a6.length;
  location = a6.location;
  v14.receiver = self;
  v14.super_class = (Class)_PFResultObjectKeyEnumerator;
  v11 = -[_PFResultObjectKeyEnumerator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_range.location = location;
    v11->_range.length = length;
    if (length <= 0)
    {
      v11->_target = 0;
      v11->_keys = 0;
      v11->_referenceItems = 0;
    }
    else
    {
      v11->_target = a4;
      v12->_keys = a3;
      v12->_referenceItems = a5;
    }
    v12->_index = location;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    self->_keys = 0;
    self->_referenceItems = 0;

    self->_target = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_PFResultObjectKeyEnumerator;
  -[_PFResultObjectKeyEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  const void **keys;
  _NSRange *p_range;
  unint64_t index;
  void *v6;
  unint64_t v7;
  id v8;

  keys = self->_keys;
  if (!keys)
    return 0;
  p_range = &self->_range;
  do
  {
    index = self->_index;
    if (self->_referenceItems[index])
      v6 = (void *)keys[index];
    else
      v6 = 0;
    v7 = index + 1;
    self->_index = v7;
    if (v7 == p_range->length + p_range->location)
    {
      if (v6)
        v8 = v6;
      self->_keys = 0;
      self->_referenceItems = 0;

      self->_target = 0;
      keys = self->_keys;
    }
  }
  while (keys && !v6);
  return v6;
}

@end
