@implementation IMDPersistenceServiceListener

- (IMDPersistenceServiceListener)init
{
  IMDPersistenceServiceListener *v2;
  __IMDPersistenceServiceListenerImpl *v3;
  __IMDPersistenceServiceListenerImpl *impl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDPersistenceServiceListener;
  v2 = -[IMDPersistenceServiceListener init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(__IMDPersistenceServiceListenerImpl);
    impl = v2->_impl;
    v2->_impl = v3;

  }
  return v2;
}

- (void)resume
{
  MEMORY[0x1E0DE7D20](self->_impl, sel_resume);
}

- (__IMDPersistenceServiceListenerImpl)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
