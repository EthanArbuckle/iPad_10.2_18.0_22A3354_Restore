@implementation GCCursorElement

- (GCCursorElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  GCCursorElement *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCCursorElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputElement initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_positionChangedHandlerSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[7], v10.receiver, v10.super_class);
  v7->_xDeltaSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[8]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[9]);

  v7->_yDeltaSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___GCCursorElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6;
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  double v14;
  double v15;
  int v16;
  char v17;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GCCursorElement;
  v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v19, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_12 = v10;
  }
  v11 = v10;
  if ((v6 & 4) != 0)
  {
    -[GCCursorElement _positionDidChangeHandler](a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GCCursorElement _setPositionDidChangeHandler:](self, "_setPositionDidChangeHandler:", v12);
    *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFE | v13;
    v9 |= v13;

  }
  if ((v6 & 8) != 0)
  {
    v14 = -[GCCursorElement _positionDelta]((uint64_t)a5);
    v16 = -[GCCursorElement _setPositionDelta:]((uint64_t)self, v14, v15);
    if (v16)
      v17 = 2;
    else
      v17 = 0;
    *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFD | v17;
    v9 |= v16;
  }
  return v9;
}

- (id)_positionDidChangeHandler
{
  if (a1)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:]((uint64_t)a1, (uint64_t)a1 + 56);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (double)_positionDelta
{
  uint64_t v2;

  if (a1)
  {
    v2 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64);
    -[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 72);
  }
  else
  {
    v2 = 0;
  }
  return *(double *)&v2;
}

- (uint64_t)_setPositionDelta:(double)a3
{
  uint64_t v4;

  if (result)
  {
    v4 = result;
    if ((-[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 64) & 1) != 0)
      return 1;
    else
      return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](v4, *(uint64_t *)&a3, v4 + 72);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCCursorElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v8, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_12 = v6;
  }
  if ((*((_BYTE *)a3 + v6) & 1) != 0)
  {
    v7 = v6;
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("positionDidChangeHandler"));
    if ((*((_BYTE *)a3 + v7) & 2) == 0)
      return;
  }
  else if ((*((_BYTE *)a3 + v6) & 2) == 0)
  {
    return;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("delta"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, double);
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCCursorElement;
  -[_GCDevicePhysicalInputElement postCommit:sender:](&v10, sel_postCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_12 = v6;
  }
  v7 = v6;
  if ((*((_BYTE *)a3 + v6) & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("positionDidChangeHandler"));
    if ((*((_BYTE *)a3 + v7) & 2) == 0)
      return;
  }
  else if ((*((_BYTE *)a3 + v6) & 2) == 0)
  {
    return;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("delta"));
  if ((*((_BYTE *)a3 + v7) & 2) != 0)
  {
    -[GCCursorElement _positionDidChangeHandler](self);
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GCCursorElement _positionDelta]((uint64_t)self);
      ((void (**)(_QWORD, GCCursorElement *, GCCursorElement *, double))v8)[2](v8, self, self, v9);
    }

  }
}

- (BOOL)_setPositionDidChangeHandler:(id)a3
{
  void *v4;

  v4 = (void *)MEMORY[0x2199DEBB0](a3, a2);
  LOBYTE(self) = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v4, (uint64_t)&self->_positionChangedHandlerSlot, 771);

  return (char)self;
}

- (BOOL)update:(void *)a3 forMouseEvent:(id *)a4 withTimestamp:(double)a5
{
  BOOL v8;
  unsigned int v9;
  $3C3C88D340918173D1E671A9391FDEED v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCCursorElement;
  v11 = *a4;
  v8 = -[_GCDevicePhysicalInputElement update:forMouseEvent:withTimestamp:](&v12, sel_update_forMouseEvent_withTimestamp_, a3, &v11, a5);
  v9 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    v9 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_12 = v9;
  }
  if (a4->var1 == 1
    && -[GCCursorElement _setPositionDelta:]((uint64_t)self, a4->var2.var0.var0, a4->var2.var0.var1))
  {
    *((_BYTE *)a3 + v9) |= 2u;
    return 1;
  }
  return v8;
}

@end
