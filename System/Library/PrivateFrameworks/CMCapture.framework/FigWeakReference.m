@implementation FigWeakReference

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_referencedObject, 0);
  v3.receiver = self;
  v3.super_class = (Class)FigWeakReference;
  -[FigWeakReference dealloc](&v3, sel_dealloc);
}

- (id)referencedObject
{
  return objc_loadWeak(&self->_referencedObject);
}

+ (id)weakReferenceToObject:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReferencedObject:", a3);
}

- (FigWeakReference)initWithReferencedObject:(id)a3
{
  FigWeakReference *v4;
  FigWeakReference *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigWeakReference;
  v4 = -[FigWeakReference init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      objc_storeWeak(&v4->_referencedObject, a3);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (id)retainReferencedObject
{
  return objc_loadWeakRetained(&self->_referencedObject);
}

@end
