@implementation GCSteeringWheelElement

- (GCSteeringWheelElement)initWithParameters:(id)a3
{
  float *v4;
  GCSteeringWheelElement *v5;
  void *v6;
  double v7;
  uint64_t v8;
  objc_super v10;

  v4 = (float *)a3;
  v10.receiver = self;
  v10.super_class = (Class)GCSteeringWheelElement;
  v5 = -[_GCDevicePhysicalInputElement initWithParameters:](&v10, sel_initWithParameters_, v4);
  -[_GCSteeringWheelElementParameters sources](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCSteeringWheelElement _setSources:]((uint64_t)v5, (uint64_t)v6);

  if (v4)
  {
    v7 = v4[10];
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0.0;
  if (v5)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, *(uint64_t *)&v7, (uint64_t)&v5->_maximumDegreesOfRotationSlot);
LABEL_4:
  if (!v4)
  {
    v8 = 0;
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = *((_QWORD *)v4 + 7);
  if (v5)
LABEL_6:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v8, (uint64_t)&v5->_rotationValueFieldSlot);
LABEL_7:

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, CFSTR("GCSteeringWheelElement.m"), 217, CFSTR("Invalid parameter not satisfying: %s"), "newValue != nil");

    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 56, 771);
  }
  return result;
}

- (uint64_t)_setMaximumDegreesOfRotation:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 64);
  return result;
}

- (uint64_t)_setRotationValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  return result;
}

- (GCSteeringWheelElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  GCSteeringWheelElement *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCSteeringWheelElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputElement initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v10.receiver, v10.super_class);
  v7->_maximumDegreesOfRotationSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[8]);
  v7->_rotationValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[9]);
  v7->_valueChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[10]);
  v7->_deltaChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[11]);
  v7->_valueSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[12]);
  v7->_deltaSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[13]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[14]);

  v7->_timestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___GCSteeringWheelElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6;
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  char v13;
  float v14;
  double v15;
  int v16;
  char v17;
  uint64_t v18;
  int v19;
  char v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  int v25;
  char v26;
  float v27;
  double v28;
  int v29;
  char v30;
  float v31;
  double v32;
  int v33;
  char v34;
  uint64_t v35;
  int v36;
  char v37;
  objc_super v39;

  v6 = a4;
  v39.receiver = self;
  v39.super_class = (Class)GCSteeringWheelElement;
  v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v39, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_6 = v10;
  }
  v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
  v12 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)a5);
  v13 = -[GCSteeringWheelElement _setSources:]((uint64_t)self, (uint64_t)v12);
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFE | v13;

  if (a5)
  {
    v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64));
    v15 = v14;
    if (self)
      goto LABEL_9;
LABEL_44:
    LOBYTE(v16) = 0;
    v17 = 0;
    goto LABEL_12;
  }
  v15 = 0.0;
  if (!self)
    goto LABEL_44;
LABEL_9:
  v16 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v15, (uint64_t)&self->_maximumDegreesOfRotationSlot);
  if (v16)
    v17 = 2;
  else
    v17 = 0;
LABEL_12:
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFD | v17;
  if (a5)
  {
    v18 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
    if (self)
      goto LABEL_14;
LABEL_46:
    LOBYTE(v19) = 0;
    v20 = 0;
    goto LABEL_17;
  }
  v18 = 0;
  if (!self)
    goto LABEL_46;
LABEL_14:
  v19 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v18, (uint64_t)&self->_rotationValueFieldSlot);
  if (v19)
    v20 = 4;
  else
    v20 = 0;
LABEL_17:
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFB | v20;
  v9 |= v13 | v16 | v19;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      return v9;
LABEL_25:
    if (a5)
    {
      v27 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 96));
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
        *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xDF | v30;
        if (a5)
        {
          v31 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 104));
          v32 = v31;
          if (self)
            goto LABEL_32;
        }
        else
        {
          v32 = 0.0;
          if (self)
          {
LABEL_32:
            v33 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v32, (uint64_t)&self->_deltaSlot);
            if (v33)
              v34 = 64;
            else
              v34 = 0;
LABEL_35:
            *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xBF | v34;
            if (a5)
              v35 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
            else
              v35 = 0;
            if (self)
            {
              v36 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v35, (uint64_t)&self->_timestampSlot);
              if (v36)
                v37 = 0x80;
              else
                v37 = 0;
            }
            else
            {
              LOBYTE(v36) = 0;
              v37 = 0;
            }
            *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0x7F | v37;
            return v9 | v36 | v29 | v33;
          }
        }
        LOBYTE(v33) = 0;
        v34 = 0;
        goto LABEL_35;
      }
    }
    LOBYTE(v29) = 0;
    v30 = 0;
    goto LABEL_30;
  }
LABEL_18:
  v21 = (void *)-[GCSteeringWheelElement _valueDidChangeHandler]((uint64_t)a5);
  v22 = -[GCSteeringWheelElement _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v21);
  if (v22)
    v23 = 8;
  else
    v23 = 0;
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xF7 | v23;

  v24 = (void *)-[GCSteeringWheelElement _deltaDidChangeHandler]((uint64_t)a5);
  v25 = -[GCSteeringWheelElement _setDeltaDidChangeHandler:]((uint64_t)self, (uint64_t)v24);
  if (v25)
    v26 = 16;
  else
    v26 = 0;
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xEF | v26;
  v9 |= v22 | v25;

  if ((v6 & 8) != 0)
    goto LABEL_25;
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

- (float)_maximumDegreesOfRotation
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64));
  else
    return 0.0;
}

- (uint64_t)_rotationValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72);
  return result;
}

- (uint64_t)_valueDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 80);
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
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 80, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_deltaDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 88);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setDeltaDidChangeHandler:(uint64_t)result
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

- (float)_value
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 96));
  else
    return 0.0;
}

- (uint64_t)_setValue:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 96);
  return result;
}

- (float)_delta
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 104));
  else
    return 0.0;
}

- (uint64_t)_setDelta:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 104);
  return result;
}

- (double)_lastTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 112));
  else
    return 0.0;
}

- (uint64_t)_setLastTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 112);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GCSteeringWheelElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_6 = v6;
  }
  v7 = *((_BYTE *)a3 + v6);
  v8 = v6;
  if ((v7 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("sources"));
    v7 = *((_BYTE *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 8) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("maximumDegreesOfRotation"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_6:
    if ((v7 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("deltaDidChangeHandler"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_8:
    if ((v7 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("value"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0)
      return;
LABEL_17:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastDeltaTimestamp"));
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueLatency"));
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastDeltaLatency"));
    return;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("delta"));
  if ((*((_BYTE *)a3 + v8) & 0x80) != 0)
    goto LABEL_17;
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, __n128);
  __n128 v10;
  double v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, __n128);
  __n128 v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GCSteeringWheelElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v15, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_6 = v6;
  }
  v7 = *((_BYTE *)a3 + v6);
  v8 = v6;
  if ((v7 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sources"));
    v7 = *((_BYTE *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 8) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("maximumDegreesOfRotation"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_6:
    if ((v7 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("deltaDidChangeHandler"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_8:
    if ((v7 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("value"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("delta"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastDeltaTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueLatency"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastDeltaLatency"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    if ((v7 & 0x40) == 0)
      return;
    goto LABEL_25;
  }
LABEL_20:
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, __n128))-[GCSteeringWheelElement _valueDidChangeHandler]((uint64_t)self);
  if (v9)
  {
    if (self)
    {
      v11 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
      v10.n128_u32[1] = HIDWORD(v11);
      v10.n128_f32[0] = v11;
    }
    else
    {
      v10.n128_u32[0] = 0;
    }
    ((void (**)(_QWORD, GCSteeringWheelElement *, GCSteeringWheelElement *, __n128))v9)[2](v9, self, self, v10);
  }

  if ((*((_BYTE *)a3 + v8) & 0x40) != 0)
  {
LABEL_25:
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, __n128))-[GCSteeringWheelElement _deltaDidChangeHandler]((uint64_t)self);
    if (v12)
    {
      if (self)
      {
        v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_deltaSlot));
        v13.n128_u32[1] = HIDWORD(v14);
        v13.n128_f32[0] = v14;
      }
      else
      {
        v13.n128_u32[0] = 0;
      }
      ((void (**)(_QWORD, GCSteeringWheelElement *, GCSteeringWheelElement *, __n128))v12)[2](v12, self, self, v13);
    }

  }
}

- (BOOL)isEqualToElement:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  float v10;
  float v11;
  GCSteeringWheelElement *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GCSteeringWheelElement;
  if (-[_GCDevicePhysicalInputElement isEqualToElement:](&v14, sel_isEqualToElement_, v6))
  {
    v7 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)self);
    v8 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)v6);
    if (v7 == v8
      || (v3 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)self),
          objc_msgSend(v6, "sources"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v10 = 0.0;
      v11 = 0.0;
      if (self)
        v11 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_maximumDegreesOfRotationSlot));
      if (v6)
        v10 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 64));
      if (v11 == v10)
      {
        if (self)
          self = (GCSteeringWheelElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rotationValueFieldSlot);
        if (v6)
          v12 = (GCSteeringWheelElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 72);
        else
          v12 = 0;
        v9 = self == v12;
      }
      else
      {
        v9 = 0;
      }
      if (v7 == v8)
        goto LABEL_19;
    }
    else
    {
      v9 = 0;
    }

LABEL_19:
    goto LABEL_20;
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (NSString)description
{
  void *v3;
  float v4;
  void *v5;

  -[_GCDevicePhysicalInputElement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCSteeringWheelElement value](self, "value");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Steering Wheel '%@'; value = %f>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  float v7;
  double v8;
  float v9;
  void *v10;

  -[_GCDevicePhysicalInputElement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputElement localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputElement sfSymbolsName](self, "sfSymbolsName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v6 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rotationValueFieldSlot);
  else
    v6 = 0;
  -[GCSteeringWheelElement value](self, "value");
  v8 = v7;
  -[GCSteeringWheelElement delta](self, "delta");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Steering Wheel %p '%@'; name = '%@', symbol = '%@', source = %zi, value = %f (%f)>"),
    self,
    v3,
    v4,
    v5,
    v6,
    *(_QWORD *)&v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (float)maximumDegreesOfRotation
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_maximumDegreesOfRotationSlot));
  else
    return 0.0;
}

- (id)valueDidChangeHandler
{
  return (id)-[GCSteeringWheelElement _valueDidChangeHandler]((uint64_t)self);
}

- (void)setValueDidChangeHandler:(id)a3
{
  -[GCSteeringWheelElement _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
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
  return 1;
}

- (BOOL)canWrap
{
  return 0;
}

- (double)lastValueTimestamp
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  else
    return 0.0;
}

- (double)lastValueLatency
{
  double v3;

  if (!dword_254DBE0C4)
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo_2);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_2 / dword_254DBE0C4)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  return (NSSet *)(id)-[GCSteeringWheelElement _sources]((uint64_t)self);
}

- (id)deltaDidChangeHandler
{
  return (id)-[GCSteeringWheelElement _deltaDidChangeHandler]((uint64_t)self);
}

- (void)setDeltaDidChangeHandler:(id)a3
{
  -[GCSteeringWheelElement _setDeltaDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
}

- (float)delta
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_deltaSlot));
  else
    return 0.0;
}

- (double)lastDeltaTimestamp
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  else
    return 0.0;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  BOOL v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GCSteeringWheelElement;
  v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v18, sel_update_forGamepadEvent_withTimestamp_);
  v10 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_6 = v10;
    if (self)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(a4, "floatValueForElement:", 0);
    if (v17 == 0.0)
      return v9;
    goto LABEL_6;
  }
  if (!self)
    goto LABEL_9;
LABEL_3:
  v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rotationValueFieldSlot);
  if (v11 != -1)
  {
    v12 = v11;
    v13 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
    objc_msgSend(a4, "floatValueForElement:", v12);
    if (v14 != v13)
    {
      v15 = v14 - v13;
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v14), (uint64_t)&self->_valueSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v15), (uint64_t)&self->_deltaSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_timestampSlot);
LABEL_6:
      *((_BYTE *)a3 + v10) |= 0xE0u;
      return 1;
    }
  }
  return v9;
}

@end
