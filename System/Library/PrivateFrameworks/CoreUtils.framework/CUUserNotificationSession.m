@implementation CUUserNotificationSession

- (CUUserNotificationSession)init
{
  CUUserNotificationSession *v2;
  CUUserNotificationSession *v3;
  CUUserNotificationSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUUserNotificationSession;
  v2 = -[CUUserNotificationSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUUserNotificationSession;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)CUUserNotificationSession;
  -[CUUserNotificationSession dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return (NSString *)NSPrintF((uint64_t)"CUUserNotificationSession: Category %@, ID %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_categoryID);
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
  v7 = qword_1EE067E78;
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
  block[2] = __37__CUUserNotificationSession_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CUUserNotificationSession_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  UNUserNotificationCenter *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  LogCategory *ucat;
  void *v10;
  NSString *requestIdentifier;
  OS_dispatch_source *timer;
  NSObject *v13;
  OS_dispatch_source *v14;
  UNUserNotificationCenter *unCenter;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_unCenter;
  v8 = self->_requestIdentifier;
  if (v8)
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _invalidate]", 0x1Eu, (uint64_t)"Removing request: %@\n", v4, v5, v6, v7, (uint64_t)v8);
    }
LABEL_6:
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](v3, "removePendingNotificationRequestsWithIdentifiers:", v10);
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](v3, "removeDeliveredNotificationsWithIdentifiers:", v10);
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = 0;

  }
  timer = self->_timer;
  if (timer)
  {
    v13 = timer;
    dispatch_source_cancel(v13);
    v14 = self->_timer;
    self->_timer = 0;

  }
  -[UNUserNotificationCenter setDelegate:](self->_unCenter, "setDelegate:", 0);
  unCenter = self->_unCenter;
  self->_unCenter = 0;

  -[CUUserNotificationSession _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void *v3;
  void *v4;
  id actionHandler;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LogCategory *ucat;
  uint64_t v11;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v3 = _Block_copy(self->_actionHandler);
    v4 = v3;
    if (v3)
      (*((void (**)(void *, uint64_t, _QWORD))v3 + 2))(v3, 3, 0);

    actionHandler = self->_actionHandler;
    self->_actionHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_7:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v6, v7, v8, v9, v11);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_7;
      }
    }
  }
}

- (void)addActionWithIdentifier:(id)a3 title:(id)a4 flags:(unsigned int)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  CUUserNotificationSession *v21;
  id v22;
  id v23;
  id v24;
  unsigned int v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend((Class)getUNNotificationActionClass[0](), "actionWithIdentifier:title:options:", v10, v11, a5 & 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = self->_dispatchQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__CUUserNotificationSession_addActionWithIdentifier_title_flags_handler___block_invoke;
  v19[3] = &unk_1E25DE1B0;
  v23 = v11;
  v24 = v12;
  v20 = v13;
  v21 = self;
  v22 = v10;
  v25 = a5;
  v15 = v11;
  v16 = v10;
  v17 = v12;
  v18 = v13;
  dispatch_async(dispatchQueue, v19);

}

- (void)removeActionWithIdentifier:(id)a3
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
  v7[2] = __56__CUUserNotificationSession_removeActionWithIdentifier___block_invoke;
  v7[3] = &unk_1E25DE628;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)removeAllActions
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CUUserNotificationSession_removeAllActions__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_updateActionCategories
{
  NSString *categoryID;
  objc_class *v4;
  NSString *v5;
  id v6;
  NSMutableDictionary *actions;
  void *v8;
  id v9;
  _QWORD v10[5];

  if (self->_actionsChanged)
  {
    categoryID = self->_categoryID;
    if (categoryID)
    {
      v4 = (objc_class *)MEMORY[0x1E0C99DE8];
      v5 = categoryID;
      v6 = objc_alloc_init(v4);
      actions = self->_actions;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__CUUserNotificationSession__updateActionCategories__block_invoke;
      v10[3] = &unk_1E25DE1D8;
      v10[4] = v6;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](actions, "enumerateKeysAndObjectsUsingBlock:", v10);
      objc_msgSend((Class)getUNNotificationCategoryClass[0](), "categoryWithIdentifier:actions:intentIdentifiers:options:", v5, v6, MEMORY[0x1E0C9AA60], 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v9, 1);
      -[UNUserNotificationCenter setNotificationCategories:](self->_unCenter, "setNotificationCategories:", v8);
      self->_actionsChanged = 0;

    }
  }
}

- (void)_reportError:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LogCategory *ucat;
  uint64_t state;
  const char *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 90)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      state = self->_state;
      if (state > 0x10)
        v10 = "?";
      else
        v10 = off_1E25DE308[state];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _reportError:]", 0x5Au, (uint64_t)"### Failed: %s, %{error}\n", v4, v5, v6, v7, (uint64_t)v10);
      goto LABEL_9;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_9:
  self->_state = 3;
  v11 = _Block_copy(self->_actionHandler);
  v12 = v11;
  if (v11)
    (*((void (**)(void *, uint64_t, id))v11 + 2))(v11, 4, v13);

}

- (void)_reportTimeout
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  void *v8;
  void *v9;
  uint64_t v10;

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _reportTimeout]", 0x1Eu, (uint64_t)"Timeout\n", v2, v3, v4, v5, v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v8 = _Block_copy(self->_actionHandler);
  v9 = v8;
  if (v8)
    (*((void (**)(void *, uint64_t, _QWORD))v8 + 2))(v8, 5, 0);

  -[CUUserNotificationSession _invalidate](self, "_invalidate");
}

- (void)_run
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int state;
  id v9;
  int stepState;
  NSError *stepError;
  int v12;
  uint64_t v13;
  const char *v14;
  int v15;
  id v16;
  id v17;

  while (2)
  {
    if (!self->_invalidateCalled)
    {
      state = self->_state;
      switch(state)
      {
        case 0:
          v17 = 0;
          -[CUUserNotificationSession _runInit:](self, "_runInit:", &v17);
          v9 = v17;
          if (v9)
            goto LABEL_26;
          self->_state = 10;
          goto LABEL_27;
        case 10:
          -[CUUserNotificationSession _runAuthorizeCheckStart](self, "_runAuthorizeCheckStart");
          goto LABEL_23;
        case 11:
          if (self->_stepError)
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          stepState = self->_stepState;
          if (stepState == 1)
            goto LABEL_28;
          if (stepState != 2)
            goto LABEL_23;
          self->_state = 14;
          goto LABEL_28;
        case 12:
          -[CUUserNotificationSession _runAuthorizeRequestStart](self, "_runAuthorizeRequestStart");
          goto LABEL_23;
        case 13:
          stepError = self->_stepError;
          if (stepError)
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          v12 = self->_stepState;
          if (v12 == 1)
            goto LABEL_28;
          if (v12 == 4)
            goto LABEL_23;
          v13 = 4294896150;
          v14 = "Authorize request failed";
          goto LABEL_25;
        case 14:
          v16 = 0;
          -[CUUserNotificationSession _runRequestAddStart:](self, "_runRequestAddStart:", &v16);
          v9 = v16;
          if (v9)
            goto LABEL_26;
          ++self->_state;
          goto LABEL_27;
        case 15:
          stepError = self->_stepError;
          if (stepError)
            -[CUUserNotificationSession _reportError:](self, "_reportError:");
          v15 = self->_stepState;
          if (v15 == 1)
            goto LABEL_28;
          if (v15 == 4)
          {
LABEL_23:
            ++self->_state;
          }
          else
          {
            v13 = 4294960596;
            v14 = "Request add failed";
LABEL_25:
            NSErrorWithOSStatusF(v13, (uint64_t)v14, (uint64_t)stepError, v2, v3, v4, v5, v6, (uint64_t)v16);
            v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
            -[CUUserNotificationSession _reportError:](self, "_reportError:", v9);
LABEL_27:

          }
LABEL_28:
          if (self->_state == state)
            return;
          continue;
        default:
          goto LABEL_28;
      }
    }
    break;
  }
}

- (BOOL)_runInit:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  uint64_t v28;

  v11 = self->_bundleID;
  if (v11)
  {
    v18 = self->_categoryID;
    if (v18)
    {
      v25 = (void *)objc_msgSend(objc_alloc((Class)getUNUserNotificationCenterClass[0]()), "initWithBundleIdentifier:", v11);
      v26 = v25 != 0;
      if (v25)
      {
        objc_storeStrong((id *)&self->_unCenter, v25);
        objc_msgSend(v25, "setDelegate:", self);
        objc_msgSend(v25, "setWantsNotificationResponsesDelivered");
        -[CUUserNotificationSession _updateActionCategories](self, "_updateActionCategories");
      }
      else if (a3)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No UN center", v19, v20, v21, v22, v23, v24, v28);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (a3)
    {
      NSErrorWithOSStatusF(4294960591, (uint64_t)"No categoryID", v12, v13, v14, v15, v16, v17, v28);
      v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }

  }
  else if (a3)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No bundleID", v5, v6, v7, v8, v9, v10, v28);
    v26 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)_runAuthorizeCheckStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSError *stepError;
  UNUserNotificationCenter *unCenter;
  UNUserNotificationCenter *v10;
  uint64_t v11[6];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runAuthorizeCheckStart]", 0x1Eu, (uint64_t)"Authorization status request\n", v2, v3, v4, v5, v11[0]);
  }
LABEL_5:
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepState = 1;
  unCenter = self->_unCenter;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = (uint64_t)__52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke;
  v11[3] = (uint64_t)&unk_1E25DE228;
  v11[4] = (uint64_t)self;
  v11[5] = (uint64_t)unCenter;
  v10 = unCenter;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:](v10, "getNotificationSettingsWithCompletionHandler:", v11);

}

- (void)_runAuthorizeRequestStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSError *stepError;
  UNUserNotificationCenter *unCenter;
  UNUserNotificationCenter *v10;
  uint64_t v11[6];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runAuthorizeRequestStart]", 0x1Eu, (uint64_t)"Authorize request\n", v2, v3, v4, v5, v11[0]);
  }
LABEL_5:
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepState = 1;
  unCenter = self->_unCenter;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = (uint64_t)__54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke;
  v11[3] = (uint64_t)&unk_1E25DE278;
  v11[4] = (uint64_t)self;
  v11[5] = (uint64_t)unCenter;
  v10 = unCenter;
  -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:](v10, "requestAuthorizationWithOptions:completionHandler:", 6, v11);

}

- (BOOL)_runRequestAddStart:(id *)a3
{
  NSError *stepError;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  BOOL v29;
  NSString *v30;
  NSString *v31;
  void *v32;
  NSString *v33;
  void *v34;
  NSString *v35;
  void *v36;
  NSString *v37;
  void *v38;
  NSString *v39;
  void *v40;
  NSString *v41;
  void *v42;
  NSString *v43;
  void *v44;
  NSString *v45;
  unsigned int flags;
  int64_t soundAlertType;
  void *v48;
  NSDictionary *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSString *v54;
  void *v55;
  LogCategory *ucat;
  void *v57;
  UNUserNotificationCenter *v58;
  uint64_t v59;
  NSString *v60;
  OS_dispatch_source *timer;
  NSObject *v62;
  OS_dispatch_source *v63;
  OS_dispatch_source *v64;
  OS_dispatch_source *v65;
  NSObject *v66;
  dispatch_time_t v67;
  uint64_t v69;
  NSString *v70;
  NSString *v71;
  NSString *v72;
  NSString *v73;
  NSString *v74;
  NSString *v75;
  BOOL v76;
  void *v77;
  void *v78;
  NSString *v79;
  uint64_t v80;
  NSString *v81;
  _QWORD handler[6];
  _QWORD v83[6];
  NSString *v84;

  stepError = self->_stepError;
  self->_stepError = 0;

  self->_stepState = 1;
  v12 = self->_bundleID;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/System/Library/UserNotifications/Bundles/%@.bundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "_cfBundle"))
    {
      if (a3)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No bundle found: '%@'", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
        v29 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      goto LABEL_47;
    }
    v21 = objc_alloc_init((Class)getUNMutableNotificationContentClass[0]());
    v28 = self->_categoryID;
    v29 = v28 != 0;
    if (!v28)
    {
      if (a3)
      {
        NSErrorWithOSStatusF(4294960591, (uint64_t)"No categoryID", v22, v23, v24, v25, v26, v27, (uint64_t)v12);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_46;
    }
    v79 = v12;
    objc_msgSend(v21, "setCategoryIdentifier:", v28);
    v30 = self->_header;
    if (v30)
      objc_msgSend(v21, "setHeader:", v30);
    v75 = v30;
    v31 = self->_iconAppIdentifier;
    if (v31)
    {
      objc_msgSend((Class)getUNNotificationIconClass[0](), "iconForApplicationIdentifier:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setIcon:", v32);

    }
    v33 = self->_iconName;
    if (v33)
    {
      objc_msgSend((Class)getUNNotificationIconClass[0](), "iconNamed:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setIcon:", v34);

    }
    v81 = v33;
    v35 = self->_iconPath;
    if (v35)
    {
      objc_msgSend((Class)getUNNotificationIconClass[0](), "iconAtPath:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setIcon:", v36);

    }
    v37 = self->_iconSystemName;
    v73 = v37;
    if (v37)
    {
      objc_msgSend((Class)getUNNotificationIconClass[0](), "iconForSystemImageNamed:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setIcon:", v38);

    }
    v39 = self->_titleKey;
    v72 = v39;
    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v39, self->_titleArguments);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitle:", v40);

    }
    v76 = v28 != 0;
    v41 = self->_subtitleKey;
    if (v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v41, self->_subtitleArguments);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSubtitle:", v42);

    }
    v43 = self->_bodyKey;
    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v43, self->_bodyArguments);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBody:", v44);

    }
    v71 = v41;
    if ((self->_interruptionLevel - 1) <= 3)
      objc_msgSend(v21, "setInterruptionLevel:");
    v45 = v81;
    if ((self->_flags & 1) != 0)
      objc_msgSend(v21, "setShouldAuthenticateDefaultAction:", 1);
    objc_msgSend(v21, "setShouldBackgroundDefaultAction:", 1);
    flags = self->_flags;
    if ((flags & 8) != 0)
    {
      objc_msgSend(v21, "setShouldSuppressDefaultAction:", 1);
      flags = self->_flags;
      if ((flags & 0x10) == 0)
      {
LABEL_26:
        if ((flags & 0x40) == 0)
          goto LABEL_28;
        goto LABEL_27;
      }
    }
    else if ((flags & 0x10) == 0)
    {
      goto LABEL_26;
    }
    objc_msgSend(v21, "setShouldIgnoreDoNotDisturb:", 1);
    if ((self->_flags & 0x40) == 0)
    {
LABEL_28:
      v80 = (uint64_t)v28;
      soundAlertType = self->_soundAlertType;
      if (soundAlertType)
      {
        objc_msgSend((Class)getUNNotificationSoundClass[0](), "soundWithAlertType:", soundAlertType);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSound:", v48);

      }
      v78 = v13;
      v49 = self->_userInfo;
      if (v49)
        objc_msgSend(v21, "setUserInfo:", v49);
      v54 = self->_identifier;
      v74 = v31;
      if (!v54)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "UUIDString");
        v54 = (NSString *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong((id *)&self->_identifier, v54);
      }
      v77 = v14;
      ucat = self->_ucat;
      if (ucat->var0 > 30)
        goto LABEL_41;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_41;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runRequestAddStart:]", 0x1Eu, (uint64_t)"Request add start: Category %@, ID %@\n", v50, v51, v52, v53, v80);
LABEL_41:
      objc_storeStrong((id *)&self->_requestIdentifier, v54);
      objc_msgSend((Class)getUNNotificationRequestClass[0](), "requestWithIdentifier:content:trigger:", v54, v21, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = self->_unCenter;
      v59 = MEMORY[0x1E0C809B0];
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke;
      v83[3] = &unk_1E25DE3E0;
      v83[4] = self;
      v83[5] = v58;
      v60 = v54;
      v84 = v60;
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](v58, "addNotificationRequest:withCompletionHandler:", v57, v83);
      if (self->_timeoutSeconds > 0.0)
      {
        v70 = v35;
        timer = self->_timer;
        if (timer)
        {
          v62 = timer;
          dispatch_source_cancel(v62);
          v63 = self->_timer;
          self->_timer = 0;

        }
        v64 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        v65 = self->_timer;
        self->_timer = v64;
        v66 = v64;

        handler[0] = v59;
        handler[1] = 3221225472;
        handler[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke_3;
        handler[3] = &unk_1E25DE628;
        handler[4] = v66;
        handler[5] = self;
        dispatch_source_set_event_handler(v66, handler);
        v67 = dispatch_time(0, (unint64_t)(self->_timeoutSeconds * 1000000000.0));
        dispatch_source_set_timer(v66, v67, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        dispatch_activate(v66);

        v45 = v81;
        v35 = v70;
      }

      v13 = v78;
      v12 = v79;
      v14 = v77;
      v29 = v76;
      v28 = (NSString *)v80;
LABEL_46:

LABEL_47:
      goto LABEL_48;
    }
LABEL_27:
    objc_msgSend(v21, "setShouldShowSubordinateIcon:", 1);
    goto LABEL_28;
  }
  if (a3)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No bundleID", v6, v7, v8, v9, v10, v11, v69);
    v29 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
LABEL_48:

  return v29;
}

- (BOOL)_runResponse:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  LogCategory *ucat;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  LogCategory *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  LogCategory *v42;
  void (**v43)(void);
  void (**v44)(void);
  void (*v45)(void);
  void (**v46)(void);
  uint64_t v47;
  void *v48;
  BOOL v49;
  uint64_t v51;

  objc_msgSend(a3, "actionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v19 = self->_requestIdentifier;
    if (v19)
    {
      getUNNotificationDefaultActionIdentifier[0]();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v12, "isEqual:", v20);

      if (v21)
      {
        ucat = self->_ucat;
        if (ucat->var0 > 30)
          goto LABEL_16;
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          {
LABEL_16:
            v43 = (void (**)(void))_Block_copy(self->_actionHandler);
            v44 = v43;
            if (v43)
            {
              v45 = v43[2];
LABEL_21:
              v45();
              goto LABEL_22;
            }
            goto LABEL_22;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUUserNotificationSession _runResponse:error:]", 0x1Eu, (uint64_t)"Request action default: %@\n", v22, v23, v24, v25, (uint64_t)v19);
        goto LABEL_16;
      }
      getUNNotificationDismissActionIdentifier[0]();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v12, "isEqual:", v27);

      if (v28)
      {
        v33 = self->_ucat;
        if (v33->var0 > 30)
          goto LABEL_19;
        if (v33->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v33, 0x1Eu))
          {
LABEL_19:
            v46 = (void (**)(void))_Block_copy(self->_actionHandler);
            v44 = v46;
            if (v46)
            {
              v45 = v46[2];
              goto LABEL_21;
            }
LABEL_22:

LABEL_27:
            v49 = 1;
LABEL_28:

            goto LABEL_29;
          }
          v33 = self->_ucat;
        }
        LogPrintF((uint64_t)v33, (uint64_t)"-[CUUserNotificationSession _runResponse:error:]", 0x1Eu, (uint64_t)"Request action dismiss: %@\n", v29, v30, v31, v32, (uint64_t)v19);
        goto LABEL_19;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_actions, "objectForKeyedSubscript:", v12);
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v41 = (void *)v34;
        v42 = self->_ucat;
        if (v42->var0 <= 30)
        {
          if (v42->var0 == -1)
          {
            if (!_LogCategory_Initialize((uint64_t)v42, 0x1Eu))
              goto LABEL_24;
            v42 = self->_ucat;
          }
          LogPrintF((uint64_t)v42, (uint64_t)"-[CUUserNotificationSession _runResponse:error:]", 0x1Eu, (uint64_t)"Request action: %@, %@\n", v37, v38, v39, v40, (uint64_t)v19);
        }
LABEL_24:
        objc_msgSend(v41, "handler");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v47;
        if (v47)
          (*(void (**)(uint64_t))(v47 + 16))(v47);

        goto LABEL_27;
      }
      if (a4)
      {
        NSErrorWithOSStatusF(4294960584, (uint64_t)"Request action unknown: '%@'", v35, v36, v37, v38, v39, v40, (uint64_t)v12);
        goto LABEL_34;
      }
    }
    else if (a4)
    {
      NSErrorWithOSStatusF(4294960588, (uint64_t)"No identifier", v13, v14, v15, v16, v17, v18, v51);
LABEL_34:
      v49 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v49 = 0;
    goto LABEL_28;
  }
  if (a4)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No actionID", v6, v7, v8, v9, v10, v11, v51);
    v49 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = 0;
  }
LABEL_29:

  return v49;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CUUserNotificationSession *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__CUUserNotificationSession_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E25DE2C8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)bodyKey
{
  return self->_bodyKey;
}

- (void)setBodyKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)bodyArguments
{
  return self->_bodyArguments;
}

- (void)setBodyArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)iconAppIdentifier
{
  return self->_iconAppIdentifier;
}

- (void)setIconAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (void)setIconPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconSystemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(int)a3
{
  self->_interruptionLevel = a3;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)soundAlertType
{
  return self->_soundAlertType;
}

- (void)setSoundAlertType:(int64_t)a3
{
  self->_soundAlertType = a3;
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (void)setSubtitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)subtitleArguments
{
  return self->_subtitleArguments;
}

- (void)setSubtitleArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (void)setTitleKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)titleArguments
{
  return self->_titleArguments;
}

- (void)setTitleArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_titleArguments, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_subtitleArguments, 0);
  objc_storeStrong((id *)&self->_subtitleKey, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconSystemName, 0);
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_iconAppIdentifier, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bodyArguments, 0);
  objc_storeStrong((id *)&self->_bodyKey, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

void __105__CUUserNotificationSession_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  int *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  int *v33;
  int *v34;
  int *v35;
  id v36;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (v9 != *(_QWORD *)(v10 + 64))
  {
    v11 = *(int **)(v10 + 72);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu))
          goto LABEL_15;
        v9 = *(_QWORD *)(a1 + 32);
        v11 = *(int **)(*(_QWORD *)(a1 + 40) + 72);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x1Eu, (uint64_t)"Response wrong center: %{ptr} vs %{ptr}\n", a5, a6, a7, a8, v9);
    }
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 48), "notification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "content");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "categoryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120)) & 1) != 0)
  {
    objc_msgSend(v13, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v20, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
    v26 = *(uint64_t **)(a1 + 40);
    if ((v25 & 1) != 0)
    {
      v27 = *(_QWORD *)(a1 + 48);
      v36 = 0;
      objc_msgSend(v26, "_runResponse:error:", v27, &v36);
      v32 = v36;
      if (!v32)
        goto LABEL_24;
      v33 = *(int **)(*(_QWORD *)(a1 + 40) + 72);
      if (*v33 > 90)
        goto LABEL_24;
      if (*v33 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v33, 0x5Au))
          goto LABEL_24;
        v33 = *(int **)(*(_QWORD *)(a1 + 40) + 72);
      }
      LogPrintF((uint64_t)v33, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x5Au, (uint64_t)"### Response failed: %{error}\n", v28, v29, v30, v31, (uint64_t)v32);
LABEL_24:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      goto LABEL_25;
    }
    v35 = (int *)v26[9];
    if (*v35 <= 30)
    {
      if (*v35 == -1)
      {
        if (!_LogCategory_Initialize(v26[9], 0x1Eu))
          goto LABEL_22;
        v35 = *(int **)(*(_QWORD *)(a1 + 40) + 72);
      }
      LogPrintF((uint64_t)v35, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x1Eu, (uint64_t)"Response wrong ID: %@ vs %@\n", v21, v22, v23, v24, (uint64_t)v20);
    }
LABEL_22:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_25:

    goto LABEL_26;
  }
  v34 = *(int **)(*(_QWORD *)(a1 + 40) + 72);
  if (*v34 <= 30)
  {
    if (*v34 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v34, 0x1Eu))
        goto LABEL_20;
      v34 = *(int **)(*(_QWORD *)(a1 + 40) + 72);
    }
    LogPrintF((uint64_t)v34, (uint64_t)"-[CUUserNotificationSession userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]_block_invoke", 0x1Eu, (uint64_t)"Response wrong category: %@ vs %@\n", v16, v17, v18, v19, (uint64_t)v15);
  }
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_26:

}

void __49__CUUserNotificationSession__runRequestAddStart___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int8x16_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;
  id v11;

  v3 = a2;
  v8[1] = 3221225472;
  v4 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v5 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __49__CUUserNotificationSession__runRequestAddStart___block_invoke_2;
  v8[3] = &unk_1E25DE2A0;
  v6 = *(NSObject **)(v5 + 128);
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v7 = v3;
  dispatch_async(v6, v8);

}

_QWORD *__49__CUUserNotificationSession__runRequestAddStart___block_invoke_3(uint64_t a1)
{
  _QWORD *result;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == (void *)result[7])
  {
    if (v3)
    {
      v4 = v3;
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = 0;

      result = *(_QWORD **)(a1 + 40);
    }
    return (_QWORD *)objc_msgSend(result, "_reportTimeout");
  }
  return result;
}

uint64_t __49__CUUserNotificationSession__runRequestAddStart___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  int v12;

  v8 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) != *(_QWORD *)(v8 + 64))
    return result;
  v9 = result;
  v10 = *(int **)(v8 + 72);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v8 = *(_QWORD *)(v9 + 40);
      if (!v11)
        goto LABEL_6;
      v10 = *(int **)(v8 + 72);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUUserNotificationSession _runRequestAddStart:]_block_invoke_2", 0x1Eu, (uint64_t)"Request added: %@, %{error}\n", a5, a6, a7, a8, *(_QWORD *)(v9 + 48));
    v8 = *(_QWORD *)(v9 + 40);
  }
LABEL_6:
  if (*(_QWORD *)(v9 + 56))
    v12 = 3;
  else
    v12 = 4;
  *(_DWORD *)(v8 + 48) = v12;
  objc_storeStrong((id *)(*(_QWORD *)(v9 + 40) + 40), *(id *)(v9 + 56));
  return objc_msgSend(*(id *)(v9 + 40), "_run");
}

void __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke(int8x16_t *a1, char a2, void *a3)
{
  id v5;
  int8x16_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  char v13;

  v5 = a3;
  v10[1] = 3221225472;
  v6 = vextq_s8(a1[2], a1[2], 8uLL);
  v7 = a1[2].i64[0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke_2;
  v10[3] = &unk_1E25DE250;
  v8 = *(NSObject **)(v7 + 128);
  v11 = v6;
  v13 = a2;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __54__CUUserNotificationSession__runAuthorizeRequestStart__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int *v10;
  const char *v11;
  _BOOL4 v12;
  int v13;

  v8 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) != *(_QWORD *)(v8 + 64))
    return result;
  v9 = result;
  v10 = *(int **)(v8 + 72);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_4:
      v11 = "yes";
      if (!*(_BYTE *)(v9 + 56))
        v11 = "no";
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUUserNotificationSession _runAuthorizeRequestStart]_block_invoke_2", 0x1Eu, (uint64_t)"Authorize response: Granted %s, %{error}\n", a5, a6, a7, a8, (uint64_t)v11);
      v8 = *(_QWORD *)(v9 + 40);
      goto LABEL_8;
    }
    v12 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    v8 = *(_QWORD *)(v9 + 40);
    if (v12)
    {
      v10 = *(int **)(v8 + 72);
      goto LABEL_4;
    }
  }
LABEL_8:
  if (*(_BYTE *)(v9 + 56))
    v13 = 4;
  else
    v13 = 3;
  *(_DWORD *)(v8 + 48) = v13;
  objc_storeStrong((id *)(*(_QWORD *)(v9 + 40) + 40), *(id *)(v9 + 48));
  return objc_msgSend(*(id *)(v9 + 40), "_run");
}

void __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke(int8x16_t *a1, void *a2)
{
  uint64_t v3;
  int8x16_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  int8x16_t v8;
  uint64_t v9;

  v3 = objc_msgSend(a2, "authorizationStatus");
  block[1] = 3221225472;
  v4 = vextq_s8(a1[2], a1[2], 8uLL);
  v5 = a1[2].i64[0];
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke_2;
  block[3] = &unk_1E25DE200;
  v6 = *(NSObject **)(v5 + 128);
  v8 = v4;
  v9 = v3;
  dispatch_async(v6, block);
}

uint64_t __52__CUUserNotificationSession__runAuthorizeCheckStart__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int *v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v8 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v8 + 64))
  {
    v9 = result;
    v10 = *(int **)(v8 + 72);
    if (*v10 > 30)
      goto LABEL_10;
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x1Eu))
        goto LABEL_10;
      v10 = *(int **)(*(_QWORD *)(v9 + 40) + 72);
    }
    v11 = *(_QWORD *)(v9 + 48);
    if (v11 > 3)
      v12 = "?";
    else
      v12 = off_1E25DE390[v11];
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUUserNotificationSession _runAuthorizeCheckStart]_block_invoke_2", 0x1Eu, (uint64_t)"Authorization status response: %s\n", a5, a6, a7, a8, (uint64_t)v12);
LABEL_10:
    v13 = *(_QWORD *)(v9 + 48);
    if ((unint64_t)(v13 - 2) < 2)
    {
      v14 = *(_QWORD *)(v9 + 40);
      v15 = 2;
    }
    else
    {
      if (v13 == 1)
      {
        *(_DWORD *)(*(_QWORD *)(v9 + 40) + 48) = 3;
        NSErrorWithOSStatusF(4294896150, (uint64_t)"Authorization status denied", a3, a4, a5, a6, a7, a8, v19);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(v9 + 40);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        return objc_msgSend(*(id *)(v9 + 40), "_run");
      }
      v14 = *(_QWORD *)(v9 + 40);
      v15 = 4;
    }
    *(_DWORD *)(v14 + 48) = v15;
    return objc_msgSend(*(id *)(v9 + 40), "_run");
  }
  return result;
}

void __52__CUUserNotificationSession__updateActionCategories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "action");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

_QWORD *__45__CUUserNotificationSession_removeAllActions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  _QWORD *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(int **)(v2 + 72);
  if (*v3 > 30)
    goto LABEL_5;
  if (*v3 != -1)
    goto LABEL_3;
  v9 = _LogCategory_Initialize(*(_QWORD *)(v2 + 72), 0x1Eu);
  v2 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v3 = *(int **)(v2 + 72);
LABEL_3:
    v4 = objc_msgSend(*(id *)(v2 + 8), "count");
    LogPrintF((uint64_t)v3, (uint64_t)"-[CUUserNotificationSession removeAllActions]_block_invoke", 0x1Eu, (uint64_t)"Remove all actions: %d total\n", v5, v6, v7, v8, v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(*(id *)(v2 + 8), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  result = *(_QWORD **)(a1 + 32);
  if (result[8])
    return (_QWORD *)objc_msgSend(result, "_updateActionCategories");
  return result;
}

void __56__CUUserNotificationSession_removeActionWithIdentifier___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (int *)v2[9];
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_3:
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v12, "action");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUUserNotificationSession removeActionWithIdentifier:]_block_invoke", 0x1Eu, (uint64_t)"Remove action: %@, '%@'\n", v6, v7, v8, v9, v4);

      v2 = *(_QWORD **)(a1 + 32);
      goto LABEL_5;
    }
    v10 = _LogCategory_Initialize(v2[9], 0x1Eu);
    v2 = *(_QWORD **)(a1 + 32);
    if (v10)
    {
      v3 = (int *)v2[9];
      goto LABEL_3;
    }
  }
LABEL_5:
  if (v2[8])
    objc_msgSend(v2, "_updateActionCategories");

}

void __73__CUUserNotificationSession_addActionWithIdentifier_title_flags_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  _BOOL4 v12;
  CUUserNotificationCustomAction *v13;

  v13 = objc_alloc_init(CUUserNotificationCustomAction);
  -[CUUserNotificationCustomAction setAction:](v13, "setAction:", a1[4]);
  -[CUUserNotificationCustomAction setHandler:](v13, "setHandler:", a1[8]);
  v2 = *(void **)(a1[5] + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = a1[5];
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(a1[5] + 8);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, a1[6]);
  *(_BYTE *)(a1[5] + 16) = 1;
  v10 = (_QWORD *)a1[5];
  if (v10[8])
  {
    v11 = (int *)v10[9];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        v10 = (_QWORD *)a1[5];
        if (!v12)
          goto LABEL_8;
        v11 = (int *)v10[9];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]_block_invoke", 0x1Eu, (uint64_t)"Add action: %@, '%@', %#{flags}\n", v6, v7, v8, v9, a1[6]);
      v10 = (_QWORD *)a1[5];
    }
LABEL_8:
    objc_msgSend(v10, "_updateActionCategories");
  }

}

uint64_t __39__CUUserNotificationSession_invalidate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int *v11;
  _BOOL4 v12;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 18))
  {
    v9 = result;
    *(_BYTE *)(v8 + 18) = 1;
    v10 = *(uint64_t **)(result + 32);
    v11 = (int *)v10[9];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize(v10[9], 0x1Eu);
        v10 = *(uint64_t **)(v9 + 32);
        if (!v12)
          return objc_msgSend(v10, "_invalidate");
        v11 = (int *)v10[9];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate: BundleID %@, Category %@\n", a5, a6, a7, a8, v10[14]);
      v10 = *(uint64_t **)(v9 + 32);
    }
    return objc_msgSend(v10, "_invalidate");
  }
  return result;
}

uint64_t __37__CUUserNotificationSession_activate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int *v11;
  _BOOL4 v12;

  v8 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v8 + 17))
  {
    v9 = result;
    *(_BYTE *)(v8 + 17) = 1;
    v10 = *(uint64_t **)(result + 32);
    v11 = (int *)v10[9];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        v12 = _LogCategory_Initialize(v10[9], 0x1Eu);
        v10 = *(uint64_t **)(v9 + 32);
        if (!v12)
          return objc_msgSend(v10, "_run");
        v11 = (int *)v10[9];
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUUserNotificationSession activate]_block_invoke", 0x1Eu, (uint64_t)"Activate: BundleID %@, Category %@\n", a5, a6, a7, a8, v10[14]);
      v10 = *(uint64_t **)(v9 + 32);
    }
    return objc_msgSend(v10, "_run");
  }
  return result;
}

@end
