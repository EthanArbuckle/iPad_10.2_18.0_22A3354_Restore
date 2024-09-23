@implementation AXBEventManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_4);
  return (id)sharedManager_SharedManager_0;
}

void __32__AXBEventManager_sharedManager__block_invoke()
{
  AXBEventManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBEventManager);
  v1 = (void *)sharedManager_SharedManager_0;
  sharedManager_SharedManager_0 = (uint64_t)v0;

}

- (AXBEventManager)init
{
  AXBEventManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  AXBEventManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXBEventManager;
  v2 = -[AXBEventManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displays");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)_WindowDisplay;
    _WindowDisplay = v5;

    _AXSystemEventPort = GSGetPurpleSystemEventPort();
    v7 = v2;

  }
  return v2;
}

- (void)registerEventListener:(BOOL)a3
{
  self->_eventListenerEnabled = a3;
}

- (int)systemAppPid
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BE00720], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pid");

  return v3;
}

- (id)windowServer
{
  return (id)_WindowDisplay;
}

- (unsigned)systemEventPort
{
  unsigned int result;

  result = _AXSystemEventPort;
  if (!_AXSystemEventPort)
  {
    result = GSGetPurpleSystemEventPort();
    _AXSystemEventPort = result;
  }
  return result;
}

- (void)_processHIDEvent:(__IOHIDEvent *)a3
{
  +[AXBackBoardGlue processExternalHIDEvent:](AXBackBoardGlue, "processExternalHIDEvent:", a3);
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v9 = (id)_WindowDisplay;
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDE57F8], "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayWithDisplayId:", v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  if ((_DWORD)v6)
  {
    objc_msgSend(v9, "convertPoint:toContextId:", v6, AXRotateToScreen());
    x = v12;
    y = v13;
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  double y;
  double x;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v9 = (id)_WindowDisplay;
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDE57F8], "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayWithDisplayId:", v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  if ((_DWORD)v6)
  {
    objc_msgSend(v9, "convertPoint:fromContextId:", v6, x, y);
    x = v12;
    y = v13;
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)_normalizeEventForContext:(id)a3
{
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "type") == 3001;
  v5 = v15;
  if (!v4)
  {
    objc_msgSend(v15, "windowLocation");
    v6 = AXRotateToScreen();
    v8 = objc_msgSend((id)_WindowDisplay, "contextIdAtPosition:", fmax(v6, 0.0), fmax(v7, 0.0));
    objc_msgSend(v15, "handInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowLocation");
    -[AXBEventManager convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", v8, 0);
    objc_msgSend(v15, "setWindowLocation:");
    objc_msgSend(v9, "paths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(v9, "paths");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "pathLocation");
        -[AXBEventManager convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", v8, 0);
        objc_msgSend(v14, "setPathLocation:");
        objc_msgSend(v14, "setPathWindowContextID:", v8);

      }
    }

    v5 = v15;
  }

}

- (void)setDisableSystemGestureRecognitionInEvents:(BOOL)a3
{
  self->_overrideGestureRecognitionState = a3;
}

- (void)dispatchEventRepresentationToClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  double v14;
  float v15;
  double v16;
  unsigned int v17;
  double v18;
  unsigned int v19;
  double v20;
  float v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  char v35;
  void *v36;
  os_log_type_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  NSObject *v44;
  os_log_type_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  id v51;
  id v52;
  __int128 buf;
  uint64_t v54;
  int v55;
  unint64_t v56;
  unint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  float v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[AXBackBoardGlue hidClientConnectionManager](AXBackBoardGlue, "hidClientConnectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fakeTouchScaleEventRepresentation:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "newHIDEventRef");
  if (v7)
  {
    v8 = (const void *)v7;
    if (objc_msgSend(v6, "type") == 3001)
    {
      if (BKSHIDDigitizerEventIsFirstTouchDown())
      {
        IOHIDEventGetTimeStamp();
        if (dispatchEventRepresentationToClient__onceToken != -1)
          dispatch_once(&dispatchEventRepresentationToClient__onceToken, &__block_literal_global_179);
      }
      objc_msgSend(v6, "handInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "paths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v57 = 0;
        v12 = objc_msgSend(v11, "pathIndex");
        v13 = objc_msgSend(MEMORY[0x24BE00630], "touchCounter");
        objc_msgSend(v11, "pathLocation");
        v15 = v14;
        objc_msgSend(v11, "pathLocation");
        *(float *)&v17 = v16;
        objc_msgSend(v11, "pathLocation");
        *(float *)&v19 = v18;
        objc_msgSend(v11, "pathLocation");
        v21 = v20;
        v56 = __PAIR64__(v13, v12);
        LODWORD(v58) = 0;
        *((float *)&v58 + 1) = v15;
        v59 = __PAIR64__(v19, v17);
        v60 = v21;
        objc_msgSend(v6, "contextId");
        BKSHIDEventSetDigitizerInfoWithSubEventInfos();
      }
      else
      {
        objc_msgSend(v6, "contextId");
        BKSHIDEventSetDigitizerInfo();
      }

      goto LABEL_17;
    }
    objc_msgSend(v6, "type");
    if (AXEventTypeIsKeyboardKey())
    {
      objc_msgSend(MEMORY[0x24BDE57F8], "server");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "displayWithDisplayId:", objc_msgSend(v6, "displayId"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "uniqueId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contextId");
      BKSHIDEventSetSimpleInfo();

      goto LABEL_17;
    }
    objc_msgSend(v6, "type");
    if (!AXEventTypeShouldLetBackboardProcess())
    {
LABEL_17:
      v56 = 0;
      v57 = &v56;
      v58 = 0x2020000000;
      v59 = 0;
      if (!objc_msgSend(v6, "contextId"))
      {
        objc_msgSend(v6, "clientId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          if (objc_msgSend(v6, "taskPort"))
            goto LABEL_21;
          -[objc_class safeValueForKey:](NSClassFromString(CFSTR("BKSystemShellSentinel")), "safeValueForKey:", CFSTR("sharedInstance"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "safeValueForKey:", CFSTR("primarySystemShell"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            objc_msgSend(MEMORY[0x24BDFE4B8], "sharedInstance");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "ignoreLogging");

            if ((v42 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDFE4B8], "identifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              AXLoggerForFacility();
              v44 = objc_claimAutoreleasedReturnValue();

              v45 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v44, v45))
              {
                AXColorizeFormatLog();
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                _AXStringForArgs();
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, v45))
                {
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v47;
                  _os_log_impl(&dword_232455000, v44, v45, "%{public}@", (uint8_t *)&buf, 0xCu);
                }

              }
            }
          }
          objc_msgSend(v26, "safeValueForKey:", CFSTR("bundleIdentifier"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setClientId:", v48);

        }
      }
LABEL_21:
      objc_msgSend(v6, "clientId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27 == 0;

      if (!v28)
      {
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v54 = 0x2020000000;
        v55 = 0;
        v29 = v5;
        v52 = v6;
        AXPerformSafeBlock();
        v30 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);

        _Block_object_dispose(&buf, 8);
        if (v30 >= 1)
        {
          v51 = v29;
          AXPerformSafeBlock();

        }
      }
      if (v57[3])
        goto LABEL_29;
      if (!objc_msgSend(v6, "taskPort") && objc_msgSend(v6, "contextId"))
      {
        objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTaskPort:", objc_msgSend(v31, "taskNamePortOfContextId:", objc_msgSend(v6, "contextId")));

      }
      v50 = v5;
      v32 = v6;
      AXPerformSafeBlock();

      if (v57[3])
      {
LABEL_29:
        CFAbsoluteTimeGetCurrent();
        v49 = v6;
        AXPerformSafeBlock();
        IOHIDEventSystemConnectionDispatchEvent();
        CFRelease((CFTypeRef)v57[3]);
        v33 = v49;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDFE4B8], "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "ignoreLogging");

        if ((v35 & 1) != 0)
          goto LABEL_31;
        objc_msgSend(MEMORY[0x24BDFE4B8], "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v33 = objc_claimAutoreleasedReturnValue();

        v37 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v33, v37))
        {
          AXColorizeFormatLog();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, v37))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v39;
            _os_log_impl(&dword_232455000, v33, v37, "%{public}@", (uint8_t *)&buf, 0xCu);
          }

        }
      }

LABEL_31:
      CFRelease(v8);
      _Block_object_dispose(&v56, 8);
      goto LABEL_32;
    }
    -[AXBEventManager _processHIDEvent:](self, "_processHIDEvent:", v8);
    CFRelease(v8);
  }
  else
  {
    AXLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AXBEventManager dispatchEventRepresentationToClient:].cold.1((uint64_t)v6, v22);

  }
LABEL_32:

}

double __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke()
{
  double result;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(result) = info.numer;
    LODWORD(v1) = info.denom;
    result = (double)*(unint64_t *)&result / (double)v1 * 0.000000001;
    dispatchEventRepresentationToClient__timeScale = *(_QWORD *)&result;
  }
  return result;
}

void __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_192(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientId");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "pidForBundleID:", v3);

}

void __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_2(uint64_t a1)
{
  Class v2;
  void *v3;
  _QWORD v4[4];
  int v5;

  v2 = NSClassFromString(CFSTR("BKSHIDEventDeferringResolution"));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_3;
  v4[3] = &__block_descriptor_36_e8_v16__0_8l;
  v5 = *(_DWORD *)(a1 + 48);
  -[objc_class build:](v2, "build:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "copyClientForDestination:", v3);

}

uint64_t __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPid:", *(unsigned int *)(a1 + 32));
}

uint64_t __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copyClientForTaskPort:", objc_msgSend(*(id *)(a1 + 40), "taskPort"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __55__AXBEventManager_dispatchEventRepresentationToClient___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 3001)
  {
    BKSHIDEventGetDigitizerAttributes();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v8, "preciseLocationX");
          v10 = v9;
          objc_msgSend(v8, "preciseLocationY");
          objc_msgSend(*(id *)(a1 + 40), "convertPoint:fromContextId:displayId:", objc_msgSend(*(id *)(a1 + 32), "contextId"), objc_msgSend(*(id *)(a1 + 32), "displayId"), v10, v11);
          +[AXBackBoardGlue _applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:](AXBackBoardGlue, "_applyExtendedHitTestInformationForCAScreenCoordinates:displayUUID:toPathAttributes:secureName:excludeContextIDs:", 0, v8, objc_msgSend(*(id *)(a1 + 32), "secureName"), 0, v12, v13);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }
    BKSHIDEventSetAttributes();

  }
}

- (unsigned)contextIdHosterForContextId:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "contextIdHostingContextId:", v3);

  return v3;
}

- (void)postEvent:(id)a3 systemEvent:(BOOL)a4 afterNamedTap:(id)a5 namedTaps:(id)a6
{
  _BOOL4 v8;
  NSString *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  int v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  AXEventRepresentation *v23;
  AXEventRepresentation *lastHIDRecord;
  void *v25;
  void *v26;
  NSString *eventTapIdentifier;
  id v28;

  v8 = a4;
  v28 = a3;
  v10 = (NSString *)a5;
  v11 = a6;
  if (objc_msgSend(v28, "type") == 3001)
  {
    objc_msgSend(v28, "handInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "eventType") == 2
      || objc_msgSend(v12, "eventType") == 6
      || objc_msgSend(v12, "eventType") == 8)
    {
      v13 = 0;
      v14 = 0;
    }
    else
    {
      v13 = objc_msgSend(v12, "eventType") == 1;
      v14 = 1;
    }

  }
  else
  {
    v13 = 0;
    v14 = 1;
  }
  v15 = objc_msgSend(v28, "type");
  v16 = 0;
  if (v15 <= 3000)
  {
    v17 = v28;
    if (((v15 - 1000) > 0x33 || ((1 << (v15 + 24)) & 0xFFC007E603FC3) == 0)
      && (v15 - 10) >= 3)
    {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v17 = v28;
  if ((v15 - 4000) < 2 || v15 == 3001)
  {
LABEL_11:
    v18 = objc_msgSend(v17, "newHIDEventRef");
    v17 = v28;
    v16 = (const void *)v18;
  }
LABEL_12:
  if (objc_msgSend(v17, "type") == 50)
  {
    v19 = -[AXBEventManager systemEventPort](self, "systemEventPort");
    v20 = 1;
  }
  else
  {
    if (v16)
      v21 = 0;
    else
      v21 = v14;
    if (v21 == 1)
    {
      if (v8)
      {
        v22 = -[AXBEventManager systemEventPort](self, "systemEventPort");
      }
      else
      {
        objc_msgSend(v28, "windowLocation");
        v22 = -[AXBEventManager machPortForPoint:](self, "machPortForPoint:");
      }
      v19 = v22;
      if (v13)
      {
        v20 = 0;
        postEvent_systemEvent_afterNamedTap_namedTaps__DownPort = v22;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
      v19 = postEvent_systemEvent_afterNamedTap_namedTaps__DownPort;
    }
  }
  +[AXBackBoardGlue sendUserEventOccurred](AXBackBoardGlue, "sendUserEventOccurred");
  -[AXBEventManager setHomeIsDown:](self, "setHomeIsDown:", objc_msgSend(v28, "type") == 1000);
  if (!v11 && v16)
  {
    v23 = (AXEventRepresentation *)objc_msgSend(v28, "copy");
    lastHIDRecord = self->_lastHIDRecord;
    self->_lastHIDRecord = v23;

    if (!IOHIDEventGetSenderID())
    {
      IOHIDEventSetSenderID();
      NSLog(CFSTR("No IOHIDSenderID recorded for this event, please add one: %@"), v28);
    }
    -[AXBEventManager _processHIDEvent:](self, "_processHIDEvent:", v16);
LABEL_35:
    CFRelease(v16);
    goto LABEL_36;
  }
  if (!v8)
    -[AXBEventManager _normalizeEventForContext:](self, "_normalizeEventForContext:", v28);
  objc_msgSend(v28, "setTaskPort:", v19);
  objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  eventTapIdentifier = v10;
  if (!v10)
    eventTapIdentifier = self->_eventTapIdentifier;
  objc_msgSend(v25, "sendEvent:afterTap:useGSEvent:namedTaps:options:", v28, eventTapIdentifier, v16 == 0, v11, v20);

  if (v16)
    goto LABEL_35;
LABEL_36:

}

- (id)lastRecordPostedThroughHID
{
  return self->_lastHIDRecord;
}

- (void)clearLastRecordPostedThrougHID
{
  AXEventRepresentation *lastHIDRecord;

  lastHIDRecord = self->_lastHIDRecord;
  self->_lastHIDRecord = 0;

}

- (unsigned)clientPortForContextId:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDE57F8], "serverIfRunning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v4, "clientPortOfContextId:", v3);

  return v3;
}

- (unsigned)contextIdForPosition:(CGPoint)a3 displayId:(unsigned int)a4
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;

  v4 = *(_QWORD *)&a4;
  v5 = AXRotateToScreen();
  v7 = v6;
  v8 = (id)_WindowDisplay;
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x24BDE57F8], "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayWithDisplayId:", v4);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  v11 = objc_msgSend(v8, "contextIdAtPosition:", v5, v7);

  return v11;
}

- (unsigned)machPortForPoint:(CGPoint)a3
{
  unsigned int result;

  result = objc_msgSend((id)_WindowDisplay, "clientPortAtPosition:", AXRotateToScreen());
  if (!result)
    return -[AXBEventManager systemEventPort](self, "systemEventPort");
  return result;
}

- (BOOL)homeIsDown
{
  return self->_homeIsDown;
}

- (void)setHomeIsDown:(BOOL)a3
{
  self->_homeIsDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHIDRecord, 0);
  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
}

- (void)dispatchEventRepresentationToClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_232455000, a2, OS_LOG_TYPE_ERROR, "Could not create an event ref from: %@", (uint8_t *)&v2, 0xCu);
}

@end
