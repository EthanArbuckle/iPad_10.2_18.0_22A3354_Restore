@implementation _AXSpringBoardServerInstance

- (void)springBoardActionOccurred:(int64_t)a3 withPayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  -[_AXSpringBoardServerInstance actionHandlerHelper](self, "actionHandlerHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyActionOccurredWithType:payload:", a3, v6);

  if (a3 == 2 && UIAccessibilityIsVoiceOverRunning())
  {
    -[_AXSpringBoardServerInstance delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRingerMutedWithServerInstance:", self);

    if ((v9 & 1) == 0)
      AXPerformBlockOnMainThread();
  }
}

- (AXServerInstanceActionHandlerHelper)actionHandlerHelper
{
  return self->_actionHandlerHelper;
}

+ (id)springBoardServerInstance
{
  if (springBoardServerInstance_onceToken != -1)
    dispatch_once(&springBoardServerInstance_onceToken, &__block_literal_global_252);
  return (id)ServerInstance;
}

- (void)springBoardActionOccurred:(int64_t)a3
{
  -[_AXSpringBoardServerInstance springBoardActionOccurred:withPayload:](self, "springBoardActionOccurred:withPayload:", a3, 0);
}

- (void)_updateProcess:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("hostIdentity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("embeddedApplicationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDFE3D8]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v9, "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "taskState");

    if (v8 == 3 || (RBSTaskStateIsRunning() & 1) == 0)
    {
      objc_msgSend(v9, "pid");
      AXPidSuspend();
    }
    else
    {
      objc_msgSend(v9, "pid");
      AXPidUnsuspend();
    }
  }

}

- (BOOL)shouldBlockGestureActivation:(unint64_t)a3
{
  if (a3 != 4)
  {
    if (a3 == 2)
    {
      if (!AXCancelControlCenter
        && !-[_AXSpringBoardServerInstance disableControlCenterAssertionHeld](self, "disableControlCenterAssertionHeld"))
      {
        return 0;
      }
    }
    else if (a3 != 1
           || !AXCancelShowNotificationGesture
           && !-[_AXSpringBoardServerInstance disableNotificationCenterAssertionHeld](self, "disableNotificationCenterAssertionHeld"))
    {
      return 0;
    }
    return 1;
  }
  return AXCancelShowHUD != 0;
}

- (BOOL)shouldSendReachabilityToggled
{
  return -[NSMutableArray count](self->_reachabilityHandlers, "count") != 0;
}

- (void)reachabilityToggledWithPayload:(id)a3 synchronizationPort:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void (**v18)(_QWORD);
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v18 = (void (**)(_QWORD))a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = self->_reachabilityHandlers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 5003, v8);
        v19 = 0;
        v16 = objc_msgSend(v14, "sendSimpleMessage:synchronizationPort:error:", v15, v6, &v19);
        v17 = v19;
        if ((v16 & 1) == 0)
          _AXLogWithFacility();

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (v18)
    v18[2](v18);

}

- (BOOL)_hasReachabilityHandlerForClientPort:(unsigned int)a3
{
  NSMutableArray *reachabilityHandlers;
  _QWORD v5[4];
  unsigned int v6;

  reachabilityHandlers = self->_reachabilityHandlers;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69___AXSpringBoardServerInstance__hasReachabilityHandlerForClientPort___block_invoke;
  v5[3] = &__block_descriptor_36_e28_B32__0__AXIPCClient_8Q16_B24l;
  v6 = a3;
  return -[NSMutableArray indexOfObjectPassingTest:](reachabilityHandlers, "indexOfObjectPassingTest:", v5) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_removeReachabilityHandler:(unsigned int)a3
{
  NSMutableArray *reachabilityHandlers;
  void *v5;
  void *v6;
  _QWORD v7[4];
  unsigned int v8;

  reachabilityHandlers = self->_reachabilityHandlers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59___AXSpringBoardServerInstance__removeReachabilityHandler___block_invoke;
  v7[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  v8 = a3;
  -[NSMutableArray indexesOfObjectsPassingTest:](reachabilityHandlers, "indexesOfObjectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[NSMutableArray removeObjectsAtIndexes:](self->_reachabilityHandlers, "removeObjectsAtIndexes:", v5);
    v5 = v6;
  }

}

- (BOOL)shouldCancelSiriTouchActivationBlock
{
  return AXCancelSiriTouchBlock;
}

- (BOOL)hasActiveCall
{
  _AXSpringBoardServerInstance *v2;
  void *v3;

  v2 = self;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "hasActiveCallWithServerInstance:", v2);

  return (char)v2;
}

- (BOOL)hasActiveEndpointCall
{
  _AXSpringBoardServerInstance *v2;
  void *v3;

  v2 = self;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "hasActiveEndpointCallWithServerInstance:", v2);

  return (char)v2;
}

- (BOOL)hasActiveOrPendingCall
{
  _AXSpringBoardServerInstance *v2;
  void *v3;

  v2 = self;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "hasActiveOrPendingCallWithServerInstance:", v2);

  return (char)v2;
}

- (BOOL)hasActiveOrPendingCallOrFaceTime
{
  _AXSpringBoardServerInstance *v2;
  void *v3;

  v2 = self;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "hasActiveOrPendingCallOrFaceTimeWithServerInstance:", v2);

  return (char)v2;
}

- (void)userChangedRouteNotification:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BE003D8], 0, 0, 1u);
}

- (void)_proximityDidChange:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  _AXSpringBoardServerInstance *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEB0F48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (UIAccessibilityIsVoiceOverRunning()
    && -[_AXSpringBoardServerInstance hasActiveCall](self, "hasActiveCall")
    && _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity())
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Proximity Changed (%d) triggering an audio route change"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[_AXSpringBoardServerInstance _proximityDidChange:]", 289, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x24BE4BD78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_21AC77000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if (v6)
    {
      v12 = CFSTR("Speaker");
      v13 = self;
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v12 = CFSTR("Receiver");
      v13 = self;
      v14 = 2;
      v15 = 1;
    }
    -[_AXSpringBoardServerInstance _setCallRoute:ifCurrentlyRoutedTo:rampUp:](v13, "_setCallRoute:ifCurrentlyRoutedTo:rampUp:", v14, v12, v15);
  }
}

- (void)_accessibilityRetrieveAVSystemControlData:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *avSystemRetrievalQueue;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  avSystemRetrievalQueue = self->_avSystemRetrievalQueue;
  if (!avSystemRetrievalQueue)
  {
    v9 = (OS_dispatch_queue *)dispatch_queue_create("accessibility.avsystem.retrieval", 0);
    v10 = self->_avSystemRetrievalQueue;
    self->_avSystemRetrievalQueue = v9;

    avSystemRetrievalQueue = self->_avSystemRetrievalQueue;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __94___AXSpringBoardServerInstance__accessibilityRetrieveAVSystemControlData_withCompletionBlock___block_invoke;
  v13[3] = &unk_24DDE6468;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(avSystemRetrievalQueue, v13);

}

- (void)_setCallRoute:(int)a3 ifCurrentlyRoutedTo:(id)a4 rampUp:(BOOL)a5
{
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  int v12;
  BOOL v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;

  v8 = a4;
  if (-[_AXSpringBoardServerInstance hasActiveOrPendingCallOrFaceTime](self, "hasActiveOrPendingCallOrFaceTime"))
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__2;
    v15[4] = __Block_byref_object_dispose__2;
    v16 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73___AXSpringBoardServerInstance__setCallRoute_ifCurrentlyRoutedTo_rampUp___block_invoke;
    v14[3] = &unk_24DDE5AC8;
    v14[4] = v15;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __73___AXSpringBoardServerInstance__setCallRoute_ifCurrentlyRoutedTo_rampUp___block_invoke_219;
    v9[3] = &unk_24DDE6490;
    v9[4] = self;
    v12 = a3;
    v10 = v8;
    v11 = v15;
    v13 = a5;
    -[_AXSpringBoardServerInstance _accessibilityRetrieveAVSystemControlData:withCompletionBlock:](self, "_accessibilityRetrieveAVSystemControlData:withCompletionBlock:", v14, v9);

    _Block_object_dispose(v15, 8);
  }

}

- (void)_setCallRoute:(int)a3 ifCurrentlyRoutedTo:(id)a4 withRoutes:(id)a5 rampUp:(BOOL)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t *v32;
  NSObject *v33;
  _BOOL4 v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[12];
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint8_t buf[4];
  uint64_t v78;
  uint64_t v79;

  v36 = a6;
  v79 = *MEMORY[0x24BDAC8D0];
  v39 = a4;
  v38 = a5;
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedCall");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BEB4920], "sharedAudioSystemController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pickableRoutesForCategory:andMode:", v11, v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentVideoCall");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  v37 = 0;
LABEL_5:
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__2;
  v75 = __Block_byref_object_dispose__2;
  v76 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__2;
  v69 = __Block_byref_object_dispose__2;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__2;
  v63 = __Block_byref_object_dispose__2;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__2;
  v57 = __Block_byref_object_dispose__2;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__2;
  v51 = __Block_byref_object_dispose__2;
  v52 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__2;
  v45[4] = __Block_byref_object_dispose__2;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__2;
  v43[4] = __Block_byref_object_dispose__2;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__2;
  v41[4] = __Block_byref_object_dispose__2;
  v42 = 0;
  objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v38);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __84___AXSpringBoardServerInstance__setCallRoute_ifCurrentlyRoutedTo_withRoutes_rampUp___block_invoke;
  v40[3] = &unk_24DDE64B8;
  v40[4] = &v71;
  v40[5] = &v59;
  v40[6] = &v65;
  v40[7] = v45;
  v40[8] = &v53;
  v40[9] = v43;
  v40[10] = v41;
  v40[11] = &v47;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v40);

  v14 = (void *)v72[5];
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributeForKey:", *MEMORY[0x24BE648A0]);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v72[5];
    v72[5] = v16;

    v14 = (void *)v72[5];
  }
  objc_msgSend(v14, "valueForKey:", *MEMORY[0x24BE647B8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v39 || objc_msgSend(v18, "isEqualToString:", v39))
  {
    objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pairedHearingAids");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isiCloudPaired");

      if (!v23)
      {
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Hearing aids paired. Skipping call route"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[_AXSpringBoardServerInstance _setCallRoute:ifCurrentlyRoutedTo:withRoutes:rampUp:]", 429, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (id)*MEMORY[0x24BE4BD78];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
          *(_DWORD *)buf = 136446210;
          v78 = v27;
          _os_log_impl(&dword_21AC77000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }

        v28 = 0;
        goto LABEL_27;
      }
    }
    else
    {

    }
    if (a3 == 2)
    {
      v32 = v66;
    }
    else if (a3 == 1)
    {
      v28 = (id)v54[5];
      if (v28)
      {
LABEL_27:
        AXLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v78 = (uint64_t)v28;
          _os_log_impl(&dword_21AC77000, v33, OS_LOG_TYPE_DEFAULT, "Setting new telephony route for accessibility: %@", buf, 0xCu);
        }

        if (v28)
          objc_storeStrong((id *)&AXPreviousCallRoute, (id)v72[5]);
        -[_AXSpringBoardServerInstance _setAVCallRoute:rampUp:](self, "_setAVCallRoute:rampUp:", v28, v36);
        goto LABEL_32;
      }
      v32 = v60;
    }
    else
    {
      v28 = 0;
      if (a3 || !v39)
        goto LABEL_27;
      v32 = v48;
    }
    v28 = (id)v32[5];
    goto LABEL_27;
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not switching call route to %@ as it did not match expected route (%@)"), v39, v19);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[_AXSpringBoardServerInstance _setCallRoute:ifCurrentlyRoutedTo:withRoutes:rampUp:]", 443, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)*MEMORY[0x24BE4BD78];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    *(_DWORD *)buf = 136446210;
    v78 = v31;
    _os_log_impl(&dword_21AC77000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

LABEL_32:
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
}

- (void)_setAVCallRoute:(id)a3 rampUp:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSTimer *callAudioRampTimer;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Changing route to %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[_AXSpringBoardServerInstance _setAVCallRoute:rampUp:]", 451, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x24BE4BD78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      *(_DWORD *)buf = 136446210;
      v15 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_21AC77000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttribute:forKey:error:", v6, *MEMORY[0x24BE648A0], 0);

    if (v4)
    {
      -[_AXSpringBoardServerInstance _rampUpCallVolume](self, "_rampUpCallVolume");
    }
    else
    {
      callAudioRampTimer = self->_callAudioRampTimer;
      if (callAudioRampTimer)
        -[NSTimer invalidate](callAudioRampTimer, "invalidate");
    }
  }

}

- (void)_rampUpCallVolume
{
  NSTimer *callAudioRampTimer;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  callAudioRampTimer = self->_callAudioRampTimer;
  if (callAudioRampTimer)
    -[NSTimer invalidate](callAudioRampTimer, "invalidate");
  v16 = 0.0;
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getVolume:forCategory:", &v16, CFSTR("PhoneCall"));

  if (v5)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ramping up call volume from 0.2 to %f"), v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "-[_AXSpringBoardServerInstance _rampUpCallVolume]", 477, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x24BE4BD78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v7);
      v10 = v8;
      v11 = objc_msgSend(v9, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v18 = v11;
      _os_log_impl(&dword_21AC77000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    *(float *)&v12 = v16;
    LODWORD(v13) = 1045220557;
    LODWORD(v14) = 1.5;
    LODWORD(v15) = 0;
    -[_AXSpringBoardServerInstance _rampUpCallVolumeFromVolume:toVolume:totalDuration:progress:](self, "_rampUpCallVolumeFromVolume:toVolume:totalDuration:progress:", v13, v12, v14, v15);
  }
}

- (void)_rampUpCallVolumeFromVolume:(float)a3 toVolume:(float)a4 totalDuration:(float)a5 progress:(float)a6
{
  uint64_t v11;
  dispatch_block_t v12;
  void *v13;
  id v14;
  NSTimer *v15;
  NSTimer *callAudioRampTimer;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  float v21;
  float v22;
  float v23;
  float v24;
  id location;

  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92___AXSpringBoardServerInstance__rampUpCallVolumeFromVolume_toVolume_totalDuration_progress___block_invoke;
  block[3] = &unk_24DDE64E0;
  objc_copyWeak(&v20, &location);
  v21 = a4;
  v22 = a3;
  v23 = a6;
  v24 = a5;
  v12 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v13 = (void *)MEMORY[0x24BDBCF40];
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __92___AXSpringBoardServerInstance__rampUpCallVolumeFromVolume_toVolume_totalDuration_progress___block_invoke_250;
  v17[3] = &unk_24DDE6508;
  v14 = v12;
  v18 = v14;
  objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, v17, 0.1);
  v15 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  callAudioRampTimer = self->_callAudioRampTimer;
  self->_callAudioRampTimer = v15;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

+ (id)springBoardServerInstanceIfExists
{
  return (id)ServerInstance;
}

- (_AXSpringBoardServerInstance)init
{
  NSLog(CFSTR("You shouldn't have called me"), a2);

  return 0;
}

- (void)dealloc
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  __IOHIDManager *hidManager;
  __CFRunLoop *Current;
  objc_super v9;

  -[AXIPCServer removeAllHandlersForTarget:](self->_server, "removeAllHandlersForTarget:", self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x24BEB0EE8], 0);
  v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x24BEB4AA0], 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, (CFNotificationName)*MEMORY[0x24BED2888], 0);
  hidManager = self->_hidManager;
  Current = CFRunLoopGetCurrent();
  IOHIDManagerUnscheduleFromRunLoop(hidManager, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]);
  CFRelease(self->_hidManager);
  self->_hidManager = 0;
  v9.receiver = self;
  v9.super_class = (Class)_AXSpringBoardServerInstance;
  -[_AXSpringBoardServerInstance dealloc](&v9, sel_dealloc);
}

- (id)_initServer
{
  _AXSpringBoardServerInstance *v2;
  uint64_t v3;
  AXServerInstanceActionHandlerHelper *actionHandlerHelper;
  NSMutableArray *v5;
  NSMutableArray *reachabilityHandlers;
  uint64_t v7;
  NSMapTable *assertionClients;
  id v9;
  uint64_t v10;
  AXIPCServer *server;
  void *v12;
  int v13;
  void *v14;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v16;
  __CFNotificationCenter *v17;
  __CFNotificationCenter *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __IOHIDManager *v23;
  void *v24;
  __IOHIDManager *hidManager;
  __CFRunLoop *Current;
  _AXSpringBoardServerInstance *v27;
  uint64_t v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_AXSpringBoardServerInstance;
  v2 = -[_AXSpringBoardServerInstance init](&v30, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE006B8]), "initWithRegistrationMessageKey:actionResultMessageKey:", 4012, 5002);
    actionHandlerHelper = v2->_actionHandlerHelper;
    v2->_actionHandlerHelper = (AXServerInstanceActionHandlerHelper *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    reachabilityHandlers = v2->_reachabilityHandlers;
    v2->_reachabilityHandlers = v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    assertionClients = v2->_assertionClients;
    v2->_assertionClients = (NSMapTable *)v7;

    v9 = objc_alloc(MEMORY[0x24BE00650]);
    v10 = objc_msgSend(v9, "initWithServiceName:perPidService:", *MEMORY[0x24BE003D0], 0);
    server = v2->_server;
    v2->_server = (AXIPCServer *)v10;

    -[_AXSpringBoardServerInstance _performValidation](v2, "_performValidation");
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "safeBoolForKey:", CFSTR("_hasFinishedLaunching"));

    if (v13)
    {
      -[_AXSpringBoardServerInstance _registerServerAndNotifyClients](v2, "_registerServerAndNotifyClients");
    }
    else
    {
      LOBYTE(v29) = 1;
      _AXLogWithFacility();
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v29, CFSTR("SpringBoard is not done booting. Waiting for notification to start AXSB server."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__springBoardFinishedLaunching_, *MEMORY[0x24BEBDFA0], 0);

    }
    -[_AXSpringBoardServerInstance _initializeHearing](v2, "_initializeHearing");
    -[_AXSpringBoardServerInstance _initializeBiomeStreamDonations](v2, "_initializeBiomeStreamDonations");
    AXPerformBlockOnMainThreadAfterDelay();
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)callStateChanged, (CFStringRef)*MEMORY[0x24BEB0EE8], 0, (CFNotificationSuspensionBehavior)0);
    v16 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v16, v2, (CFNotificationCallback)callStateChanged, (CFStringRef)*MEMORY[0x24BEB4AA0], 0, (CFNotificationSuspensionBehavior)0);
    v17 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v17, v2, (CFNotificationCallback)incomingCallStateChanged, (CFStringRef)*MEMORY[0x24BEB0EF0], 0, (CFNotificationSuspensionBehavior)0);
    v18 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v18, v2, (CFNotificationCallback)incomingCallStateChanged, CFSTR("SBFaceTimeStateChangedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__proximityDidChange_, *MEMORY[0x24BEB0F20], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel_userChangedRouteNotification_, CFSTR("MPAVRoutingControllerDidPickRouteNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel_bluetoothPairingDidChange_, *MEMORY[0x24BE0F990], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", AXSpringBoardServerInstanceDidInitializeNotification, v2);

    v23 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v2->_hidManager = v23;
    IOHIDManagerRegisterDeviceMatchingCallback(v23, (IOHIDDeviceCallback)hidDeviceCallback, v2);
    IOHIDManagerRegisterInputValueCallback(v2->_hidManager, (IOHIDValueCallback)inputValueCallback, v2);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", &unk_24DDF5538);
    objc_msgSend(v24, "addObject:", &unk_24DDF5560);
    objc_msgSend(v24, "addObject:", &unk_24DDF5588);
    objc_msgSend(v24, "addObject:", &unk_24DDF55B0);
    IOHIDManagerSetDeviceMatchingMultiple(v2->_hidManager, (CFArrayRef)v24);
    hidManager = v2->_hidManager;
    Current = CFRunLoopGetCurrent();
    IOHIDManagerScheduleWithRunLoop(hidManager, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]);
    v27 = v2;

  }
  return v2;
}

- (void)_springBoardFinishedLaunching:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBDFA0], 0);

  -[_AXSpringBoardServerInstance _registerServerAndNotifyClients](self, "_registerServerAndNotifyClients");
  -[_AXSpringBoardServerInstance _initializeAutoAnswerWatchObserver](self, "_initializeAutoAnswerWatchObserver");
}

- (void)_registerServerAndNotifyClients
{
  AXIPCServer *server;
  id v4;
  RBSProcessMonitor *v5;
  RBSProcessMonitor *processMonitor;
  _QWORD v7[5];
  id v8;

  server = self->_server;
  v8 = 0;
  -[AXIPCServer startServerWithError:](server, "startServerWithError:", &v8);
  v4 = v8;
  -[AXIPCServer setQueueSize:](self->_server, "setQueueSize:", 100);
  -[_AXSpringBoardServerInstance _initializeHandlers](self, "_initializeHandlers");
  -[AXIPCServer setClientInvalidationCallback:](self->_server, "setClientInvalidationCallback:", &__block_literal_global_301);
  if (v4)
    NSLog(CFSTR("error starting AX SB IPC server: %@"), v4);
  AXPerformBlockOnMainThreadAfterDelay();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63___AXSpringBoardServerInstance__registerServerAndNotifyClients__block_invoke_3;
  v7[3] = &unk_24DDE65F8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BE80CC8], "monitorWithConfiguration:", v7);
  v5 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  processMonitor = self->_processMonitor;
  self->_processMonitor = v5;

  -[_AXSpringBoardServerInstance _initializeLiveTranscriptionObserver](self, "_initializeLiveTranscriptionObserver");
}

- (void)_initializeHandlers
{
  void *v3;
  int v4;

  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__getApplicationOrientation_, 4000, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__getPid_, 4001, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__showAlert_, 4002, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__hideAlert_, 4003, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__showRemoteView_, 4085, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.commandandcontrol"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__hideRemoteView_, 4086, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.commandandcontrol"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isShowingRemoteView_, 4095, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.commandandcontrol"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isMakingEmergencyCall_, 4005, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__hasActiveCall_, 4027, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__hasActiveEndpointCall_, 4081, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__hasActiveOrPendingCall_, 4051, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__hasActiveOrPendingCallOrFaceTime_, 4057, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__topEventPidOverride_, 4006, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__takeScreenshot_, 4009, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openAppSwitcher_, 4010, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__dismissAppSwitcher_, 4047, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__dismissShelfSwitcher_, 4004, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__simulateEdgePressHaptics_, 4067, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleAppLibrary_, 4112, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleQuickNote_, 4113, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__wakeUpDeviceIfNecessary_, 4068, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.fullkeyboardaccess"), CFSTR("com.apple.axremoted.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__unlockDevice_, 4048, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__rebootDevice_, 4075, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__dismissSiri_, 4049, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleNotificationCenter_, 4034, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isNotificationCenterVisible_, 4033, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isLongLookNotificationVisible_, 4111, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openVoiceControl_, 4029, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openTypeToSiri_, 4132, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__getActiveInterfaceOrientation_, 4030, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__actionHandling_, 4012, CFSTR("com.apple.accessibility.automation.client"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.private.security.storage.Spotlight"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isVoiceControlRunning_, 4013, CFSTR("com.apple.accessibility.api"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isSystemSleeping_, 4016, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__volumeLevel_, 4017, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isOrientationLocked_, 4018, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__setOrientation_, 4107, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__setOrientationLocked_, 4059, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isSideSwitchUsedForOrientation_, 4019, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isRingerMuted_, 4020, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openCustomGestureCreationForAST_, 4021, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openCustomGestureCreationForSCAT_, 4022, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openCommandAndControlSettings_, 4097, CFSTR("com.apple.commandandcontrol"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openCommandAndControlCommands_, 4087, CFSTR("com.apple.commandandcontrol"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__openCommandAndControlVocabulary_, 4088, CFSTR("com.apple.commandandcontrol"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__cancelGestureActivation_, 4008, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleHearingControl_, 4023, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__setCaptionPanelContextId_, 4096, CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isPointInAXInspector_, 4024, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isMediaPlaying_, 4025, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.axctl"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__pauseMedia_, 4053, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__resumeMedia_, 4054, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__resetDimTimer_, 4026, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__startHearingAidServer_, 4035, CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.hearingaids"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__showControlCenter_, 4032, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleDock_, 4077, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__armApplePay_, 4078, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__showNotificationCenter_, 4050, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isControlCenterVisible_, 4031, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__copyStringToPasteboard_, 4036, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isSiriVisible_, 4037, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isAppSwitcherVisible_, 4011, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isTypeToSiriVisible_, 4133, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isShelfSwitcherVisible_, 4007, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isShowingHomescreen_, 4079, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isContinuitySessionActive_, 4131, CFSTR("com.apple.fullkeyboardaccess"), CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.hearingaids"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isDockVisible_, 4076, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isPasscodeLockVisible_, 4082, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isLockScreenVisible_, 4104, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isShowingNonSystemApp_, 4090, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isSyncingRestoringResettingOrUpdating_, 4039, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__areSystemGesturesDisabledNatively_, 4043, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__areSystemGesturesDisabledByAccessibility_, 4044, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSpringBoardInfoQuery_, 4045, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleInstalledApps_, 4046, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.commandandcontrol"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleInternalApps_, 4093, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.commandandcontrol"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsInspectorMinimized_, 4052, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleCancelReachabilityTimer_, 4058, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleToggleSpotlight_, 4065, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRevealSpotlight_, 4066, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isSpotlightVisible_, 4098, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isPIPWindowVisible_, 4102, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isGuidedAccessActive_, 4038, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isDarkModeActive_, 4099, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleDarkMode_, 4100, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:](self->_server, "setHandlerWithTarget:selector:forKey:", self, sel__handleLoadGAXBundleForUnmanagedASAM_, 4069);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleReactivateInCallService_, 4084, CFSTR("com.apple.hearingaids"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleLaunchMagnifierApp_, 4070, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.AXSettingsShortcuts"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsMagnifierVisible_, 4071, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.AXSettingsShortcuts"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleLaunchOnboardingViewService_, 4122, CFSTR("com.apple.accessibility.AXSettingsShortcuts"), CFSTR("com.apple.accessibility.axctl"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleLaunchVoiceOverQuickSettingsViewService_, 4094, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.axctl"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleLaunchVoiceOverImageExplorerViewService_, 4105, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.axctl"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__visibleTripleClickItems_, 4108, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__setSpeechPlaybackControls_, 4040, 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__isSpeakThisTemporarilyDisabled_, 4042, CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleAcquireAssertion_, 1000, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.AXSBServer.assertions"), CFSTR("com.apple.accessibility.feature.securepay"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleRelinquishAssertion_, 1001, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.AXSBServer.assertions"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__activateSOSMode_, 4074, CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__getSplashImageForApp_, 4089, CFSTR("com.apple.AXUIViewService"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleDisplayIdentifierForSceneIdentifier_, 4120, CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__connectedDevicesRequireAssistiveTouch_, 4101, CFSTR("com.apple.CoreRoutine.preferences"), 0);
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "laserEnabled");

  if (v4)
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__connectedDevicesHaveAssistiveTouchCustomActions_, 4109, CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__cancelSiriDismissalForAssistiveTouch_, 4103, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleTorch_, 4106, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsSystemAppShowingAnAlert_, 4501, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGetFocusedAppPID_, 4503, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.AXSpringBoardServerAccess"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGetPurpleBuddyPID_, 4507, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.fullkeyboardaccess"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGetRunningAppPIDs_, 4504, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGetFocusedApps_, 4509, CFSTR("com.apple.hearingaids"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleGetFocusedOccludedAppScenes_, 4510, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.commandandcontrol"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsSystemAppFrontmost_, 4500, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsPurpleBuddyAppFrontmost_, 4506, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleIsSettingsAppFrontmost_, 4505, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.voiceservices.tts.customvoice"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__appNameFromPid_, 4114, CFSTR("com.apple.livetranscriptionui"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleLiveTranscription_, 4115, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleNativeFocusedApplication_, 4123, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.CoreRoutine.preferences"), CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetZoomEnabled_, 4124, CFSTR("com.apple.accessibility.settings-modifier-client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleZoomEnabled_, 4125, CFSTR("com.apple.accessibility.settings-modifier-client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetBluetoothPowerEnabled_, 4128, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleBluetoothPowerEnabled_, 4129, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleSetVoiceOverEnabled_, 4126, CFSTR("com.apple.accessibility.settings-modifier-client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleVoiceOverEnabled_, 4127, CFSTR("com.apple.accessibility.settings-modifier-client"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleFreezeClarityUILoadingScreen_, 4116, CFSTR("com.apple.accessibility.AccessibilityUIServer"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handlePresentNearbyDeviceControlPicker_, 4117, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.CoreRoutine.preferences"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__diminishJindo_, 4118, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__jindoAppIdentifiers_, 4121, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleDetectionMode_, 4119, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleConversationBoost_, 4130, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__reachabilityOffset_, 4055, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__reachabilityHandling_, 4056, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__reachabilityActive_, 4060, CFSTR("com.apple.accessibility.physicalinteraction.client"), CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__handleToggleIncomingCall_, 4061, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__reachabilityEnabled_, 4083, CFSTR("com.apple.accessibility.BackBoard"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__allowedMedusaGestures_, 4063, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.fullkeyboardaccess"), CFSTR("com.apple.commandandcontrol"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__performMedusaGesture_, 4064, CFSTR("com.apple.assistivetouch.daemon"), CFSTR("com.apple.accessibility.voiceover"), CFSTR("com.apple.fullkeyboardaccess"), CFSTR("com.apple.commandandcontrol"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__medusaApps_, 4080, CFSTR("com.apple.accessibility.voiceover"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__setDockIconActivationMode_, 4091, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__canSetDockIconActivationMode_, 4092, CFSTR("com.apple.assistivetouch.daemon"), 0);
  -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:](self->_server, "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:", self, sel__toggleBackgroundSounds_, 4110, CFSTR("com.apple.accessibility.BackBoard"), CFSTR("com.apple.accessibility.physicalinteraction.client"), 0);
}

- (void)_biomeDonationLargeTextDidChange:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEBE0B8]) & 1) == 0)
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_INFO, "Donating text size changed to TipKit", v9, 2u);
    }

    objc_msgSend(MEMORY[0x24BE0CDB0], "discoverabilitySignal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CB70]), "initWithIdentifier:bundleID:context:", CFSTR("com.apple.accessibility.textsize.changed"), CFSTR("com.apple.accessibility"), 0);
    objc_msgSend(v7, "sendEvent:", v8);

  }
}

- (void)_initializeBiomeStreamDonations
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__biomeDonationLargeTextDidChange_, *MEMORY[0x24BEBE088], 0);

  -[_AXSpringBoardServerInstance _biomeDonationLargeTextDidChange:](self, "_biomeDonationLargeTextDidChange:", 0);
}

- (void)_initializeHearing
{
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __50___AXSpringBoardServerInstance__initializeHearing__block_invoke;
  aBlock[3] = &unk_24DDE5710;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = dispatch_time(0, 3000000000);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v4, v5, v3);

  objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerUpdateBlock:forRetrieveSelector:withListener:", v3, sel_pairedHearingAids, self);

  objc_msgSend(MEMORY[0x24BE71A98], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerUpdateBlock:forRetrieveSelector:withListener:", v3, sel_personalMediaConfiguration, self);

  objc_msgSend(MEMORY[0x24BE4BE68], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v3, sel_comfortSoundsEnabled, self);

}

- (void)bluetoothPairingDidChange:(id)a3
{
  hearingDeamonShouldBeRunning();
}

- (void)_performBlockAsynchronously:(id)a3 afterDelay:(double)a4
{
  int64_t v4;
  id v5;
  dispatch_time_t v6;
  NSObject *v7;

  if (a3)
  {
    v4 = (uint64_t)(a4 * 1000000000.0);
    v5 = a3;
    v6 = dispatch_time(0, v4);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v6, v7, v5);

  }
}

- (void)_initializeAutoAnswerWatchObserver
{
  void *v3;
  _QWORD v4[5];

  if (AXDeviceIsPhone())
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AXSpringBoardServerInstance setWatchActiveWristState:](self, "setWatchActiveWristState:", v3);

    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __66___AXSpringBoardServerInstance__initializeAutoAnswerWatchObserver__block_invoke;
    v4[3] = &unk_24DDE5710;
    v4[4] = self;
    -[_AXSpringBoardServerInstance _performBlockAsynchronously:afterDelay:](self, "_performBlockAsynchronously:afterDelay:", v4, 3.0);
  }
}

- (void)_requestOnWristState
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, v6))
      {
        v11 = 138543362;
        v12 = v8;
        _os_log_impl(&dword_21AC77000, v5, v6, "%{public}@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDFE738], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "publishMessage:priority:requestingResponse:", &unk_24DDF55D8, 1, 1);

}

- (void)didReceiveIncomingData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v4;
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v11;
        _os_log_impl(&dword_21AC77000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDFE728], v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("onWristState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDFE710]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AXSpringBoardServerInstance watchActiveWristState](self, "watchActiveWristState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v15);

  }
}

- (void)registerHandlerForMessageKey:(int)a3 target:(id)a4 selector:(SEL)a5 entitlements:(id)a6
{
  uint64_t v8;
  _AXSpringBoardServerInstance *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v8 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v10 = (_AXSpringBoardServerInstance *)a4;
  v11 = a6;
  if (!v10)
    v10 = self;
  -[AXIPCServer setHandlerWithTarget:selector:forKey:](self->_server, "setHandlerWithTarget:selector:forKey:", v10, a5, v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[AXIPCServer addPossibleRequiredEntitlement:forMessageWithKey:](self->_server, "addPossibleRequiredEntitlement:forMessageWithKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v8, (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)_assertionClientForPort:(unsigned int)a3
{
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_assertionClients;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "serviceMachPort", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)acquireAssertionWithType:(id)a3 identifier:(id)a4 clientPort:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  NSMapTable *assertionClients;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  int v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[_AXSpringBoardServerInstance _setupAssertionServerIfNeeded](self, "_setupAssertionServerIfNeeded");
  -[_AXSpringBoardServerInstance assertionServer](self, "assertionServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addHeldAssertionOfType:byClient:", v8, v9);

  if ((_DWORD)v5)
  {
    -[_AXSpringBoardServerInstance _assertionClientForPort:](self, "_assertionClientForPort:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00640]), "initWithPort:", v5);
      objc_msgSend(v11, "setClientIdentifier:", v9);
      LODWORD(v12) = 1.0;
      objc_msgSend(v11, "setTimeout:", v12);
      objc_msgSend(v11, "connectWithError:", 0);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __79___AXSpringBoardServerInstance_acquireAssertionWithType_identifier_clientPort___block_invoke;
      v19[3] = &unk_24DDE5EB8;
      v19[4] = self;
      v20 = v5;
      objc_msgSend(v11, "setPortDeathHandler:", v19);
      assertionClients = self->_assertionClients;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](assertionClients, "setObject:forKey:", v14, v11);

    }
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setIdentifier:", v9);
    objc_msgSend(v15, "setType:", v8);
    -[NSMapTable objectForKey:](self->_assertionClients, "objectForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      AXLogAssertions();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[_AXSpringBoardServerInstance acquireAssertionWithType:identifier:clientPort:].cold.1();

    }
    objc_msgSend(v16, "addObject:", v15);

  }
  AXLogAssertions();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_21AC77000, v18, OS_LOG_TYPE_INFO, "SB acquired assertion: %@, %@", buf, 0x16u);
  }

}

- (void)_relinquishAllAssertionsForClientWithPort:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance _assertionClientForPort:](self, "_assertionClientForPort:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable objectForKey:](self->_assertionClients, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "type", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_AXSpringBoardServerInstance relinquishAssertionWithType:identifier:clientPort:](self, "relinquishAssertionWithType:identifier:clientPort:", v14, v15, v3);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (void)relinquishAssertionWithType:(id)a3 identifier:(id)a4 clientPort:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = *(_QWORD *)&a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[_AXSpringBoardServerInstance assertionServer](self, "assertionServer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeHeldAssertionOfType:byClient:", v8, v9);

  if ((_DWORD)v5)
  {
    -[_AXSpringBoardServerInstance _assertionClientForPort:](self, "_assertionClientForPort:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NSMapTable objectForKey:](self->_assertionClients, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __82___AXSpringBoardServerInstance_relinquishAssertionWithType_identifier_clientPort___block_invoke;
      v18 = &unk_24DDE6648;
      v19 = v8;
      v20 = v9;
      objc_msgSend(v12, "indexesOfObjectsPassingTest:", &v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectsAtIndexes:", v13, v15, v16, v17, v18);
      if (!objc_msgSend(v12, "count"))
        -[NSMapTable removeObjectForKey:](self->_assertionClients, "removeObjectForKey:", v11);

    }
  }
  AXLogAssertions();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_21AC77000, v14, OS_LOG_TYPE_INFO, "SB relinquished assertion: %@, %@", buf, 0x16u);
  }

}

- (BOOL)_inSetupMode
{
  void *v2;
  char v3;

  +[AXSpringBoardServerHelper sharedServerHelper](AXSpringBoardServerHelper, "sharedServerHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBuddyRunning");

  return v3;
}

- (void)_performValidation
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_676, &__block_literal_global_831, 0);

}

- (void)_setSystemGesturesEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  AXLogAssertions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v3;
    _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_INFO, "System gestures enabled: %d", (uint8_t *)&buf, 8u);
  }

  AXPerformSafeBlock();
  LOBYTE(buf) = 0;
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("_interactiveScreenshotGestureManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)buf)
    abort();
  -[_AXSpringBoardServerInstance _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXScreenshotAssertion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v3 || v8)
  {
    if (v3 && v8)
    {
      objc_msgSend(v8, "invalidate");
      -[_AXSpringBoardServerInstance _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", v9);
    }
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    v11 = v7;
    AXPerformSafeBlock();
    v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    -[_AXSpringBoardServerInstance _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXScreenshotAssertion"));
    AXLogAssertions();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_21AC77000, v10, OS_LOG_TYPE_INFO, "Acquired screenshot assertion: %@", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (BOOL)onlySystemGesturesDisabledHolderIsGuidedAccess
{
  void *v2;
  void *v3;
  char v4;

  -[_AXSpringBoardServerInstance assertionServer](self, "assertionServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientsHoldingAssertionOfType:", *MEMORY[0x24BDFFCA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToArray:", &unk_24DDF54A0);

  return v4;
}

- (void)_setupAssertionServerIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[_AXSpringBoardServerInstance assertionServer](self, "assertionServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE00778]);
    -[_AXSpringBoardServerInstance setAssertionServer:](self, "setAssertionServer:", v4);
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __61___AXSpringBoardServerInstance__setupAssertionServerIfNeeded__block_invoke;
    v8[3] = &unk_24DDE66B0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setAssertionWasAcquiredHandler:", v8);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __61___AXSpringBoardServerInstance__setupAssertionServerIfNeeded__block_invoke_2;
    v6[3] = &unk_24DDE66B0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "setAssertionWasReleasedHandler:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
}

- (void)_setSecurePayAccessibilityFeaturesDisabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  AXLogAssertions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21AC77000, v5, OS_LOG_TYPE_DEFAULT, "Processing secure pay ax features: %@", (uint8_t *)&v8, 0xCu);

  }
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecurePayAccessibilityFeaturesDisabled:withServerInstance:", v3, self);

}

- (void)_setDashboardSystemGesturesDisabled:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  id v8;

  v3 = a3;
  v5 = CFSTR("disabling dashboard system gestures");
  if (a3)
    v5 = CFSTR("reenabling dashboard system gestures");
  LOBYTE(v6) = 1;
  v7 = v5;
  _AXLogWithFacility();
  -[_AXSpringBoardServerInstance delegate](self, "delegate", v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDashBoardSystemGesturesEnabled:withServerInstance:", !v3, self);

}

- (BOOL)shouldAllowActiveWatchToAutoAnswer
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  NSObject *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  char v35;
  void *v36;
  NSObject *v37;
  os_log_type_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  char v54;
  void *v55;
  NSObject *v56;
  os_log_type_t v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  os_log_type_t v64;
  void *v65;
  os_log_type_t v66;
  void *v67;
  NSObject *v68;
  NSObject *v70;
  void *v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  NSObject *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  if (AXDeviceIsPhone())
  {
    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getActivePairedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B340]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLValue");

      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "deviceIDForNRDevice:", v4);
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v18, "UUIDString");
        v10 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = objc_msgSend(v19, "ignoreLogging");

        if ((v18 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v21 = objc_claimAutoreleasedReturnValue();

          v22 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v21, v22))
          {
            AXColorizeFormatLog();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v10;
            _AXStringForArgs();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, v22))
            {
              *(_DWORD *)buf = 138543362;
              v79 = v24;
              _os_log_impl(&dword_21AC77000, v21, v22, "%{public}@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(MEMORY[0x24BDFE738], "sharedInstance", v70);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "connectedDevices");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v26, "count"))
        {
          objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "ignoreLogging");

          if ((v28 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            AXLoggerForFacility();
            v30 = objc_claimAutoreleasedReturnValue();

            v31 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v30, v31))
            {
              AXColorizeFormatLog();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              _AXStringForArgs();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)buf = 138543362;
                v79 = v33;
                _os_log_impl(&dword_21AC77000, v30, v31, "%{public}@", buf, 0xCu);
              }

            }
          }
        }
        objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "ignoreLogging");

        if ((v35 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v37 = objc_claimAutoreleasedReturnValue();

          v38 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v37, v38))
          {
            AXColorizeFormatLog();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v26;
            _AXStringForArgs();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, v38))
            {
              *(_DWORD *)buf = 138543362;
              v79 = v40;
              _os_log_impl(&dword_21AC77000, v37, v38, "%{public}@", buf, 0xCu);
            }

          }
        }
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v12 = v26;
        v41 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v74;
          v44 = *MEMORY[0x24BDFE710];
LABEL_32:
          v45 = 0;
          while (1)
          {
            if (*(_QWORD *)v74 != v43)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v45), "objectForKeyedSubscript:", v44, v71);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "isEqualToString:", v10);

            if ((v47 & 1) != 0)
              break;
            if (v42 == ++v45)
            {
              v42 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
              if (v42)
                goto LABEL_32;
              goto LABEL_38;
            }
          }

          v13 = (id)*MEMORY[0x24BED26B8];
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairedDevice:", v13, v4);
          if ((objc_msgSend(v50, "BOOLForKey:", *MEMORY[0x24BE008D8]) & 1) != 0)
          {
            -[_AXSpringBoardServerInstance watchActiveWristState](self, "watchActiveWristState");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v10);
            v52 = objc_claimAutoreleasedReturnValue();

            if (!v52)
            {
              v72[0] = MEMORY[0x24BDAC760];
              v72[1] = 3221225472;
              v72[2] = __66___AXSpringBoardServerInstance_shouldAllowActiveWatchToAutoAnswer__block_invoke;
              v72[3] = &unk_24DDE5710;
              v72[4] = self;
              -[_AXSpringBoardServerInstance _performBlockAsynchronously:afterDelay:](self, "_performBlockAsynchronously:afterDelay:", v72, 3.0);
              objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "ignoreLogging");

              if ((v54 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                AXLoggerForFacility();
                v56 = objc_claimAutoreleasedReturnValue();

                v57 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v56, v57))
                {
                  AXColorizeFormatLog();
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  _AXStringForArgs();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, v57))
                  {
                    *(_DWORD *)buf = 138543362;
                    v79 = v59;
                    _os_log_impl(&dword_21AC77000, v56, v57, "%{public}@", buf, 0xCu);
                  }

                }
              }
            }
            v14 = -[NSObject BOOLValue](v52, "BOOLValue");
            goto LABEL_65;
          }
          objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "ignoreLogging");

          if ((v62 & 1) != 0)
          {
            v14 = 0;
            goto LABEL_66;
          }
          objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v52 = objc_claimAutoreleasedReturnValue();

          v66 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v52, v66))
          {
            AXColorizeFormatLog();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, v66))
            {
              *(_DWORD *)buf = 138543362;
              v79 = v68;
              _os_log_impl(&dword_21AC77000, v52, v66, "%{public}@", buf, 0xCu);
            }

          }
        }
        else
        {
LABEL_38:

          objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "ignoreLogging");

          if ((v49 & 1) != 0)
          {
            v14 = 0;
LABEL_68:

            goto LABEL_69;
          }
          objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v13 = objc_claimAutoreleasedReturnValue();

          v64 = AXOSLogLevelFromAXLogLevel();
          if (!os_log_type_enabled(v13, v64))
            goto LABEL_59;
          AXColorizeFormatLog();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, v64))
          {
            *(_DWORD *)buf = 138543362;
            v79 = v52;
            _os_log_impl(&dword_21AC77000, v13, v64, "%{public}@", buf, 0xCu);
          }
        }
        v14 = 0;
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "ignoreLogging");

      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v10 = objc_claimAutoreleasedReturnValue();

        v11 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v10, v11))
        {
          AXColorizeFormatLog();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, v11))
          {
            *(_DWORD *)buf = 138543362;
            v79 = v13;
LABEL_52:
            _os_log_impl(&dword_21AC77000, v10, v11, "%{public}@", buf, 0xCu);
            goto LABEL_59;
          }
          goto LABEL_59;
        }
        goto LABEL_53;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "ignoreLogging");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v10 = objc_claimAutoreleasedReturnValue();

        v11 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v10, v11))
        {
          AXColorizeFormatLog();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, v11))
          {
            *(_DWORD *)buf = 138543362;
            v79 = v13;
            goto LABEL_52;
          }
LABEL_59:
          v14 = 0;
LABEL_67:

          goto LABEL_68;
        }
LABEL_53:
        v14 = 0;
LABEL_69:

        goto LABEL_70;
      }
    }
    v14 = 0;
LABEL_70:

    return v14;
  }
  return 0;
}

- (id)_getApplicationOrientation:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("activeInterfaceOrientation"));

  if ((unint64_t)(v4 - 1) < 4)
    v5 = v4;
  else
    v5 = 0;
  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4000, v8);

  return v9;
}

- (id)_getPid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE00648]);
  v8 = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithKey:payload:", 4001, v5);

  return v6;
}

- (id)_showAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("alertType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "integerValue");
    -[_AXSpringBoardServerInstance delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __43___AXSpringBoardServerInstance__showAlert___block_invoke;
    v12[3] = &unk_24DDE66D8;
    v13 = v4;
    objc_msgSend(v13, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverInstance:showAlertType:withHandler:withData:", self, v7, v12, v10);

  }
  return 0;
}

- (id)_hideAlert:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideAlertWithServerInstance:", self);

  return 0;
}

- (id)_showRemoteView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("remoteViewType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "integerValue");
    -[_AXSpringBoardServerInstance delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverInstance:showRemoteViewType:withData:", self, v7, v10);

  }
  return 0;
}

- (id)_hideRemoteView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("remoteViewType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "integerValue");
    -[_AXSpringBoardServerInstance delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverInstance:hideRemoteViewType:", self, v6);

  }
  return 0;
}

- (id)_isShowingRemoteView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("remoteViewType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "integerValue");
    -[_AXSpringBoardServerInstance delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "serverInstance:isShowingRemoteViewType:", self, v6);

    v9 = objc_alloc(MEMORY[0x24BE00648]);
    v14 = CFSTR("result");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithKey:payload:", 4027, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_isMakingEmergencyCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "isMakingEmergencyCallWithServerInstance:", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithKey:payload:", 4005, v8);

  return v9;
}

- (id)_hasActiveCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveCall](self, "hasActiveCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 4027, v6);

  return v7;
}

- (id)_hasActiveEndpointCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveEndpointCall](self, "hasActiveEndpointCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 4081, v6);

  return v7;
}

- (id)_hasActiveOrPendingCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveOrPendingCall](self, "hasActiveOrPendingCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 4051, v6);

  return v7;
}

- (id)_hasActiveOrPendingCallOrFaceTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BE00648]);
  v9 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_AXSpringBoardServerInstance hasActiveOrPendingCallOrFaceTime](self, "hasActiveOrPendingCallOrFaceTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithKey:payload:", 4057, v6);

  return v7;
}

- (id)_topEventPidOverride:(id)a3
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "safeValueForKey:", CFSTR("_isSpringBoardShowingAnAlert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = getpid();
  }
  else
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBCoverSheetPresentationManager")), "safeValueForKey:", CFSTR("sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("lockScreenEnvironment.applicationHoster.hostedAppSceneHandle.application.processState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "safeIntForKey:", CFSTR("pid"));

  }
  v8 = objc_alloc(MEMORY[0x24BE00648]);
  v13 = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithKey:payload:", 4006, v10);

  return v11;
}

- (id)_takeScreenshot:(id)a3
{
  AXPerformBlockOnMainThreadAfterDelay();
  return 0;
}

- (id)_openAppSwitcher:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openAppSwitcherWithServerInstance:", self);

  return 0;
}

- (id)_dismissAppSwitcher:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissAppSwitcherWithServerInstance:", self);

  return 0;
}

- (id)_dismissShelfSwitcher:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissShelfSwitcherWithServerInstance:", self);

  return 0;
}

- (id)_simulateEdgePressHaptics:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simulateEdgePressHaptics:", self);

  return 0;
}

- (id)_toggleAppLibrary:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleAppLibraryWithServerInstance:", self);

  return 0;
}

- (id)_toggleQuickNote:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleQuickNoteWithServerInstance:", self);

  return 0;
}

- (id)_wakeUpDeviceIfNecessary:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeUpDeviceIfNecessaryWithServerInstance:", self);

  return 0;
}

- (id)_unlockDevice:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockDeviceWithServerInstance:", self);

  return 0;
}

- (id)_rebootDevice:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rebootDeviceWithServerInstance:", self);

  return 0;
}

- (id)_dismissSiri:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissSiriWithServerInstance:", self);

  return 0;
}

- (id)_toggleNotificationCenter:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleNotificationCenterWithServerInstance:", self);

  return 0;
}

- (id)_isNotificationCenterVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNotificationCenterVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4033, v8);

  return v9;
}

- (id)_isLongLookNotificationVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLongLookNotificationVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4111, v8);

  return v9;
}

- (id)_openVoiceControl:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openVoiceControlWithServerInstance:", self);

  return 0;
}

- (id)_openTypeToSiri:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openTypeToSiriWithServerInstance:", self);

  return 0;
}

- (id)_getActiveInterfaceOrientation:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_frontMostAppOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4000, v8);

  return v9;
}

- (id)_actionHandling:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_AXSpringBoardServerInstance actionHandlerHelper](self, "actionHandlerHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleActionHandlerRegistrationMessage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_isVoiceControlRunning:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVoiceControlRunningWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4013, v8);

  return v9;
}

- (id)_isSystemSleeping:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemSleepingWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4016, v8);

  return v9;
}

- (id)_volumeLevel:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumeLevelWithServerInstance:", self);
  v6 = v5;

  v7 = objc_alloc(MEMORY[0x24BE00648]);
  v12 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithKey:payload:", 4017, v9);

  return v10;
}

- (id)_isOrientationLocked:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOrientationLockedWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4016, v8);

  return v9;
}

- (id)_setOrientation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("orientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverInstance:setOrientation:", self, v6);

  return 0;
}

- (id)_setOrientationLocked:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("locked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverInstance:setOrientationLocked:", self, v6);

  return 0;
}

- (id)_isSideSwitchUsedForOrientation:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 4016, &unk_24DDF5600);
}

- (id)_isRingerMuted:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRingerMutedWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4020, v8);

  return v9;
}

- (id)_reachabilityOffset:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reachabilityOffsetWithServerInstance:", self);
  v6 = v5;

  v7 = objc_alloc(MEMORY[0x24BE00648]);
  v12 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithKey:payload:", 4055, v9);

  return v10;
}

- (id)_handleToggleIncomingCall:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handleToggleIncomingCallWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4061, v8);

  return v9;
}

- (id)_reachabilityActive:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("active"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReachabilityActive:", v6);

  return 0;
}

- (id)_reachabilityEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverInstance:setReachabilityEnabled:", self, objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_reachabilityHandling:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  double v10;
  _QWORD v12[5];
  int v13;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("register"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = objc_msgSend(v4, "clientPort");
  if (v7)
  {
    if (!-[_AXSpringBoardServerInstance _hasReachabilityHandlerForClientPort:](self, "_hasReachabilityHandlerForClientPort:", v8))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00640]), "initWithPort:", v8);
      LODWORD(v10) = 1.0;
      objc_msgSend(v9, "setTimeout:", v10);
      objc_msgSend(v9, "connectWithError:", 0);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __54___AXSpringBoardServerInstance__reachabilityHandling___block_invoke;
      v12[3] = &unk_24DDE5EB8;
      v12[4] = self;
      v13 = v8;
      objc_msgSend(v9, "setPortDeathHandler:", v12);
      -[NSMutableArray addObject:](self->_reachabilityHandlers, "addObject:", v9);

    }
  }
  else
  {
    -[_AXSpringBoardServerInstance _removeReachabilityHandler:](self, "_removeReachabilityHandler:", v8);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 4056, &unk_24DDF5628);
}

- (id)_openCustomGestureCreationForAST:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openCustomGestureCreationForASTWithServerInstance:", self);

  return 0;
}

- (id)_openCustomGestureCreationForSCAT:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openCustomGestureCreationForSCATWithServerInstance:", self);

  return 0;
}

- (id)_openCommandAndControlSettings:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openCommandAndControlSettingsWithServerInstance:", self);

  return 0;
}

- (id)_openCommandAndControlCommands:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openCommandAndControlCommandsWithServerInstance:", self);

  return 0;
}

- (id)_openCommandAndControlVocabulary:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openCommandAndControlVocabularyWithServerInstance:", self);

  return 0;
}

- (id)_diminishJindo:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diminishJindoWithServerInstance:", self);

  return 0;
}

- (id)_jindoAppIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jindoAppBundleIndentifiersWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4121, v7);

  return v8;
}

- (id)_toggleDetectionMode:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleDetectionModeWithServerInstance:", self);

  return 0;
}

- (id)_toggleConversationBoost:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleConversationBoostWithServerInstance:", self);

  return 0;
}

- (id)_cancelGestureActivation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  mach_port_name_t *v11;
  mach_port_name_t v12;

  v3 = a3;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");

  objc_msgSend(v3, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("cancelEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = v6 - 1;
  if ((unint64_t)(v6 - 1) <= 7 && ((0x8Bu >> v10) & 1) != 0)
  {
    v11 = (mach_port_name_t *)off_24DDE68A0[v10];
    *off_24DDE6860[v10] = v9;
    v12 = *v11;
    objc_msgSend(v3, "clientPort");
    AXIncrefSendRight();
    *v11 = objc_msgSend(v3, "clientPort");
    if (v12)
    {
      if (mach_port_deallocate(*MEMORY[0x24BDAEC58], v12))
        _AXAssert();
    }
  }

  return 0;
}

- (id)_toggleHearingControl:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  v3 = (void *)*MEMORY[0x24BEBDF78];
  v4 = a3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("windowSceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("embeddedDisplayWindowScene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("switcherController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeBoolForKey:", CFSTR("isMainSwitcherVisible"));
  +[AXSBHearingAidDeviceController sharedController](AXSBHearingAidDeviceController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isShowingHearingAidControl");

  objc_msgSend(v4, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForKey:", CFSTR("visible"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v10, "BOOLValue");
  -[objc_class safeValueForKeyPath:](NSClassFromString(CFSTR("SBMainSwitcherControllerCoordinator")), "safeValueForKeyPath:", CFSTR("sharedInstance._activeDisplaySwitcherController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  AXPerformBlockOnMainThreadAfterDelay();

  return 0;
}

+ (unsigned)_axCaptionPanelContextId
{
  return __axCaptionPanelContextId;
}

- (id)_setCaptionPanelContextId:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("contextId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (__axCaptionPanelContextId != v5)
  {
    __axCaptionPanelContextId = v5;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", AXCaptionPanelContextDidChangeNotification, 0);

  }
  return 0;
}

- (id)_handleCancelReachabilityTimer:(id)a3
{
  return 0;
}

- (id)_handleToggleSpotlight:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleSpotlightWithServerInstance:", self);

  return 0;
}

- (id)_handleRevealSpotlight:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "revealSpotlightWithServerInstance:", self);

  return 0;
}

- (id)_isDarkModeActive:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDarkModeActiveWithServiceInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4099, v8);

  return v9;
}

- (id)_toggleDarkMode:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "toggleDarkModeWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4100, v8);

  return v9;
}

- (id)_isGuidedAccessActive:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isGuidedAccessActiveWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4038, v8);

  return v9;
}

- (id)_isSpotlightVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSpotlightVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4098, v8);

  return v9;
}

- (id)_isPIPWindowVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPIPWindowVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4102, v8);

  return v9;
}

- (id)_handleLoadGAXBundleForUnmanagedASAM:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceLoadGAXBundleWithServerInstance:", self);

  return 0;
}

- (id)_handleReactivateInCallService:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reactivateInCallServiceWithServerInstance:", self);

  return 0;
}

- (id)_handleLaunchMagnifierApp:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchMagnifierAppWithServerInstance:", self);

  return 0;
}

- (id)_handleIsMagnifierVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMagnifierVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4071, v8);

  return v9;
}

- (id)_handleLaunchOnboardingViewService:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "launchOnboardingViewServiceWithServerInstance:data:", self, v6);
  return 0;
}

- (id)_handleLaunchVoiceOverQuickSettingsViewService:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "launchVoiceOverQuickSettingsViewServiceWithServerInstance:data:", self, v6);
  return 0;
}

- (id)_handleLaunchVoiceOverImageExplorerViewService:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "launchVoiceOverImageExplorerViewServiceWithServerInstance:forData:", self, v6);
  return 0;
}

- (id)_visibleTripleClickItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleTripleClickItemsWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = CFSTR("result");
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 4108, v6);

  return v7;
}

- (id)_handleIsInspectorMinimized:(id)a3
{
  id *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (id *)MEMORY[0x24BEBDF78];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(*v3, "_accessibilityIsInspectorMinimized");
  else
    v4 = 0;
  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 4052, v7);

  return v8;
}

- (id)_isPointInAXInspector:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (id *)MEMORY[0x24BEBDF78];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("record"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(*v4, "_accessibilityIsPointInAXInspector:", v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_alloc(MEMORY[0x24BE00648]);
  v13 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithKey:payload:", 4024, v10);

  return v11;
}

- (id)_isMediaPlaying:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  id *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  id obj;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "clientPort");
  v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x3032000000;
  v34[2] = __Block_byref_object_copy__2;
  v34[3] = __Block_byref_object_dispose__2;
  v35 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00640]), "initWithPort:", v5);
  LODWORD(v7) = 1.0;
  objc_msgSend(v6, "setTimeout:", v7);
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v8 = (id *)(v34[0] + 40);
  obj = *(id *)(v34[0] + 40);
  v9 = objc_msgSend(v6, "connectWithError:", &obj);
  objc_storeStrong(v8, obj);
  v32 = v9;
  if (!*((_BYTE *)v30 + 24))
  {
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_AXSpringBoardServerInstance _isMediaPlaying:].cold.1((uint64_t)v34, v10, v11, v12, v13, v14, v15, v16);

  }
  AXLogSpringboardServer();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v18;
    _os_log_impl(&dword_21AC77000, v17, OS_LOG_TYPE_INFO, "Fetching is playing: %@", buf, 0xCu);

  }
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("bundleId"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __48___AXSpringBoardServerInstance__isMediaPlaying___block_invoke;
  v24[3] = &unk_24DDE6740;
  v26 = &v29;
  v22 = v6;
  v25 = v22;
  v27 = &v33;
  objc_msgSend(v19, "isMediaPlayingWithServerInstance:forBundleId:completion:", self, v21, v24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return 0;
}

- (id)_pauseMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("bundleId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverInstance:pauseMedia:forBundleId:", self, 1, v7);

  return 0;
}

- (id)_resumeMedia:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("bundleId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverInstance:pauseMedia:forBundleId:", self, 0, v7);

  return 0;
}

- (id)_resetDimTimer:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetDimTimerWithServerInstance:", self);

  return 0;
}

- (id)_startHearingAidServer:(id)a3
{
  void *v3;

  +[AXSBHearingAidDeviceController sharedController](AXSBHearingAidDeviceController, "sharedController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startServer");

  return 0;
}

- (id)_showControlCenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("show"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverInstance:showControlCenter:", self, objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_toggleDock:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleDockWithServerInstance:", self);

  return 0;
}

- (id)_armApplePay:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "armApplePayWithServerInstance:", self);

  return 0;
}

- (id)_showNotificationCenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("show"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverInstance:showNotificationCenter:", self, objc_msgSend(v7, "BOOLValue"));

  return 0;
}

- (id)_isControlCenterVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isControlCenterVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4033, v8);

  return v9;
}

- (id)_copyStringToPasteboard:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x24BDF8620], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, v6);

    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItems:", v8);

  }
  return 0;
}

- (id)_isSiriVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSiriVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4037, v8);

  return v9;
}

- (id)_isShowingHomescreen:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingHomescreenWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4079, v8);

  return v9;
}

- (id)_isContinuitySessionActive:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContinuitySessionActiveWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4131, v8);

  return v9;
}

- (id)_isAppSwitcherVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppSwitcherVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4011, v8);

  return v9;
}

- (id)_isTypeToSiriVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTypeToSiriVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4133, v8);

  return v9;
}

- (id)_isShelfSwitcherVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShelfSwitcherVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4007, v8);

  return v9;
}

- (id)_isDockVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDockVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4076, v8);

  return v9;
}

- (id)_isShowingNonSystemApp:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingNonSystemAppWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4090, v8);

  return v9;
}

- (id)_isPasscodeLockVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPasscodeLockVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4082, v8);

  return v9;
}

- (id)_isLockScreenVisible:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLockScreenVisibleWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4104, v8);

  return v9;
}

- (id)_isSyncingRestoringResettingOrUpdating:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSyncingRestoringResettingOrUpdatingWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4039, v8);

  return v9;
}

- (id)_areSystemGesturesDisabledNatively:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areSystemGesturesDisabledNativelyWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4043, v8);

  return v9;
}

- (id)_areSystemGesturesDisabledByAccessibility:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areSystemGesturesDisabledByAccessibilityWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4044, v8);

  return v9;
}

- (id)_handleSpringBoardInfoQuery:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverInstance:springBoardSystemInfoQuery:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x24BE00648]);
  v13 = CFSTR("result");
  v14[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithKey:payload:", 4045, v10);

  return v11;
}

- (id)_handleInstalledApps:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedAppsWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4046, v7);

  return v8;
}

- (id)_handleInternalApps:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalAppsWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4093, v7);

  return v8;
}

- (id)_setSpeechPlaybackControls:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  AXIPCClient *v9;
  AXIPCClient *currentSpeakerClient;
  id WeakRetained;
  AXIPCClient *v12;
  id v13;
  AXIPCClient *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _AXSpringBoardServerInstance *v19;
  id v20;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "clientPort");
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("show"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8)
  {
    v9 = (AXIPCClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE00640]), "initWithPort:", v5);
    currentSpeakerClient = self->_currentSpeakerClient;
    self->_currentSpeakerClient = v9;

    -[AXIPCClient connectWithError:](self->_currentSpeakerClient, "connectWithError:", 0);
    objc_initWeak(&location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = self->_currentSpeakerClient;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __59___AXSpringBoardServerInstance__setSpeechPlaybackControls___block_invoke;
    v17[3] = &unk_24DDE6768;
    v13 = WeakRetained;
    v18 = v13;
    objc_copyWeak(&v20, &location);
    v19 = self;
    -[AXIPCClient setPortDeathHandler:](v12, "setPortDeathHandler:", v17);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    v14 = self->_currentSpeakerClient;
    self->_currentSpeakerClient = 0;

  }
  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v15, "serverInstance:showSpeechPlaybackControls:", self, v8);

  return 0;
}

- (id)_isSpeakThisTemporarilyDisabled:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSpeakThisTemporarilyDisabledWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4042, v8);

  return v9;
}

- (id)_handleAcquireAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE00378]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE00370]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "clientPort");

  -[_AXSpringBoardServerInstance acquireAssertionWithType:identifier:clientPort:](self, "acquireAssertionWithType:identifier:clientPort:", v6, v8, v9);
  return 0;
}

- (id)_handleRelinquishAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE00378]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE00370]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "clientPort");

  -[_AXSpringBoardServerInstance relinquishAssertionWithType:identifier:clientPort:](self, "relinquishAssertionWithType:identifier:clientPort:", v6, v8, v9);
  return 0;
}

- (id)_handleIsSystemAppShowingAnAlert:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemAppShowingAnAlertWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4501, v8);

  return v9;
}

- (id)_handleGetFocusedAppPID:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedAppPIDWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4503, v7);

  return v8;
}

- (id)_handleGetPurpleBuddyPID:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "purpleBuddyPIDWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4507, v8);

  return v9;
}

- (id)_handleGetRunningAppPIDs:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runningAppPIDsWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4504, v7);

  return v8;
}

- (id)_handleGetFocusedApps:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedAppsWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = 0;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v7)
  {
    AXLogIPC();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_AXSpringBoardServerInstance _handleGetFocusedApps:].cold.1();

  }
  if (!v6)
    goto LABEL_9;
  v13 = CFSTR("result");
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 4509, v9);

  return v10;
}

- (id)_handleDisplayIdentifierForSceneIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayIdentifierForSceneIdentifier:serverInstance:", v5, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = 0;
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v9)
  {
    AXLogIPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_AXSpringBoardServerInstance _handleGetFocusedApps:].cold.1();

  }
  if (!v8)
    goto LABEL_9;
  v15 = CFSTR("result");
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 4120, v11);

  return v12;
}

- (id)_handleGetFocusedOccludedAppScenes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusedOccludedAppScenesWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = 0;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v7)
  {
    AXLogIPC();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_AXSpringBoardServerInstance _handleGetFocusedApps:].cold.1();

  }
  if (!v6)
    goto LABEL_9;
  v13 = CFSTR("result");
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 4510, v9);

  return v10;
}

- (id)_handleIsSystemAppFrontmost:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("excludeSiri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSystemAppFrontmostExcludingSiri:withServerInstance:", v6, self);

  v9 = objc_alloc(MEMORY[0x24BE00648]);
  v14 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithKey:payload:", 4500, v11);

  return v12;
}

- (id)_handleIsPurpleBuddyAppFrontmost:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPurpleBuddyAppFrontmostWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4506, v8);

  return v9;
}

- (id)_handleIsSettingsAppFrontmost:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSettingsAppFrontmostWithServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4505, v8);

  return v9;
}

- (id)_appNameFromPid:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_AXSpringBoardServerInstance _appNameFromPid:].cold.1();

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appNameFromPid:withServerInstance:", objc_msgSend(v5, "intValue"), self);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v9 = &stru_24DDEA460;
  if (v8)
    v9 = v8;
  v10 = v9;

  v11 = objc_alloc(MEMORY[0x24BE00648]);
  v15 = CFSTR("result");
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithKey:payload:", 4114, v12);
  return v13;
}

- (id)_toggleLiveTranscription:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleLiveTranscriptionWithServerInstance:", self);

  return 0;
}

- (id)_handleNativeFocusedApplication:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nativeFocusedApplication");

  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 4123, v7);

  return v8;
}

- (void)_initializeLiveTranscriptionObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSTimer *v4;
  NSTimer *inSetupTimer;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)liveTranscriptionStateChanged, (CFStringRef)*MEMORY[0x24BED2888], 0, (CFNotificationSuspensionBehavior)0);
  if (-[_AXSpringBoardServerInstance _inSetupMode](self, "_inSetupMode"))
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleLiveTranscriptionStatusChange, 0, 1, 2.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    inSetupTimer = self->_inSetupTimer;
    self->_inSetupTimer = v4;

  }
  else
  {
    -[_AXSpringBoardServerInstance _handleLiveTranscriptionStatusChange](self, "_handleLiveTranscriptionStatusChange");
  }
}

- (void)_handleLiveTranscriptionStatusChange
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21AC77000, a2, OS_LOG_TYPE_ERROR, "Live Transcription error, coudn't execute launch request: %@", v4, 0xCu);

}

- (id)_handleBluetoothPowerEnabled:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v4 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___AXSpringBoardServerInstance__handleBluetoothPowerEnabled___block_invoke;
  block[3] = &unk_24DDE57E0;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  dispatch_async(v5, block);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = objc_alloc(MEMORY[0x24BE00648]);
  v19 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v16 + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithKey:payload:", 4129, v9);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)_handleSetBluetoothPowerEnabled:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB238]), "init");
  v7 = v6;
  if (v5)
    v8 = 5;
  else
    v8 = 4;
  objc_msgSend(v6, "setPowerState:completion:", v8, &__block_literal_global_952);

  return 0;
}

- (id)_handleSetVoiceOverEnabled:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BOOLValue");
  _AXSVoiceOverTouchSetEnabled();

  return 0;
}

- (id)_handleVoiceOverEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE00648]);
  v8 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSVoiceOverTouchEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithKey:payload:", 4127, v5);

  return v6;
}

- (id)_handleSetZoomEnabled:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BOOLValue");
  _AXSZoomTouchSetEnabled();

  return 0;
}

- (id)_handleZoomEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE00648]);
  v8 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSZoomTouchEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithKey:payload:", 4125, v5);

  return v6;
}

- (id)_handleFreezeClarityUILoadingScreen:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "freezeClarityUILoadingScreenWithServerInstance:", self);

  return 0;
}

- (id)_handlePresentNearbyDeviceControlPicker:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentNearbyDeviceControlPickerWithServerInstance:", self);

  return 0;
}

- (id)_allowedMedusaGestures:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedMedusaGesturesWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4063, v7);

  return v8;
}

- (id)_toggleBackgroundSounds:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleBackgroundSoundsWithServerInstance:", self);

  return 0;
}

- (id)_performMedusaGesture:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gesture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "serverInstance:performMedusaGesture:", self, v6);

  v9 = objc_alloc(MEMORY[0x24BE00648]);
  v14 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithKey:payload:", 4064, v11);

  return v12;
}

- (id)_medusaApps:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "medusaAppsWithServerInstance:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4064, v7);

  return v8;
}

- (id)_setDockIconActivationMode:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[_AXSpringBoardServerInstance delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverInstance:setDockIconActivationMode:", self, v6);

  return 0;
}

- (id)_canSetDockIconActivationMode:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSetDockIconActivationModeForServerInstance:", self);

  v6 = objc_alloc(MEMORY[0x24BE00648]);
  v11 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:payload:", 4092, v8);

  return v9;
}

- (id)_activateSOSMode:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateSOSModeWithServerInstance:", self);

  return 0;
}

- (id)_connectedDevicesRequireAssistiveTouch:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "connectedDevicesRequireAssistiveTouch");

  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 4101, v7);

  return v8;
}

- (id)_connectedDevicesHaveAssistiveTouchCustomActions:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentDevicesHaveAssistiveTouchCustomActions");

  v5 = objc_alloc(MEMORY[0x24BE00648]);
  v10 = CFSTR("result");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKey:payload:", 4109, v7);

  return v8;
}

- (id)_cancelSiriDismissalForAssistiveTouch:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSiriDismissalForAssistiveTouchWithServerInstance:", self);

  return 0;
}

- (id)_toggleTorch:(id)a3
{
  void *v4;

  -[_AXSpringBoardServerInstance delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleTorchWithServerInstance:", self);

  return 0;
}

- (id)_getSplashImageForApp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[_AXSpringBoardServerInstance delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverInstance:splashImageForAppWithBundleIdentifier:", self, v5);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      UIImagePNGRepresentation(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("splashData");
      v13[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00648]), "initWithKey:payload:", 4089, v9);

  return v10;
}

- (AXSpringBoardServerInstanceDelegate)delegate
{
  return (AXSpringBoardServerInstanceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_AXAssertionServer)assertionServer
{
  return self->_assertionServer;
}

- (void)setAssertionServer:(id)a3
{
  objc_storeStrong((id *)&self->_assertionServer, a3);
}

- (BOOL)disableNotificationCenterAssertionHeld
{
  return self->_disableNotificationCenterAssertionHeld;
}

- (void)setDisableNotificationCenterAssertionHeld:(BOOL)a3
{
  self->_disableNotificationCenterAssertionHeld = a3;
}

- (BOOL)disableControlCenterAssertionHeld
{
  return self->_disableControlCenterAssertionHeld;
}

- (void)setDisableControlCenterAssertionHeld:(BOOL)a3
{
  self->_disableControlCenterAssertionHeld = a3;
}

- (NSMutableDictionary)watchActiveWristState
{
  return self->_watchActiveWristState;
}

- (void)setWatchActiveWristState:(id)a3
{
  objc_storeStrong((id *)&self->_watchActiveWristState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchActiveWristState, 0);
  objc_storeStrong((id *)&self->_actionHandlerHelper, 0);
  objc_storeStrong((id *)&self->_assertionServer, 0);
  objc_storeStrong((id *)&self->_inSetupTimer, 0);
  objc_storeStrong((id *)&self->_callAudioRampTimer, 0);
  objc_storeStrong((id *)&self->_avSystemRetrievalQueue, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_currentSpeakerClient, 0);
  objc_storeStrong((id *)&self->_assertionClients, 0);
  objc_storeStrong((id *)&self->_reachabilityHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

- (void)acquireAssertionWithType:identifier:clientPort:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_21AC77000, v0, OS_LOG_TYPE_FAULT, "Should have a list of assertion pairs here, not nil!", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_isMediaPlaying:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21AC77000, a2, a3, "Error connecting media playing: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleGetFocusedApps:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_0(&dword_21AC77000, v0, v1, "Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_appNameFromPid:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_21AC77000, v0, OS_LOG_TYPE_DEBUG, "pid: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
