@implementation IDSFTGL

- (void)startWithOptions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  NSString *idsSessionID;
  objc_super v10;
  uint8_t buf[4];
  IDSFTGL *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_FTGL(IDSFoundationLog, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    idsSessionID = self->super._idsSessionID;
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = idsSessionID;
    _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "Start GL %@ for IDSSessionID: %@ (FaceTime:YES, isMultiway:NO).", buf, 0x16u);
  }

  self->super._startPort = 16393;
  self->super._portRange = 10;
  v10.receiver = self;
  v10.super_class = (Class)IDSFTGL;
  -[IDSGlobalLink startWithOptions:](&v10, sel_startWithOptions_, v4);

  self->super._shouldProcessBasebandNotification = 1;
  self->super._supportChannelData = 1;
}

- (void)disconnectWithCompletionHandler:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IDSFTGL;
  -[IDSGlobalLink disconnectWithCompletionHandler:](&v10, sel_disconnectWithCompletionHandler_, a3);
  objc_msgSend__sendSessionDisconnectedCommand(self, v4, v5, v6);
  objc_msgSend__startDisconnectTimer(self, v7, v8, v9);
}

- (BOOL)_postProcessAllocbindResponse:(id)a3 candidatePair:(id)a4 candidatePairToken:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  double v13;
  BOOL v14;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v12 = a5;
  if (!self->super._enableSKE || self->super._skeToRemoteComplete)
  {
LABEL_3:
    v14 = 0;
    goto LABEL_4;
  }
  if (!self->super._skeData
    || (objc_msgSend_isAcceptedRelaySession(v9, v10, v11, v13) & 1) == 0 && self->super._isInitiator)
  {
    if (!self->super._delaySessionConnected)
    {
      self->super._delaySessionConnected = 1;
      OSLogHandleForTransportCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "_postProcessAllocbindResponse: SKE data is not ready, delay session connected.", v21, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_postProcessAllocbindResponse: SKE data is not ready, delay session connected."));
          v14 = 0;
          if (!_IDSShouldLog())
            goto LABEL_4;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_postProcessAllocbindResponse: SKE data is not ready, delay session connected."));
        }
      }
    }
    goto LABEL_3;
  }
  OSLogHandleForTransportCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "_postProcessAllocbindResponse: send SKE data", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("_postProcessAllocbindResponse: send SKE data"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("_postProcessAllocbindResponse: send SKE data"));
    }
  }
  objc_msgSend__sendSKEDataWithSelectedCandidatePair(self, v18, v19, v20);
  v14 = 1;
LABEL_4:

  return v14;
}

- (void)setHasPendingAllocation:(BOOL)a3
{
  self->super._hasPendingAllocation = a3;
}

- (void)sendSKEData:(id)a3
{
  id v5;
  NSData **p_skeData;
  NSObject *v7;
  NSData *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  NSData *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  NSData *v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->super._enableSKE)
  {
    p_skeData = &self->super._skeData;
    if (self->super._skeData)
    {
      OSLogHandleForTransportCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *p_skeData;
        *(_DWORD *)buf = 134217984;
        v19 = (const __CFString *)v8;
        _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "already has pending SKE data %p, ignore.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("already has pending SKE data %p, ignore."));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("already has pending SKE data %p, ignore."));
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->super._skeData, a3);
      OSLogHandleForTransportCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_skeData;
        *(_DWORD *)buf = 134217984;
        v19 = (const __CFString *)v12;
        _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "add SKE data %p.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v17 = *p_skeData;
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("add SKE data %p."));
          if (_IDSShouldLog())
          {
            v17 = *p_skeData;
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("add SKE data %p."));
          }
        }
      }
      self->super._skeToRemoteComplete = 0;
      if (self->super._delaySessionConnected)
      {
        OSLogHandleForTransportCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "session connected is delayed, send SKE data immediately.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("session connected is delayed, send SKE data immediately."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("session connected is delayed, send SKE data immediately."));
          }
        }
        objc_msgSend__sendSKEDataToSucceededCandidatePairs(self, v14, v15, v16, v17);
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._enableSKE)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "send SKE data failed (EnableSKE:%@).", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("send SKE data failed (EnableSKE:%@)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("send SKE data failed (EnableSKE:%@)."));
      }
    }
  }

}

- (void)setDefaultUnderlyingLink:(char)a3
{
  double v3;
  uint64_t v4;
  const char *v6;
  void *v7;
  double v8;
  NSMutableDictionary *linkIDToCandidatePairs;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (self->super._isInitiator)
  {
    if (!self->super._linkIDToCandidatePairs)
      goto LABEL_6;
    objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], a2, a3, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_6;
    linkIDToCandidatePairs = self->super._linkIDToCandidatePairs;
    objc_msgSend_numberWithChar_(MEMORY[0x1E0CB37E8], v6, v4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)CFDictionaryGetValue((CFDictionaryRef)linkIDToCandidatePairs, v10);

    if (v20)
    {
      objc_msgSend_candidatePairToken(v20, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__nominateCandidatePair_(self, v15, (uint64_t)v14, v16);

    }
    else
    {
LABEL_6:
      OSLogHandleForTransportCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v22 = v4;
        _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "failed to find candidate pair for linkID:%d.", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to find candidate pair for linkID:%d."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to find candidate pair for linkID:%d."));
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._isInitiator)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      *(_DWORD *)buf = 67109378;
      v22 = v4;
      v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "set default underlying link (linkID:%d) failed (isInitiator:%@).", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("set default underlying link (linkID:%d) failed (isInitiator:%@)."));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("set default underlying link (linkID:%d) failed (isInitiator:%@)."));
      }
    }
  }
}

- (BOOL)_setupNewQRLinkIfNecessary:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  unsigned int v8;
  BOOL v9;
  NSObject *v10;
  _BOOL4 isInitiator;
  const __CFString *v12;
  const __CFString *v13;
  NSObject *v15;
  objc_super v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    if (self->super._allowOnlyOneQR || !self->super._isInitiator)
    {
      objc_msgSend_FTGL(IDSFoundationLog, v4, v5, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        isInitiator = self->super._isInitiator;
        if (self->super._allowOnlyOneQR)
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        if (isInitiator)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        v19 = 0;
        v20 = 2112;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "skip set up new QR link (relaySessionID:%@, FaceTime:YES, allowOnlyOneQR:%@, isInitiator:%@).", buf, 0x20u);
      }

    }
    else
    {
      if (!self->super._hasPendingAllocation)
        goto LABEL_2;
      objc_msgSend_FTGL(IDSFoundationLog, v4, v5, v7);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = 0;
        _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "skip set up new QR link, allocation is pending, relaySessionID: %@", buf, 0xCu);
      }

    }
    v9 = 0;
    goto LABEL_16;
  }
LABEL_2:
  v17.receiver = self;
  v17.super_class = (Class)IDSFTGL;
  v8 = -[IDSGlobalLink _setupNewQRLinkIfNecessary:](&v17, sel__setupNewQRLinkIfNecessary_, v6);
  v9 = v8;
  if (!v6 && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)IDSFTGL;
    -[IDSGlobalLink _requestNewTwoWayQRAllocation:](&v16, sel__requestNewTwoWayQRAllocation_, 0);
    v9 = 1;
  }
LABEL_16:

  return v9;
}

- (void)_resetRetryCountForCandidatePair:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  int isRelayStunCandidatePair;
  uint64_t v9;
  NSMutableDictionary *retryCountPerLinkType;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  int v20;
  double v21;
  NSMutableDictionary *v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;

  v4 = a3;
  v7 = v4;
  if (self->super._isInitiator)
  {
    v29 = v4;
    isRelayStunCandidatePair = objc_msgSend_isRelayStunCandidatePair(v4, (const char *)v4, v5, v6);
    v7 = v29;
    if (isRelayStunCandidatePair)
    {
      v9 = GLUtilLinkTypeMaskForCandidatePair(v29);
      retryCountPerLinkType = self->super._retryCountPerLinkType;
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v11, v9, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(retryCountPerLinkType, v14, (uint64_t)v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_intValue(v16, v17, v18, v19);

      v7 = v29;
      if (v20 >= 1)
      {
        v22 = self->super._retryCountPerLinkType;
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], (const char *)v29, 0, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v24, v9, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v22, v27, (uint64_t)v23, v28, v26);

        v7 = v29;
      }
    }
  }

}

- (BOOL)_postProcessQUICAllocbindResponse:(id)a3 candidatePair:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v5 = a4;
  objc_msgSend_candidatePairToken(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend__postProcessAllocbindResponse_candidatePair_candidatePairToken_(self, v10, 0, v11, v5, v9);

  return (char)self;
}

@end
