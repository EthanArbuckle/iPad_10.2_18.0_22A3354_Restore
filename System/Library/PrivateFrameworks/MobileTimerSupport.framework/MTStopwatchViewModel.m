@implementation MTStopwatchViewModel

- (MTStopwatchViewModel)initWithStopwatch:(id)a3 manager:(id)a4 delegate:(id)a5 dateProvider:(id)a6 registerForNotifications:(BOOL)a7 broadcastUpdates:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  MTStopwatchViewModel *v18;
  _TtC18MobileTimerSupport18StopwatchViewModel *v19;
  objc_super v21;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MTStopwatchViewModel;
  v18 = -[MTStopwatchViewModel init](&v21, sel_init);
  if (v18)
  {
    v19 = -[StopwatchViewModel initWithStopwatch:manager:delegate:dateProvider:registerForNotifications:broadcastUpdates:]([_TtC18MobileTimerSupport18StopwatchViewModel alloc], "initWithStopwatch:manager:delegate:dateProvider:registerForNotifications:broadcastUpdates:", v14, v15, v16, v17, v9, v8);
    -[MTStopwatchViewModel setViewModel:](v18, "setViewModel:", v19);

  }
  return v18;
}

- (void)updateStopwatch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateStopwatch:", v4);

}

- (void)updateWithDisplayLink
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithDisplayLink");

}

- (void)invalidateDisplayLink
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateDisplayLink");

}

- (void)addLap:(double)a3
{
  id v4;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addLap:", a3);

}

- (void)clearAllLaps
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAllLaps");

}

- (void)lapLapTimer
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lapLapTimer");

}

- (void)pauseLapTimer
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseLapTimer");

}

- (void)resetLapTimer
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetLapTimer");

}

- (void)resumeLapTimer
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeLapTimer");

}

- (void)startLapTimer
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startLapTimer");

}

- (MTStopwatch)getStopwatch
{
  void *v2;
  void *v3;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getStopwatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTStopwatch *)v3;
}

- (void)updateTime
{
  id v2;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTime");

}

- (double)runningTotalForLap:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runningTotalForLap:", a3);
  v6 = v5;

  return v6;
}

- (id)sourceIdentifier
{
  void *v2;
  void *v3;

  -[MTStopwatchViewModel viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_TtC18MobileTimerSupport18StopwatchViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
