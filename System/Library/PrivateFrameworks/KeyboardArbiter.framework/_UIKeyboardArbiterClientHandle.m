@implementation _UIKeyboardArbiterClientHandle

- (void)notifyIAVHeight:(double)a3
{
  NSObject *v6;
  void *v7;
  int v8;
  _UIKeyboardArbiterClientHandle *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _UIArbiterLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    v12 = 2048;
    v13 = a3;
    _os_log_debug_impl(&dword_21955F000, v6, OS_LOG_TYPE_DEBUG, "[%@] %@: %f", (uint8_t *)&v8, 0x20u);

  }
  if (self->_iavHeight != a3)
  {
    self->_iavHeight = a3;
    -[_UIKeyboardArbiter notifyHeightUpdated:](self->_owner, "notifyHeightUpdated:", self);
  }
}

+ (id)handlerWithArbiter:(id)a3 forConnection:(id)a4
{
  id v7;
  NSXPCConnection *v8;
  _UIKeyboardArbiterClientHandle *v9;
  uint64_t v10;
  NSMutableSet *hostedPids;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  __int128 *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *bundleIdentifier;
  void *v28;
  int v29;
  uint64_t v31;
  id v32;
  audit_token_t atoken;
  int v34;
  id v35;
  __int16 v36;
  _QWORD v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (NSXPCConnection *)a4;
  v9 = objc_alloc_init(_UIKeyboardArbiterClientHandle);
  objc_storeStrong((id *)&v9->_owner, a3);
  v9->_connection = v8;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = objc_claimAutoreleasedReturnValue();
  hostedPids = v9->_hostedPids;
  v9->_hostedPids = (NSMutableSet *)v10;

  v9->_running = 1;
  if (v8)
    -[NSXPCConnection auditToken](v8, "auditToken");
  else
    memset(&atoken, 0, sizeof(atoken));
  v12 = audit_token_to_pid(&atoken);
  if ((_DWORD)v12)
  {
    v13 = v12;
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v14, &v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v32;
    if (v16)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      _UIArbiterLog();
      v17 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      v34 = 138412802;
      v35 = a1;
      v36 = 1024;
      LODWORD(v37[0]) = v13;
      WORD2(v37[0]) = 2112;
      *(_QWORD *)((char *)v37 + 6) = v16;
      LODWORD(v31) = 28;
      v18 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v34, v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v38);
      objc_msgSend(v19, "errorWithMessage:", v20);

      if (v18 != &v38)
        free(v18);
    }
    else
    {
      objc_storeStrong((id *)&v9->_processHandle, v15);
      objc_msgSend(v15, "bundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v26 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = v9->_bundleIdentifier;
      v9->_bundleIdentifier = (NSString *)v26;

    }
  }
  else
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    _UIArbiterLog();
    v21 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    v34 = 138412546;
    v35 = a1;
    v36 = 2112;
    v37[0] = v8;
    LODWORD(v31) = 22;
    v22 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v34, v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v38);
    objc_msgSend(v23, "errorWithMessage:", v24);

    if (v22 != &v38)
      free(v22);
  }
  -[NSXPCConnection valueForEntitlement:](v8, "valueForEntitlement:", CFSTR("com.apple.KeyboardArbiter.client.debuginfo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  if (v29)
    v9->_hasDebugInformationEntitlement = 1;

  return v9;
}

- (RBSProcessHandle)processHandle
{
  return (RBSProcessHandle *)objc_getProperty(self, a2, 168, 1);
}

- (UIKBArbiterClientFocusContext)remoteFocusContext
{
  return (UIKBArbiterClientFocusContext *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isHostingPID:(int)a3
{
  NSMutableSet *hostedPids;
  void *v4;

  hostedPids = self->_hostedPids;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(hostedPids) = -[NSMutableSet containsObject:](hostedPids, "containsObject:", v4);

  return (char)hostedPids;
}

- (int)processIdentifier
{
  return -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
}

- (BOOL)inputUIHost
{
  return self->_inputUIHost;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)beginAcquiringFocusOnQueue:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  BSAbsoluteMachTimer *acquiringFocusTimer;
  BSAbsoluteMachTimer *v15;
  BSAbsoluteMachTimer *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  int v20;
  _UIKeyboardArbiterClientHandle *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  id location[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  *(_OWORD *)location = 0u;
  v27 = 0u;
  _UIArbiterLog();
  v6 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClientHandle remoteFocusContext](self, "remoteFocusContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 138412802;
  v21 = self;
  v22 = 2112;
  v23 = v7;
  v24 = 2112;
  v25 = v10;
  LODWORD(v17) = 32;
  v11 = (id *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v20, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", location);
  objc_msgSend(v12, "debugWithMessage:", v13);

  if (v11 != location)
    free(v11);
  self->_acquiringFocus = 1;
  objc_initWeak(location, self);
  acquiringFocusTimer = self->_acquiringFocusTimer;
  if (!acquiringFocusTimer)
  {
    v15 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BE38350]), "initWithIdentifier:", CFSTR("com.apple.KeyboardArbiter.AcquiringFocusTimer"));
    v16 = self->_acquiringFocusTimer;
    self->_acquiringFocusTimer = v15;

    acquiringFocusTimer = self->_acquiringFocusTimer;
  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __61___UIKeyboardArbiterClientHandle_beginAcquiringFocusOnQueue___block_invoke;
  v18[3] = &unk_24DAA0778;
  objc_copyWeak(&v19, location);
  v18[4] = self;
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](acquiringFocusTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", v5, v18, 5.0, 0.1);
  objc_destroyWeak(&v19);
  objc_destroyWeak(location);

}

- (void)setInputUIHost:(BOOL)a3
{
  self->_inputUIHost = a3;
}

- (void)setDeactivating:(BOOL)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  self->_deactivating = a3;
  if (!a3)
  {
    -[_UIKeyboardArbiterClientHandle pendingNotifyKeyboardChanged](self, "pendingNotifyKeyboardChanged");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIKeyboardArbiterClientHandle pendingNotifyKeyboardChanged](self, "pendingNotifyKeyboardChanged");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _UIKeyboardArbiterClientHandle *))v5)[2](v5, self);

      -[_UIKeyboardArbiterClientHandle setPendingNotifyKeyboardChanged:](self, "setPendingNotifyKeyboardChanged:", 0);
    }
  }
}

- (id)pendingNotifyKeyboardChanged
{
  return self->_pendingNotifyKeyboardChanged;
}

- (void)_deactivateScene
{
  BOOL v3;
  _UIKeyboardArbiterClientHandle *v4;
  void *v5;
  _UIKeyboardArbiterClientHandle *v6;
  _UIKeyboardArbiterClientHandle *v7;
  void *v8;
  int v9;
  _UIKeyboardArbiter *owner;

  v3 = -[_UIKeyboardArbiter deactivateHandle:](self->_owner, "deactivateHandle:", self);
  self->_active = v3;
  if (!v3)
  {
    -[_UIKeyboardArbiterClientHandle updateSuspensionCountForPids:active:](self, "updateSuspensionCountForPids:active:", self->_hostedPids, 0);
    -[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle");
    v4 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
    v5 = self;
    if (v4 != self)
    {
      v6 = v4;
      -[_UIKeyboardArbiter focusRequestedHandle](self->_owner, "focusRequestedHandle");
      v7 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
      if (v7 == self)
      {
        -[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "active");

        if (!v9)
        {
LABEL_8:
          -[_UIKeyboardArbiterClientHandle activeProcessResign](self, "activeProcessResign");
          return;
        }
        owner = self->_owner;
        -[_UIKeyboardArbiter activeInputDestinationHandle](owner, "activeInputDestinationHandle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyboardArbiter activateHandle:](owner, "activateHandle:", v5);
      }
      else
      {

        v5 = v6;
      }
    }

    goto LABEL_8;
  }
}

- (void)didDetachLayer
{
  BSServiceConnectionEndpointInjector *endpointGrantInjector;

  -[BSServiceConnectionEndpointInjector invalidate](self->_endpointGrantInjector, "invalidate");
  endpointGrantInjector = self->_endpointGrantInjector;
  self->_endpointGrantInjector = 0;

}

- (void)signalKeyboardChangeComplete
{
  NSObject *v4;
  void *v5;
  _OWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  _UIKeyboardArbiterClientHandle *v11;
  __int16 v12;
  void *v13;
  _OWORD v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  _UIArbiterLog();
  v4 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = self;
  v12 = 2112;
  v13 = v5;
  LODWORD(v9) = 22;
  v6 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v10, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v14);
  objc_msgSend(v7, "debugWithMessage:", v8);

  if (v6 != v14)
    free(v6);
  -[_UIKeyboardArbiter completeKeyboardStatusChangedFromHandler:](self->_owner, "completeKeyboardStatusChangedFromHandler:", self);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self->_running)
    v5 = &stru_24DAA0D08;
  else
    v5 = CFSTR(" (suspended)");
  v6 = CFSTR("YES");
  if (self->_active)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_wantedState)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_keyboardOnScreen)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (!self->_acquiringFocus)
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@ <%@>%@; hosting PIDs %@; level %f; active %@ [wants %@]; suppression %i; iav %f; on screen %@; isAcquiringFocus: %@>"),
               v4,
               self,
               self->_processHandle,
               self->_remoteFocusContext,
               v5,
               self->_hostedPids,
               *(_QWORD *)&self->_level,
               v7,
               v8,
               self->_suppressionCount,
               *(_QWORD *)&self->_iavHeight,
               v9,
               v6);
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)takeProcessAssertionOnRemoteWithQueue:(id)a3
{
  NSObject *v4;
  unint64_t remoteKeepAliveAssertionCount;
  uint64_t v6;
  id (*v7)(id, SEL, ...);
  pid_t v8;
  uint64_t v9;
  _UIKeyboardArbiterClientHandle *v10;
  NSObject *v11;
  __int128 *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  RBSAssertion *v17;
  RBSAssertion *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  RBSAssertion *v25;
  RBSAssertion *remoteKeepAliveAssertion;
  RBSAssertion *v27;
  _UIKeyboardArbiterClientHandle *v28;
  RBSAssertion *v29;
  int v30;
  id v31;
  id (*v32)(id, SEL, ...);
  unint64_t v33;
  NSObject *v34;
  __int128 *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  BOOL v44;
  NSObject *v45;
  __int128 *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  __int128 *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  unint64_t v54;
  __int128 *v55;
  void *v56;
  void *v57;
  dispatch_time_t v58;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD block[5];
  id v66;
  _QWORD v67[4];
  _UIKeyboardArbiterClientHandle *v68;
  _QWORD v69[4];
  id v70;
  int v71;
  _UIKeyboardArbiterClientHandle *v72;
  __int16 v73;
  unint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
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
  __int128 v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  remoteKeepAliveAssertionCount = self->_remoteKeepAliveAssertionCount;
  v6 = MEMORY[0x24BDAC760];
  self->_remoteKeepAliveAssertionCount = remoteKeepAliveAssertionCount + 1;
  v7 = objc_msgSend;
  if (remoteKeepAliveAssertionCount)
    goto LABEL_25;
  v8 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  if (v8 == getpid())
    goto LABEL_25;
  -[_UIKeyboardArbiterClientHandle description](self, "description");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (_UIKeyboardArbiterClientHandle *)v9;
  v64 = (void *)v9;
  if (takeProcessAssertionOnRemoteWithQueue____needsStaging != 1)
  {
    v21 = (void *)v9;
    objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.UIKit.KeyboardManagement.xpc"), CFSTR("Arbiter"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x24BE80B10]);
    v62 = (void *)v22;
    v75 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (RBSAssertion *)objc_msgSend(v23, "initWithExplanation:target:attributes:", CFSTR("com.apple.UIKit.KeyboardManagement.message"), v19, v24);
    remoteKeepAliveAssertion = self->_remoteKeepAliveAssertion;
    self->_remoteKeepAliveAssertion = v25;

    v27 = self->_remoteKeepAliveAssertion;
    v67[0] = v6;
    v67[1] = 3221225472;
    v67[2] = __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_480;
    v67[3] = &unk_24DAA07C8;
    v28 = v21;
    v68 = v28;
    -[RBSAssertion setInvalidationHandler:](v27, "setInvalidationHandler:", v67);
    v29 = self->_remoteKeepAliveAssertion;
    v66 = 0;
    v30 = -[RBSAssertion acquireWithError:](v29, "acquireWithError:", &v66);
    v31 = v66;
    v32 = objc_msgSend;
    v63 = v31;
    if (v30)
    {
LABEL_21:
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      _UIArbiterLog();
      v49 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
      v71 = *((_QWORD *)v32 + 503);
      v72 = v28;
      LODWORD(v60) = 12;
      v50 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v71, v60);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v76);
      objc_msgSend(v51, "debugWithMessage:", v52);

      if (v50 != &v76)
        free(v50);

      v7 = objc_msgSend;
      v20 = v64;
      goto LABEL_24;
    }
    v33 = (unint64_t)v31;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    _UIArbiterLog();
    v34 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    v71 = 138412546;
    v72 = v28;
    v73 = 2112;
    v74 = v33;
    LODWORD(v60) = 22;
    v35 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v71, v60);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v76);
    objc_msgSend(v36, "errorWithMessage:", v37);

    if (v35 != &v76)
      free(v35);
    objc_msgSend(v63, "domain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = *MEMORY[0x24BE80E58];
    if (objc_msgSend(v38, "isEqual:", *MEMORY[0x24BE80E58]))
    {
      v40 = objc_msgSend(v63, "code");

      v32 = objc_msgSend;
      if (v40 == 1)
      {
LABEL_18:
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        _UIArbiterLog();
        v45 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
        v71 = 138412290;
        v72 = v28;
        LODWORD(v61) = 12;
        v46 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v71, v61);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v76);
        objc_msgSend(v47, "errorWithMessage:", v48);

        if (v46 != &v76)
          free(v46);
        takeProcessAssertionOnRemoteWithQueue____needsStaging = 1;
        v6 = MEMORY[0x24BDAC760];
        goto LABEL_21;
      }
    }
    else
    {

      v32 = objc_msgSend;
    }
    objc_msgSend(v63, "domain");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isEqual:", v39) & 1) != 0)
    {
      objc_msgSend(v63, "localizedFailureReason");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isEqual:", CFSTR("Could not find plist for domain attribute"));

      if ((v43 & 1) != 0)
      {

        v44 = 0;
        goto LABEL_28;
      }
    }
    else
    {

    }
    goto LABEL_18;
  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  _UIArbiterLog();
  v11 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  v71 = 138412290;
  v72 = v10;
  LODWORD(v60) = 12;
  v12 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v71, v60);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v76);
  objc_msgSend(v13, "debugWithMessage:", v14);

  if (v12 != &v76)
    free(v12);
  v15 = objc_alloc(MEMORY[0x24BE08A10]);
  v16 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  v69[0] = v6;
  v69[1] = 3221225472;
  v69[2] = __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke;
  v69[3] = &unk_24DAA0310;
  v70 = v64;
  v17 = (RBSAssertion *)objc_msgSend(v15, "initWithPID:flags:reason:name:withHandler:", v16, 39, 4, CFSTR("com.apple.UIKit.KeyboardManagement.message"), v69);
  v18 = self->_remoteKeepAliveAssertion;
  self->_remoteKeepAliveAssertion = v17;

  v19 = v70;
  v20 = v64;
  v7 = objc_msgSend;
LABEL_24:

LABEL_25:
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  _UIArbiterLog();
  v53 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
  v54 = self->_remoteKeepAliveAssertionCount;
  v71 = *((_QWORD *)v7 + 505);
  v72 = self;
  v73 = 2048;
  v74 = v54;
  LODWORD(v60) = 22;
  v55 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v71, v60);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v76);
  objc_msgSend(v56, "debugWithMessage:", v57);

  if (v55 != &v76)
    free(v55);
  ++self->_remoteKeepAliveTimerCount;
  v58 = dispatch_time(0, 5000000000);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __72___UIKeyboardArbiterClientHandle_takeProcessAssertionOnRemoteWithQueue___block_invoke_484;
  block[3] = &unk_24DAA0130;
  block[4] = self;
  dispatch_after(v58, v4, block);
  v44 = 1;
LABEL_28:

  return v44;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isViewService
{
  return self->_isViewService;
}

- (BOOL)wantsFence
{
  return self->_wantsFence;
}

- (void)clearAcquiringFocus
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  _UIKeyboardArbiterClientHandle *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  _OWORD v19[32];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  memset(v19, 0, sizeof(v19));
  _UIArbiterLog();
  v4 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiterClientHandle remoteFocusContext](self, "remoteFocusContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 138412802;
  v14 = self;
  v15 = 2112;
  v16 = v5;
  v17 = 2112;
  v18 = v8;
  LODWORD(v12) = 32;
  v9 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v13, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v19);
  objc_msgSend(v10, "debugWithMessage:", v11);

  if (v9 != v19)
    free(v9);
  self->_acquiringFocus = 0;
  -[_UIKeyboardArbiterClientHandle setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:](self, "setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:", 0);
  -[BSAbsoluteMachTimer cancel](self->_acquiringFocusTimer, "cancel");
}

- (void)setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:(BOOL)a3
{
  self->_requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus = a3;
}

- (void)releaseProcessAssertion
{
  unint64_t v3;
  RBSAssertion *remoteKeepAliveAssertion;
  NSObject *v5;
  unint64_t remoteKeepAliveAssertionCount;
  _OWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  _UIKeyboardArbiterClientHandle *v12;
  __int16 v13;
  unint64_t v14;
  _OWORD v15[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_remoteKeepAliveAssertionCount - 1;
  self->_remoteKeepAliveAssertionCount = v3;
  if (!v3)
  {
    -[RBSAssertion invalidate](self->_remoteKeepAliveAssertion, "invalidate");
    remoteKeepAliveAssertion = self->_remoteKeepAliveAssertion;
    self->_remoteKeepAliveAssertion = 0;

  }
  memset(v15, 0, sizeof(v15));
  _UIArbiterLog();
  v5 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  remoteKeepAliveAssertionCount = self->_remoteKeepAliveAssertionCount;
  v11 = 138412546;
  v12 = self;
  v13 = 2048;
  v14 = remoteKeepAliveAssertionCount;
  LODWORD(v10) = 22;
  v7 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v11, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v15);
  objc_msgSend(v8, "debugWithMessage:", v9);

  if (v7 != v15)
    free(v7);
}

- (void)setWindowContextID:(unsigned int)a3 focusContext:(id)a4 windowState:(unint64_t)a5 withLevel:(double)a6
{
  uint64_t v8;
  id v11;
  NSObject *v12;
  FBSCAContextSceneLayer *v13;
  const __CFString *v14;
  __int128 *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  FBSCAContextSceneLayer *sceneLayer;
  NSObject *v21;
  FBSCAContextSceneLayer *v22;
  __int128 *v23;
  void *v24;
  void *v25;
  FBSCAContextSceneLayer *v26;
  FBSCAContextSceneLayer *v27;
  FBSCAContextSceneLayer *v28;
  NSObject *v29;
  FBSCAContextSceneLayer *v30;
  __int128 *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  FBSCAContextSceneLayer *v35;
  void *v36;
  void *v37;
  __int128 *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  int v44;
  _UIKeyboardArbiterClientHandle *v45;
  __int16 v46;
  FBSCAContextSceneLayer *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  double v55;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v8 = *(_QWORD *)&a3;
  v88 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  _UIArbiterLog();
  v12 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v13 = (FBSCAContextSceneLayer *)objc_claimAutoreleasedReturnValue();
  v44 = 138413570;
  v14 = CFSTR("YES");
  v45 = self;
  v46 = 2112;
  v47 = v13;
  if (!a5)
    v14 = CFSTR("NO");
  v48 = 2112;
  v49 = v11;
  v50 = 1024;
  v51 = v8;
  v52 = 2112;
  v53 = v14;
  v54 = 2048;
  v55 = a6;
  LODWORD(v41) = 58;
  v15 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v44, v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v56);
  objc_msgSend(v16, "debugWithMessage:", v17);

  if (v15 != &v56)
    free(v15);
  objc_msgSend(v11, "sceneIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_UIKeyboardArbiterClientHandle _shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:fromSelector:](self, "_shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:fromSelector:", v18, a2);

  if (!v19)
  {
    if (a5 == 2 && !-[_UIKeyboardArbiterClientHandle isKeyboardOnScreen](self, "isKeyboardOnScreen"))
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      _UIArbiterLog();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      NSStringFromSelector(a2);
      v35 = (FBSCAContextSceneLayer *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sceneIdentity");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412802;
      v45 = self;
      v46 = 2112;
      v47 = v35;
      v48 = 2112;
      v49 = v37;
      LODWORD(v42) = 32;
      v38 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v44, v42);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v56);
      objc_msgSend(v39, "errorWithMessage:", v40);

      if (v38 != &v56)
        free(v38);
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP") & 1) == 0)
      {
        sceneLayer = self->_sceneLayer;
        if (sceneLayer)
        {
          if (-[FBSCAContextSceneLayer contextID](sceneLayer, "contextID") != (_DWORD)v8)
          {
            if (self->_active)
              -[_UIKeyboardArbiterClientHandle _deactivateScene](self, "_deactivateScene");
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            _UIArbiterLog();
            v21 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
            v22 = self->_sceneLayer;
            v44 = 138412546;
            v45 = self;
            v46 = 2112;
            v47 = v22;
            LODWORD(v42) = 22;
            v23 = (__int128 *)_os_log_send_and_compose_impl();

            +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v44, v42);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v56);
            objc_msgSend(v24, "debugWithMessage:", v25);

            if (v23 != &v56)
              free(v23);
            v26 = self->_sceneLayer;
            self->_sceneLayer = 0;

          }
        }
      }
      self->_wantedState = a5;
      self->_level = a6;
      if ((objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP") & 1) == 0)
      {
        if ((_DWORD)v8)
        {
          if (!self->_sceneLayer)
          {
            if (self->_owner)
            {
              v27 = (FBSCAContextSceneLayer *)objc_msgSend(objc_alloc(MEMORY[0x24BE383F8]), "initWithCAContextID:level:", v8, 0.0);
              v28 = self->_sceneLayer;
              self->_sceneLayer = v27;

              v86 = 0u;
              v87 = 0u;
              v84 = 0u;
              v85 = 0u;
              v82 = 0u;
              v83 = 0u;
              v80 = 0u;
              v81 = 0u;
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              _UIArbiterLog();
              v29 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
              v30 = self->_sceneLayer;
              v44 = 138412546;
              v45 = self;
              v46 = 2112;
              v47 = v30;
              LODWORD(v42) = 22;
              v31 = (__int128 *)_os_log_send_and_compose_impl();

              +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v44, v42);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v56);
              objc_msgSend(v32, "debugWithMessage:", v33);

              if (v31 != &v56)
                free(v31);
            }
          }
        }
      }
      -[_UIKeyboardArbiterClientHandle _reevaluateRemoteFocusContext:](self, "_reevaluateRemoteFocusContext:", v11);
    }
  }
  objc_sync_exit(obj);

}

- (void)setClientFocusContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  _UIKeyboardArbiterClientHandle *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  _OWORD v22[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  memset(v22, 0, sizeof(v22));
  _UIArbiterLog();
  v6 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 138412802;
  v17 = self;
  v18 = 2112;
  v19 = v7;
  v20 = 2112;
  v21 = v9;
  LODWORD(v15) = 32;
  v10 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v16, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v22);
  objc_msgSend(v11, "debugWithMessage:", v12);

  if (v10 != v22)
    free(v10);
  objc_msgSend(v5, "sceneIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_UIKeyboardArbiterClientHandle _shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:fromSelector:](self, "_shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:fromSelector:", v13, a2);

  if (!v14)
  {
    -[_UIKeyboardArbiterClientHandle _reevaluateRemoteFocusContext:](self, "_reevaluateRemoteFocusContext:", v5);
    -[_UIKeyboardArbiter reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:](self->_owner, "reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:", 0);
  }

}

- (BOOL)_shouldRejectSceneIdentityUpdateCorrectingClientIfNeeded:(id)a3 fromSelector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  int v31;
  _UIKeyboardArbiterClientHandle *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_UIKeyboardArbiterClientHandle remoteFocusContext](self, "remoteFocusContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_UIKeyboardArbiterClientHandle isAcquiringFocus](self, "isAcquiringFocus");
  v10 = BSEqualObjects();
  -[_UIKeyboardArbiter omniscientDelegate](self->_owner, "omniscientDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || !v9 || (v6 != 0) != (v8 != 0) || v10)
  {

  }
  else
  {
    -[_UIKeyboardArbiterClientHandle bundleIdentifier](self, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.Spotlight"));

    if (!v14)
    {
      v15 = -[_UIKeyboardArbiterClientHandle requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus](self, "requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus");
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      _UIArbiterLog();
      v16 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      NSStringFromSelector(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v17;
      v35 = 2112;
      v36 = v18;
      LODWORD(v30) = 32;
      v19 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v31, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v37);
      objc_msgSend(v20, "errorWithMessage:", v21);

      if (v19 != &v37)
        free(v19);
      if (!v15)
        -[_UIKeyboardArbiter handlerRequestedForcedClientSceneIdentityUpdate:](self->_owner, "handlerRequestedForcedClientSceneIdentityUpdate:", self);
      v22 = 1;
      goto LABEL_17;
    }
  }
  if (v9)
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    _UIArbiterLog();
    v23 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    NSStringFromSelector(a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412802;
    v32 = self;
    v33 = 2112;
    v34 = v24;
    v35 = 2112;
    v36 = v25;
    LODWORD(v30) = 32;
    v26 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v31, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v37);
    objc_msgSend(v27, "debugWithMessage:", v28);

    if (v26 != &v37)
      free(v26);
    -[_UIKeyboardArbiterClientHandle clearAcquiringFocus](self, "clearAcquiringFocus");
  }
  v22 = 0;
LABEL_17:

  return v22;
}

- (BOOL)isAcquiringFocus
{
  return self->_acquiringFocus;
}

- (BOOL)requiresInputUIForAutofillUIOnly
{
  return self->_requiresInputUIForAutofillUIOnly;
}

- (BOOL)isHandlerShowableWithHandler:(id)a3
{
  _UIKeyboardArbiterClientHandle *v4;
  _UIKeyboardArbiterClientHandle *v5;
  uint64_t v6;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (_UIKeyboardArbiterClientHandle *)a3;
  v5 = v4;
  if (v4 && !self->_checkingShowability)
  {
    LOBYTE(v6) = 1;
    if (v4 != self)
    {
      self->_checkingShowability = 1;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = self->_hostedPids;
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v9 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v8);
            -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue", (_QWORD)v13));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isHandlerShowableWithHandler:", v5);

            if ((v12 & 1) != 0)
            {
              LOBYTE(v6) = 1;
              goto LABEL_16;
            }
          }
          v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_16:

      self->_checkingShowability = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)startArbitrationWithExpectedState:(id)a3 focusContext:(id)a4 hostingPIDs:(id)a5 usingFence:(BOOL)a6 withSuppression:(int)a7 onConnected:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  _OWORD *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v25;
  _UIKeyboardArbiterClientHandle *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  _OWORD v35[32];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  memset(v35, 0, sizeof(v35));
  _UIArbiterLog();
  v17 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 138413314;
  v26 = self;
  v27 = 2112;
  v28 = v18;
  v29 = 2112;
  v30 = v13;
  v31 = 2112;
  v32 = v14;
  v33 = 2112;
  v34 = v15;
  LODWORD(v22) = 52;
  v19 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v25, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v35);
  objc_msgSend(v20, "debugWithMessage:", v21);

  if (v19 != v35)
    free(v19);
  self->_suppressionCount = a7;
  self->_wantsFence = a6;
  objc_storeStrong((id *)&self->_remoteFocusContext, a4);
  self->_keyboardOnScreen = objc_msgSend(v13, "keyboardOnScreen");
  self->_multipleScenes = objc_msgSend(v13, "multipleScenes");
  if (v15)
    -[_UIKeyboardArbiterClientHandle addHostedPids:](self, "addHostedPids:", v15);
  -[_UIKeyboardArbiter newClientConnected:withExpectedState:onConnected:](self->_owner, "newClientConnected:withExpectedState:onConnected:", self, v13, v16);
  if (self->_active)
    -[_UIKeyboardArbiterClientHandle updateSuspensionCountForPids:active:](self, "updateSuspensionCountForPids:active:", self->_hostedPids, 1);

}

- (void)addHostedPids:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _UIKeyboardArbiter *owner;
  uint64_t childrenSuppressionCount;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableSet addObjectsFromArray:](self->_hostedPids, "addObjectsFromArray:", v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_hostedPids;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "intValue", (_QWORD)v14));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setIsViewService:", 1);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  owner = self->_owner;
  childrenSuppressionCount = self->_childrenSuppressionCount;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiter setSuppressionCount:ofPIDs:](owner, "setSuppressionCount:ofPIDs:", childrenSuppressionCount, v13);

}

- (void)_reevaluateRemoteFocusContext:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_storeStrong((id *)&self->_remoteFocusContext, a3);
  if ((objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP") & 1) != 0 || self->_sceneLayer)
    -[_UIKeyboardArbiterClientHandle checkActivation:](self, "checkActivation:", self->_wantedState);
  -[_UIKeyboardArbiter reevaluateSceneClientSettings](self->_owner, "reevaluateSceneClientSettings");
  -[_UIKeyboardArbiter updateKeyboardSceneSettings](self->_owner, "updateKeyboardSceneSettings");
  objc_sync_exit(v5);

}

- (BOOL)active
{
  return self->_active;
}

- (double)level
{
  return self->_level;
}

- (void)checkActivation:(unint64_t)a3
{
  int v5;
  _UIKeyboardArbiter *owner;
  _UIKeyboardArbiterClientHandle *v7;
  BOOL v8;
  _UIKeyboardArbiterClientHandle *v9;
  BOOL v10;
  _BOOL4 v11;

  v5 = objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP");
  owner = self->_owner;
  if (v5)
  {
    -[_UIKeyboardArbiter lastActivatedHandle](owner, "lastActivatedHandle");
    v7 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != self;
  }
  else
  {
    -[_UIKeyboardArbiter sceneLayer](owner, "sceneLayer");
    v7 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClientHandle sceneLayer](self, "sceneLayer");
    v9 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != v9;

  }
  if (self->_active)
  {
    v10 = a3 == 1 && v8;
    if (a3 != 2 && !v10)
    {
      if (!a3)
        -[_UIKeyboardArbiterClientHandle _deactivateScene](self, "_deactivateScene");
      return;
    }
  }
  else if (a3 - 1 > 1)
  {
    return;
  }
  v11 = -[_UIKeyboardArbiter activateHandle:](self->_owner, "activateHandle:", self);
  self->_active = v11;
  if (v11)
    -[_UIKeyboardArbiterClientHandle updateSuspensionCountForPids:active:](self, "updateSuspensionCountForPids:active:", self->_hostedPids, 1);
}

- (FBSCAContextSceneLayer)sceneLayer
{
  return (FBSCAContextSceneLayer *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)wantedState
{
  return self->_wantedState;
}

- (BOOL)multipleScenes
{
  return self->_multipleScenes;
}

- (void)didAttachLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BSServiceConnectionEndpointInjector *v12;
  BSServiceConnectionEndpointInjector *endpointGrantInjector;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[16];

  if (!self->_sceneLayer)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyboardArbiter.m"), 2353, CFSTR("Layer must exist for us to attach visibility to."));

  }
  if (self->_endpointGrantInjector)
  {
    -[_UIKeyboardArbiterClientHandle didDetachLayer](self, "didDetachLayer");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21955F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Keyboard attaching layer before removing prior layer...", buf, 2u);
    }
  }
  objc_msgSend(MEMORY[0x24BE384C8], "identityForIdentifier:", CFSTR("com.apple.UIKit.remote-keyboard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getFBSceneManagerClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newSceneIdentityTokenForIdentity:", v3);

  objc_msgSend(v5, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UISVisibilityEnvironmentForSceneIdentityTokenString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBSCAContextSceneLayer contextID](self->_sceneLayer, "contextID");
  _UISVisibilityEnvironmentForUIHostedWindowContextID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE383C0];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48___UIKeyboardArbiterClientHandle_didAttachLayer__block_invoke;
  v16[3] = &unk_24DAA07A0;
  v16[4] = self;
  v17 = v8;
  v18 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "injectorWithConfigurator:", v16);
  v12 = (BSServiceConnectionEndpointInjector *)objc_claimAutoreleasedReturnValue();
  endpointGrantInjector = self->_endpointGrantInjector;
  self->_endpointGrantInjector = v12;

}

- (void)updateSuspensionCountForPids:(id)a3 active:(BOOL)a4
{
  int suppressionCount;
  int childrenSuppressionCount;
  int v6;
  _BOOL8 v7;
  unsigned int v10;
  int v11;

  suppressionCount = self->_suppressionCount;
  childrenSuppressionCount = self->_childrenSuppressionCount;
  v6 = suppressionCount - childrenSuppressionCount;
  if (suppressionCount != childrenSuppressionCount)
  {
    v7 = a4;
    self->_childrenSuppressionCount = suppressionCount;
    if (v6 >= 0)
      v10 = suppressionCount - childrenSuppressionCount;
    else
      v10 = childrenSuppressionCount - suppressionCount;
    if (v10 <= 1)
      v11 = 1;
    else
      v11 = v10;
    do
    {
      -[_UIKeyboardArbiter updateSuppression:ofPIDs:active:](self->_owner, "updateSuppression:ofPIDs:active:", v6 > 0, a3, v7);
      --v11;
    }
    while (v11);
  }
}

- (BOOL)isKeyboardOnScreen
{
  _UIKeyboardArbiterClientHandle *v3;
  void *v4;

  if (self->_keyboardOnScreen)
    return 1;
  v3 = self;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[_UIKeyboardArbiterClientHandle _isKeyboardOnScreen:](v3, "_isKeyboardOnScreen:", v4);

  return (char)v3;
}

- (void)activeProcessResign
{
  uint64_t hostedPids;
  _UIKeyboardArbiterClientHandle *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", -[_UIKeyboardArbiterClientHandle prevActiveIdentifier](self, "prevActiveIdentifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle");
  hostedPids = objc_claimAutoreleasedReturnValue();
  if (hostedPids)
  {
    -[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle");
    v4 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();

    if (v4 == self)
    {
      LODWORD(hostedPids) = 0;
    }
    else
    {
      hostedPids = (uint64_t)self->_hostedPids;
      v5 = (void *)MEMORY[0x24BDD16E0];
      -[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(hostedPids) = objc_msgSend((id)hostedPids, "containsObject:", v7);

      LODWORD(hostedPids) = hostedPids ^ 1;
    }
  }
  if (objc_msgSend(v8, "running")
    && ((objc_msgSend(v8, "isKeyboardOnScreen") ^ 1 | hostedPids) & 1) == 0
    && (objc_msgSend(v8, "inputUIHost") & 1) == 0)
  {
    -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self->_owner, "runOperations:onHandler:fromFunction:", &__block_literal_global_452, v8, "-[_UIKeyboardArbiterClientHandle activeProcessResign]");
  }

}

- (int)prevActiveIdentifier
{
  return self->_prevActiveIdentifier;
}

- (void)signalKeyboardChanged:(id)a3 onCompletion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  _UIKeyboardArbiterClientHandle *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  _OWORD v21[32];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  memset(v21, 0, sizeof(v21));
  _UIArbiterLog();
  v9 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 138412802;
  v16 = self;
  v17 = 2112;
  v18 = v10;
  v19 = 2112;
  v20 = v7;
  LODWORD(v14) = 32;
  v11 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v15, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v21);
  objc_msgSend(v12, "debugWithMessage:", v13);

  if (v11 != v21)
    free(v11);
  self->_keyboardOnScreen = objc_msgSend(v7, "keyboardOnScreen");
  self->_multipleScenes = objc_msgSend(v7, "multipleScenes");
  -[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:](self->_owner, "updateKeyboardStatus:fromHandler:", v7, self);
  if (v8)
    v8[2](v8);

}

- (void)signalAutofillUIBringupWithCompletion:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x24BEBD6C8], "usesInputSystemUIForAutoFillOnly"))
  {
    -[_UIKeyboardArbiterClientHandle setRequiresInputUIForAutofillUIOnly:](self, "setRequiresInputUIForAutofillUIOnly:", 1);
    -[_UIKeyboardArbiter reevaluateSceneClientSettings](self->_owner, "reevaluateSceneClientSettings");
    if (v4)
      v4[2]();
  }

}

- (void)setRequiresInputUIForAutofillUIOnly:(BOOL)a3
{
  self->_requiresInputUIForAutofillUIOnly = a3;
}

- (BOOL)deactivating
{
  return self->_deactivating;
}

- (void)dealloc
{
  NSObject *v3;
  _OWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;
  int v9;
  _UIKeyboardArbiterClientHandle *v10;
  _OWORD v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!self->_invalidated)
  {
    memset(v11, 0, sizeof(v11));
    _UIArbiterLog();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    v9 = 138412290;
    v10 = self;
    LODWORD(v7) = 12;
    v4 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v9, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v11);
    objc_msgSend(v5, "errorWithMessage:", v6);

    if (v4 != v11)
      free(v4);
    -[_UIKeyboardArbiter handleUnexpectedDeallocForHandler:](self->_owner, "handleUnexpectedDeallocForHandler:", self);
  }
  if (self->_endpointGrantInjector)
    -[_UIKeyboardArbiterClientHandle didDetachLayer](self, "didDetachLayer");
  -[BSAbsoluteMachTimer invalidate](self->_acquiringFocusTimer, "invalidate");
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardArbiterClientHandle;
  -[_UIKeyboardArbiterClientHandle dealloc](&v8, sel_dealloc);
}

- (void)startArbitrationWithExpectedState:(id)a3 hostingPIDs:(id)a4 usingFence:(BOOL)a5 withSuppression:(int)a6 onConnected:(id)a7
{
  -[_UIKeyboardArbiterClientHandle startArbitrationWithExpectedState:focusContext:hostingPIDs:usingFence:withSuppression:onConnected:](self, "startArbitrationWithExpectedState:focusContext:hostingPIDs:usingFence:withSuppression:onConnected:", a3, 0, a4, a5, *(_QWORD *)&a6, a7);
}

- (BOOL)_isKeyboardOnScreen:(id)a3
{
  id v4;
  BOOL v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "containsObject:", self) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "addObject:", self);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_hostedPids;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "intValue", (_QWORD)v14));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "_isKeyboardOnScreen:", v4);

          if ((v12 & 1) != 0)
          {
            v5 = 1;
            goto LABEL_13;
          }
        }
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_13:

  }
  return v5;
}

- (void)setWantsFencing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _OWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[22];
  __int16 v15;
  const __CFString *v16;
  _OWORD v17[32];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  memset(v17, 0, sizeof(v17));
  _UIArbiterLog();
  v6 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("NO");
  *(_DWORD *)v14 = 138412802;
  *(_QWORD *)&v14[4] = self;
  *(_WORD *)&v14[12] = 2112;
  if (v3)
    v9 = CFSTR("YES");
  *(_QWORD *)&v14[14] = v7;
  v15 = 2112;
  v16 = v9;
  LODWORD(v13) = 32;
  v10 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v14, v13, *(_OWORD *)v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v17);
  objc_msgSend(v11, "debugWithMessage:", v12);

  if (v10 != v17)
    free(v10);
  self->_wantsFence = v3;
}

- (void)signalKeyboardUIDidChange:(id)a3 onCompletion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  _UIKeyboardArbiterClientHandle *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  _OWORD v25[32];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (+[_UIKeyboardArbiter unitTestEnvironment](_UIKeyboardArbiter, "unitTestEnvironment"))
  {
    -[_UIKeyboardArbiter setKeyboardUIHandle:](self->_owner, "setKeyboardUIHandle:", self);
    -[_UIKeyboardArbiterClientHandle setInputUIHost:](self, "setInputUIHost:", 1);
  }
  if ((objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP") & 1) != 0)
  {
    memset(v25, 0, sizeof(v25));
    _UIArbiterLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = self;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v7;
    LODWORD(v18) = 32;
    v11 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v19, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v25);
    objc_msgSend(v12, "debugWithMessage:", v13);

    if (v11 != v25)
      free(v11);
    self->_keyboardOnScreen = objc_msgSend(v7, "keyboardOnScreen");
    -[_UIKeyboardArbiter setKeyboardScenePresentationMode:](self->_owner, "setKeyboardScenePresentationMode:", objc_msgSend(v7, "keyboardScenePresentationMode"));
    -[_UIKeyboardArbiter updateKeyboardUIStatus:fromHandler:](self->_owner, "updateKeyboardUIStatus:fromHandler:", v7, self);
    -[_UIKeyboardArbiter sceneDelegate](self->_owner, "sceneDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[_UIKeyboardArbiter sceneDelegate](self->_owner, "sceneDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardArbiter focusContext](self->_owner, "focusContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "focusContext:didChangeKeyboardScenePresentationMode:", v17, -[_UIKeyboardArbiter keyboardScenePresentationMode](self->_owner, "keyboardScenePresentationMode"));

    }
  }
  if (v8)
    v8[2](v8);

}

- (void)signalKeyboardClientChanged:(id)a3 onCompletion:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  _UIKeyboardArbiterClientHandle *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  _OWORD v21[32];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  memset(v21, 0, sizeof(v21));
  _UIArbiterLog();
  v9 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 138412802;
  v16 = self;
  v17 = 2112;
  v18 = v10;
  v19 = 2112;
  v20 = v7;
  LODWORD(v14) = 32;
  v11 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v15, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v21);
  objc_msgSend(v12, "debugWithMessage:", v13);

  if (v11 != v21)
    free(v11);
  self->_keyboardOnScreen = objc_msgSend(v7, "keyboardOnScreen");
  self->_multipleScenes = objc_msgSend(v7, "multipleScenes");
  -[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:](self->_owner, "updateKeyboardStatus:fromHandler:", v7, self);
  if (v8)
    v8[2](v8);

}

- (void)setWindowHostingPID:(int)a3 active:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _OWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _UIKeyboardArbiter *owner;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  _UIKeyboardArbiterClientHandle *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  _OWORD v36[32];
  uint64_t v37;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x24BDAC8D0];
  memset(v36, 0, sizeof(v36));
  _UIArbiterLog();
  v8 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("NO");
  v28 = 138413058;
  v29 = self;
  v30 = 2112;
  if (v4)
    v11 = CFSTR("YES");
  v31 = v9;
  v32 = 1024;
  v33 = v5;
  v34 = 2112;
  v35 = v11;
  LODWORD(v26) = 38;
  v12 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v28, v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v36);
  objc_msgSend(v13, "debugWithMessage:", v14);

  if (v12 != v36)
    free(v12);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v4)
  {
    if (v15 && (-[NSMutableSet containsObject:](self->_hostedPids, "containsObject:", v15) & 1) == 0)
    {
      v27 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardArbiterClientHandle addHostedPids:](self, "addHostedPids:", v17);

      -[_UIKeyboardArbiter reevaluateSceneClientSettings](self->_owner, "reevaluateSceneClientSettings");
      if (self->_active)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyboardArbiterClientHandle updateSuspensionCountForPids:active:](self, "updateSuspensionCountForPids:active:", v18, self->_active);

      }
      -[_UIKeyboardArbiter notifyHeightUpdated:](self->_owner, "notifyHeightUpdated:", self);
    }
  }
  else if (-[NSMutableSet containsObject:](self->_hostedPids, "containsObject:", v15))
  {
    -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "notifyIAVHeight:", 0.0);

    -[NSMutableSet removeObject:](self->_hostedPids, "removeObject:", v16);
    if (self->_active)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardArbiterClientHandle updateSuspensionCountForPids:active:](self, "updateSuspensionCountForPids:active:", v20, self->_active);

    }
    -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 == v22)
    {
      v23 = objc_msgSend(v21, "prevActiveIdentifier");

      if (v23)
      {
        objc_msgSend(v21, "activeProcessResign");
        objc_msgSend(v21, "setPrevActiveIdentifier:", 0);
      }
    }
    else
    {

    }
    -[_UIKeyboardArbiter notifyHeightUpdated:](self->_owner, "notifyHeightUpdated:", self);
    owner = self->_owner;
    -[_UIKeyboardArbiter handlerForPID:](owner, "handlerForPID:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiter notifyHeightUpdated:](owner, "notifyHeightUpdated:", v25);

  }
  -[_UIKeyboardArbiter checkHostingState](self->_owner, "checkHostingState");

}

- (void)notifyHostedPIDsOfSuppression:(BOOL)a3
{
  -[_UIKeyboardArbiterClientHandle notifyHostedPIDsOfSuppression:active:](self, "notifyHostedPIDsOfSuppression:active:", a3, self->_active);
}

- (void)notifyHostedPIDsOfSuppression:(BOOL)a3 active:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _OWORD *v12;
  void *v13;
  void *v14;
  int suppressionCount;
  uint64_t v16;
  _BYTE v17[22];
  __int16 v18;
  const __CFString *v19;
  _OWORD v20[32];
  uint64_t v21;

  v4 = a4;
  v5 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  memset(v20, 0, sizeof(v20));
  _UIArbiterLog();
  v8 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("NO");
  *(_DWORD *)v17 = 138412802;
  *(_QWORD *)&v17[4] = self;
  *(_WORD *)&v17[12] = 2112;
  if (v5)
    v11 = CFSTR("YES");
  *(_QWORD *)&v17[14] = v9;
  v18 = 2112;
  v19 = v11;
  LODWORD(v16) = 32;
  v12 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v17, v16, *(_OWORD *)v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v20);
  objc_msgSend(v13, "debugWithMessage:", v14);

  if (v12 != v20)
    free(v12);
  suppressionCount = self->_suppressionCount;
  if (v5)
  {
    self->_suppressionCount = suppressionCount + 1;
    if (!v4)
      return;
  }
  else
  {
    self->_suppressionCount = --suppressionCount;
    if (!v4)
      return;
  }
  if (!suppressionCount)
    -[_UIKeyboardArbiterClientHandle updateSuspensionCountForPids:active:](self, "updateSuspensionCountForPids:active:", self->_hostedPids, 1);
}

- (void)transition:(id)a3 eventStage:(unint64_t)a4 withInfo:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _OWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  _UIKeyboardArbiterClientHandle *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  _OWORD v27[32];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  memset(v27, 0, sizeof(v27));
  _UIArbiterLog();
  v11 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 138413314;
  v18 = self;
  v19 = 2112;
  v20 = v12;
  v21 = 2112;
  v22 = v9;
  v23 = 1024;
  v24 = a4;
  v25 = 2112;
  v26 = v10;
  LODWORD(v16) = 48;
  v13 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v17, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v27);
  objc_msgSend(v14, "debugWithMessage:", v15);

  if (v13 != v27)
    free(v13);
  -[_UIKeyboardArbiter transition:eventStage:withInfo:fromHandler:](self->_owner, "transition:eventStage:withInfo:fromHandler:", v9, a4, v10, self);

}

- (void)retrieveDebugInformation:(id)a3
{
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;
  __int128 *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _UIKeyboardArbiterClientHandle *v19;
  __int16 v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, void *))a3;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  _UIArbiterLog();
  v6 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 138412546;
  v19 = self;
  v20 = 2112;
  v21 = v7;
  LODWORD(v16) = 22;
  v8 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v18, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v22);
  objc_msgSend(v9, "debugWithMessage:", v10);

  if (v8 != &v22)
    free(v8);
  if (-[_UIKeyboardArbiterClientHandle hasDebugInformationEntitlement](self, "hasDebugInformationEntitlement"))
  {
    if (v5)
    {
      -[_UIKeyboardArbiter description](self->_owner, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v11);

    }
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    _UIArbiterLog();
    v12 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    v18 = 138412290;
    v19 = self;
    LODWORD(v17) = 12;
    v13 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v18, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v22);
    objc_msgSend(v14, "errorWithMessage:", v15);

    if (v13 != &v22)
      free(v13);
    v5[2](v5, 0);
  }

}

- (void)retrieveMoreDebugInformationWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  void *v7;
  __int128 *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _UIKeyboardArbiterClientHandle *v18;
  __int16 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a3;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  _UIArbiterLog();
  v6 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 138412546;
  v18 = self;
  v19 = 2112;
  v20 = v7;
  LODWORD(v15) = 22;
  v8 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v17, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v21);
  objc_msgSend(v9, "debugWithMessage:", v10);

  if (v8 != &v21)
    free(v8);
  if (-[_UIKeyboardArbiterClientHandle hasDebugInformationEntitlement](self, "hasDebugInformationEntitlement"))
  {
    -[_UIKeyboardArbiter retrieveDebugInformationWithCompletion:](self->_owner, "retrieveDebugInformationWithCompletion:", v5);
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    _UIArbiterLog();
    v11 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    v17 = 138412290;
    v18 = self;
    LODWORD(v16) = 12;
    v12 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v17, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v21);
    objc_msgSend(v13, "errorWithMessage:", v14);

    if (v12 != &v21)
      free(v12);
    v5[2](v5, 0);
  }

}

- (id)sceneDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  -[UIKBArbiterClientFocusContext sceneIdentity](self->_remoteFocusContext, "sceneIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<pid: %d; scene: %@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)cacheWindowContext
{
  void *v3;
  UIKBArbiterClientFocusContext *remoteFocusContext;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *cachedContext;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  if (-[_UIKeyboardArbiterClientHandle active](self, "active"))
  {
    if (self->_wantedState)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[FBSCAContextSceneLayer contextID](self->_sceneLayer, "contextID"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v3;
      remoteFocusContext = self->_remoteFocusContext;
      v5 = remoteFocusContext;
      if (!remoteFocusContext)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null", v9[0]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_level, v9[0], v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      cachedContext = self->_cachedContext;
      self->_cachedContext = v7;

      if (!remoteFocusContext)
    }
    -[_UIKeyboardArbiterClientHandle setWindowContextID:focusContext:windowState:withLevel:](self, "setWindowContextID:focusContext:windowState:withLevel:", 0, 0, 0, 0.0);
  }
}

- (void)uncacheWindowContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  NSArray *cachedContext;

  if (self->_cachedContext)
  {
    if (!-[_UIKeyboardArbiterClientHandle active](self, "active"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_cachedContext, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "intValue");
      -[NSArray objectAtIndexedSubscript:](self->_cachedContext, "objectAtIndexedSubscript:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        -[NSArray objectAtIndexedSubscript:](self->_cachedContext, "objectAtIndexedSubscript:", 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      -[NSArray objectAtIndexedSubscript:](self->_cachedContext, "objectAtIndexedSubscript:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardArbiterClientHandle setWindowContextID:focusContext:windowState:withLevel:](self, "setWindowContextID:focusContext:windowState:withLevel:", v4, v7, 1, (double)(int)objc_msgSend(v8, "intValue"));

      if ((isKindOfClass & 1) != 0)
    }
    cachedContext = self->_cachedContext;
    self->_cachedContext = 0;

  }
}

- (void)invalidate
{
  NSObject *v4;
  void *v5;
  _OWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIKeyboardArbiter *owner;
  id v11;
  _UIKeyboardArbiter *v12;
  UIKBArbiterClientFocusContext *remoteFocusContext;
  NSString *bundleIdentifier;
  RBSAssertion *remoteKeepAliveAssertion;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  int v19;
  _UIKeyboardArbiterClientHandle *v20;
  __int16 v21;
  void *v22;
  _OWORD v23[32];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  memset(v23, 0, sizeof(v23));
  _UIArbiterLog();
  v4 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 138412546;
  v20 = self;
  v21 = 2112;
  v22 = v5;
  LODWORD(v16) = 22;
  v6 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v19, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v23);
  objc_msgSend(v7, "debugWithMessage:", v8);

  if (v6 != v23)
    free(v6);
  -[_UIKeyboardArbiterClientHandle description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  owner = self->_owner;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __44___UIKeyboardArbiterClientHandle_invalidate__block_invoke;
  v17[3] = &unk_24DAA07F0;
  v18 = v9;
  v11 = v9;
  -[_UIKeyboardArbiter setKeyboardTotalDisable:withFence:fromHandler:completionHandler:](owner, "setKeyboardTotalDisable:withFence:fromHandler:completionHandler:", 0, 0, self, v17);
  self->_iavHeight = 0.0;
  self->_keyboardOnScreen = 0;
  -[_UIKeyboardArbiter notifyHeightUpdated:](self->_owner, "notifyHeightUpdated:", self);
  -[_UIKeyboardArbiterClientHandle setWindowContextID:focusContext:windowState:withLevel:](self, "setWindowContextID:focusContext:windowState:withLevel:", 0, 0, 0, 0.0);
  v12 = self->_owner;
  self->_owner = 0;

  self->_connection = 0;
  remoteFocusContext = self->_remoteFocusContext;
  self->_remoteFocusContext = 0;

  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = 0;

  -[RBSAssertion invalidate](self->_remoteKeepAliveAssertion, "invalidate");
  remoteKeepAliveAssertion = self->_remoteKeepAliveAssertion;
  self->_remoteKeepAliveAssertion = 0;

  self->_invalidated = 1;
}

- (void)applicationShouldFocusWithBundle:(id)a3 onCompletion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  BOOL v10;
  _UIKeyboardArbiterClientHandle *v11;
  _UIKeyboardArbiterClientHandle *v12;
  NSObject *v13;
  void *v14;
  __int128 *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _UIKeyboardArbiterClientHandle *v20;
  uint64_t v21;
  _UIKeyboardArbiter *owner;
  NSObject *v23;
  __int128 *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  _UIKeyboardArbiterClientHandle *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  _UIKeyboardArbiterClientHandle *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  if (!v7)
    goto LABEL_6;
  -[_UIKeyboardArbiterClientHandle bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v7))
  {

    goto LABEL_5;
  }
  v10 = -[_UIKeyboardArbiterClientHandle hasDebugInformationEntitlement](self, "hasDebugInformationEntitlement");

  if (v10)
  {
LABEL_5:
    if ((objc_msgSend(v7, "isEqualToString:", &stru_24DAA0D08) & 1) == 0)
    {
      -[_UIKeyboardArbiter handlerForBundleID:](self->_owner, "handlerForBundleID:", v7);
      v11 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v12 = v11;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      _UIArbiterLog();
      v13 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413058;
      v29 = self;
      v30 = 2112;
      v31 = v14;
      v32 = 2112;
      v33 = v7;
      v34 = 2114;
      v35 = v12;
      LODWORD(v27) = 42;
      v15 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v28, v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v36);
      objc_msgSend(v16, "debugWithMessage:", v17);

      if (v15 != &v36)
        free(v15);
      if (v12
        && ((-[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle"),
             (v18 = objc_claimAutoreleasedReturnValue()) == 0)
         || (v19 = (void *)v18,
             -[_UIKeyboardArbiter activeInputDestinationHandle](self->_owner, "activeInputDestinationHandle"),
             v20 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue(),
             v20,
             v19,
             v12 == v20)))
      {
        owner = self->_owner;
        v21 = 1;
        -[_UIKeyboardArbiter handlerRequestedFocus:shouldStealKeyboard:](owner, "handlerRequestedFocus:shouldStealKeyboard:", v12, 1);
        if (!v8)
          goto LABEL_15;
      }
      else
      {
        v21 = 0;
        if (!v8)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
      v8[2](v8, v21);
      goto LABEL_15;
    }
LABEL_6:
    v11 = self;
    goto LABEL_8;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  _UIArbiterLog();
  v23 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
  v28 = 138412546;
  v29 = self;
  v30 = 2112;
  v31 = v7;
  LODWORD(v27) = 22;
  v24 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v28, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v36);
  objc_msgSend(v25, "errorWithMessage:", v26);

  if (v24 != &v36)
    free(v24);
  v8[2](v8, 0);
LABEL_16:

}

- (void)focusApplicationWithProcessIdentifier:(int)a3 context:(id)a4 onCompletion:(id)a5
{
  -[_UIKeyboardArbiterClientHandle focusApplicationWithProcessIdentifier:context:stealingKeyboard:onCompletion:](self, "focusApplicationWithProcessIdentifier:context:stealingKeyboard:onCompletion:", *(_QWORD *)&a3, a4, 1, a5);
}

- (void)focusApplicationWithProcessIdentifier:(int)a3 context:(id)a4 stealingKeyboard:(BOOL)a5 onCompletion:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v11;
  void (**v12)(id, BOOL);
  int v13;
  void *v14;
  _UIKeyboardArbiterClientHandle *v15;
  _UIKeyboardArbiterClientHandle *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  __int128 *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  __int128 *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _BYTE v33[22];
  __int16 v34;
  id v35;
  __int16 v36;
  _UIKeyboardArbiterClientHandle *v37;
  __int16 v38;
  const __CFString *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v72 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = (void (**)(id, BOOL))a6;
  if (-[_UIKeyboardArbiterClientHandle processIdentifier](self, "processIdentifier") == (_DWORD)v8
    || (v13 = -[_UIKeyboardArbiterClientHandle processIdentifier](self, "processIdentifier"), v13 == getpid())
    || -[_UIKeyboardArbiterClientHandle hasDebugInformationEntitlement](self, "hasDebugInformationEntitlement"))
  {
    objc_msgSend(v11, "sceneIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[_UIKeyboardArbiter handlerForPID:](self->_owner, "handlerForPID:", v8);
      v15 = (_UIKeyboardArbiterClientHandle *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = self;
    }
    v16 = v15;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    _UIArbiterLog();
    v17 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    NSStringFromSelector(a2);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    *(_DWORD *)v33 = 138544386;
    v20 = CFSTR("NO");
    *(_QWORD *)&v33[4] = self;
    if (v7)
      v20 = CFSTR("YES");
    *(_WORD *)&v33[12] = 2114;
    *(_QWORD *)&v33[14] = v18;
    v34 = 2114;
    v35 = v11;
    v36 = 2114;
    v37 = v16;
    v38 = 2114;
    v39 = v20;
    LODWORD(v32) = 52;
    v21 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v33, v32, *(_OWORD *)v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v40);
    objc_msgSend(v22, "debugWithMessage:", v23);

    if (v21 != &v40)
      free(v21);
    if (v16)
    {
      -[_UIKeyboardArbiterClientHandle remoteFocusContext](v16, "remoteFocusContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sceneIdentity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIKeyboardArbiterClientHandle _reevaluateRemoteFocusContext:](v16, "_reevaluateRemoteFocusContext:", v11);
      if (v16 != self)
      {
        if (-[_UIKeyboardArbiterClientHandle isAcquiringFocus](v16, "isAcquiringFocus"))
        {
          objc_msgSend(v11, "sceneIdentity");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = BSEqualObjects();

          if ((v27 & 1) == 0)
            -[_UIKeyboardArbiter handlerRequestedForcedClientSceneIdentityUpdate:](self->_owner, "handlerRequestedForcedClientSceneIdentityUpdate:", v16);
        }
      }
      -[_UIKeyboardArbiter handlerRequestedFocus:shouldStealKeyboard:](self->_owner, "handlerRequestedFocus:shouldStealKeyboard:", v16, v7);

    }
    if (v12)
      v12[2](v12, v16 != 0);

  }
  else
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    _UIArbiterLog();
    v28 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)v33 = 138412546;
    *(_QWORD *)&v33[4] = self;
    *(_WORD *)&v33[12] = 2048;
    *(_QWORD *)&v33[14] = (int)v8;
    LODWORD(v32) = 22;
    v29 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v33, v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v40);
    objc_msgSend(v30, "errorWithMessage:", v31);

    if (v29 != &v40)
      free(v29);
    v12[2](v12, 0);
  }

}

- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  _OWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BYTE v19[22];
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  _OWORD v24[32];
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  memset(v24, 0, sizeof(v24));
  _UIArbiterLog();
  v11 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("NO");
  *(_DWORD *)v19 = 138413058;
  *(_QWORD *)&v19[4] = self;
  if (v6)
    v14 = CFSTR("YES");
  *(_WORD *)&v19[12] = 2112;
  *(_QWORD *)&v19[14] = v12;
  v20 = 2112;
  v21 = v14;
  v22 = 2112;
  v23 = v9;
  LODWORD(v18) = 42;
  v15 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v19, v18, *(_OWORD *)v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v24);
  objc_msgSend(v16, "debugWithMessage:", v17);

  if (v15 != v24)
    free(v15);
  -[_UIKeyboardArbiter setKeyboardTotalDisable:withFence:fromHandler:completionHandler:](self->_owner, "setKeyboardTotalDisable:withFence:fromHandler:completionHandler:", v6, v9, self, v10);

}

- (void)signalEventSourceChanged:(int64_t)a3 completionHandler:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  _OWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  _UIKeyboardArbiterClientHandle *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  _OWORD v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  memset(v20, 0, sizeof(v20));
  _UIArbiterLog();
  v8 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 138412802;
  v15 = self;
  v16 = 2112;
  v17 = v9;
  v18 = 1024;
  v19 = a3;
  LODWORD(v13) = 28;
  v10 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v14, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v20);
  objc_msgSend(v11, "debugWithMessage:", v12);

  if (v10 != v20)
    free(v10);
  -[_UIKeyboardArbiter signalEventSourceChanged:fromHandler:completionHandler:](self->_owner, "signalEventSourceChanged:fromHandler:completionHandler:", a3, self, v7);

}

- (BOOL)hasHostedPids
{
  return -[NSMutableSet count](self->_hostedPids, "count") != 0;
}

- (double)iavHeight
{
  return self->_iavHeight;
}

- (void)setPrevActiveIdentifier:(int)a3
{
  self->_prevActiveIdentifier = a3;
}

- (void)setIsViewService:(BOOL)a3
{
  self->_isViewService = a3;
}

- (int)suppressionCount
{
  return self->_suppressionCount;
}

- (void)setSuppressionCount:(int)a3
{
  self->_suppressionCount = a3;
}

- (BOOL)hasDebugInformationEntitlement
{
  return self->_hasDebugInformationEntitlement;
}

- (void)setHasDebugInformationEntitlement:(BOOL)a3
{
  self->_hasDebugInformationEntitlement = a3;
}

- (BOOL)requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus
{
  return self->_requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus;
}

- (void)setPendingNotifyKeyboardChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingNotifyKeyboardChanged, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_endpointGrantInjector, 0);
  objc_storeStrong((id *)&self->_cachedContext, 0);
  objc_storeStrong((id *)&self->_remoteKeepAliveAssertion, 0);
  objc_storeStrong((id *)&self->_acquiringFocusTimer, 0);
  objc_storeStrong((id *)&self->_hostedPids, 0);
  objc_storeStrong((id *)&self->_remoteFocusContext, 0);
  objc_storeStrong((id *)&self->_sceneLayer, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
