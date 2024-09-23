@implementation BWZoomDelayBuffer

- (uint64_t)zoomRequestForISPAppliedZoomFactor:(float)a3 earlySwitchOverScaleFactorForZoomIn:
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  int v6;

  if (result)
  {
    v3 = *(_DWORD *)(result + 16);
    if (v3)
      v4 = v3 - 1;
    else
      v4 = *(_DWORD *)(result + 24);
    v5 = *(_QWORD *)(result + 8);
    v6 = *(_DWORD *)(result + 32);
    if (*(_DWORD *)(result + 28) == 2)
    {
      if (v6 && (v6 != 2 || (float)(*(float *)(v5 + 16 * v4) / a3) < a2))
        v4 = *(_DWORD *)(result + 16);
    }
    else if (v6)
    {
      v4 = *(_DWORD *)(result + 16);
    }
    return *(_QWORD *)(v5 + 16 * v4);
  }
  return result;
}

- (uint64_t)addZoomRequest:(uint64_t)a3
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  float v6;
  _QWORD *v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;

  if (result)
  {
    v3 = *(unsigned int *)(result + 16);
    if ((_DWORD)v3)
      v4 = v3 - 1;
    else
      v4 = *(_DWORD *)(result + 24);
    v5 = *(_QWORD *)(result + 8);
    v6 = *(float *)(v5 + 16 * v4);
    v7 = (_QWORD *)(v5 + 16 * v3);
    *v7 = a2;
    v7[1] = a3;
    v8 = *(_DWORD *)(result + 16);
    v10 = *(_DWORD *)(result + 24);
    v9 = *(_DWORD *)(result + 28);
    if (v8 + 1 <= v10)
      v11 = v8 + 1;
    else
      v11 = 0;
    *(_DWORD *)(result + 16) = v11;
    if (v9 == 2 && v6 > *(float *)&a2)
    {
      v12 = 1;
      if (*(_DWORD *)(result + 32) == 2 && v10 != 1)
      {
        v13 = 0;
        do
        {
          *(_OWORD *)(*(_QWORD *)(result + 8) + 16 * v11) = *(_OWORD *)(*(_QWORD *)(result + 8) + 16 * v4);
          v14 = *(_DWORD *)(result + 24);
          if (v11 + 1 <= v14)
            ++v11;
          else
            v11 = 0;
          ++v13;
        }
        while (v13 < v14 - 1);
        v12 = 1;
      }
      goto LABEL_21;
    }
    if (v9 == 1 && v6 < *(float *)&a2)
    {
      v12 = 2;
LABEL_21:
      *(_DWORD *)(result + 28) = v12;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_zoomRequestBuffer);
  v3.receiver = self;
  v3.super_class = (Class)BWZoomDelayBuffer;
  -[BWZoomDelayBuffer dealloc](&v3, sel_dealloc);
}

- (_DWORD)initWithMaxZoomDelay:(int)a3 currentZoomDelay:
{
  _DWORD *v5;
  _DWORD *v6;
  char *v7;
  unsigned int v8;
  char *v14;
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)BWZoomDelayBuffer;
  v5 = objc_msgSendSuper2(&v16, sel_init);
  v6 = v5;
  if (!v5)
    return v6;
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = 2;
  v7 = (char *)malloc_type_malloc(16 * (a2 + 1), 0x10000408B6DE1C6uLL);
  *((_QWORD *)v6 + 1) = v7;
  if (!v7)
  {

    return 0;
  }
  v8 = 0;
  __asm { FMOV            V0.2S, #1.0 }
  do
  {
    v14 = &v7[16 * v8];
    *(_QWORD *)v14 = _D0;
    *((_DWORD *)v14 + 2) = 0;
    v14[12] = 0;
    ++v8;
  }
  while (v8 <= v6[5]);
  return v6;
}

- (uint64_t)updateZoomDelay:(uint64_t)result
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (result)
  {
    v2 = *(unsigned int *)(result + 24);
    if (v2 >= a2)
    {
      if (v2 > a2)
      {
        LODWORD(v6) = *(_DWORD *)(result + 16);
        LODWORD(v7) = *(_DWORD *)(result + 24);
        do
        {
          if (v6 < v7)
          {
            v8 = 16 * v6;
            v6 = v6;
            do
            {
              ++v6;
              *(_OWORD *)(*(_QWORD *)(result + 8) + v8) = *(_OWORD *)(*(_QWORD *)(result + 8) + v8 + 16);
              v7 = *(unsigned int *)(result + 24);
              v8 += 16;
            }
            while (v6 < v7);
            LODWORD(v6) = *(_DWORD *)(result + 16);
          }
          LODWORD(v7) = v7 - 1;
          *(_DWORD *)(result + 24) = v7;
          if (v6 > v7)
          {
            LODWORD(v6) = 0;
            *(_DWORD *)(result + 16) = 0;
          }
        }
        while (v7 > a2);
      }
    }
    else
    {
      v3 = *(_DWORD *)(result + 20);
      if (v3 >= a2)
        v3 = a2;
      if ((int)v2 + 1 < v3 + 1)
      {
        v4 = 16 * v2 + 16;
        v5 = v3 - v2;
        do
        {
          *(_OWORD *)(*(_QWORD *)(result + 8) + v4) = *(_OWORD *)(*(_QWORD *)(result + 8)
                                                                + 16 * *(unsigned int *)(result + 24));
          v4 += 16;
          --v5;
        }
        while (v5);
      }
      *(_DWORD *)(result + 24) = v3;
    }
  }
  return result;
}

@end
