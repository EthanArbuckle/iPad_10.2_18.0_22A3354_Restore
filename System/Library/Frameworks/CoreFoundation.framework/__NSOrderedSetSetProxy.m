@implementation __NSOrderedSetSetProxy

- (__NSOrderedSetSetProxy)initWithOrderedSet:(id)a3
{
  self->_orderedSet = a3;
  return self;
}

- (unint64_t)count
{
  return objc_msgSend(self->_orderedSet, "count");
}

- (id)objectEnumerator
{
  return (id)objc_msgSend(self->_orderedSet, "objectEnumerator");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetSetProxy;
  -[__NSOrderedSetSetProxy dealloc](&v3, sel_dealloc);
}

- (id)member:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(self->_orderedSet, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return (id)objc_msgSend(self->_orderedSet, "objectAtIndex:", v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSSet initWithSet:copyItems:](+[NSSet allocWithZone:](NSSet, "allocWithZone:", a3), "initWithSet:copyItems:", self, 0);
}

@end
