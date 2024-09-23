@implementation _LSEligibilityListenerNotificationToken

- (_LSEligibilityListenerNotificationToken)initWithEligibilityCache:(void *)a3
{
  _LSEligibilityListenerNotificationToken *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_LSEligibilityListenerNotificationToken;
  result = -[_LSEligibilityListenerNotificationToken init](&v5, sel_init);
  if (result)
    result->_cache = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  LaunchServices::EligibilityCache::removeEligibilityChangedListener((os_unfair_lock_s *)self->_cache, (objc_object *)self);
  v3.receiver = self;
  v3.super_class = (Class)_LSEligibilityListenerNotificationToken;
  -[_LSEligibilityListenerNotificationToken dealloc](&v3, sel_dealloc);
}

@end
