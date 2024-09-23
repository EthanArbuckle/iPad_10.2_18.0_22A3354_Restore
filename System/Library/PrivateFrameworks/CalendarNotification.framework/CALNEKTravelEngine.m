@implementation CALNEKTravelEngine

- (void)receivedNotificationNamed:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (-[CALNEKTravelEngine isActive](self, "isActive"))
  {
    -[CALNEKTravelEngine travelEngine](self, "travelEngine");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleDarwinNotification:](v5, "handleDarwinNotification:", v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CALNEKTravelEngine receivedNotificationNamed:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (BOOL)isActive
{
  return self->_active;
}

- (EKTravelEngine)travelEngine
{
  return self->_travelEngine;
}

- (CALNEKTravelEngine)initWithTravelEngine:(id)a3
{
  id v5;
  CALNEKTravelEngine *v6;
  CALNEKTravelEngine *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNEKTravelEngine;
  v6 = -[CALNEKTravelEngine init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_travelEngine, a3);

  return v7;
}

- (void)activate
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id from;
  id location[2];

  if ((objc_msgSend(MEMORY[0x24BDC74F0], "isTravelAdvisorySupported") & 1) != 0)
  {
    -[CALNEKTravelEngine travelEngine](self, "travelEngine");
    v3 = objc_claimAutoreleasedReturnValue();
    -[CALNEKTravelEngine _adviceReceivedBlock](self, "_adviceReceivedBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAdviceBlock:](v3, "setAdviceBlock:", v4);

    -[CALNEKTravelEngine _eventSignficantlyChangedBlock](self, "_eventSignficantlyChangedBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setEventSignificantlyChangedBlock:](v3, "setEventSignificantlyChangedBlock:", v5);

    objc_initWeak(location, self);
    objc_initWeak(&from, v3);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __30__CALNEKTravelEngine_activate__block_invoke;
    v6[3] = &unk_24D485380;
    objc_copyWeak(&v7, location);
    objc_copyWeak(&v8, &from);
    -[NSObject setAuthorizationChangedBlock:](v3, "setAuthorizationChangedBlock:", v6);
    -[CALNEKTravelEngine setActive:](self, "setActive:", 1);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Travel advisories are not supported. Will not start travel engine.", (uint8_t *)location, 2u);
    }
  }

}

void __30__CALNEKTravelEngine_activate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(v2, "authorized");
  objc_msgSend(WeakRetained, "_authorizationChangedBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)deactivate
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x24BDC74F0], "isTravelAdvisorySupported") & 1) != 0)
  {
    -[CALNEKTravelEngine setActive:](self, "setActive:", 0);
    -[CALNEKTravelEngine travelEngine](self, "travelEngine");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Travel advisories are not supported. Will not stop travel engine.", buf, 2u);
    }

  }
}

- (void)didRegisterForAlarms
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_2();
  _os_log_fault_impl(&dword_215D9B000, v0, OS_LOG_TYPE_FAULT, "Travel engine wrapper received did register for did register for alarms message but the travel engine wrapper is not active. Cannot start travel engine.", v1, 2u);
  OUTLINED_FUNCTION_1_4();
}

- (void)receivedAlarmNamed:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (-[CALNEKTravelEngine isActive](self, "isActive"))
  {
    -[CALNEKTravelEngine travelEngine](self, "travelEngine");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject receivedAlarmNamed:](v5, "receivedAlarmNamed:", v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CALNEKTravelEngine receivedAlarmNamed:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (void)requestHypothesisRefreshAtDate:(id)a3 forEventWithExternalURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CALNEKTravelEngine travelEngine](self, "travelEngine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestHypothesisRefreshAtDate:forEventWithExternalURL:", v7, v6);

}

- (void)cancelHypothesisRefreshRequestForEventWithExternalURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNEKTravelEngine travelEngine](self, "travelEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelHypothesisRefreshRequestForEventWithExternalURL:", v4);

}

- (void)ceaseMonitoringForEventWithExternalURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNEKTravelEngine travelEngine](self, "travelEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ceaseMonitoringForEventWithExternalURL:", v4);

}

- (void)sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNEKTravelEngine travelEngine](self, "travelEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:", v4);

}

- (void)sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNEKTravelEngine travelEngine](self, "travelEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:", v4);

}

- (id)_adviceReceivedBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke;
  v4[3] = &unk_24D4853A8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x2199F212C](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "travelEngine:receivedHypothesis:eventExternalURL:", v8, v6, v5);
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke_cold_1();

    }
  }

}

- (id)_eventSignficantlyChangedBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke;
  v4[3] = &unk_24D4853D0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x2199F212C](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "travelEngine:eventSignificantlyChangedWithEventExternalURL:", v5, v3);
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke_cold_1();

    }
  }

}

- (id)_authorizationChangedBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke;
  v4[3] = &unk_24D4853F8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x2199F212C](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "travelEngine:authorizationChanged:", v4, a2);
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke_cold_1();

    }
  }

}

- (CALNTravelEngineDelegate)delegate
{
  return (CALNTravelEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelEngine, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)receivedNotificationNamed:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Received notification but travel engine is not active. notification name = %{public}@", a5, a6, a7, a8, 2u);
}

- (void)receivedAlarmNamed:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Received alarm but travel engine is not active. alarm name = %{public}@", a5, a6, a7, a8, 2u);
}

void __42__CALNEKTravelEngine__adviceReceivedBlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_0(&dword_215D9B000, v0, v1, "No delegate exists to send travel advice received message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __52__CALNEKTravelEngine__eventSignficantlyChangedBlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_0(&dword_215D9B000, v0, v1, "No delegate exists to send event significantly changed message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __48__CALNEKTravelEngine__authorizationChangedBlock__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_0(&dword_215D9B000, v0, v1, "No delegate exists to send authorization changed message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

@end
