_DWORD *SGSplineVector_new(int a1)
{
  _DWORD *v2;

  v2 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  *(_QWORD *)v2 = malloc_type_malloc(8 * a1, 0x100004000313F17uLL);
  v2[2] = a1;
  return v2;
}

void SGSplineVector_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

_QWORD *SGSplineMatrix_new(int a1)
{
  _QWORD *v2;

  v2 = malloc_type_malloc(0x18uLL, 0x1080040622C3295uLL);
  *v2 = malloc_type_malloc(8 * (a1 * a1), 0x100004000313F17uLL);
  v2[1] = malloc_type_malloc(4 * (a1 * a1), 0x100004052888210uLL);
  *((_DWORD *)v2 + 4) = a1;
  return v2;
}

void SGSplineMatrix_destroy(void **a1)
{
  void *v2;
  void *v3;

  v2 = *a1;
  if (v2)
    free(v2);
  v3 = a1[1];
  if (v3)
    free(v3);
  free(a1);
}

void SGSplineVector_zero(uint64_t a1)
{
  bzero(*(void **)a1, 8 * *(int *)(a1 + 8));
}

void SGSplineMatrix_zero(uint64_t a1)
{
  bzero(*(void **)a1, 8 * (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 16)));
}

void SGSplineMatrix_convert_to_single_precision(uint64_t a1)
{
  vDSP_vdpsp(*(const double **)a1, 1, *(float **)(a1 + 8), 1, (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 16)));
}

void SGSplineMatrix_discard_double_precision(void **a1)
{
  free(*a1);
  *a1 = 0;
}

uint64_t SGSplineMatrix_set(uint64_t result, int a2, int a3, double a4)
{
  *(double *)(*(_QWORD *)result + 8 * (a2 + *(_DWORD *)(result + 16) * a3)) = a4;
  return result;
}

double SGSplineMatrix_get(uint64_t a1, int a2, int a3)
{
  return *(double *)(*(_QWORD *)a1 + 8 * (a2 + *(_DWORD *)(a1 + 16) * a3));
}

uint64_t SGSplineVector_print(uint64_t a1)
{
  uint64_t v2;

  putchar(123);
  if (*(int *)(a1 + 8) >= 1)
  {
    v2 = 0;
    do
    {
      printf(" (%lf, %lf) ", COERCE_FLOAT(*(_QWORD *)(*(_QWORD *)a1 + 8 * v2)), COERCE_FLOAT(HIDWORD(*(_QWORD *)(*(_QWORD *)a1 + 8 * v2))));
      ++v2;
    }
    while (v2 < *(int *)(a1 + 8));
  }
  return puts("}\r");
}

uint64_t SGSplineMatrix_print(uint64_t a1)
{
  int v2;
  unint64_t v3;

  putchar(123);
  v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    v3 = 0;
    do
    {
      if (!((int)v3 % v2))
        puts("\r");
      printf(" %.3e ", *(double *)(*(_QWORD *)a1 + 8 * v3++));
      v2 = *(_DWORD *)(a1 + 16);
    }
    while (v3 < (v2 * v2));
  }
  return puts("}\r");
}

uint64_t SGSplineMatrix_times_SGSplineVector_float(uint64_t result, _QWORD *a2, _QWORD *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float32x2_t v7;
  int v8;
  uint64_t v9;

  v3 = *(_DWORD *)(result + 16);
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = *(_QWORD *)(result + 8);
    do
    {
      if (v3 < 1)
      {
        v9 = v3;
      }
      else
      {
        v6 = 0;
        v7 = *(float32x2_t *)(*a2 + 8 * v4);
        do
        {
          *(float32x2_t *)(*a3 + 8 * v6) = vmla_n_f32(*(float32x2_t *)(*a3 + 8 * v6), v7, *(float *)(v5 + 4 * v6));
          ++v6;
          v8 = *(_DWORD *)(result + 16);
        }
        while (v6 < v8);
        v9 = v8;
        v3 = *(_DWORD *)(result + 16);
      }
      v5 += 4 * v9;
      ++v4;
    }
    while (v4 < v9);
  }
  return result;
}

_QWORD *SGSplineMatrixInversionWorkspace_new(int a1)
{
  _QWORD *v2;

  v2 = malloc_type_malloc(0x10uLL, 0x900405DDA6445uLL);
  *v2 = malloc_type_malloc(4 * a1, 0x100004052888210uLL);
  v2[1] = malloc_type_malloc(8 * a1, 0x100004000313F17uLL);
  return v2;
}

void SGSplineMatrixInversionWorkspace_destroy(void **a1)
{
  free(*a1);
  free(a1[1]);
  free(a1);
}

uint64_t SGSplineMatrix_invert(uint64_t a1, uint64_t a2)
{
  __CLPK_integer *v3;
  __CLPK_doublereal *v4;
  uint64_t result;
  __CLPK_integer __lda;
  __CLPK_integer __info;

  __lda = *(_DWORD *)(a1 + 16);
  __info = 0;
  v3 = *(__CLPK_integer **)a2;
  v4 = *(__CLPK_doublereal **)(a2 + 8);
  dgetrf_(&__lda, &__lda, *(__CLPK_doublereal **)a1, &__lda, *(__CLPK_integer **)a2, &__info);
  result = __info;
  if (!__info)
  {
    dgetri_(&__lda, *(__CLPK_doublereal **)a1, &__lda, v3, v4, &__lda, &__info);
    return __info;
  }
  return result;
}

double SGFindCubicBezierCoordinate(double a1, double a2, double a3, double a4, double a5)
{
  return (1.0 - a1) * ((1.0 - a1) * (a3 * 3.0)) * a1
       + (1.0 - a1) * ((1.0 - a1) * a2) * (1.0 - a1)
       + (1.0 - a1) * (a4 * 3.0) * a1 * a1
       + a1 * a5 * a1 * a1;
}

id SGInterpolateBetweenBezierPaths(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  unint64_t i;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  unint64_t v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v37 = v4;
LABEL_24:
    v38 = v37;
    goto LABEL_44;
  }
  if (!v4)
  {
    v37 = v3;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v3);
  CGPathApply((CGPathRef)objc_msgSend(v8, "CGPath"), v7, (CGPathApplierFunction)SGBuildPathElement);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v5);
  CGPathApply((CGPathRef)objc_msgSend(v10, "CGPath"), v9, (CGPathApplierFunction)SGBuildPathElement);
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = objc_msgSend(v7, "count");
      v12 = objc_msgSend(v9, "count");
      if (v11 >= v12)
        v13 = v12;
      else
        v13 = v11;
      if (v13)
      {
        v14 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "type");
          if (v17 == objc_msgSend(v16, "type"))
          {
            switch(objc_msgSend(v15, "type"))
            {
              case 0u:
                objc_msgSend(v15, "endPoint");
                objc_msgSend(v16, "endPoint");
                CLKInterpolateBetweenPoints();
                objc_msgSend(v6, "moveToPoint:");
                break;
              case 1u:
                goto LABEL_13;
              case 2u:
                objc_msgSend(v15, "endPoint");
                objc_msgSend(v16, "endPoint");
                CLKInterpolateBetweenPoints();
                v22 = v21;
                v24 = v23;
                objc_msgSend(v15, "points");
                objc_msgSend(v16, "points");
                CLKInterpolateBetweenPoints();
                objc_msgSend(v6, "addQuadCurveToPoint:controlPoint:", v22, v24, v25, v26);
                break;
              case 3u:
                objc_msgSend(v15, "endPoint");
                objc_msgSend(v16, "endPoint");
                CLKInterpolateBetweenPoints();
                v28 = v27;
                v30 = v29;
                objc_msgSend(v15, "points");
                objc_msgSend(v16, "points");
                CLKInterpolateBetweenPoints();
                v32 = v31;
                v34 = v33;
                objc_msgSend(v15, "points");
                objc_msgSend(v16, "points");
                CLKInterpolateBetweenPoints();
                objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", v28, v30, v32, v34, v35, v36);
                break;
              case 4u:
                objc_msgSend(v6, "closePath");
                break;
              default:
                break;
            }
          }
          else
          {
LABEL_13:
            objc_msgSend(v15, "endPoint");
            objc_msgSend(v16, "endPoint");
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addLineToPoint:");
          }

          ++v14;
          v18 = objc_msgSend(v7, "count");
          v19 = objc_msgSend(v9, "count");
          if (v18 >= v19)
            v20 = v19;
          else
            v20 = v18;
        }
        while (v14 < v20);
      }
      for (i = objc_msgSend(v7, "count"); i < objc_msgSend(v9, "count"); ++i)
      {
        objc_msgSend(v7, "lastObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", i);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v41, "type"))
        {
          case 0u:
            objc_msgSend(v40, "endPoint");
            objc_msgSend(v41, "endPoint");
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "moveToPoint:");
            break;
          case 1u:
            objc_msgSend(v40, "endPoint");
            objc_msgSend(v41, "endPoint");
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addLineToPoint:");
            break;
          case 2u:
            objc_msgSend(v40, "endPoint");
            objc_msgSend(v41, "endPoint");
            CLKInterpolateBetweenPoints();
            v43 = v42;
            v45 = v44;
            objc_msgSend(v40, "endPoint");
            objc_msgSend(v41, "points");
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addQuadCurveToPoint:controlPoint:", v43, v45, v46, v47);
            break;
          case 3u:
            objc_msgSend(v40, "endPoint");
            objc_msgSend(v41, "endPoint");
            CLKInterpolateBetweenPoints();
            v49 = v48;
            v51 = v50;
            objc_msgSend(v40, "endPoint");
            objc_msgSend(v41, "points");
            CLKInterpolateBetweenPoints();
            v53 = v52;
            v55 = v54;
            objc_msgSend(v40, "endPoint");
            objc_msgSend(v41, "points");
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", v49, v51, v53, v55, v56, v57);
            break;
          case 4u:
            objc_msgSend(v6, "closePath");
            break;
          default:
            break;
        }

      }
      v58 = objc_msgSend(v9, "count");
      v10 = v6;
      if (v58 < objc_msgSend(v7, "count"))
      {
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastObject");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          switch(objc_msgSend(v60, "type"))
          {
            case 0u:
              objc_msgSend(v59, "endPoint");
              objc_msgSend(v60, "endPoint");
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "moveToPoint:");
              break;
            case 1u:
              objc_msgSend(v59, "endPoint");
              objc_msgSend(v60, "endPoint");
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "addLineToPoint:");
              break;
            case 2u:
              objc_msgSend(v59, "endPoint");
              objc_msgSend(v60, "endPoint");
              CLKInterpolateBetweenPoints();
              v62 = v61;
              v64 = v63;
              objc_msgSend(v59, "points");
              objc_msgSend(v60, "endPoint");
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "addQuadCurveToPoint:controlPoint:", v62, v64, v65, v66);
              break;
            case 3u:
              objc_msgSend(v59, "endPoint");
              objc_msgSend(v60, "endPoint");
              CLKInterpolateBetweenPoints();
              v68 = v67;
              v70 = v69;
              objc_msgSend(v59, "points");
              objc_msgSend(v60, "endPoint");
              CLKInterpolateBetweenPoints();
              v72 = v71;
              v74 = v73;
              objc_msgSend(v59, "points");
              objc_msgSend(v60, "endPoint");
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", v68, v70, v72, v74, v75, v76);
              break;
            case 4u:
              objc_msgSend(v6, "closePath");
              break;
            default:
              break;
          }

          ++v58;
        }
        while (v58 < objc_msgSend(v7, "count"));
        v10 = v6;
      }
    }
    else
    {
      v10 = v8;
    }
  }
  v38 = v10;

LABEL_44:
  return v38;
}

double SGFindCubicBezierPoint(double a1, float64x2_t a2, float64_t a3, float64x2_t a4, float64_t a5, float64x2_t a6, float64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, float64x2_t a16)
{
  double result;

  a2.f64[1] = a3;
  a4.f64[1] = a5;
  __asm { FMOV            V4.2D, #3.0 }
  a6.f64[1] = a7;
  *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(a4, _Q4), 1.0 - a1), 1.0 - a1), a1), vmulq_n_f64(vmulq_n_f64(a2, 1.0 - a1), 1.0 - a1), 1.0 - a1), vmulq_n_f64(vmulq_n_f64(vmulq_f64(a6, _Q4), 1.0 - a1), a1), a1), vmulq_n_f64(vmulq_n_f64(a16, a1), a1), a1);
  return result;
}

double SGComputeCubicBezierLength(float64x2_t a1, float64_t a2, float64x2_t a3, float64_t a4, float64x2_t a5, float64_t a6, float64x2_t a7, float64_t a8)
{
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  int v17;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;

  a3.f64[1] = a4;
  __asm { FMOV            V3.2D, #3.0 }
  a5.f64[1] = a6;
  v13 = vmulq_f64(a3, _Q3);
  v14 = vmulq_f64(a5, _Q3);
  a7.f64[1] = a8;
  a1.f64[1] = a2;
  v15 = 0uLL;
  v16 = 0.0;
  v17 = 11;
  v18 = 0.0;
  do
  {
    v19 = 1.0 - v18 / 10.0;
    v20 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(v13, v19), v19), v18 / 10.0), vmulq_n_f64(vmulq_n_f64(a1, v19), v19), v19), vmulq_n_f64(vmulq_n_f64(v14, v19), v18 / 10.0), v18 / 10.0), vmulq_n_f64(vmulq_n_f64(a7, v18 / 10.0), v18 / 10.0), v18 / 10.0);
    if (v17 != 11)
    {
      v21 = vsubq_f64(v20, v15);
      v16 = v16 + sqrt(vmlad_n_f64(COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v21, v21).f64[1]), v21.f64[0], v21.f64[0]));
    }
    v18 = v18 + 1.0;
    v15 = v20;
    --v17;
  }
  while (v17);
  return v16;
}

double SGComputeCubicBezierYForX(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v17 = vabdd_f64(a9, a2) * 10.0;
  if (v17 < 10.0)
    v17 = 10.0;
  v18 = (int)v17;
  if ((int)v17 < 0)
    return 0.0;
  v19 = 0;
  v20 = (double)v18;
  v21 = a4 * 3.0;
  v22 = a6 * 3.0;
  v23 = a5 * 3.0;
  v24 = a7 * 3.0;
  v25 = v18 + 1;
  v26 = 0.0;
  v27 = 1.79769313e308;
  do
  {
    v28 = (double)v19 / v20;
    v29 = vabdd_f64(v28 * ((1.0 - v28) * (v21 * (1.0 - v28)))+ (1.0 - v28) * (a2 * (1.0 - v28)) * (1.0 - v28)+ v28 * (v22 * (1.0 - v28)) * v28+ v28 * (a9 * v28) * v28, a1);
    if (v29 < v27)
    {
      v26 = v28 * ((1.0 - v28) * (v23 * (1.0 - v28)))
          + (1.0 - v28) * (a3 * (1.0 - v28)) * (1.0 - v28)
          + v28 * (v24 * (1.0 - v28)) * v28
          + v28 * (a10 * v28) * v28;
      v27 = v29;
    }
    ++v19;
  }
  while (v25 != v19);
  return v26;
}

double SGComputeRectAroundCircle(double a1, double a2, double a3)
{
  return a1 - a3;
}

double SGScreenRadiusAtAngleWithInset(void *a1, double a2, double a3)
{
  id v5;
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  double v21;
  __double2 v22;
  long double v23;
  long double v24;
  double v25;
  double v26;
  double v28;
  double v30;

  v5 = a1;
  v6 = a2;
  v7 = fmodf(v6, 6.2832);
  v8 = v7;
  if (v7 < 0.0)
  {
    do
      v8 = v8 + 6.28318531;
    while (v8 < 0.0);
  }
  v9 = 1.57079633;
  if (v8 >= 1.57079633)
  {
    v10 = 3.14159265;
    if (v8 >= 3.14159265)
    {
      if (v8 < 4.71238898)
      {
        v8 = v8 + -3.14159265;
        goto LABEL_9;
      }
      v10 = 6.28318531;
    }
    v8 = v10 - v8;
  }
LABEL_9:
  objc_msgSend(v5, "screenBounds");
  v12 = v11 + a3 * -2.0;
  objc_msgSend(v5, "screenBounds");
  v14 = v13 + a3 * -2.0;
  objc_msgSend(v5, "screenCornerRadius");
  v16 = fmax((v15 - a3) * 1.52866, 0.0);
  v17 = v14 * 0.5;
  if (atan2(-(v16 - v12 * 0.5), v14 * 0.5) >= v8)
  {
    v18 = v17 * tan(v8);
LABEL_13:
    v19 = v18 * v18 + v17 * v17;
    goto LABEL_25;
  }
  v18 = v12 * 0.5;
  if (atan2(v18, v14 * 0.5 - v16) < v8)
  {
    v17 = v18 / tan(v8);
    goto LABEL_13;
  }
  v20 = 0;
  v30 = v18 - v16;
  v21 = 0.0;
  do
  {
    v22 = __sincos_stret((v21 + v9) * 0.5);
    v23 = v17 - v16 + v16 * pow(v22.__cosval, 0.622409222);
    v24 = v30 + v16 * pow(v22.__sinval, 0.622409222);
    v25 = v8 - atan2(v24, v23);
    if (v25 > 0.0)
      v26 = (v21 + v9) * 0.5;
    else
      v26 = v21;
    if (v25 < 0.0)
      v9 = (v21 + v9) * 0.5;
    else
      v21 = v26;
    if (fabs(v25) <= 0.01)
      break;
  }
  while (v20++ < 0x63);
  v19 = v24 * v24 + v23 * v23;
LABEL_25:
  v28 = sqrt(v19);

  return v28;
}

void SGBuildPathElement(void *a1, uint64_t a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SGBezierPathElement *v8;
  id v9;

  v9 = a1;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endPoint");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v8 = -[SGBezierPathElement initWithStartPoint:pathElement:]([SGBezierPathElement alloc], "initWithStartPoint:pathElement:", a2, v5, v7);
  objc_msgSend(v9, "addObject:", v8);

}

SGColorCurveElement *_elementWithColorAtAltitude(double a1, double a2, double a3, double a4)
{
  void *v5;
  SGColorCurveElement *v6;
  double v7;
  SGColorCurveElement *v8;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithHue:saturation:brightness:alpha:", a1 / 360.0, a2 / 100.0, a3 / 100.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SGColorCurveElement alloc];
  *(float *)&v7 = a4;
  v8 = -[SGColorCurveElement initWithColor:fraction:](v6, "initWithColor:fraction:", v5, v7);

  return v8;
}

SGCubicColorCurveElement *SGCubicColorCurveElementCreate(double a1)
{
  SGCubicColorCurveElement *v2;

  v2 = objc_alloc_init(SGCubicColorCurveElement);
  -[SGCubicColorCurveElement setFraction:](v2, "setFraction:", a1);
  __asm { FMOV            V0.4S, #1.0 }
  CLKUIConvertToRGBfFromXRSRGBf();
  -[SGCubicColorCurveElement setColor:](v2, "setColor:");
  return v2;
}

_QWORD *generateOpenSplineMatrix(int a1)
{
  _QWORD *v2;
  int v3;

  v2 = SGSplineMatrix_new(a1);
  SGSplineMatrix_zero((uint64_t)v2);
  if (a1 >= 3)
  {
    v3 = 1;
    do
    {
      SGSplineMatrix_set((uint64_t)v2, v3, v3 - 1, 1.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3, 4.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3 + 1, 1.0);
      ++v3;
    }
    while (v3 != a1 - 1);
  }
  SGSplineMatrix_set((uint64_t)v2, 0, 0, 2.0);
  SGSplineMatrix_set((uint64_t)v2, 0, 1, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 2, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 1, 2.0);
  return v2;
}

_QWORD *generateClosedSplineMatrix(int a1)
{
  _QWORD *v2;
  int v3;

  v2 = SGSplineMatrix_new(a1);
  SGSplineMatrix_zero((uint64_t)v2);
  if (a1 >= 3)
  {
    v3 = 1;
    do
    {
      SGSplineMatrix_set((uint64_t)v2, v3, v3 - 1, 1.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3, 4.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3 + 1, 1.0);
      ++v3;
    }
    while (v3 != a1 - 1);
  }
  SGSplineMatrix_set((uint64_t)v2, 0, 0, 4.0);
  SGSplineMatrix_set((uint64_t)v2, 0, 1, 1.0);
  SGSplineMatrix_set((uint64_t)v2, 0, a1 - 1, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, 0, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 2, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 1, 4.0);
  return v2;
}

float32x2_t computeCubic(float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, double a6, double a7)
{
  float32x2_t v7;
  float32x2_t v13;
  float32x2_t v14;

  *(float *)&a7 = *(float *)&a6 * *(float *)&a6;
  v7 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
  if (a1)
  {
    __asm { FMOV            V7.2S, #3.0 }
    v13 = vmul_f32(a5, _D7);
    v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0);
    *a1 = vmla_n_f32(vmla_n_f32(a3, vadd_f32(a4, a4), *(float *)&a6), v13, *(float *)&a7);
  }
  else
  {
    v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0);
  }
  return vmla_n_f32(vmla_f32(vmla_f32(a2, a3, v7), a4, v14), a5, *(float *)&a7 * *(float *)&a6);
}

id SGStartOfDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startOfDayForDate:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id SGStartOfNextDayForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDBCE48];
    v2 = a1;
    objc_msgSend(v1, "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "startOfDayForDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

double SGPercentageOfDayDoneForDateWithStartAndEnd(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  v9 = 0.0;
  if (v5)
  {
    if (v6)
    {
      if (v7)
      {
        objc_msgSend(v6, "timeIntervalSinceReferenceDate");
        v11 = v10;
        objc_msgSend(v8, "timeIntervalSinceReferenceDate");
        v13 = v12;
        objc_msgSend(v5, "timeIntervalSinceReferenceDate");
        if (v13 - v11 > 0.0)
          v9 = (v14 - v11) / (v13 - v11);
      }
    }
  }

  return v9;
}

double SGSiderealDegreesToSolarDayProgress(double a1)
{
  double result;

  result = a1 / 360.0;
  if (result < 0.0)
    return result + 1.0;
  return result;
}

uint64_t SGSunriseAltitudeToSolarDayPercentage()
{
  return CLKMapFractionIntoRange();
}

uint64_t SGSunsetAltitudeToSolarDayPercentage()
{
  return CLKMapFractionIntoRange();
}

double SGPointOnCircle(double a1, double a2, double a3, double a4)
{
  float v5;

  v5 = a4;
  return a2 + a1 * __sincosf_stret(v5).__cosval;
}

id SGCircleSectorPath(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  void *v12;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "moveToPoint:", a2, a3);
  objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", a1, a2, a3, a4, a5, a6);
  objc_msgSend(v12, "closePath");
  return v12;
}

uint64_t SolarGradient.colors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SolarGradient.colors.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SolarGradient.colors.modify())()
{
  return nullsub_1;
}

void SolarGradient.gradient.getter()
{
  swift_bridgeObjectRetain();
  JUMPOUT(0x2494E93C4);
}

uint64_t SolarGradient.init(date:location:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedPalette);
  v7 = (void *)sub_242974EAC();
  v8 = objc_msgSend(v6, sel_getSolarColorsForLocation_atDate_, a2, v7);

  sub_242974E60();
  v9 = sub_242974EDC();

  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_3;
LABEL_11:

    v14 = MEMORY[0x24BEE4AF8];
LABEL_12:
    v15 = sub_242974EB8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
    result = swift_bridgeObjectRelease();
    *a3 = v14;
    return result;
  }
  swift_bridgeObjectRetain();
  v10 = sub_242974F30();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_11;
LABEL_3:
  v16 = MEMORY[0x24BEE4AF8];
  result = sub_242974F0C();
  if ((v10 & 0x8000000000000000) == 0)
  {
    v12 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x2494E93DC](v12, v9);
      else
        v13 = *(id *)(v9 + 8 * v12 + 32);
      ++v12;
      MEMORY[0x2494E93B8](v13);
      sub_242974EF4();
      sub_242974F18();
      sub_242974F24();
      sub_242974F00();
    }
    while (v10 != v12);
    v14 = v16;

    goto LABEL_12;
  }
  __break(1u);
  return result;
}

unint64_t sub_242974E60()
{
  unint64_t result;

  result = qword_25720A518;
  if (!qword_25720A518)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25720A518);
  }
  return result;
}

ValueMetadata *type metadata accessor for SolarGradient()
{
  return &type metadata for SolarGradient;
}

uint64_t sub_242974EAC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_242974EB8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_242974EC4()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_242974ED0()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_242974EDC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_242974EE8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_242974EF4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_242974F00()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_242974F0C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_242974F18()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_242974F24()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_242974F30()
{
  return MEMORY[0x24BEE3068]();
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

uint64_t CLKInterpolateBetweenPoints()
{
  return MEMORY[0x24BDB8600]();
}

uint64_t CLKMapFractionIntoRange()
{
  return MEMORY[0x24BDB8618]();
}

uint64_t CLKUIConvertToRGBfFromUIColor_fast()
{
  return MEMORY[0x24BE16EC0]();
}

uint64_t CLKUIConvertToRGBfFromXRSRGBf()
{
  return MEMORY[0x24BE16EC8]();
}

uint64_t CLKUIConvertToUIColorFromRGBf_fast()
{
  return MEMORY[0x24BE16ED0]();
}

uint64_t CLKUIConvertToXRSRGBfFromRGBf()
{
  return MEMORY[0x24BE16ED8]();
}

uint64_t CLKUIInterpolateBetweenColors()
{
  return MEMORY[0x24BE16EE8]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x24BEBE120]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D38](__m, __n, __a, __lda, __ipiv, __info);
}

int dgetri_(__CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D48](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

void vDSP_vdpsp(const double *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3360](__A, __IA, __C, __IC, __N);
}

void vDSP_vsbsm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34B8](__A, __IA, __B, __IB, __C, __D, __ID, __N);
}

