@implementation _CNScheduledObservable

- (id)subscribe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[_CNScheduledObservable observable](self, "observable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNScheduledObservable scheduler](self, "scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36___CNScheduledObservable_subscribe___block_invoke;
  v11[3] = &unk_1E29B9AC0;
  v12 = v5;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performCancelableBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (CNObservable)observable
{
  return self->_observable;
}

- (_CNScheduledObservable)initWithObservable:(id)a3 scheduler:(id)a4
{
  id v7;
  id v8;
  _CNScheduledObservable *v9;
  _CNScheduledObservable *v10;
  _CNScheduledObservable *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNScheduledObservable;
  v9 = -[_CNScheduledObservable init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observable, a3);
    objc_storeStrong((id *)&v10->_scheduler, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

- (void)setObservable:(id)a3
{
  objc_storeStrong((id *)&self->_observable, a3);
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

@end
