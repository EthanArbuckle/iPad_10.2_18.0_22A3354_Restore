@implementation _GCDevicePhysicalInputDirectionPadElement

- (_GCDevicePhysicalInputDirectionPadElement)initWithParameters:(id)a3
{
  _QWORD *v4;
  _GCDevicePhysicalInputDirectionPadElement *v5;
  _GCDevicePhysicalInputDirectionPadElement *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  char v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  _GCDevicePhysicalInputButtonInput *v24;
  char *v25;
  _GCDevicePhysicalInputButtonInput *v26;
  char *v27;
  _GCDevicePhysicalInputButtonInput *v28;
  char *v29;
  _GCDevicePhysicalInputButtonInput *v30;
  _GCDevicePhysicalInputAxisInput *v32;
  _GCDevicePhysicalInputAxisInput *v33;
  _GCDevicePhysicalInputAxis2DInput *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  v5 = -[_GCDevicePhysicalInputElement initWithParameters:](&v35, sel_initWithParameters_, v4);
  v6 = v5;
  if (v4)
  {
    v7 = v4[13];
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (v5)
LABEL_3:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_upValueFieldSlot);
LABEL_4:
  if (v4)
  {
    v8 = v4[14];
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  v8 = 0;
  if (v6)
LABEL_6:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v8, (uint64_t)&v6->_downValueFieldSlot);
LABEL_7:
  if (v4)
  {
    v9 = v4[15];
    if (!v6)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = 0;
  if (v6)
LABEL_9:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v9, (uint64_t)&v6->_leftValueFieldSlot);
LABEL_10:
  if (v4)
  {
    v10 = v4[16];
    if (!v6)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = 0;
  if (v6)
LABEL_12:
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v10, (uint64_t)&v6->_rightValueFieldSlot);
LABEL_13:
  v11 = objc_opt_new();
  v12 = (void *)v11;
  if (v4)
    v13 = *((_BYTE *)v4 + 40) != 0;
  else
    v13 = 0;
  -[_GCDevicePhysicalInputAxis2DInputParameters setAnalog:](v11, v13);
  -[_GCDevicePhysicalInputAxis2DInputParameters setCanWrap:]((uint64_t)v12, 0);
  v14 = objc_opt_new();
  v15 = (void *)v14;
  if (v4)
    v16 = *((_BYTE *)v4 + 40) != 0;
  else
    v16 = 0;
  -[_GCDevicePhysicalInputAxisInputParameters setAnalog:](v14, v16);
  -[_GCDevicePhysicalInputAxisInputParameters setCanWrap:]((uint64_t)v15, 0);
  v17 = objc_opt_new();
  v18 = (void *)v17;
  if (v4)
    v19 = *((_BYTE *)v4 + 40) != 0;
  else
    v19 = 0;
  -[_GCDevicePhysicalInputButtonInputParameters setAnalog:](v17, v19);
  -[_GCDevicePhysicalInputButtonInputParameters setPressedThreshold:]((uint64_t)v18, 0.0);
  -[_GCDevicePhysicalInputDirectionPadElementParameters xySources](v4);
  v20 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputAxis2DInputParameters setSources:](v12, v20);

  v34 = -[_GCDevicePhysicalInputAxis2DInput initWithParameters:]([_GCDevicePhysicalInputAxis2DInput alloc], "initWithParameters:", v12);
  v6->_xyAxesSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v34);
  -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v4);
  v21 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputAxisInputParameters setSources:](v15, v21);

  v33 = -[_GCDevicePhysicalInputAxisInput initWithParameters:]([_GCDevicePhysicalInputAxisInput alloc], "initWithParameters:", v15);
  v6->_xAxisSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v33);
  -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v4);
  v22 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputAxisInputParameters setSources:](v15, v22);

  v32 = -[_GCDevicePhysicalInputAxisInput initWithParameters:]([_GCDevicePhysicalInputAxisInput alloc], "initWithParameters:", v15);
  v6->_yAxisSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v32);
  -[_GCDevicePhysicalInputDirectionPadElementParameters upSources](v4);
  v23 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v23);

  v24 = -[_GCDevicePhysicalInputButtonInput initWithParameters:]([_GCDevicePhysicalInputButtonInput alloc], "initWithParameters:", v18);
  v6->_upInputSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v24);
  -[_GCDevicePhysicalInputDirectionPadElementParameters downSources](v4);
  v25 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v25);

  v26 = -[_GCDevicePhysicalInputButtonInput initWithParameters:]([_GCDevicePhysicalInputButtonInput alloc], "initWithParameters:", v18);
  v6->_downInputSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v26);
  -[_GCDevicePhysicalInputDirectionPadElementParameters leftSources](v4);
  v27 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v27);

  v28 = -[_GCDevicePhysicalInputButtonInput initWithParameters:]([_GCDevicePhysicalInputButtonInput alloc], "initWithParameters:", v18);
  v6->_leftInputSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v28);
  -[_GCDevicePhysicalInputDirectionPadElementParameters rightSources](v4);
  v29 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v29);

  v30 = -[_GCDevicePhysicalInputButtonInput initWithParameters:]([_GCDevicePhysicalInputButtonInput alloc], "initWithParameters:", v18);
  v6->_rightInputSlot = -[_GCDevicePhysicalInputView view:makeReferenceToView:](v6, "view:makeReferenceToView:", v6, v30);

  return v6;
}

- (uint64_t)_setUpValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 56);
  return result;
}

- (uint64_t)_setDownValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 64);
  return result;
}

- (uint64_t)_setLeftValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  return result;
}

- (uint64_t)_setRightValueField:(uint64_t)result
{
  if (result)
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  return result;
}

- (_GCDevicePhysicalInputDirectionPadElement)initWithTemplate:(id)a3 context:(id)a4
{
  id v5;
  _QWORD *v6;
  _GCDevicePhysicalInputDirectionPadElement *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCDevicePhysicalInputElement initWithTemplate:context:](&v17, sel_initWithTemplate_context_, v6, v5);
  v7->_upValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v17.receiver, v17.super_class);
  v7->_downValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[8]);
  v7->_leftValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[9]);
  v7->_rightValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[10]);
  objc_msgSend(v6, "xyAxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_xyAxesSlot = objc_msgSend(v5, "view:makeReferenceToView:", v7, v8);

  objc_msgSend(v6, "xAxis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_xAxisSlot = objc_msgSend(v5, "view:makeReferenceToView:", v7, v9);

  objc_msgSend(v6, "yAxis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_yAxisSlot = objc_msgSend(v5, "view:makeReferenceToView:", v7, v10);

  objc_msgSend(v6, "up");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_upInputSlot = objc_msgSend(v5, "view:makeReferenceToView:", v7, v11);

  objc_msgSend(v6, "down");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_downInputSlot = objc_msgSend(v5, "view:makeReferenceToView:", v7, v12);

  objc_msgSend(v6, "left");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_leftInputSlot = objc_msgSend(v5, "view:makeReferenceToView:", v7, v13);

  objc_msgSend(v6, "right");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v5, "view:makeReferenceToView:", v7, v14);
  v7->_rightInputSlot = v15;

  return v7;
}

+ (unsigned)updateContextSize
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  int v6;
  int v7;
  unsigned int v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputDirectionPadElement;
  v2 = objc_msgSendSuper2(&v10, sel_updateContextSize);
  v3 = v2
     + +[_GCDevicePhysicalInputAxis2DInput updateContextSize](_GCDevicePhysicalInputAxis2DInput, "updateContextSize");
  v4 = +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
  v5 = v3
     + v4
     + +[_GCDevicePhysicalInputAxisInput updateContextSize](_GCDevicePhysicalInputAxisInput, "updateContextSize");
  v6 = +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
  v7 = v6
     + +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
  v8 = v5
     + v7
     + +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize");
  return v8
       + +[_GCDevicePhysicalInputButtonInput updateContextSize](_GCDevicePhysicalInputButtonInput, "updateContextSize")+ 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  char v21;
  int v22;
  __int16 v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  char *v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t updated;
  void *v32;
  int v33;
  __int16 v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  int v40;
  __int16 v41;
  char v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  void *v50;
  int v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  void *v55;
  int v56;
  __int16 v57;
  char v58;
  void *v59;
  uint64_t v60;
  void *v61;
  int v62;
  __int16 v63;
  char v64;
  int v66;
  char v67;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v68, sel_update_forUsages_with_);
  v10 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v10;
  }
  v11 = v10;
  if ((a4 & 2) != 0)
  {
    if (a5)
    {
      v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 56);
      if (self)
      {
LABEL_6:
        v13 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v12, (uint64_t)&self->_upValueFieldSlot);
        goto LABEL_7;
      }
    }
    else
    {
      v12 = 0;
      if (self)
        goto LABEL_6;
    }
    v13 = 0;
LABEL_7:
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFE | v13;
    if (a5)
    {
      v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64);
      if (self)
        goto LABEL_9;
    }
    else
    {
      v14 = 0;
      if (self)
      {
LABEL_9:
        v15 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v14, (uint64_t)&self->_downValueFieldSlot);
        if (v15)
          v16 = 2;
        else
          v16 = 0;
LABEL_12:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFD | v16;
        if (a5)
        {
          v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
          if (self)
            goto LABEL_14;
        }
        else
        {
          v17 = 0;
          if (self)
          {
LABEL_14:
            v18 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v17, (uint64_t)&self->_leftValueFieldSlot);
            if (v18)
              v19 = 4;
            else
              v19 = 0;
LABEL_17:
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFFB | v19;
            if (a5)
              v20 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
            else
              v20 = 0;
            v21 = v15 | v18;
            if (self)
            {
              v22 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v20, (uint64_t)&self->_rightValueFieldSlot);
              if (v22)
                v23 = 8;
              else
                v23 = 0;
            }
            else
            {
              LOBYTE(v22) = 0;
              v23 = 0;
            }
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFF7 | v23;
            v9 |= v13 | v22 | v21;
            goto LABEL_24;
          }
        }
        LOBYTE(v18) = 0;
        v19 = 0;
        goto LABEL_17;
      }
    }
    LOBYTE(v15) = 0;
    v16 = 0;
    goto LABEL_12;
  }
LABEL_24:
  v24 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
  if ((xyAxesUpdateContext_Offset & 1) == 0)
    xyAxesUpdateContext_Offset = 1;
  v25 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v25 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v25;
    v26 = 0xFFFFFFFFLL;
    if (xyAxesUpdateContext_Offset)
      v26 = 2;
  }
  else
  {
    v26 = 2;
  }
  v27 = (char *)a3 + v25 + v26;
  v28 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)a5);
  v66 = objc_msgSend(v24, "update:forUsages:with:", v27, a4, v28);
  if (v66)
    v29 = 16;
  else
    v29 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFEF | v29;

  v30 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
  updated = xAxisUpdateContext((uint64_t)a3);
  v32 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)a5);
  v33 = objc_msgSend(v30, "update:forUsages:with:", updated, a4, v32);
  if (v33)
    v34 = 32;
  else
    v34 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFDF | v34;
  v35 = v9 | v33;

  v36 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
  v37 = yAxisUpdateContext((uint64_t)a3);
  v38 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)a5);
  v39 = a4;
  v40 = objc_msgSend(v36, "update:forUsages:with:", v37, a4, v38);
  if (v40)
    v41 = 64;
  else
    v41 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFBF | v41;
  v42 = v35 | v40;

  v43 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  v44 = upButtonUpdateContext((uint64_t)a3);
  v45 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)a5);
  v46 = objc_msgSend(v43, "update:forUsages:with:", v44, v39, v45);
  if (v46)
    v47 = 128;
  else
    v47 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFF7F | v47;
  v67 = v42 | v46 | v66;

  v48 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
  v49 = downButtonUpdateContext((uint64_t)a3);
  v50 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)a5);
  v51 = objc_msgSend(v48, "update:forUsages:with:", v49, v39, v50);
  if (v51)
    v52 = 256;
  else
    v52 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFEFF | v52;

  v53 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
  v54 = leftButtonUpdateContext((uint64_t)a3);
  v55 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)a5);
  v56 = objc_msgSend(v53, "update:forUsages:with:", v54, v39, v55);
  if (v56)
    v57 = 512;
  else
    v57 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFDFF | v57;
  v58 = v51 | v56;

  v59 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
  v60 = rightButtonUpdateContext((uint64_t)a3);
  v61 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)a5);
  v62 = objc_msgSend(v59, "update:forUsages:with:", v60, v39, v61);
  if (v62)
    v63 = 1024;
  else
    v63 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFBFF | v63;
  v64 = v67 | v58 | v62;

  return v64 & 1;
}

- (uint64_t)_upValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 56);
  return result;
}

- (uint64_t)_downValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 64);
  return result;
}

- (uint64_t)_leftValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72);
  return result;
}

- (uint64_t)_rightValueField
{
  if (result)
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  return result;
}

- (uint64_t)_xy
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 88);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_x
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 96);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_y
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 104);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_up
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 112);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_down
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 120);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_left
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 128);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_right
{
  if (result)
  {
    objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource](result), "view:viewForSlot:", result, result + 136);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  -[_GCDevicePhysicalInputElement preCommit:sender:](&v18, sel_preCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v6;
  }
  v7 = *(_WORD *)((char *)a3 + v6);
  v8 = v6;
  if ((v7 & 0x10) != 0)
  {
    v10 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
    if ((xyAxesUpdateContext_Offset & 1) == 0)
      xyAxesUpdateContext_Offset = 1;
    v11 = MyUpdateContext_Offset_8;
    if (MyUpdateContext_Offset_8 == -1)
    {
      v11 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
      MyUpdateContext_Offset_8 = v11;
      v12 = 0xFFFFFFFFLL;
      if (xyAxesUpdateContext_Offset)
        v12 = 2;
    }
    else
    {
      v12 = 2;
    }
    objc_msgSend(v10, "preCommit:sender:", (char *)a3 + v11 + v12, self);

    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x20) == 0)
    {
LABEL_5:
      if ((v7 & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  v13 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
  objc_msgSend(v13, "preCommit:sender:", xAxisUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_6:
    if ((v7 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v14 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
  objc_msgSend(v14, "preCommit:sender:", yAxisUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_7:
    if ((v7 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v15 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  objc_msgSend(v15, "preCommit:sender:", upButtonUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_8:
    if ((v7 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v16 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
  objc_msgSend(v16, "preCommit:sender:", downButtonUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x200) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0)
      return;
    goto LABEL_10;
  }
LABEL_21:
  v17 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
  objc_msgSend(v17, "preCommit:sender:", leftButtonUpdateContext((uint64_t)a3), self);

  if ((*(_WORD *)((_BYTE *)a3 + v8) & 0x400) != 0)
  {
LABEL_10:
    v9 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
    objc_msgSend(v9, "preCommit:sender:", rightButtonUpdateContext((uint64_t)a3), self);

  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  -[_GCDevicePhysicalInputElement postCommit:sender:](&v18, sel_postCommit_sender_, a3, a4);
  v6 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v6 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v6;
  }
  v7 = *(_WORD *)((char *)a3 + v6);
  v8 = v6;
  if ((v7 & 0x10) != 0)
  {
    v10 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
    if ((xyAxesUpdateContext_Offset & 1) == 0)
      xyAxesUpdateContext_Offset = 1;
    v11 = MyUpdateContext_Offset_8;
    if (MyUpdateContext_Offset_8 == -1)
    {
      v11 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
      MyUpdateContext_Offset_8 = v11;
      v12 = 0xFFFFFFFFLL;
      if (xyAxesUpdateContext_Offset)
        v12 = 2;
    }
    else
    {
      v12 = 2;
    }
    objc_msgSend(v10, "postCommit:sender:", (char *)a3 + v11 + v12, self);

    v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x20) == 0)
    {
LABEL_5:
      if ((v7 & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_18;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  v13 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
  objc_msgSend(v13, "postCommit:sender:", xAxisUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_6:
    if ((v7 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v14 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
  objc_msgSend(v14, "postCommit:sender:", yAxisUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_7:
    if ((v7 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v15 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  objc_msgSend(v15, "postCommit:sender:", upButtonUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_8:
    if ((v7 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v16 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
  objc_msgSend(v16, "postCommit:sender:", downButtonUpdateContext((uint64_t)a3), self);

  v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x200) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0)
      return;
    goto LABEL_10;
  }
LABEL_21:
  v17 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
  objc_msgSend(v17, "postCommit:sender:", leftButtonUpdateContext((uint64_t)a3), self);

  if ((*(_WORD *)((_BYTE *)a3 + v8) & 0x400) != 0)
  {
LABEL_10:
    v9 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
    objc_msgSend(v9, "postCommit:sender:", rightButtonUpdateContext((uint64_t)a3), self);

  }
}

- (BOOL)isEqualToElement:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  if (!-[_GCDevicePhysicalInputElement isEqualToElement:](&v32, sel_isEqualToElement_))
    return 0;
  if (self)
  {
    v5 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_upValueFieldSlot);
    if (a3)
    {
LABEL_4:
      v6 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 56);
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
  if (self)
  {
    v7 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_downValueFieldSlot);
    if (a3)
    {
LABEL_8:
      v8 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 64);
      goto LABEL_9;
    }
  }
  else
  {
    v7 = 0;
    if (a3)
      goto LABEL_8;
  }
  v8 = 0;
LABEL_9:
  if (v7 != v8)
    return 0;
  if (self)
  {
    v9 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_leftValueFieldSlot);
    if (a3)
    {
LABEL_12:
      v10 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 72);
      goto LABEL_13;
    }
  }
  else
  {
    v9 = 0;
    if (a3)
      goto LABEL_12;
  }
  v10 = 0;
LABEL_13:
  if (v9 != v10)
    return 0;
  if (self)
  {
    v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rightValueFieldSlot);
    if (a3)
    {
LABEL_16:
      v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 80);
      goto LABEL_17;
    }
  }
  else
  {
    v11 = 0;
    if (a3)
      goto LABEL_16;
  }
  v12 = 0;
LABEL_17:
  if (v11 != v12)
    return 0;
  v13 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
  v14 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)a3);
  if (-[_GCDevicePhysicalInputAxis2DInput isEqualToInput:]((uint64_t)v13, v14))
  {
    v15 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
    v16 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)a3);
    if (-[_GCDevicePhysicalInputAxisInput isEqualToInput:]((uint64_t)v15, v16))
    {
      v17 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
      v18 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)a3);
      if (-[_GCDevicePhysicalInputAxisInput isEqualToInput:]((uint64_t)v17, v18))
      {
        v19 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
        v20 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)a3);
        if (-[_GCDevicePhysicalInputButtonInput isEqualToInput:]((_BOOL8)v19, v20))
        {
          v29 = v19;
          v30 = -[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
          v31 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)a3);
          if (-[_GCDevicePhysicalInputButtonInput isEqualToInput:](v30, v31))
          {
            v21 = -[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
            v27 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)a3);
            v28 = (void *)v21;
            if (-[_GCDevicePhysicalInputButtonInput isEqualToInput:](v21, v27))
            {
              v22 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
              v23 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)a3);
              v24 = -[_GCDevicePhysicalInputButtonInput isEqualToInput:]((_BOOL8)v22, v23);

            }
            else
            {
              v24 = 0;
            }
            v19 = v29;
            v26 = (void *)v30;

          }
          else
          {
            v24 = 0;
            v26 = (void *)v30;
          }

        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
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
  void *v15;

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
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<Direction Pad '%@'; up = %f, down = %f, left = %f, right = %f>"),
    v3,
    *(_QWORD *)&v6,
    *(_QWORD *)&v9,
    *(_QWORD *)&v12,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (GCAxis2DInput)xyAxes
{
  return (GCAxis2DInput *)(id)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
}

- (GCAxisInput)xAxis
{
  return (GCAxisInput *)(id)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
}

- (GCAxisInput)yAxis
{
  return (GCAxisInput *)(id)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
}

- (GCLinearInput)up
{
  return (GCLinearInput *)(id)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
}

- (GCLinearInput)down
{
  return (GCLinearInput *)(id)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
}

- (GCLinearInput)left
{
  return (GCLinearInput *)(id)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
}

- (GCLinearInput)right
{
  return (GCLinearInput *)(id)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  unsigned __int8 v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  __int16 v31;
  float v32;
  float v33;
  float v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t updated;
  int v41;
  __int16 v42;
  float v43;
  float v44;
  float v45;
  float v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  float v53;
  float v54;
  void *v55;
  uint64_t v56;
  int v57;
  __int16 v58;
  float v59;
  float v60;
  void *v61;
  uint64_t v62;
  int v63;
  __int16 v64;
  float v65;
  float v66;
  void *v67;
  uint64_t v68;
  int v69;
  __int16 v70;
  float v71;
  float v72;
  void *v73;
  uint64_t v74;
  int v75;
  __int16 v76;
  uint64_t v78;
  uint64_t v79;
  objc_super v80;

  v80.receiver = self;
  v80.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v80, sel_update_forGamepadEvent_withTimestamp_);
  v10 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    v10 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
    MyUpdateContext_Offset_8 = v10;
  }
  v11 = v10;
  if (self)
  {
    v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_upValueFieldSlot);
    v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_downValueFieldSlot);
    v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_leftValueFieldSlot);
    v15 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rightValueFieldSlot);
  }
  else
  {
    v14 = 0;
    v12 = 0;
    v13 = 0;
    v15 = 0;
  }
  v16 = v12 == -1 || v13 == -1;
  v17 = !v16;
  v79 = v15;
  if (!v16 && v14 != -1 && v15 != -1)
  {
    objc_msgSend(a4, "floatValueForElement:");
    v19 = v18;
    objc_msgSend(a4, "floatValueForElement:", v14);
    v21 = v20;
    objc_msgSend(a4, "floatValueForElement:", v12);
    v23 = v22;
    v78 = v13;
    objc_msgSend(a4, "floatValueForElement:", v13);
    v25 = v24;
    v26 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
    if ((xyAxesUpdateContext_Offset & 1) == 0)
      xyAxesUpdateContext_Offset = 1;
    v27 = v19 - v21;
    v28 = MyUpdateContext_Offset_8;
    if (MyUpdateContext_Offset_8 == -1)
    {
      v28 = +[_GCDevicePhysicalInputElement updateContextSize](_GCDevicePhysicalInputElement, "updateContextSize");
      MyUpdateContext_Offset_8 = v28;
      v29 = 0xFFFFFFFFLL;
      if (xyAxesUpdateContext_Offset)
        v29 = 2;
    }
    else
    {
      v29 = 2;
    }
    v30 = -[_GCDevicePhysicalInputAxis2DInput update:withValue:timestamp:]((uint64_t)v26, (uint64_t)a3 + v28 + v29, v27, v23 - v25, a5);
    if (v30)
      v31 = 16;
    else
      v31 = 0;
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFEF | v31;
    v9 |= v30;

    v15 = v79;
    v13 = v78;
  }
  if (v14 != -1 && v15 != -1)
  {
    objc_msgSend(a4, "floatValueForElement:");
    v33 = v32;
    objc_msgSend(a4, "floatValueForElement:", v14);
    v35 = v33 - v34;
    v36 = v14;
    v37 = v12;
    v38 = v13;
    v39 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
    updated = xAxisUpdateContext((uint64_t)a3);
    v41 = -[_GCDevicePhysicalInputAxisInput update:withValue:timestamp:]((uint64_t)v39, updated, v35, a5);
    if (v41)
      v42 = 32;
    else
      v42 = 0;
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFDF | v42;
    v9 |= v41;

    v13 = v38;
    v12 = v37;
    v14 = v36;
  }
  if (v17)
  {
    objc_msgSend(a4, "floatValueForElement:", v12);
    v44 = v43;
    objc_msgSend(a4, "floatValueForElement:", v13);
    v46 = v44 - v45;
    v47 = v13;
    v48 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
    v49 = yAxisUpdateContext((uint64_t)a3);
    v50 = -[_GCDevicePhysicalInputAxisInput update:withValue:timestamp:]((uint64_t)v48, v49, v46, a5);
    if (v50)
      v51 = 64;
    else
      v51 = 0;
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFFBF | v51;
    v9 |= v50;

    v13 = v47;
    v52 = v79;
  }
  else
  {
    v52 = v79;
    if (v12 == -1)
      goto LABEL_38;
  }
  objc_msgSend(a4, "floatValueForElement:", v12);
  v54 = v53;
  v55 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  v56 = upButtonUpdateContext((uint64_t)a3);
  v57 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v55, v56, v54, a5);
  if (v57)
    v58 = 128;
  else
    v58 = 0;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFF7F | v58;
  v9 |= v57;

LABEL_38:
  if (v13 != -1)
  {
    objc_msgSend(a4, "floatValueForElement:", v13);
    v60 = v59;
    v61 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
    v62 = downButtonUpdateContext((uint64_t)a3);
    v63 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v61, v62, v60, a5);
    if (v63)
      v64 = 256;
    else
      v64 = 0;
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFEFF | v64;
    v9 |= v63;

  }
  if (v14 != -1)
  {
    objc_msgSend(a4, "floatValueForElement:", v14);
    v66 = v65;
    v67 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
    v68 = leftButtonUpdateContext((uint64_t)a3);
    v69 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v67, v68, v66, a5);
    if (v69)
      v70 = 512;
    else
      v70 = 0;
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFDFF | v70;
    v9 |= v69;

  }
  if (v52 != -1)
  {
    objc_msgSend(a4, "floatValueForElement:", v52);
    v72 = v71;
    v73 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
    v74 = rightButtonUpdateContext((uint64_t)a3);
    v75 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v73, v74, v72, a5);
    if (v75)
      v76 = 1024;
    else
      v76 = 0;
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((_BYTE *)a3 + v11) & 0xFBFF | v76;
    v9 |= v75;

  }
  return v9;
}

@end
