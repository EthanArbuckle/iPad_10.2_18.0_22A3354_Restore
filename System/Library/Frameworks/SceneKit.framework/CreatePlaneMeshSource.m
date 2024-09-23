@implementation CreatePlaneMeshSource

void ____CreatePlaneMeshSource_block_invoke(uint64_t a1, double a2, float a3, float a4)
{
  double v6;
  double v7;
  uint64_t v8;
  int v9;
  double v10;
  double v11;
  __double2 v12;
  float v13;
  double v14;
  uint64_t v15;
  double v16;
  __double2 v17;
  float v18;
  float v19;
  unsigned int v20;
  UInt8 bytes[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(uint64_t *)(a1 + 40) >= 2)
  {
    v6 = a3;
    v7 = a4;
    v8 = 1;
    while (1)
    {
      v9 = *(char *)(a1 + 92);
      if (v9 == 3)
        break;
      if (v9 == 1)
      {
        *(_DWORD *)bytes = 0;
        v15 = 0x3F80000000000000;
        goto LABEL_10;
      }
      if (!*(_BYTE *)(a1 + 92))
      {
        v10 = *(double *)(a1 + 48) + v6;
        v11 = *(float *)(a1 + 72);
        v12 = __sincos_stret((float)(*(float *)(a1 + 76) * (float)(int)v8) + a2);
        v13 = v10 + v11 * v12.__cosval;
        *(float *)bytes = v13;
        v14 = *(double *)(a1 + 56) + v7 + v11 * v12.__sinval;
        goto LABEL_9;
      }
LABEL_11:
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 64), bytes, 4 * *(int *)(a1 + 88));
      if (*(_QWORD *)(a1 + 40) <= ++v8)
        return;
    }
    v16 = *(float *)(a1 + 72);
    v17 = __sincos_stret((float)(*(float *)(a1 + 76) * (float)(int)v8) + a2);
    v18 = *(float *)(a1 + 84);
    v19 = (v6 + v16 * v17.__cosval) / *(float *)(a1 + 80) + 0.5;
    *(float *)bytes = v19;
    v14 = 1.0 - (v7 + v16 * v17.__sinval) / v18 + -0.5;
LABEL_9:
    *(float *)&v20 = v14;
    v15 = v20;
LABEL_10:
    v22 = v15;
    goto LABEL_11;
  }
}

void ____CreatePlaneMeshSource_block_invoke_2(uint64_t a1, float a2, float a3, float a4, float a5, float a6)
{
  float v7;
  double v13;
  float v14;
  int v15;
  int v16;
  double v17;
  float v18;
  float v19;
  uint64_t v20;
  float v21;
  UInt8 bytes[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a6 + 1.0;
  if ((float)(a6 + 1.0) > 0.0)
  {
    v13 = a3;
    v14 = 0.0;
    v15 = 1;
    while (1)
    {
      v16 = *(char *)(a1 + 76);
      if (v16 == 3)
        break;
      if (v16 == 1)
      {
        *(float *)bytes = 0.0;
        v20 = 0x3F80000000000000;
        goto LABEL_10;
      }
      if (!*(_BYTE *)(a1 + 76))
      {
        v17 = *(double *)(a1 + 48);
        v18 = *(double *)(a1 + 40) + a2 + (float)((float)(v14 * a4) / a6);
        *(float *)bytes = v18;
        v19 = v17 + v13 + (float)((float)(v14 * a5) / a6);
        goto LABEL_9;
      }
LABEL_11:
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 56), bytes, 4 * *(int *)(a1 + 72));
      v14 = (float)v15++;
      if (v7 <= v14)
        return;
    }
    v21 = *(float *)(a1 + 68);
    *(float *)bytes = (float)((float)((float)((float)(v14 * a4) / a6) + a2) / *(float *)(a1 + 64)) + 0.5;
    v19 = (float)(1.0 - (float)((float)((float)((float)(v14 * a5) / a6) + a3) / v21)) + -0.5;
LABEL_9:
    v20 = LODWORD(v19);
LABEL_10:
    v23 = v20;
    goto LABEL_11;
  }
}

@end
