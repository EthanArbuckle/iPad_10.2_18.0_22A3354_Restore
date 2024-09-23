@implementation AXMIDIManager

- (AXMIDIManager)init
{
  return -[AXMIDIManager initWithIdentifier:eventHandler:](self, "initWithIdentifier:eventHandler:", CFSTR("MIDIClient"), 0);
}

- (AXMIDIManager)initWithIdentifier:(id)a3 eventHandler:(id)a4
{
  id v6;
  id v7;
  AXMIDIManager *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  AXMIDIParser *v12;
  AXMIDIParser *parser;
  uint64_t v14;
  NSMutableSet *devices;
  NSObject *v16;
  uint64_t v17;
  OSStatus v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  MIDIClientRef midiClientRef;
  OSStatus v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t readBlock;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, void *);
  void *v34;
  id v35;
  _QWORD notifyBlock[4];
  id v37;
  id location;
  objc_super v39;
  uint8_t buf[4];
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {

LABEL_9:
    v8 = 0;
    goto LABEL_15;
  }
  v39.receiver = self;
  v39.super_class = (Class)AXMIDIManager;
  v8 = -[AXMIDIManager init](&v39, sel_init);
  if (!v8)
  {

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%@"), v10);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[AXMIDIManager setEventHandler:](v8, "setEventHandler:", v7);
  v12 = objc_alloc_init(AXMIDIParser);
  parser = v8->_parser;
  v8->_parser = v12;

  objc_storeStrong((id *)&v8->_clientIdentifier, v11);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = objc_claimAutoreleasedReturnValue();
  devices = v8->_devices;
  v8->_devices = (NSMutableSet *)v14;

  objc_initWeak(&location, v8);
  AXLogMIDI();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v11;
    _os_log_impl(&dword_18C62B000, v16, OS_LOG_TYPE_INFO, "Will create MIDI client with identifier: %@", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  notifyBlock[0] = MEMORY[0x1E0C809B0];
  notifyBlock[1] = 3221225472;
  notifyBlock[2] = __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke;
  notifyBlock[3] = &unk_1E24C8D78;
  objc_copyWeak(&v37, &location);
  v18 = MIDIClientCreateWithBlock(v11, &v8->_midiClientRef, notifyBlock);
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[AXMIDIManager clientIdentifier](v8, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Error creating MIDI client with identifier: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _AXMIDIHandleErrorOSStatus(v18, 1, v21);

  if (v22)
  {

    v8 = 0;
  }
  else
  {
    midiClientRef = v8->_midiClientRef;
    readBlock = v17;
    v32 = 3221225472;
    v33 = __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke_12;
    v34 = &unk_1E24C8DA0;
    objc_copyWeak(&v35, &location);
    v24 = MIDIInputPortCreateWithBlock(midiClientRef, CFSTR("Input"), &v8->_midiInputPortRef, &readBlock);
    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = objc_loadWeakRetained(&location);
    objc_msgSend(v26, "clientIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Error creating MIDI client input port with identifier: %@"), v27, readBlock, v32, v33, v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = _AXMIDIHandleErrorOSStatus(v24, 3, v28);

    if (v29)
    {

      v8 = 0;
    }
    else
    {
      -[AXMIDIManager _resetAndDetectDevices](v8, "_resetAndDetectDevices");
    }
    objc_destroyWeak(&v35);
  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

LABEL_15:
  return v8;
}

void __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke(uint64_t a1, unsigned int *a2)
{
  NSObject *v4;
  void *v5;
  NSObject *WeakRetained;
  NSObject *v7;
  unsigned int *v8;
  void *v9;
  NSObject *v10;
  unsigned int *v11;
  NSObject *v12;
  unsigned int *v13;
  NSObject *v14;
  unsigned int *v15;
  NSObject *v16;
  unsigned int *v17;
  NSObject *v18;
  unsigned int *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  AXLogMIDI();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v5;
    _os_log_impl(&dword_18C62B000, v4, OS_LOG_TYPE_INFO, "MIDI system change occurred. change type: %@", (uint8_t *)&v20, 0xCu);

  }
  switch(*a2)
  {
    case 1u:
      return;
    case 2u:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v7 = WeakRetained;
      if (a2[1] == 24)
        v8 = a2;
      else
        v8 = 0;
      -[NSObject _handleObjectAddedNotification:](WeakRetained, "_handleObjectAddedNotification:", v8);
      goto LABEL_30;
    case 3u:
      v10 = objc_loadWeakRetained((id *)(a1 + 32));
      v7 = v10;
      if (a2[1] == 24)
        v11 = a2;
      else
        v11 = 0;
      -[NSObject _handleObjectRemovedNotification:](v10, "_handleObjectRemovedNotification:", v11);
      goto LABEL_30;
    case 4u:
      v12 = objc_loadWeakRetained((id *)(a1 + 32));
      v7 = v12;
      if (a2[1] == 24)
        v13 = a2;
      else
        v13 = 0;
      -[NSObject _handlePropertyChangedNotification:](v12, "_handlePropertyChangedNotification:", v13);
      goto LABEL_30;
    case 5u:
      v14 = objc_loadWeakRetained((id *)(a1 + 32));
      v7 = v14;
      if (a2[1] == 24)
        v15 = a2;
      else
        v15 = 0;
      -[NSObject _handleThruConnectionsChangedNotification:](v14, "_handleThruConnectionsChangedNotification:", v15);
      goto LABEL_30;
    case 6u:
      v16 = objc_loadWeakRetained((id *)(a1 + 32));
      v7 = v16;
      if (a2[1] == 24)
        v17 = a2;
      else
        v17 = 0;
      -[NSObject _handleSerialPortOwnerChangedNotification:](v16, "_handleSerialPortOwnerChangedNotification:", v17);
      goto LABEL_30;
    case 7u:
      v18 = objc_loadWeakRetained((id *)(a1 + 32));
      v7 = v18;
      if (a2[1] == 16)
        v19 = a2;
      else
        v19 = 0;
      -[NSObject _handleIOErrorNotification:](v18, "_handleIOErrorNotification:", v19);
      goto LABEL_30;
    default:
      AXLogMIDI();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v9;
        _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_INFO, "Unhandled MIDI notification: %@", (uint8_t *)&v20, 0xCu);

      }
LABEL_30:

      return;
  }
}

void __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = a3;
    objc_msgSend(v6, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "parser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v9, "parse:error:", a2, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;

    if (v11)
    {
      AXMIDILogError(v11);
    }
    else
    {
      AXLogMIDI();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_18C62B000, v12, OS_LOG_TYPE_INFO, "Dispatching event: %@", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "eventHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(WeakRetained, "eventHandler");
        v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *, void *, id))v14)[2](v14, v10, v8, v7, v6);

      }
    }

  }
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  MIDIClientRef midiClientRef;
  OSStatus v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  AXLogMIDI();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[AXMIDIManager clientIdentifier](self, "clientIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "Will dispose of MIDI client with identifier: %@", buf, 0xCu);

  }
  midiClientRef = self->_midiClientRef;
  if (midiClientRef)
  {
    v6 = MIDIClientDispose(midiClientRef);
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[AXMIDIManager clientIdentifier](self, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Error disposing MIDI client with identifier: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _AXMIDIHandleErrorOSStatus(v6, 2, v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)AXMIDIManager;
  -[AXMIDIManager dealloc](&v10, sel_dealloc);
}

- (void)printAttachedDevices
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t i;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AXMIDIManager devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  AXLogMIDI();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "%@ attached devices", buf, 0xCu);

  }
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      AXLogMIDI();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_INFO, "Device %@ of %@:", buf, 0x16u);

      }
      AXLogMIDI();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_impl(&dword_18C62B000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }
  }

}

- (id)_nameForMidiObjectType:(int)a3
{
  if ((a3 + 1) > 0x14)
    return CFSTR("Unknown");
  else
    return off_1E24C8DC0[a3 + 1];
}

- (void)_handleObjectAddedNotification:(MIDIObjectAddRemoveNotification *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    AXLogMIDI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[AXMIDIManager _nameForMidiObjectType:](self, "_nameForMidiObjectType:", a3->childType);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "MIDI Notification: add object: %@", (uint8_t *)&v10, 0xCu);

    }
    switch(a3->childType)
    {
      case kMIDIObjectType_Device:
        v7 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", a3->child, 1);
        break;
      case kMIDIObjectType_Entity:
        -[AXMIDIManager _addMidiEntity:](self, "_addMidiEntity:", a3->child);
        break;
      case kMIDIObjectType_Source:
        -[AXMIDIManager _addMidiSource:](self, "_addMidiSource:", a3->child);
        break;
      case kMIDIObjectType_Destination:
        -[AXMIDIManager _addMidiDestination:](self, "_addMidiDestination:", a3->child);
        break;
      default:
        AXLogMIDI();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          -[AXMIDIManager _nameForMidiObjectType:](self, "_nameForMidiObjectType:", a3->childType);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138412290;
          v11 = v9;
          _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_INFO, "Unhandled Object added: %@", (uint8_t *)&v10, 0xCu);

        }
        break;
    }
  }
}

- (void)_handleObjectRemovedNotification:(MIDIObjectAddRemoveNotification *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    AXLogMIDI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[AXMIDIManager _nameForMidiObjectType:](self, "_nameForMidiObjectType:", a3->childType);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "MIDI Notification: Remove object: %@", (uint8_t *)&v9, 0xCu);

    }
    switch(a3->childType)
    {
      case kMIDIObjectType_Device:
        -[AXMIDIManager _removeMidiDevice:](self, "_removeMidiDevice:", a3->child);
        break;
      case kMIDIObjectType_Entity:
        -[AXMIDIManager _removeMidiEntity:](self, "_removeMidiEntity:", a3->child);
        break;
      case kMIDIObjectType_Source:
        -[AXMIDIManager _removeMidiSource:](self, "_removeMidiSource:", a3->child);
        break;
      case kMIDIObjectType_Destination:
        -[AXMIDIManager _removeMidiDestination:](self, "_removeMidiDestination:", a3->child);
        break;
      default:
        AXLogMIDI();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          -[AXMIDIManager _nameForMidiObjectType:](self, "_nameForMidiObjectType:", a3->childType);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 138412290;
          v10 = v8;
          _os_log_impl(&dword_18C62B000, v7, OS_LOG_TYPE_INFO, "Unhandled Object removed: %@", (uint8_t *)&v9, 0xCu);

        }
        break;
    }
  }
}

- (void)_handlePropertyChangedNotification:(MIDIObjectPropertyChangeNotification *)a3
{
  NSObject *v5;
  void *v6;
  CFStringRef propertyName;
  int v8;
  void *v9;
  __int16 v10;
  CFStringRef v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    AXLogMIDI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[AXMIDIManager _nameForMidiObjectType:](self, "_nameForMidiObjectType:", a3->objectType);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      propertyName = a3->propertyName;
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = propertyName;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "MIDI Notification: Property Changed: %@ - %@", (uint8_t *)&v8, 0x16u);

    }
  }
}

- (void)_handleThruConnectionsChangedNotification:(MIDIObjectPropertyChangeNotification *)a3
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogMIDI();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "MIDI Notification: Thru Connections Changed", v4, 2u);
  }

}

- (void)_handleSerialPortOwnerChangedNotification:(MIDIObjectPropertyChangeNotification *)a3
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogMIDI();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18C62B000, v3, OS_LOG_TYPE_INFO, "MIDI Notification: Serial Port Owner Changed", v4, 2u);
  }

}

- (void)_handleIOErrorNotification:(MIDIIOErrorNotification *)a3
{
  MIDIIOErrorNotification *v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = a3;
    -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", a3->driverDevice, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = v3->errorCode;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MIDI Notification: MIDI I/O error. Device: %@"), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _AXMIDIHandleErrorOSStatus((int)v3, 6, v4);

  }
}

- (void)_resetAndDetectDevices
{
  void *v3;
  ItemCount v4;
  ItemCount v5;
  ItemCount i;
  id v7;

  -[AXMIDIManager devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = MIDIGetNumberOfDevices();
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      v7 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", MIDIGetDevice(i), 1);
  }
}

- (void)_removeMidiDevice:(unsigned int)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", *(_QWORD *)&a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    AXLogMIDI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_INFO, "Removing device: %@", (uint8_t *)&v7, 0xCu);
    }

    -[AXMIDIManager devices](self, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v4);

  }
}

- (id)_deviceForMidiDevice:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  AXMIDIDevice *v13;
  void *v14;
  NSObject *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  AXMIDIDevice *v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AXMIDIManager devices](self, "devices", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "midiDevice") == (_DWORD)v5)
        {
          v16 = v12;

          return v16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (v4)
  {
    v13 = -[AXMIDIDevice initWithMIDIDevice:delegate:]([AXMIDIDevice alloc], "initWithMIDIDevice:delegate:", v5, self);
    -[AXMIDIManager devices](self, "devices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

    AXLogMIDI();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_INFO, "Did add device: %@", buf, 0xCu);
    }

    -[AXMIDIDevice resetAndDetectEntities](v13, "resetAndDetectEntities");
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)_addMidiEntity:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIDeviceForEntity(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", objc_msgSend(v5, "MIDIDevice"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addMidiEntity:", v3);

    v5 = v7;
  }

}

- (void)_removeMidiEntity:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIDeviceForEntity(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", objc_msgSend(v5, "MIDIDevice"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeMidiEntity:", v3);

    v5 = v7;
  }

}

- (void)_addMidiSource:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIDeviceForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", objc_msgSend(v5, "MIDIDevice"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addMidiSource:", v3);

    v5 = v7;
  }

}

- (void)_removeMidiSource:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIDeviceForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", objc_msgSend(v5, "MIDIDevice"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeMidiSource:", v3);

    v5 = v7;
  }

}

- (void)_addMidiDestination:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIDeviceForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", objc_msgSend(v5, "MIDIDevice"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addMidiDestination:", v3);

    v5 = v7;
  }

}

- (void)_removeMidiDestination:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  AXMIDIDeviceForEndpoint(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", objc_msgSend(v5, "MIDIDevice"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeMidiDestination:", v3);

    v5 = v7;
  }

}

- (void)device:(id)a3 entity:(id)a4 didAddSource:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = MIDIPortConnectSource(self->_midiInputPortRef, objc_msgSend(v6, "midiEndpoint"), v6);
  AXLogMIDI();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_INFO, "Did attempt to connect inputPort to source: %@. result: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not connect end point to input port"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _AXMIDIHandleErrorOSStatus(v7, 4, v10);

}

- (void)device:(id)a3 entity:(id)a4 didRemoveSource:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v7 = MIDIPortDisconnectSource(self->_midiInputPortRef, objc_msgSend(v6, "midiEndpoint"));
  AXLogMIDI();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_18C62B000, v8, OS_LOG_TYPE_INFO, "Did attempt to disconnect inputPort from source: %@. result: %@", (uint8_t *)&v10, 0x16u);

  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AXMIDIParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (unsigned)midiClientRef
{
  return self->_midiClientRef;
}

- (void)setMidiClientRef:(unsigned int)a3
{
  self->_midiClientRef = a3;
}

- (unsigned)midiInputPortRef
{
  return self->_midiInputPortRef;
}

- (void)setMidiInputPortRef:(unsigned int)a3
{
  self->_midiInputPortRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
