@implementation DSMotionProvider

- (DSMotionProvider)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  DSMotionProvider *v7;
  DSMotionProvider *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DSMotionProvider;
  v7 = -[DSProvider initWithDispatchQueue:](&v10, sel_initWithDispatchQueue_, a4);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_delegate, v6);

  return v8;
}

- (void)startMotionDataProviderWithOptions:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSMotionProvider;
  -[DSProvider startMotionDataProviderWithOptions:](&v3, sel_startMotionDataProviderWithOptions_, a3);
}

- (void)sendMotionData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSMotionProvider;
  -[DSProvider sendMotionData:](&v3, sel_sendMotionData_, a3);
}

- (void)stopMotionDataProvider
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DSMotionProvider;
  -[DSProvider stopMotionDataProvider](&v2, sel_stopMotionDataProvider);
}

- (void)startedProviderWithOptions:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[DSMotionProvider delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DSMotionProvider delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dsmotionDidStartProvider:", self);

  }
}

- (void)failedToStartProviderWithOptions:(id)a3 error:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[DSMotionProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[DSMotionProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsmotion:didFailToStartProviderWithError:", self, v8);

  }
}

- (void)subscribedToMotionDataWithOptions:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DSMotionProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DSMotionProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dsmotion:didSubscribeToMotionDataWithOptions:", self, v7);

  }
}

- (void)requestedMotionDataWithOption:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DSMotionProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DSMotionProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dsmotion:didRequestMotionDataWithOptions:", self, v7);

  }
}

- (void)subscriptionExpired
{
  void *v3;
  char v4;
  id v5;

  -[DSMotionProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DSMotionProvider delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dsmotionDidExpireMotionDataSubscription:", self);

  }
}

- (void)unsubscribed
{
  void *v3;
  char v4;
  id v5;

  -[DSMotionProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DSMotionProvider delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dsmotionDidUnsubscribeToMotionData:", self);

  }
}

- (void)stoppedProvider
{
  void *v3;
  char v4;
  id v5;

  -[DSMotionProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DSMotionProvider delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dsmotionDidStopProvider:", self);

  }
}

- (DSMotionProviderDelegate)delegate
{
  return (DSMotionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
