@implementation _CNTemporalBufferingStrategy

- (_CNTemporalBufferingStrategy)initWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v7;
  _CNTemporalBufferingStrategy *v8;
  _CNTemporalBufferingStrategy *v9;
  _CNTemporalBufferingStrategy *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNTemporalBufferingStrategy;
  v8 = -[_CNTemporalBufferingStrategy init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_interval = a3;
    objc_storeStrong((id *)&v8->_scheduler, a4);
    v10 = v9;
  }

  return v9;
}

- (void)buffer:(id)a3 didReceiveResults:(id)a4 forObserver:(id)a5
{
  id v7;
  id v8;
  void *v9;
  CNScheduler *scheduler;
  double interval;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = a5;
  -[_CNTemporalBufferingStrategy sendToken](self, "sendToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    scheduler = self->_scheduler;
    interval = self->_interval;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __69___CNTemporalBufferingStrategy_buffer_didReceiveResults_forObserver___block_invoke;
    v16 = &unk_1E29B8C10;
    v17 = v7;
    v18 = v8;
    -[CNScheduler afterDelay:performBlock:](scheduler, "afterDelay:performBlock:", &v13, interval);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNTemporalBufferingStrategy setSendToken:](self, "setSendToken:", v12, v13, v14, v15, v16);

  }
}

- (void)bufferDidSendResults:(id)a3
{
  void *v4;

  -[_CNTemporalBufferingStrategy sendToken](self, "sendToken", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[_CNTemporalBufferingStrategy setSendToken:](self, "setSendToken:", 0);
}

- (CNCancelable)sendToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSendToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendToken, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
