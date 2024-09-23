@implementation _GCDevicePhysicalInputButtonInput

- (_GCDevicePhysicalInputButtonInput)init
{
  -[_GCDevicePhysicalInputButtonInput doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_GCDevicePhysicalInputButtonInput)initWithParameters:(id)a3
{
  float *v4;
  _GCDevicePhysicalInputButtonInput *v5;
  _GCDevicePhysicalInputButtonInput *v6;
  uint64_t v7;
  double v8;
  objc_super v10;

  v4 = (float *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  v5 = -[_GCDevicePhysicalInputView initWithParameters:](&v10, sel_initWithParameters_, v4);
  v6 = v5;
  if (v4)
  {
    -[_GCDevicePhysicalInputButtonInput _setSources:]((uint64_t)v5, *((_QWORD *)v4 + 2));
    v7 = *((unsigned __int8 *)v4 + 8);
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[_GCDevicePhysicalInputButtonInput _setSources:]((uint64_t)v5, 0);
  v7 = 0;
  if (v6)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v7, (uint64_t)&v6->_isAnalogSlot);
LABEL_4:
  if (!v4)
  {
    v8 = 0.0;
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = v4[3];
  if (v6)
LABEL_6:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, *(uint64_t *)&v8, (uint64_t)&v6->_pressedThresholdSlot);
LABEL_7:

  return v6;
}

- (uint64_t)_setSources:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, CFSTR("_GCDevicePhysicalInputButtonInput.m"), 214, CFSTR("Invalid parameter not satisfying: %s"), "newValue != nil");

    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 24, 771);
  }
  return result;
}

- (uint64_t)_setAnalog:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 32);
  return result;
}

- (uint64_t)_setPressedThreshold:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 40);
  return result;
}

- (_GCDevicePhysicalInputButtonInput)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputButtonInput *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputView initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[3], v10.receiver, v10.super_class);
  v7->_isAnalogSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[4]);
  v7->_pressedThresholdSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[5]);
  v7->_valueChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[6]);
  v7->_pressedChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[7]);
  v7->_valueSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[8]);
  v7->_valueTimestampSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[9]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[10]);

  v7->_pressedTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputButtonInput;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6;
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  _BOOL8 v14;
  int v15;
  __int16 v16;
  float v17;
  double v18;
  int v19;
  __int16 v20;
  void *v21;
  int v22;
  __int16 v23;
  void *v24;
  _BOOL4 v25;
  __int16 v26;
  float v27;
  double v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  int v35;
  __int16 v36;
  objc_super v38;

  v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v38, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    v10 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_0 = v10;
  }
  v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
  v12 = (void *)-[_GCDevicePhysicalInputButtonInput _sources]((uint64_t)a5);
  v13 = -[_GCDevicePhysicalInputButtonInput _setSources:]((uint64_t)self, (uint64_t)v12);
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFE | v13;

  if (a5)
  {
    v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 32) != 0;
    if (self)
      goto LABEL_9;
LABEL_44:
    LOBYTE(v15) = 0;
    v16 = 0;
    goto LABEL_12;
  }
  v14 = 0;
  if (!self)
    goto LABEL_44;
LABEL_9:
  v15 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v14, (uint64_t)&self->_isAnalogSlot);
  if (v15)
    v16 = 2;
  else
    v16 = 0;
LABEL_12:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFD | v16;
  if (a5)
  {
    v17 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 40));
    v18 = v17;
    if (self)
      goto LABEL_14;
LABEL_46:
    LOBYTE(v19) = 0;
    v20 = 0;
    goto LABEL_17;
  }
  v18 = 0.0;
  if (!self)
    goto LABEL_46;
LABEL_14:
  v19 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v18, (uint64_t)&self->_pressedThresholdSlot);
  if (v19)
    v20 = 4;
  else
    v20 = 0;
LABEL_17:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFB | v20;
  v9 |= v13 | v15 | v19;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      return v9;
LABEL_25:
    if (a5)
    {
      v27 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64));
      v28 = v27;
      if (self)
        goto LABEL_27;
    }
    else
    {
      v28 = 0.0;
      if (self)
      {
LABEL_27:
        v29 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v28, (uint64_t)&self->_valueSlot);
        if (v29)
          v30 = 32;
        else
          v30 = 0;
LABEL_30:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFDF | v30;
        if (a5)
        {
          v31 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
          if (self)
            goto LABEL_32;
        }
        else
        {
          v31 = 0;
          if (self)
          {
LABEL_32:
            v32 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v31, (uint64_t)&self->_valueTimestampSlot);
            if (v32)
              v33 = 64;
            else
              v33 = 0;
LABEL_35:
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFBF | v33;
            if (a5)
              v34 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
            else
              v34 = 0;
            if (self)
            {
              v35 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v34, (uint64_t)&self->_pressedTimestampSlot);
              if (v35)
                v36 = 256;
              else
                v36 = 0;
            }
            else
            {
              LOBYTE(v35) = 0;
              v36 = 0;
            }
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFEFF | v36;
            return v9 | v35 | v29 | v32;
          }
        }
        LOBYTE(v32) = 0;
        v33 = 0;
        goto LABEL_35;
      }
    }
    LOBYTE(v29) = 0;
    v30 = 0;
    goto LABEL_30;
  }
LABEL_18:
  v21 = (void *)-[_GCDevicePhysicalInputButtonInput _valueDidChangeHandler]((uint64_t)a5);
  v22 = -[_GCDevicePhysicalInputButtonInput _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v21);
  if (v22)
    v23 = 8;
  else
    v23 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFF7 | v23;

  objc_msgSend(a5, "pressedDidChangeHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_GCDevicePhysicalInputButtonInput _setPressedDidChangeHandler:](self, "_setPressedDidChangeHandler:", v24);
  if (v25)
    v26 = 16;
  else
    v26 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFEF | v26;
  v9 |= v22 | v25;

  if ((v6 & 8) != 0)
    goto LABEL_25;
  return v9;
}

- (uint64_t)_sources
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 24);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (BOOL)_isAnalog
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 32) != 0;
  return result;
}

- (float)_pressedThreshold
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 40));
  else
    return 0.0;
}

- (uint64_t)_valueDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 48);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setValueDidChangeHandler:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = result;
    v3 = (void *)MEMORY[0x2199DEBB0](a2);
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 48, 771);

    return v4;
  }
  return result;
}

- (float)_value
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64));
  else
    return 0.0;
}

- (uint64_t)_setValue:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 64);
  return result;
}

- (double)_lastValueTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 72));
  else
    return 0.0;
}

- (uint64_t)_setLastValueTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 72);
  return result;
}

- (double)_lastPressedTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 80));
  else
    return 0.0;
}

- (uint64_t)_setLastPressedTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 80);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  -[_GCDevicePhysicalInputView preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    v6 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_0 = v6;
  }
  v7 = *(_WORD *)((char *)a3 + v6);
  v8 = v6;
  if ((v7 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("sources"));
    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 8) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("analog"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_6:
    if ((v7 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("pressedDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_8:
    if ((v7 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("value"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueLatency"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x100) == 0)
      return;
    goto LABEL_11;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("pressed"));
  if ((*(_WORD *)((_BYTE *)a3 + v8) & 0x100) == 0)
    return;
LABEL_11:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastPressedStateTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastPressedStateLatency"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v7;
  __int16 v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  -[_GCDevicePhysicalInputView postCommit:sender:](&v12, sel_postCommit_sender_);
  v7 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    v7 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_0 = v7;
  }
  v8 = *(_WORD *)((char *)a3 + v7);
  v9 = v7;
  if ((v8 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sources"));
    v8 = *(_WORD *)((char *)a3 + v9);
    if ((v8 & 2) == 0)
    {
LABEL_5:
      if ((v8 & 8) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("analog"));
  v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 8) == 0)
  {
LABEL_6:
    if ((v8 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x10) == 0)
  {
LABEL_7:
    if ((v8 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("pressedDidChangeHandler"));
  v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x20) == 0)
  {
LABEL_8:
    if ((v8 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("value"));
  v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x40) == 0)
  {
LABEL_9:
    if ((v8 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueLatency"));
  v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x80) == 0)
  {
LABEL_10:
    if ((v8 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("pressed"));
  v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x100) == 0)
  {
LABEL_11:
    if ((v8 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPressedStateTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPressedStateLatency"));
  v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x20) == 0)
  {
LABEL_12:
    if ((v8 & 0x80) == 0)
      return;
    goto LABEL_25;
  }
LABEL_22:
  -[_GCDevicePhysicalInputButtonInput valueDidChangeHandler](self, "valueDidChangeHandler");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_GCDevicePhysicalInputButtonInput value](self, "value");
    ((void (**)(_QWORD, id, _GCDevicePhysicalInputButtonInput *))v10)[2](v10, a4, self);
  }

  if ((*(_WORD *)((_BYTE *)a3 + v9) & 0x80) != 0)
  {
LABEL_25:
    -[_GCDevicePhysicalInputButtonInput pressedDidChangeHandler](self, "pressedDidChangeHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
      ((void (**)(_QWORD, id, _GCDevicePhysicalInputButtonInput *, BOOL))v11)[2](v11, a4, self, -[_GCDevicePhysicalInputButtonInput isPressed](self, "isPressed"));

  }
}

- (BOOL)isEqualToInput:(_BOOL8)a1
{
  _BOOL8 v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  float v8;
  float v9;

  v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_isEqualToInput_, v2, CFSTR("_GCDevicePhysicalInputButtonInput.m"), 196, CFSTR("Invalid parameter not satisfying: %s"), "[otherElement isKindOfClass:_GCDevicePhysicalInputButtonInput.class]");
      v2 = 0;
LABEL_15:

      return v2;
    }
    v4 = (void *)objc_opt_class();
    if (objc_msgSend(v4, "isEqual:", objc_opt_class()))
    {
      -[_GCDevicePhysicalInputView _objectValueForSlot:](v2, v2 + 24);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "sources");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        v7 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 32);
        if (a2)
        {
          if ((v7 != 0) == (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 32) != 0))
          {
LABEL_7:
            v8 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 40));
            if (a2)
              v9 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 40));
            else
              v9 = 0.0;
            v2 = v9 == v8;
            goto LABEL_14;
          }
        }
        else if (!v7)
        {
          goto LABEL_7;
        }
      }
      v2 = 0;
LABEL_14:

      goto LABEL_15;
    }
    return 0;
  }
  return v2;
}

- (NSString)description
{
  float v3;
  double v4;
  _BOOL4 v5;
  const __CFString *v6;

  -[_GCDevicePhysicalInputButtonInput value](self, "value");
  v4 = v3;
  v5 = -[_GCDevicePhysicalInputButtonInput isPressed](self, "isPressed");
  v6 = &stru_24D2B85A8;
  if (v5)
    v6 = CFSTR(" (pressed)");
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<ButtonInput; value = %f%@>"),
           *(_QWORD *)&v4,
           v6);
}

- (id)_pressedDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputView _objectValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedChangedHandlerSlot);
}

- (BOOL)_setPressedDidChangeHandler:(id)a3
{
  void *v4;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  LOBYTE(self) = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v4, (uint64_t)&self->_pressedChangedHandlerSlot, 771);

  return (char)self;
}

- (uint64_t)__setValue:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 64);
  return result;
}

- (uint64_t)__setLastValueTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 72);
  return result;
}

- (uint64_t)__setLastPressedTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 80);
  return result;
}

- (id)valueDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputButtonInput _valueDidChangeHandler]((uint64_t)self);
}

- (void)setValueDidChangeHandler:(id)a3
{
  -[_GCDevicePhysicalInputButtonInput _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
}

- (float)value
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
  else
    return 0.0;
}

- (BOOL)isAnalog
{
  if (self)
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isAnalogSlot) != 0;
  return (char)self;
}

- (BOOL)canWrap
{
  return 0;
}

- (double)lastValueTimestamp
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  else
    return 0.0;
}

- (double)lastValueLatency
{
  double v3;

  if (!dword_254DBDF04)
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo / dword_254DBDF04)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  return (NSSet *)(id)-[_GCDevicePhysicalInputButtonInput _sources]((uint64_t)self);
}

- (BOOL)isPressed
{
  _GCDevicePhysicalInputButtonInput *v2;
  float v3;
  float v4;

  if (self)
  {
    v2 = self;
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
    v4 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v2, (uint64_t)&v2->_pressedThresholdSlot));
    LOBYTE(self) = (float)(v3 - v4) > 0.00000011921;
  }
  return (char)self;
}

- (double)lastPressedStateTimestamp
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedTimestampSlot));
  else
    return 0.0;
}

- (double)lastPressedStateLatency
{
  double v3;

  if (!dword_254DBDF0C)
    mach_timebase_info((mach_timebase_info_t)&lastPressedStateLatency_sTimebaseInfo);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedTimestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time()
                * lastPressedStateLatency_sTimebaseInfo
                / dword_254DBDF0C)
       / 1000000000.0
       - v3;
}

- (uint64_t)update:(float)a3 withValue:(double)a4 timestamp:
{
  unsigned int v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  float v13;
  _BOOL8 v14;

  if (!a1)
    return 0;
  v8 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    v8 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_0 = v8;
  }
  v9 = v8;
  v10 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64));
  v11 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 40));
  v12 = v10 - v11;
  v13 = a3 - v11;
  v14 = v10 != a3;
  if (v10 != a3)
  {
    -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](a1, COERCE__INT64(a3), a1 + 64);
    -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](a1, *(uint64_t *)&a4, a1 + 72);
    *(_WORD *)(a2 + v9) |= 0x60u;
  }
  if (v13 > 0.00000011921 != v12 > 0.00000011921)
  {
    -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](a1, *(uint64_t *)&a4, a1 + 80);
    *(_WORD *)(a2 + v9) |= 0x180u;
    return 1;
  }
  return v14;
}

@end
