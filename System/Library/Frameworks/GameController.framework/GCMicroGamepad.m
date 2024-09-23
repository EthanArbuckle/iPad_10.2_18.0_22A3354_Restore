@implementation GCMicroGamepad

- (BOOL)supportsDpadTaps
{
  void *v2;
  char v3;

  -[GCPhysicalInputProfile controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForwarded");

  return v3;
}

- (id)productCategory
{
  uint64_t v3;
  id *v4;
  __CFString *v5;

  if (GCCurrentProcessLinkedOnAfter(0x7E50901FFFFFFFFuLL)
    && -[GCMicroGamepad conformsToProtocol:](self, "conformsToProtocol:", &unk_254DCB1F0))
  {
    v3 = -[GCMicroGamepad deviceType](self, "deviceType");
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (v3 != 4)
      {
        v5 = CFSTR("Generic Remote");
        return v5;
      }
      v4 = (id *)&GCProductCategoryControlCenterRemote;
    }
    else
    {
      v4 = (id *)&GCProductCategorySiriRemote1stGen;
    }
    v5 = (__CFString *)*v4;
  }
  else
  {
    v5 = CFSTR("Siri Remote");
  }
  return v5;
}

- (void)microControllerWithDigitizerX:(float)a3 digitizerY:(float)a4 timestamp:(unint64_t)a5 touchDown:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  GCMicroGamepad *v25;

  v6 = a6;
  -[GCPhysicalInputProfile controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GCPhysicalInputProfile controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dpad");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v12, "digitizerTouchEvent:x:y:timestamp:forceSkipDpadRotation:", v15, a5, 0, a3, a4);
  else
    objc_msgSend(v12, "digitizerTouchUp:timestamp:forceSkipDpadRotation:", v15, a5, 0);

  -[GCPhysicalInputProfile controller](self, "controller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handlerQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__GCMicroGamepad_Legacy__microControllerWithDigitizerX_digitizerY_timestamp_touchDown___block_invoke;
  v21[3] = &unk_24D2B51E8;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  v25 = self;
  v18 = v14;
  v19 = v12;
  v20 = v13;
  dispatch_async(v17, v21);

}

void __87__GCMicroGamepad_Legacy__microControllerWithDigitizerX_digitizerY_timestamp_touchDown___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "dpad");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "valueDidChangeHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "dpad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v2)[2](v2, v3, v4);

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 656);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "dpad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  }
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  void *v4;
  int Type;
  GCMicroGamepad *v6;
  uint64_t IntegerValue;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t TimeStamp;
  double v16;
  double v17;
  GCMicroGamepad *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  GCMicroGamepad *v29;
  id v30;
  _BOOL8 v31;
  GCMicroGamepad *v32;
  id v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  float v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  char v47;
  id v48;
  _QWORD v49[4];
  GCMicroGamepad *v50;
  id v51;
  GCMicroGamepad *v52;
  _QWORD block[4];
  id v54;

  +[NSDate date](&off_254DF6DA0, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  -[GCMicroGamepad setLastEventTimestamp:](self, "setLastEventTimestamp:");

  Type = IOHIDEventGetType();
  if (Type != 11)
  {
    if (Type != 3)
      return;
    v6 = self;
    IntegerValue = IOHIDEventGetIntegerValue();
    v8 = IOHIDEventGetIntegerValue();
    v9 = v8;
    v10 = IntegerValue == 12 && v8 == 547 || IntegerValue == 1 && v8 == 134;
    v22 = IOHIDEventGetIntegerValue();
    -[GCPhysicalInputProfile controller](v6, "controller");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handlerQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v26 = MEMORY[0x24BDAC9B8];
      v27 = MEMORY[0x24BDAC9B8];
    }

    if (v22 == 1 && v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke;
      block[3] = &unk_24D2B2B20;
      v54 = v23;
      dispatch_async(v26, block);

    }
    if (-[GCMicroGamepad conformsToProtocol:](v6, "conformsToProtocol:", &unk_254DD3900))
      v29 = v6;
    else
      v29 = 0;
    if (IntegerValue == 12)
    {
      if (v9 <= 127)
      {
        switch(v9)
        {
          case 'A':
            goto LABEL_40;
          case 'B':
            -[GCMicroGamepad dpad](v6, "dpad");
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v31 = v22 != 0;
              v32 = v29;
              v33 = v30;
              v34 = 1;
              goto LABEL_48;
            }
            v41 = (float)v22;
            goto LABEL_57;
          case 'C':
            -[GCMicroGamepad dpad](v6, "dpad");
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v31 = v22 != 0;
              v32 = v29;
              v33 = v30;
              v34 = 8;
              goto LABEL_48;
            }
            v41 = (float)-v22;
LABEL_57:
            -[GCPhysicalInputProfile controller](v6, "controller");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "handlerQueue");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v30;
            objc_msgSend(v30, "yAxis");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_61;
          case 'D':
            -[GCMicroGamepad dpad](v6, "dpad");
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v31 = v22 != 0;
              v32 = v29;
              v33 = v30;
              v34 = 4;
              goto LABEL_48;
            }
            v41 = (float)-v22;
            goto LABEL_60;
          case 'E':
            -[GCMicroGamepad dpad](v6, "dpad");
            v30 = (id)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v31 = v22 != 0;
              v32 = v29;
              v33 = v30;
              v34 = 2;
LABEL_48:
              -[GCMicroGamepad dpadDirectionEvent:direction:pressed:](v32, "dpadDirectionEvent:direction:pressed:", v33, v34, v31);
              v36 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            }
            v41 = (float)v22;
LABEL_60:
            -[GCPhysicalInputProfile controller](v6, "controller");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "handlerQueue");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v30;
            objc_msgSend(v30, "xAxis");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_61:
            v46 = v44;
            *(float *)&v45 = v41;
            v47 = objc_msgSend(v44, "_setValue:queue:", v43, v45);

            if ((v47 & 1) != 0)
            {
              objc_msgSend(0, "addObject:", v30);

              -[GCMicroGamepad dpad](v6, "dpad");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {

              v39 = 0;
            }

            break;
          default:
            goto LABEL_67;
        }
        goto LABEL_65;
      }
      if (v9 != 547)
      {
        if (v9 == 205)
        {
          -[GCMicroGamepad buttonX](v6, "buttonX");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          *(float *)&v40 = (float)v22;
          if (objc_msgSend(v30, "_setValue:queue:", v26, v40))
          {
            -[GCMicroGamepad buttonX](v6, "buttonX");
            v36 = objc_claimAutoreleasedReturnValue();
            goto LABEL_49;
          }
        }
        else
        {
          if (v9 != 128)
          {
LABEL_67:

            return;
          }
LABEL_40:
          -[GCMicroGamepad buttonA](v6, "buttonA");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v37;
          if (v29)
          {
            -[GCMicroGamepad centerButtonEvent:pressed:](v29, "centerButtonEvent:pressed:", v37, v22 != 0);
            v36 = objc_claimAutoreleasedReturnValue();
            goto LABEL_49;
          }
          *(float *)&v38 = (float)v22;
          if (objc_msgSend(v37, "_setValue:queue:", v26, v38))
          {
            -[GCMicroGamepad buttonA](v6, "buttonA");
            v36 = objc_claimAutoreleasedReturnValue();
            goto LABEL_49;
          }
        }
        goto LABEL_54;
      }
    }
    else if (IntegerValue != 1 || v9 != 134)
    {
      goto LABEL_67;
    }
    -[GCMicroGamepad buttonMenu](v6, "buttonMenu");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v35 = (float)v22;
    if (objc_msgSend(v30, "_setValue:queue:", v26, v35))
    {
      -[GCMicroGamepad buttonMenu](v6, "buttonMenu");
      v36 = objc_claimAutoreleasedReturnValue();
LABEL_49:
      v39 = (void *)v36;
      goto LABEL_65;
    }
LABEL_54:
    v39 = 0;
LABEL_65:

    if (v39)
    {
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke_131;
      v49[3] = &unk_24D2B3D70;
      v50 = v6;
      v51 = v39;
      v52 = v50;
      v48 = v39;
      dispatch_async(v26, v49);

    }
    goto LABEL_67;
  }
  IOHIDEventGetFloatValue();
  v12 = v11;
  IOHIDEventGetFloatValue();
  v14 = v13;
  TimeStamp = IOHIDEventGetTimeStamp();
  if (IOHIDEventGetIntegerValue() && IOHIDEventGetIntegerValue() == 1)
  {
    v16 = v12 * 2.0 + -1.0;
    *(float *)&v16 = v16;
    v17 = v14 * 2.0 + -1.0;
    *(float *)&v17 = v17;
    *(float *)&v17 = -*(float *)&v17;
    v18 = self;
    v19 = TimeStamp;
    v20 = 1;
  }
  else
  {
    LODWORD(v16) = 0;
    LODWORD(v17) = 0;
    v18 = self;
    v19 = TimeStamp;
    v20 = 0;
  }
  -[GCMicroGamepad microControllerWithDigitizerX:digitizerY:timestamp:touchDown:](v18, "microControllerWithDigitizerX:digitizerY:timestamp:touchDown:", v19, v20, v16, v17);
}

void __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "debugName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "%@ pause event", (uint8_t *)&v6, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

void __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke_131(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setLastEventTimestamp:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCMicroGamepad;
  -[GCPhysicalInputProfile setLastEventTimestamp:](&v3, sel_setLastEventTimestamp_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCMicroGamepad)initWithIdentifier:(id)a3
{
  GCMicroGamepad *v3;
  GCMicroGamepad *v4;
  uint64_t v5;
  GCControllerDirectionPad *dpad;
  uint64_t v7;
  GCControllerButtonInput *button0;
  uint64_t v9;
  GCControllerButtonInput *button1;
  uint64_t v11;
  GCControllerButtonInput *buttonMenu;
  __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __CFString *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[48];
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)GCMicroGamepad;
  v3 = -[GCPhysicalInputProfile initWithIdentifier:](&v33, sel_initWithIdentifier_, a3);
  v4 = v3;
  if (v3)
  {
    v30 = 0;
    memset(v29, 0, sizeof(v29));
    v29[8] = 1;
    v31 = CFSTR("SIRI_REMOTE_DIRECTION_PAD");
    v32 = 0;
    -[GCPhysicalInputProfile _directionPadWithInfo:](v3, "_directionPadWithInfo:", v29);
    v5 = objc_claimAutoreleasedReturnValue();
    dpad = v4->_dpad;
    v4->_dpad = (GCControllerDirectionPad *)v5;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = CFSTR("Button A");
    LOWORD(v25) = 257;
    *(_QWORD *)&v28 = CFSTR("SIRI_REMOTE_BUTTON_A");
    -[GCPhysicalInputProfile _buttonWithInfo:](v4, "_buttonWithInfo:", &v24);
    v7 = objc_claimAutoreleasedReturnValue();
    button0 = v4->_button0;
    v4->_button0 = (GCControllerButtonInput *)v7;

    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = CFSTR("Button X");
    LOWORD(v20) = 257;
    *(_QWORD *)&v23 = CFSTR("SIRI_REMOTE_BUTTON_X");
    -[GCPhysicalInputProfile _buttonWithInfo:](v4, "_buttonWithInfo:", &v19);
    v9 = objc_claimAutoreleasedReturnValue();
    button1 = v4->_button1;
    v4->_button1 = (GCControllerButtonInput *)v9;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v14 = CFSTR("Button Menu");
    LOWORD(v15) = 257;
    *(_QWORD *)&v18 = CFSTR("SIRI_REMOTE_BUTTON_MENU");
    -[GCPhysicalInputProfile _buttonWithInfo:](v4, "_buttonWithInfo:", &v14);
    v11 = objc_claimAutoreleasedReturnValue();
    buttonMenu = v4->_buttonMenu;
    v4->_buttonMenu = (GCControllerButtonInput *)v11;

  }
  return v4;
}

- (GCMicroGamepad)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GCMicroGamepad *v7;

  v4 = a3;
  GCIPCObjectIdentifier_Classes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GCMicroGamepad initWithIdentifier:](self, "initWithIdentifier:", v6);
  if (v7)
    -[GCControllerDirectionPad setNonAnalog:](v7->_dpad, "setNonAnalog:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("digital")));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GCPhysicalInputProfile identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v5, "encodeBool:forKey:", 0, CFSTR("digital"));
}

- (GCMicroGamepadSnapshot)saveSnapshot
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  GCMicroGamepadSnapshot *v14;
  void *v15;
  GCMicroGamepadSnapshot *v16;
  GCMicroGamepadSnapshotData snapshotData;

  snapshotData.version = 256;
  snapshotData.size = 20;
  -[GCMicroGamepad dpad](self, "dpad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  snapshotData.dpadX = v5;

  -[GCMicroGamepad dpad](self, "dpad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  snapshotData.dpadY = v8;

  -[GCMicroGamepad buttonA](self, "buttonA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  snapshotData.buttonA = v10;

  -[GCMicroGamepad buttonX](self, "buttonX");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  snapshotData.buttonX = v12;

  NSDataFromGCMicroGamepadSnapshotData(&snapshotData);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [GCMicroGamepadSnapshot alloc];
  -[GCPhysicalInputProfile controller](self, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[GCMicroGamepadSnapshot initWithController:snapshotData:](v14, "initWithController:snapshotData:", v15, v13);

  return v16;
}

- (id)name
{
  return CFSTR("MicroGamepad");
}

- (void)setStateFromMicroGamepad:(GCMicroGamepad *)microGamepad
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  GCControllerDirectionPad *dpad;
  int v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  GCControllerDirectionPad *v18;
  NSObject *v19;
  id v20;
  void *v21;
  double v22;
  char v23;
  void *v24;
  double v25;
  int v26;
  GCControllerButtonInput *buttonMenu;
  void *v28;
  int v29;
  int v30;
  GCControllerButtonInput *v31;
  id v32;
  double v33;
  GCControllerButtonInput *button0;
  void *v35;
  int v36;
  int v37;
  GCControllerButtonInput *v38;
  id v39;
  double v40;
  GCControllerButtonInput *button1;
  void *v42;
  int v43;
  int v44;
  GCControllerButtonInput *v45;
  id v46;
  double v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  GCMicroGamepad *v57;
  _QWORD block[5];
  GCMicroGamepad *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v57 = microGamepad;
  -[GCPhysicalInputProfile controller](self, "controller");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[GCPhysicalInputProfile controller](self, "controller"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isSnapshot"),
        v6,
        v5,
        v7))
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handlerQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    dpad = self->_dpad;
    -[GCMicroGamepad dpad](v57, "dpad");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "xAxis");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "value");
    v13 = v12;
    -[GCMicroGamepad dpad](v57, "dpad");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "yAxis");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v17 = v16;
    v18 = dpad;
    v19 = v10;
    v20 = v8;
    -[GCControllerDirectionPad xAxis](v18, "xAxis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = v13;
    v23 = objc_msgSend(v21, "_setValue:queue:", v19, v22);

    -[GCControllerDirectionPad yAxis](v18, "yAxis");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = v17;
    v26 = objc_msgSend(v24, "_setValue:queue:", v19, v25);

    if ((v23 & 1) != 0 || v26)
      objc_msgSend(v20, "addObject:", v18);

    buttonMenu = self->_buttonMenu;
    -[GCMicroGamepad buttonMenu](v57, "buttonMenu");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "value");
    v30 = v29;
    v31 = buttonMenu;
    v32 = v20;
    LODWORD(v33) = v30;
    if (-[GCControllerButtonInput _setValue:queue:](v31, "_setValue:queue:", v19, v33))
      objc_msgSend(v32, "addObject:", v31);

    button0 = self->_button0;
    -[GCMicroGamepad buttonA](v57, "buttonA");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "value");
    v37 = v36;
    v38 = button0;
    v39 = v32;
    LODWORD(v40) = v37;
    if (-[GCControllerButtonInput _setValue:queue:](v38, "_setValue:queue:", v19, v40))
      objc_msgSend(v39, "addObject:", v38);

    button1 = self->_button1;
    -[GCMicroGamepad buttonX](v57, "buttonX");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "value");
    v44 = v43;
    v45 = button1;
    v46 = v39;
    LODWORD(v47) = v44;
    if (-[GCControllerButtonInput _setValue:queue:](v45, "_setValue:queue:", v19, v47))
      objc_msgSend(v46, "addObject:", v45);

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v48 = v46;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v62;
      v52 = MEMORY[0x24BDAC760];
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v62 != v51)
            objc_enumerationMutation(v48);
          v54 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v53);
          block[0] = v52;
          block[1] = 3221225472;
          block[2] = __43__GCMicroGamepad_setStateFromMicroGamepad___block_invoke;
          block[3] = &unk_24D2B3D70;
          block[4] = self;
          v59 = v57;
          v60 = v54;
          dispatch_async(v19, block);

          ++v53;
        }
        while (v50 != v53);
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v50);
    }

  }
}

void __43__GCMicroGamepad_setStateFromMicroGamepad___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "controller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "set %@ StateFromMicroGamepad %@: %@", (uint8_t *)&v11, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

+ (id)_current
{
  void *v2;
  void *v3;

  +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMicroGamepad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  GCMicroGamepad *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[GCPhysicalInputProfile controller](self, "controller");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "debugName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "%@ changed: %@", buf, 0x16u);

    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__GCMicroGamepad__triggerValueChangedHandlerForElement_queue___block_invoke;
  block[3] = &unk_24D2B2B70;
  block[4] = self;
  v13 = v6;
  v14 = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __62__GCMicroGamepad__triggerValueChangedHandlerForElement_queue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "valueDidChangeHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v5 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = v5;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);
    v3 = v5;
  }

}

- (GCControllerButtonInput)buttonA
{
  return self->_button0;
}

- (GCControllerButtonInput)buttonX
{
  return self->_button1;
}

- (GCMicroGamepadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCMicroGamepadValueChangedHandler)valueChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, valueChangedHandler, 656);
}

- (GCControllerDirectionPad)dpad
{
  return self->_dpad;
}

- (GCControllerButtonInput)buttonMenu
{
  return self->_buttonMenu;
}

- (BOOL)reportsAbsoluteDpadValues
{
  return self->_reportsAbsoluteDpadValues;
}

- (void)setReportsAbsoluteDpadValues:(BOOL)reportsAbsoluteDpadValues
{
  self->_reportsAbsoluteDpadValues = reportsAbsoluteDpadValues;
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void)setAllowsRotation:(BOOL)allowsRotation
{
  self->_allowsRotation = allowsRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMenu, 0);
  objc_storeStrong((id *)&self->_dpad, 0);
  objc_storeStrong((id *)&self->_button1, 0);
  objc_storeStrong((id *)&self->_button0, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end
