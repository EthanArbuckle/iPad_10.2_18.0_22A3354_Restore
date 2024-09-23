@implementation UIKeyboardArbiter

void __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id obj;

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(*((id *)a1[4] + 3), "addObject:", a1[5]);
  objc_msgSend(a1[4], "updateInterestedBundleIDs");
  objc_msgSend(a1[6], "resume");
  v2 = (void *)*((_QWORD *)a1[4] + 23);
  objc_msgSend(a1[5], "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    (*(void (**)(void))(*((_QWORD *)a1[4] + 24) + 16))();
    v4 = a1[4];
    v5 = (void *)v4[23];
    v4[23] = 0;

    v6 = a1[4];
    v7 = (void *)v6[24];
    v6[24] = 0;

  }
  objc_sync_exit(obj);

}

void __35___UIKeyboardArbiter_initWithLink___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endowmentNamespaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", *MEMORY[0x24BE38348]);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = objc_msgSend(v7, "pid");

  objc_msgSend(v6, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "taskState") == 4)
    v13 = v10;
  else
    v13 = 0;
  objc_msgSend(v6, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "processWithPID:foreground:suspended:", v11, v13, objc_msgSend(v14, "taskState") == 3);
}

uint64_t __47___UIKeyboardArbiter_updateInterestedBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPredicates:", *(_QWORD *)(a1 + 32));
}

uint64_t __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2)
    a2 = &unk_24DAA46A8;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, a2);
}

uint64_t __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  if (!objc_msgSend(*(id *)(a1 + 32), "isViewService")
    || (objc_msgSend(*(id *)(a1 + 40), "sourceBundleIdentifier"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Spotlight")),
        v2,
        (v3 & 1) == 0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_2;
    v7[3] = &unk_24DAA03F0;
    v4 = *(void **)(a1 + 48);
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    v10 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 72);
    objc_msgSend(v4, "runOperations:onHandler:fromFunction:", v7, *(_QWORD *)(a1 + 32), "-[_UIKeyboardArbiter updateKeyboardStatus:fromHandler:fromFocus:]_block_invoke");

  }
}

void __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  int v4;
  NSObject *v5;
  __int128 *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __int128 *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  __int128 *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  id v39;
  NSObject *v40;
  __int128 *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  __int128 *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  int v52;
  id v53;
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
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "handlerForPID:", *(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "running");
  objc_msgSend(v2, "setRunning:", *(_BYTE *)(a1 + 44) == 0);
  v4 = objc_msgSend(v2, "running");
  if ((v3 & 1) != 0)
  {
    if ((v4 & 1) != 0)
      goto LABEL_29;
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
    v54 = 0u;
    v55 = 0u;
    _UIArbiterLog();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    v52 = 138412290;
    v53 = v2;
    LODWORD(v48) = 12;
    v6 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v52, v48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v54);
    objc_msgSend(v7, "debugWithMessage:", v8);

    if (v6 != &v54)
      free(v6);
    objc_msgSend(v2, "clearAcquiringFocus");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));

    v10 = WeakRetained == v2;
    if (WeakRetained == v2)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BEBDC80], "informationForKeyboardDown");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateKeyboardStatus:fromHandler:", v12, v2);

      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), 0);
      if (objc_msgSend(v2, "isViewService"))
        objc_msgSend(v2, "activeProcessResign");
    }
    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));

    if (v2 == v13)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 104), 0);
      v10 = 1;
    }
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));

    if (v2 == v14)
    {
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 96), 0);
      v10 = 1;
    }
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
    objc_msgSend(v2, "remoteFocusContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v15, "containsObject:", v18);

    if ((_DWORD)v15)
    {
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
      objc_msgSend(v2, "remoteFocusContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sceneIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObject:", v22);

    }
    else if (!v10)
    {
      goto LABEL_29;
    }
    objc_msgSend(*(id *)(a1 + 32), "reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:", 0);
  }
  else if (v4)
  {
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
    v54 = 0u;
    v55 = 0u;
    _UIArbiterLog();
    v23 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    v52 = 138412290;
    v53 = v2;
    LODWORD(v48) = 12;
    v24 = (__int128 *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v52, v48);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v54);
    objc_msgSend(v25, "debugWithMessage:", v26);

    if (v24 != &v54)
      free(v24);
    v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));

    if (v2 == v27)
    {
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
      v54 = 0u;
      v55 = 0u;
      _UIArbiterLog();
      v31 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
      v52 = 138412290;
      v53 = v2;
      LODWORD(v48) = 12;
      v32 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v52, v48);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v54);
      objc_msgSend(v33, "debugWithMessage:", v34);

      if (v32 != &v54)
        free(v32);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "lastUpdate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBDC80], "informationForKeyboardDown");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v35 = v30;

      if (!objc_msgSend(v2, "isViewService")
        || (objc_msgSend(v35, "sourceBundleIdentifier"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.Spotlight")),
            v36,
            (v37 & 1) == 0))
      {
        v38 = *(void **)(a1 + 32);
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke_118;
        v49[3] = &unk_24DAA0560;
        v50 = v2;
        v51 = v35;
        objc_msgSend(v38, "runOperations:onHandler:fromFunction:", v49, v50, "-[_UIKeyboardArbiter processWithPID:foreground:suspended:]_block_invoke_2");

      }
    }
  }
LABEL_29:
  v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));

  if (v39 == v2)
  {
    if (*(_BYTE *)(a1 + 45))
    {
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
      v54 = 0u;
      v55 = 0u;
      _UIArbiterLog();
      v40 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
      v52 = 138412290;
      v53 = v2;
      LODWORD(v48) = 12;
      v41 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v52, v48);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v54);
      objc_msgSend(v42, "debugWithMessage:", v43);

      if (v41 != &v54)
        free(v41);
      objc_msgSend(v2, "uncacheWindowContext");
    }
    else
    {
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
      v54 = 0u;
      v55 = 0u;
      _UIArbiterLog();
      v44 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);
      v52 = 138412290;
      v53 = v2;
      LODWORD(v48) = 12;
      v45 = (__int128 *)_os_log_send_and_compose_impl();

      +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v52, v48);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v54);
      objc_msgSend(v46, "debugWithMessage:", v47);

      if (v45 != &v54)
        free(v45);
      objc_msgSend(v2, "cacheWindowContext");
    }
  }

}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v14 = v6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_5;
  v15[3] = &unk_24DAA0248;
  v16 = v5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_7;
  v11[3] = &unk_24DAA02C0;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  AsyncTaskWithTimeout(v7, v8, v15, v11);

}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_6;
  v6[3] = &unk_24DAA0298;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "queue_getDebugInfoWithCompletion:", v6);

}

void __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "resizing")
    || objc_msgSend(*(id *)(a1 + 40), "active"))
  {
    v6 = *(void **)(a1 + 40);
    if (v6 == *(void **)(a1 + 48) || !objc_msgSend(v6, "wantsFence"))
      v7 = (_QWORD *)(a1 + 64);
    else
      v7 = (_QWORD *)(a1 + 56);
    objc_msgSend(v8, "queue_keyboardChanged:onComplete:", *v7, v5);
  }

}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_descriptionWithScene:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_2;
  v7[3] = &unk_24DAA0220;
  v8 = v4;
  v9 = v3;
  v5 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __63___UIKeyboardArbiter_completeKeyboardStatusChangedFromHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_keyboardChangedWithCompletion:");
}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  else
    objc_msgSend(v3, "setObject:forKey:", CFSTR("Timed out/hung"), CFSTR("Process"));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));

}

void __67___UIKeyboardArbiter_retrieveClientDebugInformationWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = CFSTR("Description");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_descriptionWithScene:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  if (!v3)
}

uint64_t __42___UIKeyboardArbiter_captureStateForDebug__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "retrieveClientDebugInformationWithCompletion:", a2);
}

void __49___UIKeyboardArbiter_updateKeyboardSceneSettings__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  objc_msgSend(getFBSceneManagerClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneFromIdentityToken:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (objc_msgSend(v3, "settings"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "displayConfiguration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
LABEL_4:
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v6 = (void *)getFBDisplayManagerClass_softClass;
    v30 = getFBDisplayManagerClass_softClass;
    if (!getFBDisplayManagerClass_softClass)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __getFBDisplayManagerClass_block_invoke;
      v26[3] = &unk_24DAA0890;
      v26[4] = &v27;
      __getFBDisplayManagerClass_block_invoke((uint64_t)v26);
      v6 = (void *)v28[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v27, 8);
    objc_msgSend(v7, "mainConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(getFBSceneManagerClass(), "keyboardScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v32.origin.x = v19;
  v32.origin.y = v20;
  v32.size.width = v21;
  v32.size.height = v22;
  v31.origin.x = v10;
  v31.origin.y = v12;
  v31.size.width = v14;
  v31.size.height = v16;
  v23 = CGRectEqualToRect(v31, v32);

  if (!v23)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __49___UIKeyboardArbiter_updateKeyboardSceneSettings__block_invoke_2;
    v24[3] = &unk_24DAA04F0;
    v25 = v5;
    objc_msgSend(v8, "updateSettingsWithBlock:", v24);

  }
}

uint64_t __35___UIKeyboardArbiter_initWithLink___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sceneLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  return objc_msgSend(*(id *)(a1 + 32), "attemptConnection");
}

void __35___UIKeyboardArbiter_initWithLink___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 5);
  v8[0] = *MEMORY[0x24BE38348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndowmentNamespaces:", v5);

  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(v3, "setServiceClass:", 33);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35___UIKeyboardArbiter_initWithLink___block_invoke_3;
  v6[3] = &unk_24DAA0158;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_msgSend(v3, "setUpdateHandler:", v6);
  objc_destroyWeak(&v7);

}

void __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;

  v2 = a2;
  if (!a2)
    a2 = &unk_24DAA46D0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_53(uint64_t a1, void *a2)
{
  void *v2;
  id v4;

  v2 = a2;
  if (!a2)
    a2 = &unk_24DAA46E8;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __61___UIKeyboardArbiter_retrieveDebugInformationWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __39___UIKeyboardArbiter_attemptConnection__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  _OWORD *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[5];
  _WORD v12[8];
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
  {
    memset(v13, 0, sizeof(v13));
    _UIArbiterLog();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    v12[0] = 0;
    LODWORD(v10) = 2;
    v4 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", v12, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v13);
    objc_msgSend(v5, "errorWithMessage:", v6);

    if (v4 != v13)
      free(v4);
    v7 = dispatch_time(0, 1000000000);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39___UIKeyboardArbiter_attemptConnection__block_invoke_87;
    block[3] = &unk_24DAA0130;
    block[4] = v8;
    dispatch_after(v7, v9, block);
  }
}

uint64_t __39___UIKeyboardArbiter_attemptConnection__block_invoke_87(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attemptConnection");
}

void __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  _OWORD v18[32];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  v3 = a2;
  _UIArbiterLog();
  v4 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v12 = 136315650;
  v13 = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2112;
  v17 = v3;
  LODWORD(v11) = 32;
  v7 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v12, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);

  v10 = (void *)objc_msgSend(v9, "initWithUTF8String:", v18);
  objc_msgSend(v8, "errorWithMessage:", v10);

  if (v7 != v18)
    free(v7);
}

uint64_t __59___UIKeyboardArbiter_runOperations_onHandler_fromFunction___block_invoke_90(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(a1 + 40), "releaseProcessAssertion");
}

void __43___UIKeyboardArbiter_scheduleWindowTimeout__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _OWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  _OWORD v30[32];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 136) == *(_DWORD *)(a1 + 40))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = *(id *)(v1 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v23;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v3);
          v8 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v7);
          if (objc_msgSend(v8, "active"))
          {
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
            if (v8 == WeakRetained
              || (objc_msgSend(v8, "running") & 1) != 0
              || objc_msgSend(v8, "hasHostedPids"))
            {

            }
            else
            {
              v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));

              if (v8 != v10)
              {
                memset(v30, 0, sizeof(v30));
                _UIArbiterLog();
                v11 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
                v12 = (void *)objc_opt_class();
                v26 = 138412546;
                v27 = v12;
                v28 = 2112;
                v29 = v8;
                v13 = v12;
                LODWORD(v21) = 22;
                v14 = (_OWORD *)_os_log_send_and_compose_impl();

                +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v26, v21);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v30);
                objc_msgSend(v15, "errorWithMessage:", v16);

                if (v14 != v30)
                  free(v14);
                objc_msgSend(v8, "sceneLayer");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "contextID");
                objc_msgSend(v8, "remoteFocusContext");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setWindowContextID:focusContext:windowState:withLevel:", v18, v19, 0, 0.0);

                objc_msgSend(*(id *)(a1 + 32), "runOperations:onHandler:fromFunction:", &__block_literal_global_0, v8, "-[_UIKeyboardArbiter scheduleWindowTimeout]_block_invoke_2");
              }
            }
          }
          ++v7;
        }
        while (v5 != v7);
        v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        v5 = v20;
      }
      while (v20);
    }

  }
}

uint64_t __43___UIKeyboardArbiter_scheduleWindowTimeout__block_invoke_91(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_keyboardChangedWithCompletion:");
}

void __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke_2;
  v8[3] = &unk_24DAA02E8;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v4, "runOperations:onHandler:fromFunction:", v8, v7, "-[_UIKeyboardArbiter updateKeyboardUIStatus:fromHandler:]_block_invoke");

}

void __57___UIKeyboardArbiter_updateKeyboardUIStatus_fromHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  id WeakRetained;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend(v5, "wantsFence");
  v9 = 48;
  if (v8)
    v9 = 40;
  v11 = (id)objc_msgSend(*(id *)(a1 + v9), "copy");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + 32));
  objc_msgSend(v11, "setIsLocal:", WeakRetained == *(id *)(a1 + 32));

  objc_msgSend(v7, "queue_keyboardUIDidChange:onComplete:", v11, v6);
}

uint64_t __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_endInputSessionWithCompletion:");
}

void __65___UIKeyboardArbiter_updateKeyboardStatus_fromHandler_fromFocus___block_invoke_4(_QWORD *a1)
{
  id v2;
  id WeakRetained;

  v2 = (id)a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 32));

  if (v2 != WeakRetained)
    (*(void (**)(void))(a1[6] + 16))();
}

void __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = a1;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v3, "isHandlerShowableWithHandler:", v9))
        {
          v10 = *(void **)(v14 + 40);
          v11 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v9, "iavHeight");
          objc_msgSend(v11, "numberWithDouble:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v9, "processIdentifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v12, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

uint64_t __42___UIKeyboardArbiter_notifyHeightUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queue_keyboardIAVChanged:onComplete:", *(double *)(a1 + 32));
}

void __56___UIKeyboardArbiter_handleUnexpectedDeallocForHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id obj;

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "clearAcquiringFocus");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  v3 = *(id *)(a1 + 32);

  if (WeakRetained == v3)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 32), 0);
  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  v5 = *(id *)(a1 + 32);

  if (v4 == v5)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 40), 0);
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 96));
  v7 = *(id *)(a1 + 32);

  if (v6 == v7)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 96), 0);
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 104));
  v9 = *(id *)(a1 + 32);

  if (v8 == v9)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 104), 0);
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 240));
  v11 = *(id *)(a1 + 32);

  if (v10 == v11)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 240), 0);
  objc_sync_exit(obj);

}

void __49___UIKeyboardArbiter_updateKeyboardSceneSettings__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDisplayConfiguration:", v3);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v4, "setFrame:");

}

uint64_t __53___UIKeyboardArbiter_updateSuppression_ofPID_active___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_keyboardSuppressed:withCompletion:", *(unsigned __int8 *)(a1 + 32), a3);
}

void __58___UIKeyboardArbiter_processWithPID_foreground_suspended___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "wantsFence"))
  {
    objc_msgSend(v7, "queue_keyboardChanged:onComplete:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyWithoutFence");
    objc_msgSend(v7, "queue_keyboardChanged:onComplete:", v6, v5);

  }
}

uint64_t __65___UIKeyboardArbiter_transition_eventStage_withInfo_fromHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_keyboardTransition:event:withInfo:onComplete:", a1[4], a1[6], a1[5], a3);
}

uint64_t __64___UIKeyboardArbiter_handlerRequestedFocus_shouldStealKeyboard___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_sceneBecameFocused:withCompletion:", 0, a3);
}

void __70___UIKeyboardArbiter_handlerRequestedForcedClientSceneIdentityUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "remoteFocusContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue_sceneBecameFocused:withCompletion:", v7, v5);

}

void __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEBEB38], a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeKeyboardStatusChangedFromHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __86___UIKeyboardArbiter_setKeyboardTotalDisable_withFence_fromHandler_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_setKeyboardDisabled:withCompletion:", *(unsigned __int8 *)(a1 + 32), a3);
}

uint64_t __77___UIKeyboardArbiter_signalEventSourceChanged_fromHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queue_setLastEventSource:withCompletion:", *(_QWORD *)(a1 + 32), a3);
}

uint64_t __50___UIKeyboardArbiter__previouslyFocusedHostHandle__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "remoteFocusContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

uint64_t __83___UIKeyboardArbiter_keyboardFocusDidChangeWithoutAdvisorInputToPid_sceneIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_arbiterQueue_keyboardFocusDidChangeWithoutAdvisorInputForGeneration:pid:sceneIdentity:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __55___UIKeyboardArbiter_applySceneFocusChange_forRequest___block_invoke(id *a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _OWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;
  _OWORD v18[32];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a1[4]
    && (v2 = a1[5]) != 0
    && (objc_msgSend(v2, "_isFocusNothing") & 1) == 0
    && (v3 = a1[6],
        objc_msgSend(a1[5], "sceneIdentity"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_handleForSceneIdentity:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    v6 = a1[6];
    v15 = 0;
    objc_msgSend(v6, "_activeFocusedHostHandleForKeyboardFocusAndGetLeafHandle:", &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    memset(v18, 0, sizeof(v18));
    _UIArbiterLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    objc_msgSend(a1[5], "sceneIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v10;
    LODWORD(v14) = 12;
    v11 = (_OWORD *)_os_log_send_and_compose_impl();

    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v16, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v18);
    objc_msgSend(v12, "infoWithMessage:", v13);

    if (v11 != v18)
      free(v11);
    objc_msgSend(a1[6], "_focusSceneHandle:previousHostFocusHandle:previousLeafFocusHandle:shouldStealKeyboardOnSuccess:", v5, v7, v8, objc_msgSend(a1[4], "shouldStealKeyboardOnSuccess"));

  }
  else
  {
    objc_msgSend(a1[6], "_invalidateFocus");
  }
}

void __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _OWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  uint64_t v17;
  char v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  _OWORD v23[32];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 40);
  memset(v23, 0, sizeof(v23));
  _UIArbiterLog();
  v3 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 48);
  v19 = 138412546;
  v20 = v4;
  v21 = 2112;
  v22 = v5;
  v6 = v4;
  LODWORD(v14) = 22;
  v7 = (_OWORD *)_os_log_send_and_compose_impl();

  +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance", &v19, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v23);
  objc_msgSend(v8, "debugWithMessage:", v9);

  if (v7 != v23)
    free(v7);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_145;
  block[3] = &unk_24DAA06E8;
  v12 = *(_QWORD *)(a1 + 48);
  v16 = v2;
  v17 = v12;
  block[4] = v10;
  v18 = *(_BYTE *)(a1 + 56);
  v13 = v2;
  dispatch_async(v11, block);

}

void __57___UIKeyboardArbiter_listener_shouldAcceptNewConnection___block_invoke_145(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", v15);
  objc_msgSend(*(id *)(a1 + 32), "updateInterestedBundleIDs");
  if ((objc_msgSend(v15, "inputUIHost") & 1) == 0)
    objc_msgSend(v15, "clearAcquiringFocus");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));

  if (v15 == WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEBDC80], "informationForKeyboardDown");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSourceBundleIdentifier:", v4);

    objc_msgSend(*(id *)(a1 + 32), "updateKeyboardStatus:fromHandler:", v3, v15);
    objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "deviceStateIsLocked"))
    {
      objc_msgSend(v15, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Spotlight"));

      if ((v7 & 1) == 0)
      {
        v8 = objc_msgSend(v15, "processIdentifier");
LABEL_9:
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 200) = v8;
        objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), 0);

        goto LABEL_10;
      }
    }
    else
    {

    }
    v8 = 0;
    goto LABEL_9;
  }
LABEL_10:
  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));

  if (v15 == v9)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 96), 0);
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));

  if (v15 == v10)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 104), 0);
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));

  if (v15 == v11)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 240), 0);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 176);
    *(_QWORD *)(v12 + 176) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "reevaluateFocusedSceneIdentityForKeyboardFocusStealingKeyboardOnSuccess:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", 0);
  objc_msgSend(v15, "invalidate");
  if (*(_BYTE *)(a1 + 56))
  {
    +[_UIKeyboardArbiterDebug sharedInstance](_UIKeyboardArbiterDebug, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPause:", 0);

  }
}

void __41___UIKeyboardArbiter_unitTestEnvironment__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_2 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.ios.uikit.TestingHarness"));

}

@end
