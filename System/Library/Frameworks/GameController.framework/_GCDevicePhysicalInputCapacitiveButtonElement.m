@implementation _GCDevicePhysicalInputCapacitiveButtonElement

- (_GCDevicePhysicalInputCapacitiveButtonElement)initWithParameters:(id)a3
{
  _QWORD *v4;
  _GCDevicePhysicalInputCapacitiveButtonElement *v5;
  _GCDevicePhysicalInputCapacitiveButtonElement *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElement;
  v5 = -[_GCDevicePhysicalInputButtonElement initWithParameters:](&v9, sel_initWithParameters_, v4);
  v6 = v5;
  if (!v4)
  {
    v7 = 0;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = v4[8];
  if (v5)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_touchedValueFieldSlot);
LABEL_4:

  return v6;
}

- (uint64_t)_setTouchedValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 128);
  return result;
}

- (_GCDevicePhysicalInputCapacitiveButtonElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputCapacitiveButtonElement *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputButtonElement initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_touchedValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[16], v10.receiver, v10.super_class);
  v7->_touchedChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[17]);
  v7->_touchedValueSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[18]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[19]);

  v7->_touchedTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputCapacitiveButtonElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6;
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  int v15;
  char v16;
  float v17;
  double v18;
  int v19;
  char v20;
  uint64_t v21;
  int v22;
  char v23;
  objc_super v25;

  v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElement;
  v9 = -[_GCDevicePhysicalInputButtonElement update:forUsages:with:](&v25, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_7;
  if (MyUpdateContext_Offset_7 == -1)
  {
    v10 = +[_GCDevicePhysicalInputButtonElement updateContextSize](_GCDevicePhysicalInputButtonElement, "updateContextSize");
    MyUpdateContext_Offset_7 = v10;
  }
  v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
  if (a5)
  {
    v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 128);
    if (self)
    {
LABEL_9:
      v13 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v12, (uint64_t)&self->_touchedValueFieldSlot);
      goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
    if (self)
      goto LABEL_9;
  }
  v13 = 0;
LABEL_10:
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFE | v13;
  v9 |= v13;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      return v9;
LABEL_15:
    if (a5)
    {
      v17 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 144));
      v18 = v17;
      if (self)
        goto LABEL_17;
    }
    else
    {
      v18 = 0.0;
      if (self)
      {
LABEL_17:
        v19 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v18, (uint64_t)&self->_touchedValueSlot);
        if (v19)
          v20 = 4;
        else
          v20 = 0;
LABEL_20:
        *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFB | v20;
        if (a5)
        {
          v21 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 152);
          if (self)
            goto LABEL_22;
        }
        else
        {
          v21 = 0;
          if (self)
          {
LABEL_22:
            v22 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v21, (uint64_t)&self->_touchedTimestampSlot);
            if (v22)
              v23 = 8;
            else
              v23 = 0;
            goto LABEL_25;
          }
        }
        LOBYTE(v22) = 0;
        v23 = 0;
LABEL_25:
        *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xF7 | v23;
        return v9 | v22 | v19;
      }
    }
    LOBYTE(v19) = 0;
    v20 = 0;
    goto LABEL_20;
  }
LABEL_11:
  v14 = (void *)-[_GCDevicePhysicalInputCapacitiveButtonElement _touchedDidChangeHandler]((uint64_t)a5);
  v15 = -[_GCDevicePhysicalInputCapacitiveButtonElement _setTouchedDidChangeHandler:]((uint64_t)self, (uint64_t)v14);
  if (v15)
    v16 = 2;
  else
    v16 = 0;
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFD | v16;
  v9 |= v15;

  if ((v6 & 8) != 0)
    goto LABEL_15;
  return v9;
}

- (uint64_t)_touchedValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 128);
  return result;
}

- (uint64_t)_touchedDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 136);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setTouchedDidChangeHandler:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = result;
    v3 = (void *)MEMORY[0x2199DEBB0](a2);
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 136, 771);

    return v4;
  }
  return result;
}

- (float)_touchedValue
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 144));
  else
    return 0.0;
}

- (uint64_t)_setTouchedValue:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 144);
  return result;
}

- (double)_lastTouchedTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 152));
  else
    return 0.0;
}

- (uint64_t)_setLastTouchedTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 152);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElement;
  -[_GCDevicePhysicalInputButtonElement preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_7;
  if (MyUpdateContext_Offset_7 == -1)
  {
    v6 = +[_GCDevicePhysicalInputButtonElement updateContextSize](_GCDevicePhysicalInputButtonElement, "updateContextSize");
    MyUpdateContext_Offset_7 = v6;
  }
  v7 = *((_BYTE *)a3 + v6);
  v8 = v6;
  if ((v7 & 2) != 0)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("touchedDidChangeHandler"));
    v7 = *((_BYTE *)a3 + v8);
    if ((v7 & 4) == 0)
    {
LABEL_5:
      if ((v7 & 8) == 0)
        return;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)a3 + v6) & 4) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("touched"));
  if ((*((_BYTE *)a3 + v8) & 8) == 0)
    return;
LABEL_6:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastTouchedStateTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastTouchedStateLatency"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElement;
  -[_GCDevicePhysicalInputButtonElement postCommit:sender:](&v10, sel_postCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_7;
  if (MyUpdateContext_Offset_7 == -1)
  {
    v6 = +[_GCDevicePhysicalInputButtonElement updateContextSize](_GCDevicePhysicalInputButtonElement, "updateContextSize");
    MyUpdateContext_Offset_7 = v6;
  }
  v7 = *((_BYTE *)a3 + v6);
  v8 = v6;
  if ((v7 & 2) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("touchedDidChangeHandler"));
    v7 = *((_BYTE *)a3 + v8);
    if ((v7 & 4) == 0)
    {
LABEL_5:
      if ((v7 & 8) == 0)
        goto LABEL_6;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)a3 + v6) & 4) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("touched"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_6:
    if ((v7 & 4) == 0)
      return;
    goto LABEL_11;
  }
LABEL_10:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastTouchedStateTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastTouchedStateLatency"));
  if ((*((_BYTE *)a3 + v8) & 4) == 0)
    return;
LABEL_11:
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))-[_GCDevicePhysicalInputCapacitiveButtonElement _touchedDidChangeHandler]((uint64_t)self);
  if (v9)
    ((void (**)(_QWORD, _GCDevicePhysicalInputCapacitiveButtonElement *, _GCDevicePhysicalInputCapacitiveButtonElement *, BOOL))v9)[2](v9, self, self, -[_GCDevicePhysicalInputCapacitiveButtonElement isTouched](self, "isTouched"));

}

- (BOOL)isEqualToElement:(id)a3
{
  id v4;
  _GCDevicePhysicalInputCapacitiveButtonElement *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElement;
  if (-[_GCDevicePhysicalInputButtonElement isEqualToElement:](&v8, sel_isEqualToElement_, v4))
  {
    if (self)
      self = (_GCDevicePhysicalInputCapacitiveButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedValueFieldSlot);
    if (v4)
      v5 = (_GCDevicePhysicalInputCapacitiveButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v4, (uint64_t)v4 + 128);
    else
      v5 = 0;
    v6 = self == v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)touchedDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputCapacitiveButtonElement _touchedDidChangeHandler]((uint64_t)self);
}

- (void)setTouchedDidChangeHandler:(id)a3
{
  -[_GCDevicePhysicalInputCapacitiveButtonElement _setTouchedDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
}

- (BOOL)isTouched
{
  float v2;

  if (self)
  {
    v2 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedValueSlot));
    LOBYTE(self) = v2 > 0.00000011921;
  }
  return (char)self;
}

- (double)lastTouchedStateTimestamp
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedTimestampSlot));
  else
    return 0.0;
}

- (double)lastTouchedStateLatency
{
  double v3;

  if (!dword_254DBE0CC)
    mach_timebase_info((mach_timebase_info_t)&lastTouchedStateLatency_sTimebaseInfo_0);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedTimestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time()
                * lastTouchedStateLatency_sTimebaseInfo_0
                / dword_254DBE0CC)
       / 1000000000.0
       - v3;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  BOOL v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  _BOOL4 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElement;
  v9 = -[_GCDevicePhysicalInputButtonElement update:forGamepadEvent:withTimestamp:](&v17, sel_update_forGamepadEvent_withTimestamp_);
  v10 = MyUpdateContext_Offset_7;
  if (MyUpdateContext_Offset_7 == -1)
  {
    v10 = +[_GCDevicePhysicalInputButtonElement updateContextSize](_GCDevicePhysicalInputButtonElement, "updateContextSize");
    MyUpdateContext_Offset_7 = v10;
  }
  if (self)
  {
    v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedValueFieldSlot);
    if (v11 == -1)
      return v9;
    v12 = v11;
    v13 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedValueSlot));
  }
  else
  {
    v12 = 0;
    v13 = 0.0;
  }
  objc_msgSend(a4, "floatValueForElement:", v12);
  if (v14 != v13)
  {
    if (!self)
    {
      if (v13 > 0.00000011921 == v14 > 0.00000011921)
        return 1;
      goto LABEL_13;
    }
    v15 = v14 > 0.00000011921;
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v14), (uint64_t)&self->_touchedValueSlot);
    if ((((v13 > 0.00000011921) ^ v15) & 1) == 0)
      return 1;
    goto LABEL_12;
  }
  if (v13 > 0.00000011921 != v14 > 0.00000011921)
  {
    if (!self)
    {
LABEL_13:
      *((_BYTE *)a3 + v10) |= 0xCu;
      return 1;
    }
LABEL_12:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_touchedTimestampSlot);
    goto LABEL_13;
  }
  return v9;
}

@end
