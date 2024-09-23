@implementation CALNNullTravelEngine

+ (CALNNullTravelEngine)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CALNNullTravelEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_18 != -1)
    dispatch_once(&sharedInstance_onceToken_18, block);
  return (CALNNullTravelEngine *)(id)sharedInstance_sharedInstance_15;
}

void __38__CALNNullTravelEngine_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_15;
  sharedInstance_sharedInstance_15 = (uint64_t)v1;

}

- (CALNTravelEngineDelegate)delegate
{
  return (CALNTravelEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
