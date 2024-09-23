int64x2_t FLSimpleSpringMake@<Q0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>)
{
  int64x2_t result;

  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = 0x3FF0000000000000;
  result = vdupq_n_s64(0x7FF8000000000000uLL);
  *(double *)(a1 + 24) = a5;
  *(double *)(a1 + 32) = a6;
  *(int64x2_t *)(a1 + 64) = result;
  *(double *)(a1 + 40) = a4;
  *(double *)(a1 + 48) = a7;
  *(double *)(a1 + 56) = a8;
  return result;
}

BOOL FLSimpleSpringIsStable(double *a1)
{
  return vabdd_f64(*a1, a1[5]) <= a1[6] && fabs(a1[1]) <= a1[7];
}

double FLSimpleSpringMakeWithDampingRatioResponse@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>)
{
  double result;
  uint64_t v15;
  uint64_t v16;
  double v17;

  v16 = 0;
  v17 = 0.0;
  FLSpringConvertDampingRatioResponseToStiffnessDamping(&v17, (double *)&v16, a5, a6);
  v15 = v16;
  result = v17;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = 0x3FF0000000000000;
  *(double *)(a1 + 24) = result;
  *(_QWORD *)(a1 + 32) = v15;
  *(int64x2_t *)(a1 + 64) = vdupq_n_s64(0x7FF8000000000000uLL);
  *(double *)(a1 + 40) = a4;
  *(double *)(a1 + 48) = a7;
  *(double *)(a1 + 56) = a8;
  return result;
}

double FLSimpleSpringSetDampingRatioResponse(uint64_t a1, double a2, double a3)
{
  double result;
  uint64_t v5;
  uint64_t v6;
  double v7;

  v6 = 0;
  v7 = 0.0;
  FLSpringConvertDampingRatioResponseToStiffnessDamping(&v7, (double *)&v6, a2, a3);
  v5 = v6;
  result = v7;
  *(double *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v5;
  return result;
}

void FLSimpleSpringStep(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __double2 v21;
  double v22;
  long double v23;
  long double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v7 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  if (vabdd_f64(*(double *)a1, v7) <= v6)
  {
    v8 = *(double *)(a1 + 8);
    if (fabs(v8) <= *(double *)(a1 + 56))
    {
      v27 = *(_OWORD *)(a1 + 80);
      *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
      *(_OWORD *)(a2 + 80) = v27;
      *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
      v28 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a1;
      *(_OWORD *)(a2 + 16) = v28;
      v29 = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
      *(_OWORD *)(a2 + 48) = v29;
      return;
    }
  }
  else
  {
    v8 = *(double *)(a1 + 8);
  }
  v9 = *(double *)a1 - v7;
  v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  v11 = *(double *)(a1 + 24);
  v12 = *(double *)(a1 + 32);
  v35 = v7;
  v36 = v6;
  v33 = v12;
  v34 = v11;
  if (v11 == *(double *)(a1 + 64) && v12 == *(double *)(a1 + 72))
  {
    v13 = *(double *)(a1 + 80);
    v14 = *(double *)(a1 + 88);
    v16 = *(double *)(a1 + 96);
    v37 = *(double *)(a1 + 104);
    v15 = -v13;
  }
  else
  {
    v13 = v12 * 0.5;
    v14 = sqrt(v11);
    v15 = -(v12 * 0.5);
    v16 = sqrt(v14 * v14 - v13 * v13);
    v37 = sqrt(v13 * v13 - v14 * v14);
  }
  v17 = exp(v15 * a3);
  v18 = v8 + v13 * v9;
  if (v13 >= v14)
  {
    if (v13 <= v14)
    {
      v25 = v9 + v18 * a3;
      v22 = v17 * v15;
      v26 = v25;
      goto LABEL_14;
    }
    v23 = v37 * a3;
    v32 = v18 / v37;
    v31 = cosh(v23);
    v24 = sinh(v23);
    v22 = v32 * v24 + v9 * v31;
    v18 = v37 * (v32 * v31) + v9 * v24 * v37;
  }
  else
  {
    v19 = v16 * a3;
    v20 = v18 / v16;
    v21 = __sincos_stret(v19);
    v22 = v21.__sinval * v20 + v9 * v21.__cosval;
    v18 = v16 * (v21.__cosval * v20) + -(v21.__sinval * v9) * v16;
  }
  v25 = v17 * v15;
  v26 = v22;
LABEL_14:
  *(double *)a2 = v35 + v17 * v26;
  *(double *)(a2 + 8) = v25 * v22 + v17 * v18;
  *(double *)(a2 + 64) = v34;
  *(double *)(a2 + 72) = v33;
  *(double *)(a2 + 80) = v13;
  *(double *)(a2 + 88) = v14;
  *(double *)(a2 + 96) = v16;
  *(double *)(a2 + 104) = v37;
  v30 = *(_QWORD *)(a1 + 56);
  *(double *)(a2 + 48) = v36;
  *(_QWORD *)(a2 + 56) = v30;
}

double FLDeceleratedRestPosition(double a1, double a2, double a3)
{
  return a2 / 1000.0 * a3 / (1.0 - a3) + a1;
}

double FLRubberbandValue(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0)
    return a2;
  if (a1 < a2)
    a3 = -a3;
  return a2 + (1.0 - 1.0 / (a4 * ((a1 - a2) / a3) + 1.0)) * a3;
}

double FLInverseRubberbandValue(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0)
    return a2;
  if (a1 < a2)
    a3 = -a3;
  return a2 + (-1.0 / ((a1 - a2) / a3 + -1.0) + -1.0) / a4 * a3;
}

double FLSpringConvertStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double a3, double a4)
{
  double result;

  result = sqrt(a3);
  if (a1)
    *a1 = a4 / (result + result);
  if (a2)
  {
    result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double FLSpringConvertMassStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;

  if (a1)
  {
    v5 = sqrt(result * a4);
    *a1 = a5 / (v5 + v5);
  }
  if (a2)
  {
    result = 6.28318531 / sqrt(a4 / result);
    *a2 = result;
  }
  return result;
}

double FLSpringConvertDampingRatioResponseToStiffnessDamping(double *a1, double *a2, double result, double a4)
{
  double v4;
  double v5;

  v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1)
    *a1 = v4;
  if (a2)
  {
    v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double FLSpringConvertMassStiffnessDampingToStiffnessDamping(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;
  double v6;
  double v7;
  double v8;

  v5 = sqrt(a4 / result);
  v6 = 6.28318531 / (6.28318531 / v5) * (6.28318531 / (6.28318531 / v5));
  if (a1)
    *a1 = v6;
  if (a2)
  {
    v7 = sqrt(result * a4);
    v8 = sqrt(v6);
    result = a5 / (v7 + v7) * (v8 + v8);
    *a2 = result;
  }
  return result;
}

__n128 FLCompoundSpringMake@<Q0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>)
{
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __n128 v17;
  __int128 v18;
  __int128 v19;
  __n128 v20;
  __int128 v21;
  __int128 v22;
  __n128 v23;
  __int128 v24;
  __int128 v25;
  __n128 result;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __n128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  double v39;

  v38 = a5;
  v39 = a4;
  v14 = a1 + 16;
  bzero((void *)(a1 + 16), 0x240uLL);
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  v36 = 0.0;
  v37 = 0.0;
  FLSpringConvertDampingRatioResponseToStiffnessDamping(&v37, &v36, 1.0, 0.5);
  FLSimpleSpringMake(v14, a4, 0.0, a4, v37, v36, a6, a7);
  FLSimpleSpringMake((uint64_t)&v29, a5, 0.0, a5, v37, v36, a6, a7);
  v15 = v34;
  *(_OWORD *)(a1 + 192) = v33;
  *(_OWORD *)(a1 + 208) = v15;
  *(_OWORD *)(a1 + 224) = v35;
  v16 = v30;
  *(_OWORD *)(a1 + 128) = v29;
  *(_OWORD *)(a1 + 144) = v16;
  v17 = v32;
  *(_OWORD *)(a1 + 160) = v31;
  *(__n128 *)(a1 + 176) = v17;
  v27 = 0.0;
  v28 = 0.0;
  FLSpringConvertStiffnessDampingToDampingRatioResponse(&v28, &v27, a4, a5);
  FLSimpleSpringMake((uint64_t)&v29, v28, 0.0, v28, v37, v36, a6, a7);
  v18 = v34;
  *(_OWORD *)(a1 + 304) = v33;
  *(_OWORD *)(a1 + 320) = v18;
  *(_OWORD *)(a1 + 336) = v35;
  v19 = v30;
  *(_OWORD *)(a1 + 240) = v29;
  *(_OWORD *)(a1 + 256) = v19;
  v20 = v32;
  *(_OWORD *)(a1 + 272) = v31;
  *(__n128 *)(a1 + 288) = v20;
  FLSimpleSpringMake((uint64_t)&v29, v27, 0.0, v27, v37, v36, a6, a7);
  v21 = v34;
  *(_OWORD *)(a1 + 416) = v33;
  *(_OWORD *)(a1 + 432) = v21;
  *(_OWORD *)(a1 + 448) = v35;
  v22 = v30;
  *(_OWORD *)(a1 + 352) = v29;
  *(_OWORD *)(a1 + 368) = v22;
  v23 = v32;
  *(_OWORD *)(a1 + 384) = v31;
  *(__n128 *)(a1 + 400) = v23;
  FLSpringConvertDampingRatioResponseToStiffnessDamping(&v39, &v38, v28, v27);
  FLSimpleSpringMake((uint64_t)&v29, a2, 0.0, a2, v37, v36, a6, a7);
  v24 = v34;
  *(_OWORD *)(a1 + 528) = v33;
  *(_OWORD *)(a1 + 544) = v24;
  *(_OWORD *)(a1 + 560) = v35;
  v25 = v30;
  *(_OWORD *)(a1 + 464) = v29;
  *(_OWORD *)(a1 + 480) = v25;
  result = v32;
  *(_OWORD *)(a1 + 496) = v31;
  *(__n128 *)(a1 + 512) = result;
  *(double *)(a1 + 576) = a6;
  *(double *)(a1 + 584) = a7;
  return result;
}

void FLCompoundSpringMakeWithDampingRatioResponse(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>)
{
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  FLSpringConvertDampingRatioResponseToStiffnessDamping(&v13, &v12, a4, a5);
  FLCompoundSpringMake(a1, a2, a3, v13, v12, a6, a7);
}

uint64_t FLCompoundSpringSetAnchorImmediately(uint64_t result, double a2)
{
  *(double *)(result + 504) = a2;
  *(double *)(result + 464) = a2;
  *(_QWORD *)(result + 472) = 0;
  return result;
}

void FLCompoundSpringSetAnchorWithResponse(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 464) = a3;
    *(_QWORD *)(a1 + 472) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    FLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 488) = v7;
    *(_QWORD *)(a1 + 496) = v5;
    a3 = a2;
  }
  *(double *)(a1 + 504) = a3;
}

void FLCompoundSpringSetAnchorWithIntermediatePositionAndResponse(uint64_t a1, double a2, double a3, double a4)
{
  if (a4 == 0.0)
  {
    *(double *)(a1 + 504) = a2;
  }
  else
  {
    FLCompoundSpringSetAnchorWithResponse(a1, a2, a4);
    a2 = a3;
  }
  *(double *)(a1 + 464) = a2;
  *(_QWORD *)(a1 + 472) = 0;
}

uint64_t FLCompoundSpringSetStiffnessImmediately(uint64_t result, double a2)
{
  *(double *)(result + 56) = a2;
  *(double *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

void FLCompoundSpringSetStiffnessWithResponse(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 16) = a2;
    *(_QWORD *)(a1 + 24) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    FLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v5;
  }
  *(double *)(a1 + 56) = a2;
}

uint64_t FLCompoundSpringSetDampingImmediately(uint64_t result, double a2)
{
  *(double *)(result + 168) = a2;
  *(double *)(result + 128) = a2;
  *(_QWORD *)(result + 136) = 0;
  return result;
}

void FLCompoundSpringSetDampingWithResponse(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 128) = a2;
    *(_QWORD *)(a1 + 136) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    FLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 152) = v7;
    *(_QWORD *)(a1 + 160) = v5;
  }
  *(double *)(a1 + 168) = a2;
}

uint64_t FLCompoundSpringSetDampingRatioImmediately(uint64_t result, double a2)
{
  *(double *)(result + 280) = a2;
  *(double *)(result + 240) = a2;
  *(_QWORD *)(result + 248) = 0;
  return result;
}

void FLCompoundSpringSetDampingRatioSmoothly(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 240) = a2;
    *(_QWORD *)(a1 + 248) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    FLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 264) = v7;
    *(_QWORD *)(a1 + 272) = v5;
  }
  *(double *)(a1 + 280) = a2;
}

uint64_t FLCompoundSpringSetResponseImmediately(uint64_t result, double a2)
{
  *(double *)(result + 392) = a2;
  *(double *)(result + 352) = a2;
  *(_QWORD *)(result + 360) = 0;
  return result;
}

void FLCompoundSpringSetResponseSmoothly(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == 0.0)
  {
    *(double *)(a1 + 352) = a2;
    *(_QWORD *)(a1 + 360) = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    FLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    v5 = v6;
    *(_QWORD *)(a1 + 376) = v7;
    *(_QWORD *)(a1 + 384) = v5;
  }
  *(double *)(a1 + 392) = a2;
}

double FLCompoundSpringStep@<D0>(void *__src@<X0>, double *a2@<X8>, double a3@<D0>)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
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
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double result;
  _OWORD v29[7];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  memcpy(a2, __src, 0x250uLL);
  v6 = *((_OWORD *)a2 + 20);
  v41 = *((_OWORD *)a2 + 19);
  v42 = v6;
  v43 = *((_OWORD *)a2 + 21);
  v7 = *((_OWORD *)a2 + 16);
  v37 = *((_OWORD *)a2 + 15);
  v38 = v7;
  v8 = *((_OWORD *)a2 + 18);
  v39 = *((_OWORD *)a2 + 17);
  v40 = v8;
  FLSimpleSpringStep((uint64_t)&v37, (uint64_t)(a2 + 30), a3);
  v9 = *((_OWORD *)a2 + 27);
  v34 = *((_OWORD *)a2 + 26);
  v35 = v9;
  v36 = *((_OWORD *)a2 + 28);
  v10 = *((_OWORD *)a2 + 23);
  v30 = *((_OWORD *)a2 + 22);
  v31 = v10;
  v11 = *((_OWORD *)a2 + 25);
  v32 = *((_OWORD *)a2 + 24);
  v33 = v11;
  FLSimpleSpringStep((uint64_t)&v30, (uint64_t)&v37, a3);
  v12 = v42;
  *((_OWORD *)a2 + 26) = v41;
  *((_OWORD *)a2 + 27) = v12;
  *((_OWORD *)a2 + 28) = v43;
  v13 = v38;
  *((_OWORD *)a2 + 22) = v37;
  *((_OWORD *)a2 + 23) = v13;
  v14 = v40;
  *((_OWORD *)a2 + 24) = v39;
  *((_OWORD *)a2 + 25) = v14;
  v15 = *((_OWORD *)a2 + 34);
  v34 = *((_OWORD *)a2 + 33);
  v35 = v15;
  v36 = *((_OWORD *)a2 + 35);
  v16 = *((_OWORD *)a2 + 30);
  v30 = *((_OWORD *)a2 + 29);
  v31 = v16;
  v17 = *((_OWORD *)a2 + 32);
  v32 = *((_OWORD *)a2 + 31);
  v33 = v17;
  FLSimpleSpringStep((uint64_t)&v30, (uint64_t)&v37, a3);
  v18 = v42;
  *((_OWORD *)a2 + 33) = v41;
  *((_OWORD *)a2 + 34) = v18;
  *((_OWORD *)a2 + 35) = v43;
  v19 = v38;
  *((_OWORD *)a2 + 29) = v37;
  *((_OWORD *)a2 + 30) = v19;
  v20 = v40;
  *((_OWORD *)a2 + 31) = v39;
  *((_OWORD *)a2 + 32) = v20;
  v21 = *((_QWORD *)__src + 72);
  *((_QWORD *)a2 + 72) = v21;
  v22 = *((_QWORD *)__src + 73);
  *((_QWORD *)a2 + 73) = v22;
  *(double *)&v20 = *a2;
  *(double *)&v19 = a2[1];
  v23 = a2[30];
  v24 = a2[44];
  v25 = a2[50];
  v26 = a2[51];
  v27 = a2[58];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  FLSimpleSpringMakeWithDampingRatioResponse((uint64_t)&v37, *(double *)&v20, *(double *)&v19, v27, v23, v24, v25, v26);
  *(_QWORD *)&v40 = v21;
  *((_QWORD *)&v40 + 1) = v22;
  v29[4] = v41;
  v29[5] = v42;
  v29[6] = v43;
  v29[0] = v37;
  v29[1] = v38;
  v29[2] = v39;
  v29[3] = v40;
  FLSimpleSpringStep((uint64_t)v29, (uint64_t)&v30, a3);
  result = *(double *)&v30;
  *(_OWORD *)a2 = v30;
  return result;
}

BOOL FLCompoundSpringIsStable(uint64_t a1)
{
  double v2;
  double v3;
  __int128 *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 result;
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
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v2 = *(double *)a1;
  v3 = *(double *)(a1 + 8);
  v4 = (__int128 *)(a1 + 240);
  v5 = *(double *)(a1 + 240);
  v6 = *(double *)(a1 + 352);
  v7 = *(double *)(a1 + 400);
  v8 = *(double *)(a1 + 408);
  v9 = *(double *)(a1 + 464);
  v10 = *(_QWORD *)(a1 + 576);
  v11 = *(_QWORD *)(a1 + 584);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  FLSimpleSpringMakeWithDampingRatioResponse((uint64_t)&v29, v2, v3, v9, v5, v6, v7, v8);
  *(_QWORD *)&v32 = v10;
  *((_QWORD *)&v32 + 1) = v11;
  v26 = v33;
  v27 = v34;
  v28 = v35;
  v22 = v29;
  v23 = v30;
  v24 = v31;
  v25 = v32;
  result = FLSimpleSpringIsStable((double *)&v22);
  if (result)
  {
    v13 = *(_OWORD *)(a1 + 544);
    v26 = *(_OWORD *)(a1 + 528);
    v27 = v13;
    v28 = *(_OWORD *)(a1 + 560);
    v14 = *(_OWORD *)(a1 + 480);
    v22 = *(_OWORD *)(a1 + 464);
    v23 = v14;
    v15 = *(_OWORD *)(a1 + 512);
    v24 = *(_OWORD *)(a1 + 496);
    v25 = v15;
    result = FLSimpleSpringIsStable((double *)&v22);
    if (result)
    {
      v16 = v4[5];
      v26 = v4[4];
      v27 = v16;
      v28 = v4[6];
      v17 = v4[1];
      v22 = *v4;
      v23 = v17;
      v18 = v4[3];
      v24 = v4[2];
      v25 = v18;
      result = FLSimpleSpringIsStable((double *)&v22);
      if (result)
      {
        v19 = *(_OWORD *)(a1 + 432);
        v26 = *(_OWORD *)(a1 + 416);
        v27 = v19;
        v28 = *(_OWORD *)(a1 + 448);
        v20 = *(_OWORD *)(a1 + 368);
        v22 = *(_OWORD *)(a1 + 352);
        v23 = v20;
        v21 = *(_OWORD *)(a1 + 400);
        v24 = *(_OWORD *)(a1 + 384);
        v25 = v21;
        return FLSimpleSpringIsStable((double *)&v22);
      }
    }
  }
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cosh(long double __x)
{
  long double result;

  MEMORY[0x24BDADBF0](__x);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE28](__x);
  return result;
}

