@implementation CUBonjourAdvertiser

- (CUBonjourAdvertiser)init
{
  CUBonjourAdvertiser *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUBonjourAdvertiser;
  v2 = -[CUBonjourAdvertiser init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBonjourAdvertiser;
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
  v4.super_class = (Class)CUBonjourAdvertiser;
  -[CUBonjourAdvertiser dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[CUBonjourAdvertiser descriptionWithLevel:](self, "descriptionWithLevel:", 50);
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
  NSString *name;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t advertiseFlags;
  __CFString *v28;
  NSString *domain;
  __CFString *v30;
  uint64_t interfaceIndex;
  __CFString *v32;
  NSString *interfaceName;
  __CFString *v34;
  uint64_t v35;
  CFMutableStringRef *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSDictionary *txtDictionary;
  CFMutableStringRef *v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  CFMutableStringRef v55;
  CFMutableStringRef v56;
  CFMutableStringRef v57;
  CFMutableStringRef v58;
  CFMutableStringRef v59;
  CFMutableStringRef v60;
  CFMutableStringRef v61;
  CFMutableStringRef v62;
  CFMutableStringRef v63;
  CFMutableStringRef v64;
  CFMutableStringRef v65;

  v65 = 0;
  NSAppendPrintF(&v65, (uint64_t)"CUBonjourAdvertiser %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  v10 = v65;
  v17 = v10;
  name = self->_name;
  if (name)
  {
    v64 = v10;
    NSAppendPrintF(&v64, (uint64_t)", Name '%@'", v11, v12, v13, v14, v15, v16, (uint64_t)name);
    v19 = v64;

    v17 = v19;
  }
  v63 = v17;
  NSAppendPrintF(&v63, (uint64_t)", Port %d", v11, v12, v13, v14, v15, v16, self->_port);
  v20 = v63;

  advertiseFlags = self->_advertiseFlags;
  if (advertiseFlags)
  {
    v62 = v20;
    NSAppendPrintF(&v62, (uint64_t)", AdvFlags 0x%llX", v21, v22, v23, v24, v25, v26, advertiseFlags);
    v28 = v62;

    v20 = v28;
  }
  domain = self->_domain;
  if (domain)
  {
    v61 = v20;
    NSAppendPrintF(&v61, (uint64_t)", Domain '%@'", v21, v22, v23, v24, v25, v26, (uint64_t)domain);
    v30 = v61;

    v20 = v30;
  }
  interfaceIndex = self->_interfaceIndex;
  if ((_DWORD)interfaceIndex)
  {
    v60 = v20;
    NSAppendPrintF(&v60, (uint64_t)", IfIndex %u", v21, v22, v23, v24, v25, v26, interfaceIndex);
    v32 = v60;

    v20 = v32;
  }
  interfaceName = self->_interfaceName;
  if (interfaceName)
  {
    v59 = v20;
    NSAppendPrintF(&v59, (uint64_t)", IfName '%@'", v21, v22, v23, v24, v25, v26, (uint64_t)interfaceName);
    v34 = v59;

    v20 = v34;
  }
  if (a3 >= 50)
  {
    v58 = v20;
    v35 = -[NSDictionary count](self->_txtDictionary, "count");
    v36 = &v58;
    NSAppendPrintF(&v58, (uint64_t)", TXT %d item(s)", v37, v38, v39, v40, v41, v42, v35);
LABEL_18:
    v45 = *v36;

    return v45;
  }
  txtDictionary = self->_txtDictionary;
  if (txtDictionary)
  {
    v57 = v20;
    v44 = &v57;
    NSAppendPrintF(&v57, (uint64_t)", TXT %##@", v21, v22, v23, v24, v25, v26, (uint64_t)txtDictionary);
  }
  else
  {
    v56 = v20;
    v44 = &v56;
    NSAppendPrintF(&v56, (uint64_t)", TXT <None>", v21, v22, v23, v24, v25, v26, v53);
  }
  v45 = *v44;

  if (a3 <= 20)
  {
    v55 = v45;
    v36 = &v55;
    NSAppendPrintF(&v55, (uint64_t)"\n", v46, v47, v48, v49, v50, v51, v54);
    v20 = v45;
    goto LABEL_18;
  }
  return v45;
}

- (void)setAdvertiseFlags:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CUBonjourAdvertiser_setAdvertiseFlags___block_invoke;
  v3[3] = &unk_1E25DC6C0;
  v3[4] = self;
  v3[5] = a3;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setDomain:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CUBonjourAdvertiser *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__CUBonjourAdvertiser_setDomain___block_invoke;
  v6[3] = &unk_1E25DC6E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);

}

- (void)setInterfaceIndex:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CUBonjourAdvertiser_setInterfaceIndex___block_invoke;
  v3[3] = &unk_1E25DC710;
  v4 = a3;
  v3[4] = self;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setInterfaceName:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CUBonjourAdvertiser *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__CUBonjourAdvertiser_setInterfaceName___block_invoke;
  v6[3] = &unk_1E25DC6E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);

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
  v7 = qword_1EE066A80;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)setName:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CUBonjourAdvertiser *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__CUBonjourAdvertiser_setName___block_invoke;
  v6[3] = &unk_1E25DC6E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);

}

- (void)setPort:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__CUBonjourAdvertiser_setPort___block_invoke;
  v3[3] = &unk_1E25DC710;
  v4 = a3;
  v3[4] = self;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (void)setServiceType:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CUBonjourAdvertiser *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__CUBonjourAdvertiser_setServiceType___block_invoke;
  v6[3] = &unk_1E25DC6E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);

}

- (void)setTxtDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CUBonjourAdvertiser *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__CUBonjourAdvertiser_setTxtDictionary___block_invoke;
  v6[3] = &unk_1E25DC6E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CUBonjourAdvertiser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v6);

}

- (void)activate
{
  CUBonjourAdvertiser *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CUBonjourAdvertiser_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);

}

- (void)_activateLocked
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BonjourAdvertiserPrivate **p_bonjourAdvertiser;
  LogCategory *ucat;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  LogCategory *v15;
  NSString *label;
  BonjourAdvertiserPrivate *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  p_bonjourAdvertiser = &self->_bonjourAdvertiser;
  if (self->_bonjourAdvertiser)
    return;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_7;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourAdvertiser _activateLocked]", 0x1Eu, (uint64_t)"Activate '%@'\n", v2, v3, v4, v5, (uint64_t)self->_serviceType);
  }
LABEL_7:
  v9 = BonjourAdvertiserCreate(p_bonjourAdvertiser);
  if ((_DWORD)v9)
  {
    v14 = v9;
    v15 = self->_ucat;
    if (v15->var0 > 60)
      return;
    if (v15->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v15, 0x3Cu))
        return;
      v15 = self->_ucat;
    }
    LogPrintF((uint64_t)v15, (uint64_t)"-[CUBonjourAdvertiser _activateLocked]", 0x3Cu, (uint64_t)"### Create advertiser failed: %#m\n", v10, v11, v12, v13, v14);
    return;
  }
  label = self->_label;
  if (label)
  {
    v17 = *p_bonjourAdvertiser;
    -[NSString UTF8String](label, "UTF8String");
    LogCategoryReplaceF((uint64_t *)v17 + 2, (uint64_t)"%s-%s", v18, v19, v20, v21, v22, v23, qword_1EE0662E8);
  }
  BonjourAdvertiserSetDispatchQueue((uint64_t)self->_bonjourAdvertiser, self->_dispatchQueue);
  -[CUBonjourAdvertiser _updateLocked](self, "_updateLocked");
}

- (void)_activateSafeInvokeBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  CUBonjourAdvertiser *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = (unsigned int (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4[2](v4) && v5->_activated && !v5->_invalidateCalled && !v5->_updatePending)
  {
    v5->_updatePending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__CUBonjourAdvertiser__activateSafeInvokeBlock___block_invoke;
    block[3] = &unk_1E25DF2A0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CUBonjourAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateLocked
{
  BonjourAdvertiserPrivate *bonjourAdvertiser;
  _BOOL4 advertiseFlagsChanged;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  BonjourAdvertiserPrivate *v10;
  BonjourAdvertiserPrivate *v11;

  bonjourAdvertiser = self->_bonjourAdvertiser;
  if (bonjourAdvertiser)
  {
    advertiseFlagsChanged = self->_advertiseFlagsChanged;
    if (self->_advertiseFlagsChanged)
    {
      *((_QWORD *)bonjourAdvertiser + 13) = self->_advertiseFlags;
      self->_advertiseFlagsChanged = 0;
    }
    if (!self->_domainChanged)
    {
LABEL_11:
      if (self->_interfaceIndexChanged)
      {
        *((_DWORD *)self->_bonjourAdvertiser + 28) = self->_interfaceIndex;
        self->_interfaceIndexChanged = 0;
        advertiseFlagsChanged = 1;
      }
      if (self->_interfaceNameChanged)
      {
        -[NSString UTF8String](self->_interfaceName, "UTF8String");
        __strlcpy_chk();
        self->_interfaceNameChanged = 0;
        advertiseFlagsChanged = 1;
      }
      if (self->_nameChanged)
      {
        ReplaceDifferentString((void **)self->_bonjourAdvertiser + 17, (char *)-[NSString UTF8String](self->_name, "UTF8String"));
        self->_nameChanged = 0;
        advertiseFlagsChanged = 1;
      }
      if (self->_portChanged)
      {
        *((_DWORD *)self->_bonjourAdvertiser + 37) = self->_port;
        self->_portChanged = 0;
        advertiseFlagsChanged = 1;
      }
      if (self->_serviceTypeChanged)
      {
        ReplaceDifferentString((void **)self->_bonjourAdvertiser + 19, (char *)-[NSString UTF8String](self->_serviceType, "UTF8String"));
        self->_serviceTypeChanged = 0;
        advertiseFlagsChanged = 1;
      }
      if (self->_txtDictionaryChanged)
      {
        -[CUBonjourAdvertiser _updateTXTDictionary](self, "_updateTXTDictionary");
        self->_txtDictionaryChanged = 0;
        if (!self->_started)
          goto LABEL_27;
      }
      else
      {
        if (!self->_started)
        {
LABEL_27:
          v11 = self->_bonjourAdvertiser;
          CFRetain(v11);
          dispatch_async_f(*((dispatch_queue_t *)v11 + 3), v11, (dispatch_function_t)_BonjourAdvertiserStart);
          self->_started = 1;
          return;
        }
        if (!advertiseFlagsChanged)
          return;
      }
      v10 = self->_bonjourAdvertiser;
      CFRetain(v10);
      dispatch_async_f(*((dispatch_queue_t *)v10 + 3), v10, (dispatch_function_t)_BonjourAdvertiserUpdate);
      return;
    }
    if (ReplaceDifferentString((void **)bonjourAdvertiser + 12, (char *)-[NSString UTF8String](self->_domain, "UTF8String")))
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
            goto LABEL_10;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourAdvertiser _updateLocked]", 0x3Cu, (uint64_t)"### Set domain '%@' failed: %#m\n", v5, v6, v7, v8, (uint64_t)self->_domain);
      }
    }
LABEL_10:
    self->_domainChanged = 0;
    advertiseFlagsChanged = 1;
    goto LABEL_11;
  }
}

- (void)_updateTXTDictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSDictionary *txtDictionary;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  LogCategory *ucat;
  LogCategory *v13;
  BonjourAdvertiserPrivate *bonjourAdvertiser;
  const void *BytesPtr;
  unsigned int Length;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *v22;
  BonjourAdvertiserPrivate *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[6];
  _BYTE buffer[256];
  uint64_t v28;
  TXTRecordRef *v29;
  uint64_t v30;
  const char *v31;
  TXTRecordRef v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_txtDictionary)
  {
    v28 = 0;
    v29 = (TXTRecordRef *)&v28;
    v30 = 0x3010000000;
    v32 = 0uLL;
    v31 = "";
    TXTRecordCreate(&v32, 0x100u, buffer);
    txtDictionary = self->_txtDictionary;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __43__CUBonjourAdvertiser__updateTXTDictionary__block_invoke;
    v26[3] = &unk_1E25DE9E0;
    v26[4] = self;
    v26[5] = &v28;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](txtDictionary, "enumerateKeysAndObjectsUsingBlock:", v26);
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_9;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]", 0x1Eu, (uint64_t)"Update TXT: %##@\n", v8, v9, v10, v11, (uint64_t)self->_txtDictionary);
    }
LABEL_9:
    bonjourAdvertiser = self->_bonjourAdvertiser;
    BytesPtr = TXTRecordGetBytesPtr(v29 + 2);
    Length = TXTRecordGetLength(v29 + 2);
    v21 = BonjourAdvertiserSetTXTRecord((uint64_t)bonjourAdvertiser, BytesPtr, Length);
    if (!(_DWORD)v21)
      goto LABEL_14;
    v22 = self->_ucat;
    if (v22->var0 > 60)
      goto LABEL_14;
    if (v22->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v22, 0x3Cu))
        goto LABEL_14;
      v22 = self->_ucat;
    }
    LogPrintF((uint64_t)v22, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]", 0x3Cu, (uint64_t)"### Set TXT record failed: %#m\n", v17, v18, v19, v20, v21);
LABEL_14:
    TXTRecordDeallocate(v29 + 2);
    _Block_object_dispose(&v28, 8);
    return;
  }
  v13 = self->_ucat;
  if (v13->var0 <= 30)
  {
    if (v13->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v13, 0x1Eu))
        goto LABEL_16;
      v13 = self->_ucat;
    }
    LogPrintF((uint64_t)v13, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]", 0x1Eu, (uint64_t)"Update TXT: <none>\n", v2, v3, v4, v5, v25);
  }
LABEL_16:
  v23 = self->_bonjourAdvertiser;
  v24 = (void *)*((_QWORD *)v23 + 20);
  if (v24)
    free(v24);
  *((_QWORD *)v23 + 20) = 0;
  *((_WORD *)v23 + 84) = 0;
  *((_BYTE *)v23 + 170) = 1;
}

- (unint64_t)advertiseFlags
{
  return self->_advertiseFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)name
{
  return self->_name;
}

- (int)port
{
  return self->_port;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __43__CUBonjourAdvertiser__updateTXTDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;
  TXTRecordRef *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  TXTRecordRef *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  TXTRecordRef *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  int *v38;
  int *v39;
  id v40;

  v40 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v7 = strlen(v6);
    if (v7 >= 0x100)
    {
      v38 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
      if (*v38 <= 60)
      {
        if (*v38 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v38, 0x3Cu))
            goto LABEL_24;
          v38 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
        }
        LogPrintF((uint64_t)v38, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### TXT item '%@', '%@' value too long\n", v8, v9, v10, v11, (uint64_t)v40);
      }
    }
    else
    {
      v12 = v7;
      v13 = (TXTRecordRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      v14 = objc_retainAutorelease(v40);
      if (TXTRecordSetValue(v13, (const char *)objc_msgSend(v14, "UTF8String"), v12, v6))
      {
        v19 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
        if (*v19 <= 60)
        {
          if (*v19 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v19, 0x3Cu))
              goto LABEL_24;
            v19 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
          }
          LogPrintF((uint64_t)v19, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### Set TXT item '%@', '%@' failed: %#m\n", v15, v16, v17, v18, (uint64_t)v14);
        }
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "BOOLValue"))
    {
      v20 = (TXTRecordRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      v21 = objc_retainAutorelease(v40);
      if (TXTRecordSetValue(v20, (const char *)objc_msgSend(v21, "UTF8String"), 0, 0))
      {
        v26 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
        if (*v26 <= 60)
        {
          if (*v26 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v26, 0x3Cu))
              goto LABEL_24;
            v26 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
          }
          LogPrintF((uint64_t)v26, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### Set TXT item '%@', true failed: %#m\n", v22, v23, v24, v25, (uint64_t)v21);
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (TXTRecordRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
        v32 = objc_retainAutorelease(v40);
        if (TXTRecordSetValue(v31, (const char *)objc_msgSend(v32, "UTF8String"), 0, 0))
        {
          v37 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
          if (*v37 <= 60)
          {
            if (*v37 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v37, 0x3Cu))
                goto LABEL_24;
              v37 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
            }
            LogPrintF((uint64_t)v37, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### Set TXT item '%@', null failed: %#m\n", v33, v34, v35, v36, (uint64_t)v32);
          }
        }
      }
      else
      {
        v39 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
        if (*v39 <= 60)
        {
          if (*v39 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v39, 0x3Cu))
              goto LABEL_24;
            v39 = *(int **)(*(_QWORD *)(a1 + 32) + 32);
          }
          LogPrintF((uint64_t)v39, (uint64_t)"-[CUBonjourAdvertiser _updateTXTDictionary]_block_invoke", 0x3Cu, (uint64_t)"### TXT item '%@', unsupported value '%@'\n", v27, v28, v29, v30, (uint64_t)v40);
        }
      }
    }
  }
LABEL_24:

}

void __33__CUBonjourAdvertiser_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  dispatch_queue_t *v13;
  uint64_t v14;

  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v8 + 24))
  {
    *(_BYTE *)(v8 + 24) = 1;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(int **)(v10 + 32);
    if (*v11 > 30)
      goto LABEL_6;
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      v10 = *(_QWORD *)(a1 + 32);
      if (!v12)
      {
LABEL_6:
        v13 = *(dispatch_queue_t **)(v10 + 16);
        if (v13)
        {
          CFRetain(*(CFTypeRef *)(v10 + 16));
          dispatch_async_f(v13[3], v13, (dispatch_function_t)_BonjourAdvertiserStop);
          CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 16));
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
        }
        return;
      }
      v11 = *(int **)(v10 + 32);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUBonjourAdvertiser invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v14);
    v10 = *(_QWORD *)(a1 + 32);
    goto LABEL_6;
  }
}

void __48__CUBonjourAdvertiser__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_updateLocked");
  objc_sync_exit(obj);

}

void __31__CUBonjourAdvertiser_activate__block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_activateLocked");
  objc_sync_exit(obj);

}

uint64_t __40__CUBonjourAdvertiser_setTxtDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    v6 = objc_msgSend(v3, "isEqual:", v4);

    if ((v6 & 1) == 0)
      goto LABEL_8;
    return 0;
  }

LABEL_8:
  v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 120);
  *(_QWORD *)(v9 + 120) = v8;

  result = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = 1;
  return result;
}

uint64_t __38__CUBonjourAdvertiser_setServiceType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    v6 = objc_msgSend(v3, "isEqual:", v4);

    if ((v6 & 1) == 0)
      goto LABEL_8;
    return 0;
  }

LABEL_8:
  v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 112);
  *(_QWORD *)(v9 + 112) = v8;

  result = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 47) = 1;
  return result;
}

BOOL __31__CUBonjourAdvertiser_setPort___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 56);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 56) = v1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 46) = 1;
  }
  return v1 != v3;
}

uint64_t __31__CUBonjourAdvertiser_setName___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    v6 = objc_msgSend(v3, "isEqual:", v4);

    if ((v6 & 1) == 0)
      goto LABEL_8;
    return 0;
  }

LABEL_8:
  v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 104);
  *(_QWORD *)(v9 + 104) = v8;

  result = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 45) = 1;
  return result;
}

uint64_t __40__CUBonjourAdvertiser_setInterfaceName___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    v6 = objc_msgSend(v3, "isEqual:", v4);

    if ((v6 & 1) == 0)
      goto LABEL_8;
    return 0;
  }

LABEL_8:
  v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 88);
  *(_QWORD *)(v9 + 88) = v8;

  result = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 44) = 1;
  return result;
}

BOOL __41__CUBonjourAdvertiser_setInterfaceIndex___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 52);
  if (v1 != v3)
  {
    *(_DWORD *)(v2 + 52) = v1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 43) = 1;
  }
  return v1 != v3;
}

uint64_t __33__CUBonjourAdvertiser_setDomain___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (v3 == v4)
  {

    return 0;
  }
  v5 = v4;
  if ((v3 == 0) != (v4 != 0))
  {
    v6 = objc_msgSend(v3, "isEqual:", v4);

    if ((v6 & 1) == 0)
      goto LABEL_8;
    return 0;
  }

LABEL_8:
  v8 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = v8;

  result = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 42) = 1;
  return result;
}

BOOL __41__CUBonjourAdvertiser_setAdvertiseFlags___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 64);
  if (v1 != v3)
  {
    *(_QWORD *)(v2 + 64) = v1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  }
  return v1 != v3;
}

@end
