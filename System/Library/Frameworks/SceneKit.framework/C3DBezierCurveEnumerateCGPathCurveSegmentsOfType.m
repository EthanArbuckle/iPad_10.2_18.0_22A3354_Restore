@implementation C3DBezierCurveEnumerateCGPathCurveSegmentsOfType

uint64_t ___C3DBezierCurveEnumerateCGPathCurveSegmentsOfType_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  float32x2_t v7;
  float32x2_t v8;
  uint64_t v9;
  float64x2_t *v10;
  float32x2_t v11;
  float32x2_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  float64x2_t *v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float32x2_t v23;
  uint64_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (_QWORD *)result;
  switch(*(_DWORD *)a2)
  {
    case 0:
      v7 = vcvt_f32_f64(*(float64x2_t *)*(_QWORD *)(a2 + 8));
      *(float32x2_t *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v7;
      ++*(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
      *(float32x2_t *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = v7;
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 48)
                                                                                            + 8)
                                                                                + 24);
      return result;
    case 1:
      v8 = vcvt_f32_f64(*(float64x2_t *)*(_QWORD *)(a2 + 8));
      if (*(_DWORD *)(result + 72) == 1)
      {
        v28 = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
        v29 = v28 + 1;
        v9 = *(_QWORD *)(result + 32);
        v24 = *(_QWORD *)(*(_QWORD *)(v6[5] + 8) + 24);
        v25 = v8;
        result = (*(uint64_t (**)(uint64_t, __int16 *))(v9 + 16))(v9, &v28);
      }
      *(float32x2_t *)(*(_QWORD *)(v6[5] + 8) + 24) = v8;
      goto LABEL_15;
    case 2:
      v10 = *(float64x2_t **)(a2 + 8);
      v11 = vcvt_f32_f64(v10[1]);
      if (*(_DWORD *)(result + 72) == 2)
      {
        v12 = vcvt_f32_f64(*v10);
        v28 = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
        v29 = v28 + 1;
        v30 = v28 + 2;
        v13 = *(_QWORD *)(result + 32);
        v24 = *(_QWORD *)(*(_QWORD *)(v6[5] + 8) + 24);
        v25 = v12;
        v26 = v11;
        result = (*(uint64_t (**)(uint64_t, __int16 *, uint64_t *))(v13 + 16))(v13, &v28, &v24);
      }
      *(float32x2_t *)(*(_QWORD *)(v6[5] + 8) + 24) = v11;
      v14 = *(_QWORD *)(v6[6] + 8);
      v15 = *(_WORD *)(v14 + 24) + 2;
      goto LABEL_16;
    case 3:
      v16 = *(float64x2_t **)(a2 + 8);
      v17 = vcvt_f32_f64(v16[2]);
      if (*(_DWORD *)(result + 72) == 3)
      {
        v18 = vcvt_f32_f64(v16[1]);
        v19 = vcvt_f32_f64(*v16);
        v28 = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
        v29 = v28 + 1;
        v30 = v28 + 2;
        v31 = v28 + 3;
        v20 = *(_QWORD *)(result + 32);
        v24 = *(_QWORD *)(*(_QWORD *)(v6[5] + 8) + 24);
        v25 = v19;
        v26 = v18;
        v27 = v17;
        result = (*(uint64_t (**)(uint64_t, __int16 *, uint64_t *, uint64_t, uint64_t, uint64_t))(v20 + 16))(v20, &v28, &v24, a4, a5, a6);
      }
      *(float32x2_t *)(*(_QWORD *)(v6[5] + 8) + 24) = v17;
      v14 = *(_QWORD *)(v6[6] + 8);
      v15 = *(_WORD *)(v14 + 24) + 3;
      goto LABEL_16;
    case 4:
      if (*(_DWORD *)(result + 72) == 1)
      {
        v21 = *(_QWORD *)(result + 56);
        v28 = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
        v29 = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24);
        v22 = *(_QWORD *)(result + 32);
        v23 = *(float32x2_t *)(*(_QWORD *)(v21 + 8) + 24);
        v24 = *(_QWORD *)(*(_QWORD *)(v6[5] + 8) + 24);
        v25 = v23;
        result = (*(uint64_t (**)(uint64_t, __int16 *))(v22 + 16))(v22, &v28);
      }
      *(_QWORD *)(*(_QWORD *)(v6[5] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(v6[7] + 8) + 24);
LABEL_15:
      v14 = *(_QWORD *)(v6[6] + 8);
      v15 = *(_WORD *)(v14 + 24) + 1;
LABEL_16:
      *(_WORD *)(v14 + 24) = v15;
      break;
    default:
      return result;
  }
  return result;
}

@end
