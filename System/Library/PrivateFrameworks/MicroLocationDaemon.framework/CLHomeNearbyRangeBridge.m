@implementation CLHomeNearbyRangeBridge

- (CLHomeNearbyRangeBridge)initWithDelegate:(CLMicroLocationUwbBridgeWrapper *)a3 withQueue:(id)a4
{
  id v7;
  CLHomeNearbyRangeBridge *v8;
  void *v9;
  char v10;
  ULTimer *customRangeRateTimer;
  CLHomeNearbyRangeBridge *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLHomeNearbyRangeBridge;
  v8 = -[CLHomeNearbyRangeBridge init](&v16, sel_init);
  if (!v8)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDDFE38], "deviceCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsPreciseDistanceMeasurement");

  if ((v10 & 1) == 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v13 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEBUG, "ranging is not supported on this platform", v15, 2u);
    }
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v8->_cppWrapper = a3;
  objc_storeStrong((id *)&v8->_rangingCallbackQueue, a4);
  customRangeRateTimer = v8->_customRangeRateTimer;
  v8->_customRangeRateTimer = 0;

  v8->_reactivationInProgress = 0;
  v8->_reactivationDelayInSeconds = 3;
LABEL_5:
  v12 = v8;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  ULTimer *customRangeRateTimer;
  objc_super v4;

  -[CLHomeNearbyRangeBridge invalidateRangingSession](self, "invalidateRangingSession");
  customRangeRateTimer = self->_customRangeRateTimer;
  self->_customRangeRateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CLHomeNearbyRangeBridge;
  -[CLHomeNearbyRangeBridge dealloc](&v4, sel_dealloc);
}

- (void)startRanging
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: startRanging: starting a ranging session", v5, 2u);
  }
  -[CLHomeNearbyRangeBridge invalidateRangingSession](self, "invalidateRangingSession");
  -[CLHomeNearbyRangeBridge createRangeSession](self, "createRangeSession");
  v4 = objc_alloc_init(MEMORY[0x24BDDFE18]);
  -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v4);

}

- (BOOL)setRangingRateWithConfiguration:(int64_t)a3
{
  NISession *session;
  id v6;
  CFAbsoluteTime v7;
  NSObject *v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  CFAbsoluteTime v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  session = self->_session;
  if (session)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDFE18]);
    objc_msgSend(v6, "setMinimumPreferredUpdatedRate:", a3);
    -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v6);
    v7 = cl::chrono::CFAbsoluteTimeClock::now();
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289538;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 1026;
      v15 = a3;
      v16 = 2050;
      v17 = v7;
      _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMicroLocationHomeNearbyRangeBridge: set high ranging rate\", \"rate\":%{public}d, \"now\":\"%{public}.3f\"}", (uint8_t *)v11, 0x22u);
    }

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set high ranging rate without an active ranging session!", (uint8_t *)v11, 2u);
    }
  }
  return session != 0;
}

- (void)resetRangingRate
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (self->_session)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: set default ranging rate", buf, 2u);
    }
    v4 = objc_alloc_init(MEMORY[0x24BDDFE18]);
    objc_msgSend(v4, "setMinimumPreferredUpdatedRate:", 3);
    -[NISession runWithConfiguration:](self->_session, "runWithConfiguration:", v4);
    -[ULTimer invalidate](self->_customRangeRateTimer, "invalidate");

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set default ranging rate without an active ranging session!", v6, 2u);
    }
  }
}

- (void)stopRanging
{
  NSObject *v3;
  uint8_t v4[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: stopRanging: stopping a ranging session", v4, 2u);
  }
  -[ULTimer invalidate](self->_customRangeRateTimer, "invalidate");
  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionStopped(self->_cppWrapper);
  -[NISession pause](self->_session, "pause");
}

- (void)createRangeSession
{
  NSObject *v3;
  NISession *v4;
  NISession *session;
  uint8_t v6[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v3 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: createRangeSession: creating a ranging session", v6, 2u);
  }
  objc_msgSend(MEMORY[0x24BDDFE38], "observerSession");
  v4 = (NISession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v4;

  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionCreated(self->_cppWrapper);
  -[NISession setDelegate:](self->_session, "setDelegate:", self);
  -[NISession setDelegateQueue:](self->_session, "setDelegateQueue:", self->_rangingCallbackQueue);
}

- (void)reactivate
{
  NSObject *v3;
  int64_t reactivationDelayInSeconds;
  dispatch_time_t v5;
  NSObject *rangingCallbackQueue;
  int64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!self->_reactivationInProgress)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134217984;
      v10 = reactivationDelayInSeconds;
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: reactivate: start ranging session in %.3lldsec", buf, 0xCu);
    }
    self->_reactivationInProgress = 1;
    v5 = dispatch_time(0, 1000000000 * self->_reactivationDelayInSeconds);
    rangingCallbackQueue = self->_rangingCallbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__CLHomeNearbyRangeBridge_reactivate__block_invoke;
    block[3] = &unk_2511D4650;
    block[4] = self;
    dispatch_after(v5, rangingCallbackQueue, block);
    CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionSuspended(self->_cppWrapper);
    v7 = 2 * self->_reactivationDelayInSeconds;
    if (v7 >= 120)
      v7 = 120;
    self->_reactivationDelayInSeconds = v7;
  }
}

uint64_t __37__CLHomeNearbyRangeBridge_reactivate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startRanging");
  return objc_msgSend(*(id *)(a1 + 32), "setReactivationInProgress:", 0);
}

- (void)invalidateRangingSession
{
  NSObject *v3;
  NISession *session;
  uint8_t v5[16];

  if (self->_session)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v3 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2419D9000, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: invalidateRangingSession: invalidating a ranging session", v5, 2u);
    }
    -[NISession invalidate](self->_session, "invalidate");
    session = self->_session;
    self->_session = 0;

  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  uint64_t v7;
  __int128 v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void **v15;
  void *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  id obj;
  void *__p[2];
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void **v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v7)
  {
    v9 = "unknown";
    v10 = *(_QWORD *)v25;
    if (a5 == 1)
      v9 = "PeerEnded";
    if (a5)
      v11 = (char *)v9;
    else
      v11 = "Timeout";
    *(_QWORD *)&v8 = 134349570;
    v19 = v8;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
        v14 = (id)logObject_MicroLocation_Default;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, v11);
          if (v23 >= 0)
            v15 = __p;
          else
            v15 = (void **)__p[0];
          objc_msgSend(v13, "discoveryToken", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "description");
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v18 = objc_msgSend(v17, "UTF8String");
          *(_DWORD *)buf = v19;
          v29 = v20;
          v30 = 2082;
          v31 = v15;
          v32 = 2082;
          v33 = v18;
          _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "NI, Session %{public}p did remove nearby object with reason: '%{public}s'. %{public}s", buf, 0x20u);

          if (v23 < 0)
            operator delete(__p[0]);
        }

        ++v12;
      }
      while (v7 != v12);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v7);
  }

}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v4;
  uint64_t v5;
  float *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  float v11;
  NSObject *v13;
  void *v14;
  BOOL v15;
  int v16;
  __int128 v17;
  id v18;
  int v19;
  int v20;
  unint64_t v21;
  char v22;
  void *v23;
  _BOOL4 v24;
  NSString *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  CLMicroLocationUwbBridgeWrapper *cppWrapper;
  CLMicroLocationProtobufHelper *v31[3];
  void *__p[2];
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 *v38;
  __int128 *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  void *v43[2];
  __int128 v44;
  __int128 v45;
  uint8_t buf[8];
  __int16 v47;
  const char *v48;
  __int16 v49;
  uint64_t v50;
  void *v51;
  char v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = a4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v53, 16);
  if (v5)
  {
    v6 = (float *)MEMORY[0x24BDDFDF0];
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "relationship");
        objc_msgSend(v9, "distance");
        if (v11 != *v6 && (v10 & 2) != 0)
        {
          objc_msgSend(v9, "deviceIdentifer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (!v15)
          {
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            *(_OWORD *)v43 = 0u;
            v41 = 0u;
            *(_QWORD *)&v41 = cl::chrono::CFAbsoluteTimeClock::now();
            objc_msgSend(v9, "distance");
            DWORD2(v41) = v16;
            objc_msgSend(v9, "direction");
            v42 = v17;
            objc_msgSend(v9, "deviceIdentifer");
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v18, "UTF8String"));
            *(_OWORD *)v43 = *(_OWORD *)__p;
            *(_QWORD *)&v44 = v33;
            HIBYTE(v33) = 0;
            LOBYTE(__p[0]) = 0;
            BYTE8(v44) = 2;
            objc_msgSend(v9, "azimuth");
            HIDWORD(v44) = v19;
            objc_msgSend(v9, "elevation");
            LODWORD(v45) = v20;
            v21 = objc_msgSend(v9, "distanceMeasurementQuality");
            if (v21 >= 4)
              v22 = 0;
            else
              v22 = v21;
            BYTE4(v45) = v22;
            CLHomeNearbyObjectInternal::Builder::build((CLHomeNearbyObjectInternal::Builder *)&v41, (uint64_t)buf);
            if (SHIBYTE(v33) < 0)
              operator delete(__p[0]);

            if (SBYTE7(v44) < 0)
              operator delete(v43[0]);
            std::vector<CLHomeNearbyObjectInternal>::emplace_back<CLHomeNearbyObjectInternal>((uint64_t *)&v38, (uint64_t)buf);
            if (v52 < 0)
              operator delete(v51);
            goto LABEL_33;
          }
LABEL_26:
          objc_msgSend(v9, "deviceIdentifer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23 == 0;

          if (v24)
          {
            CLMicroLocationErrorHandling::reportError((CLMicroLocationErrorHandling *)CFSTR("NI, known device but deviceIdentifier is nil"), v25);
          }
          else
          {
            if (onceToken_MicroLocation_Default != -1)
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
            v26 = (id)logObject_MicroLocation_Default;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v9, "deviceIdentifer");
              v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v28 = objc_msgSend(v27, "UTF8String");
              *(_DWORD *)buf = 68289282;
              *(_DWORD *)&buf[4] = 0;
              v47 = 2082;
              v48 = "";
              v49 = 2082;
              v50 = v28;
              _os_log_impl(&dword_2419D9000, v26, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"NI, known device's distance is not available\", \"deviceIdentifer\":%{public, location:escape_only}s}", buf, 0x1Cu);

            }
          }
          goto LABEL_33;
        }
        if ((v10 & 2) != 0)
          goto LABEL_26;
        if (onceToken_MicroLocation_Default != -1)
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
        v13 = logObject_MicroLocation_Default;
        if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289026;
          *(_DWORD *)&buf[4] = 0;
          v47 = 2082;
          v48 = "";
          _os_log_impl(&dword_2419D9000, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"NI, unknwon device, ignore\"}", buf, 0x12u);
        }
LABEL_33:
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v53, 16);
    }
    while (v5);
  }

  cppWrapper = self->_cppWrapper;
  memset(v31, 0, sizeof(v31));
  std::vector<CLHomeNearbyObjectInternal>::__init_with_size[abi:ne180100]<CLHomeNearbyObjectInternal*,CLHomeNearbyObjectInternal*>(v31, v38, v39, 0xCCCCCCCCCCCCCCCDLL * (v39 - v38));
  CLMicroLocationUwbBridgeWrapper::onHomeNearbyObjects((uint64_t)cppWrapper, v31);
  *(_QWORD *)buf = v31;
  std::vector<CLHomeNearbyObjectInternal>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = &v38;
  std::vector<CLHomeNearbyObjectInternal>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

}

- (void)sessionWasSuspended:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134349056;
    v7 = v4;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p was suspended.", (uint8_t *)&v6, 0xCu);
  }
  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionSuspended(self->_cppWrapper);

}

- (void)sessionSuspensionEnded:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134349056;
    v7 = v4;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p suspension ended. Restarting...", (uint8_t *)&v6, 0xCu);
  }
  CLMicroLocationUwbBridgeWrapper::onHomeNearbySessionResumed(self->_cppWrapper);

}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  CLMicroLocationErrorHandling *v8;
  NSString *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  int64_t reactivationDelayInSeconds;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("Uwb range session invalidated error:"), v7);
    v8 = (CLMicroLocationErrorHandling *)objc_claimAutoreleasedReturnValue();
    CLMicroLocationErrorHandling::reportError(v8, v9);

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
    v10 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(0, "debugDescription");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134349570;
      v15 = v6;
      v16 = 2080;
      v17 = v12;
      v18 = 2048;
      v19 = reactivationDelayInSeconds;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "NI, Error: session %{public}p invalidated with error: %s next reactivation try in %lldsec", buf, 0x20u);

    }
  }
  -[CLHomeNearbyRangeBridge invalidateRangingSession](self, "invalidateRangingSession");
  -[CLHomeNearbyRangeBridge reactivate](self, "reactivate");

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = 136446210;
    v10 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "NI, failed (non-fatal): %{public}s.", (uint8_t *)&v9, 0xCu);

  }
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = 136446210;
    v10 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEBUG, "NI, discovered object: %{public}s", (uint8_t *)&v9, 0xCu);

  }
}

- (void)sessionDidStartRunning:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_116);
  v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134349056;
    v7 = v4;
    _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p Start Running", (uint8_t *)&v6, 0xCu);
  }
  self->_reactivationDelayInSeconds = 3;

}

- (ULTimer)customRangeRateTimer
{
  return self->_customRangeRateTimer;
}

- (void)setCustomRangeRateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_customRangeRateTimer, a3);
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (OS_dispatch_queue)rangingCallbackQueue
{
  return self->_rangingCallbackQueue;
}

- (void)setRangingCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_rangingCallbackQueue, a3);
}

- (BOOL)reactivationInProgress
{
  return self->_reactivationInProgress;
}

- (void)setReactivationInProgress:(BOOL)a3
{
  self->_reactivationInProgress = a3;
}

- (int64_t)reactivationDelayInSeconds
{
  return self->_reactivationDelayInSeconds;
}

- (void)setReactivationDelayInSeconds:(int64_t)a3
{
  self->_reactivationDelayInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_customRangeRateTimer, 0);
}

@end
