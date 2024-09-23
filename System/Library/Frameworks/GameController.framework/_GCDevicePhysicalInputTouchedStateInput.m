@implementation _GCDevicePhysicalInputTouchedStateInput

- (_GCDevicePhysicalInputTouchedStateInput)init
{
  -[_GCDevicePhysicalInputTouchedStateInput doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (_GCDevicePhysicalInputTouchedStateInput)initWithParameters:(id)a3
{
  _QWORD *v4;
  _GCDevicePhysicalInputTouchedStateInput *v5;
  _GCDevicePhysicalInputTouchedStateInput *v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  v5 = -[_GCDevicePhysicalInputView initWithParameters:](&v9, sel_initWithParameters_, v4);
  v6 = v5;
  if (v4)
    v7 = v4[1];
  else
    v7 = 0;
  -[_GCDevicePhysicalInputTouchedStateInput _setSources:]((uint64_t)v5, v7);

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, CFSTR("_GCDevicePhysicalInputTouchedStateInput.m"), 170, CFSTR("Invalid parameter not satisfying: %s"), "newValue != nil");

    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 24, 771);
  }
  return result;
}

- (_GCDevicePhysicalInputTouchedStateInput)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputTouchedStateInput *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputView initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[3], v10.receiver, v10.super_class);
  v7->_touchedChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[4]);
  v7->_touchedSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[5]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[6]);

  v7->_touchedTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputTouchedStateInput;
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
  void *v14;
  _BOOL4 v15;
  char v16;
  _BOOL8 v17;
  int v18;
  char v19;
  uint64_t v20;
  int v21;
  char v22;
  objc_super v24;

  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v24, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_1;
  if (MyUpdateContext_Offset_1 == -1)
  {
    v10 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_1 = v10;
  }
  v11 = v10;
  if ((v6 & 2) != 0)
  {
    v12 = (void *)-[_GCDevicePhysicalInputTouchedStateInput _sources]((uint64_t)a5);
    v13 = -[_GCDevicePhysicalInputTouchedStateInput _setSources:]((uint64_t)self, (uint64_t)v12);
    *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFE | v13;
    v9 |= v13;

    if ((v6 & 4) == 0)
    {
LABEL_5:
      if ((v6 & 8) == 0)
        return v9;
LABEL_12:
      if (a5)
      {
        v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 40) != 0;
        if (self)
          goto LABEL_14;
      }
      else
      {
        v17 = 0;
        if (self)
        {
LABEL_14:
          v18 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v17, (uint64_t)&self->_touchedSlot);
          if (v18)
            v19 = 4;
          else
            v19 = 0;
LABEL_17:
          *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFB | v19;
          if (a5)
          {
            v20 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 48);
            if (self)
              goto LABEL_19;
          }
          else
          {
            v20 = 0;
            if (self)
            {
LABEL_19:
              v21 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v20, (uint64_t)&self->_touchedTimestampSlot);
              if (v21)
                v22 = 8;
              else
                v22 = 0;
              goto LABEL_22;
            }
          }
          LOBYTE(v21) = 0;
          v22 = 0;
LABEL_22:
          *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xF7 | v22;
          return v9 | v21 | v18;
        }
      }
      LOBYTE(v18) = 0;
      v19 = 0;
      goto LABEL_17;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(a5, "_touchedDidChangeHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_GCDevicePhysicalInputTouchedStateInput _setTouchedDidChangeHandler:](self, "_setTouchedDidChangeHandler:", v14);
  if (v15)
    v16 = 2;
  else
    v16 = 0;
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFD | v16;
  v9 |= v15;

  if ((v6 & 8) != 0)
    goto LABEL_12;
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

- (BOOL)_touched
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 40) != 0;
  return result;
}

- (uint64_t)_setTouched:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 40);
  return result;
}

- (double)_lastTouchedTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 48));
  else
    return 0.0;
}

- (uint64_t)_setLastTouchedTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 48);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  char v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  -[_GCDevicePhysicalInputView preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_1;
  if (MyUpdateContext_Offset_1 == -1)
  {
    v6 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_1 = v6;
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
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("touchedDidChangeHandler"));
  v7 = *((_BYTE *)a3 + v8);
  if ((v7 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0)
      return;
    goto LABEL_7;
  }
LABEL_11:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("touched"));
  if ((*((_BYTE *)a3 + v8) & 8) == 0)
    return;
LABEL_7:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastTouchedStateTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastTouchedStateLatency"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v7;
  char v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  -[_GCDevicePhysicalInputView postCommit:sender:](&v11, sel_postCommit_sender_);
  v7 = MyUpdateContext_Offset_1;
  if (MyUpdateContext_Offset_1 == -1)
  {
    v7 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
    MyUpdateContext_Offset_1 = v7;
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
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + v7) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("touchedDidChangeHandler"));
  v8 = *((_BYTE *)a3 + v9);
  if ((v8 & 4) == 0)
  {
LABEL_6:
    if ((v8 & 8) == 0)
      goto LABEL_7;
    goto LABEL_12;
  }
LABEL_11:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("touched"));
  v8 = *((_BYTE *)a3 + v9);
  if ((v8 & 8) == 0)
  {
LABEL_7:
    if ((v8 & 4) == 0)
      return;
    goto LABEL_13;
  }
LABEL_12:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastTouchedStateTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastTouchedStateLatency"));
  if ((*((_BYTE *)a3 + v9) & 4) == 0)
    return;
LABEL_13:
  -[_GCDevicePhysicalInputTouchedStateInput touchedDidChangeHandler](self, "touchedDidChangeHandler");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v10)
    ((void (**)(_QWORD, id, _GCDevicePhysicalInputTouchedStateInput *, BOOL))v10)[2](v10, a4, self, -[_GCDevicePhysicalInputTouchedStateInput isTouched](self, "isTouched"));

}

- (uint64_t)isEqualToInput:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;

  v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)objc_opt_class();
      if (!objc_msgSend(v4, "isEqual:", objc_opt_class()))
        return 0;
      -[_GCDevicePhysicalInputView _objectValueForSlot:](v2, v2 + 24);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "sources");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_isEqualToInput_, v2, CFSTR("_GCDevicePhysicalInputTouchedStateInput.m"), 154, CFSTR("Invalid parameter not satisfying: %s"), "[otherElement isKindOfClass:_GCDevicePhysicalInputTouchedStateInput.class]");
      v2 = 0;
    }

  }
  return v2;
}

- (NSString)description
{
  _BOOL4 v2;
  const __CFString *v3;

  v2 = -[_GCDevicePhysicalInputTouchedStateInput isTouched](self, "isTouched");
  v3 = &stru_24D2B85A8;
  if (v2)
    v3 = CFSTR(" (touched)");
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<TouchedStateInput; %@>"), v3);
}

- (id)_touchedDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputView _objectValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedChangedHandlerSlot);
}

- (BOOL)_setTouchedDidChangeHandler:(id)a3
{
  void *v4;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  LOBYTE(self) = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v4, (uint64_t)&self->_touchedChangedHandlerSlot, 771);

  return (char)self;
}

- (uint64_t)__setTouched:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, a2, result + 40);
  return result;
}

- (uint64_t)__setLastTouchedTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 48);
  return result;
}

- (BOOL)isTouched
{
  if (self)
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedSlot) != 0;
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

  if (!dword_254DBDF14)
    mach_timebase_info((mach_timebase_info_t)&lastTouchedStateLatency_sTimebaseInfo);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedTimestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time()
                * lastTouchedStateLatency_sTimebaseInfo
                / dword_254DBDF14)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  return (NSSet *)(id)-[_GCDevicePhysicalInputTouchedStateInput _sources]((uint64_t)self);
}

- (uint64_t)update:(unsigned int)a3 withValue:(double)a4 timestamp:
{
  uint64_t v7;
  unsigned int v8;

  if (result)
  {
    v7 = result;
    v8 = MyUpdateContext_Offset_1;
    if (MyUpdateContext_Offset_1 == -1)
    {
      v8 = +[_GCDevicePhysicalInputView updateContextSize](_GCDevicePhysicalInputView, "updateContextSize");
      MyUpdateContext_Offset_1 = v8;
    }
    if ((-[_GCDevicePhysicalInputView _primitiveValueForSlot:](v7, v7 + 40) != 0) == a3)
    {
      return 0;
    }
    else
    {
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, a3, v7 + 40);
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, *(uint64_t *)&a4, v7 + 48);
      *(_BYTE *)(a2 + v8) |= 0xCu;
      return 1;
    }
  }
  return result;
}

@end
