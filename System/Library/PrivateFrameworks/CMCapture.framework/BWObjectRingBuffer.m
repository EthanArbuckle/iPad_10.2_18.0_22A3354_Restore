@implementation BWObjectRingBuffer

- (BWObjectRingBuffer)initWithCapacity:(int)a3
{
  uint64_t v3;
  BWObjectRingBuffer *v4;
  BWObjectRingBuffer *v5;
  objc_super v7;

  v3 = *(_QWORD *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)BWObjectRingBuffer;
  v4 = -[BWObjectRingBuffer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_ascending = 1;
    v4->_enforceAscending = 0;
    -[BWObjectRingBuffer setCapacity:](v4, "setCapacity:", v3);
  }
  return v5;
}

- (void)setCapacity:(int)a3
{
  id *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  int count;
  BOOL v8;
  int v9;
  int v10;
  _QWORD v11[6];
  int v12;

  if (a3 < 1)
  {
    if (a3 < 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("setting negative capacity %d"), *(_QWORD *)&a3);
    v6 = 0;
    v5 = 0;
  }
  else
  {
    v5 = (id *)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    v6 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_malloc(24 * a3, 0x1000040504FFAC1uLL);
  }
  count = self->_count;
  v8 = __OFSUB__(count, a3);
  v9 = count - a3;
  if ((v9 < 0) ^ v8 | (v9 == 0))
    v9 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__BWObjectRingBuffer_setCapacity___block_invoke;
  v11[3] = &__block_descriptor_52_e25_v52__0_8___qiIq_16i40_B44l;
  v12 = v9;
  v11[4] = v5;
  v11[5] = v6;
  -[BWObjectRingBuffer _enumerateObjectsStartingAtOffset:usingBlock:](self, "_enumerateObjectsStartingAtOffset:usingBlock:", 0, v11);
  free(self->_objects);
  free(self->_times);
  self->_objects = v5;
  self->_times = v6;
  v10 = self->_count;
  if (v10 >= a3)
    v10 = a3;
  self->_capacity = a3;
  self->_count = v10;
  self->_oldest = 0;
}

- (void)_enumerateObjectsStartingAtOffset:(int)a3 usingBlock:(id)a4
{
  uint64_t v5;
  uint64_t count;
  int oldest;
  int capacity;
  int v10;
  int v11;
  id v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v13;
  void (*v14)(id, id, __int128 *, uint64_t, char *);
  __int128 v15;
  int v16;
  int v17;
  __int128 v18;
  int64_t var3;
  char v20;

  v5 = *(_QWORD *)&a3;
  count = self->_count;
  if (a3 < 0 || (int)count <= a3)
  {
    if ((_DWORD)count == a3)
      return;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Invalid start %d for ring buffer of count %d"), *(_QWORD *)&a3, count);
    LODWORD(count) = self->_count;
  }
  v20 = 0;
  oldest = self->_oldest;
  capacity = self->_capacity;
  v10 = (oldest + (int)v5) % capacity;
  v11 = ((int)count + oldest) % capacity;
  do
  {
    v12 = self->_objects[v10];
    v13 = &self->_times[v10];
    v14 = (void (*)(id, id, __int128 *, uint64_t, char *))*((_QWORD *)a4 + 2);
    v15 = *(_OWORD *)&v13->var0;
    var3 = v13->var3;
    v18 = v15;
    v14(a4, v12, &v18, v5, &v20);
    if (v20)
      break;
    v5 = (v5 + 1);
    v16 = v10 + 1;
    v17 = self->_capacity;
    if (v10 + 1 < v17)
      v17 = 0;
    v10 = v16 - v17;
  }
  while (v16 - v17 != v11);
}

- (void)setExpectAscending:(BOOL)a3
{
  self->_expectAscending = a3;
}

- (void)setEnforceAscending:(BOOL)a3
{
  id *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;
  unsigned int *v8;
  unsigned int *v9;
  int64_t capacity;
  int64_t i;
  uint64_t v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v14;
  __int128 v15;
  _QWORD __compar[5];

  if (!self->_ascending && a3)
  {
    if (self->_count >= 1)
    {
      v6 = (id *)malloc_type_malloc(8 * self->_capacity, 0x80040B8603338uLL);
      v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_malloc(24 * self->_capacity, 0x1000040504FFAC1uLL);
      v8 = (unsigned int *)malloc_type_malloc(4 * self->_capacity, 0x100004052888210uLL);
      v9 = v8;
      capacity = self->_capacity;
      if ((int)capacity >= 1)
      {
        for (i = 0; i < capacity; ++i)
        {
          v8[i] = i;
          capacity = self->_capacity;
        }
      }
      __compar[0] = MEMORY[0x1E0C809B0];
      __compar[1] = 3221225472;
      __compar[2] = __42__BWObjectRingBuffer_setEnforceAscending___block_invoke;
      __compar[3] = &unk_1E4923E60;
      __compar[4] = self;
      heapsort_b(v8, capacity, 4uLL, __compar);
      if (self->_count >= 1)
      {
        v12 = 0;
        v13 = v7;
        do
        {
          v6[v12] = self->_objects[v9[v12]];
          v14 = &self->_times[v9[v12]];
          v15 = *(_OWORD *)&v14->var0;
          v13->var3 = v14->var3;
          *(_OWORD *)&v13->var0 = v15;
          ++v13;
          ++v12;
        }
        while (v12 < self->_count);
      }
      free(v9);
      free(self->_objects);
      free(self->_times);
      self->_objects = v6;
      self->_times = v7;
      self->_oldest = 0;
    }
    self->_ascending = 1;
  }
  self->_enforceAscending = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BWObjectRingBuffer setCapacity:](self, "setCapacity:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BWObjectRingBuffer;
  -[BWObjectRingBuffer dealloc](&v3, sel_dealloc);
}

- (int)capacity
{
  return self->_capacity;
}

__n128 __34__BWObjectRingBuffer_setCapacity___block_invoke(uint64_t a1, void *a2, __n128 *a3, int a4)
{
  int v4;
  BOOL v5;
  int v6;
  __n128 *v7;
  __n128 result;

  v4 = *(_DWORD *)(a1 + 48);
  v5 = __OFSUB__(a4, v4);
  v6 = a4 - v4;
  if (v6 < 0 != v5)
  {

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v6) = a2;
    v7 = (__n128 *)(*(_QWORD *)(a1 + 40) + 24 * (a4 - *(_DWORD *)(a1 + 48)));
    result = *a3;
    v7[1].n128_u64[0] = a3[1].n128_u64[0];
    *v7 = result;
  }
  return result;
}

uint64_t __42__BWObjectRingBuffer_setEnforceAscending___block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v14;
  __int128 *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  CMTime v19;
  CMTime time1;

  v3 = *a2;
  v4 = *a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD *)(v5 + 32);
  v7 = *a2;
  if ((int)*a2 < v6)
    v7 = *(_DWORD *)(v5 + 24) + v3;
  v8 = v7 - v6;
  v9 = *(_DWORD *)(v5 + 28);
  v10 = *a3;
  if ((int)v4 < v6)
    v10 = *(_DWORD *)(v5 + 24) + v4;
  v11 = v10 - v6;
  if (v8 < v9 && v11 < v9)
  {
    v14 = *(_QWORD *)(v5 + 16);
    v15 = (__int128 *)(v14 + 24 * v3);
    v16 = (__int128 *)(v14 + 24 * v4);
    v17 = *v15;
    time1.epoch = *((_QWORD *)v15 + 2);
    *(_OWORD *)&time1.value = v17;
    v18 = *v16;
    v19.epoch = *((_QWORD *)v16 + 2);
    *(_OWORD *)&v19.value = v18;
    return CMTimeCompare(&time1, &v19);
  }
  else if (v8 < v9)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return v11 < v9;
  }
}

- (BOOL)enforceAscending
{
  return self->_enforceAscending;
}

- (void)_forceAscendingTo:(BOOL)a3
{
  self->_ascending = a3;
}

- (Float64)_checkAscendingInsertAt:(uint64_t)a3 object:(CMTime *)a4 forTime:
{
  int v6;
  uint64_t v7;
  __int128 v8;
  Float64 result;
  uint64_t v10;
  __int128 v11;
  CMTime time;
  CMTime time2;
  CMTime time1;

  if (a1)
  {
    v6 = (a2 + *(_DWORD *)(a1 + 24) - 1) % *(_DWORD *)(a1 + 24);
    v7 = *(_QWORD *)(a1 + 16) + 24 * v6;
    v8 = *(_OWORD *)v7;
    time1.epoch = *(_QWORD *)(v7 + 16);
    *(_OWORD *)&time1.value = v8;
    time2 = *a4;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      *(_BYTE *)(a1 + 36) = 0;
      if (*(_BYTE *)(a1 + 37))
      {
        v10 = *(_QWORD *)(a1 + 16) + 24 * v6;
        time1 = *a4;
        v11 = *(_OWORD *)v10;
        time2.epoch = *(_QWORD *)(v10 + 16);
        *(_OWORD *)&time2.value = v11;
        CMTimeSubtract(&time, &time1, &time2);
        return CMTimeGetSeconds(&time);
      }
    }
  }
  return result;
}

- (void)appendObject:(id)a3 forTime:(id *)a4
{
  int capacity;
  int count;
  int oldest;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v10;
  __int128 v11;
  int v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v13;
  int64_t var3;
  CMTime v15;
  CMTime time1;

  capacity = self->_capacity;
  if (!capacity)
    return;
  count = self->_count;
  oldest = self->_oldest;
  if (count == capacity)
  {
    if (oldest + 1 < capacity)
      capacity = 0;
    self->_oldest = oldest + 1 - capacity;
    if (self->_ascending)
    {
      if (self->_enforceAscending)
      {
        v10 = &self->_times[oldest];
        v11 = *(_OWORD *)&v10->var0;
        time1.epoch = v10->var3;
        *(_OWORD *)&time1.value = v11;
        v15 = *(CMTime *)a4;
        if (CMTimeCompare(&time1, &v15) >= 1)
        {
          v12 = self->_oldest;
          if (!v12)
            v12 = self->_capacity;
          self->_oldest = v12 - 1;
          return;
        }
      }
      time1 = (CMTime)*a4;
      -[BWObjectRingBuffer _checkAscendingInsertAt:object:forTime:]((uint64_t)self, oldest, (uint64_t)a3, &time1);
    }

  }
  else
  {
    oldest = (oldest + count) % capacity;
    if (count >= 1 && self->_ascending)
    {
      time1 = *(CMTime *)a4;
      -[BWObjectRingBuffer _checkAscendingInsertAt:object:forTime:]((uint64_t)self, oldest, (uint64_t)a3, &time1);
      count = self->_count;
    }
    self->_count = count + 1;
  }
  if (self->_enforceAscending && !self->_ascending && self->_count >= 2)
  {
    time1 = (CMTime)*a4;
    oldest = -[BWObjectRingBuffer _permuteBufferForNewObjectAtTime:]((uint64_t)self, &time1);
    self->_ascending = 1;
  }
  self->_objects[oldest] = a3;
  v13 = &self->_times[oldest];
  var3 = a4->var3;
  *(_OWORD *)&v13->var0 = *(_OWORD *)&a4->var0;
  v13->var3 = var3;
}

- (uint64_t)_permuteBufferForNewObjectAtTime:(uint64_t)a1
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __int128 v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  __int128 v17;
  int32_t v18;
  CMTime v20;
  CMTime time1;

  if (!a1)
    return 0;
  v4 = *(_DWORD *)(a1 + 24);
  v5 = (*(_DWORD *)(a1 + 32) + *(_DWORD *)(a1 + 28) - 1) % v4;
  if (v5)
    v6 = (*(_DWORD *)(a1 + 32) + *(_DWORD *)(a1 + 28) - 1) % v4;
  else
    v6 = *(_DWORD *)(a1 + 24);
  v7 = (v6 - 1);
  do
  {
    v8 = v7;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v5) = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * (int)v7);
    v9 = *(_QWORD *)(a1 + 16);
    v10 = v9 + 24 * v5;
    v11 = (__int128 *)(v9 + 24 * (int)v7);
    v12 = *v11;
    *(_QWORD *)(v10 + 16) = *((_QWORD *)v11 + 2);
    *(_OWORD *)v10 = v12;
    v13 = v7;
    if (!(_DWORD)v7)
      v13 = *(_DWORD *)(a1 + 24);
    v14 = *(_DWORD *)(a1 + 32);
    v15 = v7;
    if ((int)v7 < v14)
      v15 = *(_DWORD *)(a1 + 24) + v7;
    if (v15 <= v14)
      break;
    v7 = (v13 - 1);
    v16 = *(_QWORD *)(a1 + 16) + 24 * (int)v7;
    v17 = *(_OWORD *)v16;
    time1.epoch = *(_QWORD *)(v16 + 16);
    *(_OWORD *)&time1.value = v17;
    v20 = *a2;
    v18 = CMTimeCompare(&time1, &v20);
    v5 = v8;
  }
  while (v18 > 0);
  return v8;
}

- (int)_findClosestOffsetToTimestamp:(id *)a3
{
  uint64_t v5;
  int count;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v12;
  __int128 v13;
  int32_t v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v16;
  __int128 v17;
  int v18;
  int v19;
  int v20;
  int v21;
  CMTime *v22;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v23;
  __int128 v24;
  int v25;
  int oldest;
  int capacity;
  int v28;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v29;
  __int128 v30;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v31;
  __int128 v32;
  int v33;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime rhs;
  CMTime v40;
  CMTime time2;
  CMTime time;

  if (!self->_count)
  {
    v5 = *MEMORY[0x1E0C99858];
    time = *(CMTime *)a3;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v5, CFSTR("searching for %.4f, empty ring buffer"), CMTimeGetSeconds(&time));
  }
  if (self->_ascending)
  {
    count = self->_count;
    v7 = 0;
    v8 = count - 1;
    if (count >= 1)
    {
      v9 = count - 1;
      while (1)
      {
        v10 = v9 - v7;
        if (v9 < v7)
          ++v10;
        v11 = v7 + (v10 >> 1);
        v12 = &self->_times[(self->_oldest + v11) % self->_capacity];
        v13 = *(_OWORD *)&v12->var0;
        time.epoch = v12->var3;
        *(_OWORD *)&time.value = v13;
        time2 = (CMTime)*a3;
        v14 = CMTimeCompare(&time, &time2);
        switch(v14)
        {
          case -1:
            if (v11 == v8)
              return v8;
            v7 = v11 + 1;
            break;
          case 1:
            if (!v11)
              return v11;
            v9 = v11 - 1;
            break;
          case 0:
            return v11;
        }
        if (v7 > v9)
          goto LABEL_30;
      }
    }
    v9 = count - 1;
LABEL_30:
    oldest = self->_oldest;
    capacity = self->_capacity;
    v28 = (oldest + v9) % capacity;
    memset(&time, 0, sizeof(time));
    v29 = &self->_times[(oldest + v7) % capacity];
    time2 = (CMTime)*a3;
    v30 = *(_OWORD *)&v29->var0;
    rhs.epoch = v29->var3;
    *(_OWORD *)&rhs.value = v30;
    CMTimeSubtract(&v40, &time2, &rhs);
    CMTimeAbsoluteValue(&time, &v40);
    memset(&time2, 0, sizeof(time2));
    v31 = &self->_times[v28];
    rhs = (CMTime)*a3;
    v32 = *(_OWORD *)&v31->var0;
    v37.epoch = v31->var3;
    *(_OWORD *)&v37.value = v32;
    CMTimeSubtract(&v38, &rhs, &v37);
    CMTimeAbsoluteValue(&time2, &v38);
    rhs = time;
    v37 = time2;
    if (CMTimeCompare(&rhs, &v37) >= 1)
      return v9;
    else
      return v7;
  }
  else
  {
    v15 = self->_oldest % self->_capacity;
    memset(&time, 0, sizeof(time));
    v16 = &self->_times[v15];
    v17 = *(_OWORD *)&v16->var0;
    time2.epoch = v16->var3;
    *(_OWORD *)&time2.value = v17;
    rhs = (CMTime)*a3;
    CMTimeSubtract(&v36, &time2, &rhs);
    CMTimeAbsoluteValue(&time, &v36);
    v18 = self->_capacity;
    v19 = (self->_count + self->_oldest) % v18;
    if (v15 + 1 >= v18)
      v20 = self->_capacity;
    else
      v20 = 0;
    v21 = v15 + 1 - v20;
    if (v21 != v19)
    {
      v22 = (CMTime *)MEMORY[0x1E0CA2E68];
      while (1)
      {
        memset(&time2, 0, sizeof(time2));
        v23 = &self->_times[v21];
        v24 = *(_OWORD *)&v23->var0;
        rhs.epoch = v23->var3;
        *(_OWORD *)&rhs.value = v24;
        v37 = (CMTime)*a3;
        CMTimeSubtract(&v35, &rhs, &v37);
        CMTimeAbsoluteValue(&time2, &v35);
        rhs = time2;
        v37 = time;
        if (CMTimeCompare(&rhs, &v37) < 0)
        {
          time = time2;
          rhs = time2;
          v37 = *v22;
          v15 = v21;
          if (!CMTimeCompare(&rhs, &v37))
            break;
        }
        v25 = self->_capacity;
        if (v21 + 1 < v25)
          v25 = 0;
        v21 = v21 + 1 - v25;
        if (v21 == v19)
          goto LABEL_35;
      }
      v15 = v21;
    }
LABEL_35:
    v33 = self->_oldest;
    if (v15 < v33)
      v15 += self->_capacity;
    return v15 - v33;
  }
}

- (id)firstObject
{
  if (self->_count)
    return self->_objects[self->_oldest];
  else
    return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v3;

  if (HIDWORD(self[1].var0))
    v3 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(self->var3 + 24 * self[1].var1);
  else
    v3 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E0CA2E18];
  *retstr = *v3;
  return self;
}

- (id)lastObject
{
  int count;

  count = self->_count;
  if (count)
    return self->_objects[(count + self->_oldest - 1) % self->_capacity];
  else
    return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTime
{
  int var0_high;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v4;

  var0_high = HIDWORD(self[1].var0);
  if (var0_high)
    v4 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(self->var3
                                             + 24 * ((var0_high + self[1].var1 - 1) % SLODWORD(self[1].var0)));
  else
    v4 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E0CA2E18];
  *retstr = *v4;
  return self;
}

- (void)enumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  int v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;
  __int128 v8;
  CMTime v9;
  CMTime time1;

  if (self->_count)
  {
    time1 = *(CMTime *)a3;
    v6 = -[BWObjectRingBuffer _findClosestOffsetToTimestamp:](self, "_findClosestOffsetToTimestamp:", &time1);
    v7 = &self->_times[(self->_oldest + v6) % self->_capacity];
    v8 = *(_OWORD *)&v7->var0;
    time1.epoch = v7->var3;
    *(_OWORD *)&time1.value = v8;
    v9 = *(CMTime *)a3;
    if ((signed int)(v6 + (CMTimeCompare(&time1, &v9) >> 31)) < self->_count)
      -[BWObjectRingBuffer _enumerateObjectsStartingAtOffset:usingBlock:](self, "_enumerateObjectsStartingAtOffset:usingBlock:");
  }
}

- (void)reverseEnumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  int v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v8;
  __int128 v9;
  _BOOL4 v10;
  CMTime v11;
  CMTime time1;

  if (self->_count)
  {
    time1 = *(CMTime *)a3;
    v7 = -[BWObjectRingBuffer _findClosestOffsetToTimestamp:](self, "_findClosestOffsetToTimestamp:", &time1);
    v8 = &self->_times[(self->_oldest + v7) % self->_capacity];
    v9 = *(_OWORD *)&v8->var0;
    time1.epoch = v8->var3;
    *(_OWORD *)&time1.value = v9;
    v11 = *(CMTime *)a3;
    v10 = CMTimeCompare(&time1, &v11) > 0;
    if (v7 - v10 >= 0)
      -[BWObjectRingBuffer _reverseEnumerateObjectsStartingAtOffset:usingBlock:](self, "_reverseEnumerateObjectsStartingAtOffset:usingBlock:", (v7 - v10), a4);
  }
}

- (void)_reverseEnumerateObjectsStartingAtOffset:(int)a3 usingBlock:(id)a4
{
  uint64_t v5;
  uint64_t count;
  int oldest;
  int v9;
  int capacity;
  id v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v12;
  void (*v13)(id, id, __int128 *, uint64_t, char *);
  __int128 v14;
  __int128 v16;
  int64_t var3;
  char v18;

  v5 = *(_QWORD *)&a3;
  if (a3 < 0)
  {
    if (a3 == -1)
      return;
    count = self->_count;
  }
  else
  {
    count = self->_count;
    if ((int)count > a3)
      goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Invalid start %d for ring buffer of count %d"), *(_QWORD *)&a3, count);
LABEL_7:
  v18 = 0;
  oldest = self->_oldest;
  v9 = (oldest + (int)v5) % self->_capacity;
  if (oldest)
    capacity = self->_oldest;
  else
    capacity = self->_capacity;
  do
  {
    v11 = self->_objects[v9];
    v12 = &self->_times[v9];
    v13 = (void (*)(id, id, __int128 *, uint64_t, char *))*((_QWORD *)a4 + 2);
    v14 = *(_OWORD *)&v12->var0;
    var3 = v12->var3;
    v16 = v14;
    v13(a4, v11, &v16, v5, &v18);
    if (v18)
      break;
    if (!v9)
      v9 = self->_capacity;
    v5 = (v5 - 1);
  }
  while (v9-- != capacity);
}

- (void)extractTimeRangeFrom:(id *)a3 until:(id *)a4 into:(id)a5 times:(id)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  _QWORD v7[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v7[1] = 3221225472;
  v7[2] = __60__BWObjectRingBuffer_extractTimeRangeFrom_until_into_times___block_invoke;
  v7[3] = &unk_1E4923E88;
  v8 = *a4;
  v7[4] = a5;
  v7[5] = a6;
  v6 = *a3;
  v7[0] = MEMORY[0x1E0C809B0];
  -[BWObjectRingBuffer enumerateObjectsStartingAt:usingBlock:](self, "enumerateObjectsStartingAt:usingBlock:", &v6, v7);
}

uint64_t __60__BWObjectRingBuffer_extractTimeRangeFrom_until_into_times___block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  void *v10;
  CMTime v11;
  CMTime time1;

  time1 = *a3;
  v11 = *(CMTime *)(a1 + 48);
  result = CMTimeCompare(&time1, &v11);
  if ((result & 0x80000000) != 0)
  {
    result = *(_QWORD *)(a1 + 32);
    if (result)
      result = objc_msgSend((id)result, "addObject:", a2);
    v10 = *(void **)(a1 + 40);
    if (v10)
      return objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{?=qiIq}"));
  }
  else
  {
    *a5 = 1;
  }
  return result;
}

- (void)clear
{
  -[BWObjectRingBuffer _enumerateObjectsStartingAtOffset:usingBlock:](self, "_enumerateObjectsStartingAtOffset:usingBlock:", 0, &__block_literal_global_77);
  self->_count = 0;
  self->_oldest = 0;
  self->_ascending = 1;
}

- (void)flushEntriesEarlierThan:(id *)a3
{
  int count;
  int oldest;
  int v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v8;
  __int128 v9;
  int capacity;
  int v11;
  int v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  CMTime time1;

  count = self->_count;
  if (count)
  {
    oldest = self->_oldest;
    v7 = (oldest + count) % self->_capacity;
    while (1)
    {
      v8 = &self->_times[oldest];
      v9 = *(_OWORD *)&v8->var0;
      time1.epoch = v8->var3;
      *(_OWORD *)&time1.value = v9;
      v13 = *a3;
      if ((CMTimeCompare(&time1, (CMTime *)&v13) & 0x80000000) == 0)
        break;

      capacity = self->_capacity;
      v11 = self->_count;
      if (oldest + 1 < capacity)
        capacity = 0;
      oldest = oldest + 1 - capacity;
      v12 = v11 - 1;
      self->_count = v11 - 1;
      self->_oldest = oldest;
      if (oldest == v7)
        goto LABEL_9;
    }
    v12 = self->_count;
LABEL_9:
    if (v12 <= 1)
    {
      self->_ascending = 1;
      if (!v12)
        self->_oldest = 0;
    }
  }
}

- (id)description
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("BWObjectRingBuffer %p holding %d of %d entries:\n"), self, self->_count, self->_capacity);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__BWObjectRingBuffer_description__block_invoke;
  v5[3] = &unk_1E4923ED0;
  v5[4] = v3;
  -[BWObjectRingBuffer _enumerateObjectsStartingAtOffset:usingBlock:](self, "_enumerateObjectsStartingAtOffset:usingBlock:", 0, v5);
  return v3;
}

uint64_t __33__BWObjectRingBuffer_description__block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4)
{
  void *v4;
  CMTime time;

  v4 = *(void **)(a1 + 32);
  time = *a3;
  return objc_msgSend(v4, "appendFormat:", CFSTR("#%d: %.4f %p\n"), a4, CMTimeGetSeconds(&time), a2);
}

- (int)count
{
  return self->_count;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (BOOL)expectAscending
{
  return self->_expectAscending;
}

@end
