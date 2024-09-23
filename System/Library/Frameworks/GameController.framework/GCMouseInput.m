@implementation GCMouseInput

- (GCMouseInput)initWithIdentifier:(id)a3 additionalButtons:(unsigned int)a4
{
  id v6;
  GCMouseInput *v7;
  uint64_t v8;
  GCDeviceCursor *scroll;
  __CFString *v10;
  uint64_t v11;
  GCControllerButtonInput *leftButton;
  __CFString *v13;
  uint64_t v14;
  GCControllerButtonInput *rightButton;
  __CFString *v16;
  uint64_t v17;
  GCControllerButtonInput *middleButton;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  NSArray *auxiliaryButtons;
  void *v26;
  char *v27;
  char *v28;
  void *v29;
  char *v30;
  char *v31;
  _GCDevicePhysicalInputElement *v32;
  void *v33;
  char *v34;
  char *v35;
  _GCDevicePhysicalInputElement *v36;
  void *v37;
  char *v38;
  char *v39;
  GCCursorElement *v40;
  void *v41;
  char *v42;
  char *v43;
  _GCDevicePhysicalInputElement *v44;
  void *v45;
  void *v46;
  _GCDevicePhysicalInput *v47;
  _GCDevicePhysicalInput *liveInput;
  uint64_t v49;
  NSMutableArray *eventBuffer;
  id v52;
  _GCDevicePhysicalInputElement *v53;
  _QWORD block[4];
  id v55;
  id location;
  _BYTE v57[72];
  _BYTE v58[72];
  _BYTE v59[72];
  _BYTE v60[72];
  _BYTE v61[72];
  const __CFString *v62;
  __int16 v63;
  int v64;
  int v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  objc_super v70;

  v6 = a3;
  v70.receiver = self;
  v70.super_class = (Class)GCMouseInput;
  v7 = -[GCPhysicalInputProfile initWithIdentifier:](&v70, sel_initWithIdentifier_, v6);
  if (v7)
  {
    v68 = 0;
    v69 = 0;
    v67 = 0;
    v63 = 1;
    v66 = 0;
    v65 = 0;
    v62 = CFSTR("Scroll");
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v61, (uint64_t)&v62);
    -[GCPhysicalInputProfile _cursorWithInfo:](v7, "_cursorWithInfo:", v61);
    v8 = objc_claimAutoreleasedReturnValue();
    scroll = v7->_scroll;
    v7->_scroll = (GCDeviceCursor *)v8;

    v10 = (__CFString *)v62;
    v62 = CFSTR("Left Button");

    HIBYTE(v63) = 1;
    v64 = 0;
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v60, (uint64_t)&v62);
    -[GCPhysicalInputProfile _buttonWithInfo:](v7, "_buttonWithInfo:", v60);
    v11 = objc_claimAutoreleasedReturnValue();
    leftButton = v7->_leftButton;
    v7->_leftButton = (GCControllerButtonInput *)v11;

    if (a4)
    {
      HIBYTE(v63) = 1;
      v13 = (__CFString *)v62;
      v62 = CFSTR("Right Button");

      __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v59, (uint64_t)&v62);
      -[GCPhysicalInputProfile _buttonWithInfo:](v7, "_buttonWithInfo:", v59);
      v14 = objc_claimAutoreleasedReturnValue();
      rightButton = v7->_rightButton;
      v7->_rightButton = (GCControllerButtonInput *)v14;

      if (a4 >= 2)
      {
        HIBYTE(v63) = 1;
        v16 = (__CFString *)v62;
        v62 = CFSTR("Middle Button");

        __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v58, (uint64_t)&v62);
        -[GCPhysicalInputProfile _buttonWithInfo:](v7, "_buttonWithInfo:", v58);
        v17 = objc_claimAutoreleasedReturnValue();
        middleButton = v7->_middleButton;
        v7->_middleButton = (GCControllerButtonInput *)v17;

        if (a4 >= 3)
        {
          v19 = (void *)objc_opt_new();
          if (a4 >= 4)
          {
            v20 = 3;
            do
            {
              HIBYTE(v63) = 1;
              +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("Auxiliary Button %u"), v20);
              v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();
              v22 = (__CFString *)v62;
              v62 = v21;

              __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v57, (uint64_t)&v62);
              -[GCPhysicalInputProfile _buttonWithInfo:](v7, "_buttonWithInfo:", v57);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v23);

              v20 = (v20 + 1);
            }
            while (a4 != (_DWORD)v20);
          }
          v24 = objc_msgSend(v19, "copy");
          auxiliaryButtons = v7->_auxiliaryButtons;
          v7->_auxiliaryButtons = (NSArray *)v24;

        }
      }
    }
    v52 = v6;
    v7->_buttons = 0;
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("primaryMouseButton"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Primary Button"));
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v26, v27);

    _GCFConvertStringToLocalizedString();
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v26, v28);

    v53 = -[_GCDevicePhysicalInputElement initWithParameters:]([_GCDevicePhysicalInputElement alloc], "initWithParameters:", v26);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("secondaryMouseButton"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Secondary Button"));
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v29, v30);

    _GCFConvertStringToLocalizedString();
    v31 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v29, v31);

    v32 = -[_GCDevicePhysicalInputElement initWithParameters:]([_GCDevicePhysicalInputElement alloc], "initWithParameters:", v29);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputButtonElementParameters, "parametersWithIdentifier:", CFSTR("thirdMouseButton"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Third Button"));
    v34 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v33, v34);

    _GCFConvertStringToLocalizedString();
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v33, v35);

    v36 = -[_GCDevicePhysicalInputElement initWithParameters:]([_GCDevicePhysicalInputElement alloc], "initWithParameters:", v33);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](GCCursorElementParameters, "parametersWithIdentifier:", CFSTR("mouseCursor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Cursor"));
    v38 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v37, v38);

    _GCFConvertStringToLocalizedString();
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v37, v39);

    v40 = -[_GCDevicePhysicalInputElement initWithParameters:]([GCCursorElement alloc], "initWithParameters:", v37);
    +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:](_GCDevicePhysicalInputDirectionPadElementParameters, "parametersWithIdentifier:", CFSTR("mouseScrollWheel"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Scroll Wheel"));
    v42 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setAliases:](v41, v42);

    _GCFConvertStringToLocalizedString();
    v43 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v41, v43);

    v44 = -[_GCDevicePhysicalInputElement initWithParameters:]([_GCDevicePhysicalInputElement alloc], "initWithParameters:", v41);
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v53, v32, v36, v40, v44, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_opt_new();
    v47 = -[_GCDevicePhysicalInput initWithFacade:elements:]([_GCDevicePhysicalInput alloc], "initWithFacade:elements:", v46, v45);
    liveInput = v7->_liveInput;
    v7->_liveInput = v47;

    -[_GCDevicePhysicalInput setDataSource:](v7->_liveInput, "setDataSource:", v7);
    v7->_eventBufferLock._os_unfair_lock_opaque = 0;
    v49 = objc_opt_new();
    eventBuffer = v7->_eventBuffer;
    v7->_eventBuffer = (NSMutableArray *)v49;

    v7->_eventBufferDepth = -[_GCDevicePhysicalInput transactionQueueDepth](&v7->_liveInput->super.super.isa);
    objc_initWeak(&location, v7);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__GCMouseInput_initWithIdentifier_additionalButtons___block_invoke;
    block[3] = &unk_24D2B2C50;
    objc_copyWeak(&v55, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);

    __destructor_8_s0_s48_s56_s64((id *)&v62);
    v6 = v52;
  }

  return v7;
}

void __53__GCMouseInput_initWithIdentifier_additionalButtons___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[UIApplication sharedApplication](&off_254DF2320, "sharedApplication");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "windows");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WeakRetained[82];
    WeakRetained[82] = v3;

  }
}

- (GCMouseInput)initWithIdentifier:(id)a3
{
  return -[GCMouseInput initWithIdentifier:additionalButtons:](self, "initWithIdentifier:additionalButtons:", a3, 0);
}

- (id)name
{
  return CFSTR("Mouse");
}

- (void)_bufferEvent:(uint64_t)a1
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 664));
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 672), "count") >= *(_QWORD *)(a1 + 680))
    {
      *(_QWORD *)(a2 + 8) = 0;
      objc_msgSend(*(id *)(a1 + 672), "removeAllObjects");
    }
    v4 = (void *)objc_msgSend(objc_alloc((Class)&off_254DE3D80), "initWithBytes:objCType:", a2, "{?=QQ(?={?=ff}q)}");
    objc_msgSend(*(id *)(a1 + 672), "addObject:", v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 664));
    v5 = *(void **)(a1 + 752);
    if (v5)
    {
      v6 = v5;
      objc_initWeak(&location, (id)a1);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __29__GCMouseInput__bufferEvent___block_invoke;
      v7[3] = &unk_24D2B2C50;
      objc_copyWeak(&v8, &location);
      dispatch_async(v6, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (uint64_t)_physicalInputQueue
{
  if (result)
    return *(_QWORD *)(result + 752);
  return result;
}

void __29__GCMouseInput__bufferEvent___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_drainBufferedEvents:latestOnly:", WeakRetained[95], 0);
    WeakRetained = v2;
  }

}

- (uint64_t)_liveInput
{
  if (result)
    return *(_QWORD *)(result + 760);
  return result;
}

- (void)_drainBufferedEvents:(id)a3 latestOnly:(BOOL)a4
{
  _GCDevicePhysicalInput *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v5 = (_GCDevicePhysicalInput *)a3;
  os_unfair_lock_lock(&self->_eventBufferLock);
  v6 = -[NSMutableArray count](self->_eventBuffer, "count");
  if (v6)
  {
    v7 = 0;
    do
    {
      v11 = 0uLL;
      v12 = 0;
      -[NSMutableArray objectAtIndexedSubscript:](self->_eventBuffer, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getValue:size:", &v11, 24);

      v9 = v11;
      v10 = v12;
      -[_GCDevicePhysicalInput handleMouseEvent:](v5, &v9);
      ++v7;
    }
    while (v6 != v7);
  }
  -[NSMutableArray removeAllObjects](self->_eventBuffer, "removeAllObjects");
  os_unfair_lock_unlock(&self->_eventBufferLock);

}

- (id)physicalInputWithAttributes:(id)a3
{
  return 0;
}

- (id)physicalInputQueue:(id)a3
{
  OS_dispatch_queue *v4;
  void *v5;

  if (!self || (v4 = self->_physicalInputQueue) == 0)
  {
    -[GCPhysicalInputProfile controller](self, "controller", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlerQueue");
    v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)physicalInput:(id)a3 setQueue:(id)a4
{
  -[GCMouseInput set_physicalInputQueue:]((uint64_t)self, a4);
}

- (void)set_physicalInputQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 752), a2);
}

- (void)physicalInputTransactionQueueDepthDidChange:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_eventBufferLock);
  self->_eventBufferDepth = -[_GCDevicePhysicalInput transactionQueueDepth](v4);
  os_unfair_lock_unlock(&self->_eventBufferLock);

}

- (GCMouseMoved)mouseMovedHandler
{
  return self->_mouseMovedHandler;
}

- (void)setMouseMovedHandler:(GCMouseMoved)mouseMovedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, mouseMovedHandler, 728);
}

- (id)mouseMovedHandlerPrivate
{
  return self->_mouseMovedHandlerPrivate;
}

- (void)setMouseMovedHandlerPrivate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 736);
}

- (id)mouseButtonPressedPrivate
{
  return self->_mouseButtonPressedPrivate;
}

- (void)setMouseButtonPressedPrivate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 744);
}

- (void)set_liveInput:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 760), a2);
}

- (GCDeviceCursor)scroll
{
  return self->_scroll;
}

- (GCControllerButtonInput)leftButton
{
  return self->_leftButton;
}

- (GCControllerButtonInput)rightButton
{
  return self->_rightButton;
}

- (GCControllerButtonInput)middleButton
{
  return self->_middleButton;
}

- (NSArray)auxiliaryButtons
{
  return self->_auxiliaryButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryButtons, 0);
  objc_storeStrong((id *)&self->_middleButton, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_scroll, 0);
  objc_storeStrong((id *)&self->_liveInput, 0);
  objc_storeStrong((id *)&self->_physicalInputQueue, 0);
  objc_storeStrong(&self->_mouseButtonPressedPrivate, 0);
  objc_storeStrong(&self->_mouseMovedHandlerPrivate, 0);
  objc_storeStrong(&self->_mouseMovedHandler, 0);
  objc_storeStrong(&self->_pointerEventObservation, 0);
  objc_storeStrong(&self->_digitizerEventObservation, 0);
  objc_storeStrong(&self->_scrollEventObservation, 0);
  objc_storeStrong(&self->_buttonEventObservation, 0);
  objc_storeStrong((id *)&self->_eventBuffer, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

- (id)liveInputFacade
{
  if (a1)
    a1 = (id *)a1[95];
  return a1;
}

- (void)handleMouseButtonEventSettingButtonMask:(unint64_t)a3
{
  -[GCMouseInput _handleButtonEventType:buttonMask:](self, "_handleButtonEventType:buttonMask:", 3, a3);
}

- (void)handleMouseButtonEventAddingButtonMask:(unint64_t)a3
{
  -[GCMouseInput _handleButtonEventType:buttonMask:](self, "_handleButtonEventType:buttonMask:", 4, a3);
}

- (void)handleMouseButtonEventRemovingButtonMask:(unint64_t)a3
{
  -[GCMouseInput _handleButtonEventType:buttonMask:](self, "_handleButtonEventType:buttonMask:", 5, a3);
}

- (void)_handleButtonEventType:(unint64_t)a3 buttonMask:(unint64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  unint64_t v13;
  float v14;
  void *v15;
  double v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  unint64_t v23;
  _QWORD v24[3];

  if (a3 - 3 >= 3)
  {
    +[NSException exceptionWithName:reason:userInfo:](&off_254DEE1B8, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unknown button event type"), 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v24[0] = 0;
  v24[1] = a3;
  v24[2] = a4;
  -[GCMouseInput _bufferEvent:]((uint64_t)self, (uint64_t)v24);
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_buttons = a4;
  -[GCMouseInput leftButton](self, "leftButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = (float)(a4 & 1);
  objc_msgSend(v7, "_setValue:queue:", v6, v8);

  -[GCMouseInput rightButton](self, "rightButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = (float)(a4 & 2);
  objc_msgSend(v9, "_setValue:queue:", v6, v10);

  -[GCMouseInput middleButton](self, "middleButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = (float)(a4 & 4);
  objc_msgSend(v11, "_setValue:queue:", v6, v12);

  if (-[NSArray count](self->_auxiliaryButtons, "count"))
  {
    v13 = 0;
    do
    {
      if (((8 << v13) & a4) != 0)
        v14 = 1.0;
      else
        v14 = 0.0;
      -[NSArray objectAtIndexedSubscript:](self->_auxiliaryButtons, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v16 = v14;
      objc_msgSend(v15, "_setValue:queue:", v6, v16);

      ++v13;
    }
    while (-[NSArray count](self->_auxiliaryButtons, "count") > v13);
  }
  v17 = (void *)MEMORY[0x2199DEBB0](self->_mouseButtonPressedPrivate);
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__GCMouseInput_PubSub___handleButtonEventType_buttonMask___block_invoke;
  v21[3] = &unk_24D2B3030;
  v21[4] = self;
  v22 = v17;
  v23 = a4;
  v19 = v17;
  dispatch_async(v18, v21);

}

uint64_t __58__GCMouseInput_PubSub___handleButtonEventType_buttonMask___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[6]);
  return result;
}

- (void)handleScrollEventWithDelta:(CGPoint)a3
{
  float x;
  float v5;
  float y;
  void *v7;
  void *v8;
  id v9;
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  double MinX;
  float v16;
  float v17;
  double MaxX;
  float v19;
  float v20;
  double MinY;
  float v22;
  double v23;
  float v24;
  float v25;
  double MaxY;
  float v27;
  float v28;
  id v29;
  id v30;
  void *v31;
  double v32;
  char v33;
  void *v34;
  double v35;
  int v36;
  float v37;
  float v38;
  __int128 v39;
  float v40;
  float v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  x = a3.x;
  v5 = -x;
  v39 = xmmword_21526CCC0;
  y = a3.y;
  v40 = -x;
  v41 = y;
  -[GCMouseInput _bufferEvent:]((uint64_t)self, (uint64_t)&v39);
  -[GCMouseInput scroll](self, "scroll");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  objc_msgSend(v9, "frame");
  v11 = v42.origin.x;
  v12 = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  MinX = CGRectGetMinX(v42);
  if (MinX >= v5)
  {
    v17 = v5;
  }
  else
  {
    v16 = MinX;
    v17 = v16;
  }
  v38 = v5;
  v43.origin.x = v11;
  v43.origin.y = v12;
  v43.size.width = width;
  v43.size.height = height;
  MaxX = CGRectGetMaxX(v43);
  if (MaxX >= v5)
  {
    v19 = MaxX;
    v20 = v19;
  }
  else
  {
    v20 = v5;
  }
  v37 = v20;
  v44.origin.x = v11;
  v44.origin.y = v12;
  v44.size.width = width;
  v44.size.height = height;
  MinY = CGRectGetMinY(v44);
  v22 = y;
  v23 = y;
  if (MinY >= v23)
  {
    v25 = v22;
  }
  else
  {
    v24 = MinY;
    v25 = v24;
  }
  v45.origin.x = v11;
  v45.origin.y = v12;
  v45.size.width = width;
  v45.size.height = height;
  MaxY = CGRectGetMaxY(v45);
  if (MaxY >= v23)
  {
    v27 = MaxY;
    v28 = v27;
  }
  else
  {
    v28 = v22;
  }
  objc_msgSend(v9, "setFrame:", v17, v25, (float)(v37 - v17), (float)(v28 - v25));
  v29 = v9;
  v30 = v10;
  objc_msgSend(v29, "xAxis");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v32 = v38;
  v33 = objc_msgSend(v31, "_setValue:queue:", v30, v32);

  objc_msgSend(v29, "yAxis");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v35 = v22;
  v36 = objc_msgSend(v34, "_setValue:queue:", v30, v35);

  if ((v33 & 1) != 0 || v36)
    objc_msgSend(0, "addObject:", v29);

}

- (void)handleMouseMovementEventWithDelta:(CGPoint)a3
{
  CGFloat x;
  double v5;
  float v6;
  float v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  CGFloat v16;
  double v17;
  _QWORD block[5];
  id v19;
  CGFloat v20;
  double v21;
  __int128 v22;
  float v23;
  float v24;

  x = a3.x;
  v5 = -a3.y;
  v6 = a3.x;
  v22 = xmmword_21526CCD0;
  v7 = -a3.y;
  v23 = v6;
  v24 = v7;
  -[GCMouseInput _bufferEvent:]((uint64_t)self, (uint64_t)&v22);
  -[GCPhysicalInputProfile handlerQueue](self, "handlerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x2199DEBB0](self->_mouseMovedHandler);
  v10 = v9;
  v11 = MEMORY[0x24BDAC760];
  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke;
    block[3] = &unk_24D2B3058;
    block[4] = self;
    v19 = v9;
    v20 = x;
    v21 = v5;
    dispatch_async(v8, block);

  }
  v12 = (void *)MEMORY[0x2199DEBB0](self->_mouseMovedHandlerPrivate);
  v13 = v12;
  if (v12)
  {
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke_2;
    v14[3] = &unk_24D2B3058;
    v14[4] = self;
    v15 = v12;
    v16 = x;
    v17 = v5;
    dispatch_async(v8, v14);

  }
}

uint64_t __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke(uint64_t a1)
{
  float v1;
  float v2;

  v1 = *(double *)(a1 + 48);
  v2 = *(double *)(a1 + 56);
  return (*(uint64_t (**)(_QWORD, _QWORD, float, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v1, v2);
}

uint64_t __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke_2(uint64_t a1)
{
  float v1;
  float v2;

  v1 = *(double *)(a1 + 48);
  v2 = *(double *)(a1 + 56);
  return (*(uint64_t (**)(_QWORD, _QWORD, float, float))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v1, v2);
}

- (void)setButtonEventSource:(id)a3
{
  id buttonEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  buttonEventObservation = self->_buttonEventObservation;
  self->_buttonEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__GCMouseInput_PubSub__setButtonEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e26_v16__0____GCButtonEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observeButtonEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_buttonEventObservation;
  self->_buttonEventObservation = v6;

}

uint64_t __45__GCMouseInput_PubSub__setButtonEventSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_receivedEvent");
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v4, "mask");

  return objc_msgSend(v5, "handleMouseButtonEventSettingButtonMask:", v6);
}

- (void)setScrollEventSource:(id)a3
{
  id scrollEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  scrollEventObservation = self->_scrollEventObservation;
  self->_scrollEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__GCMouseInput_PubSub__setScrollEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e26_v16__0____GCScrollEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observeScrollEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_scrollEventObservation;
  self->_scrollEventObservation = v6;

}

uint64_t __45__GCMouseInput_PubSub__setScrollEventSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  float v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_receivedEvent");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "x");
  v7 = v6;
  objc_msgSend(v4, "y");
  v9 = v8;

  return objc_msgSend(v5, "handleScrollEventWithDelta:", v7, v9);
}

- (void)setDigitizerEventSource:(id)a3
{
  id digitizerEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  digitizerEventObservation = self->_digitizerEventObservation;
  self->_digitizerEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__GCMouseInput_PubSub__setDigitizerEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e29_v16__0____GCDigitizerEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observeDigitizerEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_digitizerEventObservation;
  self->_digitizerEventObservation = v6;

}

uint64_t __48__GCMouseInput_PubSub__setDigitizerEventSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  float v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_receivedEvent");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "x");
  v7 = v6;
  objc_msgSend(v4, "y");
  v9 = v8;

  return objc_msgSend(v5, "handleDigitizerEvent:", v7, v9);
}

- (void)setPointerEventSource:(id)a3
{
  id pointerEventObservation;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  pointerEventObservation = self->_pointerEventObservation;
  self->_pointerEventObservation = 0;
  v5 = a3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__GCMouseInput_PubSub__setPointerEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v16__0____GCPointerEvent__8lu32l8;
  v8[4] = self;
  objc_msgSend(v5, "observePointerEvents:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_pointerEventObservation;
  self->_pointerEventObservation = v6;

}

uint64_t __46__GCMouseInput_PubSub__setPointerEventSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  float v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_receivedEvent");
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "x");
  v7 = v6;
  objc_msgSend(v4, "y");
  v9 = v8;

  return objc_msgSend(v5, "handleMouseMovementEventWithDelta:", v7, v9);
}

@end
