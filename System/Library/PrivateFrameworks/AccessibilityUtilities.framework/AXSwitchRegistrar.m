@implementation AXSwitchRegistrar

- (AXSwitchRegistrar)init
{
  AXSwitchRegistrar *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSwitchRegistrar;
  v2 = -[AXSwitchRegistrar init](&v5, sel_init);
  if (v2)
  {
    +[AXSwitch switchWithAction:name:source:type:](AXSwitch, "switchWithAction:name:source:type:", 0, 0, 0, CFSTR("SwitchTypeOptional"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSwitchRegistrar setASwitch:](v2, "setASwitch:", v3);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AXSwitchRegistrar _filterEvents:](self, "_filterEvents:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXSwitchRegistrar;
  -[AXSwitchRegistrar dealloc](&v3, sel_dealloc);
}

- (void)beginFilteringEvents
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF39F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39F0], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_18C62B000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  -[AXSwitchRegistrar _filterEvents:](self, "_filterEvents:", 1);
}

- (void)endFilteringEvents
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF39F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39F0], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_18C62B000, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  -[AXSwitchRegistrar _filterEvents:](self, "_filterEvents:", 0);
}

- (BOOL)isSwitchWithName:(id)a3
{
  return SCATSwitchExistsWithName(a3);
}

- (BOOL)_isKeyboardSwitchWithKeyCode:(unsigned __int16)a3 longPress:(BOOL)a4
{
  return -[AXSwitchRegistrar _isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:](self, "_isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:", CFSTR("SwitchSourceKeyboard"), a3, 0xFFFFFFFFLL, -1, 0);
}

- (BOOL)_isMFISwitchWithButtonNumber:(unsigned int)a3 longPress:(BOOL)a4
{
  return -[AXSwitchRegistrar _isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:](self, "_isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:", CFSTR("SwitchSourceMFI"), 0xFFFFLL, *(_QWORD *)&a3, -1, 0);
}

- (BOOL)_isATVRemoteButtonSwitchWithUsage:(int64_t)a3 longPress:(BOOL)a4
{
  return -[AXSwitchRegistrar _isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:](self, "_isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:", CFSTR("SwitchSourceATVRemote"), 0xFFFFLL, 0xFFFFFFFFLL, a3, 0);
}

- (BOOL)_isMIDISwitchWithMidiEvent:(id)a3
{
  return -[AXSwitchRegistrar _isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:](self, "_isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:", CFSTR("SwitchSourceMIDI"), 0xFFFFLL, 0xFFFFFFFFLL, -1, a3);
}

- (BOOL)_isGamepadSwitchWithKeyCode:(unsigned __int16)a3 longPress:(BOOL)a4
{
  return -[AXSwitchRegistrar _isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:](self, "_isSwitchWithSource:keyCode:buttonNumber:ATVRemoteButtonUsage:midiEvent:", CFSTR("SwitchSourceGamepad"), a3, 0xFFFFFFFFLL, -1, 0);
}

- (BOOL)_isSwitchWithSource:(id)a3 keyCode:(unsigned __int16)a4 buttonNumber:(unsigned int)a5 ATVRemoteButtonUsage:(int64_t)a6 midiEvent:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  int64_t v22;
  unsigned int v23;
  unsigned __int16 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v11 = a3;
  v12 = a7;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assistiveTouchSwitches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__AXSwitchRegistrar__isSwitchWithSource_keyCode_buttonNumber_ATVRemoteButtonUsage_midiEvent___block_invoke;
  v18[3] = &unk_1E24C7D70;
  v15 = v11;
  v24 = a4;
  v23 = a5;
  v21 = &v25;
  v22 = a6;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);
  LOBYTE(a5) = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return a5;
}

void __93__AXSwitchRegistrar__isSwitchWithSource_keyCode_buttonNumber_ATVRemoteButtonUsage_midiEvent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  id v24;

  v24 = a2;
  objc_msgSend(v24, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  v7 = v24;
  if (v6)
  {
    objc_msgSend(v24, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", CFSTR("SwitchSourceKeyboard"))
      && objc_msgSend(v24, "keyCode") == *(unsigned __int16 *)(a1 + 68))
    {
      goto LABEL_10;
    }
    objc_msgSend(v24, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", CFSTR("SwitchSourceGamepad"))
      && objc_msgSend(v24, "keyCode") == *(unsigned __int16 *)(a1 + 68))
    {
LABEL_9:

LABEL_10:
      v7 = v24;
LABEL_11:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v24, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", CFSTR("SwitchSourceMFI"))
      && objc_msgSend(v24, "buttonNumber") == *(_DWORD *)(a1 + 64))
    {

      goto LABEL_9;
    }
    objc_msgSend(v24, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", CFSTR("SwitchSourceATVRemote")))
    {
      v12 = objc_msgSend(v24, "buttonNumber");
      v13 = *(_QWORD *)(a1 + 56);

      v7 = v24;
      if (v12 == v13)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v24, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", CFSTR("SwitchSourceMIDI"));

    v7 = v24;
    if (!v15)
      goto LABEL_12;
    objc_msgSend(v24, "midiEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(id *)(a1 + 40);
    v18 = v17;
    if (v16)
    {
      if (v17)
      {
        if ((objc_msgSend(v16, "isOmniChannel") & 1) != 0
          || (v19 = objc_msgSend(v16, "channel"), v19 == objc_msgSend(v18, "channel")))
        {
          v20 = objc_msgSend(v16, "type");
          if (v20 == objc_msgSend(v18, "type"))
          {
            v21 = objc_msgSend(v16, "type");
            if ((unint64_t)(v21 - 1) >= 3)
            {
              if (v21 == 4)
              {
                v22 = objc_msgSend(v16, "control");
                v23 = objc_msgSend(v18, "control");
              }
              else
              {
                if (v21 != 5)
                {
LABEL_30:
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
                  *a3 = 1;
                  goto LABEL_31;
                }
                v22 = objc_msgSend(v16, "program");
                v23 = objc_msgSend(v18, "program");
              }
            }
            else
            {
              v22 = objc_msgSend(v16, "note");
              v23 = objc_msgSend(v18, "note");
            }
            if (v22 == v23)
              goto LABEL_30;
          }
        }
      }
    }
LABEL_31:

    v7 = v24;
  }
LABEL_12:

}

- (void)_handleApplicationDidBecomeActive:(id)a3
{
  void *v4;
  int v5;

  -[AXSwitchRegistrar delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "switchRegistrarShouldFilterEvents:", self);

  if (v5)
    -[AXSwitchRegistrar _filterEvents:](self, "_filterEvents:", 1);
}

- (void)_handleApplicationWillResignActive:(id)a3
{
  -[AXSwitchRegistrar _filterEvents:](self, "_filterEvents:", 0);
}

- (void)_handleKeyboardKeyDownEvent:(__IOHIDEvent *)a3
{
  void *v4;
  int v5;
  uint64_t IntegerValue;
  void *v7;
  id v8;

  -[AXSwitchRegistrar delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "switchRegistrarShouldProcessKeyboardKeyEvent:", self);

  if (v5)
  {
    IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue();
    if (-[AXSwitchRegistrar _isKeyboardSwitchWithKeyCode:longPress:](self, "_isKeyboardSwitchWithKeyCode:longPress:", IntegerValue, -[AXSwitchRegistrar addLongPressSwitch](self, "addLongPressSwitch")))
    {
      -[AXSwitchRegistrar delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "switchRegistrarKeyboardKeyAlreadyInUseForSwitch:", self);
    }
    else
    {
      -[AXSwitchRegistrar aSwitch](self, "aSwitch");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setKeyCode:", IntegerValue);
      objc_msgSend(v8, "setSource:", CFSTR("SwitchSourceKeyboard"));
      -[AXSwitchRegistrar delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "switchRegistrar:didUpdateSwitch:", self, v8);

    }
  }
}

- (void)_handleGamepadButtonPressedEvent:(__IOHIDEvent *)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[AXSwitchRegistrar delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "switchRegistrarShouldProcessGamepadEvent:", self);

  if (v6)
  {
    v7 = +[AXGameControllerEvent axGameControllerKeyCodeForEvent:](AXGameControllerEvent, "axGameControllerKeyCodeForEvent:", a3);
    if ((unsigned __int16)(v7 - 13) >= 4u)
    {
      v8 = v7;
      if (-[AXSwitchRegistrar _isGamepadSwitchWithKeyCode:longPress:](self, "_isGamepadSwitchWithKeyCode:longPress:", v7, -[AXSwitchRegistrar addLongPressSwitch](self, "addLongPressSwitch")))
      {
        -[AXSwitchRegistrar delegate](self, "delegate");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "switchRegistrarGamepadSourceAlreadyInUseForSwitch:", self);
      }
      else
      {
        -[AXSwitchRegistrar aSwitch](self, "aSwitch");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setKeyCode:", v8);
        objc_msgSend(v10, "setSource:", CFSTR("SwitchSourceGamepad"));
        -[AXSwitchRegistrar delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "switchRegistrar:didUpdateSwitch:", self, v10);

      }
    }
  }
}

- (void)_handleMIDIEvent:(id)a3 device:(id)a4 entity:(id)a5 source:(id)a6
{
  unint64_t v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = objc_msgSend(v13, "type");
  if (v7 <= 7 && ((1 << v7) & 0xB4) != 0)
  {
    -[AXSwitchRegistrar delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "switchRegistrarShouldProcessMIDIEvent:", self);

    if (v10)
    {
      if (-[AXSwitchRegistrar _isMIDISwitchWithMidiEvent:](self, "_isMIDISwitchWithMidiEvent:", v13))
      {
        -[AXSwitchRegistrar delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "switchRegistrarMIDISourceAlreadyInUseForSwitch:", self);
      }
      else
      {
        -[AXSwitchRegistrar aSwitch](self, "aSwitch");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSource:", CFSTR("SwitchSourceMIDI"));
        objc_msgSend(v11, "setMidiEvent:", v13);
        -[AXSwitchRegistrar delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "switchRegistrar:didUpdateSwitch:", self, v11);

      }
    }
  }

}

- (void)_handleATVRemoteButtonDownEvent:(__IOHIDEvent *)a3
{
  void *v4;
  int v5;
  uint64_t IntegerValue;
  void *v7;
  id v8;

  -[AXSwitchRegistrar delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "switchRegistrarShouldProcessKeyboardKeyEvent:", self);

  if (v5)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    if (-[AXSwitchRegistrar _isATVRemoteButtonSwitchWithUsage:longPress:](self, "_isATVRemoteButtonSwitchWithUsage:longPress:", IntegerValue, -[AXSwitchRegistrar addLongPressSwitch](self, "addLongPressSwitch")))
    {
      -[AXSwitchRegistrar delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "switchRegistrarMFIButtonAlreadyInUseForSwitch:", self);
    }
    else
    {
      -[AXSwitchRegistrar aSwitch](self, "aSwitch");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setButtonNumber:", IntegerValue);
      objc_msgSend(v8, "setSource:", CFSTR("SwitchSourceATVRemote"));
      -[AXSwitchRegistrar delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "switchRegistrar:didUpdateSwitch:", self, v8);

    }
  }
}

- (void)_handleMFIButtonDownValue:(__IOHIDValue *)a3
{
  void *v5;
  int v6;
  __IOHIDElement *Element;
  uint64_t Usage;
  void *v9;
  id v10;

  -[AXSwitchRegistrar delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "switchRegistrarShouldProcessMFIButtonEvent:", self);

  if (v6)
  {
    Element = IOHIDValueGetElement(a3);
    Usage = IOHIDElementGetUsage(Element);
    if (-[AXSwitchRegistrar _isMFISwitchWithButtonNumber:longPress:](self, "_isMFISwitchWithButtonNumber:longPress:", Usage, -[AXSwitchRegistrar addLongPressSwitch](self, "addLongPressSwitch")))
    {
      -[AXSwitchRegistrar delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "switchRegistrarMFIButtonAlreadyInUseForSwitch:", self);
    }
    else
    {
      -[AXSwitchRegistrar aSwitch](self, "aSwitch");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setButtonNumber:", Usage);
      objc_msgSend(v10, "setSource:", CFSTR("SwitchSourceMFI"));
      -[AXSwitchRegistrar delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "switchRegistrar:didUpdateSwitch:", self, v10);

    }
  }
}

- (id)_keyboardMatching
{
  return &unk_1E24F8D80;
}

- (id)_atvRemoteMatching
{
  return &unk_1E24F8D98;
}

- (id)_mfiMatching
{
  return &unk_1E24F8DB0;
}

- (id)_gamepadMatching
{
  return &unk_1E24F8DC8;
}

- (void)_filterEvents:(BOOL)a3
{
  _BOOL4 v3;
  __IOHIDDevice *v5;
  __IOHIDEventSystemClient *v6;
  __IOHIDManager *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  IOHIDManagerRef v13;
  __IOHIDManager *v14;
  const __CFArray *v15;
  __CFRunLoop *Current;
  uint64_t v17;
  CFStringRef *v18;
  __CFRunLoop *v19;
  __CFRunLoop *v20;
  AXMIDIManager *v21;
  AXMIDIManager *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id location;

  v3 = a3;
  v5 = -[AXSwitchRegistrar device](self, "device");
  v6 = -[AXSwitchRegistrar eventSystemClient](self, "eventSystemClient");
  v7 = -[AXSwitchRegistrar manager](self, "manager");
  if (v3)
  {
    if (!v6)
    {
      v8 = IOHIDEventSystemClientCreate();
      if (!v8)
      {
        v24 = CFSTR("Could not create event system client");
        LOBYTE(v23) = 1;
        _AXLogWithFacility();
        if (!v7)
        {
LABEL_6:
          v13 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
          if (v13)
          {
            v14 = v13;
            -[AXSwitchRegistrar _mfiMatching](self, "_mfiMatching");
            v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
            IOHIDManagerSetDeviceMatchingMultiple(v14, v15);

            Current = CFRunLoopGetCurrent();
            IOHIDManagerScheduleWithRunLoop(v14, Current, (CFStringRef)*MEMORY[0x1E0C9B280]);
            IOHIDManagerRegisterDeviceMatchingCallback(v14, (IOHIDDeviceCallback)_ASUIDeviceMatchingCallback, self);
            v17 = IOHIDManagerOpen(v14, 0);
            if ((_DWORD)v17)
            {
              v24 = CFSTR("Could not open HID manager: %d");
              v25 = v17;
              LOBYTE(v23) = 1;
              _AXLogWithFacility();
            }
            -[AXSwitchRegistrar setManager:](self, "setManager:", v14, v23, v24, v25);
            CFRelease(v14);
          }
        }
LABEL_18:
        objc_initWeak(&location, self);
        v21 = [AXMIDIManager alloc];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __35__AXSwitchRegistrar__filterEvents___block_invoke;
        v26[3] = &unk_1E24C7D98;
        objc_copyWeak(&v27, &location);
        v22 = -[AXMIDIManager initWithIdentifier:eventHandler:](v21, "initWithIdentifier:eventHandler:", CFSTR("AXEventRegistrar"), v26);
        -[AXSwitchRegistrar setMidiManager:](self, "setMidiManager:", v22);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        return;
      }
      v9 = (const void *)v8;
      -[AXSwitchRegistrar _keyboardMatching](self, "_keyboardMatching");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSwitchRegistrar _gamepadMatching](self, "_gamepadMatching");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      IOHIDEventSystemClientSetMatchingMultiple();
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
      -[AXSwitchRegistrar setEventSystemClient:](self, "setEventSystemClient:", v9);
      CFRelease(v9);

    }
    if (!v7)
      goto LABEL_6;
    goto LABEL_18;
  }
  v18 = (CFStringRef *)MEMORY[0x1E0C9B280];
  if (v5)
  {
    v19 = CFRunLoopGetCurrent();
    IOHIDDeviceUnscheduleFromRunLoop(v5, v19, *v18);
    IOHIDDeviceClose(v5, 0);
    -[AXSwitchRegistrar setDevice:](self, "setDevice:", 0);
  }
  if (v6)
  {
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
    -[AXSwitchRegistrar setEventSystemClient:](self, "setEventSystemClient:", 0);
  }
  if (v7)
  {
    v20 = CFRunLoopGetCurrent();
    IOHIDManagerUnscheduleFromRunLoop(v7, v20, *v18);
    IOHIDManagerClose(v7, 0);
    -[AXSwitchRegistrar setManager:](self, "setManager:", 0);
  }
  -[AXSwitchRegistrar setMidiManager:](self, "setMidiManager:", 0);
}

void __35__AXSwitchRegistrar__filterEvents___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_handleMIDIEvent:device:entity:source:", v12, v11, v10, v9);

}

- (AXSwitchRegistrarDelegate)delegate
{
  return (AXSwitchRegistrarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)addLongPressSwitch
{
  return self->_addLongPressSwitch;
}

- (void)setAddLongPressSwitch:(BOOL)a3
{
  self->_addLongPressSwitch = a3;
}

- (AXSwitch)aSwitch
{
  return self->_aSwitch;
}

- (void)setASwitch:(id)a3
{
  objc_storeStrong((id *)&self->_aSwitch, a3);
}

- (__IOHIDDevice)device
{
  return self->_device;
}

- (void)setDevice:(__IOHIDDevice *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (__IOHIDEventSystemClient)eventSystemClient
{
  return self->_eventSystemClient;
}

- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (__IOHIDManager)manager
{
  return self->_manager;
}

- (void)setManager:(__IOHIDManager *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AXMIDIManager)midiManager
{
  return self->_midiManager;
}

- (void)setMidiManager:(id)a3
{
  objc_storeStrong((id *)&self->_midiManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midiManager, 0);
  objc_storeStrong((id *)&self->_aSwitch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
