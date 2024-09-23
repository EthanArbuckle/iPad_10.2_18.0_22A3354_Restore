@implementation CRKDeadmanScreenshotServiceProxy

- (void)dealloc
{
  objc_super v3;

  -[CRKDeadmanScreenshotServiceProxy stopTimer](self, "stopTimer");
  v3.receiver = self;
  v3.super_class = (Class)CRKDeadmanScreenshotServiceProxy;
  -[CRKDeadmanScreenshotServiceProxy dealloc](&v3, sel_dealloc);
}

- (CRKDeadmanScreenshotServiceProxy)initWithTimeout:(double)a3
{
  CRKDeadmanScreenshotServiceProxy *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKDeadmanScreenshotServiceProxy;
  result = -[CRKDeadmanScreenshotServiceProxy init](&v5, sel_init);
  if (result)
    result->_timeout = a3;
  return result;
}

- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[CRKDeadmanScreenshotServiceProxy setCountOfInFlightRequests:](self, "setCountOfInFlightRequests:", -[CRKDeadmanScreenshotServiceProxy countOfInFlightRequests](self, "countOfInFlightRequests") + 1);
  -[CRKDeadmanScreenshotServiceProxy stopTimer](self, "stopTimer");
  -[CRKDeadmanScreenshotServiceProxy underlyingProxy](self, "underlyingProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__CRKDeadmanScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke;
  v10[3] = &unk_24D9CA198;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "fetchScreenshotDataWithMaximumSizeInPixels:completion:", v10, width, height);

}

uint64_t __90__CRKDeadmanScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setCountOfInFlightRequests:", objc_msgSend(*(id *)(a1 + 32), "countOfInFlightRequests") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "countOfInFlightRequests");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "startTimer");
  return result;
}

- (void)startTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  -[CRKDeadmanScreenshotServiceProxy timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _CRKLogGeneral_14();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Starting ScreenshotService deadman timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v5 = (void *)MEMORY[0x24BDBCF40];
    -[CRKDeadmanScreenshotServiceProxy timeout](self, "timeout");
    v7 = v6;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__CRKDeadmanScreenshotServiceProxy_startTimer__block_invoke;
    v9[3] = &unk_24D9CA1C0;
    objc_copyWeak(&v10, buf);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKDeadmanScreenshotServiceProxy setTimer:](self, "setTimer:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __46__CRKDeadmanScreenshotServiceProxy_startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _CRKLogGeneral_14();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_218C99000, v2, OS_LOG_TYPE_INFO, "ScreenshotService deadman timer fired. Tearing down connection", v3, 2u);
    }

    objc_msgSend(WeakRetained, "setUnderlyingProxy:", 0);
    objc_msgSend(WeakRetained, "setTimer:", 0);
  }

}

- (void)stopTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[CRKDeadmanScreenshotServiceProxy timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _CRKLogGeneral_14();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Invalidating ScreenshotService deadman timer", v6, 2u);
    }

    -[CRKDeadmanScreenshotServiceProxy timer](self, "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[CRKDeadmanScreenshotServiceProxy setTimer:](self, "setTimer:", 0);
  }
}

- (CRKScreenshotServiceInterface)underlyingProxy
{
  CRKScreenshotServiceInterface *underlyingProxy;
  CRKScreenshotServiceInterface *v4;
  CRKScreenshotServiceInterface *v5;

  underlyingProxy = self->_underlyingProxy;
  if (!underlyingProxy)
  {
    v4 = (CRKScreenshotServiceInterface *)objc_opt_new();
    v5 = self->_underlyingProxy;
    self->_underlyingProxy = v4;

    underlyingProxy = self->_underlyingProxy;
  }
  return underlyingProxy;
}

- (void)setUnderlyingProxy:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingProxy, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (unint64_t)countOfInFlightRequests
{
  return self->_countOfInFlightRequests;
}

- (void)setCountOfInFlightRequests:(unint64_t)a3
{
  self->_countOfInFlightRequests = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_underlyingProxy, 0);
}

@end
