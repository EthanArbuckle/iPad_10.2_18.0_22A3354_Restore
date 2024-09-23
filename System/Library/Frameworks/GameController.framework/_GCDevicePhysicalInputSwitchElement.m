@implementation _GCDevicePhysicalInputSwitchElement

- (_GCDevicePhysicalInputSwitchElement)initWithParameters:(id)a3
{
  _QWORD *v4;
  _GCDevicePhysicalInputSwitchElement *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  v5 = -[_GCDevicePhysicalInputElement initWithParameters:](&v14, sel_initWithParameters_, v4);
  -[_GCDevicePhysicalInputSwitchElementParameters sources](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputSwitchElement _setSources:]((uint64_t)v5, (uint64_t)v6);

  if (v4)
  {
    v7 = *((unsigned __int8 *)v4 + 41);
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (v5)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_canWrapSlot);
LABEL_4:
  if (v4)
  {
    v8 = *((unsigned __int8 *)v4 + 40);
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = 0;
  if (v5)
LABEL_6:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v8, (uint64_t)&v5->_isSequentialSlot);
LABEL_7:
  if (v4)
  {
    v9 = v4[8];
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = 0;
  if (v5)
LABEL_9:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v9, (uint64_t)&v5->_positionMinSlot);
LABEL_10:
  if (v4)
  {
    v10 = v4[8];
    v11 = v4[9];
    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = 0;
  v11 = 0;
  if (v5)
LABEL_12:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v11 + v10, (uint64_t)&v5->_positionMaxSlot);
LABEL_13:
  if (!v4)
  {
    v12 = 0;
    if (!v5)
      goto LABEL_16;
    goto LABEL_15;
  }
  v12 = v4[7];
  if (v5)
LABEL_15:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v12, (uint64_t)&v5->_positionFieldSlot);
LABEL_16:

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, CFSTR("_GCDevicePhysicalInputSwitchElement.m"), 211, CFSTR("Invalid parameter not satisfying: %s"), "newValue != nil");

    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 56, 771);
  }
  return result;
}

- (uint64_t)_setCanWrap:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 64);
  return result;
}

- (uint64_t)_setSequential:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  return result;
}

- (uint64_t)_setPositionMin:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  return result;
}

- (uint64_t)_setPositionMax:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 88);
  return result;
}

- (uint64_t)_setPositionField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 96);
  return result;
}

- (_GCDevicePhysicalInputSwitchElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputSwitchElement *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputElement initWithTemplate:context:](&v10, sel_initWithTemplate_context_, v6, v5);
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v10.receiver, v10.super_class);
  v7->_canWrapSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[8]);
  v7->_isSequentialSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[9]);
  v7->_positionMinSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[10]);
  v7->_positionMaxSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[11]);
  v7->_positionFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[12]);
  v7->_positionChangedHandlerSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[13]);
  v7->_positionSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[14]);
  v8 = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 3, v6, v6[15]);

  v7->_timestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputSwitchElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6;
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  __int16 v15;
  _BOOL8 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  char v23;
  int v24;
  __int16 v25;
  char v26;
  uint64_t v27;
  char v28;
  int v29;
  __int16 v30;
  void *v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  int v38;
  __int16 v39;
  __int16 v41;
  objc_super v42;

  v6 = a4;
  v42.receiver = self;
  v42.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v42, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_2 = v10;
  }
  v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
  v12 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)a5);
  v41 = -[_GCDevicePhysicalInputSwitchElement _setSources:]((uint64_t)self, (uint64_t)v12);
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFE | v41;

  if (a5)
  {
    v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64) != 0;
    if (self)
      goto LABEL_9;
LABEL_52:
    LOBYTE(v14) = 0;
    v15 = 0;
    goto LABEL_12;
  }
  v13 = 0;
  if (!self)
    goto LABEL_52;
LABEL_9:
  v14 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v13, (uint64_t)&self->_canWrapSlot);
  if (v14)
    v15 = 2;
  else
    v15 = 0;
LABEL_12:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFD | v15;
  if (a5)
  {
    v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72) != 0;
    if (self)
      goto LABEL_14;
LABEL_54:
    LOBYTE(v17) = 0;
    v18 = 0;
    goto LABEL_17;
  }
  v16 = 0;
  if (!self)
    goto LABEL_54;
LABEL_14:
  v17 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v16, (uint64_t)&self->_isSequentialSlot);
  if (v17)
    v18 = 4;
  else
    v18 = 0;
LABEL_17:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFB | v18;
  if (a5)
  {
    v19 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
    if (self)
      goto LABEL_19;
  }
  else
  {
    v19 = 0;
    if (self)
    {
LABEL_19:
      v20 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v19, (uint64_t)&self->_positionMinSlot);
      if (v20)
        v21 = 8;
      else
        v21 = 0;
      goto LABEL_22;
    }
  }
  LOBYTE(v20) = 0;
  v21 = 0;
LABEL_22:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFF7 | v21;
  if (a5)
    v22 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 88);
  else
    v22 = 0;
  v23 = v14 | v17;
  if (self)
  {
    v24 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v22, (uint64_t)&self->_positionMaxSlot);
    if (v24)
      v25 = 16;
    else
      v25 = 0;
  }
  else
  {
    LOBYTE(v24) = 0;
    v25 = 0;
  }
  v26 = v23 | v20;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFEF | v25;
  if (a5)
    v27 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 96);
  else
    v27 = 0;
  v28 = v26 | v24;
  if (self)
  {
    v29 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v27, (uint64_t)&self->_positionFieldSlot);
    if (v29)
      v30 = 32;
    else
      v30 = 0;
  }
  else
  {
    LOBYTE(v29) = 0;
    v30 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFDF | v30;
  v9 |= v41 | v29 | v28;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      return v9;
LABEL_39:
    if (a5)
    {
      v34 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
      if (self)
        goto LABEL_41;
    }
    else
    {
      v34 = 0;
      if (self)
      {
LABEL_41:
        v35 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v34, (uint64_t)&self->_positionSlot);
        if (v35)
          v36 = 128;
        else
          v36 = 0;
LABEL_44:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFF7F | v36;
        if (a5)
        {
          v37 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 120);
          if (self)
            goto LABEL_46;
        }
        else
        {
          v37 = 0;
          if (self)
          {
LABEL_46:
            v38 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v37, (uint64_t)&self->_timestampSlot);
            if (v38)
              v39 = 256;
            else
              v39 = 0;
            goto LABEL_49;
          }
        }
        LOBYTE(v38) = 0;
        v39 = 0;
LABEL_49:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFEFF | v39;
        return v9 | v38 | v35;
      }
    }
    LOBYTE(v35) = 0;
    v36 = 0;
    goto LABEL_44;
  }
LABEL_35:
  v31 = (void *)-[_GCDevicePhysicalInputSwitchElement _positionDidChangeHandler]((uint64_t)a5);
  v32 = -[_GCDevicePhysicalInputSwitchElement _setPositionDidChangeHandler:]((uint64_t)self, (uint64_t)v31);
  if (v32)
    v33 = 64;
  else
    v33 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFBF | v33;
  v9 |= v32;

  if ((v6 & 8) != 0)
    goto LABEL_39;
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

- (BOOL)_canWrap
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 64) != 0;
  return result;
}

- (BOOL)_isSequential
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72) != 0;
  return result;
}

- (uint64_t)_positionMin
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  return result;
}

- (uint64_t)_positionMax
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 88);
  return result;
}

- (uint64_t)_positionField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 96);
  return result;
}

- (uint64_t)_positionDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 104);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setPositionDidChangeHandler:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = result;
    v3 = (void *)MEMORY[0x2199DEBB0](a2);
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 104, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_position
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 112);
  return result;
}

- (uint64_t)_setPosition:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 112);
  return result;
}

- (double)_lastPositionTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 120));
  else
    return 0.0;
}

- (uint64_t)_setLastPositionTimestamp:(uint64_t)result
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
  v9.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v9, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_2 = v6;
  }
  v7 = *(_WORD *)((char *)a3 + v6);
  v8 = v6;
  if ((v7 & 1) == 0)
  {
    if ((v7 & 2) == 0)
      goto LABEL_5;
LABEL_13:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("canWrap"));
    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("sources"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 2) != 0)
    goto LABEL_13;
LABEL_5:
  if ((v7 & 4) == 0)
    goto LABEL_6;
LABEL_14:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("sequential"));
  v7 = *(_WORD *)((char *)a3 + v8);
LABEL_6:
  if ((v7 & 0x18) != 0)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("positionRange"));
    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x40) == 0)
    {
LABEL_8:
      if ((v7 & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("positionDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_9:
    if ((v7 & 0x100) == 0)
      return;
    goto LABEL_10;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("position"));
  if ((*(_WORD *)((_BYTE *)a3 + v8) & 0x100) == 0)
    return;
LABEL_10:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastPositionTimestamp"));
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("lastPositionLatency"));
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  -[_GCDevicePhysicalInputElement postCommit:sender:](&v11, sel_postCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_2 = v6;
  }
  v7 = *(_WORD *)((char *)a3 + v6);
  v8 = v6;
  if ((v7 & 1) == 0)
  {
    if ((v7 & 2) == 0)
      goto LABEL_5;
LABEL_13:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("canWrap"));
    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sources"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 2) != 0)
    goto LABEL_13;
LABEL_5:
  if ((v7 & 4) == 0)
    goto LABEL_6;
LABEL_14:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sequential"));
  v7 = *(_WORD *)((char *)a3 + v8);
LABEL_6:
  if ((v7 & 0x18) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("positionRange"));
    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x40) == 0)
    {
LABEL_8:
      if ((v7 & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("positionDidChangeHandler"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_9:
    if ((v7 & 0x100) == 0)
      goto LABEL_10;
LABEL_18:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPositionTimestamp"));
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPositionLatency"));
    if ((*(_WORD *)((_BYTE *)a3 + v8) & 0x80) == 0)
      return;
    goto LABEL_19;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("position"));
  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v7 & 0x80) == 0)
    return;
LABEL_19:
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))-[_GCDevicePhysicalInputSwitchElement _positionDidChangeHandler]((uint64_t)self);
  if (v9)
  {
    if (self)
      v10 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionSlot);
    else
      v10 = 0;
    ((void (**)(_QWORD, _GCDevicePhysicalInputSwitchElement *, _GCDevicePhysicalInputSwitchElement *, uint64_t))v9)[2](v9, self, self, v10);
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
  BOOL v10;
  uint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  if (-[_GCDevicePhysicalInputElement isEqualToElement:](&v19, sel_isEqualToElement_, v6))
  {
    v7 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)self);
    v8 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)v6);
    if (v7 != v8)
    {
      v3 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)self);
      objc_msgSend(v6, "sources");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        v9 = 0;
        goto LABEL_23;
      }
    }
    if (self)
    {
      v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_canWrapSlot);
      v12 = v11 != 0;
      if (v6)
      {
LABEL_8:
        if (((v12 ^ (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 64) != 0)) & 1) == 0)
        {
          v13 = self
             && -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isSequentialSlot) != 0;
          if (((v13 ^ (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 72) != 0)) & 1) == 0)
          {
            if (self)
            {
              v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMinSlot);
              if (v14 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 80))
              {
                v15 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMaxSlot);
                if (v15 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 88))
                {
                  v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionFieldSlot);
LABEL_16:
                  v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 96);
LABEL_17:
                  v9 = v16 == v17;
                  v10 = v16 == v17;
                  goto LABEL_22;
                }
              }
            }
            else if (!-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 80)
                   && !-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 88))
            {
              v16 = 0;
              goto LABEL_16;
            }
          }
        }
LABEL_21:
        v9 = 0;
        v10 = 0;
LABEL_22:
        if (v7 == v8)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        v10 = v9;
        goto LABEL_24;
      }
      if (v11
        || -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isSequentialSlot)
        || -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMinSlot)
        || -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMaxSlot))
      {
        goto LABEL_21;
      }
      v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionFieldSlot);
    }
    else
    {
      if (v6)
      {
        v12 = 0;
        goto LABEL_8;
      }
      v16 = 0;
    }
    v17 = 0;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_25:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;

  -[_GCDevicePhysicalInputElement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Switch '%@'; position = %zd>"),
    v3,
    -[_GCDevicePhysicalInputSwitchElement position](self, "position"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)positionDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputSwitchElement _positionDidChangeHandler]((uint64_t)self);
}

- (void)setPositionDidChangeHandler:(id)a3
{
  -[_GCDevicePhysicalInputSwitchElement _setPositionDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
}

- (int64_t)position
{
  if (self)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](self, self + 112);
  return self;
}

- (_NSRange)positionRange
{
  _GCDevicePhysicalInputSwitchElement *v2;
  uint64_t v3;
  char *v4;
  NSUInteger v5;
  _NSRange result;

  if (self)
  {
    v2 = self;
    v3 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMinSlot);
    self = (_GCDevicePhysicalInputSwitchElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v2, (uint64_t)&v2->_positionMaxSlot);
  }
  else
  {
    v3 = 0;
  }
  v4 = (char *)self - v3;
  v5 = v3;
  result.length = (NSUInteger)v4;
  result.location = v5;
  return result;
}

- (BOOL)isSequential
{
  if (self)
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isSequentialSlot) != 0;
  return (char)self;
}

- (BOOL)canWrap
{
  if (self)
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_canWrapSlot) != 0;
  return (char)self;
}

- (double)lastPositionTimestamp
{
  if (self)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  else
    return 0.0;
}

- (double)lastPositionLatency
{
  double v3;

  if (!dword_254DBDFBC)
    mach_timebase_info((mach_timebase_info_t)&lastPositionLatency_sTimebaseInfo_0);
  if (self)
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  else
    v3 = 0.0;
  return (double)(mach_absolute_time()
                * lastPositionLatency_sTimebaseInfo_0
                / dword_254DBDFBC)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  return (NSSet *)(id)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)self);
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  BOOL v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v17, sel_update_forGamepadEvent_withTimestamp_);
  v10 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_2 = v10;
    if (self)
      goto LABEL_3;
LABEL_11:
    v12 = 0;
    v13 = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_11;
LABEL_3:
  v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionFieldSlot);
  if (v11 == -1)
    return v9;
  v12 = v11;
  v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionSlot);
LABEL_5:
  objc_msgSend(a4, "floatValueForElement:", v12);
  v15 = (uint64_t)rintf(v14);
  if (v13 != v15)
  {
    if (self)
    {
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v15, (uint64_t)&self->_positionSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_timestampSlot);
    }
    *(_WORD *)((char *)a3 + v10) |= 0x180u;
    return 1;
  }
  return v9;
}

@end
