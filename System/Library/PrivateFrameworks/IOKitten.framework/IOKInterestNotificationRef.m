@implementation IOKInterestNotificationRef

- (void)unlock
{
  os_unfair_recursive_lock_unlock();
}

- (void)lock
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)setNotification:(id)a3
{
  self->_notification = (IOKInterestNotification *)a3;
}

- (IOKInterestNotificationRef)init
{
  IOKInterestNotificationRef *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOKInterestNotificationRef;
  result = -[IOKInterestNotificationRef init](&v3, sel_init);
  if (result)
    result->_lock = 0;
  return result;
}

- (IOKInterestNotification)notification
{
  return self->_notification;
}

@end
