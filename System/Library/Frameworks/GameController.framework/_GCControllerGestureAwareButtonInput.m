@implementation _GCControllerGestureAwareButtonInput

- (_GCControllerGestureAwareButtonInput)initWithDescriptionName:(id)a3
{
  _GCControllerGestureAwareButtonInput *v3;
  uint64_t v4;
  NSMutableArray *doublePressEventQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_GCControllerGestureAwareButtonInput;
  v3 = -[GCControllerButtonInput initWithDescriptionName:](&v7, sel_initWithDescriptionName_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    doublePressEventQueue = v3->_doublePressEventQueue;
    v3->_doublePressEventQueue = (NSMutableArray *)v4;

    v3->_longPressInterval = 0.5;
    v3->_singlePressInterval = 0.5;
    v3->_doublePressInterval = 0.5;
    v3->_longPressMuted = 0;
    v3->_doublePressMuted = 0;
    v3->_singlePressMuted = 0;
    v3->_enabled = 1;
    v3->_requiredDoublePressCount = 2;
  }
  return v3;
}

- (void)setActualSystemGestureState:(int64_t)a3
{
  self->_actualSystemGestureState = a3;
  self->_useActualSystemGestureState = 1;
}

- (BOOL)isSinglePressGestureRecognizerEnabled
{
  return !self->_singlePressMuted && self->_singlePressHandler != 0;
}

- (BOOL)isDoublePressGestureRecognizerEnabled
{
  return !self->_doublePressMuted && self->_doublePressHandler != 0;
}

- (BOOL)isLongPressGestureRecognizerEnabled
{
  return !self->_longPressMuted && self->_longPressHandler != 0;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
    self->_enabled = a3;
}

- (void)setInputDisabledBySystem:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_inputDisabledBySystem != a3)
  {
    v3 = a3;
    self->_inputDisabledBySystem = a3;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[GCControllerElement localizedName](self, "localizedName");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)v6;
        v8 = CFSTR("enabled");
        if (v3)
          v8 = CFSTR("disabled");
        v9 = 138412546;
        v10 = v6;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "Gesture aware %@ %@ by the system", (uint8_t *)&v9, 0x16u);

      }
    }
  }
}

- (BOOL)inputDisabledBySystem
{
  return self->_inputDisabledBySystem;
}

- (int64_t)actualSystemGestureState
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int64_t actualSystemGestureState;

  if (-[_GCControllerGestureAwareButtonInput isDoublePressGestureRecognizerEnabled](self, "isDoublePressGestureRecognizerEnabled")|| -[_GCControllerGestureAwareButtonInput isSinglePressGestureRecognizerEnabled](self, "isSinglePressGestureRecognizerEnabled"))
  {
    v3 = 0;
  }
  else
  {
    v3 = !-[_GCControllerGestureAwareButtonInput isLongPressGestureRecognizerEnabled](self, "isLongPressGestureRecognizerEnabled");
  }
  -[GCControllerElement device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6
    && ((objc_msgSend(v6, "isSnapshot") | v3) & 1) == 0
    && self->_enabled
    && !-[_GCControllerGestureAwareButtonInput inputDisabledBySystem](self, "inputDisabledBySystem"))
  {
    if (self->_useActualSystemGestureState)
      actualSystemGestureState = self->_actualSystemGestureState;
    else
      actualSystemGestureState = -[_GCControllerGestureAwareButtonInput preferredSystemGestureState](self, "preferredSystemGestureState");
  }
  else
  {
    actualSystemGestureState = 2;
  }

  return actualSystemGestureState;
}

- (void)setPreferredSystemGestureState:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  int64_t preferredSystemGestureState;
  void *v8;
  void *v9;
  id v10;

  if (self->_preferredSystemGestureState != a3)
  {
    self->_preferredSystemGestureState = a3;
    -[GCControllerElement device](self, "device");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v10;
    else
      v4 = 0;
    v5 = v4;
    objc_msgSend(v5, "systemGestureComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      preferredSystemGestureState = self->_preferredSystemGestureState;
      objc_msgSend(v5, "systemGestureComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCControllerElement primaryAlias](self, "primaryAlias");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (preferredSystemGestureState == 2)
        objc_msgSend(v8, "disableSystemGestureForInput:", v9);
      else
        objc_msgSend(v8, "enableSystemGestureForInput:", v9);

    }
  }
}

- (int64_t)preferredSystemGestureState
{
  return self->_preferredSystemGestureState;
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  id v6;
  float v7;
  int64_t v8;
  double v9;
  double v10;
  _GCControllerGestureAwareButtonInput **v11;
  unsigned __int8 v12;
  _GCControllerGestureAwareButtonInput *v14;
  __objc2_class *v15;
  _GCControllerGestureAwareButtonInput *v16;
  __objc2_class *v17;

  v6 = a4;
  v7 = clamp(a3, 0.0, 1.0);
  self->_realValue = v7;
  v8 = -[_GCControllerGestureAwareButtonInput actualSystemGestureState](self, "actualSystemGestureState");
  if (v8 != 2)
  {
    if (v8 != 1)
    {
      if (!v8)
      {
        *(float *)&v9 = a3;
        -[_GCControllerGestureAwareButtonInput registerSetValueEvent:queue:](self, "registerSetValueEvent:queue:", v6, v9);
      }
      goto LABEL_7;
    }
    *(float *)&v9 = a3;
    -[_GCControllerGestureAwareButtonInput registerSetValueEvent:queue:](self, "registerSetValueEvent:queue:", v6, v9);
    v16 = self;
    v17 = _GCControllerGestureAwareButtonInput;
    v11 = &v16;
LABEL_9:
    *(float *)&v10 = a3;
    v12 = objc_msgSendSuper2((objc_super *)v11, sel__setValue_queue_, v6, v10, v14, v15, v16, v17);
    goto LABEL_10;
  }
  if (!-[_GCControllerGestureAwareButtonInput inputDisabledBySystem](self, "inputDisabledBySystem"))
  {
    v14 = self;
    v15 = _GCControllerGestureAwareButtonInput;
    v11 = &v14;
    goto LABEL_9;
  }
LABEL_7:
  v12 = 0;
LABEL_10:

  return v12;
}

- (void)setValue:(float)a3
{
  void *v5;
  void *v6;
  double v7;
  id v8;
  objc_super v9;

  -[GCControllerElement device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC9B8];
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "isSnapshot") & 1) != 0)
  {
    objc_msgSend(v5, "handlerQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)_GCControllerGestureAwareButtonInput;
    *(float *)&v7 = a3;
    -[GCControllerButtonInput _setValue:queue:](&v9, sel__setValue_queue_, v6, v7);

  }
}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  id v4;
  float v5;
  BOOL v6;

  v4 = a3;
  if (-[GCControllerElement updatePending](self, "updatePending"))
  {
    -[GCControllerElement pendingValue](self, "pendingValue");
    if (v5 == self->_realValue)
    {
      v6 = 0;
    }
    else
    {
      -[GCControllerElement pendingValue](self, "pendingValue");
      v6 = -[_GCControllerGestureAwareButtonInput _setValue:queue:](self, "_setValue:queue:", v4);
    }
    -[GCControllerElement _resetPendingValue](self, "_resetPendingValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)registerSetValueEvent:(float)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  float v12;
  id location;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_initWeak(&location, self);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a3;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "[GESTURE] registerSetValueEvent: %f", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68___GCControllerGestureAwareButtonInput_registerSetValueEvent_queue___block_invoke;
  block[3] = &unk_24D2B4D30;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  block[4] = self;
  v10 = v6;
  v7 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)__onqueue_forwardEvent:(id)a3 queue:(id)a4
{
  unsigned __int8 *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  objc_super v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned __int8 *)a3;
  v7 = a4;
  if (!-[_GCControllerGestureAwareButtonInput actualSystemGestureState](self, "actualSystemGestureState")
    && !v6[17]
    && v6[20]
    && v6[19]
    && v6[21])
  {
    v6[17] = 1;
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = v6[16];
        *(_DWORD *)buf = 67109120;
        v15 = v12;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "[GESTURE] Forward event with value: %d", buf, 8u);
      }

    }
    LODWORD(v8) = 0;
    if (v6[16])
      *(float *)&v8 = 1.0;
    v13.receiver = self;
    v13.super_class = (Class)_GCControllerGestureAwareButtonInput;
    if (-[GCControllerButtonInput _setValue:queue:](&v13, sel__setValue_queue_, v7, v8))
    {
      -[GCControllerElement device](self, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "physicalInputProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_triggerValueChangedHandlerForElement:queue:", self, v7);

    }
  }

}

- (void)__onqueue_executeDoublePressRecognizerForEvent:(id)a3 queue:(id)a4
{
  unsigned __int8 *v6;
  id v7;
  uint64_t v8;
  void *v9;
  float v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  double v23;
  float v24;
  unsigned __int8 *v25;
  int v26;
  unint64_t v27;
  int v28;
  _BYTE *v29;
  unint64_t v30;
  _BYTE *v31;
  int v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  NSObject *v38;
  id v39;
  os_log_t log;
  NSObject *loga;
  void *v42;
  void *v43;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[4];
  unsigned __int8 *v54;
  _GCControllerGestureAwareButtonInput *v55;
  NSObject *v56;
  uint8_t v57[128];
  uint8_t buf[4];
  _BYTE *v59;
  __int16 v60;
  int v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned __int8 *)a3;
  v7 = a4;
  -[NSMutableArray lastObject](self->_doublePressEventQueue, "lastObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8 || *(unsigned __int8 *)(v8 + 16) != v6[16])
  {
    -[NSMutableArray addObject:](self->_doublePressEventQueue, "addObject:", v6);
    -[_GCControllerGestureAwareButtonInput doublePressInterval](self, "doublePressInterval");
    v11 = dispatch_time(0, (uint64_t)(float)(v10 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke;
    block[3] = &unk_24D2B3D70;
    v54 = v6;
    v55 = self;
    v56 = v7;
    dispatch_after(v11, v56, block);

    +[NSDate date](&off_254DF6DA0, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = self->_doublePressEventQueue;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    if (v16)
    {
      v17 = v16;
      log = (os_log_t)v6;
      v42 = v9;
      v39 = v7;
      v18 = 0;
      v19 = *(_QWORD *)v50;
      while (2)
      {
        v20 = 0;
        v21 = v18 + v17;
        do
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v15);
          v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v20);
          v23 = v14 - *(double *)(v22 + 8);
          -[_GCControllerGestureAwareButtonInput doublePressInterval](self, "doublePressInterval", v39);
          if (v23 < v24)
          {
            v21 = v18 + v20;
            goto LABEL_13;
          }
          *(_BYTE *)(v22 + 20) = 1;
          ++v20;
        }
        while (v17 != v20);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
        v18 = v21;
        if (v17)
          continue;
        break;
      }
LABEL_13:

      v7 = v39;
      v6 = (unsigned __int8 *)log;
      v9 = v42;
      if (v21 >= 1)
        -[NSMutableArray removeObjectsInRange:](self->_doublePressEventQueue, "removeObjectsInRange:", 0, v21);
    }
    else
    {

    }
    if (-[NSMutableArray count](self->_doublePressEventQueue, "count"))
    {
      -[NSMutableArray firstObject](self->_doublePressEventQueue, "firstObject");
      v25 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v26 = v25[16];

      if (-[NSMutableArray count](self->_doublePressEventQueue, "count"))
      {
        v27 = 0;
        v28 = 0;
        while (1)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_doublePressEventQueue, "objectAtIndexedSubscript:", v27);
          v29 = (_BYTE *)objc_claimAutoreleasedReturnValue();
          if (v26 && !v29[16])
            ++v28;
          if (v28 == self->_requiredDoublePressCount)
            break;
          v26 = v29[16];

          if (-[NSMutableArray count](self->_doublePressEventQueue, "count") <= ++v27)
            goto LABEL_45;
        }

        if (-[NSMutableArray count](self->_doublePressEventQueue, "count") > (unint64_t)v27)
        {
          v30 = v27;
          do
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_doublePressEventQueue, "objectAtIndexedSubscript:", v27);
            v31 = (_BYTE *)objc_claimAutoreleasedReturnValue();
            v31[18] = 0;
            if (gc_isInternalBuild())
            {
              getGCLogger();
              loga = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
              {
                v32 = v31[18];
                *(_DWORD *)buf = 138412546;
                v59 = v31;
                v60 = 1024;
                v61 = v32;
                _os_log_impl(&dword_215181000, loga, OS_LOG_TYPE_INFO, "[CLEAR] %@ tentativeSinglePress resetting to %d", buf, 0x12u);
              }

            }
            ++v30;
          }
          while (-[NSMutableArray count](self->_doublePressEventQueue, "count") > v30);
        }
        v43 = v9;
        if ((gc_isInternalBuild() & 1) != 0)
        {
          getGCLogger();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215181000, v38, OS_LOG_TYPE_INFO, "[GESTURE] Multi press recognized, draining event queue", buf, 2u);
          }

        }
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v33 = self->_doublePressEventQueue;
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v46 != v36)
                objc_enumerationMutation(v33);
              if (self->_doublePressHandler)
                *(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i) + 17) = 1;
            }
            v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          }
          while (v35);
        }

        -[NSMutableArray removeAllObjects](self->_doublePressEventQueue, "removeAllObjects");
        v9 = v43;
        if (self->_doublePressHandler)
        {
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_82;
          v44[3] = &unk_24D2B2B20;
          v44[4] = self;
          dispatch_async(MEMORY[0x24BDAC9B8], v44);
        }
      }
    }
  }
LABEL_45:

}

- (void)__onqueue_executeLongPressRecognizerForEvent:(id)a3 queue:(id)a4
{
  double *v7;
  NSObject *v8;
  _GCSetValueEvent **p_longPressDownEvent;
  _GCSetValueEvent *longPressDownEvent;
  double v11;
  float v12;
  _GCSetValueEvent *v13;
  _BOOL4 consumed;
  int isInternalBuild;
  float v16;
  dispatch_time_t v17;
  _GCSetValueEvent *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD *v21;
  NSObject *v22;
  _BOOL4 pressed;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[4];
  double *v27;
  _GCControllerGestureAwareButtonInput *v28;
  NSObject *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD block[4];
  double *v33;
  _GCControllerGestureAwareButtonInput *v34;
  uint8_t buf[4];
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = (double *)a3;
  v8 = a4;
  p_longPressDownEvent = &self->_longPressDownEvent;
  longPressDownEvent = self->_longPressDownEvent;
  if (longPressDownEvent)
  {
    if (!*((_BYTE *)v7 + 16))
    {
      v11 = v7[1] - longPressDownEvent->timestamp;
      -[_GCControllerGestureAwareButtonInput longPressInterval](self, "longPressInterval");
      v13 = *p_longPressDownEvent;
      if (v11 <= v12)
      {
        v13->ignoredByLongPressRecognizer = 1;
        *((_BYTE *)v7 + 19) = 1;
        if (*((_BYTE *)v7 + 17) || !*((_BYTE *)v7 + 18) || !*((_BYTE *)v7 + 20))
        {
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              pressed = (*p_longPressDownEvent)->pressed;
              *(_DWORD *)buf = 67109120;
              v36 = pressed;
              _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected long press)", buf, 8u);
            }

          }
          -[_GCControllerGestureAwareButtonInput __onqueue_forwardEvent:queue:](self, "__onqueue_forwardEvent:queue:", *p_longPressDownEvent, v8);
          v19 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_86;
          v26[3] = &unk_24D2B3D70;
          v27 = v7;
          v28 = self;
          v29 = v8;
          dispatch_after(v19, v29, v26);

          goto LABEL_20;
        }
        *((_BYTE *)v7 + 17) = 1;
        (*p_longPressDownEvent)->consumed = 1;
        if (!self->_singlePressHandler)
        {
LABEL_20:
          v18 = *p_longPressDownEvent;
          *p_longPressDownEvent = 0;
          goto LABEL_21;
        }
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_85;
        v30[3] = &unk_24D2B2B20;
        v30[4] = self;
        v20 = MEMORY[0x24BDAC9B8];
        v21 = v30;
      }
      else
      {
        consumed = v13->consumed;
        isInternalBuild = gc_isInternalBuild();
        if (consumed)
        {
          if (isInternalBuild)
          {
            getGCLogger();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215181000, v24, OS_LOG_TYPE_INFO, "[GESTURE] Long press recognized (already triggered due to time elapsed)", buf, 2u);
            }

          }
          *((_BYTE *)v7 + 17) = 1;
          goto LABEL_20;
        }
        if (isInternalBuild)
        {
          getGCLogger();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "[GESTURE] Long press recognized", buf, 2u);
          }

        }
        (*p_longPressDownEvent)->consumed = 1;
        *((_BYTE *)v7 + 17) = 1;
        if (!self->_longPressHandler)
          goto LABEL_20;
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_84;
        v31[3] = &unk_24D2B2B20;
        v31[4] = self;
        v20 = MEMORY[0x24BDAC9B8];
        v21 = v31;
      }
      dispatch_async(v20, v21);
      goto LABEL_20;
    }
  }
  else if (*((_BYTE *)v7 + 16))
  {
    objc_storeStrong((id *)&self->_longPressDownEvent, a3);
    -[_GCControllerGestureAwareButtonInput longPressInterval](self, "longPressInterval");
    v17 = dispatch_time(0, (uint64_t)(float)(v16 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke;
    block[3] = &unk_24D2B2B48;
    v33 = v7;
    v34 = self;
    dispatch_after(v17, v8, block);
    v18 = (_GCSetValueEvent *)v33;
LABEL_21:

  }
}

- (void)__onqueue_executeSinglePressRecognizerForEvent:(id)a3 queue:(id)a4
{
  double *v7;
  id v8;
  _GCSetValueEvent **p_singlePressDownEvent;
  _GCSetValueEvent *singlePressDownEvent;
  double v11;
  float v12;
  dispatch_time_t v13;
  _GCSetValueEvent *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 pressed;
  _QWORD v18[4];
  double *v19;
  _GCControllerGestureAwareButtonInput *v20;
  NSObject *v21;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = (double *)a3;
  v8 = a4;
  p_singlePressDownEvent = &self->_singlePressDownEvent;
  singlePressDownEvent = self->_singlePressDownEvent;
  if (singlePressDownEvent)
  {
    if (!*((_BYTE *)v7 + 16))
    {
      if (!*((_BYTE *)v7 + 17))
      {
        v11 = v7[1] - singlePressDownEvent->timestamp;
        -[_GCControllerGestureAwareButtonInput singlePressInterval](self, "singlePressInterval");
        if (v11 >= v12)
        {
          (*p_singlePressDownEvent)->ignoredBySinglePressRecognizer = 1;
          *((_BYTE *)v7 + 21) = 1;
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              pressed = (*p_singlePressDownEvent)->pressed;
              *(_DWORD *)buf = 67109120;
              v24 = pressed;
              _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected single press)", buf, 8u);
            }

          }
          -[_GCControllerGestureAwareButtonInput __onqueue_forwardEvent:queue:](self, "__onqueue_forwardEvent:queue:", *p_singlePressDownEvent, v8);
          v13 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke_87;
          v18[3] = &unk_24D2B3D70;
          v19 = v7;
          v20 = self;
          v21 = v8;
          dispatch_after(v13, v21, v18);

        }
        else
        {
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "[GESTURE] Single press recognized", buf, 2u);
            }

          }
          if (*((_BYTE *)v7 + 20) && *((_BYTE *)v7 + 19))
          {
            (*p_singlePressDownEvent)->consumed = 1;
            *((_BYTE *)v7 + 17) = 1;
            if (self->_singlePressHandler)
            {
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke;
              block[3] = &unk_24D2B2B20;
              block[4] = self;
              dispatch_async(MEMORY[0x24BDAC9B8], block);
            }
          }
          else
          {
            *((_BYTE *)v7 + 18) = 1;
          }
        }
      }
      v14 = *p_singlePressDownEvent;
      *p_singlePressDownEvent = 0;

    }
  }
  else if (*((_BYTE *)v7 + 16))
  {
    objc_storeStrong((id *)&self->_singlePressDownEvent, a3);
  }

}

- (float)longPressInterval
{
  return self->_longPressInterval;
}

- (void)setLongPressInterval:(float)a3
{
  self->_longPressInterval = a3;
}

- (float)singlePressInterval
{
  return self->_singlePressInterval;
}

- (void)setSinglePressInterval:(float)a3
{
  self->_singlePressInterval = a3;
}

- (float)doublePressInterval
{
  return self->_doublePressInterval;
}

- (void)setDoublePressInterval:(float)a3
{
  self->_doublePressInterval = a3;
}

- (id)longPressHandler
{
  return self->_longPressHandler;
}

- (void)setLongPressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)doublePressHandler
{
  return self->_doublePressHandler;
}

- (void)setDoublePressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)singlePressHandler
{
  return self->_singlePressHandler;
}

- (void)setSinglePressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)isLongPressMuted
{
  return self->_longPressMuted;
}

- (void)setLongPressMuted:(BOOL)a3
{
  self->_longPressMuted = a3;
}

- (BOOL)isDoublePressMuted
{
  return self->_doublePressMuted;
}

- (void)setDoublePressMuted:(BOOL)a3
{
  self->_doublePressMuted = a3;
}

- (BOOL)isSinglePressMuted
{
  return self->_singlePressMuted;
}

- (void)setSinglePressMuted:(BOOL)a3
{
  self->_singlePressMuted = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_singlePressHandler, 0);
  objc_storeStrong(&self->_doublePressHandler, 0);
  objc_storeStrong(&self->_longPressHandler, 0);
  objc_storeStrong((id *)&self->_singlePressDownEvent, 0);
  objc_storeStrong((id *)&self->_longPressDownEvent, 0);
  objc_storeStrong((id *)&self->_doublePressEventQueue, 0);
}

@end
