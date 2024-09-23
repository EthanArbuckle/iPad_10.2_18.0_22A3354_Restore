@implementation GCControllerButtonInput

- (GCControllerButtonInput)initWithDescriptionName:(id)a3
{
  id v4;
  GCControllerButtonInput *v5;
  GCControllerButtonInput *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCControllerButtonInput;
  v5 = -[GCControllerElement init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (void *)objc_msgSend(v4, "copy");
      -[GCControllerElement setPrimaryAlias:](v6, "setPrimaryAlias:", v7);

    }
    else
    {
      -[GCControllerElement setPrimaryAlias:](v5, "setPrimaryAlias:", CFSTR("Button"));
    }
    v6->_pressCounter = 0;
  }

  return v6;
}

- (BOOL)isAnalog
{
  return !self->_nonAnalog;
}

- (BOOL)_setValue:(float)a3
{
  return -[GCControllerButtonInput _setValue:queue:](self, "_setValue:queue:", MEMORY[0x24BDAC9B8]);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  NSObject *v6;
  float v7;
  float value;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  float v24;
  float deadzone;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;
  char v36;
  os_signpost_id_t v38;
  os_signpost_id_t v39;
  NSObject *queue;
  void *v41;
  _QWORD v42[5];
  NSObject *v43;
  id v44;
  id v45;
  os_signpost_id_t v46;
  uint64_t v47;
  float v48;
  BOOL v49;
  _QWORD v50[5];
  NSObject *v51;
  id v52;
  id v53;
  os_signpost_id_t v54;
  uint64_t v55;
  float v56;
  BOOL v57;
  BOOL v58;
  _QWORD block[5];
  NSObject *v60;
  id v61;
  id v62;
  os_signpost_id_t v63;
  uint64_t v64;
  float v65;
  BOOL v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = clamp(a3, 0.0, 1.0);
  value = self->_value;
  if (value != v7)
  {
    queue = v6;
    getGCSignpostLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    -[GCControllerElement primaryAlias](self, "primaryAlias");
    v10 = objc_claimAutoreleasedReturnValue();
    -[GCControllerElement device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "physicalInputProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastEventTimestamp");
    v14 = v13;

    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138412546;
      v68 = v10;
      v69 = 2048;
      v70 = v14;
      _os_signpost_emit_with_name_impl(&dword_215181000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Button Value Updated", "%@, receiveTimestamp=%f", buf, 0x16u);
    }
    if (self->_valueChangedHandler)
    {
      v15 = os_signpost_id_generate(v9);
      v16 = v9;
      v17 = v16;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138412546;
        v68 = v10;
        v69 = 2048;
        v70 = v14;
        _os_signpost_emit_with_name_impl(&dword_215181000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Button Value Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
      }

    }
    else
    {
      v15 = 0;
    }
    v41 = (void *)v10;
    if (self->_touchedChangedHandler)
    {
      v18 = os_signpost_id_generate(v9);
      v19 = v9;
      v20 = v19;
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138412546;
        v68 = v10;
        v69 = 2048;
        v70 = v14;
        _os_signpost_emit_with_name_impl(&dword_215181000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Button Touched Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
      }

    }
    else
    {
      v18 = 0;
    }
    v38 = v18;
    if (self->_pressedChangedHandler)
    {
      v21 = os_signpost_id_generate(v9);
      v22 = v9;
      v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138412546;
        v68 = (uint64_t)v41;
        v69 = 2048;
        v70 = v14;
        _os_signpost_emit_with_name_impl(&dword_215181000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Button Pressed Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
      }
      v39 = v21;

    }
    else
    {
      v39 = 0;
    }
    v24 = self->_value;
    deadzone = self->_deadzone;
    self->_value = v7;
    v26 = (void *)MEMORY[0x2199DEBB0](self->_valueChangedHandler);
    v27 = v26;
    if (v26)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__GCControllerButtonInput__setValue_queue___block_invoke;
      block[3] = &unk_24D2B5438;
      v62 = v26;
      block[4] = self;
      v65 = v7;
      v66 = deadzone < v7;
      v60 = v9;
      v63 = v15;
      v61 = v41;
      v64 = v14;
      dispatch_async(v6, block);

    }
    v28 = (void *)MEMORY[0x2199DEBB0](self->_touchedChangedHandler);
    v29 = v28;
    if (!self->_touchedAndValueDistinct && v7 > 0.0019531 == v24 <= 0.0019531)
    {
      self->_touched = v7 > 0.0019531;
      if (v28)
      {
        v50[0] = MEMORY[0x24BDAC760];
        v50[1] = 3221225472;
        v50[2] = __43__GCControllerButtonInput__setValue_queue___block_invoke_58;
        v50[3] = &unk_24D2B5460;
        v53 = v28;
        v50[4] = self;
        v56 = v7;
        v57 = deadzone < v7;
        v58 = v7 > 0.0019531;
        v51 = v9;
        v54 = v38;
        v52 = v41;
        v55 = v14;
        dispatch_async(v6, v50);

      }
    }
    v30 = deadzone < v7;
    v31 = v24 > deadzone;
    v32 = (void *)MEMORY[0x2199DEBB0](self->_pressedChangedHandler);
    v33 = v32;
    v34 = v31 ^ v30;
    v35 = v31 == v30;
    v6 = queue;
    if (!v35 && v32)
    {
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __43__GCControllerButtonInput__setValue_queue___block_invoke_59;
      v42[3] = &unk_24D2B5438;
      v45 = v32;
      v42[4] = self;
      v48 = v7;
      v49 = deadzone < v7;
      v43 = v9;
      v46 = v39;
      v44 = v41;
      v47 = v14;
      dispatch_async(queue, v42);

    }
    v36 = v34 ^ 1;
    if (deadzone >= v7)
      v36 = 1;
    if ((v36 & 1) == 0)
      ++self->_pressCounter;

  }
  return value != v7;
}

void __43__GCControllerButtonInput__setValue_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(float))(*(_QWORD *)(a1 + 56) + 16))(*(float *)(a1 + 80));
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 72);
    v7 = 138412546;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_215181000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Button Value Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v7, 0x16u);
  }

}

void __43__GCControllerButtonInput__setValue_queue___block_invoke_58(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(float))(*(_QWORD *)(a1 + 56) + 16))(*(float *)(a1 + 80));
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 72);
    v7 = 138412546;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_215181000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Button Touched Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v7, 0x16u);
  }

}

void __43__GCControllerButtonInput__setValue_queue___block_invoke_59(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(float))(*(_QWORD *)(a1 + 56) + 16))(*(float *)(a1 + 80));
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 72);
    v7 = 138412546;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_215181000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Button Pressed Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v7, 0x16u);
  }

}

- (BOOL)_setTouched:(BOOL)a3 queue:(id)a4
{
  _BOOL4 v4;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  float value;
  unsigned int v16;
  float v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v22[5];
  NSObject *v23;
  id v24;
  id v25;
  os_signpost_id_t v26;
  uint64_t v27;
  float v28;
  float v29;
  BOOL v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self->_touchedAndValueDistinct && self->_touched != v4)
  {
    getGCSignpostLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    -[GCControllerElement primaryAlias](self, "primaryAlias");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "physicalInputProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastEventTimestamp");
    v13 = v12;

    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v9;
      v33 = 2048;
      v34 = v13;
      _os_signpost_emit_with_name_impl(&dword_215181000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Button Touched Updated", "%@, receiveTimestamp=%f", buf, 0x16u);
    }
    self->_touched = v4;
    v14 = (void *)MEMORY[0x2199DEBB0](self->_touchedChangedHandler);
    value = self->_value;
    v16 = -[GCControllerButtonInput isPressed](self, "isPressed");
    if (v14)
    {
      v17 = (float)v16;
      v18 = os_signpost_id_generate(v8);
      v19 = v8;
      v20 = v19;
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v9;
        v33 = 2048;
        v34 = v13;
        _os_signpost_emit_with_name_impl(&dword_215181000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Button Touched Change", "%@, receiveTimestamp=%f", buf, 0x16u);
      }

      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __45__GCControllerButtonInput__setTouched_queue___block_invoke;
      v22[3] = &unk_24D2B5488;
      v25 = v14;
      v22[4] = self;
      v28 = value;
      v29 = v17;
      v30 = v4;
      v23 = v20;
      v26 = v18;
      v24 = v9;
      v27 = v13;
      dispatch_async(v6, v22);

    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __45__GCControllerButtonInput__setTouched_queue___block_invoke(uint64_t a1, __n128 a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  a2.n128_u32[0] = *(_DWORD *)(a1 + 80);
  (*(void (**)(_QWORD, _QWORD, BOOL, _QWORD, __n128))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(float *)(a1 + 84) != 0.0, *(unsigned __int8 *)(a1 + 88), a2);
  v3 = *(id *)(a1 + 40);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 72);
    v8 = 138412546;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_signpost_emit_with_name_impl(&dword_215181000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Button Touched Change", "%@, receiveTimestamp=%f", (uint8_t *)&v8, 0x16u);
  }

}

- (int)getAndResetTimesPressed
{
  int pressCounter;

  pressCounter = self->_pressCounter;
  self->_pressCounter = 0;
  return pressCounter;
}

- (BOOL)isPressed
{
  float v3;
  float v4;
  float v5;

  -[GCControllerButtonInput value](self, "value");
  v4 = v3;
  -[GCControllerButtonInput deadzone](self, "deadzone");
  return v4 > v5;
}

- (id)description
{
  void *v3;
  float v4;
  void *v5;

  -[GCControllerElement primaryAlias](self, "primaryAlias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerButtonInput value](self, "value");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%@ (value: %.3f, pressed: %d)"), v3, v4, -[GCControllerButtonInput isPressed](self, "isPressed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCControllerButtonInput description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(float)value
{
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  id v9;
  GCControllerButtonInput *v10;
  double v11;
  void *v12;

  -[GCControllerElement device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v12;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_9;
    v7 = objc_msgSend(v12, "isSnapshot");
    v6 = v12;
    if ((v7 & 1) == 0)
      goto LABEL_9;
    objc_msgSend(v12, "handlerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDAC9B8];
    v9 = MEMORY[0x24BDAC9B8];
  }
  v10 = self;
  *(float *)&v11 = value;
  if (-[GCControllerButtonInput _setValue:queue:](v10, "_setValue:queue:", v8, v11))
    objc_msgSend(0, "addObject:", v10);

  v6 = v12;
LABEL_9:

}

- (float)value
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  getGCSignpostLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    -[GCControllerElement primaryAlias](self, "primaryAlias");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCControllerElement device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "physicalInputProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastEventTimestamp");
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = v7;
    _os_signpost_emit_with_name_impl(&dword_215181000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Button Value Read", "%@, receiveTimestamp=%f", (uint8_t *)&v9, 0x16u);

  }
  return self->_value;
}

- (void)setDeadzone:(float)a3
{
  if (a3 <= 0.0019531)
    a3 = 0.0019531;
  self->_deadzone = a3;
}

- (float)deadzone
{
  return self->_deadzone;
}

- (GCControllerButtonValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCControllerButtonValueChangedHandler)valueChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, valueChangedHandler, 128);
}

- (GCControllerButtonValueChangedHandler)pressedChangedHandler
{
  return self->_pressedChangedHandler;
}

- (void)setPressedChangedHandler:(GCControllerButtonValueChangedHandler)pressedChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, pressedChangedHandler, 136);
}

- (GCControllerButtonTouchedChangedHandler)touchedChangedHandler
{
  return self->_touchedChangedHandler;
}

- (void)setTouchedChangedHandler:(GCControllerButtonTouchedChangedHandler)touchedChangedHandler
{
  objc_setProperty_nonatomic_copy(self, a2, touchedChangedHandler, 144);
}

- (BOOL)isTouched
{
  return self->_touched;
}

- (BOOL)areTouchedAndValueDistinct
{
  return self->_touchedAndValueDistinct;
}

- (void)setTouchedAndValueDistinct:(BOOL)a3
{
  self->_touchedAndValueDistinct = a3;
}

- (BOOL)nonAnalog
{
  return self->_nonAnalog;
}

- (void)setNonAnalog:(BOOL)a3
{
  self->_nonAnalog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchedChangedHandler, 0);
  objc_storeStrong(&self->_pressedChangedHandler, 0);
  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end
