@implementation IOGPUMetalResidencySet

- (void)setCurrentGeneration:(unint64_t)a3
{
  self->_currentGeneration = a3;
  self->_hashTable.m_currentGeneration = a3;
}

- (unint64_t)currentGeneration
{
  return self->_currentGeneration;
}

- (void)setExpiredGeneration:(unint64_t)a3
{
  self->_expiredGeneration = a3;
  self->_hashTable.m_expiredGeneration = a3;
}

- (unint64_t)expiredGeneration
{
  return self->_expiredGeneration;
}

- (IOGPUMetalResidencySet)initWithDevice:(id)a3 descriptor:(id)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unint64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)IOGPUMetalResidencySet;
  v10 = -[_MTLObjectWithLabel init](&v22, sel_init);
  if (v10)
  {
    v11 = a3;
    *((_QWORD *)v10 + 9) = v11;
    *((_QWORD *)v10 + 6) = IOGPUDeviceGetNextGlobalTraceID(objc_msgSend(v11, "deviceRef"));
    objc_msgSend(v10, "setCurrentGeneration:", 1);
    objc_msgSend(v10, "setExpiredGeneration:", 1);
    *((_BYTE *)v10 + 84) = objc_msgSend(a4, "evictsImmediately");
    v12 = objc_msgSend(a4, "initialCapacity");
    v13 = 128;
    if (v12)
      v13 = v12;
    v14 = 64;
    do
    {
      v15 = v14;
      v14 = (2 * v14);
    }
    while (v13 > v15);
    if (v15 > 0x40000)
      goto LABEL_14;
    a5->var0.var0 = 3;
    if (*((_BYTE *)v10 + 84))
      a5->var0.var10 = 0x400000;
    a5->var0.var16.var1.var0 = v15;
    v16 = IOGPUResourceCreate((mach_port_t *)objc_msgSend(*((id *)v10 + 9), "deviceRef"), a5, a6);
    *((_QWORD *)v10 + 8) = v16;
    if (v16)
    {
      *((_DWORD *)v10 + 10) = *(_DWORD *)(v16 + 48);
      *((_DWORD *)v10 + 20) = 0;
      IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::init((int32x2_t *)v10 + 13, v15, 0x40000u);
      v17 = (_DWORD *)__globalGPUCommPage;
      if (*(_DWORD *)__globalGPUCommPage)
      {
        objc_msgSend(a4, "initialCapacity");
        IOGPUDeviceTraceEvent();
        v17 = (_DWORD *)__globalGPUCommPage;
      }
      if (*v17)
      {
        v18 = objc_msgSend(*((id *)v10 + 9), "deviceRef");
        v19 = *((_QWORD *)v10 + 6);
        v20 = *((_QWORD *)v10 + 7);
        objc_msgSend((id)objc_msgSend(a4, "label"), "cStringUsingEncoding:", 1);
        *((_QWORD *)v10 + 7) = IOGPUDeviceTraceObjectLabel(v18, 8, 0, v19, v20);
      }
    }
    else
    {
LABEL_14:

      return 0;
    }
  }
  return (IOGPUMetalResidencySet *)v10;
}

- (void)dealloc
{
  __IOGPUResource *groupRef;
  objc_super v4;

  groupRef = self->_groupRef;
  if (groupRef)
    CFRelease(groupRef);
  IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::releaseAllKeys((uint64_t *)&self->_hashTable);

  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalResidencySet;
  -[_MTLObjectWithLabel dealloc](&v4, sel_dealloc);
}

- (unint64_t)allocatedSize
{
  return IOGPUResourceGroupGetAllocationSize((uint64_t)self->_groupRef);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)endResidency
{
  int v2;

  v2 = 2;
  IOGPUResourceSetPurgeable((uint64_t)self->_groupRef, 6uLL, &v2);
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
}

- (void)requestResidency
{
  int v2;

  v2 = 4;
  IOGPUResourceSetPurgeable((uint64_t)self->_groupRef, 5uLL, &v2);
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v5;
  IOGPUGenerationalSet<id, IOGPUMTLIdKey, IOGPUMTLObjectHashAllocator> *p_hashTable;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned int *m_hopInfo;
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  IOGPUMTLIdKey *m_keyTable;
  unint64_t *m_generationTable;
  uint64_t v31;
  unint64_t v32;
  unint64_t *m_dirtyInfo;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  unsigned int v40;
  unint64_t m_currentGeneration;
  int v42;
  unint64_t v43;
  unsigned int m_usedMask;
  int v45;
  unint64_t *m_usedInfo;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t *m_dirtyInfoH;
  uint64_t v54;
  unint64_t v55;
  id v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int *p_m_count;

  if (a4)
  {
    v5 = 0;
    p_hashTable = &self->_hashTable;
    p_m_count = &self->_hashTable.m_count;
    do
    {
      v7 = (unint64_t)a3[v5];
      v8 = (void *)(v7 & 0xFFFFFFFFFFFFFFFCLL);
      v9 = 0x9E3779B97F4A7C15 * (v7 & 0xFFFFFFFFFFFFFFFCLL);
      v10 = v9 >> -LOBYTE(p_hashTable->m_hashShift);
      v11 = p_hashTable->m_hopInfo[v10];
      while (v11)
      {
        v12 = __clz(__rbit32(v11));
        v11 &= ~(1 << v12);
        v13 = (v12 + v10) & (p_hashTable->m_hashSize - 1);
        v14 = *((_QWORD *)p_hashTable->m_keyTable + v13);
        if ((void *)(v14 & 0xFFFFFFFFFFFFFFFCLL) == v8)
        {
          *((_QWORD *)p_hashTable->m_keyTable + v13) = v14 | 2;
          goto LABEL_37;
        }
      }
LABEL_27:
      v40 = 0;
      m_currentGeneration = p_hashTable->m_currentGeneration;
      v42 = p_hashTable->m_hashSize - 1;
      v43 = v9 >> -LOBYTE(p_hashTable->m_hashShift);
      m_usedMask = p_hashTable->m_usedMask;
      v45 = v43 & 0x3F;
      m_usedInfo = p_hashTable->m_usedInfo;
      v47 = m_usedInfo[v43 >> 6] | ~(-1 << v43);
      v48 = v43 >> 6 << 6;
      v49 = (v43 >> 6) + 1;
      while (v47 == -1)
      {
        v40 = v40 - v45 + 64;
        v47 = m_usedInfo[v49 & m_usedMask];
        v48 += 64;
        ++v49;
        v45 = 0;
        if (v40 >= 0x80)
        {
LABEL_32:
          if ((IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::rehash((uint64_t)p_hashTable, 0) & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
              -[IOGPUMetalResidencySet addAllocations:count:].cold.1((uint64_t)p_m_count, v58, v59, v60, v61, v62, v63, v64);
            abort();
          }
          goto LABEL_27;
        }
      }
      v27 = __clz(__rbit64(~v47)) + v48;
      if ((v27 - v43) > 0x7F)
        goto LABEL_32;
      LODWORD(v15) = p_hashTable->m_usedMask;
      while ((v27 - v43) >= 0x20)
      {
        v16 = v27 - 31;
        if (v27 < 0x1F)
        {
LABEL_20:
          v25 = v27;
        }
        else
        {
          m_hopInfo = p_hashTable->m_hopInfo;
          if (v27 < (int)v27 - 30)
            v16 = v27 - 30;
          else
            v16 = v27;
          v18 = -31;
          while (1)
          {
            v19 = v27 + v18;
            v20 = ((_DWORD)v27 + v18) & v42;
            v21 = m_hopInfo[v20];
            v22 = __clz(__rbit32(v21));
            v23 = (_DWORD)v27 + v18 + v22;
            if (v21 && v23 < v27)
              break;
            if (!__CFADD__((_DWORD)v27, ++v18))
              goto LABEL_20;
          }
          v28 = v23 & v42;
          m_keyTable = p_hashTable->m_keyTable;
          m_generationTable = p_hashTable->m_generationTable;
          v31 = *((_QWORD *)p_hashTable->m_keyTable + v28);
          v32 = m_generationTable[v28];
          m_hopInfo[v20] = v21 & ~(1 << v22) | (1 << -(char)v18);
          m_dirtyInfo = p_hashTable->m_dirtyInfo;
          v15 = p_hashTable->m_usedMask;
          v34 = v15 & (v23 >> 6);
          v35 = m_dirtyInfo[v34];
          if ((v35 & (1 << (v19 + v22))) != 0)
          {
            m_dirtyInfo[v34] = v35 & ~(1 << v23);
            v36 = v15 & ((unint64_t)v27 >> 6);
            m_dirtyInfo[v36] |= 1 << v27;
            v37 = 1 << v36;
            v38 = p_hashTable->m_dirtyHMask & (v36 >> 6);
            p_hashTable->m_dirtyInfoH[v38] |= v37;
          }
          v25 = v19 + v22;
          m_usedInfo[m_usedMask & (v27 >> 6)] |= 1 << v27;
          v39 = v27 & v42;
          *((_QWORD *)m_keyTable + v39) = v31;
          m_generationTable[v39] = v32;
          *((_QWORD *)m_keyTable + v28) = 2;
          m_usedInfo[m_usedMask & (v23 >> 6)] &= ~(1 << (v19 + v22));
          v16 = v19;
        }
        v26 = v16 == (_DWORD)v27;
        v27 = v25;
        if (v26)
          goto LABEL_32;
      }
      v50 = v27 & v42;
      v51 = p_hashTable->m_generationTable;
      *((_QWORD *)p_hashTable->m_keyTable + v50) = v7 | 2;
      v51[v50] = m_currentGeneration;
      if ((v7 & 1 | 2) == 2)
      {
        v52 = v15 & ((unint64_t)v27 >> 6);
        m_dirtyInfoH = p_hashTable->m_dirtyInfoH;
        p_hashTable->m_dirtyInfo[v52] |= 1 << v27;
        v54 = 1 << v52;
        v55 = p_hashTable->m_dirtyHMask & (v52 >> 6);
        m_dirtyInfoH[v55] |= v54;
        ++p_hashTable->m_dirtyCount;
      }
      p_hashTable->m_hopInfo[v43] |= 1 << (v27 - v43);
      m_usedInfo[m_usedMask & (v27 >> 6)] |= 1 << v27;
      ++p_hashTable->m_count;
      v56 = v8;
LABEL_37:
      if (*(_DWORD *)__globalGPUCommPage)
      {
        objc_msgSend((id)v7, "allocatedSize");
        IOGPUDeviceTraceEvent();
      }
      ++v5;
    }
    while (v5 != a4);
  }
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  const void **v5;
  uint64_t v6;
  IOGPUGenerationalSet<id, IOGPUMTLIdKey, IOGPUMTLObjectHashAllocator> *p_hashTable;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  IOGPUMTLIdKey *m_keyTable;
  uint64_t v17;
  int v18;
  unint64_t *m_usedInfo;
  uint64_t m_usedMask;
  unint64_t v21;
  unint64_t *m_dirtyInfoH;
  uint64_t v23;
  unint64_t v24;

  if (a4)
  {
    v4 = a4;
    v5 = a3;
    v6 = 0;
    p_hashTable = &self->_hashTable;
    do
    {
      v8 = (unint64_t)v5[v6] & 0xFFFFFFFFFFFFFFFCLL;
      v9 = (0x9E3779B97F4A7C15 * v8) >> -LOBYTE(self->_hashTable.m_hashShift);
      v10 = v9;
      v11 = self->_hashTable.m_hopInfo[v9];
      while (v11)
      {
        v12 = __clz(__rbit32(v11));
        v13 = 1 << v12;
        v11 &= ~(1 << v12);
        v14 = v12 + v9;
        v15 = v14 & (self->_hashTable.m_hashSize - 1);
        m_keyTable = p_hashTable->m_keyTable;
        v17 = *((_QWORD *)p_hashTable->m_keyTable + v15);
        if ((v17 & 0xFFFFFFFFFFFFFFFCLL) == v8)
        {
          *((_QWORD *)m_keyTable + v15) = v17 & 0xFFFFFFFFFFFFFFFDLL;
          if ((v17 & 1) != 0)
          {
            m_usedMask = self->_hashTable.m_usedMask;
            self->_hashTable.m_generationTable[self->_hashTable.m_hashMask & v14] = self->_hashTable.m_currentGeneration;
            v21 = m_usedMask & (v14 >> 6);
            m_dirtyInfoH = self->_hashTable.m_dirtyInfoH;
            self->_hashTable.m_dirtyInfo[v21] |= 1 << v14;
            v23 = 1 << v21;
            v24 = self->_hashTable.m_dirtyHMask & (v21 >> 6);
            m_dirtyInfoH[v24] |= v23;
            ++self->_hashTable.m_dirtyCount;
          }
          else
          {
            v18 = ~v13;

            *((_QWORD *)m_keyTable + v15) = 0;
            m_usedInfo = self->_hashTable.m_usedInfo;
            self->_hashTable.m_hopInfo[v10] &= v18;
            v5 = a3;
            v4 = a4;
            m_usedInfo[self->_hashTable.m_usedMask & (v14 >> 6)] &= ~(1 << v14);
            --self->_hashTable.m_count;
          }
          break;
        }
      }
      if (*(_DWORD *)__globalGPUCommPage)
        IOGPUDeviceTraceEvent();
      ++v6;
    }
    while (v6 != v4);
  }
}

- (void)addAllocation:(id)a3
{
  IOGPUGenerationalSet<id, IOGPUMTLIdKey, IOGPUMTLObjectHashAllocator> *p_hashTable;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t m_currentGeneration;
  int v15;
  unint64_t v16;
  unsigned int m_usedMask;
  int v18;
  unint64_t *m_usedInfo;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unsigned int *m_hopInfo;
  int v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  IOGPUMTLIdKey *m_keyTable;
  unint64_t *m_generationTable;
  uint64_t v39;
  unint64_t v40;
  unint64_t *m_dirtyInfo;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unsigned int v47;
  unsigned int v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t *m_dirtyInfoH;
  uint64_t v52;
  unint64_t v53;
  id v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  p_hashTable = &self->_hashTable;
  v5 = (unint64_t)a3 | 2;
  v6 = (void *)((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL);
  v7 = 0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL);
  v8 = v7 >> -LOBYTE(self->_hashTable.m_hashShift);
  v9 = self->_hashTable.m_hopInfo[v8];
  while (v9)
  {
    v10 = __clz(__rbit32(v9));
    v9 &= ~(1 << v10);
    v11 = (v10 + v8) & (self->_hashTable.m_hashSize - 1);
    v12 = *((_QWORD *)p_hashTable->m_keyTable + v11);
    if ((void *)(v12 & 0xFFFFFFFFFFFFFFFCLL) == v6)
    {
      *((_QWORD *)p_hashTable->m_keyTable + v11) = v12 | 2;
      goto LABEL_35;
    }
  }
LABEL_5:
  v13 = 0;
  m_currentGeneration = p_hashTable->m_currentGeneration;
  v15 = p_hashTable->m_hashSize - 1;
  v16 = v7 >> -LOBYTE(p_hashTable->m_hashShift);
  m_usedMask = p_hashTable->m_usedMask;
  v18 = v16 & 0x3F;
  m_usedInfo = p_hashTable->m_usedInfo;
  v20 = m_usedInfo[v16 >> 6] | ~(-1 << v16);
  v21 = v16 >> 6 << 6;
  v22 = (v16 >> 6) + 1;
  while (v20 == -1)
  {
    v13 = v13 - v18 + 64;
    v20 = m_usedInfo[v22 & m_usedMask];
    v21 += 64;
    ++v22;
    v18 = 0;
    if (v13 >= 0x80)
    {
LABEL_10:
      if ((IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::rehash((uint64_t)p_hashTable, 0) & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          -[IOGPUMetalResidencySet addAllocation:].cold.1((uint64_t)p_hashTable, v56, v57, v58, v59, v60, v61, v62);
        abort();
      }
      goto LABEL_5;
    }
  }
  v23 = __clz(__rbit64(~v20)) + v21;
  if ((v23 - v16) > 0x7F)
    goto LABEL_10;
  LODWORD(v24) = p_hashTable->m_usedMask;
  while ((v23 - v16) >= 0x20)
  {
    v25 = v23 - 31;
    if (v23 < 0x1F)
    {
LABEL_25:
      v34 = v23;
    }
    else
    {
      m_hopInfo = p_hashTable->m_hopInfo;
      if (v23 < (int)v23 - 30)
        v25 = v23 - 30;
      else
        v25 = v23;
      v27 = -31;
      while (1)
      {
        v28 = v23 + v27;
        v29 = ((_DWORD)v23 + v27) & v15;
        v30 = m_hopInfo[v29];
        v31 = __clz(__rbit32(v30));
        v32 = (_DWORD)v23 + v27 + v31;
        if (v30 && v32 < v23)
          break;
        if (!__CFADD__((_DWORD)v23, ++v27))
          goto LABEL_25;
      }
      v36 = v32 & v15;
      m_keyTable = p_hashTable->m_keyTable;
      m_generationTable = p_hashTable->m_generationTable;
      v39 = *((_QWORD *)p_hashTable->m_keyTable + v36);
      v40 = m_generationTable[v36];
      m_hopInfo[v29] = v30 & ~(1 << v31) | (1 << -(char)v27);
      m_dirtyInfo = p_hashTable->m_dirtyInfo;
      v24 = p_hashTable->m_usedMask;
      v42 = v24 & (v32 >> 6);
      v43 = m_dirtyInfo[v42];
      if ((v43 & (1 << (v28 + v31))) != 0)
      {
        m_dirtyInfo[v42] = v43 & ~(1 << v32);
        v44 = v24 & ((unint64_t)v23 >> 6);
        m_dirtyInfo[v44] |= 1 << v23;
        v45 = 1 << v44;
        v46 = p_hashTable->m_dirtyHMask & (v44 >> 6);
        p_hashTable->m_dirtyInfoH[v46] |= v45;
      }
      v34 = v28 + v31;
      m_usedInfo[m_usedMask & (v23 >> 6)] |= 1 << v23;
      v47 = v23 & v15;
      *((_QWORD *)m_keyTable + v47) = v39;
      m_generationTable[v47] = v40;
      *((_QWORD *)m_keyTable + v36) = 2;
      m_usedInfo[m_usedMask & (v32 >> 6)] &= ~(1 << (v28 + v31));
      v25 = v28;
    }
    v35 = v25 == (_DWORD)v23;
    v23 = v34;
    if (v35)
      goto LABEL_10;
  }
  v48 = v23 & v15;
  v49 = p_hashTable->m_generationTable;
  *((_QWORD *)p_hashTable->m_keyTable + v48) = v5;
  v49[v48] = m_currentGeneration;
  if ((v5 & 3) == 2)
  {
    v50 = v24 & ((unint64_t)v23 >> 6);
    m_dirtyInfoH = p_hashTable->m_dirtyInfoH;
    p_hashTable->m_dirtyInfo[v50] |= 1 << v23;
    v52 = 1 << v50;
    v53 = p_hashTable->m_dirtyHMask & (v50 >> 6);
    m_dirtyInfoH[v53] |= v52;
    ++p_hashTable->m_dirtyCount;
  }
  p_hashTable->m_hopInfo[v16] |= 1 << (v23 - v16);
  m_usedInfo[m_usedMask & (v23 >> 6)] |= 1 << v23;
  ++p_hashTable->m_count;
  v54 = v6;
LABEL_35:
  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(a3, "allocatedSize");
    IOGPUDeviceTraceEvent();
  }
}

- (void)removeAllocation:(id)a3
{
  IOGPUGenerationalSet<id, IOGPUMTLIdKey, IOGPUMTLObjectHashAllocator> *p_hashTable;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  IOGPUMTLIdKey *m_keyTable;
  uint64_t v13;
  int v14;
  unint64_t *m_usedInfo;
  uint64_t m_usedMask;
  unint64_t v17;
  unint64_t *m_dirtyInfoH;
  uint64_t v19;
  unint64_t v20;

  p_hashTable = &self->_hashTable;
  v4 = (void *)((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL);
  v5 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  v6 = v5;
  v7 = self->_hashTable.m_hopInfo[v5];
  while (v7)
  {
    v8 = __clz(__rbit32(v7));
    v9 = 1 << v8;
    v7 &= ~(1 << v8);
    v10 = v8 + v5;
    v11 = v10 & (self->_hashTable.m_hashSize - 1);
    m_keyTable = p_hashTable->m_keyTable;
    v13 = *((_QWORD *)p_hashTable->m_keyTable + v11);
    if ((void *)(v13 & 0xFFFFFFFFFFFFFFFCLL) == v4)
    {
      *((_QWORD *)m_keyTable + v11) = v13 & 0xFFFFFFFFFFFFFFFDLL;
      if ((v13 & 1) != 0)
      {
        m_usedMask = self->_hashTable.m_usedMask;
        self->_hashTable.m_generationTable[self->_hashTable.m_hashMask & v10] = self->_hashTable.m_currentGeneration;
        v17 = m_usedMask & (v10 >> 6);
        m_dirtyInfoH = self->_hashTable.m_dirtyInfoH;
        self->_hashTable.m_dirtyInfo[v17] |= 1 << v10;
        v19 = 1 << v17;
        v20 = self->_hashTable.m_dirtyHMask & (v17 >> 6);
        m_dirtyInfoH[v20] |= v19;
        ++self->_hashTable.m_dirtyCount;
      }
      else
      {
        v14 = ~v9;

        *((_QWORD *)m_keyTable + v11) = 0;
        m_usedInfo = p_hashTable->m_usedInfo;
        p_hashTable->m_hopInfo[v6] &= v14;
        m_usedInfo[p_hashTable->m_usedMask & (v10 >> 6)] &= ~(1 << v10);
        --p_hashTable->m_count;
      }
      break;
    }
  }
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
}

- (NSArray)allAllocations
{
  IOGPUGenerationalSet<id, IOGPUMTLIdKey, IOGPUMTLObjectHashAllocator> *p_hashTable;
  uint64_t m_count;
  void *v4;
  unsigned int v5;
  unint64_t i;
  unint64_t v7;
  uint64_t v8;

  p_hashTable = &self->_hashTable;
  m_count = self->_hashTable.m_count;
  if ((_DWORD)m_count)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", m_count);
    v5 = 0;
    do
    {
      for (i = p_hashTable->m_usedInfo[v5]; i; i &= ~(1 << v7))
      {
        v7 = __clz(__rbit64(i));
        v8 = *((_QWORD *)p_hashTable->m_keyTable + (v7 | (v5 << 6)));
        if ((v8 & 2) != 0)
          objc_msgSend(v4, "addObject:", v8 & 0xFFFFFFFFFFFFFFFCLL);
      }
      ++v5;
    }
    while (v5 <= p_hashTable->m_usedMask);
  }
  else
  {
    v4 = (void *)objc_opt_new();
  }
  return (NSArray *)v4;
}

- (NSArray)allCommittedAllocations
{
  IOGPUGenerationalSet<id, IOGPUMTLIdKey, IOGPUMTLObjectHashAllocator> *p_hashTable;
  uint64_t m_count;
  void *v4;
  unsigned int v5;
  unint64_t i;
  unint64_t v7;
  uint64_t v8;

  p_hashTable = &self->_hashTable;
  m_count = self->_hashTable.m_count;
  if ((_DWORD)m_count)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", m_count);
    v5 = 0;
    do
    {
      for (i = p_hashTable->m_usedInfo[v5]; i; i &= ~(1 << v7))
      {
        v7 = __clz(__rbit64(i));
        v8 = *((_QWORD *)p_hashTable->m_keyTable + (v7 | (v5 << 6)));
        if ((v8 & 1) != 0)
          objc_msgSend(v4, "addObject:", v8 & 0xFFFFFFFFFFFFFFFCLL);
      }
      ++v5;
    }
    while (v5 <= p_hashTable->m_usedMask);
  }
  else
  {
    v4 = (void *)objc_opt_new();
  }
  return (NSArray *)v4;
}

- (void)removeAllAllocations
{
  unsigned int v2;
  IOGPUGenerationalSet<id, IOGPUMTLIdKey, IOGPUMTLObjectHashAllocator> *p_hashTable;
  unint64_t *m_usedInfo;
  unint64_t v5;
  uint64_t i;
  unsigned int v7;
  unint64_t v8;
  IOGPUMTLIdKey *m_keyTable;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t m_usedMask;
  unint64_t v15;
  unint64_t *m_dirtyInfoH;
  uint64_t v17;
  unint64_t v18;

  v2 = 0;
  p_hashTable = &self->_hashTable;
  m_usedInfo = self->_hashTable.m_usedInfo;
  do
  {
    v5 = m_usedInfo[v2];
    for (i = v2; v5; v5 &= ~v13)
    {
      v7 = __clz(__rbit64(v5));
      v8 = ((_DWORD)i << 6) | v7;
      m_keyTable = p_hashTable->m_keyTable;
      v10 = *((_QWORD *)p_hashTable->m_keyTable + v8);
      v11 = (0x9E3779B97F4A7C15 * (v10 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(p_hashTable->m_hashShift);
      v12 = v8 - v11;
      if ((int)v8 - (int)v11 < 0)
        v12 += p_hashTable->m_hashSize;
      v13 = 1 << v7;
      *((_QWORD *)m_keyTable + v8) = v10 & 0xFFFFFFFFFFFFFFFDLL;
      if ((v10 & 1) != 0)
      {
        m_usedMask = p_hashTable->m_usedMask;
        p_hashTable->m_generationTable[p_hashTable->m_hashMask & v8] = p_hashTable->m_currentGeneration;
        v15 = m_usedMask & (v8 >> 6);
        m_dirtyInfoH = p_hashTable->m_dirtyInfoH;
        p_hashTable->m_dirtyInfo[v15] |= 1 << (((_BYTE)i << 6) | v7);
        v17 = 1 << v15;
        v18 = p_hashTable->m_dirtyHMask & (v15 >> 6);
        m_dirtyInfoH[v18] |= v17;
        ++p_hashTable->m_dirtyCount;
      }
      else
      {

        *((_QWORD *)m_keyTable + v8) = 0;
        m_usedInfo = p_hashTable->m_usedInfo;
        p_hashTable->m_hopInfo[v11] &= ~(1 << v12);
        m_usedInfo[i] &= ~v13;
        --p_hashTable->m_count;
      }
    }
    v2 = i + 1;
  }
  while ((i + 1) <= p_hashTable->m_usedMask);
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
}

- (BOOL)containsAllocation:(id)a3
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  _BOOL8 v7;

  v3 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  v4 = self->_hashTable.m_hopInfo[v3];
  while (v4)
  {
    v5 = __clz(__rbit32(v4));
    v4 &= ~(1 << v5);
    v6 = *((_QWORD *)self->_hashTable.m_keyTable + ((v5 + v3) & (self->_hashTable.m_hashSize - 1)));
    if ((v6 & 0xFFFFFFFFFFFFFFFCLL) == ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL))
      return (v6 >> 1) & 1;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (unint64_t)allocationCount
{
  return self->_hashTable.m_count;
}

- (unint64_t)countForAllocation:(id)a3
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;

  v3 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  v4 = self->_hashTable.m_hopInfo[v3];
  while (v4)
  {
    v5 = __clz(__rbit32(v4));
    v4 &= ~(1 << v5);
    v6 = *((_QWORD *)self->_hashTable.m_keyTable + ((v5 + v3) & (self->_hashTable.m_hashSize - 1)));
    if ((v6 & 0xFFFFFFFFFFFFFFFCLL) == ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL))
      return (v6 >> 1) & 1;
  }
  return 0;
}

- (unint64_t)generationForAllocation:(id)a3
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  v3 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  v4 = self->_hashTable.m_hopInfo[v3];
  while (v4)
  {
    v5 = __clz(__rbit32(v4));
    v4 &= ~(1 << v5);
    v6 = (v5 + v3) & (self->_hashTable.m_hashSize - 1);
    if ((*((_QWORD *)self->_hashTable.m_keyTable + v6) & 0xFFFFFFFFFFFFFFFCLL) == ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL))
    {
      if ((*((_QWORD *)self->_hashTable.m_keyTable + v6) & 3) == 1)
        return self->_hashTable.m_generationTable[v6];
      return 0;
    }
  }
  return 0;
}

- (void)commit
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char *v5;
  id *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int8x8_t v18;
  unint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  uint8x8_t v29;
  uint64_t v30;
  void *v31[512];
  void *v32;

  v2 = MEMORY[0x24BDAC7A8](self, a2);
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEventStart();
  v3 = (uint64_t *)(v2 + 104);
  v4 = *(unsigned int *)(v2 + 176);
  if ((_DWORD)v4)
  {
    if (v4 > 0x100)
    {
      v5 = (char *)malloc_type_malloc(16 * v4, 0x80040B8603338uLL);
      v7 = *(_DWORD *)(v2 + 176);
      v32 = v5;
      v6 = (id *)&v5[8 * v4];
      if (!v7)
      {
        v8 = 0;
        v9 = 0;
LABEL_29:
        if (v8 | v9)
        {
          objc_msgSend((id)v2, "_commitAddedAllocations:count:removedAllocations:count:");
          for (; v8; --v8)

        }
        if (v32 != v31)
          free(v32);
        goto LABEL_34;
      }
    }
    else
    {
      v5 = (char *)v31;
      v32 = v31;
      v6 = &v31[v4];
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)(v2 + 144);
    do
    {
      v13 = *(_QWORD *)(v12 + 8 * v10);
      if (v13)
      {
        v14 = 0;
        do
        {
          v15 = __clz(__rbit64(v13));
          v16 = 1 << v15;
          v17 = (v10 << 6) | v15;
          if (v17 <= *(_DWORD *)(v2 + 160))
          {
            v18 = *(int8x8_t *)(*(_QWORD *)(v2 + 136) + 8 * v17);
            if (v18)
            {
              v19 = *(_QWORD *)(*(_QWORD *)(v2 + 136) + 8 * v17);
              do
              {
                v20 = __clz(__rbit64(v19));
                v21 = 1 << v20;
                v22 = ~(1 << v20);
                v23 = ((_DWORD)v17 << 6) | v20;
                v24 = *v3;
                v25 = *(_QWORD *)(*v3 + 8 * v23);
                if ((v25 & 3) == 1)
                {
                  if (*(_QWORD *)(*(_QWORD *)(v2 + 112) + 8 * v23) <= *(_QWORD *)(v2 + 200))
                  {
                    v26 = v25 & 0xFFFFFFFFFFFFFFFCLL;
                    v27 = (0x9E3779B97F4A7C15 * (v25 & 0xFFFFFFFFFFFFFFFCLL)) >> -*(_BYTE *)(v2 + 168);
                    *(_QWORD *)(v24 + 8 * v23) = 0;
                    v6[v8] = (id)v26;
                    *(_QWORD *)(v24 + 8 * v23) &= ~1uLL;
                    v28 = v23 - v27;
                    if (v28 < 0)
                      v28 += *(_DWORD *)(v2 + 152);
                    ++v8;
                    *(_QWORD *)&v18 &= v22;
                    *(_DWORD *)(*(_QWORD *)(v2 + 120) + 4 * v27) &= ~(1 << v28);
                    *(_QWORD *)(*(_QWORD *)(v2 + 128) + 8 * v17) &= v22;
                    --*(_DWORD *)(v2 + 172);
                  }
                }
                else if ((v25 & 3) == 2)
                {
                  *(_QWORD *)&v5[8 * v9++] = v25 & 0xFFFFFFFFFFFFFFFCLL;
                  *(_QWORD *)(v24 + 8 * v23) |= 1uLL;
                  *(_QWORD *)&v18 &= v22;
                }
                v19 &= ~v21;
              }
              while (v19);
              v29 = (uint8x8_t)vcnt_s8(v18);
              v29.i16[0] = vaddlv_u8(v29);
              v11 += v29.i32[0];
              *(int8x8_t *)(*(_QWORD *)(v2 + 136) + 8 * v17) = v18;
              if (v18)
                v30 = v16;
              else
                v30 = 0;
              v14 |= v30;
            }
          }
          v13 &= ~v16;
        }
        while (v13);
        v12 = *(_QWORD *)(v2 + 144);
        *(_QWORD *)(v12 + 8 * v10) = v14;
      }
      ++v10;
    }
    while (v10 <= *(_DWORD *)(v2 + 164));
    *(_DWORD *)(v2 + 176) = v11;
    goto LABEL_29;
  }
LABEL_34:
  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend((id)v2, "allocatedSize");
    IOGPUDeviceTraceEventEnd();
  }
}

- (BOOL)_commitAddedAllocations:(const void *)a3 count:(unint64_t)a4 removedAllocations:(const void *)a5 count:(unint64_t)a6
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  void *v15;
  _BYTE *v16;
  _BYTE *v17;
  char *v18;
  char *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  char *v34;
  char v36;
  void *v37;
  _BYTE v38[2048];
  void *v39;
  _BYTE v40[2048];
  void *v41;
  _BYTE v42[2048];
  void *v43;

  v6 = MEMORY[0x24BDAC7A8](self, a2);
  v9 = v8;
  v11 = v10;
  v12 = v7;
  v14 = v13;
  v15 = (void *)v6;
  if (v7 > 0x100)
  {
    v43 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    v16 = malloc_type_malloc(8 * v12, 0x80040B8603338uLL);
  }
  else
  {
    v43 = v42;
    v16 = v40;
  }
  v41 = v16;
  if (v9 > 0x100)
  {
    v39 = malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
    v18 = (char *)malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
    v16 = v41;
    v17 = v39;
  }
  else
  {
    v17 = v38;
    v39 = v38;
    v18 = &v36;
  }
  v37 = v18;
  v19 = (char *)v43;
  v20 = (int *)MEMORY[0x24BDDD800];
  if (v12)
  {
    v21 = 0;
    v22 = 0;
    do
    {
      v24 = *v14++;
      v23 = v24;
      v25 = *(_QWORD *)(v24 + *v20);
      v26 = v25 == 1;
      if (v25 == 1)
        v27 = &v19[8 * v22];
      else
        v27 = &v16[8 * v21];
      if (v26)
        ++v22;
      else
        ++v21;
      *(_QWORD *)v27 = v23;
      --v12;
    }
    while (v12);
    if (v9)
      goto LABEL_17;
LABEL_27:
    v29 = 0;
    v28 = 0;
    goto LABEL_28;
  }
  v22 = 0;
  v21 = 0;
  if (!v9)
    goto LABEL_27;
LABEL_17:
  v28 = 0;
  v29 = 0;
  do
  {
    v31 = *v11++;
    v30 = v31;
    v32 = *(_QWORD *)(v31 + *v20);
    v33 = v32 == 1;
    if (v32 == 1)
      v34 = &v17[8 * v29];
    else
      v34 = &v18[8 * v28];
    if (v33)
      ++v29;
    else
      ++v28;
    *(_QWORD *)v34 = v30;
    --v9;
  }
  while (v9);
LABEL_28:
  if (v22 | v29)
    objc_msgSend(v15, "_commitAddedResources:count:removedResources:count:");
  if (v21 | v28)
    objc_msgSend(v15, "_commitAddedHeaps:count:removedHeaps:count:", v16, v21, v18, v28);
  if (v37 != &v36)
    free(v37);
  if (v39 != v38)
    free(v39);
  if (v41 != v40)
    free(v41);
  if (v43 != v42)
    free(v43);
  return 1;
}

- (BOOL)_commitAddedResources:(const void *)a3 count:(unint64_t)a4 removedResources:(const void *)a5 count:(unint64_t)a6
{
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int updated;
  _BYTE v17[2048];
  void *v18;
  _BYTE v19[1024];
  void *v20;

  if (a4 >= 0x101)
  {
    v11 = malloc_type_malloc(4 * a4, 0x100004052888210uLL);
    v20 = v11;
  }
  else
  {
    v11 = v19;
    v20 = v19;
    if (!a4)
      goto LABEL_7;
  }
  v12 = 0;
  do
  {
    *(_DWORD *)&v11[4 * v12] = *((_DWORD *)a3[v12] + 20);
    ++v12;
  }
  while (a4 != v12);
LABEL_7:
  if (a6 >= 0x101)
  {
    v13 = malloc_type_malloc(8 * a6, 0x100004000313F17uLL);
    v18 = v13;
  }
  else
  {
    v13 = v17;
    v18 = v17;
    if (!a6)
      goto LABEL_13;
  }
  v14 = 0;
  do
  {
    *(_QWORD *)&v13[8 * v14] = *((_QWORD *)a5[v14] + 16);
    ++v14;
  }
  while (a6 != v14);
LABEL_13:
  updated = IOGPUResourceGroupUpdateResources((uint64_t)self->_groupRef, a4, (uintptr_t)v11, a6, v13);
  if (v18 != v17)
    free(v18);
  if (v20 != v19)
    free(v20);
  return updated == 0;
}

- (BOOL)_commitAddedHeaps:(const void *)a3 count:(unint64_t)a4 removedHeaps:(const void *)a5 count:(unint64_t)a6
{
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int updated;
  _BYTE v17[2048];
  void *v18;
  _BYTE v19[1024];
  void *v20;

  if (a4 >= 0x101)
  {
    v11 = malloc_type_malloc(4 * a4, 0x100004052888210uLL);
    v20 = v11;
  }
  else
  {
    v11 = v19;
    v20 = v19;
    if (!a4)
      goto LABEL_7;
  }
  v12 = 0;
  do
  {
    *(_DWORD *)&v11[4 * v12] = *(_DWORD *)(*((_QWORD *)a3[v12] + 7) + 80);
    ++v12;
  }
  while (a4 != v12);
LABEL_7:
  if (a6 >= 0x101)
  {
    v13 = malloc_type_malloc(8 * a6, 0x100004000313F17uLL);
    v18 = v13;
  }
  else
  {
    v13 = v17;
    v18 = v17;
    if (!a6)
      goto LABEL_13;
  }
  v14 = 0;
  do
  {
    *(_QWORD *)&v13[8 * v14] = *(_QWORD *)(*((_QWORD *)a5[v14] + 7) + 128);
    ++v14;
  }
  while (a6 != v14);
LABEL_13:
  updated = IOGPUResourceGroupUpdateResources((uint64_t)self->_groupRef, a4, (uintptr_t)v11, a6, v13);
  if (v18 != v17)
    free(v18);
  if (v20 != v19)
    free(v20);
  return updated == 0;
}

- (void).cxx_destruct
{
  IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::~IOGPUGenerationalSet((uint64_t)&self->_hashTable);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 148) = 0u;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 21) = 0;
  return self;
}

- (void)addAllocations:(uint64_t)a3 count:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_211652000, MEMORY[0x24BDACB70], a3, "Unable to add allocation to set, current allocation count: %u", a5, a6, a7, a8, 0);
}

- (void)addAllocation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_211652000, MEMORY[0x24BDACB70], a3, "Unable to add allocation to set, current resource count: %u", a5, a6, a7, a8, 0);
}

@end
