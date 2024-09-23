@implementation IMLocalObjectInternal

- (void)dealloc
{
  os_unfair_lock_s *p_componentQueueLock;
  NSMutableArray *componentQueue;
  objc_super v5;

  p_componentQueueLock = &self->_componentQueueLock;
  os_unfair_lock_lock(&self->_componentQueueLock);
  componentQueue = self->_componentQueue;
  if (componentQueue)
    CFRelease(componentQueue);
  os_unfair_lock_unlock(p_componentQueueLock);
  v5.receiver = self;
  v5.super_class = (Class)IMLocalObjectInternal;
  -[IMLocalObjectInternal dealloc](&v5, sel_dealloc);
}

@end
