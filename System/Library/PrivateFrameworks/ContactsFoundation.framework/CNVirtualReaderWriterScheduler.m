@implementation CNVirtualReaderWriterScheduler

- (CNVirtualReaderWriterScheduler)init
{
  void *v3;
  CNVirtualReaderWriterScheduler *v4;

  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNVirtualReaderWriterScheduler initWithScheduler:](self, "initWithScheduler:", v3);

  return v4;
}

- (CNVirtualReaderWriterScheduler)initWithScheduler:(id)a3
{
  id v4;
  CNVirtualReaderWriterScheduler *v5;
  uint64_t v6;
  CNSuspendableSchedulerDecorator *scheduler;
  CNVirtualReaderWriterScheduler *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVirtualReaderWriterScheduler;
  v5 = -[CNVirtualReaderWriterScheduler init](&v10, sel_init);
  if (v5)
  {
    +[CNSuspendableSchedulerDecorator resumedSchedulerWithScheduler:](CNSuspendableSchedulerDecorator, "resumedSchedulerWithScheduler:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    scheduler = v5->_scheduler;
    v5->_scheduler = (CNSuspendableSchedulerDecorator *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)performReaderBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNVirtualReaderWriterScheduler scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performCancelableBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)performWriterBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNVirtualReaderWriterScheduler scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performCancelableBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performSynchronousReaderBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNVirtualReaderWriterScheduler scheduler](self, "scheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v4);

}

- (void)performSynchronousWriterBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNVirtualReaderWriterScheduler scheduler](self, "scheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v4);

}

- (void)suspend
{
  id v2;

  -[CNVirtualReaderWriterScheduler scheduler](self, "scheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (void)resume
{
  id v2;

  -[CNVirtualReaderWriterScheduler scheduler](self, "scheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (CNSuspendableSchedulerDecorator)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
