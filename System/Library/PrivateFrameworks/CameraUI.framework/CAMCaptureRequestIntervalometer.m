@implementation CAMCaptureRequestIntervalometer

- (CAMCaptureRequestIntervalometer)init
{
  return -[CAMCaptureRequestIntervalometer initWithDelegate:interval:delay:maximumCount:](self, "initWithDelegate:interval:delay:maximumCount:", 0, 0, 0.0, 0.0);
}

- (CAMCaptureRequestIntervalometer)initWithDelegate:(id)a3 interval:(double)a4 delay:(double)a5 maximumCount:(int64_t)a6
{
  id v10;
  CAMCaptureRequestIntervalometer *v11;
  CAMCaptureRequestIntervalometer *v12;
  CAMPreciseTimer *v13;
  uint64_t v14;
  CAMPreciseTimer *timer;
  CAMCaptureRequestIntervalometer *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CAMCaptureRequestIntervalometer;
  v11 = -[CAMCaptureRequestIntervalometer init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    if (!a6)
      a6 = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeWeak((id *)&v11->_delegate, v10);
    v12->_interval = a4;
    v12->_delay = a5;
    v12->_maximumCount = a6;
    v12->_remaining = a6;
    objc_initWeak(&location, v12);
    v13 = [CAMPreciseTimer alloc];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__CAMCaptureRequestIntervalometer_initWithDelegate_interval_delay_maximumCount___block_invoke;
    v18[3] = &unk_1EA32A920;
    objc_copyWeak(&v19, &location);
    v14 = -[CAMPreciseTimer initWithDelay:interval:handler:](v13, "initWithDelay:interval:handler:", v18, a5, a4);
    timer = v12->__timer;
    v12->__timer = (CAMPreciseTimer *)v14;

    v16 = v12;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __80__CAMCaptureRequestIntervalometer_initWithDelegate_interval_delay_maximumCount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_generateRequestForDelegate");

}

- (void)_generateRequestForDelegate
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  -[CAMCaptureRequestIntervalometer prototypeRequest](self, "prototypeRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "distinctPersistenceCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCaptureRequestIntervalometer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "intervalometer:didGenerateCaptureRequest:", self, v3))
    {
      v6 = -[CAMCaptureRequestIntervalometer remaining](self, "remaining") - 1;
      -[CAMCaptureRequestIntervalometer setRemaining:](self, "setRemaining:", v6);
      if (!v6)
      {
        -[CAMCaptureRequestIntervalometer stopGeneratingRequests](self, "stopGeneratingRequests");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "intervalometer:didReachMaximumCountWithRequest:", self, v3);
      }
    }
  }
  else
  {
    -[CAMCaptureRequestIntervalometer stopGeneratingRequests](self, "stopGeneratingRequests");
  }

}

- (void)startGeneratingRequests
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Can't start generating requests from the intervalometer without a prototype request!", v1, 2u);
}

- (void)stopGeneratingRequests
{
  id v2;

  -[CAMCaptureRequestIntervalometer _timer](self, "_timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (CAMCaptureRequest)prototypeRequest
{
  return self->_prototypeRequest;
}

- (void)setPrototypeRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CAMCaptureRequestIntervalometerDelegate)delegate
{
  return (CAMCaptureRequestIntervalometerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)interval
{
  return self->_interval;
}

- (double)delay
{
  return self->_delay;
}

- (int64_t)maximumCount
{
  return self->_maximumCount;
}

- (int64_t)remaining
{
  return self->_remaining;
}

- (void)setRemaining:(int64_t)a3
{
  self->_remaining = a3;
}

- (CAMPreciseTimer)_timer
{
  return self->__timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prototypeRequest, 0);
}

@end
