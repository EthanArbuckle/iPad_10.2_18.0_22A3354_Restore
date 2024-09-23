@implementation BWMotionSampleRingBuffer

- (uint64_t)addMotionDataToRingBuffer:(int)a3 withSampleCount:
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    mach_absolute_time();
    v6 = FigHostTimeToNanoseconds();
    if (a3 >= 1)
    {
      v7 = 0;
      v8 = (double)(v6 / 1000) / 1000000.0;
      do
      {
        v9 = *(_QWORD *)(v5 + 8);
        if (!v9
          || !((*(_DWORD *)(v9 + 20) + *(_DWORD *)(v9 + 24) - *(_DWORD *)(v9 + 16)) % *(_DWORD *)(v9 + 24))
          || (v10 = a2[1], v10 > *(double *)(-[BWRingBuffer lastElement](*(_QWORD *)(v5 + 8)) + 8))
          && vabdd_f64(v8, v10) < *(double *)(v5 + 16))
        {
          -[BWRingBuffer appendElement:]((_QWORD *)v9, a2);
        }
        a2 += 18;
        v7 += 3;
      }
      while (v7 < a3);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = *(void **)(v5 + 8);
    result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (result)
    {
      v12 = result;
      v13 = 0;
      v14 = *(_QWORD *)v24;
      while (2)
      {
        v15 = 0;
        v16 = v13 + v12;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
          result = -[BWRingBuffer lastElement](*(_QWORD *)(v5 + 8));
          if (*(double *)(result + 8) - *(double *)(v17 + 8) <= *(double *)(v5 + 16))
          {
            v16 = v13 + v15;
            goto LABEL_21;
          }
          ++v15;
        }
        while (v12 != v15);
        result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v12 = result;
        v13 = v16;
        if (result)
          continue;
        break;
      }
    }
    else
    {
      v16 = 0;
    }
LABEL_21:
    v18 = *(_DWORD **)(v5 + 8);
    if (v18)
    {
      v19 = v18[6];
      v20 = v18[4];
      v21 = (v18[5] + v19 - v20) % v19;
      v22 = v21 - *(_DWORD *)(v5 + 24);
      if (v16 <= v22)
      {
        v16 = v21 - *(_DWORD *)(v5 + 24);
        if (!v22)
          return result;
      }
      else if (!v16)
      {
        return result;
      }
      if (v21 >= v16)
        v21 = v16;
      v18[4] = (v21 + v20) % v19;
    }
  }
  return result;
}

- (double)duration
{
  double result;
  uint64_t v2;
  uint64_t v3;

  result = 0.0;
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      v3 = *(int *)(v2 + 16);
      if ((*(_DWORD *)(v2 + 20) + *(_DWORD *)(v2 + 24) - (int)v3) % *(_DWORD *)(v2 + 24) >= 1)
        return *(double *)(-[BWRingBuffer lastElement](*(_QWORD *)(a1 + 8)) + 8)
             - *(double *)(*(_QWORD *)(v2 + 8) + *(_QWORD *)(v2 + 32) * v3 + 8);
    }
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[BWRingBuffer countByEnumeratingWithState:objects:count:](self->_ringBuffer, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (_QWORD)initWithMaxDuration:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)BWMotionSampleRingBuffer;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  v4 = v3;
  if (v3)
  {
    *((double *)v3 + 2) = a2;
    *((_DWORD *)v3 + 6) = (int)(a2 * 66.6666641);
    v5 = -[BWRingBuffer initWithLength:dataTypeSize:]([BWRingBuffer alloc], *((_DWORD *)v3 + 6) + 110, 48);
    v4[1] = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMotionSampleRingBuffer;
  -[BWMotionSampleRingBuffer dealloc](&v3, sel_dealloc);
}

@end
