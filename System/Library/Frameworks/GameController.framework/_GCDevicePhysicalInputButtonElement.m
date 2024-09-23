@implementation _GCDevicePhysicalInputButtonElement

- (_GCDevicePhysicalInputButtonElement)initWithParameters:(id)a3
{
  unsigned __int8 *v4;
  _GCDevicePhysicalInputButtonElement *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  objc_super v11;

  v4 = (unsigned __int8 *)a3;
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  v5 = -[_GCDevicePhysicalInputElement initWithParameters:](&v11, sel_initWithParameters_, v4);
  -[_GCDevicePhysicalInputButtonElementParameters sources](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonElement _setSources:]((uint64_t)v5, (uint64_t)v6);

  if (v4)
  {
    v7 = v4[40];
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (v5)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_isAnalogSlot);
LABEL_4:
  if (v4)
  {
    v8 = *((float *)v4 + 11);
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = 0.0;
  if (v5)
LABEL_6:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, *(uint64_t *)&v8, (uint64_t)&v5->_pressedThresholdSlot);
LABEL_7:
  if (!v4)
  {
    v9 = 0;
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = *((_QWORD *)v4 + 7);
  if (v5)
LABEL_9:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v9, (uint64_t)&v5->_pressedValueFieldSlot);
LABEL_10:

  return v5;
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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, CFSTR("_GCDevicePhysicalInputButtonElement.m"), 232, CFSTR("Invalid parameter not satisfying: %s"), "newValue != nil");

    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 56, 771);
  }
  return result;
}

- (uint64_t)_setAnalog:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 64);
  return result;
}

- (uint64_t)_setPressedThreshold:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 72);
  return result;
}

- (uint64_t)_setPressedValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  return result;
}

- (_GCDevicePhysicalInputButtonElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputButtonElement *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputElement initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v10.receiver, v10.super_class);
  v7->_isAnalogSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[8]);
  v7->_pressedThresholdSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[9]);
  v7->_pressedValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[10]);
  v7->_valueChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[11]);
  v7->_pressedChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[12]);
  v7->_valueSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[13]);
  v7->_valueTimestampSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[14]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[15]);

  v7->_pressedTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputButtonElement;
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
  uint64_t v21;
  char v22;
  int v23;
  __int16 v24;
  void *v25;
  int v26;
  __int16 v27;
  void *v28;
  int v29;
  __int16 v30;
  float v31;
  double v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  int v39;
  __int16 v40;
  objc_super v42;

  v6 = a4;
  v42.receiver = self;
  v42.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v42, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_11 = v10;
  }
  v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
  v12 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)a5);
  v13 = -[_GCDevicePhysicalInputButtonElement _setSources:]((uint64_t)self, (uint64_t)v12);
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFE | v13;

  if (a5)
  {
    v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64) != 0;
    if (self)
      goto LABEL_9;
LABEL_50:
    LOBYTE(v15) = 0;
    v16 = 0;
    goto LABEL_12;
  }
  v14 = 0;
  if (!self)
    goto LABEL_50;
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
    v17 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72));
    v18 = v17;
    if (self)
      goto LABEL_14;
  }
  else
  {
    v18 = 0.0;
    if (self)
    {
LABEL_14:
      v19 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v18, (uint64_t)&self->_pressedThresholdSlot);
      if (v19)
        v20 = 4;
      else
        v20 = 0;
      goto LABEL_17;
    }
  }
  LOBYTE(v19) = 0;
  v20 = 0;
LABEL_17:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFB | v20;
  if (a5)
    v21 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
  else
    v21 = 0;
  v22 = v15 | v19;
  if (self)
  {
    v23 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v21, (uint64_t)&self->_pressedValueFieldSlot);
    if (v23)
      v24 = 8;
    else
      v24 = 0;
  }
  else
  {
    LOBYTE(v23) = 0;
    v24 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFF7 | v24;
  v9 |= v13 | v22 | v23;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      return v9;
LABEL_31:
    if (a5)
    {
      v31 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 104));
      v32 = v31;
      if (self)
        goto LABEL_33;
    }
    else
    {
      v32 = 0.0;
      if (self)
      {
LABEL_33:
        v33 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v32, (uint64_t)&self->_valueSlot);
        if (v33)
          v34 = 64;
        else
          v34 = 0;
LABEL_36:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFBF | v34;
        if (a5)
        {
          v35 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
          if (self)
            goto LABEL_38;
        }
        else
        {
          v35 = 0;
          if (self)
          {
LABEL_38:
            v36 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v35, (uint64_t)&self->_valueTimestampSlot);
            if (v36)
              v37 = 128;
            else
              v37 = 0;
LABEL_41:
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFF7F | v37;
            if (a5)
              v38 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 120);
            else
              v38 = 0;
            if (self)
            {
              v39 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v38, (uint64_t)&self->_pressedTimestampSlot);
              if (v39)
                v40 = 512;
              else
                v40 = 0;
            }
            else
            {
              LOBYTE(v39) = 0;
              v40 = 0;
            }
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFDFF | v40;
            return v9 | v39 | v33 | v36;
          }
        }
        LOBYTE(v36) = 0;
        v37 = 0;
        goto LABEL_41;
      }
    }
    LOBYTE(v33) = 0;
    v34 = 0;
    goto LABEL_36;
  }
LABEL_24:
  v25 = (void *)-[_GCDevicePhysicalInputButtonElement _valueDidChangeHandler]((uint64_t)a5);
  v26 = -[_GCDevicePhysicalInputButtonElement _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v25);
  if (v26)
    v27 = 16;
  else
    v27 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFEF | v27;

  v28 = (void *)-[_GCDevicePhysicalInputButtonElement _pressedDidChangeHandler]((uint64_t)a5);
  v29 = -[_GCDevicePhysicalInputButtonElement _setPressedDidChangeHandler:]((uint64_t)self, (uint64_t)v28);
  if (v29)
    v30 = 32;
  else
    v30 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFDF | v30;
  v9 |= v26 | v29;

  if ((v6 & 8) != 0)
    goto LABEL_31;
  return v9;
}

- (uint64_t)_sources
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 56);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (BOOL)_isAnalog
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 64) != 0;
  return result;
}

- (float)_pressedThreshold
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 72));
  else
    return 0.0;
}

- (uint64_t)_pressedValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  return result;
}

- (uint64_t)_valueDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 88);
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
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 88, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_pressedDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 96);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setPressedDidChangeHandler:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = result;
    v3 = (void *)MEMORY[0x2199DEBB0](a2);
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 96, 771);

    return v4;
  }
  return result;
}

- (float)_value
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 104));
  else
    return 0.0;
}

- (uint64_t)_setValue:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 104);
  return result;
}

- (double)_lastValueTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 112));
  else
    return 0.0;
}

- (uint64_t)_setLastValueTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 112);
  return result;
}

- (double)_lastPressedTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 120));
  else
    return 0.0;
}

- (uint64_t)_setLastPressedTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 120);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_11 = v6;
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
      if ((v7 & 0x10) == 0)
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
  if ((v7 & 0x10) == 0)
  {
LABEL_6:
    if ((v7 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_7:
    if ((v7 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("pressedDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_8:
    if ((v7 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("value"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("pressed"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0)
      return;
    goto LABEL_11;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueLatency"));
  if ((*(_WORD *)((_BYTE *)a3 + v8) & 0x200) == 0)
    return;
LABEL_11:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastPressedStateTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastPressedStateLatency"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  -[_GCDevicePhysicalInputElement postCommit:sender:](&v11, sel_postCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_11 = v6;
  }
  v7 = *(_WORD *)((char *)a3 + v6);
  v8 = v6;
  if ((v7 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sources"));
    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("analog"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_6:
    if ((v7 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_7:
    if ((v7 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("pressedDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_8:
    if ((v7 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("value"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("pressed"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueLatency"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x200) == 0)
  {
LABEL_11:
    if ((v7 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPressedStateTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPressedStateLatency"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0)
      return;
    goto LABEL_25;
  }
LABEL_22:
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))-[_GCDevicePhysicalInputButtonElement _valueDidChangeHandler]((uint64_t)self);
  if (v9)
  {
    -[_GCDevicePhysicalInputButtonElement value](self, "value");
    ((void (**)(_QWORD, _GCDevicePhysicalInputButtonElement *, _GCDevicePhysicalInputButtonElement *))v9)[2](v9, self, self);
  }

  if ((*(_WORD *)((_BYTE *)a3 + v8) & 0x100) != 0)
  {
LABEL_25:
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))-[_GCDevicePhysicalInputButtonElement _pressedDidChangeHandler]((uint64_t)self);
    if (v10)
      ((void (**)(_QWORD, _GCDevicePhysicalInputButtonElement *, _GCDevicePhysicalInputButtonElement *, BOOL))v10)[2](v10, self, self, -[_GCDevicePhysicalInputButtonElement isPressed](self, "isPressed"));

  }
}

- (GCTouchedStateInput)touchedInput
{
  return 0;
}

- (BOOL)isEqualToElement:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  _BOOL4 v12;
  char v13;
  float v14;
  float v15;
  _GCDevicePhysicalInputButtonElement *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  if (-[_GCDevicePhysicalInputElement isEqualToElement:](&v18, sel_isEqualToElement_, v6))
  {
    v7 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)self);
    v8 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)v6);
    if (v7 != v8)
    {
      v3 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)self);
      objc_msgSend(v6, "sources");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        v9 = 0;
        goto LABEL_22;
      }
    }
    if (self)
    {
      v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isAnalogSlot);
      v12 = v11 != 0;
      if (!v6)
      {
        if (v11)
          goto LABEL_20;
        v13 = 1;
LABEL_11:
        v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedThresholdSlot));
        if ((v13 & 1) == 0)
          goto LABEL_12;
        if (v14 != 0.0)
          goto LABEL_20;
        self = (_GCDevicePhysicalInputButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
LABEL_27:
        v16 = 0;
LABEL_16:
        v9 = self == v16;
        v10 = self == v16;
        goto LABEL_21;
      }
    }
    else
    {
      if (!v6)
      {
        self = 0;
        goto LABEL_27;
      }
      v12 = 0;
    }
    if (((v12 ^ (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 64) != 0)) & 1) != 0)
      goto LABEL_20;
    if (!self)
    {
      v14 = 0.0;
LABEL_12:
      v15 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 72));
      if (v14 == v15)
      {
        if (self)
          self = (_GCDevicePhysicalInputButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
        v16 = (_GCDevicePhysicalInputButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 80);
        goto LABEL_16;
      }
LABEL_20:
      v9 = 0;
      v10 = 0;
LABEL_21:
      if (v7 == v8)
      {
LABEL_23:

        goto LABEL_24;
      }
LABEL_22:

      v10 = v9;
      goto LABEL_23;
    }
    v13 = 0;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_24:

  return v10;
}

- (NSString)description
{
  void *v3;
  float v4;
  double v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  -[_GCDevicePhysicalInputElement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonElement value](self, "value");
  v5 = v4;
  v6 = -[_GCDevicePhysicalInputButtonElement isPressed](self, "isPressed");
  v7 = &stru_24D2B85A8;
  if (v6)
    v7 = CFSTR(" (pressed)");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Button '%@'; value = %f%@>"),
    v3,
    *(_QWORD *)&v5,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  float v9;
  double v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  -[_GCDevicePhysicalInputElement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputElement localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputElement sfSymbolsName](self, "sfSymbolsName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_GCDevicePhysicalInputButtonElement isAnalog](self, "isAnalog");
  if (self)
    v7 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
  else
    v7 = 0;
  if (v6)
    v8 = "YES";
  else
    v8 = "NO";
  -[_GCDevicePhysicalInputButtonElement value](self, "value");
  v10 = v9;
  v11 = -[_GCDevicePhysicalInputButtonElement isPressed](self, "isPressed");
  v12 = &stru_24D2B85A8;
  if (v11)
    v12 = CFSTR(" (pressed)");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Button %p '%@'; name = '%@', symbol = '%@', analog = %s, source = %zi, value = %f%@>"),
    self,
    v3,
    v4,
    v5,
    v8,
    v7,
    *(_QWORD *)&v10,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)valueDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputButtonElement _valueDidChangeHandler]((uint64_t)self);
}

- (void)setValueDidChangeHandler:(id)a3
{
  -[_GCDevicePhysicalInputButtonElement _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
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

  if (!dword_254DBE28C)
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo_3);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_3 / dword_254DBE28C)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  return (NSSet *)(id)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)self);
}

- (id)pressedDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputButtonElement _pressedDidChangeHandler]((uint64_t)self);
}

- (void)setPressedDidChangeHandler:(id)a3
{
  -[_GCDevicePhysicalInputButtonElement _setPressedDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isPressed
{
  _GCDevicePhysicalInputButtonElement *v2;
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

  if (!dword_254DBE294)
    mach_timebase_info((mach_timebase_info_t)&lastPressedStateLatency_sTimebaseInfo_0);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedTimestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time()
                * lastPressedStateLatency_sTimebaseInfo_0
                / dword_254DBE294)
       / 1000000000.0
       - v3;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  BOOL v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  _BOOL4 v20;
  _BOOL4 v21;
  float v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v24, sel_update_forGamepadEvent_withTimestamp_);
  v10 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_11 = v10;
  }
  v11 = v10;
  if (!self)
  {
    objc_msgSend(a4, "floatValueForElement:", 0);
    if (v23 == 0.0)
    {
      if (v23 <= 0.00000011921)
        return v9;
    }
    else
    {
      *(_WORD *)((char *)a3 + v11) |= 0xC0u;
      if (v23 <= 0.00000011921)
        return 1;
    }
    goto LABEL_10;
  }
  v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
  if (v12 != -1)
  {
    v13 = v12;
    v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
    objc_msgSend(a4, "floatValueForElement:", v13);
    v16 = v15;
    v17 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedThresholdSlot));
    v18 = v14 - v17;
    v19 = v16 - v17;
    if (v16 != v14)
    {
      v20 = v19 > 0.00000011921;
      v21 = v18 > 0.00000011921;
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v16), (uint64_t)&self->_valueSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_valueTimestampSlot);
      *(_WORD *)((char *)a3 + v11) |= 0xC0u;
      if (((v20 ^ v21) & 1) == 0)
        return 1;
      goto LABEL_9;
    }
    if (v19 > 0.00000011921 != v18 > 0.00000011921)
    {
LABEL_9:
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_pressedTimestampSlot);
LABEL_10:
      *(_WORD *)((char *)a3 + v11) |= 0x300u;
      return 1;
    }
  }
  return v9;
}

@end
