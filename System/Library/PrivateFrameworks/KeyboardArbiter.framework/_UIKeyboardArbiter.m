@implementation _UIKeyboardArbiter

- (void)processWithPID:(int)a3 foreground:(BOOL)a4 suspended:(BOOL)a5
{
  NSObject *queue;
  _QWORD v10[5];
  int v11;
  BOOL v12;
  BOOL v13;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke;
  v10[3] = &unk_24DAA0588;
  v10[4] = self;
  v11 = a3;
  v12 = a5;
  v13 = a4;
  dispatch_async(queue, v10);
}

- (id)_currentFocusedHandle
{
  void *v3;
  NSObject *v4;
  int currentFocusPID;
  FBSSceneIdentityToken *currentFocusSceneIdentity;
  _OWORD *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  FBSSceneIdentityToken *v14;
  _OWORD v15[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_currentFocusPID == -1)
  {
LABEL_5:
    v3 = 0;
    return v3;
  }
  -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    memset(v15, 0, sizeof(v15));
    _UIArbiterLog();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    currentFocusPID = self->_currentFocusPID;
    currentFocusSceneIdentity = self->_currentFocusSceneIdentity;
    v12[0] = 67240450;
    v12[1] = currentFocusPID;
    v13 = 2114;
    v14 = currentFocusSceneIdentity;
    LODWORD(v11) = 18;
    v7 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v12, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v15);
    objc_msgSend(v8, "errorWithMessage:", v9);

    if (v7 != v15)
      free(v7);
    goto LABEL_5;
  }
  return v3;
}

- (id)preferredSceneIdentityForKeyboardFocusWithChangeInformation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_UIKeyboardArbiter _activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:](self, "_activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[_UIKeyboardArbiter _previouslyFocusedHostHandle](self, "_previouslyFocusedHostHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "remoteFocusContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  NSObject *v12;
  id v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *queue;
  id v28;
  id v29;
  uint64_t v31;
  _QWORD block[5];
  id v33;
  id v34;
  _QWORD v35[7];
  char v36;
  int v37;
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[520];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  +[_UIKeyboardArbiterClientHandle handlerWithArbiter:forConnection:](_UIKeyboardArbiterClientHandle, "handlerWithArbiter:forConnection:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedObject:", v6);
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.TapToRadar")))
  {

LABEL_4:
    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    objc_msgSend(v10, "setPause:", 1);

    goto LABEL_6;
  }
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.appleseed.FeedbackAssistant"));

  if (v9)
    goto LABEL_4;
  v11 = 0;
LABEL_6:
  memset(v41, 0, 512);
  _UIArbiterLog();
  v12 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  v37 = 138412546;
  v38 = (id)objc_opt_class();
  v39 = 2112;
  v40 = v6;
  v13 = v38;
  LODWORD(v31) = 22;
  v14 = (_BYTE *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v37, v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v41);
  objc_msgSend(v15, "debugWithMessage:", v16);

  if (v14 != v41)
    free(v14);
  v17 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke;
  v35[3] = &unk_24DAA0710;
  v35[4] = self;
  v35[5] = v5;
  v35[6] = v6;
  v36 = v11;
  objc_msgSend(v5, "setInvalidationHandler:", v35);
  if (objc_msgSend((id)objc_opt_class(), "unitTestEnvironment"))
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255096F48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v18);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255097048);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v19);

    +[_UIKeyboardArbiter configureEncodedClassesForXPCConnection:](_UIKeyboardArbiter, "configureEncodedClassesForXPCConnection:", v5);
  }
  else
  {
    objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.KeyboardArbiter.client.inputuihost"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255096F48);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setExportedInterface:", v22);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255095D88);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRemoteObjectInterface:", v23);

      objc_msgSend(v6, "setInputUIHost:", 1);
      objc_storeWeak((id *)&self->_keyboardUIHandle, v6);
    }
    else
    {
      if (objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP"))
      {
        objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255095A98);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setExportedInterface:", v24);

        objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255097048);
      }
      else
      {
        _UIKeyboardArbitration_Interface();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setExportedInterface:", v25);

        _UIKeyboardArbitrationClient_Interface();
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRemoteObjectInterface:", v26);

    }
  }
  objc_msgSend(v5, "_setQueue:", self->_queue);
  queue = self->_queue;
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_2;
  block[3] = &unk_24DAA06C0;
  block[4] = self;
  v33 = v6;
  v34 = v5;
  v28 = v5;
  v29 = v6;
  dispatch_async(queue, block);

  return 1;
}

+ (BOOL)unitTestEnvironment
{
  if (qword_253E79000 != -1)
    dispatch_once(&qword_253E79000, &__block_literal_global_262);
  return _MergedGlobals_2;
}

- (void)updateInterestedBundleIDs
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  RBSProcessMonitor *processMonitor;
  id v17;
  _UIKeyboardArbiter *v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = self;
  v4 = self->_clients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "processHandle", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)MEMORY[0x24BE80CD8];
          objc_msgSend(v9, "processHandle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "predicateMatchingHandle:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v9, "processIdentifier"))
            continue;
          v14 = (void *)MEMORY[0x24BE80CD8];
          objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", objc_msgSend(v9, "processIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "predicateMatchingIdentifier:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v15 = (void *)v13;

        objc_msgSend(v3, "addObject:", v15);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  processMonitor = v18->_processMonitor;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __47___UIKeyboardArbiter_updateInterestedBundleIDs__block_invoke;
  v19[3] = &unk_24DAA0538;
  v20 = v3;
  v17 = v3;
  -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v19);

}

- (void)handlerRequestedFocus:(id)a3 shouldStealKeyboard:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  __int128 *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  __int128 *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  char v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  char v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  const __CFString *v37;
  NSObject *v38;
  void *v39;
  id v40;
  __int128 *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[24];
  const __CFString *v47;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v4 = a4;
  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v6, "inputUIHost"))
  {
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
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    _UIArbiterLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    v8 = (void *)objc_opt_class();
    v9 = CFSTR("NO");
    *(_DWORD *)v46 = 138543874;
    *(_QWORD *)&v46[4] = v8;
    *(_WORD *)&v46[12] = 2114;
    if (v4)
      v9 = CFSTR("YES");
    *(_QWORD *)&v46[14] = v6;
    *(_WORD *)&v46[22] = 2114;
    v47 = v9;
    v10 = v8;
    LODWORD(v44) = 32;
    v11 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v46, v44, *(_OWORD *)v46, *(_QWORD *)&v46[16], v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
      (_QWORD)v75);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v48);
    objc_msgSend(v12, "errorWithMessage:", v13);

    if (v11 != &v48)
      free(v11);
  }
  else
  {
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
      v4 = WeakRetained != v6;

    }
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
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    _UIArbiterLog();
    v15 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    v16 = (void *)objc_opt_class();
    v17 = CFSTR("NO");
    *(_DWORD *)v46 = 138543874;
    *(_QWORD *)&v46[4] = v16;
    *(_WORD *)&v46[12] = 2114;
    if (v4)
      v17 = CFSTR("YES");
    *(_QWORD *)&v46[14] = v6;
    *(_WORD *)&v46[22] = 2114;
    v47 = v17;
    v18 = v16;
    LODWORD(v44) = 32;
    v19 = (__int128 *)_os_log_send_and_compose_impl();

    v20 = 0x253E78000uLL;
    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v46, v44, *(_QWORD *)v46, *(_OWORD *)&v46[8], v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
      (_QWORD)v75);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0x24BDD1000uLL;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v48);
    objc_msgSend(v21, "debugWithMessage:", v23);

    if (v19 != &v48)
      free(v19);
    v24 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
    v25 = BSEqualObjects();

    if ((v25 & 1) == 0)
    {
      v26 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
      v27 = v26;
      if (v26 && (objc_msgSend(v26, "inputUIHost") & 1) == 0)
        -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", &__block_literal_global_119, v27, "-[_UIKeyboardArbiter handlerRequestedFocus:shouldStealKeyboard:]");
      v28 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
      objc_msgSend(v28, "clearAcquiringFocus");

      objc_storeWeak((id *)&self->_focusRequestedHandle, v6);
      v29 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);

      v30 = !v4;
      if (v29)
        v30 = 1;
      if ((v30 & 1) != 0)
      {
        v37 = CFSTR("NO");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBDC80], "informationForKeyboardDown");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
        objc_msgSend(v32, "remoteFocusContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sceneIdentity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringRepresentation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setSourceSceneIdentityString:", v35);

        v22 = 0x24BDD1000;
        v20 = 0x253E78000;

        v36 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
        -[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:fromFocus:](self, "updateKeyboardStatus:fromHandler:fromFocus:", v31, v36, 1);

        v37 = CFSTR("YES");
      }
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
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      _UIArbiterLog();
      v38 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      v39 = (void *)objc_opt_class();
      *(_DWORD *)v46 = 138412802;
      *(_QWORD *)&v46[4] = v39;
      *(_WORD *)&v46[12] = 2114;
      *(_QWORD *)&v46[14] = v6;
      *(_WORD *)&v46[22] = 2114;
      v47 = v37;
      v40 = v39;
      LODWORD(v45) = 32;
      v41 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend((id)(v20 + 3224), "sharedInstance", v46, v45);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(objc_alloc(*(Class *)(v22 + 1992)), "initWithUTF8String:", &v48);
      objc_msgSend(v42, "debugWithMessage:", v43);

      if (v41 != &v48)
        free(v41);

    }
    -[_UIKeyboardArbiter reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:](self, "reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:", v4);
  }

}

- (id)_activeHandleForFocusEvaluation
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
  v4 = WeakRetained;
  if (WeakRetained)
    v5 = WeakRetained;
  else
    v5 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
  v6 = v5;

  return v6;
}

- (void)_applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:(unint64_t)a3
{
  unint64_t pendingFocusLock_generation;
  uint64_t pendingFocusLock_PID;
  FBSSceneIdentityToken *v7;
  FBSSceneIdentityToken *pendingFocusLock_sceneIdentity;
  NSObject *v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[12];
  __int16 v16;
  int v17;
  __int16 v18;
  FBSSceneIdentityToken *v19;
  _OWORD v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_pendingFocusLock);
  pendingFocusLock_generation = self->_pendingFocusLock_generation;
  pendingFocusLock_PID = self->_pendingFocusLock_PID;
  v7 = self->_pendingFocusLock_sceneIdentity;
  if ((_DWORD)pendingFocusLock_PID != -1 && pendingFocusLock_generation == a3)
  {
    self->_pendingFocusLock_PID = -1;
    pendingFocusLock_sceneIdentity = self->_pendingFocusLock_sceneIdentity;
    self->_pendingFocusLock_sceneIdentity = 0;

    os_unfair_lock_unlock(&self->_pendingFocusLock);
    memset(v20, 0, sizeof(v20));
    _UIArbiterLog();
    v10 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    *(_DWORD *)v15 = 134218498;
    *(_QWORD *)&v15[4] = a3;
    v16 = 1024;
    v17 = pendingFocusLock_PID;
    v18 = 2112;
    v19 = v7;
    LODWORD(v14) = 28;
    v11 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v15, v14, *(_QWORD *)v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v20);
    objc_msgSend(v12, "debugWithMessage:", v13);

    if (v11 != v20)
      free(v11);
    -[_UIKeyboardArbiter _updateCurrentKeyboardFocusToPID:sceneIdentity:](self, "_updateCurrentKeyboardFocusToPID:sceneIdentity:", pendingFocusLock_PID, v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_pendingFocusLock);
  }

}

- (id)hostForHandle:(id)a3 hosts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "remoteFocusContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = self->_clients;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v16, (_QWORD)v21) & 1) == 0
            && (objc_msgSend(v16, "isHostingPID:", objc_msgSend(v6, "processIdentifier")) & 1) != 0)
          {
            objc_msgSend(v7, "addObject:", v16);
            -[_UIKeyboardArbiter hostForHandle:hosts:](self, "hostForHandle:hosts:", v16, v7);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v17;
            if (v17)
              v19 = (void *)v17;
            else
              v19 = v16;
            v10 = v19;

            goto LABEL_17;
          }
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_17:

  }
  return v10;
}

- (id)handlerForPID:(int)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_clients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "processIdentifier", (_QWORD)v13) == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)newClientConnected:(id)a3 withExpectedState:(id)a4 onConnected:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id WeakRetained;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _UIKeyboardUIInformation *lastUIInformation;
  char v26;
  id v27;
  _UIKeyboardUIInformation *v28;
  _UIKeyboardUIInformation *v29;
  int64_t lastEventSource;
  id v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  id v38;
  int v39;
  int v40;
  id v41;

  v41 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v8, "keyboardOnScreen")
    && (v10 = objc_loadWeakRetained((id *)&self->_disablingHandle), v10, !v10))
  {
    v17 = v8;
    if (self->_pidOnDeviceLocked >= 1
      && objc_msgSend(v41, "processIdentifier") == self->_pidOnDeviceLocked)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);

      if (WeakRetained)
      {
        objc_msgSend(MEMORY[0x24BEBDC80], "informationForKeyboardDown");
        v19 = objc_claimAutoreleasedReturnValue();

        v17 = (id)v19;
      }
      else
      {
        self->_pidOnDeviceLocked = 0;
      }
    }
    -[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:](self, "updateKeyboardStatus:fromHandler:", v17, v41);
    (*((void (**)(id, _QWORD, _QWORD, int64_t, _QWORD))v9 + 2))(v9, 0, 0, self->_lastEventSource, 0);
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    v12 = objc_msgSend(v11, "deactivating");

    if ((v12 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v14 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
      objc_msgSend(v14, "remoteFocusContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sceneIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v13 = 0;
      }
      else
      {
        v20 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyboardArbiter hostForHandle:hosts:](self, "hostForHandle:hosts:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v22, "deactivating");
      }
    }
    -[_UIKeyboardArbiter lastUpdate](self, "lastUpdate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23 || v13)
    {
      objc_msgSend(MEMORY[0x24BEBDC80], "informationForKeyboardDown");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIKeyboardArbiter lastUpdate](self, "lastUpdate");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (id)v24;
    lastUIInformation = self->_lastUIInformation;
    if (lastUIInformation)
      v26 = v13;
    else
      v26 = 1;
    if ((v26 & 1) != 0)
    {
      v27 = objc_alloc(MEMORY[0x24BEBDC88]);
      v28 = (_UIKeyboardUIInformation *)objc_msgSend(v27, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    }
    else
    {
      v28 = lastUIInformation;
    }
    v29 = v28;
    lastEventSource = self->_lastEventSource;
    v31 = objc_loadWeakRetained((id *)&self->_disablingHandle);
    (*((void (**)(id, id, _UIKeyboardUIInformation *, int64_t, BOOL))v9 + 2))(v9, v17, v29, lastEventSource, v31 != 0);

  }
  objc_msgSend(v41, "bundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  objc_msgSend(v41, "bundleIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));

  v36 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (!v36
    || ((v37 = v36, v38 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle), v38 == v41)
      ? (v39 = 1)
      : (v39 = v33),
        v40 = v39 | v35,
        v38,
        v37,
        v40 == 1))
  {
    -[_UIKeyboardArbiter handlerRequestedFocus:shouldStealKeyboard:](self, "handlerRequestedFocus:shouldStealKeyboard:", v41, 0);
  }

}

- (_UIKeyboardChangedInformation)lastUpdate
{
  return self->_lastUpdate;
}

- (void)_updateCurrentKeyboardFocusToPID:(int)a3 sceneIdentity:(id)a4
{
  FBSSceneIdentityToken *v6;
  NSObject *v7;
  _OWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  FBSSceneIdentityToken *currentFocusSceneIdentity;
  uint64_t v18;
  _DWORD v19[2];
  __int16 v20;
  FBSSceneIdentityToken *v21;
  _OWORD v22[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (FBSSceneIdentityToken *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v22, 0, sizeof(v22));
  _UIArbiterLog();
  v7 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  v19[0] = 67109378;
  v19[1] = a3;
  v20 = 2112;
  v21 = v6;
  LODWORD(v18) = 18;
  v8 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v19, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v22);
  objc_msgSend(v9, "debugWithMessage:", v10);

  if (v8 != v22)
    free(v8);
  -[_UIKeyboardArbiter _currentFocusedHandle](self, "_currentFocusedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "processIdentifier");
    objc_msgSend(v12, "remoteFocusContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sceneIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = BSEqualObjects();

    if (v13 != a3 && (v16 & 1) == 0)
      objc_msgSend(v12, "clearAcquiringFocus");
  }
  self->_currentFocusPID = a3;
  currentFocusSceneIdentity = self->_currentFocusSceneIdentity;
  self->_currentFocusSceneIdentity = v6;

}

- (_UIKeyboardArbiterClientHandle)activeInputDestinationHandle
{
  return (_UIKeyboardArbiterClientHandle *)objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
}

- (_UIKeyboardArbiterClientHandle)focusRequestedHandle
{
  return (_UIKeyboardArbiterClientHandle *)objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
}

- (BOOL)deactivateHandle:(id)a3
{
  id v4;
  FBSSceneLayer *v5;
  void *v6;
  NSObject *v7;
  id v8;
  __int128 *v9;
  void *v10;
  void *v11;
  _UIKeyboardArbiter *v12;
  void *v13;
  FBSSceneLayer *sceneLayer;
  id WeakRetained;
  _BOOL4 v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  char v21;
  uint64_t v23;
  _BYTE v24[24];
  FBSSceneLayer *v25;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "clearAcquiringFocus");
  objc_msgSend(v4, "sceneLayer");
  v5 = (FBSSceneLayer *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiter sceneLink](self, "sceneLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAvailable") && v5 || (objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP") & 1) != 0)
  {

  }
  else
  {
    v21 = objc_msgSend(v4, "requiresInputUIForAutofillUIOnly");

    if ((v21 & 1) == 0)
      goto LABEL_18;
  }
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
  v26 = 0u;
  v27 = 0u;
  _UIArbiterLog();
  v7 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  *(_DWORD *)v24 = 138412802;
  *(_QWORD *)&v24[4] = objc_opt_class();
  *(_WORD *)&v24[12] = 2112;
  *(_QWORD *)&v24[14] = v4;
  *(_WORD *)&v24[22] = 2112;
  v25 = v5;
  v8 = *(id *)&v24[4];
  LODWORD(v23) = 32;
  v9 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v24, v23, *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    (_QWORD)v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v26);
  objc_msgSend(v10, "debugWithMessage:", v11);

  if (v9 != &v26)
    free(v9);
  if (v5)
  {
    v12 = self;
    objc_sync_enter(v12);
    if (v12->_sceneLayer == v5)
    {
      -[_UIKeyboardArbiter sceneLink](v12, "sceneLink");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "detach:", v5);

      sceneLayer = v12->_sceneLayer;
      v12->_sceneLayer = 0;

    }
    objc_sync_exit(v12);

    objc_msgSend(v4, "didDetachLayer");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_previouslyActiveHandle);
  v16 = WeakRetained == v4;

  if (v16)
  {
    objc_storeWeak((id *)&self->_previouslyActiveHandle, 0);
    -[_UIKeyboardArbiter scheduleWindowTimeout](self, "scheduleWindowTimeout");
  }
  v17 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
  v18 = v17 == v4;

  if (v18)
    objc_storeWeak((id *)&self->_lastActivatedHandle, 0);
  -[_UIKeyboardArbiter _activeHandleForFocusEvaluation](self, "_activeHandleForFocusEvaluation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
    -[_UIKeyboardArbiter reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:](self, "reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:", 0);
LABEL_18:

  return 0;
}

- (void)completeKeyboardStatusChangedFromHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_clients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (v10 != v4)
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", &__block_literal_global_101, v10, "-[_UIKeyboardArbiter completeKeyboardStatusChangedFromHandler:]", (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)retrieveClientDebugInformationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_group_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  dispatch_group_t group;
  NSMutableArray *obj;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  _UIKeyboardArbiter *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _UIKeyboardArbiter *v45;
  _QWORD v46[5];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v27 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_group_create();
    queue = self->_queue;
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke;
    v46[3] = &unk_24DAA0248;
    v46[4] = self;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_3;
    v43[3] = &unk_24DAA0270;
    v30 = v6;
    v44 = v30;
    v45 = self;
    group = v7;
    AsyncTaskWithTimeout(v7, queue, v46, v43);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = self->_clients;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(obj);
          v13 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("Description"));

          v16 = (void *)MEMORY[0x24BDD16E0];
          WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
          objc_msgSend(v16, "numberWithInt:", WeakRetained == v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("Active"));

          v19 = (void *)MEMORY[0x24BDD16E0];
          v20 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
          objc_msgSend(v19, "numberWithInt:", v20 == v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("LastActivated"));

          v22 = (void *)MEMORY[0x24BDD16E0];
          v23 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
          objc_msgSend(v22, "numberWithInt:", v23 == v13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v24, CFSTR("FocusRequested"));

          if ((objc_msgSend(v13, "running") & 1) != 0)
          {
            v34[0] = MEMORY[0x24BDAC760];
            v34[1] = 3221225472;
            v34[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_4;
            v34[3] = &unk_24DAA02E8;
            v35 = group;
            v36 = self;
            v37 = v14;
            v38 = v30;
            -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v34, v13, "-[_UIKeyboardArbiter retrieveClientDebugInformationWithCompletion:]");

          }
          else
          {
            objc_msgSend(v14, "setObject:forKey:", CFSTR("Suspended"), CFSTR("Process"));
            objc_msgSend(v30, "addObject:", v14);
          }

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v10);
    }

    v25 = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_8;
    block[3] = &unk_24DAA0220;
    v5 = v27;
    v32 = v30;
    v33 = v27;
    v26 = v30;
    dispatch_group_notify(group, v25, block);

  }
}

- (void)runOperations:(id)a3 onHandler:(id)a4 fromFunction:(const char *)a5
{
  void (**v8)(id, void *, _QWORD *);
  id v9;
  NSObject *v10;
  __int128 *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  __int128 *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __int128 *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  const char *v32;
  int v33;
  const char *v34;
  __int16 v35;
  id v36;
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
  v8 = (void (**)(id, void *, _QWORD *))a3;
  v9 = a4;
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
  v10 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  v33 = 136315394;
  v34 = a5;
  v35 = 2112;
  v36 = v9;
  LODWORD(v26) = 22;
  v11 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v33, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v37);
  objc_msgSend(v12, "debugWithMessage:", v13);

  if (v11 != &v37)
    free(v11);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v9, "running"))
  {
    objc_msgSend(v9, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke;
    v30[3] = &unk_24DAA0338;
    v32 = a5;
    v16 = v9;
    v31 = v16;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (objc_msgSend(v16, "takeProcessAssertionOnRemoteWithQueue:", self->_queue))
      {
        v28[0] = v15;
        v28[1] = 3221225472;
        v28[2] = __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke_90;
        v28[3] = &unk_24DAA00C0;
        v28[4] = self;
        v29 = v16;
        v8[2](v8, v17, v28);

      }
      else
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
        v22 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
        v33 = 138412290;
        v34 = (const char *)v9;
        LODWORD(v27) = 12;
        v23 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v33, v27);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v37);
        objc_msgSend(v24, "errorWithMessage:", v25);

        if (v23 != &v37)
          free(v23);
        objc_msgSend(v16, "releaseProcessAssertion");
      }
    }
    else
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
      v18 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      v33 = 136315394;
      v34 = a5;
      v35 = 2112;
      v36 = v9;
      LODWORD(v27) = 22;
      v19 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v33, v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v37);
      objc_msgSend(v20, "errorWithMessage:", v21);

      if (v19 != &v37)
        free(v19);
    }

  }
}

- (id)_descriptionWithScene:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  _UIKeyboardUIInformation *lastUIInformation;
  void *v9;
  id v10;
  objc_super v12;

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v12.receiver = self;
  v12.super_class = (Class)_UIKeyboardArbiter;
  -[_UIKeyboardArbiter description](&v12, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
  objc_msgSend(v6, "appendString:", CFSTR("; "));
  objc_msgSend(v6, "appendString:", CFSTR("scene data omitted;\n"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_disablingHandle);
  objc_msgSend(v6, "appendFormat:", CFSTR("disabler = %@;\n"), WeakRetained);

  objc_msgSend(v6, "appendFormat:", CFSTR("lastEventSource = %ld;\n"), self->_lastEventSource);
  lastUIInformation = self->_lastUIInformation;
  v9 = lastUIInformation;
  if (!lastUIInformation)
  {
    -[_UIKeyboardArbiter lastUpdate](self, "lastUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("current state = %@;\n"), v9);
  if (!lastUIInformation)

  v10 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  objc_msgSend(v6, "appendFormat:", CFSTR("active handle = %@;\n"), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR("handles = %@>"), self->_clients);
  objc_sync_exit(v4);

  return v6;
}

- (_UIKeyboardArbiterOmniscientDelegate)omniscientDelegate
{
  return (_UIKeyboardArbiterOmniscientDelegate *)objc_loadWeakRetained((id *)&self->_omniscientDelegate);
}

- (BOOL)activateHandle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  __int128 *v8;
  void *v9;
  void *v10;
  _UIKeyboardArbiterClientHandle **p_activeInputDestinationHandle;
  id WeakRetained;
  id v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  _UIKeyboardArbiter *v19;
  FBSSceneLayer **p_sceneLayer;
  void *v21;
  FBSSceneLayer *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  __int128 *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  int v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_UIKeyboardArbiter sceneLink](self, "sceneLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  if ((v6 & 1) == 0)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
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
    _UIArbiterLog();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    v41 = 138412290;
    v42 = v4;
    LODWORD(v40) = 12;
    v8 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v41, v40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v47);
    objc_msgSend(v9, "errorWithMessage:", v10);

    if (v8 != &v47)
      free(v8);
  }
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained
    && (v13 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle),
        v14 = objc_msgSend(v4, "isHandlerShowableWithHandler:", v13),
        v13,
        WeakRetained,
        (v14 & 1) == 0))
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
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
    _UIArbiterLog();
    v32 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    v33 = (void *)objc_opt_class();
    v34 = v33;
    v35 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
    v41 = 138412802;
    v42 = v33;
    v43 = 2112;
    v44 = v4;
    v45 = 2112;
    v46 = v35;
    LODWORD(v40) = 32;
    v36 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v41, v40);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v47);
    objc_msgSend(v37, "errorWithMessage:", v38);

    if (v36 != &v47)
      free(v36);
    v31 = 0;
  }
  else
  {
    objc_msgSend(v4, "sceneLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiter sceneLink](self, "sceneLink");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isAvailable");
    if (v15)
      v18 = v17;
    else
      v18 = 0;

    if (v18)
    {
      v19 = self;
      objc_sync_enter(v19);
      p_sceneLayer = &v19->_sceneLayer;
      if (v19->_sceneLayer)
      {
        -[_UIKeyboardArbiter sceneLink](v19, "sceneLink");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "detach:", *p_sceneLayer);

        v22 = *p_sceneLayer;
        *p_sceneLayer = 0;

      }
      objc_storeStrong((id *)&v19->_sceneLayer, v15);
      objc_sync_exit(v19);

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
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
      _UIArbiterLog();
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      v24 = (void *)objc_opt_class();
      v41 = 138412802;
      v42 = v24;
      v43 = 2112;
      v44 = v4;
      v45 = 2112;
      v46 = v15;
      v25 = v24;
      LODWORD(v40) = 32;
      v26 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v41, v40);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v47);
      objc_msgSend(v27, "debugWithMessage:", v28);

      if (v26 != &v47)
        free(v26);
      -[_UIKeyboardArbiter sceneLink](v19, "sceneLink");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "attach:", v15);

      objc_msgSend(v4, "didAttachLayer");
    }
    if ((objc_msgSend(v4, "inputUIHost") & 1) == 0)
    {
      v30 = objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
      objc_msgSend(v30, "clearAcquiringFocus");

      objc_storeWeak((id *)&self->_lastActivatedHandle, v4);
      -[_UIKeyboardArbiter handlerRequestedFocus:shouldStealKeyboard:](self, "handlerRequestedFocus:shouldStealKeyboard:", v4, 0);
    }

    v31 = 1;
  }

  return v31;
}

- (void)reevaluateSceneClientSettings
{
  void *v3;
  int v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_UIKeyboardArbiter sceneLink](self, "sceneLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAvailable");

  if (v4)
  {
    -[_UIKeyboardArbiter sceneLink](self, "sceneLink");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSceneSettings");

  }
}

- (_UIKeyboardArbiterLink)sceneLink
{
  return self->_sceneLink;
}

- (void)updateSceneClientSettings:(id)a3
{
  NSObject *queue;
  id v5;
  id WeakRetained;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint8_t *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  int v36;
  void *v37;
  __int16 v38;
  unint64_t v39;
  uint8_t buf[32];
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
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    objc_msgSend(v7, "level");
    v9 = v8;

  }
  else
  {
    v9 = -1.0;
  }

  -[_UIKeyboardArbiter focusContext](self, "focusContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < 2.0)
    v9 = 2.0;
  objc_msgSend(v5, "setPreferredLevel:", v9);
  objc_msgSend(v10, "sceneIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSceneHostIdentity:", v11);

  if ((objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP") & 1) == 0)
  {
    if (!objc_msgSend(MEMORY[0x24BEBD6C8], "usesInputSystemUIForAutoFillOnly"))
      goto LABEL_12;
    v12 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    if (!objc_msgSend(v12, "requiresInputUIForAutofillUIOnly"))
    {
LABEL_11:

LABEL_12:
      if (v10)
        goto LABEL_30;
      goto LABEL_15;
    }
    v13 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
    if ((objc_msgSend(v13, "deactivating") & 1) != 0)
    {

      goto LABEL_11;
    }

  }
LABEL_15:
  _UIArbiterLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[_UIKeyboardArbiter updateSceneClientSettings:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = objc_opt_class();
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v10;
    LOWORD(v41) = 2048;
    *(double *)((char *)&v41 + 2) = v9;
    v34 = *(id *)&buf[14];
    _os_log_debug_impl(&dword_21955F000, v14, OS_LOG_TYPE_DEBUG, "%s  [%@] Updating focus context to %@ level %f", buf, 0x2Au);

  }
  -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "focusedSceneIdentityDidChange:", v18);

  }
  -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v10, "sceneIdentity");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21 && (v22 = (void *)v21, v23 = objc_msgSend(v10, "contextID"), v22, !v23))
    {
      _UIArbiterLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[_UIKeyboardArbiter updateSceneClientSettings:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_debug_impl(&dword_21955F000, v24, OS_LOG_TYPE_DEBUG, "%s  skipping updating focustContext = %@", buf, 0x16u);
      }
    }
    else
    {
      -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate");
      v24 = objc_claimAutoreleasedReturnValue();
      -[NSObject focusContextDidChange:](v24, "focusContextDidChange:", v10);
    }

  }
  -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    v69 = 0u;
    v70 = 0u;
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
    memset(buf, 0, sizeof(buf));
    _UIArbiterLog();
    v27 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    v28 = (void *)objc_opt_class();
    v29 = v28;
    v36 = 138412546;
    v37 = v28;
    v38 = 2048;
    v39 = -[_UIKeyboardArbiter keyboardScenePresentationMode](self, "keyboardScenePresentationMode");
    LODWORD(v35) = 22;
    v30 = (uint8_t *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v36, v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buf);
    objc_msgSend(v31, "debugWithMessage:", v32);

    if (v30 != buf)
      free(v30);
    -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "focusContext:didChangeKeyboardScenePresentationMode:", v10, -[_UIKeyboardArbiter keyboardScenePresentationMode](self, "keyboardScenePresentationMode"));

  }
LABEL_30:

}

- (_UIKeyboardArbiterSceneDelegate)sceneDelegate
{
  return (_UIKeyboardArbiterSceneDelegate *)objc_loadWeakRetained((id *)&self->_sceneDelegate);
}

- (void)updateKeyboardStatus:(id)a3 fromHandler:(id)a4 fromFocus:(BOOL)a5
{
  void *v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint8_t *v16;
  void *v17;
  void *v18;
  id *p_activeInputDestinationHandle;
  id v20;
  void *v21;
  id v22;
  int pidOnDeviceLocked;
  BOOL v24;
  id v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  id v39;
  id v40;
  id *p_previouslyActiveHandle;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  int v69;
  id v70;
  void *v71;
  int v72;
  id v73;
  void *v74;
  char v75;
  NSObject *v76;
  void *v77;
  id v78;
  id v79;
  uint8_t *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  int v85;
  id v86;
  int v87;
  id v88;
  void *v89;
  int v90;
  id v91;
  int v92;
  uint64_t v93;
  id v94;
  NSObject *v95;
  id v96;
  void *v97;
  id v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t i;
  void *v103;
  id v104;
  id v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  void (**v112)(_QWORD);
  void *v113;
  char v114;
  void *v115;
  char v116;
  dispatch_time_t v117;
  NSObject *queue;
  id v119;
  uint64_t v120;
  id v121;
  int v122;
  id obj;
  id v124;
  void *v125;
  char v126;
  NSMutableArray *v127;
  void *v128;
  _UIKeyboardArbiter *v129;
  id v130;
  id v131;
  _QWORD block[6];
  void (**v133)(_QWORD);
  _QWORD v134[5];
  id v135;
  _UIKeyboardArbiter *v136;
  id v137;
  id v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  int v145;
  void *v146;
  __int16 v147;
  id v148;
  __int16 v149;
  id v150;
  uint8_t buf[32];
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
  v130 = a3;
  v131 = a4;
  v129 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiter hostForHandle:hosts:](v129, "hostForHandle:hosts:", v131, v8);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v130;
  if (!a5 && (objc_msgSend(v130, "keyboardOnScreen") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v129->_activeInputDestinationHandle);

    if (WeakRetained != v131)
    {
      v180 = 0u;
      v181 = 0u;
      v178 = 0u;
      v179 = 0u;
      v176 = 0u;
      v177 = 0u;
      v174 = 0u;
      v175 = 0u;
      v172 = 0u;
      v173 = 0u;
      v170 = 0u;
      v171 = 0u;
      v168 = 0u;
      v169 = 0u;
      v166 = 0u;
      v167 = 0u;
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      memset(buf, 0, sizeof(buf));
      _UIArbiterLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      v12 = (void *)objc_opt_class();
      v13 = v12;
      objc_msgSend(v131, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_loadWeakRetained((id *)&v129->_activeInputDestinationHandle);
      v145 = 138412802;
      v146 = v12;
      v147 = 2112;
      v148 = v14;
      v149 = 2112;
      v150 = v15;
      LODWORD(v120) = 32;
      v16 = (uint8_t *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v145, v120);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buf);
      objc_msgSend(v17, "debugWithMessage:", v18);

      goto LABEL_11;
    }
  }
  p_activeInputDestinationHandle = (id *)&v129->_activeInputDestinationHandle;
  v20 = objc_loadWeakRetained((id *)&v129->_activeInputDestinationHandle);
  if (!v20)
  {
LABEL_14:
    if ((objc_msgSend(v9, "keyboardOnScreen") & 1) == 0)
      v129->_pidOnDeviceLocked = 0;
    objc_msgSend(v125, "bundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.InputUI"));

    v36 = objc_loadWeakRetained(p_activeInputDestinationHandle);
    if (v36 == v131)
    {
      v37 = v130;
      v38 = objc_msgSend(v130, "keyboardOnScreen");

      if ((v38 & 1) == 0)
      {
        p_previouslyActiveHandle = (id *)&v129->_previouslyActiveHandle;
        v42 = v131;
        goto LABEL_26;
      }
    }
    else
    {

      v37 = v130;
    }
    v39 = objc_loadWeakRetained(p_activeInputDestinationHandle);
    if (v39 && objc_msgSend(v37, "keyboardOnScreen"))
    {

      if (v122)
      {
        v40 = objc_loadWeakRetained(p_activeInputDestinationHandle);
        objc_storeWeak((id *)&v129->_previouslyActiveHandle, v40);

        goto LABEL_27;
      }
    }
    else
    {

    }
    p_previouslyActiveHandle = (id *)&v129->_previouslyActiveHandle;
    v42 = 0;
LABEL_26:
    objc_storeWeak(p_previouslyActiveHandle, v42);
LABEL_27:
    objc_msgSend(v125, "bundleIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setHostBundleIdentifier:", v43);

    objc_msgSend(v130, "setHostProcessIdentifier:", objc_msgSend(v125, "processIdentifier"));
    objc_msgSend(v130, "setProcessIdentifier:", objc_msgSend(v131, "processIdentifier"));
    objc_msgSend(v130, "sourceBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      objc_msgSend(v131, "bundleIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setSourceBundleIdentifier:", v45);

    }
    v46 = v130;
    if (objc_msgSend(v130, "keyboardOnScreen"))
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "userInterfaceIdiom");

      v46 = v130;
      if ((v48 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v49 = objc_loadWeakRetained((id *)&v129->_omniscientDelegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v50 = objc_loadWeakRetained((id *)&v129->_omniscientDelegate);
          objc_msgSend(v131, "remoteFocusContext");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "sceneIdentity");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v50, "shouldKeyboardBeWindowSizedForHostWithIdentity:", v52);

          v46 = v130;
          if (v53)
          {
            v128 = (void *)objc_msgSend(v130, "copyWithoutIAVKeyboardRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
            goto LABEL_37;
          }
        }
        else
        {

        }
      }
    }
    objc_msgSend(v46, "keyboardPosition");
    v54 = (void *)objc_msgSend(v46, "copyWithoutIAVKeyboardRect:");
    objc_msgSend(v46, "keyboardPosition");
    v56 = v55;
    objc_msgSend(v46, "keyboardPositionWithIAV");
    v128 = v54;
    if (vabdd_f64(v56, v57) > 0.00000011920929)
    {
      objc_msgSend(v46, "keyboardPositionWithIAV");
      objc_msgSend(v54, "setKeyboardPositionWithRemoteIAV:");
    }
LABEL_37:
    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v58 = objc_loadWeakRetained(p_activeInputDestinationHandle);

    if (v58 == v131)
      goto LABEL_46;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiter hostForHandle:hosts:](v129, "hostForHandle:hosts:", v131, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = objc_loadWeakRetained(p_activeInputDestinationHandle);
    if (objc_msgSend(v61, "running"))
    {
      v62 = objc_loadWeakRetained(p_activeInputDestinationHandle);
      if ((objc_msgSend(v62, "isKeyboardOnScreen") & 1) != 0)
      {
        -[_UIKeyboardArbiter lastUpdate](v129, "lastUpdate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "hostBundleIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v64, "isEqualToString:", CFSTR("com.apple.springboard")))
        {

LABEL_111:
          v119 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          objc_msgSend(v131, "setPrevActiveIdentifier:", objc_msgSend(v119, "processIdentifier"));

          objc_msgSend(v60, "setPrevActiveIdentifier:", objc_msgSend(v131, "prevActiveIdentifier"));
          goto LABEL_45;
        }
        objc_msgSend(v60, "bundleIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = objc_msgSend(v65, "isEqualToString:", CFSTR("com.apple.springboard"));

        if ((v126 & 1) != 0)
          goto LABEL_111;
LABEL_45:

LABEL_46:
        if (objc_msgSend(v130, "keyboardOnScreen"))
          v66 = v131;
        else
          v66 = 0;
        v124 = v66;
        v67 = v122;
        if (v124)
          v67 = 0;
        if (v67 == 1)
          v124 = objc_loadWeakRetained((id *)&v129->_previouslyActiveHandle);
        v121 = objc_loadWeakRetained(p_activeInputDestinationHandle);

        v68 = objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP");
        if (v124)
          v69 = 0;
        else
          v69 = v68;
        if (v69 == 1)
        {
          v70 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          if (v70
            && (objc_msgSend(v131, "bundleIdentifier"),
                v71 = (void *)objc_claimAutoreleasedReturnValue(),
                v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("com.apple.Spotlight")),
                v71,
                v72))
          {
            v73 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            objc_msgSend(v73, "bundleIdentifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v74, "isEqualToString:", CFSTR("com.apple.Spotlight"));

            if ((v75 & 1) == 0)
            {
              v124 = objc_loadWeakRetained(p_activeInputDestinationHandle);
              v180 = 0u;
              v181 = 0u;
              v178 = 0u;
              v179 = 0u;
              v176 = 0u;
              v177 = 0u;
              v174 = 0u;
              v175 = 0u;
              v172 = 0u;
              v173 = 0u;
              v170 = 0u;
              v171 = 0u;
              v168 = 0u;
              v169 = 0u;
              v166 = 0u;
              v167 = 0u;
              v164 = 0u;
              v165 = 0u;
              v162 = 0u;
              v163 = 0u;
              v160 = 0u;
              v161 = 0u;
              v158 = 0u;
              v159 = 0u;
              v156 = 0u;
              v157 = 0u;
              v154 = 0u;
              v155 = 0u;
              v152 = 0u;
              v153 = 0u;
              memset(buf, 0, sizeof(buf));
              _UIArbiterLog();
              v76 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG);
              v77 = (void *)objc_opt_class();
              v78 = v77;
              v79 = objc_loadWeakRetained(p_activeInputDestinationHandle);
              v145 = 138412546;
              v146 = v77;
              v147 = 2112;
              v148 = v79;
              LODWORD(v120) = 22;
              v80 = (uint8_t *)_os_log_send_and_compose_impl();

              +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v145, v120);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buf);
              objc_msgSend(v81, "debugWithMessage:", v82);

              if (v80 != buf)
                free(v80);
              objc_msgSend(v130, "resetAnimationFencing");
              objc_msgSend(v128, "resetAnimationFencing");
LABEL_107:

              goto LABEL_108;
            }
          }
          else
          {

          }
          v83 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          objc_msgSend(v83, "bundleIdentifier");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));

          if (v90 && objc_msgSend(v130, "keyboardOnScreen"))
          {
            v91 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            v92 = objc_msgSend(v91, "isKeyboardOnScreen");

            if (v92)
            {
              v93 = objc_msgSend(v131, "processIdentifier");
              v94 = objc_loadWeakRetained(p_activeInputDestinationHandle);
              objc_msgSend(v94, "setPrevActiveIdentifier:", v93);

LABEL_108:
              objc_sync_exit(obj);

              goto LABEL_109;
            }
            goto LABEL_73;
          }
          goto LABEL_72;
        }
        if ((objc_msgSend(v130, "keyboardOnScreen") & 1) == 0)
        {
          v83 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          objc_msgSend(v83, "bundleIdentifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v84, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));

          if (!v85)
          {
LABEL_72:

            goto LABEL_73;
          }
          v86 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          v87 = objc_msgSend(v86, "prevActiveIdentifier");

          if (v87)
          {
            v88 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            objc_msgSend(v88, "activeProcessResign");

            v83 = objc_loadWeakRetained(p_activeInputDestinationHandle);
            objc_msgSend(v83, "setPrevActiveIdentifier:", 0);
            goto LABEL_72;
          }
        }
LABEL_73:
        objc_storeWeak(p_activeInputDestinationHandle, v124);
        _UIArbiterLog();
        v95 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          v96 = objc_loadWeakRetained(p_activeInputDestinationHandle);
          *(_DWORD *)buf = 138478083;
          *(_QWORD *)&buf[4] = v96;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v130;
          _os_log_impl(&dword_21955F000, v95, OS_LOG_TYPE_DEFAULT, "active input destination is now %{private}@; information: %{private}@",
            buf,
            0x16u);

        }
        if (objc_msgSend(v130, "keyboardOnScreen"))
          v97 = v128;
        else
          v97 = 0;
        -[_UIKeyboardArbiter setLastUpdate:](v129, "setLastUpdate:", v97);
        v98 = objc_loadWeakRetained(p_activeInputDestinationHandle);
        -[_UIKeyboardArbiter _trackRecentlyActiveArbiterHandle:](v129, "_trackRecentlyActiveArbiterHandle:", v98);

        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v127 = v129->_clients;
        v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v140, v144, 16);
        v100 = v131;
        if (v99)
        {
          v101 = *(_QWORD *)v141;
          do
          {
            for (i = 0; i != v99; ++i)
            {
              if (*(_QWORD *)v141 != v101)
                objc_enumerationMutation(v127);
              v103 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
              v104 = v128;
              if (objc_msgSend(v103, "isHandlerShowableWithHandler:", v100))
              {
                v105 = v130;

                v100 = v131;
                if (objc_msgSend(v103, "wantedState") && (objc_msgSend(v103, "active") & 1) == 0)
                {
                  objc_msgSend(v103, "sceneLayer");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v107 = objc_msgSend(v106, "contextID");
                  objc_msgSend(v103, "remoteFocusContext");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v103, "level");
                  objc_msgSend(v103, "setWindowContextID:focusContext:windowState:withLevel:", v107, v108, 1);

                  v100 = v131;
                }
              }
              else
              {
                v105 = v104;
              }
              if (v103 != v100 || objc_msgSend(v100, "multipleScenes"))
              {
                v109 = (void *)objc_msgSend(v105, "copyWithoutFence");
                v134[0] = MEMORY[0x24BDAC760];
                v134[1] = 3221225472;
                v134[2] = __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke;
                v134[3] = &unk_24DAA0418;
                v134[4] = v103;
                v135 = v105;
                v136 = v129;
                v137 = v130;
                v110 = v100;
                v138 = v110;
                v111 = v109;
                v139 = v111;
                v112 = (void (**)(_QWORD))MEMORY[0x219A2F288](v134);
                if (objc_msgSend(v103, "active") && objc_msgSend(v103, "deactivating"))
                {
                  objc_msgSend(v110, "bundleIdentifier");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  v114 = objc_msgSend(v113, "isEqualToString:", CFSTR("com.apple.Spotlight"));

                  if ((v114 & 1) == 0)
                  {
                    objc_msgSend(v110, "bundleIdentifier");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    v116 = objc_msgSend(v115, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));

                    if ((v116 & 1) == 0)
                      -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](v129, "runOperations:onHandler:fromFunction:", &__block_literal_global_100, v103, "-[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:fromFocus:]");
                  }
                  v117 = dispatch_time(0, 500000000);
                  queue = v129->_queue;
                  block[0] = MEMORY[0x24BDAC760];
                  block[1] = 3221225472;
                  block[2] = __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_4;
                  block[3] = &unk_24DAA0460;
                  block[4] = v103;
                  block[5] = v129;
                  v133 = v112;
                  dispatch_after(v117, queue, block);

                }
                else
                {
                  v112[2](v112);
                }

              }
              v100 = v131;
            }
            v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v127, "countByEnumeratingWithState:objects:count:", &v140, v144, 16);
          }
          while (v99);
        }

        objc_msgSend(v130, "resetAnimationFencing");
        objc_msgSend(v128, "resetAnimationFencing");
        if (v124 != v121
          && ((objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP") & 1) != 0
           || v122 && objc_msgSend(MEMORY[0x24BEBD6C8], "usesInputSystemUIForAutoFillOnly")))
        {
          -[_UIKeyboardArbiter reevaluateSceneClientSettings](v129, "reevaluateSceneClientSettings");
        }
        -[_UIKeyboardArbiter scheduleWindowTimeout](v129, "scheduleWindowTimeout");
        if ((objc_msgSend(v130, "resizing") & 1) == 0)
          -[_UIKeyboardArbiter captureStateForDebug](v129, "captureStateForDebug");
        goto LABEL_107;
      }

    }
    goto LABEL_45;
  }
  v21 = v20;
  v22 = objc_loadWeakRetained(p_activeInputDestinationHandle);
  if (v22 == v131
    || (pidOnDeviceLocked = v129->_pidOnDeviceLocked,
        v24 = pidOnDeviceLocked == objc_msgSend(v131, "processIdentifier"),
        v9 = v130,
        !v24))
  {

    goto LABEL_14;
  }
  v25 = objc_loadWeakRetained(p_activeInputDestinationHandle);
  objc_msgSend(v25, "bundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  v9 = v130;
  if ((v27 & 1) != 0)
    goto LABEL_14;
  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  memset(buf, 0, sizeof(buf));
  _UIArbiterLog();
  v28 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
  v29 = (void *)objc_opt_class();
  v30 = v29;
  objc_msgSend(v131, "bundleIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_loadWeakRetained(p_activeInputDestinationHandle);
  v145 = 138412802;
  v146 = v29;
  v147 = 2112;
  v148 = v31;
  v149 = 2112;
  v150 = v32;
  LODWORD(v120) = 32;
  v16 = (uint8_t *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v145, v120);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buf);
  objc_msgSend(v33, "debugWithMessage:", v34);

LABEL_11:
  if (v16 != buf)
    free(v16);
LABEL_109:

}

- (void)setSuppressionCount:(int)a3 ofPIDs:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:", objc_msgSend(v10, "intValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "suppressionCount") != a3)
        {
          v12 = objc_msgSend(v11, "suppressionCount");
          v13 = a3 - v12;
          if (a3 != v12)
          {
            if (v13 >= 0)
              v14 = a3 - v12;
            else
              v14 = v12 - a3;
            if (v14 <= 1)
              v15 = 1;
            else
              v15 = v14;
            do
            {
              -[_UIKeyboardArbiter updateSuppression:ofPID:active:](self, "updateSuppression:ofPID:active:", v13 > 0, v10, objc_msgSend(v11, "active"));
              --v15;
            }
            while (v15);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (void)updateKeyboardSceneSettings
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_UIKeyboardArbiter remoteFocusContext](self, "remoteFocusContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  BSDispatchMain();

}

- (id)remoteFocusContext
{
  _UIKeyboardArbiterClientHandle **p_activeInputDestinationHandle;
  id WeakRetained;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UIKeyboardArbiterClientHandle **p_keyboardUIHandle;
  uint64_t i;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  objc_msgSend(WeakRetained, "remoteFocusContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_clients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    p_keyboardUIHandle = &self->_keyboardUIHandle;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "active", (_QWORD)v19))
        {
          v13 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
          if (v12 == v13)
            goto LABEL_11;
          v14 = v13;
          v15 = objc_loadWeakRetained((id *)p_keyboardUIHandle);

          if (v12 != v15)
          {
            v16 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
            v17 = objc_msgSend(v12, "isHandlerShowableWithHandler:", v16);

            if (v17)
            {
              objc_msgSend(v12, "remoteFocusContext");
              v12 = v5;
              v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

              continue;
            }
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)focusContext
{
  _UIKeyboardArbiterClientHandle **p_activeInputDestinationHandle;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
    objc_msgSend(v5, "level");

  }
  v6 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
  objc_msgSend(v6, "remoteFocusContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_clients;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "active", (_QWORD)v20))
        {
          objc_msgSend(v13, "remoteFocusContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sceneIdentity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
            v17 = objc_msgSend(v13, "isHandlerShowableWithHandler:", v16);

            if (v17)
            {
              objc_msgSend(v13, "level");
              objc_msgSend(v13, "remoteFocusContext");
              v18 = objc_claimAutoreleasedReturnValue();

              v7 = (void *)v18;
            }
          }
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (FBSSceneLayer)sceneLayer
{
  return self->_sceneLayer;
}

- (void)scheduleWindowTimeout
{
  int v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD v6[5];
  int v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_updateCounter + 1;
  self->_updateCounter = v3;
  v4 = dispatch_time(0, 4000000000);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43___UIKeyboardArbiter_scheduleWindowTimeout__block_invoke;
  v6[3] = &unk_24DAA03A0;
  v6[4] = self;
  v7 = v3;
  dispatch_after(v4, queue, v6);
}

- (void)setLastUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdate, a3);
}

- (void)captureStateForDebug
{
  void *v3;
  _QWORD v4[5];

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42___UIKeyboardArbiter_captureStateForDebug__block_invoke;
  v4[3] = &unk_24DAA01F8;
  v4[4] = self;
  objc_msgSend(v3, "addAsynchronousData:", v4);

}

- (void)_trackRecentlyActiveArbiterHandle:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSMutableOrderedSet *recentlyActiveSceneIdentities;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "remoteFocusContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneIdentity");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v12, "isKeyboardOnScreen");

    if (v7)
    {
      recentlyActiveSceneIdentities = self->_recentlyActiveSceneIdentities;
      objc_msgSend(v12, "remoteFocusContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sceneIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet addObject:](recentlyActiveSceneIdentities, "addObject:", v11);

      -[_UIKeyboardArbiter _cullRecentlyActiveSceneIdentities](self, "_cullRecentlyActiveSceneIdentities");
    }
  }
  else
  {

  }
}

- (void)_cullRecentlyActiveSceneIdentities
{
  uint64_t v3;

  v3 = -[NSMutableOrderedSet count](self->_recentlyActiveSceneIdentities, "count");
  if ((unint64_t)-[NSMutableOrderedSet count](self->_recentlyActiveSceneIdentities, "count") >= 7)
    -[NSMutableOrderedSet removeObjectsInRange:](self->_recentlyActiveSceneIdentities, "removeObjectsInRange:", 0, v3 - 6);
}

- (void)updateKeyboardStatus:(id)a3 fromHandler:(id)a4
{
  -[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:fromFocus:](self, "updateKeyboardStatus:fromHandler:fromFocus:", a3, a4, 0);
}

- (_UIKeyboardArbiter)initWithLink:(id)a3
{
  id v5;
  _UIKeyboardArbiter *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableArray *clients;
  uint64_t v12;
  NSMutableOrderedSet *recentlyActiveSceneIdentities;
  NSObject *v14;
  uint64_t v15;
  _UIKeyboardArbiter *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSXPCListener *listener;
  void *v21;
  uint64_t v22;
  RBSProcessMonitor *processMonitor;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD block[4];
  _UIKeyboardArbiter *v29;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_UIKeyboardArbiter;
  v6 = -[_UIKeyboardArbiter init](&v30, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.UIKit.keyboard-arbiter", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v10 = objc_claimAutoreleasedReturnValue();
    clients = v6->_clients;
    v6->_clients = (NSMutableArray *)v10;

    v6->_currentFocusPID = -1;
    v6->_pendingFocusLock._os_unfair_lock_opaque = 0;
    v6->_pendingFocusLock_PID = -1;
    objc_storeStrong((id *)&v6->_sceneLink, a3);
    -[_UIKeyboardArbiterLink setOwner:](v6->_sceneLink, "setOwner:", v6);
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v12 = objc_claimAutoreleasedReturnValue();
    recentlyActiveSceneIdentities = v6->_recentlyActiveSceneIdentities;
    v6->_recentlyActiveSceneIdentities = (NSMutableOrderedSet *)v12;

    v14 = v6->_queue;
    v15 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35___UIKeyboardArbiter_initWithLink___block_invoke;
    block[3] = &unk_24DAA0130;
    v16 = v6;
    v29 = v16;
    dispatch_sync(v14, block);
    -[_UIKeyboardArbiter sceneLink](v16, "sceneLink");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v18);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1998], "serviceListener");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    listener = v16->_listener;
    v16->_listener = (NSXPCListener *)v19;

    -[NSXPCListener setDelegate:](v16->_listener, "setDelegate:", v16);
    objc_initWeak(&location, v16);
    v21 = (void *)MEMORY[0x24BE80CC8];
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __35___UIKeyboardArbiter_initWithLink___block_invoke_2;
    v25[3] = &unk_24DAA0180;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v21, "monitorWithConfiguration:", v25);
    v22 = objc_claimAutoreleasedReturnValue();
    processMonitor = v16->_processMonitor;
    v16->_processMonitor = (RBSProcessMonitor *)v22;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardArbiter;
  -[_UIKeyboardArbiter dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[_UIKeyboardArbiter _descriptionWithScene:](self, "_descriptionWithScene:", 1);
}

- (void)retrieveDebugInformationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = 0;
  dispatch_group_enter(v5);
  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke;
  v21[3] = &unk_24DAA01A8;
  v23 = v24;
  v8 = v5;
  v22 = v8;
  objc_msgSend(v6, "getDebugInfoDictionariesWithCompletionHandler:", v21);

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v20 = 0;
  dispatch_group_enter(v8);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_53;
  v16[3] = &unk_24DAA01A8;
  v18 = v19;
  v9 = v8;
  v17 = v9;
  -[_UIKeyboardArbiter retrieveClientDebugInformationWithCompletion:](self, "retrieveClientDebugInformationWithCompletion:", v16);
  queue = self->_queue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_2;
  block[3] = &unk_24DAA01D0;
  v13 = v4;
  v14 = v24;
  v15 = v19;
  v11 = v4;
  dispatch_group_notify(v9, queue, block);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v24, 8);

}

- (void)attemptConnection
{
  void *v3;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[_UIKeyboardArbiter sceneLink](self, "sceneLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39___UIKeyboardArbiter_attemptConnection__block_invoke;
  v4[3] = &unk_24DAA0310;
  v4[4] = self;
  objc_msgSend(v3, "createSceneWithCompletion:", v4);

}

- (id)hostBundleIdentifierForHandle:(id)a3 hosts:(id)a4
{
  void *v4;
  void *v5;

  -[_UIKeyboardArbiter hostForHandle:hosts:](self, "hostForHandle:hosts:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateKeyboardUIStatus:(id)a3 fromHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  __int128 *v9;
  void *v10;
  void *v11;
  _UIKeyboardUIInformation *v12;
  _UIKeyboardUIInformation *lastUIInformation;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  __int128 *v32;
  void *v33;
  void *v34;
  NSString *v35;
  id pendingNotifyKeyboardChanged;
  NSString *v37;
  NSString *pendingBundleIdentifier;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id obj;
  void (**v46)(_QWORD, _QWORD);
  NSMutableArray *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _BYTE v56[128];
  int v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
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
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v44 = a4;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  _UIArbiterLog();
  v7 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  v57 = 138412802;
  v58 = (id)objc_opt_class();
  v59 = 2112;
  v60 = v6;
  v61 = 2112;
  v62 = v44;
  v8 = v58;
  LODWORD(v40) = 32;
  v9 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v57, v40);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v63);
  objc_msgSend(v10, "infoWithMessage:", v11);

  if (v9 != &v63)
    free(v9);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if ((objc_msgSend(v6, "hasValidNotification") & 1) == 0)
  {
    v12 = (_UIKeyboardUIInformation *)objc_msgSend(v6, "copy");
    lastUIInformation = self->_lastUIInformation;
    self->_lastUIInformation = v12;

  }
  v14 = (void *)objc_msgSend(v6, "copy");
  v15 = (void *)objc_msgSend(v14, "copyWithoutFence");
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke;
  v53[3] = &unk_24DAA03C8;
  v53[4] = self;
  v43 = v14;
  v54 = v43;
  v42 = v15;
  v55 = v42;
  v46 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A2F288](v53);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = self->_clients;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (!v16)
  {

LABEL_27:
    objc_msgSend(v6, "bundleIdentifier");
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    pendingBundleIdentifier = self->_pendingBundleIdentifier;
    self->_pendingBundleIdentifier = v37;

    v39 = (void *)MEMORY[0x219A2F288](v46);
    pendingNotifyKeyboardChanged = self->_pendingNotifyKeyboardChanged;
    self->_pendingNotifyKeyboardChanged = v39;
    goto LABEL_28;
  }
  v17 = 0;
  v48 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v50 != v48)
        objc_enumerationMutation(v47);
      v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      if ((objc_msgSend(v19, "inputUIHost") & 1) == 0)
      {
        if ((v17 & 1) != 0)
        {
          v20 = 0;
        }
        else
        {
          objc_msgSend(v19, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "bundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v21, "isEqualToString:", v22);

        }
        v17 |= v20;
        if (objc_msgSend(v19, "deactivating"))
        {
          objc_msgSend(v19, "setPendingNotifyKeyboardChanged:", v46);
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          _UIArbiterLog();
          v23 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          v24 = (void *)objc_opt_class();
          v57 = 138412546;
          v58 = v24;
          v59 = 2112;
          v60 = v19;
          v25 = v24;
          LODWORD(v41) = 22;
          v26 = (__int128 *)_os_log_send_and_compose_impl();

          +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v57, v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v63);
          objc_msgSend(v27, "infoWithMessage:", v28);

          if (v26 != &v63)
            free(v26);
        }
        else if (!objc_msgSend(v6, "resizing") || objc_msgSend(v19, "active"))
        {
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          _UIArbiterLog();
          v29 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
          v30 = (void *)objc_opt_class();
          v57 = 138412546;
          v58 = v30;
          v59 = 2112;
          v60 = v19;
          v31 = v30;
          LODWORD(v41) = 22;
          v32 = (__int128 *)_os_log_send_and_compose_impl();

          +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v57, v41);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v63);
          objc_msgSend(v33, "infoWithMessage:", v34);

          if (v32 != &v63)
            free(v32);
          ((void (**)(_QWORD, void *))v46)[2](v46, v19);
        }
      }
    }
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  }
  while (v16);

  if ((v17 & 1) == 0)
    goto LABEL_27;
  v35 = self->_pendingBundleIdentifier;
  self->_pendingBundleIdentifier = 0;

  pendingNotifyKeyboardChanged = self->_pendingNotifyKeyboardChanged;
  self->_pendingNotifyKeyboardChanged = 0;
LABEL_28:

  objc_msgSend(v6, "resetAnimationFencing");
  objc_msgSend(v43, "resetAnimationFencing");

  objc_sync_exit(obj);
}

- (void)_findForHandle:(id)a3 deepestHandleHandler:(id)a4 checklist:(id)a5
{
  id v8;
  void (**v9)(id, id);
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, id))a4;
  v10 = a5;
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "addObject:", v8);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_clients;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v13)
  {

LABEL_16:
    v9[2](v9, v8);
    goto LABEL_17;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v20 != v16)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if ((objc_msgSend(v11, "containsObject:", v18, (_QWORD)v19) & 1) == 0
        && objc_msgSend(v18, "isHostingPID:", objc_msgSend(v8, "processIdentifier")))
      {
        ++v15;
        -[_UIKeyboardArbiter _findForHandle:deepestHandleHandler:checklist:](self, "_findForHandle:deepestHandleHandler:checklist:", v18, v9, v11);
      }
    }
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v14);

  if (!v15)
    goto LABEL_16;
LABEL_17:

}

- (void)_findForHandle:(id)a3 deepestHandleHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDBCEB8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiter _findForHandle:deepestHandleHandler:checklist:](self, "_findForHandle:deepestHandleHandler:checklist:", v8, v7, v9);

}

- (void)notifyHeightUpdated:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke;
  v32[3] = &unk_24DAA04A8;
  v32[4] = self;
  v6 = v5;
  v33 = v6;
  -[_UIKeyboardArbiter _findForHandle:deepestHandleHandler:](self, "_findForHandle:deepestHandleHandler:", v4, v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "doubleValue");
        if (v11 < v13)
          v11 = v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = v6;
  objc_msgSend(v6, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v20 = objc_msgSend(v19, "intValue");
        if (v20 != objc_msgSend(v4, "processIdentifier"))
        {
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke_2;
          v23[3] = &__block_descriptor_40_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
          *(double *)&v23[4] = v11;
          -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:", objc_msgSend(v19, "intValue"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v23, v21, "-[_UIKeyboardArbiter notifyHeightUpdated:]");

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v16);
  }

}

- (id)lastActivatedHandle
{
  return objc_loadWeakRetained((id *)&self->_lastActivatedHandle);
}

- (void)checkHostingState
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  __int128 *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  int v48;
  void *v49;
  __int16 v50;
  void *v51;
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
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)&self->_keyboardUIHandle);

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v7 = self->_clients;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v84, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v44 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            if ((objc_msgSend(v12, "inputUIHost") & 1) == 0)
            {
              if (objc_msgSend(v12, "running"))
              {
                if (objc_msgSend(v12, "wantedState"))
                {
                  if ((objc_msgSend(v12, "active") & 1) == 0)
                  {
                    v13 = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);
                    v14 = objc_msgSend(v12, "isHandlerShowableWithHandler:", v13);

                    if (v14)
                      objc_msgSend(v6, "addObject:", v12);
                  }
                }
              }
            }
          }
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v43, v84, 16);
        }
        while (v9);
      }

      if (!objc_msgSend(v6, "count"))
      {
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
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        _UIArbiterLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        v22 = (void *)objc_opt_class();
        v48 = 138412290;
        v49 = v22;
        v23 = v22;
        LODWORD(v38) = 12;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v48, v38);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v52);
        objc_msgSend(v25, "errorWithMessage:", v26);

        if (v24 != &v52)
          free(v24);
        goto LABEL_32;
      }
      if ((unint64_t)objc_msgSend(v6, "count") < 2)
      {
        v82 = 0uLL;
        v83 = 0uLL;
        v80 = 0uLL;
        v81 = 0uLL;
        v78 = 0uLL;
        v79 = 0uLL;
        v76 = 0uLL;
        v77 = 0uLL;
        v74 = 0uLL;
        v75 = 0uLL;
        v72 = 0uLL;
        v73 = 0uLL;
        v70 = 0uLL;
        v71 = 0uLL;
        v68 = 0uLL;
        v69 = 0uLL;
        v66 = 0uLL;
        v67 = 0uLL;
        v64 = 0uLL;
        v65 = 0uLL;
        v62 = 0uLL;
        v63 = 0uLL;
        v60 = 0uLL;
        v61 = 0uLL;
        v58 = 0uLL;
        v59 = 0uLL;
        v56 = 0uLL;
        v57 = 0uLL;
        v54 = 0uLL;
        v55 = 0uLL;
        v52 = 0uLL;
        v53 = 0uLL;
        _UIArbiterLog();
        v27 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
        v28 = (void *)objc_opt_class();
        v29 = v28;
        objc_msgSend(v6, "lastObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138412546;
        v49 = v28;
        v50 = 2112;
        v51 = v30;
        LODWORD(v38) = 22;
        v18 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v48, v38);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v52);
        objc_msgSend(v31, "debugWithMessage:", v32);

        if (v18 == &v52)
        {
LABEL_24:
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v33 = v6;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v40 != v36)
                  objc_enumerationMutation(v33);
                objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "checkActivation:", 1);
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v35);
          }

          -[_UIKeyboardArbiter reevaluateSceneClientSettings](self, "reevaluateSceneClientSettings");
          -[_UIKeyboardArbiter updateKeyboardSceneSettings](self, "updateKeyboardSceneSettings");
LABEL_32:

          return;
        }
      }
      else
      {
        v82 = 0uLL;
        v83 = 0uLL;
        v80 = 0uLL;
        v81 = 0uLL;
        v78 = 0uLL;
        v79 = 0uLL;
        v76 = 0uLL;
        v77 = 0uLL;
        v74 = 0uLL;
        v75 = 0uLL;
        v72 = 0uLL;
        v73 = 0uLL;
        v70 = 0uLL;
        v71 = 0uLL;
        v68 = 0uLL;
        v69 = 0uLL;
        v66 = 0uLL;
        v67 = 0uLL;
        v64 = 0uLL;
        v65 = 0uLL;
        v62 = 0uLL;
        v63 = 0uLL;
        v60 = 0uLL;
        v61 = 0uLL;
        v58 = 0uLL;
        v59 = 0uLL;
        v56 = 0uLL;
        v57 = 0uLL;
        v54 = 0uLL;
        v55 = 0uLL;
        v52 = 0uLL;
        v53 = 0uLL;
        _UIArbiterLog();
        v15 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        v16 = (void *)objc_opt_class();
        v48 = 138412546;
        v49 = v16;
        v50 = 2112;
        v51 = v6;
        v17 = v16;
        LODWORD(v38) = 22;
        v18 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v48, v38);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v52);
        objc_msgSend(v19, "errorWithMessage:", v20);

        if (v18 == &v52)
          goto LABEL_24;
      }
      free(v18);
      goto LABEL_24;
    }
  }
}

- (void)handleUnexpectedDeallocForHandler:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  NSObject *queue;
  _QWORD v9[4];
  id v10;
  _UIKeyboardArbiter *v11;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56___UIKeyboardArbiter_handleUnexpectedDeallocForHandler___block_invoke;
  v9[3] = &unk_24DAA00C0;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (void (**)(_QWORD))MEMORY[0x219A2F288](v9);
  dispatch_get_current_queue();
  v7 = objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  if (v7 == queue)
    v6[2](v6);
  else
    dispatch_sync(queue, v6);

}

- (void)prewarmFocusContext
{
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeInputDestinationHandle);

  if (!WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
    if (v4)
    {
      v5 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
      objc_msgSend(v5, "level");

    }
    v6 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
    objc_msgSend(v6, "remoteFocusContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = self->_clients;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v13, "active", (_QWORD)v25))
          {
            objc_msgSend(v13, "remoteFocusContext");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "sceneIdentity");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              v16 = objc_loadWeakRetained((id *)&self->_focusRequestedHandle);
              v17 = objc_msgSend(v13, "isHandlerShowableWithHandler:", v16);

              if (v17)
              {
                objc_msgSend(v13, "level");
                objc_msgSend(v13, "remoteFocusContext");
                v18 = objc_claimAutoreleasedReturnValue();

                v7 = (void *)v18;
              }
            }
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v10);
    }

    -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v7, "sceneIdentity");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21 && (v22 = (void *)v21, v23 = objc_msgSend(v7, "contextID"), v22, !v23))
      {
        _UIArbiterLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[_UIKeyboardArbiter prewarmFocusContext]";
          v31 = 2112;
          v32 = v7;
          _os_log_debug_impl(&dword_21955F000, v24, OS_LOG_TYPE_DEBUG, "%s  skipping prewarming focustContext = %@", buf, 0x16u);
        }
      }
      else
      {
        -[_UIKeyboardArbiter sceneDelegate](self, "sceneDelegate", (_QWORD)v25);
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSObject focusContextDidChange:](v24, "focusContextDidChange:", v7);
      }

    }
  }
}

- (void)updateSuppression:(BOOL)a3 ofPID:(id)a4 active:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  _QWORD v10[4];
  BOOL v11;

  v5 = a5;
  v6 = a3;
  -[_UIKeyboardArbiter handlerForPID:](self, "handlerForPID:", objc_msgSend(a4, "intValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[1] = 3221225472;
    v10[2] = __53___UIKeyboardArbiter_updateSuppression_ofPID_active___block_invoke;
    v10[3] = &__block_descriptor_33_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
    v11 = v6;
    v9 = v8;
    v10[0] = MEMORY[0x24BDAC760];
    -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v10, v8, "-[_UIKeyboardArbiter updateSuppression:ofPID:active:]");
    objc_msgSend(v9, "notifyHostedPIDsOfSuppression:active:", v6, v5);
    v8 = v9;
  }

}

- (void)updateSuppression:(BOOL)a3 ofPIDs:(id)a4 active:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  _OWORD *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  int v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  _OWORD v33[32];
  uint64_t v34;

  v5 = a5;
  v6 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v33, 0, sizeof(v33));
  _UIArbiterLog();
  v9 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  v10 = (void *)objc_opt_class();
  v11 = CFSTR("NO");
  v27 = 138412802;
  v28 = v10;
  v29 = 2112;
  if (v6)
    v11 = CFSTR("YES");
  v30 = v11;
  v31 = 2112;
  v32 = v8;
  v12 = v10;
  LODWORD(v21) = 32;
  v13 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v27, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v33);
  objc_msgSend(v14, "debugWithMessage:", v15);

  if (v13 != v33)
    free(v13);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        -[_UIKeyboardArbiter updateSuppression:ofPID:active:](self, "updateSuppression:ofPID:active:", v6, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v5);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

}

- (void)activateClients
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_clients;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "active", (_QWORD)v9))
          -[_UIKeyboardArbiter activateHandle:](self, "activateHandle:", v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)handlerForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  void *i;
  void *v10;
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
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_24DAA0D08) & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_clients;
    v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "bundleIdentifier", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v5);

          if ((v12 & 1) != 0)
          {
            v6 = v10;
            goto LABEL_14;
          }
        }
        v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)handlerForToken:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSMutableArray *clients;
  id v17;
  __int128 *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _UIKeyboardArbiter *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  id v30;
  __int16 v31;
  NSMutableArray *v32;
  _BYTE v33[128];
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  if (v24)
  {
    v27 = 0uLL;
    v28 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v23 = self;
    v4 = self->_clients;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v9, "remoteFocusContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sceneIdentity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            v17 = v9;

            goto LABEL_16;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v6)
          continue;
        break;
      }
    }

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
    v34 = 0u;
    v35 = 0u;
    _UIArbiterLog();
    v15 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    clients = v23->_clients;
    v29 = 138543618;
    v30 = v24;
    v31 = 2114;
    v32 = clients;
    LODWORD(v22) = 22;
  }
  else
  {
    v64 = 0uLL;
    v65 = 0uLL;
    v62 = 0uLL;
    v63 = 0uLL;
    v60 = 0uLL;
    v61 = 0uLL;
    v58 = 0uLL;
    v59 = 0uLL;
    v56 = 0uLL;
    v57 = 0uLL;
    v54 = 0uLL;
    v55 = 0uLL;
    v52 = 0uLL;
    v53 = 0uLL;
    v50 = 0uLL;
    v51 = 0uLL;
    v48 = 0uLL;
    v49 = 0uLL;
    v46 = 0uLL;
    v47 = 0uLL;
    v44 = 0uLL;
    v45 = 0uLL;
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    v38 = 0uLL;
    v39 = 0uLL;
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    _UIArbiterLog();
    v15 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    LOWORD(v29) = 0;
    LODWORD(v22) = 2;
  }
  v18 = (__int128 *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v29, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v34);
  objc_msgSend(v19, "debugWithMessage:", v20);

  if (v18 != &v34)
    free(v18);
  v17 = 0;
LABEL_16:

  return v17;
}

- (void)transition:(id)a3 eventStage:(unint64_t)a4 withInfo:(id)a5 fromHandler:(id)a6
{
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSMutableArray *v18;
  NSObject *v19;
  _BYTE *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  int v36;
  NSMutableArray *v37;
  _BYTE v38[520];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v25 = a5;
  v9 = (NSMutableArray *)a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!objc_msgSend(MEMORY[0x24BEBD6C8], "inputUIOOP")
    || (-[NSMutableArray active](v9, "active") & 1) != 0)
  {
LABEL_6:
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = self->_clients;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(NSMutableArray **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (v18 != v9)
          {
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __65___UIKeyboardArbiter_transition_eventStage_withInfo_fromHandler___block_invoke;
            v27[3] = &unk_24DAA05B0;
            v28 = v26;
            v30 = a4;
            v29 = v25;
            -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v27, v18, "-[_UIKeyboardArbiter transition:eventStage:withInfo:fromHandler:]");

          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v15);
    }
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiter hostForHandle:hosts:](self, "hostForHandle:hosts:", v9, v10);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  v12 = v9;
  if (v11)
  {
    v12 = v11;
    if ((-[NSMutableArray active](v11, "active") & 1) != 0)
    {

      goto LABEL_6;
    }
  }
  memset(v38, 0, 512);
  _UIArbiterLog();
  v19 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  v36 = 138412290;
  v37 = v12;
  LODWORD(v23) = 12;
  v20 = (_BYTE *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v36, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v38);
  objc_msgSend(v21, "debugWithMessage:", v22);

  if (v20 != v38)
    free(v20);
  v13 = v11;
LABEL_19:

}

- (void)handlerRequestedForcedClientSceneIdentityUpdate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _OWORD *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  _OWORD v22[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(v5, "inputUIHost") & 1) == 0)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_msgSend(v5, "remoteFocusContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyboardArbiter.m"), 1428, CFSTR("Handler must have a remote scene identity: %@"), v5);

    }
    if ((objc_msgSend(v5, "requestedCorrectionOfClientSceneIdentityWhileAcquiringFocus") & 1) == 0)
    {
      memset(v22, 0, sizeof(v22));
      _UIArbiterLog();
      v8 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
      v18 = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v5;
      v9 = v19;
      LODWORD(v15) = 22;
      v10 = (_OWORD *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v18, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v22);
      objc_msgSend(v11, "debugWithMessage:", v12);

      if (v10 != v22)
        free(v10);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __70___UIKeyboardArbiter_handlerRequestedForcedClientSceneIdentityUpdate___block_invoke;
      v16[3] = &unk_24DAA05F8;
      v13 = v5;
      v17 = v13;
      -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v16, v13, "-[_UIKeyboardArbiter handlerRequestedForcedClientSceneIdentityUpdate:]");
      objc_msgSend(v13, "setRequestedCorrectionOfClientSceneIdentityWhileAcquiringFocus:", 1);

    }
  }

}

- (void)setKeyboardTotalDisable:(BOOL)a3 withFence:(id)a4 fromHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id WeakRetained;
  uint64_t v18;
  void *v19;
  dispatch_time_t v20;
  NSObject *queue;
  id v22;
  BOOL v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id *location;
  void (**v34)(_QWORD, _QWORD);
  id obj;
  _QWORD v36[4];
  BOOL v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[5];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v8 = a3;
  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke;
  v46[3] = &unk_24DAA0620;
  v13 = v10;
  v47 = v13;
  v14 = v12;
  v48 = v14;
  v15 = (void *)MEMORY[0x219A2F288](v46);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_2;
  v44[3] = &unk_24DAA0648;
  v16 = v15;
  v45 = v16;
  v34 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A2F288](v44);
  location = (id *)&self->_disablingHandle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_disablingHandle);
  LODWORD(a6) = WeakRetained == 0;

  if (((a6 ^ v8) & 1) != 0)
  {
    v18 = 1;
LABEL_11:
    v34[2](v34, v18);
    goto LABEL_25;
  }
  if (v8)
  {
    if (v13)
      +[_UIKeyboardChangedInformationWithManualFence pushFence:](_UIKeyboardChangedInformationWithManualFence, "pushFence:", v13);
    +[_UIKeyboardChangedInformation informationForKeyboardDown](_UIKeyboardChangedInformationWithManualFence, "informationForKeyboardDown");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:](self, "updateKeyboardStatus:fromHandler:", v19, v11);

    if (v13)
      +[_UIKeyboardChangedInformationWithManualFence popFence](_UIKeyboardChangedInformationWithManualFence, "popFence");
    v20 = dispatch_time(0, 500000000);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_3;
    block[3] = &unk_24DAA00C0;
    block[4] = self;
    v43 = v11;
    dispatch_after(v20, queue, block);

  }
  else
  {
    v22 = objc_loadWeakRetained(location);
    v23 = v22 == v11;

    if (!v23)
    {
      v18 = 2;
      goto LABEL_11;
    }
  }
  v30 = v16;
  v31 = v14;
  v32 = v13;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = self->_clients;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if ((objc_msgSend(v28, "inputUIHost", v30, v31, v32) & 1) == 0)
        {
          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_4;
          v36[3] = &__block_descriptor_33_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
          v37 = v8;
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v36, v28, "-[_UIKeyboardArbiter setKeyboardTotalDisable:withFence:fromHandler:completionHandler:]");
        }
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v25);
  }

  v13 = v32;
  v16 = v30;
  v14 = v31;
  if (v8)
    v29 = v11;
  else
    v29 = 0;
  objc_storeWeak(location, v29);
  (*((void (**)(id, _QWORD))v30 + 2))(v30, 0);
LABEL_25:

  objc_sync_exit(obj);
}

- (void)signalEventSourceChanged:(int64_t)a3 fromHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v15 = (void (**)(_QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_lastEventSource = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_clients;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v14 != v8)
        {
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __77___UIKeyboardArbiter_signalEventSourceChanged_fromHandler_completionHandler___block_invoke;
          v16[3] = &__block_descriptor_40_e49_v24__0____UIKeyboardArbitrationClient__8___v___16l;
          v16[4] = a3;
          -[_UIKeyboardArbiter runOperations:onHandler:fromFunction:](self, "runOperations:onHandler:fromFunction:", v16, v14, "-[_UIKeyboardArbiter signalEventSourceChanged:fromHandler:completionHandler:]");
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  if (v15)
    v15[2](v15);

}

- (id)_activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __int128 *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  int v26;
  void *v27;
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
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[_UIKeyboardArbiter _activeHandleForFocusEvaluation](self, "_activeHandleForFocusEvaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "remoteFocusContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    v11 = v9;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardArbiter hostForHandle:hosts:](self, "hostForHandle:hosts:", v10, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v11, "remoteFocusContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sceneIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v58 = 0uLL;
    v59 = 0uLL;
    v56 = 0uLL;
    v57 = 0uLL;
    v54 = 0uLL;
    v55 = 0uLL;
    v52 = 0uLL;
    v53 = 0uLL;
    v50 = 0uLL;
    v51 = 0uLL;
    v48 = 0uLL;
    v49 = 0uLL;
    v46 = 0uLL;
    v47 = 0uLL;
    v44 = 0uLL;
    v45 = 0uLL;
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    v38 = 0uLL;
    v39 = 0uLL;
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    v32 = 0uLL;
    v33 = 0uLL;
    v30 = 0uLL;
    v31 = 0uLL;
    v28 = 0uLL;
    v29 = 0uLL;
    _UIArbiterLog();
    v15 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    v26 = 138412290;
    v27 = v11;
    LODWORD(v25) = 12;
    v16 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v26, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v28);
    objc_msgSend(v17, "debugWithMessage:", v18);

    if (v16 != &v28)
      free(v16);
    v19 = v11;
  }
  else
  {
    v58 = 0uLL;
    v59 = 0uLL;
    v56 = 0uLL;
    v57 = 0uLL;
    v54 = 0uLL;
    v55 = 0uLL;
    v52 = 0uLL;
    v53 = 0uLL;
    v50 = 0uLL;
    v51 = 0uLL;
    v48 = 0uLL;
    v49 = 0uLL;
    v46 = 0uLL;
    v47 = 0uLL;
    v44 = 0uLL;
    v45 = 0uLL;
    v42 = 0uLL;
    v43 = 0uLL;
    v40 = 0uLL;
    v41 = 0uLL;
    v38 = 0uLL;
    v39 = 0uLL;
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    v32 = 0uLL;
    v33 = 0uLL;
    v30 = 0uLL;
    v31 = 0uLL;
    v28 = 0uLL;
    v29 = 0uLL;
    _UIArbiterLog();
    v20 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    LOWORD(v26) = 0;
    LODWORD(v25) = 2;
    v21 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v26, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v28);
    objc_msgSend(v22, "debugWithMessage:", v23);

    if (v21 != &v28)
      free(v21);
    v19 = 0;
  }

  return v19;
}

- (id)_previouslyFocusedHostHandle
{
  _UIKeyboardArbiterClientHandle **p_previouslyActiveHandle;
  id WeakRetained;
  NSObject *v5;
  id v6;
  __int128 *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSMutableArray *clients;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSObject *v25;
  __int128 *v26;
  void *v27;
  void *v28;
  NSObject *v30;
  __int128 *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  __int128 *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  int v50;
  id v51;
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
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_previouslyActiveHandle = &self->_previouslyActiveHandle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previouslyActiveHandle);

  if (WeakRetained)
  {
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
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    _UIArbiterLog();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    v6 = objc_loadWeakRetained((id *)p_previouslyActiveHandle);
    v50 = 138412290;
    v51 = v6;
    LODWORD(v38) = 12;
    v7 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v50, v38);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v52);
    objc_msgSend(v8, "debugWithMessage:", v9);

    if (v7 != &v52)
      free(v7);
    v10 = objc_loadWeakRetained((id *)p_previouslyActiveHandle);
    return v10;
  }
  else
  {
    if (-[NSMutableOrderedSet count](self->_recentlyActiveSceneIdentities, "count"))
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      -[NSMutableOrderedSet reverseObjectEnumerator](self->_recentlyActiveSceneIdentities, "reverseObjectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v45;
        v15 = MEMORY[0x24BDAC760];
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v45 != v14)
              objc_enumerationMutation(v11);
            v17 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            clients = self->_clients;
            v43[0] = v15;
            v43[1] = 3221225472;
            v43[2] = __50___UIKeyboardArbiter__previouslyFocusedHostHandle__block_invoke;
            v43[3] = &unk_24DAA0670;
            v43[4] = v17;
            v19 = -[NSMutableArray indexOfObjectPassingTest:](clients, "indexOfObjectPassingTest:", v43);
            if (v19 != 0x7FFFFFFFFFFFFFFFLL)
            {
              -[NSMutableArray objectAtIndex:](self->_clients, "objectAtIndex:", v19);
              v10 = (id)objc_claimAutoreleasedReturnValue();
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
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              _UIArbiterLog();
              v30 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
              v50 = 138412290;
              v51 = v10;
              LODWORD(v38) = 12;
              v31 = (__int128 *)_os_log_send_and_compose_impl();

              +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v50, v38);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v52);
              objc_msgSend(v32, "debugWithMessage:", v33);

              if (v31 != &v52)
                free(v31);
LABEL_31:

              return v10;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          if (v13)
            continue;
          break;
        }
      }

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_clients, "reverseObjectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      while (2)
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v11);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          if (objc_msgSend(v24, "active"))
          {
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
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            _UIArbiterLog();
            v34 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
            v50 = 138412290;
            v51 = v24;
            LODWORD(v38) = 12;
            v35 = (__int128 *)_os_log_send_and_compose_impl();

            +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v50, v38);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v52);
            objc_msgSend(v36, "debugWithMessage:", v37);

            if (v35 != &v52)
              free(v35);
            v10 = v24;
            goto LABEL_31;
          }
        }
        v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v21)
          continue;
        break;
      }
    }

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
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    _UIArbiterLog();
    v25 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    LOWORD(v50) = 0;
    LODWORD(v38) = 2;
    v26 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v50, v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v52);
    objc_msgSend(v27, "debugWithMessage:", v28);

    if (v26 != &v52)
      free(v26);
    return 0;
  }
}

- (void)keyboardFocusDidChangeWithoutAdvisorInputToPid:(int)a3 sceneIdentity:(id)a4
{
  uint64_t v5;
  id v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  uint64_t v15;
  _QWORD block[5];
  id v17;
  unint64_t v18;
  int v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  _OWORD v26[32];
  uint64_t v27;

  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  os_unfair_lock_lock(&self->_pendingFocusLock);
  v8 = self->_pendingFocusLock_generation + 1;
  self->_pendingFocusLock_generation = v8;
  self->_pendingFocusLock_PID = v5;
  objc_storeStrong((id *)&self->_pendingFocusLock_sceneIdentity, a4);
  os_unfair_lock_unlock(&self->_pendingFocusLock);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    memset(v26, 0, sizeof(v26));
    _UIArbiterLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    objc_msgSend(v7, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218498;
    v21 = v8;
    v22 = 1024;
    v23 = v5;
    v24 = 2112;
    v25 = v10;
    LODWORD(v15) = 28;
    v11 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v20, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v26);
    objc_msgSend(v12, "debugWithMessage:", v13);

    if (v11 != v26)
      free(v11);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83___UIKeyboardArbiter_keyboardFocusDidChangeWithoutAdvisorInputToPid_sceneIdentity___block_invoke;
    block[3] = &unk_24DAA0698;
    block[4] = self;
    v18 = v8;
    v19 = v5;
    v17 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    -[_UIKeyboardArbiter _arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:pid:sceneIdentity:](self, "_arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:pid:sceneIdentity:", v8, v5, v7);
  }

}

- (void)_arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:(unint64_t)a3 pid:(int)a4 sceneIdentity:(id)a5
{
  NSObject *queue;
  id v9;
  NSObject *v10;
  void *v11;
  _OWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  _OWORD v22[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v9 = a5;
  dispatch_assert_queue_V2(queue);
  memset(v22, 0, sizeof(v22));
  _UIArbiterLog();
  v10 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  objc_msgSend(v9, "stringRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 134218498;
  v17 = a3;
  v18 = 1024;
  v19 = a4;
  v20 = 2112;
  v21 = v11;
  LODWORD(v15) = 28;
  v12 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v16, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v22);
  objc_msgSend(v13, "debugWithMessage:", v14);

  if (v12 != v22)
    free(v12);
  -[_UIKeyboardArbiter _applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:](self, "_applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:", a3);
}

- (id)_handleForSceneIdentity:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
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
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_clients;
    v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "remoteFocusContext", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sceneIdentity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v4);

          if ((v12 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  unint64_t pendingFocusLock_generation;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _UIKeyboardArbiterSceneFocusChange *v12;
  __int128 *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  _UIKeyboardArbiterSceneFocusRequest *v18;
  _UIKeyboardArbiterSceneFocusChange *v19;
  void *v20;
  void *v21;
  _UIKeyboardArbiterSceneFocusChange *v22;
  NSObject *v23;
  _UIKeyboardArbiterSceneFocusChange *v24;
  __int128 *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  NSObject *v31;
  _UIKeyboardArbiterSceneFocusChange *v32;
  __int128 *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  __int128 *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  int v45;
  _UIKeyboardArbiterSceneFocusChange *v46;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v3 = a3;
  v79 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_omniscientDelegate);

  if (WeakRetained)
  {
    os_unfair_lock_lock(&self->_pendingFocusLock);
    pendingFocusLock_generation = self->_pendingFocusLock_generation;
    os_unfair_lock_unlock(&self->_pendingFocusLock);
    -[_UIKeyboardArbiter _applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:](self, "_applyPendingSceneFocusUpdateFromOmniscientDelegateForGeneration:", pendingFocusLock_generation);
    v44 = 0;
    -[_UIKeyboardArbiter _activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:](self, "_activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:", &v44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v44;
    objc_msgSend(v7, "remoteFocusContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sceneIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (BSEqualObjects())
    {
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
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
      v54 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      _UIArbiterLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      objc_msgSend(v7, "sceneDescription");
      v12 = (_UIKeyboardArbiterSceneFocusChange *)objc_claimAutoreleasedReturnValue();
      v45 = 138543362;
      v46 = v12;
      LODWORD(v42) = 12;
      v13 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v45, v42);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v47);
      objc_msgSend(v14, "debugWithMessage:", v15);

      if (v13 != &v47)
        free(v13);
    }
    else
    {
      v16 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        v18 = -[_UIKeyboardArbiterSceneFocusRequest initWithShouldStealKeyboardOnSuccess:]([_UIKeyboardArbiterSceneFocusRequest alloc], "initWithShouldStealKeyboardOnSuccess:", v3);
        if (v7)
        {
          v19 = [_UIKeyboardArbiterSceneFocusChange alloc];
          objc_msgSend(v7, "remoteFocusContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sceneIdentity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[_UIKeyboardArbiterSceneFocusChange initWithSceneIdentity:pid:](v19, "initWithSceneIdentity:pid:", v21, objc_msgSend(v7, "processIdentifier"));

        }
        else
        {
          +[_UIKeyboardArbiterSceneFocusChange focusNothingChange](_UIKeyboardArbiterSceneFocusChange, "focusNothingChange");
          v22 = (_UIKeyboardArbiterSceneFocusChange *)objc_claimAutoreleasedReturnValue();
        }
        v37 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);
        objc_msgSend(v37, "keyboardArbiterAdvisor:request:sceneFocusChange:", self, v18, v22);

        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
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
        v54 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v47 = 0u;
        _UIArbiterLog();
        v38 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
        v45 = 138543362;
        v46 = v22;
        LODWORD(v42) = 12;
        v39 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v45, v42);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v47);
        objc_msgSend(v40, "debugWithMessage:", v41);

        if (v39 != &v47)
          free(v39);

      }
      else
      {
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
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
        v54 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v47 = 0u;
        _UIArbiterLog();
        v23 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
        objc_msgSend(v7, "sceneDescription");
        v24 = (_UIKeyboardArbiterSceneFocusChange *)objc_claimAutoreleasedReturnValue();
        v45 = 138543362;
        v46 = v24;
        LODWORD(v42) = 12;
        v25 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v45, v42);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v47);
        objc_msgSend(v26, "debugWithMessage:", v27);

        if (v25 != &v47)
          free(v25);
        v28 = objc_msgSend(v7, "processIdentifier");
        v29 = objc_loadWeakRetained((id *)&self->_omniscientDelegate);
        objc_msgSend(v29, "keyboardArbiterAdvisor:requestedSceneFocusDeliberationForFocusedPid:", self, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
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
        v54 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v47 = 0u;
        _UIArbiterLog();
        v31 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
        objc_msgSend(v30, "stringRepresentation");
        v32 = (_UIKeyboardArbiterSceneFocusChange *)objc_claimAutoreleasedReturnValue();
        v45 = 138412290;
        v46 = v32;
        LODWORD(v43) = 12;
        v33 = (__int128 *)_os_log_send_and_compose_impl();

        +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v45, v43);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v47);
        objc_msgSend(v34, "debugWithMessage:", v35);

        if (v33 != &v47)
          free(v33);
        -[_UIKeyboardArbiter _handleForSceneIdentity:](self, "_handleForSceneIdentity:", v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          -[_UIKeyboardArbiter _focusSceneHandle:previousHostFocusHandle:previousLeafFocusHandle:shouldStealKeyboardOnSuccess:](self, "_focusSceneHandle:previousHostFocusHandle:previousLeafFocusHandle:shouldStealKeyboardOnSuccess:", v36, v7, v8, v3);
        else
          -[_UIKeyboardArbiter _invalidateFocus](self, "_invalidateFocus");

      }
    }

  }
}

- (void)_invalidateFocus
{
  -[_UIKeyboardArbiter _updateCurrentKeyboardFocusToPID:sceneIdentity:](self, "_updateCurrentKeyboardFocusToPID:sceneIdentity:", 0xFFFFFFFFLL, 0);
}

- (void)_focusSceneHandle:(id)a3 previousHostFocusHandle:(id)a4 previousLeafFocusHandle:(id)a5 shouldStealKeyboardOnSuccess:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  uint8_t *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  int v32;
  id v33;
  uint8_t buf[32];
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;

  v6 = a6;
  v65 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("must have a handle here"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = self;
      LOWORD(v35) = 2114;
      *(_QWORD *)((char *)&v35 + 2) = CFSTR("_UIKeyboardArbiter.m");
      WORD5(v35) = 1024;
      HIDWORD(v35) = 1798;
      LOWORD(v36) = 2114;
      *(_QWORD *)((char *)&v36 + 2) = v27;
      _os_log_error_impl(&dword_21955F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x219570974);
  }
  v14 = v13;
  v15 = objc_msgSend(v11, "processIdentifier");
  objc_msgSend(v11, "remoteFocusContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sceneIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardArbiter _updateCurrentKeyboardFocusToPID:sceneIdentity:](self, "_updateCurrentKeyboardFocusToPID:sceneIdentity:", v15, v17);

  objc_msgSend(v11, "beginAcquiringFocusOnQueue:", self->_queue);
  v18 = v11 == v14 || v11 == v12;
  if (v18 && v6)
  {
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
    v35 = 0u;
    v36 = 0u;
    memset(buf, 0, sizeof(buf));
    _UIArbiterLog();
    v19 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    v32 = 138412290;
    v33 = v14;
    LODWORD(v31) = 12;
    v20 = (uint8_t *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v32, v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buf);
    objc_msgSend(v21, "debugWithMessage:", v22);

    if (v20 != buf)
      free(v20);
    objc_msgSend(MEMORY[0x24BEBDC80], "informationForKeyboardDown");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteFocusContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sceneIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSourceSceneIdentityString:", v26);

    -[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:fromFocus:](self, "updateKeyboardStatus:fromHandler:fromFocus:", v23, v14, 1);
  }

}

- (void)applySceneFocusChange:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _UIKeyboardArbiter *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___UIKeyboardArbiter_applySceneFocusChange_forRequest___block_invoke;
  block[3] = &unk_24DAA06C0;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (int)presentingKeyboardProcessIdentifier
{
  void *v3;
  _UIKeyboardArbiterClientHandle **p_activeInputDestinationHandle;
  id WeakRetained;
  id v6;
  int v7;

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  p_activeInputDestinationHandle = &self->_activeInputDestinationHandle;
  WeakRetained = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_activeInputDestinationHandle);
    v7 = objc_msgSend(v6, "processIdentifier");

  }
  else
  {
    v7 = -1;
  }
  objc_sync_exit(v3);

  return v7;
}

+ (void)configureEncodedClassesForXPCConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "remoteObjectInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKBArbiterSetForPlacements();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_queue_keyboardTransition_event_withInfo_onComplete_, 2, 0);

  objc_msgSend(v3, "exportedInterface");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  _UIKBArbiterSetForPlacements();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_transition_eventStage_withInfo_, 2, 0);

}

- (void)setOmniscientDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_omniscientDelegate, a3);
}

- (void)setSceneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sceneDelegate, a3);
}

- (_UIKeyboardArbiterClientHandle)keyboardUIHandle
{
  return (_UIKeyboardArbiterClientHandle *)objc_loadWeakRetained((id *)&self->_keyboardUIHandle);
}

- (void)setKeyboardUIHandle:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardUIHandle, a3);
}

- (unint64_t)keyboardScenePresentationMode
{
  return self->_keyboardScenePresentationMode;
}

- (void)setKeyboardScenePresentationMode:(unint64_t)a3
{
  self->_keyboardScenePresentationMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardUIHandle);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_destroyWeak((id *)&self->_sceneDelegate);
  objc_destroyWeak((id *)&self->_omniscientDelegate);
  objc_storeStrong((id *)&self->_sceneLink, 0);
  objc_storeStrong(&self->_pendingNotifyKeyboardChanged, 0);
  objc_storeStrong((id *)&self->_pendingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUIInformation, 0);
  objc_destroyWeak((id *)&self->_disablingHandle);
  objc_storeStrong((id *)&self->_sceneLayer, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_recentlyActiveSceneIdentities, 0);
  objc_destroyWeak((id *)&self->_focusRequestedHandle);
  objc_destroyWeak((id *)&self->_lastActivatedHandle);
  objc_storeStrong((id *)&self->_pendingFocusLock_sceneIdentity, 0);
  objc_storeStrong((id *)&self->_currentFocusSceneIdentity, 0);
  objc_destroyWeak((id *)&self->_previouslyActiveHandle);
  objc_destroyWeak((id *)&self->_activeInputDestinationHandle);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
