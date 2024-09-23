@implementation _CNLazyArrayFastEnumerationSource

- (_CNLazyArrayFastEnumerationSource)initWithFastEnumeration:(id)a3
{
  id v5;
  _CNLazyArrayFastEnumerationSource *v6;
  _CNLazyArrayFastEnumerationSource *v7;
  _CNLazyArrayFastEnumerationSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNLazyArrayFastEnumerationSource;
  v6 = -[_CNLazyArrayFastEnumerationSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fastEnumeration, a3);
    v7->_state.state = 0;
    v7->_firstCall = 1;
    v7->_count = 0;
    v7->_index = 0;
    v7->_mutationsPtrValue = 0;
    v8 = v7;
  }

  return v7;
}

- (id)nextObject
{
  unint64_t count;
  mutationsPtr *v4;

  count = self->_count;
  if (count == self->_index)
  {
    -[_CNLazyArrayFastEnumerationSource fillBuffer](self, "fillBuffer");
    count = self->_count;
  }
  if (count)
    v4 = self->_state.itemsPtr[self->_index++];
  else
    v4 = 0;
  return v4;
}

- (void)fillBuffer
{
  int64_t mutationsPtrValue;
  id v4;

  self->_count = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](self->_fastEnumeration, "countByEnumeratingWithState:objects:count:", &self->_state, self->_stackbuf, 16);
  if (self->_firstCall)
  {
    mutationsPtrValue = *self->_state.var0;
  }
  else
  {
    mutationsPtrValue = self->_mutationsPtrValue;
    if (mutationsPtrValue != *self->_state.var0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("mutated while enumerating"), 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v4);
    }
  }
  self->_firstCall = 0;
  self->_mutationsPtrValue = mutationsPtrValue;
  self->_index = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastEnumeration, 0);
}

@end
