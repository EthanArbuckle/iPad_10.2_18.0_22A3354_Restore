@implementation CSHomeButtonSuppressAfterUnlockRecognizer

- (CSHomeButtonSuppressAfterUnlockRecognizer)init
{
  CSHomeButtonSuppressAfterUnlockRecognizer *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSHomeButtonSuppressAfterUnlockRecognizer;
  v2 = -[CSHomeButtonSuppressAfterUnlockRecognizer init](&v6, sel_init);
  if (v2)
  {
    SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_INFO, "created. starting timer.", v5, 2u);
    }

    -[CSHomeButtonSuppressAfterUnlockRecognizer _startTimer](v2, "_startTimer");
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_INFO, "deallocating", buf, 2u);
  }

  -[CSHomeButtonSuppressAfterUnlockRecognizer _invalidateTimer](self, "_invalidateTimer");
  v4.receiver = self;
  v4.super_class = (Class)CSHomeButtonSuppressAfterUnlockRecognizer;
  -[CSHomeButtonSuppressAfterUnlockRecognizer dealloc](&v4, sel_dealloc);
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (!a3)
  {
    v8 = v3;
    v9 = v4;
    SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0337000, v6, OS_LOG_TYPE_INFO, "finger off", v7, 2u);
    }

    -[CSHomeButtonSuppressAfterUnlockRecognizer _requestEndOfSuppression](self, "_requestEndOfSuppression");
  }
}

- (void)_requestEndOfSuppression
{
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  if (!self->_done)
  {
    SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_INFO, "calling delegate to request end of suppression", v5, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "homeButtonSuppressAfterUnlockRecognizerRequestsEndOfSuppression:", self);

    self->_done = 1;
  }
}

- (void)_startTimer
{
  BSAbsoluteMachTimer *v3;
  BSAbsoluteMachTimer *timer;
  BSAbsoluteMachTimer *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("CSHomeButtonSuppressAfterUnlockRecognizer.timer"));
  timer = self->_timer;
  self->_timer = v3;

  v5 = self->_timer;
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CSHomeButtonSuppressAfterUnlockRecognizer__startTimer__block_invoke;
  v8[3] = &unk_1E8E2DD30;
  objc_copyWeak(&v9, &location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v5, "scheduleWithFireInterval:leewayInterval:queue:handler:", v6, v8, 0.3, 0.0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__CSHomeButtonSuppressAfterUnlockRecognizer__startTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

- (void)_invalidateTimer
{
  NSObject *v3;
  BSAbsoluteMachTimer *timer;
  uint8_t v5[16];

  SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_INFO, "invalidating timer", v5, 2u);
  }

  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_timerFired
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenMesaHomeButtonSuppressAfterUnlockRecognizer();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_INFO, "timer fired", v4, 2u);
  }

  -[CSHomeButtonSuppressAfterUnlockRecognizer _invalidateTimer](self, "_invalidateTimer");
  -[CSHomeButtonSuppressAfterUnlockRecognizer _requestEndOfSuppression](self, "_requestEndOfSuppression");
}

- (SBHomeButtonSuppressAfterUnlockRecognizerDelegate)delegate
{
  return (SBHomeButtonSuppressAfterUnlockRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
