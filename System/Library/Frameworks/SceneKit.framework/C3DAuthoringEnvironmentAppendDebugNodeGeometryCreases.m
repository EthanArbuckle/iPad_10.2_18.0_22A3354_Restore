@implementation C3DAuthoringEnvironmentAppendDebugNodeGeometryCreases

void __C3DAuthoringEnvironmentAppendDebugNodeGeometryCreases_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  int Index;
  int v14;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float v20;
  float v21;
  float32x4_t v22;
  _QWORD v23[2];

  if (a4)
  {
    v6 = 0;
    v7 = a4;
    do
    {
      v8 = *(unsigned int *)(a3 + 4 * v6++);
      v9 = v6;
      if (v6 == v7)
        v9 = 0;
      v10 = *(unsigned int *)(a3 + 4 * v9);
      v11 = 0.0;
      if (*(uint64_t *)(a1 + 32) >= 1)
      {
        v12 = 0;
        while (1)
        {
          Index = C3DMeshElementGetIndex(*(_QWORD *)(a1 + 40), v12, 0, *(_QWORD *)(a1 + 48));
          v14 = C3DMeshElementGetIndex(*(_QWORD *)(a1 + 40), v12, 1, *(_QWORD *)(a1 + 48));
          if ((_DWORD)v8 == Index && (_DWORD)v10 == v14)
            break;
          if ((_DWORD)v8 == v14 && (_DWORD)v10 == Index)
            break;
          if (++v12 >= *(_QWORD *)(a1 + 32))
            goto LABEL_18;
        }
        v11 = *(float *)C3DSourceAccessorGetValuePtrAtIndex(*(_QWORD **)(a1 + 56), v12);
      }
LABEL_18:
      *(double *)v17.i64 = C3DMeshSourceGetValueAtIndexAsVector3(*(_QWORD *)(a1 + 64), v8);
      v22 = v17;
      *(double *)v18.i64 = C3DMeshSourceGetValueAtIndexAsVector3(*(_QWORD *)(a1 + 64), v10);
      v19 = v18;
      v20 = v11 * 0.5;
      if ((float)(v11 * 0.5) > 1.0)
        v20 = 1.0;
      v21 = 2.0 - (float)(v11 * 0.5);
      if (v21 > 1.0)
        v21 = 1.0;
      v23[0] = LODWORD(v20) | ((unint64_t)LODWORD(v21) << 32);
      v23[1] = 0x3F80000000000000;
      C3DAuthoringEnvironmentAppendDebugSegment(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), (float *)v23, 0, v22, v19);
    }
    while (v6 != v7);
  }
}

@end
