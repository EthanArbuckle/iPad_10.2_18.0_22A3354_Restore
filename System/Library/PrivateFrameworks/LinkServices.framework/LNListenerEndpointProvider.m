@implementation LNListenerEndpointProvider

- (LNListenerEndpointProviderDelegate)delegate
{
  return (LNListenerEndpointProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_4629);
  return (id)sharedProvider_provider;
}

void __44__LNListenerEndpointProvider_sharedProvider__block_invoke()
{
  LNListenerEndpointProvider *v0;
  void *v1;

  v0 = objc_alloc_init(LNListenerEndpointProvider);
  v1 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;

}

@end
