@implementation NENexusFlowManager

- (void)dealloc
{
  nw_protocol *protocol;
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();
  void *v12;
  id v13;

  if (self)
  {
    protocol = self->_protocol;
    if (protocol)
    {
      free(protocol);
      self->_protocol = 0;
    }
    v4 = objc_getProperty(self, a2, 8, 1);
    if (v4)
    {
      v5 = v4;
      v6 = (void *)nw_context_copy_implicit_context();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __29__NENexusFlowManager_dealloc__block_invoke;
      v12 = &unk_1E3CC41F0;
      v13 = v5;
      v7 = v5;
      nw_queue_context_async_if_needed();

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)NENexusFlowManager;
  -[NENexusFlowManager dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userChannels, 0);
  objc_storeStrong((id *)&self->_kernelChannel, 0);
}

uint64_t __29__NENexusFlowManager_dealloc__block_invoke()
{
  return nw_channel_close();
}

@end
