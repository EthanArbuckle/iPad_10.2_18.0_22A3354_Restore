@implementation EKTravelEngineThrottle

- (EKTravelEngineThrottle)init
{
  EKTravelEngineThrottle *v2;
  id v3;
  const char *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKTravelEngineThrottle;
  v2 = -[EKTravelEngineThrottle init](&v7, sel_init);
  if (v2)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");

    v5 = dispatch_queue_create(v4, 0);
    -[EKTravelEngineThrottle setThrottleQueue:](v2, "setThrottleQueue:", v5);

    -[EKTravelEngineThrottle _registerForNotificationObservation](v2, "_registerForNotificationObservation");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[EKTravelEngineThrottle _uninstallEmissionTimer](self, "_uninstallEmissionTimer");
  v3.receiver = self;
  v3.super_class = (Class)EKTravelEngineThrottle;
  -[EKTravelEngineThrottle dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x24BE13F90]);
  v10.receiver = self;
  v10.super_class = (Class)EKTravelEngineThrottle;
  -[EKTravelEngineThrottle description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  -[EKTravelEngineThrottle nextEmissionDate](self, "nextEmissionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withDate:", CFSTR("nextEmissionDate"), v6);

  -[EKTravelEngineThrottle throttleQueue](self, "throttleQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withPointerAddress:", CFSTR("throttleQueue"), v7);

  objc_msgSend(v5, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)tearDown
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  EKTravelEngineThrottle *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Throttle has been requested to tear down: [%@]", buf, 0xCu);
  }
  -[EKTravelEngineThrottle throttleQueue](self, "throttleQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__EKTravelEngineThrottle_tearDown__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __34__EKTravelEngineThrottle_tearDown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_uninstallEmissionTimer");
  v2 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_215D9B000, v2, OS_LOG_TYPE_DEFAULT, "Travel engine throttle tear down: [%@]", (uint8_t *)&v4, 0xCu);
  }
}

- (void)updatePredictedDepartureDate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  EKTravelEngineThrottle *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "updatePredictedDepartureDate: [%{public}@]", buf, 0xCu);
  }
  -[EKTravelEngineThrottle throttleQueue](self, "throttleQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__EKTravelEngineThrottle_updatePredictedDepartureDate___block_invoke;
  v8[3] = &unk_24D484760;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __55__EKTravelEngineThrottle_updatePredictedDepartureDate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  double v5;
  id v6;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldBypassTravelEngineThrottle");

  if (*(_QWORD *)(a1 + 32))
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "_uninstallEmissionTimer");
      objc_msgSend(*(id *)(a1 + 40), "_fireEmissionBlock");
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "emissionThresholdTimeInterval");
      objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", -v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_updateEmissionDate:", v6);

    }
  }
  else
  {
    v4 = *MEMORY[0x24BDC7460];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "No date given.  Tearing down emission timer.", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_uninstallEmissionTimer");
  }
}

+ (double)_requestHypothesisRefreshInterval
{
  return 60.0;
}

+ (double)emissionThresholdTimeInterval
{
  return 900.0;
}

- (id)alarmName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[EKTravelEngineThrottle eventExternalURL](self, "eventExternalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "hash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@throttle-%@"), CFSTR("com.apple.calaccessd.travelEngine."), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)receivedAlarmNamed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[EKTravelEngineThrottle alarmName](self, "alarmName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = *MEMORY[0x24BDC7460];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "EKTravelEngineThrottle received alarm named: %{public}@", buf, 0xCu);
    }
    -[EKTravelEngineThrottle throttleQueue](self, "throttleQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__EKTravelEngineThrottle_receivedAlarmNamed___block_invoke;
    block[3] = &unk_24D484738;
    block[4] = self;
    dispatch_sync(v8, block);

  }
  return v6;
}

uint64_t __45__EKTravelEngineThrottle_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_emissionTimerFired");
}

- (void)_updateEmissionDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(v4, "CalIsBeforeOrSameAsDate:", v5))
    {
      v6 = *MEMORY[0x24BDC7460];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "The given emission date %@ is before now %@.  Firing the emission block and uninstalling the timer.", (uint8_t *)&v14, 0x16u);
      }
      -[EKTravelEngineThrottle _uninstallEmissionTimer](self, "_uninstallEmissionTimer");
      -[EKTravelEngineThrottle _fireEmissionBlock](self, "_fireEmissionBlock");
    }
    else
    {
      -[EKTravelEngineThrottle nextEmissionDate](self, "nextEmissionDate");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8
        && (v9 = (void *)v8,
            -[EKTravelEngineThrottle nextEmissionDate](self, "nextEmissionDate"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "isEqualToDate:", v4),
            v10,
            v9,
            v11))
      {
        v12 = *MEMORY[0x24BDC7460];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412290;
          v15 = v4;
          _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "The given emission date is the same as the existing emission date.  Will not update the emission timer.  Emission date: [%@]", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        v13 = *MEMORY[0x24BDC7460];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138543362;
          v15 = v4;
          _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "updating emissionDate to [%{public}@]", (uint8_t *)&v14, 0xCu);
        }
        -[EKTravelEngineThrottle _uninstallEmissionTimer](self, "_uninstallEmissionTimer");
        -[EKTravelEngineThrottle setNextEmissionDate:](self, "setNextEmissionDate:", v4);
        -[EKTravelEngineThrottle _createEmissionTimerWithDate:](self, "_createEmissionTimerWithDate:", v4);
      }
    }
  }
  else
  {
    v7 = *MEMORY[0x24BDC7460];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "'nil' emission timer given.  Uninstalling emission timer.", (uint8_t *)&v14, 2u);
    }
    -[EKTravelEngineThrottle _uninstallEmissionTimer](self, "_uninstallEmissionTimer");
  }

}

- (void)_fireEmissionBlock
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  EKTravelEngineThrottle *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Firing emission block for travel engine throttle: [%@]", (uint8_t *)&v6, 0xCu);
  }
  -[EKTravelEngineThrottle emissionBlock](self, "emissionBlock");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t))(v4 + 16))(v4);

}

- (void)_createEmissionTimerWithDate:(id)a3
{
  id v4;
  double v5;
  int64_t v6;
  xpc_object_t v7;
  id v8;
  NSObject *v9;
  double v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = (unint64_t)((ceil(v5) + (double)time(0)) * 1000000000.0);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v7, (const char *)*MEMORY[0x24BE14018], v6);
  -[EKTravelEngineThrottle alarmName](self, "alarmName");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  xpc_set_event();

  v9 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Created a new emission timer that will fire on the emission date: [%@]", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "_requestHypothesisRefreshInterval");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v4, -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineThrottle requestHypothesisRefreshBlock](self, "requestHypothesisRefreshBlock");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v12)[2](v12, v11);

}

- (void)_uninstallEmissionTimer
{
  void (**v3)(void);
  NSObject *v4;
  id v5;
  int v6;
  EKTravelEngineThrottle *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[EKTravelEngineThrottle cancelHypothesisRequestRefreshBlock](self, "cancelHypothesisRequestRefreshBlock");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

  v4 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Uninstalling timer for travel engine throttle: [%@].", (uint8_t *)&v6, 0xCu);
  }
  -[EKTravelEngineThrottle alarmName](self, "alarmName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  xpc_set_event();

}

- (void)_emissionTimerFired
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = (os_log_t *)MEMORY[0x24BDC7460];
  v4 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Emission timer fired", buf, 2u);
  }
  -[EKTravelEngineThrottle setNextEmissionDate:](self, "setNextEmissionDate:", 0);
  v5 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Cleared out the next emission date due to emission timer firing.", v6, 2u);
  }
  -[EKTravelEngineThrottle _fireEmissionBlock](self, "_fireEmissionBlock");
  -[EKTravelEngineThrottle _uninstallEmissionTimer](self, "_uninstallEmissionTimer");
}

- (void)_registerForNotificationObservation
{
  objc_msgSend(MEMORY[0x24BE13FA0], "addObserver:selector:name:", self, sel__significantTimeChangeNotificationReceived, *MEMORY[0x24BE14080]);
}

- (void)_significantTimeChangeNotificationReceived
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7460];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7460], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *MEMORY[0x24BE14080];
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Received notification: [%@].", buf, 0xCu);
  }
  -[EKTravelEngineThrottle throttleQueue](self, "throttleQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__EKTravelEngineThrottle__significantTimeChangeNotificationReceived__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_async(v5, block);

}

void __68__EKTravelEngineThrottle__significantTimeChangeNotificationReceived__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "nextEmissionDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_uninstallEmissionTimer");
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setNextEmissionDate:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateEmissionDate:", v2);
  }

}

- (NSString)eventExternalURL
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventExternalURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)requestHypothesisRefreshBlock
{
  return self->_requestHypothesisRefreshBlock;
}

- (void)setRequestHypothesisRefreshBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)cancelHypothesisRequestRefreshBlock
{
  return self->_cancelHypothesisRequestRefreshBlock;
}

- (void)setCancelHypothesisRequestRefreshBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)emissionBlock
{
  return self->_emissionBlock;
}

- (void)setEmissionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_queue)throttleQueue
{
  return self->_throttleQueue;
}

- (void)setThrottleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_throttleQueue, a3);
}

- (NSDate)nextEmissionDate
{
  return self->_nextEmissionDate;
}

- (void)setNextEmissionDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextEmissionDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextEmissionDate, 0);
  objc_storeStrong((id *)&self->_throttleQueue, 0);
  objc_storeStrong(&self->_emissionBlock, 0);
  objc_storeStrong(&self->_cancelHypothesisRequestRefreshBlock, 0);
  objc_storeStrong(&self->_requestHypothesisRefreshBlock, 0);
  objc_storeStrong((id *)&self->_eventExternalURL, 0);
}

@end
