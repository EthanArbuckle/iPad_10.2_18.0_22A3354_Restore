@implementation AVRetainReleaseWeakReference

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_weakStorage, 0);
  v3.receiver = self;
  v3.super_class = (Class)AVRetainReleaseWeakReference;
  -[AVRetainReleaseWeakReference dealloc](&v3, sel_dealloc);
}

- (AVRetainReleaseWeakReference)initWithReferencedObject:(id)a3
{
  AVRetainReleaseWeakReference *v4;
  id v5;
  objc_class *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVRetainReleaseWeakReference;
  v4 = -[AVRetainReleaseWeakReference init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (objc_class *)objc_opt_class();
    v4->_cachedReferencedObjectDescription = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v6), a3);
    objc_storeWeak(&v4->_weakStorage, a3);
  }
  return v4;
}

- (id)referencedObject
{
  return objc_loadWeak(&self->_weakStorage);
}

- (AVRetainReleaseWeakReference)init
{
  return -[AVRetainReleaseWeakReference initWithReferencedObject:](self, "initWithReferencedObject:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, referencedObject = %@>"), NSStringFromClass(v4), self, self->_cachedReferencedObjectDescription);
}

@end
