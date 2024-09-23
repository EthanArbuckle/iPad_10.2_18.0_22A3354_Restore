@implementation VSAccountChannelsSaveOperation

- (VSAccountChannelsSaveOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSAccountChannelsSaveOperation)initWithUnsavedAccountChannels:(id)a3 accountChannelsCenter:(id)a4
{
  id v7;
  id v8;
  VSAccountChannelsSaveOperation *v9;
  VSAccountChannelsSaveOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The accountChannels parameter must not be nil."));
  v12.receiver = self;
  v12.super_class = (Class)VSAccountChannelsSaveOperation;
  v9 = -[VSAccountChannelsSaveOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unsavedAccountChannels, a3);
    objc_storeStrong((id *)&v10->_accountChannelsCenter, a4);
  }

  return v10;
}

- (void)executionDidBegin
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[VSAccountChannelsSaveOperation unsavedAccountChannels](self, "unsavedAccountChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[VSAccountChannelsSaveOperation accountChannelsCenter](self, "accountChannelsCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VSAccountChannelsSaveOperation_executionDidBegin__block_invoke;
  v5[3] = &unk_1E939EE08;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_saveAccountChannels:withCompletionHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __51__VSAccountChannelsSaveOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setError:", v5);
    objc_msgSend(v4, "finishExecutionIfPossible");
  }

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (VSAccountChannels)unsavedAccountChannels
{
  return self->_unsavedAccountChannels;
}

- (void)setUnsavedAccountChannels:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedAccountChannels, a3);
}

- (VSAccountChannelsCenter)accountChannelsCenter
{
  return self->_accountChannelsCenter;
}

- (void)setAccountChannelsCenter:(id)a3
{
  objc_storeStrong((id *)&self->_accountChannelsCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChannelsCenter, 0);
  objc_storeStrong((id *)&self->_unsavedAccountChannels, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
