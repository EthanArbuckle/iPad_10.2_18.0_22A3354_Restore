@implementation MTLToolsResidencySet

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (unint64_t)allocatedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allocatedSize");
}

- (void)endResidency
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endResidency");
}

- (void)requestResidency
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "requestResidency");
}

- (unint64_t)currentGeneration
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "currentGeneration");
}

- (void)setCurrentGeneration:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCurrentGeneration:", a3);
}

- (unint64_t)expiredGeneration
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "expiredGeneration");
}

- (void)setExpiredGeneration:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setExpiredGeneration:", a3);
}

- (MTLToolsResidencySet)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsResidencySet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLToolsResidencySet;
  v4 = -[MTLToolsObject initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a4);
  if (v4)
  {
    v4->_allocations = (NSMutableSet *)objc_opt_new();
    v4->_committedAllocations = (NSMutableSet *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsResidencySet;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *__p[3];

  std::vector<objc_object  {objcproto13MTLAllocation}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      v8 = (void *)a3[v7];
      -[NSMutableSet addObject:](self->_allocations, "addObject:", v8);
      v9 = objc_msgSend(v8, "baseObject");
      *((_QWORD *)__p[0] + v7++) = v9;
    }
    while (a4 != v7);
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "addAllocations:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  uint64_t i;
  uint64_t v8;
  id v9;
  void *__p[3];

  v4 = a4;
  std::vector<objc_object  {objcproto13MTLAllocation}*>::vector(__p, a4);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v8 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v8;
    }
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "removeAllocations:count:", __p[0], v4);
  for (; v4; --v4)
    -[NSMutableSet removeObject:](self->_allocations, "removeObject:", *a3++);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)addAllocation:(id)a3
{
  -[NSMutableSet addObject:](self->_allocations, "addObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addAllocation:", objc_msgSend(a3, "baseObject"));
}

- (void)removeAllocation:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeAllocation:", objc_msgSend(a3, "baseObject"));
  -[NSMutableSet removeObject:](self->_allocations, "removeObject:", a3);
}

- (unint64_t)countForAllocation:(id)a3
{
  return -[NSMutableSet containsObject:](self->_allocations, "containsObject:", a3);
}

- (unint64_t)generationForAllocation:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "generationForAllocation:", objc_msgSend(a3, "baseObject"));
}

- (BOOL)containsAllocation:(id)a3
{
  return -[NSMutableSet containsObject:](self->_allocations, "containsObject:", a3);
}

- (void)removeAllAllocations
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeAllAllocations");
  -[NSMutableSet removeAllObjects](self->_allocations, "removeAllObjects");
}

- (NSArray)allAllocations
{
  return (NSArray *)-[NSMutableSet allObjects](self->_allocations, "allObjects");
}

- (NSArray)allCommittedAllocations
{
  return (NSArray *)-[NSMutableSet allObjects](self->_committedAllocations, "allObjects");
}

- (unint64_t)allocationCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allocationCount");
}

- (void)commit
{

  self->_committedAllocations = (NSMutableSet *)-[NSMutableSet copy](self->_allocations, "copy");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commit");
}

@end
