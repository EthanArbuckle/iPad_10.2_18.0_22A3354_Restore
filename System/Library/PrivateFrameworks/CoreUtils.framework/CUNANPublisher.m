@implementation CUNANPublisher

- (CUNANPublisher)init
{
  CUNANPublisher *v2;
  CUNANPublisher *v3;
  CUNANPublisher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUNANPublisher;
  v2 = -[CUNANPublisher init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataPathEnabled = 1;
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_ucat = (LogCategory *)&gLogCategory_CUNANPublisher;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  NSString *v3;
  NSString *v4;
  LogCategory *ucat;
  objc_super v6;

  v3 = self->_mockID;
  v4 = v3;
  if (v3)
    CUNANMockRemovePublisher(v3, self);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CUNANPublisher;
  -[CUNANPublisher dealloc](&v6, sel_dealloc);
}

- (NSArray)dataSessions
{
  CUNANPublisher *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sessions;
  v4 = v3;
  if (v3)
  {
    -[NSMutableDictionary allValues](v3, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *serviceType;
  CFMutableStringRef v10;

  serviceType = self->_serviceType;
  v10 = 0;
  NSAppendPrintF(&v10, (uint64_t)"CUNANPublisher '%@'", v2, v3, v4, v5, v6, v7, (uint64_t)serviceType);
  return (NSString *)v10;
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE0673A0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CUNANPublisher_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  LogCategory *ucat;
  NSString *serviceType;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *textInfo;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  CUNANEndpoint *v28;
  CUNANEndpoint *mockEndpoint;
  void *v30;
  NSString *v31;
  CUNANPublisher *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSString *v38;
  NSString *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  LogCategory *v49;
  void *v50;
  void *v51;
  unsigned int controlFlags;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  LogCategory *v58;
  const char *v59;
  id v60;
  NSDictionary *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  unsigned int trafficFlags;
  uint64_t v74;
  void *v75;
  void *v76;
  WiFiAwarePublisher *v77;
  WiFiAwarePublisher *wfaPublisher;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  WiFiAwarePublisher *v85;
  void *v86;
  id activateCompletion;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  LogCategory *v92;
  LogCategory *v93;
  uint64_t v94;
  void *v95;
  void (**v96)(id, _QWORD);
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        goto LABEL_9;
      ucat = self->_ucat;
    }
    serviceType = self->_serviceType;
    CUPrintFlags(self->_trafficFlags, byte_18D51E503, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDictionary count](self->_textInfo, "count"))
      textInfo = self->_textInfo;
    else
      textInfo = (NSDictionary *)CFSTR("no SSI");
    NSPrintF((uint64_t)"%##@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)textInfo);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate: serviceType=%@, name='%@', port=%d, trafficFlags=%@, customData=%@, textInfo=%@", v16, v17, v18, v19, (uint64_t)serviceType);

  }
LABEL_9:
  v20 = self->_serviceType;
  if (-[NSString length](v20, "length"))
  {
    v27 = self->_mockID;
    if (v27)
    {
      if (!self->_mockEndpoint)
      {
        v28 = objc_alloc_init(CUNANEndpoint);
        mockEndpoint = self->_mockEndpoint;
        self->_mockEndpoint = v28;

        -[CUNANEndpoint setCustomData:](self->_mockEndpoint, "setCustomData:", self->_customData);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), CUNextID64());
        -[CUNANEndpoint setIdentifier:](self->_mockEndpoint, "setIdentifier:", v30);

        -[CUNANEndpoint setMockPeerEndpointString:](self->_mockEndpoint, "setMockPeerEndpointString:", self->_mockPeerEndpointString);
        -[CUNANEndpoint setName:](self->_mockEndpoint, "setName:", self->_name);
        -[CUNANEndpoint setPort:](self->_mockEndpoint, "setPort:", self->_port);
        -[CUNANEndpoint setServiceType:](self->_mockEndpoint, "setServiceType:", self->_serviceType);
        -[CUNANEndpoint setTextInfo:](self->_mockEndpoint, "setTextInfo:", self->_textInfo);
      }
      v31 = v27;
      v32 = self;
      os_unfair_lock_lock((os_unfair_lock_t)&gCUNANMockLock);
      objc_msgSend((id)gCUNANMockPublishers, "objectForKeyedSubscript:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
        v34 = (void *)gCUNANMockPublishers;
        if (!gCUNANMockPublishers)
        {
          v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v36 = (void *)gCUNANMockPublishers;
          gCUNANMockPublishers = (uint64_t)v35;

          v34 = (void *)gCUNANMockPublishers;
        }
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v31);
      }
      objc_msgSend(v33, "addObject:", v32);
      -[CUNANPublisher mockEndpoint](v32, "mockEndpoint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v96 = v4;
        v38 = v20;
        v39 = v27;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        objc_msgSend((id)gCUNANMockSubscribers, "objectForKeyedSubscript:", v31);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v99 != v43)
                objc_enumerationMutation(v40);
              objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i), "reportMockEndpointFound:", v37);
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
          }
          while (v42);
        }

        v27 = v39;
        v20 = v38;
        v4 = v96;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&gCUNANMockLock);

      if (v4)
        v4[2](v4, 0);
      goto LABEL_76;
    }
    v50 = (void *)objc_msgSend(objc_alloc((Class)getWiFiAwarePublishConfigurationClass[0]()), "initWithServiceName:", v20);
    v51 = v50;
    controlFlags = self->_controlFlags;
    if ((controlFlags & 1) != 0)
    {
      objc_msgSend(v50, "setAuthenticationType:", 0);
      controlFlags = self->_controlFlags;
    }
    if ((controlFlags & 2) == 0)
    {
LABEL_47:
      v60 = objc_alloc_init((Class)getWiFiAwarePublishServiceSpecificInfoClass[0]());
      objc_msgSend(v60, "setInstanceName:", self->_name);
      if (self->_customData)
        objc_msgSend(v60, "setBlob:");
      v61 = self->_textInfo;
      v63 = v61;
      if (!v61)
      {
LABEL_52:

        objc_msgSend(v51, "setServiceSpecificInfo:", v60);
        if (self->_dataPathEnabled)
        {
          trafficFlags = self->_trafficFlags;
          if ((trafficFlags & 0x800) != 0)
            v74 = 2;
          else
            v74 = (trafficFlags & 0x23300) != 0;
          v75 = (void *)objc_msgSend(objc_alloc((Class)getWiFiAwarePublishDatapathConfigurationClass[0]()), "initWithServiceType:securityConfiguration:", v74, 0);
          v76 = (void *)objc_msgSend(objc_alloc((Class)getWiFiAwarePublishDatapathServiceSpecificInfoClass[0]()), "initWithProtocolType:servicePort:", 0, LOWORD(self->_port));
          objc_msgSend(v75, "setServiceSpecificInfo:", v76);
          objc_msgSend(v51, "setDatapathConfiguration:", v75);

        }
        v77 = (WiFiAwarePublisher *)objc_msgSend(objc_alloc((Class)getWiFiAwarePublisherClass[0]()), "initWithConfiguration:", v51);
        wfaPublisher = self->_wfaPublisher;
        self->_wfaPublisher = v77;

        v85 = self->_wfaPublisher;
        if (v85)
        {
          -[WiFiAwarePublisher setDelegate:](v85, "setDelegate:", self);
          v86 = _Block_copy(v4);
          activateCompletion = self->_activateCompletion;
          self->_activateCompletion = v86;

          -[WiFiAwarePublisher start](self->_wfaPublisher, "start");
LABEL_75:

          goto LABEL_76;
        }
        NSErrorWithOSStatusF(4294960596, (uint64_t)"Create WFAPublisher failed", v79, v80, v81, v82, v83, v84, v94);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = self->_ucat;
        if (v92->var0 > 90)
          goto LABEL_68;
        if (v92->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v92, 0x5Au))
          {
LABEL_68:
            if (v4)
              ((void (**)(id, void *))v4)[2](v4, v63);
LABEL_74:

            goto LABEL_75;
          }
          v92 = self->_ucat;
        }
        LogPrintF((uint64_t)v92, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v88, v89, v90, v91, (uint64_t)v63);
        goto LABEL_68;
      }
      v97 = 0;
      v64 = (void *)CUTXTDataCreateWithDictionary(v61, v62, &v97);
      v65 = v97;
      v72 = v65;
      if (v64)
      {
        objc_msgSend(v60, "setTxtRecordData:", v64);

        goto LABEL_52;
      }
      if (!v65)
      {
        NSErrorWithOSStatusF(4294960596, (uint64_t)"Encode TXT failed", v66, v67, v68, v69, v70, v71, v94);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v93 = self->_ucat;
      if (v93->var0 <= 90)
      {
        if (v93->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v93, 0x5Au))
            goto LABEL_71;
          v93 = self->_ucat;
        }
        LogPrintF((uint64_t)v93, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v68, v69, v70, v71, (uint64_t)v72);
      }
LABEL_71:
      if (v4)
        ((void (**)(id, void *))v4)[2](v4, v72);

      goto LABEL_74;
    }
    -[objc_class automaticallyRequestInternetFromInitiators](getWiFiAwareInternetSharingConfigurationClass_4872(), "automaticallyRequestInternetFromInitiators");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
      objc_msgSend(v51, "setInternetSharingConfiguration:", v57);
    v58 = self->_ucat;
    if (v58->var0 <= 30)
    {
      if (v58->var0 != -1)
      {
LABEL_38:
        v59 = "success";
        if (!v57)
          v59 = "failed";
        LogPrintF((uint64_t)v58, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x1Eu, (uint64_t)"AutomaticInfraRelay: %s", v53, v54, v55, v56, (uint64_t)v59);
        goto LABEL_46;
      }
      if (_LogCategory_Initialize((uint64_t)v58, 0x1Eu))
      {
        v58 = self->_ucat;
        goto LABEL_38;
      }
    }
LABEL_46:

    goto LABEL_47;
  }
  NSErrorWithOSStatusF(4294960591, (uint64_t)"No service type", v21, v22, v23, v24, v25, v26, v94);
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  v49 = self->_ucat;
  if (v49->var0 <= 90)
  {
    if (v49->var0 != -1)
    {
LABEL_30:
      LogPrintF((uint64_t)v49, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v45, v46, v47, v48, (uint64_t)v27);
      goto LABEL_42;
    }
    if (_LogCategory_Initialize((uint64_t)v49, 0x5Au))
    {
      v49 = self->_ucat;
      goto LABEL_30;
    }
  }
LABEL_42:
  if (v4)
    ((void (**)(id, NSString *))v4)[2](v4, v27);
LABEL_76:

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CUNANPublisher_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t v8;
  NSString *v9;

  if (self->_invalidateCalled)
    return;
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_6;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v8);
  }
LABEL_6:
  v9 = self->_mockID;
  if (v9)
    CUNANMockRemovePublisher(v9, self);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sessions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4865);
  -[WiFiAwarePublisher stop](self->_wfaPublisher, "stop");
  -[CUNANPublisher _invalidated](self, "_invalidated");

}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id dataSessionStartedHandler;
  id dataSessionEndedHandler;
  id interruptionHandler;
  id v7;
  id receiveHandler;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *ucat;
  uint64_t v14;

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_wfaPublisher
    && !-[NSMutableDictionary count](self->_sessions, "count"))
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    dataSessionStartedHandler = self->_dataSessionStartedHandler;
    self->_dataSessionStartedHandler = 0;

    dataSessionEndedHandler = self->_dataSessionEndedHandler;
    self->_dataSessionEndedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v7 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    receiveHandler = self->_receiveHandler;
    self->_receiveHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_9:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v14);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_9;
      }
    }
  }
}

- (void)generateStatisticsReportWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)reportIssue:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__CUNANPublisher_reportIssue___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke;
  v15[3] = &unk_1E25DE2C8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

- (void)updateLinkStatus:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__CUNANPublisher_updateLinkStatus___block_invoke;
  v4[3] = &unk_1E25DE500;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)publisherStarted:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CUNANPublisher_publisherStarted___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CUNANPublisher_publisher_failedToStartWithError___block_invoke;
  v5[3] = &unk_1E25DD170;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CUNANPublisher_publisher_terminatedWithReason___block_invoke;
  v5[3] = &unk_1E25DD170;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6
{
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unsigned __int8 v17;

  v9 = a4;
  v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__CUNANPublisher_publisher_receivedMessage_fromSubscriberID_subscriberAddress___block_invoke;
  v14[3] = &unk_1E25DE250;
  v14[4] = self;
  v15 = v10;
  v17 = a5;
  v16 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(dispatchQueue, v14);

}

- (void)publisher:(id)a3 dataIndicatedForHandle:(id)a4 serviceSpecificInfo:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *ucat;
  id v14;

  v6 = a4;
  objc_msgSend(v6, "initiatorDataAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "datapathID");

  _WiFiAwareCreateEndpointIdentifier(v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher publisher:dataIndicatedForHandle:serviceSpecificInfo:]", 0x1Eu, (uint64_t)"WFA DataSession indicated: '%@', %@\n", v9, v10, v11, v12, (uint64_t)self->_serviceType);
  }
LABEL_5:

}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unsigned int v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__CUNANPublisher_publisher_dataConfirmedForHandle_localInterfaceIndex_serviceSpecificInfo___block_invoke;
  block[3] = &unk_1E25DCE20;
  block[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(dispatchQueue, block);

}

- (void)_publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  LogCategory *v24;
  LogCategory *ucat;
  CUNANEndpoint *v26;
  CUNANDataSession *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  LogCategory *v32;
  CUNANPublisher *v33;
  NSMutableDictionary *sessions;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  void (**dataSessionStartedHandler)(id, CUNANDataSession *);
  uint64_t v38;
  id v39;

  v7 = *(_QWORD *)&a5;
  v39 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "initiatorDataAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "datapathID");
  _WiFiAwareCreateEndpointIdentifier(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_25;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]", 0x5Au, (uint64_t)"### WFA DataSession confirmed missing identifier\n", v15, v16, v17, v18, v38);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v26 = objc_alloc_init(CUNANEndpoint);
    -[CUNANEndpoint setIdentifier:](v26, "setIdentifier:", v14);
    -[CUNANEndpoint setServiceType:](v26, "setServiceType:", self->_serviceType);
    v27 = objc_alloc_init(CUNANDataSession);
    -[CUNANDataSession setDispatchQueue:](v27, "setDispatchQueue:", self->_dispatchQueue);
    -[CUNANDataSession setIdentifier:](v27, "setIdentifier:", v14);
    if (self->_label)
      -[CUNANDataSession setLabel:](v27, "setLabel:");
    -[CUNANDataSession setLocalInterfaceIndex:](v27, "setLocalInterfaceIndex:", v7);
    -[CUNANDataSession setPeerEndpoint:](v27, "setPeerEndpoint:", v26);
    -[CUNANDataSession setTrafficFlags:](v27, "setTrafficFlags:", self->_trafficFlags);
    -[CUNANDataSession setWfaDataSessionServer:](v27, "setWfaDataSessionServer:", v10);
    v32 = self->_ucat;
    if (v32->var0 > 30)
      goto LABEL_20;
    if (v32->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v32, 0x1Eu))
        goto LABEL_20;
      v32 = self->_ucat;
    }
    LogPrintF((uint64_t)v32, (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]", 0x1Eu, (uint64_t)"DataSession started: %@\n", v28, v29, v30, v31, (uint64_t)v27);
LABEL_20:
    v33 = self;
    objc_sync_enter(v33);
    sessions = self->_sessions;
    if (!sessions)
    {
      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = self->_sessions;
      self->_sessions = v35;

      sessions = self->_sessions;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v27, v14);
    objc_sync_exit(v33);

    dataSessionStartedHandler = (void (**)(id, CUNANDataSession *))v33->_dataSessionStartedHandler;
    if (dataSessionStartedHandler)
      dataSessionStartedHandler[2](dataSessionStartedHandler, v27);

    goto LABEL_25;
  }
  v24 = self->_ucat;
  if (v24->var0 <= 90)
  {
    if (v24->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v24, 0x5Au))
        goto LABEL_25;
      v24 = self->_ucat;
    }
    LogPrintF((uint64_t)v24, (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]", 0x5Au, (uint64_t)"### WFA DataSession confirmed for existing session: %@\n", v20, v21, v22, v23, (uint64_t)v14);
  }
LABEL_25:

}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  int64_t v12;

  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CUNANPublisher_publisher_dataTerminatedForHandle_reason___block_invoke;
  block[3] = &unk_1E25DE200;
  block[4] = self;
  v11 = v7;
  v12 = a5;
  v9 = v7;
  dispatch_async(dispatchQueue, block);

}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (NSData)customData
{
  return self->_customData;
}

- (void)setCustomData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)dataPathEnabled
{
  return self->_dataPathEnabled;
}

- (void)setDataPathEnabled:(BOOL)a3
{
  self->_dataPathEnabled = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (CUNANEndpoint)mockEndpoint
{
  return self->_mockEndpoint;
}

- (void)setMockEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_mockEndpoint, a3);
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)mockPeerEndpointString
{
  return self->_mockPeerEndpointString;
}

- (void)setMockPeerEndpointString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)textInfo
{
  return self->_textInfo;
}

- (void)setTextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)dataSessionStartedHandler
{
  return self->_dataSessionStartedHandler;
}

- (void)setDataSessionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)dataSessionEndedHandler
{
  return self->_dataSessionEndedHandler;
}

- (void)setDataSessionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)receiveHandler
{
  return self->_receiveHandler;
}

- (void)setReceiveHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveHandler, 0);
  objc_storeStrong(&self->_dataSessionEndedHandler, 0);
  objc_storeStrong(&self->_dataSessionStartedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mockPeerEndpointString, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_mockEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_wfaPublisher, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

void __59__CUNANPublisher_publisher_dataTerminatedForHandle_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  void *v11;
  int *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "initiatorDataAddress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "datapathID");
    _WiFiAwareCreateEndpointIdentifier(v3);
    v40 = objc_claimAutoreleasedReturnValue();

    v8 = (*(_DWORD *)(a1 + 48) + 312370);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(int **)(v9 + 32);
    if (*v10 <= 30)
    {
      if (*v10 != -1)
        goto LABEL_4;
      v13 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (v13)
      {
        v10 = *(int **)(v9 + 32);
LABEL_4:
        LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession terminated: '%@', %@, %#m\n", v4, v5, v6, v7, *(_QWORD *)(v9 + 120));
        v11 = (void *)v40;
        v9 = *(_QWORD *)(a1 + 32);
        if (!v40)
        {
LABEL_5:
          v12 = *(int **)(v9 + 32);
          if (*v12 > 90)
          {
LABEL_24:

            return;
          }
          if (*v12 == -1)
          {
            v38 = _LogCategory_Initialize((uint64_t)v12, 0x5Au);
            v11 = (void *)v40;
            if (!v38)
              goto LABEL_24;
            v12 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
          }
          LogPrintF((uint64_t)v12, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x5Au, (uint64_t)"### WFA DataSession terminated missing identifier: %#m\n", v4, v5, v6, v7, v8);
LABEL_23:
          v11 = (void *)v40;
          goto LABEL_24;
        }
LABEL_11:
        objc_msgSend(*(id *)(v9 + 24), "objectForKeyedSubscript:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD **)(a1 + 32);
        if (v18)
        {
          v20 = v19;
          objc_sync_enter(v20);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", 0, v40);
          objc_sync_exit(v20);

          v27 = *(uint64_t **)(a1 + 32);
          v28 = (int *)v27[4];
          if (*v28 <= 30)
          {
            if (*v28 == -1)
            {
              v35 = _LogCategory_Initialize(v27[4], 0x1Eu);
              v27 = *(uint64_t **)(a1 + 32);
              if (!v35)
                goto LABEL_19;
              v28 = (int *)v27[4];
            }
            CUDescriptionWithLevel(v18, 50);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF((uint64_t)v28, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x1Eu, (uint64_t)"DataSession ended: %@\n", v30, v31, v32, v33, (uint64_t)v29);

            v27 = *(uint64_t **)(a1 + 32);
          }
LABEL_19:
          v36 = v27[20];
          if (v36)
          {
            NSErrorWithOSStatusF(v8, (uint64_t)"DataSession terminated", v21, v22, v23, v24, v25, v26, v39);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, void *))(v36 + 16))(v36, v18, v37);

            v27 = *(uint64_t **)(a1 + 32);
          }
          objc_msgSend(v27, "_invalidated");
          goto LABEL_22;
        }
        v34 = (int *)v19[4];
        if (*v34 <= 60)
        {
          if (*v34 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v34, 0x3Cu))
              goto LABEL_22;
            v19 = *(_QWORD **)(a1 + 32);
            v34 = (int *)v19[4];
          }
          LogPrintF((uint64_t)v34, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x3Cu, (uint64_t)"### WFA DataSession terminated untracked: '%@', %@, %#m\n", v14, v15, v16, v17, v19[15]);
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    v11 = (void *)v40;
    if (!v40)
      goto LABEL_5;
    goto LABEL_11;
  }
}

_QWORD *__91__CUNANPublisher_publisher_dataConfirmedForHandle_localInterfaceIndex_serviceSpecificInfo___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[5])
    return (_QWORD *)objc_msgSend(result, "_publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  return result;
}

void __79__CUNANPublisher_publisher_receivedMessage_fromSubscriberID_subscriberAddress___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  CUNANEndpoint *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  void (**v12)(id, _QWORD, CUNANEndpoint *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    v3 = _Block_copy(*(const void **)(v1 + 168));
    if (!v3)
    {
LABEL_8:

      return;
    }
    v12 = (void (**)(id, _QWORD, CUNANEndpoint *))v3;
    v4 = objc_alloc_init(CUNANEndpoint);
    objc_msgSend(*(id *)(a1 + 40), "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WiFiAwareCreateEndpointIdentifier(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUNANEndpoint setIdentifier:](v4, "setIdentifier:", v6);

    -[CUNANEndpoint setInstanceID:](v4, "setInstanceID:", *(unsigned __int8 *)(a1 + 56));
    -[CUNANEndpoint setMacAddress:](v4, "setMacAddress:", *(_QWORD *)(a1 + 40));
    v11 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu))
          goto LABEL_7;
        v11 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANPublisher publisher:receivedMessage:fromSubscriberID:subscriberAddress:]_block_invoke", 0x1Eu, (uint64_t)"Received message: EP %@, Data %@", v7, v8, v9, v10, (uint64_t)v4);
    }
LABEL_7:
    v12[2](v12, *(_QWORD *)(a1 + 48), v4);

    v3 = v12;
    goto LABEL_8;
  }
}

void __49__CUNANPublisher_publisher_terminatedWithReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  _BOOL4 v27;
  uint64_t v28;
  void (**v29)(id, _QWORD);

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v8 + 40))
  {
    v10 = *(int **)(v8 + 32);
    if (*v10 > 30)
      goto LABEL_8;
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v11)
      {
LABEL_8:
        v29 = (void (**)(id, _QWORD))_Block_copy(*(const void **)(v8 + 8));
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        *(_QWORD *)(v12 + 8) = 0;

        v20 = *(_QWORD *)(a1 + 40);
        if (v29)
        {
          if (v20 == 2)
          {
            v29[2](v29, 0);
LABEL_12:
            v21 = *(_QWORD *)(a1 + 32);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = 0;

            objc_msgSend(*(id *)(a1 + 32), "_invalidated");
LABEL_22:

            return;
          }
          NSErrorWithOSStatusF(4294960596, (uint64_t)"Publisher start failed", v14, v15, v16, v17, v18, v19, v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v29)[2](v29, v23);

        }
        else if (v20 == 2)
        {
          goto LABEL_12;
        }
        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(_QWORD *)(v24 + 136);
        if (v25)
        {
          (*(void (**)(void))(v25 + 16))();
          v24 = *(_QWORD *)(a1 + 32);
        }
        if (*(_BYTE *)(v24 + 16))
          goto LABEL_22;
        v26 = *(int **)(v24 + 32);
        if (*v26 <= 30)
        {
          if (*v26 == -1)
          {
            v27 = _LogCategory_Initialize((uint64_t)v26, 0x1Eu);
            v24 = *(_QWORD *)(a1 + 32);
            if (!v27)
              goto LABEL_21;
            v26 = *(int **)(v24 + 32);
          }
          LogPrintF((uint64_t)v26, (uint64_t)"-[CUNANPublisher publisher:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFAPublisher restarting after unexpected termination\n", v16, v17, v18, v19, v28);
          v24 = *(_QWORD *)(a1 + 32);
        }
LABEL_21:
        objc_msgSend(*(id *)(v24 + 40), "start");
        goto LABEL_22;
      }
      v10 = *(int **)(v8 + 32);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher publisher:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFAPublisher terminated: '%@', %s\n", a5, a6, a7, a8, *(_QWORD *)(v8 + 120));
    v8 = *(_QWORD *)(a1 + 32);
    goto LABEL_8;
  }
}

void __51__CUNANPublisher_publisher_failedToStartWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void (**v23)(id, void *);

  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v8 + 40))
    return;
  v10 = (*(_DWORD *)(a1 + 40) + 312300);
  v11 = *(int **)(v8 + 32);
  if (*v11 <= 90)
  {
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v12)
        goto LABEL_7;
      v11 = *(int **)(v8 + 32);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANPublisher publisher:failedToStartWithError:]_block_invoke", 0x5Au, (uint64_t)"### WFAPublisher start failed: '%@', %#m\n", a5, a6, a7, a8, *(_QWORD *)(v8 + 120));
    v8 = *(_QWORD *)(a1 + 32);
  }
LABEL_7:
  v23 = (void (**)(id, void *))_Block_copy(*(const void **)(v8 + 8));
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 8);
  *(_QWORD *)(v13 + 8) = 0;

  if (v23)
  {
    NSErrorWithOSStatusF(v10, (uint64_t)"Publisher start failed", v15, v16, v17, v18, v19, v20, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2](v23, v21);

  }
}

void __35__CUNANPublisher_publisherStarted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v8 + 40))
    return;
  v10 = *(int **)(v8 + 32);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_7;
      v10 = *(int **)(v8 + 32);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher publisherStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFAPublisher started: '%@'\n", a5, a6, a7, a8, *(_QWORD *)(v8 + 120));
    v8 = *(_QWORD *)(a1 + 32);
  }
LABEL_7:
  v15 = _Block_copy(*(const void **)(v8 + 8));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = 0;

  v14 = v15;
  if (v15)
  {
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
    v14 = v15;
  }

}

void __35__CUNANPublisher_updateLinkStatus___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int *v10;
  uint64_t v11;
  id v12;

  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfaDataSessionServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v9 = v4 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          goto LABEL_9;
        v10 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher updateLinkStatus:]_block_invoke", 0x5Au, (uint64_t)"### Update link status without underlying data session", v5, v6, v7, v8, v11);
    }
  }
  else
  {
    objc_msgSend(v12, "updateLinkStatus:forDataSession:", *(_DWORD *)(a1 + 40) == 1, v4);
  }
LABEL_9:

}

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[5];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4850;
  v39 = __Block_byref_object_dispose__4851;
  v40 = 0;
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_24;
  aBlock[3] = &unk_1E25DE160;
  v3 = *(_QWORD *)(a1 + 32);
  v34 = &v35;
  aBlock[4] = v3;
  v33 = *(id *)(a1 + 56);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  if (!v10)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960551, (uint64_t)"Publisher not activated", v5, v6, v7, v8, v9, v27);
    v24 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v36[5];
    v36[5] = v24;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "discoveryResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "publishID");
    objc_msgSend(v12, "publisherAddress");
  }
  else
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "instanceID");
    objc_msgSend(*(id *)(a1 + 40), "macAddress");
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No peer address", v14, v15, v16, v17, v18, v27);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v36[5];
    v36[5] = v25;

    goto LABEL_11;
  }
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(int **)(v20 + 32);
  if (*v21 <= 30)
  {
    if (*v21 == -1)
    {
      v22 = _LogCategory_Initialize((uint64_t)v21, 0x1Eu);
      v20 = *(_QWORD *)(a1 + 32);
      if (!v22)
        goto LABEL_10;
      v21 = *(int **)(v20 + 32);
    }
    LogPrintF((uint64_t)v21, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_2", 0x1Eu, (uint64_t)"SendMessage start: EP %@, Data %.12@", v15, v16, v17, v18, *(_QWORD *)(a1 + 40));
    v20 = *(_QWORD *)(a1 + 32);
  }
LABEL_10:
  v28[0] = v2;
  v28[1] = 3221225472;
  v28[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_3;
  v28[3] = &unk_1E25DCEC0;
  v28[4] = v20;
  v23 = *(_QWORD *)(a1 + 48);
  v29 = *(id *)(a1 + 40);
  v30 = *(id *)(a1 + 48);
  v31 = *(id *)(a1 + 56);
  objc_msgSend(v10, "sendMessage:toPeerAddress:withInstanceID:completionHandler:", v23, v19, v13, v28);

LABEL_11:
LABEL_12:

  v4[2](v4);
  _Block_object_dispose(&v35, 8);

}

uint64_t __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  int *v10;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40);
  if (v8)
  {
    v9 = (_QWORD *)result;
    v10 = *(int **)(*(_QWORD *)(result + 32) + 32);
    if (*v10 <= 90)
    {
      if (*v10 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au))
          return (*(uint64_t (**)(void))(v9[5] + 16))();
        v10 = *(int **)(v9[4] + 32);
        v8 = *(_QWORD *)(*(_QWORD *)(v9[6] + 8) + 40);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke", 0x5Au, (uint64_t)"### SendMessage failed: %{error}", a5, a6, a7, a8, v8);
    }
    return (*(uint64_t (**)(void))(v9[5] + 16))();
  }
  return result;
}

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_4;
  block[3] = &unk_1E25DCE98;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 72);
  block[1] = 3221225472;
  v10 = a2;
  block[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  dispatch_async(v5, block);

}

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  int *v16;
  uint64_t v17;
  id v18;

  v9 = a1[8];
  if (v9)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], (v9 + 312300), (uint64_t)"SendMessage failed", a4, a5, a6, a7, a8, v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v15 = *(int **)(a1[4] + 32);
    v18 = (id)v10;
    if (*v15 <= 90)
    {
      if (*v15 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v15, 0x5Au))
          goto LABEL_9;
        v15 = *(int **)(a1[4] + 32);
      }
      LogPrintF((uint64_t)v15, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x5Au, (uint64_t)"### SendMessage failed: EP %@, Data %.12@, %{error}", v11, v12, v13, v14, a1[5]);
    }
LABEL_9:
    (*(void (**)(void))(a1[7] + 16))();

    return;
  }
  v16 = *(int **)(a1[4] + 32);
  if (*v16 <= 30)
  {
    if (*v16 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu))
        goto LABEL_11;
      v16 = *(int **)(a1[4] + 32);
    }
    LogPrintF((uint64_t)v16, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x1Eu, (uint64_t)"SendMessage completed: EP %@, Data %.12@", a5, a6, a7, a8, a1[5]);
  }
LABEL_11:
  (*(void (**)(void))(a1[7] + 16))();
}

void __30__CUNANPublisher_reportIssue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  if (v2)
  {
    v3 = *(void **)(v1 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __30__CUNANPublisher_reportIssue___block_invoke_2;
    v5[3] = &unk_1E25DCDF8;
    v5[4] = v2;
    v6 = *(id *)(a1 + 40);
    v4 = v2;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __30__CUNANPublisher_reportIssue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "wfaDataSessionServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "reportIssue:forDataSession:", *(_QWORD *)(a1 + 40), v4);
    v4 = v5;
  }

}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17[5];
  id v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v4 = *(id *)(v2 + 40);
  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wfaDataSessionServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v13 = v7 == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 40);
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"No underlying data session", v8, v9, v10, v11, v12, v17[0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_2;
    v17[3] = (uint64_t)&unk_1E25DCDD0;
    v16 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v16;
    objc_msgSend(v4, "generateStatisticsReportForDataSession:completionHandler:", v7, v17);

  }
}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E25DD058;
  v10 = v5;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v9 = a1[4];
  v8 = a1[5];
  v10 = a1[6];
  if (v10)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], (v10 + 312300), (uint64_t)"Generate report failed", a4, a5, a6, a7, a8, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v9, v12);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v8 + 16))(a1[5], a1[4], 0);
  }
}

uint64_t __29__CUNANPublisher__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

uint64_t __28__CUNANPublisher_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __41__CUNANPublisher_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
