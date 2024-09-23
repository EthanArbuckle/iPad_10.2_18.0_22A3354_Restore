@implementation GCGearShifterElement

- (GCGearShifterElement)initWithParameters:(id)a3
{
  _QWORD *v4;
  GCGearShifterElement *v5;
  GCGearShifterElement *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCGearShifterElement;
  v5 = -[_GCDevicePhysicalInputElement initWithParameters:](&v11, sel_initWithParameters_, v4);
  v6 = v5;
  if (v4)
    v7 = *((_BYTE *)v4 + 40) != 0;
  else
    v7 = 0;
  v5->_isPatternShifter = v7;
  -[_GCGearShifterElementParameters sources](v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGearShifterElement _setSources:]((uint64_t)v6, (uint64_t)v8);

  if (v6->_isPatternShifter)
  {
    if (v4)
    {
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v4[8], (uint64_t)&v6->_impl.pattern.positionMinSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v4[9] + v4[8], (uint64_t)&v6->_impl.pattern.positionMaxSlot);
      v9 = v4[7];
    }
    else
    {
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, 0, (uint64_t)&v6->_impl.pattern.positionMinSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, 0, (uint64_t)&v6->_impl.pattern.positionMaxSlot);
      v9 = 0;
    }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v9, (uint64_t)&v6->_impl.pattern.positionFieldSlot);
  }

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, CFSTR("GCGearShifterElement.m"), 320, CFSTR("Invalid parameter not satisfying: %s"), "newValue != nil");

    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 64, 771);
  }
  return result;
}

- (uint64_t)_setPositionMin:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  return result;
}

- (uint64_t)_setPositionMax:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  return result;
}

- (uint64_t)_setPositionField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 88);
  return result;
}

- (GCGearShifterElement)initWithTemplate:(id)a3 context:(id)a4
{
  _QWORD *v6;
  id v7;
  GCGearShifterElement *v8;
  int v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GCGearShifterElement;
  v8 = -[_GCDevicePhysicalInputElement initWithTemplate:context:](&v11, sel_initWithTemplate_context_, v6, v7);
  v9 = *((unsigned __int8 *)v6 + 56);
  v8->_isPatternShifter = v9;
  v8->_impl.pattern.sourcesSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 1, v6, v6[8]);
  if (v9)
  {
    v8->_impl.pattern.positionMinSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 1, v6, v6[9]);
    v8->_impl.pattern.positionMaxSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 1, v6, v6[10]);
    v8->_impl.pattern.positionFieldSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 1, v6, v6[11]);
  }
  if (v8->_isPatternShifter)
    v8->_impl.pattern.positionChangedHandlerSlot = objc_msgSend(v7, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v8, 2, v6, v6[12]);
  else
    v8->_impl.pattern.positionMinSlot = objc_msgSend(v7, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v8, 2, v6, v6[9]);
  if (v8->_isPatternShifter)
  {
    v8->_impl.pattern.positionSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 3, v6, v6[13]);
    v8->_impl.pattern.timestampSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 3, v6, v6[14]);
  }
  else
  {
    v8->_impl.pattern.positionMaxSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 3, v6, v6[10]);
    v8->_impl.pattern.positionMaxSlot = objc_msgSend(v7, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v8, 3, v6, v6[10]);
  }

  return v8;
}

+ (unsigned)updateContextSize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___GCGearShifterElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6;
  unsigned __int8 v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  __int16 v14;
  char v15;
  uint64_t v16;
  int v17;
  __int16 v18;
  char v19;
  uint64_t v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  int v24;
  __int16 v25;
  void *v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  int v33;
  __int16 v34;
  void *v35;
  char v36;
  void *v37;
  int v38;
  char v39;
  float v40;
  int v41;
  char v42;
  uint64_t v43;
  int v44;
  __int16 v45;
  void *v47;
  objc_super v48;

  v6 = a4;
  v48.receiver = self;
  v48.super_class = (Class)GCGearShifterElement;
  v10 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v48, sel_update_forUsages_with_);
  if (self->_isPatternShifter != *((unsigned __int8 *)a5 + 56))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCGearShifterElement.m"), 150, CFSTR("Assertion failed: _isPatternShifter == other->_isPatternShifter"));

  }
  v11 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    v11 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset = v11;
  }
  v12 = v11;
  if (!self->_isPatternShifter)
  {
    if ((v6 & 2) != 0)
    {
      v35 = (void *)-[GCGearShifterElement _sources]((uint64_t)a5);
      v36 = -[GCGearShifterElement _setSources:]((uint64_t)self, (uint64_t)v35);
      *((_BYTE *)a3 + v12) = *((_BYTE *)a3 + v12) & 0xFE | v36;
      v10 |= v36;

      if ((v6 & 4) == 0)
      {
LABEL_12:
        if ((v6 & 8) == 0)
          return v10;
        goto LABEL_40;
      }
    }
    else if ((v6 & 4) == 0)
    {
      goto LABEL_12;
    }
    v37 = (void *)-[GCGearShifterElement _deltaDidChangeHandler]((uint64_t)a5);
    v38 = -[GCGearShifterElement _setDeltaDidChangeHandler:]((uint64_t)self, (uint64_t)v37);
    if (v38)
      v39 = 2;
    else
      v39 = 0;
    *((_BYTE *)a3 + v12) = *((_BYTE *)a3 + v12) & 0xFD | v39;
    v10 |= v38;

    if ((v6 & 8) == 0)
      return v10;
LABEL_40:
    v40 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80));
    v41 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v40), (uint64_t)&self->_impl.pattern.positionMaxSlot);
    if (v41)
      v42 = 4;
    else
      v42 = 0;
    *((_BYTE *)a3 + v12) = *((_BYTE *)a3 + v12) & 0xFB | v42;
    v43 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 88);
    v44 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v43, (uint64_t)&self->_impl.pattern.positionFieldSlot);
    if (v44)
      v45 = 256;
    else
      v45 = 0;
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFEFF | v45;
    return v10 | v44 | v41;
  }
  if ((v6 & 2) != 0)
  {
    v13 = (void *)-[GCGearShifterElement _sources]((uint64_t)a5);
    v14 = -[GCGearShifterElement _setSources:]((uint64_t)self, (uint64_t)v13);
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFFFE | v14;
    v15 = v10 | v14;

    v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
    v17 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v16, (uint64_t)&self->_impl.pattern.positionMinSlot);
    if (v17)
      v18 = 8;
    else
      v18 = 0;
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFFF7 | v18;
    v19 = v15 | v17;
    v20 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
    v21 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v20, (uint64_t)&self->_impl.pattern.positionMaxSlot);
    if (v21)
      v22 = 16;
    else
      v22 = 0;
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFFEF | v22;
    v23 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 88);
    v24 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v23, (uint64_t)&self->_impl.pattern.positionFieldSlot);
    if (v24)
      v25 = 32;
    else
      v25 = 0;
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFFDF | v25;
    v10 = v19 | v21 | v24;
    if ((v6 & 4) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0)
        return v10;
      goto LABEL_28;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_8;
  }
  v26 = (void *)-[GCGearShifterElement _positionDidChangeHandler]((uint64_t)a5);
  v27 = -[GCGearShifterElement _setPositionDidChangeHandler:]((uint64_t)self, (uint64_t)v26);
  if (v27)
    v28 = 64;
  else
    v28 = 0;
  *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFFBF | v28;
  v10 |= v27;

  if ((v6 & 8) != 0)
  {
LABEL_28:
    v29 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 104);
    v30 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v29, (uint64_t)&self->_impl.pattern.positionSlot);
    if (v30)
      v31 = 128;
    else
      v31 = 0;
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFF7F | v31;
    v32 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
    v33 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v32, (uint64_t)&self->_impl.pattern.timestampSlot);
    if (v33)
      v34 = 256;
    else
      v34 = 0;
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((_BYTE *)a3 + v12) & 0xFEFF | v34;
    v10 |= v30 | v33;
  }
  return v10;
}

- (uint64_t)_sources
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 64);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_positionMin
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72);
  return result;
}

- (uint64_t)_positionMax
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  return result;
}

- (uint64_t)_positionField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 88);
  return result;
}

- (uint64_t)_positionDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 96);
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
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 96, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_position
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 104);
  return result;
}

- (uint64_t)_setPosition:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 104);
  return result;
}

- (double)_lastPositionTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 112));
  else
    return 0.0;
}

- (uint64_t)_setLastPositionTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 112);
  return result;
}

- (uint64_t)_deltaDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 72);
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
    v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 72, 771);

    return v4;
  }
  return result;
}

- (float)_delta
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 80));
  else
    return 0.0;
}

- (uint64_t)_setDelta:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 80);
  return result;
}

- (double)_lastDeltaTimestamp
{
  if (a1)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 88));
  else
    return 0.0;
}

- (uint64_t)_setLastDeltaTimestamp:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 88);
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  __int16 v8;
  char v9;
  const __CFString *v10;
  const __CFString *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCGearShifterElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v12, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset = v6;
  }
  v7 = v6;
  if (self->_isPatternShifter)
  {
    v8 = *(_WORD *)((char *)a3 + v6);
    if ((v8 & 1) != 0)
    {
      -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("sources"));
      v8 = *(_WORD *)((char *)a3 + v7);
    }
    if ((v8 & 0x18) != 0)
    {
      -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("positionRange"));
      v8 = *(_WORD *)((char *)a3 + v7);
      if ((v8 & 0x40) == 0)
      {
LABEL_8:
        if ((v8 & 0x80) == 0)
          goto LABEL_9;
        goto LABEL_18;
      }
    }
    else if ((v8 & 0x40) == 0)
    {
      goto LABEL_8;
    }
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("positionDidChangeHandler"));
    v8 = *(_WORD *)((char *)a3 + v7);
    if ((v8 & 0x80) == 0)
    {
LABEL_9:
      if ((v8 & 0x100) == 0)
        return;
      goto LABEL_19;
    }
LABEL_18:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("position"));
    if ((*(_WORD *)((_BYTE *)a3 + v7) & 0x100) == 0)
      return;
LABEL_19:
    v10 = CFSTR("lastPositionLatency");
    v11 = CFSTR("lastPositionTimestamp");
LABEL_24:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)v11);
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)v10);
    return;
  }
  v9 = *((_BYTE *)a3 + v6);
  if ((v9 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("sources"));
    v9 = *((_BYTE *)a3 + v7);
    if ((v9 & 2) == 0)
    {
LABEL_13:
      if ((v9 & 4) == 0)
        goto LABEL_14;
LABEL_22:
      -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("delta"));
      if ((*((_BYTE *)a3 + v7) & 8) == 0)
        return;
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)a3 + v6) & 2) == 0)
  {
    goto LABEL_13;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, CFSTR("deltaDidChangeHandler"));
  v9 = *((_BYTE *)a3 + v7);
  if ((v9 & 4) != 0)
    goto LABEL_22;
LABEL_14:
  if ((v9 & 8) != 0)
  {
LABEL_23:
    v10 = CFSTR("lastDeltaLatency");
    v11 = CFSTR("lastDeltaTimestamp");
    goto LABEL_24;
  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  uint64_t v7;
  __int16 v8;
  char v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCGearShifterElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v12, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset = v6;
  }
  v7 = v6;
  if (!self->_isPatternShifter)
  {
    v9 = *((_BYTE *)a3 + v6);
    if ((v9 & 1) != 0)
    {
      -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sources"));
      v9 = *((_BYTE *)a3 + v7);
      if ((v9 & 2) == 0)
      {
LABEL_14:
        if ((v9 & 4) == 0)
          goto LABEL_15;
        goto LABEL_26;
      }
    }
    else if ((*((_BYTE *)a3 + v6) & 2) == 0)
    {
      goto LABEL_14;
    }
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("deltaDidChangeHandler"));
    v9 = *((_BYTE *)a3 + v7);
    if ((v9 & 4) == 0)
    {
LABEL_15:
      if ((v9 & 8) == 0)
        return;
LABEL_27:
      -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastDeltaTimestamp"));
      -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastDeltaLatency"));
      return;
    }
LABEL_26:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("delta"));
    if ((*((_BYTE *)a3 + v7) & 8) == 0)
      return;
    goto LABEL_27;
  }
  v8 = *(_WORD *)((char *)a3 + v6);
  if ((v8 & 1) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("sources"));
    v8 = *(_WORD *)((char *)a3 + v7);
  }
  if ((v8 & 0x18) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("positionRange"));
    v8 = *(_WORD *)((char *)a3 + v7);
    if ((v8 & 0x40) == 0)
    {
LABEL_8:
      if ((v8 & 0x80) == 0)
        goto LABEL_9;
      goto LABEL_19;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("positionDidChangeHandler"));
  v8 = *(_WORD *)((char *)a3 + v7);
  if ((v8 & 0x80) == 0)
  {
LABEL_9:
    if ((v8 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("position"));
  v8 = *(_WORD *)((char *)a3 + v7);
  if ((v8 & 0x100) == 0)
  {
LABEL_10:
    if ((v8 & 0x80) == 0)
      return;
    goto LABEL_21;
  }
LABEL_20:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPositionTimestamp"));
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, CFSTR("lastPositionLatency"));
  if ((*(_WORD *)((_BYTE *)a3 + v7) & 0x80) == 0)
    return;
LABEL_21:
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))-[GCGearShifterElement _positionDidChangeHandler]((uint64_t)self);
  if (v10)
  {
    v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionSlot);
    ((void (**)(_QWORD, GCGearShifterElement *, GCGearShifterElement *, uint64_t))v10)[2](v10, self, self, v11);
  }

}

- (BOOL)isEqualToElement:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 *v6;
  int isPatternShifter;
  BOOL v8;
  void *v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v6 = (unsigned __int8 *)a3;
  v22.receiver = self;
  v22.super_class = (Class)GCGearShifterElement;
  if (!-[_GCDevicePhysicalInputElement isEqualToElement:](&v22, sel_isEqualToElement_, v6)
    || (isPatternShifter = self->_isPatternShifter, isPatternShifter != v6[56]))
  {
    v10 = 0;
    goto LABEL_8;
  }
  if (self->_isPatternShifter)
  {
    v3 = (void *)-[GCGearShifterElement _sources]((uint64_t)self);
    v4 = (void *)-[GCGearShifterElement _sources]((uint64_t)v6);
    v8 = v3 != v4;
    if (v3 == v4
      || (v9 = (void *)-[GCGearShifterElement _sources]((uint64_t)self),
          v20 = (void *)-[GCGearShifterElement _sources]((uint64_t)v6),
          v21 = v9,
          objc_msgSend(v9, "isEqual:", v20)))
    {
      v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMinSlot);
      if (v12 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)(v6 + 72)))
      {
        v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMaxSlot);
        if (v13 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)(v6 + 80)))
        {
          v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot);
          if (v14 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)(v6 + 88)))
          {
            if (v3 == v4)
            {
              v10 = 1;
              v4 = v3;
            }
            else
            {

              v10 = 1;
            }
            goto LABEL_19;
          }
        }
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  v15 = (void *)-[GCGearShifterElement _sources]((uint64_t)self);
  v16 = -[GCGearShifterElement _sources]((uint64_t)v6);
  if (v15 != (void *)v16)
  {
    v17 = (void *)v16;
    v18 = (void *)-[GCGearShifterElement _sources]((uint64_t)self);
    v19 = (void *)-[GCGearShifterElement _sources]((uint64_t)v6);
    v10 = objc_msgSend(v18, "isEqual:", v19);

    if (!v8)
      goto LABEL_18;
    goto LABEL_17;
  }

  v10 = 1;
  if (v8)
  {
LABEL_17:

  }
LABEL_18:
  if (isPatternShifter)
  {
LABEL_19:

  }
LABEL_8:

  return v10;
}

- (id)patternInput
{
  if (!self->_isPatternShifter)
    self = 0;
  return self;
}

- (id)sequentialInput
{
  if (self->_isPatternShifter)
    self = 0;
  return self;
}

- (NSString)description
{
  _BOOL4 isPatternShifter;
  void *v4;
  float v5;
  void *v6;

  isPatternShifter = self->_isPatternShifter;
  -[_GCDevicePhysicalInputElement identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (isPatternShifter)
  {
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Pattern Shifter '%@'; position = %zd>"),
      v4,
      -[GCGearShifterElement position](self, "position"));
  }
  else
  {
    -[GCGearShifterElement delta](self, "delta");
    +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Sequential Shifter '%@'; delta = %f>"),
      v4,
      v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)positionDidChangeHandler
{
  if (self->_isPatternShifter)
    return (id)-[GCGearShifterElement _positionDidChangeHandler]((uint64_t)self);
  -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setPositionDidChangeHandler:(id)a3
{
  if (self->_isPatternShifter)
    -[GCGearShifterElement _setPositionDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
  else
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (int64_t)position
{
  if (self->_isPatternShifter)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionSlot);
  -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (_NSRange)positionRange
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  if (self->_isPatternShifter)
  {
    v3 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMinSlot);
    v4 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMaxSlot)- v3;
  }
  else
  {
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    v3 = 0;
    v4 = 0;
  }
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (BOOL)isSequential
{
  if (!self->_isPatternShifter)
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)canWrap
{
  if (!self->_isPatternShifter)
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 1;
}

- (double)lastPositionTimestamp
{
  if (self->_isPatternShifter)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.timestampSlot));
  -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (double)lastPositionLatency
{
  double v3;

  if (self->_isPatternShifter)
  {
    if (!dword_254DBDECC)
      mach_timebase_info((mach_timebase_info_t)&lastPositionLatency_sTimebaseInfo);
    v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.timestampSlot));
    return (double)(mach_absolute_time()
                  * lastPositionLatency_sTimebaseInfo
                  / dword_254DBDECC)
         / 1000000000.0
         - v3;
  }
  else
  {
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0.0;
  }
}

- (NSSet)sources
{
  return (NSSet *)(id)-[GCGearShifterElement _sources]((uint64_t)self);
}

- (id)deltaDidChangeHandler
{
  if (!self->_isPatternShifter)
    return (id)-[GCGearShifterElement _deltaDidChangeHandler]((uint64_t)self);
  -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setDeltaDidChangeHandler:(id)a3
{
  if (self->_isPatternShifter)
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  else
    -[GCGearShifterElement _setDeltaDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
}

- (float)delta
{
  if (!self->_isPatternShifter)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMaxSlot));
  -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (BOOL)isAnalog
{
  if (self->_isPatternShifter)
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (double)lastDeltaTimestamp
{
  if (!self->_isPatternShifter)
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot));
  -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (double)lastDeltaLatency
{
  double v4;

  if (self->_isPatternShifter)
  {
    -[GCGearShifterElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0.0;
  }
  else
  {
    if (!dword_254DBDED4)
      mach_timebase_info((mach_timebase_info_t)&lastDeltaLatency_sTimebaseInfo);
    v4 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot));
    return (double)(mach_absolute_time() * lastDeltaLatency_sTimebaseInfo / dword_254DBDED4)
         / 1000000000.0
         - v4;
  }
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
  v17.super_class = (Class)GCGearShifterElement;
  v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v17, sel_update_forGamepadEvent_withTimestamp_);
  v10 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset = v10;
  }
  if (self->_isPatternShifter)
  {
    v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot);
    if (v11 != -1)
    {
      v12 = v11;
      v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionSlot);
      objc_msgSend(a4, "floatValueForElement:", v12);
      v15 = (uint64_t)rintf(v14);
      if (v13 != v15)
      {
        -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v15, (uint64_t)&self->_impl.pattern.positionSlot);
        -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_impl.pattern.timestampSlot);
        *(_WORD *)((char *)a3 + v10) |= 0x180u;
        return 1;
      }
    }
  }
  return v9;
}

@end
