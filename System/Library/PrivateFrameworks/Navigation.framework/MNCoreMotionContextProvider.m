@implementation MNCoreMotionContextProvider

- (MNCoreMotionContextProvider)initWithTraceRecorder:(id)a3
{
  id v5;
  MNCoreMotionContextProvider *v6;
  MNCoreMotionContextProvider *v7;
  MNCoreMotionContextProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNCoreMotionContextProvider;
  v6 = -[MNCoreMotionContextProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_traceRecorder, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MNCoreMotionContextProvider stopMotionUpdates](self, "stopMotionUpdates");
  v3.receiver = self;
  v3.super_class = (Class)MNCoreMotionContextProvider;
  -[MNCoreMotionContextProvider dealloc](&v3, sel_dealloc);
}

- (void)startMotionUpdates
{
  CMActivityManager *v3;
  CMActivityManager *activityManager;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_activityManager)
  {
    v3 = (CMActivityManager *)objc_alloc_init(MEMORY[0x1E0CA55D8]);
    activityManager = self->_activityManager;
    self->_activityManager = v3;

  }
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__MNCoreMotionContextProvider_startMotionUpdates__block_invoke;
  v5[3] = &unk_1E61D7730;
  objc_copyWeak(&v6, &location);
  -[CMActivityManager setActivityHandler:](self->_activityManager, "setActivityHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __49__MNCoreMotionContextProvider_startMotionUpdates__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(v11, "isMoving");
  if (objc_msgSend(v11, "isWalking"))
    v5 |= 2uLL;
  if (objc_msgSend(v11, "isRunning"))
    v5 |= 4uLL;
  if (objc_msgSend(v11, "isDriving"))
    v5 |= 0x10uLL;
  if ((objc_msgSend(v11, "hasExitedVehicle") & 1) != 0)
    v6 = 2;
  else
    v6 = objc_msgSend(v11, "maybeExitingVehicle");
  v7 = objc_msgSend(v11, "confidence");
  if (WeakRetained)
    objc_msgSend(WeakRetained[3], "recordMotionUpdate:exitType:confidence:", v5, v6, v7);
  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "motionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v9, "motionContextProvider:didUpdateMotion:exitType:confidence:", v10, v5, v6, v7);

}

- (void)stopMotionUpdates
{
  CMActivityManager *activityManager;

  -[CMActivityManager setActivityHandler:](self->_activityManager, "setActivityHandler:", 0);
  activityManager = self->_activityManager;
  self->_activityManager = 0;

}

- (GEOMotionContextProviderDelegate)motionDelegate
{
  return (GEOMotionContextProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setMotionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceRecorder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
