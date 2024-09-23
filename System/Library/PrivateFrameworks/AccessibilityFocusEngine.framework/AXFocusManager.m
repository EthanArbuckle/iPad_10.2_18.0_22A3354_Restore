@implementation AXFocusManager

- (AXFocusManager)init
{
  AXFocusManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_queue_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXFocusManager;
  v2 = -[AXFocusManager init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("AXFocusMovementQueue", v3);
    -[AXFocusManager setMovementQueue:](v2, "setMovementQueue:", v4);

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFocusManager setObservers:](v2, "setObservers:", v5);

    -[AXFocusManager setObserversLock:](v2, "setObserversLock:", 0);
    v6 = dispatch_queue_create("com.apple.AXFocusManager.ObserversQueue", v3);
    -[AXFocusManager setObserversQueue:](v2, "setObserversQueue:", v6);

  }
  return v2;
}

- (id)_moveFocusContainerFocusInDirection:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[AXFocusManager currentFocusContainer](self, "currentFocusContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXFocusManager _currentFocusContainers](self, "_currentFocusContainers");
  v6 = objc_claimAutoreleasedReturnValue();
  AXLogFocusEngine();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AXFocusManager _moveFocusContainerFocusInDirection:].cold.4(a3, (uint64_t)v6, v7);

  if ((unint64_t)-[NSObject count](v6, "count") < 2)
  {
    AXLogFocusEngine();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_222ECC000, v9, OS_LOG_TYPE_INFO, "Not able to switch native focused container because we didn't have more than 1: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v8 = -[NSObject indexOfObject:](v6, "indexOfObject:", v5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    AXLogFocusEngine();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXFocusManager _moveFocusContainerFocusInDirection:].cold.1();
LABEL_9:
    v10 = v5;
    goto LABEL_34;
  }
  v11 = v8;
  v12 = v8;
  while (1)
  {
    v13 = v6;
    v14 = v13;
    if (a3 == 1)
    {
      if (-[NSObject count](v13, "count") - 1 == v12)
        v12 = 0;
      else
        ++v12;
    }
    else if (v12)
    {
      --v12;
    }
    else
    {
      v12 = -[NSObject count](v13, "count") - 1;
    }

    -[NSObject objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[AXFocusManager _focusOnFocusContainer:](self, "_focusOnFocusContainer:", v9))
      break;
    AXLogFocusEngine();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12 == v11)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222ECC000, v16, OS_LOG_TYPE_DEFAULT, "Giving up on switching focus containers, because we wrapped around to our original.", buf, 2u);
      }
      v10 = v5;
      goto LABEL_33;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_debug_impl(&dword_222ECC000, v16, OS_LOG_TYPE_DEBUG, "Skipping empty focus container: %@", buf, 0xCu);
    }

  }
  if ((-[NSObject isEqual:](v5, "isEqual:", v9) & 1) == 0)
  {
    AXLogFocusEngine();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AXFocusManager _moveFocusContainerFocusInDirection:].cold.3();

    -[NSObject disableFocus](v5, "disableFocus");
  }
  AXLogFocusEngine();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[AXFocusManager _moveFocusContainerFocusInDirection:].cold.2();

  v10 = v9;
  v16 = v5;
LABEL_33:

LABEL_34:
  return v10;
}

- (void)moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  NSObject *v7;
  _QWORD block[6];
  BOOL v9;

  -[AXFocusManager movementQueue](self, "movementQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AXFocusManager_moveFocusWithHeading_byGroup___block_invoke;
  block[3] = &unk_24EBCD818;
  block[4] = self;
  block[5] = a3;
  v9 = a4;
  dispatch_async(v7, block);

}

uint64_t __47__AXFocusManager_moveFocusWithHeading_byGroup___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(v2, "typeaheadString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_moveFocusWithHeading:byGroup:queryString:shouldWrap:", v3, v4, v5, 1);

  return _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

- (void)moveFocusInsideForward:(BOOL)a3
{
  -[AXFocusManager moveFocusInsideForward:shouldWrap:](self, "moveFocusInsideForward:shouldWrap:", a3, 1);
}

- (void)moveFocusInsideForward:(BOOL)a3 shouldWrap:(BOOL)a4
{
  uint64_t v6;
  NSObject *v7;
  _QWORD block[6];
  BOOL v9;

  if (a3)
    v6 = 16;
  else
    v6 = 32;
  -[AXFocusManager movementQueue](self, "movementQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__AXFocusManager_moveFocusInsideForward_shouldWrap___block_invoke;
  block[3] = &unk_24EBCD818;
  block[4] = self;
  block[5] = v6;
  v9 = a4;
  dispatch_async(v7, block);

}

uint64_t __52__AXFocusManager_moveFocusInsideForward_shouldWrap___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "typeaheadString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_moveFocusWithHeading:byGroup:queryString:shouldWrap:", v3, 0, v4, *(unsigned __int8 *)(a1 + 48));

  return _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

- (void)moveFocusWithHeading:(unint64_t)a3 queryString:(id)a4
{
  -[AXFocusManager _moveFocusWithHeading:byGroup:queryString:shouldWrap:](self, "_moveFocusWithHeading:byGroup:queryString:shouldWrap:", a3, 0, a4, 1);
}

- (void)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4 queryString:(id)a5 shouldWrap:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[6];

  v6 = a6;
  v7 = a4;
  v10 = a5;
  -[AXFocusManager currentElement](self, "currentElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasRemoteFocusSystem") & 1) != 0)
    objc_msgSend(v11, "elementForRemoteFocusSystem");
  else
    -[AXFocusManager currentFocusContainer](self, "currentFocusContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    -[AXFocusManager setTypeaheadString:](self, "setTypeaheadString:", v10);
    if ((a3 & 0x100) != 0)
      -[AXFocusManager setFocusContainerForSuccessfulTypeaheadMovement:](self, "setFocusContainerForSuccessfulTypeaheadMovement:", 0);
    -[AXFocusManager _moveToElementWithHeading:queryString:](self, "_moveToElementWithHeading:queryString:", a3, v10);
  }
  else
  {
    -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:](self, "_moveFocusWithHeading:byGroup:shouldWrap:", a3, v7, v6);
  }
  -[AXFocusManager currentElement](self, "currentElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hasRemoteFocusSystem") & 1) != 0)
    objc_msgSend(v13, "elementForRemoteFocusSystem");
  else
    -[AXFocusManager currentFocusContainer](self, "currentFocusContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasRemoteFocusSystem")
    && (objc_msgSend(v11, "isEqual:", v13) & 1) == 0
    && (objc_msgSend(v12, "isEqual:", v14) & 1) == 0)
  {
    AXLogFocusEngine();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AXFocusManager _moveFocusWithHeading:byGroup:queryString:shouldWrap:].cold.1();

    objc_msgSend(v12, "disableFocus");
  }
  if (objc_msgSend(v11, "isEqual:", v13))
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke;
    v18[3] = &unk_24EBCD840;
    v18[4] = self;
    v18[5] = a3;
    -[AXFocusManager _enumerateObservers:](self, "_enumerateObservers:", v18);
  }
  else
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke_2;
    v16[3] = &unk_24EBCD868;
    v16[4] = self;
    v17 = v13;
    -[AXFocusManager _enumerateObservers:](self, "_enumerateObservers:", v16);

  }
}

void __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "focusManager:didHitBoundaryWithHeading:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "focusManager:didMoveToElement:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)focusOnSceneForTypeahead
{
  void *v3;
  id v4;

  -[AXFocusManager setTypeaheadString:](self, "setTypeaheadString:", 0);
  -[AXFocusManager _verifyPIDForTypeahead](self, "_verifyPIDForTypeahead");
  -[AXFocusManager focusContainerForSuccessfulTypeaheadMovement](self, "focusContainerForSuccessfulTypeaheadMovement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXFocusManager focusContainerForSuccessfulTypeaheadMovement](self, "focusContainerForSuccessfulTypeaheadMovement");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AXFocusManager _focusOnFocusContainer:](self, "_focusOnFocusContainer:", v4);

  }
}

- (BOOL)_focusOnFocusContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;

  v3 = a3;
  if (!objc_msgSend(v3, "hasNativeFocusElements"))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fbSceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "performAction:withValue:", 5303, v9);

  if (v10)
  {
    objc_msgSend(v3, "currentFocusElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasRemoteFocusSystem"))
    {
      objc_msgSend(v11, "elementForRemoteFocusSystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasNativeFocusElements");
      if (v13)
        objc_msgSend(v11, "focusOnApplication");

    }
    else
    {
      objc_msgSend(v3, "didFocus");
      LOBYTE(v13) = 1;
    }

  }
  else
  {
LABEL_7:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)_indexOfTypeaheadPIDInFocusContainers:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[5];

  v4 = a3;
  -[AXFocusManager focusContainerForSuccessfulTypeaheadMovement](self, "focusContainerForSuccessfulTypeaheadMovement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__AXFocusManager__indexOfTypeaheadPIDInFocusContainers___block_invoke;
    v8[3] = &unk_24EBCD890;
    v8[4] = self;
    v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __56__AXFocusManager__indexOfTypeaheadPIDInFocusContainers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "focusContainerForSuccessfulTypeaheadMovement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v3);

  return v5;
}

- (void)_verifyPIDForTypeahead
{
  void *v3;
  void *v4;
  char v5;

  -[AXFocusManager _currentFocusContainers](self, "_currentFocusContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXFocusManager focusContainerForSuccessfulTypeaheadMovement](self, "focusContainerForSuccessfulTypeaheadMovement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  if ((v5 & 1) == 0)
    -[AXFocusManager setFocusContainerForSuccessfulTypeaheadMovement:](self, "setFocusContainerForSuccessfulTypeaheadMovement:", 0);
}

- (id)_currentFocusContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementForAttribute:shouldFetchAttributes:", 1006, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "pid"))
  {
    objc_msgSend(v5, "arrayByAddingObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elementForAttribute:shouldFetchAttributes:", 1010, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "pid"))
  {
    objc_msgSend(v5, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "elementForAttribute:shouldFetchAttributes:", 1005, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v13, "pid"))
  {
    objc_msgSend(v5, "arrayByAddingObject:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v14;
  }
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elementForAttribute:shouldFetchAttributes:", 1000, 0);
  v16 = objc_claimAutoreleasedReturnValue();

  v36 = v10;
  v37 = v7;
  v33 = v16;
  v35 = v13;
  if ((objc_msgSend(v5, "containsObject:", v16) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server", v16, v13, v10, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isPIPWindowVisible");

    if (v18)
    {
      objc_msgSend(v5, "arrayByAddingObject:", v16);
      v19 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v19;
    }
  }
  -[AXFocusManager currentFocusContainer](self, "currentFocusContainer", v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "windowSceneIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  v25 = MEMORY[0x24BDAC760];
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "focusContainersForCurrentSceneIdentifier:", v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v25;
        v40[1] = 3221225472;
        v40[2] = __41__AXFocusManager__currentFocusContainers__block_invoke;
        v40[3] = &unk_24EBCD8B8;
        v41 = v22;
        objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v40);

      }
      v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v26);
  }

  v38[0] = v25;
  v38[1] = 3221225472;
  v38[2] = __41__AXFocusManager__currentFocusContainers__block_invoke_2;
  v38[3] = &unk_24EBCD8E0;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v39 = v30;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v38);
  AXLogFocusEngine();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[AXFocusManager _currentFocusContainers].cold.1();

  return v30;
}

void __41__AXFocusManager__currentFocusContainers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
  }

}

uint64_t __41__AXFocusManager__currentFocusContainers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "axSafelyAddObjectsFromArray:");
}

- (void)_moveToElementWithHeading:(unint64_t)a3 queryString:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  id v27;

  v27 = a4;
  -[AXFocusManager _verifyPIDForTypeahead](self, "_verifyPIDForTypeahead");
  -[AXFocusManager _currentFocusContainers](self, "_currentFocusContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a3 & 0x110) == 0)
  {
    objc_msgSend(v6, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = -[AXFocusManager _indexOfTypeaheadPIDInFocusContainers:](self, "_indexOfTypeaheadPIDInFocusContainers:", v7);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = 0;
  else
    v11 = v10;
  -[AXFocusManager focusContainerForSuccessfulTypeaheadMovement](self, "focusContainerForSuccessfulTypeaheadMovement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXFocusManager setFocusContainerForSuccessfulTypeaheadMovement:](self, "setFocusContainerForSuccessfulTypeaheadMovement:", 0);
  if (v11 < objc_msgSend(v7, "count"))
  {
    if ((a3 & 0x110) != 0)
      v13 = 256;
    else
      v13 = 512;
    if ((a3 & 0x300) != 0)
      v14 = v13;
    else
      v14 = a3;
    v15 = v11;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentFocusElement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[AXFocusManager _moveFocusInFocusContainer:withHeading:queryString:](self, "_moveFocusInFocusContainer:withHeading:queryString:", v16, v14, v27);
      objc_msgSend(v16, "currentFocusElement");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18
        && (!objc_msgSend(v17, "isEqual:", v19) || objc_msgSend(v19, "hasRemoteFocusSystem")))
      {
        break;
      }

      ++v15;
      v14 = v13;
      if (v15 >= objc_msgSend(v7, "count"))
        goto LABEL_20;
    }
    -[AXFocusManager setFocusContainerForSuccessfulTypeaheadMovement:](self, "setFocusContainerForSuccessfulTypeaheadMovement:", v16);

  }
LABEL_20:
  -[AXFocusManager focusContainerForSuccessfulTypeaheadMovement](self, "focusContainerForSuccessfulTypeaheadMovement");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v12;
  -[AXFocusManager setFocusContainerForSuccessfulTypeaheadMovement:](self, "setFocusContainerForSuccessfulTypeaheadMovement:", v22);

  while (v11 < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "pid");
    -[AXFocusManager focusContainerForSuccessfulTypeaheadMovement](self, "focusContainerForSuccessfulTypeaheadMovement");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "pid");

    if (v24 != v26)
      objc_msgSend(v23, "disableFocus");

    ++v11;
  }

}

- (BOOL)_moveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 queryString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "currentFocusElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "hasRemoteFocusSystem"))
    goto LABEL_5;
  objc_msgSend(v10, "focusOnRemoteSceneID");
  objc_msgSend(v10, "elementForRemoteFocusSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:queryString:](self, "_recursiveMoveFocusInFocusContainer:withHeading:queryString:", v11, a4, v9))
  {

LABEL_5:
    v12 = -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:queryString:](self, "_recursiveMoveFocusInFocusContainer:withHeading:queryString:", v8, a4, v9);
    goto LABEL_6;
  }
  objc_msgSend(v10, "focusOnApplication");

  v12 = 1;
LABEL_6:

  return v12;
}

- (BOOL)_recursiveMoveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 queryString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "currentFocusElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "moveFocusWithHeading:withQueryString:", a4, v9);
  objc_msgSend(v8, "currentFocusElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_msgSend(v10, "isEqual:", v12) & 1) != 0 || !objc_msgSend(v12, "hasRemoteFocusSystem"))
    {
      v16 = 1;
    }
    else
    {
      v13 = a4 & 0x220;
      if ((a4 & 0x220) != 0)
        v14 = 512;
      else
        v14 = 256;
      objc_msgSend(v12, "elementForRemoteFocusSystem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "focusOnRemoteSceneID");
      if ((objc_msgSend(v15, "moveFocusWithHeading:withQueryString:", v14, v9) & 1) != 0)
      {
        v16 = 1;
      }
      else
      {
        objc_msgSend(v15, "currentFocusElement");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v16 = 0;
        }
        else
        {
          if (v13)
            v18 = 32;
          else
            v18 = 16;
          v16 = -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:queryString:](self, "_recursiveMoveFocusInFocusContainer:withHeading:queryString:", v8, v18, v9);
        }
      }

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_moveFocusInRemoteElement:(id)a3 withHeading:(unint64_t)a4 byGroup:(BOOL)a5
{
  _BOOL8 v5;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;

  v5 = a5;
  v8 = (unint64_t)a3;
  AXLogFocusEngine();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AXFocusManager _moveFocusInRemoteElement:withHeading:byGroup:].cold.2();

  objc_msgSend((id)v8, "elementForRemoteFocusSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentFocusElement");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:](self, "_recursiveMoveFocusInFocusContainer:withHeading:byGroup:", v10, a4, v5);
  objc_msgSend(v10, "currentFocusElement");
  v13 = objc_claimAutoreleasedReturnValue();
  -[AXFocusManager currentElement](self, "currentElement");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v11 | v13)
    v15 = objc_msgSend((id)v11, "isEqual:", v13) ^ 1;
  else
    v15 = 0;
  v16 = v8 | v14;
  if (v8 | v14)
    v16 = objc_msgSend((id)v8, "isEqual:", v14) ^ 1;
  v17 = v12 & (v15 | v16);
  if (v17 == 1)
  {
    AXLogFocusEngine();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[AXFocusManager _moveFocusInRemoteElement:withHeading:byGroup:].cold.1();

    objc_msgSend((id)v8, "focusOnApplication");
  }

  return v17;
}

- (BOOL)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4 shouldWrap:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  const __CFString *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  _QWORD v30[6];
  uint8_t v31[4];
  const __CFString *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v5 = a5;
  v6 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  AXLogFocusEngine();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    v34 = v23;
    _os_log_debug_impl(&dword_222ECC000, v9, OS_LOG_TYPE_DEBUG, "Attempting to move focus with heading: %@, grouped: %@, shouldWrap: %@", buf, 0x20u);

  }
  -[AXFocusManager currentElement](self, "currentElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasRemoteFocusSystem")
    && -[AXFocusManager _moveFocusInRemoteElement:withHeading:byGroup:](self, "_moveFocusInRemoteElement:withHeading:byGroup:", v10, a3, v6))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    -[AXFocusManager currentElement](self, "currentElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXFocusManager currentFocusContainer](self, "currentFocusContainer");
    v13 = objc_claimAutoreleasedReturnValue();
    if (a3 == 512 || a3 == 256)
    {
      -[AXFocusManager _currentFocusContainers](self, "_currentFocusContainers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      {
        AXLogFocusEngine();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:].cold.4(a3 == 256, (uint64_t)v14, v15);

        v16 = objc_msgSend(v14, "indexOfObject:", v13);
        AXLogFocusEngine();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:].cold.3((uint64_t)v13, v16, v17);

        if (a3 == 256)
          v18 = 0;
        else
          v18 = objc_msgSend(v14, "count") - 1;
        if (v16 != v18)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v34 = __Block_byref_object_copy_;
          v35 = __Block_byref_object_dispose_;
          v36 = 0;
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke;
          v30[3] = &unk_24EBCD908;
          v30[4] = self;
          v30[5] = buf;
          objc_msgSend(v14, "enumerateObjectsWithOptions:usingBlock:", 2 * (a3 == 512), v30);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            if ((-[NSObject isEqual:](v13, "isEqual:") & 1) == 0)
            {
              AXLogFocusEngine();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:].cold.2();

              -[NSObject disableFocus](v13, "disableFocus");
            }
            v20 = v13;
            v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
          }
          else
          {
            AXLogFocusEngine();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v24 = CFSTR("last");
              if (a3 == 256)
                v24 = CFSTR("first");
              *(_DWORD *)v31 = 138412290;
              v32 = v24;
              _os_log_impl(&dword_222ECC000, v20, OS_LOG_TYPE_DEFAULT, "Unable to move to %@ focus container.", v31, 0xCu);
            }
          }

          _Block_object_dispose(buf, 8);
        }
      }

    }
    v11 = -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:](self, "_recursiveMoveFocusInFocusContainer:withHeading:byGroup:", v13, a3, v6);
    -[AXFocusManager currentElement](self, "currentElement");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v12, "isEqual:", v25);
    if ((v26 & v11) == 1)
      v27 = objc_msgSend(v12, "hasRemoteFocusSystem");
    else
      v27 = v26 ^ 1;

    if (!(v27 | !v5))
    {
      AXLogFocusEngine();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:].cold.1();

      -[AXFocusManager _handleFailedFocusMovementWithHeading:byGroup:](self, "_handleFailedFocusMovementWithHeading:byGroup:", a3, v6);
      LOBYTE(v11) = 1;
    }

    v10 = v12;
  }

  return v11;
}

void __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_focusOnFocusContainer:", v7))
  {
    AXLogFocusEngine();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_2();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  AXLogFocusEngine();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_1();

}

- (void)_handleFailedFocusMovementWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  _BOOL8 v4;
  char v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];

  v4 = a4;
  v5 = a3;
  -[AXFocusManager currentFocusContainer](self, "currentFocusContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "applicationIsExtension");

  if (!v9)
    goto LABEL_3;
  -[AXFocusManager currentElement](self, "currentElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationForHostFocusSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentFocusElement");

  -[AXFocusManager currentFocusContainer](self, "currentFocusContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "isEqual:", v7);

  if ((_DWORD)v11)
  {
LABEL_3:
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __64__AXFocusManager__handleFailedFocusMovementWithHeading_byGroup___block_invoke;
    v22[3] = &unk_24EBCD930;
    v22[4] = self;
    v13 = MEMORY[0x22767F7CC](v22);
    v14 = (void *)v13;
    if ((v5 & 0x10) != 0)
    {
      v19 = 256;
      if (((*(uint64_t (**)(uint64_t))(v13 + 16))(v13) & 1) != 0)
      {
        v20 = 1;
LABEL_11:
        -[AXFocusManager _moveFocusContainerFocusInDirection:](self, "_moveFocusContainerFocusInDirection:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v21;
      }
    }
    else
    {
      if ((v5 & 0x20) == 0)
      {
        -[AXFocusManager currentElement](self, "currentElement");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "hasRemoteFocusSystem");

        if (v16)
        {
          -[AXFocusManager currentElement](self, "currentElement");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "elementForRemoteFocusSystem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "focusOnApplication");
        }
        goto LABEL_13;
      }
      v19 = 512;
      if (((*(uint64_t (**)(uint64_t))(v13 + 16))(v13) & 1) != 0)
      {
        v20 = 2;
        goto LABEL_11;
      }
    }
    -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:](self, "_recursiveMoveFocusInFocusContainer:withHeading:byGroup:", v7, v19, v4);
LABEL_13:

  }
}

BOOL __64__AXFocusManager__handleFailedFocusMovementWithHeading_byGroup___block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "_currentFocusContainers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "count") > 1;

  return v2;
}

- (BOOL)_recursiveMoveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 byGroup:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v19;

  v5 = a5;
  v8 = a3;
  AXLogFocusEngine();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:].cold.3();

  objc_msgSend(v8, "currentFocusElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "moveFocusWithHeading:byGroup:", a4, v5);
  objc_msgSend(v8, "currentFocusElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_msgSend(v10, "isEqual:", v12) & 1) != 0 || !objc_msgSend(v12, "hasRemoteFocusSystem"))
    {
      v16 = 1;
    }
    else
    {
      AXLogFocusEngine();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:].cold.2();

      if ((a4 & 0x220) != 0)
        v14 = 512;
      else
        v14 = 256;
      objc_msgSend(v12, "focusOnRemoteSceneID");
      objc_msgSend(v12, "elementForRemoteFocusSystem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "moveFocusWithHeading:byGroup:", v14, v5);
      if ((v16 & 1) != 0
        || (objc_msgSend(v15, "currentFocusElement"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v17,
            v17))
      {
        objc_msgSend(v12, "focusOnApplication");
      }
      else
      {
        AXLogFocusEngine();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:].cold.1();

        v16 = -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:](self, "_recursiveMoveFocusInFocusContainer:withHeading:byGroup:", v8, a4, v5);
      }

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)currentElement
{
  void *v2;
  void *v3;

  -[AXFocusManager currentApplication](self, "currentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentFocusElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AXElement)currentApplication
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *AppElementWithPid;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  const void *v19;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementForAttribute:shouldFetchAttributes:", 1007, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isContinuitySessionActive");

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v5, "arrayWithAXAttribute:", 1109);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "arrayWithAXAttribute:", 1111);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToArray:", v11) & 1) == 0)
      objc_msgSend(v10, "removeObjectsInArray:", v11);
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intValue");
    AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
    objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", AppElementWithPid);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (AppElementWithPid)
      CFRelease(AppElementWithPid);
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v2, "uiElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithAXAttribute:", 1110);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayWithAXAttribute:", 1108);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE00140]) & 1) != 0
    || (v17 = objc_msgSend(v3, "pid"), v17 == objc_msgSend(v10, "intValue")))
  {
LABEL_8:
    objc_msgSend(v5, "arrayWithAXAttribute:", 1109);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "intValue");
    v19 = (const void *)_AXUIElementCreateAppElementWithPid();
    objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      CFRelease(v19);
    objc_msgSend(v20, "enableFocus");
    if (v20)
      v21 = v20;
    else
      v21 = v3;
    v14 = v21;

    goto LABEL_14;
  }
  objc_msgSend(v3, "bundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BE00390];
  if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BE00390]) & 1) != 0)
  {
    v25 = objc_msgSend(v11, "isEqualToString:", v24);

    if ((v25 & 1) == 0)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(v3, "bundleId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.AccessibilityUIServer"));

  if (v27)
  {
    v37 = v10;
    v42 = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("pid"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "arrayWithAXAttribute:", 1109);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v39 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v35, "isEqual:", v29) & 1) == 0)
          {
            objc_msgSend(v35, "intValue");
            v36 = (const void *)_AXUIElementCreateAppElementWithPid();
            objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", v36);
            v14 = (id)objc_claimAutoreleasedReturnValue();
            if (v36)
              CFRelease(v36);

            v10 = v37;
            goto LABEL_15;
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v32)
          continue;
        break;
      }
    }

    v10 = v37;
  }
  v14 = v3;
LABEL_15:

  return (AXElement *)v14;
}

- (id)currentFocusContainer
{
  void *v2;
  void *v3;

  -[AXFocusManager currentApplication](self, "currentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentFocusContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_enumerateObservers:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[AXFocusManager observersQueue](self, "observersQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__AXFocusManager__enumerateObservers___block_invoke;
    v6[3] = &unk_24EBCD958;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __38__AXFocusManager__enumerateObservers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSString)typeaheadString
{
  return self->_typeaheadString;
}

- (void)setTypeaheadString:(id)a3
{
  objc_storeStrong((id *)&self->_typeaheadString, a3);
}

- (AXElement)focusContainerForSuccessfulTypeaheadMovement
{
  return self->_focusContainerForSuccessfulTypeaheadMovement;
}

- (void)setFocusContainerForSuccessfulTypeaheadMovement:(id)a3
{
  objc_storeStrong((id *)&self->_focusContainerForSuccessfulTypeaheadMovement, a3);
}

- (OS_dispatch_queue)movementQueue
{
  return self->_movementQueue;
}

- (void)setMovementQueue:(id)a3
{
  objc_storeStrong((id *)&self->_movementQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)observersQueue
{
  return self->_observersQueue;
}

- (void)setObserversQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observersQueue, a3);
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_movementQueue, 0);
  objc_storeStrong((id *)&self->_focusContainerForSuccessfulTypeaheadMovement, 0);
  objc_storeStrong((id *)&self->_typeaheadString, 0);
}

- (void)_moveFocusContainerFocusInDirection:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_222ECC000, v0, OS_LOG_TYPE_ERROR, "Could not find currently focus container %@ in list %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusContainerFocusInDirection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Moved focus to focus container: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusContainerFocusInDirection:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Disable focus in old focus container: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusContainerFocusInDirection:(NSObject *)a3 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_222ECC000, a3, OS_LOG_TYPE_DEBUG, "Moving to focus container in direction %@ in focus containers: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_moveFocusWithHeading:byGroup:queryString:shouldWrap:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Moved to new element, disabling focus in previous remote focus container %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_currentFocusContainers
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_222ECC000, v0, v1, "Current apps: %@\nCurrent focus containers: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusInRemoteElement:withHeading:byGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Moved focus in remote element %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusInRemoteElement:withHeading:byGroup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Moving focus in remote element %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusWithHeading:byGroup:shouldWrap:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Handling failed focus movement in focusContainer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusWithHeading:byGroup:shouldWrap:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Updated focusContainer, disabling focus in previous focusContainer %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusWithHeading:(uint64_t)a1 byGroup:(uint64_t)a2 shouldWrap:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_3(&dword_222ECC000, a2, a3, "Current focusContainer at %lu: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_moveFocusWithHeading:(char)a1 byGroup:(uint64_t)a2 shouldWrap:(NSObject *)a3 .cold.4(char a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  _BYTE v4[24];

  v3 = CFSTR("first");
  if ((a1 & 1) == 0)
    v3 = CFSTR("last");
  *(_DWORD *)v4 = 138412546;
  *(_QWORD *)&v4[4] = v3;
  *(_WORD *)&v4[12] = 2112;
  *(_QWORD *)&v4[14] = a2;
  OUTLINED_FUNCTION_3(&dword_222ECC000, a2, a3, "Moving to %@ element with multiple focusContainers: %@", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16]);
  OUTLINED_FUNCTION_1();
}

void __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Skipping empty focusContainer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Moved focus to focusContainer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_recursiveMoveFocusInFocusContainer:withHeading:byGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Did not hand off to remote process, staying in focusContainer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_recursiveMoveFocusInFocusContainer:withHeading:byGroup:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Handing off to remote process, new element is a remote element: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_recursiveMoveFocusInFocusContainer:withHeading:byGroup:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222ECC000, v0, v1, "Trying to move focus in focusContainer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
