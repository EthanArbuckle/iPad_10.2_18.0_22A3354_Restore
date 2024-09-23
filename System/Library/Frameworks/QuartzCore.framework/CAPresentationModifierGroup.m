@implementation CAPresentationModifierGroup

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)_setLocalContextId:(unsigned int)a3
{
  self->_localId = a3;
}

- (void)shmem
{
  return self->_shmem;
}

- (void)markWritten:(unint64_t)a3
{
  char *IndexedIvars;

  IndexedIvars = (char *)object_getIndexedIvars(self);
  *(_DWORD *)&IndexedIvars[(a3 >> 3) & 0x1FFFFFFFFFFFFFFCLL] |= 1 << a3;
}

- (unint64_t)nextSlotWithPayloadSize:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *shmem;
  unint64_t v8;
  unint64_t v9;
  void **v10;
  unint64_t count;
  size_t v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t result;

  if (self->_count == self->_capacity)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifierGroup"), CFSTR("%@: attempted to add modifier past group's capacity"), self);
  v5 = a3 + 8;
  v6 = self->_totalSize + a3 + 8;
  shmem = self->_shmem;
  v8 = *((_QWORD *)shmem + 2);
  if (v6 > v8)
  {
    if (v6 <= 2 * v8)
      v9 = 2 * v8;
    else
      v9 = self->_totalSize + a3 + 8;
    v10 = (void **)CA::Render::Shmem::new_shmem((CA::Render::Shmem *)((v9 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8]));
    if (!v10)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifierGroup"), CFSTR("%@: failed to allocate memory (%zu)"), self, v9);
    count = self->_count;
    v12 = *((_QWORD *)shmem + 2) - 8 * count;
    memcpy(v10[3], *((const void **)shmem + 3), v12);
    memcpy((char *)v10[2] + (_QWORD)v10[3] + -8 * count, (const void *)(*((_QWORD *)shmem + 3) + v12), 8 * count);
    v13 = (unsigned int *)self->_shmem;
    v14 = v13 + 2;
    do
    {
      v15 = __ldaxr(v14);
      v16 = v15 - 1;
    }
    while (__stlxr(v16, v14));
    if (!v16)
      (*(void (**)(unsigned int *))(*(_QWORD *)v13 + 16))(v13);
    self->_shmem = v10;
    v6 = self->_totalSize + v5;
  }
  result = self->_count;
  self->_count = result + 1;
  self->_totalSize = v6;
  return result;
}

- (void)flush
{
  -[CAPresentationModifierGroup flushWithTargetTime:](self, "flushWithTargetTime:", 0.0);
}

- (void)flushLocally
{
  -[CAPresentationModifierGroup flushLocallyWithTargetTime:](self, "flushLocallyWithTargetTime:", 0.0);
}

- (void)resetBitMask
{
  void *IndexedIvars;
  unint64_t count;

  IndexedIvars = object_getIndexedIvars(self);
  bzero(IndexedIvars, ((self->_count + 31) >> 3) & 0x1FFFFFFFFFFFFFFCLL);
  count = self->_count;
  if ((count & 0x1F) != 0)
    *((_DWORD *)IndexedIvars + ((count + 31) >> 5) - 1) = -1 << (count & 0x1F);
}

- (void)dealloc
{
  unsigned int *shmem;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  shmem = (unsigned int *)self->_shmem;
  if (shmem)
  {
    v4 = shmem + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(unsigned int *, SEL))(*(_QWORD *)shmem + 16))(shmem, a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)CAPresentationModifierGroup;
  -[CAPresentationModifierGroup dealloc](&v7, sel_dealloc);
}

- (void)flushWithTransaction
{
  -[CAPresentationModifierGroup flushWithTransactionAndTargetTime:](self, "flushWithTransactionAndTargetTime:", 0.0);
}

+ (id)groupWithCapacity:(unint64_t)a3
{
  size_t v4;
  objc_class *v5;

  v4 = ((a3 + 31) >> 3) & 0x1FFFFFFFFFFFFFFCLL;
  v5 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(class_createInstance(v5, v4), "initWithCapacity:", a3);
}

- (CAPresentationModifierGroup)initWithCapacity:(unint64_t)a3
{
  CAPresentationModifierGroup *v4;
  unint64_t v5;
  char v6;
  BOOL v7;
  unint64_t v8;
  char v9;
  _DWORD *v10;
  void *IndexedIvars;
  uint64_t v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)CAPresentationModifierGroup;
  v4 = -[CAPresentationModifierGroup init](&v14, sel_init);
  if (v4)
  {
    if (a3)
    {
      if (!is_mul_ok(a3, 0x3D8uLL)
        || !(984 * a3)
        || ((v5 = 992 * a3, !__CFADD__(984 * a3, 8 * a3)) ? (v6 = 0) : (v6 = 1),
            (v7 = __CFADD__(v5, 40), v8 = v5 + 40, !v7) ? (v9 = 0) : (v9 = 1),
            a3 >> 61 || (v6 & 1) != 0 || (v9 & 1) != 0 || !v8))
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifierGroup"), CFSTR("%@: group capacity (%zu) too large"), v4, a3);
      }
      else
      {
        v10 = CA::Render::Shmem::new_shmem((CA::Render::Shmem *)((v8 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8]));
        v4->_shmem = v10;
        v4->_capacity = a3;
        if (v10)
        {
          IndexedIvars = object_getIndexedIvars(v4);
          memset(IndexedIvars, 255, ((v4->_capacity + 31) >> 3) & 0x1FFFFFFFFFFFFFFCLL);
          return v4;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAPresentationModifierGroup"), CFSTR("%@: cannot create group with 0 capacity"), v4, v13);
    }

    return 0;
  }
  return v4;
}

- (void)_renderShmem
{
  return self->_shmem;
}

- (void)setUpdatesAsynchronously:(BOOL)a3
{
  unsigned int *v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  v3 = (unsigned int *)*((_QWORD *)self->_shmem + 3);
LABEL_2:
  v4 = *v3 & 0x7FFFFFFF;
  v5 = *v3 & 0x3FFFFFFF;
  if (!a3)
    v5 = *v3 & 0x3FFFFFFF | 0x40000000;
  do
  {
    v6 = __ldaxr(v3);
    if (v6 != v4)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stlxr(v5, v3));
}

- (BOOL)updatesAsynchronously
{
  return (**((_DWORD **)self->_shmem + 3) & 0x40000000) == 0;
}

- (void)flushLocallyWithTargetTime:(double)a3
{
  _DWORD *IndexedIvars;
  _QWORD *shmem;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t i;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;

  IndexedIvars = object_getIndexedIvars(self);
  shmem = self->_shmem;
  v7 = shmem[3];
  v8 = *(unsigned int *)(v7 + 4);
  *(double *)(v7 + 8 * v8 + 16) = a3;
  v9 = self->_count + 31;
  if (v9 >= 0x20)
  {
    v10 = 0;
    v11 = 0;
    v12 = v9 >> 5;
    do
    {
      v13 = IndexedIvars[v10];
      if (v13 != -1)
      {
        for (i = 0; i != 32; ++i)
        {
          if (((v13 >> i) & 1) == 0)
          {
            v15 = shmem[2];
            v16 = v15 - 40;
            if (v15 >= 0x28 && i + (unint64_t)v11 < v16 >> 3)
            {
              v17 = v7 + v15 - 8 * (i + v11);
              v18 = *(unsigned int *)(v17 - 8);
              if ((_DWORD)v18)
              {
                v19 = (16 * v18) | 8;
                v20 = *(unsigned int *)(v17 - 4);
                if (v16 >= v20 && 3 * v19 + v20 <= v16)
                {
                  if ((_DWORD)v8)
                    v22 = (16 * v18) | 8;
                  else
                    v22 = 0;
                  if ((_DWORD)v8)
                    v19 = 0;
                  *(_WORD *)(v7 + 40 + v20 + v19) = *(_WORD *)(v7 + 40 + v20 + v22);
                  v23 = 2 * v18;
                  if (v23 <= 1)
                    v23 = 1;
                  v24 = v7 + 48 + v20;
                  v25 = (_QWORD *)(v24 + v19);
                  v26 = (uint64_t *)(v24 + v22);
                  do
                  {
                    v27 = *v26++;
                    *v25++ = v27;
                    --v23;
                  }
                  while (v23);
                }
              }
            }
          }
        }
      }
      ++v10;
      v11 += 32;
    }
    while (v10 < v12);
  }
  -[CAPresentationModifierGroup resetBitMask](self, "resetBitMask");
}

- (void)flushWithTargetTime:(double)a3
{
  unsigned int *v4;
  int v5;
  unsigned int v6;
  unsigned int v7;

  -[CAPresentationModifierGroup flushLocallyWithTargetTime:](self, "flushLocallyWithTargetTime:", a3);
  v4 = (unsigned int *)*((_QWORD *)self->_shmem + 3);
  v4[3] = self->_count;
  v4[1] = v4[1] == 0;
LABEL_2:
  v5 = *v4 & 0x7FFFFFFF;
  v6 = *v4 & 0x7FFFFFFE | v4[1];
  do
  {
    v7 = __ldaxr(v4);
    if (v7 != v5)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stlxr(v6, v4));
}

- (void)flushWithTransactionAndTargetTime:(double)a3
{
  CA::Context *localId;
  int *v6;
  const void *v7;
  int *v8;
  uint64_t v9;

  localId = (CA::Context *)self->_localId;
  if ((_DWORD)localId)
  {
    v6 = CA::Context::retain_context_with_id(localId);
    if (v6)
    {
      v8 = v6;
      v9 = *((_QWORD *)self->_shmem + 3);
      *(_DWORD *)(v9 + 12) = self->_count;
      *(double *)(v9 + 8 * *(unsigned int *)(v9 + 4) + 16) = a3;
      CA::Transaction::add_command((CA::Transaction *)0x19, self->_localId, 0, self, v7);
      (**((void (***)(uint64_t))v8 + 27))((uint64_t)(v8 + 54));
    }
    -[CAPresentationModifierGroup flushLocallyWithTargetTime:](self, "flushLocallyWithTargetTime:", a3);
  }
  else
  {
    -[CAPresentationModifierGroup flushWithTargetTime:](self, "flushWithTargetTime:", a3);
  }
}

@end
