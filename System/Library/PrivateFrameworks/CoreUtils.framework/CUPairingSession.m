@implementation CUPairingSession

- (CUPairingSession)init
{
  CUPairingSession *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUPairingSession;
  v2 = -[CUPairingSession init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUPairingSession;
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
  -[CUPairingSession _cleanup](self, "_cleanup");
  v4.receiver = self;
  v4.super_class = (Class)CUPairingSession;
  -[CUPairingSession dealloc](&v4, sel_dealloc);
}

- (void)_cleanup
{
  id completionHandler;
  id promptForPINHandler;
  id showPINHandler;
  id showPINHandlerEx;
  id hidePINHandler;
  id sendDataHandler;
  id sendMessageDataHandler;
  id signDataHandler;
  id verifySignatureHandler;
  id copyIdentityHandler;
  id findPeerHandler;
  id savePeerHandler;
  PairingSessionPrivate *pairingSession;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  showPINHandler = self->_showPINHandler;
  self->_showPINHandler = 0;

  showPINHandlerEx = self->_showPINHandlerEx;
  self->_showPINHandlerEx = 0;

  hidePINHandler = self->_hidePINHandler;
  self->_hidePINHandler = 0;

  sendDataHandler = self->_sendDataHandler;
  self->_sendDataHandler = 0;

  sendMessageDataHandler = self->_sendMessageDataHandler;
  self->_sendMessageDataHandler = 0;

  signDataHandler = self->_signDataHandler;
  self->_signDataHandler = 0;

  verifySignatureHandler = self->_verifySignatureHandler;
  self->_verifySignatureHandler = 0;

  copyIdentityHandler = self->_copyIdentityHandler;
  self->_copyIdentityHandler = 0;

  findPeerHandler = self->_findPeerHandler;
  self->_findPeerHandler = 0;

  savePeerHandler = self->_savePeerHandler;
  self->_savePeerHandler = 0;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
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
  v7 = qword_1EE065540;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (CUPairedPeer)pairedPeer
{
  PairingSessionPrivate *pairingSession;
  void *v3;
  id v4;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    v3 = (void *)*((_QWORD *)pairingSession + 33);
    if (v3)
      v4 = v3;
  }
  else
  {
    v3 = 0;
  }
  return (CUPairedPeer *)v3;
}

- (unint64_t)peerAppFlags
{
  PairingSessionPrivate *pairingSession;

  pairingSession = self->_pairingSession;
  if (pairingSession)
    return *((_QWORD *)pairingSession + 25);
  else
    return 0;
}

- (void)setSelfAppFlags:(unint64_t)a3
{
  PairingSessionPrivate *pairingSession;

  self->_selfAppFlags = a3;
  pairingSession = self->_pairingSession;
  if (pairingSession)
    *((_QWORD *)pairingSession + 26) = a3;
}

- (NSDictionary)appInfoPeer
{
  PairingSessionPrivate *pairingSession;
  void *v3;
  id v4;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    v3 = (void *)PairingSessionCopyProperty((uint64_t)pairingSession, CFSTR("appInfoPeer"), 0);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (NSDictionary)groupInfoPeer
{
  PairingSessionPrivate *pairingSession;
  void *v3;
  id v4;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    v3 = (void *)PairingSessionCopyProperty((uint64_t)pairingSession, CFSTR("groupInfoPeer"), 0);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CUPairingSession_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  uint64_t *p_pairingSession;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int is_recovery;
  PairingSessionPrivate *pairingSession;
  unsigned int flags;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *additionalPeerInfo;
  NSDictionary *additionalSelfInfo;
  NSArray *allowedMACAddresses;
  NSDictionary *appInfoSelf;
  NSDictionary *groupInfoSelf;
  NSString *myAppleID;
  CUAppleIDClient *myAppleIDInfoClient;
  NSString *peerAppleID;
  unint64_t selfAppFlags;
  uint64_t v31;
  PairingSessionPrivate *v32;
  PairingSessionPrivate *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  LogCategory *v38;
  const char *v39;
  uint64_t v40;
  LogCategory *v41;
  uint64_t sessionType;
  const char *v43;
  LogCategory *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _BYTE v56[72];
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  memset(v56, 0, sizeof(v56));
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession _activate]", 0x1Eu, (uint64_t)"Activate\n", v2, v3, v4, v5, v53);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (!self->_completionHandler)
  {
    v38 = self->_ucat;
    if (v38->var0 <= 90)
    {
      if (v38->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v38, 0x5Au))
          goto LABEL_83;
        v38 = self->_ucat;
      }
      v39 = "### No completionHandler\n";
      goto LABEL_72;
    }
LABEL_83:
    LODWORD(v40) = -6745;
    goto LABEL_84;
  }
  if (!self->_sendDataHandler && !self->_sendMessageDataHandler)
  {
    v38 = self->_ucat;
    if (v38->var0 <= 90)
    {
      if (v38->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v38, 0x5Au))
          goto LABEL_83;
        v38 = self->_ucat;
      }
      v39 = "### No sendDataHandler\n";
LABEL_72:
      LogPrintF((uint64_t)v38, (uint64_t)"-[CUPairingSession _activate]", 0x5Au, (uint64_t)v39, v2, v3, v4, v5, v53);
      goto LABEL_83;
    }
    goto LABEL_83;
  }
  memset(&v56[8], 0, 64);
  *(_QWORD *)v56 = self;
  if (self->_promptForPINHandler)
    *(_QWORD *)&v56[24] = _promptForPIN;
  if ((self->_flags & 0x80) != 0)
  {
    *(_QWORD *)&v56[8] = _showPIN;
LABEL_17:
    *(_QWORD *)&v56[16] = _hidePIN;
    goto LABEL_18;
  }
  if (self->_showPINHandler || self->_showPINHandlerEx)
    *(_QWORD *)&v56[8] = _showPIN;
  if (self->_hidePINHandler)
    goto LABEL_17;
LABEL_18:
  p_pairingSession = (uint64_t *)&self->_pairingSession;
  v9 = PairingSessionCreate((uint64_t *)&self->_pairingSession, (uint64_t)v56, self->_sessionType);
  if (v9)
  {
    LODWORD(v40) = v9;
    v41 = self->_ucat;
    if (v41->var0 <= 90)
    {
      if (v41->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v41, 0x5Au))
          goto LABEL_84;
        v41 = self->_ucat;
      }
      sessionType = self->_sessionType;
      if (sessionType > 0xE)
        v43 = "?";
      else
        v43 = off_1E25DEF00[sessionType];
      LogPrintF((uint64_t)v41, (uint64_t)"-[CUPairingSession _activate]", 0x5Au, (uint64_t)"### Create pairing session type %s failed: %#m\n", v10, v11, v12, v13, (uint64_t)v43);
    }
  }
  else
  {
    is_recovery = os_variant_is_recovery();
    pairingSession = self->_pairingSession;
    flags = self->_flags;
    if (!is_recovery)
      flags |= 4u;
    *((_DWORD *)pairingSession + 25) = flags;
    *((_QWORD *)pairingSession + 2) = self->_ucat;
    if (-[NSDictionary count](self->_acl, "count"))
      PairingSessionSetACL((uint64_t)self->_pairingSession, self->_acl);
    if (!-[NSString length](self->_fixedPIN, "length")
      || (v17 = ReplaceString((void **)self->_pairingSession + 48, (size_t *)self->_pairingSession + 49, (char *)-[NSString UTF8String](self->_fixedPIN, "UTF8String"), 0xFFFFFFFFFFFFFFFFLL), !(_DWORD)v17))
    {
      additionalPeerInfo = self->_additionalPeerInfo;
      if (additionalPeerInfo)
        PairingSessionSetAdditionalPeerInfo(*p_pairingSession, additionalPeerInfo);
      additionalSelfInfo = self->_additionalSelfInfo;
      if (additionalSelfInfo)
        PairingSessionSetAdditionalSelfInfo(*p_pairingSession, additionalSelfInfo);
      allowedMACAddresses = self->_allowedMACAddresses;
      if (allowedMACAddresses)
        PairingSessionSetProperty(*p_pairingSession, CFSTR("allowedMACAddresses"), allowedMACAddresses);
      appInfoSelf = self->_appInfoSelf;
      if (appInfoSelf)
        PairingSessionSetProperty(*p_pairingSession, CFSTR("appInfoSelf"), appInfoSelf);
      groupInfoSelf = self->_groupInfoSelf;
      if (groupInfoSelf)
        PairingSessionSetProperty(*p_pairingSession, CFSTR("groupInfoSelf"), groupInfoSelf);
      if (self->_pinType)
        PairingSessionSetProperty(*p_pairingSession, CFSTR("setupCodeType"), (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"));
      myAppleID = self->_myAppleID;
      if (myAppleID)
        PairingSessionSetMyAppleID(*p_pairingSession, myAppleID);
      myAppleIDInfoClient = self->_myAppleIDInfoClient;
      if (myAppleIDInfoClient)
        PairingSessionSetMyAppleIDInfoClient(*p_pairingSession, myAppleIDInfoClient);
      peerAppleID = self->_peerAppleID;
      if (peerAppleID)
        PairingSessionSetPeerAppleID(*p_pairingSession, peerAppleID);
      selfAppFlags = self->_selfAppFlags;
      if (selfAppFlags)
        *(_QWORD *)(*p_pairingSession + 208) = selfAppFlags;
      v31 = MEMORY[0x1E0C809B0];
      if (self->_signDataHandler)
      {
        v32 = self->_pairingSession;
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __29__CUPairingSession__activate__block_invoke;
        v55[3] = &unk_1E25DD198;
        v55[4] = self;
        PairingSessionSetSignBytesHandler_b((uint64_t)v32, v55);
      }
      if (self->_verifySignatureHandler)
      {
        v33 = self->_pairingSession;
        v54[0] = v31;
        v54[1] = 3221225472;
        v54[2] = __29__CUPairingSession__activate__block_invoke_2;
        v54[3] = &unk_1E25DD198;
        v54[4] = self;
        PairingSessionSetVerifySignatureHandler_b((uint64_t)v33, v54);
      }
      v34 = _Block_copy(self->_copyIdentityHandler);
      if (v34)
        PairingSessionSetCopyIdentityHandler_b(*p_pairingSession, v34);

      v35 = _Block_copy(self->_findPeerHandler);
      if (v35)
        PairingSessionSetFindPeerHandler_b(*p_pairingSession, v35);

      v36 = _Block_copy(self->_savePeerHandler);
      if (v36)
        PairingSessionSetSavePeerHandler_b(*p_pairingSession, v36);

      v37 = self->_sessionType;
      if (v37 <= 0xD && ((1 << v37) & 0x2A2A) != 0)
        -[CUPairingSession _receivedData:flags:](self, "_receivedData:flags:", 0, 1);
      return;
    }
    v40 = v17;
    v44 = self->_ucat;
    if (v44->var0 <= 90)
    {
      if (v44->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v44, 0x5Au))
          goto LABEL_84;
        v44 = self->_ucat;
      }
      LogPrintF((uint64_t)v44, (uint64_t)"-[CUPairingSession _activate]", 0x5Au, (uint64_t)"### Set fixed PIN failed: %#m\n", v18, v19, v20, v21, v40);
    }
  }
LABEL_84:
  v45 = (void *)MEMORY[0x1E0CB35C8];
  v46 = *MEMORY[0x1E0CB2F90];
  v47 = (int)v40;
  v57 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v40, 0, 0));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  v50 = CFSTR("?");
  if (v48)
    v50 = (const __CFString *)v48;
  v58[0] = v50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "errorWithDomain:code:userInfo:", v46, v47, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUPairingSession _completed:](self, "_completed:", v52);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUPairingSession_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_completed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *p_completionHandler;
  LogCategory *ucat;
  PairingSessionPrivate *pairingSession;
  NSDictionary *v11;
  NSDictionary *aclActual;
  NSDictionary *v13;
  NSDictionary *peerInfo;
  LogCategory *v15;
  id v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v18)
  {
    p_completionHandler = &self->_completionHandler;
    if (self->_completionHandler)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 50)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u))
            goto LABEL_18;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession _completed:]", 0x32u, (uint64_t)"### Pairing failed: %{error}\n", v4, v5, v6, v7, (uint64_t)v18);
      }
LABEL_18:
      (*((void (**)(void))*p_completionHandler + 2))();
      v16 = *p_completionHandler;
      *p_completionHandler = 0;

    }
  }
  else
  {
    pairingSession = self->_pairingSession;
    if (pairingSession)
    {
      v11 = (NSDictionary *)*((_QWORD *)pairingSession + 34);
      if (v11)
        CFRetain(*((CFTypeRef *)pairingSession + 34));
      aclActual = self->_aclActual;
      self->_aclActual = v11;

      v13 = (NSDictionary *)PairingSessionCopyPeerInfo(self->_pairingSession, 0);
      peerInfo = self->_peerInfo;
      self->_peerInfo = v13;

    }
    p_completionHandler = &self->_completionHandler;
    if (self->_completionHandler)
    {
      v15 = self->_ucat;
      if (v15->var0 <= 30)
      {
        if (v15->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v15, 0x1Eu))
            goto LABEL_18;
          v15 = self->_ucat;
        }
        LogPrintF((uint64_t)v15, (uint64_t)"-[CUPairingSession _completed:]", 0x1Eu, (uint64_t)"Pairing completed\n", v4, v5, v6, v7, v17);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
  }

}

- (void)receivedMessageData:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CUPairingSession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CUPairingSession_receivedMessageData___block_invoke;
  v7[3] = &unk_1E25DE628;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)receivedData:(id)a3
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
  v7[2] = __33__CUPairingSession_receivedData___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_receivedData:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PairingSessionPrivate *pairingSession;
  id v13;
  unsigned __int8 *v14;
  CFIndex v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  CFMutableDataRef DataMutable;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFMutableDataRef v32;
  void (**sendDataHandler)(id, _QWORD, void *);
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  LogCategory *ucat;
  const char *v44;
  unsigned int v45;
  uint64_t v46;
  LogCategory *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  size_t v55;
  void *v56;
  unsigned int v57;
  uint64_t v58;
  const __CFString *v59;
  const __CFString *v60;
  _QWORD v61[2];

  v4 = *(_QWORD *)&a4;
  v61[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = v6;
  v55 = 0;
  v56 = 0;
  v54 = 0;
  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    v57 = -6745;
    ucat = self->_ucat;
    if (ucat->var0 > 90)
      goto LABEL_13;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        goto LABEL_13;
      ucat = self->_ucat;
    }
    v44 = "### Use before activate\n";
    v45 = 90;
    goto LABEL_31;
  }
  v13 = objc_retainAutorelease(v6);
  v14 = (unsigned __int8 *)objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");
  v18 = PairingSessionExchange((uint64_t)pairingSession, v14, v15, (char **)&v56, &v55, (uint64_t)&v54, v16, v17);
  v57 = v18;
  if ((_DWORD)v18)
  {
    v42 = v18;
    if ((_DWORD)v18 == -6771)
    {
      v57 = 0;
      ucat = self->_ucat;
      if (ucat->var0 > 30)
        goto LABEL_13;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_13;
        ucat = self->_ucat;
      }
      v44 = "Waiting for user input\n";
    }
    else
    {
      ucat = self->_ucat;
      if (ucat->var0 > 30)
        goto LABEL_13;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_13;
        ucat = self->_ucat;
      }
      v53 = v42;
      v44 = "### Pairing failed: %#m\n";
    }
    v45 = 30;
LABEL_31:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession _receivedData:flags:]", v45, (uint64_t)v44, v7, v8, v9, v10, v53);
    goto LABEL_13;
  }
  v19 = v56;
  if (!v56)
  {
    if (!v54)
      goto LABEL_15;
LABEL_12:
    -[CUPairingSession _completed:](self, "_completed:", 0);
    goto LABEL_13;
  }
  v20 = objc_alloc(MEMORY[0x1E0C99D50]);
  v21 = objc_msgSend(v20, "initWithBytesNoCopy:length:freeWhenDone:", v19, v55, 1);
  v22 = (void *)v21;
  v56 = 0;
  if (!self->_sendMessageDataHandler)
  {
    sendDataHandler = (void (**)(id, _QWORD, void *))self->_sendDataHandler;
    if (sendDataHandler)
      sendDataHandler[2](sendDataHandler, v4, v22);
LABEL_11:

    if (!v54)
      goto LABEL_13;
    goto LABEL_12;
  }
  v60 = CFSTR("_pd");
  v61[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  DataMutable = OPACKEncoderCreateDataMutable(v23, 0, (int *)&v57);
  if (DataMutable)
  {
    v32 = DataMutable;
    (*((void (**)(void))self->_sendMessageDataHandler + 2))();

    goto LABEL_11;
  }
  if (v57)
    v46 = v57;
  else
    v46 = 4294960596;
  v57 = v46;
  v47 = self->_ucat;
  if (v47->var0 > 30)
    goto LABEL_45;
  if (v47->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      goto LABEL_45;
    v47 = self->_ucat;
    v46 = v57;
  }
  NSPrintF((uint64_t)"%#m", v25, v26, v27, v28, v29, v30, v31, v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  LogPrintF((uint64_t)v47, (uint64_t)"-[CUPairingSession _receivedData:flags:]", 0x1Eu, (uint64_t)"### Encode message failed: %@", v49, v50, v51, v52, (uint64_t)v48);

LABEL_45:
LABEL_13:
  if (v56)
    free(v56);
LABEL_15:
  v34 = (int)v57;
  if (v57)
  {
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2F90];
    v58 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v57, 0, 0));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    v39 = CFSTR("?");
    if (v37)
      v39 = (const __CFString *)v37;
    v59 = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, v34, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession _completed:](self, "_completed:", v41);

  }
}

- (void)tryPIN:(id)a3
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
  v7[2] = __27__CUPairingSession_tryPIN___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_tryPIN:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  LogCategory *ucat;
  PairingSessionPrivate *pairingSession;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  LogCategory *v16;
  uint64_t v17;
  LogCategory *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession _tryPIN:]", 0x1Eu, (uint64_t)"Try PIN\n", v4, v5, v6, v7, v27);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    v16 = self->_ucat;
    if (v16->var0 <= 90)
    {
      if (v16->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v16, 0x5Au))
          goto LABEL_17;
        v16 = self->_ucat;
      }
      LogPrintF((uint64_t)v16, (uint64_t)"-[CUPairingSession _tryPIN:]", 0x5Au, (uint64_t)"Try PIN without activate\n", v4, v5, v6, v7, v27);
    }
LABEL_17:
    LODWORD(v17) = -6745;
    goto LABEL_18;
  }
  v11 = ReplaceString((void **)pairingSession + 48, (size_t *)pairingSession + 49, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0xFFFFFFFFFFFFFFFFLL);
  if (!(_DWORD)v11)
  {
    -[CUPairingSession _receivedData:flags:](self, "_receivedData:flags:", 0, 0);
    goto LABEL_8;
  }
  v17 = v11;
  v18 = self->_ucat;
  if (v18->var0 <= 90)
  {
    if (v18->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v18, 0x5Au))
        goto LABEL_18;
      v18 = self->_ucat;
    }
    LogPrintF((uint64_t)v18, (uint64_t)"-[CUPairingSession _tryPIN:]", 0x5Au, (uint64_t)"### Set PIN failed: %#m\n", v12, v13, v14, v15, v17);
  }
LABEL_18:
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v20 = *MEMORY[0x1E0CB2F90];
  v21 = (int)v17;
  v28 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = CFSTR("?");
  if (v22)
    v24 = (const __CFString *)v22;
  v29[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUPairingSession _completed:](self, "_completed:", v26);

LABEL_8:
}

- (id)openStreamWithName:(id)a3 error:(id *)a4
{
  return -[CUPairingSession openStreamWithName:type:error:](self, "openStreamWithName:type:error:", a3, 1, a4);
}

- (id)openStreamWithName:(id)a3 type:(int)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  LogCategory *ucat;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t (***v21)();
  uint64_t (**v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  CUPairingStream *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  LogCategory *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  CryptoAEADPrivate *v49;
  char *v50;
  uint64_t v51;
  CryptoAEADPrivate *v52;
  NSMutableDictionary *pairingStreams;
  NSMutableDictionary *v54;
  NSMutableDictionary *v55;
  CUPairingStream *v56;
  CUPairingStream *v57;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  unsigned int v63;
  _BYTE __s[32];
  uint64_t v65;

  v6 = *(_QWORD *)&a4;
  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v63 = 0;
  v62 = 0;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession openStreamWithName:type:error:]", 0x1Eu, (uint64_t)"Open stream '%@'\n", v8, v9, v10, v11, (uint64_t)v12);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (!objc_msgSend(v12, "length"))
  {
    v33 = "EmptyName";
    v34 = 4294960552;
LABEL_14:
    NSErrorWithOSStatusF(v34, (uint64_t)v33, v14, v15, v16, v17, v18, v19, v60);
LABEL_15:
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    goto LABEL_16;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pairingStreams, "objectForKeyedSubscript:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    NSErrorWithOSStatusF(4294960575, (uint64_t)"Stream '%@' already used", v14, v15, v16, v17, v18, v19, (uint64_t)v12);
    goto LABEL_15;
  }
  if ((_DWORD)v6 != 1)
  {
    if ((_DWORD)v6 == 2)
    {
      v21 = &kCryptoAEADDescriptorAESGCM;
      goto LABEL_11;
    }
    v60 = v6;
    v33 = "Bad stream type: %d";
    v34 = 4294960591;
    goto LABEL_14;
  }
  v21 = kCryptoAEADDescriptorChaCha20Poly1305;
LABEL_11:
  v22 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))*v21;
  v23 = objc_alloc_init(CUPairingStream);
  -[CUPairingStream setAuthTagLength:](v23, "setAuthTagLength:", 16);
  -[CUPairingStream setName:](v23, "setName:", v12);
  v30 = self->_sessionType - 1;
  if (v30 > 0xC)
  {
    v32 = "ClientEncrypt-%@";
    v31 = "ServerEncrypt-%@";
  }
  else
  {
    v31 = off_1E25DD240[v30];
    v32 = off_1E25DD2A8[v30];
  }
  ASPrintF((void **)&v62, (uint64_t)v31, v24, v25, v26, v27, v28, v29, (uint64_t)v12);
  v47 = v62;
  if (!v62)
  {
    v59 = "CreateEncryptInfoFailed";
LABEL_44:
    v51 = 4294960568;
    goto LABEL_50;
  }
  v48 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](self, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", ", 0, v62, strlen(v62), 32, __s);
  v63 = v48;
  free(v47);
  v62 = 0;
  if ((_DWORD)v48)
  {
    v59 = "DeriveEncryptKeyFailed";
    v51 = v48;
LABEL_50:
    NSErrorWithOSStatusF(v51, (uint64_t)v59, v41, v42, v43, v44, v45, v46, v61);
    v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    if (!v35)
      goto LABEL_33;
    v40 = self->_ucat;
    if (v40->var0 <= 60)
    {
      if (v40->var0 != -1)
      {
LABEL_19:
        LogPrintF((uint64_t)v40, (uint64_t)"-[CUPairingSession openStreamWithName:type:error:]", 0x3Cu, (uint64_t)"### Open stream '%@' failed: %{error}\n", v36, v37, v38, v39, (uint64_t)v12);
        goto LABEL_31;
      }
      if (_LogCategory_Initialize((uint64_t)v40, 0x3Cu))
      {
        v40 = self->_ucat;
        goto LABEL_19;
      }
    }
LABEL_31:
    if (a5)
    {
      v35 = objc_retainAutorelease(v35);
      v56 = 0;
      *a5 = v35;
      goto LABEL_34;
    }
LABEL_33:
    v56 = 0;
    goto LABEL_34;
  }
  v49 = (CryptoAEADPrivate *)CryptoAEADCreate(v22, 1, (uint64_t)__s, 32, (int *)&v63);
  v23->_encryptAEAD = v49;
  if (!v49)
  {
    if (v63)
      v51 = v63;
    else
      v51 = 4294960596;
    v59 = "CreateEncryptAEADFailed";
    goto LABEL_50;
  }
  ASPrintF((void **)&v62, (uint64_t)v32, v41, v42, v43, v44, v45, v46, (uint64_t)v12);
  v50 = v62;
  if (!v62)
  {
    v59 = "CreateDecryptInfoFailed";
    goto LABEL_44;
  }
  v63 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](self, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", ", 0, v62, strlen(v62), 32, __s);
  free(v50);
  v62 = 0;
  v51 = v63;
  if (v63)
  {
    v59 = "DeriveDecryptKeyFailed";
    goto LABEL_50;
  }
  v52 = (CryptoAEADPrivate *)CryptoAEADCreate(v22, 2, (uint64_t)__s, 32, (int *)&v63);
  v23->_decryptAEAD = v52;
  if (!v52)
  {
    if (v63)
      v51 = v63;
    else
      v51 = 4294960596;
    v59 = "CreateDecryptAEADFailed";
    goto LABEL_50;
  }
  pairingStreams = self->_pairingStreams;
  if (!pairingStreams)
  {
    v54 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55 = self->_pairingStreams;
    self->_pairingStreams = v54;

    pairingStreams = self->_pairingStreams;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](pairingStreams, "setObject:forKeyedSubscript:", v23, v12);
  v56 = v23;
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  v35 = 0;
  v23 = v56;
LABEL_34:
  v57 = v56;

  return v57;
}

- (void)closeStream:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  _BOOL4 v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ucat = self->_ucat;
  v12 = v4;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession closeStream:]", 0x1Eu, (uint64_t)"Close stream '%@'\n", v5, v6, v7, v8, (uint64_t)v4);
      v4 = v12;
      goto LABEL_5;
    }
    v10 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    v4 = v12;
    if (v10)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pairingStreams, "objectForKeyedSubscript:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cleanup");

    v4 = v12;
  }

}

- (int)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 outputKeyPtr:(void *)a8
{
  PairingSessionPrivate *pairingSession;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  LogCategory *ucat;
  LogCategory *v17;
  uint64_t v18;

  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_11;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]", 0x5Au, (uint64_t)"### Derive key before activate\n", (uint64_t)a5, a6, a7, (uint64_t)a8, v18);
    }
LABEL_11:
    LODWORD(v14) = -6745;
    return v14;
  }
  v14 = PairingSessionDeriveKey((uint64_t)pairingSession, (char *)a3, a4, (uint64_t)a5, a6, a7, (uint64_t)a8);
  if ((_DWORD)v14)
  {
    v17 = self->_ucat;
    if (v17->var0 <= 90)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au))
          return v14;
        v17 = self->_ucat;
      }
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]", 0x5Au, (uint64_t)"### Derive key failed: %#m\n", v10, v11, v12, v13, v14);
    }
  }
  return v14;
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)aclActual
{
  return self->_aclActual;
}

- (NSDictionary)additionalPeerInfo
{
  return self->_additionalPeerInfo;
}

- (void)setAdditionalPeerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)additionalSelfInfo
{
  return self->_additionalSelfInfo;
}

- (void)setAdditionalSelfInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)selfAppFlags
{
  return self->_selfAppFlags;
}

- (NSDictionary)appInfoSelf
{
  return self->_appInfoSelf;
}

- (void)setAppInfoSelf:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSDictionary)groupInfoSelf
{
  return self->_groupInfoSelf;
}

- (void)setGroupInfoSelf:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setFixedPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSString)label
{
  return self->_label;
}

- (int)peerDeviceClass
{
  return self->_peerDeviceClass;
}

- (void)setPeerDeviceClass:(int)a3
{
  self->_peerDeviceClass = a3;
}

- (NSDictionary)peerInfo
{
  return self->_peerInfo;
}

- (unsigned)pinType
{
  return self->_pinType;
}

- (void)setPinType:(unsigned int)a3
{
  self->_pinType = a3;
}

- (unsigned)pinTypeActual
{
  return self->_pinTypeActual;
}

- (unsigned)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unsigned int)a3
{
  self->_sessionType = a3;
}

- (NSData)mfiCertificateData
{
  return self->_mfiCertificateData;
}

- (void)setMfiCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)mfiProductType
{
  return self->_mfiProductType;
}

- (void)setMfiProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)mfiSerialNumber
{
  return self->_mfiSerialNumber;
}

- (void)setMfiSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)mfiToken
{
  return self->_mfiToken;
}

- (void)setMfiToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (CUAppleIDClient)myAppleIDInfoClient
{
  return self->_myAppleIDInfoClient;
}

- (void)setMyAppleIDInfoClient:(id)a3
{
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, a3);
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (void)setPeerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (id)sendMessageDataHandler
{
  return self->_sendMessageDataHandler;
}

- (void)setSendMessageDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (id)signDataHandler
{
  return self->_signDataHandler;
}

- (void)setSignDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)verifySignatureHandler
{
  return self->_verifySignatureHandler;
}

- (void)setVerifySignatureHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)copyIdentityHandler
{
  return self->_copyIdentityHandler;
}

- (void)setCopyIdentityHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)findPeerHandler
{
  return self->_findPeerHandler;
}

- (void)setFindPeerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)savePeerHandler
{
  return self->_savePeerHandler;
}

- (void)setSavePeerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_savePeerHandler, 0);
  objc_storeStrong(&self->_findPeerHandler, 0);
  objc_storeStrong(&self->_copyIdentityHandler, 0);
  objc_storeStrong(&self->_verifySignatureHandler, 0);
  objc_storeStrong(&self->_signDataHandler, 0);
  objc_storeStrong(&self->_sendMessageDataHandler, 0);
  objc_storeStrong(&self->_sendDataHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_mfiToken, 0);
  objc_storeStrong((id *)&self->_mfiSerialNumber, 0);
  objc_storeStrong((id *)&self->_mfiProductType, 0);
  objc_storeStrong((id *)&self->_mfiCertificateData, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_groupInfoSelf, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appInfoSelf, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_additionalSelfInfo, 0);
  objc_storeStrong((id *)&self->_additionalPeerInfo, 0);
  objc_storeStrong((id *)&self->_aclActual, 0);
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_pairingStreams, 0);
}

uint64_t __27__CUPairingSession_tryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tryPIN:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__CUPairingSession_receivedData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedData:flags:", *(_QWORD *)(a1 + 40), 0);
}

void __40__CUPairingSession_receivedMessageData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  CFTypeID TypeID;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;

  v23 = -6700;
  v7 = (__CFString *)OPACKDecodeData(*(const __CFData **)(a1 + 32), 8u, &v23);
  if (!v7)
  {
    v17 = *(void **)(a1 + 40);
    v18 = (void *)*MEMORY[0x1E0CB2F90];
    if (v23)
      v19 = v23;
    else
      v19 = 4294960596;
    v20 = "Decode message failed";
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = *(void **)(a1 + 40);
    v18 = (void *)*MEMORY[0x1E0CB2F90];
    v20 = "Not a dictionary";
    v19 = 4294960540;
LABEL_11:
    NSErrorF_safe(v18, v19, (uint64_t)v20, v2, v3, v4, v5, v6, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_completed:", v16);
    goto LABEL_5;
  }
  TypeID = CFDataGetTypeID();
  CFDictionaryGetTypedValue((const __CFDictionary *)v7, CFSTR("_pd"), TypeID, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  if (v9)
  {
    v16 = (void *)v9;
    objc_msgSend(v15, "receivedData:", v9);
  }
  else
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960591, (uint64_t)"No pairing data", v10, v11, v12, v13, v14, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_completed:", v21);

    v16 = 0;
  }
LABEL_5:

}

uint64_t __30__CUPairingSession_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  const void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const char **v19;
  const char *v20;
  int v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 24);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUPairingSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v28);
      v9 = *(_QWORD *)(a1 + 32);
      goto LABEL_5;
    }
    v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    v9 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v10 = *(int **)(v9 + 24);
      goto LABEL_3;
    }
  }
LABEL_5:
  v12 = *(const void **)(v9 + 8);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    v9 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v9 + 16), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_6465);
  v13 = *(void **)(a1 + 32);
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v15 = *MEMORY[0x1E0CB2F90];
  v29 = *MEMORY[0x1E0CB2D50];
  v16 = (void *)MEMORY[0x1E0CB3940];
  if (MEMORY[0x1E0D1B9C8] && (v17 = CUErrorCodesTableGet(), (v18 = *(const char **)(v17 + 8)) != 0))
  {
    if (*(_DWORD *)v17 != -6723)
    {
      v19 = (const char **)(v17 + 24);
      v18 = "";
      while (1)
      {
        v20 = *v19;
        if (!*v19)
          break;
        v21 = *((_DWORD *)v19 - 2);
        v19 += 2;
        if (v21 == -6723)
        {
          v18 = v20;
          break;
        }
      }
    }
  }
  else
  {
    v18 = "";
  }
  objc_msgSend(v16, "stringWithUTF8String:", v18);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = CFSTR("?");
  if (v22)
    v24 = (const __CFString *)v22;
  v30[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, -6723, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_completed:", v26);

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

uint64_t __30__CUPairingSession_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_cleanup");
}

uint64_t __29__CUPairingSession__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  void (**v9)(void *, _QWORD, void *, id *);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v20;

  v9 = (void (**)(void *, _QWORD, void *, id *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 264));
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
    v20 = 0;
    v9[2](v9, a2, v10, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    v13 = v12;
    if (v11)
    {
      if (objc_msgSend(v11, "length") == 64)
      {
        v14 = (__int128 *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
        v15 = 0;
        v16 = v14[3];
        v18 = *v14;
        v17 = v14[1];
        a5[2] = v14[2];
        a5[3] = v16;
        *a5 = v18;
        a5[1] = v17;
      }
      else
      {
        v15 = 4294960553;
      }
    }
    else if (v12)
    {
      v15 = NSErrorToOSStatusEx(v12, 0);
    }
    else
    {
      v15 = 4294960596;
    }

  }
  else
  {
    v15 = 4294960573;
  }

  return v15;
}

uint64_t __29__CUPairingSession__activate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v9)(void *, _QWORD, void *, void *, id *);
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v17;

  v9 = (uint64_t (**)(void *, _QWORD, void *, void *, id *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32)
                                                                                                 + 272));
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a5, 64);
    v17 = 0;
    v12 = v9[2](v9, a2, v10, v11, &v17);
    v13 = v17;
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      v15 = 0;
    }
    else if (v13)
    {
      v15 = NSErrorToOSStatusEx(v13, 0);
    }
    else
    {
      v15 = 4294960596;
    }

  }
  else
  {
    v15 = 4294960573;
  }

  return v15;
}

uint64_t __28__CUPairingSession_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

@end
