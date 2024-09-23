@implementation _GEOCountryConfigurationUpdateHandler

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_callback, 0);
}

- (id)callback
{
  return self->_callback;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

@end
