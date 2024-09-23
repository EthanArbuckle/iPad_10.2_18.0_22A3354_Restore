@implementation GDPersonEntityTagEventIDSet

- (GDPersonEntityTagEventIDSet)initWithEventId:(int64_t)a3
{
  GDPersonEntityTagEventIDSet *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSMutableSet *internalSet;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GDPersonEntityTagEventIDSet;
  v4 = -[GDPersonEntityTagEventIDSet init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_initWithObjects_(v5, v8, (uint64_t)v7, 0);
    internalSet = v4->_internalSet;
    v4->_internalSet = (NSMutableSet *)v9;

  }
  return v4;
}

- (void)addEventId:(int64_t)a3
{
  NSMutableSet *internalSet;
  const char *v4;
  id v5;

  internalSet = self->_internalSet;
  objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(internalSet, v4, (uint64_t)v5);

}

- (void)addObject:(id)a3
{
  objc_msgSend_addObject_(self->_internalSet, a2, (uint64_t)a3);
}

- (void)removeObject:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_internalSet, sel_removeObject_, a3);
}

- (unint64_t)count
{
  uint64_t v2;

  return objc_msgSend_count(self->_internalSet, a2, v2);
}

- (id)member:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self->_internalSet, sel_member_, a3);
}

- (id)objectEnumerator
{
  return (id)((uint64_t (*)(NSMutableSet *, char *))MEMORY[0x1E0DE7D20])(self->_internalSet, sel_objectEnumerator);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSet, 0);
}

@end
