@implementation CellularCallStatisticsController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v5;

  v5 = (id)objc_opt_new(DSCallStatisticsAggregator, a2, a3, a4);
  -[CellularCallStatisticsController setAggregator:](self, "setAggregator:", v5);

}

- (void)start
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003B48;
  block[3] = &unk_100004068;
  block[4] = self;
  dispatch_async(v4, block);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallStatisticsController aggregator](self, "aggregator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSynchronousResult"));

  if ((-[CellularCallStatisticsController isCancelled](self, "isCancelled") & 1) == 0 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallStatisticsController result](self, "result"));
    objc_msgSend(v7, "setStatusCode:", &off_100004098);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallStatisticsController result](self, "result"));
    objc_msgSend(v8, "setData:", v6);

  }
  -[CellularCallStatisticsController setFinished:](self, "setFinished:", 1);

}

- (void)cancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CellularCallStatisticsController aggregator](self, "aggregator"));
  objc_msgSend(v2, "cancel");

}

- (void)teardown
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCallStatisticsController aggregator](self, "aggregator"));
  objc_msgSend(v3, "cancel");

  -[CellularCallStatisticsController setAggregator:](self, "setAggregator:", 0);
}

- (DSCallStatisticsAggregator)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_aggregator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end
