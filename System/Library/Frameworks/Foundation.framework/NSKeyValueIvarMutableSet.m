@implementation NSKeyValueIvarMutableSet

- (id)_proxyInitWithContainer:(id)a3 getter:(id)a4
{
  _QWORD *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSKeyValueIvarMutableSet;
  v5 = -[NSKeyValueMutableSet _proxyInitWithContainer:getter:](&v7, sel__proxyInitWithContainer_getter_, a3);
  if (v5)
    v5[3] = objc_msgSend(a4, "ivar");
  return v5;
}

- (void)_proxyNonGCFinalize
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueIvarMutableSet;
  -[NSKeyValueMutableSet _proxyNonGCFinalize](&v3, sel__proxyNonGCFinalize);
  self->_ivar = 0;
}

- (unint64_t)count
{
  return objc_msgSend(*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)), "count");
}

- (id)member:(id)a3
{
  return (id)objc_msgSend(*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)), "member:", a3);
}

- (id)objectEnumerator
{
  NSObject *container;
  void *v3;

  container = self->super._container;
  v3 = *(Class *)((char *)&container->isa + ivar_getOffset(self->_ivar));
  if (v3)
    return (id)objc_msgSend(v3, "objectEnumerator");
  else
    return objc_alloc_init(NSKeyValueNilSetEnumerator);
}

- (void)addObject:(id)a3
{
  NSObject *container;
  ptrdiff_t Offset;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  container = self->super._container;
  Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6)
    objc_msgSend(v6, "addObject:", a3);
  else
    *(Class *)((char *)&container->isa + Offset) = (Class)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", v7, 1);
}

- (void)addObjectsFromArray:(id)a3
{
  NSObject *container;
  ptrdiff_t Offset;
  void *v6;

  container = self->super._container;
  Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6)
    objc_msgSend(v6, "addObjectsFromArray:", a3);
  else
    *(Class *)((char *)&container->isa + Offset) = (Class)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a3);
}

- (void)intersectSet:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)), "intersectSet:", a3);
}

- (void)minusSet:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)), "minusSet:", a3);
}

- (void)removeAllObjects
{
  objc_msgSend(*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)), "removeAllObjects");
}

- (void)removeObject:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super._container->isa + ivar_getOffset(self->_ivar)), "removeObject:", a3);
}

- (void)setSet:(id)a3
{
  NSObject *container;
  ptrdiff_t Offset;
  void *v6;

  container = self->super._container;
  Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6)
    objc_msgSend(v6, "setSet:", a3);
  else
    *(Class *)((char *)&container->isa + Offset) = (Class)objc_msgSend(a3, "mutableCopy");
}

- (void)unionSet:(id)a3
{
  NSObject *container;
  ptrdiff_t Offset;
  void *v6;

  container = self->super._container;
  Offset = ivar_getOffset(self->_ivar);
  v6 = *(Class *)((char *)&container->isa + Offset);
  if (v6)
    objc_msgSend(v6, "unionSet:", a3);
  else
    *(Class *)((char *)&container->isa + Offset) = (Class)objc_msgSend(a3, "mutableCopy");
}

@end
