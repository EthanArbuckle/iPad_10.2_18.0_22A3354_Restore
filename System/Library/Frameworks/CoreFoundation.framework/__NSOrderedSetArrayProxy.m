@implementation __NSOrderedSetArrayProxy

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSOrderedSetArrayProxy;
  -[__NSOrderedSetArrayProxy dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSArray initWithArray:range:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:range:copyItems:", self, 0, -[__NSOrderedSetArrayProxy count](self, "count"), 0);
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(self->_orderedSet, "objectAtIndex:", a3);
}

- (unint64_t)count
{
  return objc_msgSend(self->_orderedSet, "count");
}

- (__NSOrderedSetArrayProxy)initWithOrderedSet:(id)a3
{
  self->_orderedSet = a3;
  return self;
}

@end
