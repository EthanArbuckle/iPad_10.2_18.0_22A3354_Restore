@implementation PHRecyclableObjectVendor

- (void)recycleObject:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    if (self->_repsondsToPrepareForReuse)
      objc_msgSend(v4, "prepareForReuse");
    if (self->_threadSafe)
      os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray addObject:](self->_recycledObjects, "addObject:", v4);
    if (self->_threadSafe)
      os_unfair_lock_unlock(&self->_lock);
  }

}

- (id)dequeueRecyclableObject
{
  objc_class *v3;
  void (**builder)(id, objc_class *);

  if (self->_threadSafe)
    os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_recycledObjects, "count"))
  {
    -[NSMutableArray lastObject](self->_recycledObjects, "lastObject");
    v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_recycledObjects, "removeLastObject");
  }
  else
  {
    v3 = -[objc_class init](-[objc_class alloc](self->_targetClass, "alloc"), "init");
    builder = (void (**)(id, objc_class *))self->_builder;
    if (builder)
      builder[2](builder, v3);
  }
  if (self->_threadSafe)
    os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (PHRecyclableObjectVendor)initWithTargetClass:(Class)a3 requiresThreadSafety:(BOOL)a4 initialPoolSize:(int64_t)a5
{
  return -[PHRecyclableObjectVendor initWithTargetClass:requiresThreadSafety:initialPoolSize:prototypeStep:](self, "initWithTargetClass:requiresThreadSafety:initialPoolSize:prototypeStep:", a3, a4, a5, 0);
}

- (PHRecyclableObjectVendor)initWithTargetClass:(Class)a3 requiresThreadSafety:(BOOL)a4 initialPoolSize:(int64_t)a5 prototypeStep:(id)a6
{
  id v11;
  PHRecyclableObjectVendor *v12;
  int64_t v13;
  uint64_t v14;
  NSMutableArray *recycledObjects;
  NSMutableArray *v16;
  id v17;
  void *v18;
  id builder;
  void *v21;
  objc_super v22;

  v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PHRecyclableObjectVendor;
  v12 = -[PHRecyclableObjectVendor init](&v22, sel_init);
  if (v12)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PHRecyclableObjectVendor.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class"));

    }
    if (a5 <= 20)
      v13 = 20;
    else
      v13 = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    recycledObjects = v12->_recycledObjects;
    v12->_recycledObjects = (NSMutableArray *)v14;

    if (a5 >= 1)
    {
      do
      {
        v16 = v12->_recycledObjects;
        v17 = objc_alloc_init(a3);
        -[NSMutableArray addObject:](v16, "addObject:", v17);

        --a5;
      }
      while (a5);
    }
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_repsondsToPrepareForReuse = class_respondsToSelector(a3, sel_prepareForReuse);
    v12->_targetClass = a3;
    v12->_threadSafe = a4;
    v18 = _Block_copy(v11);
    builder = v12->_builder;
    v12->_builder = v18;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_builder, 0);
  objc_storeStrong((id *)&self->_recycledObjects, 0);
}

@end
