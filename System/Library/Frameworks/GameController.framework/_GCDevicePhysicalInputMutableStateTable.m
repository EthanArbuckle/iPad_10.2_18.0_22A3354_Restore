@implementation _GCDevicePhysicalInputMutableStateTable

- (_WORD)initWithMagic:(void *)a1
{
  _WORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)_GCDevicePhysicalInputMutableStateTable;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  v3[4] = a2;
  *((_QWORD *)v3 + 2) = objc_msgSend(objc_alloc((Class)&off_254DF7108), "initWithOptions:", 2);
  *((_QWORD *)v3 + 3) = objc_msgSend(objc_alloc((Class)&off_254DF7108), "initWithOptions:", 2);
  *((_QWORD *)v3 + 4) = objc_msgSend(objc_alloc((Class)&off_254DF7108), "initWithOptions:", 2);
  return v3;
}

- (_GCDevicePhysicalInputMutableStateTable)init
{
  unsigned __int16 v2;

  do
    v2 = __ldxr(init_Magic);
  while (__stxr(v2 + 1, init_Magic));
  return (_GCDevicePhysicalInputMutableStateTable *)-[_GCDevicePhysicalInputMutableStateTable initWithMagic:](self, v2 ^ (unsigned __int16)self);
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  if (-[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount"))
  {
    v3 = 0;
    do
    {
      -[_GCDevicePhysicalInputMutableStateTable setObjectValue:atIndex:policy:](self, "setObjectValue:atIndex:policy:", 0, v3, 0);
      v3 = (v3 + 1);
    }
    while (v3 < -[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount"));
  }

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputMutableStateTable;
  -[_GCDevicePhysicalInputMutableStateTable dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  uint64_t v5;
  unint64_t v6;

  v4 = +[_GCDevicePhysicalInputStateTable stateTableWithMagic:primitiveSlotCount:objectSlotCount:]((uint64_t)_GCDevicePhysicalInputStateTable, self->_magic, -[_GCDevicePhysicalInputMutableStateTable primitiveSlotCount](self, "primitiveSlotCount", a3), -[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount"));
  if (-[_GCDevicePhysicalInputMutableStateTable primitiveSlotCount](self, "primitiveSlotCount"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v4, "setPrimitiveValue:atIndex:", -[_GCDevicePhysicalInputMutableStateTable primitiveValueAtIndex:](self, "primitiveValueAtIndex:", v5), v5);
      v5 = (v5 + 1);
    }
    while (v5 < -[_GCDevicePhysicalInputMutableStateTable primitiveSlotCount](self, "primitiveSlotCount"));
  }
  if (-[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "setObjectValue:atIndex:policy:", -[_GCDevicePhysicalInputMutableStateTable objectValueAtIndex:](self, "objectValueAtIndex:", v6), v6, -[NSPointerArray pointerAtIndex:](self->_objectPolicyState, "pointerAtIndex:", v6));
      ++v6;
    }
    while (v6 < -[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount"));
  }
  return v4;
}

- (id)copy
{
  return -[_GCDevicePhysicalInputMutableStateTable copyWithZone:](self, "copyWithZone:", 0);
}

- (unsigned)primitiveSlotCount
{
  return -[NSPointerArray count](self->_primitiveState, "count");
}

- (unsigned)objectSlotCount
{
  return -[NSPointerArray count](self->_objectState, "count");
}

- (id)allocatePrimitiveSlot
{
  id *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, "primitiveSlotCount");
    objc_msgSend(v1[2], "addPointer:", 0);
    return (id *)v2;
  }
  return result;
}

- (unint64_t)primitiveValueAtIndex:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[_GCDevicePhysicalInputMutableStateTable primitiveSlotCount](self, "primitiveSlotCount") <= a3)
    -[_GCDevicePhysicalInputMutableStateTable primitiveValueAtIndex:].cold.1((uint64_t)self, (uint64_t)a2, v3);
  return (unint64_t)-[NSPointerArray pointerAtIndex:](self->_primitiveState, "pointerAtIndex:", v3);
}

- (void)setPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (-[_GCDevicePhysicalInputMutableStateTable primitiveSlotCount](self, "primitiveSlotCount") <= a4)
    -[_GCDevicePhysicalInputMutableStateTable setPrimitiveValue:atIndex:].cold.1((uint64_t)self, (uint64_t)a2, v4);
  -[NSPointerArray replacePointerAtIndex:withPointer:](self->_primitiveState, "replacePointerAtIndex:withPointer:", v4, a3);
}

- (BOOL)testAndSetPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4 previous:(unint64_t *)a5
{
  uint64_t v6;
  void *v10;
  void *v11;

  v6 = *(_QWORD *)&a4;
  if (-[_GCDevicePhysicalInputMutableStateTable primitiveSlotCount](self, "primitiveSlotCount") <= a4)
    -[_GCDevicePhysicalInputMutableStateTable testAndSetPrimitiveValue:atIndex:previous:].cold.1((uint64_t)self, (uint64_t)a2, v6);
  v10 = -[NSPointerArray pointerAtIndex:](self->_primitiveState, "pointerAtIndex:", v6);
  v11 = v10;
  if (v10 != (void *)a3)
  {
    if (a5)
      *a5 = (unint64_t)v10;
    -[_GCDevicePhysicalInputMutableStateTable setPrimitiveValue:atIndex:](self, "setPrimitiveValue:atIndex:", a3, v6);
  }
  return v11 != (void *)a3;
}

- (uint64_t)allocateObjectSlot
{
  uint64_t v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "objectSlotCount");
  if ((_DWORD)v2 == -1)
    -[_GCDevicePhysicalInputMutableStateTable allocateObjectSlot].cold.1((uint64_t)sel_allocateObjectSlot, (uint64_t)a1);
  v3 = v2;
  objc_msgSend(a1[4], "addPointer:", 0);
  objc_msgSend(a1[3], "addPointer:", 0);
  return v3;
}

- (id)objectValueAtIndex:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount") <= a3)
    -[_GCDevicePhysicalInputMutableStateTable objectValueAtIndex:].cold.1((uint64_t)self, (uint64_t)a2, v3);
  return -[NSPointerArray pointerAtIndex:](self->_objectState, "pointerAtIndex:", v3);
}

- (void)setObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5
{
  uint64_t v6;
  void *v10;
  NSPointerArray *objectState;
  id v12;
  NSPointerArray *v13;
  uint64_t v14;
  NSPointerArray *v15;

  v6 = *(_QWORD *)&a4;
  if (-[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount") <= a4)
    -[_GCDevicePhysicalInputMutableStateTable setObjectValue:atIndex:policy:].cold.1((uint64_t)self, (uint64_t)a2, v6);
  v10 = -[NSPointerArray pointerAtIndex:](self->_objectPolicyState, "pointerAtIndex:", v6);
  objectState = self->_objectState;
  if (v10)
  {

    objectState = self->_objectState;
  }
  -[NSPointerArray replacePointerAtIndex:withPointer:](objectState, "replacePointerAtIndex:withPointer:", v6, 0);
  if ((uint64_t)a5 > 2)
  {
    if (a5 != 769)
    {
      v12 = (id)objc_msgSend(a3, "copyWithZone:", 0);
      v13 = self->_objectState;
LABEL_10:
      v14 = v6;
      goto LABEL_11;
    }
LABEL_9:
    v15 = self->_objectState;
    v12 = a3;
    v13 = v15;
    goto LABEL_10;
  }
  if (a5)
    goto LABEL_9;
  v13 = self->_objectState;
  v14 = v6;
  v12 = a3;
LABEL_11:
  -[NSPointerArray replacePointerAtIndex:withPointer:](v13, "replacePointerAtIndex:withPointer:", v14, v12);
  -[NSPointerArray replacePointerAtIndex:withPointer:](self->_objectPolicyState, "replacePointerAtIndex:withPointer:", v6, a5);
}

- (BOOL)testAndSetObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5 compareObjects:(BOOL)a6 previous:(id *)a7
{
  _BOOL4 v8;
  uint64_t v10;
  id v14;
  void *v15;

  v8 = a6;
  v10 = *(_QWORD *)&a4;
  if (-[_GCDevicePhysicalInputMutableStateTable objectSlotCount](self, "objectSlotCount") <= a4)
    -[_GCDevicePhysicalInputMutableStateTable testAndSetObjectValue:atIndex:policy:compareObjects:previous:].cold.1((uint64_t)self, (uint64_t)a2, v10);
  v14 = -[NSPointerArray pointerAtIndex:](self->_objectState, "pointerAtIndex:", v10);
  v15 = v14;
  if (v8)
  {
    if (v14 == a3 || (objc_msgSend(a3, "isEqual:", v14) & 1) != 0)
      return 0;
  }
  else if (v14 == a3)
  {
    return 0;
  }
  if (a7)
    *a7 = v15;
  -[_GCDevicePhysicalInputMutableStateTable setObjectValue:atIndex:policy:](self, "setObjectValue:atIndex:policy:", a3, v10, a5);
  return 1;
}

- (unsigned)magic
{
  return self->_magic;
}

- (void)primitiveValueAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 423, CFSTR("Index %u beyond bounds [0, %u)."), a3, OUTLINED_FUNCTION_1_5());
  __break(1u);
}

- (void)setPrimitiveValue:(uint64_t)a3 atIndex:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 432, CFSTR("Index %u beyond bounds [0, %u)."), a3, OUTLINED_FUNCTION_1_5());
  __break(1u);
}

- (void)testAndSetPrimitiveValue:(uint64_t)a1 atIndex:(uint64_t)a2 previous:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 441, CFSTR("Index %u beyond bounds [0, %u)."), a3, OUTLINED_FUNCTION_1_5());
  __break(1u);
}

- (void)allocateObjectSlot
{
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a1, a2, CFSTR("_GCDevicePhysicalInputStorage.m"), 459, CFSTR("Too many slots allocated."));
  __break(1u);
}

- (void)objectValueAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 470, CFSTR("Index %u beyond bounds [0, %u)."), a3, OUTLINED_FUNCTION_0_6());
  __break(1u);
}

- (void)setObjectValue:(uint64_t)a1 atIndex:(uint64_t)a2 policy:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 479, CFSTR("Index %u beyond bounds [0, %u)."), a3, OUTLINED_FUNCTION_0_6());
  __break(1u);
}

- (void)testAndSetObjectValue:(uint64_t)a3 atIndex:policy:compareObjects:previous:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  unk_254DEC4F8(&off_254DEC660, "currentHandler");
  objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 524, CFSTR("Index %u beyond bounds [0, %u)."), a3, OUTLINED_FUNCTION_0_6());
  __break(1u);
}

@end
