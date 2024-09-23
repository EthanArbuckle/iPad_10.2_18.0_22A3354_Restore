@implementation __NSOrderedSetReverseEnumerator

- (__NSOrderedSetReverseEnumerator)initWithObject:(id)a3
{
  self->_obj = a3;
  self->_idx = objc_msgSend(a3, "count");
  return self;
}

- (id)nextObject
{
  id obj;
  unint64_t idx;

  obj = self->_obj;
  if (obj)
  {
    idx = self->_idx;
    if (idx)
    {
      self->_idx = idx - 1;
      return (id)objc_msgSend(self->_obj, "objectAtIndex:");
    }

    self->_obj = 0;
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetReverseEnumerator;
  -[__NSOrderedSetReverseEnumerator dealloc](&v3, sel_dealloc);
}

@end
