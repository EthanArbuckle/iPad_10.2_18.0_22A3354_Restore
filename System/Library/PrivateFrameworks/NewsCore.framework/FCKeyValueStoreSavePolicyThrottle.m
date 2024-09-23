@implementation FCKeyValueStoreSavePolicyThrottle

- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4
{
  int64_t v5;
  id v6;
  dispatch_time_t v7;
  NSObject *queue;

  v5 = (uint64_t)(self->_delay * 1000000000.0);
  v6 = a4;
  queue = a3;
  v7 = dispatch_time(0, v5);
  dispatch_after(v7, queue, v6);

}

- (FCKeyValueStoreSavePolicyThrottle)initWithDelay:(double)a3
{
  FCKeyValueStoreSavePolicyThrottle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FCKeyValueStoreSavePolicyThrottle;
  result = -[FCKeyValueStoreSavePolicyThrottle init](&v5, sel_init);
  if (result)
    result->_delay = a3;
  return result;
}

@end
