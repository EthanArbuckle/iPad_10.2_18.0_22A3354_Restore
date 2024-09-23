@implementation WKRemoteObject

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (id)_initWithObjectRegistry:(id)a3 interface:(id)a4
{
  WKRemoteObject *v6;
  void *m_ptr;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKRemoteObject;
  v6 = -[WKRemoteObject init](&v10, sel_init);
  if (v6)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v6->_objectRegistry.m_ptr;
    v6->_objectRegistry.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a4)
      CFRetain(a4);
    v8 = v6->_interface.m_ptr;
    v6->_interface.m_ptr = a4;
    if (v8)
      CFRelease(v8);
  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(self->_objectRegistry.m_ptr, "_sendInvocation:interface:", a3, self->_interface.m_ptr);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  Protocol *v5;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v9;
  objc_super v10;

  if (!a3)
    return 0;
  v5 = (Protocol *)objc_msgSend(self->_interface.m_ptr, "protocol");
  MethodDescription = protocol_getMethodDescription(v5, a3, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name || (v9 = protocol_getMethodDescription(v5, a3, 0, 1), types = v9.types, v9.name))
  {
    if (types)
      return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
  }
  v10.receiver = self;
  v10.super_class = (Class)WKRemoteObject;
  return -[WKRemoteObject methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKRemoteObject;
  return -[WKRemoteObject conformsToProtocol:](&v6, sel_conformsToProtocol_)
      || protocol_conformsToProtocol((Protocol *)objc_msgSend(self->_interface.m_ptr, "protocol"), (Protocol *)a3);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_interface.m_ptr;
  self->_interface.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_objectRegistry.m_ptr;
  self->_objectRegistry.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

@end
