@implementation WKObject

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_target.m_ptr;
  self->_target.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)dealloc
{
  objc_class *v3;
  void (***v4)(_QWORD);
  objc_super v5;
  void *__ptr;
  size_t __space;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    __space = 16;
    __ptr = object_getIndexedIvars(self);
    v4 = (void (***)(_QWORD))std::align(8uLL, 0x10uLL, &__ptr, &__space);
    (**v4)(v4);
    v5.receiver = self;
    v5.super_class = (Class)WKObject;
    -[WKObject dealloc](&v5, sel_dealloc);
  }
}

- (Object)_apiObject
{
  void *IndexedIvars;
  size_t __space;

  __space = 16;
  IndexedIvars = object_getIndexedIvars(self);
  return (Object *)std::align(8uLL, 0x10uLL, &IndexedIvars, &__space);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  initializeTargetIfNeeded(self);
  return self->_target.m_ptr;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isEqual:", a3);
}

- (unint64_t)hash
{
  void *m_ptr;
  objc_super v5;

  initializeTargetIfNeeded(self);
  m_ptr = self->_target.m_ptr;
  if (m_ptr)
    return objc_msgSend(m_ptr, "hash");
  v5.receiver = self;
  v5.super_class = (Class)WKObject;
  return -[WKObject hash](&v5, sel_hash);
}

- (BOOL)isKindOfClass:(Class)a3
{
  initializeTargetIfNeeded(self);
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isMemberOfClass:", a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  initializeTargetIfNeeded(self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)WKObject;
  return -[WKObject respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v6;

  initializeTargetIfNeeded(self);
  if ((objc_msgSend(self->_target.m_ptr, "conformsToProtocol:", a3) & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)WKObject;
  return -[WKObject conformsToProtocol:](&v6, sel_conformsToProtocol_, a3);
}

- (NSString)description
{
  void *m_ptr;
  objc_super v5;

  initializeTargetIfNeeded(self);
  m_ptr = self->_target.m_ptr;
  if (m_ptr)
    return (NSString *)objc_msgSend(m_ptr, "description");
  v5.receiver = self;
  v5.super_class = (Class)WKObject;
  return -[WKObject description](&v5, sel_description);
}

- (NSString)debugDescription
{
  void *m_ptr;

  initializeTargetIfNeeded(self);
  m_ptr = self->_target.m_ptr;
  if (m_ptr)
    return (NSString *)objc_msgSend(m_ptr, "debugDescription");
  else
    return -[WKObject description](self, "description");
}

- (Class)classForCoder
{
  initializeTargetIfNeeded(self);
  return (Class)objc_msgSend(self->_target.m_ptr, "classForCoder");
}

- (Class)classForKeyedArchiver
{
  initializeTargetIfNeeded(self);
  return (Class)objc_msgSend(self->_target.m_ptr, "classForKeyedArchiver");
}

- (id)_web_createTarget
{
  return 0;
}

- (void)forwardInvocation:(id)a3
{
  initializeTargetIfNeeded(self);
  objc_msgSend(a3, "invokeWithTarget:", self->_target.m_ptr);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  initializeTargetIfNeeded(self);
  return (id)objc_msgSend(self->_target.m_ptr, "methodSignatureForSelector:", a3);
}

- (BOOL)isNSObject__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSObject");
}

- (BOOL)isNSArray__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSArray");
}

- (BOOL)isNSCFConstantString__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSCFConstantString");
}

- (BOOL)isNSData__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSData");
}

- (BOOL)isNSDate__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSDate");
}

- (BOOL)isNSDictionary__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSDictionary");
}

- (BOOL)isNSNumber__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSNumber");
}

- (BOOL)isNSOrderedSet__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSOrderedSet");
}

- (BOOL)isNSSet__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSSet");
}

- (BOOL)isNSString__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSString");
}

- (BOOL)isNSTimeZone__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSTimeZone");
}

- (BOOL)isNSValue__
{
  initializeTargetIfNeeded(self);
  return objc_msgSend(self->_target.m_ptr, "isNSValue");
}

@end
