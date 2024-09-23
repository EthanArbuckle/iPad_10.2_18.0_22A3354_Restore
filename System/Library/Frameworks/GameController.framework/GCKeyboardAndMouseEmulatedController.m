@implementation GCKeyboardAndMouseEmulatedController

- (void)setEmulatedControllerMapping:(int)a3
{
  id v4;

  self->_emulatedControllerMapping = a3;
  defaultMapping(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GCKeyboardAndMouseEmulatedController remapControlsWith:](self, "remapControlsWith:", v4);

}

- (int64_t)eventInputForName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("DpadUp")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("DpadDown")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("DpadLeft")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("DpadRight")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("ButtonA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("ButtonB")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("ButtonX")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("ButtonY")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("LeftShoulder")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("RightShoulder")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("LeftThumbstickUp")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("LeftThumbstickDown")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("LeftThumbstickLeft")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("LeftThumbstickRight")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("RightThumbstickUp")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("RightThumbstickDown")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("RightThumbstickLeft")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("RightThumbstickRight")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("LeftTrigger")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("RightTrigger")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("LeftThumbstickButton")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("RightThumbstickButton")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("ButtonHome")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("ButtonMenu")) & 1) != 0)
  {
    v4 = 23;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("ButtonOptions")))
  {
    v4 = 24;
  }
  else
  {
    v4 = 47;
  }

  return v4;
}

- (id)nameForEventInput:(int64_t)a3
{
  if ((unint64_t)a3 > 0x18)
    return &stru_24D2B85A8;
  else
    return off_24D2B5CD0[a3];
}

- (id)elementForInput:(int64_t)a3
{
  void *v4;
  void *v5;

  -[GCController extendedGamepad](self, "extendedGamepad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remappedElementForIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)renameButtonForInput:(int64_t)a3 withKey:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[GCKeyboardAndMouseEmulatedController elementForInput:](self, "elementForInput:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setUnmappedLocalizedName:", v8);

}

- (float)findDeltaFor:(float)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  uint64_t i;
  void *v11;
  float v12;
  float v13;
  float v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_leftThumbstickSensitivity;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v8 <= a3)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "value", (_QWORD)v16);
          if (v12 >= a3)
          {
            objc_msgSend(v11, "delta");
            v9 = v13;
          }
        }
        objc_msgSend(v11, "value", (_QWORD)v16);
        v8 = v14;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (void)startLeftThumbstickTimer
{
  OS_dispatch_source *leftThumbstickTimer;
  uint64_t v4;
  OS_dispatch_source *v5;
  NSObject *timerQueue;
  OS_dispatch_source *v7;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  _QWORD v11[5];
  _QWORD block[4];
  OS_dispatch_source *v13;

  leftThumbstickTimer = self->_leftThumbstickTimer;
  v4 = MEMORY[0x24BDAC760];
  if (leftThumbstickTimer)
  {
    v5 = leftThumbstickTimer;
    timerQueue = self->_timerQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke;
    block[3] = &unk_24D2B2B20;
    v13 = v5;
    v7 = v5;
    dispatch_async(timerQueue, block);

  }
  v8 = self->_timerQueue;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke_2;
  v11[3] = &unk_24D2B2B20;
  v11[4] = self;
  createDispatchTimer(0x1FCA058uLL, 0x32DCD5uLL, v8, v11);
  v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  v10 = self->_leftThumbstickTimer;
  self->_leftThumbstickTimer = v9;

}

void __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  double v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  char v45;
  void *v46;
  double v47;
  int v48;
  void *v49;
  id v50;

  objc_msgSend(*(id *)(a1 + 32), "handlerQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v4 = (id)MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC9B8];
  }

  objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftThumbstick");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "xAxis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftThumbstick");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "yAxis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v15 = v14;

  *(float *)&v16 = fabsf(v10);
  objc_msgSend(*(id *)(a1 + 32), "findDeltaFor:", v16);
  v18 = v17;
  *(float *)&v19 = fabsf(v15);
  objc_msgSend(*(id *)(a1 + 32), "findDeltaFor:", v19);
  v21 = v20;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "left");
  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
  if (v23 <= 0.0)
  {
    objc_msgSend(v22, "right");
    if (v26 <= 0.0)
    {
      v28 = *(float *)(*(_QWORD *)(a1 + 32) + 268);
      v29 = fmaxf(v10 - v28, 0.0);
      v30 = v10 + v28;
      if (v30 > 0.0)
        v30 = 0.0;
      if (v10 < 0.0)
        v25 = v30;
      else
        v25 = v29;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "right");
      v25 = v10 + (float)(v18 * v27);
    }
  }
  else
  {
    objc_msgSend(v22, "left");
    v25 = v10 - (float)(v18 * v24);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "up");
  v31 = *(void **)(*(_QWORD *)(a1 + 32) + 320);
  if (v32 <= 0.0)
  {
    objc_msgSend(v31, "down");
    if (v35 <= 0.0)
    {
      v37 = *(float *)(*(_QWORD *)(a1 + 32) + 268);
      v38 = fmaxf(v15 - v37, 0.0);
      v39 = v15 + v37;
      if (v39 > 0.0)
        v39 = 0.0;
      if (v15 < 0.0)
        v34 = v39;
      else
        v34 = v38;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "down");
      v34 = v15 - (float)(v21 * v36);
    }
  }
  else
  {
    objc_msgSend(v31, "up");
    v34 = v15 + (float)(v21 * v33);
  }
  v40 = sqrt(v34 * v34 + v25 * v25);
  if (v40 > 1.0)
  {
    v25 = v25 / v40;
    v34 = v34 / v40;
  }
  objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leftThumbstick");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v4;
  objc_msgSend(v42, "xAxis");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v44 = v25;
  v45 = objc_msgSend(v43, "_setValue:queue:", v50, v44);

  objc_msgSend(v42, "yAxis");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v47 = v34;
  v48 = objc_msgSend(v46, "_setValue:queue:", v50, v47);

  if ((v45 & 1) != 0 || v48)
  {
    objc_msgSend(0, "addObject:", v42);

    v49 = *(void **)(a1 + 32);
    objc_msgSend(v49, "extendedGamepad");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leftThumbstick");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "notifyElementChangedOnQueue:queue:", v42, v50);
  }
  else
  {

  }
}

- (void)startMouseIdleTimer
{
  OS_dispatch_source *mouseIdleTimer;
  uint64_t v4;
  OS_dispatch_source *v5;
  NSObject *timerQueue;
  OS_dispatch_source *v7;
  float mouseReleaseTime;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  _QWORD v12[5];
  _QWORD block[4];
  OS_dispatch_source *v14;

  mouseIdleTimer = self->_mouseIdleTimer;
  v4 = MEMORY[0x24BDAC760];
  if (mouseIdleTimer)
  {
    v5 = mouseIdleTimer;
    timerQueue = self->_timerQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke;
    block[3] = &unk_24D2B2B20;
    v14 = v5;
    v7 = v5;
    dispatch_async(timerQueue, block);

  }
  atomic_store(0, (unsigned __int8 *)&self->_dirtyPointer);
  mouseReleaseTime = self->_mouseReleaseTime;
  v9 = self->_timerQueue;
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke_2;
  v12[3] = &unk_24D2B2B20;
  v12[4] = self;
  createDispatchTimer((unint64_t)(float)(mouseReleaseTime * 1000000000.0), (unint64_t)(float)((float)(mouseReleaseTime / 60.0) * 1000000000.0), v9, v12);
  v10 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  v11 = self->_mouseIdleTimer;
  self->_mouseIdleTimer = v10;

}

void __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke_2(uint64_t a1)
{
  unsigned __int8 v2;
  unsigned __int8 *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  char v12;
  void *v13;
  double v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 344));
  v3 = *(unsigned __int8 **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    atomic_store(0, v3 + 344);
  }
  else
  {
    objc_msgSend(v3, "handlerQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v6 = (id)MEMORY[0x24BDAC9B8];
      v7 = MEMORY[0x24BDAC9B8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 348));
    objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rightThumbstick");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
    objc_msgSend(v9, "xAxis");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    v12 = objc_msgSend(v10, "_setValue:queue:", v19, v11);

    objc_msgSend(v9, "yAxis");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0;
    v15 = objc_msgSend(v13, "_setValue:queue:", v19, v14);

    if ((v12 & 1) != 0 || v15)
    {
      objc_msgSend(0, "addObject:", v9);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 348));
      v16 = *(void **)(a1 + 32);
      objc_msgSend(v16, "extendedGamepad");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rightThumbstick");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "notifyElementChangedOnQueue:queue:", v18, v19);

    }
    else
    {

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 348));
    }

  }
}

- (void)setupButtons
{
  NSDictionary *v3;
  NSDictionary *buttons;

  -[NSDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", CFSTR("Buttons"));
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  buttons = self->_buttons;
  self->_buttons = v3;

  objc_opt_class();
  objc_opt_isKindOfClass();
}

- (void)setupConfig
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  id v14;

  -[NSDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", CFSTR("Config"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("mouseThumbstick"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_mouseThumbstick = objc_msgSend(v3, "BOOLValue");

    -[GCKeyboardAndMouseEmulatedController setMouseThumbstickEnabled:](self, "setMouseThumbstickEnabled:", self->_mouseThumbstick);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("mouseReleaseTime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    self->_mouseReleaseTime = v5;

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("mouseSensitivityLow"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    self->_mouseSensitivityLow = v7;

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("mouseSensitivityHigh"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    self->_mouseSensitivityHigh = v9;

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("keyboardFalloffTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    self->_keyboardFalloffValue = 0.033333 / v12;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("immediateLeftThumbstickMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_immediateLeftThumbstickMode = objc_msgSend(v13, "BOOLValue");

  }
}

- (void)setupLeftThumbstickSensitivity
{
  void *v3;
  double v4;
  double v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v20;
  double v21;
  double v22;
  void *v23;
  void *leftThumbstickSensitivity;
  double v25;
  double v26;
  void *v27;
  NSArray *v28;
  NSArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", CFSTR("LeftThumbstickSensitivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      v11 = 0.0;
      v12 = 0.0;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
          if (v14)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "objectAtIndexedSubscript:", 0, (_QWORD)v30);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "floatValue");
            v17 = v16;

            objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "floatValue");
            v20 = v19;

            *(float *)&v21 = (float)((float)(v17 - v12) / (float)(v20 - v11)) * 0.033333;
            *(float *)&v22 = v17;
            +[LinearPiece pieceWithValue:delta:](LinearPiece, "pieceWithValue:delta:", v22, v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v6, "addObject:", v23);

            v11 = v20;
            v12 = v17;
          }
          ++v13;
        }
        while (v9 != v13);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v9);
    }

    leftThumbstickSensitivity = self->_leftThumbstickSensitivity;
    self->_leftThumbstickSensitivity = v6;
  }
  else
  {
    LODWORD(v4) = 1045220557;
    LODWORD(v5) = 1045220557;
    +[LinearPiece pieceWithValue:delta:](LinearPiece, "pieceWithValue:delta:", v4, v5);
    leftThumbstickSensitivity = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1050253722;
    LODWORD(v26) = 1.0;
    +[LinearPiece pieceWithValue:delta:](LinearPiece, "pieceWithValue:delta:", v26, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = leftThumbstickSensitivity;
    v35[1] = v27;
    +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v35, 2);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v29 = self->_leftThumbstickSensitivity;
    self->_leftThumbstickSensitivity = v28;

  }
}

- (void)startKeyboardEventsListening
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__GCKeyboardAndMouseEmulatedController_startKeyboardEventsListening__block_invoke;
  v4[3] = &unk_24D2B5C40;
  v4[4] = self;
  +[GCKeyboard coalescedKeyboard](GCKeyboard, "coalescedKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyChangedHandlerPrivate:", v4);

}

_DWORD *__68__GCKeyboardAndMouseEmulatedController_startKeyboardEventsListening__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _DWORD *result;

  result = *(_DWORD **)(a1 + 32);
  if (result[89])
    return (_DWORD *)objc_msgSend(result, "updateWithKeyKey:down:", a4, a5);
  return result;
}

- (void)remapControlsWith:(id)a3
{
  LeftThumbstickState *v5;
  LeftThumbstickState *leftThumbstickState;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *timerQueue;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_mapping, a3);
  -[GCKeyboardAndMouseEmulatedController setupButtons](self, "setupButtons");
  -[GCKeyboardAndMouseEmulatedController setupConfig](self, "setupConfig");
  -[GCKeyboardAndMouseEmulatedController setupLeftThumbstickSensitivity](self, "setupLeftThumbstickSensitivity");
  v5 = (LeftThumbstickState *)objc_opt_new();
  leftThumbstickState = self->_leftThumbstickState;
  self->_leftThumbstickState = v5;

  v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamecontroller.emulatedController.timerQueue", 0);
  timerQueue = self->_timerQueue;
  self->_timerQueue = v7;

  if (!self->_immediateLeftThumbstickMode)
    -[GCKeyboardAndMouseEmulatedController startLeftThumbstickTimer](self, "startLeftThumbstickTimer");
  -[GCKeyboardAndMouseEmulatedController startMouseIdleTimer](self, "startMouseIdleTimer");

}

- (id)readButtonsInfoFromLocalFiles
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  +[GCKeyboard coalescedKeyboard](GCKeyboard, "coalescedKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GetProperty(CFSTR("Buttons"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = (void *)v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = objc_msgSend(&unk_24D30FAE8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v21)
    {
      v18 = *(_QWORD *)v30;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(&unk_24D30FAE8);
          v23 = v6;
          v7 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v6), "intValue");
          -[GCKeyboardAndMouseEmulatedController nameForEventInput:](self, "nameForEventInput:", v7);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "allKeysForObject:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v26;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v26 != v11)
                  objc_enumerationMutation(v8);
                if (*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12))
                {
                  objc_msgSend(v3, "objectForKeyedSubscript:");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v13)
                  {
                    +[NSNumber numberWithInteger:](&off_254DED908, "numberWithInteger:", v7);
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", objc_msgSend(v13, "keyCode"));
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "setObject:forKey:", v14, v15);

                  }
                }
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v10);
          }

          v6 = v23 + 1;
        }
        while (v23 + 1 != v21);
        v21 = objc_msgSend(&unk_24D30FAE8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v21);
    }
    v4 = v24;
    v16 = v24;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)readConfigFromLocalFiles
{
  void *v2;
  id v3;

  GetProperty(CFSTR("Config"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)readLeftThumbstickSensitivityFromLocalFiles
{
  void *v2;
  id v3;

  GetProperty(CFSTR("LeftThumbstickSensitivity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)tryReadPropertiesFromLocalFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCKeyboardAndMouseEmulatedController readButtonsInfoFromLocalFiles](self, "readButtonsInfoFromLocalFiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Buttons"));
  -[GCKeyboardAndMouseEmulatedController readConfigFromLocalFiles](self, "readConfigFromLocalFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Config"));
  -[GCKeyboardAndMouseEmulatedController readLeftThumbstickSensitivityFromLocalFiles](self, "readLeftThumbstickSensitivityFromLocalFiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("LeftThumbstickSensitivity"));

  return v3;
}

- (void)setPointerHidden:(BOOL)a3
{
  if (self->_pointerHidden != a3)
    self->_pointerHidden = a3;
}

- (void)setMouseThumbstickEnabled:(BOOL)a3
{
  if (self->_mouseThumbstickEnabled != a3)
    self->_mouseThumbstickEnabled = a3;
}

- (void)windowDidBecomeKey:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[GCKeyboardAndMouseEmulatedController windowDidBecomeKey:].cold.1(v4);

  }
  -[GCKeyboardAndMouseEmulatedController setMouseThumbstickEnabled:](self, "setMouseThumbstickEnabled:", self->_mouseThumbstick);
  self->_mainWindowIsKey = 1;

}

- (void)windowDidResignKey:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[GCKeyboardAndMouseEmulatedController windowDidResignKey:].cold.1(v4);

  }
  -[GCKeyboardAndMouseEmulatedController setMouseThumbstickEnabled:](self, "setMouseThumbstickEnabled:", 0);
  -[GCKeyboardAndMouseEmulatedController setPointerHidden:](self, "setPointerHidden:", 0);
  self->_mainWindowIsKey = 0;

}

- (void)windowDidEnterFullScreen:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[GCKeyboardAndMouseEmulatedController windowDidEnterFullScreen:].cold.1(v4);

  }
  if (self->_mouseThumbstickEnabled)
    -[GCKeyboardAndMouseEmulatedController setPointerHidden:](self, "setPointerHidden:", 1);

}

- (void)windowDidExitFullScreen:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[GCKeyboardAndMouseEmulatedController windowDidExitFullScreen:].cold.1(v4);

  }
  -[GCKeyboardAndMouseEmulatedController setPointerHidden:](self, "setPointerHidden:", 0);

}

- (void)setMouseSensitivity:(unint64_t)a3
{
  unint64_t v3;
  float v4;
  float *p_mouseSensitivityHigh;
  NSObject *v6;

  if (a3)
  {
    v3 = 17;
    if (a3 < 0x11)
      v3 = a3;
    v4 = (float)((float)v3 + -1.0) * 0.0625;
  }
  else
  {
    v4 = 0.5;
  }
  p_mouseSensitivityHigh = &self->_mouseSensitivityHigh;
  self->_mouseSensitivityHigh = (float)(v4 * 0.003) + 0.001;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[GCKeyboardAndMouseEmulatedController setMouseSensitivity:].cold.1(p_mouseSensitivityHigh, v6);

  }
}

- (id)initEmulatedControllerWithMapping:(int)a3
{
  GCExtendedGamepad *v5;
  GCKeyboardAndMouseEmulatedController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = -[GCExtendedGamepad initWithController:]([GCExtendedGamepad alloc], "initWithController:", self);
  v14.receiver = self;
  v14.super_class = (Class)GCKeyboardAndMouseEmulatedController;
  v6 = -[GCController initWithProfile:](&v14, sel_initWithProfile_, v5);
  if (v6)
  {
    defaultMapping(1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSMutableDictionary dictionaryWithDictionary:](&off_254DEBD30, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GCKeyboardAndMouseEmulatedController tryReadPropertiesFromLocalFiles](v6, "tryReadPropertiesFromLocalFiles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
    v6->_emulatedControllerMapping = a3;
    defaultMapping(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCKeyboardAndMouseEmulatedController remapControlsWith:](v6, "remapControlsWith:", v10);

    +[NSUserDefaults standardUserDefaults](&off_254DEF040, "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("GCDefaultMouseSensitivity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCKeyboardAndMouseEmulatedController setMouseSensitivity:](v6, "setMouseSensitivity:", (int)objc_msgSend(v12, "intValue"));

    -[GCKeyboardAndMouseEmulatedController startKeyboardEventsListening](v6, "startKeyboardEventsListening");
  }

  return v6;
}

- (void)addDevice:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, float, float);
  void *v13;
  GCKeyboardAndMouseEmulatedController *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = MEMORY[0x24BDAC760];
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke;
    v13 = &unk_24D2B5C68;
    v14 = self;
    v6 = v4;
    objc_msgSend(v6, "mouseInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMouseMovedHandlerPrivate:", &v10);

    objc_msgSend(v6, "mouseInput", v5, 3221225472, __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke_2, &unk_24D2B5C90, self, v10, v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setMouseButtonPressedPrivate:", &v9);
  }

}

void __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke(uint64_t a1, float a2, float a3)
{
  _BYTE *v4;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  char v31;
  void *v32;
  double v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v4 = *(_BYTE **)(a1 + 32);
  if (v4[260] && v4[352] && v4[297])
  {
    objc_msgSend(v4, "handlerQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v9 = (id)MEMORY[0x24BDAC9B8];
      v10 = MEMORY[0x24BDAC9B8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 348));
    objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rightThumbstick");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "xAxis");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v15 = v14;

    objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rightThumbstick");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "yAxis");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v20 = v19;

    v21 = clamp(sqrtf((float)(v20 * v20) + (float)(v15 * v15)), 0.0, 1.0);
    v22 = *(float **)(a1 + 32);
    v23 = v22[63] + (float)((float)(v22[64] - v22[63]) * v21);
    v24 = v15 + (float)(a2 * v23);
    v25 = v20 + (float)(a3 * v23);
    v26 = sqrt(v25 * v25 + v24 * v24);
    if (v26 > 1.0)
    {
      v24 = v24 / v26;
      v25 = v25 / v26;
    }
    objc_msgSend(v22, "extendedGamepad");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rightThumbstick");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v9;
    objc_msgSend(v28, "xAxis");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v30 = v24;
    v31 = objc_msgSend(v29, "_setValue:queue:", v38, v30);

    objc_msgSend(v28, "yAxis");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v33 = v25;
    v34 = objc_msgSend(v32, "_setValue:queue:", v38, v33);

    if ((v31 & 1) != 0 || v34)
    {
      objc_msgSend(0, "addObject:", v28);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 348));
      atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 344));
      v35 = *(void **)(a1 + 32);
      objc_msgSend(v35, "extendedGamepad");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "rightThumbstick");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "notifyElementChangedOnQueue:queue:", v37, v38);

    }
    else
    {

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 348));
    }

  }
}

void __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  _BYTE *v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(_BYTE **)(a1 + 32);
  if (v4[260] && v4[352] && v4[297])
  {
    objc_msgSend(v4, "handlerQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v15 = v6;
    }
    else
    {
      v15 = (id)MEMORY[0x24BDAC9B8];
      v8 = MEMORY[0x24BDAC9B8];
    }

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "extendedGamepad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightTrigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notifyButtonIfNeeded:pressed:onQueue:", v11, a3 & 1, v15);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "extendedGamepad");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leftTrigger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyButtonIfNeeded:pressed:onQueue:", v14, (a3 >> 1) & 1, v15);

  }
  else
  {
    v4[354] = 0;
  }
}

- (void)removeDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v6;
    objc_msgSend(v3, "mouseInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMouseMovedHandlerPrivate:", 0);

    objc_msgSend(v3, "mouseInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setMouseButtonPressedPrivate:", 0);
  }

}

- (id)vendorName
{
  return CFSTR("Apple");
}

- (id)productCategory
{
  return CFSTR("EmulatedController");
}

- (id)identifier
{
  return CFSTR("EmulatedController");
}

- (void)notifyButtonIfNeeded:(id)a3 pressed:(BOOL)a4 onQueue:(id)a5
{
  _BOOL4 v6;
  id v8;
  double v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  *(float *)&v9 = (float)v6;
  if (objc_msgSend(v10, "_setValue:queue:", v8, v9))
  {
    objc_msgSend(0, "addObject:", v10);
    -[GCKeyboardAndMouseEmulatedController notifyElementChangedOnQueue:queue:](self, "notifyElementChangedOnQueue:queue:", v10, v8);
  }

}

- (void)notifyElementChangedOnQueue:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__GCKeyboardAndMouseEmulatedController_notifyElementChangedOnQueue_queue___block_invoke;
  v8[3] = &unk_24D2B2B48;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a4, v8);

}

void __74__GCKeyboardAndMouseEmulatedController_notifyElementChangedOnQueue_queue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  NSObject *v7;

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __74__GCKeyboardAndMouseEmulatedController_notifyElementChangedOnQueue_queue___block_invoke_cold_1(a1, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueChangedHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "extendedGamepad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v6, *(_QWORD *)(a1 + 40));

  }
}

- (void)updateWithKeyKey:(int64_t)a3 down:(BOOL)a4
{
  float v4;
  _BOOL4 v5;
  void *v8;
  void *v9;
  id v10;
  BOOL v12;
  NSDictionary *buttons;
  void *v14;
  void *v15;
  int v16;
  double v17;
  void *v19;
  void *v20;
  double v21;
  id v22;

  if (a4)
    v4 = 1.0;
  else
    v4 = 0.0;
  if (self->_mainWindowIsKey)
  {
    v5 = a4;
    -[GCController handlerQueue](self, "handlerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v22 = v8;
    }
    else
    {
      v22 = (id)MEMORY[0x24BDAC9B8];
      v10 = MEMORY[0x24BDAC9B8];
    }

    v12 = self->_mouseThumbstick && v5 && a3 == 41;
    if (v12 && -[GCKeyboardAndMouseEmulatedController pointerHidden](self, "pointerHidden"))
      -[GCKeyboardAndMouseEmulatedController setPointerHidden:](self, "setPointerHidden:", 0);
    buttons = self->_buttons;
    +[NSNumber numberWithLong:](&off_254DED908, "numberWithLong:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](buttons, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(v15, "intValue");
      if (!self->_immediateLeftThumbstickMode && v16 == 10)
      {
        *(float *)&v17 = v4;
        -[LeftThumbstickState setUp:](self->_leftThumbstickState, "setUp:", v17);
      }
      else if (self->_immediateLeftThumbstickMode || v16 != 12)
      {
        if (self->_immediateLeftThumbstickMode || v16 != 11)
        {
          if (self->_immediateLeftThumbstickMode || v16 != 13)
          {
            -[GCKeyboardAndMouseEmulatedController elementForInput:](self, "elementForInput:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v20;
            if (v20)
            {
              *(float *)&v21 = v4;
              if (objc_msgSend(v20, "_setPendingValueIfChanged:", v21))
              {
                objc_msgSend(v19, "_commitPendingValueOnQueue:", v22);
                -[GCKeyboardAndMouseEmulatedController notifyElementChangedOnQueue:queue:](self, "notifyElementChangedOnQueue:queue:", v19, v22);
              }
            }
            goto LABEL_35;
          }
          *(float *)&v17 = v4;
          -[LeftThumbstickState setRight:](self->_leftThumbstickState, "setRight:", v17);
        }
        else
        {
          *(float *)&v17 = v4;
          -[LeftThumbstickState setDown:](self->_leftThumbstickState, "setDown:", v17);
        }
      }
      else
      {
        *(float *)&v17 = v4;
        -[LeftThumbstickState setLeft:](self->_leftThumbstickState, "setLeft:", v17);
      }
    }
    v19 = 0;
LABEL_35:

  }
}

- (int)emulatedControllerMapping
{
  return self->_emulatedControllerMapping;
}

- (BOOL)mouseThumbstickEnabled
{
  return self->_mouseThumbstickEnabled;
}

- (unint64_t)mouseSensitivity
{
  return self->_mouseSensitivity;
}

- (BOOL)pointerHidden
{
  return self->_pointerHidden;
}

- (BOOL)captureAwaitingMouseUp
{
  return self->_captureAwaitingMouseUp;
}

- (void)setCaptureAwaitingMouseUp:(BOOL)a3
{
  self->_captureAwaitingMouseUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mouseIdleTimer, 0);
  objc_storeStrong((id *)&self->_leftThumbstickTimer, 0);
  objc_storeStrong((id *)&self->_leftThumbstickState, 0);
  objc_storeStrong((id *)&self->_leftThumbstickSensitivity, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

- (void)windowDidBecomeKey:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_0_27(&dword_215181000, v2, v3, "windowDidBecomeKey %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_25();
}

- (void)windowDidResignKey:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_0_27(&dword_215181000, v2, v3, "windowDidResignKey %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_25();
}

- (void)windowDidEnterFullScreen:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_0_27(&dword_215181000, v2, v3, "windowDidEnterFullScreen %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_25();
}

- (void)windowDidExitFullScreen:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_23();
  OUTLINED_FUNCTION_0_27(&dword_215181000, v2, v3, "windowDidExitFullScreen %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_25();
}

- (double)setMouseSensitivity:(float *)a1 .cold.1(float *a1, NSObject *a2)
{
  double v2;
  double result;
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v4 = 134217984;
  v5 = v2;
  _os_log_debug_impl(&dword_215181000, a2, OS_LOG_TYPE_DEBUG, "mouseSensitivity: %02.5f", (uint8_t *)&v4, 0xCu);
  return result;
}

void __74__GCKeyboardAndMouseEmulatedController_notifyElementChangedOnQueue_queue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "debugName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_23();
  v6 = 2112;
  v7 = v4;
  _os_log_debug_impl(&dword_215181000, a2, OS_LOG_TYPE_DEBUG, "%@ changed: %@", v5, 0x16u);

}

@end
