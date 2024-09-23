@implementation GDPersonEntityTagDirectFeedbackSet

- (GDPersonEntityTagDirectFeedbackSet)initWithFeedbackInference:(id)a3
{
  id v4;
  GDPersonEntityTagDirectFeedbackSet *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSMutableSet *internalSet;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDPersonEntityTagDirectFeedbackSet;
  v5 = -[GDPersonEntityTagDirectFeedbackSet init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E20]);
    v8 = objc_msgSend_initWithObjects_(v6, v7, (uint64_t)v4, 0);
    internalSet = v5->_internalSet;
    v5->_internalSet = (NSMutableSet *)v8;

  }
  return v5;
}

- (void)addFeedbackInference:(id)a3
{
  objc_msgSend_addObject_(self->_internalSet, a2, (uint64_t)a3);
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
