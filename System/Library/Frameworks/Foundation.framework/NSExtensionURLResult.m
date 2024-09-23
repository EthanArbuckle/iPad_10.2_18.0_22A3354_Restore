@implementation NSExtensionURLResult

- (NSExtensionURLResult)init
{
  NSExtensionURLResult *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSExtensionURLResult;
  v2 = -[NSExtensionURLResult init](&v4, sel_init);
  v2->_lock._os_unfair_lock_opaque = 0;
  v2->_url = 0;
  v2->_sema = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  return v2;
}

- (void)setURL:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSURL *url;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_url == a3)
  {
    url = 0;
  }
  else
  {
    url = self->_url;
    self->_url = (NSURL *)objc_msgSend(a3, "copy");
  }
  os_unfair_lock_unlock(p_lock);

}

- (id)copiedURL
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSURL copy](self->_url, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSURL)url
{
  return (NSURL *)-[NSExtensionURLResult copiedURL](self, "copiedURL");
}

- (void)signal
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
}

- (BOOL)wait:(double)a3
{
  dispatch_time_t v4;

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, v4) != 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_sema);
  v3.receiver = self;
  v3.super_class = (Class)NSExtensionURLResult;
  -[NSExtensionURLResult dealloc](&v3, sel_dealloc);
}

@end
