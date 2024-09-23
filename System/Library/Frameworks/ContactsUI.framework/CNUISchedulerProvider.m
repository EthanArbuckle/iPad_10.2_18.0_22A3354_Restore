@implementation CNUISchedulerProvider

- (CNScheduler)immediateScheduler
{
  void *v2;
  void *v3;

  -[CNUISchedulerProvider schedulerProvider](self, "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "immediateScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNScheduler *)v3;
}

- (CNSuspendableSchedulerDecorator)suspendableBackgroundScheduler
{
  return self->_suspendableBackgroundScheduler;
}

- (CNScheduler)mainThreadScheduler
{
  void *v2;
  void *v3;

  -[CNUISchedulerProvider schedulerProvider](self, "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNScheduler *)v3;
}

- (id)newSynchronousSerialSchedulerWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUISchedulerProvider schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newSynchronousSerialSchedulerWithName:", v4);

  return v6;
}

- (id)newSerialSchedulerWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUISchedulerProvider schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newSerialSchedulerWithName:", v4);

  return v6;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNScheduler)inlineScheduler
{
  void *v2;
  void *v3;

  -[CNUISchedulerProvider schedulerProvider](self, "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNScheduler *)v3;
}

- (void)resumeBackgroundScheduler
{
  id v2;

  -[CNUISchedulerProvider suspendableBackgroundScheduler](self, "suspendableBackgroundScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (CNUISchedulerProvider)init
{
  void *v3;
  CNUISchedulerProvider *v4;

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUISchedulerProvider initWithSchedulerProvider:](self, "initWithSchedulerProvider:", v3);

  return v4;
}

- (CNUISchedulerProvider)initWithSchedulerProvider:(id)a3
{
  id v5;
  CNUISchedulerProvider *v6;
  uint64_t v7;
  CNSuspendableSchedulerDecorator *suspendableBackgroundScheduler;
  CNUIAfterCACommitScheduler *v9;
  CNScheduler *afterCACommitScheduler;
  CNUISchedulerProvider *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNUISchedulerProvider;
  v6 = -[CNUISchedulerProvider init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "makeBackgroundScheduler");
    v7 = objc_claimAutoreleasedReturnValue();
    suspendableBackgroundScheduler = v6->_suspendableBackgroundScheduler;
    v6->_suspendableBackgroundScheduler = (CNSuspendableSchedulerDecorator *)v7;

    objc_storeStrong((id *)&v6->_schedulerProvider, a3);
    v9 = -[CNUIAfterCACommitScheduler initWithSchedulerProvider:]([CNUIAfterCACommitScheduler alloc], "initWithSchedulerProvider:", v6->_schedulerProvider);
    afterCACommitScheduler = v6->_afterCACommitScheduler;
    v6->_afterCACommitScheduler = (CNScheduler *)v9;

    v11 = v6;
  }

  return v6;
}

+ (id)makeBackgroundScheduler
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13B68], "operationQueueSchedulerWithMaxConcurrentOperationCount:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13BA0]), "initWithScheduler:", v2);

  return v3;
}

- (id)backgroundSchedulerWithQualityOfService:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CNUISchedulerProvider schedulerProvider](self, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundSchedulerWithQualityOfService:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)suspendBackgroundScheduler
{
  id v2;

  -[CNUISchedulerProvider suspendableBackgroundScheduler](self, "suspendableBackgroundScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (CNScheduler)afterCACommitScheduler
{
  return self->_afterCACommitScheduler;
}

- (id)newReaderWriterSchedulerWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNUISchedulerProvider schedulerProvider](self, "schedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newReaderWriterSchedulerWithName:", v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterCACommitScheduler, 0);
  objc_storeStrong((id *)&self->_suspendableBackgroundScheduler, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

@end
