@implementation CUHomeKitManager

- (unsigned)state
{
  return self->_state;
}

- (HMAccessory)selfAccessory
{
  return self->_selfAccessory;
}

- (CUHomeKitManager)init
{
  CUHomeKitManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUHomeKitManager;
  v2 = -[CUHomeKitManager init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_homeKitPrefsNotifyToken = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUHomeKitManager;
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
  v4.super_class = (Class)CUHomeKitManager;
  -[CUHomeKitManager dealloc](&v4, sel_dealloc);
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
  v7 = qword_1EE0651C0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CUHomeKitManager_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int homeKitPrefsNotifyToken;
  unsigned int flags;
  uint64_t v9;
  LogCategory *v10;
  unint64_t v11;
  LogCategory *ucat;
  HMHomeManager *v13;
  HMHomeManager *v14;
  HMHomeManager *v15;
  HMHomeManager *homeManager;
  uint64_t v17;

  if ((objc_msgSend((Class)getHMClientConnectionClass[0](), "areHomesConfigured") & 1) != 0)
  {
    homeKitPrefsNotifyToken = self->_homeKitPrefsNotifyToken;
    if (homeKitPrefsNotifyToken != -1)
    {
      notify_cancel(homeKitPrefsNotifyToken);
      self->_homeKitPrefsNotifyToken = -1;
    }
    flags = self->_flags;
    if ((flags & 2) != 0 || self->_selfAccessoryAppDataChangedHandler || self->_selfAccessoryUpdatedHandler)
      self->_selfAccessoryEnabled = 1;
    if (self->_selfAccessoryMediaAccessUpdatedHandler)
      self->_selfAccessoryMediaAccessEnabled = 1;
    if (self->_selfAccessoryMediaSystemUpdatedHandler)
      self->_selfAccessoryMediaSystemEnabled = 1;
    if ((flags & 0x10) != 0 || self->_selfAccessorySiriAccessUpdatedHandler)
      self->_selfAccessorySiriAccessEnabled = 1;
    if (self->_homeManager)
      goto LABEL_41;
    if ((flags & 0x21) != 0)
    {
      v9 = -1;
    }
    else
    {
      if (self->_selfAccessoryEnabled)
        v11 = ((unint64_t)(self->_resolvableAccessoriesChangedHandler != 0) << 6) | 0x10;
      else
        v11 = (unint64_t)(self->_resolvableAccessoriesChangedHandler != 0) << 6;
      if (self->_selfAccessoryMediaSystemEnabled || self->_selfAccessoryMediaAccessEnabled)
        v11 |= 0x80uLL;
      if (self->_selfAccessorySiriAccessEnabled)
        v11 |= 8uLL;
      if ((flags & 4) != 0)
        v11 |= 0xAuLL;
      v9 = v11 | (flags >> 2) & 0x20 | (flags >> 1) & 4 | (flags >> 3) & 8 | (((flags >> 10) & 1) << 11);
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_37;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _activateIfNeeded]", 0x1Eu, (uint64_t)"Create HMHomeManager %#ll{flags} %s\n", v3, v4, v5, v6, v9);
    }
LABEL_37:
    if ((flags & 0x200) != 0)
    {
      v14 = (HMHomeManager *)objc_msgSend(objc_alloc((Class)getHMHomeManagerConfigurationClass[0]()), "initWithOptions:cachePolicy:", v9, 2);
      v15 = (HMHomeManager *)objc_msgSend(objc_alloc((Class)getHMHomeManagerClass[0]()), "initWithConfiguration:", v14);
      homeManager = self->_homeManager;
      self->_homeManager = v15;

    }
    else
    {
      v13 = (HMHomeManager *)objc_msgSend(objc_alloc((Class)getHMHomeManagerClass[0]()), "initWithOptions:", v9);
      v14 = self->_homeManager;
      self->_homeManager = v13;
    }

    -[HMHomeManager setDelegate:](self->_homeManager, "setDelegate:", self);
LABEL_41:
    -[CUHomeKitManager _updateState](self, "_updateState");
    return;
  }
  v10 = self->_ucat;
  if (v10->var0 <= 30)
  {
    if (v10->var0 != -1)
    {
LABEL_20:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager _activateIfNeeded]", 0x1Eu, (uint64_t)"Deferring HomeKit init until prefs indicate it's configured\n", v3, v4, v5, v6, v17);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v10, 0x1Eu))
    {
      v10 = self->_ucat;
      goto LABEL_20;
    }
  }
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CUHomeKitManager_invalidate__block_invoke;
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
  id selfAccessoryAppDataChangedHandler;
  id selfAccessoryMediaAccessUpdatedHandler;
  id selfAccessoryMediaSystemUpdatedHandler;
  id selfAccessorySiriAccessUpdatedHandler;
  id selfAccessoryUpdatedHandler;
  id interruptionHandler;
  id v15;
  id stateChangedHandler;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  LogCategory *v21;
  uint64_t v22;
  uint64_t v23;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone)
    return;
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v22);
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2]();
  selfAccessoryAppDataChangedHandler = self->_selfAccessoryAppDataChangedHandler;
  self->_selfAccessoryAppDataChangedHandler = 0;

  selfAccessoryMediaAccessUpdatedHandler = self->_selfAccessoryMediaAccessUpdatedHandler;
  self->_selfAccessoryMediaAccessUpdatedHandler = 0;

  selfAccessoryMediaSystemUpdatedHandler = self->_selfAccessoryMediaSystemUpdatedHandler;
  self->_selfAccessoryMediaSystemUpdatedHandler = 0;

  selfAccessorySiriAccessUpdatedHandler = self->_selfAccessorySiriAccessUpdatedHandler;
  self->_selfAccessorySiriAccessUpdatedHandler = 0;

  selfAccessoryUpdatedHandler = self->_selfAccessoryUpdatedHandler;
  self->_selfAccessoryUpdatedHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  v15 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  stateChangedHandler = self->_stateChangedHandler;
  self->_stateChangedHandler = 0;

  self->_invalidateDone = 1;
  v21 = self->_ucat;
  if (v21->var0 <= 10)
  {
    if (v21->var0 != -1)
    {
LABEL_11:
      LogPrintF((uint64_t)v21, (uint64_t)"-[CUHomeKitManager _invalidated]", 0xAu, (uint64_t)"Invalidated\n", v17, v18, v19, v20, v23);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v21, 0xAu))
    {
      v21 = self->_ucat;
      goto LABEL_11;
    }
  }
}

- (void)_clearHomeKitState
{
  NSMutableDictionary *homes;
  NSMutableDictionary *v4;
  NSMutableDictionary *users;
  HMAccessory *v6;
  _BOOL4 v7;
  LogCategory *ucat;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HMAccessory *selfAccessory;
  NSUUID *selfAccessoryRoomID;
  HMUser *v16;
  LogCategory *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  HMUser *selfAccessoryUser;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSDictionary *v28;
  LogCategory *v29;
  NSDictionary *selfAccessoryAppData;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int selfAccessoryMediaAccessFlags;
  _BOOL4 v36;
  LogCategory *v37;
  LogCategory *v38;
  NSString *selfAccessoryMediaAccessPassword;
  HMMediaSystem *v40;
  _BOOL4 v41;
  LogCategory *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  HMMediaSystem *selfAccessoryMediaSystem;
  HMAccessory *v49;
  LogCategory *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  HMAccessory *selfAccessoryMediaSystemCounterpart;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSString *v61;
  LogCategory *v62;
  NSString *selfAccessoryMediaSystemName;
  HMMediaSystemRole *v64;
  LogCategory *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  HMMediaSystemRole *selfAccessoryMediaSystemRole;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL4 selfAccessorySiriEnabled;
  LogCategory *v78;
  NSArray *resolvableAccessories;
  LogCategory *v80;
  NSArray *v81;
  NSMutableDictionary *resolvableAccessoriesMap;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[5];

  homes = self->_homes;
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __38__CUHomeKitManager__clearHomeKitState__block_invoke;
  v99[3] = &unk_1E25DCA30;
  v99[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](homes, "enumerateKeysAndObjectsUsingBlock:", v99);
  -[NSMutableDictionary removeAllObjects](self->_homes, "removeAllObjects");
  v4 = self->_homes;
  self->_homes = 0;

  -[NSMutableDictionary removeAllObjects](self->_users, "removeAllObjects");
  users = self->_users;
  self->_users = 0;

  v6 = self->_selfAccessory;
  v7 = v6 != 0;
  if (v6)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      -[HMAccessory uniqueIdentifier](v6, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory name](v6, "name");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"LostSelfAccessory: %@ (%@), HK clear", v10, v11, v12, v13, (uint64_t)v9);

    }
LABEL_6:
    selfAccessory = self->_selfAccessory;
    self->_selfAccessory = 0;

  }
  selfAccessoryRoomID = self->_selfAccessoryRoomID;
  if (selfAccessoryRoomID)
  {
    self->_selfAccessoryRoomID = 0;

    v7 = 1;
  }
  v16 = self->_selfAccessoryUser;
  if (v16)
  {
    v17 = self->_ucat;
    if (v17->var0 <= 30)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_14;
        v17 = self->_ucat;
      }
      -[HMUser userID](v16, "userID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory user updated: %{mask}, HK clear", v19, v20, v21, v22, (uint64_t)v18);

    }
LABEL_14:
    selfAccessoryUser = self->_selfAccessoryUser;
    self->_selfAccessoryUser = 0;

    v7 = 1;
  }

  v28 = self->_selfAccessoryAppData;
  if (!v28)
    goto LABEL_21;
  v29 = self->_ucat;
  if (v29->var0 <= 30)
  {
    if (v29->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v29, 0x1Eu))
        goto LABEL_20;
      v29 = self->_ucat;
    }
    LogPrintF((uint64_t)v29, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory AppData changed: %##@, HK clear", v24, v25, v26, v27, (uint64_t)v28);
  }
LABEL_20:
  selfAccessoryAppData = self->_selfAccessoryAppData;
  self->_selfAccessoryAppData = 0;

LABEL_21:
  selfAccessoryMediaAccessFlags = self->_selfAccessoryMediaAccessFlags;
  v36 = selfAccessoryMediaAccessFlags != 0;
  if (!selfAccessoryMediaAccessFlags)
    goto LABEL_27;
  v37 = self->_ucat;
  if (v37->var0 <= 30)
  {
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x1Eu))
        goto LABEL_26;
      v37 = self->_ucat;
    }
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess changed: HK clear", v31, v32, v33, v34, v95);
  }
LABEL_26:
  self->_selfAccessoryMediaAccessFlags = 0;
LABEL_27:
  if (!self->_selfAccessoryMediaAccessPassword)
    goto LABEL_33;
  v38 = self->_ucat;
  if (v38->var0 <= 30)
  {
    if (v38->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v38, 0x1Eu))
        goto LABEL_32;
      v38 = self->_ucat;
    }
    LogPrintF((uint64_t)v38, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess password updated: HK clear", v31, v32, v33, v34, v95);
  }
LABEL_32:
  selfAccessoryMediaAccessPassword = self->_selfAccessoryMediaAccessPassword;
  self->_selfAccessoryMediaAccessPassword = 0;

  v36 = 1;
LABEL_33:
  v40 = self->_selfAccessoryMediaSystem;
  v41 = v40 != 0;
  if (!v40)
    goto LABEL_39;
  v42 = self->_ucat;
  if (v42->var0 <= 30)
  {
    if (v42->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        goto LABEL_38;
      v42 = self->_ucat;
    }
    -[HMMediaSystem uniqueIdentifier](v40, "uniqueIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystem name](v40, "name");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v42, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem ID updated: %@ '%@', HK clear", v44, v45, v46, v47, (uint64_t)v43);

  }
LABEL_38:
  selfAccessoryMediaSystem = self->_selfAccessoryMediaSystem;
  self->_selfAccessoryMediaSystem = 0;

LABEL_39:
  v49 = self->_selfAccessoryMediaSystemCounterpart;
  if (!v49)
    goto LABEL_45;
  v50 = self->_ucat;
  if (v50->var0 <= 30)
  {
    if (v50->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
        goto LABEL_44;
      v50 = self->_ucat;
    }
    -[HMAccessory uniqueIdentifier](v49, "uniqueIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessory name](v49, "name");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v50, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemCounterpart updated: %@ '%@', HK clear\n", v52, v53, v54, v55, (uint64_t)v51);

  }
LABEL_44:
  selfAccessoryMediaSystemCounterpart = self->_selfAccessoryMediaSystemCounterpart;
  self->_selfAccessoryMediaSystemCounterpart = 0;

  v41 = 1;
LABEL_45:

  v61 = self->_selfAccessoryMediaSystemName;
  if (!v61)
    goto LABEL_51;
  v62 = self->_ucat;
  if (v62->var0 <= 30)
  {
    if (v62->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v62, 0x1Eu))
        goto LABEL_50;
      v62 = self->_ucat;
    }
    LogPrintF((uint64_t)v62, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem name updated: '%@', HK clear", v57, v58, v59, v60, (uint64_t)v61);
  }
LABEL_50:
  selfAccessoryMediaSystemName = self->_selfAccessoryMediaSystemName;
  self->_selfAccessoryMediaSystemName = 0;

  v41 = 1;
LABEL_51:

  v64 = self->_selfAccessoryMediaSystemRole;
  if (!v64)
    goto LABEL_61;
  v65 = self->_ucat;
  if (v65->var0 <= 30)
  {
    if (v65->var0 != -1)
    {
LABEL_54:
      v66 = -[HMMediaSystemRole type](v64, "type");
      if (v66 > 2)
        v71 = "?";
      else
        v71 = off_1E25DCBF8[v66];
      LogPrintF((uint64_t)v65, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemRole updated: %s, HK clear", v67, v68, v69, v70, (uint64_t)v71);
      goto LABEL_60;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      v65 = self->_ucat;
      goto LABEL_54;
    }
  }
LABEL_60:
  selfAccessoryMediaSystemRole = self->_selfAccessoryMediaSystemRole;
  self->_selfAccessoryMediaSystemRole = 0;

  v41 = 1;
LABEL_61:

  selfAccessorySiriEnabled = self->_selfAccessorySiriEnabled;
  if (!self->_selfAccessorySiriEnabled)
    goto LABEL_67;
  v78 = self->_ucat;
  if (v78->var0 <= 30)
  {
    if (v78->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v78, 0x1Eu))
        goto LABEL_66;
      v78 = self->_ucat;
    }
    LogPrintF((uint64_t)v78, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"SelfAccessory SiriAccess per-accessory updated: HK clear", v73, v74, v75, v76, v95);
  }
LABEL_66:
  self->_selfAccessorySiriEnabled = 0;
LABEL_67:
  resolvableAccessories = self->_resolvableAccessories;
  if (!resolvableAccessories)
    goto LABEL_73;
  v80 = self->_ucat;
  if (v80->var0 <= 30)
  {
    if (v80->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v80, 0x1Eu))
        goto LABEL_72;
      v80 = self->_ucat;
    }
    LogPrintF((uint64_t)v80, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]", 0x1Eu, (uint64_t)"ResolvableAccessory updated: HK clear", v73, v74, v75, v76, v95);
  }
LABEL_72:
  v81 = self->_resolvableAccessories;
  self->_resolvableAccessories = 0;

LABEL_73:
  resolvableAccessoriesMap = self->_resolvableAccessoriesMap;
  self->_resolvableAccessoriesMap = 0;

  if (v7)
  {
    v83 = _Block_copy(self->_selfAccessoryUpdatedHandler);
    v84 = v83;
    if (v83)
      (*((void (**)(void *))v83 + 2))(v83);

  }
  if (v28)
  {
    v85 = _Block_copy(self->_selfAccessoryAppDataChangedHandler);
    v86 = v85;
    if (v85)
      (*((void (**)(void *, _QWORD))v85 + 2))(v85, 0);

  }
  if (v36)
  {
    v87 = _Block_copy(self->_selfAccessoryMediaAccessUpdatedHandler);
    v88 = v87;
    if (v87)
      (*((void (**)(void *))v87 + 2))(v87);

    if (!v41)
    {
LABEL_83:
      if (!selfAccessorySiriEnabled)
        goto LABEL_84;
      goto LABEL_92;
    }
  }
  else if (!v41)
  {
    goto LABEL_83;
  }
  v89 = _Block_copy(self->_selfAccessoryMediaSystemUpdatedHandler);
  v90 = v89;
  if (v89)
    (*((void (**)(void *))v89 + 2))(v89);

  if (!selfAccessorySiriEnabled)
  {
LABEL_84:
    if (!resolvableAccessories)
      return;
    goto LABEL_95;
  }
LABEL_92:
  v91 = _Block_copy(self->_selfAccessorySiriAccessUpdatedHandler);
  v92 = v91;
  if (v91)
    (*((void (**)(void *))v91 + 2))(v91);

  if (resolvableAccessories)
  {
LABEL_95:
    v93 = _Block_copy(self->_resolvableAccessoriesChangedHandler);
    v94 = v93;
    if (v93)
      (*((void (**)(void *))v93 + 2))(v93);

  }
}

- (void)_updateAccessories
{
  CUHomeKitManager *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  LogCategory *ucat;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CUHomeKitResolvableAccessory *v44;
  CUHomeKitResolvableAccessory *v45;
  CUHomeKitResolvableAccessory *v46;
  NSMutableDictionary *resolvableAccessoriesMap;
  NSMutableDictionary *v48;
  NSMutableDictionary *v49;
  LogCategory *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int *p_var0;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  NSMutableDictionary *v62;
  uint64_t v63;
  NSArray *resolvableAccessories;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id obj;
  char *obja;
  uint64_t v75;
  char v76;
  char v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  CUHomeKitManager *v83;
  uint64_t v84;
  void *v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v2 = self;
  v112 = *MEMORY[0x1E0C80C00];
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  -[NSMutableDictionary allKeys](self->_resolvableAccessoriesMap, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v83 = v2;
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
  if (!v78)
  {
    v77 = 0;
    goto LABEL_38;
  }
  v77 = 0;
  v75 = *(_QWORD *)v104;
  do
  {
    v3 = 0;
    do
    {
      if (*(_QWORD *)v104 != v75)
        objc_enumerationMutation(obj);
      v80 = v3;
      v4 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v3);
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      -[HMHomeManager homes](v2->_homeManager, "homes");
      v82 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
      if (v5)
      {
        v6 = v5;
        v84 = *(_QWORD *)v100;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v100 != v84)
              objc_enumerationMutation(v82);
            v8 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v98 = 0u;
            objc_msgSend(v8, "accessories");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v96;
LABEL_13:
              v13 = 0;
              while (1)
              {
                if (*(_QWORD *)v96 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v13);
                objc_msgSend(v14, "uniqueIdentifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "isEqual:", v4);

                if ((v16 & 1) != 0)
                  break;
                if (v11 == ++v13)
                {
                  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
                  if (v11)
                    goto LABEL_13;
                  goto LABEL_19;
                }
              }
              v17 = v14;

              if (!v17)
                goto LABEL_21;
              v2 = v83;
              goto LABEL_29;
            }
LABEL_19:

LABEL_21:
            v2 = v83;
          }
          v6 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
          if (v6)
            continue;
          break;
        }
      }

      -[NSMutableDictionary objectForKeyedSubscript:](v2->_resolvableAccessoriesMap, "objectForKeyedSubscript:", v4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_resolvableAccessoriesMap, "setObject:forKeyedSubscript:", 0, v4);
      objc_msgSend(v17, "accessory");
      v82 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setDelegate:", 0);
      ucat = v2->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 != -1)
        {
          v19 = v80;
          goto LABEL_26;
        }
        v19 = v80;
        if (_LogCategory_Initialize((uint64_t)v2->_ucat, 0x1Eu))
        {
          ucat = v2->_ucat;
LABEL_26:
          objc_msgSend(v17, "irkData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "name");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateAccessories]", 0x1Eu, (uint64_t)"ResolvableAccessory removed: %@, %{mask}, '%@'\n", v21, v22, v23, v24, v4);

        }
        v77 = 1;
        goto LABEL_32;
      }
      v77 = 1;
LABEL_29:
      v19 = v80;
LABEL_32:

      v3 = v19 + 1;
    }
    while (v3 != v78);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
    v78 = v25;
  }
  while (v25);
LABEL_38:

  -[HMHomeManager currentAccessory](v2->_homeManager, "currentAccessory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "uniqueIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  -[HMHomeManager homes](v2->_homeManager, "homes");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
  if (!v72)
    goto LABEL_83;
  v71 = *(_QWORD *)v92;
  v79 = v27;
  while (2)
  {
    v28 = 0;
    while (2)
    {
      if (*(_QWORD *)v92 != v71)
        objc_enumerationMutation(v70);
      obja = v28;
      v29 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)v28);
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      objc_msgSend(v29, "accessories");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v88;
        v81 = v30;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v88 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v34);
            objc_msgSend(v35, "uniqueIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v36 && (objc_msgSend(v36, "isEqual:", v27) & 1) == 0)
            {
              objc_msgSend(v35, "device");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v38, "rapportIRK");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "data");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSMutableDictionary objectForKeyedSubscript:](v2->_resolvableAccessoriesMap, "objectForKeyedSubscript:", v37);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = v41;
                  v85 = v40;
                  if (v41)
                  {
                    objc_msgSend(v41, "irkData");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = v40;
                    v45 = v43;
                    if (v44 == v45)
                    {

                      v2 = v83;
                      v30 = v81;
                    }
                    else
                    {
                      v46 = v45;
                      v30 = v81;
                      if ((v44 == 0) != (v45 != 0))
                      {
                        v76 = -[CUHomeKitResolvableAccessory isEqual:](v44, "isEqual:", v45);

                        v2 = v83;
                        if ((v76 & 1) != 0)
                        {
LABEL_74:

                          v27 = v79;
                          goto LABEL_75;
                        }
                      }
                      else
                      {

                        v2 = v83;
                      }
                      objc_msgSend(v42, "setIrkData:", v44);
                      p_var0 = &v2->_ucat->var0;
                      if (*p_var0 > 30)
                        goto LABEL_73;
                      if (*p_var0 != -1)
                        goto LABEL_67;
                      if (!_LogCategory_Initialize((uint64_t)p_var0, 0x1Eu))
                      {
LABEL_73:
                        v77 = 1;
                        v2 = v83;
                        goto LABEL_74;
                      }
                      p_var0 = &v83->_ucat->var0;
LABEL_67:
                      objc_msgSend(v35, "name");
                      v69 = objc_claimAutoreleasedReturnValue();
                      LogPrintF((uint64_t)p_var0, (uint64_t)"-[CUHomeKitManager _updateAccessories]", 0x1Eu, (uint64_t)"ResolvableAccessory updated: %@, %{mask}, '%@'\n", v56, v57, v58, v59, (uint64_t)v37);
                      v77 = 1;
                      v44 = (CUHomeKitResolvableAccessory *)v69;
LABEL_70:
                      v2 = v83;
                    }

                    goto LABEL_74;
                  }
                  v44 = objc_alloc_init(CUHomeKitResolvableAccessory);
                  -[CUHomeKitResolvableAccessory setAccessory:](v44, "setAccessory:", v35);
                  -[CUHomeKitResolvableAccessory setIrkData:](v44, "setIrkData:", v40);
                  resolvableAccessoriesMap = v2->_resolvableAccessoriesMap;
                  if (!resolvableAccessoriesMap)
                  {
                    v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
                    v49 = v2->_resolvableAccessoriesMap;
                    v2->_resolvableAccessoriesMap = v48;

                    resolvableAccessoriesMap = v2->_resolvableAccessoriesMap;
                  }
                  -[NSMutableDictionary setObject:forKeyedSubscript:](resolvableAccessoriesMap, "setObject:forKeyedSubscript:", v44, v37);
                  objc_msgSend(v35, "setDelegate:", v2);
                  v50 = v2->_ucat;
                  v30 = v81;
                  if (v50->var0 <= 30)
                  {
                    if (v50->var0 != -1)
                      goto LABEL_62;
                    if (_LogCategory_Initialize((uint64_t)v50, 0x1Eu))
                    {
                      v50 = v83->_ucat;
LABEL_62:
                      objc_msgSend(v35, "name");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      LogPrintF((uint64_t)v50, (uint64_t)"-[CUHomeKitManager _updateAccessories]", 0x1Eu, (uint64_t)"ResolvableAccessory added: %@, %{mask}, '%@'\n", v51, v52, v53, v54, (uint64_t)v37);

                    }
                  }
                  v77 = 1;
                  goto LABEL_70;
                }
              }
              else
              {
                objc_msgSend(v35, "setDelegate:", v2);
              }
LABEL_75:

            }
            ++v34;
          }
          while (v32 != v34);
          v60 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
          v32 = v60;
        }
        while (v60);
      }

      v28 = obja + 1;
      if (obja + 1 != (char *)v72)
        continue;
      break;
    }
    v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
    if (v72)
      continue;
    break;
  }
LABEL_83:

  if ((v77 & 1) != 0)
  {
    v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v62 = v2->_resolvableAccessoriesMap;
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __38__CUHomeKitManager__updateAccessories__block_invoke;
    v86[3] = &unk_1E25DCA58;
    v86[4] = v61;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v62, "enumerateKeysAndObjectsUsingBlock:", v86);
    v63 = objc_msgSend(v61, "copy");
    resolvableAccessories = v2->_resolvableAccessories;
    v2->_resolvableAccessories = (NSArray *)v63;

    v65 = _Block_copy(v2->_resolvableAccessoriesChangedHandler);
    v66 = v65;
    if (v65)
      (*((void (**)(void *))v65 + 2))(v65);

  }
}

- (void)_updateHomes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  LogCategory *ucat;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *homes;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  LogCategory *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  LogCategory *v41;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  uint64_t v62;

  v61 = *MEMORY[0x1E0C80C00];
  if (self->_homeManagerDidUpdateHomes)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[HMHomeManager homes](self->_homeManager, "homes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (!v8)
      goto LABEL_19;
    v9 = v8;
    v10 = *(_QWORD *)v55;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v11);
        objc_msgSend(v12, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_homes, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 != -1)
              goto LABEL_10;
            if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            {
              ucat = self->_ucat;
LABEL_10:
              objc_msgSend(v12, "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateHomes]", 0x1Eu, (uint64_t)"FoundHome: %@ (%@)\n", v16, v17, v18, v19, (uint64_t)v13);

            }
          }
          objc_msgSend(v12, "setDelegate:", self);
          homes = self->_homes;
          if (!homes)
          {
            v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v22 = self->_homes;
            self->_homes = v21;

            homes = self->_homes;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](homes, "setObject:forKeyedSubscript:", v12, v13);
        }

        ++v11;
      }
      while (v9 != v11);
      v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      v9 = v23;
      if (!v23)
      {
LABEL_19:

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        -[NSMutableDictionary allKeys](self->_homes, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (!v24)
          goto LABEL_41;
        v25 = v24;
        v45 = *(_QWORD *)v51;
        while (1)
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v51 != v45)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v26);
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            -[HMHomeManager homes](self->_homeManager, "homes");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (!v29)
            {
LABEL_32:

              -[NSMutableDictionary objectForKeyedSubscript:](self->_homes, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = self->_ucat;
              if (v35->var0 <= 30)
              {
                if (v35->var0 != -1)
                  goto LABEL_34;
                if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
                {
                  v35 = self->_ucat;
LABEL_34:
                  objc_msgSend(v28, "name");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF((uint64_t)v35, (uint64_t)"-[CUHomeKitManager _updateHomes]", 0x1Eu, (uint64_t)"LostHome: %@ (%@)\n", v36, v37, v38, v39, v27);

                }
              }
              objc_msgSend(v28, "setDelegate:", 0);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_homes, "setObject:forKeyedSubscript:", 0, v27);
              goto LABEL_37;
            }
            v30 = v29;
            v31 = *(_QWORD *)v47;
LABEL_26:
            v32 = 0;
            while (1)
            {
              if (*(_QWORD *)v47 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v32), "uniqueIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isEqual:", v27);

              if ((v34 & 1) != 0)
                break;
              if (v30 == ++v32)
              {
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                if (v30)
                  goto LABEL_26;
                goto LABEL_32;
              }
            }
LABEL_37:

            ++v26;
          }
          while (v26 != v25);
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          v25 = v40;
          if (!v40)
          {
LABEL_41:

            -[CUHomeKitManager _updateUsers](self, "_updateUsers");
            -[CUHomeKitManager _updateSelfAccessoryIfNeeded](self, "_updateSelfAccessoryIfNeeded");
            -[CUHomeKitManager _updateAccessories](self, "_updateAccessories");
            return;
          }
        }
      }
    }
  }
  v41 = self->_ucat;
  if (v41->var0 <= 30)
  {
    if (v41->var0 != -1)
    {
LABEL_44:
      LogPrintF((uint64_t)v41, (uint64_t)"-[CUHomeKitManager _updateHomes]", 0x1Eu, (uint64_t)"Ignoring update homes before homeManagerDidUpdateHomes", v2, v3, v4, v5, v62);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v41, 0x1Eu))
    {
      v41 = self->_ucat;
      goto LABEL_44;
    }
  }
}

- (void)_updateSelfAccessoryIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  HMAccessory *selfAccessory;
  _BOOL4 v12;
  LogCategory *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSUUID *selfAccessoryRoomID;
  NSUUID *v21;
  NSUUID *v22;
  NSUUID *v23;
  char v24;
  int v25;
  LogCategory *ucat;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSUUID *v31;
  NSUUID *v32;
  _BOOL4 v33;
  HMAccessory *v34;
  void *v35;
  HMUser *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  LogCategory *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  HMUser *selfAccessoryUser;
  CUHomeKitManager *v50;
  void (**selfAccessoryUpdatedHandler)(void);
  void *v52;
  void *v53;
  NSDictionary *selfAccessoryAppData;
  NSDictionary *v55;
  NSDictionary *v56;
  NSDictionary *v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  LogCategory *v63;
  void (**selfAccessoryAppDataChangedHandler)(id, id);
  void *v65;
  void *v66;
  id obj;

  if (self->_selfAccessoryEnabled)
  {
    -[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v3;
    if (v3)
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory uniqueIdentifier](self->_selfAccessory, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      v7 = v5;
      if (v6 == v7)
      {

      }
      else
      {
        v8 = v7;
        if ((v6 == 0) == (v7 != 0))
        {

          goto LABEL_18;
        }
        v9 = objc_msgSend(v6, "isEqual:", v7);

        if ((v9 & 1) == 0)
        {
LABEL_18:
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
                goto LABEL_27;
              ucat = self->_ucat;
            }
            objc_msgSend(obj, "name");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"FoundSelfAccessory: %@ (%@)\n", v27, v28, v29, v30, (uint64_t)v6);

          }
LABEL_27:
          objc_storeStrong((id *)&self->_selfAccessory, obj);
          -[HMAccessory setDelegate:](self->_selfAccessory, "setDelegate:", self);
          v25 = 1;
          goto LABEL_28;
        }
      }
      objc_msgSend(obj, "room");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      selfAccessoryRoomID = self->_selfAccessoryRoomID;
      v21 = v19;
      v22 = selfAccessoryRoomID;
      if (v21 == v22)
      {

        v25 = 0;
        v31 = v21;
      }
      else
      {
        v23 = v22;
        if ((v21 == 0) != (v22 != 0))
        {
          v24 = -[NSUUID isEqual:](v21, "isEqual:", v22);

          if ((v24 & 1) != 0)
          {
            v25 = 0;
LABEL_25:

LABEL_28:
            v12 = v25 != 0;
            goto LABEL_32;
          }
        }
        else
        {

        }
        v32 = v21;
        v31 = self->_selfAccessoryRoomID;
        self->_selfAccessoryRoomID = v32;
        v25 = 1;
      }

      goto LABEL_25;
    }
    -[HMAccessory uniqueIdentifier](self->_selfAccessory, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    selfAccessory = self->_selfAccessory;
    v12 = selfAccessory != 0;
    if (!selfAccessory)
    {
LABEL_31:

LABEL_32:
      objc_msgSend(obj, "home");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "currentUser");
      v36 = (HMUser *)objc_claimAutoreleasedReturnValue();

      -[HMUser uniqueIdentifier](v36, "uniqueIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMUser uniqueIdentifier](self->_selfAccessoryUser, "uniqueIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v37;
      v40 = v38;
      if (v39 == v40)
      {

        if (!v12)
          goto LABEL_50;
        goto LABEL_48;
      }
      v41 = v40;
      if ((v39 == 0) == (v40 != 0))
      {

      }
      else
      {
        v42 = objc_msgSend(v39, "isEqual:", v40);

        if ((v42 & 1) != 0)
        {
          if (!v12)
            goto LABEL_50;
          goto LABEL_48;
        }
      }
      v43 = self->_ucat;
      if (v43->var0 <= 30)
      {
        if (v43->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_44;
          v43 = self->_ucat;
        }
        -[HMUser userID](v36, "userID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v43, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"SelfAccessory user updated: %{mask}", v45, v46, v47, v48, (uint64_t)v44);

      }
LABEL_44:
      if (v36)
      {
        selfAccessoryUser = v36;
        v50 = self;
      }
      else
      {
        selfAccessoryUser = self->_selfAccessoryUser;
        v50 = 0;
      }
      -[HMUser setDelegate:](selfAccessoryUser, "setDelegate:", v50);
      objc_storeStrong((id *)&self->_selfAccessoryUser, v36);
LABEL_48:
      selfAccessoryUpdatedHandler = (void (**)(void))self->_selfAccessoryUpdatedHandler;
      if (selfAccessoryUpdatedHandler)
        selfAccessoryUpdatedHandler[2]();
LABEL_50:
      -[HMAccessory applicationData](self->_selfAccessory, "applicationData");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "dictionary");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      selfAccessoryAppData = self->_selfAccessoryAppData;
      v55 = v53;
      v56 = selfAccessoryAppData;
      if (v55 == v56)
      {

LABEL_62:
        -[CUHomeKitManager _updateSelfAccessoryMediaAccess](self, "_updateSelfAccessoryMediaAccess");
        -[CUHomeKitManager _updateSelfAccessoryMediaSystem](self, "_updateSelfAccessoryMediaSystem");
        -[CUHomeKitManager _updateSelfAccessorySiriAccess](self, "_updateSelfAccessorySiriAccess");

        return;
      }
      v57 = v56;
      if ((v55 == 0) != (v56 != 0))
      {
        v58 = -[NSDictionary isEqual:](v55, "isEqual:", v56);

        if ((v58 & 1) != 0)
          goto LABEL_62;
      }
      else
      {

      }
      v63 = self->_ucat;
      if (v63->var0 <= 30)
      {
        if (v63->var0 != -1)
        {
LABEL_58:
          LogPrintF((uint64_t)v63, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"SelfAccessory AppData changed: %##@", v59, v60, v61, v62, (uint64_t)v55);
          goto LABEL_60;
        }
        if (_LogCategory_Initialize((uint64_t)v63, 0x1Eu))
        {
          v63 = self->_ucat;
          goto LABEL_58;
        }
      }
LABEL_60:
      objc_storeStrong((id *)&self->_selfAccessoryAppData, v53);
      selfAccessoryAppDataChangedHandler = (void (**)(id, id))self->_selfAccessoryAppDataChangedHandler;
      if (selfAccessoryAppDataChangedHandler)
        selfAccessoryAppDataChangedHandler[2](selfAccessoryAppDataChangedHandler, v55);
      goto LABEL_62;
    }
    v13 = self->_ucat;
    if (v13->var0 <= 30)
    {
      if (v13->var0 == -1)
      {
        v33 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu);
        selfAccessory = self->_selfAccessory;
        if (!v33)
          goto LABEL_30;
        v13 = self->_ucat;
      }
      -[HMAccessory name](selfAccessory, "name");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v13, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]", 0x1Eu, (uint64_t)"LostSelfAccessory: %@ (%@)\n", v14, v15, v16, v17, (uint64_t)v10);

      selfAccessory = self->_selfAccessory;
    }
LABEL_30:
    -[HMAccessory setDelegate:](selfAccessory, "setDelegate:", self);
    v34 = self->_selfAccessory;
    self->_selfAccessory = 0;

    goto LABEL_31;
  }
}

- (void)_updateSelfAccessoryMediaAccess
{
  void *v3;
  unsigned int selfAccessoryMediaAccessFlags;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  int v12;
  LogCategory *ucat;
  const char *v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  LogCategory *v24;
  const char *v25;
  void *v26;
  NSString *selfAccessoryMediaAccessPassword;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  char v31;
  LogCategory *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void (**selfAccessoryMediaAccessUpdatedHandler)(void);
  id v40;

  if (self->_selfAccessoryMediaAccessEnabled)
  {
    -[HMAccessory home](self->_selfAccessory, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_44:

      return;
    }
    selfAccessoryMediaAccessFlags = self->_selfAccessoryMediaAccessFlags;
    v40 = v3;
    v5 = objc_msgSend(v3, "isMediaPeerToPeerEnabled");
    v10 = (selfAccessoryMediaAccessFlags >> 1) & 1;
    v11 = v10 != v5;
    if (v10 == v5)
    {
      v15 = self->_selfAccessoryMediaAccessFlags;
      goto LABEL_17;
    }
    v12 = v5;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_6:
        if ((selfAccessoryMediaAccessFlags & 2) != 0)
          v14 = "yes";
        else
          v14 = "no";
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaAccess]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess P2PAllowed updated: %s -> %s\n", v6, v7, v8, v9, (uint64_t)v14);
        goto LABEL_13;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_6;
      }
    }
LABEL_13:
    v16 = self->_selfAccessoryMediaAccessFlags & 0xFFFFFFFD;
    if (v12)
      v17 = 2;
    else
      v17 = 0;
    LOBYTE(v15) = v16 | v17;
    self->_selfAccessoryMediaAccessFlags = v16 | v17;
LABEL_17:
    v18 = objc_msgSend(v40, "minimumMediaUserPrivilege");
    if (((v15 & 1) == 0) != (v18 != 0))
      goto LABEL_26;
    v23 = v18;
    v24 = self->_ucat;
    if (v24->var0 <= 30)
    {
      if (v24->var0 != -1)
      {
LABEL_20:
        if ((v15 & 1) != 0)
          v25 = "yes";
        else
          v25 = "no";
        LogPrintF((uint64_t)v24, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaAccess]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess HomeOnly updated: %s -> %s\n", v19, v20, v21, v22, (uint64_t)v25);
        goto LABEL_25;
      }
      if (_LogCategory_Initialize((uint64_t)v24, 0x1Eu))
      {
        v24 = self->_ucat;
        goto LABEL_20;
      }
    }
LABEL_25:
    self->_selfAccessoryMediaAccessFlags = self->_selfAccessoryMediaAccessFlags & 0xFFFFFFFE | (v23 != 0);
    v11 = 1;
LABEL_26:
    objc_msgSend(v40, "mediaPassword");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    selfAccessoryMediaAccessPassword = self->_selfAccessoryMediaAccessPassword;
    v28 = v26;
    v29 = selfAccessoryMediaAccessPassword;
    if (v28 == v29)
    {

    }
    else
    {
      v30 = v29;
      if ((v28 == 0) == (v29 != 0))
      {

        goto LABEL_34;
      }
      v31 = -[NSString isEqual:](v28, "isEqual:", v29);

      if ((v31 & 1) == 0)
      {
LABEL_34:
        v32 = self->_ucat;
        if (v32->var0 <= 30)
        {
          if (v32->var0 != -1)
          {
LABEL_36:
            v33 = -[NSString length](v28, "length");
            v38 = "set";
            if (!v33)
              v38 = "not set";
            LogPrintF((uint64_t)v32, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaAccess]", 0x1Eu, (uint64_t)"SelfAccessory MediaAccess password updated: %s\n", v34, v35, v36, v37, (uint64_t)v38);
            goto LABEL_40;
          }
          if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          {
            v32 = self->_ucat;
            goto LABEL_36;
          }
        }
LABEL_40:
        objc_storeStrong((id *)&self->_selfAccessoryMediaAccessPassword, v26);
        goto LABEL_41;
      }
    }
    if (!v11)
    {
LABEL_43:

      v3 = v40;
      goto LABEL_44;
    }
LABEL_41:
    selfAccessoryMediaAccessUpdatedHandler = (void (**)(void))self->_selfAccessoryMediaAccessUpdatedHandler;
    if (selfAccessoryMediaAccessUpdatedHandler)
      selfAccessoryMediaAccessUpdatedHandler[2]();
    goto LABEL_43;
  }
}

- (void)_updateSelfAccessoryMediaSystem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  char v12;
  HMMediaSystem *v13;
  HMMediaSystem *v14;
  HMAccessory *selfAccessoryMediaSystemCounterpart;
  NSString *v16;
  HMMediaSystemRole *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  LogCategory *v22;
  HMMediaSystem *selfAccessoryMediaSystem;
  LogCategory *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(void);
  HMMediaSystem *v30;
  NSString *v31;
  void *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSString *selfAccessoryMediaSystemName;
  LogCategory *v42;
  NSString *v43;
  void *v44;
  unint64_t v45;
  HMMediaSystemRole *selfAccessoryMediaSystemRole;
  HMMediaSystemRole *v47;
  HMMediaSystemRole *v48;
  HMMediaSystemRole *v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  HMMediaSystemRole *v55;
  LogCategory *v56;
  const char *v57;
  HMMediaSystemRole *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *i;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  char v72;
  LogCategory *ucat;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (**selfAccessoryMediaSystemUpdatedHandler)(void);
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  NSString *v84;
  NSString *v85;
  void *v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (self->_selfAccessoryMediaSystemEnabled)
  {
    v92 = 0;
    -[CUHomeKitManager _selfAccessoryMediaSystemUncached:](self, "_selfAccessoryMediaSystemUncached:", &v92);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v92;
    v5 = v4;
    if (v3 && v4)
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystem uniqueIdentifier](self->_selfAccessoryMediaSystem, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v8 != v9;
      if (v8 == v9)
      {

        selfAccessoryMediaSystem = (HMMediaSystem *)v8;
LABEL_22:

LABEL_23:
        v31 = self->_selfAccessoryMediaSystemName;
        objc_msgSend(v3, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v31;
        v34 = v32;
        v35 = v34;
        if (v33 == v34)
        {

          selfAccessoryMediaSystemName = v33;
LABEL_34:

          goto LABEL_35;
        }
        if ((v33 == 0) != (v34 != 0))
        {
          v36 = -[NSString isEqual:](v33, "isEqual:", v34);

          if ((v36 & 1) != 0)
          {
LABEL_35:
            v83 = v10;
            v84 = v35;
            v85 = v33;
            v86 = v8;
            v87 = v5;
            objc_msgSend(v5, "role");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "type");
            selfAccessoryMediaSystemRole = self->_selfAccessoryMediaSystemRole;
            v47 = v44;
            v48 = selfAccessoryMediaSystemRole;
            if (v47 == v48)
            {

              v55 = v47;
LABEL_50:

              goto LABEL_51;
            }
            v49 = v48;
            if ((v47 == 0) != (v48 != 0))
            {
              v50 = -[HMMediaSystemRole isEqual:](v47, "isEqual:", v48);

              if ((v50 & 1) != 0)
              {
LABEL_51:
                if (v45 == 1)
                  v59 = 2;
                else
                  v59 = v45 == 2;
                if (v59)
                {
                  v90 = 0u;
                  v91 = 0u;
                  v88 = 0u;
                  v89 = 0u;
                  objc_msgSend(v3, "components");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = (void *)objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
                  if (v61)
                  {
                    v82 = v3;
                    v62 = *(_QWORD *)v89;
                    while (2)
                    {
                      for (i = 0; i != v61; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v89 != v62)
                          objc_enumerationMutation(v60);
                        v64 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i);
                        objc_msgSend(v64, "role");
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        v66 = objc_msgSend(v65, "type");

                        if (v66 == v59)
                        {
                          objc_msgSend(v64, "mediaProfile");
                          v67 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v67, "accessory");
                          v61 = (void *)objc_claimAutoreleasedReturnValue();

                          goto LABEL_65;
                        }
                      }
                      v61 = (void *)objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
                      if (v61)
                        continue;
                      break;
                    }
LABEL_65:
                    v3 = v82;
                  }

                }
                else
                {
                  v61 = 0;
                }
                -[HMAccessory uniqueIdentifier](self->_selfAccessoryMediaSystemCounterpart, "uniqueIdentifier");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "uniqueIdentifier");
                v69 = (id)objc_claimAutoreleasedReturnValue();
                v70 = v68;
                v71 = v70;
                if (v69 == v70)
                {

                }
                else
                {
                  if ((v70 != 0) == (v69 == 0))
                  {

                    goto LABEL_76;
                  }
                  v72 = objc_msgSend(v69, "isEqual:", v70);

                  if ((v72 & 1) == 0)
                  {
LABEL_76:
                    ucat = self->_ucat;
                    if (ucat->var0 <= 30)
                    {
                      if (ucat->var0 == -1)
                      {
                        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
                          goto LABEL_80;
                        ucat = self->_ucat;
                      }
                      objc_msgSend(v61, "name");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemCounterpart updated: %@ '%@'\n", v74, v75, v76, v77, (uint64_t)v69);

                    }
LABEL_80:
                    objc_storeStrong((id *)&self->_selfAccessoryMediaSystemCounterpart, v61);
                    goto LABEL_81;
                  }
                }
                if (!v83)
                {
LABEL_83:

                  v5 = v87;
                  goto LABEL_84;
                }
LABEL_81:
                selfAccessoryMediaSystemUpdatedHandler = (void (**)(void))self->_selfAccessoryMediaSystemUpdatedHandler;
                if (selfAccessoryMediaSystemUpdatedHandler)
                  selfAccessoryMediaSystemUpdatedHandler[2]();
                goto LABEL_83;
              }
            }
            else
            {

            }
            v56 = self->_ucat;
            if (v56->var0 <= 30)
            {
              if (v56->var0 != -1)
              {
LABEL_43:
                if (v45 > 2)
                  v57 = "?";
                else
                  v57 = off_1E25DCBF8[v45];
                LogPrintF((uint64_t)v56, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystemRole updated: %s\n", v51, v52, v53, v54, (uint64_t)v57);
                goto LABEL_49;
              }
              if (_LogCategory_Initialize((uint64_t)v56, 0x1Eu))
              {
                v56 = self->_ucat;
                goto LABEL_43;
              }
            }
LABEL_49:
            v58 = v47;
            v55 = self->_selfAccessoryMediaSystemRole;
            self->_selfAccessoryMediaSystemRole = v58;
            v83 = 1;
            goto LABEL_50;
          }
        }
        else
        {

        }
        v42 = self->_ucat;
        if (v42->var0 <= 30)
        {
          if (v42->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v42, 0x1Eu))
              goto LABEL_33;
            v42 = self->_ucat;
          }
          LogPrintF((uint64_t)v42, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem name updated: '%@' -> '%@'\n", v37, v38, v39, v40, (uint64_t)v33);
        }
LABEL_33:
        v43 = v35;
        selfAccessoryMediaSystemName = self->_selfAccessoryMediaSystemName;
        self->_selfAccessoryMediaSystemName = v43;
        v10 = 1;
        goto LABEL_34;
      }
      v11 = v9;
      if ((v8 == 0) != (v9 != 0))
      {
        v12 = objc_msgSend(v8, "isEqual:", v9);

        if ((v12 & 1) != 0)
        {
          v10 = 0;
          goto LABEL_23;
        }
      }
      else
      {

      }
      v24 = self->_ucat;
      if (v24->var0 <= 30)
      {
        if (v24->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_21;
          v24 = self->_ucat;
        }
        objc_msgSend(v3, "name");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v24, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem ID updated: %@ '%@'\n", v25, v26, v27, v28, (uint64_t)v8);

      }
LABEL_21:
      objc_msgSend(v3, "setDelegate:", self);
      v30 = v3;
      selfAccessoryMediaSystem = self->_selfAccessoryMediaSystem;
      self->_selfAccessoryMediaSystem = v30;
      goto LABEL_22;
    }
    v13 = self->_selfAccessoryMediaSystem;
    -[HMMediaSystem setDelegate:](v13, "setDelegate:", 0);
    v14 = self->_selfAccessoryMediaSystem;
    self->_selfAccessoryMediaSystem = 0;

    selfAccessoryMediaSystemCounterpart = self->_selfAccessoryMediaSystemCounterpart;
    self->_selfAccessoryMediaSystemCounterpart = 0;

    v16 = self->_selfAccessoryMediaSystemName;
    self->_selfAccessoryMediaSystemName = 0;

    v17 = self->_selfAccessoryMediaSystemRole;
    self->_selfAccessoryMediaSystemRole = 0;

    if (!v13)
    {
LABEL_84:

      return;
    }
    v22 = self->_ucat;
    if (v22->var0 <= 30)
    {
      if (v22->var0 != -1)
      {
LABEL_11:
        LogPrintF((uint64_t)v22, (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaSystem]", 0x1Eu, (uint64_t)"SelfAccessoryMediaSystem removed\n", v18, v19, v20, v21, v79);
        goto LABEL_18;
      }
      if (_LogCategory_Initialize((uint64_t)v22, 0x1Eu))
      {
        v22 = self->_ucat;
        goto LABEL_11;
      }
    }
LABEL_18:
    v29 = (void (**)(void))self->_selfAccessoryMediaSystemUpdatedHandler;
    if (v29)
      v29[2]();
    goto LABEL_84;
  }
}

- (void)_updateSelfAccessorySiriAccess
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int selfAccessorySiriEnabled;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  LogCategory *ucat;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**selfAccessorySiriAccessUpdatedHandler)(void);
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_selfAccessorySiriAccessEnabled)
  {
    -[HMAccessory home](self->_selfAccessory, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
LABEL_30:

      return;
    }
    objc_msgSend(v3, "currentUser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v5, "assistantAccessControlForHome:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    selfAccessorySiriEnabled = self->_selfAccessorySiriEnabled;
    if (objc_msgSend(v7, "isEnabled"))
    {
      -[HMAccessory uniqueIdentifier](self->_selfAccessory, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v7, "accessories");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v23 = selfAccessorySiriEnabled;
        v24 = v7;
        v12 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqual:", v9);

            if ((v15 & 1) != 0)
            {
              LODWORD(v11) = 1;
              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v11)
            continue;
          break;
        }
LABEL_16:
        v7 = v24;
        selfAccessorySiriEnabled = v23;
      }

    }
    else
    {
      LODWORD(v11) = 0;
    }
    if (selfAccessorySiriEnabled == (_DWORD)v11)
    {
LABEL_28:

      goto LABEL_29;
    }
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_21:
        if (selfAccessorySiriEnabled)
          v17 = "yes";
        else
          v17 = "no";
        objc_msgSend(v7, "isEnabled");
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateSelfAccessorySiriAccess]", 0x1Eu, (uint64_t)"SelfAccessory SiriAccess per-accessory updated: %s -> %s (global %s)\n", v18, v19, v20, v21, (uint64_t)v17);
        goto LABEL_26;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_21;
      }
    }
LABEL_26:
    self->_selfAccessorySiriEnabled = v11;
    selfAccessorySiriAccessUpdatedHandler = (void (**)(void))self->_selfAccessorySiriAccessUpdatedHandler;
    if (selfAccessorySiriAccessUpdatedHandler)
      selfAccessorySiriAccessUpdatedHandler[2]();
    goto LABEL_28;
  }
}

- (void)_updateState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  unsigned int state;
  LogCategory *ucat;
  const char *v11;
  void (**stateChangedHandler)(id, _QWORD);

  if (self->_homeManagerDidUpdateHomes
    && (v7 = -[HMHomeManager dataSyncState](self->_homeManager, "dataSyncState"), v7 <= 5))
  {
    v8 = dword_18D51E20C[v7];
  }
  else
  {
    v8 = 0;
  }
  state = self->_state;
  if ((_DWORD)v8 != state)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        if (state > 5)
          v11 = "?";
        else
          v11 = off_1E25DCC10[state];
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateState]", 0x1Eu, (uint64_t)"HomeKit state updated: %s -> %s\n", v2, v3, v4, v5, (uint64_t)v11);
        goto LABEL_14;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        state = self->_state;
        goto LABEL_8;
      }
    }
LABEL_14:
    self->_state = v8;
    stateChangedHandler = (void (**)(id, _QWORD))self->_stateChangedHandler;
    if (stateChangedHandler)
      stateChangedHandler[2](stateChangedHandler, v8);
  }
}

- (void)_updateUsers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  LogCategory *ucat;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *users;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  LogCategory *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (**stateChangedHandler)(id, uint64_t);
  void *v45;
  void *v46;
  id v47;
  char v48;
  uint64_t v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[HMHomeManager homes](self->_homeManager, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v64 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "currentUser");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v6);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v3;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (!v10)
  {
    v48 = 0;
    goto LABEL_31;
  }
  v11 = v10;
  v48 = 0;
  v12 = *(_QWORD *)v60;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v60 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v13);
      objc_msgSend(v14, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_users, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 != -1)
              goto LABEL_19;
            if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            {
              ucat = self->_ucat;
LABEL_19:
              objc_msgSend(v14, "userID");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _updateUsers]", 0x1Eu, (uint64_t)"FoundCurrentUser: %@, %{mask}", v18, v19, v20, v21, (uint64_t)v15);

            }
          }
          objc_msgSend(v14, "setDelegate:", self);
          users = self->_users;
          if (!users)
          {
            v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v24 = self->_users;
            self->_users = v23;

            users = self->_users;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](users, "setObject:forKeyedSubscript:", v14, v15);
          v48 = 1;
        }

      }
      ++v13;
    }
    while (v11 != v13);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    v11 = v25;
  }
  while (v25);
LABEL_31:

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[NSMutableDictionary allKeys](self->_users, "allKeys");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (!v26)
    goto LABEL_53;
  v27 = v26;
  v49 = *(_QWORD *)v56;
  while (2)
  {
    v28 = 0;
    while (2)
    {
      if (*(_QWORD *)v56 != v49)
        objc_enumerationMutation(v47);
      v29 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v28);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v30 = obj;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      if (!v31)
      {
LABEL_44:

        -[NSMutableDictionary objectForKeyedSubscript:](self->_users, "objectForKeyedSubscript:", v29);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v37 = self->_ucat;
        if (v37->var0 <= 30)
        {
          if (v37->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
              goto LABEL_48;
            v37 = self->_ucat;
          }
          objc_msgSend(v30, "uniqueIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "userID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)v37, (uint64_t)"-[CUHomeKitManager _updateUsers]", 0x1Eu, (uint64_t)"LostCurrentUser: %@, %{mask}", v39, v40, v41, v42, (uint64_t)v38);

        }
LABEL_48:
        objc_msgSend(v30, "setDelegate:", 0);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_users, "setObject:forKeyedSubscript:", 0, v29);
        v48 = 1;
        goto LABEL_49;
      }
      v32 = v31;
      v33 = *(_QWORD *)v52;
LABEL_38:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v34), "uniqueIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqual:", v29);

        if ((v36 & 1) != 0)
          break;
        if (v32 == ++v34)
        {
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
          if (v32)
            goto LABEL_38;
          goto LABEL_44;
        }
      }
LABEL_49:

      if (++v28 != v27)
        continue;
      break;
    }
    v43 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    v27 = v43;
    if (v43)
      continue;
    break;
  }
LABEL_53:

  if ((v48 & 1) != 0 && self->_state == 1)
  {
    stateChangedHandler = (void (**)(id, uint64_t))self->_stateChangedHandler;
    if (stateChangedHandler)
      stateChangedHandler[2](stateChangedHandler, 1);
  }

}

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CUHomeKitManager_getPairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_1E25DD058;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)getHomeKitLocalPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, id);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HMHomeManager *homeManager;
  void *v14;
  id v15;
  NSObject *dispatchQueue;
  id v17;
  id v18;
  LogCategory *ucat;
  uint64_t v20[5];
  id v21;
  id v22;
  void (**v23)(id, _QWORD, id);
  unint64_t v24;
  id v25;

  v6 = (void (**)(id, _QWORD, id))a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
          goto LABEL_7;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager getHomeKitLocalPairingIdentityWithOptions:completion:]", 0x5Au, (uint64_t)"### getHomeKitLocalPairingIdentityWithOptions: no identities for repair flow SPI\n", v9, v10, v11, v12, v20[0]);
    }
LABEL_7:
    NSErrorWithOSStatusF(4294960561, (uint64_t)"HomeKit does not support this SPI on this platform", v7, v8, v9, v10, v11, v12, v20[0]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v17);
    goto LABEL_8;
  }
  homeManager = self->_homeManager;
  v25 = 0;
  -[HMHomeManager allPairingIdentitiesInRankOrderWithError:](homeManager, "allPairingIdentitiesInRankOrderWithError:", &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  dispatchQueue = self->_dispatchQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = (uint64_t)__73__CUHomeKitManager_getHomeKitLocalPairingIdentityWithOptions_completion___block_invoke;
  v20[3] = (uint64_t)&unk_1E25DCE98;
  v20[4] = (uint64_t)self;
  v21 = v14;
  v24 = a3;
  v22 = v15;
  v23 = v6;
  v17 = v15;
  v18 = v14;
  dispatch_async(dispatchQueue, v20);

LABEL_8:
}

- (void)_getPairingIdentityForAccessoryWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;

  v6 = a4;
  -[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = "No HomeKit Self Accessory";
LABEL_6:
    NSErrorWithOSStatusF(4294960569, (uint64_t)v14, v7, v8, v9, v10, v11, v12, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:](self, "_getPairingIdentityCompleted:options:error:label:completion:", 0, a3, v15, CFSTR("SelfAccessory"), v6);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v14 = "No HomeKit Self Accessory Identity SPI";
    goto LABEL_6;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke;
  v17[3] = &unk_1E25DCA80;
  v17[4] = self;
  v19 = a3;
  v18 = v6;
  objc_msgSend(v13, "pairingIdentityWithPrivateKey:completionHandler:", (a3 >> 1) & 1, v17);

LABEL_7:
}

- (void)_getPairingIdentityForUserWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  LogCategory *ucat;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[6];
  id v32;
  id v33;
  unint64_t v34;
  id v35;

  v6 = a4;
  v35 = 0;
  -[CUHomeKitManager _bestUserAndLabel:](self, "_bestUserAndLabel:", &v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_9;
          ucat = self->_ucat;
        }
        objc_msgSend(v7, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityForUserWithOptions:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity %#{flags} via SPI '%{mask}", v16, v17, v18, v19, a3);

      }
LABEL_9:
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke;
      v31[3] = &unk_1E25DCAD0;
      v34 = a3;
      v31[4] = self;
      v31[5] = v7;
      v32 = v14;
      v33 = v6;
      objc_msgSend(v7, "pairingIdentityWithCompletionHandler:", v31);

      goto LABEL_10;
    }
    objc_msgSend(v7, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSErrorWithOSStatusF(4294960569, (uint64_t)"No HomeKit user pairing identity, no SPI, '%@'", v22, v23, v24, v25, v26, v27, (uint64_t)v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:](self, "_getPairingIdentityCompleted:options:error:label:completion:", 0, a3, v28, v14, v6);
  }
  else
  {
    NSErrorWithOSStatusF(4294896143, (uint64_t)"No HomeKit user for pairing identity", v8, v9, v10, v11, v12, v13, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:](self, "_getPairingIdentityCompleted:options:error:label:completion:", 0, a3, v20, v14, v6);

  }
LABEL_10:

}

- (void)_getPairingIdentityForLegacyWithOptions:(unint64_t)a3 user:(id)a4 nonLegacyIdentity:(id)a5 label:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  LogCategory *ucat;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
          goto LABEL_7;
        ucat = self->_ucat;
      }
      objc_msgSend(v12, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityForLegacyWithOptions:user:nonLegacyIdentity:label:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity %#{flags} via fetch all SPI '%{mask}", v17, v18, v19, v20, a3);

    }
LABEL_7:
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke;
    v30[3] = &unk_1E25DCB20;
    v30[4] = self;
    v31 = v13;
    v32 = v12;
    v35 = a3;
    v33 = v14;
    v34 = v15;
    objc_msgSend(v32, "fetchAllPairingIdentitiesWithCompletionHandler:", v30);

    goto LABEL_8;
  }
  objc_msgSend(v12, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSErrorWithOSStatusF(4294960569, (uint64_t)"No HomeKit pairing identity, no fetch all SPI, '%{mask}'", v22, v23, v24, v25, v26, v27, (uint64_t)v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:](self, "_getPairingIdentityCompleted:options:error:label:completion:", 0, a3, v28, v14, v15);
LABEL_8:

}

- (void)_getPairingIdentityCompleted:(id)a3 options:(unint64_t)a4 error:(id)a5 label:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  LogCategory *ucat;
  int var0;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  LogCategory *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *, _QWORD))a7;
  v22 = v12;
  if (v22 && !v13)
  {
    v42 = 0;
    -[CUHomeKitManager _cuPairingIdentityWithHMFPairingIdentity:options:error:](self, "_cuPairingIdentityWithHMFPairingIdentity:options:error:", v22, a4, &v42);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v42;
    ucat = self->_ucat;
    var0 = ucat->var0;
    if (v23)
    {
      if (var0 <= 30)
      {
        if (var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            goto LABEL_18;
          ucat = self->_ucat;
        }
        objc_msgSend(v23, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity finish: %#{flags}, %@ (%@)\n", v33, v34, v35, v36, a4);

      }
LABEL_18:
      v15[2](v15, v23, 0);
LABEL_21:

      goto LABEL_22;
    }
    if (var0 <= 90)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
          goto LABEL_20;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]", 0x5Au, (uint64_t)"### GetPairingIdentity convert failed: %{error}\n", v26, v27, v28, v29, (uint64_t)v30);
    }
LABEL_20:
    NSErrorWithOSStatusF(4294960596, (uint64_t)"No converted identity, no error", v24, v25, v26, v27, v28, v29, v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v15)[2](v15, 0, v39);

    goto LABEL_21;
  }
  v37 = self->_ucat;
  if (v37->var0 <= 90)
  {
    if (v37->var0 != -1)
    {
LABEL_9:
      LogPrintF((uint64_t)v37, (uint64_t)"-[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]", 0x5Au, (uint64_t)"### GetPairingIdentity failed: %{error}\n", v18, v19, v20, v21, (uint64_t)v13);
      goto LABEL_14;
    }
    if (_LogCategory_Initialize((uint64_t)v37, 0x5Au))
    {
      v37 = self->_ucat;
      goto LABEL_9;
    }
  }
LABEL_14:
  if (v13)
  {
    ((void (**)(id, void *, id))v15)[2](v15, 0, v13);
  }
  else
  {
    NSErrorWithOSStatusF(4294960596, (uint64_t)"No identity, no error", v16, v17, v18, v19, v20, v21, v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v15)[2](v15, 0, v38);

  }
LABEL_22:

}

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__CUHomeKitManager_findPairedPeer_options_completion___block_invoke;
  v13[3] = &unk_1E25DD0F8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  LogCategory *v18;
  CUHomeKitFindPairedPeerContext *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  LogCategory *ucat;
  CUHomeKitFindPairedPeerContext *v39;
  void *v40;
  CUHomeKitManager *v41;
  void (**v42)(id, _QWORD, void *);
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v8, "identifierStr");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      NSErrorWithOSStatusF(4294960591, (uint64_t)"Bad peer identifier: '%@'", v16, v17, v10, v11, v12, v13, (uint64_t)v8);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
            goto LABEL_29;
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _findPairedPeer:options:completion:]", 0x5Au, (uint64_t)"### FindPairedPeer failed: %{error}\n", v33, v34, v35, v36, (uint64_t)v37);
      }
LABEL_29:
      v9[2](v9, 0, v37);

      goto LABEL_24;
    }
  }
  v18 = self->_ucat;
  if (v18->var0 <= 30)
  {
    if (v18->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v18, 0x1Eu))
        goto LABEL_7;
      v18 = self->_ucat;
    }
    LogPrintF((uint64_t)v18, (uint64_t)"-[CUHomeKitManager _findPairedPeer:options:completion:]", 0x1Eu, (uint64_t)"FindPairedPeer start: '%@', %#{flags}\n", v10, v11, v12, v13, v14);
  }
LABEL_7:
  v19 = objc_alloc_init(CUHomeKitFindPairedPeerContext);
  v42 = v9;
  -[CUHomeKitFindPairedPeerContext setCompletion:](v19, "setCompletion:", v9);
  v40 = (void *)v14;
  -[CUHomeKitFindPairedPeerContext setIdentifier:](v19, "setIdentifier:", v14);
  -[CUHomeKitFindPairedPeerContext setOptions:](v19, "setOptions:", a4);
  v43 = v8;
  -[CUHomeKitFindPairedPeerContext setPairedPeer:](v19, "setPairedPeer:", v8);
  v39 = v19;
  -[CUHomeKitFindPairedPeerContext setStartTicks:](v19, "setStartTicks:", mach_absolute_time());
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v41 = self;
  -[HMHomeManager homes](self->_homeManager, "homes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v26, "currentUser");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v20, "addObject:", v27);
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v26, "users");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v45 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(v20, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v30);
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v23);
  }

  -[CUHomeKitFindPairedPeerContext setUsers:](v39, "setUsers:", v20);
  -[CUHomeKitFindPairedPeerContext setUserIndex:](v39, "setUserIndex:", 0);
  -[CUHomeKitFindPairedPeerContext setUserCount:](v39, "setUserCount:", objc_msgSend(v20, "count"));
  -[CUHomeKitManager _findPairedPeerWithContext:](v41, "_findPairedPeerWithContext:", v39);

  v9 = v42;
  v8 = v43;
LABEL_24:

}

- (void)_findPairedPeerWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  LogCategory *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  HMHomeManager *v24;
  void *v25;
  id v26;
  NSObject *dispatchQueue;
  id v28;
  id v29;
  LogCategory *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  HMHomeManager *homeManager;
  void *v36;
  LogCategory *ucat;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  LogCategory *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  LogCategory *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (**v67)(_QWORD, _QWORD, _QWORD);
  LogCategory *v68;
  void *v69;
  void (**v70)(_QWORD, _QWORD, _QWORD);
  void *v71;
  uint64_t v72;
  void *v73;
  _QWORD v74[6];
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  _QWORD block[5];
  id v80;
  id v81;
  id v82;
  id v83;

  v4 = a3;
  if ((objc_msgSend(v4, "triedHomeRepairFlow") & 1) != 0)
  {
    if ((objc_msgSend(v4, "triedHAP") & 1) != 0)
    {
LABEL_16:
      if ((objc_msgSend(v4, "triedAccessory") & 1) == 0)
      {
        objc_msgSend(v4, "setTriedAccessory:", 1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          homeManager = self->_homeManager;
          objc_msgSend(v4, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v76[0] = MEMORY[0x1E0C809B0];
          v76[1] = 3221225472;
          v76[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_2;
          v76[3] = &unk_1E25DCB48;
          v76[4] = self;
          v77 = v4;
          -[HMHomeManager pairingIdentityForAccessoryWithIdentifier:completionHandler:](homeManager, "pairingIdentityForAccessoryWithIdentifier:completionHandler:", v36, v76);

          goto LABEL_39;
        }
        ucat = self->_ucat;
        if (ucat->var0 <= 90)
        {
          if (ucat->var0 != -1)
          {
LABEL_21:
            objc_msgSend(v4, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no accessory identity SPI\n", v39, v40, v41, v42, (uint64_t)v38);

            goto LABEL_23;
          }
          if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
          {
            ucat = self->_ucat;
            goto LABEL_21;
          }
        }
      }
LABEL_23:
      v43 = objc_msgSend(v4, "userIndex");
      if (v43 < objc_msgSend(v4, "userCount"))
      {
        do
        {
          objc_msgSend(v4, "users");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v4, "userIndex");
          objc_msgSend(v4, "setUserIndex:", v45 + 1);
          objc_msgSend(v44, "objectAtIndexedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v74[0] = MEMORY[0x1E0C809B0];
            v74[1] = 3221225472;
            v74[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_4;
            v74[3] = &unk_1E25DCB98;
            v74[4] = self;
            v74[5] = v46;
            v75 = v4;
            objc_msgSend(v46, "pairingIdentityWithCompletionHandler:", v74);

            goto LABEL_39;
          }
          v47 = self->_ucat;
          if (v47->var0 <= 90)
          {
            if (v47->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
                goto LABEL_29;
              v47 = self->_ucat;
            }
            objc_msgSend(v4, "identifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "name");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF((uint64_t)v47, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no user identity SPI '%@'\n", v49, v50, v51, v52, (uint64_t)v48);

          }
LABEL_29:

          v53 = objc_msgSend(v4, "userIndex");
        }
        while (v53 < objc_msgSend(v4, "userCount"));
      }
      v54 = mach_absolute_time();
      UpTicksToMilliseconds(v54 - objc_msgSend(v4, "startTicks"));
      NSErrorWithOSStatusF(4294960569, (uint64_t)"Not found via HAP, accessory, or user", v55, v56, v57, v58, v59, v60, v72);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v61 = self->_ucat;
      if (v61->var0 <= 90)
      {
        if (v61->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
            goto LABEL_37;
          v61 = self->_ucat;
        }
        objc_msgSend(v4, "identifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v61, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer failed: '%@', %{error}, %llu ms\n", v63, v64, v65, v66, (uint64_t)v62);

      }
LABEL_37:
      objc_msgSend(v4, "completion");
      v67 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v67)[2](v67, 0, v7);

LABEL_38:
      goto LABEL_39;
    }
    objc_msgSend(v4, "setTriedHAP:", 1);
    objc_msgSend((Class)getHAPSystemKeychainStoreClass[0](), "systemStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    objc_msgSend(v5, "getLocalPairingIdentity:", &v78);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v78;

    if (v6)
    {
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_14;
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "caseInsensitiveCompare:", v9);

      if (v10)
        goto LABEL_14;
      objc_msgSend(v6, "publicKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v17 = mach_absolute_time();
        UpTicksToMilliseconds(v17 - objc_msgSend(v4, "startTicks"));
        v18 = self->_ucat;
        if (v18->var0 <= 30)
        {
          if (v18->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
              goto LABEL_46;
            v18 = self->_ucat;
          }
          objc_msgSend(v4, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)v18, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x1Eu, (uint64_t)"FindPairedPeer found: '%@', HAP, %llu ms\n", v20, v21, v22, v23, (uint64_t)v19);

        }
LABEL_46:
        objc_msgSend(v4, "pairedPeer");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setPublicKey:", v12);

        objc_msgSend(v4, "completion");
        v70 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "pairedPeer");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v70)[2](v70, v71, 0);

        goto LABEL_38;
      }
      v68 = self->_ucat;
      if (v68->var0 > 90)
        goto LABEL_14;
      if (v68->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v68, 0x5Au))
          goto LABEL_14;
        v68 = self->_ucat;
      }
      LogPrintF((uint64_t)v68, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no HAP public key\n", v13, v14, v15, v16, (uint64_t)v8);
    }
    else
    {
      v30 = self->_ucat;
      if (v30->var0 > 90)
      {
LABEL_15:

        goto LABEL_16;
      }
      if (v30->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
          goto LABEL_15;
        v30 = self->_ucat;
      }
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v30, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', no HAP identity, %{error}\n", v31, v32, v33, v34, (uint64_t)v8);
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v4, "setTriedHomeRepairFlow:", 1);
  v24 = self->_homeManager;
  v83 = 0;
  -[HMHomeManager allPairingIdentitiesInRankOrderWithError:](v24, "allPairingIdentitiesInRankOrderWithError:", &v83);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v83;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke;
  block[3] = &unk_1E25DE2A0;
  block[4] = self;
  v80 = v4;
  v81 = v25;
  v82 = v26;
  v28 = v26;
  v29 = v25;
  dispatch_async(dispatchQueue, block);

LABEL_39:
}

- (void)_findPairedPeerWithContext:(id)a3 label:(id)a4 pairingIdentity:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  LogCategory *ucat;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  LogCategory *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  LogCategory *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  LogCategory *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  LogCategory *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CUHomeKitManager *v54;
  id v55;
  _BOOL4 v56;
  void *v57;
  void (**v58)(_QWORD, _QWORD, _QWORD);
  void *v59;
  id v60;

  v60 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    objc_msgSend(v11, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v60, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "caseInsensitiveCompare:", v14);

      if (v15)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 20)
        {
          v17 = v60;
          if (ucat->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u))
              goto LABEL_23;
            ucat = self->_ucat;
            v17 = v60;
          }
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x14u, (uint64_t)"FindPairedPeer: '%@', %@, mismatch '%@'\n", v19, v20, v21, v22, (uint64_t)v18);

        }
LABEL_23:
        v54 = self;
        v55 = v60;
LABEL_26:
        -[CUHomeKitManager _findPairedPeerWithContext:](v54, "_findPairedPeerWithContext:", v55);
LABEL_32:

        goto LABEL_33;
      }
      objc_msgSend(v11, "publicKey");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "data");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        v39 = mach_absolute_time();
        UpTicksToMilliseconds(v39 - objc_msgSend(v60, "startTicks"));
        v40 = self->_ucat;
        if (v40->var0 <= 30)
        {
          v41 = v60;
          if (v40->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
              goto LABEL_28;
            v40 = self->_ucat;
            v41 = v60;
          }
          objc_msgSend(v41, "identifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF((uint64_t)v40, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x1Eu, (uint64_t)"FindPairedPeer found: '%@', %@, %llu ms\n", v43, v44, v45, v46, (uint64_t)v42);

        }
LABEL_28:
        objc_msgSend(v60, "pairedPeer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setPublicKey:", v38);

        objc_msgSend(v60, "completion");
        v58 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "pairedPeer");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v58)[2](v58, v59, 0);

LABEL_31:
        goto LABEL_32;
      }
      v47 = self->_ucat;
      if (v47->var0 <= 90)
      {
        v48 = v60;
        if (v47->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
            goto LABEL_30;
          v47 = self->_ucat;
          v48 = v60;
        }
        objc_msgSend(v48, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v47, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', %@, no PK\n", v50, v51, v52, v53, (uint64_t)v49);

      }
LABEL_30:
      -[CUHomeKitManager _findPairedPeerWithContext:](self, "_findPairedPeerWithContext:", v60);
      goto LABEL_31;
    }
    v30 = self->_ucat;
    v31 = v60;
    if (v30->var0 <= 90)
    {
      if (v30->var0 == -1)
      {
        v56 = _LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au);
        v31 = v60;
        if (!v56)
          goto LABEL_25;
        v30 = self->_ucat;
      }
      objc_msgSend(v31, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v30, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x5Au, (uint64_t)"### FindPairedPeer: '%@', %@, no identifier for identity\n", v33, v34, v35, v36, (uint64_t)v32);

      v31 = v60;
    }
LABEL_25:
    v54 = self;
    v55 = v31;
    goto LABEL_26;
  }
  v23 = self->_ucat;
  if (v23->var0 <= 20)
  {
    v24 = v60;
    if (v23->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u))
        goto LABEL_18;
      v23 = self->_ucat;
      v24 = v60;
    }
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v23, (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]", 0x14u, (uint64_t)"FindPairedPeer: '%@', %@, no identity, %{error}\n", v26, v27, v28, v29, (uint64_t)v25);

  }
LABEL_18:
  -[CUHomeKitManager _findPairedPeerWithContext:](self, "_findPairedPeerWithContext:", v60);
LABEL_33:

}

- (id)_bestUserAndLabel:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[HMHomeManager currentHome](self->_homeManager, "currentHome");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUser");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (id)v6;
    if (a3)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v8, "initWithFormat:", CFSTR("CurrentHome '%@'"), v9);

    }
  }
  else
  {
    -[HMHomeManager primaryHome](self->_homeManager, "primaryHome");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "currentUser");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v7 = (id)v11;
      if (a3)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = (id)objc_msgSend(v12, "initWithFormat:", CFSTR("PrimaryHome '%@'"), v13);

      }
      v5 = v10;
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[HMHomeManager homes](self->_homeManager, "homes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        v5 = v10;
        while (2)
        {
          v18 = 0;
          v19 = v5;
          do
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v5 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v18);

            objc_msgSend(v5, "currentUser");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = (void *)v20;
              if (a3)
              {
                v22 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v5, "name");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *a3 = (id)objc_msgSend(v22, "initWithFormat:", CFSTR("Home '%@'"), v23);

              }
              v7 = v21;

              goto LABEL_22;
            }
            ++v18;
            v19 = v5;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v16)
            continue;
          break;
        }
      }
      else
      {
        v5 = v10;
      }

      v7 = 0;
      v5 = v14;
    }
  }
LABEL_22:

  return v7;
}

- (id)_cuPairingIdentityWithHMFPairingIdentity:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6;
  id v7;
  CUPairingIdentity *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  CUPairingIdentity *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v37;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CUPairingIdentity);
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v15);
    if (!v22)
    {
      if (a5)
      {
        NSErrorWithOSStatusF(4294960579, (uint64_t)"Bad HomeKit pairing identifier: '%@'", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_21;
    }
    -[CUPairingIdentity setIdentifier:](v8, "setIdentifier:", v22);
    objc_msgSend(v7, "publicKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[CUPairingIdentity setPublicKey:](v8, "setPublicKey:", v24);
      if ((v6 & 2) == 0)
      {
LABEL_7:
        v33 = v8;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      objc_msgSend(v7, "privateKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[CUPairingIdentity setSecretKey:](v8, "setSecretKey:", v32);

        goto LABEL_7;
      }
      if (a5)
      {
        v35 = 4294896142;
        v34 = "No HomeKit pairing private key";
        goto LABEL_18;
      }
    }
    else if (a5)
    {
      v34 = "No HomeKit pairing public key";
      v35 = 4294896141;
LABEL_18:
      NSErrorWithOSStatusF(v35, (uint64_t)v34, v25, v26, v27, v28, v29, v30, v37);
      v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v33 = 0;
    goto LABEL_20;
  }
  if (a5)
  {
    NSErrorWithOSStatusF(4294960588, (uint64_t)"No HomeKit pairing identifier", v9, v10, v11, v12, v13, v14, v37);
    v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_22:

  return v33;
}

- (BOOL)_isOwnerOfHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "homeAccessControlForUser:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isOwner");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_selfAccessoryMediaSystemUncached:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  id *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HMAccessory uniqueIdentifier](self->_selfAccessory, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory home](self->_selfAccessory, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "mediaSystems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v25)
  {
    v23 = a3;
    v24 = v6;
    v8 = *(_QWORD *)v33;
    v27 = v7;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v26 = v10;
        objc_msgSend(v10, "components", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v29 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v16, "mediaProfile");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "accessory");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "uniqueIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v19, "isEqual:", v5))
              {
                if (v23)
                  *v23 = objc_retainAutorelease(v16);
                v20 = v26;

                v6 = v24;
                v7 = v27;
                goto LABEL_21;
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v13)
              continue;
            break;
          }
        }

        v7 = v27;
        v8 = v22;
      }
      v20 = 0;
      v6 = v24;
      v25 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }
  else
  {
    v20 = 0;
  }
LABEL_21:

  return v20;
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CUHomeKitManager_homeManagerDidUpdateDataSyncState___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CUHomeKitManager_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CUHomeKitManager_homeManager_didUpdateStatus___block_invoke;
  v5[3] = &unk_1E25DD170;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CUHomeKitManager_homeManager_didAddHome___block_invoke;
  v8[3] = &unk_1E25DE628;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CUHomeKitManager_homeManager_didRemoveHome___block_invoke;
  v8[3] = &unk_1E25DE628;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CUHomeKitManager_home_didAddAccessory___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CUHomeKitManager_home_didRemoveAccessory___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
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
  v15[2] = __52__CUHomeKitManager_home_didUpdateRoom_forAccessory___block_invoke;
  v15[3] = &unk_1E25DE2A0;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(dispatchQueue, v15);

}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CUHomeKitManager_home_didAddUser___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CUHomeKitManager_home_didRemoveUser___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CUHomeKitManager_home_didUpdateMinimumMediaUserPrivilege___block_invoke;
  block[3] = &unk_1E25DE200;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CUHomeKitManager_home_didUpdateMediaPeerToPeerEnabled___block_invoke;
  block[3] = &unk_1E25DD868;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didUpdateMediaPassword:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CUHomeKitManager_home_didUpdateMediaPassword___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CUHomeKitManager_home_didAddMediaSystem___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CUHomeKitManager_home_didRemoveMediaSystem___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CUHomeKitManager_mediaSystem_didUpdateComponents___block_invoke;
  v8[3] = &unk_1E25DE628;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (void)mediaSystem:(id)a3 didUpdateName:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CUHomeKitManager_mediaSystem_didUpdateName___block_invoke;
  v8[3] = &unk_1E25DE628;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

- (void)accessoryDidUpdateApplicationData:(id)a3
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
  v7[2] = __54__CUHomeKitManager_accessoryDidUpdateApplicationData___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)accessoryDidUpdatePairingIdentity:(id)a3
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
  v7[2] = __54__CUHomeKitManager_accessoryDidUpdatePairingIdentity___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)accessory:(id)a3 didUpdateDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CUHomeKitManager_accessory_didUpdateDevice___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v7;
  id v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CUHomeKitManager_user_didUpdateAssistantAccessControl_forHome___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

}

- (void)user:(id)a3 didUpdatePairingIdentity:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CUHomeKitManager_user_didUpdatePairingIdentity___block_invoke;
  block[3] = &unk_1E25DCEE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
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

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)resolvableAccessories
{
  return self->_resolvableAccessories;
}

- (id)resolvableAccessoriesChangedHandler
{
  return self->_resolvableAccessoriesChangedHandler;
}

- (void)setResolvableAccessoriesChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDictionary)selfAccessoryAppData
{
  return self->_selfAccessoryAppData;
}

- (id)selfAccessoryAppDataChangedHandler
{
  return self->_selfAccessoryAppDataChangedHandler;
}

- (void)setSelfAccessoryAppDataChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)selfAccessoryUpdatedHandler
{
  return self->_selfAccessoryUpdatedHandler;
}

- (void)setSelfAccessoryUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unsigned)selfAccessoryMediaAccessFlags
{
  return self->_selfAccessoryMediaAccessFlags;
}

- (NSString)selfAccessoryMediaAccessPassword
{
  return self->_selfAccessoryMediaAccessPassword;
}

- (id)selfAccessoryMediaAccessUpdatedHandler
{
  return self->_selfAccessoryMediaAccessUpdatedHandler;
}

- (void)setSelfAccessoryMediaAccessUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (HMMediaSystem)selfAccessoryMediaSystem
{
  return self->_selfAccessoryMediaSystem;
}

- (HMAccessory)selfAccessoryMediaSystemCounterpart
{
  return self->_selfAccessoryMediaSystemCounterpart;
}

- (NSString)selfAccessoryMediaSystemName
{
  return self->_selfAccessoryMediaSystemName;
}

- (void)setSelfAccessoryMediaSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (HMMediaSystemRole)selfAccessoryMediaSystemRole
{
  return self->_selfAccessoryMediaSystemRole;
}

- (id)selfAccessoryMediaSystemUpdatedHandler
{
  return self->_selfAccessoryMediaSystemUpdatedHandler;
}

- (void)setSelfAccessoryMediaSystemUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)selfAccessorySiriEnabled
{
  return self->_selfAccessorySiriEnabled;
}

- (id)selfAccessorySiriAccessUpdatedHandler
{
  return self->_selfAccessorySiriAccessUpdatedHandler;
}

- (void)setSelfAccessorySiriAccessUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selfAccessorySiriAccessUpdatedHandler, 0);
  objc_storeStrong(&self->_selfAccessoryMediaSystemUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystemRole, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystemName, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystemCounterpart, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaSystem, 0);
  objc_storeStrong(&self->_selfAccessoryMediaAccessUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_selfAccessoryMediaAccessPassword, 0);
  objc_storeStrong(&self->_selfAccessoryUpdatedHandler, 0);
  objc_storeStrong(&self->_selfAccessoryAppDataChangedHandler, 0);
  objc_storeStrong((id *)&self->_selfAccessoryAppData, 0);
  objc_storeStrong((id *)&self->_selfAccessory, 0);
  objc_storeStrong(&self->_resolvableAccessoriesChangedHandler, 0);
  objc_storeStrong((id *)&self->_resolvableAccessories, 0);
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_selfAccessoryUser, 0);
  objc_storeStrong((id *)&self->_selfAccessoryRoomID, 0);
  objc_storeStrong((id *)&self->_resolvableAccessoriesMap, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

void __50__CUHomeKitManager_user_didUpdatePairingIdentity___block_invoke(id *a1)
{
  _QWORD *v2;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;

  v2 = a1[4];
  if (!v2[2])
    return;
  v3 = (int *)v2[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      v9 = _LogCategory_Initialize(v2[12], 0x1Eu);
      v2 = a1[4];
      if (!v9)
        goto LABEL_7;
      v3 = (int *)v2[12];
    }
    objc_msgSend(a1[5], "userID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager user:didUpdatePairingIdentity:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdatePairingIdentity: user %{mask}, PairingIdentity %@", v5, v6, v7, v8, (uint64_t)v4);

    v2 = a1[4];
  }
LABEL_7:
  objc_msgSend(v2, "_updateState");
  objc_msgSend(a1[4], "_updateHomes");
  v10 = _Block_copy(*((const void **)a1[4] + 19));
  if (v10)
  {
    v12 = v10;
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, *((unsigned int *)a1[4] + 28));
    v10 = v12;
  }

}

_QWORD *__65__CUHomeKitManager_user_didUpdateAssistantAccessControl_forHome___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "userID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager user:didUpdateAssistantAccessControl:forHome:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateAssistantAccessControl: user %{mask}, home '%@'", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__46__CUHomeKitManager_accessory_didUpdateDevice___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager accessory:didUpdateDevice:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateDevice: accessory '%@', device %@\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

void __54__CUHomeKitManager_accessoryDidUpdatePairingIdentity___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  id v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
    return;
  v3 = (int *)v2[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      v9 = _LogCategory_Initialize(v2[12], 0x1Eu);
      v2 = *(_QWORD **)(a1 + 32);
      if (!v9)
        goto LABEL_7;
      v3 = (int *)v2[12];
    }
    objc_msgSend(*(id *)(a1 + 40), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager accessoryDidUpdatePairingIdentity:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdatePairingIdentity: accessory '%@'", v5, v6, v7, v8, (uint64_t)v4);

    v2 = *(_QWORD **)(a1 + 32);
  }
LABEL_7:
  objc_msgSend(v2, "_updateState");
  objc_msgSend(*(id *)(a1 + 32), "_updateHomes");
  v10 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 152));
  if (v10)
  {
    v11 = v10;
    (*((void (**)(void *, _QWORD))v10 + 2))(v10, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 112));
    v10 = v11;
  }

}

_QWORD *__54__CUHomeKitManager_accessoryDidUpdateApplicationData___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager accessoryDidUpdateApplicationData:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateApplicationData: accessory '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

uint64_t __46__CUHomeKitManager_mediaSystem_didUpdateName___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;

  v8 = *(_QWORD **)(result + 32);
  if (v8[2])
  {
    v9 = result;
    v10 = (int *)v8[12];
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        v8 = *(_QWORD **)(v9 + 32);
        if (!v11)
          return objc_msgSend(v8, "_updateHomes");
        v10 = (int *)v8[12];
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager mediaSystem:didUpdateName:]_block_invoke", 0x1Eu, (uint64_t)"MediaSystemDidUpdateName: '%@'\n", a5, a6, a7, a8, *(_QWORD *)(v9 + 40));
      v8 = *(_QWORD **)(v9 + 32);
    }
    return objc_msgSend(v8, "_updateHomes");
  }
  return result;
}

_QWORD *__52__CUHomeKitManager_mediaSystem_didUpdateComponents___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager mediaSystem:didUpdateComponents:]_block_invoke", 0x1Eu, (uint64_t)"MediaSystemDidUpdateComponents: '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__46__CUHomeKitManager_home_didRemoveMediaSystem___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didRemoveMediaSystem:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveMediaSystem: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__43__CUHomeKitManager_home_didAddMediaSystem___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didAddMediaSystem:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaSystem: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__48__CUHomeKitManager_home_didUpdateMediaPassword___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 != -1)
      {
LABEL_4:
        if (objc_msgSend(*(id *)(a1 + 40), "length"))
          v4 = "set";
        else
          v4 = "not set";
        objc_msgSend(*(id *)(a1 + 48), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateMediaPassword:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaPassword: %s, home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

        result = *(_QWORD **)(a1 + 32);
        return (_QWORD *)objc_msgSend(result, "_updateHomes");
      }
      v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(_QWORD **)(a1 + 32);
      if (v9)
      {
        v3 = (int *)result[12];
        goto LABEL_4;
      }
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__57__CUHomeKitManager_home_didUpdateMediaPeerToPeerEnabled___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 != -1)
      {
LABEL_4:
        if (*(_BYTE *)(a1 + 48))
          v4 = "yes";
        else
          v4 = "no";
        objc_msgSend(*(id *)(a1 + 40), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateMediaPeerToPeerEnabled:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaPeerToPeerEnabled: %s, home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

        result = *(_QWORD **)(a1 + 32);
        return (_QWORD *)objc_msgSend(result, "_updateHomes");
      }
      v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(_QWORD **)(a1 + 32);
      if (v9)
      {
        v3 = (int *)result[12];
        goto LABEL_4;
      }
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__60__CUHomeKitManager_home_didUpdateMinimumMediaUserPrivilege___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  unint64_t v4;
  const char *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 != -1)
      {
LABEL_4:
        v4 = *(_QWORD *)(a1 + 48);
        if (v4 > 2)
          v5 = "?";
        else
          v5 = off_1E25DCC40[v4];
        objc_msgSend(*(id *)(a1 + 40), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateMinimumMediaUserPrivilege:]_block_invoke", 0x1Eu, (uint64_t)"DidAddMediaUserLevel: %s, home '%@'\n", v7, v8, v9, v10, (uint64_t)v5);

        result = *(_QWORD **)(a1 + 32);
        return (_QWORD *)objc_msgSend(result, "_updateHomes");
      }
      v6 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(_QWORD **)(a1 + 32);
      if (v6)
      {
        v3 = (int *)result[12];
        goto LABEL_4;
      }
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__39__CUHomeKitManager_home_didRemoveUser___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v10 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v10)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "userID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didRemoveUser:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveUser: %@, %{mask}, home '%@'", v6, v7, v8, v9, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__36__CUHomeKitManager_home_didAddUser___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v10 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v10)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "userID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didAddUser:]_block_invoke", 0x1Eu, (uint64_t)"DidAddUser: %@, %{mask}, home '%@'", v6, v7, v8, v9, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__52__CUHomeKitManager_home_didUpdateRoom_forAccessory___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v10 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v10)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didUpdateRoom:forAccessory:]_block_invoke", 0x1Eu, (uint64_t)"DidUpdateRoom: '%@', accessory '%@', home '%@'\n", v6, v7, v8, v9, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__44__CUHomeKitManager_home_didRemoveAccessory___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didRemoveAccessory:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveAccessory: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__41__CUHomeKitManager_home_didAddAccessory___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager home:didAddAccessory:]_block_invoke", 0x1Eu, (uint64_t)"DidAddAccessory: '%@', home '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__46__CUHomeKitManager_homeManager_didRemoveHome___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager homeManager:didRemoveHome:]_block_invoke", 0x1Eu, (uint64_t)"DidRemoveHome: '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

_QWORD *__43__CUHomeKitManager_homeManager_didAddHome___block_invoke(uint64_t a1)
{
  _QWORD *result;
  int *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  result = *(_QWORD **)(a1 + 32);
  if (result[2])
  {
    v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(_QWORD **)(a1 + 32);
        if (!v9)
          return (_QWORD *)objc_msgSend(result, "_updateHomes");
        v3 = (int *)result[12];
      }
      objc_msgSend(*(id *)(a1 + 40), "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUHomeKitManager homeManager:didAddHome:]_block_invoke", 0x1Eu, (uint64_t)"DidAddHome: '%@'\n", v5, v6, v7, v8, (uint64_t)v4);

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_updateHomes");
  }
  return result;
}

uint64_t __48__CUHomeKitManager_homeManager_didUpdateStatus___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;

  v8 = *(_QWORD **)(result + 32);
  if (v8[2])
  {
    v9 = result;
    v10 = (int *)v8[12];
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        v8 = *(_QWORD **)(v9 + 32);
        if (!v11)
          goto LABEL_7;
        v10 = (int *)v8[12];
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager homeManager:didUpdateStatus:]_block_invoke", 0x1Eu, (uint64_t)"HomeManagerDidUpdateStatus: %d", a5, a6, a7, a8, *(_QWORD *)(v9 + 40));
      v8 = *(_QWORD **)(v9 + 32);
    }
LABEL_7:
    objc_msgSend(v8, "_updateState");
    return objc_msgSend(*(id *)(v9 + 32), "_updateHomes");
  }
  return result;
}

uint64_t __46__CUHomeKitManager_homeManagerDidUpdateHomes___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;

  v8 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v8 + 16))
  {
    v9 = result;
    v10 = *(int **)(v8 + 96);
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        v8 = *(_QWORD *)(v9 + 32);
        if (!v11)
          goto LABEL_7;
        v10 = *(int **)(v8 + 96);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager homeManagerDidUpdateHomes:]_block_invoke", 0x1Eu, (uint64_t)"HomeManagerDidUpdateHomes\n", a5, a6, a7, a8, v12);
      v8 = *(_QWORD *)(v9 + 32);
    }
LABEL_7:
    *(_BYTE *)(v8 + 24) = 1;
    objc_msgSend(*(id *)(v9 + 32), "_clearHomeKitState");
    objc_msgSend(*(id *)(v9 + 32), "_updateState");
    return objc_msgSend(*(id *)(v9 + 32), "_updateHomes");
  }
  return result;
}

uint64_t __54__CUHomeKitManager_homeManagerDidUpdateDataSyncState___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;

  v8 = *(_QWORD **)(result + 32);
  if (v8[2])
  {
    v9 = result;
    v10 = (int *)v8[12];
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        v8 = *(_QWORD **)(v9 + 32);
        if (!v11)
          goto LABEL_7;
        v10 = (int *)v8[12];
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager homeManagerDidUpdateDataSyncState:]_block_invoke", 0x1Eu, (uint64_t)"HomeKit DataSync changed\n", a5, a6, a7, a8, v12);
      v8 = *(_QWORD **)(v9 + 32);
    }
LABEL_7:
    objc_msgSend(v8, "_updateState");
    return objc_msgSend(*(id *)(v9 + 32), "_updateHomes");
  }
  return result;
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_findPairedPeerWithContext:label:pairingIdentity:error:", v3, CFSTR("allIdentities"), v4, *(_QWORD *)(a1 + 56));

}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 120);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_3;
  v12[3] = &unk_1E25DE2A0;
  v12[4] = v7;
  v13 = v8;
  v14 = v5;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int8x16_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  int8x16_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[1] = 3221225472;
  v7 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v8 = *(_QWORD *)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_5;
  block[3] = &unk_1E25DCB70;
  v9 = *(NSObject **)(v8 + 120);
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = v6;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF((uint64_t)"user '%{mask}'", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_findPairedPeerWithContext:label:pairingIdentity:error:", *(_QWORD *)(a1 + 48), v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findPairedPeerWithContext:label:pairingIdentity:error:", *(_QWORD *)(a1 + 40), CFSTR("accessory"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __54__CUHomeKitManager_findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findPairedPeer:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 120);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke_2;
  v12[3] = &unk_1E25DCAF8;
  v13 = v5;
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v16 = v6;
  v9 = *(_QWORD *)(a1 + 72);
  v17 = *(_QWORD *)(a1 + 32);
  v20 = v9;
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 64);
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, v12);

}

void __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
      objc_msgSend(v8, "identifier");
      v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v10 = (__CFString *)v9;
      v11 = v9 ? (__CFString *)v9 : CFSTR("?");
      objc_msgSend(v2, "addObject:", v11);

      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v15 = v8;

    if (!v15)
      goto LABEL_15;
    v17 = *(_QWORD *)(a1 + 80);
    v16 = *(_QWORD *)(a1 + 88);
    v19 = *(id *)(a1 + 56);
    v18 = *(void **)(a1 + 64);
    v20 = *(_QWORD *)(a1 + 72);
    v21 = v15;
  }
  else
  {
LABEL_12:

LABEL_15:
    objc_msgSend(*(id *)(a1 + 48), "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSErrorWithOSStatusF(4294960569, (uint64_t)"No HomeKit legacy pairing identity, user '%{mask}', all %##@, error %{error}", v23, v24, v25, v26, v27, v28, (uint64_t)v22);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v18 = *(void **)(a1 + 64);
    v20 = *(_QWORD *)(a1 + 72);
    v17 = *(_QWORD *)(a1 + 80);
    v16 = *(_QWORD *)(a1 + 88);
    v21 = 0;
    v19 = v15;
  }
  objc_msgSend(v18, "_getPairingIdentityCompleted:options:error:label:completion:", v21, v16, v19, v20, v17);

}

void __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  __int128 v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 120);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E25DCAA8;
  v12 = v5;
  v17 = *(_QWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v15 = v6;
  v16 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  id v6;

  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(void **)(a1 + 40);
  if (v2)
    v5 = (*(_QWORD *)(a1 + 80) & 0x100) == 0;
  else
    v5 = 1;
  v6 = v2;
  if (v5)
    objc_msgSend(v4, "_getPairingIdentityCompleted:options:error:label:completion:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  else
    objc_msgSend(v4, "_getPairingIdentityForLegacyWithOptions:user:nonLegacyIdentity:label:completion:", v3, *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

}

void __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke_2;
  block[3] = &unk_1E25DCE98;
  v7 = a1[4];
  v8 = (void *)a1[5];
  v9 = *(NSObject **)(v7 + 120);
  block[1] = 3221225472;
  block[4] = v7;
  v13 = v5;
  v16 = a1[6];
  v14 = v6;
  v15 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

uint64_t __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getPairingIdentityCompleted:options:error:label:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("SelfAccessory"), *(_QWORD *)(a1 + 56));
}

void __73__CUHomeKitManager_getHomeKitLocalPairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getPairingIdentityCompleted:options:error:label:completion:", v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("HomeKitLocalKey"), *(_QWORD *)(a1 + 56));

}

uint64_t __61__CUHomeKitManager_getPairingIdentityWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[12];
  if (*v10 > 30)
    goto LABEL_5;
  if (*v10 != -1)
    goto LABEL_3;
  v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
  v9 = *(_QWORD **)(a1 + 32);
  if (v11)
  {
    v10 = (int *)v9[12];
LABEL_3:
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager getPairingIdentityWithOptions:completion:]_block_invoke", 0x1Eu, (uint64_t)"GetPairingIdentity start: %#{flags}\n", a5, a6, a7, a8, *(_QWORD *)(a1 + 48));
    v9 = *(_QWORD **)(a1 + 32);
  }
LABEL_5:
  if ((*(_QWORD *)(a1 + 48) & 0x10) != 0)
    return objc_msgSend(v9, "_getPairingIdentityForAccessoryWithOptions:completion:");
  else
    return objc_msgSend(v9, "_getPairingIdentityForUserWithOptions:completion:");
}

void __38__CUHomeKitManager__updateAccessories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "irkData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

void __38__CUHomeKitManager__clearHomeKitState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(int **)(*(_QWORD *)(a1 + 32) + 96);
  if (*v6 <= 30)
  {
    if (*v6 == -1)
    {
      if (!_LogCategory_Initialize(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), 0x1Eu))
        goto LABEL_5;
      v6 = *(int **)(*(_QWORD *)(a1 + 32) + 96);
    }
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)v6, (uint64_t)"-[CUHomeKitManager _clearHomeKitState]_block_invoke", 0x1Eu, (uint64_t)"LostHome: %@ (%@), HK clear", v7, v8, v9, v10, (uint64_t)v12);

  }
LABEL_5:
  objc_msgSend(v5, "setDelegate:", 0);

}

uint64_t __30__CUHomeKitManager_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _BOOL4 v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v8 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v8 + 88))
    return result;
  v9 = result;
  *(_BYTE *)(v8 + 88) = 1;
  v10 = *(_QWORD *)(result + 32);
  v11 = *(int **)(v10 + 96);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      v10 = *(_QWORD *)(v9 + 32);
      if (!v12)
        goto LABEL_6;
      v11 = *(int **)(v10 + 96);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUHomeKitManager invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidating\n", a5, a6, a7, a8, v32);
    v10 = *(_QWORD *)(v9 + 32);
  }
LABEL_6:
  v13 = *(_DWORD *)(v10 + 8);
  if (v13 != -1)
  {
    notify_cancel(v13);
    *(_DWORD *)(*(_QWORD *)(v9 + 32) + 8) = -1;
    v10 = *(_QWORD *)(v9 + 32);
  }
  objc_msgSend(*(id *)(v10 + 16), "setDelegate:", 0);
  v14 = *(_QWORD *)(v9 + 32);
  v15 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_3423);
  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 32), "removeAllObjects");
  v16 = *(_QWORD *)(v9 + 32);
  v17 = *(void **)(v16 + 32);
  *(_QWORD *)(v16 + 32) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 40), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 176), "setDelegate:", 0);
  v18 = *(_QWORD *)(v9 + 32);
  v19 = *(void **)(v18 + 176);
  *(_QWORD *)(v18 + 176) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 224), "setDelegate:", 0);
  v20 = *(_QWORD *)(v9 + 32);
  v21 = *(void **)(v20 + 224);
  *(_QWORD *)(v20 + 224) = 0;

  v22 = *(_QWORD *)(v9 + 32);
  v23 = *(void **)(v22 + 232);
  *(_QWORD *)(v22 + 232) = 0;

  v24 = *(_QWORD *)(v9 + 32);
  v25 = *(void **)(v24 + 240);
  *(_QWORD *)(v24 + 240) = 0;

  v26 = *(_QWORD *)(v9 + 32);
  v27 = *(void **)(v26 + 248);
  *(_QWORD *)(v26 + 248) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 72), "setDelegate:", 0);
  v28 = *(_QWORD *)(v9 + 32);
  v29 = *(void **)(v28 + 72);
  *(_QWORD *)(v28 + 72) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 80), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_105);
  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 32) + 80), "removeAllObjects");
  v30 = *(_QWORD *)(v9 + 32);
  v31 = *(void **)(v30 + 80);
  *(_QWORD *)(v30 + 80) = 0;

  return objc_msgSend(*(id *)(v9 + 32), "_invalidated");
}

uint64_t __30__CUHomeKitManager_invalidate__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setDelegate:", 0);
}

uint64_t __30__CUHomeKitManager_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setDelegate:", 0);
}

uint64_t __28__CUHomeKitManager_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD handler[5];

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 96);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = *(int **)(v9 + 96);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager activate]_block_invoke", 0x1Eu, (uint64_t)"Activate %#{flags}\n", a5, a6, a7, a8, *(unsigned int *)(v9 + 108));
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  if (*(_DWORD *)(v9 + 8) == -1 && getHMHomeManagerPreferencesChangedNotification[0]())
  {
    v12 = (const char *)getHMHomeManagerPreferencesChangedNotification[0]();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 120);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __28__CUHomeKitManager_activate__block_invoke_2;
    handler[3] = &unk_1E25DE468;
    handler[4] = v13;
    notify_register_dispatch(v12, (int *)(v13 + 8), v14, handler);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_activateIfNeeded");
}

uint64_t __28__CUHomeKitManager_activate__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v12;

  v8 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v8 + 8) != -1)
  {
    v9 = result;
    v10 = *(int **)(v8 + 96);
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        v8 = *(_QWORD *)(v9 + 32);
        if (!v11)
          return objc_msgSend((id)v8, "_activateIfNeeded");
        v10 = *(int **)(v8 + 96);
      }
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUHomeKitManager activate]_block_invoke_2", 0x1Eu, (uint64_t)"HomeKit prefs changed\n", a5, a6, a7, a8, v12);
      v8 = *(_QWORD *)(v9 + 32);
    }
    return objc_msgSend((id)v8, "_activateIfNeeded");
  }
  return result;
}

@end
