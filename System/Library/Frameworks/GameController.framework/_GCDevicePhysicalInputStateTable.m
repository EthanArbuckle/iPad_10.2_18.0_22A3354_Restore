@implementation _GCDevicePhysicalInputStateTable

+ (_DWORD)stateTableWithMagic:(unsigned int)a3 primitiveSlotCount:(unsigned int)a4 objectSlotCount:
{
  objc_class *v7;
  _DWORD *Instance;

  objc_opt_self();
  v7 = (objc_class *)objc_opt_class();
  Instance = class_createInstance(v7, 16 * a4 + 8 * a3);
  Instance[2] = 0;
  *((_WORD *)Instance + 6) = a2;
  *((_QWORD *)Instance + 2) = 1;
  Instance[8] = a3;
  *((_QWORD *)Instance + 5) = object_getIndexedIvars(Instance);
  *((_QWORD *)Instance + 3) = 1;
  Instance[9] = a4;
  *((_QWORD *)Instance + 6) = (char *)object_getIndexedIvars(Instance) + 8 * a3;
  return Instance;
}

+ (_DWORD)stateTableWithCopyOfStateTable:(uint64_t)a1
{
  uint64_t v3;
  _DWORD *v4;

  v3 = objc_opt_self();
  if (!a2)
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_stateTableWithCopyOfStateTable_, v3, CFSTR("_GCDevicePhysicalInputStorage.m"), 124, CFSTR("Invalid parameter not satisfying: %s"), "otherState != nil");
  v4 = +[_GCDevicePhysicalInputStateTable stateTableWithMagic:primitiveSlotCount:objectSlotCount:]((uint64_t)_GCDevicePhysicalInputStateTable, *(_WORD *)(a2 + 12), *(_DWORD *)(a2 + 32), *(_DWORD *)(a2 + 36));
  -[_GCDevicePhysicalInputStateTable updateStateTableWithContentsOf:]((uint64_t)v4, a2);
  return v4;
}

- (void)updateStateTableWithContentsOf:(uint64_t)a1
{
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  if (a1)
  {
    if (*(unsigned __int16 *)(a1 + 12) != *(unsigned __int16 *)(a2 + 12))
      objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 163, CFSTR("#BUG: Updating state %p from state %p with different magic."), a1, a2);
    os_unfair_lock_lock_with_options();
    os_unfair_lock_lock_with_options();
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a1 + 16);
    if (v4 < v5)
    {
      objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 169, CFSTR("#BUG: Updating state %p from state %p with earlier generation."), a1, a2);
      v4 = *(_QWORD *)(a2 + 16);
      v5 = *(_QWORD *)(a1 + 16);
    }
    if (v4 > v5)
    {
      v6 = *(_DWORD *)(a1 + 32);
      if (v6 != *(_DWORD *)(a2 + 32))
      {
        objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 173, CFSTR("#BUG: Updating state %p from state %p with different primitive slot count."), a1, a2);
        v6 = *(_DWORD *)(a1 + 32);
      }
      memcpy(*(void **)(a1 + 40), *(const void **)(a2 + 40), 8 * v6);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    }
    v7 = *(_QWORD *)(a2 + 24);
    v8 = *(_QWORD *)(a1 + 24);
    if (v7 < v8)
    {
      objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 180, CFSTR("#BUG: Updating state %p from state %p with earlier generation."), a1, a2);
      v7 = *(_QWORD *)(a2 + 24);
      v8 = *(_QWORD *)(a1 + 24);
    }
    if (v7 > v8)
    {
      v9 = *(unsigned int *)(a1 + 36);
      if (v9 == *(_DWORD *)(a2 + 36))
      {
        if (*(_DWORD *)(a1 + 36))
        {
LABEL_15:
          v10 = 0;
          v11 = 0;
          v12 = *(_QWORD *)(a1 + 48);
          v13 = *(_QWORD *)(a2 + 48);
          while (1)
          {
            v14 = v12 + v10;
            v15 = *(void **)(v12 + v10 + 8);
            if (v15 != *(void **)(v13 + v10 + 8))
              break;
            v16 = *(_QWORD *)(v12 + v10);
            if (v16 != *(_QWORD *)(v13 + v10))
              goto LABEL_19;
LABEL_25:
            ++v11;
            v10 += 16;
            if (v11 >= v9)
              goto LABEL_26;
          }
          v16 = *(_QWORD *)(v12 + v10);
LABEL_19:
          if (v16)
          {

            v13 = *(_QWORD *)(a2 + 48);
          }
          *(_QWORD *)(v14 + 8) = 0;
          v17 = *(void **)(v13 + v10 + 8);
          if (*(_QWORD *)(v13 + v10))
          {
            v18 = v17;
            v12 = *(_QWORD *)(a1 + 48);
            *(_QWORD *)(v12 + v10 + 8) = v18;
            v13 = *(_QWORD *)(a2 + 48);
          }
          else
          {
            v12 = *(_QWORD *)(a1 + 48);
            *(_QWORD *)(v12 + v10 + 8) = v17;
          }
          *(_QWORD *)(v12 + v10) = *(_QWORD *)(v13 + v10);
          v9 = *(unsigned int *)(a1 + 36);
          goto LABEL_25;
        }
      }
      else
      {
        objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, CFSTR("_GCDevicePhysicalInputStorage.m"), 184, CFSTR("#BUG: Updating state %p from state %p with different object slot count."), a1, a2);
        v9 = *(unsigned int *)(a1 + 36);
        if (*(_DWORD *)(a1 + 36))
          goto LABEL_15;
      }
LABEL_26:
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 8));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (_GCDevicePhysicalInputStateTable)init
{
  _GCDevicePhysicalInputStateTable *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputStateTable;
  result = -[_GCDevicePhysicalInputStateTable init](&v3, sel_init);
  result->_stateLock._os_unfair_lock_opaque = 0;
  result->_magic = -1;
  return result;
}

- (void)dealloc
{
  unint64_t objectSlotCount;
  uint64_t v4;
  unint64_t i;
  ObjectStateEntry *v6;
  objc_super v7;

  objectSlotCount = self->_objectSlotCount;
  if ((_DWORD)objectSlotCount)
  {
    v4 = 0;
    for (i = 0; i < objectSlotCount; ++i)
    {
      v6 = &self->_objectState[v4];
      if (v6->var0)
      {

        objectSlotCount = self->_objectSlotCount;
      }
      v6->var1 = 0;
      ++v4;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_GCDevicePhysicalInputStateTable;
  -[_GCDevicePhysicalInputStateTable dealloc](&v7, sel_dealloc);
}

- (id)copy
{
  return -[_GCDevicePhysicalInputStateTable copyWithZone:](self, "copyWithZone:", 0);
}

- (uint64_t)generation
{
  if (result)
  {
    if (*(_QWORD *)(result + 16) <= *(_QWORD *)(result + 24))
      return *(_QWORD *)(result + 24);
    else
      return *(_QWORD *)(result + 16);
  }
  return result;
}

- (unint64_t)primitiveValueAtIndex:(unsigned int)a3
{
  os_unfair_lock_s *p_stateLock;
  unint64_t var0;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if (self->_primitiveSlotCount <= a3)
    -[_GCDevicePhysicalInputStateTable primitiveValueAtIndex:].cold.1();
  var0 = self->_primitiveState[a3].var0;
  os_unfair_lock_unlock(p_stateLock);
  return var0;
}

- (void)setPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_primitiveSlotCount <= a4)
    -[_GCDevicePhysicalInputStateTable setPrimitiveValue:atIndex:].cold.1();
  self->_primitiveState[a4].var0 = a3;
  ++self->_primitiveStateGeneration;
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)testAndSetPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4 previous:(unint64_t *)a5
{
  os_unfair_lock_s *p_stateLock;
  PrimitiveStateEntry *primitiveState;
  unint64_t var0;
  BOOL v12;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_primitiveSlotCount <= a4)
    -[_GCDevicePhysicalInputStateTable testAndSetPrimitiveValue:atIndex:previous:].cold.1();
  primitiveState = self->_primitiveState;
  var0 = primitiveState[a4].var0;
  if (var0 != a3)
  {
    if (a5)
      *a5 = var0;
    primitiveState[a4].var0 = a3;
    ++self->_primitiveStateGeneration;
  }
  v12 = var0 != a3;
  os_unfair_lock_unlock(p_stateLock);
  return v12;
}

- (id)objectValueAtIndex:(unsigned int)a3
{
  os_unfair_lock_s *p_stateLock;
  id v6;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if (self->_objectSlotCount <= a3)
    -[_GCDevicePhysicalInputStateTable objectValueAtIndex:].cold.1();
  v6 = self->_objectState[a3].var1;
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (void)setObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5
{
  os_unfair_lock_s *p_stateLock;
  ObjectStateEntry *objectState;
  uint64_t v11;
  ObjectStateEntry *v12;
  id *p_var1;
  unint64_t var0;
  id v15;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_objectSlotCount <= a4)
    -[_GCDevicePhysicalInputStateTable setObjectValue:atIndex:policy:].cold.1();
  objectState = self->_objectState;
  v11 = a4;
  v12 = &objectState[a4];
  var0 = v12->var0;
  p_var1 = &v12->var1;
  if (var0)
  {

    objectState = self->_objectState;
  }
  *p_var1 = 0;
  if ((uint64_t)a5 > 2)
  {
    if (a5 == 3 || a5 == 771)
    {
      v15 = (id)objc_msgSend(a3, "copyWithZone:", 0);
LABEL_10:
      a3 = v15;
      goto LABEL_11;
    }
LABEL_9:
    v15 = a3;
    goto LABEL_10;
  }
  if (a5)
    goto LABEL_9;
LABEL_11:
  objectState[v11].var1 = a3;
  self->_objectState[v11].var0 = a5;
  ++self->_objectStateGeneration;
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)testAndSetObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5 compareObjects:(BOOL)a6 previous:(id *)a7
{
  _BOOL4 v8;
  os_unfair_lock_s *p_stateLock;
  ObjectStateEntry *v14;
  id var1;
  BOOL v16;
  ObjectStateEntry *objectState;
  ObjectStateEntry *v18;
  id *p_var1;
  unint64_t var0;
  id v21;

  v8 = a6;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_objectSlotCount <= a4)
    -[_GCDevicePhysicalInputStateTable testAndSetObjectValue:atIndex:policy:compareObjects:previous:].cold.1();
  v14 = &self->_objectState[a4];
  var1 = v14->var1;
  if (v8)
  {
    if (var1 == a3 || (objc_msgSend(a3, "isEqual:", v14->var1) & 1) != 0)
      goto LABEL_5;
LABEL_7:
    if (a7)
      *a7 = var1;
    objectState = self->_objectState;
    v18 = &objectState[a4];
    var0 = v18->var0;
    p_var1 = &v18->var1;
    if (var0)
    {

      objectState = self->_objectState;
    }
    *p_var1 = 0;
    if ((uint64_t)a5 <= 2)
    {
      if (!a5)
      {
LABEL_18:
        objectState[a4].var1 = a3;
        self->_objectState[a4].var0 = a5;
        ++self->_objectStateGeneration;
        v16 = 1;
        goto LABEL_19;
      }
    }
    else if (a5 == 3 || a5 == 771)
    {
      v21 = (id)objc_msgSend(a3, "copyWithZone:", 0);
LABEL_17:
      a3 = v21;
      goto LABEL_18;
    }
    v21 = a3;
    goto LABEL_17;
  }
  if (var1 != a3)
    goto LABEL_7;
LABEL_5:
  v16 = 0;
LABEL_19:
  os_unfair_lock_unlock(p_stateLock);
  return v16;
}

- (unsigned)magic
{
  return self->_magic;
}

- (unsigned)primitiveSlotCount
{
  return self->_primitiveSlotCount;
}

- (unsigned)objectSlotCount
{
  return self->_objectSlotCount;
}

- (void)primitiveValueAtIndex:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;

  OUTLINED_FUNCTION_2_5();
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, CFSTR("_GCDevicePhysicalInputStorage.m"), 226, CFSTR("Index %u beyond bounds [0, %u)."), v0, *v3);
  __break(1u);
}

- (void)setPrimitiveValue:atIndex:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;

  OUTLINED_FUNCTION_2_5();
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, CFSTR("_GCDevicePhysicalInputStorage.m"), 240, CFSTR("Index %u beyond bounds [0, %u)."), v0, *v3);
  __break(1u);
}

- (void)testAndSetPrimitiveValue:atIndex:previous:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;

  OUTLINED_FUNCTION_2_5();
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, CFSTR("_GCDevicePhysicalInputStorage.m"), 255, CFSTR("Index %u beyond bounds [0, %u)."), v0, *v3);
  __break(1u);
}

- (void)objectValueAtIndex:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;

  OUTLINED_FUNCTION_2_5();
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, CFSTR("_GCDevicePhysicalInputStorage.m"), 278, CFSTR("Index %u beyond bounds [0, %u)."), v0, *v3);
  __break(1u);
}

- (void)setObjectValue:atIndex:policy:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;

  OUTLINED_FUNCTION_2_5();
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, CFSTR("_GCDevicePhysicalInputStorage.m"), 292, CFSTR("Index %u beyond bounds [0, %u)."), v0, *v3);
  __break(1u);
}

- (void)testAndSetObjectValue:atIndex:policy:compareObjects:previous:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;

  OUTLINED_FUNCTION_2_5();
  objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, CFSTR("_GCDevicePhysicalInputStorage.m"), 309, CFSTR("Index %u beyond bounds [0, %u)."), v0, *v3);
  __break(1u);
}

@end
