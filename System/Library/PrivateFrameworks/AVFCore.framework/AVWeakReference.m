@implementation AVWeakReference

+ (AVWeakReference)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (AVWeakReference *)objc_msgSend((id)_concreteAVWeakReferenceClass, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVWeakReference;
  return (AVWeakReference *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _concreteAVWeakReferenceClass = objc_opt_class();
}

- (AVWeakReference)initWithReferencedObject:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);

  return 0;
}

- (id)referencedObject
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end
