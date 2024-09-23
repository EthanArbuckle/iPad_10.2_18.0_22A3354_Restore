@implementation GCGamepad

- (id)productCategory
{
  return CFSTR("MFi");
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  void *v4;
  int Type;
  uint64_t IntegerValue;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  GCControllerDirectionPad *v32;
  NSObject *v33;
  id v34;
  void *v35;
  double v36;
  char v37;
  void *v38;
  double v39;
  int v40;
  float v41;
  GCControllerButtonInput *v42;
  id v43;
  double v44;
  float v45;
  GCControllerButtonInput *v46;
  id v47;
  double v48;
  float v49;
  GCControllerButtonInput *v50;
  id v51;
  double v52;
  float v53;
  GCControllerButtonInput *v54;
  id v55;
  double v56;
  float v57;
  GCControllerButtonInput *v58;
  id v59;
  double v60;
  GCControllerButtonInput *v61;
  id v62;
  double v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  uint64_t v70;
  double v71;
  double v72;
  _QWORD v73[6];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD block[5];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  +[NSDate date](&off_254DF6DA0, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  -[GCPhysicalInputProfile setLastEventTimestamp:](self, "setLastEventTimestamp:");

  Type = IOHIDEventGetType();
  if (Type == 35)
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCPhysicalInputProfile controller](self, "controller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handlerQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    IOHIDEventGetFloatValue();
    v15 = v14;
    IOHIDEventGetFloatValue();
    v17 = v16;
    IOHIDEventGetFloatValue();
    v19 = v18;
    IOHIDEventGetFloatValue();
    v21 = v20;
    IOHIDEventGetFloatValue();
    v23 = v22;
    IOHIDEventGetFloatValue();
    v25 = v24;
    IOHIDEventGetFloatValue();
    v27 = v26;
    IOHIDEventGetFloatValue();
    v29 = v28;
    IOHIDEventGetFloatValue();
    v71 = v30;
    IOHIDEventGetFloatValue();
    v72 = v31;
    v32 = self->_dpad;
    v33 = v13;
    v34 = v11;
    -[GCControllerDirectionPad xAxis](v32, "xAxis");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v36 = v21 - v19;
    v37 = objc_msgSend(v35, "_setValue:queue:", v33, v36);

    -[GCControllerDirectionPad yAxis](v32, "yAxis");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v39 = v15 - v17;
    v40 = objc_msgSend(v38, "_setValue:queue:", v33, v39);

    if ((v37 & 1) != 0 || v40)
      objc_msgSend(v34, "addObject:", v32, *(_QWORD *)&v71);
    v41 = v25;

    v42 = self->_button0;
    v43 = v34;
    *(float *)&v44 = v23;
    if (-[GCControllerButtonInput _setValue:queue:](v42, "_setValue:queue:", v33, v44))
      objc_msgSend(v43, "addObject:", v42);

    v46 = self->_button1;
    v47 = v43;
    *(float *)&v48 = v41;
    if (-[GCControllerButtonInput _setValue:queue:](v46, "_setValue:queue:", v33, v48))
      objc_msgSend(v47, "addObject:", v46);
    v49 = v29;

    v50 = self->_button2;
    v51 = v47;
    v45 = v27;
    *(float *)&v52 = v45;
    if (-[GCControllerButtonInput _setValue:queue:](v50, "_setValue:queue:", v33, v52))
      objc_msgSend(v51, "addObject:", v50);

    v54 = self->_button3;
    v55 = v51;
    *(float *)&v56 = v49;
    if (-[GCControllerButtonInput _setValue:queue:](v54, "_setValue:queue:", v33, v56))
      objc_msgSend(v55, "addObject:", v54);

    v58 = self->_leftShoulder;
    v59 = v55;
    v53 = v71;
    *(float *)&v60 = v53;
    if (-[GCControllerButtonInput _setValue:queue:](v58, "_setValue:queue:", v33, v60))
      objc_msgSend(v59, "addObject:", v58);

    v61 = self->_rightShoulder;
    v62 = v59;
    v57 = v72;
    *(float *)&v63 = v57;
    if (-[GCControllerButtonInput _setValue:queue:](v61, "_setValue:queue:", v33, v63))
      objc_msgSend(v62, "addObject:", v61);

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v64 = v62;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v75;
      v68 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v75 != v67)
            objc_enumerationMutation(v64);
          v70 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
          v73[0] = v68;
          v73[1] = 3221225472;
          v73[2] = __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke_65;
          v73[3] = &unk_24D2B2B48;
          v73[4] = self;
          v73[5] = v70;
          dispatch_async(v33, v73);
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      }
      while (v66);
    }

  }
  else if (Type == 3)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v7 = IOHIDEventGetIntegerValue();
    v8 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 12 && v7 == 547 && v8 == 1)
    {
      -[GCPhysicalInputProfile controller](self, "controller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handlerQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke;
      block[3] = &unk_24D2B2B20;
      block[4] = self;
      dispatch_async(v10, block);

    }
  }
}

void __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "%@ pause event", (uint8_t *)&v10, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__deprecated_controllerPausedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__deprecated_controllerPausedHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
}

void __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke_65(uint64_t a1)
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
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_QWORD)_initWithIdentifier:(int)a3 createDefaultElements:
{
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __CFString *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __CFString *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __CFString *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __CFString *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __CFString *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __CFString *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[64];
  uint64_t v60;
  objc_super v61;

  if (!a1)
    return 0;
  v61.receiver = a1;
  v61.super_class = (Class)GCGamepad;
  v4 = objc_msgSendSuper2(&v61, sel_initWithIdentifier_, a2);
  v5 = v4;
  if (v4)
    v6 = a3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    memset(v59, 0, sizeof(v59));
    v60 = 0;
    v59[8] = 1;
    objc_msgSend(v4, "_directionPadWithInfo:", v59);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v5[83];
    v5[83] = v7;

    v58 = 0u;
    v57 = 0u;
    v56 = 0u;
    v55 = 0u;
    v54 = CFSTR("Button A");
    LOBYTE(v55) = 1;
    DWORD2(v55) = 4;
    objc_msgSend(v5, "_buttonWithInfo:", &v54);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v5[84];
    v5[84] = v9;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = CFSTR("Button B");
    LOBYTE(v50) = 1;
    DWORD2(v50) = 5;
    objc_msgSend(v5, "_buttonWithInfo:", &v49);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v5[85];
    v5[85] = v11;

    v48 = 0u;
    v47 = 0u;
    v46 = 0u;
    v45 = 0u;
    v44 = CFSTR("Button X");
    LOBYTE(v45) = 1;
    DWORD2(v45) = 6;
    objc_msgSend(v5, "_buttonWithInfo:", &v44);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v5[86];
    v5[86] = v13;

    v43 = 0u;
    v42 = 0u;
    v41 = 0u;
    v40 = 0u;
    v39 = CFSTR("Button Y");
    LOBYTE(v40) = 1;
    DWORD2(v40) = 7;
    objc_msgSend(v5, "_buttonWithInfo:", &v39);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v5[87];
    v5[87] = v15;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = CFSTR("Left Shoulder");
    LOBYTE(v35) = 1;
    DWORD2(v35) = 8;
    objc_msgSend(v5, "_buttonWithInfo:", &v34);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v5[88];
    v5[88] = v17;

    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = CFSTR("Right Shoulder");
    LOBYTE(v30) = 1;
    DWORD2(v30) = 9;
    objc_msgSend(v5, "_buttonWithInfo:", &v29);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v5[89];
    v5[89] = v19;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = CFSTR("Button Menu");
    LOBYTE(v25) = 1;
    DWORD2(v25) = 23;
    objc_msgSend(v5, "_buttonWithInfo:", &v24);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v5[90];
    v5[90] = v21;

  }
  return v5;
}

- (GCGamepad)initWithIdentifier:(id)a3
{
  return (GCGamepad *)-[GCGamepad _initWithIdentifier:createDefaultElements:](self, (uint64_t)a3, 1);
}

- (GCGamepad)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GCGamepad *v7;

  v4 = a3;
  GCIPCObjectIdentifier_Classes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GCGamepad initWithIdentifier:](self, "initWithIdentifier:", v6);
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

- (GCControllerDirectionPad)dpad
{
  GCControllerDirectionPad *dpad;
  GCControllerDirectionPad *v3;
  void *v4;

  dpad = self->_dpad;
  if (dpad)
  {
    v3 = dpad;
  }
  else
  {
    -[GCPhysicalInputProfile dpads](self, "dpads");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Direction Pad"));
    v3 = (GCControllerDirectionPad *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (GCControllerButtonInput)buttonA
{
  GCControllerButtonInput *button0;
  GCControllerButtonInput *v3;
  void *v4;

  button0 = self->_button0;
  if (button0)
  {
    v3 = button0;
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Button A"));
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (GCControllerButtonInput)buttonB
{
  GCControllerButtonInput *button1;
  GCControllerButtonInput *v3;
  void *v4;

  button1 = self->_button1;
  if (button1)
  {
    v3 = button1;
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Button A"));
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (GCControllerButtonInput)buttonX
{
  GCControllerButtonInput *button2;
  GCControllerButtonInput *v3;
  void *v4;

  button2 = self->_button2;
  if (button2)
  {
    v3 = button2;
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Button A"));
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (GCControllerButtonInput)buttonY
{
  GCControllerButtonInput *button3;
  GCControllerButtonInput *v3;
  void *v4;

  button3 = self->_button3;
  if (button3)
  {
    v3 = button3;
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Button A"));
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (GCControllerButtonInput)leftShoulder
{
  GCControllerButtonInput *leftShoulder;
  GCControllerButtonInput *v3;
  void *v4;

  leftShoulder = self->_leftShoulder;
  if (leftShoulder)
  {
    v3 = leftShoulder;
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Left Shoulder"));
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (GCControllerButtonInput)rightShoulder
{
  GCControllerButtonInput *rightShoulder;
  GCControllerButtonInput *v3;
  void *v4;

  rightShoulder = self->_rightShoulder;
  if (rightShoulder)
  {
    v3 = rightShoulder;
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Right Shoulder"));
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (GCControllerButtonInput)buttonMenu
{
  GCControllerButtonInput *buttonMenu;
  GCControllerButtonInput *v3;
  void *v4;

  buttonMenu = self->_buttonMenu;
  if (buttonMenu)
  {
    v3 = buttonMenu;
  }
  else
  {
    -[GCPhysicalInputProfile buttons](self, "buttons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Button Menu"));
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)name
{
  return CFSTR("Gamepad");
}

- (GCGamepadSnapshot)saveSnapshot
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
  float v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  GCGamepadSnapshot *v22;
  void *v23;
  GCGamepadSnapshot *v24;
  GCGamepadSnapShotDataV100 snapshotData;

  *(_DWORD *)&snapshotData.version = 2359552;
  -[GCGamepad dpad](self, "dpad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xAxis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  snapshotData.dpadX = v5;

  -[GCGamepad dpad](self, "dpad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "yAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  snapshotData.dpadY = v8;

  -[GCGamepad buttonA](self, "buttonA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  snapshotData.buttonA = v10;

  -[GCGamepad buttonB](self, "buttonB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  snapshotData.buttonB = v12;

  -[GCGamepad buttonX](self, "buttonX");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  snapshotData.buttonX = v14;

  -[GCGamepad buttonY](self, "buttonY");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "value");
  snapshotData.buttonY = v16;

  -[GCGamepad leftShoulder](self, "leftShoulder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  snapshotData.leftShoulder = v18;

  -[GCGamepad rightShoulder](self, "rightShoulder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "value");
  snapshotData.rightShoulder = v20;

  NSDataFromGCGamepadSnapShotDataV100(&snapshotData);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [GCGamepadSnapshot alloc];
  -[GCPhysicalInputProfile controller](self, "controller");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[GCGamepadSnapshot initWithController:snapshotData:](v22, "initWithController:snapshotData:", v23, v21);

  return v24;
}

- (BOOL)reportsAbsoluteDpadValues
{
  return 1;
}

- (BOOL)allowsRotation
{
  return 0;
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
  GCGamepad *v14;
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
  block[2] = __57__GCGamepad__triggerValueChangedHandlerForElement_queue___block_invoke;
  block[3] = &unk_24D2B6728;
  v13 = v6;
  v14 = self;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __57__GCGamepad__triggerValueChangedHandlerForElement_queue___block_invoke(uint64_t a1)
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
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v3 = v5;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);
    v3 = v5;
  }

}

- (void)_triggerValueChangedHandlerForElements:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  GCGamepad *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[GCGamepad valueChangedHandler](self, "valueChangedHandler");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x2199DEBB0](self->_valueChangedHandler);
  if (v8 | v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__GCGamepad__triggerValueChangedHandlerForElements_queue___block_invoke;
    v10[3] = &unk_24D2B6750;
    v13 = (id)v8;
    v11 = v6;
    v12 = self;
    v14 = (id)v9;
    dispatch_async(v7, v10);

  }
}

void __58__GCGamepad__triggerValueChangedHandlerForElements_queue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v17;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v2);
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v4);
    }

  }
  if (*(_QWORD *)(a1 + 56))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v9);
    }

  }
}

- (GCGamepadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCGamepadValueChangedHandler)valueChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, valueChangedHandler, 656);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMenu, 0);
  objc_storeStrong((id *)&self->_rightShoulder, 0);
  objc_storeStrong((id *)&self->_leftShoulder, 0);
  objc_storeStrong((id *)&self->_button3, 0);
  objc_storeStrong((id *)&self->_button2, 0);
  objc_storeStrong((id *)&self->_button1, 0);
  objc_storeStrong((id *)&self->_button0, 0);
  objc_storeStrong((id *)&self->_dpad, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end
