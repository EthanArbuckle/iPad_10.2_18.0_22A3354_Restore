float ctrTrackerAlgorithm_packedNorm(uint64_t a1, DSPSplitComplex *__C, int a3)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  const DSPSplitComplex *v12;
  float v13;
  float *realp;
  uint64_t v15;
  float v16;
  float *imagp;

  v5 = 0;
  v6 = a3 * a3;
  v7 = (a3 * a3) >> 1;
  if (a3 >= 0)
    v8 = a3;
  else
    v8 = a3 + 1;
  v9 = (uint64_t)v8 >> 1;
  if (v7 <= 1)
    v10 = 1;
  else
    v10 = v7;
  v11 = 0.0;
  do
  {
    v12 = (const DSPSplitComplex *)(a1 + 16 * v5);
    vDSP_zvcmul(v12, 1, v12, 1, __C, 1, v6 >> 1);
    v13 = 0.0;
    if (v6 >= 2)
    {
      realp = __C->realp;
      v15 = v10;
      do
      {
        v16 = *realp++;
        v13 = v13 + v16;
        --v15;
      }
      while (v15);
    }
    imagp = v12->imagp;
    v11 = v11
        + (float)((float)(v13
                        + (float)((float)((float)((float)((float)(*imagp * *imagp) + (float)(*v12->realp * *v12->realp))
                                                + (float)(v12->realp[v9] * v12->realp[v9]))
                                        + (float)(imagp[v9] * imagp[v9]))
                                * -0.5))
                / (float)(int)(2 * v6));
    ++v5;
  }
  while (v5 != 4);
  return v11;
}

uint64_t ctrTrackerAlgorithm_packedDivision(float **a1, float **a2, float **a3, int a4, float a5)
{
  uint64_t v5;
  float *v6;
  int v7;
  float *v8;
  int v9;
  int i;
  int v11;
  int v12;
  signed int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  float *v26;
  float *v27;
  float *v28;
  float *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int j;
  int v35;
  int v36;

  if ((a4 * a4) >= 2)
  {
    v5 = (a4 * a4) >> 1;
    v6 = *a1;
    do
    {
      *v6 = *v6 + a5;
      ++v6;
      --v5;
    }
    while (v5);
  }
  v7 = 2 * a4;
  if (a4 >= 4)
  {
    v8 = *a1;
    v9 = 3 * a4;
    for (i = 3; i < a4; i += 2)
    {
      if (v9 >= 0)
        v11 = v9;
      else
        v11 = v9 + 1;
      v8[v11 >> 1] = v8[v11 >> 1] - a5;
      v9 += v7;
    }
  }
  if (a4 <= 0)
  {
    v13 = -(-a4 >> 1);
  }
  else
  {
    v12 = 0;
    v13 = a4 >> 1;
    if (a4 >> 1 <= 2)
      v14 = 2;
    else
      v14 = a4 >> 1;
    v15 = 4 * v14 - 4;
    do
    {
      if (a4 >= 4)
      {
        v16 = 0;
        v17 = v12 * a4 / 2;
        v18 = (uint64_t)&(*a1)[v17];
        v19 = (uint64_t)&a1[1][v17];
        v20 = (uint64_t)&(*a3)[v17];
        v21 = (uint64_t)&a3[1][v17];
        v22 = (uint64_t)&(*a2)[v17 + 1];
        v23 = v18 + 4;
        v24 = v19 + 4;
        do
        {
          *(float *)(v20 + 4 + v16) = (float)(*(float *)(v22 + v16) * *(float *)(v23 + v16))
                                    / (float)((float)(*(float *)(v24 + v16) * *(float *)(v24 + v16))
                                            + (float)(*(float *)(v23 + v16) * *(float *)(v23 + v16)));
          *(float *)(v21 + 4 + v16) = (float)-(float)(*(float *)(v22 + v16) * *(float *)(v24 + v16))
                                    / (float)((float)(*(float *)(v24 + v16) * *(float *)(v24 + v16))
                                            + (float)(*(float *)(v23 + v16) * *(float *)(v23 + v16)));
          v16 += 4;
        }
        while (v15 != v16);
      }
      ++v12;
    }
    while (v12 != a4);
  }
  v25 = *a2;
  v26 = *a1;
  v27 = a1[1];
  v28 = *a3;
  v29 = a3[1];
  *v28 = (float)(**a2 * **a1) / (float)((float)(*v27 * *v27) + (float)(**a1 * **a1));
  *v29 = (float)-(float)(*v25 * *v27) / (float)((float)(*v27 * *v27) + (float)(*v26 * *v26));
  v28[v13] = (float)(v25[v13] * v26[v13]) / (float)((float)(v27[v13] * v27[v13]) + (float)(v26[v13] * v26[v13]));
  v29[v13] = (float)-(float)(v25[v13] * v27[v13]) / (float)((float)(v27[v13] * v27[v13]) + (float)(v26[v13] * v26[v13]));
  if (a4 >= 3)
  {
    v30 = 2;
    v31 = 2 * a4;
    do
    {
      v32 = v31 >> 1;
      v28[v32] = (float)(v25[v32] * v26[v32]) / (float)((float)(v27[v32] * v27[v32]) + (float)(v26[v32] * v26[v32]));
      v29[v32] = (float)-(float)(v25[v32] * v27[v32])
               / (float)((float)(v27[v32] * v27[v32]) + (float)(v26[v32] * v26[v32]));
      v30 += 2;
      v31 += v7;
    }
    while (v30 < a4);
    if (a4 >= 4)
    {
      v33 = 3 * a4;
      for (j = 3; j < a4; j += 2)
      {
        if (v33 >= 0)
          v35 = v33;
        else
          v35 = v33 + 1;
        v36 = v35 >> 1;
        v28[v36] = 0.0;
        v29[v36] = 0.0;
        v33 += v7;
      }
    }
  }
  return 0;
}

uint64_t ctrTrackerAlgorithm_generateYf(const DSPSplitComplex *a1, DSPComplex *a2, unsigned int a3, float a4)
{
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  DSPComplex *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  uint64_t v19;
  vDSP_Length v20;
  OpaqueFFTSetup *fftsetup;
  unsigned int v23;
  uint64_t v25;
  uint64_t v26;

  v23 = a3 * a3;
  bzero(a2, 4 * a3 * a3);
  if ((int)a3 >= 2)
  {
    v7 = 0;
    v8 = a3 >> 1;
    v9 = (float)(a4 * a4);
    v10 = a3;
    v11 = v10 + v10 * v10;
    v12 = 4 * a3;
    v13 = (char *)a2 + 4 * a3 * (unint64_t)a3;
    v14 = a2;
    do
    {
      v15 = 0;
      v16 = v10;
      v25 = v11;
      v26 = v7 * v10;
      do
      {
        v17 = (float)(v7 * v7 + v15 * v15) * -0.5 / v9;
        v18 = expf(v17);
        *(&v14->real + v15) = v18;
        if (v7)
        {
          *(float *)&v13[4 * v15] = v18;
          if (!v15)
            goto LABEL_10;
          *(float *)((char *)&v14->real + v12) = v18;
          v19 = v11;
        }
        else
        {
          if (!v15)
            goto LABEL_10;
          v19 = v16 - v15 + v26;
        }
        *(&a2->real + v19) = v18;
LABEL_10:
        ++v15;
        --v11;
        v12 -= 4;
      }
      while (v8 != v15);
      ++v7;
      v10 = v16;
      v12 = 4 * a3;
      v11 = v25 - v16;
      v14 = (DSPComplex *)((char *)v14 + v12);
      v13 -= v12;
    }
    while (v7 != v8);
  }
  v20 = (unint64_t)log2f((float)(int)a3);
  fftsetup = vDSP_create_fftsetup(v20, 0);
  vDSP_ctoz(a2, 2, a1, 1, v23 >> 1);
  vDSP_fft2d_zrip(fftsetup, a1, 1, 0, v20, v20, 1);
  vDSP_destroy_fftsetup(fftsetup);
  return 0;
}

uint64_t ctrTrackerAlgorithm_getResponse(const DSPSplitComplex *a1, DSPSplitComplex *__B, DSPSplitComplex *__C, int a4, DSPComplex *a5)
{
  unsigned int v10;
  unsigned int v11;
  float *realp;
  float *imagp;
  uint64_t v14;
  float *v15;
  float *v16;
  float *v17;
  float *v18;
  float *v19;
  float *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  float v26;
  float v27;
  int v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  vDSP_Length v35;
  OpaqueFFTSetup *fftsetup;

  v10 = a4 * a4;
  v11 = (a4 * a4) >> 1;
  vDSP_zvcmul(a1, 1, __B, 1, __C, 1, v11);
  realp = __C->realp;
  imagp = __C->imagp;
  if (v10 >= 2)
  {
    if (v11 <= 1)
      v14 = 1;
    else
      v14 = v11;
    v15 = __C->realp;
    v16 = __C->imagp;
    do
    {
      *v15 = *v15 * 0.5;
      ++v15;
      *v16 = *v16 * 0.5;
      ++v16;
      --v14;
    }
    while (v14);
  }
  v17 = __B->realp;
  v18 = __B->imagp;
  v19 = a1->realp;
  v20 = a1->imagp;
  *realp = (float)(*__B->realp * *a1->realp) * 0.5;
  *imagp = (float)(*v18 * *v20) * 0.5;
  if (a4 >= 0)
    v21 = a4;
  else
    v21 = a4 + 1;
  v22 = v21 >> 1;
  realp[v22] = (float)(v17[v22] * v19[v22]) * 0.5;
  imagp[v22] = (float)(v18[v22] * v20[v22]) * 0.5;
  if (a4 >= 3)
  {
    v23 = 2;
    v24 = 2 * a4;
    do
    {
      v25 = v24 >> 1;
      v26 = v17[v24 >> 1];
      v27 = v18[v24 >> 1];
      v28 = v22 + (v24 >> 1);
      v29 = v17[v28];
      v30 = v18[v28];
      v31 = v19[v24 >> 1];
      v32 = v20[v24 >> 1];
      v33 = v19[v28];
      v34 = v20[v28];
      realp[v25] = (float)((float)(v26 * v31) - (float)(v29 * v33)) * 0.5;
      imagp[v25] = (float)((float)(v27 * v32) - (float)(v30 * v34)) * 0.5;
      realp[v28] = (float)((float)(v29 * v31) + (float)(v26 * v33)) * 0.5;
      imagp[v28] = (float)((float)(v30 * v32) + (float)(v27 * v34)) * 0.5;
      v23 += 2;
      v24 += 2 * a4;
    }
    while (v23 < a4);
  }
  v35 = (unint64_t)log2f((float)a4);
  fftsetup = vDSP_create_fftsetup(v35, 0);
  vDSP_fft2d_zrip(fftsetup, __C, 1, 0, v35, v35, -1);
  vDSP_ztoc(__C, 1, a5, 2, v10 >> 1);
  vDSP_destroy_fftsetup(fftsetup);
  return 0;
}

float **ctrTrackerAlgorithm_runningAvg(float **result, float **a2, int a3, float a4)
{
  float v4;
  float *v5;
  float *v6;
  float *v7;
  float *v8;
  uint64_t v9;
  float v10;
  float v11;

  if (a3 >= 1)
  {
    v4 = 1.0 - a4;
    v5 = *a2;
    v6 = a2[1];
    v7 = *result;
    v8 = result[1];
    v9 = a3;
    do
    {
      v10 = *v7++;
      *v5 = (float)(v10 * a4) + (float)(v4 * *v5);
      ++v5;
      v11 = *v8++;
      *v6 = (float)(v11 * a4) + (float)(v4 * *v6);
      ++v6;
      --v9;
    }
    while (v9);
  }
  return result;
}

void ctrTrackerInitialization_freeContext(void *a1)
{
  uint64_t i;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (*(_QWORD *)a1)
  {
    for (i = 2048; i != 2112; i += 16)
    {
      free(*(void **)(*(_QWORD *)a1 + i));
      free(*(void **)(*(_QWORD *)a1 + i + 8));
    }
    free(*(void **)(*(_QWORD *)a1 + 2112));
    free(*(void **)(*(_QWORD *)a1 + 2120));
    v3 = *(void **)a1;
  }
  else
  {
    v3 = 0;
  }
  free(v3);
  if (*((_QWORD *)a1 + 2))
  {
    free(*(void **)(*((_QWORD *)a1 + 2) + 245992));
    free(*(void **)(*((_QWORD *)a1 + 2) + 246000));
    free(*(void **)(*((_QWORD *)a1 + 2) + 246008));
    free(*(void **)(*((_QWORD *)a1 + 2) + 246016));
    v4 = 4;
    v5 = 245936;
    do
    {
      free(*(void **)(*((_QWORD *)a1 + 2) + v5 - 8));
      free(*(void **)(*((_QWORD *)a1 + 2) + v5));
      v5 += 16;
      --v4;
    }
    while (v4);
    v6 = 246032;
    v7 = 3;
    do
    {
      free(*(void **)(*((_QWORD *)a1 + 2) + v6 - 8));
      free(*(void **)(*((_QWORD *)a1 + 2) + v6));
      v6 += 16;
      --v7;
    }
    while (v7);
    v8 = (void *)*((_QWORD *)a1 + 2);
  }
  else
  {
    v8 = 0;
  }
  free(v8);
  v9 = *((_QWORD *)a1 + 4);
  if (v9)
  {
    free(*(void **)(v9 + 65632));
    free(*(void **)(*((_QWORD *)a1 + 4) + 65640));
    v10 = (void *)*((_QWORD *)a1 + 4);
  }
  else
  {
    v10 = 0;
  }
  free(v10);
  free(*((void **)a1 + 1));
  tplTrackerResampler_free((void ***)a1 + 3);
  free(a1);
}

_QWORD *ctrTrackerInitialization_allocContext()
{
  _QWORD *v0;
  uint64_t i;
  void *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64x2_t v12;
  void *v13;
  _QWORD *v14;

  v0 = malloc_type_calloc(1uLL, 0x28uLL, 0x20040769AC3DAuLL);
  v0[1] = malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
  *v0 = malloc_type_calloc(1uLL, 0x860uLL, 0x1080040EFF975D0uLL);
  for (i = 2048; i != 2112; i += 16)
  {
    *(_QWORD *)(*v0 + i) = malloc_type_malloc(0x8000uLL, 0xAE71F07BuLL);
    *(_QWORD *)(*v0 + i + 8) = malloc_type_malloc(0x8000uLL, 0x80E07E31uLL);
  }
  *(_QWORD *)(*v0 + 2112) = malloc_type_malloc(0x8000uLL, 0xA18390C5uLL);
  v2 = malloc_type_malloc(0x8000uLL, 0x4D6B1C2BuLL);
  v3 = (_QWORD *)*v0;
  v3[265] = v2;
  bzero(v3, 0x400uLL);
  bzero((void *)(*v0 + 1024), 0x400uLL);
  v4 = malloc_type_calloc(1uLL, 0x3D158uLL, 0x108004024A52FC1uLL);
  v0[2] = v4;
  bzero(v4, 0x4000uLL);
  bzero((void *)(v0[2] + 0x4000), 0x4000uLL);
  bzero((void *)(v0[2] + 0x8000), 0x4000uLL);
  bzero((void *)(v0[2] + 49152), 0x4000uLL);
  bzero((void *)(v0[2] + 0x10000), 0x4000uLL);
  bzero((void *)(v0[2] + 81920), 0x4000uLL);
  bzero((void *)(v0[2] + 98304), 0x4000uLL);
  bzero((void *)(v0[2] + 246072), 0x400uLL);
  bzero((void *)(v0[2] + 247096), 0x400uLL);
  bzero((void *)(v0[2] + 248120), 0x400uLL);
  bzero((void *)(v0[2] + 249144), 0x400uLL);
  *(_QWORD *)(v0[2] + 245992) = malloc_type_malloc(0x8000uLL, 0xB96FD674uLL);
  *(_QWORD *)(v0[2] + 246000) = malloc_type_malloc(0x8000uLL, 0x817B6332uLL);
  *(_QWORD *)(v0[2] + 246008) = malloc_type_malloc(0x8000uLL, 0xB96FD674uLL);
  *(_QWORD *)(v0[2] + 246016) = malloc_type_malloc(0x8000uLL, 0x817B6332uLL);
  v5 = 4;
  v6 = 245936;
  do
  {
    *(_QWORD *)(v0[2] + v6 - 8) = malloc_type_malloc(0x8000uLL, 0x9828C6A2uLL);
    *(_QWORD *)(v0[2] + v6) = malloc_type_malloc(0x8000uLL, 0xE1A49D0CuLL);
    v6 += 16;
    --v5;
  }
  while (v5);
  v7 = 246032;
  v8 = 3;
  do
  {
    *(_QWORD *)(v0[2] + v7 - 8) = malloc_type_calloc(0x40uLL, 4uLL, 0x100004052888210uLL);
    v9 = malloc_type_calloc(0x40uLL, 4uLL, 0x100004052888210uLL);
    v10 = v0[2];
    *(_QWORD *)(v10 + v7) = v9;
    v7 += 16;
    --v8;
  }
  while (v8);
  *(_DWORD *)(v10 + 250184) = 0;
  v0[3] = tplTrackerResampler_alloc(0x80uLL, 0x80uLL, 1.1);
  v11 = malloc_type_calloc(1uLL, 0x10070uLL, 0x10C0040E2B89275uLL);
  v0[4] = v11;
  generate_size_search_stablizer((uint64_t)v11, 21, 15.0, 13.0);
  generate_sqrt_table(v0[4] + 84, 0x4000, v12);
  *(_QWORD *)(v0[4] + 65632) = malloc_type_malloc(0x8000uLL, 0xE983885uLL);
  v13 = malloc_type_malloc(0x8000uLL, 0x6322EA7FuLL);
  v14 = (_QWORD *)(v0[4] + 65624);
  v14[2] = v13;
  *v14 = &cosineWindow;
  return v0;
}

void ctrTrackerInitialization_cleanUpContext(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;

  for (i = 2048; i != 2112; i += 16)
  {
    bzero(*(void **)(*(_QWORD *)a1 + i), 0x8000uLL);
    bzero(*(void **)(*(_QWORD *)a1 + i + 8), 0x8000uLL);
  }
  bzero(*(void **)(*(_QWORD *)a1 + 2112), 0x8000uLL);
  bzero(*(void **)(*(_QWORD *)a1 + 2120), 0x8000uLL);
  bzero(*(void **)a1, 0x400uLL);
  bzero((void *)(*(_QWORD *)a1 + 1024), 0x400uLL);
  bzero(*(void **)(a1 + 16), 0x4000uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 0x4000), 0x4000uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 0x8000), 0x4000uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 49152), 0x4000uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 0x10000), 0x4000uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 81920), 0x4000uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 98304), 0x4000uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 246072), 0x400uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 247096), 0x400uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 248120), 0x400uLL);
  bzero((void *)(*(_QWORD *)(a1 + 16) + 249144), 0x400uLL);
  v3 = *(_QWORD *)(a1 + 16) + 250184;
  *(_BYTE *)(v3 + 8) = 0;
  *(_QWORD *)v3 = 0;
  bzero(*(void **)(*(_QWORD *)(a1 + 16) + 245992), 0x8000uLL);
  bzero(*(void **)(*(_QWORD *)(a1 + 16) + 246000), 0x8000uLL);
  bzero(*(void **)(*(_QWORD *)(a1 + 16) + 246008), 0x8000uLL);
  bzero(*(void **)(*(_QWORD *)(a1 + 16) + 246016), 0x8000uLL);
  v4 = 4;
  v5 = 245936;
  do
  {
    bzero(*(void **)(*(_QWORD *)(a1 + 16) + v5 - 8), 0x8000uLL);
    bzero(*(void **)(*(_QWORD *)(a1 + 16) + v5), 0x8000uLL);
    v5 += 16;
    --v4;
  }
  while (v4);
  v6 = 246032;
  v7 = 3;
  do
  {
    v8 = *(_OWORD **)(*(_QWORD *)(a1 + 16) + v6 - 8);
    v8[14] = 0uLL;
    v8[15] = 0uLL;
    v8[12] = 0uLL;
    v8[13] = 0uLL;
    v8[10] = 0uLL;
    v8[11] = 0uLL;
    v8[8] = 0uLL;
    v8[9] = 0uLL;
    v8[6] = 0uLL;
    v8[7] = 0uLL;
    v8[4] = 0uLL;
    v8[5] = 0uLL;
    v8[2] = 0uLL;
    v8[3] = 0uLL;
    *v8 = 0uLL;
    v8[1] = 0uLL;
    v9 = *(_OWORD **)(*(_QWORD *)(a1 + 16) + v6);
    v9[14] = 0uLL;
    v9[15] = 0uLL;
    v9[12] = 0uLL;
    v9[13] = 0uLL;
    v9[10] = 0uLL;
    v9[11] = 0uLL;
    v9[8] = 0uLL;
    v9[9] = 0uLL;
    v9[6] = 0uLL;
    v9[7] = 0uLL;
    v9[4] = 0uLL;
    v9[5] = 0uLL;
    v9[2] = 0uLL;
    v9[3] = 0uLL;
    *v9 = 0uLL;
    v9[1] = 0uLL;
    v6 += 16;
    --v7;
  }
  while (v7);
  bzero(*(void **)(*(_QWORD *)(a1 + 32) + 65632), 0x8000uLL);
  bzero(*(void **)(*(_QWORD *)(a1 + 32) + 65640), 0x8000uLL);
}

uint64_t ctrTrackerInitialization_setUpTracker(__CVBuffer *a1, uint64_t *a2, float64x2_t *a3)
{
  float64x2_t *v6;
  int *v7;
  float v8;
  float v9;

  v6 = (float64x2_t *)malloc_type_calloc(4uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  ctrTrackerComputation_overscan(a3, (uint64_t)v6, 1.56);
  *(float64x2_t *)(*a2 + 2128) = vdivq_f64(vsubq_f64(v6[2], *v6), (float64x2_t)vdupq_n_s64(0x405FC00000000000uLL));
  v7 = (int *)(a2[2] + 250168);
  tplTrackerResampler_setImage(a2[3], a1, v6->f64);
  v8 = *(double *)(*a2 + 2136);
  v9 = *(double *)(*a2 + 2128);
  tplTrackerResampler_resample(a2[3], v6->f64, 0x80u, 128, a2[2], (_BYTE *)(a2[2] + 0x4000), (_BYTE *)(a2[2] + 0x8000), v7, v8, v9);
  if (*v7 > 0 || v7[1] > 0 || v7[2] < 127 || v7[3] <= 126)
    ctrTrackerComputation_repairNonValidRegion(a2[2], a2[2] + 0x4000, a2[2] + 0x8000, v7);
  free(v6);
  ctrTrackerComputation_YCbCr2nRGB((unsigned __int8 *)a2[2], (unsigned __int8 *)(a2[2] + 0x4000), (unsigned __int8 *)(a2[2] + 0x8000), 0x4000, (_BYTE *)(a2[2] + 49152), (_BYTE *)(a2[2] + 0x10000), (_BYTE *)(a2[2] + 81920));
  ctrTrackerComputation_normedGradient(a2[2] + 49152, a2[2] + 0x10000, a2[2] + 81920, 128, 128, a2[2] + 98304);
  ctrTrackerAlgorithm_computeFFTx((unsigned __int8 *)(a2[2] + 49152), (unsigned __int8 *)(a2[2] + 0x10000), (unsigned __int8 *)(a2[2] + 81920), (unsigned __int8 *)(a2[2] + 98304), *(float **)(a2[4] + 65624), 128, (const DSPComplex *)(a2[2] + 114856), (const DSPSplitComplex *)(*a2 + 2048));
  ctrTrackerAlgorithm_GaussianCorrelation(*a2 + 2048, *a2 + 2048, (DSPSplitComplex *)(a2[2] + 245992), (const DSPSplitComplex *)(a2[2] + 246024), (DSPComplex *)(a2[2] + 114856), (void *)(a2[2] + 180392), 128, 0.2);
  ctrTrackerAlgorithm_generateYf((const DSPSplitComplex *)(a2[4] + 65632), (DSPComplex *)(a2[2] + 114856), 0x80u, 5.0);
  ctrTrackerAlgorithm_packedDivision((float **)(a2[2] + 245992), (float **)(a2[4] + 65632), (float **)(*a2 + 2112), 128, 0.0001);
  *(_QWORD *)a2[1] = 0;
  return ctrTrackerComputation_colorHistogram(a2[2] + 49152, a2[2] + 0x10000, a2[2] + 81920, (char *)*a2, (char *)(*a2 + 1024), 128, 50);
}

uint64_t ctrTrackerComputation_trackNewFrame(__CVBuffer *a1, uint64_t a2, float64x2_t *a3, BOOL *a4, _BYTE *a5)
{
  double *v10;
  double v11;
  int *v12;
  double v13;
  float v14;
  float v15;
  uint64_t v16;
  void *v17;
  size_t Width;
  size_t Height;
  float v20;
  float v21;
  double v22;
  double v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t i;
  uint64_t result;
  uint64_t v29;
  float *v30;
  float *v31;
  float *v32;

  v10 = (double *)malloc_type_calloc(4uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  ctrTrackerComputation_overscan(a3, (uint64_t)v10, 1.56);
  v11 = (v10[4] - *v10) / 127.0;
  v12 = (int *)(*(_QWORD *)(a2 + 16) + 250168);
  v13 = (v10[5] - v10[1]) / 127.0;
  tplTrackerResampler_setImage(*(_QWORD *)(a2 + 24), a1, v10);
  v14 = v13;
  v15 = v11;
  tplTrackerResampler_resample(*(_QWORD *)(a2 + 24), v10, 0x80u, 128, *(_QWORD *)(a2 + 16), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x4000), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x8000), v12, v14, v15);
  if (*v12 > 0 || v12[1] > 0 || v12[2] < 127 || v12[3] <= 126)
    ctrTrackerComputation_repairNonValidRegion(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 16) + 0x4000, *(_QWORD *)(a2 + 16) + 0x8000, v12);
  ctrTrackerComputation_YCbCr2nRGB(*(unsigned __int8 **)(a2 + 16), (unsigned __int8 *)(*(_QWORD *)(a2 + 16) + 0x4000), (unsigned __int8 *)(*(_QWORD *)(a2 + 16) + 0x8000), 0x4000, (_BYTE *)(*(_QWORD *)(a2 + 16) + 49152), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x10000), (_BYTE *)(*(_QWORD *)(a2 + 16) + 81920));
  ctrTrackerComputation_normedGradient(*(_QWORD *)(a2 + 16) + 49152, *(_QWORD *)(a2 + 16) + 0x10000, *(_QWORD *)(a2 + 16) + 81920, 128, 128, *(_QWORD *)(a2 + 16) + 98304);
  v16 = *(_QWORD *)(a2 + 16);
  ctrTrackerAlgorithm_computeFFTx((unsigned __int8 *)(v16 + 49152), (unsigned __int8 *)(v16 + 0x10000), (unsigned __int8 *)(v16 + 81920), (unsigned __int8 *)(v16 + 98304), *(float **)(*(_QWORD *)(a2 + 32) + 65624), 128, (const DSPComplex *)(v16 + 114856), (const DSPSplitComplex *)(v16 + 245928));
  ctrTrackerAlgorithm_GaussianCorrelation(*(_QWORD *)(a2 + 16) + 245928, *(_QWORD *)a2 + 2048, (DSPSplitComplex *)(*(_QWORD *)(a2 + 16) + 245992), (const DSPSplitComplex *)(*(_QWORD *)(a2 + 16) + 246024), (DSPComplex *)(*(_QWORD *)(a2 + 16) + 114856), (void *)(*(_QWORD *)(a2 + 16) + 180392), 128, 0.2);
  ctrTrackerAlgorithm_getResponse((const DSPSplitComplex *)(*(_QWORD *)(a2 + 16) + 245992), (DSPSplitComplex *)(*(_QWORD *)a2 + 2112), (DSPSplitComplex *)(*(_QWORD *)(a2 + 16) + 246008), 128, (DSPComplex *)(*(_QWORD *)(a2 + 16) + 180392));
  v17 = malloc_type_malloc(0xCuLL, 0x10000403E1C8BA9uLL);
  ctrTrackerComputation_updateLocation(*(_QWORD *)(a2 + 16) + 180392, (uint64_t)a3, 128, (uint64_t)v17, *(double *)(*(_QWORD *)a2 + 2128), *(double *)(*(_QWORD *)a2 + 2136));
  *a4 = ctrTrackerComputation_getPSR(*(_QWORD *)(a2 + 16) + 180392, 128, (uint64_t)v17, *(_QWORD *)(a2 + 8));
  free(v17);
  if (*(int *)(*(_QWORD *)(a2 + 8) + 4) >= 31)
    *a5 = 1;
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  if (ctrTrackerComputation_checkBoxLocation(a3->f64, Width, Height) && *a4)
  {
    ctrTrackerComputation_overscan(a3, (uint64_t)v10, 0.2);
    tplTrackerResampler_setImage(*(_QWORD *)(a2 + 24), a1, v10);
    v20 = (v10[5] - v10[1]) / 127.0;
    v21 = (v10[4] - *v10) / 127.0;
    tplTrackerResampler_resample(*(_QWORD *)(a2 + 24), v10, 0x80u, 128, *(_QWORD *)(a2 + 16), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x4000), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x8000), v12, v20, v21);
    ctrTrackerComputation_YCbCr2nRGB(*(unsigned __int8 **)(a2 + 16), (unsigned __int8 *)(*(_QWORD *)(a2 + 16) + 0x4000), (unsigned __int8 *)(*(_QWORD *)(a2 + 16) + 0x8000), 0x4000, (_BYTE *)(*(_QWORD *)(a2 + 16) + 49152), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x10000), (_BYTE *)(*(_QWORD *)(a2 + 16) + 81920));
    ctrTrackerComputation_sizeAdaption(*(_QWORD *)(a2 + 16), *(float **)a2, (float *)(*(_QWORD *)a2 + 1024), *(float **)(a2 + 32), *(_QWORD *)(a2 + 32) + 84, a3, 128);
  }
  ctrTrackerComputation_overscan(a3, (uint64_t)v10, 1.56);
  v22 = (v10[4] - *v10) / 127.0;
  v23 = (v10[5] - v10[1]) / 127.0;
  tplTrackerResampler_setImage(*(_QWORD *)(a2 + 24), a1, v10);
  v24 = v23;
  v25 = v22;
  tplTrackerResampler_resample(*(_QWORD *)(a2 + 24), v10, 0x80u, 128, *(_QWORD *)(a2 + 16), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x4000), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x8000), v12, v24, v25);
  if (*v12 > 0 || v12[1] > 0 || v12[2] < 127 || v12[3] <= 126)
    ctrTrackerComputation_repairNonValidRegion(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 16) + 0x4000, *(_QWORD *)(a2 + 16) + 0x8000, v12);
  free(v10);
  ctrTrackerComputation_YCbCr2nRGB(*(unsigned __int8 **)(a2 + 16), (unsigned __int8 *)(*(_QWORD *)(a2 + 16) + 0x4000), (unsigned __int8 *)(*(_QWORD *)(a2 + 16) + 0x8000), 0x4000, (_BYTE *)(*(_QWORD *)(a2 + 16) + 49152), (_BYTE *)(*(_QWORD *)(a2 + 16) + 0x10000), (_BYTE *)(*(_QWORD *)(a2 + 16) + 81920));
  ctrTrackerComputation_normedGradient(*(_QWORD *)(a2 + 16) + 49152, *(_QWORD *)(a2 + 16) + 0x10000, *(_QWORD *)(a2 + 16) + 81920, 128, 128, *(_QWORD *)(a2 + 16) + 98304);
  v26 = *(_QWORD *)(a2 + 16);
  ctrTrackerAlgorithm_computeFFTx((unsigned __int8 *)(v26 + 49152), (unsigned __int8 *)(v26 + 0x10000), (unsigned __int8 *)(v26 + 81920), (unsigned __int8 *)(v26 + 98304), *(float **)(*(_QWORD *)(a2 + 32) + 65624), 128, (const DSPComplex *)(v26 + 114856), (const DSPSplitComplex *)(v26 + 245928));
  ctrTrackerAlgorithm_GaussianCorrelation(*(_QWORD *)(a2 + 16) + 245928, *(_QWORD *)(a2 + 16) + 245928, (DSPSplitComplex *)(*(_QWORD *)(a2 + 16) + 245992), (const DSPSplitComplex *)(*(_QWORD *)(a2 + 16) + 246024), (DSPComplex *)(*(_QWORD *)(a2 + 16) + 114856), (void *)(*(_QWORD *)(a2 + 16) + 180392), 128, 0.2);
  ctrTrackerAlgorithm_packedDivision((float **)(*(_QWORD *)(a2 + 16) + 245992), (float **)(*(_QWORD *)(a2 + 32) + 65632), (float **)(*(_QWORD *)(a2 + 16) + 246008), 128, 0.0001);
  ctrTrackerAlgorithm_runningAvg((float **)(*(_QWORD *)(a2 + 16) + 246008), (float **)(*(_QWORD *)a2 + 2112), 0x2000, 0.02);
  for (i = 0; i != 64; i += 16)
    ctrTrackerAlgorithm_runningAvg((float **)(*(_QWORD *)(a2 + 16) + i + 245928), (float **)(*(_QWORD *)a2 + i + 2048), 0x2000, 0.02);
  result = ctrTrackerComputation_colorHistogram(*(_QWORD *)(a2 + 16) + 49152, *(_QWORD *)(a2 + 16) + 0x10000, *(_QWORD *)(a2 + 16) + 81920, (char *)(*(_QWORD *)(a2 + 16) + 248120), (char *)(*(_QWORD *)(a2 + 16) + 249144), 128, 50);
  v29 = 0;
  v30 = *(float **)a2;
  v31 = (float *)(*(_QWORD *)(a2 + 16) + 248120);
  do
  {
    v32 = &v30[v29];
    *v32 = (float)(*v31 * 0.05) + (float)(v30[v29] * 0.95);
    v32[256] = (float)(v31[256] * 0.05) + (float)(v30[v29 + 256] * 0.95);
    ++v31;
    ++v29;
  }
  while (v29 != 256);
  return result;
}

int8x16_t ctrTrackerComputation_overscan(float64x2_t *a1, uint64_t a2, float a3)
{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  int8x16_t v13;
  int8x16_t result;

  v3 = a1[2];
  v4 = vsubq_f64(v3, *a1);
  __asm { FMOV            V2.2D, #0.5 }
  v10 = vmulq_f64(vaddq_f64(v3, *a1), _Q2);
  v11 = vmulq_f64(vmulq_n_f64(v4, (float)(a3 + 1.0)), _Q2);
  v12 = vsubq_f64(v10, v11);
  *(float64x2_t *)a2 = v12;
  *(float64_t *)(a2 + 16) = v12.f64[0];
  v13 = (int8x16_t)vaddq_f64(v10, v11);
  result = vextq_s8(v13, v13, 8uLL);
  *(int8x16_t *)(a2 + 24) = result;
  *(int8x16_t *)(a2 + 40) = result;
  *(float64_t *)(a2 + 56) = v12.f64[1];
  return result;
}

uint64_t ctrTrackerComputation_repairNonValidRegion(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  int v21;
  uint64_t v22;

  LODWORD(v4) = *a4;
  if (*a4 >= 1)
  {
    v5 = 0;
    v6 = result;
    v7 = a2;
    v8 = a3;
    do
    {
      if ((int)v4 >= 1)
      {
        v9 = 0;
        v10 = v5 << 7;
        do
        {
          *(_BYTE *)(v6 + v9) = *(_BYTE *)(result + v10 + (int)v4);
          *(_BYTE *)(v7 + v9) = *(_BYTE *)(a2 + v10 + *a4);
          *(_BYTE *)(v8 + v9++) = *(_BYTE *)(a3 + v10 + *a4);
          v4 = *a4;
        }
        while (v9 < v4);
      }
      ++v5;
      v8 += 128;
      v7 += 128;
      v6 += 128;
    }
    while (v5 != 128);
  }
  LODWORD(v11) = a4[2];
  if ((int)v11 <= 126)
  {
    v12 = 0;
    v13 = result + 1;
    v14 = a2 + 1;
    for (i = a3 + 1; ; i += 128)
    {
      if ((int)v11 <= 126)
      {
        v16 = v12 << 7;
        v11 = (int)v11;
        do
        {
          *(_BYTE *)(v13 + v11) = *(_BYTE *)(result + v16 + a4[2]);
          *(_BYTE *)(v14 + v11) = *(_BYTE *)(a2 + v16 + a4[2]);
          *(_BYTE *)(i + v11++) = *(_BYTE *)(a3 + v16 + a4[2]);
        }
        while (v11 != 127);
      }
      if (++v12 == 128)
        break;
      LODWORD(v11) = a4[2];
      v13 += 128;
      v14 += 128;
    }
  }
  if (a4[1] >= 1)
  {
    v17 = 0;
    v18 = 0;
    do
    {
      for (j = 0; j != 128; ++j)
      {
        *(_BYTE *)(result + v17 + j) = *(_BYTE *)(result + ((uint64_t)a4[1] << 7) + j);
        *(_BYTE *)(a2 + v17 + j) = *(_BYTE *)(a2 + ((uint64_t)a4[1] << 7) + j);
        *(_BYTE *)(a3 + v17 + j) = *(_BYTE *)(a3 + ((uint64_t)a4[1] << 7) + j);
      }
      ++v18;
      v17 += 128;
    }
    while (v18 < a4[1]);
  }
  v20 = a4[3];
  if ((int)v20 <= 126)
  {
    v21 = ((_DWORD)v20 << 7) + 128;
    do
    {
      v22 = 0;
      ++v20;
      do
      {
        *(_BYTE *)(result + v21 + v22) = *(_BYTE *)(result + ((uint64_t)a4[3] << 7) + v22);
        *(_BYTE *)(a2 + v21 + v22) = *(_BYTE *)(a2 + ((uint64_t)a4[3] << 7) + v22);
        *(_BYTE *)(a3 + v21 + v22) = *(_BYTE *)(a3 + ((uint64_t)a4[3] << 7) + v22);
        ++v22;
      }
      while (v22 != 128);
      v21 += 128;
    }
    while (v20 != 127);
  }
  return result;
}

uint64_t ctrTrackerComputation_YCbCr2nRGB(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, int a4, _BYTE *a5, _BYTE *a6, _BYTE *a7)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;

  if (a4 >= 1)
  {
    v7 = a4;
    do
    {
      v9 = *a2++;
      v8 = v9;
      v11 = *a1++;
      v10 = v11;
      v12 = v8 - 128;
      v13 = *a3++;
      v14 = v13 - 128;
      v15 = 101 * (v13 - 128) + (v10 << 6);
      if (v15 <= 16351)
        v16 = ((v15 + 32) >> 6) & ~((v15 + 32) >> 31);
      else
        v16 = 255;
      v17 = -12 * v12 + (v10 << 6) - 30 * v14;
      v18 = 119 * v12 + (v10 << 6);
      if (v17 <= 16351)
        v19 = ((v17 + 32) >> 6) & ~((v17 + 32) >> 31);
      else
        v19 = 255;
      if (v18 <= 16351)
        v20 = ((v18 + 32) >> 6) & ~((v18 + 32) >> 31);
      else
        v20 = 255;
      if (v19 <= v20)
        v21 = v20;
      else
        v21 = v19;
      if (v16 > v21)
        v21 = v16;
      v22 = ctrTrackerComputation_YCbCr2nRGB_kIlluminationInvariantLookupTable[v21];
      v23 = v16 * v22;
      v24 = v23 >> 4;
      v25 = (v23 + 16) >> 5;
      v26 = v19 * v22;
      if (v24 > 0x1FE)
        LOBYTE(v25) = -1;
      v27 = v26 >> 4;
      v28 = (v26 + 16) >> 5;
      *a5++ = v25;
      if (v27 > 0x1FE)
        LOBYTE(v28) = -1;
      v29 = v20 * v22;
      v30 = v29 >> 4;
      *a6++ = v28;
      v31 = (v29 + 16) >> 5;
      if (v30 > 0x1FE)
        LOBYTE(v31) = -1;
      *a7++ = v31;
      --v7;
    }
    while (v7);
  }
  return 0;
}

uint64_t ctrTrackerComputation_normedGradient(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v39;

  if (a4 >= 3)
  {
    v6 = (a4 - 1);
    v7 = a1 + 1;
    v8 = a2 + 1;
    v9 = a3 + 1;
    v39 = a2 + 2;
    v10 = a6 + 1;
    v11 = a1 + 2;
    v12 = 1;
    do
    {
      if (a5 <= 2)
      {
        v15 = v12 + 1;
      }
      else
      {
        v13 = 0;
        v14 = v12 * a5;
        v15 = v12 + 1;
        v16 = (v12 + 1) * a5;
        v17 = (v12 - 1) * a5;
        v18 = v7 + v17;
        v19 = v8 + v17;
        v20 = v9 + v17;
        v21 = v7 + v16;
        v22 = v8 + v16;
        v23 = v9 + v16;
        v24 = v39 + v14;
        v25 = a3 + v14;
        v26 = v10 + v14;
        v27 = v11 + v14;
        do
        {
          v28 = *(unsigned __int8 *)(v27 + v13) - *(unsigned __int8 *)(v27 + v13 - 2);
          v29 = *(unsigned __int8 *)(v21 + v13) - *(unsigned __int8 *)(v18 + v13);
          v30 = *(unsigned __int8 *)(v25 + v13 + 2) - *(unsigned __int8 *)(v25 + v13);
          v31 = *(unsigned __int8 *)(v23 + v13) - *(unsigned __int8 *)(v20 + v13);
          if (v28 < 0)
            v28 = *(unsigned __int8 *)(v27 + v13 - 2) - *(unsigned __int8 *)(v27 + v13);
          if (v29 < 0)
            v29 = *(unsigned __int8 *)(v18 + v13) - *(unsigned __int8 *)(v21 + v13);
          v32 = v29 + v28;
          if (*(unsigned __int8 *)(v24 + v13) - *(unsigned __int8 *)(v24 + v13 - 2) >= 0)
            v33 = *(unsigned __int8 *)(v24 + v13) - *(unsigned __int8 *)(v24 + v13 - 2);
          else
            v33 = *(unsigned __int8 *)(v24 + v13 - 2) - *(unsigned __int8 *)(v24 + v13);
          if (*(unsigned __int8 *)(v22 + v13) - *(unsigned __int8 *)(v19 + v13) >= 0)
            v34 = *(unsigned __int8 *)(v22 + v13) - *(unsigned __int8 *)(v19 + v13);
          else
            v34 = *(unsigned __int8 *)(v19 + v13) - *(unsigned __int8 *)(v22 + v13);
          v35 = v34 + v33;
          if (v30 < 0)
            v30 = *(unsigned __int8 *)(v25 + v13) - *(unsigned __int8 *)(v25 + v13 + 2);
          if (v31 < 0)
            v31 = *(unsigned __int8 *)(v20 + v13) - *(unsigned __int8 *)(v23 + v13);
          v36 = v31 + v30;
          if (v32 <= v35)
            v37 = v35;
          else
            v37 = v32;
          if (v37 > v36)
            v36 = v37;
          if (v36 >= 0xFF)
            LOBYTE(v36) = -1;
          *(_BYTE *)(v26 + v13++) = v36;
        }
        while ((a5 - 1) - 1 != v13);
      }
      v12 = v15;
    }
    while (v15 != v6);
  }
  return 0;
}

uint64_t ctrTrackerComputation_updateLocation(uint64_t result, uint64_t a2, int a3, uint64_t a4, double a5, double a6)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  double *v22;
  float64x2x2_t v23;

  if (a3)
  {
    v6 = 0;
    v7 = 0;
    LODWORD(v8) = a3 * a3;
    if ((a3 * a3) <= 1)
      v8 = 1;
    else
      v8 = v8;
    v9 = 0.0;
    do
    {
      if (*(float *)(result + 4 * v6) > v9)
      {
        v9 = *(float *)(result + 4 * v6);
        v7 = v6;
      }
      ++v6;
    }
    while (v8 != v6);
  }
  else
  {
    v7 = 0;
    v9 = 0.0;
  }
  v10 = 0;
  v11 = v7 / a3;
  if (a3 >= 0)
    v12 = a3;
  else
    v12 = a3 + 1;
  v13 = v12 >> 1;
  if (v13 <= v11)
    v14 = a3;
  else
    v14 = 0;
  v15 = v11 - v14;
  *(float *)a4 = v9;
  v16 = v7 % a3;
  if (v13 <= v16)
    v17 = a3;
  else
    v17 = 0;
  v18 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(-(double)(v16 - v17)), 0);
  v19 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
  v20 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(-(double)v15), 0);
  v21 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a6, 0);
  do
  {
    v22 = (double *)(a2 + v10);
    v23 = vld2q_f64(v22);
    v23.val[0] = vmlaq_f64(v23.val[0], v19, v18);
    v23.val[1] = vmlaq_f64(v23.val[1], v21, v20);
    vst2q_f64(v22, v23);
    v10 += 32;
  }
  while (v10 != 64);
  *(_DWORD *)(a4 + 4) = v11;
  *(_DWORD *)(a4 + 8) = v16;
  return result;
}

BOOL ctrTrackerComputation_getPSR(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  float v20;
  float v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  BOOL v27;
  int v28;
  int v29;
  BOOL v30;
  float v31;
  float v32;
  int v33;
  _BOOL8 result;

  v4 = *(_DWORD *)(a3 + 4);
  v5 = *(_DWORD *)(a3 + 8);
  v6 = v4 - 5;
  if (a2 >= 0)
    v7 = a2;
  else
    v7 = a2 + 1;
  v8 = v7 >> 1;
  if (v7 >> 1 <= v6)
    v9 = a2;
  else
    v9 = 0;
  v10 = v4 + 5;
  if (v8 <= v4 + 5)
    v11 = a2;
  else
    v11 = 0;
  v12 = v5 - 5;
  if (v8 <= v5 - 5)
    v13 = a2;
  else
    v13 = 0;
  v14 = v5 + 5;
  if (v8 <= v14)
    v15 = a2;
  else
    v15 = 0;
  if (a2 < 1)
  {
    v21 = 0.0;
    v20 = 0.0;
  }
  else
  {
    v16 = 0;
    v17 = v6 - v9;
    v18 = v10 - v11;
    v19 = v12 - v13;
    v20 = 0.0;
    v21 = 0.0;
    v22 = v14 - v15;
    do
    {
      v23 = 0;
      if (v16 >= v8)
        v24 = a2;
      else
        v24 = 0;
      v25 = v16 - v24;
      v27 = v25 < v17 || v25 > v18;
      do
      {
        if (v27
          || (v23 >= v8 ? (v28 = a2) : (v28 = 0), (v29 = v23 - v28, v29 >= v19) ? (v30 = v29 <= v22) : (v30 = 0), !v30))
        {
          v31 = *(float *)(a1 + 4 * v23);
          v20 = v20 + v31;
          v21 = v21 + (float)(v31 * v31);
        }
        ++v23;
      }
      while (a2 != v23);
      ++v16;
      a1 += 4 * a2;
    }
    while (v16 != a2);
  }
  v32 = (float)(*(float *)a3 - (float)(v20 / (float)(a2 * a2 - 121)))
      / sqrtf((float)(v21 / (float)(a2 * a2 - 121))- (float)((float)(v20 / (float)(a2 * a2 - 121)) * (float)(v20 / (float)(a2 * a2 - 121))));
  *(float *)a4 = v32;
  if (v32 <= 8.0)
    v33 = *(_DWORD *)(a4 + 4) + 1;
  else
    v33 = 0;
  result = v32 > 8.0;
  *(_DWORD *)(a4 + 4) = v33;
  return result;
}

uint64_t ctrTrackerComputation_colorHistogram(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, char *a5, int a6, int a7)
{
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  float v31;
  unsigned int v32;
  double v33;
  float v34;
  int v35;
  float v36;
  int v37;
  uint64_t v38;
  float v39;

  bzero(a4, 0x400uLL);
  bzero(a5, 0x400uLL);
  if (a7 >= 1)
  {
    v14 = a6 - a7;
    if (a6 < a7)
      ++v14;
    v15 = v14 >> 1;
    v16 = a7 + (v14 >> 1);
    v17 = (uint64_t)v14 >> 1;
    v18 = v17 + v15 * (uint64_t)a6;
    v19 = (unsigned __int8 *)(a1 + v18);
    v20 = (unsigned __int8 *)(a2 + v18);
    v21 = (unsigned __int8 *)(a3 + v18);
    v22 = v17;
    do
    {
      v23 = v21;
      v24 = v20;
      v25 = v19;
      v26 = v17;
      do
      {
        v28 = *v25++;
        v27 = v28;
        v30 = *v24++;
        v29 = v30;
        v31 = (float)v30;
        v32 = *v23++;
        v33 = fmax((float)((float)((float)v27 + v31) + (float)v32), 0.01);
        v34 = (double)v27 / v33;
        v35 = vcvtms_s32_f32(v34 * 256.0);
        v36 = (double)v29 / v33;
        if (v35 >= 255)
          v35 = 255;
        v37 = vcvtms_s32_f32(v36 * 256.0);
        if (v37 >= 255)
          v37 = 255;
        *(float *)&a4[4 * v35] = *(float *)&a4[4 * v35] + 1.0;
        *(float *)&a5[4 * v37] = *(float *)&a5[4 * v37] + 1.0;
        ++v26;
      }
      while (v26 < v16);
      ++v22;
      v19 += a6;
      v20 += a6;
      v21 += a6;
    }
    while (v22 < v16);
  }
  v38 = 0;
  v39 = (float)(a7 * a7);
  do
  {
    *(float *)&a4[v38] = *(float *)&a4[v38] / v39;
    *(float *)&a5[v38] = *(float *)&a5[v38] / v39;
    v38 += 4;
  }
  while (v38 != 1024);
  return 0;
}

BOOL ctrTrackerComputation_sizeAdaption(uint64_t a1, float *a2, float *a3, float *a4, uint64_t a5, float64x2_t *a6, int a7)
{
  uint64_t v11;
  float *v12;
  float v13;
  float *v14;
  uint64_t v15;
  float v16;
  float v17;
  uint64_t v18;
  int *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unsigned __int8 *v24;
  unsigned __int8 *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  double v29;
  float v30;
  int v31;
  float v32;
  int v33;
  int v34;
  float *v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  int v40;
  float *v41;
  float v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  unsigned int v64;
  float v65;
  double v66;
  unsigned int v67;
  unsigned int v68;
  double v69;
  int v70;
  float v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  double v76;
  float v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  float v86;
  double v87;
  unsigned int v88;
  unsigned int v89;
  double v90;
  int v91;
  float v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  double v97;
  float v98;
  int v99;
  int v100;
  int v101;
  int v102;
  float v103;
  float *v104;
  uint64_t v105;
  uint64_t v106;
  float v107;
  int v108;
  float v109;
  float *v110;
  uint64_t v111;
  uint64_t v112;
  float v113;
  float *v114;
  uint64_t v115;
  float *v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  uint64_t v133;
  int v134;
  unsigned int v135;
  uint64_t v136;
  float v137;
  float v138;
  float v139;
  float v140;
  char *v141;
  uint64_t j;
  float v144;
  float v145;
  uint64_t v146;
  uint64_t v148;
  _BYTE *v149;
  float64x2_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  float *v154;
  uint64_t v155;
  uint64_t v156;

  v149 = (_BYTE *)(a1 + 250192);
  v11 = a1 + 246072;
  v12 = (float *)(a1 + 114688);
  v13 = roundf((float)((float)a7 + (float)((float)((float)a7 * -0.8) / 1.2)) * 0.5);
  v14 = (float *)(a1 + 248120);
  v15 = 256;
  do
  {
    v16 = *a2++;
    *v14 = sqrtf(v16);
    v17 = *a3++;
    v14[256] = sqrtf(v17);
    ++v14;
    --v15;
  }
  while (v15);
  v18 = (int)v13;
  v19 = (int *)(a1 + 247096);
  v148 = a1 + 114772;
  bzero((void *)(a1 + 246072), 0x400uLL);
  bzero((void *)(v11 + 1024), 0x400uLL);
  v20 = v18 - 1;
  if ((int)v18 - 1 <= a7 - (int)v18)
  {
    v21 = v20;
    v22 = (int)v18 + v20 * (uint64_t)a7 + a1 + 49151;
    do
    {
      v23 = a7 - 2 * v18 + 2;
      v24 = (unsigned __int8 *)v22;
      v25 = (unsigned __int8 *)v22;
      do
      {
        v26 = *v25++;
        v27 = v24[0x4000];
        *(float *)&v28 = (float)v27;
        LOBYTE(v28) = v24[0x8000];
        v29 = fmax((float)((float)((float)v26 + (float)v27) + (float)v28), 0.01);
        v30 = (double)v26 / v29;
        v31 = vcvtms_s32_f32(v30 * 256.0);
        v32 = (double)v27 / v29;
        if (v31 >= 255)
          v31 = 255;
        v33 = vcvtms_s32_f32(v32 * 256.0);
        if (v33 >= 255)
          v33 = 255;
        ++*(_DWORD *)(v11 + 4 * v31);
        ++v19[v33];
        v24 = v25;
        --v23;
      }
      while (v23);
      ++v21;
      v22 += a7;
    }
    while (a7 - (_DWORD)v18 + 1 != (_DWORD)v21);
  }
  v35 = (float *)(v11 + 4);
  v34 = *(_DWORD *)v11;
  v36 = 0.0;
  v37 = 255;
  do
  {
    v38 = *(int *)v35;
    v34 += v38;
    v36 = v36 + (float)(*(float *)(a5 + 4 * v38) * v35[512]);
    ++v35;
    --v37;
  }
  while (v37);
  v146 = (v18 - 1);
  v150 = a6;
  v39 = v36 / sqrtf((float)v34);
  *v12 = v39;
  v40 = *(_DWORD *)(v11 + 1024);
  v41 = (float *)(v11 + 1028);
  v42 = 0.0;
  v43 = 255;
  do
  {
    v44 = *(int *)v41;
    v40 += v44;
    v42 = v42 + (float)(*(float *)(a5 + 4 * v44) * v41[512]);
    ++v41;
    --v43;
  }
  while (v43);
  v45 = (float)(v39 + (float)(v42 / sqrtf((float)v40))) * 0.5;
  *v12 = v45;
  v151 = (v18 - 2);
  if ((int)v18 >= 2)
  {
    v46 = a7 - 1;
    v47 = (v18 - 2);
    v48 = v46 * v151 + a7;
    v49 = v48 + 49151;
    v50 = 1;
    v153 = 1 - a7;
    v51 = v48 + 0xFFFF;
    v52 = v48 + 81919;
    v53 = a7 * v151;
    v54 = v53 + v151;
    v152 = ~(uint64_t)a7;
    v55 = a1 + v18 + 0xFFFF;
    v56 = (v46 - v151) * a7;
    v57 = -1;
    v154 = v12;
    v155 = v18;
    do
    {
      v58 = a7 - v47;
      v59 = v54;
      v60 = v52;
      v61 = v51;
      v156 = v49;
      v62 = v49;
      for (i = v47; i < v58; v59 += a7)
      {
        v64 = *(unsigned __int8 *)(a1 + v59 + 49152);
        v65 = (float)v64;
        v66 = (double)v64;
        v67 = *(unsigned __int8 *)(a1 + v59 + 0x10000);
        *(float *)&v68 = (float)v67;
        LOBYTE(v68) = *(_BYTE *)(a1 + v59 + 81920);
        v69 = fmax((float)((float)(v65 + (float)v67) + (float)v68), 0.01);
        *(float *)&v66 = v66 / v69;
        v70 = vcvtms_s32_f32(*(float *)&v66 * 256.0);
        v71 = (double)v67 / v69;
        if (v70 >= 255)
          v70 = 255;
        v72 = vcvtms_s32_f32(v71 * 256.0);
        if (v72 >= 255)
          v72 = 255;
        ++*(_DWORD *)(v11 + 4 * v70);
        ++v19[v72];
        v73 = *(unsigned __int8 *)(a1 + v62);
        v74 = *(unsigned __int8 *)(a1 + v61);
        *(float *)&v75 = (float)v74;
        LOBYTE(v75) = *(_BYTE *)(a1 + v60);
        v76 = fmax((float)((float)((float)v73 + (float)v74) + (float)v75), 0.01);
        v77 = (double)v73 / v76;
        v78 = vcvtms_s32_f32(v77 * 256.0);
        *(float *)&v76 = (double)v74 / v76;
        v79 = vcvtms_s32_f32(*(float *)&v76 * 256.0);
        if (v78 >= 255)
          v78 = 255;
        ++*(_DWORD *)(v11 + 4 * v78);
        if (v79 >= 255)
          v80 = 255;
        else
          v80 = v79;
        ++v19[v80];
        ++i;
        v62 += a7;
        v61 += a7;
        v60 += a7;
      }
      v81 = v58 - 1;
      v82 = v57;
      v83 = v56;
      v84 = v53;
      LODWORD(v18) = v155;
      if (v47 + 1 < v58 - 1)
      {
        do
        {
          v85 = *(unsigned __int8 *)(v55 + v84 - 0x4000);
          v86 = (float)v85;
          v87 = (double)v85;
          v88 = *(unsigned __int8 *)(v55 + v84);
          *(float *)&v89 = (float)v88;
          LOBYTE(v89) = *(_BYTE *)(v55 + v84 + 0x4000);
          v90 = fmax((float)((float)(v86 + (float)v88) + (float)v89), 0.01);
          *(float *)&v87 = v87 / v90;
          v91 = vcvtms_s32_f32(*(float *)&v87 * 256.0);
          v92 = (double)v88 / v90;
          if (v91 >= 255)
            v91 = 255;
          v93 = vcvtms_s32_f32(v92 * 256.0);
          if (v93 >= 255)
            v93 = 255;
          ++*(_DWORD *)(v11 + 4 * v91);
          ++v19[v93];
          v94 = *(unsigned __int8 *)(v55 + v83 - 0x4000);
          v95 = *(unsigned __int8 *)(v55 + v83);
          *(float *)&v96 = (float)v94;
          LOBYTE(v96) = *(_BYTE *)(v55 + v83 + 0x4000);
          v97 = fmax((float)((float)((float)v94 + (float)v95) + (float)v96), 0.01);
          v98 = (double)v94 / v97;
          v99 = vcvtms_s32_f32(v98 * 256.0);
          *(float *)&v97 = (double)v95 / v97;
          v100 = vcvtms_s32_f32(*(float *)&v97 * 256.0);
          if (v99 >= 255)
            v99 = 255;
          ++*(_DWORD *)(v11 + 4 * v99);
          if (v100 >= 255)
            v101 = 255;
          else
            v101 = v100;
          ++v19[v101];
          ++v84;
          ++v83;
          ++v82;
        }
        while (v155 + v82 < v81);
      }
      v102 = *(_DWORD *)v11;
      v103 = 0.0;
      v104 = (float *)(v11 + 4);
      v105 = 255;
      do
      {
        v106 = *(int *)v104;
        v102 += v106;
        v103 = v103 + (float)(*(float *)(a5 + 4 * v106) * v104[512]);
        ++v104;
        --v105;
      }
      while (v105);
      v107 = v103 / sqrtf((float)v102);
      v12 = v154;
      v154[v50] = v107;
      v108 = *v19;
      v109 = 0.0;
      v110 = (float *)(v11 + 1028);
      v111 = 255;
      do
      {
        v112 = *(int *)v110;
        v108 += v112;
        v109 = v109 + (float)(*(float *)(a5 + 4 * v112) * v110[512]);
        ++v110;
        --v111;
      }
      while (v111);
      v154[v50++] = (float)(v107 + (float)(v109 / sqrtf((float)v108))) * 0.5;
      --v47;
      v49 = v156 + v153;
      v51 += v153;
      v52 += v153;
      v54 += v152;
      v53 += v152;
      v56 += a7 - 1;
      --v57;
    }
    while (v50 != v155);
  }
  v113 = v12[1];
  v12[21] = (float)((float)(v113 * 0.19) + (float)(v45 * 0.79)) + (float)(*a4 * 0.02);
  if ((int)v18 >= 3)
  {
    v114 = a4 + 1;
    v115 = v146 - 1;
    v116 = v12;
    do
    {
      v117 = (float)(*v116 * 0.19) + (float)(v113 * 0.6);
      v113 = v116[2];
      v118 = *v114++;
      v116[22] = (float)(v117 + (float)(v113 * 0.19)) + (float)(v118 * 0.02);
      ++v116;
      --v115;
    }
    while (v115);
  }
  *(float *)(v148 + 4 * (int)v146) = (float)((float)(v12[(int)v151] * 0.19) + (float)(v12[(int)v146] * 0.79))
                                     + (float)(a4[(int)v146] * 0.02);
  v119 = v12[31];
  v120 = v12[32];
  v121 = v12[33];
  v122 = v12[34];
  v123 = v12[35];
  v124 = v12[36];
  v125 = v12[37];
  v126 = v12[38];
  v127 = v12[39];
  v128 = v12[40];
  v129 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v12[22] * 0.0019763) + (float)(v12[21] * 0.0028233)) + (float)(v12[23] * 0.0012185)) + (float)(v12[24] * 0.00054979)) + (float)(v12[25] * -0.000029719)) + (float)(v12[26] * -0.00052007)) + (float)(v12[27] * -0.00092128)) + (float)(v12[28] * -0.0012333)) + (float)(v12[29] * -0.0014562)) + (float)(v12[30] * -0.0015899))
                                                                                               + (float)(v119 * -0.0016345))
                                                                                       + (float)(v120 * -0.0015899))
                                                                               + (float)(v121 * -0.0014562))
                                                                       + (float)(v122 * -0.0012333))
                                                               + (float)(v123 * -0.00092128))
                                                       + (float)(v124 * -0.00052007))
                                               + (float)(v125 * -0.000029719))
                                       + (float)(v126 * 0.00054979))
                               + (float)(v127 * 0.0012185))
                       + (float)(v128 * 0.0019763))
               + (float)(v12[41] * 0.0028233))
       * -1000.0;
  v130 = 0.0;
  if (v129 >= 0.0)
    v131 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v12[22] * 0.0019763) + (float)(v12[21] * 0.0028233)) + (float)(v12[23] * 0.0012185)) + (float)(v12[24] * 0.00054979)) + (float)(v12[25] * -0.000029719)) + (float)(v12[26] * -0.00052007)) + (float)(v12[27] * -0.00092128)) + (float)(v12[28] * -0.0012333)) + (float)(v12[29] * -0.0014562)) + (float)(v12[30] * -0.0015899))
                                                                                                 + (float)(v119 * -0.0016345))
                                                                                         + (float)(v120 * -0.0015899))
                                                                                 + (float)(v121 * -0.0014562))
                                                                         + (float)(v122 * -0.0012333))
                                                                 + (float)(v123 * -0.00092128))
                                                         + (float)(v124 * -0.00052007))
                                                 + (float)(v125 * -0.000029719))
                                         + (float)(v126 * 0.00054979))
                                 + (float)(v127 * 0.0012185))
                         + (float)(v128 * 0.0019763))
                 + (float)(v12[41] * 0.0028233))
         * -1000.0;
  else
    v131 = 0.0;
  if (v129 <= 1.0)
    v132 = v131;
  else
    v132 = 1.0;
  *(float *)(v11 + 4112) = v132;
  if (*v149)
  {
    if (v132 >= *(float *)(v11 + 4116))
    {
      v133 = 0;
      v134 = 10;
      do
      {
        if (*(float *)(v148 + 4 * v133) > v130)
        {
          v134 = v133;
          v130 = *(float *)(v148 + 4 * v133);
        }
        ++v133;
      }
      while (v133 != 21);
      v135 = v134 - 2;
      v130 = 0.0;
      if (v135 < 0x11)
      {
        v136 = 0;
        v137 = 0.0;
        do
        {
          v138 = *(float *)(v148 + 4 * v135 + v136 * 4);
          v137 = v137 + (float)(*(float *)&dword_1B6FD0E08[v136] * v138);
          v130 = v130 + (float)(*(float *)&dword_1B6FD0E1C[v136++] * v138);
        }
        while (v136 != 5);
        if (v130 <= -0.0002)
        {
          v139 = 0.0;
          if (v137 > 0.0 == v130 < 0.0)
          {
            v139 = 4.0;
            if (v137 <= (float)(v130 * -8.0))
              v139 = v137 / (float)(v130 * -2.0);
          }
        }
        else
        {
          v139 = NAN;
        }
        v130 = 0.0;
        if (fabsf(v139) != INFINITY)
        {
          v144 = v139 + (float)(int)v135;
          v130 = -4.0;
          if (v144 > 0.0)
          {
            v130 = 4.0;
            if (v144 < 20.0)
            {
              v145 = (float)((float)((float)(v144 - (float)(int)v144) * (float)((int)v144 + 1))
                           + (float)((float)(1.0 - (float)(v144 - (float)(int)v144)) * (float)(int)v144))
                   + -10.0;
              v130 = (float)(v145 * 0.2) + (float)(v145 * 0.2);
            }
          }
        }
      }
    }
  }
  else
  {
    *v149 = 1;
    *(float *)(v11 + 4116) = v132 * 0.5;
  }
  v140 = v130 / 20.0;
  if ((float)(v130 / 20.0) != 0.0)
  {
    v141 = (char *)malloc_type_calloc(4uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    ctrTrackerComputation_overscan(v150, (uint64_t)v141, v140);
    for (j = 0; j != 4; ++j)
      v150[j] = *(float64x2_t *)&v141[j * 16];
    free(v141);
  }
  return (_DWORD)v18 != 21;
}

BOOL ctrTrackerComputation_checkBoxLocation(double *a1, unint64_t a2, unint64_t a3)
{
  _BOOL8 result;

  result = 0;
  if (*a1 >= 0.0 && a1[4] < (double)a2 && a1[1] >= 0.0 && a1[5] < (double)a3)
    return 1;
  return result;
}

void generate_size_search_stablizer(uint64_t a1, int a2, float a3, float a4)
{
  int v5;
  int v6;
  unint64_t v8;
  float v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  float *v19;
  float v20;
  uint64x2_t v21;
  uint64x2_t v22;
  float v23;
  float v24;
  int32x2_t v25;
  int32x2_t v26;

  v5 = a2 - 1;
  if (a2 < 1)
    v5 = a2;
  v6 = v5 >> 1;
  if (a2 <= 2)
  {
    *(_DWORD *)(a1 + 4 * v6) = 1065353216;
  }
  else
  {
    v8 = 0;
    v9 = a3 + a3;
    if (v6 <= 0)
      v10 = -v6;
    else
      v10 = -1;
    v11 = (v10 + 1) + (uint64_t)v6;
    v21 = (uint64x2_t)vdupq_n_s64(v11 - 1);
    v12 = v6;
    v13 = (v11 + 1) & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      v25 = vmovn_s64((int64x2_t)vcgeq_u64(v21, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v8), (int8x16_t)xmmword_1B6FBCE90)));
      v23 = expf((float)-(float)(((int)v8 - v6 + 1) * ((int)v8 - v6 + 1)) / v9);
      v14 = expf((float)-(float)(((int)v8 - v6) * ((int)v8 - v6)) / v9);
      if ((v25.i8[0] & 1) != 0)
        *(float *)(a1 + 4 * v8) = v14;
      if ((v25.i8[4] & 1) != 0)
        *(float *)(a1 + 4 * v8 + 4) = v23;
      v8 += 2;
    }
    while (v13 != v8);
    *(_DWORD *)(a1 + 4 * v6) = 1065353216;
    v15 = 0;
    v16 = a4 + a4;
    if (v6 <= 1)
      v17 = 1;
    else
      v17 = v6;
    v18 = ((_DWORD)v17 + 1) & 0x7FFFFFFE;
    v22 = (uint64x2_t)vdupq_n_s64(v17 - 1);
    v19 = (float *)(a1 + 4 * v12 + 8);
    do
    {
      v26 = vmovn_s64((int64x2_t)vcgeq_u64(v22, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v15), (int8x16_t)xmmword_1B6FBCE90)));
      v24 = expf((float)-(float)(((int)v15 + 2) * ((int)v15 + 2)) / v16);
      v20 = expf((float)-(float)(((int)v15 + 1) * ((int)v15 + 1)) / v16);
      if ((v26.i8[0] & 1) != 0)
        *(v19 - 1) = v20;
      if ((v26.i8[4] & 1) != 0)
        *v19 = v24;
      v15 += 2;
      v19 += 2;
    }
    while (v18 != v15);
  }
}

int64x2_t generate_sqrt_table(uint64_t a1, int a2, int64x2_t result)
{
  uint64_t v3;
  uint64_t v4;
  uint64x2_t v5;
  int64x2_t v6;
  int32x2_t v7;
  int32x2_t v8;
  float32x2_t v9;

  if ((a2 & 0x80000000) == 0)
  {
    v3 = 0;
    v4 = (a2 + 1);
    result = (int64x2_t)xmmword_1B6FBCE90;
    v5 = (uint64x2_t)vdupq_n_s64(v4 - 1);
    v6 = vdupq_n_s64(2uLL);
    do
    {
      v7 = vmovn_s64((int64x2_t)vcgeq_u64(v5, (uint64x2_t)result));
      v8.i32[0] = v3;
      v8.i32[1] = v3 + 1;
      v9 = vsqrt_f32(vcvt_f32_s32(v8));
      if ((v7.i8[0] & 1) != 0)
        *(_DWORD *)(a1 + 4 * v3) = v9.i32[0];
      if ((v7.i8[4] & 1) != 0)
        *(_DWORD *)(a1 + 4 * v3 + 4) = v9.i32[1];
      v3 += 2;
      result = vaddq_s64(result, v6);
    }
    while (((v4 + 1) & 0x1FFFFFFFELL) != v3);
  }
  return result;
}

void CVPixelBufferLock::Unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "Multiple unlock attempts; cannot unlock buffer",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_4();
}

{
  OUTLINED_FUNCTION_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "Lock attempt failed; cannot unlock buffer",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_4();
}

void CVPixelBufferLock::Unlock()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_3();
}

uint64_t ___ZL41getIMMediaAnalysisBlastDoorInterfaceClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL28getGDVUStreamingGalleryClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL28getGDVUStreamingGalleryClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL19getGDVUContextClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL19getGDVUContextClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2(v0);
}

void CVPixelBufferLock::CVPixelBufferLock()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to lock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

uint64_t dlib::eigenvalue_decomposition<dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::eigenvalue_decomposition<dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(_QWORD *a1, _QWORD *a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t result;

  if (*a1)
    OUTLINED_FUNCTION_0_0();
  if (*a2)
    OUTLINED_FUNCTION_0_0();
  if (*a3)
    OUTLINED_FUNCTION_0_0();
  result = *a4;
  if (*a4)
    OUTLINED_FUNCTION_0_0();
  return result;
}

void ma::EncodeStats::GenerateSubMacroBlockStats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "Cannot lock NULL CVPixelBuffer", a5, a6, a7, a8, 0);
}

void dlib::fatal_error::check_for_previous_fatal_errors(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;

  v2 = OUTLINED_FUNCTION_2_1(a1, "\n\n ************************** FATAL ERROR DETECTED ************************** ");
  v3 = std::endl[abi:ne180100]<char,std::char_traits<char>>(v2);
  v4 = OUTLINED_FUNCTION_2_1((uint64_t)v3, " ************************** FATAL ERROR DETECTED ************************** ");
  v5 = std::endl[abi:ne180100]<char,std::char_traits<char>>(v4);
  v6 = OUTLINED_FUNCTION_2_1((uint64_t)v5, " ************************** FATAL ERROR DETECTED ************************** \n");
  v7 = std::endl[abi:ne180100]<char,std::char_traits<char>>(v6);
  v8 = OUTLINED_FUNCTION_2_1((uint64_t)v7, "Two fatal errors have been detected, the first was inappropriately ignored. \n");
  v9 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v8, "To prevent further fatal errors from being ignored this application will be \n");
  v10 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v9, "terminated immediately and you should go fix this buggy program.\n\n");
  std::operator<<[abi:ne180100]<std::char_traits<char>>(v10, "The error message from this fatal error was:\n");
  v11 = (char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v12 = OUTLINED_FUNCTION_2_1((uint64_t)v11, v11);
  v13 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v12, "\n\n");
  std::endl[abi:ne180100]<char,std::char_traits<char>>(v13);
  abort();
}

uint64_t dlib::lbfgs_search_strategy::lbfgs_search_strategy(_QWORD *a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t result;

  if (*a1)
    OUTLINED_FUNCTION_1_0();
  if (*a2)
    OUTLINED_FUNCTION_1_0();
  result = *a3;
  if (*a3)
    JUMPOUT(0x1BCCA128CLL);
  return result;
}

uint64_t ___ZL24getHMIVideoAnalyzerClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[VCPDatabaseReader openDatabase].cold.1(v0);
}

uint64_t ___ZL22getHMITaskServiceClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL23getPGPNGraphHelperClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL23getPGPNGraphHelperClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[VCPImageBlurAnalyzer computeLocalSharpness:].cold.3(v0);
}

uint64_t __getGDEntityIdentifierClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return CGImage_CreateCVPixelBuffer(v0);
}

void CGImage_CreateCVPixelBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "[CGImage->CVPixelBuffer] Failed to allocate CVPixelBuffer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

{
  OUTLINED_FUNCTION_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "[CGImage->CVPixelBuffer] Failed to allocate CGContext", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

BOOL CGImage_CreateCVPixelBuffer(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v10;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v4, "Failed to lock CVPixelBuffer (%p, %d)", v5, v6, v7, v8, v10);
  return *a3 == 0;
}

void CGImage_CreateCVPixelBuffer()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[CGImage->CVPixelBuffer] CGImage not IOSurface backed", v0, 2u);
  OUTLINED_FUNCTION_4();
}

uint64_t ___ZL36getIMMessagesBlastDoorInterfaceClassv_block_invoke_cold_1()
{
  int v0;
  uint8_t *v1;

  v0 = abort_report_np();
  return -[VCPPreAnalyzer _collectSceneAnalysisResults:fromRequests:wpResults:ivsResults:abnormalDimension:].cold.1(v0, v1);
}

uint64_t ___ZL23getGDVUEntityClassClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[VCPImageManager drawImage:pixelFormat:withOrientation:maxDimension:pixelBuffer:].cold.1(v0);
}

void ma::MotionFieldAnalysis::MovingObjectDetectTracking()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
}

uint64_t __getHMIAnalysisServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL22getPISegmentationClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL22getPISegmentationClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return ___ZL26getSHMutableSignatureClassv_block_invoke_cold_1(v0);
}

uint64_t ___ZL26getSHMutableSignatureClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[VCPMADResourceManager validateCost:].cold.1(v0);
}

void ma::FrameBuffer::FrameBuffer(uint64_t a1, uint64_t a2)
{
  do
  {
    ma::Histogram::~Histogram((ma::Histogram *)(a1 - 48));
    ma::MotionResult::~MotionResult((ma::MotionResult *)(a1 - 280));
    a1 -= 408;
  }
  while (a1 != a2);
}

uint64_t sub_1B6FA0C7C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B6FA0C88()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_1B6FA0C94()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B6FA0CA0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B6FA0CAC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B6FA0CB8()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1B6FA0CC4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B6FA0CD0()
{
  return MEMORY[0x1E0D4FF28]();
}

uint64_t sub_1B6FA0CDC()
{
  return MEMORY[0x1E0D500C0]();
}

uint64_t sub_1B6FA0CE8()
{
  return MEMORY[0x1E0D50178]();
}

uint64_t sub_1B6FA0CF4()
{
  return MEMORY[0x1E0D50210]();
}

uint64_t sub_1B6FA0D00()
{
  return MEMORY[0x1E0D50218]();
}

uint64_t sub_1B6FA0D0C()
{
  return MEMORY[0x1E0DF0220]();
}

uint64_t sub_1B6FA0D18()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1B6FA0D24()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B6FA0D30()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B6FA0D3C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B6FA0D48()
{
  return MEMORY[0x1E0DACA98]();
}

uint64_t sub_1B6FA0D54()
{
  return MEMORY[0x1E0DACAB8]();
}

uint64_t sub_1B6FA0D60()
{
  return MEMORY[0x1E0DACAD8]();
}

uint64_t sub_1B6FA0D6C()
{
  return MEMORY[0x1E0DACAE8]();
}

uint64_t sub_1B6FA0D78()
{
  return MEMORY[0x1E0DACB00]();
}

uint64_t sub_1B6FA0D84()
{
  return MEMORY[0x1E0DACB08]();
}

uint64_t sub_1B6FA0D90()
{
  return MEMORY[0x1E0DACB10]();
}

uint64_t sub_1B6FA0D9C()
{
  return MEMORY[0x1E0DACB20]();
}

uint64_t sub_1B6FA0DA8()
{
  return MEMORY[0x1E0DACB48]();
}

uint64_t sub_1B6FA0DB4()
{
  return MEMORY[0x1E0DACB78]();
}

uint64_t sub_1B6FA0DC0()
{
  return MEMORY[0x1E0DACB80]();
}

uint64_t sub_1B6FA0DCC()
{
  return MEMORY[0x1E0DACB88]();
}

uint64_t sub_1B6FA0DD8()
{
  return MEMORY[0x1E0DACB90]();
}

uint64_t sub_1B6FA0DE4()
{
  return MEMORY[0x1E0DACBA8]();
}

uint64_t sub_1B6FA0DF0()
{
  return MEMORY[0x1E0DACBB8]();
}

uint64_t sub_1B6FA0DFC()
{
  return MEMORY[0x1E0DACBD8]();
}

uint64_t sub_1B6FA0E08()
{
  return MEMORY[0x1E0DACC08]();
}

uint64_t sub_1B6FA0E14()
{
  return MEMORY[0x1E0DACC18]();
}

uint64_t sub_1B6FA0E20()
{
  return MEMORY[0x1E0DACC28]();
}

uint64_t sub_1B6FA0E2C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B6FA0E38()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1B6FA0E44()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B6FA0E50()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B6FA0E5C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B6FA0E68()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B6FA0E74()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B6FA0E80()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1B6FA0E8C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B6FA0E98()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B6FA0EA4()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1B6FA0EB0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B6FA0EBC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B6FA0EC8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B6FA0ED4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B6FA0EE0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B6FA0EEC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B6FA0EF8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B6FA0F04()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1B6FA0F10()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B6FA0F1C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B6FA0F28()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x1E0C91E78](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x1E0C91E88](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x1E0C91E90](inComponent, outInstance);
}

OSStatus AudioUnitAddPropertyListener(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitPropertyListenerProc inProc, void *inProcUserData)
{
  return MEMORY[0x1E0C921C8](inUnit, *(_QWORD *)&inID, inProc, inProcUserData);
}

OSStatus AudioUnitGetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1E0C921E0](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, outData, ioDataSize);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x1E0C921F0](inUnit);
}

OSStatus AudioUnitProcessMultiple(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inNumberFrames, UInt32 inNumberInputBufferLists, const AudioBufferList **inInputBufferLists, UInt32 inNumberOutputBufferLists, AudioBufferList **ioOutputBufferLists)
{
  return MEMORY[0x1E0C92200](inUnit, ioActionFlags, inTimeStamp, *(_QWORD *)&inNumberFrames, *(_QWORD *)&inNumberInputBufferLists, inInputBufferLists, *(_QWORD *)&inNumberOutputBufferLists, ioOutputBufferLists);
}

OSStatus AudioUnitReset(AudioUnit inUnit, AudioUnitScope inScope, AudioUnitElement inElement)
{
  return MEMORY[0x1E0C92210](inUnit, *(_QWORD *)&inScope, *(_QWORD *)&inElement);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1E0C92220](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C980B0](bundle);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x1E0C98DF8](obj);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x1E0C990D0](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x1E0C99360](alloc, relativeURLBytes, length, *(_QWORD *)&encoding, baseURL, useCompatibilityMode);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF40](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF48](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
  MEMORY[0x1E0CBC310](idst, image, metadata, options);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC368](idst, properties);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CFStringRef CGImageMetadataCopyStringValueWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CFStringRef)MEMORY[0x1E0CBC388](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC408](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x1E0CBC428](metadata, parent, path, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1E0CBC510](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

uint64_t CGImageSourceCreateIOSurfaceAtIndex()
{
  return MEMORY[0x1E0CBC558]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1E0C9EAD8](desc);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x1E0C9EB10]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

OSStatus CMBlockBufferAssureBlockMemory(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB60](theBuffer);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB70](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1E0C9EB88](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1E0C9EB98](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1E0C9EBA8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMByteStreamGetClassID()
{
  return MEMORY[0x1E0C9ED20]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x1E0C9ED90]();
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x1E0C9EDB8](formatDescription, otherFormatDescription);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1E0C9EDD8](desc);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImage()
{
  return MEMORY[0x1E0D08B98]();
}

uint64_t CMPhotoCompressionSessionAddImage()
{
  return MEMORY[0x1E0D08BF0]();
}

uint64_t CMPhotoCompressionSessionAddImageToSequence()
{
  return MEMORY[0x1E0D08C08]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x1E0D08C38]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x1E0D08C40]();
}

uint64_t CMPhotoCompressionSessionEndImageSequence()
{
  return MEMORY[0x1E0D08C50]();
}

uint64_t CMPhotoCompressionSessionFlushCachedBuffers()
{
  return MEMORY[0x1E0D08C58]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x1E0D08C78]();
}

uint64_t CMPhotoCompressionSessionStartImageSequence()
{
  return MEMORY[0x1E0D08CA0]();
}

uint64_t CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex()
{
  return MEMORY[0x1E0D08E48]();
}

uint64_t CMPhotoDecompressionContainerCreateDictionaryDescription()
{
  return MEMORY[0x1E0D08E50]();
}

uint64_t CMPhotoDecompressionContainerCreateImageForIndex()
{
  return MEMORY[0x1E0D08E58]();
}

uint64_t CMPhotoDecompressionContainerCreateSequenceContainer()
{
  return MEMORY[0x1E0D08E78]();
}

uint64_t CMPhotoDecompressionContainerGetImageCount()
{
  return MEMORY[0x1E0D08F20]();
}

uint64_t CMPhotoDecompressionContainerGetImageGeometryForIndex()
{
  return MEMORY[0x1E0D08F30]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x1E0D08FE0]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x1E0D08FE8]();
}

uint64_t CMPhotoDecompressionSessionDiscardCachedBuffers()
{
  return MEMORY[0x1E0D08FF8]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF40](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF50](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF58](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1E0C9EF80](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1E0C9EFB0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDecodeTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFC0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFC8](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1E0C9EFD0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFF0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFF8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1E0C9F010](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1E0C9F018](sbuf, sampleIndex);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x1E0C9F0A8](sbuf, outputPresentationTimeStamp);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0C8](target, key, value, *(_QWORD *)&attachmentMode);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0D0](target, theAttachments, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithEpoch(CMTime *__return_ptr retstr, int64_t value, int32_t timescale, int64_t epoch)
{
  return (CMTime *)MEMORY[0x1E0C9F328](retstr, value, *(_QWORD *)&timescale, epoch);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F380](retstr, time, *(_QWORD *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F388](retstr, time, multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1E0C9F390](retstr, time, *(_QWORD *)&multiplier, *(_QWORD *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1E0C9F3A8](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3D8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3F0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1E0C9F528](allocator, imageBuffer, formatDescriptionOut);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9F550](videoDesc, originIsAtTopLeft);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1E0C9F558](videoDesc);
}

OSStatus CMVideoFormatDescriptionGetH264ParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x1E0C9F568](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

OSStatus CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x1E0C9F570](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  double v3;
  double v4;
  CGSize result;

  MEMORY[0x1E0C9F580](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.height = v4;
  result.width = v3;
  return result;
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

CFTypeRef CVBufferGetAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8910](buffer, key, attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x1E0CA8928](sourceBuffer, destinationBuffer);
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
  MEMORY[0x1E0CA8940](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CGRect CVImageBufferGetCleanRect(CVImageBufferRef imageBuffer)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0CA89D8](imageBuffer);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGColorSpaceRef CVImageBufferGetColorSpace(CVImageBufferRef imageBuffer)
{
  return (CGColorSpaceRef)MEMORY[0x1E0CA89E0](imageBuffer);
}

uint64_t CVNLPCaptionCopyForCVPixelBuffer()
{
  return MEMORY[0x1E0D099B8]();
}

uint64_t CVNLPCaptionHandlerCreate()
{
  return MEMORY[0x1E0D099C8]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferFillExtendedPixels(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AD0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x1E0CA8B10](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1E0CA8B78](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t FigAssetCreateWithByteStream()
{
  return MEMORY[0x1E0CC2660]();
}

uint64_t FigAssetReaderCreateWithAsset()
{
  return MEMORY[0x1E0CC2738]();
}

uint64_t FigLivePhotoMetadataComputeDeserializationSize()
{
  return MEMORY[0x1E0D03AF0]();
}

uint64_t FigLivePhotoMetadataComputeSerializationSizeV3()
{
  return MEMORY[0x1E0D03AF8]();
}

uint64_t FigLivePhotoMetadataDeserializeIntoBuffer()
{
  return MEMORY[0x1E0D03B00]();
}

uint64_t FigMetadataFormatDescriptionGetIdentifierForLocalID()
{
  return MEMORY[0x1E0CA0E78]();
}

uint64_t FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors()
{
  return MEMORY[0x1E0CA0E88]();
}

uint64_t FigMetadataFormatDescriptionGetSetupDataForLocalID()
{
  return MEMORY[0x1E0CA0E90]();
}

uint64_t ICAnalysisAddFrame()
{
  return MEMORY[0x1E0D3A900]();
}

uint64_t ICAnalysisInit()
{
  return MEMORY[0x1E0D3A908]();
}

uint64_t ICAnalysisStopAndGetResult()
{
  return MEMORY[0x1E0D3A910]();
}

uint64_t ICCalcCinematicL1Corrections()
{
  return MEMORY[0x1E0D3A928]();
}

uint64_t ICCreateCorrectionHomographiesWithNewImageCoordinates()
{
  return MEMORY[0x1E0D3A948]();
}

uint64_t ICDestroyResult()
{
  return MEMORY[0x1E0D3A950]();
}

uint64_t ICFillHomographyGaps()
{
  return MEMORY[0x1E0D3A960]();
}

uint64_t ICGetAnalysisConfidence()
{
  return MEMORY[0x1E0D3A968]();
}

uint64_t ICGetResultConfidence()
{
  return MEMORY[0x1E0D3A988]();
}

uint64_t ICGetResultHomographies()
{
  return MEMORY[0x1E0D3A998]();
}

uint64_t ICGetResultStats()
{
  return MEMORY[0x1E0D3A9A8]();
}

uint64_t ICStoreAnalyticsViaDodML()
{
  return MEMORY[0x1E0D3A9B0]();
}

uint64_t ICSynthesizeAnalysis()
{
  return MEMORY[0x1E0D3A9B8]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

void MPSSetHeapCacheDuration(id cmdBuf, double seconds)
{
  MEMORY[0x1E0CC6C78](cmdBuf, seconds);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSPoint NSPointFromString(NSString *aString)
{
  double v1;
  double v2;
  NSPoint result;

  MEMORY[0x1E0CB3028](aString);
  result.y = v2;
  result.x = v1;
  return result;
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB3150](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSSize NSSizeFromString(NSString *aString)
{
  double v1;
  double v2;
  NSSize result;

  MEMORY[0x1E0CB31A8](aString);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1E0D82DA0]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1E0D82DA8]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1E0D82DB0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1E0D82DB8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1E0D82DC0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1E0D82DC8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x1E0D82DD0]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1E0D82E10]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1E0D82E18]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1E0D82E20]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1E0D82E28]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1E0D82E30]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1E0D82E38]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x1E0D82E40]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1E0D82E50]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1E0D82E58]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1E0D82E60]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1E0D82E68]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1E0D82E70]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x1E0D82E78]();
}

uint64_t PHAssetMediaAnalysisDataWithColorNormalizationDictionaryAndRevision()
{
  return MEMORY[0x1E0CD18D8]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE20]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

uint64_t VIAllVisualSearchDomains()
{
  return MEMORY[0x1E0DC6EE0]();
}

uint64_t VNUpgradeFaceprint()
{
  return MEMORY[0x1E0CEE3E0]();
}

uint64_t VNUpgradeTorsoprint()
{
  return MEMORY[0x1E0CEE3E8]();
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x1E0CEC938](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x1E0CEC948](allocator, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x1E0CEC958](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

OSStatus VTCompressionSessionPrepareToEncodeFrames(VTCompressionSessionRef session)
{
  return MEMORY[0x1E0CEC998](session);
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1E0CEC9D8](pixelBuffer, options, imageOut);
}

OSStatus VTDecompressionSessionCreate(CFAllocatorRef allocator, CMVideoFormatDescriptionRef videoFormatDescription, CFDictionaryRef videoDecoderSpecification, CFDictionaryRef destinationImageBufferAttributes, const VTDecompressionOutputCallbackRecord *outputCallback, VTDecompressionSessionRef *decompressionSessionOut)
{
  return MEMORY[0x1E0CECA30](allocator, videoFormatDescription, videoDecoderSpecification, destinationImageBufferAttributes, outputCallback, decompressionSessionOut);
}

OSStatus VTDecompressionSessionDecodeFrameWithOutputHandler(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, VTDecodeInfoFlags *infoFlagsOut, VTDecompressionOutputHandler outputHandler)
{
  return MEMORY[0x1E0CECA50](session, sampleBuffer, *(_QWORD *)&decodeFlags, infoFlagsOut, outputHandler);
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x1E0CECB88]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x1E0CECBA8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

uint64_t VisionCoreEspressoStorageTypeForTensorDataType()
{
  return MEMORY[0x1E0DC6D30]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1E0D82EC0](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x1E0D82EE0](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return MEMORY[0x1E0D82EE8](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1E0D82EF0](this, a2);
}

{
  return MEMORY[0x1E0D82EF8](this, a2);
}

uint64_t PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  return MEMORY[0x1E0D82F10](this);
}

void PB::Base::~Base(PB::Base *this)
{
  MEMORY[0x1E0D82F18](this);
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x1E0D82F38]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x1E0D82F58](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x1E0D82F60]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1E0D82F68](this, a2);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x1E0D82F88](this);
}

{
  return MEMORY[0x1E0D82F90](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x1E0D82FA8](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2)
{
  return MEMORY[0x1E0D82FD0](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2)
{
  return MEMORY[0x1E0D82FD8](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1E0D82FF0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x1E0D82FF8](this);
}

uint64_t cva::VecLibLapack<float>::ormqr()
{
  return off_1E6B105B8();
}

uint64_t cva::VecLib<float>::gemm()
{
  return off_1E6B105C0();
}

uint64_t cva::VecLib<float>::gemv()
{
  return off_1E6B105C8();
}

uint64_t cva::vecLib::geqrf<float>()
{
  return MEMORY[0x1E0D15598]();
}

uint64_t cva::vecLib::gesvd<float>()
{
  return MEMORY[0x1E0D155A0]();
}

uint64_t cva::vecLib::trtrs<float>()
{
  return MEMORY[0x1E0D155A8]();
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4218](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4448](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4648]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E0]();
}

{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4710]();
}

{
  return MEMORY[0x1E0DE4718]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

std::terminate_handler std::set_terminate(std::terminate_handler a1)
{
  return (std::terminate_handler)MEMORY[0x1E0DE4DE0](a1);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete[](void *__p, const std::nothrow_t *a2)
{
  off_1E6B10888(__p, a2);
}

uint64_t operator delete[]()
{
  return off_1E6B10890();
}

void operator delete(void *__p)
{
  off_1E6B10898(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  off_1E6B108A0(__p, a2);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_1E6B108A8(__p, a2);
}

uint64_t operator delete()
{
  return off_1E6B108B0();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_1E6B108B8(__sz);
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E6B108C0(__sz, a2);
}

uint64_t operator new[]()
{
  return off_1E6B108C8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E6B108D0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E6B108D8(__sz, a2);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_1E6B108E0(__sz, a2);
}

uint64_t operator new()
{
  return off_1E6B108E8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

uint64_t alInterpolateMetadataForGap()
{
  return MEMORY[0x1E0D004F8]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x1E0C815A0](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

uint64_t autoloopSettingsDestroy()
{
  return MEMORY[0x1E0D00518]();
}

uint64_t autoloopSettingsSetDisableStabilizationGPU()
{
  return MEMORY[0x1E0D00520]();
}

uint64_t autoloopSettingsSetGating()
{
  return MEMORY[0x1E0D00528]();
}

uint64_t autoloopSettingsSetOptimizeForMemoryUse()
{
  return MEMORY[0x1E0D00530]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1E0C82678](a1, a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5278](*(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5288](*(_QWORD *)&algorithm);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

uint64_t createAutoLoopSettingsForAsset()
{
  return MEMORY[0x1E0D00538]();
}

uint64_t createBundleDefaultGatingClassifierURL()
{
  return MEMORY[0x1E0D00540]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x1E0D1F918]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x1E0D1F938]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x1E0D1F960]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x1E0D1F978]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x1E0D1F990]();
}

uint64_t e5rt_e5_compiler_options_get_compute_device_types_mask()
{
  return MEMORY[0x1E0D1F9A0]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x1E0D1F9B0]();
}

uint64_t e5rt_e5_compiler_options_retain_mil_entry_points()
{
  return MEMORY[0x1E0D1F9B8]();
}

uint64_t e5rt_e5_compiler_options_set_mil_entry_points()
{
  return MEMORY[0x1E0D1FA28]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x1E0D1FA50]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x1E0D1FA80]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x1E0D1FA98]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x1E0D1FAA0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x1E0D1FAE0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x1E0D1FAE8]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x1E0D1FB60]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x1E0D1FB98]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x1E0D1FBA8]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x1E0D1FBB8]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x1E0D1FBF8]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x1E0D1FC08]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x1E0D1FC48]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x1E0D1FC68]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x1E0D1FC90]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x1E0D1FCA0]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x1E0D1FCE8]();
}

uint64_t e5rt_program_library_create()
{
  return MEMORY[0x1E0D1FD30]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x1E0D1FD60]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x1E0D1FD68]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x1E0D1FDC8]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x1E0D1FDF8]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x1E0D1FE20]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x1E0D1FE38]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x1E0D1FE50]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x1E0D1FE70]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x1E0D1FE80]();
}

float erff(float a1)
{
  float result;

  MEMORY[0x1E0C83200](a1);
  return result;
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1E0D1FEE8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_context_set_low_precision_accumulation()
{
  return MEMORY[0x1E0D1FF28]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_get_default_storage_type()
{
  return MEMORY[0x1E0D1FF88]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD0]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD8]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x1E0D20060]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1E0D20080]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x1E0D20110]();
}

uint64_t espresso_plan_get_phase()
{
  return MEMORY[0x1E0D20120]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1E0D20130]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x1E0D20150]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

long double expm1(long double __x)
{
  long double result;

  MEMORY[0x1E0C832A0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uint64_t getGatingResult()
{
  return MEMORY[0x1E0D00548]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

uint64_t liveAnalysisResultDestroy()
{
  return MEMORY[0x1E0D00558]();
}

uint64_t liveAnalysisResultToDictionary()
{
  return MEMORY[0x1E0D00568]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

float log1pf(float a1)
{
  float result;

  MEMORY[0x1E0C83BD8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1E0C844A8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t runLiveAnalysisPipeline()
{
  return MEMORY[0x1E0D00570]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int sgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BE08](__m, __n, __a, __lda, __ipiv, __info);
}

int sgetri_(__CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BE10](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1E0DE8630](a1, a2, a3);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1E0DE87A8](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85608](__s, __charset);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x1E0C8C060](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x1E0C8C070](__C, __IC, __Z, __IZ, __N);
}

void vDSP_deq22(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C080](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x1E0C8C0A0](__setup);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_f3x3(const float *__A, vDSP_Length __NR, vDSP_Length __NC, const float *__F, float *__C)
{
  MEMORY[0x1E0C8C0E8](__A, __NR, __NC, __F, __C);
}

void vDSP_f5x5(const float *__A, vDSP_Length __NR, vDSP_Length __NC, const float *__F, float *__C)
{
  MEMORY[0x1E0C8C0F8](__A, __NR, __NC, __F, __C);
}

void vDSP_fft2d_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC0, vDSP_Stride __IC1, vDSP_Length __Log2N0, vDSP_Length __Log2N1, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C110](__Setup, __C, __IC0, __IC1, __Log2N0, __Log2N1, *(_QWORD *)&__Direction);
}

void vDSP_imgfir(const float *__A, vDSP_Length __NR, vDSP_Length __NC, const float *__F, float *__C, vDSP_Length __P, vDSP_Length __Q)
{
  MEMORY[0x1E0C8C170](__A, __NR, __NC, __F, __C, __P, __Q);
}

void vDSP_maxmgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C188](__A, __IA, __C, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C250](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
  MEMORY[0x1E0C8C260](__A, __IA, __C, __IC, __M, __N);
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
  MEMORY[0x1E0C8C280](__A, __IA, __C, __IC, __Mean, __StandardDeviation, __N);
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2C0](__A, __IA, __C, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2E8](__A, __I, __C, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C328](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C358](__A, __IA, __C, __IC, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C400](__C, __IC, __N);
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C460](__A, __C, __IC, __N);
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C608](__A, __IA, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C860](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
  MEMORY[0x1E0C8C900](__C, __I, __Temporary, __N, *(_QWORD *)&__Order);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA50](__Z, __IZ, __C, __IC, __N);
}

void vDSP_zvcmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA88](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CAB8](__A, __IA, __C, __IC, __N);
}

vImage_Error vImageAffineWarpCG_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_CGAffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CB30](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D6E8](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D728](src, dest, tempBuffer, *(_QWORD *)&flags);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

