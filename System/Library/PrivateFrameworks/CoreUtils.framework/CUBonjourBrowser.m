@implementation CUBonjourBrowser

- (CUBonjourBrowser)init
{
  CUBonjourBrowser *v2;
  CUBonjourBrowser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUBonjourBrowser;
  v2 = -[CUBonjourBrowser init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUBonjourBrowser;
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
  v4.super_class = (Class)CUBonjourBrowser;
  -[CUBonjourBrowser dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[CUBonjourBrowser descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t browseFlags;
  id *v17;
  uint64_t changeFlags;
  id *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  id *v28;
  NSString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString *v36;
  id *v37;
  id *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id *v52;
  uint64_t v53;
  int v54;
  NSMutableDictionary *deviceMap;
  id v56;
  uint64_t v58;
  _QWORD v59[7];
  int v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id obj;
  id v66;
  id v67;
  CFMutableStringRef v68;
  uint64_t v69;
  id *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;

  v69 = 0;
  v70 = (id *)&v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__2739;
  v73 = __Block_byref_object_dispose__2740;
  v74 = 0;
  v68 = 0;
  NSAppendPrintF(&v68, (uint64_t)"CUBonjourBrowser %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  objc_storeStrong(&v74, v68);
  browseFlags = self->_browseFlags;
  if (browseFlags)
  {
    v17 = v70;
    v67 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v67, (uint64_t)", BFlags 0x%llX", v10, v11, v12, v13, v14, v15, browseFlags);
    objc_storeStrong(v17 + 5, v67);
  }
  changeFlags = self->_changeFlags;
  if ((_DWORD)changeFlags)
  {
    v19 = v70;
    v66 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v66, (uint64_t)", CFlags 0x%X", v10, v11, v12, v13, v14, v15, changeFlags);
    objc_storeStrong(v19 + 5, v66);
  }
  v20 = self->_domain;
  v27 = v20;
  if (v20)
  {
    v28 = v70;
    obj = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)", Domain '%@'", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    objc_storeStrong(v28 + 5, obj);
  }

  v29 = self->_interfaceName;
  v36 = v29;
  if (v29)
  {
    v37 = v70;
    v64 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v64, (uint64_t)", Interface '%@'", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
    objc_storeStrong(v37 + 5, v64);
  }

  v38 = v70;
  v63 = v70[5];
  v39 = -[NSMutableDictionary count](self->_deviceMap, "count");
  NSAppendPrintF((CFMutableStringRef *)&v63, (uint64_t)", %d device(s)", v40, v41, v42, v43, v44, v45, v39);
  objc_storeStrong(v38 + 5, v63);
  if (a3 <= 20)
  {
    v52 = v70;
    v62 = v70[5];
    NSAppendPrintF((CFMutableStringRef *)&v62, (uint64_t)"\n", v46, v47, v48, v49, v50, v51, v58);
    objc_storeStrong(v52 + 5, v62);
    v53 = -[NSMutableDictionary count](self->_deviceMap, "count");
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v61[3] = 0;
    if (a3 >= 11)
      v54 = 50;
    else
      v54 = 30;
    deviceMap = self->_deviceMap;
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __41__CUBonjourBrowser_descriptionWithLevel___block_invoke;
    v59[3] = &unk_1E25DC738;
    v60 = v54;
    v59[4] = &v69;
    v59[5] = v61;
    v59[6] = v53;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v59);
    _Block_object_dispose(v61, 8);
  }
  v56 = v70[5];
  _Block_object_dispose(&v69, 8);

  return v56;
}

- (void)setBrowseFlags:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__CUBonjourBrowser_setBrowseFlags___block_invoke;
  v3[3] = &unk_1E25DD170;
  v3[4] = self;
  v3[5] = a3;
  -[CUBonjourBrowser _activateSafeInvokeBlock:](self, "_activateSafeInvokeBlock:", v3);
}

- (NSArray)devices
{
  CUBonjourBrowser *v2;
  NSMutableDictionary *deviceMap;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  deviceMap = v2->_deviceMap;
  if (deviceMap)
  {
    -[NSMutableDictionary allValues](deviceMap, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
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
  v7 = qword_1EE066AF0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activate
{
  CUBonjourBrowser *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CUBonjourBrowser_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);

}

- (void)_activateSafeInvokeBlock:(id)a3
{
  void (**v4)(_QWORD);
  CUBonjourBrowser *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__CUBonjourBrowser__activateSafeInvokeBlock___block_invoke;
    v7[3] = &unk_1E25DE600;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  -[CUBonjourBrowser _lostAllDevices](self, "_lostAllDevices");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUBonjourBrowser_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  void (**invalidationHandler)(void);
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id interruptionHandler;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  LogCategory *v18;
  uint64_t v19;
  uint64_t v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone)
    return;
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u))
          goto LABEL_7;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v19);
    }
  }
LABEL_7:
  if (!self->_bonjourBrowser)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    deviceChangedHandler = self->_deviceChangedHandler;
    self->_deviceChangedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v13 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    v18 = self->_ucat;
    if (v18->var0 <= 10)
    {
      if (v18->var0 != -1)
      {
LABEL_12:
        LogPrintF((uint64_t)v18, (uint64_t)"-[CUBonjourBrowser _invalidated]", 0xAu, (uint64_t)"Invalidated\n", v14, v15, v16, v17, v20);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v18, 0xAu))
      {
        v18 = self->_ucat;
        goto LABEL_12;
      }
    }
  }
}

- (void)_lostAllDevices
{
  NSMutableDictionary *deviceMap;
  CUBonjourBrowser *obj;
  _QWORD v5[5];

  if (self->_deviceLostHandler)
  {
    deviceMap = self->_deviceMap;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35__CUBonjourBrowser__lostAllDevices__block_invoke;
    v5[3] = &unk_1E25DC760;
    v5[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v5);
  }
  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_deviceMap, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)update
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CUBonjourBrowser_update__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  CUBonjourBrowser *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_invalidateCalled && obj->_bonjourBrowser)
    -[CUBonjourBrowser _updateLocked](obj, "_updateLocked");
  objc_sync_exit(obj);

}

- (void)_updateLocked
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;

  if (self->_browseFlagsChanged)
  {
    self->_browseFlagsChanged = 0;
    v3 = BonjourBrowser_Start((dispatch_queue_t *)self->_bonjourBrowser, -[NSString UTF8String](self->_serviceType, "UTF8String"), -[NSString UTF8String](self->_domain, "UTF8String"), -[NSString UTF8String](self->_interfaceName, "UTF8String"), self->_browseFlags);
    if ((_DWORD)v3)
    {
      v8 = v3;
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 != -1)
        {
LABEL_5:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _updateLocked]", 0x5Au, (uint64_t)"### Bonjour start update failed: %#m\n", v4, v5, v6, v7, v8);
          return;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        {
          ucat = self->_ucat;
          goto LABEL_5;
        }
      }
    }
  }
}

- (int)_bonjourStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BonjourBrowser **p_bonjourBrowser;
  BonjourBrowser *bonjourBrowser;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BonjourBrowser *v15;
  LogCategory *ucat;
  dispatch_queue_t *v17;
  _QWORD aBlock[5];

  p_bonjourBrowser = &self->_bonjourBrowser;
  bonjourBrowser = self->_bonjourBrowser;
  if (bonjourBrowser)
  {
    CFRetain(self->_bonjourBrowser);
    dispatch_async_f(*((dispatch_queue_t *)bonjourBrowser + 2), bonjourBrowser, (dispatch_function_t)_BonjourBrowser_Stop);
    CFRelease(*p_bonjourBrowser);
    *p_bonjourBrowser = 0;
  }
  v14 = BonjourBrowser_CreateEx(p_bonjourBrowser, (uint64_t)self->_ucat->var4, self->_controlFlags, v2, v3, v4, v5, v6);
  if ((_DWORD)v14)
    goto LABEL_5;
  BonjourBrowser_SetDispatchQueue((uint64_t)self->_bonjourBrowser, self->_dispatchQueue);
  v15 = self->_bonjourBrowser;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CUBonjourBrowser__bonjourStart__block_invoke;
  aBlock[3] = &unk_1E25DC788;
  aBlock[4] = self;
  BonjourBrowser_SetEventHandlerBlock((uint64_t)v15, aBlock);
  v14 = BonjourBrowser_Start((dispatch_queue_t *)self->_bonjourBrowser, -[NSString UTF8String](self->_serviceType, "UTF8String"), -[NSString UTF8String](self->_domain, "UTF8String"), -[NSString UTF8String](self->_interfaceName, "UTF8String"), self->_browseFlags);
  if ((_DWORD)v14)
  {
LABEL_5:
    ucat = self->_ucat;
    if (ucat->var0 > 60)
      goto LABEL_9;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
LABEL_9:
        v17 = (dispatch_queue_t *)*p_bonjourBrowser;
        if (*p_bonjourBrowser)
        {
          CFRetain(*p_bonjourBrowser);
          dispatch_async_f(v17[2], v17, (dispatch_function_t)_BonjourBrowser_Stop);
          CFRelease(*p_bonjourBrowser);
          *p_bonjourBrowser = 0;
        }
        return v14;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourStart]", 0x3Cu, (uint64_t)"### Bonjour start failed: %#m\n", v10, v11, v12, v13, v14);
    goto LABEL_9;
  }
  return v14;
}

- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  LogCategory *v12;
  BonjourBrowser *bonjourBrowser;
  uint64_t v14;
  id v15;

  v6 = a4;
  v15 = v6;
  switch(a3)
  {
    case 1u:
      -[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:](self, "_bonjourHandleAddOrUpdateDevice:", v6);
      break;
    case 2u:
      -[CUBonjourBrowser _bonjourHandleRemoveDevice:](self, "_bonjourHandleRemoveDevice:", v6);
      break;
    case 3u:
      ucat = self->_ucat;
      if (ucat->var0 > 30)
        goto LABEL_11;
      if (ucat->var0 != -1)
        goto LABEL_6;
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
LABEL_6:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourHandleEventType:info:]", 0x1Eu, (uint64_t)"Bonjour stopped\n", v7, v8, v9, v10, v14);
      }
LABEL_11:
      bonjourBrowser = self->_bonjourBrowser;
      if (bonjourBrowser)
      {
        CFRetain(self->_bonjourBrowser);
        dispatch_async_f(*((dispatch_queue_t *)bonjourBrowser + 2), bonjourBrowser, (dispatch_function_t)_BonjourBrowser_Stop);
        CFRelease(self->_bonjourBrowser);
        self->_bonjourBrowser = 0;
      }
      -[CUBonjourBrowser _invalidated](self, "_invalidated");
      break;
    case 4u:
      v12 = self->_ucat;
      if (v12->var0 > 60)
        goto LABEL_15;
      if (v12->var0 != -1)
        goto LABEL_9;
      if (_LogCategory_Initialize((uint64_t)v12, 0x3Cu))
      {
        v12 = self->_ucat;
LABEL_9:
        LogPrintF((uint64_t)v12, (uint64_t)"-[CUBonjourBrowser _bonjourHandleEventType:info:]", 0x3Cu, (uint64_t)"### Bonjour daemon crashed\n", v7, v8, v9, v10, v14);
      }
LABEL_15:
      -[CUBonjourBrowser _interrupted](self, "_interrupted");
      break;
    default:
      goto LABEL_17;
  }
  v6 = v15;
LABEL_17:

}

- (void)_bonjourHandleAddOrUpdateDevice:(id)a3
{
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *v9;
  void *v10;
  CUBonjourDevice *v11;
  CUBonjourDevice *v12;
  uint64_t v13;
  LogCategory *ucat;
  CUBonjourDevice *v15;
  uint64_t v16;
  int v17;
  void *v18;
  CUBonjourBrowser *v19;
  NSMutableDictionary *deviceMap;
  NSMutableDictionary *v21;
  NSMutableDictionary **p_deviceMap;
  NSMutableDictionary *v23;
  LogCategory *v24;
  CUBonjourDevice *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**deviceChangedHandler)(id, CUBonjourDevice *, uint64_t);
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (**deviceFoundHandler)(id, CUBonjourDevice *);
  int v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = (const __CFDictionary *)a3;
  v39 = 0;
  v40 = 0;
  v41[0] = 0;
  BonjourDevice_GetDeviceID(v4, (char *)v41 + 2, &v39);
  if (!v39)
  {
    NSStringWithMACAddress((uint64_t)v41 + 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v10);
    v11 = (CUBonjourDevice *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = -[CUBonjourDevice updateWithBonjourDeviceInfo:](v11, "updateWithBonjourDeviceInfo:", v4);
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
LABEL_8:
          v15 = v12;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[CUBonjourDevice shortDescription](v15, "shortDescription");
            v16 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              -[CUBonjourDevice descriptionWithLevel:](v15, "descriptionWithLevel:", 50);
            else
              -[CUBonjourDevice description](v15, "description");
            v16 = objc_claimAutoreleasedReturnValue();
          }
          v27 = (void *)v16;

          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:]", 0x1Eu, (uint64_t)"Changed %@ %#{flags}\n", v28, v29, v30, v31, (uint64_t)v27);
          goto LABEL_30;
        }
        if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        {
          ucat = self->_ucat;
          goto LABEL_8;
        }
      }
LABEL_30:
      deviceChangedHandler = (void (**)(id, CUBonjourDevice *, uint64_t))self->_deviceChangedHandler;
      if (deviceChangedHandler)
        deviceChangedHandler[2](deviceChangedHandler, v12, v13);
LABEL_37:

      goto LABEL_38;
    }
    v12 = objc_alloc_init(CUBonjourDevice);
    v17 = *(_DWORD *)((char *)v41 + 2);
    *(_WORD *)&v12->_deviceIDBytes[4] = HIWORD(v41[0]);
    *(_DWORD *)v12->_deviceIDBytes = v17;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v40);
    -[CUBonjourDevice setIdentifier:](v12, "setIdentifier:", v18);
    -[CUBonjourDevice setIdentifierUUID:](v12, "setIdentifierUUID:", v18);
    -[CUBonjourDevice setIdentifierStr:](v12, "setIdentifierStr:", v10);
    -[CUBonjourDevice updateWithBonjourDeviceInfo:](v12, "updateWithBonjourDeviceInfo:", v4);
    v19 = self;
    objc_sync_enter(v19);
    deviceMap = self->_deviceMap;
    if (!deviceMap)
    {
      v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v23 = self->_deviceMap;
      p_deviceMap = &self->_deviceMap;
      *p_deviceMap = v21;

      deviceMap = *p_deviceMap;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](deviceMap, "setObject:forKeyedSubscript:", v12, v10);
    objc_sync_exit(v19);

    v24 = v19->_ucat;
    if (v24->var0 <= 30)
    {
      if (v24->var0 != -1)
      {
LABEL_14:
        v25 = v12;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[CUBonjourDevice shortDescription](v25, "shortDescription");
          v26 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[CUBonjourDevice descriptionWithLevel:](v25, "descriptionWithLevel:", 50);
          else
            -[CUBonjourDevice description](v25, "description");
          v26 = objc_claimAutoreleasedReturnValue();
        }
        v33 = (void *)v26;

        LogPrintF((uint64_t)v24, (uint64_t)"-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:]", 0x1Eu, (uint64_t)"Found %@\n", v34, v35, v36, v37, (uint64_t)v33);
        goto LABEL_34;
      }
      if (_LogCategory_Initialize((uint64_t)v19->_ucat, 0x1Eu))
      {
        v24 = v19->_ucat;
        goto LABEL_14;
      }
    }
LABEL_34:
    deviceFoundHandler = (void (**)(id, CUBonjourDevice *))v19->_deviceFoundHandler;
    if (deviceFoundHandler)
      deviceFoundHandler[2](deviceFoundHandler, v12);

    goto LABEL_37;
  }
  v9 = self->_ucat;
  if (v9->var0 <= 90)
  {
    if (v9->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au))
        goto LABEL_38;
      v9 = self->_ucat;
    }
    LogPrintF((uint64_t)v9, (uint64_t)"-[CUBonjourBrowser _bonjourHandleAddOrUpdateDevice:]", 0x5Au, (uint64_t)"### Bonjour device found without identifier: %@\n", v5, v6, v7, v8, (uint64_t)v4);
  }
LABEL_38:

}

- (void)_bonjourHandleRemoveDevice:(id)a3
{
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CUBonjourBrowser *v16;
  LogCategory *ucat;
  id v18;
  uint64_t v19;
  LogCategory *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**deviceLostHandler)(id, void *);
  uint64_t v27;
  char v28[6];
  int v29;

  v4 = (const __CFDictionary *)a3;
  v29 = 0;
  BonjourDevice_GetDeviceID(v4, v28, &v29);
  if (!v29)
  {
    NSStringWithMACAddress((uint64_t)v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = self;
      objc_sync_enter(v16);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceMap, "setObject:forKeyedSubscript:", 0, v10);
      objc_sync_exit(v16);

      ucat = v16->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
LABEL_8:
          v18 = v15;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v18, "shortDescription");
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v18, "descriptionWithLevel:", 50);
            else
              objc_msgSend(v18, "description");
            v19 = objc_claimAutoreleasedReturnValue();
          }
          v21 = (void *)v19;

          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBonjourBrowser _bonjourHandleRemoveDevice:]", 0x1Eu, (uint64_t)"Lost %@\n", v22, v23, v24, v25, (uint64_t)v21);
          goto LABEL_24;
        }
        if (_LogCategory_Initialize((uint64_t)v16->_ucat, 0x1Eu))
        {
          ucat = v16->_ucat;
          goto LABEL_8;
        }
      }
LABEL_24:
      deviceLostHandler = (void (**)(id, void *))v16->_deviceLostHandler;
      if (deviceLostHandler)
        deviceLostHandler[2](deviceLostHandler, v15);
      goto LABEL_26;
    }
    v20 = self->_ucat;
    if (v20->var0 <= 30)
    {
      if (v20->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v20, 0x1Eu))
          goto LABEL_26;
        v20 = self->_ucat;
      }
      LogPrintF((uint64_t)v20, (uint64_t)"-[CUBonjourBrowser _bonjourHandleRemoveDevice:]", 0x1Eu, (uint64_t)"### Bonjour lost untracked device\n", v11, v12, v13, v14, v27);
    }
LABEL_26:

    goto LABEL_27;
  }
  v9 = self->_ucat;
  if (v9->var0 <= 90)
  {
    if (v9->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au))
        goto LABEL_27;
      v9 = self->_ucat;
    }
    LogPrintF((uint64_t)v9, (uint64_t)"-[CUBonjourBrowser _bonjourHandleRemoveDevice:]", 0x5Au, (uint64_t)"### Bonjour device found without identifier: %@\n", v5, v6, v7, v8, (uint64_t)v4);
  }
LABEL_27:

}

- (unint64_t)browseFlags
{
  return self->_browseFlags;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
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

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);
}

uint64_t __33__CUBonjourBrowser__bonjourStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bonjourHandleEventType:info:", a2, a3);
}

uint64_t __26__CUBonjourBrowser_update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

void __35__CUBonjourBrowser__lostAllDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      v10 = *(_QWORD *)(a1 + 32);
      if (!v12)
        goto LABEL_5;
      v11 = *(int **)(v10 + 40);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUBonjourBrowser _lostAllDevices]_block_invoke", 0x1Eu, (uint64_t)"Bonjour lost    %@\n", v5, v6, v7, v8, (uint64_t)v9);
    v10 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(v10 + 120) + 16))();

}

uint64_t __30__CUBonjourBrowser_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  dispatch_queue_t *v13;
  uint64_t v14;

  v8 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v8 + 24))
    return result;
  v9 = result;
  *(_BYTE *)(v8 + 24) = 1;
  v10 = *(_QWORD *)(result + 32);
  v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize(*(_QWORD *)(v10 + 40), 0x1Eu);
      v10 = *(_QWORD *)(v9 + 32);
      if (!v12)
        goto LABEL_6;
      v11 = *(int **)(v10 + 40);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUBonjourBrowser invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v14);
    v10 = *(_QWORD *)(v9 + 32);
  }
LABEL_6:
  v13 = *(dispatch_queue_t **)(v10 + 16);
  if (v13)
  {
    CFRetain(*(CFTypeRef *)(v10 + 16));
    dispatch_async_f(v13[2], v13, (dispatch_function_t)_BonjourBrowser_Stop);
    v10 = *(_QWORD *)(v9 + 32);
  }
  return objc_msgSend((id)v10, "_invalidated");
}

uint64_t __45__CUBonjourBrowser__activateSafeInvokeBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __28__CUBonjourBrowser_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 40);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = *(int **)(v9 + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUBonjourBrowser activate]_block_invoke", 0x1Eu, (uint64_t)"Activate %@\n", a5, a6, a7, a8, *(_QWORD *)(v9 + 104));
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  *(_BYTE *)(v9 + 9) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_bonjourStart");
}

uint64_t __35__CUBonjourBrowser_setBrowseFlags___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  v1 = *(_QWORD *)(result + 40);
  if (v1 != *(_QWORD *)(v2 + 64))
  {
    *(_QWORD *)(v2 + 64) = v1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 1;
  }
  return result;
}

void __41__CUBonjourBrowser_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  CUDescriptionWithLevel(a3, *(unsigned int *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)"    %@\n", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  objc_storeStrong((id *)(v6 + 40), obj);

  v20 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v20 >= 0x11)
  {
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v22 = *(id *)(v21 + 40);
    NSAppendPrintF((CFMutableStringRef *)&v22, (uint64_t)"    ... %d more not shown\n", v14, v15, v16, v17, v18, v19, *(_QWORD *)(a1 + 48) - v20);
    objc_storeStrong((id *)(v21 + 40), v22);
    *a4 = 1;
  }
}

@end
