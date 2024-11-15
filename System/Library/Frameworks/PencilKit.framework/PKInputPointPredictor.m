@implementation PKInputPointPredictor

- (void)predictedPointForPoint:(_OWORD *)a3@<X8> timestamp:(double)a4@<D0>
{
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[8];

  if (a1)
  {
    v8 = *(_QWORD *)(a1 + 520);
    v9 = (char *)(a1 + 8);
    if (v8 == 4)
    {
      memmove(v9, (const void *)(a1 + 136), 0x180uLL);
      v10 = (char *)(a1 + 392);
    }
    else
    {
      *(_QWORD *)(a1 + 520) = v8 + 1;
      v10 = &v9[128 * v8];
    }
    v11 = *a2;
    v12 = a2[1];
    v13 = a2[3];
    *((_OWORD *)v10 + 2) = a2[2];
    *((_OWORD *)v10 + 3) = v13;
    *(_OWORD *)v10 = v11;
    *((_OWORD *)v10 + 1) = v12;
    v14 = a2[4];
    v15 = a2[5];
    v16 = a2[7];
    *((_OWORD *)v10 + 6) = a2[6];
    *((_OWORD *)v10 + 7) = v16;
    *((_OWORD *)v10 + 4) = v14;
    *((_OWORD *)v10 + 5) = v15;
    v17 = *a2;
    v18 = a2[1];
    v19 = a2[3];
    v23[2] = a2[2];
    v23[3] = v19;
    v23[0] = v17;
    v23[1] = v18;
    v20 = a2[4];
    v21 = a2[5];
    v22 = a2[7];
    v23[6] = a2[6];
    v23[7] = v22;
    v23[4] = v20;
    v23[5] = v21;
    -[PKInputPointPredictor predictedPointAtTimestamp:defaultPoint:](a1, (uint64_t)v23, a3, a4);
  }
  else
  {
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
}

- (double)predictedPointAtTimestamp:(_OWORD *)a3@<X8> defaultPoint:(double)a4@<D0>
{
  double v4;
  uint64_t v5;
  float64x2_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  if (a1)
  {
    if (*(uint64_t *)(a1 + 520) > 3)
    {
      v4 = a4 - *(double *)(a1 + 456);
      if (v4 > 0.0)
      {
        v5 = 0;
        v6 = *(float64x2_t *)MEMORY[0x1E0C9D538];
        v7 = *(double *)(a1 + 72);
        v8 = v7;
        while (1)
        {
          v9 = v8;
          v8 = *(double *)(a1 + v5 + 200);
          v10 = v8 - v9;
          if (v10 <= 0.0)
            break;
          v6 = vaddq_f64(v6, vdivq_f64(vsubq_f64(*(float64x2_t *)(a1 + v5 + 136), *(float64x2_t *)(a1 + v5 + 8)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v10, 0)));
          v5 += 128;
          if (v5 == 384)
          {
            v11 = 0;
            __asm { FMOV            V4.2D, #3.0 }
            v17 = vdivq_f64(v6, _Q4);
            v18 = *(double *)(a1 + 8);
            v19 = *(double *)(a1 + 16);
            v20 = 0.0;
            do
            {
              v21 = *(double *)(a1 + v11 + 200);
              v22 = *(double *)(a1 + v11 + 136);
              v23 = *(double *)(a1 + v11 + 144);
              v11 += 128;
              v20 = v20
                  + ((v23 - v19) / (v21 - v7) - v17.f64[1]) * ((v23 - v19) / (v21 - v7) - v17.f64[1])
                  + ((v22 - v18) / (v21 - v7) - v17.f64[0]) * ((v22 - v18) / (v21 - v7) - v17.f64[0]);
              v19 = v23;
              v18 = v22;
              v7 = v21;
            }
            while (v11 != 384);
            v24 = v20 / 3.0;
            v25 = sqrt(v17.f64[1] * v17.f64[1] + v17.f64[0] * v17.f64[0]);
            v26 = (sqrt(v24) + -3558.22611) / -3487.80326;
            v27 = 0.0;
            v28 = 0.0;
            if (v26 >= 0.0)
            {
              v28 = v26;
              if (v26 > 1.0)
                v28 = 1.0;
            }
            v29 = (v25 + -25.262576) / 556.741905;
            if (v29 >= 0.0)
            {
              v27 = v29;
              if (v29 > 1.0)
                v27 = 1.0;
            }
            *(float64x2_t *)a2 = vaddq_f64(*(float64x2_t *)(a1 + 392), vmulq_n_f64(vmulq_n_f64(v17, v4), v28 * v27));
            *(double *)(a2 + 64) = a4;
            v30 = *(_OWORD *)(a2 + 112);
            a3[6] = *(_OWORD *)(a2 + 96);
            a3[7] = v30;
            v31 = *(_OWORD *)(a2 + 48);
            a3[2] = *(_OWORD *)(a2 + 32);
            a3[3] = v31;
            v32 = *(_OWORD *)(a2 + 80);
            a3[4] = *(_OWORD *)(a2 + 64);
            a3[5] = v32;
            v33 = *(_OWORD *)(a2 + 16);
            *a3 = *(_OWORD *)a2;
            a3[1] = v33;
            return *(double *)&v33;
          }
        }
      }
    }
    v34 = *(_OWORD *)(a2 + 80);
    a3[4] = *(_OWORD *)(a2 + 64);
    a3[5] = v34;
    v35 = *(_OWORD *)(a2 + 112);
    a3[6] = *(_OWORD *)(a2 + 96);
    a3[7] = v35;
    v36 = *(_OWORD *)(a2 + 16);
    *a3 = *(_OWORD *)a2;
    a3[1] = v36;
    v33 = *(_OWORD *)(a2 + 32);
    v37 = *(_OWORD *)(a2 + 48);
    a3[2] = v33;
    a3[3] = v37;
  }
  else
  {
    *(_QWORD *)&v33 = 0;
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return *(double *)&v33;
}

@end
