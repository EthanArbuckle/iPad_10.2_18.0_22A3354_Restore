@implementation _CNBufferedObserver

- (void)resume
{
  -[CNSuspendableSchedulerDecorator resume](self->_observerScheduler, "resume");
}

+ (id)bufferObserver:(id)a3 schedulerProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _CNBufferedObserver *v8;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.reactive.replay-subject.observer"));
  +[CNSuspendableSchedulerDecorator suspendedSchedulerWithScheduler:](CNSuspendableSchedulerDecorator, "suspendedSchedulerWithScheduler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CNBufferedObserver initWithObserver:scheduler:]([_CNBufferedObserver alloc], "initWithObserver:scheduler:", v5, v7);

  return v8;
}

- (_CNBufferedObserver)initWithObserver:(id)a3 scheduler:(id)a4
{
  id v7;
  id v8;
  _CNBufferedObserver *v9;
  _CNBufferedObserver *v10;
  _CNBufferedObserver *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNBufferedObserver;
  v9 = -[_CNBufferedObserver init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    objc_storeStrong((id *)&v10->_observerScheduler, a4);
    v11 = v10;
  }

  return v10;
}

- (void)observerDidComplete
{
  CNSuspendableSchedulerDecorator *observerScheduler;
  _QWORD v3[5];

  observerScheduler = self->_observerScheduler;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42___CNBufferedObserver_observerDidComplete__block_invoke;
  v3[3] = &unk_1E29B9358;
  v3[4] = self;
  -[CNSuspendableSchedulerDecorator performBlock:](observerScheduler, "performBlock:", v3);
}

- (void)observerDidReceiveResult:(id)a3
{
  id v4;
  CNSuspendableSchedulerDecorator *observerScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerScheduler = self->_observerScheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___CNBufferedObserver_observerDidReceiveResult___block_invoke;
  v7[3] = &unk_1E29B8C10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CNSuspendableSchedulerDecorator performBlock:](observerScheduler, "performBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_observerScheduler, 0);
}

- (void)observerDidFailWithError:(id)a3
{
  id v4;
  CNSuspendableSchedulerDecorator *observerScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerScheduler = self->_observerScheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___CNBufferedObserver_observerDidFailWithError___block_invoke;
  v7[3] = &unk_1E29B8C10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CNSuspendableSchedulerDecorator performBlock:](observerScheduler, "performBlock:", v7);

}

@end
