@implementation _PFWeakReference

- (void)dealloc
{
  objc_super v3;

  if (self->_objectAddress)
    objc_storeWeakOrNil(&self->_object, 0);
  v3.receiver = self;
  v3.super_class = (Class)_PFWeakReference;
  -[_PFWeakReference dealloc](&v3, sel_dealloc);
}

+ (id)weakReferenceWithObject:(uint64_t)a1
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_self();
  if (a2)
    return (id)objc_msgSend([v3 alloc], "initWithObject:", a2);
  else
    return 0;
}

- (_PFWeakReference)initWithObject:(id)a3
{
  _PFWeakReference *v4;
  _PFWeakReference *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PFWeakReference;
  v4 = -[_PFWeakReference init](&v7, sel_init);
  v5 = v4;
  if (!a3)
    goto LABEL_5;
  if (v4)
  {
    if (objc_storeWeakOrNil(&v4->_object, a3))
    {
      v5->_objectAddress = (int64_t)a3;
      return v5;
    }
LABEL_5:

    return 0;
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && *((_QWORD *)a3 + 2) == self->_objectAddress;
}

@end
