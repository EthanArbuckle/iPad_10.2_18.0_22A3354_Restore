@implementation AFUIServiceDelegate

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  _BOOL4 v24;

  v7 = a4;
  -[NSLock lock](self->_lock, "lock");
  -[AFUIServiceDelegate currentSessions](self, "currentSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(v7, "documentTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")))
  {

    goto LABEL_4;
  }
  objc_msgSend(v7, "documentTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.ContactsUI.ContactsViewService"));

  if (v13)
  {
LABEL_4:
    AFUIServiceDelegateOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.1(a2);
    goto LABEL_6;
  }
  objc_msgSend(v7, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIServiceDelegate authenticatingForSessionId](self, "authenticatingForSessionId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {
    AFUIServiceDelegateOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.2();
  }
  else
  {
    objc_msgSend(v7, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIServiceDelegate contactsUIShowingForSessionId](self, "contactsUIShowingForSessionId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (v20)
    {
      AFUIServiceDelegateOSLogFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.3();
    }
    else
    {
      objc_msgSend(v7, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUIServiceDelegate passwordsUIShowingForSessionId](self, "passwordsUIShowingForSessionId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      AFUIServiceDelegateOSLogFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v24)
          -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.4();
      }
      else
      {
        if (v24)
          -[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:].cold.5();

        objc_msgSend(v7, "uuid");
        v14 = objc_claimAutoreleasedReturnValue();
        -[AFUIServiceDelegate _tearDownPanelForSessionUUID:](self, "_tearDownPanelForSessionUUID:", v14);
      }
    }
  }
LABEL_6:

}

- (BOOL)_checkAndSendQueuedTextOperationsIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  NSMutableDictionary *queuedOperations;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "documentTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "documentTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "processId");

  v9 = 0;
  if (objc_msgSend(v6, "length") && v8)
  {
    -[NSLock lock](self->_lock, "lock");
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__1;
    v32 = __Block_byref_object_dispose__1;
    v33 = 0;
    queuedOperations = self->_queuedOperations;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke;
    v24[3] = &unk_250856FF8;
    v11 = v6;
    v27 = v8;
    v25 = v11;
    v26 = &v28;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queuedOperations, "enumerateKeysAndObjectsUsingBlock:", v24);
    if (v29[5])
    {
      -[NSMutableDictionary objectForKey:](self->_queuedOperations, "objectForKey:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->_queuedOperations, "removeObjectForKey:", v29[5]);
    }
    else
    {
      v12 = 0;
    }
    -[NSLock unlock](self->_lock, "unlock");
    AFUIServiceDelegateOSLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v12, "textOperations");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = CFSTR("found");
      if (!v19)
        v22 = CFSTR("not found");
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%s textOperations %@ for session uuid %@ (appId: %@)"), "-[AFUIServiceDelegate _checkAndSendQueuedTextOperationsIfNecessary:]", v22, v20, v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v23;
      _os_log_debug_impl(&dword_236DAD000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    objc_msgSend(v12, "textOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v14 != 0;
    if (v14)
    {
      objc_msgSend(v12, "textOperations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "completionHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUIServiceDelegate _sendTextOperations:toSession:completionHandler:](self, "_sendTextOperations:toSession:completionHandler:", v15, v4, v16);

    }
    _Block_object_dispose(&v28, 8);

  }
  return v9;
}

- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v5 = a4;
  -[NSLock lock](self->_lock, "lock");
  -[AFUIServiceDelegate currentSessions](self, "currentSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  -[NSLock unlock](self->_lock, "unlock");
  AFUIServiceDelegateOSLogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AFUIServiceDelegate inputSystemService:inputSessionDidDie:].cold.1();

  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIServiceDelegate _tearDownPanelForSessionUUID:](self, "_tearDownPanelForSessionUUID:", v8);

}

- (void)_tearDownPanelForSessionUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary objectForKey:](self->_sessionPanels, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__AFUIServiceDelegate__tearDownPanelForSessionUUID___block_invoke;
    block[3] = &unk_250856B30;
    v8 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[NSMutableDictionary removeObjectForKey:](self->_sessionPanels, "removeObjectForKey:", v4);

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSNumber *trackedInputIdentifier;
  void *v21;
  void *v22;
  NSNumber *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  _BOOL4 v39;
  void *v40;
  _BOOL4 v41;
  NSObject *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[NSLock lock](self->_lock, "lock");
  -[AFUIServiceDelegate currentSessions](self, "currentSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

  -[NSLock unlock](self->_lock, "unlock");
  AFUIServiceDelegateOSLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v43 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "documentTraits");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentTraits");
    v45 = a2;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "processId");
    objc_msgSend(v7, "documentTraits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("%s Session info. Bundle ID: %@; uuid: %@; appName: %@; processId: %d; contextID: %u"),
      "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]",
      v10,
      v11,
      v13,
      v15,
      objc_msgSend(v16, "contextID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v17;
    _os_log_impl(&dword_236DAD000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    a2 = v45;
  }

  if (self->_trackedInputIdentifier)
  {
    -[AFUIServiceDelegate _inputIdentifierForSession:](self, "_inputIdentifierForSession:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      trackedInputIdentifier = self->_trackedInputIdentifier;
      -[AFUIServiceDelegate _inputIdentifierForSession:](self, "_inputIdentifierForSession:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(trackedInputIdentifier) = -[NSNumber isEqual:](trackedInputIdentifier, "isEqual:", v21);

      if ((_DWORD)trackedInputIdentifier)
      {
        objc_msgSend(v7, "uuid");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUIServiceDelegate _tearDownPanelsExceptForSessionUUID:](self, "_tearDownPanelsExceptForSessionUUID:", v22);

        v23 = self->_trackedInputIdentifier;
        self->_trackedInputIdentifier = 0;

      }
    }
  }
  objc_msgSend(v7, "documentTraits");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bundleId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")))
  {

    goto LABEL_10;
  }
  objc_msgSend(v7, "documentTraits");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bundleId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.ContactsUI.ContactsViewService"));

  if (v28)
  {
LABEL_10:
    AFUIServiceDelegateOSLogFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.1(a2);
    goto LABEL_12;
  }
  objc_msgSend(v7, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIServiceDelegate authenticatingForSessionId](self, "authenticatingForSessionId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "isEqual:", v31);

  if (v32)
  {
    AFUIServiceDelegateOSLogFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.2();
  }
  else
  {
    objc_msgSend(v7, "uuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIServiceDelegate contactsUIShowingForSessionId](self, "contactsUIShowingForSessionId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (v35)
    {
      AFUIServiceDelegateOSLogFacility();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.3();
    }
    else
    {
      objc_msgSend(v7, "uuid");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUIServiceDelegate passwordsUIShowingForSessionId](self, "passwordsUIShowingForSessionId");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      AFUIServiceDelegateOSLogFacility();
      v29 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
      if (v38)
      {
        if (v39)
          -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.4();
      }
      else
      {
        if (v39)
          -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.7();

        if (-[AFUIServiceDelegate _checkAndSendQueuedTextOperationsIfNecessary:](self, "_checkAndSendQueuedTextOperationsIfNecessary:", v7)|| (objc_msgSend(v7, "documentTraits"), v40 = (void *)objc_claimAutoreleasedReturnValue(), v41 = -[AFUIServiceDelegate _shouldAutomaticallyDisplayPanelForDocumentTraits:](self, "_shouldAutomaticallyDisplayPanelForDocumentTraits:", v40), v40, !v41))
        {
          AFUIServiceDelegateOSLogFacility();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.5(a2, v7, v29);
        }
        else
        {
          AFUIServiceDelegateOSLogFacility();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            -[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:].cold.6();

          objc_msgSend(v7, "documentTraits");
          v29 = objc_claimAutoreleasedReturnValue();
          -[AFUIServiceDelegate _displayPanelForSession:traits:](self, "_displayPanelForSession:traits:", v7, v29);
        }
      }
    }
  }
LABEL_12:

}

- (NSMutableArray)currentSessions
{
  return self->_currentSessions;
}

- (NSUUID)passwordsUIShowingForSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)contactsUIShowingForSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)authenticatingForSessionId
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)_shouldAutomaticallyDisplayPanelForDocumentTraits:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "autofillMode") && (objc_msgSend(v3, "_isExplicitAutoFillInvocation") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInterfaceIdiom");

    v4 = _os_feature_enabled_impl();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 performInputOperation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSMutableDictionary *sessionPanels;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "documentTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.CoreAuthUI")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ContactsUI.ContactsViewService")))
  {
    AFUIServiceDelegateOSLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:].cold.1(a2);
    goto LABEL_5;
  }
  AFUIServiceDelegateOSLogFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:].cold.2();

  objc_msgSend(v9, "customInfoType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UIUserInteractionRemoteInputOperations"));

  if (!v15)
    goto LABEL_6;
  if ((char *)objc_msgSend(v9, "actionSelector") == sel_dismissAutoFillPanel
    || (char *)objc_msgSend(v9, "actionSelector") == sel_dismissAutoFillMenu)
  {
    sessionPanels = self->_sessionPanels;
    objc_msgSend(v8, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sessionPanels, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __77__AFUIServiceDelegate_inputSystemService_inputSession_performInputOperation___block_invoke;
    v22[3] = &unk_250856DB0;
    v23 = v9;
    v24 = v19;
    v12 = v19;
    dispatch_async(MEMORY[0x24BDAC9B8], v22);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "actionSelector")
    && (char *)objc_msgSend(v9, "actionSelector") == sel_handleAutoFillContactPopoverCommand)
  {
    v16 = 1;
LABEL_31:
    v20 = 7;
    goto LABEL_34;
  }
  if (objc_msgSend(v9, "actionSelector")
    && (char *)objc_msgSend(v9, "actionSelector") == sel_handleAutoFillCreditCardPopoverCommand)
  {
    v16 = 1;
LABEL_33:
    v20 = 9;
    goto LABEL_34;
  }
  if (objc_msgSend(v9, "actionSelector")
    && (char *)objc_msgSend(v9, "actionSelector") == sel_handleAutoFillPasswordPopoverCommand)
  {
    v16 = 1;
    goto LABEL_29;
  }
  if (objc_msgSend(v9, "actionSelector")
    && (char *)objc_msgSend(v9, "actionSelector") == sel_handleAutoFillContactDetected)
  {
    v16 = 0;
    goto LABEL_31;
  }
  if (objc_msgSend(v9, "actionSelector")
    && (char *)objc_msgSend(v9, "actionSelector") == sel_handleAutoFillCreditCardDetected)
  {
    v16 = 0;
    goto LABEL_33;
  }
  if (objc_msgSend(v9, "actionSelector")
    && (char *)objc_msgSend(v9, "actionSelector") == sel_handleAutoFillPasswordDetected)
  {
    v16 = 0;
LABEL_29:
    v20 = 1;
LABEL_34:
    objc_msgSend(v8, "documentTraits");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v21, "copy");

    -[NSObject setAutofillMode:](v12, "setAutofillMode:", v20);
    -[NSObject setExplicitAutoFillMode:](v12, "setExplicitAutoFillMode:", v16);
    -[AFUIServiceDelegate _displayPanelForSession:traits:](self, "_displayPanelForSession:traits:", v8, v12);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)_shouldDisplayPanelForSession:(id)a3 documentTraits:(id)a4
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;
  char v9;
  void *v10;

  v4 = a4;
  if ((objc_msgSend(v4, "_isExplicitAutoFillInvocation") & 1) == 0)
  {
    objc_msgSend(v4, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (isAutoFillPanelAlwaysBlockedForBundleID_onceToken != -1)
        dispatch_once(&isAutoFillPanelAlwaysBlockedForBundleID_onceToken, &__block_literal_global_275);
      if ((objc_msgSend((id)isAutoFillPanelAlwaysBlockedForBundleID_blockedBundleIDs, "containsObject:", v6) & 1) != 0)
      {
        v5 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v7 = isAutoFillPanelAlwaysAllowedForBundleID_onceToken;
      v8 = v6;
      if (v7 != -1)
        dispatch_once(&isAutoFillPanelAlwaysAllowedForBundleID_onceToken, &__block_literal_global_281);
      v9 = objc_msgSend((id)isAutoFillPanelAlwaysAllowedForBundleID_allowedBundleIDs, "containsObject:", v8);

      if ((v9 & 1) != 0)
      {
        v5 = 1;
        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInterfaceIdiom");

    v5 = _os_feature_enabled_impl();
    goto LABEL_13;
  }
  v5 = 1;
LABEL_14:

  return v5;
}

- (void)_displayPanelForSession:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(v6, "documentTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[AFUIServiceDelegate _shouldDisplayPanelForSession:documentTraits:](self, "_shouldDisplayPanelForSession:documentTraits:", v6, v7);
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AFUIServiceDelegate _setupPanelForSessionUUID:documentPid:](self, "_setupPanelForSessionUUID:documentPid:", v9, objc_msgSend(v7, "processId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFUIServiceDelegate _inputIdentifierForSession:](self, "_inputIdentifierForSession:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internalQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke;
    v16[3] = &unk_250856FA8;
    v16[4] = self;
    v17 = v11;
    v18 = v10;
    v19 = v7;
    v20 = v6;
    v13 = v10;
    v14 = v11;
    objc_copyWeak(&v22, &location);
    v21 = v12;
    v15 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], v16);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AFUIServiceDelegate _tearDownPanelForSessionUUID:](self, "_tearDownPanelForSessionUUID:", v9);

  }
}

- (AFUIServiceDelegate)init
{
  AFUIServiceDelegate *v2;
  uint64_t v3;
  NSMutableDictionary *sessionPanels;
  NSLock *v5;
  NSLock *lock;
  NSMutableArray *v7;
  NSMutableArray *currentSessions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AFUIServiceDelegate;
  v2 = -[AFUIServiceDelegate init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    sessionPanels = v2->_sessionPanels;
    v2->_sessionPanels = (NSMutableDictionary *)v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    currentSessions = v2->_currentSessions;
    v2->_currentSessions = v7;

  }
  return v2;
}

- (id)_setupPanelForSessionUUID:(id)a3 documentPid:(int)a4
{
  uint64_t v4;
  id v6;
  AFUIPanel *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary objectForKey:](self->_sessionPanels, "objectForKey:", v6);
  v7 = (AFUIPanel *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[AFUIPanel initWithDocumentPid:sessionUUID:]([AFUIPanel alloc], "initWithDocumentPid:sessionUUID:", v4, v6);
    -[AFUIPanel setDelegate:](v7, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKey:](self->_sessionPanels, "setObject:forKey:", v7, v6);
  }
  -[NSLock unlock](self->_lock, "unlock");

  return v7;
}

uint64_t __52__AFUIServiceDelegate__tearDownPanelForSessionUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

- (void)_tearDownPanelsExceptForSessionUUID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_lock, "lock");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_sessionPanels;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v10 = MEMORY[0x24BDAC9B8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqual:", v4) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionPanels, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __59__AFUIServiceDelegate__tearDownPanelsExceptForSessionUUID___block_invoke;
          block[3] = &unk_250856B30;
          v25 = v13;
          v14 = v13;
          dispatch_async(v10, block);
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NSMutableDictionary removeObjectForKey:](self->_sessionPanels, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v17);
  }

  -[NSLock unlock](self->_lock, "unlock");
}

uint64_t __59__AFUIServiceDelegate__tearDownPanelsExceptForSessionUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

void __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_8);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_3;
  v6[3] = &unk_250856F80;
  objc_copyWeak(&v11, (id *)(a1 + 80));
  v7 = *(id *)(a1 + 72);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "displayForDocumentTraits:documentState:textOperationsHandler:", v4, v5, v6);

  objc_destroyWeak(&v11);
}

uint64_t __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hide");
}

void __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v6 = *(NSObject **)(a1 + 32);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_4;
    block[3] = &unk_250856F58;
    block[4] = WeakRetained;
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    dispatch_async(v6, block);

  }
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_5;
  v7[3] = &unk_250856B30;
  v8 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendOrQueueTextOperations:session:withInputIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __54__AFUIServiceDelegate__displayPanelForSession_traits___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

- (void)_queueTextOperations:(id)a3 forSecureAppID:(id)a4 processID:(int)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *queuedOperations;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    +[_AFUIQueuedOperations queuedOperationsWithSecureAppID:processID:textOperations:completionHandler:](_AFUIQueuedOperations, "queuedOperationsWithSecureAppID:processID:textOperations:completionHandler:", v11, v7, v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFUIServiceDelegateOSLogFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:].cold.2((uint64_t)v11, (uint64_t)v13);

    -[NSLock lock](self->_lock, "lock");
    queuedOperations = self->_queuedOperations;
    if (!queuedOperations)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v18 = self->_queuedOperations;
      self->_queuedOperations = v17;

      queuedOperations = self->_queuedOperations;
    }
    -[NSMutableDictionary setObject:forKey:](queuedOperations, "setObject:forKey:", v14, v13);
    -[NSLock unlock](self->_lock, "unlock");
    -[AFUIServiceDelegate _scheduleExpirationOfQueuedOperations:](self, "_scheduleExpirationOfQueuedOperations:", v13);

  }
  else
  {
    AFUIServiceDelegateOSLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:].cold.1();
  }

}

- (void)_scheduleExpirationOfQueuedOperations:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, 20000000000);
  dispatch_get_global_queue(17, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke;
  block[3] = &unk_250856FD0;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[4], "lock");
    v5 = *(_QWORD *)(a1 + 32);
    v4 = (_QWORD *)(a1 + 32);
    objc_msgSend(v3[2], "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      AFUIServiceDelegateOSLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke_cold_1(v4);

      objc_msgSend(v3[2], "removeObjectForKey:", *v4);
    }
    objc_msgSend(v3[4], "unlock");
  }

}

- (void)_sendOrQueueTextOperations:(id)a3 session:(id)a4 withInputIdentifier:(id)a5
{
  NSLock *lock;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a4;
  lock = self->_lock;
  v8 = a3;
  -[NSLock lock](lock, "lock");
  -[AFUIServiceDelegate currentSessions](self, "currentSessions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v16);

  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(v16, "documentTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v16, "documentTraits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "processId");

  if (v10)
    -[AFUIServiceDelegate _sendTextOperations:toSession:completionHandler:](self, "_sendTextOperations:toSession:completionHandler:", v8, v16, 0);
  else
    -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:](self, "_queueTextOperations:forSecureAppID:processID:completionHandler:", v8, v13, v15, 0);

}

- (id)_inputIdentifierForSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "documentTraits"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "documentTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "contextID");

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "documentTraits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "processId");
      objc_msgSend(v4, "documentTraits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "contextID") ^ v10;
      objc_msgSend(v4, "documentTraits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v14, "hash") ^ v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      AFUIServiceDelegateOSLogFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AFUIServiceDelegate _inputIdentifierForSession:].cold.2(v4);

      v19 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "documentTraits");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (int)objc_msgSend(v20, "processId");
      objc_msgSend(v4, "documentTraits");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v23, "hash") ^ v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    AFUIServiceDelegateOSLogFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AFUIServiceDelegate _inputIdentifierForSession:].cold.1(v4);

    v15 = 0;
  }

  return v15;
}

void __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;

  v8 = a2;
  v9 = a3;
  objc_msgSend(v9, "secureAppID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v11 = objc_msgSend(v9, "processID");
    v12 = *(_DWORD *)(a1 + 48);

    if (v11 == v12)
    {
      AFUIServiceDelegateOSLogFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke_cold_1();

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {

  }
}

- (void)_sendTextOperations:(id)a3 toSession:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSNumber *trackedInputIdentifier;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AFUIServiceDelegate _inputIdentifierForSession:](self, "_inputIdentifierForSession:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_trackedInputIdentifier)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && objc_msgSend(v11, "isEqualToValue:"))
  {
    trackedInputIdentifier = self->_trackedInputIdentifier;
    self->_trackedInputIdentifier = 0;

  }
  AFUIServiceDelegateOSLogFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[AFUIServiceDelegate _sendTextOperations:toSession:completionHandler:].cold.1(v9, v15);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__AFUIServiceDelegate__sendTextOperations_toSession_completionHandler___block_invoke;
  block[3] = &unk_250856898;
  v20 = v9;
  v21 = v8;
  v22 = v10;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __71__AFUIServiceDelegate__sendTextOperations_toSession_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "textOperations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsAutoFillTextOperation:", 1);

  }
  objc_msgSend(*(id *)(a1 + 40), "textToAssert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextToAssert:", v5);

  objc_msgSend(*(id *)(a1 + 40), "keyboardOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertionText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyboardOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInsertionText:", v8);

  objc_msgSend(*(id *)(a1 + 40), "customInfoType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCustomInfoType:", v11);

  objc_msgSend(*(id *)(a1 + 40), "customInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCustomInfo:", v13);

  objc_msgSend(*(id *)(a1 + 40), "keyboardOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "customInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "keyboardOutput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCustomInfo:", v16);

  v19 = objc_msgSend(*(id *)(a1 + 40), "isExplicitAutoFillInvocation");
  objc_msgSend(*(id *)(a1 + 32), "textOperations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIsExplicitAutoFillInvocation:", v19);

  v21 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48))
    return objc_msgSend(v21, "flushOperationsWithResultHandler:");
  else
    return objc_msgSend(v21, "flushOperations");
}

- (void)_sendAuthenticationStateOperation:(BOOL)a3 sessionUUID:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v6 = a3;
  v29[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BE7ED90]);
  objc_msgSend(v10, "setCustomInfoType:", CFSTR("UIKBRTICustomInfoTypeAutofill"));
  v28[0] = CFSTR("selector");
  NSStringFromSelector(sel_handleEventFromRemoteSource_autoFillAuthentication_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  v28[1] = CFSTR("isAuthenticating");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCustomInfo:", v13);

  -[NSLock lock](self->_lock, "lock");
  -[AFUIServiceDelegate _sessionForUUID:](self, "_sessionForUUID:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_lock, "unlock");
  if (v14)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke;
    v24[3] = &unk_250856D88;
    v24[4] = self;
    v25 = v10;
    v26 = v14;
    v27 = v9;
    v15 = v9;
    -[AFUIServiceDelegate _performBlockOnInternalQueueForUUID:block:](self, "_performBlockOnInternalQueueForUUID:block:", v8, v24);

    v16 = v25;
  }
  else
  {
    -[AFUIServiceDelegate authenticatingForDocumentTraits](self, "authenticatingForDocumentTraits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIServiceDelegate authenticatingForDocumentTraits](self, "authenticatingForDocumentTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "processId");
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_3;
    v22[3] = &unk_250857020;
    v23 = v9;
    v21 = v9;
    -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:](self, "_queueTextOperations:forSecureAppID:processID:completionHandler:", v10, v18, v20, v22);

    v16 = v23;
  }

}

void __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_2;
  v4[3] = &unk_250857020;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_sendTextOperations:toSession:completionHandler:", v2, v3, v4);

}

uint64_t __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__AFUIServiceDelegate__sendAuthenticationStateOperation_sessionUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  AFUIServiceDelegateOSLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AFUIServiceDelegate authenticationWillBeginForSessionUUID:completion:].cold.1(a2);

  -[AFUIServiceDelegate setAuthenticatingForSessionId:](self, "setAuthenticatingForSessionId:", v8);
  -[NSLock lock](self->_lock, "lock");
  -[AFUIServiceDelegate _sessionForUUID:](self, "_sessionForUUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "documentTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIServiceDelegate setAuthenticatingForDocumentTraits:](self, "setAuthenticatingForDocumentTraits:", v11);

  -[NSLock unlock](self->_lock, "unlock");
  -[AFUIServiceDelegate _sendAuthenticationStateOperation:sessionUUID:completion:](self, "_sendAuthenticationStateOperation:sessionUUID:completion:", 1, v8, v7);

}

- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a4;
  v8 = a3;
  AFUIServiceDelegateOSLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AFUIServiceDelegate authenticationDidEndForSessionUUID:completion:].cold.1(a2);

  -[AFUIServiceDelegate _sendAuthenticationStateOperation:sessionUUID:completion:](self, "_sendAuthenticationStateOperation:sessionUUID:completion:", 0, v8, v7);
  -[AFUIServiceDelegate setAuthenticatingForSessionId:](self, "setAuthenticatingForSessionId:", 0);
  -[AFUIServiceDelegate setAuthenticatingForDocumentTraits:](self, "setAuthenticatingForDocumentTraits:", 0);
}

- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AFUIServiceDelegate setContactsUIShowingForSessionId:](self, "setContactsUIShowingForSessionId:", v7);
  -[AFUIServiceDelegate _performBlockOnInternalQueueForUUID:block:](self, "_performBlockOnInternalQueueForUUID:block:", v7, v6);

}

- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AFUIServiceDelegate setContactsUIShowingForSessionId:](self, "setContactsUIShowingForSessionId:", 0);
  -[AFUIServiceDelegate _performBlockOnInternalQueueForUUID:block:](self, "_performBlockOnInternalQueueForUUID:block:", v7, v6);

}

- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AFUIServiceDelegate setPasswordsUIShowingForSessionId:](self, "setPasswordsUIShowingForSessionId:", v7);
  -[AFUIServiceDelegate _performBlockOnInternalQueueForUUID:block:](self, "_performBlockOnInternalQueueForUUID:block:", v7, v6);

}

- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AFUIServiceDelegate setPasswordsUIShowingForSessionId:](self, "setPasswordsUIShowingForSessionId:", 0);
  -[AFUIServiceDelegate _performBlockOnInternalQueueForUUID:block:](self, "_performBlockOnInternalQueueForUUID:block:", v7, v6);

}

- (void)_performBlockOnInternalQueueForUUID:(id)a3 block:(id)a4
{
  id v6;
  NSLock *lock;
  id v8;
  void *v9;
  NSObject *v10;
  dispatch_block_t block;

  v6 = a4;
  if (v6)
  {
    block = v6;
    lock = self->_lock;
    v8 = a3;
    -[NSLock lock](lock, "lock");
    -[AFUIServiceDelegate _sessionForUUID:](self, "_sessionForUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "internalQueue");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSLock unlock](self->_lock, "unlock");
    if (v10)
      dispatch_async(v10, block);

    v6 = block;
  }

}

- (void)_setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v4 = a3;
  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BE7ED90];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setCustomInfoType:", CFSTR("UIKBRTICustomInfoTypeAutofill"));
  v14[0] = CFSTR("selector");
  NSStringFromSelector(sel_handleEventFromRemoteSource_autoFillIsMenuPresented_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("isMenuPresented");
  v15[0] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomInfo:", v11);

  -[NSLock lock](self->_lock, "lock");
  -[AFUIServiceDelegate _sessionForUUID:](self, "_sessionForUUID:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_lock, "unlock");
  -[AFUIServiceDelegate _inputIdentifierForSession:](self, "_inputIdentifierForSession:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIServiceDelegate _sendOrQueueTextOperations:session:withInputIdentifier:](self, "_sendOrQueueTextOperations:session:withInputIdentifier:", v8, v12, v13);

}

- (void)setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__AFUIServiceDelegate_setIsMenuPresented_forSessionUUID___block_invoke;
  v8[3] = &unk_250856848;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[AFUIServiceDelegate _performBlockOnInternalQueueForUUID:block:](self, "_performBlockOnInternalQueueForUUID:block:", v7, v8);

}

uint64_t __57__AFUIServiceDelegate_setIsMenuPresented_forSessionUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setIsMenuPresented:forSessionUUID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)inputSystemService:(id)a3 inputSession:(id)a4 documentStateDidChange:(id)a5
{
  id v7;
  NSMutableDictionary *sessionPanels;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a5;
  sessionPanels = self->_sessionPanels;
  objc_msgSend(a4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sessionPanels, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__AFUIServiceDelegate_inputSystemService_inputSession_documentStateDidChange___block_invoke;
  v13[3] = &unk_250856DB0;
  v14 = v10;
  v15 = v7;
  v11 = v7;
  v12 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

uint64_t __78__AFUIServiceDelegate_inputSystemService_inputSession_documentStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "documentStateChanged:", *(_QWORD *)(a1 + 40));
}

- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5
{
  id v6;
  NSMutableDictionary *sessionPanels;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v6 = a4;
  sessionPanels = self->_sessionPanels;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sessionPanels, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AFUIServiceDelegateOSLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AFUIServiceDelegate inputSystemService:inputSessionDidPause:withReason:].cold.1();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__AFUIServiceDelegate_inputSystemService_inputSessionDidPause_withReason___block_invoke;
  block[3] = &unk_250856B30;
  v13 = v9;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __74__AFUIServiceDelegate_inputSystemService_inputSessionDidPause_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transientHide");
}

- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5
{
  id v6;
  NSMutableDictionary *sessionPanels;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v6 = a4;
  sessionPanels = self->_sessionPanels;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](sessionPanels, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  AFUIServiceDelegateOSLogFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AFUIServiceDelegate inputSystemService:inputSessionDidUnpause:withReason:].cold.1();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__AFUIServiceDelegate_inputSystemService_inputSessionDidUnpause_withReason___block_invoke;
  block[3] = &unk_250856B30;
  v13 = v9;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __76__AFUIServiceDelegate_inputSystemService_inputSessionDidUnpause_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transientUnhide");
}

uint64_t __77__AFUIServiceDelegate_inputSystemService_inputSession_performInputOperation___block_invoke(uint64_t a1)
{
  char *v2;
  void *v3;

  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector");
  v3 = *(void **)(a1 + 40);
  if (v2 == sel_dismissAutoFillPanel)
    return objc_msgSend(v3, "hide");
  else
    return objc_msgSend(v3, "dismissMenu");
}

- (id)_sessionForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AFUIServiceDelegate currentSessions](self, "currentSessions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setCurrentSessions:(id)a3
{
  objc_storeStrong((id *)&self->_currentSessions, a3);
}

- (void)setAuthenticatingForSessionId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setPasswordsUIShowingForSessionId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setContactsUIShowingForSessionId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (RTIDocumentTraits)authenticatingForDocumentTraits
{
  return (RTIDocumentTraits *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAuthenticatingForDocumentTraits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatingForDocumentTraits, 0);
  objc_storeStrong((id *)&self->_contactsUIShowingForSessionId, 0);
  objc_storeStrong((id *)&self->_passwordsUIShowingForSessionId, 0);
  objc_storeStrong((id *)&self->_authenticatingForSessionId, 0);
  objc_storeStrong((id *)&self->_currentSessions, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_trackedInputIdentifier, 0);
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_sessionPanels, 0);
}

- (void)_queueTextOperations:forSecureAppID:processID:completionHandler:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Cannot queue textOperations: secureAppID is empty"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_236DAD000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:]", v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_queueTextOperations:(uint64_t)a1 forSecureAppID:(uint64_t)a2 processID:completionHandler:.cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Queueing textOperations for session with appId: %@ (payloadID: %@)"), "-[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:]", a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v3, v4, "%@", v5);

}

void __61__AFUIServiceDelegate__scheduleExpirationOfQueuedOperations___block_invoke_cold_1(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s Queued operations are expiring unused for payloadID: %@"), "-[AFUIServiceDelegate _scheduleExpirationOfQueuedOperations:]_block_invoke", *a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v2, v3, "%@", v4);

  OUTLINED_FUNCTION_11();
}

- (void)_inputIdentifierForSession:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint8_t v10;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s Could not compute input identifier for session %@"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_236DAD000, v4, v5, "%@", v6, v7, v8, v9, (uint64_t)"-[AFUIServiceDelegate _inputIdentifierForSession:]", (uint64_t)v2, v10);

  OUTLINED_FUNCTION_3();
}

- (void)_inputIdentifierForSession:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint8_t v10;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s ContextID is null for session %@, identifying the input with processId and bundle identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8(&dword_236DAD000, v4, v5, "%@", v6, v7, v8, v9, (uint64_t)"-[AFUIServiceDelegate _inputIdentifierForSession:]", (uint64_t)v2, v10);

  OUTLINED_FUNCTION_3();
}

void __68__AFUIServiceDelegate__checkAndSendQueuedTextOperationsIfNecessary___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "secureAppID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s Found queued textOperations for session with appId: %@ (payloadID: %@)"), "-[AFUIServiceDelegate _checkAndSendQueuedTextOperationsIfNecessary:]_block_invoke", v3, v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)_sendTextOperations:(void *)a1 toSession:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "documentTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s sending textOperations for session %@ (appId: %@)"), "-[AFUIServiceDelegate _sendTextOperations:toSession:completionHandler:]", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_236DAD000, a2, v9, "%@", v10);

  OUTLINED_FUNCTION_10();
}

- (void)authenticationWillBeginForSessionUUID:(const char *)a1 completion:.cold.1(const char *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s %@"), "-[AFUIServiceDelegate authenticationWillBeginForSessionUUID:completion:]", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v4, v5, "%@", v6);

  OUTLINED_FUNCTION_3();
}

- (void)authenticationDidEndForSessionUUID:(const char *)a1 completion:.cold.1(const char *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s %@"), "-[AFUIServiceDelegate authenticationDidEndForSessionUUID:completion:]", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v4, v5, "%@", v6);

  OUTLINED_FUNCTION_3();
}

- (void)inputSystemService:(const char *)a1 inputSessionDidBegin:options:.cold.1(const char *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s %@ is for a process that should be ignored"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v4, v5, "%@", v6);

  OUTLINED_FUNCTION_3();
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a session being targeted by AutoFill which is authenticating %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a session being targeted by AutoFill which is in the Contact Picker UI %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a session being targeted by AutoFill which is in the Password Picker UI %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:(const char *)a1 inputSessionDidBegin:(void *)a2 options:(NSObject *)a3 .cold.5(const char *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "documentTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%s %@ not displaying the panel for session %@: autofillMode = %lu"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]", v6, v7, objc_msgSend(v8, "autofillMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_236DAD000, a3, v10, "%@", v11);

  OUTLINED_FUNCTION_10();
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.6()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ displaying the panel for session %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidBegin:options:.cold.7()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a new session %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidBegin:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:(const char *)a1 inputSessionDidEnd:options:.cold.1(const char *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s %@ is for a process that should be ignored"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v4, v5, "%@", v6);

  OUTLINED_FUNCTION_3();
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a session being targeted by AutoFill which is authenticating %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a session being targeted by AutoFill which is in the Contact Picker UI %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a session being targeted by AutoFill which is in the Password Picker UI %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidEnd:options:.cold.5()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a finished session %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidEnd:options:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidDie:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ is for a finished session %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidDie:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidPause:withReason:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ for session %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidPause:withReason:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:inputSessionDidUnpause:withReason:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ for session %@"), "-[AFUIServiceDelegate inputSystemService:inputSessionDidUnpause:withReason:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

- (void)inputSystemService:(const char *)a1 inputSession:performInputOperation:.cold.1(const char *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s %@ is for a process that should be ignored"), "-[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:]", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v4, v5, "%@", v6);

  OUTLINED_FUNCTION_3();
}

- (void)inputSystemService:inputSession:performInputOperation:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  SEL v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  OUTLINED_FUNCTION_5();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(v3);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7(), "uuid");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s %@ for session %@"), "-[AFUIServiceDelegate inputSystemService:inputSession:performInputOperation:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_236DAD000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_2();
}

@end
