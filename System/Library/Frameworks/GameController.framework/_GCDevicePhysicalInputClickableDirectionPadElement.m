@implementation _GCDevicePhysicalInputClickableDirectionPadElement

- (_GCDevicePhysicalInputClickableDirectionPadElement)initWithParameters:(id)a3
{
  _QWORD *v4;
  _GCDevicePhysicalInputClickableDirectionPadElement *v5;
  _GCDevicePhysicalInputClickableDirectionPadElement *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  _GCDevicePhysicalInputButtonInput *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  v5 = -[_GCDevicePhysicalInputDirectionPadElement initWithParameters:](&v12, sel_initWithParameters_, v4);
  v6 = v5;
  if (!v4)
  {
    v7 = 0;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = v4[18];
  if (v5)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_pressedValueFieldSlot);
LABEL_4:
  v8 = (void *)objc_opt_new();
  -[_GCDevicePhysicalInputButtonInputParameters setAnalog:]((uint64_t)v8, 0);
  -[_GCDevicePhysicalInputButtonInputParameters setPressedThreshold:]((uint64_t)v8, 0.0);
  -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](v4);
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v8, v9);

  v10 = -[_GCDevicePhysicalInputButtonInput initWithParameters:]([_GCDevicePhysicalInputButtonInput alloc], "initWithParameters:", v8);
  v6->_pressedInputSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v10);

  return v6;
}

- (uint64_t)_setPressedValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 144);
  return result;
}

- (_GCDevicePhysicalInputClickableDirectionPadElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputClickableDirectionPadElement *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputDirectionPadElement initWithTemplate:context:](&v11, sel_initWithTemplate_context_, v6, v5);
  v7->_pressedValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[18], v11.receiver, v11.super_class);
  v8 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)v6);

  v9 = objc_msgSend(v5, "view:makeReferenceToView:", v7, v8);
  v7->_pressedInputSlot = v9;

  return v7;
}

- (uint64_t)_pressedInput
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 152);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

+ (unsigned)updateContextSize
{
  unsigned __int16 v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputClickableDirectionPadElement;
  v2 = (unsigned __int16)objc_msgSendSuper2(&v4, sel_updateContextSize);
  return v2
       + +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize")+ 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  void *v18;
  int v19;
  char v20;
  char v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  v9 = -[_GCDevicePhysicalInputDirectionPadElement update:forUsages:with:](&v23, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    v10 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
    MyUpdateContext_Offset_3 = v10;
  }
  v11 = v10;
  if ((a4 & 2) != 0)
  {
    if (a5)
    {
      v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 144);
      if (self)
      {
LABEL_6:
        v13 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v12, (uint64_t)&self->_pressedValueFieldSlot);
LABEL_7:
        *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFE | v13;
        v9 |= v13;
        goto LABEL_8;
      }
    }
    else
    {
      v12 = 0;
      if (self)
        goto LABEL_6;
    }
    v13 = 0;
    goto LABEL_7;
  }
LABEL_8:
  v14 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
  if ((pressedInputUpdateContext_Offset & 1) == 0)
    pressedInputUpdateContext_Offset = 1;
  v15 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    v15 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
    MyUpdateContext_Offset_3 = v15;
    v16 = 0xFFFFFFFFLL;
    if (pressedInputUpdateContext_Offset)
      v16 = 1;
  }
  else
  {
    v16 = 1;
  }
  v17 = (char *)a3 + v15 + v16;
  v18 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)a5);
  v19 = objc_msgSend(v14, "update:forUsages:with:", v17, a4, v18);
  if (v19)
    v20 = 2;
  else
    v20 = 0;
  *((_BYTE *)a3 + v11) = *((_BYTE *)a3 + v11) & 0xFD | v20;
  v21 = v9 | v19;

  return v21;
}

- (uint64_t)_pressedValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 144);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  -[_GCDevicePhysicalInputDirectionPadElement preCommit:sender:](&v10, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    v6 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
    MyUpdateContext_Offset_3 = v6;
  }
  if ((*((_BYTE *)a3 + v6) & 2) != 0)
  {
    v7 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
    if ((pressedInputUpdateContext_Offset & 1) == 0)
      pressedInputUpdateContext_Offset = 1;
    v8 = MyUpdateContext_Offset_3;
    if (MyUpdateContext_Offset_3 == -1)
    {
      v8 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
      MyUpdateContext_Offset_3 = v8;
      v9 = 0xFFFFFFFFLL;
      if (pressedInputUpdateContext_Offset)
        v9 = 1;
    }
    else
    {
      v9 = 1;
    }
    objc_msgSend(v7, "preCommit:sender:", (char *)a3 + v8 + v9, self);

  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  -[_GCDevicePhysicalInputDirectionPadElement postCommit:sender:](&v10, sel_postCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    v6 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
    MyUpdateContext_Offset_3 = v6;
  }
  if ((*((_BYTE *)a3 + v6) & 2) != 0)
  {
    v7 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
    if ((pressedInputUpdateContext_Offset & 1) == 0)
      pressedInputUpdateContext_Offset = 1;
    v8 = MyUpdateContext_Offset_3;
    if (MyUpdateContext_Offset_3 == -1)
    {
      v8 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
      MyUpdateContext_Offset_3 = v8;
      v9 = 0xFFFFFFFFLL;
      if (pressedInputUpdateContext_Offset)
        v9 = 1;
    }
    else
    {
      v9 = 1;
    }
    objc_msgSend(v7, "postCommit:sender:", (char *)a3 + v8 + v9, self);

  }
}

- (BOOL)isEqualToElement:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  if (!-[_GCDevicePhysicalInputDirectionPadElement isEqualToElement:](&v11, sel_isEqualToElement_))
    return 0;
  if (self)
  {
    v5 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
    if (a3)
    {
LABEL_4:
      v6 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 144);
      goto LABEL_5;
    }
  }
  else
  {
    v5 = 0;
    if (a3)
      goto LABEL_4;
  }
  v6 = 0;
LABEL_5:
  if (v5 != v6)
    return 0;
  v7 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
  v8 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)a3);
  v9 = -[_GCDevicePhysicalInputButtonInput isEqualToInput:]((_BOOL8)v7, v8);

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  void *v18;

  -[_GCDevicePhysicalInputElement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputDirectionPadElement up](self, "up");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = v5;
  -[_GCDevicePhysicalInputDirectionPadElement down](self, "down");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = v8;
  -[_GCDevicePhysicalInputDirectionPadElement left](self, "left");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v12 = v11;
  -[_GCDevicePhysicalInputDirectionPadElement right](self, "right");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "value");
  v15 = v14;
  -[_GCDevicePhysicalInputClickableDirectionPadElement pressedInput](self, "pressedInput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Direction Pad '%@'; up = %f, down = %f, left = %f, right = %f, pressed = %f>"),
    v3,
    *(_QWORD *)&v6,
    *(_QWORD *)&v9,
    *(_QWORD *)&v12,
    *(_QWORD *)&v15,
    v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (GCPressedStateInput)pressedInput
{
  return (GCPressedStateInput *)(id)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
}

- (GCTouchedStateInput)touchedInput
{
  return 0;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  unsigned __int8 v9;
  unsigned int v10;
  float v11;
  float v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  char v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  v9 = -[_GCDevicePhysicalInputDirectionPadElement update:forGamepadEvent:withTimestamp:](&v19, sel_update_forGamepadEvent_withTimestamp_);
  v10 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    v10 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
    MyUpdateContext_Offset_3 = v10;
    if (self)
    {
LABEL_3:
      if (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot) == -1)
        return v9;
    }
  }
  else if (self)
  {
    goto LABEL_3;
  }
  objc_msgSend(a4, "floatValueForElement:");
  v12 = v11;
  v13 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
  if ((pressedInputUpdateContext_Offset & 1) == 0)
    pressedInputUpdateContext_Offset = 1;
  v14 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    v14 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize](_GCDevicePhysicalInputDirectionPadElement, "updateContextSize");
    MyUpdateContext_Offset_3 = v14;
    v15 = 0xFFFFFFFFLL;
    if (pressedInputUpdateContext_Offset)
      v15 = 1;
  }
  else
  {
    v15 = 1;
  }
  v16 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v13, (uint64_t)a3 + v14 + v15, v12, a5);
  if (v16)
    v17 = 2;
  else
    v17 = 0;
  *((_BYTE *)a3 + v10) = *((_BYTE *)a3 + v10) & 0xFD | v17;
  v9 |= v16;

  return v9;
}

@end
