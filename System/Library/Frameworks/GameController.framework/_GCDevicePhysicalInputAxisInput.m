@implementation _GCDevicePhysicalInputAxisInput

- (_GCDevicePhysicalInputAxisInput)init
{
  -[_GCDevicePhysicalInputAxisInput doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_GCDevicePhysicalInputAxisInput)initWithParameters:(id)a3
{
  _QWORD *v4;
  _GCDevicePhysicalInputAxisInput *v5;
  _GCDevicePhysicalInputAxisInput *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  v5 = -[_GCDevicePhysicalInputView initWithParameters:](&v10, sel_initWithParameters_, v4);
  v6 = v5;
  if (v4)
  {
    -[_GCDevicePhysicalInputAxisInput _setSources:]((uint64_t)v5, v4[2]);
    v7 = *((unsigned __int8 *)v4 + 8);
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[_GCDevicePhysicalInputAxisInput _setSources:]((uint64_t)v5, 0);
  v7 = 0;
  if (v6)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v7, (uint64_t)&v6->_isAnalogSlot);
LABEL_4:
  if (!v4)
  {
    v8 = 0;
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = *((unsigned __int8 *)v4 + 9);
  if (v6)
LABEL_6:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v8, (uint64_t)&v6->_canWrapSlot);
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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, CFSTR("_GCDevicePhysicalInputAxisInput.m"), 181, CFSTR("Invalid parameter not satisfying: %s"), "newValue != nil");

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

- (uint64_t)_setCanWrap:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 40);
  return result;
}

- (_GCDevicePhysicalInputAxisInput)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputAxisInput *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputView initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[3], v10.receiver, v10.super_class);
  v7->_isAnalogSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[4]);
  v7->_canWrapSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[5]);
  v7->_valueChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[6]);
  v7->_valueSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[7]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[8]);

  v7->_valueTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputAxisInput;
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
  _BOOL8 v14;
  int v15;
  char v16;
  _BOOL8 v17;
  int v18;
  char v19;
  void *v20;
  int v21;
  char v22;
  float v23;
  double v24;
  int v25;
  char v26;
  uint64_t v27;
  int v28;
  char v29;
  objc_super v31;

  v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v31, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_4;
  if (MyUpdateContext_Offset_4 == -1)
  {
    v10 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_4 = v10;
  }
  v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
  v12 = (void *)-[_GCDevicePhysicalInputAxisInput _sources]((uint64_t)a5);
  v13 = -[_GCDevicePhysicalInputAxisInput _setSources:]((uint64_t)self, (uint64_t)v12);
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFE | v13;

  if (a5)
  {
    v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 32) != 0;
    if (self)
      goto LABEL_9;
LABEL_35:
    LOBYTE(v15) = 0;
    v16 = 0;
    goto LABEL_12;
  }
  v14 = 0;
  if (!self)
    goto LABEL_35;
LABEL_9:
  v15 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v14, (uint64_t)&self->_isAnalogSlot);
  if (v15)
    v16 = 2;
  else
    v16 = 0;
LABEL_12:
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFD | v16;
  if (a5)
  {
    v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 40) != 0;
    if (self)
      goto LABEL_14;
LABEL_37:
    LOBYTE(v18) = 0;
    v19 = 0;
    goto LABEL_17;
  }
  v17 = 0;
  if (!self)
    goto LABEL_37;
LABEL_14:
  v18 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v17, (uint64_t)&self->_canWrapSlot);
  if (v18)
    v19 = 4;
  else
    v19 = 0;
LABEL_17:
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFB | v19;
  v9 |= v13 | v15 | v18;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      return v9;
LABEL_22:
    if (a5)
    {
      v23 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 56));
      v24 = v23;
      if (self)
        goto LABEL_24;
    }
    else
    {
      v24 = 0.0;
      if (self)
      {
LABEL_24:
        v25 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v24, (uint64_t)&self->_valueSlot);
        if (v25)
          v26 = 16;
        else
          v26 = 0;
LABEL_27:
        *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xEF | v26;
        if (a5)
        {
          v27 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64);
          if (self)
            goto LABEL_29;
        }
        else
        {
          v27 = 0;
          if (self)
          {
LABEL_29:
            v28 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v27, (uint64_t)&self->_valueTimestampSlot);
            if (v28)
              v29 = 32;
            else
              v29 = 0;
            goto LABEL_32;
          }
        }
        LOBYTE(v28) = 0;
        v29 = 0;
LABEL_32:
        *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xDF | v29;
        return v9 | v28 | v25;
      }
    }
    LOBYTE(v25) = 0;
    v26 = 0;
    goto LABEL_27;
  }
LABEL_18:
  v20 = (void *)-[_GCDevicePhysicalInputAxisInput _valueDidChangeHandler]((uint64_t)a5);
  v21 = -[_GCDevicePhysicalInputAxisInput _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v20);
  if (v21)
    v22 = 8;
  else
    v22 = 0;
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xF7 | v22;
  v9 |= v21;

  if ((v6 & 8) != 0)
    goto LABEL_22;
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

- (BOOL)_canWrap
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 40) != 0;
  return result;
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
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 56));
  else
    return 0.0;
}

- (uint64_t)_setValue:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 56);
  return result;
}

- (double)_lastValueTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64));
  else
    return 0.0;
}

- (uint64_t)_setLastValueTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 64);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  -[_GCDevicePhysicalInputView preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_4;
  if (MyUpdateContext_Offset_4 == -1)
  {
    v6 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_4 = v6;
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
      if ((v7 & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("analog"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("canWrap"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_7:
    if ((v7 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_8:
    if ((v7 & 0x20) == 0)
      return;
    goto LABEL_9;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("value"));
  if ((*((_BYTE *)a3 + v8) & 0x20) == 0)
    return;
LABEL_9:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastValueLatency"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v7;
  char v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, __n128);
  __n128 v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  -[_GCDevicePhysicalInputView preCommit:sender:](&v13, sel_preCommit_sender_);
  v7 = MyUpdateContext_Offset_4;
  if (MyUpdateContext_Offset_4 == -1)
  {
    v7 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_4 = v7;
  }
  v8 = *((_BYTE *)a3 + v7);
  v9 = v7;
  if ((v8 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sources"));
    v8 = *((_BYTE *)a3 + v9);
    if ((v8 & 2) == 0)
    {
LABEL_5:
      if ((v8 & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + v7) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("analog"));
  v8 = *((_BYTE *)a3 + v9);
  if ((v8 & 4) == 0)
  {
LABEL_6:
    if ((v8 & 8) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("canWrap"));
  v8 = *((_BYTE *)a3 + v9);
  if ((v8 & 8) == 0)
  {
LABEL_7:
    if ((v8 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("valueDidChangeHandler"));
  v8 = *((_BYTE *)a3 + v9);
  if ((v8 & 0x10) == 0)
  {
LABEL_8:
    if ((v8 & 0x20) == 0)
      goto LABEL_9;
LABEL_16:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueTimestamp"));
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastValueLatency"));
    if ((*((_BYTE *)a3 + v9) & 0x10) == 0)
      return;
    goto LABEL_17;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("value"));
  v8 = *((_BYTE *)a3 + v9);
  if ((v8 & 0x20) != 0)
    goto LABEL_16;
LABEL_9:
  if ((v8 & 0x10) == 0)
    return;
LABEL_17:
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, __n128))-[_GCDevicePhysicalInputAxisInput _valueDidChangeHandler]((uint64_t)self);
  if (v10)
  {
    if (self)
    {
      v12 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
      v11.n128_u32[1] = HIDWORD(v12);
      v11.n128_f32[0] = v12;
    }
    else
    {
      v11.n128_u32[0] = 0;
    }
    ((void (**)(_QWORD, id, _GCDevicePhysicalInputAxisInput *, __n128))v10)[2](v10, a4, self, v11);
  }

}

- (uint64_t)isEqualToInput:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_isEqualToInput_, v2, CFSTR("_GCDevicePhysicalInputAxisInput.m"), 168, CFSTR("Invalid parameter not satisfying: %s"), "[otherElement isKindOfClass:_GCDevicePhysicalInputAxisInput.class]");
      v2 = 0;
      goto LABEL_12;
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
          if ((v7 != 0) != (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 32) != 0))
            goto LABEL_7;
          v8 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 40);
          v9 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 40) != 0;
        }
        else
        {
          if (v7)
            goto LABEL_7;
          v8 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 40);
          v9 = 0;
        }
        v2 = (v8 == 0) ^ v9;
        goto LABEL_11;
      }
LABEL_7:
      v2 = 0;
LABEL_11:

LABEL_12:
      return v2;
    }
    return 0;
  }
  return v2;
}

- (uint64_t)__setValue:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 56);
  return result;
}

- (uint64_t)__setLastValueTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 64);
  return result;
}

- (id)valueDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputAxisInput _valueDidChangeHandler]((uint64_t)self);
}

- (void)setValueDidChangeHandler:(id)a3
{
  -[_GCDevicePhysicalInputAxisInput _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
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
  if (self)
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_canWrapSlot) != 0;
  return (char)self;
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

  if (!dword_254DBDFE4)
  {
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo_0);
    if (self)
      goto LABEL_3;
LABEL_6:
    v3 = 0.0;
    return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_0 / dword_254DBDFE4)
         / 1000000000.0
         - v3;
  }
  if (!self)
    goto LABEL_6;
LABEL_3:
  v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_0 / dword_254DBDFE4)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  return (NSSet *)(id)-[_GCDevicePhysicalInputAxisInput _sources]((uint64_t)self);
}

- (uint64_t)update:(float)a3 withValue:(double)a4 timestamp:
{
  uint64_t v7;
  unsigned int v8;
  float v9;

  if (result)
  {
    v7 = result;
    v8 = MyUpdateContext_Offset_4;
    if (MyUpdateContext_Offset_4 == -1)
    {
      v8 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
      MyUpdateContext_Offset_4 = v8;
    }
    v9 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](v7, v7 + 56));
    if (v9 == a3)
    {
      return 0;
    }
    else
    {
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, COERCE__INT64(a3), v7 + 56);
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, *(uint64_t *)&a4, v7 + 64);
      *(_BYTE *)(a2 + v8) |= 0x30u;
      return 1;
    }
  }
  return result;
}

@end
