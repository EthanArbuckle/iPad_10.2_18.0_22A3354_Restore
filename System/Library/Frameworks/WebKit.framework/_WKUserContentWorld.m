@implementation _WKUserContentWorld

- (id)_initWithName:(id)a3
{
  _WKUserContentWorld *v4;
  WKContentWorld *v5;
  WKContentWorld *v6;
  void *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WKUserContentWorld;
  v4 = -[_WKUserContentWorld init](&v9, sel_init);
  if (v4)
  {
    v5 = +[WKContentWorld worldWithName:](WKContentWorld, "worldWithName:", a3);
    v6 = v5;
    if (v5)
      CFRetain(v5);
    m_ptr = v4->_contentWorld.m_ptr;
    v4->_contentWorld.m_ptr = v6;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (id)_init
{
  _WKUserContentWorld *v2;
  WKContentWorld *v3;
  WKContentWorld *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentWorld;
  v2 = -[_WKUserContentWorld init](&v7, sel_init);
  if (v2)
  {
    v3 = +[WKContentWorld pageWorld](WKContentWorld, "pageWorld");
    v4 = v3;
    if (v3)
      CFRetain(v3);
    m_ptr = v2->_contentWorld.m_ptr;
    v2->_contentWorld.m_ptr = v4;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v2;
}

- (id)_initWithContentWorld:(id)a3
{
  _WKUserContentWorld *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKUserContentWorld;
  v4 = -[_WKUserContentWorld init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_contentWorld.m_ptr;
    v4->_contentWorld.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

+ (_WKUserContentWorld)worldWithName:(id)a3
{
  return (_WKUserContentWorld *)(id)CFMakeCollectable(-[_WKUserContentWorld _initWithName:]([_WKUserContentWorld alloc], "_initWithName:", a3));
}

+ (id)normalWorld
{
  return (id)(id)CFMakeCollectable(-[_WKUserContentWorld _init]([_WKUserContentWorld alloc], "_init"));
}

- (NSString)name
{
  return (NSString *)objc_msgSend(self->_contentWorld.m_ptr, "name");
}

- (Object)_apiObject
{
  return (Object *)objc_msgSend(self->_contentWorld.m_ptr, "_apiObject");
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_contentWorld.m_ptr;
  self->_contentWorld.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
