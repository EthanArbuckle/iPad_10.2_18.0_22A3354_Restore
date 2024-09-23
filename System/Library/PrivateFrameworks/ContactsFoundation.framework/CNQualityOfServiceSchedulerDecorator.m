@implementation CNQualityOfServiceSchedulerDecorator

- (CNQualityOfServiceSchedulerDecorator)initWithScheduler:(id)a3 qualityOfService:(unint64_t)a4
{
  id v7;
  CNQualityOfServiceSchedulerDecorator *v8;
  CNQualityOfServiceSchedulerDecorator *v9;
  CNQualityOfServiceSchedulerDecorator *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNQualityOfServiceSchedulerDecorator;
  v8 = -[CNQualityOfServiceSchedulerDecorator init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scheduler, a3);
    v9->_qualityOfService = a4;
    v10 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CNQualityOfServiceSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "afterDelay:performBlock:qualityOfService:", v6, -[CNQualityOfServiceSchedulerDecorator qualityOfService](self, "qualityOfService"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNQualityOfServiceSchedulerDecorator scheduler](self, "scheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:qualityOfService:", v4, -[CNQualityOfServiceSchedulerDecorator qualityOfService](self, "qualityOfService"));

}

- (CNScheduler)scheduler
{
  return self->_scheduler;
}

- (unint64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CNQualityOfServiceSchedulerDecorator scheduler](self, "scheduler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performBlock:qualityOfService:", v6, a4);

}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNQualityOfServiceSchedulerDecorator scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performCancelableBlock:qualityOfService:", v4, -[CNQualityOfServiceSchedulerDecorator qualityOfService](self, "qualityOfService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CNQualityOfServiceSchedulerDecorator scheduler](self, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performCancelableBlock:qualityOfService:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[CNQualityOfServiceSchedulerDecorator scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "afterDelay:performBlock:qualityOfService:", v8, a5, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[CNQualityOfServiceSchedulerDecorator scheduler](self, "scheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

@end
