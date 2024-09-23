@implementation MFWeakProxy

+ (id)weakProxyForObject:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", a3);
}

- (MFWeakProxy)initWithObject:(id)a3
{
  MFWeakProxy *v5;
  MFWeakProxy *v6;
  uint64_t v8;
  void *v9;

  os_unfair_lock_lock((os_unfair_lock_t)&initWithObject__lock);
  v5 = (MFWeakProxy *)objc_getAssociatedObject(a3, (const void *)sWeakProxyContext);
  if (v5)
  {
    v6 = v5;

    self = v6;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E0D46158], "weakReferenceWithObject:", a3);
    if (v8)
    {
      if (self)
      {
        v9 = (void *)v8;
        self->_objectClass = (Class)objc_opt_class();
        self->_hash = objc_msgSend(a3, "hash");
        self->_weakRef = (MFWeakReferenceHolder *)v9;
        objc_setAssociatedObject(a3, (const void *)sWeakProxyContext, self, (void *)1);
      }
    }
    else
    {

      self = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&initWithObject__lock);
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFWeakProxy;
  -[MFWeakProxy dealloc](&v3, sel_dealloc);
}

- (MFWeakProxy)self
{
  MFWeakProxy *result;

  result = (MFWeakProxy *)-[MFWeakReferenceHolder reference](self->_weakRef, "reference");
  if (!result)
    return self;
  return result;
}

- (Class)superclass
{
  return class_getSuperclass(self->_objectClass);
}

- (Class)class
{
  return self->_objectClass;
}

- (BOOL)isProxy
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  MFWeakReferenceHolder *v7;
  MFWeakReferenceHolder *weakRef;
  void *v9;
  uint64_t v10;
  BOOL v11;

  if (self == a3)
    return 1;
  Class = object_getClass(self);
  if (Class == object_getClass(a3)
    && ((v7 = (MFWeakReferenceHolder *)*((_QWORD *)a3 + 2), weakRef = self->_weakRef, weakRef == v7)
     || ((v9 = (void *)-[MFWeakReferenceHolder reference](weakRef, "reference"),
          v10 = -[MFWeakReferenceHolder reference](v7, "reference"),
          v9)
       ? (v11 = v10 == 0)
       : (v11 = 1),
         !v11 && (objc_msgSend(v9, "isEqual:", v10) & 1) != 0)))
  {
    return 1;
  }
  else
  {
    return objc_msgSend((id)-[MFWeakReferenceHolder reference](self->_weakRef, "reference"), "isEqual:", a3);
  }
}

- (unint64_t)hash
{
  return self->_hash;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** -[MFWeakProxy doesNotRecognizeSelector:%s] called!"), sel_getName(a3));
}

- (id)descriptionWithLocale:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)-[MFWeakReferenceHolder reference](self->_weakRef, "reference", a3), "description");
  if (v4)
    return (id)objc_msgSend(CFSTR("(weak proxy) "), "stringByAppendingString:", v4);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@(%@): %p> zeroed reference"), object_getClass(self), self->_objectClass, self);
}

- (id)description
{
  return -[MFWeakProxy descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;

  if (sel_isEqual(a3, sel_respondsToSelector_)
    || sel_isEqual(a3, sel_conformsToProtocol_)
    || sel_isEqual(a3, sel_descriptionWithLocale_)
    || sel_isEqual(a3, sel_description))
  {
    v5 = 1;
    return v5 & 1;
  }
  if (-[MFWeakReferenceHolder reference](self->_weakRef, "reference"))
  {
    v5 = objc_opt_respondsToSelector();
    return v5 & 1;
  }
  return -[objc_class instancesRespondToSelector:](self->_objectClass, "instancesRespondToSelector:", a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  Class objectClass;

  objectClass = (Class)-[MFWeakReferenceHolder reference](self->_weakRef, "reference");
  if (!objectClass)
    objectClass = self->_objectClass;
  return -[objc_class conformsToProtocol:](objectClass, "conformsToProtocol:", a3);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return (id)-[MFWeakReferenceHolder reference](self->_weakRef, "reference", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[objc_class instanceMethodSignatureForSelector:](self->_objectClass, "instanceMethodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  size_t v4;
  size_t v5;
  char *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnLength");
  if (v4)
  {
    v5 = v4;
    v6 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    memset(v6, 170, v4);
    bzero(v6, v5);
    objc_msgSend(a3, "setReturnValue:", v6);
  }
}

@end
