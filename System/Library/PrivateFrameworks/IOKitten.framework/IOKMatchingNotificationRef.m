@implementation IOKMatchingNotificationRef

- (IOKMatchingNotificationRef)init
{
  IOKMatchingNotificationRef *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOKMatchingNotificationRef;
  result = -[IOKMatchingNotificationRef init](&v3, sel_init);
  if (result)
    result->_lock = 0;
  return result;
}

- (void)lock
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_recursive_lock_unlock();
}

- (IOKMatchingNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  self->_notification = (IOKMatchingNotification *)a3;
}

@end
