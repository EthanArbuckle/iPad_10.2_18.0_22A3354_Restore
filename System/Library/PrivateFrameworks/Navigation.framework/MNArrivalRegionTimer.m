@implementation MNArrivalRegionTimer

- (MNArrivalRegionTimer)init
{
  MNArrivalRegionTimer *result;

  result = (MNArrivalRegionTimer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MNArrivalRegionTimer)initWithArrivalRegion:(id)a3
{
  id v5;
  MNArrivalRegionTimer *v6;
  MNArrivalRegionTimer *v7;
  objc_super v9;

  v5 = a3;
  if (objc_msgSend(v5, "arrivalRegionAction") == 4
    && objc_msgSend(v5, "endNavigationTimeoutThreshold")
    && (v9.receiver = self,
        v9.super_class = (Class)MNArrivalRegionTimer,
        v6 = -[MNArrivalRegionTimer init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_arrivalRegion, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MNArrivalRegionTimer;
  -[MNArrivalRegionTimer dealloc](&v3, sel_dealloc);
}

- (void)updateForLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  NSObject *v14;
  NSTimer **p_timer;
  NSTimer *timer;
  NSTimer *v17;
  char v18;
  NSObject *v19;
  int v20;
  unsigned int v21;
  void *v22;
  NSTimer *v23;
  NSTimer *v24;
  _QWORD v25[4];
  id v26;
  id buf;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;
  v9 = self->_timer == 0;
  -[GEOArrivalRegion arrivalRegion](self->_arrivalRegion, "arrivalRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(v4, "horizontalAccuracy");
    v13 = objc_msgSend(v11, "containsCoordinate:radius:", v6, v8, v12);

    if ((v13 & 1) != 0)
      goto LABEL_11;
    goto LABEL_3;
  }
  v18 = objc_msgSend(v10, "containsCoordinate:", v6, v8);

  if ((v18 & 1) == 0)
    goto LABEL_11;
  if (!-[GEOArrivalRegion endNavigationTimeoutThreshold](self->_arrivalRegion, "endNavigationTimeoutThreshold"))
  {
LABEL_3:
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_INFO, "Leaving arrival region that location was previously inside", (uint8_t *)&buf, 2u);
    }

    timer = self->_timer;
    p_timer = &self->_timer;
    -[NSTimer invalidate](timer, "invalidate");
    v17 = *p_timer;
    *p_timer = 0;

    goto LABEL_11;
  }
  GEOFindOrCreateLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = -[GEOArrivalRegion endNavigationTimeoutThreshold](self->_arrivalRegion, "endNavigationTimeoutThreshold");
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v20;
    _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_INFO, "Arrival timeout region entered. Setting timer for %u seconds", (uint8_t *)&buf, 8u);
  }

  v21 = -[GEOArrivalRegion endNavigationTimeoutThreshold](self->_arrivalRegion, "endNavigationTimeoutThreshold");
  objc_initWeak(&buf, self);
  v22 = (void *)MEMORY[0x1E0C99E88];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __42__MNArrivalRegionTimer_updateForLocation___block_invoke;
  v25[3] = &unk_1E61D2330;
  objc_copyWeak(&v26, &buf);
  objc_msgSend(v22, "scheduledTimerWithTimeInterval:repeats:block:", 0, v25, (double)v21);
  v23 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v24 = self->_timer;
  self->_timer = v23;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&buf);
LABEL_11:

}

void __42__MNArrivalRegionTimer_updateForLocation___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 3);
    objc_msgSend(v2, "arrivalRegionTimerDidFire:", v4);

    v3 = v4[2];
    v4[2] = 0;

    WeakRetained = v4;
  }

}

- (MNArrivalRegionTimerDelegate)delegate
{
  return (MNArrivalRegionTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_arrivalRegion, 0);
}

@end
