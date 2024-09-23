@implementation CUNANDataSession

- (CUNANDataSession)init
{
  CUNANDataSession *v2;
  CUNANDataSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUNANDataSession;
  v2 = -[CUNANDataSession init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUNANDataSession;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUNANDataSession;
  -[CUNANDataSession dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[CUNANDataSession descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v21;
  CFMutableStringRef v22;
  CFMutableStringRef v23;
  CFMutableStringRef v24;

  v24 = 0;
  NSAppendPrintF(&v24, (uint64_t)"CUNANDataSession %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  v10 = v24;
  v17 = v10;
  if (self->_peerAddress.sa.sa_family)
  {
    v23 = v10;
    NSAppendPrintF(&v23, (uint64_t)", IP %##a", v11, v12, v13, v14, v15, v16, (uint64_t)&self->_peerAddress);
    v18 = v23;

    v17 = v18;
  }
  if (a3 <= 20)
  {
    v22 = v17;
    NSAppendPrintF(&v22, (uint64_t)"\n", v11, v12, v13, v14, v15, v16, v21);
    v19 = v22;

    v17 = v19;
  }
  return v17;
}

- (NSString)peerAddressString
{
  char v3[128];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  SockAddrToString((uint64_t)&self->_peerAddress, 1, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)peerEndpointString
{
  char v3[128];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  SockAddrToString((uint64_t)&self->_peerAddress, 0, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPeerEndpoint:(id)a3
{
  NSString *v5;
  NSString *identifier;
  id v7;

  objc_storeStrong((id *)&self->_peerEndpoint, a3);
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

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
  v7 = qword_1EE0672D0;
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
  v7[2] = __43__CUNANDataSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  LogCategory *ucat;
  CUNANEndpoint *peerEndpoint;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int trafficFlags;
  uint64_t v28;
  WiFiAwareDataSession *v29;
  WiFiAwareDataSession *wfaDataSessionClient;
  WiFiAwareDataSession *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  LogCategory *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  LogCategory *v46;
  void *v47;
  id activateCompletion;
  uint64_t v49;
  void *v50;
  void (**aBlock)(void);

  aBlock = (void (**)(void))a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      peerEndpoint = self->_peerEndpoint;
      CUPrintFlags(self->_controlFlags, byte_18D51E224, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintFlags(self->_trafficFlags, byte_18D51E503, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate: endpoint=%@, controlFlags=%@, trafficFlags=%@", v7, v8, v9, v10, (uint64_t)peerEndpoint);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  -[CUNANEndpoint mockPeerEndpointString](self->_peerEndpoint, "mockPeerEndpointString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    -[CUNANEndpoint discoveryResult](self->_peerEndpoint, "discoveryResult");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      trafficFlags = self->_trafficFlags;
      if ((trafficFlags & 0x800) != 0)
        v28 = 2;
      else
        v28 = (trafficFlags & 0x23300) != 0;
      v29 = (WiFiAwareDataSession *)objc_msgSend(objc_alloc((Class)getWiFiAwareDataSessionClass[0]()), "initWithDiscoveryResult:serviceType:serviceSpecificInfo:", v26, v28, 0);
      wfaDataSessionClient = self->_wfaDataSessionClient;
      self->_wfaDataSessionClient = v29;

      v31 = self->_wfaDataSessionClient;
      if (v31)
      {
        -[WiFiAwareDataSession setDelegate:](v31, "setDelegate:", self);
        if ((self->_controlFlags & 2) == 0)
        {
LABEL_34:
          v47 = _Block_copy(aBlock);
          activateCompletion = self->_activateCompletion;
          self->_activateCompletion = v47;

          -[WiFiAwareDataSession start](self->_wfaDataSessionClient, "start");
LABEL_35:

          goto LABEL_36;
        }
        objc_msgSend((Class)getWiFiAwareInternetSharingConfigurationClass[0](), "automaticallyProvideInternetToResponders");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          -[WiFiAwareDataSession setInternetSharingConfiguration:](self->_wfaDataSessionClient, "setInternetSharingConfiguration:", v36);
        v37 = self->_ucat;
        if (v37->var0 <= 30)
        {
          if (v37->var0 != -1)
          {
LABEL_19:
            v38 = "success";
            if (!v36)
              v38 = "failed";
            LogPrintF((uint64_t)v37, (uint64_t)"-[CUNANDataSession _activateWithCompletion:]", 0x1Eu, (uint64_t)"AutomaticInfraRelay: %s", v32, v33, v34, v35, (uint64_t)v38);
            goto LABEL_33;
          }
          if (_LogCategory_Initialize((uint64_t)v37, 0x1Eu))
          {
            v37 = self->_ucat;
            goto LABEL_19;
          }
        }
LABEL_33:

        goto LABEL_34;
      }
      v39 = "Create WFA DataSession failed";
      v40 = 4294960596;
    }
    else
    {
      v39 = "No discovery result";
      v40 = 4294960591;
    }
    NSErrorWithOSStatusF(v40, (uint64_t)v39, v20, v21, v22, v23, v24, v25, v49);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = self->_ucat;
    if (v46->var0 <= 90)
    {
      if (v46->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v46, 0x5Au))
          goto LABEL_29;
        v46 = self->_ucat;
      }
      LogPrintF((uint64_t)v46, (uint64_t)"-[CUNANDataSession _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v41, v42, v43, v44, (uint64_t)v45);
    }
LABEL_29:
    if (aBlock)
      aBlock[2]();

    goto LABEL_35;
  }
  v13 = StringToSockAddr((unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), (uint64_t)&self->_peerAddress, 0x1CuLL, 0);
  if (aBlock)
  {
    if ((_DWORD)v13)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], v13, (uint64_t)"Bad mock peer endpoint string", v14, v15, v16, v17, v18, v49);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void), void *))aBlock[2])(aBlock, v19);

    }
    else
    {
      ((void (*)(void (**)(void), _QWORD))aBlock[2])(aBlock, 0);
    }
  }
LABEL_36:

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUNANDataSession_invalidate__block_invoke;
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

  if (!self->_invalidateCalled)
  {
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v8);
    }
LABEL_6:
    -[WiFiAwareDataSession stop](self->_wfaDataSessionClient, "stop");
    -[CUNANDataSession _terminateServerDataSession](self, "_terminateServerDataSession");
    -[CUNANDataSession _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id interruptionHandler;
  id v5;
  id terminationHandler;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  uint64_t v12;

  if (!self->_invalidateDone && !self->_wfaDataSessionClient && !self->_wfaDataSessionServer)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    terminationHandler = self->_terminationHandler;
    self->_terminationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v7, v8, v9, v10, v12);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_8;
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
  v7[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke;
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
  v7[2] = __32__CUNANDataSession_reportIssue___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)updateLinkStatus:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__CUNANDataSession_updateLinkStatus___block_invoke;
  v4[3] = &unk_1E25DE500;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_terminateServerDataSession
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WiFiAwarePublisherDataSessionHandle *v7;
  LogCategory *ucat;
  WiFiAwarePublisher *publisher;
  uint64_t v10;
  _QWORD v11[5];

  v7 = self->_wfaDataSessionServer;
  if (v7)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _terminateServerDataSession]", 0x1Eu, (uint64_t)"WFA DataSession terminate start\n", v3, v4, v5, v6, v10);
    }
LABEL_6:
    publisher = self->_publisher;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__CUNANDataSession__terminateServerDataSession__block_invoke;
    v11[3] = &unk_1E25DCD48;
    v11[4] = self;
    -[WiFiAwarePublisher terminateDataSession:completionHandler:](publisher, "terminateDataSession:completionHandler:", v7, v11);
  }

}

- (void)dataSessionRequestStarted:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CUNANDataSession_dataSessionRequestStarted___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CUNANDataSession_dataSession_failedToStartWithError___block_invoke;
  v5[3] = &unk_1E25DD170;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
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
  v15[2] = __80__CUNANDataSession_dataSession_confirmedForPeerDataAddress_serviceSpecificInfo___block_invoke;
  v15[3] = &unk_1E25DE2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

- (BOOL)_dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v10 = a3;
  v11 = a5;
  objc_msgSend(a4, "ipv6LinkLocalAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  if (v13 == 16)
  {
    *(_QWORD *)&self->_peerAddress.v6.sin6_addr.__u6_addr16[1] = 0;
    *(_QWORD *)&self->_peerAddress.v4.sin_port = 0;
    HIWORD(self->_peerAddress.v6.sin6_scope_id) = 0;
    *(_QWORD *)((char *)&self->_peerAddress.v6.sin6_addr.__u6_addr32[2] + 2) = 0;
    *(_WORD *)&self->_peerAddress.sa.sa_len = 7708;
    self->_peerAddress.v6.sin6_addr = *(in6_addr *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
    self->_peerAddress.v6.sin6_scope_id = objc_msgSend(v10, "localInterfaceIndex");
    self->_peerAddress.v4.sin_port = __rev16(objc_msgSend(v11, "servicePort"));
    self->_localInterfaceIndex = objc_msgSend(v10, "localInterfaceIndex");
  }
  else if (a6)
  {
    v14 = objc_msgSend(v12, "length");
    NSErrorWithOSStatusF(4294960553, (uint64_t)"Bad IPv6 length (%d bytes)", v15, v16, v17, v18, v19, v20, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13 == 16;
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CUNANDataSession_dataSession_terminatedWithReason___block_invoke;
  v5[3] = &unk_1E25DD170;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)label
{
  return self->_label;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
}

- (void)setLocalInterfaceIndex:(unsigned int)a3
{
  self->_localInterfaceIndex = a3;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)peerAddress
{
  retstr->var0 = *(sockaddr *)((char *)&self[4].var2.sin6_addr + 8);
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = (in6_addr)self[5].var0;
  return self;
}

- (void)setPeerAddress:(id *)a3
{
  sockaddr var0;

  var0 = a3->var0;
  *(in6_addr *)((char *)&self->_peerAddress.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_peerAddress.sa = var0;
}

- (CUNANEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (id)terminationHandler
{
  return self->_terminationHandler;
}

- (void)setTerminationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (WiFiAwareDataSession)wfaDataSessionClient
{
  return self->_wfaDataSessionClient;
}

- (WiFiAwarePublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (WiFiAwarePublisherDataSessionHandle)wfaDataSessionServer
{
  return self->_wfaDataSessionServer;
}

- (void)setWfaDataSessionServer:(id)a3
{
  objc_storeStrong((id *)&self->_wfaDataSessionServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wfaDataSessionServer, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_wfaDataSessionClient, 0);
  objc_storeStrong(&self->_terminationHandler, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

void __53__CUNANDataSession_dataSession_terminatedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void (**v18)(void *, void *);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void (**v31)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 104))
    return;
  v3 = (*(_DWORD *)(a1 + 40) + 312370);
  v4 = *(int **)(v1 + 24);
  if (*v4 <= 30)
  {
    if (*v4 == -1)
    {
      v10 = _LogCategory_Initialize(*(_QWORD *)(v1 + 24), 0x1Eu);
      v1 = *(_QWORD *)(a1 + 32);
      if (!v10)
        goto LABEL_7;
      v4 = *(int **)(v1 + 24);
    }
    objc_msgSend(*(id *)(v1 + 88), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v4, (uint64_t)"-[CUNANDataSession dataSession:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession terminated: %@, %#m\n", v6, v7, v8, v9, (uint64_t)v5);

    v1 = *(_QWORD *)(a1 + 32);
  }
LABEL_7:
  v31 = (void (**)(id, void *))_Block_copy(*(const void **)(v1 + 96));
  if (v31)
  {
    NSErrorWithOSStatusF(v3, (uint64_t)"DataSession terminated", v11, v12, v13, v14, v15, v16, v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2](v31, v17);

  }
  v18 = (void (**)(void *, void *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 8));
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 8);
  *(_QWORD *)(v19 + 8) = 0;

  if (v18)
  {
    NSErrorWithOSStatusF(v3, (uint64_t)"DataSession terminated", v21, v22, v23, v24, v25, v26, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v27);

  }
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(void **)(v28 + 104);
  *(_QWORD *)(v28 + 104) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __80__CUNANDataSession_dataSession_confirmedForPeerDataAddress_serviceSpecificInfo___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void (**v14)(void *, id);
  uint64_t v15;
  void *v16;
  id v17;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 104))
    return;
  v3 = *(int **)(v2 + 24);
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      v9 = _LogCategory_Initialize(*(_QWORD *)(v2 + 24), 0x1Eu);
      v2 = a1[4];
      if (!v9)
        goto LABEL_6;
      v3 = *(int **)(v2 + 24);
    }
    objc_msgSend(*(id *)(v2 + 88), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUNANDataSession dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession confirmed: %@\n", v5, v6, v7, v8, (uint64_t)v4);

    v2 = a1[4];
  }
LABEL_6:
  v10 = a1[5];
  v11 = a1[6];
  v12 = a1[7];
  v17 = 0;
  objc_msgSend((id)v2, "_dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:error:", v10, v11, v12, &v17);
  v13 = v17;
  v14 = (void (**)(void *, id))_Block_copy(*(const void **)(a1[4] + 8));
  v15 = a1[4];
  v16 = *(void **)(v15 + 8);
  *(_QWORD *)(v15 + 8) = 0;

  if (v14)
    v14[2](v14, v13);

}

void __55__CUNANDataSession_dataSession_failedToStartWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void (**v21)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 104))
    return;
  v3 = (*(_DWORD *)(a1 + 40) + 312300);
  v4 = *(int **)(v1 + 24);
  if (*v4 <= 90)
  {
    if (*v4 == -1)
    {
      v10 = _LogCategory_Initialize(*(_QWORD *)(v1 + 24), 0x5Au);
      v1 = *(_QWORD *)(a1 + 32);
      if (!v10)
        goto LABEL_7;
      v4 = *(int **)(v1 + 24);
    }
    objc_msgSend(*(id *)(v1 + 88), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v4, (uint64_t)"-[CUNANDataSession dataSession:failedToStartWithError:]_block_invoke", 0x5Au, (uint64_t)"### WFA DataSession start failed: %@, %#m\n", v6, v7, v8, v9, (uint64_t)v5);

    v1 = *(_QWORD *)(a1 + 32);
  }
LABEL_7:
  v21 = (void (**)(id, void *))_Block_copy(*(const void **)(v1 + 8));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  *(_QWORD *)(v11 + 8) = 0;

  if (v21)
  {
    NSErrorWithOSStatusF(v3, (uint64_t)"DataSession start failed", v13, v14, v15, v16, v17, v18, v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, v19);

  }
}

void __46__CUNANDataSession_dataSessionRequestStarted___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 104))
  {
    v2 = *(int **)(v1 + 24);
    if (*v2 <= 30)
    {
      if (*v2 != -1)
      {
LABEL_4:
        objc_msgSend(*(id *)(v1 + 88), "identifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v2, (uint64_t)"-[CUNANDataSession dataSessionRequestStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession request started: %@\n", v3, v4, v5, v6, (uint64_t)v8);

        return;
      }
      if (_LogCategory_Initialize(*(_QWORD *)(v1 + 24), 0x1Eu))
      {
        v1 = *(_QWORD *)(a1 + 32);
        v2 = *(int **)(v1 + 24);
        goto LABEL_4;
      }
    }
  }
}

void __47__CUNANDataSession__terminateServerDataSession__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CUNANDataSession__terminateServerDataSession__block_invoke_2;
  v4[3] = &unk_1E25DD170;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void __47__CUNANDataSession__terminateServerDataSession__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void (**v24)(id, void *);

  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v8 + 120))
    return;
  v10 = *(int **)(v8 + 24);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v8 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_7;
      v10 = *(int **)(v8 + 24);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANDataSession _terminateServerDataSession]_block_invoke_2", 0x1Eu, (uint64_t)"WFA DataSession terminate completed: %#m\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
  }
LABEL_7:
  v24 = (void (**)(id, void *))_Block_copy(*(const void **)(v8 + 8));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = 0;

  if (v24)
  {
    NSErrorWithOSStatusF(*(unsigned int *)(a1 + 40), (uint64_t)"DataSession terminate failed", v14, v15, v16, v17, v18, v19, v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, v20);

  }
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 120);
  *(_QWORD *)(v21 + 120) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __37__CUNANDataSession_updateLinkStatus___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  int *v9;
  uint64_t v10;
  id v11;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  if (!v2)
  {
    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
    if (v11)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      v9 = *(int **)(*(_QWORD *)(a1 + 32) + 24);
      if (*v9 <= 90)
      {
        if (*v9 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au))
            goto LABEL_11;
          v9 = *(int **)(*(_QWORD *)(a1 + 32) + 24);
        }
        LogPrintF((uint64_t)v9, (uint64_t)"-[CUNANDataSession updateLinkStatus:]_block_invoke", 0x5Au, (uint64_t)"### Update link status without underlying data session", v3, v4, v5, v6, v10);
      }
    }
    else
    {
      objc_msgSend(v11, "updateLinkStatus:forDataSession:", *(_DWORD *)(a1 + 40) == 1, v7);
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = v2;
  objc_msgSend(v2, "updateLinkStatus:", *(_DWORD *)(a1 + 40) == 1);
LABEL_12:

}

void __32__CUNANDataSession_reportIssue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  int *v9;
  uint64_t v10;
  id v11;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  if (!v2)
  {
    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
    if (v11)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      v9 = *(int **)(*(_QWORD *)(a1 + 32) + 24);
      if (*v9 <= 90)
      {
        if (*v9 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au))
            goto LABEL_11;
          v9 = *(int **)(*(_QWORD *)(a1 + 32) + 24);
        }
        LogPrintF((uint64_t)v9, (uint64_t)"-[CUNANDataSession reportIssue:]_block_invoke", 0x5Au, (uint64_t)"### Report issue without underlying data session", v3, v4, v5, v6, v10);
      }
    }
    else
    {
      objc_msgSend(v11, "reportIssue:forDataSession:", *(_QWORD *)(a1 + 40), v7);
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = v2;
  objc_msgSend(v2, "reportIssue:", *(_QWORD *)(a1 + 40));
LABEL_12:

}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  if (v2)
  {
    v3 = v2;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E25DCDD0;
    v4 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v4;
    objc_msgSend(v3, "generateStatisticsReportWithCompletionHandler:", v21);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v5 + 112);
    v6 = *(void **)(v5 + 120);
    if (v3)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = (void *)*MEMORY[0x1E0CB2F90];
      v10 = v6;
      v11 = v3;
      NSErrorF_safe(v9, 4294960596, (uint64_t)"No underlying data session", v12, v13, v14, v15, v16, v19[0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v17);

    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = (uint64_t)__66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_4;
      v19[3] = (uint64_t)&unk_1E25DCDD0;
      v19[4] = v5;
      v20 = *(id *)(a1 + 40);
      v18 = v6;
      objc_msgSend(v3, "generateStatisticsReportForDataSession:completionHandler:", v18, v19);

    }
  }

}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E25DD058;
  v10 = v5;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
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
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E25DD058;
  v10 = v5;
  v11 = v6;
  v12 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

uint64_t __30__CUNANDataSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __43__CUNANDataSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
