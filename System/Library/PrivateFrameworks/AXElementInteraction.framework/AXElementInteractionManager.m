@implementation AXElementInteractionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_Manager;
}

void __44__AXElementInteractionManager_sharedManager__block_invoke()
{
  AXElementInteractionManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXElementInteractionManager);
  v1 = (void *)sharedManager_Manager;
  sharedManager_Manager = (uint64_t)v0;

}

- (AXElementInteractionManager)init
{
  AXElementInteractionManager *v2;
  AXElementInteractionManager *v3;
  AXElementInteractionManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXElementInteractionManager;
  v2 = -[AXElementInteractionManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXElementInteractionManager setDisplayCursor:](v2, "setDisplayCursor:", 1);
    v4 = v3;
  }

  return v3;
}

- (void)startInteractionMode
{
  int64_t v3;
  dispatch_time_t v4;
  _QWORD block[5];

  if (!self->_interactionEnabled)
  {
    self->_interactionEnabled = 1;
    if (_AXSApplicationAccessibilityEnabled())
    {
      v3 = 0;
    }
    else
    {
      _AXSApplicationAccessibilitySetEnabled();
      v3 = 1000000000;
    }
    -[AXElementInteractionManager _initializeAXObserver](self, "_initializeAXObserver");
    v4 = dispatch_time(0, v3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__AXElementInteractionManager_startInteractionMode__block_invoke;
    block[3] = &unk_24F86F4E0;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __51__AXElementInteractionManager_startInteractionMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeFocus");
}

- (void)_initializeAXObserver
{
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v4;
  __CFRunLoop *Current;
  pid_t pid;

  pid = 0;
  AXUIElementGetPid((AXUIElementRef)objc_msgSend(MEMORY[0x24BDFEA90], "systemWideAXUIElement"), &pid);
  if (AXObserverCreate(pid, (AXObserverCallback)_axEventHandler, &self->_axEventObserver))
  {
    NSLog(CFSTR("AX: register for events"));
  }
  else
  {
    RunLoopSource = AXObserverGetRunLoopSource(self->_axEventObserver);
    if (RunLoopSource)
    {
      v4 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v4, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      -[AXElementInteractionManager _registerForAXNotifications:](self, "_registerForAXNotifications:", 1);
    }
    else
    {
      NSLog(CFSTR("AX: could not get run loop"));
    }
  }
}

- (int)_registerForAXNotifications:(BOOL)a3
{
  _BOOL4 v3;
  const __AXUIElement *v5;
  uint64_t v6;
  uint64_t v7;
  __AXObserver *axEventObserver;
  const __CFString *v9;
  AXError v10;
  const __CFString *v11;

  v3 = a3;
  v5 = (const __AXUIElement *)objc_msgSend(MEMORY[0x24BDFEA90], "systemWideAXUIElement");
  v6 = 0;
  LODWORD(v7) = 0;
  do
  {
    axEventObserver = self->_axEventObserver;
    v9 = (const __CFString *)dword_22D265C50[v6];
    if (v3)
      v10 = AXObserverAddNotification(axEventObserver, v5, v9, self);
    else
      v10 = AXObserverRemoveNotification(axEventObserver, v5, v9);
    ++v6;
    if ((_DWORD)v7)
      v7 = v7;
    else
      v7 = v10;
  }
  while (v6 != 4);
  if ((_DWORD)v7)
  {
    v11 = CFSTR("unregister");
    if (v3)
      v11 = CFSTR("register");
    NSLog(CFSTR("Unable to %@ for notification. Error: %d"), v11, v7);
  }
  return v7;
}

- (void)setDisplayCursor:(BOOL)a3
{
  self->_displayCursor = a3;
  -[AXElementInteractionManager _sendMessage:withIdentifier:errorHandler:](self, "_sendMessage:withIdentifier:errorHandler:", MEMORY[0x24BDBD1B8], 2, &__block_literal_global_188);
}

void __48__AXElementInteractionManager_setDisplayCursor___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Can't hide: %@"), a2);
}

- (void)endInteractionMode
{
  __AXObserver *axEventObserver;
  AXElement *focusedElement;

  if (self->_interactionEnabled)
  {
    -[AXElementInteractionManager _registerForAXNotifications:](self, "_registerForAXNotifications:", 0);
    axEventObserver = self->_axEventObserver;
    if (axEventObserver)
    {
      CFRelease(axEventObserver);
      self->_axEventObserver = 0;
    }
    self->_interactionEnabled = 0;
    _AXSApplicationAccessibilitySetEnabled();
    focusedElement = self->_focusedElement;
    self->_focusedElement = 0;

    -[AXElementInteractionManager _sendMessage:withIdentifier:errorHandler:](self, "_sendMessage:withIdentifier:errorHandler:", MEMORY[0x24BDBD1B8], 2, &__block_literal_global_191);
  }
}

void __49__AXElementInteractionManager_endInteractionMode__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Can't hide: %@"), a2);
}

- (void)_handleScreenChange
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__AXElementInteractionManager__handleScreenChange__block_invoke;
  block[3] = &unk_24F86F4E0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __50__AXElementInteractionManager__handleScreenChange__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axElementInteractionManagerScreenChanged:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "initializeFocus");
}

- (void)_handleLayoutChange
{
  if ((-[AXElement isValid](self->_focusedElement, "isValid") & 1) == 0)
    -[AXElementInteractionManager initializeFocus](self, "initializeFocus");
}

- (id)_allowDelegateToDecideElement:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  -[AXElementInteractionManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    do
    {
      -[AXElementInteractionManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "axElementInteraction:shouldMoveToElement:", self, v4);

      if ((v8 & 1) != 0)
        break;
      objc_msgSend(v4, "nextElementsWithCount:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v10;
    }
    while (v10);
  }
  return v4;
}

- (void)initializeFocus
{
  AXElement *focusedElement;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AXElement *v11;
  AXElement *v12;
  AXElement *v13;
  dispatch_time_t v14;
  uint64_t v15;
  AXElement *v16;
  _QWORD block[5];

  focusedElement = self->_focusedElement;
  self->_focusedElement = 0;

  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstElementInApplicationForFocus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_focusedElement;
  LOBYTE(v15) = 1;
  _AXLogWithFacility();

  if (v8)
  {
    -[AXElementInteractionManager _allowDelegateToDecideElement:](self, "_allowDelegateToDecideElement:", v8, v15, CFSTR("Apps: %@\n %@\n %@\n"), v10, v7, v16);
    v11 = (AXElement *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = self->_focusedElement;
      self->_focusedElement = v11;
      v13 = v11;

      -[AXElementInteractionManager _highlightElement:](self, "_highlightElement:", self->_focusedElement);
    }
  }
  else
  {
    v14 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__AXElementInteractionManager_initializeFocus__block_invoke;
    block[3] = &unk_24F86F4E0;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __46__AXElementInteractionManager_initializeFocus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeFocus");
}

- (id)focusedElement
{
  return self->_focusedElement;
}

- (void)_highlightElement:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  id v15;
  CGRect v16;

  if (self->_displayCursor)
  {
    v4 = a3;
    objc_msgSend(v4, "path");
    v15 = (id)AX_CGPathCopyDataRepresentation();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v16.origin.x = v7;
    v16.origin.y = v9;
    v16.size.width = v11;
    v16.size.height = v13;
    NSStringFromCGRect(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("frame"));

    if (v15)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("path"));
    -[AXElementInteractionManager _sendMessage:withIdentifier:errorHandler:](self, "_sendMessage:withIdentifier:errorHandler:", v5, 1, &__block_literal_global_202);

  }
}

void __49__AXElementInteractionManager__highlightElement___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("AX: Can't highlight: %@"), a2);
}

- (void)_moveToElement:(id)a3
{
  id v5;
  uint64_t v6;
  AXElement *focusedElement;
  id v8;

  objc_storeStrong((id *)&self->_focusedElement, a3);
  v5 = a3;
  focusedElement = self->_focusedElement;
  v8 = v5;
  LOBYTE(v6) = 1;
  _AXLogWithFacility();
  -[AXElement scrollToVisible](self->_focusedElement, "scrollToVisible", v6, CFSTR("Focused: %@"), focusedElement);
  -[AXElementInteractionManager _highlightElement:](self, "_highlightElement:", v8);

}

- (BOOL)performDirectionalNavigation:(int64_t)a3
{
  return self->_focusedElement
      && -[AXElementInteractionManager _moveFocusByHitTesting:](self, "_moveFocusByHitTesting:", a3);
}

- (BOOL)_moveFocusByHitTesting:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;
  unint64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t (**v26)(_QWORD, double, double);
  double v27;
  CGFloat v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v37;
  char v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  char v47;
  char v48;
  BOOL v49;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGRect rect;
  uint64_t (*v58)(uint64_t);
  void *v59;
  AXElementInteractionManager *v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  -[AXElement frame](self->_focusedElement, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  rect.origin.x = v11;
  AX_CGRectGetCenter();
  v13 = v12;
  v15 = v14;
  v16 = 10.0;
  if (AXDeviceIsPad())
    v17 = 20.0;
  else
    v17 = 10.0;
  if (AXDeviceIsPad())
    v16 = 20.0;
  v18 = a3 == 3;
  v19 = a3 == 4;
  v20 = a3 - 1;
  v21 = a3 == 1;
  v22 = a3 == 2;
  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "systemApplication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "applicationOrientation");

  *(_QWORD *)&rect.size.width = MEMORY[0x24BDAC760];
  *(_QWORD *)&rect.size.height = 3221225472;
  v58 = __54__AXElementInteractionManager__moveFocusByHitTesting___block_invoke;
  v59 = &unk_24F86F588;
  v60 = self;
  v26 = (uint64_t (**)(_QWORD, double, double))MEMORY[0x22E30F8F4](&rect.size);
  v27 = MEMORY[0x22E30F774]();
  rect.origin.y = v28;
  if ((unint64_t)(v25 - 1) <= 1)
  {
    if (v25 == 2)
    {
      if (v20 > 1)
      {
        v19 = a3 != 4;
        v18 = a3 != 3;
      }
      else
      {
        v22 = a3 != 2;
        v21 = a3 != 1;
      }
    }
    v29 = v18 || v19;
    v30 = -v16;
    if (v21)
      v31 = -v16;
    else
      v31 = v16;
    if (v25 == 2)
      v32 = -v17;
    else
      v32 = v17;
    if (v25 != 2)
      v30 = v16;
    v51 = v32;
    v53 = v30;
    v33 = -0.0;
    if (v29)
      v34 = -0.0;
    else
      v34 = v31;
    if (v19)
      v33 = v17;
    if (v18)
      v35 = -v17;
    else
      v35 = v33;
    v55 = v27;
LABEL_32:
    if (!v21 && !v22)
      goto LABEL_118;
    v61.origin.x = rect.origin.x;
    v61.origin.y = v6;
    v61.size.width = v8;
    v61.size.height = v10;
    if (v15 <= CGRectGetMinY(v61) - v10
      || (v62.origin.x = rect.origin.x,
          v62.origin.y = v6,
          v62.size.width = v8,
          v62.size.height = v10,
          v15 >= v10 + CGRectGetMaxY(v62)))
    {
LABEL_118:
      if (!v29)
        goto LABEL_114;
      v63.origin.x = rect.origin.x;
      v63.origin.y = v6;
      v63.size.width = v8;
      v63.size.height = v10;
      if (v13 <= CGRectGetMinX(v63) - v8)
        goto LABEL_114;
      v64.origin.x = rect.origin.x;
      v64.origin.y = v6;
      v64.size.width = v8;
      v64.size.height = v10;
      v27 = v55;
      if (v13 >= v8 + CGRectGetMaxX(v64))
        goto LABEL_114;
    }
    while (1)
    {
      if (v21)
      {
        if (v13 >= 0.0 && v13 <= v27)
          goto LABEL_58;
      }
      else
      {
        v37 = v13 < 0.0 || !v22;
        if ((v37 & 1) == 0 && v13 <= v27)
          goto LABEL_58;
      }
      if (v18)
      {
        if (v15 < 0.0 || v15 > rect.origin.y)
          goto LABEL_61;
      }
      else
      {
        v38 = v15 < 0.0 || !v19;
        if ((v38 & 1) != 0 || v15 > rect.origin.y)
        {
          if (v29)
          {
LABEL_61:
            v13 = v53 + v13;
            goto LABEL_32;
          }
          v15 = v51 + v15;
          goto LABEL_32;
        }
      }
LABEL_58:
      if ((v26[2](v26, v13, v15) & 1) != 0)
        goto LABEL_113;
      v13 = v13 + v34;
      v15 = v15 + v35;
    }
  }
  if ((unint64_t)(v25 - 3) <= 1)
  {
    if (v25 == 3)
    {
      if (v20 > 1)
      {
        v19 = a3 != 4;
        v18 = a3 != 3;
      }
      else
      {
        v22 = a3 != 2;
        v21 = a3 != 1;
      }
    }
    v39 = v18 || v19;
    v40 = -v17;
    if (v22)
      v41 = -v17;
    else
      v41 = v17;
    if (v25 == 3)
      v42 = -v16;
    else
      v42 = v16;
    if (v25 != 3)
      v40 = v17;
    v52 = v42;
    v54 = v40;
    if (v19)
      v43 = v16;
    else
      v43 = -0.0;
    if (v18)
      v44 = -v16;
    else
      v44 = v43;
    if (v39)
      v45 = -0.0;
    else
      v45 = v41;
    v56 = v27;
LABEL_82:
    if (!v21 && !v22)
      goto LABEL_119;
    v65.origin.x = rect.origin.x;
    v65.origin.y = v6;
    v65.size.width = v8;
    v65.size.height = v10;
    if (v13 <= CGRectGetMinX(v65) - v8
      || (v66.origin.x = rect.origin.x,
          v66.origin.y = v6,
          v66.size.width = v8,
          v66.size.height = v10,
          v13 >= v8 + CGRectGetMaxX(v66)))
    {
LABEL_119:
      if (!v39)
        goto LABEL_114;
      v67.origin.x = rect.origin.x;
      v67.origin.y = v6;
      v67.size.width = v8;
      v67.size.height = v10;
      if (v15 <= CGRectGetMinY(v67) - v10)
        goto LABEL_114;
      v68.origin.x = rect.origin.x;
      v68.origin.y = v6;
      v68.size.width = v8;
      v68.size.height = v10;
      v27 = v56;
      if (v15 >= v10 + CGRectGetMaxY(v68))
        goto LABEL_114;
    }
    while (1)
    {
      if (v21)
      {
        if (v15 >= 0.0 && v15 <= rect.origin.y)
          goto LABEL_108;
      }
      else
      {
        v47 = v15 < 0.0 || !v22;
        if ((v47 & 1) == 0 && v15 <= rect.origin.y)
          goto LABEL_108;
      }
      if (v18)
      {
        if (v13 < 0.0 || v13 > v27)
          goto LABEL_111;
      }
      else
      {
        v48 = v13 < 0.0 || !v19;
        if ((v48 & 1) != 0 || v13 > v27)
        {
          if (v39)
          {
LABEL_111:
            v15 = v54 + v15;
            goto LABEL_82;
          }
          v13 = v52 + v13;
          goto LABEL_82;
        }
      }
LABEL_108:
      if ((v26[2](v26, v13, v15) & 1) != 0)
      {
LABEL_113:
        v49 = 1;
        goto LABEL_115;
      }
      v13 = v13 + v44;
      v15 = v15 + v45;
    }
  }
LABEL_114:
  v49 = 0;
LABEL_115:

  return v49;
}

uint64_t __54__AXElementInteractionManager__moveFocusByHitTesting___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDFEA68], "elementAtCoordinate:withVisualPadding:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_allowDelegateToDecideElement:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) & 1) == 0)
  {
    if (objc_msgSend(v3, "isAccessibleElement")
      && (v5 = objc_msgSend(v3, "windowContextId"),
          v5 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "windowContextId")))
    {
      objc_msgSend(*(id *)(a1 + 32), "_moveToElement:", v3);
      v4 = 1;
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (BOOL)performActivate
{
  return -[AXElement press](self->_focusedElement, "press");
}

- (id)_clientIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("AXElementInteractionIdentifier-%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_client
{
  AXUIClient *client;
  void *v4;
  AXUIClient *v5;
  AXUIClient *v6;

  client = self->_client;
  if (!client)
  {
    -[AXElementInteractionManager _clientIdentifier](self, "_clientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (AXUIClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDFF8F0]), "initWithIdentifier:serviceBundleName:", v4, CFSTR("AXElementInteractionUIServer"));
    v6 = self->_client;
    self->_client = v5;

    -[AXUIClient setDelegate:](self->_client, "setDelegate:", self);
    client = self->_client;
  }
  return client;
}

- (void)_sendMessageWithIdentifier:(unint64_t)a3 errorHandler:(id)a4
{
  -[AXElementInteractionManager _sendMessage:withIdentifier:errorHandler:](self, "_sendMessage:withIdentifier:errorHandler:", 0, a3, a4);
}

- (void)_sendMessage:(id)a3 withIdentifier:(unint64_t)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  v8 = a5;
  v9 = a3;
  -[AXElementInteractionManager _client](self, "_client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00580], "mainAccessQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__AXElementInteractionManager__sendMessage_withIdentifier_errorHandler___block_invoke;
  v13[3] = &unk_24F86F5B0;
  v14 = v8;
  v15 = a4;
  v12 = v8;
  objc_msgSend(v10, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v9, a4, v11, v13);

}

void __72__AXElementInteractionManager__sendMessage_withIdentifier_errorHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    _AXLogWithFacility();
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:code:description:", CFSTR("AXElementInteraction"), 1, CFSTR("Could not perform %d action: %@"), *(_QWORD *)(a1 + 40), v4, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

  }
}

- (AXElementInteractionManagerDelegate)delegate
{
  return (AXElementInteractionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)displayCursor
{
  return self->_displayCursor;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_focusedElement, 0);
}

@end
