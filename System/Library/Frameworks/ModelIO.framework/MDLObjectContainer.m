@implementation MDLObjectContainer

- (MDLObjectContainer)init
{
  MDLObjectContainer *v2;
  uint64_t v3;
  NSMutableArray *objects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MDLObjectContainer;
  v2 = -[MDLObjectContainer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    objects = v2->_objects;
    v2->_objects = (NSMutableArray *)v3;

  }
  return v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return objc_msgSend_countByEnumeratingWithState_objects_count_(self->_objects, a2, (uint64_t)a3, a4, a5);
}

- (void)addObject:(id)a3
{
  objc_msgSend_addObject_(self->_objects, a2, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

- (void)removeObject:(id)a3
{
  objc_msgSend_removeObject_(self->_objects, a2, (uint64_t)a3);
}

- (NSArray)objects
{
  return (NSArray *)self->_objects;
}

- (unint64_t)count
{
  uint64_t v2;

  return objc_msgSend_count(self->_objects, a2, v2);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndexedSubscript_(self->_objects, a2, a3);
}

@end
