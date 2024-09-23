@implementation __NSFastEnumerationEnumerator

- (id)nextObject
{
  $3B429ED2F580789D4B8DAD2AD537856C *p_state;
  unint64_t state;
  unint64_t v5;
  id result;
  unint64_t index;
  mutationsPtr **itemsPtr;

  if (self->_index == self->_count)
  {
    p_state = &self->_state;
    state = self->_state.state;
    self->_index = 0;
    v5 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](self->_obj, "countByEnumeratingWithState:objects:count:", &self->_state, self->_objects, 16);
    self->_count = v5;
    if (!v5)
    {

      self->_obj = 0;
      result = 0;
      self->_origObj = 0;
      return result;
    }
    if (state)
    {
      if (self->_mut != *p_state->var0)
        __NSFastEnumerationMutationHandler((uint64_t)self->_obj);
    }
    else
    {
      self->_mut = *p_state->var0;
    }
  }
  index = self->_index;
  itemsPtr = self->_state.itemsPtr;
  self->_index = index + 1;
  return itemsPtr[index];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return __CFAllocateObject(v3, 0x40uLL);
}

- (__NSFastEnumerationEnumerator)initWithObject:(id)a3
{
  __NSFastEnumerationEnumerator *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)__NSFastEnumerationEnumerator;
  v4 = -[__NSFastEnumerationEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_obj = (NSFastEnumeration *)a3;
    v4->_origObj = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSFastEnumerationEnumerator;
  -[__NSFastEnumerationEnumerator dealloc](&v3, sel_dealloc);
}

@end
