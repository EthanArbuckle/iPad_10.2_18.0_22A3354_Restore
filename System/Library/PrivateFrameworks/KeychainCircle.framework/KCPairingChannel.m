@implementation KCPairingChannel

- (id)initAsInitiator:(BOOL)a3 version:(id)a4
{
  _BOOL8 v5;
  id v7;
  KCPairingChannel *v8;
  id *v9;
  void (*v10)(uint64_t, void *, void *);
  uint64_t *v11;
  NSObject *v12;
  KCPairingChannel *v13;
  uint64_t v14;
  id nextState;
  uint64_t v16;
  id v17;
  OTControl *otControl;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  OTJoiningConfiguration *joiningConfiguration;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  OTControlArguments *controlArguments;
  uint8_t v35[8];
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id location[2];
  objc_super v42;

  v5 = a3;
  v7 = a4;
  if (+[KCPairingChannel isSupportedPlatform](KCPairingChannel, "isSupportedPlatform"))
  {
    v42.receiver = self;
    v42.super_class = (Class)KCPairingChannel;
    v8 = -[KCPairingChannel init](&v42, sel_init);
    if (v8)
    {
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, v8);
      v8->_initiator = v5;
      objc_storeStrong((id *)&v8->_peerVersionContext, a4);
      if (v8->_initiator)
      {
        v9 = (id *)&v40;
        v39 = MEMORY[0x24BDAC760];
        v10 = __44__KCPairingChannel_initAsInitiator_version___block_invoke;
        v11 = &v39;
      }
      else
      {
        v9 = (id *)&v38;
        v37 = MEMORY[0x24BDAC760];
        v10 = __44__KCPairingChannel_initAsInitiator_version___block_invoke_2;
        v11 = &v37;
      }
      v11[1] = 3221225472;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_24C7B8D58;
      objc_copyWeak(v9, location);
      v14 = MEMORY[0x212BA8F38](v11);
      nextState = v8->_nextState;
      v8->_nextState = (id)v14;

      objc_destroyWeak(v9);
      v8->_needInitialSync = 1;
      v8->_testFailSOS = 0;
      v8->_sessionSupportsSOS = SOSCCIsSOSTrustAndSyncingEnabled();
      v8->_sessionSupportsOctagon = 1;
      v36 = 0;
      objc_msgSend(MEMORY[0x24BDE84C0], "controlObject:error:", 1, &v36);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v36;
      otControl = v8->_otControl;
      v8->_otControl = (OTControl *)v16;

      if (v17)
      {
        secLogObjForScope("SecError");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v35 = 0;
          _os_log_impl(&dword_20D7B6000, v19, OS_LOG_TYPE_DEFAULT, "could not stand up otcontrol connection", v35, 2u);
        }

      }
      v20 = objc_alloc(MEMORY[0x24BDE84D0]);
      v21 = *MEMORY[0x24BDE8510];
      objc_msgSend(v7, "uniqueDeviceID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueClientID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v20, "initWithProtocolType:uniqueDeviceID:uniqueClientID:pairingUUID:epoch:isInitiator:", v21, v22, v23, v25, 0, v5);
      joiningConfiguration = v8->_joiningConfiguration;
      v8->_joiningConfiguration = (OTJoiningConfiguration *)v26;

      v28 = objc_alloc(MEMORY[0x24BDE84C8]);
      objc_msgSend(v7, "altDSID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "flowID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceSessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v28, "initWithAltDSID:flowID:deviceSessionID:", v29, v30, v31);
      controlArguments = v8->_controlArguments;
      v8->_controlArguments = (OTControlArguments *)v32;

      objc_destroyWeak(location);
    }
    self = v8;
    v13 = self;
  }
  else
  {
    secLogObjForScope("SecError");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_20D7B6000, v12, OS_LOG_TYPE_DEFAULT, "platform not supported for pairing", (uint8_t *)location, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)oneStepTooMany:(id)a3 complete:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a4;
  secLogObjForScope("SecError");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20D7B6000, v5, OS_LOG_TYPE_DEFAULT, "pairingchannel: one step too many", v7, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v6);

}

- (void)setNextStateError:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__KCPairingChannel_setNextStateError_complete___block_invoke;
  v9[3] = &unk_24C7B8D58;
  objc_copyWeak(&v10, &location);
  -[KCPairingChannel setNextState:](self, "setNextState:", v9);
  if (v7)
  {
    if (v6)
    {
      secLogObjForScope("SecError");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_20D7B6000, v8, OS_LOG_TYPE_DEFAULT, "pairingchannel: failed pairing with: %@", buf, 0xCu);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v6);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)waitForOctagonUpgrade
{
  AAFAnalyticsEventSecurity *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AAFAnalyticsEventSecurity *v10;
  void *v11;
  void *v12;
  AAFAnalyticsEventSecurity *v13;
  uint64_t v14;
  _QWORD v15[4];
  AAFAnalyticsEventSecurity *v16;

  v3 = [AAFAnalyticsEventSecurity alloc];
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceSessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 1;
  v10 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v3, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v5, v7, v9, CFSTR("com.apple.security.initiatorWaitsForUpgrade"), metricsAreEnabled, v14, &unk_24C7BFD20);

  -[KCPairingChannel otControl](self, "otControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__KCPairingChannel_waitForOctagonUpgrade__block_invoke;
  v15[3] = &unk_24C7B8D80;
  v16 = v10;
  v13 = v10;
  objc_msgSend(v11, "waitForOctagonUpgrade:reply:", v12, v15);

}

- (void)initiatorFirstPacket:(id)a3 complete:(id)a4
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  AAFAnalyticsEventSecurity *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AAFAnalyticsEventSecurity *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t Nanoseconds;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  unint64_t v50;
  id v51;
  uint64_t spid;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id location;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  const __CFString *v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _BYTE buf[12];
  __int16 v71;
  double v72;
  __int16 v73;
  int v74;
  const __CFString *v75;
  _QWORD v76[4];

  v76[1] = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v51 = a4;
  secLogObjForScope("pairing");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 1", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  spid = _OctagonSignpostCreate();

  _OctagonSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v50 = spid - 1;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PairingChannelInitiatorMessage1", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = spid;
    _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage1  enableTelemetry=YES ", buf, 0xCu);
  }

  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && -[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    v11 = 3;
  }
  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    v11 = 2;
  }
  else
  {
    v11 = -[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS");
  }
  v12 = [AAFAnalyticsEventSecurity alloc];
  v75 = CFSTR("supportedTrustSystem");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceSessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v48) = 1;
  v21 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v12, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", v14, v16, v18, v20, CFSTR("com.apple.security.initiatorCreatesPacket1"), metricsAreEnabled, v48, &unk_24C7BFD20);

  if (SOSCCIsSOSTrustAndSyncingEnabled()
    && !-[KCPairingChannel ensureControlChannel](self, "ensureControlChannel"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v31, v51);
    Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v50 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
    {
      *(_QWORD *)buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v34, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      v71 = 2048;
      v72 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      v73 = 1026;
      v74 = 0;
      _os_log_impl(&dword_20D7B6000, v35, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 0, v31);
  }
  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon")
         && -[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
         && !-[KCPairingChannel testFailOctagon](self, "testFailOctagon"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke;
    v57[3] = &unk_24C7B8D58;
    objc_copyWeak(&v58, &location);
    -[KCPairingChannel setNextState:](self, "setNextState:", v57);
    v42 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 1;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v44, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      v71 = 2048;
      v72 = (double)(unint64_t)v42 / 1000000000.0;
      v73 = 1026;
      v74 = 1;
      _os_log_impl(&dword_20D7B6000, v45, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 1, 0);
    v68[0] = CFSTR("d");
    v68[1] = CFSTR("o");
    v69[0] = MEMORY[0x24BDBD1C8];
    v66 = CFSTR("v");
    v67 = CFSTR("O");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v46;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v51 + 2))(v51, 0, v47, 0);

    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
  }
  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon")
         && -[KCPairingChannel testFailOctagon](self, "testFailOctagon"))
  {
    v22 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v50 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      *(_QWORD *)buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v24, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      v71 = 2048;
      v72 = (double)(unint64_t)v22 / 1000000000.0;
      v73 = 1026;
      v74 = 0;
      _os_log_impl(&dword_20D7B6000, v25, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 1, 0);
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v51 + 2))(v51, 1, 0, 0);
  }
  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon")
         && !-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_154;
    v55[3] = &unk_24C7B8D58;
    objc_copyWeak(&v56, &location);
    -[KCPairingChannel setNextState:](self, "setNextState:", v55);
    v36 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 1;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      v71 = 2048;
      v72 = (double)(unint64_t)v36 / 1000000000.0;
      v73 = 1026;
      v74 = 1;
      _os_log_impl(&dword_20D7B6000, v39, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 1, 0);
    v62 = CFSTR("v");
    v63 = CFSTR("O");
    v64 = CFSTR("o");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v51 + 2))(v51, 0, v41, 0);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
  else
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_155;
    v53[3] = &unk_24C7B8D58;
    objc_copyWeak(&v54, &location);
    -[KCPairingChannel setNextState:](self, "setNextState:", v53);
    v26 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = 1;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v28, OS_SIGNPOST_INTERVAL_END, spid, "PairingChannelInitiatorMessage1", " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = spid;
      v71 = 2048;
      v72 = (double)(unint64_t)v26 / 1000000000.0;
      v73 = 1026;
      v74 = 1;
      _os_log_impl(&dword_20D7B6000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 1, 0);
    v60 = CFSTR("d");
    v61 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v51 + 2))(v51, 0, v30, 0);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }

}

- (void)initiatorSecondPacket:(id)a3 complete:(id)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  AAFAnalyticsEventSecurity *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  AAFAnalyticsEventSecurity *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  AAFAnalyticsEventSecurity *v47;
  id v48;
  void *v49;
  os_signpost_id_t v50;
  id v51;
  _QWORD v52[4];
  AAFAnalyticsEventSecurity *v53;
  id v54;
  uint8_t *v55;
  os_signpost_id_t v56;
  uint64_t v57;
  _QWORD v58[5];
  AAFAnalyticsEventSecurity *v59;
  id v60;
  id v61;
  __int128 *v62;
  uint8_t *v63;
  os_signpost_id_t v64;
  uint64_t v65;
  os_signpost_id_t v66;
  uint64_t v67;
  _QWORD v68[4];
  AAFAnalyticsEventSecurity *v69;
  id v70;
  __int128 *v71;
  uint8_t *v72;
  os_signpost_id_t v73;
  uint64_t v74;
  os_signpost_id_t v75;
  uint64_t v76;
  uint8_t buf[8];
  uint8_t *v78;
  uint64_t v79;
  char v80;
  uint8_t v81[4];
  os_signpost_id_t v82;
  __int128 v83;
  uint64_t v84;
  char v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v48 = a4;
  secLogObjForScope("pairing");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 2", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v78 = buf;
  v79 = 0x2020000000;
  v80 = 0;
  _OctagonSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _OctagonSignpostCreate();
  v46 = v9;
  v10 = v8;

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v83) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PairingChannelInitiatorMessage2", " enableTelemetry=YES ", (uint8_t *)&v83, 2u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v83) = 134217984;
    *(_QWORD *)((char *)&v83 + 4) = v10;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage2  enableTelemetry=YES ", (uint8_t *)&v83, 0xCu);
  }

  v50 = v10;
  v14 = [AAFAnalyticsEventSecurity alloc];
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceSessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v41) = 1;
  v47 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v14, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v16, v18, v20, CFSTR("com.apple.security.initiatorCreatesPacket3"), metricsAreEnabled, v41, &unk_24C7BFD20);

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("o"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v49)
  {
    secLogObjForScope("pairing");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v83) = 0;
      _os_log_impl(&dword_20D7B6000, v21, OS_LOG_TYPE_DEFAULT, "acceptor didn't send a octagon packet, so skipping all octagon flows", (uint8_t *)&v83, 2u);
    }

    -[KCPairingChannel setSessionSupportsOctagon:](self, "setSessionSupportsOctagon:", 0);
  }
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("c"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("d"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (!v24)
    {
      secLogObjForScope("pairing");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v83) = 0;
        _os_log_impl(&dword_20D7B6000, v25, OS_LOG_TYPE_DEFAULT, "acceptor will send initial credentials", (uint8_t *)&v83, 2u);
      }

      -[KCPairingChannel setAcceptorWillSendInitialSyncCredentials:](self, "setAcceptorWillSendInitialSyncCredentials:", 1);
    }
  }
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    *(_QWORD *)&v83 = 0;
    *((_QWORD *)&v83 + 1) = &v83;
    v84 = 0x2020000000;
    v85 = 0;
    _OctagonSignpostLogSystem();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = _OctagonSignpostCreate();
    v45 = v28;
    v29 = v27;

    _OctagonSignpostLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)v81 = 0;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PairingChannelInitiatorStashAccountCredential", " enableTelemetry=YES ", v81, 2u);
    }

    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v81 = 134217984;
      v82 = v29;
      _os_log_impl(&dword_20D7B6000, v32, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorStashAccountCredential  enableTelemetry=YES ", v81, 0xCu);
    }

    v44 = v22;
    -[KCPairingChannel connection](self, "connection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke;
    v68[3] = &unk_24C7B8DA8;
    v73 = v29;
    v74 = v45;
    v75 = v50;
    v76 = v46;
    v71 = &v83;
    v72 = buf;
    v33 = v47;
    v69 = v33;
    v34 = v48;
    v70 = v34;
    objc_msgSend(v43, "remoteObjectProxyWithErrorHandler:", v68);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "altDSID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "flowID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "deviceSessionID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_156;
    v58[3] = &unk_24C7B8DF8;
    v62 = &v83;
    v58[4] = self;
    v65 = v45;
    v66 = v50;
    v67 = v46;
    v63 = buf;
    v64 = v29;
    v59 = v33;
    v61 = v34;
    v60 = v51;
    objc_msgSend(v42, "stashAccountCredential:altDSID:flowID:deviceSessionID:canSendMetrics:complete:", v44, v36, v38, v40, 1, v58);

    v22 = v44;
    _Block_object_dispose(&v83, 8);
  }
  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_161;
    v52[3] = &unk_24C7B8DD0;
    v55 = buf;
    v56 = v50;
    v57 = v46;
    v53 = v47;
    v54 = v48;
    -[KCPairingChannel initiatorCompleteSecondPacketOctagon:application:complete:](self, "initiatorCompleteSecondPacketOctagon:application:complete:", v51, 0, v52);

  }
  _Block_object_dispose(buf, 8);

}

- (void)initiatorCompleteSecondPacketWithSOS:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t *v32;
  id v33[3];
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  char *v37;
  void *v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  char v42;
  id location;
  uint8_t v44[4];
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  secLogObjForScope("pairing");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v8, OS_LOG_TYPE_DEFAULT, "initiator complete second packet 2", buf, 2u);
  }

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0, 0);
  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x2020000000;
  v42 = 0;
  _OctagonSignpostLogSystem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = _OctagonSignpostCreate();
  v28 = v11;
  v12 = (char *)v10;

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v44 = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v12, "PairingChannelInitiatorMakeSOSPeer", " enableTelemetry=YES ", v44, 2u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v44 = 134217984;
    v45 = v12;
    _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMakeSOSPeer  enableTelemetry=YES ", v44, 0xCu);
  }

  v26 = v6;
  -[KCPairingChannel connection](self, "connection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke;
  v34[3] = &unk_24C7B8E20;
  v37 = v12;
  v38 = v28;
  v36 = buf;
  v16 = v7;
  v35 = v16;
  objc_msgSend(v27, "remoteObjectProxyWithErrorHandler:", v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "altDSID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "flowID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "deviceSessionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_162;
  v29[3] = &unk_24C7B8E48;
  v33[1] = v12;
  v33[2] = v28;
  v32 = buf;
  v29[4] = self;
  v24 = v26;
  v30 = v24;
  v25 = v16;
  v31 = v25;
  objc_copyWeak(v33, &location);
  objc_msgSend(v17, "myPeerInfo:flowID:deviceSessionID:canSendMetrics:complete:", v19, v21, v23, 1, v29);

  objc_destroyWeak(v33);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

}

- (BOOL)fetchPrepare:(id *)a3 application:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  id location;

  v8 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  -[KCPairingChannel otControl](self, "otControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __51__KCPairingChannel_fetchPrepare_application_error___block_invoke;
  v17[3] = &unk_24C7B8E70;
  v17[4] = self;
  v19 = &v29;
  v20 = &v35;
  v12 = v8;
  v18 = v12;
  v21 = &v23;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v9, "rpcPrepareIdentityAsApplicantWithArguments:configuration:reply:", v10, v11, v17);

  if (a3)
  {
    v13 = (void *)v24[5];
    if (v13)
      *a3 = objc_retainAutorelease(v13);
  }
  if (a5)
  {
    v14 = (void *)v30[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = *((_BYTE *)v36 + 24);
  objc_destroyWeak(&v22);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  objc_destroyWeak(&location);

  return v15;
}

- (void)initiatorCompleteSecondPacketOctagon:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD, id);
  NSObject *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD, id))a5;
  secLogObjForScope("pairing");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v11, OS_LOG_TYPE_DEFAULT, "initiator complete second packet 2 with octagon", buf, 2u);
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("o"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    while (1)
    {

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      secLogObjForScope((const char *)pairingScope);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v14 + 1;
        _os_log_impl(&dword_20D7B6000, v16, OS_LOG_TYPE_DEFAULT, "Attempt %d, calling fetchPrepare", buf, 8u);
      }

      v23 = 0;
      v24 = v15;
      v17 = -[KCPairingChannel fetchPrepare:application:error:](self, "fetchPrepare:application:error:", &v24, v9, &v23);
      v18 = v24;

      v13 = v23;
      if (v17)
        break;
      if (!+[KCPairingChannel retryable:](KCPairingChannel, "retryable:", v13))
      {
        secLogObjForScope("SecError");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v26 = pairingScope;
          v27 = 1024;
          v28 = v14 + 1;
          v29 = 2112;
          v30 = v13;
          _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, "%s: Attempt %d, failed fetching prepare %@", buf, 0x1Cu);
        }

        v10[2](v10, 1, 0, v13);
        goto LABEL_22;
      }
      secLogObjForScope((const char *)pairingScope);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v14 + 2;
        _os_log_impl(&dword_20D7B6000, v19, OS_LOG_TYPE_DEFAULT, "Attempt %d, retrying fetching prepare", buf, 8u);
      }
      ++v14;

      if (v14 >= prepareMaxRetry)
      {
        secLogObjForScope("SecError");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v26) = prepareMaxRetry;
          _os_log_impl(&dword_20D7B6000, v20, OS_LOG_TYPE_DEFAULT, "pairing: failed to fetch prepare %d times, bailing.", buf, 8u);
        }

        v10[2](v10, 1, 0, v13);
        goto LABEL_23;
      }
    }
    ((void (**)(id, uint64_t, id, id))v10)[2](v10, 0, v18, 0);
LABEL_22:

    goto LABEL_23;
  }
  secLogObjForScope((const char *)pairingScope);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v21, OS_LOG_TYPE_DEFAULT, "initiatorCompleteSecondPacketOctagon octagonData missing or wrong class", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 4, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v13, v10);
LABEL_23:

}

- (BOOL)join:(id *)a3 voucher:(id)a4 eventS:(id)a5 setupPairingChannelSignPost:(octagon_signpost_s)a6 finishPairing:(BOOL *)a7 error:(id *)a8
{
  void *var1;
  void *var0;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31[4];
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[3];
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  var1 = (void *)a6.var1;
  var0 = (void *)a6.var0;
  v12 = a4;
  v13 = a5;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel otControl](self, "otControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "voucher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "voucherSignature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke;
  v25[3] = &unk_24C7B8E98;
  v31[1] = var0;
  v31[2] = var1;
  v25[4] = self;
  v27 = v39;
  v19 = v13;
  v26 = v19;
  v28 = &v41;
  v29 = &v47;
  objc_copyWeak(v31, &location);
  v30 = &v33;
  v31[3] = a7;
  objc_msgSend(v14, "rpcJoinWithArguments:configuration:vouchData:vouchSig:reply:", v15, v16, v17, v18, v25);

  if (a8)
  {
    v20 = (void *)v42[5];
    if (v20)
      *a8 = objc_retainAutorelease(v20);
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v34[5]);
  v21 = *((_BYTE *)v48 + 24);
  objc_destroyWeak(v31);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v21;
}

- (void)initiatorThirdPacket:(id)a3 complete:(id)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  AAFAnalyticsEventSecurity *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  AAFAnalyticsEventSecurity *v28;
  void (**v29)(id, uint64_t, _QWORD, void *);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  int v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  OTPairingMessage *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  NSObject *v51;
  int v52;
  OTPairingMessage *v53;
  uint64_t Nanoseconds;
  NSObject *v55;
  NSObject *v56;
  int v57;
  NSObject *v58;
  int v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  int v65;
  NSObject *v66;
  int v67;
  id v68;
  _BOOL8 v69;
  id v70;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  OTPairingMessage *v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  void (**v80)(id, uint64_t, _QWORD, void *);
  void *v81;
  id v82;
  void *v83;
  AAFAnalyticsEventSecurity *v84;
  id v85;
  id v86;
  _QWORD v87[5];
  AAFAnalyticsEventSecurity *v88;
  void (**v89)(id, uint64_t, _QWORD, void *);
  _BYTE *v90;
  __int128 *v91;
  id v92[5];
  _QWORD v93[4];
  AAFAnalyticsEventSecurity *v94;
  id v95;
  _BYTE *v96;
  __int128 *p_buf;
  char *v98;
  void *v99;
  char *v100;
  void *v101;
  id location;
  uint8_t v103[4];
  char *v104;
  _BYTE v105[28];
  __int128 buf;
  uint64_t v107;
  char v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v82 = a3;
  v80 = (void (**)(id, uint64_t, _QWORD, void *))a4;
  secLogObjForScope("pairing");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_20D7B6000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 3", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _OctagonSignpostCreate();
  v81 = v9;
  v10 = (char *)v8;

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v77 = (unint64_t)(v10 - 1);
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage3  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  v14 = [AAFAnalyticsEventSecurity alloc];
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceSessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v72) = 1;
  v84 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v14, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v16, v18, v20, CFSTR("com.apple.security.initiatorJoinsTrustSystems"), metricsAreEnabled, v72, &unk_24C7BFD20);

  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0, 0);
  objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("b"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v107 = 0x2020000000;
  v108 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (v83 && SOSCCIsSOSTrustAndSyncingEnabled())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      Nanoseconds = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        v57 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
        *(_DWORD *)v105 = 67240192;
        *(_DWORD *)&v105[4] = v57;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v56, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 8u);
      }

      _OctagonSignpostLogSystem();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 134218496;
        v59 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
        *(_QWORD *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v59;
        _os_log_impl(&dword_20D7B6000, v58, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 0x1Cu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 5, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v84, 0, v60);
      v80[2](v80, 1, 0, v60);
      goto LABEL_61;
    }
    *(_QWORD *)v105 = 0;
    *(_QWORD *)&v105[8] = v105;
    *(_QWORD *)&v105[16] = 0x2020000000;
    v105[24] = 0;
    _OctagonSignpostLogSystem();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = _OctagonSignpostCreate();
    v78 = v23;
    v24 = (char *)v22;

    _OctagonSignpostLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v103 = 0;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v24, "PairingChannelInitiatorJoinSOS", " enableTelemetry=YES ", v103, 2u);
    }

    _OctagonSignpostLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v103 = 134217984;
      v104 = v24;
      _os_log_impl(&dword_20D7B6000, v27, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorJoinSOS  enableTelemetry=YES ", v103, 0xCu);
    }

    -[KCPairingChannel connection](self, "connection");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v93[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke;
    v93[3] = &unk_24C7B8DA8;
    v98 = v24;
    v99 = v78;
    v100 = v10;
    v101 = v81;
    v96 = v105;
    p_buf = &buf;
    v28 = v84;
    v94 = v28;
    v29 = v80;
    v95 = v29;
    objc_msgSend(v75, "remoteObjectProxyWithErrorHandler:", v93);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "altDSID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "flowID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "deviceSessionID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x24BDAC760];
    v87[1] = 3221225472;
    v87[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_174;
    v87[3] = &unk_24C7B8EC0;
    v90 = v105;
    v87[4] = self;
    v92[2] = v78;
    v92[3] = v10;
    v92[4] = v81;
    v92[1] = v24;
    v91 = &buf;
    v88 = v28;
    v89 = v29;
    objc_copyWeak(v92, &location);
    objc_msgSend(v73, "joinCircleWithBlob:altDSID:flowID:deviceSessionID:canSendMetrics:version:complete:", v83, v30, v32, v34, 1, 1, v87);

    objc_destroyWeak(v92);
    _Block_object_dispose(v105, 8);
  }
  if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("o"));
    v79 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      secLogObjForScope((const char *)pairingScope);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl(&dword_20D7B6000, v44, OS_LOG_TYPE_DEFAULT, "initiatorThirdPacket octagonData missing or wrong class", v105, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 4, 0);
      v45 = objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v45, v80);
      v46 = (OTPairingMessage *)v45;
      v47 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        v50 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
        *(_DWORD *)v105 = 67240192;
        *(_DWORD *)&v105[4] = v50;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v49, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 8u);
      }

      _OctagonSignpostLogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 134218496;
        v52 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
        *(_QWORD *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)v47 / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v52;
        _os_log_impl(&dword_20D7B6000, v51, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 0x1Cu);
      }

      v53 = v46;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v84, 0, v46);
      goto LABEL_60;
    }
    v76 = -[OTPairingMessage initWithData:]([OTPairingMessage alloc], "initWithData:", v79);
    if (!-[OTPairingMessage hasVoucher](v76, "hasVoucher"))
    {
      secLogObjForScope((const char *)pairingScope);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl(&dword_20D7B6000, v61, OS_LOG_TYPE_DEFAULT, "initiatorThirdPacket pairingMessage has no voucher", v105, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 4, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v35, v80);
      v62 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v63;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        v65 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
        *(_DWORD *)v105 = 67240192;
        *(_DWORD *)&v105[4] = v65;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v64, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v10, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 8u);
      }

      _OctagonSignpostLogSystem();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 134218496;
        v67 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
        *(_QWORD *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)v62 / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v67;
        _os_log_impl(&dword_20D7B6000, v66, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", v105, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v84, 0, v35);
      goto LABEL_59;
    }
    -[OTPairingMessage voucher](v76, "voucher");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v103[0] = 0;
    while (1)
    {
      secLogObjForScope((const char *)pairingScope);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[4] = v38 + 1;
        _os_log_impl(&dword_20D7B6000, v39, OS_LOG_TYPE_DEFAULT, "Attempt %d, calling join", v105, 8u);
      }

      v85 = 0;
      v86 = v36;
      v40 = -[KCPairingChannel join:voucher:eventS:setupPairingChannelSignPost:finishPairing:error:](self, "join:voucher:eventS:setupPairingChannelSignPost:finishPairing:error:", &v86, v35, v84, v10, v81, v103, &v85);
      v41 = v86;

      v37 = v85;
      if (v40)
        break;
      if (!+[KCPairingChannel retryable:](KCPairingChannel, "retryable:", v37))
      {
        secLogObjForScope("SecError");
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 136315650;
          *(_QWORD *)&v105[4] = pairingScope;
          *(_WORD *)&v105[12] = 1024;
          *(_DWORD *)&v105[14] = v38 + 1;
          *(_WORD *)&v105[18] = 2112;
          *(_QWORD *)&v105[20] = v37;
          _os_log_impl(&dword_20D7B6000, v71, OS_LOG_TYPE_DEFAULT, "%s: Attempt %d failed join: %@", v105, 0x1Cu);
        }

        v70 = 0;
        v69 = 1;
        v68 = v37;
        goto LABEL_57;
      }
      secLogObjForScope((const char *)pairingScope);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[4] = v38 + 2;
        _os_log_impl(&dword_20D7B6000, v42, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying join", v105, 8u);
      }

      ++v38;
      v36 = v41;
      if (v38 >= joinMaxRetry)
      {
        secLogObjForScope("SecError");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 67109120;
          *(_DWORD *)&v105[4] = joinMaxRetry;
          _os_log_impl(&dword_20D7B6000, v43, OS_LOG_TYPE_DEFAULT, "pairing: failed to join %d times, bailing.", v105, 8u);
        }

        v80[2](v80, 1, 0, v37);
LABEL_58:

LABEL_59:
        v53 = v76;
LABEL_60:

        v60 = (void *)v79;
LABEL_61:

        goto LABEL_62;
      }
    }
    v68 = 0;
    v69 = v103[0] != 0;
    v70 = v41;
LABEL_57:
    ((void (**)(id, uint64_t, id, void *))v80)[2](v80, v69, v70, v68);
    goto LABEL_58;
  }
LABEL_62:
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

- (void)initiatorFourthPacket:(id)a3 complete:(id)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  AAFAnalyticsEventSecurity *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AAFAnalyticsEventSecurity *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  AAFAnalyticsEventSecurity *v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t Nanoseconds;
  NSObject *v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  _QWORD v43[5];
  AAFAnalyticsEventSecurity *v44;
  id v45;
  uint8_t *v46;
  os_signpost_id_t v47;
  uint64_t v48;
  _QWORD v49[4];
  AAFAnalyticsEventSecurity *v50;
  id v51;
  uint8_t *v52;
  os_signpost_id_t v53;
  uint64_t v54;
  uint8_t buf[8];
  uint8_t *v56;
  uint64_t v57;
  char v58;
  const __CFString *v59;
  void *v60;
  uint8_t v61[4];
  os_signpost_id_t v62;
  __int16 v63;
  double v64;
  __int16 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v41 = a4;
  secLogObjForScope("pairing");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 4", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v56 = buf;
  v57 = 0x2020000000;
  v58 = 0;
  _OctagonSignpostLogSystem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _OctagonSignpostCreate();
  v40 = v9;
  v10 = v8;

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v61 = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PairingChannelInitiatorMessage4", " enableTelemetry=YES ", v61, 2u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v61 = 134217984;
    v62 = v10;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelInitiatorMessage4  enableTelemetry=YES ", v61, 0xCu);
  }

  v14 = [AAFAnalyticsEventSecurity alloc];
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceSessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v39) = 1;
  v21 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v14, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v16, v18, v20, CFSTR("com.apple.security.initiatorImportsInitialSyncData"), metricsAreEnabled, v39, &unk_24C7BFD20);

  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0, 0);
  objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("d"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = CFSTR("numberOfKeychainItemsAdded");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsEventSecurity addMetrics:](v21, "addMetrics:", v24);

    secLogObjForScope("pairing");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(v22, "count");
      *(_DWORD *)v61 = 134217984;
      v62 = v26;
      _os_log_impl(&dword_20D7B6000, v25, OS_LOG_TYPE_DEFAULT, "importing %lu items", v61, 0xCu);
    }

    -[KCPairingChannel connection](self, "connection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x24BDAC760];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke;
    v49[3] = &unk_24C7B8EE8;
    v53 = v10;
    v54 = v40;
    v52 = buf;
    v29 = v21;
    v50 = v29;
    v30 = v41;
    v51 = v30;
    objc_msgSend(v27, "remoteObjectProxyWithErrorHandler:", v49);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v28;
    v43[1] = 3221225472;
    v43[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_177;
    v43[3] = &unk_24C7B8F10;
    v43[4] = self;
    v46 = buf;
    v47 = v10;
    v48 = v40;
    v44 = v29;
    v45 = v30;
    objc_msgSend(v31, "importInitialSyncCredentials:complete:", v22, v43);

  }
  else
  {
    secLogObjForScope("pairing");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_20D7B6000, v32, OS_LOG_TYPE_DEFAULT, "initiator no items to import", v61, 2u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      v36 = v56[24];
      *(_DWORD *)v61 = 67240192;
      LODWORD(v62) = v36;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v35, OS_SIGNPOST_INTERVAL_END, v10, "PairingChannelInitiatorMessage4", " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", v61, 8u);
    }

    _OctagonSignpostLogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v61 = 134218496;
      v38 = v56[24];
      v62 = v10;
      v63 = 2048;
      v64 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      v65 = 1026;
      v66 = v38;
      _os_log_impl(&dword_20D7B6000, v37, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", v61, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v21, 1, 0);
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v41 + 2))(v41, 1, 0, 0);
  }

  _Block_object_dispose(buf, 8);
}

- (void)acceptorFirstPacket:(id)a3 complete:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  AAFAnalyticsEventSecurity *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t Nanoseconds;
  NSObject *v43;
  NSObject *v44;
  int v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  char *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  int v62;
  NSObject *v63;
  int v64;
  uint64_t v65;
  void *v66;
  void (**v67)(id, uint64_t, _QWORD, void *);
  AAFAnalyticsEventSecurity *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  AAFAnalyticsEventSecurity *v74;
  void (**v75)(id, uint64_t, _QWORD, void *);
  id v76;
  _QWORD v77[4];
  AAFAnalyticsEventSecurity *v78;
  void (**v79)(id, uint64_t, _QWORD, void *);
  uint64_t *v80;
  char *v81;
  void *v82;
  _QWORD v83[4];
  NSObject *v84;
  KCPairingChannel *v85;
  id v86;
  AAFAnalyticsEventSecurity *v87;
  void (**v88)(id, uint64_t, _QWORD, void *);
  _BYTE *v89;
  uint64_t *v90;
  id v91[5];
  _QWORD v92[4];
  AAFAnalyticsEventSecurity *v93;
  id v94;
  _BYTE *v95;
  uint64_t *v96;
  char *v97;
  void *v98;
  char *v99;
  void *v100;
  _QWORD v101[6];
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  char v109;
  id location;
  _BYTE v111[24];
  int v112;
  _BYTE buf[24];
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  const __CFString *v117;
  _QWORD v118[4];

  v118[1] = *MEMORY[0x24BDAC8D0];
  v76 = a3;
  v75 = (void (**)(id, uint64_t, _QWORD, void *))a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  secLogObjForScope("pairing");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v6, OS_LOG_TYPE_DEFAULT, "acceptor packet 1", buf, 2u);
  }

  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0, 0);
  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && -[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    v7 = 3;
  }
  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    v7 = 2;
  }
  else
  {
    v7 = -[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS");
  }
  v8 = [AAFAnalyticsEventSecurity alloc];
  v117 = CFSTR("supportedTrustSystem");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, &v117, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "flowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceSessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v65) = 1;
  v74 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v8, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", v10, v12, v14, v16, CFSTR("com.apple.security.acceptorCreatesPacket2"), metricsAreEnabled, v65, &unk_24C7BFD20);

  v106 = 0;
  v107 = &v106;
  v108 = 0x2020000000;
  v109 = 0;
  _OctagonSignpostLogSystem();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (char *)_OctagonSignpostCreate();
  v20 = v19;

  _OctagonSignpostLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  v23 = (unint64_t)(v18 - 1);
  if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v22, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "PairingChannelAcceptorMessage1", " enableTelemetry=YES ", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v18;
    _os_log_impl(&dword_20D7B6000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorMessage1  enableTelemetry=YES ", buf, 0xCu);
  }

  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && !-[KCPairingChannel ensureControlChannel](self, "ensureControlChannel"))
  {
    secLogObjForScope("pairing");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v41, OS_LOG_TYPE_DEFAULT, "unable to establish a channel to sos control", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 1, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v31, v75);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v74, 0, v31);
    Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      v45 = *((unsigned __int8 *)v107 + 24);
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = v45;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v44, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v18, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v46 = *((unsigned __int8 *)v107 + 24);
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v114) = v46;
      _os_log_impl(&dword_20D7B6000, v32, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 0x1Cu);
    }
  }
  else
  {
    if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS"))
    {
      objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("d"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;

      if (!v26)
      {
        secLogObjForScope("pairing");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D7B6000, v27, OS_LOG_TYPE_DEFAULT, "acceptor initialSyncCredentials requested", buf, 2u);
        }

        -[KCPairingChannel setAcceptorWillSendInitialSyncCredentials:](self, "setAcceptorWillSendInitialSyncCredentials:", 1);
        -[KCPairingChannel setAcceptorInitialSyncCredentialsFlags:](self, "setAcceptorInitialSyncCredentialsFlags:", 11);
      }
    }
    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("o"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      secLogObjForScope("pairing");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v30, OS_LOG_TYPE_DEFAULT, "initiator didn't send a octagon packet, so skipping all octagon flows", buf, 2u);
      }

      -[KCPairingChannel setSessionSupportsOctagon:](self, "setSessionSupportsOctagon:", 0);
    }
    v31 = objc_alloc_init(MEMORY[0x24BDE84D8]);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    v102 = 0;
    v103 = &v102;
    v104 = 0x2020000000;
    v105 = 1;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v114 = __Block_byref_object_copy_;
    v115 = __Block_byref_object_dispose_;
    v116 = 0;
    -[KCPairingChannel otControl](self, "otControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel controlArguments](self, "controlArguments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x24BDAC760];
    v101[0] = MEMORY[0x24BDAC760];
    v101[1] = 3221225472;
    v101[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke;
    v101[3] = &unk_24C7B8F38;
    v101[4] = &v102;
    v101[5] = buf;
    objc_msgSend(v33, "fetchTrustStatus:configuration:reply:", v34, v31, v101);

    if (v103[3])
    {
      secLogObjForScope("SecError");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v111 = 0;
        _os_log_impl(&dword_20D7B6000, v36, OS_LOG_TYPE_DEFAULT, "pairing: device is not trusted, stopping the pairing flow", v111, 2u);
      }

      v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
      v38 = v37;
      if (!v37)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:description:", kKCPairingChannelErrorDomain, 8, CFSTR("device cannot support pairing, not trusted in Octagon"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v75[2](v75, 1, 0, v38);
      if (!v37)

    }
    else if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      secLogObjForScope("SecError");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v111 = 138412290;
        *(_QWORD *)&v111[4] = v40;
        _os_log_impl(&dword_20D7B6000, v39, OS_LOG_TYPE_DEFAULT, "pairing: failed to check trust status: %@", v111, 0xCu);
      }

      v75[2](v75, 1, 0, *(void **)(*(_QWORD *)&buf[8] + 40));
    }
    else if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS"))
    {
      _OctagonSignpostLogSystem();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = _OctagonSignpostCreate();
      v73 = v49;
      v50 = (char *)v48;

      _OctagonSignpostLogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if ((unint64_t)(v50 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)v111 = 0;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v52, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v50, "PairingChannelAcceptorFetchStashCredential", " enableTelemetry=YES ", v111, 2u);
      }

      _OctagonSignpostLogSystem();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v111 = 134217984;
        *(_QWORD *)&v111[4] = v50;
        _os_log_impl(&dword_20D7B6000, v53, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorFetchStashCredential  enableTelemetry=YES ", v111, 0xCu);
      }

      *(_QWORD *)v111 = 0;
      *(_QWORD *)&v111[8] = v111;
      *(_QWORD *)&v111[16] = 0x2020000000;
      LOBYTE(v112) = 0;
      -[KCPairingChannel connection](self, "connection");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = v35;
      v92[1] = 3221225472;
      v92[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_182;
      v92[3] = &unk_24C7B8DA8;
      v97 = v50;
      v98 = v73;
      v99 = v18;
      v100 = v20;
      v95 = v111;
      v96 = &v106;
      v68 = v74;
      v93 = v68;
      v67 = v75;
      v94 = v67;
      objc_msgSend(v72, "remoteObjectProxyWithErrorHandler:", v92);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "altDSID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "flowID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "deviceSessionID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = v35;
      v83[1] = 3221225472;
      v83[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_183;
      v83[3] = &unk_24C7B8F60;
      v89 = v111;
      v91[1] = v50;
      v91[2] = v73;
      v84 = v32;
      v85 = self;
      v86 = v76;
      v90 = &v106;
      v91[3] = v18;
      v91[4] = v20;
      v87 = v68;
      v88 = v67;
      objc_copyWeak(v91, &location);
      objc_msgSend(v69, "validatedStashedAccountCredential:flowID:deviceSessionID:canSendMetrics:complete:", v54, v66, v56, 1, v83);

      objc_destroyWeak(v91);
      _Block_object_dispose(v111, 8);
    }
    else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
    {
      v77[0] = v35;
      v77[1] = 3221225472;
      v77[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_187;
      v77[3] = &unk_24C7B8DD0;
      v80 = &v106;
      v81 = v18;
      v82 = v20;
      v78 = v74;
      v79 = v75;
      -[KCPairingChannel acceptorFirstOctagonPacket:reply:complete:](self, "acceptorFirstOctagonPacket:reply:complete:", v76, v32, v77);

    }
    else
    {
      secLogObjForScope("pairing");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v111 = 0;
        _os_log_impl(&dword_20D7B6000, v57, OS_LOG_TYPE_DEFAULT, "acceptor neither of octagon nor SOS", v111, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 6, 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v58, v75);
      v59 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v60;
      if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        v62 = *((unsigned __int8 *)v107 + 24);
        *(_DWORD *)v111 = 67240192;
        *(_DWORD *)&v111[4] = v62;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v61, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v18, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", v111, 8u);
      }

      _OctagonSignpostLogSystem();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v111 = 134218496;
        v64 = *((unsigned __int8 *)v107 + 24);
        *(_QWORD *)&v111[4] = v18;
        *(_WORD *)&v111[12] = 2048;
        *(double *)&v111[14] = (double)(unint64_t)v59 / 1000000000.0;
        *(_WORD *)&v111[22] = 1026;
        v112 = v64;
        _os_log_impl(&dword_20D7B6000, v63, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", v111, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v74, 0, v58);
    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v102, 8);
  }

  _Block_object_dispose(&v106, 8);
  objc_destroyWeak(&location);

}

- (BOOL)fetchEpoch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel otControl](self, "otControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __37__KCPairingChannel_fetchEpoch_error___block_invoke;
  v14[3] = &unk_24C7B8F88;
  v14[4] = self;
  v16 = &v20;
  objc_copyWeak(&v18, &location);
  v10 = v6;
  v15 = v10;
  v17 = &v26;
  objc_msgSend(v7, "rpcEpochWithArguments:configuration:reply:", v8, v9, v14);

  if (a4)
  {
    v11 = (void *)v21[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = *((_BYTE *)v27 + 24);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (void)acceptorFirstOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  const char *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("o"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    secLogObjForScope((const char *)pairingScope);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "acceptorFirstOctagonPacket octagon data missing";
LABEL_17:
      _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    }
LABEL_18:

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 4, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v14, v9);
    goto LABEL_24;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("v"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("O"));

  if (!v12)
  {
    secLogObjForScope((const char *)pairingScope);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "acceptorFirstOctagonPacket 'v' contents wrong";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v13 = 0;
  v14 = 0;
  while (1)
  {
    secLogObjForScope((const char *)pairingScope);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v13 + 1;
      _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "Attempt %d fetching epoch", buf, 8u);
    }

    v24 = 0;
    v16 = -[KCPairingChannel fetchEpoch:error:](self, "fetchEpoch:error:", v8, &v24);
    v14 = v24;
    if (v16)
    {
      (*((void (**)(id, _QWORD, id, _QWORD))v9 + 2))(v9, 0, v8, 0);
      goto LABEL_24;
    }
    if (!+[KCPairingChannel retryable:](KCPairingChannel, "retryable:", v14))
      break;
    secLogObjForScope((const char *)pairingScope);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v13 + 2;
      _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying fetching epoch", buf, 8u);
    }
    ++v13;

    if (v13 >= epochMaxRetry)
    {
      secLogObjForScope("SecError");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = epochMaxRetry;
      v19 = "pairing: failed to fetch epoch %d times, bailing.";
      v20 = v18;
      v21 = 8;
      goto LABEL_22;
    }
  }
  secLogObjForScope("SecError");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    goto LABEL_23;
  *(_DWORD *)buf = 136315650;
  v26 = pairingScope;
  v27 = 1024;
  v28 = v13 + 1;
  v29 = 2112;
  v30 = v14;
  v19 = "%s: Attempt %d failed fetching epoch: %@";
  v20 = v18;
  v21 = 28;
LABEL_22:
  _os_log_impl(&dword_20D7B6000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_23:

  (*((void (**)(id, uint64_t, _QWORD, id))v9 + 2))(v9, 1, 0, v14);
LABEL_24:

}

- (void)acceptorSecondPacket:(id)a3 complete:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  AAFAnalyticsEventSecurity *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  AAFAnalyticsEventSecurity *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  AAFAnalyticsEventSecurity *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  AAFAnalyticsEventSecurity *v47;
  id v48;
  _QWORD *v49;
  char *v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  AAFAnalyticsEventSecurity *v54;
  id v55;
  _QWORD *v56;
  __int128 *p_buf;
  _QWORD *v58;
  id v59[5];
  _QWORD v60[4];
  AAFAnalyticsEventSecurity *v61;
  id v62;
  _QWORD *v63;
  _QWORD *v64;
  char *v65;
  void *v66;
  char *v67;
  void *v68;
  _QWORD v69[3];
  char v70;
  _QWORD v71[3];
  char v72;
  id location;
  uint8_t v74[4];
  char *v75;
  __int128 buf;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v44 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0, 0);
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v72 = 0;
  _OctagonSignpostLogSystem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _OctagonSignpostCreate();
  v42 = v8;
  v9 = (char *)v7;

  _OctagonSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "PairingChannelAcceptorMessage2", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_20D7B6000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorMessage2  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  v13 = [AAFAnalyticsEventSecurity alloc];
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "flowID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deviceSessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v36) = 1;
  v43 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v13, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v15, v17, v19, CFSTR("com.apple.security.acceptorCreatesPacket4"), metricsAreEnabled, v36, &unk_24C7BFD20);

  secLogObjForScope("pairing");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_20D7B6000, v20, OS_LOG_TYPE_DEFAULT, "acceptor packet 2", (uint8_t *)&buf, 2u);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy_;
  v79 = __Block_byref_object_dispose_;
  v80 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v80 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("p"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2020000000;
    v70 = 0;
    _OctagonSignpostLogSystem();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = _OctagonSignpostCreate();
    v41 = v24;
    v25 = (char *)v23;

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)v74 = 0;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v27, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v25, "PairingChannelAcceptorCircleJoiningBlob", " enableTelemetry=YES ", v74, 2u);
    }

    _OctagonSignpostLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v74 = 134217984;
      v75 = v25;
      _os_log_impl(&dword_20D7B6000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorCircleJoiningBlob  enableTelemetry=YES ", v74, 0xCu);
    }

    -[KCPairingChannel connection](self, "connection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke;
    v60[3] = &unk_24C7B8DA8;
    v65 = v25;
    v66 = v41;
    v67 = v9;
    v68 = v42;
    v63 = v69;
    v64 = v71;
    v29 = v43;
    v61 = v29;
    v30 = v44;
    v62 = v30;
    objc_msgSend(v40, "remoteObjectProxyWithErrorHandler:", v60);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "altDSID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "flowID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "deviceSessionID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_191;
    v52[3] = &unk_24C7B8FB0;
    v59[1] = v25;
    v59[2] = v41;
    v56 = v69;
    v52[4] = self;
    p_buf = &buf;
    v53 = v45;
    v58 = v71;
    v59[3] = v9;
    v59[4] = v42;
    v54 = v29;
    v55 = v30;
    objc_copyWeak(v59, &location);
    objc_msgSend(v38, "circleJoiningBlob:flowID:deviceSessionID:canSendMetrics:applicant:complete:", v37, v32, v34, 1, v21, v52);

    objc_destroyWeak(v59);
    _Block_object_dispose(v69, 8);
  }
  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    v35 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_194;
    v46[3] = &unk_24C7B8DD0;
    v49 = v71;
    v50 = v9;
    v51 = v42;
    v47 = v43;
    v48 = v44;
    -[KCPairingChannel acceptorSecondOctagonPacket:reply:complete:](self, "acceptorSecondOctagonPacket:reply:complete:", v45, v35, v46);

  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v71, 8);
  objc_destroyWeak(&location);

}

- (BOOL)fetchVoucher:(id)a3 prepare:(id)a4 eventS:(id)a5 finishedPairing:(BOOL *)a6 maxCapability:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  id v36[2];
  id location;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v30 = a7;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel otControl](self, "otControl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "peerID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "permanentInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "permanentInfoSig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stableInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stableInfoSig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke;
  v31[3] = &unk_24C7B8FD8;
  v31[4] = self;
  v22 = v14;
  v32 = v22;
  v34 = &v38;
  objc_copyWeak(v36, &location);
  v21 = v12;
  v33 = v21;
  v35 = &v44;
  v36[1] = a6;
  objc_msgSend(v28, "rpcVoucherWithArguments:configuration:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:maxCapability:reply:", v26, v25, v24, v23, v15, v16, v17, v30, v31);

  if (a8)
  {
    v18 = (void *)v39[5];
    if (v18)
      *a8 = objc_retainAutorelease(v18);
  }
  v19 = *((_BYTE *)v45 + 24);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v19;
}

- (void)acceptorSecondOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  AAFAnalyticsEventSecurity *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AAFAnalyticsEventSecurity *v17;
  void *v18;
  OTPairingMessage *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unsigned __int8 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  int v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v41 = a4;
  v9 = a5;
  v10 = [AAFAnalyticsEventSecurity alloc];
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "flowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deviceSessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = 1;
  v17 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v10, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v12, v14, v16, CFSTR("com.apple.security.acceptorCreatesVoucher"), metricsAreEnabled, v37, &unk_24C7BFD20);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("o"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = -[OTPairingMessage initWithData:]([OTPairingMessage alloc], "initWithData:", v18);
    if (-[OTPairingMessage hasPrepare](v19, "hasPrepare"))
    {
      v38 = v18;
      -[OTPairingMessage prepare](v19, "prepare");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "capability");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "capability");
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v24 = CFSTR("full");
      }
      v39 = v9;
      v40 = v8;
      secLogObjForScope((const char *)pairingScope);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = (uint64_t)v24;
        _os_log_impl(&dword_20D7B6000, v27, OS_LOG_TYPE_DEFAULT, "acceptor channel max capability set to %@", buf, 0xCu);
      }

      v28 = 0;
      v29 = 0;
      while (1)
      {
        secLogObjForScope((const char *)pairingScope);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = v29 + 1;
          _os_log_impl(&dword_20D7B6000, v30, OS_LOG_TYPE_DEFAULT, "Attempt %d fetching voucher", buf, 8u);
        }

        v42 = 0;
        v31 = -[KCPairingChannel fetchVoucher:prepare:eventS:finishedPairing:maxCapability:error:](self, "fetchVoucher:prepare:eventS:finishedPairing:maxCapability:error:", v41, v20, v17, &v43, v24, &v42);
        v28 = v42;
        if (v31)
        {
          v9 = v39;
          (*((void (**)(id, _QWORD, id, _QWORD))v39 + 2))(v39, v43, v41, 0);
          goto LABEL_29;
        }
        if (!+[KCPairingChannel retryable:](KCPairingChannel, "retryable:", v28))
          break;
        secLogObjForScope((const char *)pairingScope);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = v29 + 2;
          _os_log_impl(&dword_20D7B6000, v32, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying fetching voucher", buf, 8u);
        }
        ++v29;

        if (v29 >= vouchMaxRetry)
        {
          secLogObjForScope("SecError");
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            goto LABEL_28;
          *(_DWORD *)buf = 67109120;
          LODWORD(v45) = vouchMaxRetry;
          v34 = "pairing: failed to fetch voucher %d times, bailing.";
          v35 = v33;
          v36 = 8;
          goto LABEL_27;
        }
      }
      secLogObjForScope("SecError");
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)buf = 136315650;
      v45 = pairingScope;
      v46 = 1024;
      v47 = v29 + 1;
      v48 = 2112;
      v49 = v28;
      v34 = "%s Attempt %d failed fetching voucher: %@";
      v35 = v33;
      v36 = 28;
LABEL_27:
      _os_log_impl(&dword_20D7B6000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
LABEL_28:

      v9 = v39;
      (*((void (**)(id, uint64_t, _QWORD, id))v39 + 2))(v39, 1, 0, v28);
LABEL_29:
      v18 = v38;

      v8 = v40;
    }
    else
    {
      secLogObjForScope("SecError");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v26, OS_LOG_TYPE_DEFAULT, "ot-pairing: acceptorSecondOctagonPacket: no octagon message", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 4, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v20, v9);
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v17, 0, v20);
    }

  }
  else
  {
    secLogObjForScope((const char *)pairingScope);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v25, OS_LOG_TYPE_DEFAULT, "acceptorSecondOctagonPacket octagon data missing", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 4, 0);
    v19 = (OTPairingMessage *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v19, v9);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v17, 0, v19);
  }

}

- (void)acceptorThirdPacket:(id)a3 complete:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  AAFAnalyticsEventSecurity *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AAFAnalyticsEventSecurity *v22;
  AAFAnalyticsEventSecurity *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AAFAnalyticsEventSecurity *v31;
  id v32;
  uint64_t v33;
  unsigned int v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  AAFAnalyticsEventSecurity *v40;
  id v41;
  uint8_t *v42;
  os_signpost_id_t v43;
  uint64_t v44;
  _QWORD v45[4];
  AAFAnalyticsEventSecurity *v46;
  id v47;
  uint8_t *v48;
  os_signpost_id_t v49;
  uint64_t v50;
  uint8_t buf[8];
  uint8_t *v52;
  uint64_t v53;
  char v54;
  uint8_t v55[4];
  os_signpost_id_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v6 = a4;
  secLogObjForScope("pairing");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "acceptor packet 3", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v52 = buf;
  v53 = 0x2020000000;
  v54 = 0;
  _OctagonSignpostLogSystem();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _OctagonSignpostCreate();
  v38 = v10;
  v11 = v9;

  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v55 = 0;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PairingChannelAcceptorMessage3", " enableTelemetry=YES ", v55, 2u);
  }

  _OctagonSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v55 = 134217984;
    v56 = v11;
    _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PairingChannelAcceptorMessage3  enableTelemetry=YES ", v55, 0xCu);
  }

  v15 = [AAFAnalyticsEventSecurity alloc];
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "altDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "flowID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceSessionID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = 1;
  v22 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:](v15, "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v17, v19, v21, CFSTR("com.apple.security.acceptorCreatesPacket5"), metricsAreEnabled, v33, &unk_24C7BFD20);

  v34 = -[KCPairingChannel acceptorInitialSyncCredentialsFlags](self, "acceptorInitialSyncCredentialsFlags");
  -[KCPairingChannel connection](self, "connection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke;
  v45[3] = &unk_24C7B8EE8;
  v49 = v11;
  v50 = v38;
  v48 = buf;
  v23 = v22;
  v46 = v23;
  v24 = v6;
  v47 = v24;
  objc_msgSend(v37, "remoteObjectProxyWithErrorHandler:", v45);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "altDSID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "flowID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "deviceSessionID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_198;
  v39[3] = &unk_24C7B9000;
  v42 = buf;
  v43 = v11;
  v44 = v38;
  v31 = v23;
  v40 = v31;
  v32 = v24;
  v41 = v32;
  objc_msgSend(v36, "initialSyncCredentials:altDSID:flowID:deviceSessionID:canSendMetrics:complete:", v34, v26, v28, v30, 1, v39);

  _Block_object_dispose(buf, 8);
}

- (BOOL)ensureControlChannel
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[KCPairingChannel connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CCFA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.securityd.sos"), 0);
  -[KCPairingChannel setConnection:](self, "setConnection:", v6);

  -[KCPairingChannel connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7 != 0;

  if (v7)
  {
    -[KCPairingChannel connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v5);

    -[KCPairingChannel connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");

  }
  return v4;
}

- (void)validateStart:(id)a3
{
  id v4;
  NSObject *v5;
  id *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;

  v4 = a3;
  if (-[KCPairingChannel initiator](self, "initiator"))
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__KCPairingChannel_validateStart___block_invoke_3;
    block[3] = &unk_24C7B9078;
    v6 = &v14;
    v14 = v4;
    v7 = v4;
    dispatch_async(v5, block);
  }
  else
  {
    -[KCPairingChannel connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __34__KCPairingChannel_validateStart___block_invoke;
    v17[3] = &unk_24C7B9028;
    v6 = (id *)&v18;
    v10 = v4;
    v18 = v10;
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __34__KCPairingChannel_validateStart___block_invoke_2;
    v15[3] = &unk_24C7B9050;
    v16 = v10;
    v12 = v10;
    objc_msgSend(v11, "stashedCredentialPublicKey:", v15);

    v5 = v16;
  }

}

- (void)exchangePacket:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSObject *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  secLogObjForScope("pairing");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v21 = -[KCPairingChannel counter](self, "counter");
    _os_log_impl(&dword_20D7B6000, v8, OS_LOG_TYPE_DEFAULT, "Exchange packet: %u", buf, 8u);
  }

  -[KCPairingChannel setCounter:](self, "setCounter:", -[KCPairingChannel counter](self, "counter") + 1);
  if (!v6)
  {
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend((id)objc_opt_class(), "pairingChannelDecompressData:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v9, 512, 0, &v19);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;

LABEL_8:
      -[KCPairingChannel nextState](self, "nextState");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __44__KCPairingChannel_exchangePacket_complete___block_invoke;
      v17[3] = &unk_24C7B90A0;
      v17[4] = self;
      v18 = v7;
      ((void (**)(_QWORD, void *, _QWORD *))v13)[2](v13, v12, v17);

      goto LABEL_15;
    }
    v15 = v19;
    secLogObjForScope("pairing");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v16, OS_LOG_TYPE_DEFAULT, "failed to deserialize", buf, 2u);
    }

    (*((void (**)(id, uint64_t, _QWORD, id))v7 + 2))(v7, 1, 0, v15);
  }
  else
  {
    secLogObjForScope("pairing");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "failed to decompress", buf, 2u);
    }

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 1, 0, 0);
  }
LABEL_15:

}

- (id)exchangePacket:(id)a3 complete:(BOOL *)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = dispatch_semaphore_create(0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__KCPairingChannel_exchangePacket_complete_error___block_invoke;
  v13[3] = &unk_24C7B90C8;
  v16 = &v18;
  v17 = a4;
  v15 = &v24;
  v10 = v9;
  v14 = v10;
  -[KCPairingChannel exchangePacket:complete:](self, "exchangePacket:complete:", v8, v13);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (BOOL)needInitialSync
{
  return self->_needInitialSync;
}

- (KCPairingChannelContext)peerVersionContext
{
  return self->_peerVersionContext;
}

- (void)setPeerVersionContext:(id)a3
{
  objc_storeStrong((id *)&self->_peerVersionContext, a3);
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (BOOL)acceptorWillSendInitialSyncCredentials
{
  return self->_acceptorWillSendInitialSyncCredentials;
}

- (void)setAcceptorWillSendInitialSyncCredentials:(BOOL)a3
{
  self->_acceptorWillSendInitialSyncCredentials = a3;
}

- (unsigned)acceptorInitialSyncCredentialsFlags
{
  return self->_acceptorInitialSyncCredentialsFlags;
}

- (void)setAcceptorInitialSyncCredentialsFlags:(unsigned int)a3
{
  self->_acceptorInitialSyncCredentialsFlags = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OTControl)otControl
{
  return (OTControl *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOtControl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)nextOctagonState
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setNextOctagonState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)nextState
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (OTJoiningConfiguration)joiningConfiguration
{
  return self->_joiningConfiguration;
}

- (void)setJoiningConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_joiningConfiguration, a3);
}

- (OTControlArguments)controlArguments
{
  return self->_controlArguments;
}

- (void)setControlArguments:(id)a3
{
  objc_storeStrong((id *)&self->_controlArguments, a3);
}

- (BOOL)testFailSOS
{
  return self->_testFailSOS;
}

- (void)setTestFailSOS:(BOOL)a3
{
  self->_testFailSOS = a3;
}

- (BOOL)testFailOctagon
{
  return self->_testFailOctagon;
}

- (void)setTestFailOctagon:(BOOL)a3
{
  self->_testFailOctagon = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)sessionSupportsSOS
{
  return self->_sessionSupportsSOS;
}

- (void)setSessionSupportsSOS:(BOOL)a3
{
  self->_sessionSupportsSOS = a3;
}

- (BOOL)sessionSupportsOctagon
{
  return self->_sessionSupportsOctagon;
}

- (void)setSessionSupportsOctagon:(BOOL)a3
{
  self->_sessionSupportsOctagon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_controlArguments, 0);
  objc_storeStrong((id *)&self->_joiningConfiguration, 0);
  objc_storeStrong(&self->_nextState, 0);
  objc_storeStrong(&self->_nextOctagonState, 0);
  objc_storeStrong((id *)&self->_otControl, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_peerVersionContext, 0);
}

void __50__KCPairingChannel_exchangePacket_complete_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  **(_BYTE **)(a1 + 56) = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__KCPairingChannel_exchangePacket_complete___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v8 = 0;
    v11 = 0;
    goto LABEL_16;
  }
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  v10 = v9;
  if (v7 && !v8)
  {
    v11 = 0;
    v12 = v7;
    v7 = v9;
LABEL_13:

    goto LABEL_15;
  }
  if (!v8)
  {
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "pairingChannelCompressData:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = "initiator";
    if (!*(_BYTE *)(v13 + 9))
      v14 = "acceptor";
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.ckks.pairing.packet-size.%s.%u"), v14, *(unsigned int *)(v13 + 16));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDE84E8];
    v24 = *MEMORY[0x24BDE8A00];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendEvent:event:", v12, v16);

    secLogObjForScope("pairing");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v11, "length");
      *(_DWORD *)buf = 134217984;
      v23[0] = v18;
      _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "pairing packet size %lu", buf, 0xCu);
    }

    goto LABEL_13;
  }
LABEL_15:

LABEL_16:
  secLogObjForScope("pairing");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v23[0]) = v8 != 0;
    WORD2(v23[0]) = 2112;
    *(_QWORD *)((char *)v23 + 6) = v7;
    _os_log_impl(&dword_20D7B6000, v19, OS_LOG_TYPE_DEFAULT, "Exchange packet complete data: %{BOOL}d: %@", buf, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelAcceptorMessage3", " OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", (uint8_t *)&v11, 8u);
  }

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v12 = a1[7];
    v13 = 2048;
    v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v15 = 1026;
    v16 = v10;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage3  OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", (uint8_t *)&v11, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], 0, v3);
  (*(void (**)(void))(a1[5] + 16))();

}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_198(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t Nanoseconds;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  int v14;
  NSObject *v15;
  int v16;
  int v17;
  _BYTE v18[18];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  secLogObjForScope("pairing");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109378;
    *(_DWORD *)v18 = objc_msgSend(v5, "count");
    *(_WORD *)&v18[4] = 2112;
    *(_QWORD *)&v18[6] = v6;
    _os_log_impl(&dword_20D7B6000, v8, OS_LOG_TYPE_DEFAULT, "acceptor initialSyncCredentials complete: items %u: %@", (uint8_t *)&v17, 0x12u);
  }

  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("d"));
  secLogObjForScope("pairing");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 3", (uint8_t *)&v17, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = a1[7];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v17 = 67240192;
    *(_DWORD *)v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PairingChannelAcceptorMessage3", " OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", (uint8_t *)&v17, 8u);
  }

  _OctagonSignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218496;
    v16 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    *(_QWORD *)v18 = a1[7];
    *(_WORD *)&v18[8] = 2048;
    *(double *)&v18[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v16;
    _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage3  OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ", (uint8_t *)&v17, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], v6 != 0, v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  id v13;
  OTPairingMessage *v14;
  NSObject *v15;
  int v16;
  char v17;
  OTSupportSOSMessage *v18;
  OTSupportOctagonMessage *v19;
  OTSponsorToApplicantRound2M2 *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9 || objc_msgSend(*(id *)(a1 + 32), "testFailOctagon"))
  {
    secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "counter");
      *(_DWORD *)buf = 67109120;
      v31 = v11;
      _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "error acceptor handling octagon packet %d", buf, 8u);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 0, v9);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = v9;
    v14 = *(OTPairingMessage **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else
  {
    secLogObjForScope((const char *)pairingScope);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(*(id *)(a1 + 32), "counter");
      *(_DWORD *)buf = 67109120;
      v31 = v16;
      _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "acceptor handled octagon packet %d", buf, 8u);
    }

    if (SOSCCIsSOSTrustAndSyncingEnabled()
      && objc_msgSend(*(id *)(a1 + 32), "acceptorWillSendInitialSyncCredentials"))
    {
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_195;
      v28[3] = &unk_24C7B8D58;
      objc_copyWeak(&v29, (id *)(a1 + 72));
      objc_msgSend(*(id *)(a1 + 32), "setNextState:", v28);
      objc_destroyWeak(&v29);
      v17 = 0;
    }
    else
    {
      v17 = 1;
    }
    v14 = objc_alloc_init(OTPairingMessage);
    v18 = objc_alloc_init(OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v14, "setSupportsSOS:", v18);

    v19 = objc_alloc_init(OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v14, "setSupportsOctagon:", v19);

    v20 = objc_alloc_init(OTSponsorToApplicantRound2M2);
    -[OTPairingMessage setVoucher:](v14, "setVoucher:", v20);

    -[OTPairingMessage voucher](v14, "voucher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setVoucher:", v7);

    -[OTPairingMessage voucher](v14, "voucher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setVoucherSignature:", v8);

    if (SOSCCIsSOSTrustAndSyncingEnabled())
      v23 = 1;
    else
      v23 = 2;
    -[OTPairingMessage supportsSOS](v14, "supportsSOS");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSupported:", v23);

    -[OTPairingMessage supportsOctagon](v14, "supportsOctagon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSupported:", 1);

    if (objc_msgSend(*(id *)(a1 + 32), "acceptorWillSendInitialSyncCredentials"))
      objc_msgSend(*(id *)(a1 + 32), "setAcceptorInitialSyncCredentialsFlags:", objc_msgSend(*(id *)(a1 + 32), "acceptorInitialSyncCredentialsFlags") & 0xFFFFFFFCLL);
    -[OTPairingMessage data](v14, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v26, CFSTR("o"));

    secLogObjForScope("pairing");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v27, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 2", buf, 2u);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 1, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    **(_BYTE **)(a1 + 80) = v17;
  }

}

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "acceptorThirdPacket:complete:", v6, v5);

}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelAcceptorCircleJoiningBlob", " OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[8];
    v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 134218496;
    v20 = v10;
    v21 = 2048;
    v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v23 = 1026;
    v24 = v11;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorCircleJoiningBlob  OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", (uint8_t *)&v19, 0x1Cu);
  }

  v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v16 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218496;
    v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v20 = a1[10];
    v21 = 2048;
    v22 = (double)(unint64_t)v12 / 1000000000.0;
    v23 = 1026;
    v24 = v18;
    _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], 0, v3);
  (*(void (**)(void))(a1[5] + 16))();

}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_191(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  int v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  int v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  id v45;
  uint64_t v46;
  __int128 v47;
  uint8_t buf[4];
  _BYTE v49[18];
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 96);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v49 = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorCircleJoiningBlob", " OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 96);
    v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v49 = v14;
    *(_WORD *)&v49[8] = 2048;
    *(double *)&v49[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v50 = 1026;
    v51 = v15;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorCircleJoiningBlob  OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ", buf, 0x1Cu);
  }

  if (v5)
  {
    secLogObjForScope("pairing");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "acceptorWillSendInitialSyncCredentials");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v49 = v17;
      *(_WORD *)&v49[4] = 2112;
      *(_QWORD *)&v49[6] = v7;
      _os_log_impl(&dword_20D7B6000, v16, OS_LOG_TYPE_DEFAULT, "acceptor pairing complete (will send: %{BOOL}d): %@", buf, 0x12u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v5, CFSTR("b"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "sessionSupportsOctagon"))
  {
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 80);
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_192;
    v43[3] = &unk_24C7B8DD0;
    v46 = v20;
    v47 = *(_OWORD *)(a1 + 112);
    v44 = *(id *)(a1 + 48);
    v45 = *(id *)(a1 + 56);
    objc_msgSend(v18, "acceptorSecondOctagonPacket:reply:complete:", v19, v21, v43);

    v22 = v44;
  }
  else
  {
    secLogObjForScope("pairing");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v23, OS_LOG_TYPE_DEFAULT, "posting kSOSCCCircleOctagonKeysChangedNotification", buf, 2u);
    }

    notify_post((const char *)*MEMORY[0x24BDE8EE8]);
    if (objc_msgSend(*(id *)(a1 + 32), "acceptorWillSendInitialSyncCredentials"))
    {
      v38 = MEMORY[0x24BDAC760];
      v39 = 3221225472;
      v40 = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_193;
      v41 = &unk_24C7B8D58;
      objc_copyWeak(&v42, (id *)(a1 + 88));
      objc_msgSend(*(id *)(a1 + 32), "setNextState:", &v38);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      v24 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = *(_QWORD *)(a1 + 112);
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        v28 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v49 = v28;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v30 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_QWORD *)v49 = *(_QWORD *)(a1 + 112);
        *(_WORD *)&v49[8] = 2048;
        *(double *)&v49[10] = (double)(unint64_t)v24 / 1000000000.0;
        v50 = 1026;
        v51 = v30;
        _os_log_impl(&dword_20D7B6000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 48), 1, 0, v38, v39, v40, v41);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_destroyWeak(&v42);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      v31 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = *(_QWORD *)(a1 + 112);
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        v35 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v49 = v35;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v33, OS_SIGNPOST_INTERVAL_END, v34, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v37 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_QWORD *)v49 = *(_QWORD *)(a1 + 112);
        *(_WORD *)&v49[8] = 2048;
        *(double *)&v49[10] = (double)(unint64_t)v31 / 1000000000.0;
        v50 = 1026;
        v51 = v37;
        _os_log_impl(&dword_20D7B6000, v36, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 48), 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    secLogObjForScope("pairing");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 2", buf, 2u);
    }
  }

}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_194(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_192(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage2", " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "acceptorThirdPacket:complete:", v6, v5);

}

void __37__KCPairingChannel_fetchEpoch_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v11;
  OTPairingMessage *v12;
  OTSupportSOSMessage *v13;
  OTSupportOctagonMessage *v14;
  OTSponsorToApplicantRound1M2 *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  secLogObjForScope("pairing");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = a2;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "acceptor rpcEpochWithArguments: %ld (%@)", buf, 0x16u);
  }

  if (v6 || objc_msgSend(*(id *)(a1 + 32), "testFailOctagon"))
  {
    secLogObjForScope("SecError");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "counter");
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v9;
      _os_log_impl(&dword_20D7B6000, v8, OS_LOG_TYPE_DEFAULT, "error acceptor handling packet %d", buf, 8u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    secLogObjForScope((const char *)pairingScope);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "counter");
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v11;
      _os_log_impl(&dword_20D7B6000, v10, OS_LOG_TYPE_DEFAULT, "acceptor handled packet %d", buf, 8u);
    }

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __37__KCPairingChannel_fetchEpoch_error___block_invoke_188;
    v23[3] = &unk_24C7B8D58;
    objc_copyWeak(&v24, (id *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "setNextState:", v23);
    v12 = objc_alloc_init(OTPairingMessage);
    v13 = objc_alloc_init(OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v12, "setSupportsSOS:", v13);

    v14 = objc_alloc_init(OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v12, "setSupportsOctagon:", v14);

    v15 = objc_alloc_init(OTSponsorToApplicantRound1M2);
    -[OTPairingMessage setEpoch:](v12, "setEpoch:", v15);

    -[OTPairingMessage epoch](v12, "epoch");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEpoch:", a2);

    LODWORD(v16) = SOSCCIsSOSTrustAndSyncingEnabled();
    -[OTPairingMessage supportsSOS](v12, "supportsSOS");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if ((_DWORD)v16)
      v19 = 1;
    else
      v19 = 2;
    objc_msgSend(v17, "setSupported:", v19);

    -[OTPairingMessage supportsOctagon](v12, "supportsOctagon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSupported:", 1);

    -[OTPairingMessage data](v12, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v21, CFSTR("o"));

    secLogObjForScope((const char *)pairingScope);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 1", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_destroyWeak(&v24);
  }

}

void __37__KCPairingChannel_fetchEpoch_error___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "acceptorSecondPacket:complete:", v6, v5);

}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, int a5, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_182(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelAcceptorFetchStashCredential", " OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[8];
    v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 134218496;
    v20 = v10;
    v21 = 2048;
    v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v23 = 1026;
    v24 = v11;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorFetchStashCredential  OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", (uint8_t *)&v19, 0x1Cu);
  }

  v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v16 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218496;
    v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v20 = a1[10];
    v21 = 2048;
    v22 = (double)(unint64_t)v12 / 1000000000.0;
    v23 = 1026;
    v24 = v18;
    _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], 0, v3);
  (*(void (**)(void))(a1[5] + 16))();

}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  int v33;
  NSObject *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;
  __int128 v50;
  uint8_t buf[4];
  _BYTE v52[18];
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  secLogObjForScope("pairing");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v5 != 0;
    *(_WORD *)&v52[4] = 2112;
    *(_QWORD *)&v52[6] = v6;
    _os_log_impl(&dword_20D7B6000, v7, OS_LOG_TYPE_DEFAULT, "acceptor validatedStashedAccountCredential: %{BOOL}d (%@)", buf, 0x12u);
  }

  if (v5 && !v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 96);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v52 = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorFetchStashCredential", " OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 96);
    v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v52 = v14;
    *(_WORD *)&v52[8] = 2048;
    *(double *)&v52[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v53 = 1026;
    v54 = v15;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorFetchStashCredential  OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ", buf, 0x1Cu);
  }

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("c"));
    if (objc_msgSend(*(id *)(a1 + 40), "acceptorWillSendInitialSyncCredentials"))
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("d"));
    if (objc_msgSend(*(id *)(a1 + 40), "sessionSupportsOctagon"))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(a1 + 40);
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_184;
      v46[3] = &unk_24C7B8DD0;
      v49 = *(_QWORD *)(a1 + 80);
      v50 = *(_OWORD *)(a1 + 112);
      v18 = *(_QWORD *)(a1 + 48);
      v47 = *(id *)(a1 + 56);
      v48 = *(id *)(a1 + 64);
      objc_msgSend(v16, "acceptorFirstOctagonPacket:reply:complete:", v18, v17, v46);

    }
    else
    {
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_185;
      v44[3] = &unk_24C7B8D58;
      objc_copyWeak(&v45, (id *)(a1 + 88));
      objc_msgSend(*(id *)(a1 + 40), "setNextState:", v44);
      secLogObjForScope("pairing");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v28, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 1", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      v29 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v30;
      v32 = *(_QWORD *)(a1 + 112);
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        v33 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v52 = v33;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v31, OS_SIGNPOST_INTERVAL_END, v32, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v35 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_QWORD *)v52 = *(_QWORD *)(a1 + 112);
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = (double)(unint64_t)v29 / 1000000000.0;
        v53 = 1026;
        v54 = v35;
        _os_log_impl(&dword_20D7B6000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 56), 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      objc_destroyWeak(&v45);
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "sessionSupportsOctagon")
         && !objc_msgSend(*(id *)(a1 + 40), "testFailSOS"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "sessionSupportsOctagon"))
    {
      v37 = *(_QWORD *)(a1 + 32);
      v36 = *(void **)(a1 + 40);
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_186;
      v39[3] = &unk_24C7B8DD0;
      v42 = *(_QWORD *)(a1 + 80);
      v43 = *(_OWORD *)(a1 + 112);
      v38 = *(_QWORD *)(a1 + 48);
      v40 = *(id *)(a1 + 56);
      v41 = *(id *)(a1 + 64);
      objc_msgSend(v36, "acceptorFirstOctagonPacket:reply:complete:", v38, v37, v39);

    }
  }
  else
  {
    secLogObjForScope("pairing");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v52 = v6;
      _os_log_impl(&dword_20D7B6000, v19, OS_LOG_TYPE_DEFAULT, "acceptor doesn't have a stashed credential: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kKCPairingChannelErrorDomain, 7, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setNextStateError:complete:", v20, *(_QWORD *)(a1 + 64));
    v21 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = *(_QWORD *)(a1 + 112);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v52 = v25;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v27 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      *(_QWORD *)v52 = *(_QWORD *)(a1 + 112);
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = (double)(unint64_t)v21 / 1000000000.0;
      v53 = 1026;
      v54 = v27;
      _os_log_impl(&dword_20D7B6000, v26, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 56), 0, v20);
  }

}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_187(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_184(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "acceptorSecondPacket:complete:", v6, v5);

}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_186(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelAcceptorMessage1", " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorMessage4", " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", (uint8_t *)&v11, 8u);
  }

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v12 = a1[7];
    v13 = 2048;
    v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v15 = 1026;
    v16 = v10;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", (uint8_t *)&v11, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], 0, v3);
  (*(void (**)(void))(a1[5] + 16))();

}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_177(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  NSObject *v12;
  int v13;
  int v14;
  _BYTE v15[18];
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  secLogObjForScope("pairing");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109378;
    *(_DWORD *)v15 = a2;
    *(_WORD *)&v15[4] = 2112;
    *(_QWORD *)&v15[6] = v5;
    _os_log_impl(&dword_20D7B6000, v6, OS_LOG_TYPE_DEFAULT, "initiator importInitialSyncCredentials: %{BOOL}d: %@", (uint8_t *)&v14, 0x12u);
  }

  if ((_DWORD)a2)
    *(_BYTE *)(a1[4] + 8) = 0;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[8];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v14 = 67240192;
    *(_DWORD *)v15 = v11;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PairingChannelInitiatorMessage4", " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", (uint8_t *)&v14, 8u);
  }

  _OctagonSignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218496;
    v13 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    *(_QWORD *)v15 = a1[8];
    *(_WORD *)&v15[8] = 2048;
    *(double *)&v15[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v16 = 1026;
    v17 = v13;
    _os_log_impl(&dword_20D7B6000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ", (uint8_t *)&v14, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[5], a2, v5);
  (*(void (**)(void))(a1[6] + 16))();

}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorJoinSOS", " OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[8];
    v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 134218496;
    v20 = v10;
    v21 = 2048;
    v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v23 = 1026;
    v24 = v11;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorJoinSOS  OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", (uint8_t *)&v19, 0x1Cu);
  }

  v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v16 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218496;
    v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v20 = a1[10];
    v21 = 2048;
    v22 = (double)(unint64_t)v12 / 1000000000.0;
    v23 = 1026;
    v24 = v18;
    _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], 0, v3);
  (*(void (**)(void))(a1[5] + 16))();

}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_174(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  unsigned __int8 *WeakRetained;
  NSObject *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  int v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  int v39;
  NSObject *v40;
  int v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  _BYTE v45[18];
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5 && a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)v45 = v10;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PairingChannelInitiatorJoinSOS", " OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 80);
    v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)v45 = v12;
    *(_WORD *)&v45[8] = 2048;
    *(double *)&v45[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v46 = 1026;
    v47 = v13;
    _os_log_impl(&dword_20D7B6000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorJoinSOS  OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ", buf, 0x1Cu);
  }

  if (v5 || objc_msgSend(*(id *)(a1 + 32), "testFailSOS"))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "sessionSupportsOctagon");
    secLogObjForScope("pairing");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "failed to join circle with blob, continuing to handle octagon protocol", buf, 2u);
      }

    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "failed to join circle with blob", buf, 2u);
      }

      v17 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = *(_QWORD *)(a1 + 96);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        v21 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v45 = v21;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v23 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_QWORD *)v45 = *(_QWORD *)(a1 + 96);
        *(_WORD *)&v45[8] = 2048;
        *(double *)&v45[10] = (double)(unint64_t)v17 / 1000000000.0;
        v46 = 1026;
        v47 = v23;
        _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 0, v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "sessionSupportsOctagon"))
  {
    secLogObjForScope("pairing");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v24, OS_LOG_TYPE_DEFAULT, "initiator circle join complete", buf, 2u);
    }

  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "sessionSupportsOctagon") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "waitForOctagonUpgrade");
    WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 72));
    secLogObjForScope("pairing");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = WeakRetained[10];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v45 = v27;
      *(_WORD *)&v45[4] = 2112;
      *(_QWORD *)&v45[6] = 0;
      _os_log_impl(&dword_20D7B6000, v26, OS_LOG_TYPE_DEFAULT, "initiator circle join complete, more data: %{BOOL}d: %@", buf, 0x12u);
    }

    if (WeakRetained[10])
    {
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_175;
      v42[3] = &unk_24C7B8D58;
      objc_copyWeak(&v43, (id *)(a1 + 72));
      objc_msgSend(WeakRetained, "setNextState:", v42);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v28 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = *(_QWORD *)(a1 + 96);
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        v32 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v45 = v32;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v34 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_QWORD *)v45 = *(_QWORD *)(a1 + 96);
        *(_WORD *)&v45[8] = 2048;
        *(double *)&v45[10] = (double)(unint64_t)v28 / 1000000000.0;
        v46 = 1026;
        v47 = v34;
        _os_log_impl(&dword_20D7B6000, v33, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_destroyWeak(&v43);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      v35 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = *(_QWORD *)(a1 + 96);
      if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        v39 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v45 = v39;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v37, OS_SIGNPOST_INTERVAL_END, v38, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v41 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_QWORD *)v45 = *(_QWORD *)(a1 + 96);
        *(_WORD *)&v45[8] = 2048;
        *(double *)&v45[10] = (double)(unint64_t)v35 / 1000000000.0;
        v46 = 1026;
        v47 = v41;
        _os_log_impl(&dword_20D7B6000, v40, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorFourthPacket:complete:", v6, v5);

}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  id v14;
  _BYTE *WeakRetained;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  int v31;
  NSObject *v32;
  int v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  _BYTE v37[18];
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3 || objc_msgSend(*(id *)(a1 + 32), "testFailOctagon"))
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "counter");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v37 = v5;
      *(_WORD *)&v37[4] = 2112;
      *(_QWORD *)&v37[6] = v3;
      _os_log_impl(&dword_20D7B6000, v4, OS_LOG_TYPE_DEFAULT, "ot-pairing: failed to create %d message: %@", buf, 0x12u);
    }

    Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 88);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v37 = v10;
      _os_signpost_emit_with_name_impl(&dword_20D7B6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
    }

    _OctagonSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_QWORD *)v37 = *(_QWORD *)(a1 + 88);
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      v38 = 1026;
      v39 = v12;
      _os_log_impl(&dword_20D7B6000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 0, v3);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = v3;
    WeakRetained = *(_BYTE **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
  }
  else
  {
    secLogObjForScope((const char *)pairingScope);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D7B6000, v16, OS_LOG_TYPE_DEFAULT, "initiatorThirdPacket successfully joined Octagon", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (SOSCCIsSOSTrustAndSyncingEnabled() && WeakRetained[10])
    {
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_173;
      v34[3] = &unk_24C7B8D58;
      objc_copyWeak(&v35, (id *)(a1 + 80));
      objc_msgSend(WeakRetained, "setNextState:", v34);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v17 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = *(_QWORD *)(a1 + 88);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        v21 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v37 = v21;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v23 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_QWORD *)v37 = *(_QWORD *)(a1 + 88);
        *(_WORD *)&v37[8] = 2048;
        *(double *)&v37[10] = (double)(unint64_t)v17 / 1000000000.0;
        v38 = 1026;
        v39 = v23;
        _os_log_impl(&dword_20D7B6000, v22, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 1, 0);
      v24 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      **(_BYTE **)(a1 + 104) = 0;
      objc_destroyWeak(&v35);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v27 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = *(_QWORD *)(a1 + 88);
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        v31 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v37 = v31;
        _os_signpost_emit_with_name_impl(&dword_20D7B6000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PairingChannelInitiatorMessage3", " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 8u);
      }

      _OctagonSignpostLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v33 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        *(_QWORD *)v37 = *(_QWORD *)(a1 + 88);
        *(_WORD *)&v37[8] = 2048;
        *(double *)&v37[10] = (double)(unint64_t)v27 / 1000000000.0;
        v38 = 1026;
        v39 = v33;
        _os_log_impl(&dword_20D7B6000, v32, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ", buf, 0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 1, 0);
      **(_BYTE **)(a1 + 104) = 1;
    }
  }

}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorFourthPacket:complete:", v6, v5);

}

void __51__KCPairingChannel_fetchPrepare_application_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  id v21;
  OTPairingMessage *v22;
  OTSupportSOSMessage *v23;
  OTSupportOctagonMessage *v24;
  OTApplicantToSponsorRound2M1 *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id *v38;
  id WeakRetained;
  id v40;
  _QWORD v41[4];
  id v42;
  const __CFString *v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v40 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v17 || objc_msgSend(*(id *)(a1 + 32), "testFailOctagon"))
  {
    secLogObjForScope("SecError");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(*(id *)(a1 + 32), "counter");
      *(_DWORD *)buf = 67109378;
      v48 = v19;
      v49 = 2112;
      v50 = v17;
      _os_log_impl(&dword_20D7B6000, v18, OS_LOG_TYPE_DEFAULT, "ot-pairing: failed to create %d message: %@", buf, 0x12u);
    }

    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = v17;
    v22 = *(OTPairingMessage **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v21;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v22 = objc_alloc_init(OTPairingMessage);
    v23 = objc_alloc_init(OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v22, "setSupportsSOS:", v23);

    v24 = objc_alloc_init(OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v22, "setSupportsOctagon:", v24);

    v25 = objc_alloc_init(OTApplicantToSponsorRound2M1);
    -[OTApplicantToSponsorRound2M1 setPeerID:](v25, "setPeerID:", v40);
    -[OTApplicantToSponsorRound2M1 setPermanentInfo:](v25, "setPermanentInfo:", v13);
    -[OTApplicantToSponsorRound2M1 setPermanentInfoSig:](v25, "setPermanentInfoSig:", v14);
    -[OTApplicantToSponsorRound2M1 setStableInfo:](v25, "setStableInfo:", v15);
    -[OTApplicantToSponsorRound2M1 setStableInfoSig:](v25, "setStableInfoSig:", v16);
    if (SOSCCIsSOSTrustAndSyncingEnabled())
      v26 = 1;
    else
      v26 = 2;
    -[OTPairingMessage supportsSOS](v22, "supportsSOS", v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSupported:", v26);

    -[OTPairingMessage supportsOctagon](v22, "supportsOctagon");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSupported:", 1);

    -[OTPairingMessage setPrepare:](v22, "setPrepare:", v25);
    v29 = *(_QWORD *)(a1 + 40);
    secLogObjForScope((const char *)pairingScope);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v30, OS_LOG_TYPE_DEFAULT, "initiatorCompleteSecondPacketOctagon returning octagon and sos data", buf, 2u);
      }

      v32 = *(_QWORD *)(a1 + 40);
      v45[0] = CFSTR("p");
      v45[1] = CFSTR("o");
      v46[0] = v32;
      -[OTPairingMessage data](v22, "data");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "mutableCopy");
    }
    else
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D7B6000, v30, OS_LOG_TYPE_DEFAULT, "initiatorCompleteSecondPacketOctagon returning octagon data", buf, 2u);
      }

      v43 = CFSTR("o");
      -[OTPairingMessage data](v22, "data");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "mutableCopy");
    }
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __51__KCPairingChannel_fetchPrepare_application_error___block_invoke_169;
    v41[3] = &unk_24C7B8D58;
    v38 = (id *)(a1 + 72);
    objc_copyWeak(&v42, v38);
    WeakRetained = objc_loadWeakRetained(v38);
    objc_msgSend(WeakRetained, "setNextState:", v41);

    objc_destroyWeak(&v42);
  }

}

void __51__KCPairingChannel_fetchPrepare_application_error___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorThirdPacket:complete:", v6, v5);

}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  double v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
    v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorMakeSOSPeer", " OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", (uint8_t *)&v11, 8u);
  }

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
    v12 = a1[6];
    v13 = 2048;
    v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v15 = 1026;
    v16 = v10;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMakeSOSPeer  OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", (uint8_t *)&v11, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id *v18;
  id WeakRetained;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_DWORD *)buf = 67240192;
    LODWORD(v25) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMakeSOSPeer", " OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v25 = *(void **)(a1 + 72);
    v26 = 2048;
    v27 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v28 = 1026;
    v29 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMakeSOSPeer  OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ", buf, 0x1Cu);
  }

  if (v5 && (objc_msgSend(*(id *)(a1 + 32), "testFailSOS") & 1) == 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "sessionSupportsOctagon"))
    {
      v16 = *(_QWORD *)(a1 + 48);
      v22 = CFSTR("p");
      v23 = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *, void *))(v16 + 16))(v16, 0, v17, v7);

      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_163;
      v20[3] = &unk_24C7B8D58;
      v18 = (id *)(a1 + 64);
      objc_copyWeak(&v21, v18);
      WeakRetained = objc_loadWeakRetained(v18);
      objc_msgSend(WeakRetained, "setNextState:", v20);

      objc_destroyWeak(&v21);
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "sessionSupportsOctagon"))
  {
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "initiatorCompleteSecondPacketOctagon:application:complete:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
    goto LABEL_18;
  }
  secLogObjForScope("pairing");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_20D7B6000, v15, OS_LOG_TYPE_DEFAULT, "failed getting application: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_18:

}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorThirdPacket:complete:", v6, v5);

}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PairingChannelInitiatorStashAccountCredential", " OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = a1[8];
    v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v19 = 134218496;
    v20 = v10;
    v21 = 2048;
    v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v23 = 1026;
    v24 = v11;
    _os_log_impl(&dword_20D7B6000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorStashAccountCredential  OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", (uint8_t *)&v19, 0x1Cu);
  }

  v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v16 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v19, 8u);
  }

  _OctagonSignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218496;
    v18 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    v20 = a1[10];
    v21 = 2048;
    v22 = (double)(unint64_t)v12 / 1000000000.0;
    v23 = 1026;
    v24 = v18;
    _os_log_impl(&dword_20D7B6000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v19, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], 0, v3);
  (*(void (**)(void))(a1[5] + 16))();

}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_156(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  int v22;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  double v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5 && a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 67240192;
    LODWORD(v38) = v10;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PairingChannelInitiatorStashAccountCredential", " OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 80);
    v13 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 134218496;
    v38 = v12;
    v39 = 2048;
    v40 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v41 = 1026;
    v42 = v13;
    _os_log_impl(&dword_20D7B6000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorStashAccountCredential  OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setNextStateError:complete:", 0, 0);
  if (a2 && !objc_msgSend(*(id *)(a1 + 32), "testFailSOS"))
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_159;
    v27[3] = &unk_24C7B8DD0;
    v30 = *(_QWORD *)(a1 + 72);
    v31 = *(_OWORD *)(a1 + 96);
    v25 = *(void **)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 48);
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 56);
    objc_msgSend(v25, "initiatorCompleteSecondPacketWithSOS:complete:", v26, v27);

    v17 = v28;
    goto LABEL_22;
  }
  secLogObjForScope("pairing");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v5;
    _os_log_impl(&dword_20D7B6000, v14, OS_LOG_TYPE_DEFAULT, "failed stash credentials: %@", buf, 0xCu);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "sessionSupportsOctagon") & 1) != 0)
  {
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_157;
    v32[3] = &unk_24C7B8DD0;
    v35 = *(_QWORD *)(a1 + 72);
    v36 = *(_OWORD *)(a1 + 96);
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 48);
    v33 = *(id *)(a1 + 40);
    v34 = *(id *)(a1 + 56);
    objc_msgSend(v15, "initiatorCompleteSecondPacketOctagon:application:complete:", v16, 0, v32);

    v17 = v33;
LABEL_22:

    goto LABEL_23;
  }
  v18 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = *(_QWORD *)(a1 + 96);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 67240192;
    LODWORD(v38) = v22;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", buf, 8u);
  }

  _OctagonSignpostLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v38 = *(id *)(a1 + 96);
    v39 = 2048;
    v40 = (double)(unint64_t)v18 / 1000000000.0;
    v41 = 1026;
    v42 = v24;
    _os_log_impl(&dword_20D7B6000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", buf, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", *(_QWORD *)(a1 + 40), 0, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_23:

}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_161(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_157(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_159(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a4;
  v7 = a3;
  Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_20D7B6000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PairingChannelInitiatorMessage2", " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 8u);
  }

  _OctagonSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218496;
    v14 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
    v16 = a1[7];
    v17 = 2048;
    v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v19 = 1026;
    v20 = v14;
    _os_log_impl(&dword_20D7B6000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ", (uint8_t *)&v15, 0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v6);
  (*(void (**)(void))(a1[5] + 16))();

}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorSecondPacket:complete:", v6, v5);

}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorSecondPacket:complete:", v6, v5);

}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorSecondPacket:complete:", v6, v5);

}

void __41__KCPairingChannel_waitForOctagonUpgrade__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_20D7B6000, v4, OS_LOG_TYPE_DEFAULT, "pairing: failed to upgrade initiator into Octagon: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = 0;
    v7 = v3;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 1;
    v7 = 0;
  }
  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v5, v6, v7);

}

void __47__KCPairingChannel_setNextStateError_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "oneStepTooMany:complete:", v6, v5);

}

void __44__KCPairingChannel_initAsInitiator_version___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "acceptorFirstPacket:complete:", v6, v5);

}

void __44__KCPairingChannel_initAsInitiator_version___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "initiatorFirstPacket:complete:", v6, v5);

}

+ (id)pairingChannelInitiator:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[KCPairingChannel initAsInitiator:version:]([KCPairingChannel alloc], "initAsInitiator:version:", 1, v3);

  return v4;
}

+ (id)pairingChannelAcceptor:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[KCPairingChannel initAsInitiator:version:]([KCPairingChannel alloc], "initAsInitiator:version:", 0, v3);

  return v4;
}

+ (BOOL)_isRetryableNSURLError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  unsigned int v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD1308]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    if ((unint64_t)(v6 + 1009) <= 8)
      v7 = (0x111u >> (v6 - 15)) & 1;
    else
      LOBYTE(v7) = 0;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)retryable:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]) && objc_msgSend(v3, "code") == 4097)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE8520]) && objc_msgSend(v3, "code") == 56
      || +[KCPairingChannel _isRetryableNSURLError:](KCPairingChannel, "_isRetryableNSURLError:", v3))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = +[KCPairingChannel _isRetryableNSURLError:](KCPairingChannel, "_isRetryableNSURLError:", v8);

    }
  }

  return v5;
}

+ (BOOL)isSupportedPlatform
{
  return 1;
}

+ (id)pairingChannelCompressData:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  id v7;
  uint8_t *v8;
  size_t v9;
  id v10;
  size_t v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", compression_encode_scratch_buffer_size(COMPRESSION_LZFSE));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  if (v5 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v5 + 100);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (uint8_t *)objc_msgSend(v7, "mutableBytes");
    v9 = objc_msgSend(v7, "length");
    v10 = objc_retainAutorelease(v3);
    v11 = compression_encode_buffer(v8, v9, (const uint8_t *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (void *)objc_msgSend(objc_retainAutorelease(v4), "mutableBytes"), COMPRESSION_LZFSE);
    if (v11)
    {
      objc_msgSend(v7, "setLength:", v11);
      v6 = v7;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)pairingChannelDecompressData:(id)a3
{
  id v3;
  void *v4;
  size_t v5;
  id v6;
  void *v7;
  uint8_t *v8;
  id v9;
  size_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", compression_decode_scratch_buffer_size(COMPRESSION_LZFSE));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  v6 = 0;
  while ((v5 & 0x8000000000000000) == 0)
  {
    v5 *= 2;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v7);
    v8 = (uint8_t *)objc_msgSend(v6, "mutableBytes");
    v9 = objc_retainAutorelease(v3);
    v10 = compression_decode_buffer(v8, v5, (const uint8_t *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (void *)objc_msgSend(objc_retainAutorelease(v4), "mutableBytes"), COMPRESSION_LZFSE);
    if (!v10)
      break;
    if (v10 != v5)
    {
      objc_msgSend(v6, "setLength:", v10);
      v6 = v6;
      v11 = v6;
      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

@end
