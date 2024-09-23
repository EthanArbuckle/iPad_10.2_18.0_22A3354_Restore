@implementation _NSNetServiceWeakObject

- (void)dealloc
{
  objc_super v3;

  if (self)
    objc_storeWeak(&self->_object, 0);
  v3.receiver = self;
  v3.super_class = (Class)_NSNetServiceWeakObject;
  -[_NSNetServiceWeakObject dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

- (id)initWithObject:(void *)a1
{
  id *v3;
  id *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)_NSNetServiceWeakObject;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
    objc_storeWeak(v3 + 1, a2);
  return v4;
}

@end
