@implementation __NSArrayReverseEnumerator

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSArrayReverseEnumerator;
  -[__NSArrayReverseEnumerator dealloc](&v3, sel_dealloc);
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

- (__NSArrayReverseEnumerator)initWithObject:(id)a3
{
  __NSArrayReverseEnumerator *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)__NSArrayReverseEnumerator;
  v4 = -[__NSArrayReverseEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_obj = a3;
    v4->_idx = objc_msgSend(a3, "count");
  }
  return v4;
}

@end
