@implementation MTStopwatchStorage

- (MTStopwatchStorage)init
{
  MTStopwatchStorage *v2;
  MTStopwatchStorage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTStopwatchStorage;
  v2 = -[MTStopwatchStorage init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MTStopwatchStorage localSetup](v2, "localSetup");
  return v3;
}

- (void)localSetup
{
  id v3;

  v3 = (id)objc_opt_new();
  -[MTStopwatchStorage setStorageProxy:](self, "setStorageProxy:", v3);

}

- (void)createStopWatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createStopWatch:withCompletion:source:", v10, v9, v8);

}

- (void)updateStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didAddLap:forStopwatch:withCompletion:source:", v13, v12, v11, v10);

}

- (void)getStopwatchesWitchCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getStopwatchesWitchCompletion:", v4);

}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didClearAllLapsForStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didStartLapTimerForStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didPauseLapTimerForStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didLapLapTimerForStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didResetLapTimerForStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didResumeLapTimerForStopwatch:withCompletion:source:", v10, v9, v8);

}

- (void)setSystemReady
{
  id v2;

  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSystemReady");

}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTStopwatchStorage storageProxy](self, "storageProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (_TtC18MobileTimerSupport23MTStopwatchStorageProxy)storageProxy
{
  return self->_storageProxy;
}

- (void)setStorageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_storageProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageProxy, 0);
}

@end
