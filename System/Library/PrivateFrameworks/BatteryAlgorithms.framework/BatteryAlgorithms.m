_QWORD *ACAMAgingUpdator::ACAMAgingUpdator(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  result[3] = a5;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  result[3] = a5;
  return result;
}

double ACAMAgingUpdator::runOneStep(double **a1, double *a2, double *a3)
{
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  v6 = *a1;
  v7 = **a1;
  v8 = (*a1)[1];
  v10 = a2[5];
  v9 = a2[6];
  a3[5] = (1.0 - v7) * v9;
  a3[6] = v7 * v9;
  a3[7] = (1.0 - v7) * v10;
  a3[8] = v7 * v10;
  ACAMAgingUpdator::updateStoichiometryLimits((ACAMAgingUpdator *)a1, a2[12] * a1[2][1], a2[7] * a1[2][2], a2[13] * a1[2][3], v8, v6[2], 0, a3, a3 + 1, a3 + 2, a3 + 3);
  result = vabdd_f64(a3[3], a3[2]) * (a2[7] * a1[2][2]);
  a3[4] = result;
  return result;
}

uint64_t ACAMAgingUpdator::updateStoichiometryLimits(ACAMAgingUpdator *this, double a2, double a3, double a4, double *a5, double *a6, double *a7, double *a8)
{
  return ACAMAgingUpdator::updateStoichiometryLimits(this, a2, a3, a4, *(double *)(*(_QWORD *)this + 8), *(double *)(*(_QWORD *)this + 16), 0, a5, a6, a7, a8);
}

double ACAMAgingUpdator::updateQmax(ACAMAgingUpdator *this, double a2, double a3, double a4, double *a5)
{
  double result;

  result = vabdd_f64(a3, a2) * a4;
  *a5 = result;
  return result;
}

uint64_t ACAMAgingUpdator::updateStoichiometryLimits(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double a6, char a7, double *a8, double *a9, double *a10, double *a11)
{
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  double *v22;
  double *v23;
  double *v24;
  double *v25;
  double *v26;
  ACAMAgingUpdator *v27;
  unint64_t v28;
  double *v29;
  double *v30;
  unint64_t v31;
  double v32;
  double v33;
  unint64_t v34;
  double v35;
  uint64_t v36;
  __n128 v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  ACAMAgingUpdator *v43;
  uint64_t v47[2];
  BOOL v48;
  double *v49;
  unint64_t v50;

  v19 = *((_QWORD *)this + 1);
  v20 = *(_QWORD *)(v19 + 112);
  v21 = *(_QWORD *)(v19 + 144);
  v22 = (double *)operator new[]();
  v23 = (double *)operator new[]();
  v24 = (double *)operator new[]();
  v43 = this;
  ACAMAgingUpdator::expandOCP(this, a2, a3, a4, v22, v23, v24);
  v25 = (double *)operator new[]();
  v26 = (double *)operator new[]();
  v27 = (ACAMAgingUpdator *)operator new[]();
  v50 = 0;
  ACAMAgingUpdator::mergeSort(v27, v22, v23, v24, v20, v21, v25, v26, (double *)v27, &v50);
  v28 = v50;
  if (v50)
  {
    v29 = (double *)v27;
    v30 = v26;
    v31 = v50;
    do
    {
      v32 = *v30++;
      *v29 = *v29 - v32;
      ++v29;
      --v31;
    }
    while (v31);
  }
  v47[0] = (uint64_t)v27;
  v47[1] = v28;
  v33 = *(double *)v27;
  v49 = v25;
  v34 = v28 - 1;
  v35 = *((double *)v27 + v28 - 1);
  if (v28 <= 1)
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    v33 = *(double *)v27;
    v35 = *((double *)v27 + v34);
  }
  v48 = v33 > v35;
  dataTable<double>::getValue(v47, 1, a5);
  *(_QWORD *)a8 = v36;
  dataTable<double>::getValue(v47, 1, a6);
  *a9 = v37.n128_f64[0];
  *a10 = (a4 - a2 * *a8) / a3;
  *a11 = (a4 - a2 * *a9) / a3;
  v37.n128_u64[0] = 0;
  if (*a8 < 0.0 || (v37.n128_u64[0] = 1.0, *a8 > 1.0))
    *a8 = v37.n128_f64[0];
  v38 = 0.0;
  if (*a9 < 0.0 || (v38 = 1.0, *a9 > 1.0))
    *a9 = v38;
  v39 = 0.0;
  if (*a10 < 0.0 || (v39 = 1.0, *a10 > 1.0))
    *a10 = v39;
  v37.n128_f64[0] = *a11;
  v40 = 0.0;
  if (*a11 < 0.0 || (v40 = 1.0, v37.n128_f64[0] > 1.0))
  {
    *a11 = v40;
    v37.n128_f64[0] = v40;
  }
  if ((a7 & 1) == 0)
  {
    v41 = *((_QWORD *)v43 + 3);
    if (*a8 >= *a9)
    {
      *a8 = *a9 - *(double *)(v41 + 416);
      v37.n128_f64[0] = *a11;
    }
    if (v37.n128_f64[0] >= *a10)
    {
      v37.n128_f64[0] = *a10 - *(double *)(v41 + 416);
      *a11 = v37.n128_f64[0];
    }
  }
  MEMORY[0x23B8057BC](v22, 0x1000C8000313F17, v37);
  MEMORY[0x23B8057BC](v23, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](v24, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](v25, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](v26, 0x1000C8000313F17);
  return MEMORY[0x23B8057BC](v27, 0x1000C8000313F17);
}

uint64_t ACAMAgingUpdator::expandOCP(ACAMAgingUpdator *this, double a2, double a3, double a4, double *a5, double *a6, double *a7)
{
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  double *v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  double *v20;
  const void *v21;
  uint64_t result;
  double v23;
  double *v24;
  double *v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  _OWORD v31[2];
  _OWORD v32[2];

  v13 = *((_QWORD *)this + 1);
  v14 = *(_OWORD *)(v13 + 120);
  v32[0] = *(_OWORD *)(v13 + 104);
  v32[1] = v14;
  v15 = *(_OWORD *)(v13 + 152);
  v31[0] = *(_OWORD *)(v13 + 136);
  v31[1] = v15;
  v17 = *((_QWORD *)&v32[0] + 1);
  v16 = *(double **)&v32[0];
  v18 = (const void *)*((_QWORD *)&v14 + 1);
  v19 = *((_QWORD *)&v31[0] + 1);
  v20 = *(double **)&v31[0];
  v21 = (const void *)*((_QWORD *)&v15 + 1);
  memcpy(a5, *(const void **)&v32[0], 8 * *((_QWORD *)&v32[0] + 1));
  memcpy(a6, v18, 8 * *((_QWORD *)&v32[0] + 1));
  result = (uint64_t)memcpy(&a7[*((_QWORD *)&v32[0] + 1)], v21, 8 * *((_QWORD *)&v31[0] + 1));
  if (*((_QWORD *)&v31[0] + 1))
  {
    v23 = -a3;
    v24 = &a6[*((_QWORD *)&v32[0] + 1)];
    v25 = &a5[*((_QWORD *)&v32[0] + 1)];
    do
    {
      v26 = *v20++;
      result = dataTable<double>::getValue((uint64_t *)v32, 1, (a4 + v23 * v26) / a2);
      *v25++ = (a4 + v23 * v26) / a2;
      *(_QWORD *)v24++ = v27;
      --v19;
    }
    while (v19);
  }
  if (v17)
  {
    v28 = -a2;
    do
    {
      v29 = *v16++;
      result = dataTable<double>::getValue((uint64_t *)v31, 1, (a4 + v28 * v29) / a3);
      *(_QWORD *)a7++ = v30;
      --v17;
    }
    while (v17);
  }
  return result;
}

void ACAMAgingUpdator::mergeSort(ACAMAgingUpdator *this, const double *a2, const double *a3, const double *a4, unint64_t a5, uint64_t a6, double *a7, double *a8, double *a9, unint64_t *a10)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v21;
  double *v22;
  double *v23;
  double *v24;
  double *v25;
  unint64_t v26;
  double *v27;
  double *v28;

  v10 = 0;
  v11 = a6 + a5;
  v12 = a5;
  v13 = 0;
  if (a5 && v11 > a5)
  {
    v13 = 0;
    v10 = 0;
    v12 = a5;
    do
    {
      v14 = a2[v13];
      v15 = a2[v12];
      v16 = v15 + -0.0000001;
      v17 = v15 + 0.0000001;
      if (v15 <= v14 && (v16 <= v14 ? (v18 = v17 < v14) : (v18 = 1), v18))
      {
        a7[v10] = v14;
        a8[v10] = a3[v13];
        a9[v10] = a4[v13];
        v19 = 1;
      }
      else
      {
        a7[v10] = v15;
        a8[v10] = a3[v12];
        a9[v10] = a4[v12++];
        v19 = v17 >= v14 && v16 <= v14;
      }
      v13 += v19;
      ++v10;
    }
    while (v13 < a5 && v12 < v11);
  }
  *a10 = v10;
  v21 = a5 - v13;
  if (a5 > v13)
  {
    v22 = (double *)&a4[v13];
    v23 = (double *)&a3[v13];
    v24 = (double *)&a2[v13];
    do
    {
      if (a7[v10 - 1] > *v24)
      {
        a7[v10] = *v24;
        a8[v10] = *v23;
        a9[v10++] = *v22;
        *a10 = v10;
      }
      ++v22;
      ++v23;
      ++v24;
      --v21;
    }
    while (v21);
  }
  if (v12 < v11)
  {
    v25 = (double *)&a4[v12];
    v26 = a6 + a5 - v12;
    v27 = (double *)&a3[v12];
    v28 = (double *)&a2[v12];
    do
    {
      if (a7[v10 - 1] > *v28)
      {
        a7[v10] = *v28;
        a8[v10] = *v27;
        a9[v10++] = *v25;
        *a10 = v10;
      }
      ++v25;
      ++v27;
      ++v28;
      --v26;
    }
    while (v26);
  }
}

unint64_t dataTable<double>::getValue(uint64_t *a1, char a2, double a3)
{
  unint64_t result;
  unint64_t v6;
  uint64_t v7;

  result = sortedUniqueArray<double>::getIdx(a1, -1, -1, a3);
  v6 = a1[1] - 1;
  if ((a2 & 1) != 0)
  {
    if (result <= 1)
      v7 = 1;
    else
      v7 = result;
    if (result <= v6)
      result = v7;
    else
      result = a1[1] - 1;
    goto LABEL_10;
  }
  if (result <= v6 && result)
  {
LABEL_10:
    if (*(double *)(*a1 + 8 * result) == *(double *)(*a1 + 8 * result - 8))
      return puts("dataTable<T>::interpolate: Division by zero");
  }
  return result;
}

uint64_t ACAMAgingUpdator::getOCV(ACAMAgingUpdator *this, double a2, double a3, double a4, double *a5, uint64_t a6, double *a7)
{
  _QWORD *v13;
  double *v14;
  unint64_t v15;
  double *v16;
  unint64_t v17;
  const double *v18;
  double *v19;
  unint64_t v20;
  double v21;
  double *v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  char *v27;
  unint64_t v28;
  double *v29;
  double v30;
  uint64_t v31;
  double *v32;
  double v33;
  double v34;
  const double *v35;
  double *v36;
  unint64_t v37;
  double v38;
  uint64_t v39;
  double *v40;
  double *v41;
  ACAMAgingUpdator *v42;
  unint64_t v43;
  double *v44;
  double *v45;
  unint64_t v46;
  double v47;
  double v48;
  unint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  __n128 v55;
  double v56;
  double *v57;
  double v58;
  void *__src;
  const void *v62;
  const double *v63;
  char *__dst;
  uint64_t v65[2];
  BOOL v66;
  double *v67;
  uint64_t v68[2];
  BOOL v69;
  double *v70;
  unint64_t v71;
  uint64_t v72[2];
  BOOL v73;
  const void *v74;
  uint64_t v75[2];
  BOOL v76;
  void *v77;

  v13 = (_QWORD *)*((_QWORD *)this + 1);
  v14 = (double *)v13[13];
  v15 = v13[14];
  v16 = (double *)v13[17];
  __src = (void *)v13[16];
  v17 = v13[18];
  v62 = (const void *)v13[20];
  v18 = (const double *)operator new[]();
  v63 = (const double *)operator new[]();
  __dst = (char *)operator new[]();
  if (v15)
  {
    v19 = (double *)v18;
    v20 = v15;
    do
    {
      v21 = *v14++;
      *v19++ = (v21 + -0.5) * a2;
      --v20;
    }
    while (v20);
  }
  if (v17)
  {
    v22 = (double *)&v18[v15];
    v23 = v17;
    do
    {
      v24 = *v16++;
      *v22++ = ((a4 + a2 * -0.5) / a3 - v24) * a3;
      --v23;
    }
    while (v23);
  }
  memcpy(__dst, __src, 8 * v15);
  v75[0] = (uint64_t)v18;
  v75[1] = v15;
  v25 = *v18;
  v77 = __src;
  v26 = v18[v15 - 1];
  if (v15 <= 1)
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    v25 = *v18;
    v26 = v18[v15 - 1];
  }
  v76 = v25 > v26;
  if (v17 < v17 + v15)
  {
    v27 = &__dst[8 * v17];
    v28 = v15;
    v29 = (double *)&v18[v17];
    do
    {
      v30 = *v29++;
      dataTable<double>::getValue(v75, 1, v30);
      *(_QWORD *)v27 = v31;
      v27 += 8;
      --v28;
    }
    while (v28);
  }
  v32 = (double *)&v18[v15];
  v72[0] = (uint64_t)v32;
  v72[1] = v17;
  v33 = *v32;
  v74 = v62;
  v34 = v32[v17 - 1];
  if (v17 <= 1)
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    v33 = *v32;
    v34 = v32[v17 - 1];
  }
  v73 = v33 > v34;
  if (v15)
  {
    v35 = v18;
    v36 = (double *)v63;
    v37 = v15;
    do
    {
      v38 = *v35++;
      dataTable<double>::getValue(v72, 1, v38);
      *(_QWORD *)v36++ = v39;
      --v37;
    }
    while (v37);
  }
  memcpy((void *)&v63[v15], v62, 8 * v17);
  v40 = (double *)operator new[]();
  v41 = (double *)operator new[]();
  v42 = (ACAMAgingUpdator *)operator new[]();
  v71 = 0;
  ACAMAgingUpdator::mergeSort(v42, v18, (const double *)__dst, v63, v15, v17, v40, (double *)v42, v41, &v71);
  v43 = v71;
  if (v71)
  {
    v44 = v41;
    v45 = (double *)v42;
    v46 = v71;
    do
    {
      v47 = *v45++;
      *v44 = *v44 - v47;
      ++v44;
      --v46;
    }
    while (v46);
  }
  v68[0] = (uint64_t)v41;
  v68[1] = v43;
  v48 = *v41;
  v70 = v40;
  v49 = v43 - 1;
  v50 = v41[v43 - 1];
  if (v43 <= 1)
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    v48 = *v41;
    v50 = v41[v49];
  }
  v69 = v48 > v50;
  dataTable<double>::getValue(v68, 1, *(double *)(*(_QWORD *)this + 16));
  v52 = v51;
  dataTable<double>::getValue(v68, 1, *(double *)(*(_QWORD *)this + 8));
  v53 = v55.n128_f64[0];
  v54 = vabdd_f64(v52, v55.n128_f64[0]);
  v65[0] = (uint64_t)v40;
  v65[1] = v43;
  v55.n128_f64[0] = *v40;
  v56 = v40[v49];
  v67 = v41;
  if (v43 >= 2)
  {
    v66 = v55.n128_f64[0] > v56;
    v57 = v40;
  }
  else
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    v55.n128_f64[0] = *v40;
    v66 = *v40 > v40[v49];
    v57 = v40;
    if (!v43)
      goto LABEL_27;
  }
  do
  {
    v55.n128_f64[0] = (*v57 - v53) / v54;
    *v57++ = v55.n128_f64[0];
    --v43;
  }
  while (v43);
LABEL_27:
  while (a6)
  {
    v58 = *a5++;
    dataTable<double>::getValue(v65, 1, v58);
    *a7++ = v55.n128_f64[0];
    --a6;
  }
  MEMORY[0x23B8057BC](v18, 0x1000C8000313F17, v55);
  MEMORY[0x23B8057BC](v63, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](__dst, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](v40, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](v41, 0x1000C8000313F17);
  return MEMORY[0x23B8057BC](v42, 0x1000C8000313F17);
}

unint64_t ACAMAgingUpdator::getSOCTop(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double *a6)
{
  unint64_t v8;
  int64x2_t v9;
  uint64x2_t v10;
  int64x2_t v11;
  unint64_t result;
  double v13;
  uint64_t v14[2];
  BOOL v15;
  double *v16;
  double v17[101];
  double v18[102];

  v8 = 0;
  v18[101] = *(double *)MEMORY[0x24BDAC8D0];
  v9 = (int64x2_t)xmmword_236E72A60;
  v10 = (uint64x2_t)vdupq_n_s64(0x65uLL);
  v11 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v10, (uint64x2_t)v9)).u8[0] & 1) != 0)
      v18[v8] = (double)v8 * 0.01;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x65uLL), *(uint64x2_t *)&v9)).i32[1] & 1) != 0)
      v18[v8 + 1] = (double)(v8 + 1) * 0.01;
    v8 += 2;
    v9 = vaddq_s64(v9, v11);
  }
  while (v8 != 102);
  ACAMAgingUpdator::getOCV(this, a2, a3, a4, v18, 101, v17);
  v14[0] = (uint64_t)v17;
  v14[1] = 101;
  v15 = v17[0] > v17[100];
  v16 = v18;
  result = dataTable<double>::getValue(v14, 1, a5);
  if (v13 > 1.0)
    v13 = 1.0;
  if (v13 < 0.0)
    v13 = 0.0;
  *a6 = v13;
  return result;
}

uint64_t ACAMAgingUpdator::getRawNCC(double **this, double a2, double a3, double a4, double a5, double a6, double a7, double *a8)
{
  double *v11;
  double *v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  uint64_t result;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v42;
  double v44;
  double v45;
  double v46;
  double v48;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57[2];
  BOOL v58;
  double *v59;
  uint64_t v60[2];
  BOOL v61;
  double *v62;
  uint64_t v63[2];
  BOOL v64;
  double *v65;
  uint64_t v66[2];
  BOOL v67;
  double *v68;
  uint64_t v69[2];
  BOOL v70;
  double *v71;
  double v72[5];

  v72[4] = *(double *)MEMORY[0x24BDAC8D0];
  v11 = *this;
  v13 = this[2];
  v12 = this[3];
  v14 = (*this)[27];
  v15 = (*this)[20];
  v16 = (*this)[13];
  v45 = (*this)[34];
  v17 = (*this)[21];
  v69[0] = (uint64_t)(*this + 21);
  v69[1] = 3;
  v70 = v17 > v11[23];
  v71 = v11 + 24;
  dataTable<double>::getValueArrhenius(v69, 1, 25.0, 273.15);
  v19 = v18;
  v20 = v11[14];
  v66[0] = (uint64_t)(v11 + 14);
  v66[1] = 3;
  v67 = v20 > v11[16];
  v68 = v11 + 17;
  dataTable<double>::getValueArrhenius(v66, 1, 25.0, 273.15);
  v22 = v21;
  v63[0] = (uint64_t)(v11 + 7);
  v63[1] = 3;
  v64 = v11[7] > v11[9];
  v65 = v11 + 10;
  dataTable<double>::getValueArrhenius(v63, 1, 25.0, 273.15);
  v24 = v23;
  v60[0] = (uint64_t)(v11 + 28);
  v60[1] = 3;
  v61 = v11[28] > v11[30];
  v62 = v11 + 31;
  dataTable<double>::getValueArrhenius(v60, 1, 25.0, 273.15);
  v72[0] = (v14 * a2 + 1.0) * v19;
  v72[1] = v72[0];
  v72[2] = fmin((v15 * a2 + 1.0) * v22, 0.8);
  v72[3] = (v16 * a2 + 1.0) * v24;
  v57[0] = (uint64_t)(v11 + 3);
  v57[1] = 4;
  v25 = v11[3];
  v26 = v11[6];
  v59 = v72;
  v58 = v25 > v26;
  v28 = a7 + v27 * -(v12[50] * *v13) * (v45 * a2 + 1.0);
  v55 = 0.0;
  v56 = 0.0;
  v54 = 0.0;
  v42 = 0.0;
  result = ACAMAgingUpdator::updateStoichiometryLimits((ACAMAgingUpdator *)this, a4, a3, a5, 0.0, v28, 1, &v56, &v55, &v56, &v54);
  v30 = v12[42];
  v31 = v12[45] * *v13;
  if (v30 > v12[48])
  {
    v46 = v55;
    v48 = v54;
    v32 = v12[44];
    v52 = v12[43];
    v42 = 0.0;
    v33 = -1;
    v44 = -v31 / a6;
    do
    {
      if (vabdd_f64(v52, v32) <= v12[46])
        break;
      if ((unint64_t)++v33 >= *((_QWORD *)v12 + 47))
        break;
      getValueNanIfOutOfRange((unint64_t)(this[1] + 17), v31 * v30 / a3 / 3600.0 + v48);
      v35 = v34;
      getValueNanIfOutOfRange((unint64_t)(this[1] + 13), v46 - v31 * v30 / a4 / 3600.0);
      v37 = v36;
      v53 = 0.0;
      ACAMAgingUpdator::getResistance((uint64_t)this, 0, &v53, v44, 25.0, v46 - v31 * v30 / a4 / 3600.0);
      result = dataTable<double>::getValue(v57, 1, v31 * v30 / a3 / 3600.0 + v48);
      v39 = v35 + -v31 * v38 - (v37 + v31 * v53);
      v40 = fabs(v39);
      if (v39 < v32 - v12[49] || v40 == INFINITY)
      {
        v30 = v30 * 0.5;
      }
      else
      {
        if (v39 == v52)
          break;
        v42 = v30 + v42;
        v46 = v46 - v31 * v30 / a4 / 3600.0;
        v48 = v31 * v30 / a3 / 3600.0 + v48;
        v52 = v39;
      }
    }
    while (v30 > v12[48]);
  }
  *a8 = v31 * v42 / 3600.0;
  return result;
}

void dataTable<double>::getValueArrhenius(uint64_t *a1, char a2, double a3, double a4)
{
  unint64_t Idx;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  Idx = sortedUniqueArray<double>::getIdx(a1, -1, -1, a3);
  v9 = a1[1] - 1;
  if ((a2 & 1) != 0)
  {
    if (Idx <= 1)
      v10 = 1;
    else
      v10 = Idx;
    if (Idx <= v9)
      Idx = v10;
    else
      Idx = a1[1] - 1;
  }
  else if (Idx > v9 || !Idx)
  {
    return;
  }
  v11 = 8 * Idx - 8;
  v12 = *(double *)(*a1 + v11);
  v13 = *(double *)(*a1 + 8 * Idx);
  v14 = a1[3];
  v15 = *(double *)(v14 + v11);
  if (v15 < 0.0)
  {
    v16 = *(double *)(v14 + 8 * Idx);
    if (v16 < 0.0)
    {
      v17 = log10(-v15);
      v18 = -v16;
LABEL_16:
      v19 = 1.0 / (v12 + a4);
      v20 = 1.0 / (v13 + a4);
      v21 = log10(v18);
      v22 = 1.0 / (a3 + a4);
      if (v20 == v19)
        puts("dataTable<T>::interpolate: Division by zero");
      __exp10(v17 + (v21 - v17) / (v20 - v19) * (v22 - v19));
      return;
    }
  }
  v18 = *(double *)(v14 + 8 * Idx);
  if (v15 > 0.0 && v18 > 0.0)
  {
    v17 = log10(*(long double *)(v14 + v11));
    goto LABEL_16;
  }
  if (v13 == v12)
    puts("dataTable<T>::interpolate: Division by zero");
}

unint64_t getValueNanIfOutOfRange(unint64_t result, double a2)
{
  double v2;
  double v3;

  v2 = **(double **)result;
  v3 = *(double *)(*(_QWORD *)result + 8 * *(_QWORD *)(result + 8) - 8);
  if (*(_BYTE *)(result + 16))
  {
    if (v2 < a2 || v3 > a2)
      return result;
    return dataTable<double>::getValue((uint64_t *)result, 0, a2);
  }
  if (v2 <= a2 && v3 >= a2)
    return dataTable<double>::getValue((uint64_t *)result, 0, a2);
  return result;
}

void ACAMAgingUpdator::getResistance(uint64_t a1, int a2, _QWORD *a3, double a4, double a5, double a6)
{
  double v12;
  unint64_t Idx;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  _BOOL4 v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  __int128 v37;
  _OWORD *v38;
  __int128 v39;
  uint64_t v40;
  _OWORD *v41;
  __int128 v42;
  _OWORD *v43;
  __int128 v44;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[2];
  BOOL v60;
  _QWORD *v61;
  _OWORD v62[2];
  _OWORD v63[2];
  _OWORD v64[2];
  _OWORD v65[2];
  double v66;
  double v67;
  _QWORD v68[3];

  v68[2] = *MEMORY[0x24BDAC8D0];
  v12 = fabs(a4);
  Idx = sortedUniqueArray<double>::getIdx((uint64_t *)(*(_QWORD *)(a1 + 8) + 168), -1, -1, a5);
  v14 = *(uint64_t **)(a1 + 8);
  v15 = v14[22] - 1;
  if (Idx < v15)
    v15 = Idx;
  if (v15 <= 1)
    v16 = 1;
  else
    v16 = v15;
  v17 = v16 - 1;
  v18 = 28;
  if (a4 > 0.0)
    v18 = 25;
  v19 = 27;
  if (a4 > 0.0)
    v19 = 24;
  v20 = v14[v19];
  v21 = v14[v18];
  if (!v21)
  {
    v22 = 0;
LABEL_23:
    if (v22)
      v30 = v22 - 1;
    else
      v30 = 0;
    v23 = v22;
    goto LABEL_27;
  }
  v22 = 0;
  v23 = v21 - 1;
  v24 = 29;
  if (a4 > 0.0)
    v24 = 26;
  v25 = LOBYTE(v14[v24]);
  do
  {
    v26 = v21 >> 1;
    v27 = v22 + (v21 >> 1);
    v28 = *(double *)(v20 + 8 * v27);
    v29 = v28 > v12;
    if (!v25)
      v29 = v28 < v12;
    v21 += ~(v21 >> 1);
    if (v29)
      v22 = v27 + 1;
    else
      v21 = v26;
  }
  while (v21);
  v30 = v23;
  if (v22 <= v23)
    goto LABEL_23;
LABEL_27:
  v31 = v14 + 32;
  if (a2 == 1)
    v31 = v14 + 33;
  v32 = v14 + 30;
  v33 = v14 + 31;
  if (a2 != 1)
    v33 = v32;
  if (a4 <= 0.0)
    v33 = v31;
  v34 = *v33;
  v35 = *(_QWORD *)(v34 + 8 * v16);
  v36 = (_OWORD *)(v35 + 32 * v23);
  v37 = v36[1];
  v65[0] = *v36;
  v65[1] = v37;
  v38 = (_OWORD *)(v35 + 32 * v30);
  v39 = v38[1];
  v64[0] = *v38;
  v64[1] = v39;
  v40 = *(_QWORD *)(v34 + 8 * v17);
  v41 = (_OWORD *)(v40 + 32 * v23);
  v42 = v41[1];
  v63[0] = *v41;
  v63[1] = v42;
  v43 = (_OWORD *)(v40 + 32 * v30);
  v44 = v43[1];
  v62[0] = *v43;
  v62[1] = v44;
  dataTable<double>::getValue((uint64_t *)v65, 0, a6);
  v46 = v45;
  dataTable<double>::getValue((uint64_t *)v64, 0, a6);
  v48 = v47;
  dataTable<double>::getValue((uint64_t *)v63, 0, a6);
  v50 = v49;
  dataTable<double>::getValue((uint64_t *)v62, 0, a6);
  if (v30 == v23)
  {
    v52 = (v50 + v51) * 0.5;
    v53 = (v46 + v48) * 0.5;
  }
  else
  {
    v54 = *(double *)(v20 + 8 * v30);
    v55 = *(double *)(v20 + 8 * v23) - v54;
    v56 = v12 - v54;
    v52 = v51 + (v50 - v51) * v56 / v55;
    v53 = v48 + (v46 - v48) * v56 / v55;
  }
  v57 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 168);
  v66 = *(double *)(v57 + 8 * v17);
  v67 = *(double *)(v57 + 8 * v16);
  *(double *)v68 = v52;
  *(double *)&v68[1] = v53;
  v59[0] = (uint64_t)&v66;
  v59[1] = 2;
  v60 = v66 > v67;
  v61 = v68;
  dataTable<double>::getValueArrhenius(v59, 1, a5, 273.15);
  *a3 = v58;
}

uint64_t ACAMAgingUpdator::getRawNCCVersion2(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double *a10)
{
  ACAMAgingUpdator *v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  ACAMAgingUpdator *v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  double *v26;
  double v27;
  double v28;
  double v29;
  float64x2_t v30;
  uint64x2_t v31;
  int64x2_t v32;
  int64x2_t v37;
  uint64_t v38;
  uint64x2_t v39;
  float64x2_t v40;
  double v41;
  double v42;
  uint64_t i;
  double v44;
  uint64_t j;
  double *v46;
  unint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  unint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t result;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
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
  double *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89[2];
  BOOL v90;
  double *v91;
  uint64_t v92[2];
  BOOL v93;
  double *v94;
  uint64_t v95[2];
  BOOL v96;
  double *v97;
  uint64_t v98[2];
  BOOL v99;
  double *v100;
  uint64_t v101[2];
  BOOL v102;
  __int128 *v103;
  double v104[301];
  double __dst[202];
  double v106[202];
  double v107[301];
  _QWORD v108[2];
  __int128 v109;
  uint64_t v110;

  v10 = (ACAMAgingUpdator *)MEMORY[0x24BDAC7A8](this, a10, a2, a3, a4, a5, a6, a7, a8, a9);
  v74 = v11;
  v78 = v12;
  v79 = v13;
  v15 = v14;
  v17 = v16;
  v76 = v18;
  v85 = v19;
  v82 = v20;
  v83 = v21;
  v22 = v10;
  v23 = 0;
  v110 = *MEMORY[0x24BDAC8D0];
  v24 = *(double **)v10;
  v26 = (double *)*((_QWORD *)v10 + 2);
  v25 = *((_QWORD *)v10 + 3);
  v27 = *(double *)(*(_QWORD *)v10 + 304);
  v28 = *(double *)(*(_QWORD *)v10 + 328);
  v29 = *(double *)(*(_QWORD *)v10 + 352);
  v30 = (float64x2_t)vdupq_n_s64(0xBF6B4E81B4E81B4FLL);
  v31 = (uint64x2_t)vdupq_n_s64(0x12DuLL);
  v32 = (int64x2_t)xmmword_236E72A60;
  __asm { FMOV            V3.2D, #1.0 }
  v37 = vdupq_n_s64(2uLL);
  do
  {
    v38 = v23 + 1;
    v39.i64[0] = v23;
    v39.i64[1] = v23 + 1;
    v40 = vmlaq_f64(_Q3, v30, vcvtq_f64_u64(v39));
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v31, (uint64x2_t)v32)).u8[0] & 1) != 0)
      v107[v23] = v40.f64[0];
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x12DuLL), *(uint64x2_t *)&v32)).i32[1] & 1) != 0)
      v107[v23 + 1] = v40.f64[1];
    v32 = vaddq_s64(v32, v37);
    v23 += 2;
  }
  while (v38 != 301);
  v41 = v28 + v27 * (v15 + 1.0);
  v42 = (1.0 - v41) / 0.00333333333 + 1.0;
  memcpy(v106, v24 + 54, sizeof(v106));
  for (i = 101; i != 202; ++i)
    v106[i] = v106[i] - v29;
  v44 = v27 + v28;
  v98[0] = (uint64_t)v106;
  v98[1] = 101;
  v99 = v106[0] > v106[100];
  v100 = &v106[101];
  memcpy(__dst, v24 + 54, sizeof(__dst));
  for (j = 0; j != 101; ++j)
  {
    v46 = &__dst[j];
    *v46 = v41 - v44 + __dst[j];
    v46[101] = __dst[j + 101] - v29;
  }
  v47 = (unint64_t)v42;
  v95[0] = (uint64_t)__dst;
  v95[1] = 101;
  v96 = __dst[0] > __dst[100];
  v97 = &__dst[101];
  if (!(unint64_t)v42)
  {
    dataTable<double>::getValue(v95, 1, v107[0]);
    v51 = v52;
LABEL_17:
    v53 = v47 - 1;
    do
    {
      dataTable<double>::getValue(v95, 1, v107[v47]);
      v104[v47++] = v104[v53] + v54 - v51;
    }
    while (v47 != 301);
    goto LABEL_19;
  }
  v48 = 0;
  do
  {
    dataTable<double>::getValue(v98, 1, v107[v48]);
    v104[v48++] = v49 + (v15 + 1.0) * v29;
  }
  while (v47 != v48);
  dataTable<double>::getValue(v95, 1, v107[v47]);
  v51 = v50;
  if (v47 <= 0x12C)
    goto LABEL_17;
LABEL_19:
  v92[0] = (uint64_t)v107;
  v92[1] = 301;
  v93 = v107[0] > v107[300];
  v94 = v104;
  v55 = v24[53];
  v89[0] = (uint64_t)(v24 + 47);
  v89[1] = 3;
  v90 = v24[47] > v24[49];
  v91 = v24 + 50;
  dataTable<double>::getValueArrhenius(v89, 1, 25.0, 273.15);
  v57 = v56 * -(*(double *)(v25 + 400) * *v26);
  v87 = 0.0;
  v88 = 0.0;
  v86 = 0.0;
  v75 = 0.0;
  result = ACAMAgingUpdator::updateStoichiometryLimits(v22, v83, v82, v85, 0.0, v17 + v57 * (v55 * v15 + 1.0), 1, &v88, &v87, &v88, &v86);
  v59 = *(double *)(v25 + 336);
  v60 = *(double *)(v25 + 360) * *v26;
  if (v59 > *(double *)(v25 + 384))
  {
    v80 = v86;
    v81 = v87;
    v61 = *(double *)(v25 + 352);
    v84 = *(double *)(v25 + 344);
    v75 = 0.0;
    v62 = -1;
    v77 = -v60 / v76;
    do
    {
      if (vabdd_f64(v84, v61) <= *(double *)(v25 + 368))
        break;
      if ((unint64_t)++v62 >= *(_QWORD *)(v25 + 376))
        break;
      v109 = xmmword_236E72A70;
      *(double *)v108 = v78;
      *(double *)&v108[1] = v79;
      v101[0] = (uint64_t)v108;
      v101[1] = 2;
      v63 = v81 - v60 * v59 / v83 / 3600.0;
      v102 = v78 > v79;
      v103 = &v109;
      dataTable<double>::getValue(v101, 0, v63);
      v65 = v64;
      getValueNanIfOutOfRange(*((_QWORD *)v22 + 1) + 136, v60 * v59 / v82 / 3600.0 + v80);
      v67 = v66;
      getValueNanIfOutOfRange(*((_QWORD *)v22 + 1) + 104, v63);
      v69 = v68;
      v101[0] = 0;
      ACAMAgingUpdator::getResistance((uint64_t)v22, 0, v101, v77, 25.0, v63);
      result = dataTable<double>::getValue(v92, 1, v65);
      v71 = v67 + -v60 * (v70 - *(double *)v101) - (v69 + v60 * *(double *)v101);
      v72 = fabs(v71);
      if (v71 < v61 - *(double *)(v25 + 392) || v72 == INFINITY)
      {
        v59 = v59 * 0.5;
      }
      else
      {
        if (v71 == v84)
          break;
        v75 = v59 + v75;
        v80 = v60 * v59 / v82 / 3600.0 + v80;
        v81 = v81 - v60 * v59 / v83 / 3600.0;
        v84 = v71;
      }
    }
    while (v59 > *(double *)(v25 + 384));
  }
  *v74 = v60 * v75 / 3600.0;
  return result;
}

unint64_t ACAMAgingUpdator::getNCCAdjustment(ACAMAgingUpdator *this, double a2, double a3, double a4, double a5, double a6, double a7, double *a8)
{
  unint64_t v12;
  int64x2_t v13;
  uint64x2_t v14;
  int64x2_t v15;
  uint64_t v16;
  double v17;
  unint64_t result;
  double v19;
  uint64_t v20[2];
  BOOL v21;
  double *v22;
  double v23[101];
  double v24[102];

  v12 = 0;
  v24[101] = *(double *)MEMORY[0x24BDAC8D0];
  v13 = (int64x2_t)xmmword_236E72A60;
  v14 = (uint64x2_t)vdupq_n_s64(0x65uLL);
  v15 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v14, (uint64x2_t)v13)).u8[0] & 1) != 0)
      v24[v12] = (double)v12 * 0.01;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x65uLL), *(uint64x2_t *)&v13)).i32[1] & 1) != 0)
      v24[v12 + 1] = (double)(v12 + 1) * 0.01;
    v12 += 2;
    v13 = vaddq_s64(v13, v15);
  }
  while (v12 != 102);
  ACAMAgingUpdator::getOCV(this, a2, a3, a4, v24, 101, v23);
  v16 = 0;
  v17 = v23[0];
  do
    v17 = fmax(v17, v23[v16++]);
  while (v16 != 101);
  v20[0] = (uint64_t)v23;
  v20[1] = 101;
  v21 = v23[0] > v23[100];
  v22 = v24;
  result = dataTable<double>::getValue(v20, 0, v17 - (a6 - a7));
  *a8 = (1.0 - v19) * a5;
  return result;
}

uint64_t sortedUniqueArray<double>::getIdx(uint64_t *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t result;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  _BOOL4 v12;

  if (a2 == -1)
    result = 0;
  else
    result = a2;
  if (a3 == -1)
    a3 = a1[1] - 1;
  v6 = a3 - result + 1;
  if (a3 - result != -1)
  {
    v7 = *a1;
    v8 = *((unsigned __int8 *)a1 + 16);
    do
    {
      v9 = v6 >> 1;
      v10 = result + (v6 >> 1);
      v11 = *(double *)(v7 + 8 * v10);
      v12 = v11 > a4;
      if (!v8)
        v12 = v11 < a4;
      v6 += ~(v6 >> 1);
      if (v12)
        result = v10 + 1;
      else
        v6 = v9;
    }
    while (v6);
  }
  return result;
}

double ACAMAgingModel::trapezoid(ACAMAgingModel *this, double a2, double a3, double a4, double *a5, double a6)
{
  double result;

  result = *a5 + (a2 + a3) * 0.5 * a4 * a6;
  *a5 = result;
  return result;
}

double ACAMAgingModel::forwardEuler(ACAMAgingModel *this, double a2, double a3, double *a4, double a5)
{
  double result;

  result = *a4 + a2 * a3 * a5;
  *a4 = result;
  return result;
}

_QWORD *ACAMAgingModel::ACAMAgingModel(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

double ACAMAgingModel::runOneStep(uint64_t *a1, uint64_t a2, double *a3, double *a4, uint64_t a5)
{
  double result;
  _OWORD v11[6];
  uint64_t v12;

  v12 = 0;
  memset(v11, 0, sizeof(v11));
  ACAMAgingModel::calculateAgingRate((uint64_t)a1, a2, a3, a4, (double *)v11);
  if (ACAMAgingModel::checkDerivative((uint64_t)a1, (double *)v11))
    *(_QWORD *)&result = ACAMAgingModel::updateAgingState(a1, a2, a3, (uint64_t)v11, a5, a4, *(double *)(a2 + 32) - *(double *)(a2 + 72)).n128_u64[0];
  return result;
}

uint64_t ACAMAgingModel::calculateAgingRate(uint64_t a1, uint64_t a2, double *a3, double *a4, double *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = *(_QWORD *)(a1 + 16);
  ACAMAgingModel::calculateSEI(a1, a2, a3, (uint64_t)a4, (uint64_t)a5);
  ACAMAgingModel::calculateCBPT(a1, a2, a3, (uint64_t)a4, a5);
  ACAMAgingModel::calculateAnodeCracking(a1, a2, a3, v11, (uint64_t)a5);
  if (*(_QWORD *)(v10 + 464) == 2)
    ACAMAgingModel::calculateHardSwellVersion2(a1, a2, a3, (uint64_t)a4, (uint64_t)a5);
  else
    ACAMAgingModel::calculateHardSwell((double **)a1, a2, (uint64_t)a3, v12, (uint64_t)a5);
  ACAMAgingModel::calculateGasSwell((uint64_t *)a1, a2, (uint64_t)a3, a4, a5);
  ACAMAgingModel::calculateImpedanceGrowth(a1, a2, a3, 0, (uint64_t)a4, (uint64_t)a5);
  return ACAMAgingModel::calculateImpedanceGrowth(a1, a2, a3, 1u, (uint64_t)a4, (uint64_t)a5);
}

BOOL ACAMAgingModel::checkDerivative(uint64_t a1, double *a2)
{
  double *v2;
  _BOOL8 result;

  result = 0;
  if (((_QWORD)a2[4] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v2 = *(double **)(a1 + 16);
    if (fabs(a2[4]) <= v2[60] + -2.22044605e-16
      && ((_QWORD)a2[8] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[8]) <= v2[61] + -2.22044605e-16
      && ((_QWORD)a2[9] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[9]) <= v2[62] + -2.22044605e-16
      && ((_QWORD)a2[1] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[1]) <= v2[63] + -2.22044605e-16
      && ((_QWORD)a2[3] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[3]) <= v2[64] + -2.22044605e-16
      && ((_QWORD)a2[11] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[11]) <= v2[65] + -2.22044605e-16
      && ((_QWORD)a2[12] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(a2[12]) <= v2[66] + -2.22044605e-16
      && (*(_QWORD *)a2 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && fabs(*a2) <= v2[67] + -2.22044605e-16)
    {
      return 1;
    }
  }
  return result;
}

__n128 ACAMAgingModel::updateAgingState(uint64_t *a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5, double *a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __n128 result;
  __int128 v29;
  __int128 v30;

  v14 = a1[2];
  ACAMAgingModel::updateCBPT(a7, (uint64_t)a1, a2, (uint64_t)a3, (double *)a4, (double *)a5, a6);
  a6[12] = a6[12] + (*(double *)(a4 + 64) + *(double *)(a5 + 64)) * 0.5 * a7;
  ACAMAgingModel::updateSEI((uint64_t)a1, a7, v15, a3, (double *)a4, (double *)a5, (uint64_t)a6);
  v20 = *a6;
  v21 = a6[1] + (*(double *)a4 + *(double *)a5) * 0.5 * a7;
  a6[1] = v21;
  v22 = a1[2];
  v23 = fmax(v21, *(double *)(v22 + 544));
  v24 = v20 + (*(double *)(a4 + 8) + *(double *)(a5 + 8)) * 0.5 * a7;
  *a6 = v24;
  a6[1] = v23;
  *a6 = fmax(fmin(v24, *(double *)(v22 + 552)), 0.0);
  if (*(_QWORD *)(v14 + 464) == 2)
  {
    v25 = a6[3] + (*(double *)(a4 + 24) + *(double *)(a5 + 24)) * 0.5 * a7;
    a6[3] = v25;
    a6[3] = fmax(fmin(v25, *(double *)(v22 + 552)), 0.0);
  }
  else
  {
    ACAMAgingModel::updateHardSwell(a1, a2, a7, v18, a4, v19, (uint64_t)a6);
  }
  ACAMAgingModel::updateImpedanceGrowth(a7, v16, v17, v18, a4, a5, (uint64_t)a6);
  v26 = *(_OWORD *)a4;
  v27 = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(a5 + 16) = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(a5 + 32) = v27;
  *(_OWORD *)a5 = v26;
  result = *(__n128 *)(a4 + 48);
  v29 = *(_OWORD *)(a4 + 64);
  v30 = *(_OWORD *)(a4 + 80);
  *(_QWORD *)(a5 + 96) = *(_QWORD *)(a4 + 96);
  *(_OWORD *)(a5 + 64) = v29;
  *(_OWORD *)(a5 + 80) = v30;
  *(__n128 *)(a5 + 48) = result;
  return result;
}

uint64_t ACAMAgingModel::calculateSEI(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5)
{
  double *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double *v19;
  double v20;
  BOOL v21;
  double v22;
  double v23;
  uint64_t v25[2];
  BOOL v26;
  uint64_t v27;

  v10 = *(double **)a1;
  v11 = operator new[]();
  v12 = v11;
  v13 = 0;
  v14 = *(double *)(a2 + 8);
  v15 = 0.0;
  if (fabs(v14) > *(double *)(*(_QWORD *)(a1 + 16) + 8))
    v15 = 1.0;
  v16 = vabdd_f64(*a3, a3[2]) * v15;
  v17 = a3[4];
  v18 = *(double *)(a4 + 112);
  v19 = (double *)v11;
  do
    ACAMAgingModel::calculateSEIAtGridTemperature((double **)a1, v16, v14, v17, v18, v13++, v19++);
  while (v13 != 3);
  v20 = *(double *)(a2 + 16);
  v25[0] = (uint64_t)v10;
  v25[1] = 3;
  v21 = *v10 > v10[2];
  v27 = v12;
  v26 = v21;
  dataTable<double>::getValueArrhenius(v25, 1, v20, 273.15);
  v23 = v22 / 3600.0;
  *(double *)(a5 + 72) = v23;
  *(double *)(a5 + 80) = v23;
  return MEMORY[0x23B8057BC](v12, 0x1000C8000313F17);
}

uint64_t ACAMAgingModel::calculateCBPT(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, double *a5)
{
  double *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v23;
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
  double *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;

  v8 = *(double **)a1;
  v9 = 0.0;
  if (fabs(*(double *)(a2 + 8)) > *(double *)(*(_QWORD *)(a1 + 16) + 8))
    v9 = 1.0;
  v10 = vabdd_f64(a3[1], a3[3]) * v9;
  v11 = operator new[]();
  v12 = operator new[]();
  v13 = operator new[]();
  v14 = operator new[]();
  v16 = 0;
  v17 = 0;
  v18 = a3[5];
  v19 = *(double *)(a2 + 8);
  v20 = *(double *)(a4 + 72);
  v21 = *(double *)(a4 + 80);
  do
  {
    v15 = ACAMAgingModel::calculateCBPTAtGridTemperature((double **)a1, v15, v10, v18, v19, v20, v21, v17++, (double *)(v11 + v16), (double *)(v13 + v16), (double *)(v12 + v16), (long double *)(v14 + v16));
    v16 += 8;
  }
  while (v17 != 3);
  v22 = *(double *)(a2 + 16);
  v24 = v8[19];
  v23 = v8 + 19;
  v39 = v23;
  v40 = 3;
  v25 = v23[2];
  v42 = v11;
  v41 = v24 > v25;
  dataTable<double>::getValueArrhenius((uint64_t *)&v39, 1, v22, 273.15);
  a5[4] = v26 / 3600.0;
  v39 = v23;
  v40 = 3;
  v27 = *v23;
  v28 = v23[2];
  v42 = v12;
  v41 = v27 > v28;
  dataTable<double>::getValueArrhenius((uint64_t *)&v39, 1, v22, 273.15);
  a5[5] = v29 / 3600.0;
  v39 = v23;
  v40 = 3;
  v30 = *v23;
  v31 = v23[2];
  v42 = v13;
  v41 = v30 > v31;
  dataTable<double>::getValueArrhenius((uint64_t *)&v39, 1, v22, 273.15);
  a5[6] = v32 / 3600.0;
  v39 = v23;
  v40 = 3;
  v33 = *v23;
  v34 = v23[2];
  v42 = v14;
  v41 = v33 > v34;
  dataTable<double>::getValueArrhenius((uint64_t *)&v39, 1, v22, 273.15);
  a5[7] = v35 / 3600.0;
  MEMORY[0x23B8057BC](v11, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](v12, 0x1000C8000313F17);
  MEMORY[0x23B8057BC](v13, 0x1000C8000313F17);
  return MEMORY[0x23B8057BC](v14, 0x1000C8000313F17);
}

uint64_t ACAMAgingModel::calculateAnodeCracking(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5)
{
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  BOOL v19;
  double v20;
  uint64_t v22[2];
  BOOL v23;
  uint64_t v24;

  v9 = *(double **)a1;
  v10 = operator new[]();
  v11 = v10;
  v12 = 0;
  v13 = *(double *)(a2 + 8);
  v14 = 0.0;
  if (fabs(v13) > *(double *)(*(_QWORD *)(a1 + 16) + 8))
    v14 = 1.0;
  v15 = *a3;
  v16 = vabdd_f64(*a3, a3[2]) * v14;
  v17 = (double *)v10;
  do
    ACAMAgingModel::calculateAnodeCrackingAtGridTemperature((double **)a1, v13, v15, v16, v12++, v17++);
  while (v12 != 3);
  v18 = *(double *)(a2 + 16);
  v22[0] = (uint64_t)(v9 + 68);
  v22[1] = 3;
  v19 = v9[68] > v9[70];
  v24 = v11;
  v23 = v19;
  dataTable<double>::getValueArrhenius(v22, 1, v18, 273.15);
  *(double *)(a5 + 64) = v20 / 3600.0;
  return MEMORY[0x23B8057BC](v11, 0x1000C8000313F17);
}

uint64_t ACAMAgingModel::calculateHardSwell(double **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  uint64_t v23[2];
  BOOL v24;
  uint64_t v25;

  v8 = *a1;
  v9 = *(double *)(a3 + 32);
  v10 = *(double *)(a2 + 8);
  v11 = operator new[]();
  v12 = -a1[2][1];
  v13 = 0.0;
  if (v10 >= v12)
  {
    v14 = (*a1)[88];
    v13 = v14 * exp(v9 * (*a1)[91]);
  }
  *(double *)v11 = v13;
  if (v10 >= v12)
  {
    v16 = *a1;
    v17 = v16[89];
    *(long double *)(v11 + 8) = v17 * exp(v9 * v16[92]);
    v18 = v16[90];
    v15 = v18 * exp(v9 * v16[93]);
  }
  else
  {
    *(_QWORD *)(v11 + 8) = 0;
    v15 = 0.0;
  }
  *(double *)(v11 + 16) = v15;
  v19 = *(double *)(a2 + 16);
  v23[0] = (uint64_t)(v8 + 85);
  v23[1] = 3;
  v20 = v8[85] > v8[87];
  v25 = v11;
  v24 = v20;
  dataTable<double>::getValueArrhenius(v23, 1, v19, 273.15);
  *(double *)(a5 + 16) = v21 / 3600.0;
  return MEMORY[0x23B8057BC](v11, 0x1000C8000313F17);
}

uint64_t ACAMAgingModel::calculateHardSwellVersion2(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5)
{
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double *v17;
  BOOL v18;
  double v19;
  uint64_t v21[2];
  BOOL v22;
  uint64_t v23;

  v7 = *(double **)a1;
  v9 = *(double *)(a2 + 8);
  v8 = *(double *)(a2 + 16);
  v10 = 0.0;
  if (fabs(v9) > *(double *)(*(_QWORD *)(a1 + 16) + 8))
    v10 = 1.0;
  v11 = vabdd_f64(*a3, a3[2]) * v10;
  v12 = a3[4];
  v13 = *(double *)(a4 + 24);
  v14 = operator new[]();
  v16 = 0;
  v17 = (double *)v14;
  do
    v15 = ACAMAgingModel::calculateHardSwellAtGridTemperatureVersion2((double **)a1, v15, v11, v12, v9, v13, v16++, v17++);
  while (v16 != 3);
  v21[0] = (uint64_t)(v7 + 97);
  v21[1] = 3;
  v18 = v7[97] > v7[99];
  v23 = v14;
  v22 = v18;
  dataTable<double>::getValueArrhenius(v21, 1, v8, 273.15);
  *(double *)(a5 + 24) = v19 / 3600.0;
  return MEMORY[0x23B8057BC](v14, 0x1000C8000313F17);
}

long double ACAMAgingModel::calculateGasSwell(uint64_t *a1, uint64_t a2, uint64_t a3, double *a4, double *a5)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  double v14;
  long double v15;
  long double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  double v22;
  long double result;
  double v24;

  v6 = *a1;
  v7 = a4[1];
  v24 = *a4;
  v8 = *(double *)(a2 + 16) + 273.15;
  v9 = *(double *)(a3 + 32);
  v10 = *(double *)(a3 + 40);
  v11 = v10 - *(double *)(*a1 + 568);
  v12 = exp(*(long double *)(*a1 + 576));
  v13 = atan(v11 * v12) + 1.57079633;
  v14 = exp(*(long double *)(v6 + 584));
  v15 = exp(*(long double *)(v6 + 592)) + v13 * v14;
  v16 = v15 * exp(-*(double *)(v6 + 600) / v8) / -3600.0;
  v17 = *(double *)(v6 + 632);
  v18 = *(double *)(v6 + 672);
  v19 = exp(*(double *)(v6 + 624) / v8 + *(double *)(v6 + 608) + v10 * *(double *)(v6 + 616) / v8);
  v20 = v19 / (exp(v8 * v17 * (v7 + v18)) + 1.0);
  v21 = *(double *)(v6 + 664);
  v22 = exp(*(double *)(v6 + 656) / v8 + *(double *)(v6 + 640) + v9 * *(double *)(v6 + 648) / v8);
  result = (v20 - (1.0 - exp(-(v21 * v24) / 100.0)) * v22) / 3600.0 * 100.0;
  *a5 = v16;
  a5[1] = result;
  return result;
}

uint64_t ACAMAgingModel::calculateImpedanceGrowth(uint64_t a1, uint64_t a2, double *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  double *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v29[2];
  BOOL v30;
  uint64_t v31;

  if (a4 >= 2)
  {
    puts("Not yet implemented");
    exit(1);
  }
  v11 = *(double **)a1;
  v12 = *(double *)(a5 + 64);
  v13 = operator new[]();
  v14 = v13;
  v15 = 0;
  v16 = *(double *)(a2 + 8);
  v17 = 0.0;
  if (fabs(v16) > *(double *)(*(_QWORD *)(a1 + 16) + 8))
    v17 = 1.0;
  v18 = vabdd_f64(a3[1], a3[3]) * v17;
  v19 = a3[5];
  v20 = (double *)v13;
  do
    ACAMAgingModel::calculateImpedanceGrowthAtGridTemperature((double **)a1, v15++, a4, v20++, v18, v19, v16, v12);
  while (v15 != 3);
  v21 = (uint64_t)(v11 + 134);
  v22 = *(double *)(a2 + 16);
  v23 = 116;
  if (a4)
    v21 = (uint64_t)(v11 + 116);
  else
    v23 = 134;
  v29[0] = v21;
  v29[1] = 3;
  v24 = v11[v23];
  v25 = *(double *)(v21 + 16);
  if (a4)
    v26 = 88;
  else
    v26 = 96;
  v31 = v14;
  v30 = v24 > v25;
  dataTable<double>::getValueArrhenius(v29, 1, v22, 273.15);
  *(double *)(a6 + v26) = v27 / 3600.0;
  return MEMORY[0x23B8057BC](v14, 0x1000C8000313F17);
}

double ACAMAgingModel::updateCBPT(double a1, uint64_t a2, uint64_t a3, uint64_t a4, double *a5, double *a6, double *a7)
{
  double v7;
  double v8;
  double result;

  v7 = a7[8];
  a7[7] = a7[7] + (a5[4] + a6[4]) * 0.5 * a1;
  a7[8] = v7 + (-a6[4] - a5[4]) * 0.5 * a1;
  v8 = a7[10];
  a7[9] = a7[9] + (-a6[5] - a5[5]) * 0.5 * a1;
  a7[10] = v8 + (-a6[6] - a5[6]) * 0.5 * a1;
  result = a7[11] + (-a6[7] - a5[7]) * 0.5 * a1;
  a7[11] = result;
  return result;
}

double ACAMAgingModel::updateAnodeCracking(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double result;

  result = *(double *)(a7 + 96) + (*(double *)(a5 + 64) + *(double *)(a6 + 64)) * 0.5 * a1;
  *(double *)(a7 + 96) = result;
  return result;
}

double ACAMAgingModel::updateSEI(uint64_t a1, double a2, uint64_t a3, double *a4, double *a5, double *a6, uint64_t a7)
{
  double *v7;
  double v8;
  double v9;
  double v10;
  double result;

  v7 = *(double **)(a1 + 8);
  v8 = a5[9];
  v9 = a6[9];
  v10 = *(double *)(a7 + 104)
      + ((a5[4] + a6[4]) * 0.5 * a2 * (v7[2] / v7[3]) + 0.0) * ((a4[1] + a4[14]) * 0.5)
      + (v8 + v9) * 0.5 * a2
      + 0.0
      + ((a5[8] + a6[8]) * 0.5 * a2 * (v7[1] / v7[3]) + 0.0) * ((*a4 + a4[13]) * 0.5);
  result = (-v9 - v8) * 0.5 * a2 + *(double *)(a7 + 112);
  *(double *)(a7 + 104) = v10;
  *(double *)(a7 + 112) = result;
  return result;
}

double ACAMAgingModel::updateGasSwell(uint64_t a1, double a2, uint64_t a3, uint64_t a4, double *a5, double *a6, double *a7)
{
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double result;

  v7 = *a7;
  v8 = a7[1] + (*a5 + *a6) * 0.5 * a2;
  a7[1] = v8;
  v9 = *(_QWORD *)(a1 + 16);
  v10 = fmax(v8, *(double *)(v9 + 544));
  v11 = v7 + (a5[1] + a6[1]) * 0.5 * a2;
  *a7 = v11;
  a7[1] = v10;
  result = fmax(fmin(v11, *(double *)(v9 + 552)), 0.0);
  *a7 = result;
  return result;
}

double ACAMAgingModel::updateHardSwell(uint64_t *a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  long double v15;
  double result;
  uint64_t v17[2];
  BOOL v18;
  uint64_t v19;

  v11 = *a1;
  v12 = *a1 + 752;
  v17[0] = *a1 + 680;
  v17[1] = 3;
  v18 = *(double *)(v11 + 680) > *(double *)(v11 + 696);
  v19 = v12;
  dataTable<double>::getValueArrhenius(v17, 1, *(double *)(a2 + 16), 273.15);
  v14 = v13;
  v15 = exp(v13 * *(double *)(a7 + 24)) + *(double *)(a5 + 16) * a3;
  *(long double *)(a7 + 32) = v15;
  result = fmax(fmin(log(v15) / v14, *(double *)(a1[2] + 552)), 0.0);
  *(double *)(a7 + 24) = result;
  return result;
}

double ACAMAgingModel::updateHardSwellVersion2(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v7;
  double result;

  v7 = *(double *)(a7 + 24) + (*(double *)(a5 + 24) + *(double *)(a6 + 24)) * 0.5 * a2;
  *(double *)(a7 + 24) = v7;
  result = fmax(fmin(v7, *(double *)(*(_QWORD *)(a1 + 16) + 552)), 0.0);
  *(double *)(a7 + 24) = result;
  return result;
}

float64x2_t ACAMAgingModel::updateImpedanceGrowth(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  double v7;
  float64_t v8;
  float64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t result;

  v7 = *(double *)(a7 + 120);
  *(double *)(a7 + 128) = *(double *)(a7 + 128) + (*(double *)(a5 + 96) + *(double *)(a6 + 96)) * 0.5 * a1;
  v8 = *(double *)(a5 + 96);
  v9 = *(double *)(a6 + 96);
  *(double *)(a7 + 120) = v7 + (*(double *)(a5 + 88) + *(double *)(a6 + 88)) * 0.5 * a1;
  v10 = *(float64x2_t *)(a5 + 88);
  v10.f64[1] = v8;
  v11 = *(float64x2_t *)(a6 + 88);
  v11.f64[1] = v9;
  v12 = vaddq_f64(v10, v11);
  __asm { FMOV            V2.2D, #0.5 }
  result = vaddq_f64(*(float64x2_t *)(a7 + 40), vaddq_f64(vmulq_n_f64(vmulq_f64(v12, _Q2), a1), (float64x2_t)0));
  *(float64x2_t *)(a7 + 40) = result;
  return result;
}

double ACAMAgingModel::calculateSEIAtGridTemperature(double **this, double a2, double a3, double a4, double a5, int a6, double *a7)
{
  double *v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double result;
  double v22;
  double v23;

  v12 = *this;
  v13 = &(*this)[a6];
  v22 = v13[10];
  v23 = v13[13];
  v14 = v13[4];
  v15 = v13[7];
  v16 = (*this)[3];
  v17 = 1.0 / (exp(-((*this)[17] * (a2 - (*this)[16]))) + 1.0);
  v18 = exp((a4 - v16) * (v15 / (*v13 + 273.15))) + v14 * fmax(a5, v12[18]);
  v19 = a3 / *this[1];
  v20 = 0.0;
  if (v19 > 0.0)
    v20 = -1.0;
  result = v22 * (v17 * (fabs(v19) * v20)) / v18 - v23 / v18;
  *a7 = result;
  return result;
}

long double ACAMAgingModel::calculateCBPTAtGridTemperature(double **this, double a2, long double a3, double a4, double a5, double a6, double a7, int a8, double *a9, double *a10, double *a11, long double *a12)
{
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  long double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  long double result;
  double v32;
  long double __y;
  double v36;
  double v37;
  double v38;

  v18 = &(*this)[a8];
  v37 = v18[28];
  v38 = v18[25];
  v36 = v18[31];
  v19 = v18[34];
  v20 = v18[37];
  v21 = v18[40];
  v22 = v18[22];
  v23 = (*this)[49];
  __y = (*this)[50];
  v24 = v18[19] + 273.15;
  v25 = pow(v18[43] * a6 + 1.0 - v18[46] * a7, (*this)[51]);
  v26 = a4 - v22;
  v27 = exp(v26 * (v19 / v24));
  v28 = exp(v26 * (v20 / v24));
  v29 = exp(v26 * (v21 / v24));
  v30 = pow(fabs(a5 / *this[1]), v23);
  result = v28 * -(v36 * (pow(a3, __y) * v30));
  v32 = -(v38 * v25) * v29;
  *a9 = v32 + result - v37 * v27;
  *a10 = v32;
  *a12 = result;
  *a11 = -(v37 * v27);
  return result;
}

void ACAMAgingModel::calculateAnodeCrackingAtGridTemperature(double **this, double a2, double a3, double a4, unsigned int a5, double *a6)
{
  double *v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v20;

  v12 = *this;
  v13 = &(*this)[a5];
  v14 = v13[59];
  v15 = exp(v13[53] * a3 + 1.0 + v13[62] * a3 * a3);
  v16 = -v14 / v15;
  if (fabs(a2) >= this[2][1])
  {
    v17 = (uint64_t)&v12[a5 + 52];
    if (a3 >= 0.650000095 || a3 <= 0.400000006)
      v20 = 1.0;
    else
      v20 = *(double *)(v17 + 104);
    v18 = *(double *)(v17 + 32);
    v16 = v16 - v20 * v18 * a4 * pow(fabs(a2 / *this[1]), v12[52]) / v15;
  }
  *a6 = v16;
}

long double ACAMAgingModel::IPBGasSwell(ACAMAgingModel *this, double a2, double a3, long double *a4)
{
  uint64_t v6;
  double v7;
  long double v8;
  long double v9;
  double v10;
  long double v11;
  long double result;

  v6 = *(_QWORD *)this;
  v7 = a3 - *(double *)(*(_QWORD *)this + 568);
  v8 = exp(*(long double *)(*(_QWORD *)this + 576));
  v9 = atan(v7 * v8) + 1.57079633;
  v10 = exp(*(long double *)(v6 + 584));
  v11 = exp(*(long double *)(v6 + 592)) + v9 * v10;
  result = v11 * exp(-*(double *)(v6 + 600) / a2);
  *a4 = result;
  return result;
}

void ACAMAgingModel::calculateHardSwellAtGridTemperature(ACAMAgingModel *this, double a2, double a3, unsigned int a4, double *a5)
{
  double v6;
  uint64_t v7;
  double v8;

  v6 = 0.0;
  if (-*(double *)(*((_QWORD *)this + 2) + 8) <= a3)
  {
    v7 = *(_QWORD *)this + 8 * a4;
    v8 = *(double *)(v7 + 704);
    v6 = v8 * exp(*(double *)(v7 + 728) * a2);
  }
  *a5 = v6;
}

double ACAMAgingModel::calculateHardSwellAtGridTemperatureVersion2(double **this, double a2, double a3, double a4, double a5, double a6, int a7, double *a8)
{
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double result;
  double v23;
  double v24;

  v11 = &(*this)[a7];
  v12 = v11[97] + 273.15;
  v13 = (*this)[100];
  v23 = v11[107];
  v24 = v11[110];
  v14 = v11[104];
  v15 = v11[101];
  v16 = (*this)[115];
  v17 = 1.0 / (exp(-((*this)[114] * (a3 - (*this)[113]))) + 1.0);
  v18 = exp((a4 - v13) * v14 / v12) + fmax(v16, a6 * a6) * v15;
  v19 = a5 / *this[1];
  v20 = 0.0;
  if (v19 > 0.0)
    v20 = 1.0;
  result = v24 / v18 + v23 * (fabs(v19) * (v17 * v20)) / v18;
  *a8 = result;
  return result;
}

double ACAMAgingModel::calculateImpedanceGrowthAtGridTemperature(double **a1, unsigned int a2, int a3, double *a4, double a5, double a6, double a7, double a8)
{
  double *v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  double *v20;
  double *v21;
  double *v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  double *v27;
  double *v28;
  double *v29;
  double *v30;
  double *v31;
  double *v32;
  double *v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  double v40;
  double v41;
  long double v42;
  long double v43;
  double result;
  double v45;

  v11 = *a1;
  v12 = a2;
  v13 = (uint64_t)(*a1 + 116);
  v14 = (double *)(v13 + 8 * a2);
  v15 = v14 + 3;
  v16 = *a1 + 128;
  v17 = v14 + 6;
  v18 = v14 + 9;
  v19 = *a1 + 129;
  v20 = *a1 + 130;
  v21 = *a1 + 131;
  v22 = *a1 + 132;
  v23 = v11 + 133;
  v24 = (uint64_t)(v11 + 134);
  v25 = (uint64_t)&v11[v12 + 134];
  v26 = (double *)(v25 + 24);
  v27 = v11 + 146;
  v28 = (double *)(v25 + 48);
  v29 = (double *)(v25 + 72);
  v30 = v11 + 147;
  v31 = v11 + 148;
  v32 = v11 + 149;
  v33 = v11 + 150;
  v34 = v11 + 151;
  if (a3)
  {
    v34 = v23;
  }
  else
  {
    v18 = v29;
    v22 = v33;
    v16 = v27;
    v17 = v28;
  }
  if (!a3)
  {
    v15 = v26;
    v21 = v32;
    v20 = v31;
    v19 = v30;
    v13 = v24;
  }
  v35 = *v19;
  v36 = *v20;
  v37 = *v21;
  v45 = *v17;
  v38 = *v34;
  v39 = *v22;
  v40 = *v18;
  v41 = exp(*v15 / (*(double *)(v13 + 8 * v12) + 273.15) * (a6 - *v16));
  v42 = v35 / (exp(-(v36 * (a8 - v38))) + 1.0) + 1.0;
  v43 = pow(v37 * a8 + 1.0, v39);
  result = v40 * (v41 * (v43 * v42)) + fabs(a7 / *a1[1]) * (v45 * (v41 * (v43 * v42))) * a5;
  *a4 = result;
  return result;
}

uint64_t ACAM::ACAM(uint64_t a1, const void *a2, ACAMPerformanceModelParameter *a3, const void *a4, const void *a5, uint64_t a6, const void *a7)
{
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  *(_BYTE *)a1 = 0;
  v13 = a1 + 8;
  memcpy((void *)(a1 + 8), a2, 0x4C0uLL);
  ACAMPerformanceModelParameter::ACAMPerformanceModelParameter((ACAMPerformanceModelParameter *)(a1 + 1224), a3);
  memcpy((void *)(a1 + 1560), a4, 0x14A0uLL);
  v14 = *(_QWORD *)(a6 + 32);
  v15 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a1 + 6840) = *(_OWORD *)a6;
  *(_OWORD *)(a1 + 6856) = v15;
  *(_QWORD *)(a1 + 6872) = v14;
  memcpy((void *)(a1 + 6880), a7, 0x2E0uLL);
  memcpy((void *)(a1 + 7616), a5, 0x5010uLL);
  ACAMAgingModel::ACAMAgingModel((_QWORD *)(a1 + 28112), v13, a1 + 6840, a1 + 6880);
  ACAMPerformanceModel::ACAMPerformanceModel((_QWORD *)(a1 + 28136), a1 + 1224, a1 + 6840, a1 + 6880);
  ACAMAgingUpdator::ACAMAgingUpdator((_QWORD *)(a1 + 28160), a1 + 1560, a1 + 1224, a1 + 6840, a1 + 6880);
  *(_QWORD *)(a1 + 28936) = 0;
  *(_QWORD *)(a1 + 28984) = 0;
  *(_QWORD *)(a1 + 29000) = 0;
  *(_QWORD *)(a1 + 28992) = 0;
  *(_QWORD *)(a1 + 28952) = 0;
  *(_QWORD *)(a1 + 28968) = 0;
  *(_QWORD *)(a1 + 28960) = 0;
  *(_OWORD *)(a1 + 29024) = 0u;
  *(_OWORD *)(a1 + 29040) = 0u;
  *(_OWORD *)(a1 + 29056) = 0u;
  *(_OWORD *)(a1 + 29072) = 0u;
  *(_OWORD *)(a1 + 29088) = 0u;
  *(_OWORD *)(a1 + 29104) = 0u;
  return a1;
}

void sub_236E5E308(_Unwind_Exception *a1)
{
  ACAMPerformanceModelParameter *v1;

  ACAMPerformanceModelParameter::~ACAMPerformanceModelParameter(v1);
  _Unwind_Resume(a1);
}

void ACAMStatus::~ACAMStatus(void **this)
{
  if (*((char *)this + 95) < 0)
    operator delete(this[9]);
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
}

uint64_t ACAM::preInit(ACAM *this, const ACAMPersistentStates *a2, const ACAMStatus::SystemSignals *a3, BOOL *a4)
{
  ACAMStatus *v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  int v12;
  __int16 v14;

  *a4 = 0;
  v14 = 0;
  v8 = (ACAM *)((char *)this + 28952);
  ACAMStatus::setFreshInitReason((uint64_t)this + 28952, 0);
  if (a2)
  {
    ACAMPersistentStates::restore(a2, this);
    ACAMStatus::setInitType((uint64_t)v8, 1);
    v9 = *((_QWORD *)this + 860);
    if (v9)
      v10 = v9 == *((_QWORD *)a2 + 99);
    else
      v10 = 0;
    v11 = !v10;
    HIBYTE(v14) = v11;
    LOBYTE(v14) = ACAM::checkAgingBoundViolation(this);
  }
  else
  {
    *a4 = 1;
  }
  ACAMStatus::setAlgoStatusBuffer((uint64_t)v8, (uint64_t)a3, &v14);
  if (ACAMStatus::initializationRequired(v8))
  {
    *a4 = 1;
    if (!a2)
    {
      v12 = 2;
      return ACAMStatus::setFreshInitReason((uint64_t)v8, v12);
    }
    goto LABEL_18;
  }
  if (*a4)
    v12 = 2;
  else
    v12 = 1;
  if (*a4 && a2)
  {
LABEL_18:
    if ((_BYTE)v14)
    {
      v12 = 5;
    }
    else if (HIBYTE(v14))
    {
      v12 = 4;
    }
    else
    {
      v12 = 3;
    }
  }
  return ACAMStatus::setFreshInitReason((uint64_t)v8, v12);
}

BOOL ACAM::checkAgingBoundViolation(ACAM *this)
{
  double v1;
  double v2;
  double v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  _BOOL4 v18;

  v1 = *((double *)this + 3590);
  v2 = *((double *)this + 944);
  v3 = *((double *)this + 945);
  if (v2 == v3)
  {
    v4 = v1 == v2;
  }
  else if (v3 <= v2)
  {
    v4 = v1 < v2;
    if (v1 < v3)
      v4 = 0;
  }
  else
  {
    v4 = v1 >= v2;
    if (v1 >= v3)
      v4 = 0;
  }
  v5 = *((double *)this + 3585);
  v6 = *((double *)this + 946);
  v7 = *((double *)this + 947);
  if (v6 == v7)
  {
    v8 = v5 == v6;
  }
  else if (v7 <= v6)
  {
    v8 = v5 < v6;
    if (v5 < v7)
      v8 = 0;
  }
  else
  {
    v8 = v5 >= v6;
    if (v5 >= v7)
      v8 = 0;
  }
  v9 = *((double *)this + 3591);
  v10 = *((double *)this + 948);
  v11 = *((double *)this + 949);
  v12 = v9 < v10;
  if (v9 < v11)
    v12 = 0;
  v13 = v9 >= v10;
  if (v9 >= v11)
    v13 = 0;
  if (v11 > v10)
    v12 = v13;
  if (v10 == v11)
    v12 = v9 == v10;
  v14 = *((double *)this + 3581);
  v15 = *((double *)this + 950);
  v16 = *((double *)this + 951);
  v17 = v14 < v15;
  if (v14 < v16)
    v17 = 0;
  v18 = v14 >= v15;
  if (v14 >= v16)
    v18 = 0;
  if (v16 > v15)
    v17 = v18;
  if (v15 == v16)
    v17 = v14 == v15;
  return !v4 || !v8 || !v12 || !v17;
}

uint64_t *ACAM::init(ACAM *this, const ACAMPersistentStates *a2)
{
  __int128 v4;
  __int128 v5;
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
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v4 = *(_OWORD *)a2;
  v5 = *((_OWORD *)a2 + 1);
  *((_QWORD *)this + 3538) = *((_QWORD *)a2 + 4);
  *((_OWORD *)this + 1768) = v5;
  *((_OWORD *)this + 1767) = v4;
  v6 = *(_OWORD *)a2;
  v7 = *((_OWORD *)a2 + 1);
  *((_QWORD *)this + 3533) = *((_QWORD *)a2 + 4);
  *(_OWORD *)((char *)this + 28248) = v7;
  *(_OWORD *)((char *)this + 28232) = v6;
  v8 = *(_OWORD *)((char *)a2 + 40);
  v9 = *(_OWORD *)((char *)a2 + 56);
  *((_QWORD *)this + 3528) = *((_QWORD *)a2 + 9);
  *((_OWORD *)this + 1763) = v9;
  *((_OWORD *)this + 1762) = v8;
  v11 = *((_OWORD *)a2 + 9);
  v10 = *((_OWORD *)a2 + 10);
  v12 = *((_OWORD *)a2 + 8);
  *((_QWORD *)this + 3577) = *((_QWORD *)a2 + 22);
  *(_OWORD *)((char *)this + 28584) = v11;
  *(_OWORD *)((char *)this + 28600) = v10;
  *(_OWORD *)((char *)this + 28568) = v12;
  v13 = *((_OWORD *)a2 + 5);
  v14 = *((_OWORD *)a2 + 7);
  *(_OWORD *)((char *)this + 28536) = *((_OWORD *)a2 + 6);
  *(_OWORD *)((char *)this + 28552) = v14;
  *(_OWORD *)((char *)this + 28520) = v13;
  v15 = *((_OWORD *)a2 + 5);
  v16 = *((_OWORD *)a2 + 6);
  *((_OWORD *)this + 1778) = *((_OWORD *)a2 + 7);
  *((_OWORD *)this + 1777) = v16;
  *((_OWORD *)this + 1776) = v15;
  v17 = *((_OWORD *)a2 + 8);
  v18 = *((_OWORD *)a2 + 9);
  v19 = *((_OWORD *)a2 + 10);
  *((_QWORD *)this + 3564) = *((_QWORD *)a2 + 22);
  *((_OWORD *)this + 1781) = v19;
  *((_OWORD *)this + 1780) = v18;
  *((_OWORD *)this + 1779) = v17;
  v20 = *(_OWORD *)((char *)a2 + 184);
  v21 = *(_OWORD *)((char *)a2 + 216);
  *(_OWORD *)((char *)this + 28328) = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)((char *)this + 28344) = v21;
  *(_OWORD *)((char *)this + 28312) = v20;
  v22 = *(_OWORD *)((char *)a2 + 232);
  v23 = *(_OWORD *)((char *)a2 + 248);
  v24 = *(_OWORD *)((char *)a2 + 264);
  *((_QWORD *)this + 3551) = *((_QWORD *)a2 + 35);
  *(_OWORD *)((char *)this + 28376) = v23;
  *(_OWORD *)((char *)this + 28392) = v24;
  *(_OWORD *)((char *)this + 28360) = v22;
  *((_OWORD *)this + 1789) = *((_OWORD *)a2 + 18);
  v25 = *((_OWORD *)a2 + 19);
  v26 = *((_OWORD *)a2 + 20);
  v27 = *((_OWORD *)a2 + 21);
  *((_OWORD *)this + 1793) = *((_OWORD *)a2 + 22);
  *((_OWORD *)this + 1792) = v27;
  *((_OWORD *)this + 1791) = v26;
  *((_OWORD *)this + 1790) = v25;
  v28 = *((_OWORD *)a2 + 23);
  v29 = *((_OWORD *)a2 + 24);
  v30 = *((_OWORD *)a2 + 25);
  *((_QWORD *)this + 3594) = *((_QWORD *)a2 + 52);
  *((_OWORD *)this + 1796) = v30;
  *((_OWORD *)this + 1795) = v29;
  *((_OWORD *)this + 1794) = v28;
  *(_OWORD *)((char *)this + 28760) = *(_OWORD *)((char *)a2 + 424);
  v31 = *(_OWORD *)((char *)a2 + 440);
  v32 = *(_OWORD *)((char *)a2 + 456);
  v33 = *(_OWORD *)((char *)a2 + 472);
  *((_QWORD *)this + 3603) = *((_QWORD *)a2 + 61);
  *(_OWORD *)((char *)this + 28792) = v32;
  *(_OWORD *)((char *)this + 28808) = v33;
  *(_OWORD *)((char *)this + 28776) = v31;
  v35 = *((_OWORD *)a2 + 35);
  v34 = *((_OWORD *)a2 + 36);
  v36 = *((_QWORD *)a2 + 74);
  *((_OWORD *)this + 1805) = *((_OWORD *)a2 + 34);
  *((_QWORD *)this + 3616) = v36;
  *((_OWORD *)this + 1807) = v34;
  *((_OWORD *)this + 1806) = v35;
  v37 = *((_OWORD *)a2 + 31);
  v38 = *((_OWORD *)a2 + 32);
  *((_OWORD *)this + 1804) = *((_OWORD *)a2 + 33);
  *((_OWORD *)this + 1803) = v38;
  *((_OWORD *)this + 1802) = v37;
  *(_OWORD *)((char *)this + 28936) = *(_OWORD *)((char *)a2 + 600);
  v39 = *(_OWORD *)((char *)a2 + 664);
  *((_QWORD *)this + 3621) = *((_QWORD *)a2 + 85);
  *(_OWORD *)((char *)this + 28952) = v39;
  *((_WORD *)this + 14488) = *((_WORD *)a2 + 344);
  std::string::operator=((std::string *)((char *)this + 28984), (const std::string *)a2 + 29);
  *((_OWORD *)this + 1813) = *((_OWORD *)a2 + 45);
  std::string::operator=((std::string *)((char *)this + 29024), (const std::string *)((char *)a2 + 736));
  v41 = *(_OWORD *)((char *)a2 + 632);
  v40 = *(_OWORD *)((char *)a2 + 648);
  *(_OWORD *)((char *)this + 29048) = *(_OWORD *)((char *)a2 + 616);
  *(_OWORD *)((char *)this + 29064) = v41;
  *(_OWORD *)((char *)this + 29080) = v40;
  *(_BYTE *)this = *((_BYTE *)a2 + 784);
  return simpleList<ACAMBatteryState>::operator=((uint64_t *)this + 3637, (__int128 **)a2 + 95);
}

uint64_t *simpleList<ACAMBatteryState>::operator=(uint64_t *a1, __int128 **a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 *i;
  __int128 v7;
  __int128 v8;
  _OWORD v10[2];
  uint64_t v11;

  v4 = *a1;
  if (v4)
  {
    do
    {
      v5 = *(_QWORD *)(v4 + 40);
      MEMORY[0x23B8057D4]();
      v4 = v5;
    }
    while (v5);
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  for (i = *a2; i; i = (__int128 *)*((_QWORD *)i + 5))
  {
    v7 = *i;
    v8 = i[1];
    v11 = *((_QWORD *)i + 4);
    v10[0] = v7;
    v10[1] = v8;
    simpleList<ACAMBatteryState>::append(a1, (uint64_t)v10);
  }
  return a1;
}

uint64_t ACAM::init(ACAM *this, double a2, double a3, double a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  uint64_t v20[2];
  BOOL v21;
  char *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;

  v26 = a4;
  v27 = a3;
  *((_OWORD *)this + 1789) = 0u;
  *((_OWORD *)this + 1790) = 0u;
  *((_OWORD *)this + 1791) = 0u;
  *((_OWORD *)this + 1792) = 0u;
  *((_OWORD *)this + 1793) = 0u;
  *((_OWORD *)this + 1794) = 0u;
  *((_OWORD *)this + 1795) = 0u;
  *((_OWORD *)this + 1796) = 0u;
  *((_QWORD *)this + 3594) = 0;
  v25 = 21;
  v23[4] = (char *)this + 7616;
  v24 = 11;
  v23[0] = &v25;
  v23[1] = &v24;
  v23[2] = &v27;
  v23[3] = &v26;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 9632);
  *((_QWORD *)this + 3590) = v6;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 11480);
  *((_QWORD *)this + 3585) = v7;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 13328);
  *((_QWORD *)this + 3591) = v8;
  *((double *)this + 3586) = 1.0 - *((double *)this + 3585);
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 15176);
  *((_QWORD *)this + 3583) = v9;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 17024);
  *((_QWORD *)this + 3584) = v10;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 20720);
  *((_QWORD *)this + 3592) = v11;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 24416);
  *((_QWORD *)this + 3578) = v12;
  ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 26264);
  *((_QWORD *)this + 3579) = v13;
  if (*((_QWORD *)this + 918) == 2)
  {
    ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 22568);
  }
  else
  {
    v20[0] = (uint64_t)this + 688;
    v20[1] = 3;
    v21 = *((double *)this + 86) > *((double *)this + 88);
    v22 = (char *)this + 760;
    dataTable<double>::getValueArrhenius(v20, 1, 25.0, 273.15);
    v15 = v14;
    ACAM::init(double,double,double)::$_0::operator()((uint64_t)v23, (uint64_t)this + 18872);
    *((long double *)this + 3582) = v16;
    v17 = log(v16) / v15;
  }
  *((double *)this + 3581) = v17;
  *((_QWORD *)this + 3603) = 0;
  *(_OWORD *)((char *)this + 28808) = 0u;
  *(_OWORD *)((char *)this + 28760) = 0u;
  *(_OWORD *)((char *)this + 28792) = 0u;
  *(_OWORD *)((char *)this + 28776) = 0u;
  ACAMAgingUpdator::updateStoichiometryLimits((ACAM *)((char *)this + 28160), *((double *)this + 3590) * *(double *)(*((_QWORD *)this + 3522) + 8), *((double *)this + 3585) * *(double *)(*((_QWORD *)this + 3522) + 16), *((double *)this + 3591) * *(double *)(*((_QWORD *)this + 3522) + 24), (double *)this + 3595, (double *)this + 3596, (double *)this + 3597, (double *)this + 3598);
  ACAMAgingUpdator::updateQmax((ACAM *)((char *)this + 28160), *((double *)this + 3597), *((double *)this + 3598), *((double *)this + 3585) * *(double *)(*((_QWORD *)this + 3522) + 16), (double *)this + 3599);
  *((_OWORD *)this + 1766) = 0u;
  *((_OWORD *)this + 1768) = 0u;
  *((_OWORD *)this + 1767) = 0u;
  *((_OWORD *)this + 1765) = 0u;
  *((_OWORD *)this + 1764) = 0u;
  *((_OWORD *)this + 1763) = 0u;
  *((_OWORD *)this + 1762) = 0u;
  *((double *)this + 3538) = a2;
  *((double *)this + 3533) = a2;
  *(_OWORD *)((char *)this + 28312) = 0u;
  *(_OWORD *)((char *)this + 28328) = 0u;
  *(_OWORD *)((char *)this + 28344) = 0u;
  *(_OWORD *)((char *)this + 28360) = 0u;
  *(_OWORD *)((char *)this + 28376) = 0u;
  *(_OWORD *)((char *)this + 28392) = 0u;
  *(_OWORD *)((char *)this + 28408) = 0u;
  *(_OWORD *)((char *)this + 28424) = 0u;
  *(_OWORD *)((char *)this + 28440) = 0u;
  *(_OWORD *)((char *)this + 28456) = 0u;
  *(_OWORD *)((char *)this + 28472) = 0u;
  *(_OWORD *)((char *)this + 28488) = 0u;
  *(_OWORD *)((char *)this + 28504) = 0u;
  *(_OWORD *)((char *)this + 28520) = 0u;
  *(_OWORD *)((char *)this + 28536) = 0u;
  *(_OWORD *)((char *)this + 28552) = 0u;
  *(_OWORD *)((char *)this + 28568) = 0u;
  *(_OWORD *)((char *)this + 28584) = 0u;
  *(_OWORD *)((char *)this + 28600) = 0u;
  *((_QWORD *)this + 3577) = 0;
  *((_QWORD *)this + 3542) = 0xBFF0000000000000;
  *((_OWORD *)this + 1802) = 0u;
  *((_OWORD *)this + 1803) = 0u;
  *((_OWORD *)this + 1804) = 0u;
  *((_OWORD *)this + 1805) = 0u;
  *((_OWORD *)this + 1806) = 0u;
  *((_OWORD *)this + 1807) = 0u;
  *((_QWORD *)this + 3617) = 0;
  *((_QWORD *)this + 3616) = 0;
  v18 = *((_QWORD *)this + 862);
  *(_BYTE *)this = 1;
  *((_QWORD *)this + 3618) = v18;
  return ACAMStatus::setInitType((uint64_t)this + 28952, 2);
}

unint64_t ACAM::init(double,double,double)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double *v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double *v15;
  double *v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double *v21;
  double *v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[2];
  BOOL v31;
  _QWORD *v32;
  uint64_t v33[2];
  BOOL v34;
  uint64_t v35;
  uint64_t v36[2];
  BOOL v37;
  uint64_t v38;
  double v39;
  double v40;
  _QWORD v41[3];

  v4 = 0;
  v41[2] = *MEMORY[0x24BDAC8D0];
  v5 = *(double **)(a1 + 32);
  v6 = **(double **)(a1 + 16);
  v7 = 21;
  do
  {
    v8 = v7 >> 1;
    v9 = v4 + (v7 >> 1);
    v10 = v5[v9];
    v11 = v10 > v6;
    if (*v5 <= v5[20])
      v11 = v10 < v6;
    v7 += ~(v7 >> 1);
    if (v11)
      v4 = v9 + 1;
    else
      v7 = v8;
  }
  while (v7);
  if (v4)
  {
    v12 = v4 - 1;
    if (v4 == **(_QWORD **)a1)
      v13 = v4 - 1;
    else
      v13 = v4;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v14 = **(_QWORD **)(a1 + 8);
  v15 = &v5[11 * v12];
  v17 = v15[21];
  v16 = v15 + 21;
  v18 = v17;
  v36[0] = (uint64_t)v16;
  v36[1] = v14;
  v19 = v14 - 1;
  v20 = v16[v14 - 1];
  v38 = a2 + 8 * v14 * v12;
  if (v14 > 1)
  {
    v21 = v5;
  }
  else
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    v18 = *v16;
    v20 = v16[v19];
    v14 = **(_QWORD **)(a1 + 8);
    v21 = *(double **)(a1 + 32);
    v19 = v14 - 1;
  }
  v37 = v18 > v20;
  v22 = &v21[11 * v13];
  v24 = v22[21];
  v23 = v22 + 21;
  v25 = v24;
  v33[0] = (uint64_t)v23;
  v33[1] = v14;
  v26 = v23[v19];
  v35 = a2 + 8 * v14 * v13;
  if (v14 <= 1)
  {
    puts("dataTable<T>::dataTable requires at least two elements[pointer constructor]");
    v25 = *v23;
    v26 = v23[v19];
  }
  v34 = v25 > v26;
  if (v12 == v13)
    return dataTable<double>::getValue(v36, 1, **(double **)(a1 + 24));
  dataTable<double>::getValue(v36, 1, **(double **)(a1 + 24));
  v41[0] = v28;
  dataTable<double>::getValue(v33, 1, **(double **)(a1 + 24));
  v41[1] = v29;
  v39 = v5[v12];
  v40 = v5[v13];
  v30[0] = (uint64_t)&v39;
  v30[1] = 2;
  v31 = v39 > v40;
  v32 = v41;
  return dataTable<double>::getValue(v30, 1, **(double **)(a1 + 16));
}

uint64_t ACAM::init(uint64_t a1, double *a2, uint64_t *a3)
{
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  __int128 *v20;
  double *v21;
  uint64_t v22;
  double *v23;
  double *v24;
  double v25;
  __int128 *v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 *v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  unint64_t i;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __n128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t result;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  double v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  _BYTE v66[664];
  __int128 v67;
  uint64_t v68;
  __int16 v69;
  std::string v70;
  __int128 v71;
  std::string v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  _OWORD v83[2];
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  _BYTE __dst[664];
  __int128 v89;
  uint64_t v90;
  __int16 v91;
  std::string v92;
  __int128 v93;
  std::string __p;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  uint64_t __src[83];
  __int128 v100;
  uint64_t v101;
  __int16 v102;
  std::string __s;
  __int128 v104;
  std::string::size_type v105[2];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;

  v59 = *a2;
  v60 = *((_QWORD *)a2 + 1);
  v57 = *((_QWORD *)a2 + 2);
  v61 = *((_QWORD *)a2 + 3);
  ACAM::init((ACAM *)a1, a2[6], a2[5], a2[4]);
  v62 = a3;
  if (a3)
  {
    __src[75] = 0;
    memset(&__s, 0, sizeof(__s));
    memset(&__src[77], 0, 48);
    v100 = 0u;
    v101 = 0;
    *(_OWORD *)v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    ACAMPersistentStates::retrieve((ACAMPersistentStates *)__src, (const ACAM *)a1);
    memcpy(__dst, __src, sizeof(__dst));
    v89 = v100;
    v90 = v101;
    v91 = v102;
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v92, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    else
      v92 = __s;
    v93 = v104;
    if (SBYTE7(v106) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v105[0], v105[1]);
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v105;
      __p.__r_.__value_.__r.__words[2] = v106;
    }
    v95 = 0;
    v97 = 0;
    v96 = 0;
    v5 = (__int128 *)*((_QWORD *)&v106 + 1);
    if (*((_QWORD *)&v106 + 1))
    {
      v6 = 0;
      v7 = 0;
      while (1)
      {
        v109 = *v5;
        v110 = v5[1];
        v111 = *((_QWORD *)v5 + 4);
        v97 = v6 + 1;
        v8 = operator new();
        *(_QWORD *)(v8 + 40) = 0;
        if (v7)
        {
          v9 = v96;
          *(_QWORD *)(v96 + 40) = v8;
          v10 = v110;
          *(_OWORD *)v8 = v109;
          *(_OWORD *)(v8 + 16) = v10;
          *(_QWORD *)(v8 + 32) = v111;
          *(_QWORD *)(v8 + 48) = v9;
        }
        else
        {
          *(_QWORD *)(v8 + 48) = 0;
          v95 = v8;
          v11 = v110;
          *(_OWORD *)v8 = v109;
          *(_OWORD *)(v8 + 16) = v11;
          *(_QWORD *)(v8 + 32) = v111;
        }
        v96 = v8;
        v5 = (__int128 *)*((_QWORD *)v5 + 5);
        if (!v5)
          break;
        v7 = v95;
        v6 = v97;
      }
    }
    v98 = v108;
    v12 = simpleList<ACAMPersistentStates>::append(a3, (uint64_t)__dst);
    v13 = v95;
    if (v95)
    {
      do
      {
        v14 = *(_QWORD *)(v13 + 40);
        MEMORY[0x23B8057D4](v12);
        v13 = v14;
      }
      while (v14);
    }
    v95 = 0;
    v96 = 0;
    v97 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v92.__r_.__value_.__l.__data_);
    v15 = *((_QWORD *)&v106 + 1);
    if (*((_QWORD *)&v106 + 1))
    {
      do
      {
        v16 = *(_QWORD *)(v15 + 40);
        MEMORY[0x23B8057D4](v12);
        v15 = v16;
      }
      while (v16);
    }
    *((_QWORD *)&v106 + 1) = 0;
    v107 = 0uLL;
    if (SBYTE7(v106) < 0)
      operator delete((void *)v105[0]);
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__s.__r_.__value_.__l.__data_);
  }
  v17 = *(double *)(a1 + 6896);
  *(double *)(a1 + 28944) = v17;
  *(_QWORD *)(a1 + 28936) = 0;
  if (v60)
  {
    v18 = 0;
    v19 = 0;
    v64 = (uint64_t *)(a1 + 29096);
    v65 = a1 + 28952;
    v58 = (unint64_t)fmax((double)*(unint64_t *)(a1 + 7056), (double)*(unint64_t *)(a1 + 7040));
    do
    {
      v20 = (__int128 *)(*(_QWORD *)&v59 + 40 * v18);
      v85 = *v20;
      v86 = v20[1];
      v22 = *((_QWORD *)v20 + 4);
      v21 = (double *)(v20 + 2);
      v87 = v22;
      v84 = v22;
      v83[0] = v85;
      v83[1] = v86;
      simpleList<ACAMBatteryState>::append(v64, (uint64_t)v83);
      if (*(_QWORD *)(a1 + 29112) > v58)
        simpleList<ACAMBatteryState>::remove(v64, 0);
      if (v19 < v61)
      {
        v23 = (double *)(v57 + 16 * v19);
        if (*v21 >= v23[1])
        {
          while (1)
          {
            v24 = v23;
            if (v61 - 1 == v19)
              break;
            v25 = v23[3];
            v23 += 2;
            ++v19;
            if (*v21 < v25)
              goto LABEL_37;
          }
          v19 = v61;
LABEL_37:
          v17 = *v24;
        }
      }
      ACAM::updateDynamicConfiguration((double *)a1, (uint64_t)v64, 0, (double *)(a1 + 28936), v17);
      v63 = v18;
      if (*(_QWORD *)(a1 + 29112) < 2uLL)
      {
        ACAMStatus::setDataErrorStatus(v65, a1 + 28232, (double *)&v85, (double *)(a1 + 28624), (double *)(a1 + 7472), (double *)(a1 + 6840));
        ACAM::runOneStep(a1, (uint64_t)&v85);
      }
      else
      {
        v26 = *(__int128 **)(*(_QWORD *)(a1 + 29104) + 48);
        v27 = v26[1];
        v80 = *v26;
        v81 = v27;
        v82 = *((_QWORD *)v26 + 4);
        v28 = operator new();
        *(_QWORD *)(v28 + 40) = 0;
        *(_QWORD *)(v28 + 48) = 0;
        v29 = v81;
        *(_OWORD *)v28 = v80;
        *(_OWORD *)(v28 + 16) = v29;
        *(_QWORD *)(v28 + 32) = v82;
        v30 = *(__int128 **)(a1 + 29104);
        __src[0] = v28;
        __src[1] = v28;
        v31 = v30[1];
        v77 = *v30;
        v78 = v31;
        v79 = *((_QWORD *)v30 + 4);
        __src[2] = 2;
        v32 = operator new();
        *(_QWORD *)(v28 + 40) = v32;
        v33 = v78;
        *(_OWORD *)v32 = v77;
        *(_OWORD *)(v32 + 16) = v33;
        *(_QWORD *)(v32 + 32) = v79;
        *(_QWORD *)(v32 + 40) = 0;
        *(_QWORD *)(v32 + 48) = v28;
        __src[1] = v32;
        v109 = 0uLL;
        *(_QWORD *)&v110 = 0;
        ACAM::expandBatteryStates(a1, __src, (uint64_t *)&v109, *(double *)(a1 + 28792), *(double *)(a1 + 7472));
        for (i = v18 != 0; i < (unint64_t)v110; ++i)
        {
          v35 = simpleList<ACAMBatteryState>::get((uint64_t *)&v109, i);
          v36 = *(_QWORD *)(v35 + 32);
          v37 = *(_OWORD *)(v35 + 16);
          *(_OWORD *)(a1 + 28192) = *(_OWORD *)v35;
          *(_OWORD *)(a1 + 28208) = v37;
          *(_QWORD *)(a1 + 28224) = v36;
          ACAMStatus::setDataErrorStatus(v65, a1 + 28232, (double *)(a1 + 28192), (double *)(a1 + 28624), (double *)(a1 + 7472), (double *)(a1 + 6840));
          v38 = simpleList<ACAMBatteryState>::get((uint64_t *)&v109, i);
          ACAM::runOneStep(a1, v38);
        }
        v39 = v109;
        if ((_QWORD)v109)
        {
          do
          {
            v40 = *(_QWORD *)(v39 + 40);
            MEMORY[0x23B8057D4]();
            v39 = v40;
          }
          while (v40);
        }
        do
        {
          v41 = *(_QWORD *)(v28 + 40);
          MEMORY[0x23B8057D4](v28, 0x1020C40D8E0519ALL);
          v28 = v41;
        }
        while (v41);
        v18 = v63;
      }
      if (v62)
      {
        __src[75] = 0;
        memset(&__s, 0, sizeof(__s));
        memset(&__src[77], 0, 48);
        v100 = 0u;
        v101 = 0;
        *(_OWORD *)v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        ACAMPersistentStates::retrieve((ACAMPersistentStates *)__src, (const ACAM *)a1);
        memcpy(v66, __src, sizeof(v66));
        v67 = v100;
        v68 = v101;
        v69 = v102;
        if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v70, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
        else
          v70 = __s;
        v71 = v104;
        if (SBYTE7(v106) < 0)
        {
          std::string::__init_copy_ctor_external(&v72, (const std::string::value_type *)v105[0], v105[1]);
        }
        else
        {
          *(_OWORD *)&v72.__r_.__value_.__l.__data_ = *(_OWORD *)v105;
          v72.__r_.__value_.__r.__words[2] = v106;
        }
        v73 = 0;
        v74 = 0;
        v75 = 0;
        v42 = (__int128 *)*((_QWORD *)&v106 + 1);
        if (*((_QWORD *)&v106 + 1))
        {
          v43 = 0;
          v44 = 0;
          while (1)
          {
            v109 = *v42;
            v110 = v42[1];
            v111 = *((_QWORD *)v42 + 4);
            v75 = v43 + 1;
            v45 = operator new();
            *(_QWORD *)(v45 + 40) = 0;
            if (v44)
            {
              v46 = v74;
              *(_QWORD *)(v74 + 40) = v45;
              v47 = v110;
              *(_OWORD *)v45 = v109;
              *(_OWORD *)(v45 + 16) = v47;
              *(_QWORD *)(v45 + 32) = v111;
              *(_QWORD *)(v45 + 48) = v46;
            }
            else
            {
              *(_QWORD *)(v45 + 48) = 0;
              v73 = v45;
              v48 = v110;
              *(_OWORD *)v45 = v109;
              *(_OWORD *)(v45 + 16) = v48;
              *(_QWORD *)(v45 + 32) = v111;
            }
            v74 = v45;
            v42 = (__int128 *)*((_QWORD *)v42 + 5);
            if (!v42)
              break;
            v44 = v73;
            v43 = v75;
          }
        }
        v76 = v108;
        v49 = simpleList<ACAMPersistentStates>::append(v62, (uint64_t)v66);
        v50 = v73;
        v18 = v63;
        if (v73)
        {
          do
          {
            v51 = *(_QWORD *)(v50 + 40);
            MEMORY[0x23B8057D4](v49);
            v50 = v51;
          }
          while (v51);
        }
        v73 = 0;
        v74 = 0;
        v75 = 0;
        if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v72.__r_.__value_.__l.__data_);
        if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v70.__r_.__value_.__l.__data_);
        v52 = *((_QWORD *)&v106 + 1);
        if (*((_QWORD *)&v106 + 1))
        {
          do
          {
            v53 = *(_QWORD *)(v52 + 40);
            MEMORY[0x23B8057D4](v49);
            v52 = v53;
          }
          while (v53);
        }
        *((_QWORD *)&v106 + 1) = 0;
        v107 = 0uLL;
        if (SBYTE7(v106) < 0)
          operator delete((void *)v105[0]);
        if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__s.__r_.__value_.__l.__data_);
      }
      ++v18;
    }
    while (v18 != v60);
  }
  *(_BYTE *)a1 = 1;
  ACAMStatus::setInitType(a1 + 28952, 3);
  v54 = (_QWORD *)(a1 + 29096);
  result = *(_QWORD *)(a1 + 29096);
  if (result)
  {
    do
    {
      v56 = *(_QWORD *)(result + 40);
      MEMORY[0x23B8057D4]();
      result = v56;
    }
    while (v56);
  }
  *v54 = 0;
  v54[1] = 0;
  v54[2] = 0;
  return result;
}

void sub_236E5F6B8(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x76F]) < 0)
    operator delete((void *)STACK[0x758]);
  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)&STACK[0x7C0]);
  _Unwind_Resume(a1);
}

__n128 simpleList<ACAMPersistentStates>::append(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::string *v7;
  std::string *v8;
  __n128 result;
  uint64_t v10;
  uint64_t v11;

  ++a1[2];
  v4 = *a1;
  v5 = operator new();
  v6 = v5;
  v7 = (std::string *)(v5 + 696);
  *(_QWORD *)(v5 + 696) = 0;
  *(_OWORD *)(v5 + 704) = 0u;
  v8 = (std::string *)(v5 + 736);
  *(_OWORD *)(v5 + 736) = 0u;
  *(_OWORD *)(v5 + 752) = 0u;
  *(_OWORD *)(v5 + 768) = 0u;
  *(_OWORD *)(v5 + 800) = 0u;
  if (v4)
  {
    *(_QWORD *)(a1[1] + 800) = v5;
    memcpy((void *)v5, (const void *)a2, 0x298uLL);
    *(_OWORD *)(v6 + 664) = *(_OWORD *)(a2 + 664);
    *(_QWORD *)(v6 + 680) = *(_QWORD *)(a2 + 680);
    *(_WORD *)(v6 + 688) = *(_WORD *)(a2 + 688);
    std::string::operator=(v7, (const std::string *)(a2 + 696));
    *(_OWORD *)(v6 + 720) = *(_OWORD *)(a2 + 720);
    std::string::operator=(v8, (const std::string *)(a2 + 736));
    simpleList<ACAMBatteryState>::operator=((uint64_t *)(v6 + 760), (__int128 **)(a2 + 760));
    result = *(__n128 *)(a2 + 784);
    *(__n128 *)(v6 + 784) = result;
    v10 = a1[1];
    v11 = *(_QWORD *)(v10 + 800);
    *(_QWORD *)(v11 + 808) = v10;
    a1[1] = v11;
  }
  else
  {
    *a1 = v5;
    memcpy((void *)v5, (const void *)a2, 0x298uLL);
    *(_OWORD *)(v6 + 664) = *(_OWORD *)(a2 + 664);
    *(_QWORD *)(v6 + 680) = *(_QWORD *)(a2 + 680);
    *(_WORD *)(v6 + 688) = *(_WORD *)(a2 + 688);
    std::string::operator=(v7, (const std::string *)(a2 + 696));
    *(_OWORD *)(v6 + 720) = *(_OWORD *)(a2 + 720);
    std::string::operator=(v8, (const std::string *)(a2 + 736));
    simpleList<ACAMBatteryState>::operator=((uint64_t *)(v6 + 760), (__int128 **)(a2 + 760));
    result = *(__n128 *)(a2 + 784);
    *(__n128 *)(v6 + 784) = result;
    a1[1] = *a1;
  }
  return result;
}

void ACAMPersistentStates::~ACAMPersistentStates(ACAMPersistentStates *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (_QWORD *)((char *)this + 760);
  v3 = *((_QWORD *)this + 95);
  if (v3)
  {
    do
    {
      v4 = *(_QWORD *)(v3 + 40);
      MEMORY[0x23B8057D4]();
      v3 = v4;
    }
    while (v4);
  }
  *v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  if (*((char *)this + 759) < 0)
    operator delete(*((void **)this + 92));
  if (*((char *)this + 719) < 0)
    operator delete(*((void **)this + 87));
}

uint64_t simpleList<ACAMBatteryState>::append(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  ++a1[2];
  v4 = *a1;
  result = operator new();
  if (v4)
  {
    v7 = a1[1];
    v6 = a1 + 1;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(v7 + 40) = result;
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)result = *(_OWORD *)a2;
    *(_OWORD *)(result + 16) = v8;
    *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(result + 48) = v7;
  }
  else
  {
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *a1 = result;
    v6 = a1 + 1;
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)result = *(_OWORD *)a2;
    *(_OWORD *)(result + 16) = v9;
    *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  }
  *v6 = result;
  return result;
}

uint64_t simpleList<ACAMBatteryState>::remove(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = simpleList<ACAMBatteryState>::get(a1, a2);
  if (result)
  {
    v5 = *(_QWORD *)(result + 40);
    v4 = *(_QWORD *)(result + 48);
    if (v4)
      *(_QWORD *)(v4 + 40) = v5;
    if (v5)
      *(_QWORD *)(v5 + 48) = v4;
    if (result == *a1)
      *a1 = v5;
    if (result == a1[1])
      a1[1] = v4;
    result = MEMORY[0x23B8057D4]();
    --a1[2];
  }
  return result;
}

unint64_t ACAM::updateDynamicConfiguration(double *a1, uint64_t a2, int a3, double *a4, double a5)
{
  double *v9;
  unint64_t *v10;
  unint64_t *v11;
  double *v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  unint64_t result;
  unint64_t v21;
  uint64_t v23;
  double v24;
  unint64_t v25;
  uint64_t v26;
  double i;
  double v28;
  double v29;

  v9 = a1 + 879;
  v10 = (unint64_t *)(a1 + 881);
  v11 = (unint64_t *)(a1 + 883);
  v12 = a1 + 885;
  if (!a3)
  {
    v10 = (unint64_t *)(a1 + 880);
    v11 = (unint64_t *)(a1 + 882);
    v12 = a1 + 884;
    v9 = a1 + 878;
  }
  v13 = *v9;
  v14 = *v12;
  v15 = *v11;
  v16 = *v10;
  a4[1] = a5;
  v17 = a1[856] * a1[3590];
  v18 = a1[857] * a1[3585];
  v19 = a1[858] * a1[3591];
  v29 = 0.0;
  result = ACAMAgingUpdator::getSOCTop((ACAMAgingUpdator *)(a1 + 3520), v17, v18, v19, a5 - v13, &v29);
  v21 = *(_QWORD *)(a2 + 16);
  if (v21 >= v15 && v21 >= v16)
  {
    v23 = *(_QWORD *)(a2 + 8);
    v24 = 0.0;
    if (v16)
    {
      v25 = v16;
      v26 = *(_QWORD *)(a2 + 8);
      do
      {
        v24 = v24 + *(double *)v26;
        v26 = *(_QWORD *)(v26 + 48);
        --v25;
      }
      while (v25);
    }
    if (a5 - v24 / (double)v16 < v14)
    {
      for (i = 0.0; v15; --v15)
      {
        i = fmax(*(double *)(v23 + 24), i);
        v23 = *(_QWORD *)(v23 + 48);
      }
      v28 = i - v29;
      if (v28 <= *a4)
        v28 = *a4;
      *a4 = fmin(v28, a1[886]);
    }
  }
  return result;
}

uint64_t simpleList<ACAMBatteryState>::get(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = 0;
  v4 = a1[2];
  if (v4 > a2 && -v4 <= a2)
  {
    if (a2 < 0)
    {
      result = a1[1];
      if (a2 != -1)
      {
        v7 = -2;
        if (a2 > -2)
          v7 = a2;
        v8 = v7 - a2 + 1;
        do
        {
          result = *(_QWORD *)(result + 48);
          --v8;
        }
        while (v8);
      }
    }
    else
    {
      result = *a1;
      if (a2)
      {
        v6 = a2 + 1;
        do
        {
          result = *(_QWORD *)(result + 40);
          --v6;
        }
        while (v6 > 1);
      }
    }
  }
  return result;
}

uint64_t ACAM::expandBatteryStates(uint64_t result, uint64_t *a2, uint64_t *a3, double a4, double a5)
{
  uint64_t v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float64x2_t v25;
  double v26[3];
  float64x2_t v27;

  v6 = *a2;
  v7 = *(_QWORD *)(*a2 + 40);
  v8 = *(float64x2_t *)(*a2 + 24);
  v9 = vsubq_f64(*(float64x2_t *)(v7 + 24), v8);
  if (v9.f64[1] / 3600.0 >= *(double *)(result + 7096) / 3600.0)
  {
    v12 = fmin(*(double *)(result + 6904), v9.f64[0] / (v9.f64[1] / 3600.0));
    if (v9.f64[0] <= 0.0)
      goto LABEL_15;
    if (v8.f64[0] > *(double *)(result + 7128))
      v12 = fmin(*(double *)(result + 7152), v12);
    if (v8.f64[0] > *(double *)(result + 7136))
      v12 = fmin(*(double *)(result + 7160), v12);
    if (v8.f64[0] <= *(double *)(result + 7144))
    {
LABEL_15:
      v10 = 0;
      v11 = v12 * a4;
    }
    else
    {
      v13 = *(double *)(v7 + 8);
      v14 = v12 * a4;
      v15 = v13 < 0.0;
      v16 = fmin(v13, v14);
      if (v15)
        v11 = v14;
      else
        v11 = v16;
      v10 = !v15;
    }
  }
  else
  {
    v10 = 0;
    v11 = *(double *)(v6 + 8);
  }
  v17 = (unint64_t)fmin((double)*(unint64_t *)(result + 7120), (double)(unint64_t)fmax((double)*(unint64_t *)(result + 7112), (double)(unint64_t)ceil(v9.f64[1] / a5)));
  if (v17)
  {
    v18 = 0;
    *(double *)&v19 = (double)(v17 - 1);
    v25 = vdivq_f64(v9, (float64x2_t)vdupq_lane_s64(v19, 0));
    v20 = (*(double *)v7 - *(double *)v6) / *(double *)&v19;
    v21 = (*(double *)(v7 + 16) - *(double *)(v6 + 16)) / *(double *)&v19;
    v22 = (v11 - *(double *)(v6 + 8)) / *(double *)&v19;
    do
    {
      v23 = (double)v18;
      if ((v10 & 1) != 0)
        v24 = *(double *)(v6 + 8) + v22 * (double)v18;
      else
        v24 = v11;
      v26[0] = *(double *)v6 + v20 * v23;
      v26[1] = v24;
      v26[2] = *(double *)(v6 + 16) + v21 * v23;
      v27 = vmlaq_n_f64(*(float64x2_t *)(v6 + 24), v25, v23);
      result = simpleList<ACAMBatteryState>::append(a3, (uint64_t)v26);
      ++v18;
    }
    while (v17 != v18);
  }
  return result;
}

__n128 ACAM::runOneStep(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _OWORD *v14;
  double *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  if (ACAMStatus::skipAlgoRunning((ACAMStatus *)(a1 + 28952)))
  {
    *(_OWORD *)(a1 + 28272) = *(_OWORD *)(a1 + 28232);
    *(_OWORD *)(a1 + 28288) = *(_OWORD *)(a1 + 28248);
    v4 = *(_OWORD *)(a1 + 28464);
    v5 = *(_OWORD *)(a1 + 28496);
    *(_OWORD *)(a1 + 28584) = *(_OWORD *)(a1 + 28480);
    *(_OWORD *)(a1 + 28600) = v5;
    v6 = *(_OWORD *)(a1 + 28432);
    *(_OWORD *)(a1 + 28520) = *(_OWORD *)(a1 + 28416);
    *(_OWORD *)(a1 + 28536) = v6;
    *(_OWORD *)(a1 + 28552) = *(_OWORD *)(a1 + 28448);
    *(_OWORD *)(a1 + 28568) = v4;
    *(_OWORD *)(a1 + 28248) = *(_OWORD *)(a1 + 28208);
    *(_OWORD *)(a1 + 28232) = *(_OWORD *)(a1 + 28192);
    v7 = *(_OWORD *)(a1 + 28312);
    *(_OWORD *)(a1 + 28432) = *(_OWORD *)(a1 + 28328);
    v8 = *(_OWORD *)(a1 + 28376);
    *(_OWORD *)(a1 + 28496) = *(_OWORD *)(a1 + 28392);
    *(_OWORD *)(a1 + 28480) = v8;
    v10 = *(_OWORD *)(a1 + 28344);
    result = *(__n128 *)(a1 + 28360);
    *(__n128 *)(a1 + 28464) = result;
    *(_OWORD *)(a1 + 28448) = v10;
    *(_QWORD *)(a1 + 28304) = *(_QWORD *)(a1 + 28264);
    *(_QWORD *)(a1 + 28616) = *(_QWORD *)(a1 + 28512);
    *(_QWORD *)(a1 + 28264) = *(_QWORD *)(a1 + 28224);
    *(_QWORD *)(a1 + 28512) = *(_QWORD *)(a1 + 28408);
    *(_OWORD *)(a1 + 28416) = v7;
  }
  else
  {
    v11 = *(_QWORD *)(a2 + 32);
    v12 = *(double *)(a2 + 24) - *(double *)(a1 + 28936);
    v13 = *(_QWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 28192) = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 28208) = v13;
    *(double *)(a1 + 28216) = v12;
    *(_QWORD *)(a1 + 28224) = v11;
    v14 = (_OWORD *)(a1 + 28312);
    ACAMPerformanceModel::runOneStep((uint64_t **)(a1 + 28136), (double *)(a1 + 28192), a1 + 28760, a1 + 28312);
    v15 = (double *)(a1 + 28416);
    if (*(double *)(a1 + 28424) == 0.0 && *v15 == 0.0)
    {
      v16 = *(_OWORD *)(a1 + 28392);
      *(_OWORD *)(a1 + 28480) = *(_OWORD *)(a1 + 28376);
      *(_OWORD *)(a1 + 28496) = v16;
      *(_QWORD *)(a1 + 28512) = *(_QWORD *)(a1 + 28408);
      v17 = *(_OWORD *)(a1 + 28328);
      *(_OWORD *)v15 = *v14;
      *(_OWORD *)(a1 + 28432) = v17;
      v18 = *(_OWORD *)(a1 + 28360);
      *(_OWORD *)(a1 + 28448) = *(_OWORD *)(a1 + 28344);
      *(_OWORD *)(a1 + 28464) = v18;
    }
    ACAMAgingModel::runOneStep((uint64_t *)(a1 + 28112), a1 + 28192, (double *)(a1 + 28312), (double *)(a1 + 28624), a1 + 28832);
    ACAMAgingUpdator::runOneStep((double **)(a1 + 28160), (double *)(a1 + 28624), (double *)(a1 + 28760));
    *(_OWORD *)(a1 + 28272) = *(_OWORD *)(a1 + 28232);
    *(_OWORD *)(a1 + 28288) = *(_OWORD *)(a1 + 28248);
    *(_QWORD *)(a1 + 28304) = *(_QWORD *)(a1 + 28264);
    v19 = *(_OWORD *)(a1 + 28496);
    *(_OWORD *)(a1 + 28584) = *(_OWORD *)(a1 + 28480);
    *(_OWORD *)(a1 + 28600) = v19;
    *(_QWORD *)(a1 + 28616) = *(_QWORD *)(a1 + 28512);
    v20 = *(_OWORD *)(a1 + 28432);
    *(_OWORD *)(a1 + 28520) = *(_OWORD *)v15;
    *(_OWORD *)(a1 + 28536) = v20;
    v21 = *(_OWORD *)(a1 + 28464);
    *(_OWORD *)(a1 + 28552) = *(_OWORD *)(a1 + 28448);
    *(_OWORD *)(a1 + 28568) = v21;
    v22 = *(_OWORD *)(a1 + 28192);
    *(_OWORD *)(a1 + 28248) = *(_OWORD *)(a1 + 28208);
    *(_OWORD *)(a1 + 28232) = v22;
    *(_QWORD *)(a1 + 28264) = *(_QWORD *)(a1 + 28224);
    v23 = *(_OWORD *)(a1 + 28328);
    *(_OWORD *)v15 = *v14;
    *(_OWORD *)(a1 + 28432) = v23;
    *(_QWORD *)(a1 + 28512) = *(_QWORD *)(a1 + 28408);
    v24 = *(_OWORD *)(a1 + 28392);
    *(_OWORD *)(a1 + 28480) = *(_OWORD *)(a1 + 28376);
    *(_OWORD *)(a1 + 28496) = v24;
    result = *(__n128 *)(a1 + 28360);
    *(_OWORD *)(a1 + 28448) = *(_OWORD *)(a1 + 28344);
    *(__n128 *)(a1 + 28464) = result;
  }
  return result;
}

__n128 ACAM::updateStates(ACAM *this)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;

  *((_OWORD *)this + 1767) = *(_OWORD *)((char *)this + 28232);
  *((_OWORD *)this + 1768) = *(_OWORD *)((char *)this + 28248);
  v1 = *((_OWORD *)this + 1779);
  v2 = *((_OWORD *)this + 1781);
  *(_OWORD *)((char *)this + 28584) = *((_OWORD *)this + 1780);
  *(_OWORD *)((char *)this + 28600) = v2;
  v3 = *((_OWORD *)this + 1777);
  *(_OWORD *)((char *)this + 28520) = *((_OWORD *)this + 1776);
  *(_OWORD *)((char *)this + 28536) = v3;
  *(_OWORD *)((char *)this + 28552) = *((_OWORD *)this + 1778);
  *(_OWORD *)((char *)this + 28568) = v1;
  *(_OWORD *)((char *)this + 28248) = *((_OWORD *)this + 1763);
  *(_OWORD *)((char *)this + 28232) = *((_OWORD *)this + 1762);
  v4 = *(_OWORD *)((char *)this + 28312);
  *((_OWORD *)this + 1777) = *(_OWORD *)((char *)this + 28328);
  v5 = *(_OWORD *)((char *)this + 28376);
  *((_OWORD *)this + 1781) = *(_OWORD *)((char *)this + 28392);
  *((_OWORD *)this + 1780) = v5;
  v7 = *(_OWORD *)((char *)this + 28344);
  result = *(__n128 *)((char *)this + 28360);
  *((__n128 *)this + 1779) = result;
  *((_OWORD *)this + 1778) = v7;
  *((_QWORD *)this + 3538) = *((_QWORD *)this + 3533);
  *((_QWORD *)this + 3577) = *((_QWORD *)this + 3564);
  *((_QWORD *)this + 3533) = *((_QWORD *)this + 3528);
  *((_QWORD *)this + 3564) = *((_QWORD *)this + 3551);
  *((_OWORD *)this + 1776) = v4;
  return result;
}

void ACAM::runOnce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6;
  uint64_t *v7;
  __int128 *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __n128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _OWORD v43[2];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t __dst[83];
  __int128 v49;
  uint64_t v50;
  __int16 v51;
  std::string v52;
  __int128 v53;
  std::string __p;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t __src[83];
  __int128 v60;
  uint64_t v61;
  __int16 v62;
  std::string __s;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  if (*(_BYTE *)a1)
  {
    if (!a3)
      return;
  }
  else
  {
    printf("Not yet initialized");
    if (!a3)
      return;
  }
  v6 = 0;
  v7 = (uint64_t *)(a1 + 29096);
  v8 = (__int128 *)(a1 + 28192);
  v32 = (unint64_t)fmax((double)*(unint64_t *)(a1 + 7064), (double)*(unint64_t *)(a1 + 7048));
  do
  {
    v9 = (__int128 *)(a2 + 40 * v6);
    v10 = v9[1];
    v45 = *v9;
    v46 = v10;
    v47 = *((_QWORD *)v9 + 4);
    v43[0] = v45;
    v43[1] = v10;
    v44 = v47;
    simpleList<ACAMBatteryState>::append(v7, (uint64_t)v43);
    if (*(_QWORD *)(a1 + 29112) > v32)
      simpleList<ACAMBatteryState>::remove(v7, 0);
    ACAM::updateDynamicConfiguration((double *)a1, (uint64_t)v7, 1, (double *)(a1 + 28936), *(double *)(a4 + 32));
    v11 = v46;
    *v8 = v45;
    *(_OWORD *)(a1 + 28208) = v11;
    *(_QWORD *)(a1 + 28224) = v47;
    ACAMStatus::setDataErrorStatus(a1 + 28952, a1 + 28232, (double *)(a1 + 28192), (double *)(a1 + 28624), (double *)(a1 + 7472), (double *)(a1 + 6840));
    ACAM::recordStatistics(a1);
    if (ACAMStatus::interpolationRequired((ACAMStatus *)(a1 + 28952)))
    {
      v40 = *(_OWORD *)(a1 + 28232);
      v41 = *(_OWORD *)(a1 + 28248);
      v42 = *(_QWORD *)(a1 + 28264);
      v12 = operator new();
      *(_QWORD *)(v12 + 40) = 0;
      *(_QWORD *)(v12 + 48) = 0;
      *(_OWORD *)v12 = v40;
      *(_OWORD *)(v12 + 16) = v41;
      *(_QWORD *)(v12 + 32) = v42;
      __src[0] = v12;
      __src[1] = v12;
      v37 = *v8;
      v38 = *(_OWORD *)(a1 + 28208);
      v39 = *(_QWORD *)(a1 + 28224);
      __src[2] = 2;
      v13 = operator new();
      *(_QWORD *)(v12 + 40) = v13;
      *(_OWORD *)v13 = v37;
      *(_OWORD *)(v13 + 16) = v38;
      *(_QWORD *)(v13 + 32) = v39;
      *(_QWORD *)(v13 + 40) = 0;
      *(_QWORD *)(v13 + 48) = v12;
      __src[1] = v13;
      *(double *)(v12 + 24) = *(double *)(a1 + 28936) + *(double *)(v12 + 24);
      memset(__dst, 0, 24);
      ACAM::expandBatteryStates(a1, __src, __dst, *(double *)(a1 + 28792), *(double *)(a1 + 7472));
      if (__dst[2])
      {
        v14 = 0;
        do
        {
          v15 = simpleList<ACAMBatteryState>::get(__dst, v14);
          ACAM::runOneStep(a1, v15);
          ++v14;
        }
        while (v14 < __dst[2]);
      }
      v16 = __dst[0];
      if (__dst[0])
      {
        do
        {
          v17 = *(_QWORD *)(v16 + 40);
          MEMORY[0x23B8057D4]();
          v16 = v17;
        }
        while (v17);
      }
      do
      {
        v18 = *(_QWORD *)(v12 + 40);
        MEMORY[0x23B8057D4](v12, 0x1020C40D8E0519ALL);
        v12 = v18;
      }
      while (v18);
      v7 = (uint64_t *)(a1 + 29096);
    }
    else
    {
      ACAM::runOneStep(a1, (uint64_t)&v45);
    }
    if (a5)
    {
      __src[75] = 0;
      memset(&__s, 0, sizeof(__s));
      memset(&__src[77], 0, 48);
      v60 = 0u;
      v61 = 0;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      ACAMPersistentStates::retrieve((ACAMPersistentStates *)__src, (const ACAM *)a1);
      memcpy(__dst, __src, sizeof(__dst));
      v49 = v60;
      v50 = v61;
      v51 = v62;
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v52, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      else
        v52 = __s;
      v53 = v64;
      if (SBYTE7(v66) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v65, *((std::string::size_type *)&v65 + 1));
      }
      else
      {
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v65;
        __p.__r_.__value_.__r.__words[2] = v66;
      }
      v55 = 0;
      v56 = 0;
      v57 = 0;
      v19 = (__int128 *)*((_QWORD *)&v66 + 1);
      if (*((_QWORD *)&v66 + 1))
      {
        v20 = 0;
        v21 = 0;
        while (1)
        {
          v22 = v19[1];
          v69 = *v19;
          v70 = v22;
          v71 = *((_QWORD *)v19 + 4);
          v57 = v20 + 1;
          v23 = operator new();
          *(_QWORD *)(v23 + 40) = 0;
          if (v21)
          {
            v24 = v56;
            *(_QWORD *)(v56 + 40) = v23;
            v25 = v70;
            *(_OWORD *)v23 = v69;
            *(_OWORD *)(v23 + 16) = v25;
            *(_QWORD *)(v23 + 32) = v71;
            *(_QWORD *)(v23 + 48) = v24;
          }
          else
          {
            *(_QWORD *)(v23 + 48) = 0;
            v55 = v23;
            v26 = v70;
            *(_OWORD *)v23 = v69;
            *(_OWORD *)(v23 + 16) = v26;
            *(_QWORD *)(v23 + 32) = v71;
          }
          v56 = v23;
          v19 = (__int128 *)*((_QWORD *)v19 + 5);
          if (!v19)
            break;
          v21 = v55;
          v20 = v57;
        }
      }
      v58 = v68;
      v27 = simpleList<ACAMPersistentStates>::append(a5, (uint64_t)__dst);
      v28 = v55;
      if (v55)
      {
        do
        {
          v29 = *(_QWORD *)(v28 + 40);
          MEMORY[0x23B8057D4](v27);
          v28 = v29;
        }
        while (v29);
      }
      v55 = 0;
      v56 = 0;
      v57 = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v52.__r_.__value_.__l.__data_);
      v30 = *((_QWORD *)&v66 + 1);
      if (*((_QWORD *)&v66 + 1))
      {
        do
        {
          v31 = *(_QWORD *)(v30 + 40);
          MEMORY[0x23B8057D4](v27);
          v30 = v31;
        }
        while (v31);
      }
      *((_QWORD *)&v66 + 1) = 0;
      v67 = 0uLL;
      if (SBYTE7(v66) < 0)
        operator delete((void *)v65);
      v7 = (uint64_t *)(a1 + 29096);
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__s.__r_.__value_.__l.__data_);
    }
    ++v6;
  }
  while (v6 != a3);
}

void sub_236E606B8(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x43F]) < 0)
    operator delete((void *)STACK[0x428]);
  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)&STACK[0x490]);
  _Unwind_Resume(a1);
}

uint64_t ACAM::recordStatistics(uint64_t this)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;

  v1 = *(double *)(this + 28224) - *(double *)(this + 28264);
  v2 = -48;
  while (1)
  {
    v3 = this + v2;
    if (v2 == -8)
      v4 = INFINITY;
    else
      v4 = *(double *)(v3 + 7224);
    v5 = *(double *)(v3 + 7216);
    if (v5 == v4)
    {
      if (v1 == v5)
        goto LABEL_22;
      goto LABEL_20;
    }
    if (v4 <= v5)
      break;
    if (v1 >= v5 && v1 < v4)
      goto LABEL_22;
LABEL_20:
    v2 += 8;
    if (!v2)
      return this;
  }
  if (v1 >= v5 || v1 < v4)
    goto LABEL_20;
LABEL_22:
  ++*(_QWORD *)(this + v2 + 29096);
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25086D328, MEMORY[0x24BEDAAF0]);
}

void sub_236E608D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

uint64_t ACAMStatus::computeAlgoStatus(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  int v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const void **v12;
  unsigned __int8 *v13;
  uint64_t v15;
  BOOL v16;

  if (!*(_BYTE *)a2)
    return 2;
  v5 = *(unsigned __int8 *)(a1 + 95);
  v6 = *(unsigned __int8 *)(a1 + 95);
  v7 = *(_QWORD *)(a1 + 80);
  if ((v5 & 0x80u) == 0)
    v8 = *(unsigned __int8 *)(a1 + 95);
  else
    v8 = *(_QWORD *)(a1 + 80);
  v9 = *(unsigned __int8 *)(a2 + 71);
  v10 = (char)v9;
  if ((v9 & 0x80u) != 0)
    v9 = *(_QWORD *)(a2 + 56);
  if (v8 != v9)
  {
LABEL_17:
    if ((v6 & 0x80) == 0)
    {
      if (!*(_BYTE *)(a1 + 95))
        return 0;
      goto LABEL_22;
    }
LABEL_21:
    if (!v7)
      return 0;
LABEL_22:
    *(_BYTE *)(a1 + 25) = 1;
    std::string::operator=((std::string *)(a1 + 32), *(_BYTE *)(a1 + 56));
    return 0;
  }
  v12 = (const void **)(a1 + 72);
  if (v10 >= 0)
    v13 = (unsigned __int8 *)(a2 + 48);
  else
    v13 = *(unsigned __int8 **)(a2 + 48);
  if ((v6 & 0x80) != 0)
  {
    if (memcmp(*v12, v13, v7))
      goto LABEL_21;
  }
  else if (*(_BYTE *)(a1 + 95))
  {
    while (*(unsigned __int8 *)v12 == *v13)
    {
      v12 = (const void **)((char *)v12 + 1);
      ++v13;
      if (!--v5)
        goto LABEL_23;
    }
    goto LABEL_17;
  }
LABEL_23:
  v15 = *(_QWORD *)(a1 + 64);
  if (v15)
    v16 = v15 == *(_QWORD *)(a2 + 40);
  else
    v16 = 0;
  if (!v16 || a3[1] != 0 || *a3 != 0)
    return 0;
  if ((v6 & 0x80) != 0)
  {
    if (!v7)
      return 0xFFFFFFFFLL;
  }
  else if (!v6)
  {
    return 0xFFFFFFFFLL;
  }
  if (*(_QWORD *)(a1 + 56) > *(_QWORD *)(a2 + 32))
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t ACAMStatus::setAlgoStatusBuffer(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const void **v18;
  unsigned __int8 *v19;

  result = ACAMStatus::computeAlgoStatus(a1, a2, a3);
  v7 = result;
  *(_DWORD *)(a1 + 4) = result;
  v8 = *(_DWORD *)a1;
  if (!(*(_DWORD *)a1 | result))
  {
    v9 = 256;
    goto LABEL_23;
  }
  if (!v8)
  {
    if ((_DWORD)result == 2)
      v9 = 1536;
    else
      v9 = 3584;
    v10 = (_DWORD)result == 1;
    v11 = 512;
    goto LABEL_12;
  }
  if (v8 == 2)
  {
    if (!(_DWORD)result)
    {
      v9 = 1792;
      goto LABEL_23;
    }
    if ((_DWORD)result == 2)
    {
      v9 = 2048;
      goto LABEL_23;
    }
LABEL_21:
    v9 = 3584;
    goto LABEL_23;
  }
  if (v8 != 1)
    goto LABEL_21;
  if ((_DWORD)result == 1)
  {
    v9 = 768;
    goto LABEL_23;
  }
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 2)
    {
      v9 = 1536;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a2 + 40);
  if (v12 | v13 && v12 != v13)
  {
    v9 = 1024;
    goto LABEL_23;
  }
  v14 = *(unsigned __int8 *)(a1 + 95);
  if ((v14 & 0x80u) == 0)
    v15 = *(unsigned __int8 *)(a1 + 95);
  else
    v15 = *(_QWORD *)(a1 + 80);
  v16 = *(unsigned __int8 *)(a2 + 71);
  v17 = (char)v16;
  if ((v16 & 0x80u) != 0)
    v16 = *(_QWORD *)(a2 + 56);
  if (v15 != v16)
    goto LABEL_43;
  v18 = (const void **)(a1 + 72);
  if (v17 >= 0)
    v19 = (unsigned __int8 *)(a2 + 48);
  else
    v19 = *(unsigned __int8 **)(a2 + 48);
  if ((v14 & 0x80) != 0)
  {
    result = memcmp(*v18, v19, *(_QWORD *)(a1 + 80));
    if ((_DWORD)result)
    {
LABEL_43:
      v9 = 1280;
      goto LABEL_23;
    }
  }
  else if (*(_BYTE *)(a1 + 95))
  {
    while (*(unsigned __int8 *)v18 == *v19)
    {
      v18 = (const void **)((char *)v18 + 1);
      ++v19;
      if (!--v14)
        goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_44:
  if (*a3)
  {
    v9 = 2304;
    goto LABEL_23;
  }
  v10 = a3[1] == 0;
  v9 = 2560;
  v11 = 3840;
LABEL_12:
  if (v10)
    v9 = v11;
LABEL_23:
  if ((*(_DWORD *)(a1 + 12) & 0xF00) != v9)
  {
    *(_DWORD *)(a1 + 12) = (16 * *(_DWORD *)(a1 + 12)) & 0xFFFFF000 | *(_DWORD *)(a1 + 12) | v9;
    *(_DWORD *)a1 = v7;
    *(_WORD *)(a1 + 24) = *(_WORD *)a2;
    std::string::operator=((std::string *)(a1 + 32), (const std::string *)(a2 + 8));
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 32);
    return (uint64_t)std::string::operator=((std::string *)(a1 + 72), (const std::string *)(a2 + 48));
  }
  return result;
}

uint64_t ACAMStatus::setDataErrorStatus(uint64_t result, uint64_t a2, double *a3, double *a4, double *a5, double *a6)
{
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;

  v6 = a3[4] - *(double *)(a2 + 32);
  v7 = *a5;
  if (v6 >= 0.0)
    v8 = (v6 > *a5) << 7;
  else
    v8 = ((v6 > *a5) << 7) | 0x40;
  *(_DWORD *)(result + 8) = 0;
  if (v6 > v7 || v6 < 0.0)
    *(_DWORD *)(result + 8) = v8;
  v9 = *a3;
  if (*a3 < a5[2])
  {
    v8 |= 0x20u;
    *(_DWORD *)(result + 8) = v8;
  }
  if (v9 > a5[1])
  {
    v8 |= 0x10u;
    *(_DWORD *)(result + 8) = v8;
  }
  v10 = a3[1];
  v11 = a5[3];
  if (v10 > v11 * *a6 || v10 < *a6 * a5[4])
  {
    v8 |= 8u;
    *(_DWORD *)(result + 8) = v8;
  }
  if (v6 > 0.0 && fabs((a3[3] - *(double *)(a2 + 24)) / (v6 / 3600.0)) > fmax(fabs(v11), fabs(a5[4])))
  {
    v8 |= 8u;
    *(_DWORD *)(result + 8) = v8;
  }
  v12 = a3[2];
  v13 = v12 > a5[5];
  if (v12 < a5[6])
    v13 = 1;
  if (v13)
    v8 |= 4u;
  if (v6 > 31536000.0)
    v8 |= 2u;
  if (v13 || v6 > 31536000.0)
    *(_DWORD *)(result + 8) = v8;
  if (a4[12] < a5[7] || a4[7] < a5[8] || a4[13] < a5[9])
  {
    v8 |= 1u;
    *(_DWORD *)(result + 8) = v8;
  }
  *(_DWORD *)(result + 12) |= v8;
  return result;
}

uint64_t ACAMStatus::setInitType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t ACAMStatus::setFreshInitReason(uint64_t result, int a2)
{
  *(_DWORD *)(result + 20) = a2;
  return result;
}

BOOL ACAMStatus::skipAlgoRunning(ACAMStatus *this)
{
  return (*((_BYTE *)this + 8) & 0x7F) != 0;
}

BOOL ACAMStatus::interpolationRequired(ACAMStatus *this)
{
  return *((unsigned __int8 *)this + 8) == 128;
}

BOOL ACAMStatus::initializationRequired(ACAMStatus *this)
{
  return *((_DWORD *)this + 1) == 0;
}

_QWORD *ACAMPerformanceModelParameter::_assignMemory(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, int a5)
{
  _QWORD *result;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  double *v25;
  BOOL v26;
  uint64_t v27;
  char v28;

  result = (_QWORD *)operator new[]();
  *a2 = result;
  if (a4)
  {
    v11 = 0;
    v13 = *a1;
    v12 = a1 + 1;
    v14 = v12[a5];
    v15 = v12[a5 + 1];
    v16 = v13 + 8 * v14;
    v17 = (v15 - v14) / (unint64_t)(a4 * a3);
    v18 = v17 >> 1;
    do
    {
      result = (_QWORD *)operator new[]();
      *result = 32;
      result[1] = a3;
      v19 = result + 2;
      if (a3)
      {
        v20 = result + 2;
        do
        {
          *v20 = 0;
          v20[1] = 0;
          *((_BYTE *)v20 + 16) = 0;
          v20[3] = 0;
          v20 += 4;
        }
        while (v20 != &v19[4 * a3]);
        v21 = 0;
        v22 = 0;
        *(_QWORD *)(*a2 + 8 * v11) = v19;
        v23 = a3;
        do
        {
          v24 = (double *)(v16 + 8 * (v22 + v11 * a3) * v17);
          v25 = &v24[v18];
          v26 = *v24 <= v24[(v17 >> 1) - 1];
          v27 = *(_QWORD *)(*a2 + 8 * v11) + v21;
          *(_QWORD *)v27 = v24;
          *(_QWORD *)(v27 + 8) = v18;
          v28 = !v26;
          *(_BYTE *)(v27 + 16) = v28;
          *(_QWORD *)(v27 + 24) = v25;
          ++v22;
          v21 += 32;
          --v23;
        }
        while (v23);
      }
      else
      {
        *(_QWORD *)(*a2 + 8 * v11) = v19;
      }
      ++v11;
    }
    while (v11 != a4);
  }
  return result;
}

_QWORD *ACAMPerformanceModelParameter::_assignMemory(uint64_t *a1, uint64_t a2, int a3)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  unint64_t v7;
  double *v8;
  BOOL v9;
  char v10;

  v4 = *a1;
  result = a1 + 1;
  v5 = result[a3];
  v6 = (double *)(v4 + 8 * v5);
  v7 = (unint64_t)(result[a3 + 1] - v5) >> 1;
  v8 = &v6[v7];
  v9 = *v6 <= *(v8 - 1);
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  v10 = !v9;
  *(_BYTE *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  uint64_t v7;

  v4 = *a1;
  result = a1 + 1;
  v5 = result[a3];
  v6 = (double *)(v4 + 8 * v5);
  v7 = result[a3 + 1] - v5;
  LOBYTE(v5) = *v6 > v6[v7 - 1];
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v5;
  return result;
}

_QWORD *ACAMPerformanceModelParameter::_assignAddress(ACAMPerformanceModelParameter *this)
{
  uint64_t v2;
  uint64_t v3;
  double *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double *v8;
  BOOL v9;
  double *v10;
  unint64_t v11;
  double *v12;
  BOOL v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  unint64_t v25;
  double *v26;
  double *v27;
  unint64_t v28;
  double *v29;

  v2 = *(_QWORD *)this;
  v3 = *((_QWORD *)this + 1);
  v4 = (double *)(*(_QWORD *)this + 8 * v3);
  v5 = *((_QWORD *)this + 2);
  v6 = *((_QWORD *)this + 3);
  v7 = (unint64_t)(v5 - v3) >> 1;
  v8 = &v4[v7];
  v9 = *v4 > *(v8 - 1);
  *((_QWORD *)this + 13) = v4;
  *((_QWORD *)this + 14) = v7;
  *((_BYTE *)this + 120) = v9;
  v10 = (double *)(v2 + 8 * v5);
  v11 = (unint64_t)(v6 - v5) >> 1;
  v12 = &v10[v11];
  v13 = *v10 > *(v12 - 1);
  *((_QWORD *)this + 16) = v8;
  *((_QWORD *)this + 17) = v10;
  *((_QWORD *)this + 18) = v11;
  *((_BYTE *)this + 152) = v13;
  v14 = (double *)(v2 + 8 * v6);
  v15 = *((_QWORD *)this + 4);
  v16 = *((_QWORD *)this + 5);
  v17 = v15 - v6;
  LOBYTE(v6) = *v14 > v14[v15 - v6 - 1];
  *((_QWORD *)this + 20) = v12;
  *((_QWORD *)this + 21) = v14;
  *((_QWORD *)this + 22) = v17;
  *((_BYTE *)this + 184) = v6;
  v18 = (double *)(v2 + 8 * v15);
  v19 = v16 - v15;
  LOBYTE(v15) = *v18 > v18[v16 - v15 - 1];
  *((_QWORD *)this + 24) = v18;
  *((_QWORD *)this + 25) = v19;
  *((_BYTE *)this + 208) = v15;
  v20 = (double *)(v2 + 8 * v16);
  v21 = *((_QWORD *)this + 6) - v16;
  LOBYTE(v15) = *v20 > v20[v21 - 1];
  *((_QWORD *)this + 27) = v20;
  *((_QWORD *)this + 28) = v21;
  *((_BYTE *)this + 232) = v15;
  v22 = *((_QWORD *)this + 10);
  v23 = *((_QWORD *)this + 11);
  v24 = (double *)(v2 + 8 * v22);
  v25 = (unint64_t)(v23 - v22) >> 1;
  v26 = &v24[v25];
  LOBYTE(v16) = *v24 > *(v26 - 1);
  *((_QWORD *)this + 34) = v24;
  *((_QWORD *)this + 35) = v25;
  *((_BYTE *)this + 288) = v16;
  v27 = (double *)(v2 + 8 * v23);
  v28 = (unint64_t)(*((_QWORD *)this + 12) - v23) >> 1;
  v29 = &v27[v28];
  LOBYTE(v24) = *v27 > *(v29 - 1);
  *((_QWORD *)this + 37) = v26;
  *((_QWORD *)this + 38) = v27;
  *((_QWORD *)this + 39) = v28;
  *((_BYTE *)this + 320) = (_BYTE)v24;
  *((_QWORD *)this + 41) = v29;
  ACAMPerformanceModelParameter::_assignMemory((uint64_t *)this, (_QWORD *)this + 30, v19, v17, 5);
  ACAMPerformanceModelParameter::_assignMemory((uint64_t *)this, (_QWORD *)this + 31, v19, v17, 6);
  ACAMPerformanceModelParameter::_assignMemory((uint64_t *)this, (_QWORD *)this + 32, v21, v17, 7);
  return ACAMPerformanceModelParameter::_assignMemory((uint64_t *)this, (_QWORD *)this + 33, v21, v17, 8);
}

void *ACAMPerformanceModelParameter::_deepCopyFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *result;

  memcpy(*(void **)(a1 + 104), *(const void **)(a2 + 104), 8 * *(_QWORD *)(a2 + 112));
  memcpy(*(void **)(a1 + 128), *(const void **)(a2 + 128), 8 * *(_QWORD *)(a2 + 112));
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  memcpy(*(void **)(a1 + 136), *(const void **)(a2 + 136), 8 * *(_QWORD *)(a2 + 144));
  memcpy(*(void **)(a1 + 160), *(const void **)(a2 + 160), 8 * *(_QWORD *)(a2 + 144));
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  memcpy(*(void **)(a1 + 168), *(const void **)(a2 + 168), 8 * *(_QWORD *)(a2 + 176));
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  memcpy(*(void **)(a1 + 192), *(const void **)(a2 + 192), 8 * *(_QWORD *)(a2 + 200));
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  memcpy(*(void **)(a1 + 216), *(const void **)(a2 + 216), 8 * *(_QWORD *)(a2 + 224));
  v4 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 224) = v4;
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  v5 = *(_QWORD *)(a1 + 176);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)(a1 + 200);
    do
    {
      if (v7)
      {
        v8 = 16;
        v9 = v7;
        do
        {
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8 * v6) + v8;
          v11 = *(_QWORD *)(*(_QWORD *)(a2 + 240) + 8 * v6) + v8;
          memcpy(*(void **)(v10 - 16), *(const void **)(v11 - 16), 8 * *(_QWORD *)(v11 - 8));
          memcpy(*(void **)(v10 + 8), *(const void **)(v11 + 8), 8 * *(_QWORD *)(v11 - 8));
          *(_QWORD *)(v10 - 8) = *(_QWORD *)(v11 - 8);
          *(_BYTE *)v10 = *(_BYTE *)v11;
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 248) + 8 * v6) + v8;
          v13 = *(_QWORD *)(*(_QWORD *)(a2 + 248) + 8 * v6) + v8;
          memcpy(*(void **)(v12 - 16), *(const void **)(v13 - 16), 8 * *(_QWORD *)(v13 - 8));
          memcpy(*(void **)(v12 + 8), *(const void **)(v13 + 8), 8 * *(_QWORD *)(v13 - 8));
          *(_QWORD *)(v12 - 8) = *(_QWORD *)(v13 - 8);
          *(_BYTE *)v12 = *(_BYTE *)v13;
          v8 += 32;
          --v9;
        }
        while (v9);
      }
      if (v4)
      {
        v14 = 16;
        v15 = v4;
        do
        {
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8 * v6) + v14;
          v17 = *(_QWORD *)(*(_QWORD *)(a2 + 256) + 8 * v6) + v14;
          memcpy(*(void **)(v16 - 16), *(const void **)(v17 - 16), 8 * *(_QWORD *)(v17 - 8));
          memcpy(*(void **)(v16 + 8), *(const void **)(v17 + 8), 8 * *(_QWORD *)(v17 - 8));
          *(_QWORD *)(v16 - 8) = *(_QWORD *)(v17 - 8);
          *(_BYTE *)v16 = *(_BYTE *)v17;
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * v6) + v14;
          v19 = *(_QWORD *)(*(_QWORD *)(a2 + 264) + 8 * v6) + v14;
          memcpy(*(void **)(v18 - 16), *(const void **)(v19 - 16), 8 * *(_QWORD *)(v19 - 8));
          memcpy(*(void **)(v18 + 8), *(const void **)(v19 + 8), 8 * *(_QWORD *)(v19 - 8));
          *(_QWORD *)(v18 - 8) = *(_QWORD *)(v19 - 8);
          *(_BYTE *)v18 = *(_BYTE *)v19;
          v14 += 32;
          --v15;
        }
        while (v15);
      }
      ++v6;
    }
    while (v6 != v5);
  }
  memcpy(*(void **)(a1 + 272), *(const void **)(a2 + 272), 8 * *(_QWORD *)(a2 + 280));
  memcpy(*(void **)(a1 + 296), *(const void **)(a2 + 296), 8 * *(_QWORD *)(a2 + 280));
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_BYTE *)(a1 + 288) = *(_BYTE *)(a2 + 288);
  memcpy(*(void **)(a1 + 304), *(const void **)(a2 + 304), 8 * *(_QWORD *)(a2 + 312));
  result = memcpy(*(void **)(a1 + 328), *(const void **)(a2 + 328), 8 * *(_QWORD *)(a2 + 312));
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  return result;
}

void ACAMPerformanceModelParameter::ACAMPerformanceModelParameter(ACAMPerformanceModelParameter *this, ACAMPerformanceModelParameter *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_BYTE *)this + 120) = 0;
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  *((_BYTE *)this + 208) = 0;
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 28) = 0;
  *((_BYTE *)this + 232) = 0;
  *((_QWORD *)this + 34) = 0;
  *((_QWORD *)this + 35) = 0;
  *((_BYTE *)this + 288) = 0;
  *((_QWORD *)this + 41) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_BYTE *)this + 152) = 0;
  *((_QWORD *)this + 20) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_BYTE *)this + 184) = 0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 38) = 0;
  *((_QWORD *)this + 39) = 0;
  *((_QWORD *)this + 37) = 0;
  *((_BYTE *)this + 320) = 0;
  v4 = *(_OWORD *)((char *)a2 + 8);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)this + 8) = v4;
  v5 = *(_OWORD *)((char *)a2 + 40);
  v6 = *(_OWORD *)((char *)a2 + 56);
  v7 = *(_OWORD *)((char *)a2 + 72);
  *(_OWORD *)((char *)this + 88) = *(_OWORD *)((char *)a2 + 88);
  *(_OWORD *)((char *)this + 72) = v7;
  *(_OWORD *)((char *)this + 56) = v6;
  *(_OWORD *)((char *)this + 40) = v5;
  *(_QWORD *)this = operator new[]();
  ACAMPerformanceModelParameter::_assignAddress(this);
  ACAMPerformanceModelParameter::_deepCopyFrom((uint64_t)this, (uint64_t)a2);
}

uint64_t ACAMPerformanceModelParameter::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    if (memcmp((const void *)(a1 + 8), (const void *)(a2 + 8), 0x60uLL))
      puts("_fieldOffset does not match");
    ACAMPerformanceModelParameter::_deepCopyFrom(a1, a2);
  }
  return a1;
}

void ACAMPerformanceModelParameter::~ACAMPerformanceModelParameter(ACAMPerformanceModelParameter *this)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *((_QWORD *)this + 22);
  if (v2)
  {
    for (i = 0; i != v2; ++i)
    {
      v4 = *(_QWORD *)(*((_QWORD *)this + 30) + 8 * i);
      if (v4)
        MEMORY[0x23B8057BC](v4 - 16, 0x10C0C803734C2A0);
      v5 = *(_QWORD *)(*((_QWORD *)this + 31) + 8 * i);
      if (v5)
        MEMORY[0x23B8057BC](v5 - 16, 0x10C0C803734C2A0);
      v6 = *(_QWORD *)(*((_QWORD *)this + 32) + 8 * i);
      if (v6)
        MEMORY[0x23B8057BC](v6 - 16, 0x10C0C803734C2A0);
      v7 = *(_QWORD *)(*((_QWORD *)this + 33) + 8 * i);
      if (v7)
        MEMORY[0x23B8057BC](v7 - 16, 0x10C0C803734C2A0);
    }
  }
  v8 = *((_QWORD *)this + 30);
  if (v8)
    MEMORY[0x23B8057BC](v8, 0x20C8093837F09);
  v9 = *((_QWORD *)this + 31);
  if (v9)
    MEMORY[0x23B8057BC](v9, 0x20C8093837F09);
  v10 = *((_QWORD *)this + 32);
  if (v10)
    MEMORY[0x23B8057BC](v10, 0x20C8093837F09);
  v11 = *((_QWORD *)this + 33);
  if (v11)
    MEMORY[0x23B8057BC](v11, 0x20C8093837F09);
  if (*(_QWORD *)this)
    MEMORY[0x23B8057BC](*(_QWORD *)this, 0x1000C8000313F17);
}

_QWORD *ACAMPerformanceModel::ACAMPerformanceModel(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

{
  *result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

double ACAMPerformanceModel::runOneStep(uint64_t **a1, double *a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  double v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double *v35;
  double v36;
  double result;
  float64x2_t v38;
  double v39;
  double v40;
  double v41;
  double v42;

  v8 = *(double *)a3;
  v9 = *(double *)(a3 + 8);
  v10 = *(double *)a3 + a2[3] * (v9 - *(double *)a3);
  if (v10 >= *(double *)a3)
    v8 = *(double *)a3 + a2[3] * (v9 - *(double *)a3);
  if (v10 <= v9)
    v11 = v8;
  else
    v11 = *(double *)(a3 + 8);
  *(double *)a4 = v11;
  v12 = *(double *)(a3 + 16);
  v13 = *(double *)(a3 + 24);
  v14 = v12 + a2[3] * (v13 - v12);
  if (v14 >= v13)
    v13 = v12 + a2[3] * (v13 - v12);
  if (v14 <= v12)
    v15 = v13;
  else
    v15 = *(double *)(a3 + 16);
  *(double *)(a4 + 8) = v15;
  dataTable<double>::getValue(*a1 + 13, 1, v11);
  v17 = v16;
  dataTable<double>::getValue(*a1 + 17, 1, *(double *)(a4 + 8));
  v19 = v18;
  dataTable<double>::getValueArrhenius(*a1 + 34, 1, a2[2], 273.15);
  *(_QWORD *)(a4 + 64) = v20;
  dataTable<double>::getValueArrhenius(*a1 + 38, 1, a2[2], 273.15);
  *(_QWORD *)&v22 = v21;
  *(_QWORD *)(a4 + 56) = v21;
  v23 = a2[1];
  v24 = v23 / *(double *)(a3 + 32);
  *(double *)(a4 + 48) = v24;
  if (*((_BYTE *)a1[2] + 560))
  {
    if (v23 <= 0.0)
    {
      v22 = *(_OWORD *)(a4 + 64);
      v25 = *(float64x2_t *)(a3 + 56);
    }
    else
    {
      v25 = *(float64x2_t *)(a3 + 40);
    }
    v26 = vmulq_n_f64(v25, *(double *)&v22);
  }
  else
  {
    v26 = 0uLL;
  }
  v38 = v26;
  v27 = v23 > 0.0;
  v41 = 0.0;
  v42 = 0.0;
  v39 = 0.0;
  v40 = 0.0;
  ACAMPerformanceModel::getResistance(a1, 1, &v42, v24, a2[2], *(double *)(a4 + 8));
  ACAMPerformanceModel::getResistance(a1, 0, &v41, *(double *)(a4 + 48), a2[2], *(double *)a4);
  v28 = dbl_236E72AB0[v27];
  ACAMPerformanceModel::getResistance(a1, 1, &v40, v28, a2[2], *(double *)(a4 + 8));
  ACAMPerformanceModel::getResistance(a1, 0, &v39, v28, a2[2], *(double *)a4);
  v29 = a2[1];
  v30 = v42;
  v31 = v38.f64[0] / v40;
  v32 = v19 + v29 * v42 * (v38.f64[0] / v40 + 1.0);
  v33 = v41;
  v34 = v38.f64[1] / v39;
  v35 = (double *)a1[2];
  *(double *)(a4 + 32) = fmin(fmax(v17 + -(v29 * v41) * (v38.f64[1] / v39 + 1.0), 0.0), v35[73]);
  *(double *)(a4 + 40) = fmax(fmin(v32, v35[2] + v35[71]), v35[72]);
  if (*(double *)(a4 + 24) < 0.0 || v29 * a2[6] <= 0.0 || fabs(v29) < v35[1])
    *(_OWORD *)(a4 + 16) = *(_OWORD *)a4;
  v36 = v30 * v31;
  *(double *)(a4 + 72) = v36;
  *(double *)(a4 + 80) = v33 * v34;
  result = v30 + v36;
  *(double *)(a4 + 88) = result;
  *(double *)(a4 + 96) = v33 + v33 * v34;
  return result;
}

void ACAMPerformanceModel::convertSocToX(ACAMPerformanceModel *this, double a2, double a3, double a4, double *a5)
{
  double v5;
  double v6;

  v5 = a3 + a2 * (a4 - a3);
  if (v5 >= a3)
    a3 = v5;
  if (v5 <= a4)
    v6 = a3;
  else
    v6 = a4;
  *a5 = v6;
}

void ACAMPerformanceModel::convertSocToY(ACAMPerformanceModel *this, double a2, double a3, double a4, double *a5)
{
  double v5;
  double v6;

  v5 = a3 + a2 * (a4 - a3);
  if (v5 >= a4)
    a4 = v5;
  if (v5 <= a3)
    v6 = a4;
  else
    v6 = a3;
  *a5 = v6;
}

unint64_t ACAMPerformanceModel::convertXToOcpNeg(ACAMPerformanceModel *this, double a2, double *a3)
{
  unint64_t result;
  uint64_t v5;

  result = dataTable<double>::getValue((uint64_t *)(*(_QWORD *)this + 104), 1, a2);
  *(_QWORD *)a3 = v5;
  return result;
}

unint64_t ACAMPerformanceModel::convertYToOcpPos(ACAMPerformanceModel *this, double a2, double *a3)
{
  unint64_t result;
  uint64_t v5;

  result = dataTable<double>::getValue((uint64_t *)(*(_QWORD *)this + 136), 1, a2);
  *(_QWORD *)a3 = v5;
  return result;
}

void ACAMPerformanceModel::getResistance(uint64_t **a1, int a2, _QWORD *a3, double a4, double a5, double a6)
{
  double v12;
  unint64_t Idx;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  _BOOL4 v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  __int128 v37;
  _OWORD *v38;
  __int128 v39;
  uint64_t v40;
  _OWORD *v41;
  __int128 v42;
  _OWORD *v43;
  __int128 v44;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[2];
  BOOL v60;
  _QWORD *v61;
  _OWORD v62[2];
  _OWORD v63[2];
  _OWORD v64[2];
  _OWORD v65[2];
  double v66;
  double v67;
  _QWORD v68[3];

  v68[2] = *MEMORY[0x24BDAC8D0];
  v12 = fabs(a4);
  Idx = sortedUniqueArray<double>::getIdx(*a1 + 21, -1, -1, a5);
  v14 = *a1;
  v15 = (*a1)[22] - 1;
  if (Idx < v15)
    v15 = Idx;
  if (v15 <= 1)
    v16 = 1;
  else
    v16 = v15;
  v17 = v16 - 1;
  v18 = 28;
  if (a4 > 0.0)
    v18 = 25;
  v19 = 27;
  if (a4 > 0.0)
    v19 = 24;
  v20 = v14[v19];
  v21 = v14[v18];
  if (!v21)
  {
    v22 = 0;
LABEL_23:
    if (v22)
      v30 = v22 - 1;
    else
      v30 = 0;
    v23 = v22;
    goto LABEL_27;
  }
  v22 = 0;
  v23 = v21 - 1;
  v24 = 29;
  if (a4 > 0.0)
    v24 = 26;
  v25 = LOBYTE(v14[v24]);
  do
  {
    v26 = v21 >> 1;
    v27 = v22 + (v21 >> 1);
    v28 = *(double *)(v20 + 8 * v27);
    v29 = v28 > v12;
    if (!v25)
      v29 = v28 < v12;
    v21 += ~(v21 >> 1);
    if (v29)
      v22 = v27 + 1;
    else
      v21 = v26;
  }
  while (v21);
  v30 = v23;
  if (v22 <= v23)
    goto LABEL_23;
LABEL_27:
  v31 = v14 + 32;
  if (a2 == 1)
    v31 = v14 + 33;
  v32 = v14 + 30;
  v33 = v14 + 31;
  if (a2 != 1)
    v33 = v32;
  if (a4 <= 0.0)
    v33 = v31;
  v34 = *v33;
  v35 = *(_QWORD *)(v34 + 8 * v16);
  v36 = (_OWORD *)(v35 + 32 * v23);
  v37 = v36[1];
  v65[0] = *v36;
  v65[1] = v37;
  v38 = (_OWORD *)(v35 + 32 * v30);
  v39 = v38[1];
  v64[0] = *v38;
  v64[1] = v39;
  v40 = *(_QWORD *)(v34 + 8 * v17);
  v41 = (_OWORD *)(v40 + 32 * v23);
  v42 = v41[1];
  v63[0] = *v41;
  v63[1] = v42;
  v43 = (_OWORD *)(v40 + 32 * v30);
  v44 = v43[1];
  v62[0] = *v43;
  v62[1] = v44;
  dataTable<double>::getValue((uint64_t *)v65, 0, a6);
  v46 = v45;
  dataTable<double>::getValue((uint64_t *)v64, 0, a6);
  v48 = v47;
  dataTable<double>::getValue((uint64_t *)v63, 0, a6);
  v50 = v49;
  dataTable<double>::getValue((uint64_t *)v62, 0, a6);
  if (v30 == v23)
  {
    v52 = (v50 + v51) * 0.5;
    v53 = (v46 + v48) * 0.5;
  }
  else
  {
    v54 = *(double *)(v20 + 8 * v30);
    v55 = *(double *)(v20 + 8 * v23) - v54;
    v56 = v12 - v54;
    v52 = v51 + (v50 - v51) * v56 / v55;
    v53 = v48 + (v46 - v48) * v56 / v55;
  }
  v57 = (*a1)[21];
  v66 = *(double *)(v57 + 8 * v17);
  v67 = *(double *)(v57 + 8 * v16);
  *(double *)v68 = v52;
  *(double *)&v68[1] = v53;
  v59[0] = (uint64_t)&v66;
  v59[1] = 2;
  v60 = v66 > v67;
  v61 = v68;
  dataTable<double>::getValueArrhenius(v59, 1, a5, 273.15);
  *a3 = v58;
}

float ACAMLogger::extractSBC(ACAMLogger *this, const ACAM *a2)
{
  return *((double *)this + 3543);
}

double ACAMLogger::Daily::getNCCp(ACAMLogger::Daily *this, const ACAM *a2, double *a3, double *a4)
{
  double v7;
  double v8;
  double v9;
  double result;
  double v11;

  v7 = *((double *)this + 3590) * *((double *)this + 856);
  v8 = *((double *)this + 3585) * *((double *)this + 857);
  v9 = *((double *)this + 3591) * *((double *)this + 858);
  if (*((_QWORD *)this + 913) == 2)
    ACAMAgingUpdator::getRawNCCVersion2((ACAMLogger::Daily *)((char *)this + 28160), v8, v7, v9, *((double *)this + 3599), *((double *)this + 911), *((double *)this + 3583), *((double *)this + 3595), *((double *)this + 3596), (double *)a2);
  else
    ACAMAgingUpdator::getRawNCC((double **)this + 3520, *((double *)this + 3583), v8, v7, v9, *((double *)this + 3599), *((double *)this + 911), (double *)a2);
  v11 = 0.0;
  ACAMAgingUpdator::getNCCAdjustment((ACAMLogger::Daily *)((char *)this + 28160), v7, v8, v9, *((double *)this + 3599), *((double *)this + 862), *((double *)this + 3618), &v11);
  result = (*(double *)a2 - v11) / *((double *)this + 855);
  *a3 = result;
  return result;
}

float ACAMLogger::extractDaily@<S0>(ACAMLogger *this@<X0>, double *a2@<X3>, uint64_t a3@<X8>)
{
  char *v6;
  float v7;
  float64x2_t v8;
  float64x2_t v9;
  __int128 v10;
  float result;
  float64x2_t v12;
  uint64_t v13;
  float64_t v14;

  v6 = (char *)this + 28760;
  v7 = *((double *)this + 3590);
  *(float *)a3 = v7;
  v8.f64[0] = *((float64_t *)this + 3585);
  v8.f64[1] = *((float64_t *)this + 3591);
  v12 = *(float64x2_t *)((char *)this + 28776);
  *(float32x4_t *)(a3 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), *(float64x2_t *)((char *)this + 28760));
  v13 = 0;
  v14 = 0.0;
  ACAMLogger::Daily::getNCCp(this, (const ACAM *)&v13, &v14, a2);
  v9.f64[0] = v14;
  v9.f64[1] = *((float64_t *)this + 3583);
  *(float32x4_t *)(a3 + 20) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), v9);
  *(float *)v9.f64 = *((double *)this + 3584);
  *(_DWORD *)(a3 + 36) = LODWORD(v9.f64[0]);
  v9.f64[0] = *((float64_t *)this + 3599);
  v9.f64[1] = *((float64_t *)this + 3581);
  *(float32x4_t *)(a3 + 40) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), *((float64x2_t *)this + 1789));
  *(_QWORD *)(a3 + 64) = *((int *)v6 + 51);
  v10 = *(_OWORD *)((char *)this + 29064);
  *(_OWORD *)(a3 + 72) = *(_OWORD *)((char *)this + 29048);
  *(_OWORD *)(a3 + 88) = v10;
  *(_OWORD *)(a3 + 104) = *(_OWORD *)((char *)this + 29080);
  result = *((double *)this + 3617);
  *(float *)(a3 + 56) = result;
  return result;
}

float ACAMLogger::extractWeekly@<S0>(ACAMLogger *this@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5;
  int64x2_t v6;
  uint64x2_t v7;
  int64x2_t v8;
  ACAMAgingUpdator *v9;
  uint64_t i;
  float result;
  double v12[101];
  double v13[101];
  double v14[102];

  v5 = 0;
  v14[101] = *(double *)MEMORY[0x24BDAC8D0];
  v6 = (int64x2_t)xmmword_236E72A60;
  v7 = (uint64x2_t)vdupq_n_s64(0x65uLL);
  v8 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v7, (uint64x2_t)v6)).u8[0] & 1) != 0)
      v14[v5] = (double)v5 * 0.01;
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x65uLL), *(uint64x2_t *)&v6)).i32[1] & 1) != 0)
      v14[v5 + 1] = (double)(v5 + 1) * 0.01;
    v5 += 2;
    v6 = vaddq_s64(v6, v8);
  }
  while (v5 != 102);
  v9 = (ACAMLogger *)((char *)this + 28160);
  ACAMAgingUpdator::getOCV((ACAMLogger *)((char *)this + 28160), *((double *)this + 3590) * *((double *)this + 856), *((double *)this + 3585) * *((double *)this + 857), *((double *)this + 3591) * *((double *)this + 858), v14, 101, v13);
  ACAMAgingUpdator::getOCV(v9, *((double *)this + 856), *((double *)this + 857), *((double *)this + 858), v14, 101, v12);
  for (i = 0; i != 101; ++i)
  {
    result = v13[i] - v12[i];
    *(float *)(a2 + 4 * i) = result;
  }
  return result;
}

uint64_t *ACAMPersistentStates::retrieve(ACAMPersistentStates *this, const ACAM *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
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
  uint64_t *result;

  v4 = *((_OWORD *)a2 + 1762);
  v5 = *((_OWORD *)a2 + 1763);
  *((_QWORD *)this + 9) = *((_QWORD *)a2 + 3528);
  *(_OWORD *)((char *)this + 56) = v5;
  *(_OWORD *)((char *)this + 40) = v4;
  v6 = *(_OWORD *)((char *)a2 + 28232);
  v7 = *(_OWORD *)((char *)a2 + 28248);
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 3533);
  *(_OWORD *)this = v6;
  *((_OWORD *)this + 1) = v7;
  v9 = *(_OWORD *)((char *)a2 + 28376);
  v8 = *(_OWORD *)((char *)a2 + 28392);
  v10 = *((_QWORD *)a2 + 3551);
  *(_OWORD *)((char *)this + 232) = *(_OWORD *)((char *)a2 + 28360);
  *((_QWORD *)this + 35) = v10;
  *(_OWORD *)((char *)this + 264) = v8;
  *(_OWORD *)((char *)this + 248) = v9;
  v11 = *(_OWORD *)((char *)a2 + 28312);
  v12 = *(_OWORD *)((char *)a2 + 28328);
  *(_OWORD *)((char *)this + 216) = *(_OWORD *)((char *)a2 + 28344);
  *(_OWORD *)((char *)this + 200) = v12;
  *(_OWORD *)((char *)this + 184) = v11;
  v13 = *((_OWORD *)a2 + 1780);
  v14 = *((_OWORD *)a2 + 1781);
  v15 = *((_OWORD *)a2 + 1779);
  *((_QWORD *)this + 22) = *((_QWORD *)a2 + 3564);
  *((_OWORD *)this + 9) = v13;
  *((_OWORD *)this + 10) = v14;
  *((_OWORD *)this + 8) = v15;
  v16 = *((_OWORD *)a2 + 1776);
  v17 = *((_OWORD *)a2 + 1778);
  *((_OWORD *)this + 6) = *((_OWORD *)a2 + 1777);
  *((_OWORD *)this + 7) = v17;
  *((_OWORD *)this + 5) = v16;
  *((_OWORD *)this + 18) = *((_OWORD *)a2 + 1789);
  v18 = *((_OWORD *)a2 + 1790);
  v19 = *((_OWORD *)a2 + 1791);
  v20 = *((_OWORD *)a2 + 1793);
  *((_OWORD *)this + 21) = *((_OWORD *)a2 + 1792);
  *((_OWORD *)this + 22) = v20;
  *((_OWORD *)this + 19) = v18;
  *((_OWORD *)this + 20) = v19;
  v21 = *((_OWORD *)a2 + 1794);
  v22 = *((_OWORD *)a2 + 1795);
  v23 = *((_OWORD *)a2 + 1796);
  *((_QWORD *)this + 52) = *((_QWORD *)a2 + 3594);
  *((_OWORD *)this + 24) = v22;
  *((_OWORD *)this + 25) = v23;
  *((_OWORD *)this + 23) = v21;
  *(_OWORD *)((char *)this + 424) = *(_OWORD *)((char *)a2 + 28760);
  v24 = *(_OWORD *)((char *)a2 + 28776);
  v25 = *(_OWORD *)((char *)a2 + 28792);
  v26 = *(_OWORD *)((char *)a2 + 28808);
  *((_QWORD *)this + 61) = *((_QWORD *)a2 + 3603);
  *(_OWORD *)((char *)this + 456) = v25;
  *(_OWORD *)((char *)this + 472) = v26;
  *(_OWORD *)((char *)this + 440) = v24;
  v27 = *((_OWORD *)a2 + 1806);
  v28 = *((_OWORD *)a2 + 1807);
  v29 = *((_OWORD *)a2 + 1805);
  *((_QWORD *)this + 74) = *((_QWORD *)a2 + 3616);
  *((_OWORD *)this + 35) = v27;
  *((_OWORD *)this + 36) = v28;
  *((_OWORD *)this + 34) = v29;
  v30 = *((_OWORD *)a2 + 1802);
  v31 = *((_OWORD *)a2 + 1804);
  *((_OWORD *)this + 32) = *((_OWORD *)a2 + 1803);
  *((_OWORD *)this + 33) = v31;
  *((_OWORD *)this + 31) = v30;
  *(_OWORD *)((char *)this + 600) = *(_OWORD *)((char *)a2 + 28936);
  v32 = *(_OWORD *)((char *)a2 + 29048);
  v33 = *(_OWORD *)((char *)a2 + 29080);
  *(_OWORD *)((char *)this + 632) = *(_OWORD *)((char *)a2 + 29064);
  *(_OWORD *)((char *)this + 648) = v33;
  *(_OWORD *)((char *)this + 616) = v32;
  v34 = *(_OWORD *)((char *)a2 + 28952);
  *((_QWORD *)this + 85) = *((_QWORD *)a2 + 3621);
  *(_OWORD *)((char *)this + 664) = v34;
  *((_WORD *)this + 344) = *((_WORD *)a2 + 14488);
  std::string::operator=((std::string *)this + 29, (const std::string *)((char *)a2 + 28984));
  *((_OWORD *)this + 45) = *((_OWORD *)a2 + 1813);
  std::string::operator=((std::string *)((char *)this + 736), (const std::string *)((char *)a2 + 29024));
  *((_BYTE *)this + 784) = *(_BYTE *)a2;
  result = simpleList<ACAMBatteryState>::operator=((uint64_t *)this + 95, (__int128 **)a2 + 3637);
  *((_QWORD *)this + 99) = *((_QWORD *)a2 + 860);
  return result;
}

uint64_t *ACAMPersistentStates::restore(ACAMPersistentStates *this, ACAM *a2)
{
  return ACAM::init(a2, this);
}

char *createLogger(char *category)
{
  if (category)
    category = (char *)os_log_create("com.apple.batteryalgorithms", category);
  return category;
}

id OnDeviceACAMUtility::createRuntimeOptions(OnDeviceACAMUtility *this)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    OnDeviceACAMUtility::createRuntimeOptions();
  objc_msgSend(v1, "objectForKey:", CFSTR("batteryalgorithm"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("OnDeviceACAM"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = objc_msgSend(&unk_250871DD8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v15 != v6)
              objc_enumerationMutation(&unk_250871DD8);
            v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_msgSend(v4, "objectForKey:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v9 == 0;

            if (v10)
            {
              objc_msgSend(&unk_250871DD8, "objectForKeyedSubscript:", v8);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v8);

            }
          }
          v5 = objc_msgSend(&unk_250871DD8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v5);
      }
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &unk_250871DD8;
    }

  }
  else
  {
    v12 = &unk_250871DD8;
  }

  return v12;
}

void sub_236E62890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

const char *createLogger(char *category)
{
  if (category)
    category = (char *)os_log_create("com.apple.batteryalgorithms", category);
  return category;
}

void sub_236E6345C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41,uint64_t a42,void *a43,uint64_t a44)
{
  void *v44;
  void *v45;
  void *v46;

  simpleList<ACAMPersistentStates>::clear(&a35);
  if (__p)
  {
    a41 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a43)
  {
    a44 = (uint64_t)a43;
    operator delete(a43);
  }

  _Unwind_Resume(a1);
}

uint64_t ACAMSerialization::Deserialization::setSMCKeyDataFromDictionary(double *a1, double *a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  int *v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  double *v17;
  int v18;
  double v19;
  double v20;
  uint64_t v21;
  ACAMSerialization::Deserialization *v22;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  BOOL isBetween;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double *v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v37 = a1;
  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v4 = objc_msgSend(&unk_250871E90, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v41;
    v7 = 0.0;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(&unk_250871E90);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9, v37);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
          goto LABEL_17;
        if (objc_msgSend(v9, "isEqual:", CFSTR("TimeAtHighSoc")))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v13 = (int *)objc_msgSend(v12, "bytes");
          v14 = objc_msgSend(v12, "length");
          v15 = 0.0;
          if (v14 >= 4)
          {
            v16 = v14 >> 2;
            v17 = a2;
            do
            {
              v18 = *v13++;
              v19 = (double)v18;
              v20 = *v17++;
              v15 = v15 + v19 * v20;
              --v16;
            }
            while (v16);
          }

          v7 = v15 / 100.0;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v22 = (ACAMSerialization::Deserialization *)v21;
        objc_msgSend(&unk_250871EA8, "objectAtIndex:", v5);
        v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_250871EC0, "objectAtIndex:", v5);
        v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        isBetween = ACAMSerialization::Deserialization::isBetween(v22, v23, v24, v25);

        if (!isBetween)
          goto LABEL_17;
        ++v5;
      }
      v4 = objc_msgSend(&unk_250871E90, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v4)
        continue;
      break;
    }
    if (v7 < 0.0)
    {
LABEL_17:
      v27 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0.0;
  }
  *v37 = v7;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CycleCount"), v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  *(_QWORD *)(v38 + 8) = v29;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TotalOperatingTime"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  *(double *)(v38 + 16) = v31 * 3600.0;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSince1970");
  *(_QWORD *)(v38 + 24) = v33;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VacVoltageLimit"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  *(double *)(v38 + 32) = v35 / 1000.0;

  v27 = 1;
LABEL_20:

  return v27;
}

void sub_236E639D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id OnDeviceACAMUtility::createDebugLogItem(OnDeviceACAMUtility *this, NSString *a2, objc_object *a3)
{
  OnDeviceACAMUtility *v4;
  NSString *v5;
  void *v6;
  int v7;
  const __CFString **v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = this;
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSString isEqual:](v5, "isEqual:", v6);

  if (v7)
  {
    v15 = CFSTR("message");
    v16[0] = v4;
    v8 = &v15;
    v9 = v16;
    v10 = 1;
  }
  else
  {
    v13[0] = CFSTR("message");
    v13[1] = CFSTR("value");
    v14[0] = v4;
    v14[1] = v5;
    v8 = (const __CFString **)v13;
    v9 = v14;
    v10 = 2;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_236E63B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void saveCurrentSnapshotIntoDebugBuffer(OnDeviceACAM *a1, NSString *a2)
{
  OnDeviceACAM *v3;
  NSString *v4;
  const ACAMPersistentStates *v5;
  NSString *v6;
  void *v7;
  objc_object *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[77];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *__p[2];
  __int128 v22;
  __int128 v23;

  v3 = a1;
  v4 = a2;
  v12[75] = 0;
  v18 = 0;
  v20 = 0;
  v19 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0;
  *(_OWORD *)__p = 0u;
  v22 = 0u;
  v23 = 0u;
  ACAMPersistentStates::retrieve((ACAMPersistentStates *)v12, (const ACAM *)-[OnDeviceACAM model](v3, "model"));
  ACAMSerialization::Serialization::createDiskStateFromPersistentState((ACAMSerialization::Serialization *)v12, v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[OnDeviceACAM debugLogBuffer](v3, "debugLogBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  v10 = *((_QWORD *)&v22 + 1);
  if (*((_QWORD *)&v22 + 1))
  {
    do
    {
      v11 = *(_QWORD *)(v10 + 40);
      MEMORY[0x23B8057D4]();
      v10 = v11;
    }
    while (v11);
  }
  *((_QWORD *)&v22 + 1) = 0;
  v23 = 0uLL;
  if (SBYTE7(v22) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v20) < 0)
    operator delete(v18);

}

void sub_236E63CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v12;

  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)&a9);
  _Unwind_Resume(a1);
}

id ACAMSerialization::Serialization::createBDCDailyFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, double a3, uint64_t a4, double *a5)
{
  double v6;
  double v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  _QWORD v55[6];
  _QWORD v56[18];
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  ACAMLogger::extractDaily(this, a5, (uint64_t)&v47);
  v56[0] = CFSTR("timeSinceLastDaily");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v46;
  v56[1] = CFSTR("Qn");
  LODWORD(v6) = v47;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v58 = objc_claimAutoreleasedReturnValue();
  v56[2] = CFSTR("Qp");
  LODWORD(v7) = DWORD1(v47);
  v45 = (void *)v58;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v44;
  v56[3] = CFSTR("QLi");
  LODWORD(v8) = DWORD2(v47);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v43;
  v56[4] = CFSTR("x0");
  LODWORD(v9) = HIDWORD(v47);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v42;
  v56[5] = CFSTR("x100");
  LODWORD(v10) = v48;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v41;
  v56[6] = CFSTR("y0");
  LODWORD(v11) = DWORD1(v48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v40;
  v56[7] = CFSTR("y100");
  LODWORD(v12) = DWORD2(v48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v39;
  v56[8] = CFSTR("NCCp");
  LODWORD(v13) = HIDWORD(v48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v38;
  v56[9] = CFSTR("wRaChangeRatio");
  LODWORD(v14) = v49;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v37;
  v56[10] = CFSTR("wRcChangeRatio");
  LODWORD(v15) = DWORD1(v49);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v36;
  v56[11] = CFSTR("Qmax");
  LODWORD(v16) = DWORD2(v49);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v35;
  v56[12] = CFSTR("hardSwell");
  LODWORD(v17) = HIDWORD(v49);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v34;
  v56[13] = CFSTR("gasSwell");
  LODWORD(v18) = v50;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v33;
  v56[14] = CFSTR("protectiveBuffer");
  LODWORD(v19) = DWORD1(v50);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v32;
  v56[15] = CFSTR("statusBuffer");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (_QWORD)v51);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v20;
  v56[16] = CFSTR("sleepStatistics");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)&v51 + 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (_QWORD)v52);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)&v52 + 1));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v23;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (_QWORD)v53);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v24;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)&v53 + 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v25;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v54);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v27;
  v56[17] = CFSTR("SOCBiasCorrection");
  LODWORD(v28) = DWORD2(v50);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, v56, 18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

void sub_236E64170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void std::vector<OBCData>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<OBCData>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<OBCData>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t ACAMSerialization::Deserialization::setOBCDataFromDictionary(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  ACAMSerialization::Deserialization *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  BOOL isBetween;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[4];

  v25 = a1;
  v33[2] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v33[0] = &unk_250871E50;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4 + 90000.0;

  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v33[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = objc_msgSend(&unk_250871ED8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(&unk_250871ED8);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v11, v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
          goto LABEL_11;
        objc_msgSend(v2, "objectForKeyedSubscript:", v11);
        v14 = (ACAMSerialization::Deserialization *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_250871EF0, "objectAtIndex:", v8 + i);
        v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndex:", v8 + i);
        v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        isBetween = ACAMSerialization::Deserialization::isBetween(v14, v15, v16, v17);

        if (!isBetween)
        {
LABEL_11:
          v23 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(&unk_250871ED8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v8 += i;
      if (v7)
        continue;
      break;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("VacVoltageLimit"), v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  *(double *)v26 = v20 / 1000.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Timestamp"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  *(_QWORD *)(v26 + 8) = v22;

  v23 = 1;
LABEL_12:

  return v23;
}

void sub_236E645FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void std::vector<SBCData>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667)
      std::vector<OBCData>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 40;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>(v3, a2);
    v7 = &v6[40 * v5];
    v9 = &v6[40 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 40);
        v14 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t ACAMSerialization::Deserialization::setSBCDataFromDictionary(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  ACAMSerialization::Deserialization *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  BOOL isBetween;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[7];

  v31 = a1;
  v39[5] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v39[0] = &unk_250871E40;
  v39[1] = &unk_250871E40;
  v39[2] = &unk_250871E40;
  v39[3] = &unk_250871E70;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4 + 90000.0;

  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v39[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(&unk_250871F08, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(&unk_250871F08);
        v11 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v11, v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
          goto LABEL_11;
        objc_msgSend(v2, "objectForKeyedSubscript:", v11);
        v14 = (ACAMSerialization::Deserialization *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_250871F20, "objectAtIndex:", v8 + i);
        v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndex:", v8 + i);
        v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        isBetween = ACAMSerialization::Deserialization::isBetween(v14, v15, v16, v17);

        if (!isBetween)
        {
LABEL_11:
          v29 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(&unk_250871F08, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v8 += i;
      if (v7)
        continue;
      break;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Voltage"), v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  *(double *)v32 = v20 / 1000.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Amperage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  *(double *)(v32 + 8) = v22 / 1000.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("VirtualTemperature"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  *(double *)(v32 + 16) = v24 / 100.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PresentDOD0"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  *(double *)(v32 + 24) = v26 * -0.0000610351562 + 1.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Timestamp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  *(_QWORD *)(v32 + 32) = v28;

  v29 = 1;
LABEL_12:

  return v29;
}

void sub_236E64A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t ACAMSerialization::Deserialization::setDailyDataFromDictionary(double *a1, NSString *a2, void *a3)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  ACAMSerialization *v17;
  const double *v18;
  ACAMSerialization::Deserialization *v19;
  NSNumber *v20;
  NSNumber *v21;
  NSNumber *v22;
  BOOL isBetween;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double *v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[5];

  v30 = a1;
  v38[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v38[0] = &unk_250871E20;
  v38[1] = &unk_250871E30;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5 + 90000.0;

  v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
  v38[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = objc_msgSend(&unk_250871F38, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v34;
    v12 = 0.0;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(&unk_250871F38);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v14, v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (v16)
          goto LABEL_14;
        if (objc_msgSend(v14, "isEqual:", CFSTR("TimeAtHighSoc")))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v14);
          v17 = (ACAMSerialization *)objc_claimAutoreleasedReturnValue();
          v12 = ACAMSerialization::convertTeqIntoScalar(v17, a2, v18);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
        }
        else
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v14);
        }
        v19 = (ACAMSerialization::Deserialization *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_250871F50, "objectAtIndex:", v10 + i);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndex:", v10 + i);
        v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        isBetween = ACAMSerialization::Deserialization::isBetween(v19, v20, v21, v22);

        if (!isBetween)
          goto LABEL_14;
      }
      v9 = objc_msgSend(&unk_250871F38, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v10 += i;
      if (v9)
        continue;
      break;
    }
    if (v12 < 0.0)
    {
LABEL_14:
      v24 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    v12 = 0.0;
  }
  *v30 = v12;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CycleCount"), v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  *(_QWORD *)(v31 + 8) = v26;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Timestamp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  *(_QWORD *)(v31 + 16) = v28;

  v24 = 1;
LABEL_17:

  return v24;
}

void sub_236E64E2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void saveSnapshotIntoDebugBuffer(OnDeviceACAM *a1, ACAMPersistentStates *a2, NSString *a3)
{
  NSString *v5;
  const ACAMPersistentStates *v6;
  NSString *v7;
  void *v8;
  objc_object *v9;
  void *v10;
  OnDeviceACAM *v11;

  v11 = a1;
  v5 = a3;
  ACAMSerialization::Serialization::createDiskStateFromPersistentState(a2, v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[OnDeviceACAM debugLogBuffer](v11, "debugLogBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OnDeviceACAMUtility::createDebugLogItem((OnDeviceACAMUtility *)v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

}

void sub_236E64F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_236E66A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_objecta, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,ACAMPerformanceModelParameter *a30)
{
  void *v30;
  void *v31;
  void **v32;
  void *v33;

  ACAMUtility::ACAMParameterPack::~ACAMParameterPack(&a30);
  if (SLOBYTE(STACK[0x3C7]) < 0)
    operator delete(*v32);

  _Unwind_Resume(a1);
}

void ACAMSerialization::Deserialization::setPersistentStatesFromDictionary(ACAMSerialization::Deserialization *this, ACAMPersistentStates *a2, const NSDictionary *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  void **v173;
  void *v174;
  void *v175;
  double v176;
  id v177;
  void **v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t i;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  uint64_t v200;
  ACAMPersistentStates *v201;
  id obj;
  _QWORD v203[5];
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 __dst;
  uint64_t v209;
  _BYTE v210[128];
  uint64_t v211;

  v211 = *MEMORY[0x24BDAC8D0];
  v201 = a2;
  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStatePrevious.V"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  *(_QWORD *)this = v5;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStatePrevious.I"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  *((_QWORD *)this + 1) = v7;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStatePrevious.T"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  *((_QWORD *)this + 2) = v9;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStatePrevious.SOC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  *((_QWORD *)this + 3) = v11;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStatePrevious.t"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  *((_QWORD *)this + 4) = v13;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStateCurrent.V"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  *((_QWORD *)this + 5) = v15;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStateCurrent.I"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  *((_QWORD *)this + 6) = v17;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStateCurrent.T"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  *((_QWORD *)this + 7) = v19;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStateCurrent.SOC"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  *((_QWORD *)this + 8) = v21;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStateCurrent.t"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  *((_QWORD *)this + 9) = v23;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.x"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  *((_QWORD *)this + 10) = v25;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.y"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  *((_QWORD *)this + 11) = v27;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.xLastExtreme"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  *((_QWORD *)this + 12) = v29;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.yLastExtreme"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  *((_QWORD *)this + 13) = v31;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.potentialAnode"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  *((_QWORD *)this + 14) = v33;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.potentialCathode"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "doubleValue");
  *((_QWORD *)this + 15) = v35;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.cRate"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleValue");
  *((_QWORD *)this + 16) = v37;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.wRcFreshAtCurrentTemp"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  *((_QWORD *)this + 17) = v39;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.wRaFreshAtCurrentTemp"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "doubleValue");
  *((_QWORD *)this + 18) = v41;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.deltaResistancePos"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "doubleValue");
  *((_QWORD *)this + 19) = v43;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.deltaResistanceNeg"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "doubleValue");
  *((_QWORD *)this + 20) = v45;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.resistancePos"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "doubleValue");
  *((_QWORD *)this + 21) = v47;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStatePrevious.resistanceNeg"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "doubleValue");
  *((_QWORD *)this + 22) = v49;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.x"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "doubleValue");
  *((_QWORD *)this + 23) = v51;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.y"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "doubleValue");
  *((_QWORD *)this + 24) = v53;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.xLastExtreme"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  *((_QWORD *)this + 25) = v55;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.yLastExtreme"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "doubleValue");
  *((_QWORD *)this + 26) = v57;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.potentialAnode"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "doubleValue");
  *((_QWORD *)this + 27) = v59;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.potentialCathode"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "doubleValue");
  *((_QWORD *)this + 28) = v61;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.cRate"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "doubleValue");
  *((_QWORD *)this + 29) = v63;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.wRcFreshAtCurrentTemp"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "doubleValue");
  *((_QWORD *)this + 30) = v65;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.wRaFreshAtCurrentTemp"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "doubleValue");
  *((_QWORD *)this + 31) = v67;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.deltaResistancePos"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "doubleValue");
  *((_QWORD *)this + 32) = v69;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.deltaResistanceNeg"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "doubleValue");
  *((_QWORD *)this + 33) = v71;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.resistancePos"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "doubleValue");
  *((_QWORD *)this + 34) = v73;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ElectrodeStateCurrent.resistanceNeg"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "doubleValue");
  *((_QWORD *)this + 35) = v75;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.gasSwell"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "doubleValue");
  *((_QWORD *)this + 36) = v77;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.protectiveBuffer"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "doubleValue");
  *((_QWORD *)this + 37) = v79;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.timePassedOnset"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "doubleValue");
  *((_QWORD *)this + 38) = v81;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.hardSwell"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "doubleValue");
  *((_QWORD *)this + 39) = v83;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.expGammaHardSwell"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "doubleValue");
  *((_QWORD *)this + 40) = v85;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.wRaChangeRatio"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "doubleValue");
  *((_QWORD *)this + 41) = v87;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.wRcChangeRatio"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "doubleValue");
  *((_QWORD *)this + 42) = v89;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.Qp"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "doubleValue");
  *((_QWORD *)this + 43) = v91;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.QpLoss"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "doubleValue");
  *((_QWORD *)this + 44) = v93;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.QpPhaseLoss"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "doubleValue");
  *((_QWORD *)this + 45) = v95;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.QpAcidLoss"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "doubleValue");
  *((_QWORD *)this + 46) = v97;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.QpCrackLoss"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "doubleValue");
  *((_QWORD *)this + 47) = v99;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.Qn"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "doubleValue");
  *((_QWORD *)this + 48) = v101;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.QLi"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "doubleValue");
  *((_QWORD *)this + 49) = v103;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.integralJSEIdt"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "doubleValue");
  *((_QWORD *)this + 50) = v105;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.integralJWRadt"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "doubleValue");
  *((_QWORD *)this + 51) = v107;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AgingState.integralJWRcdt"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "doubleValue");
  *((_QWORD *)this + 52) = v109;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.x0"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "doubleValue");
  *((_QWORD *)this + 53) = v111;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.x100"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "doubleValue");
  *((_QWORD *)this + 54) = v113;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.y0"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "doubleValue");
  *((_QWORD *)this + 55) = v115;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.y100"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "doubleValue");
  *((_QWORD *)this + 56) = v117;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.Qmax"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "doubleValue");
  *((_QWORD *)this + 57) = v119;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.resistancePosChgRatio"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "doubleValue");
  *((_QWORD *)this + 58) = v121;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.resistanceNegChgRatio"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "doubleValue");
  *((_QWORD *)this + 59) = v123;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.resistancePosDcgRatio"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "doubleValue");
  *((_QWORD *)this + 60) = v125;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.UpdatorState.resistanceNegDcgRatio"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "doubleValue");
  *((_QWORD *)this + 61) = v127;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dProtectiveBufferdt"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "doubleValue");
  *((_QWORD *)this + 62) = v129;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dGasSwelldt"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "doubleValue");
  *((_QWORD *)this + 63) = v131;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dExpGammaHardSwelldt"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "doubleValue");
  *((_QWORD *)this + 64) = v133;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dHardSwelldt"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "doubleValue");
  *((_QWORD *)this + 65) = v135;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dQpdt"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "doubleValue");
  *((_QWORD *)this + 66) = v137;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dQpPhasedt"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "doubleValue");
  *((_QWORD *)this + 67) = v139;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dQpAciddt"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "doubleValue");
  *((_QWORD *)this + 68) = v141;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dQpCrackdt"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "doubleValue");
  *((_QWORD *)this + 69) = v143;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dQndt"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "doubleValue");
  *((_QWORD *)this + 70) = v145;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dQLidt"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "doubleValue");
  *((_QWORD *)this + 71) = v147;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.JSEI"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "doubleValue");
  *((_QWORD *)this + 72) = v149;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dWRadt"));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "doubleValue");
  *((_QWORD *)this + 73) = v151;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Derivative.dWRcdt"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "doubleValue");
  *((_QWORD *)this + 74) = v153;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.DynamicConfiguration.SOCBiasCorrection"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "doubleValue");
  *((_QWORD *)this + 75) = v155;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.DynamicConfiguration.voltageChargeLimit"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "doubleValue");
  *((_QWORD *)this + 76) = v157;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Statistics.sleepStatistics[0]"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 77) = objc_msgSend(v158, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Statistics.sleepStatistics[1]"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 78) = objc_msgSend(v159, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Statistics.sleepStatistics[2]"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 79) = objc_msgSend(v160, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Statistics.sleepStatistics[3]"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 80) = objc_msgSend(v161, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Statistics.sleepStatistics[4]"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 81) = objc_msgSend(v162, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Statistics.sleepStatistics[5]"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 82) = objc_msgSend(v163, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mPreviousAlgoStatus"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)this + 166) = objc_msgSend(v164, "intValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mCurrentAlgoStatus"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)this + 167) = objc_msgSend(v165, "intValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mCurrentDataError"));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)this + 168) = objc_msgSend(v166, "intValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mBuffer"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)this + 169) = objc_msgSend(v167, "intValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mInitType"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  ACAMStatus::setInitType((uint64_t)this + 664, objc_msgSend(v168, "intValue"));

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mFreshInitReason"));
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  ACAMStatus::setFreshInitReason((uint64_t)this + 664, objc_msgSend(v169, "intValue"));

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mSystemSignal.batteryAuthentication"));
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)this + 688) = objc_msgSend(v170, "BOOLValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mSystemSignal.batteryReplacement"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)this + 689) = objc_msgSend(v171, "BOOLValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mSystemSignal.batteryReplacementDate"));
  v172 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100](&__dst, (void *)objc_msgSend(v172, "UTF8String"), objc_msgSend(v172, "lengthOfBytesUsingEncoding:", 4));

  v173 = (void **)((char *)this + 696);
  if (*((char *)this + 719) < 0)
    operator delete(*v173);
  *(_OWORD *)v173 = __dst;
  *((_QWORD *)this + 89) = v209;
  HIBYTE(v209) = 0;
  LOBYTE(__dst) = 0;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mSystemSignal.time"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 90) = objc_msgSend(v174, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mSystemSignal.version"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "doubleValue");
  *((_QWORD *)this + 91) = (unint64_t)v176;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.Status.mSystemSignal.batteryInfo"));
  v177 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100](&__dst, (void *)objc_msgSend(v177, "UTF8String"), objc_msgSend(v177, "lengthOfBytesUsingEncoding:", 4));

  v178 = (void **)((char *)this + 736);
  if (*((char *)this + 759) < 0)
    operator delete(*v178);
  *(_OWORD *)v178 = __dst;
  *((_QWORD *)this + 94) = v209;
  HIBYTE(v209) = 0;
  LOBYTE(__dst) = 0;

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.AlgorithmInitialized"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)this + 784) = objc_msgSend(v179, "BOOLValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.ParameterVersion"));
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)this + 99) = objc_msgSend(v180, "unsignedLongValue");

  -[ACAMPersistentStates objectForKeyedSubscript:](v201, "objectForKeyedSubscript:", CFSTR("persistentState.BatteryStateHistory"));
  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v181 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v210, 16);
  if (v181)
  {
    v182 = (uint64_t *)((char *)this + 760);
    v183 = *(_QWORD *)v205;
    do
    {
      for (i = 0; i != v181; ++i)
      {
        if (*(_QWORD *)v205 != v183)
          objc_enumerationMutation(obj);
        v185 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * i);
        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("V"));
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "doubleValue");
        v188 = v187;
        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("I"));
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "doubleValue");
        v191 = v190;
        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("T"));
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "doubleValue");
        v194 = v193;
        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("SOC"));
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v195, "doubleValue");
        v197 = v196;
        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("t"));
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v198, "doubleValue");
        v200 = v199;

        v203[0] = v188;
        v203[1] = v191;
        v203[2] = v194;
        v203[3] = v197;
        v203[4] = v200;
        simpleList<ACAMBatteryState>::append(v182, (uint64_t)v203);
      }
      v181 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v210, 16);
    }
    while (v181);
  }

}

void sub_236E67CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{

  _Unwind_Resume(a1);
}

uint64_t ACAMSerialization::Deserialization::setSystemSignalsFromDictionaries(ACAMSerialization::Deserialization *this, ACAMStatus::SystemSignals *a2, NSDictionary *a3, const NSDictionary *a4)
{
  ACAMStatus::SystemSignals *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void **v23;
  uint64_t v24;
  __int128 __dst;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = objc_msgSend(&unk_250871F68, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v33;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v9)
        objc_enumerationMutation(&unk_250871F68);
      -[ACAMStatus::SystemSignals objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

      if (v12)
        goto LABEL_20;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(&unk_250871F68, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = objc_msgSend(&unk_250871F80, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v29;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v14)
        objc_enumerationMutation(&unk_250871F80);
      -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(&unk_250871F80, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v13)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_20:
    v24 = 0;
    goto LABEL_21;
  }
LABEL_17:
  -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("BatteryAuthPass"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)this = objc_msgSend(v18, "BOOLValue");

  *((_BYTE *)this + 1) = 0;
  MEMORY[0x23B805738]((char *)this + 8, &unk_236E766C2);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSince1970");
  *((_QWORD *)this + 4) = (unint64_t)v20;

  objc_msgSend(&unk_250871B38, "doubleValue");
  *((_QWORD *)this + 5) = (unint64_t)v21;
  -[ACAMStatus::SystemSignals objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("Serial"));
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100](&__dst, (void *)objc_msgSend(v22, "UTF8String"), objc_msgSend(v22, "lengthOfBytesUsingEncoding:", 4));

  v23 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0)
    operator delete(*v23);
  *(_OWORD *)v23 = __dst;
  *((_QWORD *)this + 8) = v27;
  HIBYTE(v27) = 0;
  LOBYTE(__dst) = 0;

  v24 = 1;
LABEL_21:

  return v24;
}

void sub_236E68218(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ACAMStatus::SystemSignals::~SystemSignals(void **this)
{
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

void sub_236E685A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id ACAMSerialization::Serialization::createBDCSBCFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, double a3)
{
  float SBC;
  int v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  SBC = ACAMLogger::extractSBC(this, a2);
  v6 = v5;
  v14[0] = CFSTR("timeSinceLastSBC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v14[1] = CFSTR("potentialAnode");
  *(float *)&v8 = SBC;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  v14[2] = CFSTR("potentialCathode");
  LODWORD(v10) = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_236E6874C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id ACAMSerialization::Serialization::createBDCWeeklyFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, double a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
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
  double v58;
  double v59;
  double v60;
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
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  void *v99;
  double v100;
  void *v101;
  double v102;
  void *v103;
  double v104;
  void *v105;
  double v106;
  void *v107;
  double v108;
  void *v109;
  double v110;
  void *v111;
  double v112;
  void *v113;
  void *v114;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  int v235;
  _QWORD v236[101];
  _QWORD v237[2];
  _QWORD v238[4];

  v238[2] = *MEMORY[0x24BDAC8D0];
  v235 = 0;
  v234 = 0u;
  v233 = 0u;
  v232 = 0u;
  v231 = 0u;
  v230 = 0u;
  v229 = 0u;
  v228 = 0u;
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v218 = 0u;
  v219 = 0u;
  v216 = 0u;
  v217 = 0u;
  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  v210 = 0u;
  v211 = 0u;
  ACAMLogger::extractWeekly(this, (uint64_t)&v210);
  v237[0] = CFSTR("timeSinceLastWeekly");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v237[1] = CFSTR("OCVdrift");
  v238[0] = v209;
  LODWORD(v4) = v210;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v236[0] = v208;
  LODWORD(v5) = DWORD1(v210);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v236[1] = v207;
  LODWORD(v6) = DWORD2(v210);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v236[2] = v206;
  LODWORD(v7) = HIDWORD(v210);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v236[3] = v205;
  LODWORD(v8) = v211;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v236[4] = v204;
  LODWORD(v9) = DWORD1(v211);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v236[5] = v203;
  LODWORD(v10) = DWORD2(v211);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v236[6] = v202;
  LODWORD(v11) = HIDWORD(v211);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v236[7] = v201;
  LODWORD(v12) = v212;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v236[8] = v200;
  LODWORD(v13) = DWORD1(v212);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v236[9] = v199;
  LODWORD(v14) = DWORD2(v212);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v236[10] = v198;
  LODWORD(v15) = HIDWORD(v212);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v236[11] = v197;
  LODWORD(v16) = v213;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v236[12] = v196;
  LODWORD(v17) = DWORD1(v213);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v236[13] = v195;
  LODWORD(v18) = DWORD2(v213);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v236[14] = v194;
  LODWORD(v19) = HIDWORD(v213);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v236[15] = v193;
  LODWORD(v20) = v214;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v236[16] = v192;
  LODWORD(v21) = DWORD1(v214);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v236[17] = v191;
  LODWORD(v22) = DWORD2(v214);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v236[18] = v190;
  LODWORD(v23) = HIDWORD(v214);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v236[19] = v189;
  LODWORD(v24) = v215;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v236[20] = v188;
  LODWORD(v25) = DWORD1(v215);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v236[21] = v187;
  LODWORD(v26) = DWORD2(v215);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v236[22] = v186;
  LODWORD(v27) = HIDWORD(v215);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v236[23] = v185;
  LODWORD(v28) = v216;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v236[24] = v184;
  LODWORD(v29) = DWORD1(v216);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v236[25] = v183;
  LODWORD(v30) = DWORD2(v216);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v236[26] = v182;
  LODWORD(v31) = HIDWORD(v216);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v31);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v236[27] = v181;
  LODWORD(v32) = v217;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v236[28] = v180;
  LODWORD(v33) = DWORD1(v217);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v236[29] = v179;
  LODWORD(v34) = DWORD2(v217);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v34);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v236[30] = v178;
  LODWORD(v35) = HIDWORD(v217);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v35);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v236[31] = v177;
  LODWORD(v36) = v218;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v36);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v236[32] = v176;
  LODWORD(v37) = DWORD1(v218);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v236[33] = v175;
  LODWORD(v38) = DWORD2(v218);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v236[34] = v174;
  LODWORD(v39) = HIDWORD(v218);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v236[35] = v173;
  LODWORD(v40) = v219;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v236[36] = v172;
  LODWORD(v41) = DWORD1(v219);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v236[37] = v171;
  LODWORD(v42) = DWORD2(v219);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v42);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v236[38] = v170;
  LODWORD(v43) = HIDWORD(v219);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v236[39] = v169;
  LODWORD(v44) = v220;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v236[40] = v168;
  LODWORD(v45) = DWORD1(v220);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v45);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v236[41] = v167;
  LODWORD(v46) = DWORD2(v220);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v46);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v236[42] = v166;
  LODWORD(v47) = HIDWORD(v220);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v236[43] = v165;
  LODWORD(v48) = v221;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v48);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v236[44] = v164;
  LODWORD(v49) = DWORD1(v221);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v49);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v236[45] = v163;
  LODWORD(v50) = DWORD2(v221);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v50);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v236[46] = v162;
  LODWORD(v51) = HIDWORD(v221);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v51);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v236[47] = v161;
  LODWORD(v52) = v222;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v52);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v236[48] = v160;
  LODWORD(v53) = DWORD1(v222);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v53);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v236[49] = v159;
  LODWORD(v54) = DWORD2(v222);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v236[50] = v158;
  LODWORD(v55) = HIDWORD(v222);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v55);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v236[51] = v157;
  LODWORD(v56) = v223;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v56);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v236[52] = v156;
  LODWORD(v57) = DWORD1(v223);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v57);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v236[53] = v155;
  LODWORD(v58) = DWORD2(v223);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v58);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v236[54] = v154;
  LODWORD(v59) = HIDWORD(v223);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v59);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v236[55] = v153;
  LODWORD(v60) = v224;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v60);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v236[56] = v152;
  LODWORD(v61) = DWORD1(v224);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v61);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v236[57] = v151;
  LODWORD(v62) = DWORD2(v224);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v62);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v236[58] = v150;
  LODWORD(v63) = HIDWORD(v224);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v63);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v236[59] = v149;
  LODWORD(v64) = v225;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v64);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v236[60] = v148;
  LODWORD(v65) = DWORD1(v225);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v65);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v236[61] = v147;
  LODWORD(v66) = DWORD2(v225);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v66);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v236[62] = v146;
  LODWORD(v67) = HIDWORD(v225);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v67);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v236[63] = v145;
  LODWORD(v68) = v226;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v68);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v236[64] = v144;
  LODWORD(v69) = DWORD1(v226);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v69);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v236[65] = v143;
  LODWORD(v70) = DWORD2(v226);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v70);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v236[66] = v142;
  LODWORD(v71) = HIDWORD(v226);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v71);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v236[67] = v141;
  LODWORD(v72) = v227;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v72);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v236[68] = v140;
  LODWORD(v73) = DWORD1(v227);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v73);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v236[69] = v139;
  LODWORD(v74) = DWORD2(v227);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v74);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v236[70] = v138;
  LODWORD(v75) = HIDWORD(v227);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v75);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v236[71] = v137;
  LODWORD(v76) = v228;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v76);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v236[72] = v136;
  LODWORD(v77) = DWORD1(v228);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v77);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v236[73] = v135;
  LODWORD(v78) = DWORD2(v228);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v78);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v236[74] = v134;
  LODWORD(v79) = HIDWORD(v228);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v79);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v236[75] = v133;
  LODWORD(v80) = v229;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v80);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v236[76] = v132;
  LODWORD(v81) = DWORD1(v229);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v81);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v236[77] = v131;
  LODWORD(v82) = DWORD2(v229);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v82);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v236[78] = v130;
  LODWORD(v83) = HIDWORD(v229);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v83);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v236[79] = v129;
  LODWORD(v84) = v230;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v84);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v236[80] = v128;
  LODWORD(v85) = DWORD1(v230);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v85);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v236[81] = v127;
  LODWORD(v86) = DWORD2(v230);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v86);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v236[82] = v126;
  LODWORD(v87) = HIDWORD(v230);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v87);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v236[83] = v125;
  LODWORD(v88) = v231;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v88);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v236[84] = v124;
  LODWORD(v89) = DWORD1(v231);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v89);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v236[85] = v123;
  LODWORD(v90) = DWORD2(v231);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v90);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v236[86] = v122;
  LODWORD(v91) = HIDWORD(v231);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v91);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v236[87] = v121;
  LODWORD(v92) = v232;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v92);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v236[88] = v120;
  LODWORD(v93) = DWORD1(v232);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v93);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v236[89] = v119;
  LODWORD(v94) = DWORD2(v232);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v94);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v236[90] = v118;
  LODWORD(v95) = HIDWORD(v232);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v95);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v236[91] = v117;
  LODWORD(v96) = v233;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v236[92] = v97;
  LODWORD(v98) = DWORD1(v233);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v236[93] = v99;
  LODWORD(v100) = DWORD2(v233);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v236[94] = v101;
  LODWORD(v102) = HIDWORD(v233);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v236[95] = v103;
  LODWORD(v104) = v234;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v236[96] = v105;
  LODWORD(v106) = DWORD1(v234);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v236[97] = v107;
  LODWORD(v108) = DWORD2(v234);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v236[98] = v109;
  LODWORD(v110) = HIDWORD(v234);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v236[99] = v111;
  LODWORD(v112) = v235;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v236[100] = v113;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v236, 101);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v238[1] = v114;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v238, v237, 2);
  v116 = (id)objc_claimAutoreleasedReturnValue();

  return v116;
}

void sub_236E69544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _Unwind_Exception *exception_objecta, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  void *a64;
  void *a65;
  void *a66;
  void *a67;
  void *a68;
  void *a69;
  void *a70;
  void *a71;
  void *a72;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;

  _Unwind_Resume(a1);
}

void sub_236E6AA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  void *v54;
  void *v55;

  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::~__hash_table((uint64_t)&a49);
  STACK[0x2A0] = (unint64_t)&a54;
  std::vector<std::vector<SmartBatteryData>>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x2A0]);

  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,std::set<unsigned long>>::~pair(uint64_t a1)
{
  std::__tree<unsigned long>::destroy(a1 + 24, *(_QWORD **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t ACAMSerialization::Deserialization::setSmartBatteryDataFromDictionary(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  ACAMSerialization::Deserialization *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  BOOL isBetween;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[7];

  v31 = a1;
  v39[5] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v39[0] = &unk_250871E80;
  v39[1] = &unk_250871E40;
  v39[2] = &unk_250871E40;
  v39[3] = &unk_250871E70;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4 + 90000.0;

  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v39[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(&unk_250871F98, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(&unk_250871F98);
        v11 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v11, v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
          goto LABEL_11;
        objc_msgSend(v2, "objectForKeyedSubscript:", v11);
        v14 = (ACAMSerialization::Deserialization *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_250871FB0, "objectAtIndex:", v8 + i);
        v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndex:", v8 + i);
        v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        isBetween = ACAMSerialization::Deserialization::isBetween(v14, v15, v16, v17);

        if (!isBetween)
        {
LABEL_11:
          v29 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(&unk_250871F98, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v8 += i;
      if (v7)
        continue;
      break;
    }
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Voltage"), v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  *(double *)v32 = v20 / 1000.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("InstantAmperage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  *(double *)(v32 + 8) = v22 / 1000.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("VirtualTemperature"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  *(double *)(v32 + 16) = v24 / 100.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PresentDOD"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  *(double *)(v32 + 24) = v26 * -0.0000610351562 + 1.0;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Timestamp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  *(_QWORD *)(v32 + 32) = v28;

  v29 = 1;
LABEL_12:

  return v29;
}

void sub_236E6B2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<SmartBatteryData>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<OBCData>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    v16[4] = result;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>>(result, v12);
    v14 = &v13[24 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[24 * v15];
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *(_QWORD *)v14 = 0;
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *((_QWORD *)v14 + 2) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v16[2] = v14 + 24;
    std::vector<std::vector<SmartBatteryData>>::__swap_out_circular_buffer(a1, v16);
    v8 = (_QWORD *)a1[1];
    result = std::__split_buffer<std::vector<SmartBatteryData>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *(_OWORD *)v7 = *(_OWORD *)a2;
    v7[2] = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_236E6B4B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<SmartBatteryData>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_236E6B8B4(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  void *v16;
  va_list va;

  va_start(va, a16);

  ACAMPersistentStates::~ACAMPersistentStates((ACAMPersistentStates *)va);
  _Unwind_Resume(a1);
}

id ACAMSerialization::Serialization::createDiskStateFromPersistentState(ACAMSerialization::Serialization *this, const ACAMPersistentStates *a2)
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  _QWORD v112[98];
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  _QWORD v211[5];
  _QWORD v212[7];

  v212[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = *((_QWORD *)this + 95); i; i = *(_QWORD *)(i + 40))
  {
    v211[0] = CFSTR("V");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v212[0] = v4;
    v211[1] = CFSTR("I");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(i + 8));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v212[1] = v5;
    v211[2] = CFSTR("T");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(i + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v212[2] = v6;
    v211[3] = CFSTR("SOC");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(i + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v212[3] = v7;
    v211[4] = CFSTR("t");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(i + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v212[4] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v212, v211, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObject:", v9);

  }
  v112[0] = CFSTR("persistentState.BatteryStatePrevious.V");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)this);
  v113 = objc_claimAutoreleasedReturnValue();
  v112[1] = CFSTR("persistentState.BatteryStatePrevious.I");
  v108 = (void *)v113;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 1));
  v114 = objc_claimAutoreleasedReturnValue();
  v112[2] = CFSTR("persistentState.BatteryStatePrevious.T");
  v107 = (void *)v114;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 2));
  v115 = objc_claimAutoreleasedReturnValue();
  v112[3] = CFSTR("persistentState.BatteryStatePrevious.SOC");
  v106 = (void *)v115;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 3));
  v116 = objc_claimAutoreleasedReturnValue();
  v112[4] = CFSTR("persistentState.BatteryStatePrevious.t");
  v105 = (void *)v116;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 4));
  v117 = objc_claimAutoreleasedReturnValue();
  v112[5] = CFSTR("persistentState.BatteryStateCurrent.V");
  v104 = (void *)v117;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 5));
  v118 = objc_claimAutoreleasedReturnValue();
  v112[6] = CFSTR("persistentState.BatteryStateCurrent.I");
  v103 = (void *)v118;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 6));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v102;
  v112[7] = CFSTR("persistentState.BatteryStateCurrent.T");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 7));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v101;
  v112[8] = CFSTR("persistentState.BatteryStateCurrent.SOC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 8));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v100;
  v112[9] = CFSTR("persistentState.BatteryStateCurrent.t");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 9));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v99;
  v112[10] = CFSTR("persistentState.ElectrodeStatePrevious.x");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 10));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v98;
  v112[11] = CFSTR("persistentState.ElectrodeStatePrevious.y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 11));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v97;
  v112[12] = CFSTR("persistentState.ElectrodeStatePrevious.xLastExtreme");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 12));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v96;
  v112[13] = CFSTR("persistentState.ElectrodeStatePrevious.yLastExtreme");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 13));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v95;
  v112[14] = CFSTR("persistentState.ElectrodeStatePrevious.potentialAnode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 14));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v94;
  v112[15] = CFSTR("persistentState.ElectrodeStatePrevious.potentialCathode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 15));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v93;
  v112[16] = CFSTR("persistentState.ElectrodeStatePrevious.cRate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 16));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v92;
  v112[17] = CFSTR("persistentState.ElectrodeStatePrevious.wRcFreshAtCurrentTemp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 17));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v91;
  v112[18] = CFSTR("persistentState.ElectrodeStatePrevious.wRaFreshAtCurrentTemp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 18));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v90;
  v112[19] = CFSTR("persistentState.ElectrodeStatePrevious.deltaResistancePos");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 19));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v89;
  v112[20] = CFSTR("persistentState.ElectrodeStatePrevious.deltaResistanceNeg");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 20));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v88;
  v112[21] = CFSTR("persistentState.ElectrodeStatePrevious.resistancePos");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 21));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v87;
  v112[22] = CFSTR("persistentState.ElectrodeStatePrevious.resistanceNeg");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 22));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v86;
  v112[23] = CFSTR("persistentState.ElectrodeStateCurrent.x");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 23));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v85;
  v112[24] = CFSTR("persistentState.ElectrodeStateCurrent.y");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 24));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v84;
  v112[25] = CFSTR("persistentState.ElectrodeStateCurrent.xLastExtreme");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 25));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v83;
  v112[26] = CFSTR("persistentState.ElectrodeStateCurrent.yLastExtreme");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 26));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v82;
  v112[27] = CFSTR("persistentState.ElectrodeStateCurrent.potentialAnode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 27));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v81;
  v112[28] = CFSTR("persistentState.ElectrodeStateCurrent.potentialCathode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 28));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v80;
  v112[29] = CFSTR("persistentState.ElectrodeStateCurrent.cRate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 29));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v79;
  v112[30] = CFSTR("persistentState.ElectrodeStateCurrent.wRcFreshAtCurrentTemp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 30));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v78;
  v112[31] = CFSTR("persistentState.ElectrodeStateCurrent.wRaFreshAtCurrentTemp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 31));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = v77;
  v112[32] = CFSTR("persistentState.ElectrodeStateCurrent.deltaResistancePos");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 32));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v76;
  v112[33] = CFSTR("persistentState.ElectrodeStateCurrent.deltaResistanceNeg");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 33));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v75;
  v112[34] = CFSTR("persistentState.ElectrodeStateCurrent.resistancePos");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 34));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v74;
  v112[35] = CFSTR("persistentState.ElectrodeStateCurrent.resistanceNeg");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 35));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v73;
  v112[36] = CFSTR("persistentState.AgingState.gasSwell");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 36));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v72;
  v112[37] = CFSTR("persistentState.AgingState.protectiveBuffer");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 37));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v71;
  v112[38] = CFSTR("persistentState.AgingState.timePassedOnset");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 38));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v70;
  v112[39] = CFSTR("persistentState.AgingState.hardSwell");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 39));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v69;
  v112[40] = CFSTR("persistentState.AgingState.expGammaHardSwell");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 40));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = v68;
  v112[41] = CFSTR("persistentState.AgingState.wRaChangeRatio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 41));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v67;
  v112[42] = CFSTR("persistentState.AgingState.wRcChangeRatio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 42));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v66;
  v112[43] = CFSTR("persistentState.AgingState.Qp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 43));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v65;
  v112[44] = CFSTR("persistentState.AgingState.QpLoss");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 44));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v64;
  v112[45] = CFSTR("persistentState.AgingState.QpPhaseLoss");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 45));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v63;
  v112[46] = CFSTR("persistentState.AgingState.QpAcidLoss");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 46));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v62;
  v112[47] = CFSTR("persistentState.AgingState.QpCrackLoss");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 47));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = v61;
  v112[48] = CFSTR("persistentState.AgingState.Qn");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 48));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v60;
  v112[49] = CFSTR("persistentState.AgingState.QLi");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 49));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v59;
  v112[50] = CFSTR("persistentState.AgingState.integralJSEIdt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 50));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = v58;
  v112[51] = CFSTR("persistentState.AgingState.integralJWRadt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 51));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = v57;
  v112[52] = CFSTR("persistentState.AgingState.integralJWRcdt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 52));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v56;
  v112[53] = CFSTR("persistentState.UpdatorState.x0");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 53));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = v55;
  v112[54] = CFSTR("persistentState.UpdatorState.x100");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 54));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = v54;
  v112[55] = CFSTR("persistentState.UpdatorState.y0");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 55));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v53;
  v112[56] = CFSTR("persistentState.UpdatorState.y100");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 56));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v110;
  v112[57] = CFSTR("persistentState.UpdatorState.Qmax");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 57));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = v52;
  v112[58] = CFSTR("persistentState.UpdatorState.resistancePosChgRatio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 58));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v51;
  v112[59] = CFSTR("persistentState.UpdatorState.resistanceNegChgRatio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 59));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v50;
  v112[60] = CFSTR("persistentState.UpdatorState.resistancePosDcgRatio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 60));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v49;
  v112[61] = CFSTR("persistentState.UpdatorState.resistanceNegDcgRatio");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 61));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = v48;
  v112[62] = CFSTR("persistentState.Derivative.dProtectiveBufferdt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 62));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = v47;
  v112[63] = CFSTR("persistentState.Derivative.dGasSwelldt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 63));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v46;
  v112[64] = CFSTR("persistentState.Derivative.dExpGammaHardSwelldt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 64));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v45;
  v112[65] = CFSTR("persistentState.Derivative.dHardSwelldt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 65));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v44;
  v112[66] = CFSTR("persistentState.Derivative.dQpdt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 66));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = v43;
  v112[67] = CFSTR("persistentState.Derivative.dQpPhasedt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 67));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = v42;
  v112[68] = CFSTR("persistentState.Derivative.dQpAciddt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 68));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v41;
  v112[69] = CFSTR("persistentState.Derivative.dQpCrackdt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 69));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v40;
  v112[70] = CFSTR("persistentState.Derivative.dQndt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 70));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = v39;
  v112[71] = CFSTR("persistentState.Derivative.dQLidt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 71));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v38;
  v112[72] = CFSTR("persistentState.Derivative.JSEI");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 72));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v37;
  v112[73] = CFSTR("persistentState.Derivative.dWRadt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 73));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = v36;
  v112[74] = CFSTR("persistentState.Derivative.dWRcdt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 74));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v35;
  v112[75] = CFSTR("persistentState.DynamicConfiguration.SOCBiasCorrection");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 75));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = v34;
  v112[76] = CFSTR("persistentState.DynamicConfiguration.voltageChargeLimit");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)this + 76));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = v33;
  v112[77] = CFSTR("persistentState.Statistics.sleepStatistics[0]");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 77));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = v32;
  v112[78] = CFSTR("persistentState.Statistics.sleepStatistics[1]");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 78));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = v31;
  v112[79] = CFSTR("persistentState.Statistics.sleepStatistics[2]");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 79));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v30;
  v112[80] = CFSTR("persistentState.Statistics.sleepStatistics[3]");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 80));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v29;
  v112[81] = CFSTR("persistentState.Statistics.sleepStatistics[4]");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 81));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v28;
  v112[82] = CFSTR("persistentState.Statistics.sleepStatistics[5]");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 82));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = v27;
  v112[83] = CFSTR("persistentState.Status.mPreviousAlgoStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *((int *)this + 166));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = v26;
  v112[84] = CFSTR("persistentState.Status.mCurrentAlgoStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *((int *)this + 167));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = v25;
  v112[85] = CFSTR("persistentState.Status.mCurrentDataError");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *((int *)this + 168));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = v24;
  v112[86] = CFSTR("persistentState.Status.mBuffer");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *((int *)this + 169));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = v23;
  v112[87] = CFSTR("persistentState.Status.mInitType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *((unsigned int *)this + 170));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = v109;
  v112[88] = CFSTR("persistentState.Status.mFreshInitReason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *((unsigned int *)this + 171));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = v10;
  v112[89] = CFSTR("persistentState.Status.mSystemSignal.batteryAuthentication");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)this + 688));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = v11;
  v112[90] = CFSTR("persistentState.Status.mSystemSignal.batteryReplacement");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)this + 689));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = v12;
  v112[91] = CFSTR("persistentState.Status.mSystemSignal.batteryReplacementDate");
  v13 = (_QWORD *)((char *)this + 696);
  if (*((char *)this + 719) < 0)
    v13 = (_QWORD *)*v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = v14;
  v112[92] = CFSTR("persistentState.Status.mSystemSignal.time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 90));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v205 = v15;
  v112[93] = CFSTR("persistentState.Status.mSystemSignal.version");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 91));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = v16;
  v112[94] = CFSTR("persistentState.Status.mSystemSignal.batteryInfo");
  v17 = (_QWORD *)((char *)this + 736);
  if (*((char *)this + 759) < 0)
    v17 = (_QWORD *)*v17;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v207 = v18;
  v112[95] = CFSTR("persistentState.AlgorithmInitialized");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)this + 784));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = v19;
  v112[96] = CFSTR("persistentState.ParameterVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *((_QWORD *)this + 99));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = v20;
  v112[97] = CFSTR("persistentState.BatteryStateHistory");
  v210 = v111;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v113, v112, 98);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return v22;
}

void sub_236E6CC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  void *a64;
  void *a65;
  void *a66;
  void *a67;
  void *a68;
  void *a69;
  void *a70;
  void *a71;
  void *a72;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;

  _Unwind_Resume(a1);
}

id deep_copy_object(objc_object *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchiveObjectWithData:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_236E6D338(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id ACAMSerialization::Serialization::createCoreAnalyticsFromACAM(ACAMSerialization::Serialization *this, const ACAM *a2, uint64_t a3, double *a4)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _QWORD v42[14];
  _QWORD v43[16];

  v43[14] = *MEMORY[0x24BDAC8D0];
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  ACAMLogger::extractDaily(this, a4, (uint64_t)&v34);
  v42[0] = CFSTR("Qmax");
  LODWORD(v5) = DWORD2(v36);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v33;
  v42[1] = CFSTR("NCCp");
  LODWORD(v6) = HIDWORD(v35);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v32;
  v42[2] = CFSTR("wRaChangeRatio");
  LODWORD(v7) = v36;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v31;
  v42[3] = CFSTR("Qn");
  LODWORD(v8) = v34;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v30;
  v42[4] = CFSTR("Qp");
  LODWORD(v9) = DWORD1(v34);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v29;
  v42[5] = CFSTR("QLi");
  LODWORD(v10) = DWORD2(v34);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v11;
  v42[6] = CFSTR("x0");
  LODWORD(v12) = HIDWORD(v34);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v13;
  v42[7] = CFSTR("x100");
  LODWORD(v14) = v35;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v15;
  v42[8] = CFSTR("y0");
  LODWORD(v16) = DWORD1(v35);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v17;
  v42[9] = CFSTR("y100");
  LODWORD(v18) = DWORD2(v35);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v19;
  v42[10] = CFSTR("protectiveBuffer");
  LODWORD(v20) = DWORD1(v37);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v21;
  v42[11] = CFSTR("hardSwell");
  LODWORD(v22) = HIDWORD(v36);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v23;
  v42[12] = CFSTR("gasSwell");
  LODWORD(v24) = v37;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[12] = v25;
  v42[13] = CFSTR("initType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)this + 7242));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[13] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

void sub_236E6D64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_236E6D9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::locale a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

_QWORD *std::endl[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1)
{
  const std::locale::facet *v2;
  std::locale v4;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_236E6DB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

BOOL ACAMSerialization::Deserialization::isBetween(ACAMSerialization::Deserialization *this, NSNumber *a2, NSNumber *a3, NSNumber *a4)
{
  ACAMSerialization::Deserialization *v6;
  NSNumber *v7;
  NSNumber *v8;
  uint64_t v9;
  _BOOL8 v10;

  v6 = this;
  v7 = a2;
  v8 = a3;
  -[ACAMSerialization::Deserialization doubleValue](v6, "doubleValue");
  v10 = (v9 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
     && (-[ACAMSerialization::Deserialization doubleValue](v6, "doubleValue"),
         -[ACAMSerialization::Deserialization compare:](v6, "compare:", v7) != -1)
     && -[ACAMSerialization::Deserialization compare:](v6, "compare:", v8) != 1;

  return v10;
}

void sub_236E6DD6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

double ACAMSerialization::convertTeqIntoScalar(ACAMSerialization *this, NSString *a2, const double *a3)
{
  ACAMSerialization *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  int *v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  int v13;
  double v14;
  double v15;
  double v16;
  char v18;
  char __str[3];

  v4 = this;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v6 = 0;
  __str[2] = 0;
  v7 = 1;
  while (v6 < (unint64_t)-[ACAMSerialization length](v4, "length") >> 1)
  {
    __str[0] = -[ACAMSerialization characterAtIndex:](v4, "characterAtIndex:", v7 - 1);
    __str[1] = -[ACAMSerialization characterAtIndex:](v4, "characterAtIndex:", v7);
    v18 = 0;
    v18 = strtol(__str, 0, 16);
    objc_msgSend(v5, "appendBytes:length:", &v18, 1);
    ++v6;
    v7 += 2;
  }
  v8 = objc_retainAutorelease(v5);
  v9 = (int *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11 = 0.0;
  if (v10 >= 4)
  {
    v12 = v10 >> 2;
    do
    {
      v13 = *v9++;
      v14 = (double)v13;
      v15 = *(double *)a2++;
      v11 = v11 + v14 * v15;
      --v12;
    }
    while (v12);
  }
  v16 = v11 / 100.0;

  return v16;
}

void sub_236E6DEA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t ACAMUtility::ACAMParameterPack::ACAMParameterPack(uint64_t a1, ACAMUtility *this, int a3)
{
  void *v4;
  int64x2_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  __int128 v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  __int128 v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  __int128 v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  __int128 v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  __int128 v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  __int128 v102;
  void *v103;
  _QWORD *v105;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = xmmword_236E72AE0;
  *(_OWORD *)(a1 + 88) = unk_236E72CB0;
  *(_OWORD *)(a1 + 104) = xmmword_236E72CC0;
  v4 = (void *)(a1 + 40);
  *(_QWORD *)(a1 + 64) = 0x3FF4CCCCCCCCCCCDLL;
  *(_OWORD *)(a1 + 120) = unk_236E72CD0;
  *(_OWORD *)(a1 + 136) = xmmword_236E72CE0;
  *(_OWORD *)(a1 + 72) = xmmword_236E72CA0;
  *(_OWORD *)(a1 + 152) = xmmword_236E72AF0;
  *(_OWORD *)(a1 + 168) = xmmword_236E72B00;
  *(int64x2_t *)(a1 + 184) = vdupq_n_s64(0x3F9999999999999AuLL);
  *(int64x2_t *)(a1 + 200) = vdupq_n_s64(6uLL);
  *(int64x2_t *)(a1 + 216) = vdupq_n_s64(0xAuLL);
  *(int64x2_t *)(a1 + 232) = vdupq_n_s64(0x3F76872B020C49BAuLL);
  *(_OWORD *)(a1 + 248) = xmmword_236E72B10;
  *(_QWORD *)(a1 + 264) = 0x405E000000000000;
  *(_OWORD *)(a1 + 272) = xmmword_236E72B20;
  *(_OWORD *)(a1 + 288) = xmmword_236E72B30;
  *(_OWORD *)(a1 + 304) = xmmword_236E72B40;
  *(_QWORD *)(a1 + 320) = 0x3FE6666666666666;
  *(_OWORD *)(a1 + 328) = xmmword_236E72CF0;
  *(_OWORD *)(a1 + 344) = unk_236E72D00;
  *(_OWORD *)(a1 + 360) = xmmword_236E72D10;
  *(_QWORD *)(a1 + 376) = 0x40AC200000000000;
  *(_OWORD *)(a1 + 384) = xmmword_236E72B50;
  *(_OWORD *)(a1 + 400) = xmmword_236E72B60;
  *(_QWORD *)(a1 + 416) = 1000;
  *(_QWORD *)(a1 + 424) = 0x3F50624DD2F1A9FCLL;
  *(_OWORD *)(a1 + 432) = xmmword_236E72B70;
  *(_OWORD *)(a1 + 448) = xmmword_236E72B80;
  v5 = vdupq_n_s64(1uLL);
  *(int64x2_t *)(a1 + 464) = v5;
  *(int64x2_t *)(a1 + 480) = v5;
  *(int64x2_t *)(a1 + 496) = v5;
  *(_QWORD *)(a1 + 512) = 1;
  *(_QWORD *)(a1 + 520) = 0x3EC77CF44765195FLL;
  *(_OWORD *)(a1 + 528) = xmmword_236E72B90;
  *(_OWORD *)(a1 + 544) = xmmword_236E72BA0;
  *(int64x2_t *)(a1 + 560) = vdupq_n_s64(0x3EFD5C31593E5FB7uLL);
  *(_OWORD *)(a1 + 576) = xmmword_236E72BB0;
  *(_QWORD *)(a1 + 592) = 0x4034000000000000;
  *(_BYTE *)(a1 + 600) = 1;
  *(_OWORD *)(a1 + 608) = xmmword_236E72BC0;
  *(_OWORD *)(a1 + 624) = xmmword_236E72BD0;
  *(_OWORD *)(a1 + 640) = xmmword_236E72BE0;
  *(_OWORD *)(a1 + 656) = xmmword_236E72BF0;
  *(_OWORD *)(a1 + 672) = xmmword_236E72C00;
  *(int64x2_t *)(a1 + 688) = vdupq_n_s64(0x3FE999999999999AuLL);
  *(_OWORD *)(a1 + 704) = xmmword_236E72C10;
  *(_OWORD *)(a1 + 720) = xmmword_236E72C20;
  *(_OWORD *)(a1 + 736) = xmmword_236E72C20;
  *(_OWORD *)(a1 + 752) = xmmword_236E72C20;
  *(_QWORD *)(a1 + 768) = 0x4034000000000000;
  if (*((char *)this + 23) < 0)
    this = *(ACAMUtility **)this;
  v6 = ACAMUtility::string_hash(this, 0, a3);
  if (v6 > -1404478093)
  {
    if (v6 > -1404472590)
    {
      if (v6 > -911129380)
      {
        if (v6 == -911129379)
        {
          v98 = (void *)operator new();
          *(_QWORD *)(a1 + 8) = v98;
          memcpy(v98, &gACAMAgingModelParameterD47COS, 0x4C0uLL);
          v99 = operator new();
          ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v99, gOcpNegRawDataD47COS, gOcpPosRawDataD47COS, gTempGridRawDataD47COS, gCRateChgGridRawDataD47COS, gCRateDcgGridRawDataD47COS, (uint64_t)&gResistanceNegChgRawDataD47COS, (uint64_t)&gResistancePosChgRawDataD47COS, (uint64_t)&gResistanceNegDcgRawDataD47COS, (uint64_t)&gResistancePosDcgRawDataD47COS, gWRaFreshRawDataD47COS, gWRcFreshRawDataD47COS);
          *(_QWORD *)a1 = v99;
          v100 = (void *)operator new();
          *(_QWORD *)(a1 + 16) = v100;
          memcpy(v100, &gACAMAgingUpdatorParameterD47COS, 0x14A0uLL);
          v101 = operator new();
          *(_QWORD *)(a1 + 24) = v101;
          v102 = unk_256789BB0;
          *(_OWORD *)v101 = gACAMCommonParameterD47COS;
          *(_OWORD *)(v101 + 16) = v102;
          *(_QWORD *)(v101 + 32) = qword_256789BC0;
          v103 = (void *)operator new();
          *(_QWORD *)(a1 + 32) = v103;
          memcpy(v103, &gACAMAgingTableD47COS, 0x5010uLL);
          v13 = &gACAMConfigurationD47COS;
          goto LABEL_42;
        }
        if (v6 == 2072405230)
        {
          v50 = (void *)operator new();
          *(_QWORD *)(a1 + 8) = v50;
          memcpy(v50, &gACAMAgingModelParameterDefault, 0x4C0uLL);
          v51 = operator new();
          ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v51, gOcpNegRawDataDefault, gOcpPosRawDataDefault, gTempGridRawDataDefault, gCRateChgGridRawDataDefault, gCRateDcgGridRawDataDefault, (uint64_t)&gResistanceNegChgRawDataDefault, (uint64_t)&gResistancePosChgRawDataDefault, (uint64_t)&gResistanceNegDcgRawDataDefault, (uint64_t)&gResistancePosDcgRawDataDefault, gWRaFreshRawDataDefault, gWRcFreshRawDataDefault);
          *(_QWORD *)a1 = v51;
          v52 = (void *)operator new();
          *(_QWORD *)(a1 + 16) = v52;
          memcpy(v52, &gACAMAgingUpdatorParameterDefault, 0x14A0uLL);
          v53 = operator new();
          *(_QWORD *)(a1 + 24) = v53;
          v54 = unk_25654CDD8;
          *(_OWORD *)v53 = gACAMCommonParameterDefault;
          *(_OWORD *)(v53 + 16) = v54;
          *(_QWORD *)(v53 + 32) = qword_25654CDE8;
          v55 = (void *)operator new();
          *(_QWORD *)(a1 + 32) = v55;
          memcpy(v55, &gACAMAgingTableDefault, 0x5010uLL);
          v13 = &gACAMConfigurationDefault;
          goto LABEL_42;
        }
      }
      else
      {
        if (v6 == -1404472589)
        {
          v74 = (void *)operator new();
          *(_QWORD *)(a1 + 8) = v74;
          memcpy(v74, &gACAMAgingModelParameterD83ATL, 0x4C0uLL);
          v75 = operator new();
          ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v75, gOcpNegRawDataD83ATL, gOcpPosRawDataD83ATL, gTempGridRawDataD83ATL, gCRateChgGridRawDataD83ATL, gCRateDcgGridRawDataD83ATL, (uint64_t)&gResistanceNegChgRawDataD83ATL, (uint64_t)&gResistancePosChgRawDataD83ATL, (uint64_t)&gResistanceNegDcgRawDataD83ATL, (uint64_t)&gResistancePosDcgRawDataD83ATL, gWRaFreshRawDataD83ATL, gWRcFreshRawDataD83ATL);
          *(_QWORD *)a1 = v75;
          v76 = (void *)operator new();
          *(_QWORD *)(a1 + 16) = v76;
          memcpy(v76, &gACAMAgingUpdatorParameterD83ATL, 0x14A0uLL);
          v77 = operator new();
          *(_QWORD *)(a1 + 24) = v77;
          v78 = unk_256687698;
          *(_OWORD *)v77 = gACAMCommonParameterD83ATL;
          *(_OWORD *)(v77 + 16) = v78;
          *(_QWORD *)(v77 + 32) = qword_2566876A8;
          v79 = (void *)operator new();
          *(_QWORD *)(a1 + 32) = v79;
          memcpy(v79, &gACAMAgingTableD83ATL, 0x5010uLL);
          v13 = &gACAMConfigurationD83ATL;
          goto LABEL_42;
        }
        if (v6 == -911133867)
        {
          v26 = (void *)operator new();
          *(_QWORD *)(a1 + 8) = v26;
          memcpy(v26, &gACAMAgingModelParameterD83COS, 0x4C0uLL);
          v27 = operator new();
          ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v27, gOcpNegRawDataD83COS, gOcpPosRawDataD83COS, gTempGridRawDataD83COS, gCRateChgGridRawDataD83COS, gCRateDcgGridRawDataD83COS, (uint64_t)&gResistanceNegChgRawDataD83COS, (uint64_t)&gResistancePosChgRawDataD83COS, (uint64_t)&gResistanceNegDcgRawDataD83COS, (uint64_t)&gResistancePosDcgRawDataD83COS, gWRaFreshRawDataD83COS, gWRcFreshRawDataD83COS);
          *(_QWORD *)a1 = v27;
          v28 = (void *)operator new();
          *(_QWORD *)(a1 + 16) = v28;
          memcpy(v28, &gACAMAgingUpdatorParameterD83COS, 0x14A0uLL);
          v29 = operator new();
          *(_QWORD *)(a1 + 24) = v29;
          v30 = unk_25678F0A8;
          *(_OWORD *)v29 = gACAMCommonParameterD83COS;
          *(_OWORD *)(v29 + 16) = v30;
          *(_QWORD *)(v29 + 32) = qword_25678F0B8;
          v31 = (void *)operator new();
          *(_QWORD *)(a1 + 32) = v31;
          memcpy(v31, &gACAMAgingTableD83COS, 0x5010uLL);
          v13 = &gACAMConfigurationD83COS;
          goto LABEL_42;
        }
      }
    }
    else if (v6 > -1404476550)
    {
      if (v6 == -1404476549)
      {
        v86 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v86;
        memcpy(v86, &gACAMAgingModelParameterD47ATL, 0x4C0uLL);
        v87 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v87, gOcpNegRawDataD47ATL, gOcpPosRawDataD47ATL, gTempGridRawDataD47ATL, gCRateChgGridRawDataD47ATL, gCRateDcgGridRawDataD47ATL, (uint64_t)&gResistanceNegChgRawDataD47ATL, (uint64_t)&gResistancePosChgRawDataD47ATL, (uint64_t)&gResistanceNegDcgRawDataD47ATL, (uint64_t)&gResistancePosDcgRawDataD47ATL, gWRaFreshRawDataD47ATL, gWRcFreshRawDataD47ATL);
        *(_QWORD *)a1 = v87;
        v88 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v88;
        memcpy(v88, &gACAMAgingUpdatorParameterD47ATL, 0x14A0uLL);
        v89 = operator new();
        *(_QWORD *)(a1 + 24) = v89;
        v90 = unk_2567579D0;
        *(_OWORD *)v89 = gACAMCommonParameterD47ATL;
        *(_OWORD *)(v89 + 16) = v90;
        *(_QWORD *)(v89 + 32) = qword_2567579E0;
        v91 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v91;
        memcpy(v91, &gACAMAgingTableD47ATL, 0x5010uLL);
        v13 = &gACAMConfigurationD47ATL;
        goto LABEL_42;
      }
      if (v6 == -1404472622)
      {
        v38 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v38;
        memcpy(v38, &gACAMAgingModelParameterD93ATL, 0x4C0uLL);
        v39 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v39, gOcpNegRawDataD93ATL, gOcpPosRawDataD93ATL, gTempGridRawDataD93ATL, gCRateChgGridRawDataD93ATL, gCRateDcgGridRawDataD93ATL, (uint64_t)&gResistanceNegChgRawDataD93ATL, (uint64_t)&gResistancePosChgRawDataD93ATL, (uint64_t)&gResistanceNegDcgRawDataD93ATL, (uint64_t)&gResistancePosDcgRawDataD93ATL, gWRaFreshRawDataD93ATL, gWRcFreshRawDataD93ATL);
        *(_QWORD *)a1 = v39;
        v40 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v40;
        memcpy(v40, &gACAMAgingUpdatorParameterD93ATL, 0x14A0uLL);
        v41 = operator new();
        *(_QWORD *)(a1 + 24) = v41;
        v42 = unk_25651A760;
        *(_OWORD *)v41 = gACAMCommonParameterD93ATL;
        *(_OWORD *)(v41 + 16) = v42;
        *(_QWORD *)(v41 + 32) = qword_25651A770;
        v43 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v43;
        memcpy(v43, &gACAMAgingTableD93ATL, 0x5010uLL);
        v13 = &gACAMConfigurationD93ATL;
        goto LABEL_42;
      }
    }
    else
    {
      if (v6 == -1404478092)
      {
        v62 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v62;
        memcpy(v62, &gACAMAgingModelParameterD84ATL, 0x4C0uLL);
        v63 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v63, gOcpNegRawDataD84ATL, gOcpPosRawDataD84ATL, gTempGridRawDataD84ATL, gCRateChgGridRawDataD84ATL, gCRateDcgGridRawDataD84ATL, (uint64_t)&gResistanceNegChgRawDataD84ATL, (uint64_t)&gResistancePosChgRawDataD84ATL, (uint64_t)&gResistanceNegDcgRawDataD84ATL, (uint64_t)&gResistancePosDcgRawDataD84ATL, gWRaFreshRawDataD84ATL, gWRcFreshRawDataD84ATL);
        *(_QWORD *)a1 = v63;
        v64 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v64;
        memcpy(v64, &gACAMAgingUpdatorParameterD84ATL, 0x14A0uLL);
        v65 = operator new();
        *(_QWORD *)(a1 + 24) = v65;
        v66 = unk_2564E70E0;
        *(_OWORD *)v65 = gACAMCommonParameterD84ATL;
        *(_OWORD *)(v65 + 16) = v66;
        *(_QWORD *)(v65 + 32) = qword_2564E70F0;
        v67 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v67;
        memcpy(v67, &gACAMAgingTableD84ATL, 0x5010uLL);
        v13 = &gACAMConfigurationD84ATL;
        goto LABEL_42;
      }
      if (v6 == -1404476900)
      {
        v14 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v14;
        memcpy(v14, &gACAMAgingModelParameterD37ATL, 0x4C0uLL);
        v15 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v15, gOcpNegRawDataD37ATL, gOcpPosRawDataD37ATL, gTempGridRawDataD37ATL, gCRateChgGridRawDataD37ATL, gCRateDcgGridRawDataD37ATL, (uint64_t)&gResistanceNegChgRawDataD37ATL, (uint64_t)&gResistancePosChgRawDataD37ATL, (uint64_t)&gResistanceNegDcgRawDataD37ATL, (uint64_t)&gResistancePosDcgRawDataD37ATL, gWRaFreshRawDataD37ATL, gWRcFreshRawDataD37ATL);
        *(_QWORD *)a1 = v15;
        v16 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v16;
        memcpy(v16, &gACAMAgingUpdatorParameterD37ATL, 0x14A0uLL);
        v17 = operator new();
        *(_QWORD *)(a1 + 24) = v17;
        v18 = unk_256687670;
        *(_OWORD *)v17 = gACAMCommonParameterD37ATL;
        *(_OWORD *)(v17 + 16) = v18;
        *(_QWORD *)(v17 + 32) = qword_256687680;
        v19 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v19;
        memcpy(v19, &gACAMAgingTableD37ATL, 0x5010uLL);
        v13 = &gACAMConfigurationD37ATL;
        goto LABEL_42;
      }
    }
LABEL_43:
    v105 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x24BEDB318], "Unrecognized Program\n");
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v105);
    exit(1);
  }
  if (v6 > -1546430196)
  {
    if (v6 > -1404482094)
    {
      if (v6 == -1404482093)
      {
        v92 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v92;
        memcpy(v92, &gACAMAgingModelParameterD38ATL, 0x4C0uLL);
        v93 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v93, gOcpNegRawDataD38ATL, gOcpPosRawDataD38ATL, gTempGridRawDataD38ATL, gCRateChgGridRawDataD38ATL, gCRateDcgGridRawDataD38ATL, (uint64_t)&gResistanceNegChgRawDataD38ATL, (uint64_t)&gResistancePosChgRawDataD38ATL, (uint64_t)&gResistanceNegDcgRawDataD38ATL, (uint64_t)&gResistancePosDcgRawDataD38ATL, gWRaFreshRawDataD38ATL, gWRcFreshRawDataD38ATL);
        *(_QWORD *)a1 = v93;
        v94 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v94;
        memcpy(v94, &gACAMAgingUpdatorParameterD38ATL, 0x14A0uLL);
        v95 = operator new();
        *(_QWORD *)(a1 + 24) = v95;
        v96 = unk_256551E10;
        *(_OWORD *)v95 = gACAMCommonParameterD38ATL;
        *(_OWORD *)(v95 + 16) = v96;
        *(_QWORD *)(v95 + 32) = qword_256551E20;
        v97 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v97;
        memcpy(v97, &gACAMAgingTableD38ATL, 0x5010uLL);
        v13 = &gACAMConfigurationD38ATL;
        goto LABEL_42;
      }
      if (v6 == -1404478187)
      {
        v44 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v44;
        memcpy(v44, &gACAMAgingModelParameterD94ATL, 0x4C0uLL);
        v45 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v45, gOcpNegRawDataD94ATL, gOcpPosRawDataD94ATL, gTempGridRawDataD94ATL, gCRateChgGridRawDataD94ATL, gCRateDcgGridRawDataD94ATL, (uint64_t)&gResistanceNegChgRawDataD94ATL, (uint64_t)&gResistancePosChgRawDataD94ATL, (uint64_t)&gResistanceNegDcgRawDataD94ATL, (uint64_t)&gResistancePosDcgRawDataD94ATL, gWRaFreshRawDataD94ATL, gWRcFreshRawDataD94ATL);
        *(_QWORD *)a1 = v45;
        v46 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v46;
        memcpy(v46, &gACAMAgingUpdatorParameterD94ATL, 0x14A0uLL);
        v47 = operator new();
        *(_QWORD *)(a1 + 24) = v47;
        v48 = unk_2564528D0;
        *(_OWORD *)v47 = gACAMCommonParameterD94ATL;
        *(_OWORD *)(v47 + 16) = v48;
        *(_QWORD *)(v47 + 32) = qword_2564528E0;
        v49 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v49;
        memcpy(v49, &gACAMAgingTableD94ATL, 0x5010uLL);
        v13 = &gACAMConfigurationD94ATL;
        goto LABEL_42;
      }
    }
    else
    {
      if (v6 == -1546430195)
      {
        v68 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v68;
        memcpy(v68, &gACAMAgingModelParameterD37LGC, 0x4C0uLL);
        v69 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v69, gOcpNegRawDataD37LGC, gOcpPosRawDataD37LGC, gTempGridRawDataD37LGC, gCRateChgGridRawDataD37LGC, gCRateDcgGridRawDataD37LGC, (uint64_t)&gResistanceNegChgRawDataD37LGC, (uint64_t)&gResistancePosChgRawDataD37LGC, (uint64_t)&gResistanceNegDcgRawDataD37LGC, (uint64_t)&gResistancePosDcgRawDataD37LGC, gWRaFreshRawDataD37LGC, gWRcFreshRawDataD37LGC);
        *(_QWORD *)a1 = v69;
        v70 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v70;
        memcpy(v70, &gACAMAgingUpdatorParameterD37LGC, 0x14A0uLL);
        v71 = operator new();
        *(_QWORD *)(a1 + 24) = v71;
        v72 = unk_256593A08;
        *(_OWORD *)v71 = gACAMCommonParameterD37LGC;
        *(_OWORD *)(v71 + 16) = v72;
        *(_QWORD *)(v71 + 32) = qword_256593A18;
        v73 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v73;
        memcpy(v73, &gACAMAgingTableD37LGC, 0x5010uLL);
        v13 = &gACAMConfigurationD37LGC;
        goto LABEL_42;
      }
      if (v6 == -1404482316)
      {
        v20 = (void *)operator new();
        *(_QWORD *)(a1 + 8) = v20;
        memcpy(v20, &gACAMAgingModelParameterD48ATL, 0x4C0uLL);
        v21 = operator new();
        ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v21, gOcpNegRawDataD48ATL, gOcpPosRawDataD48ATL, gTempGridRawDataD48ATL, gCRateChgGridRawDataD48ATL, gCRateDcgGridRawDataD48ATL, (uint64_t)&gResistanceNegChgRawDataD48ATL, (uint64_t)&gResistancePosChgRawDataD48ATL, (uint64_t)&gResistanceNegDcgRawDataD48ATL, (uint64_t)&gResistancePosDcgRawDataD48ATL, gWRaFreshRawDataD48ATL, gWRcFreshRawDataD48ATL);
        *(_QWORD *)a1 = v21;
        v22 = (void *)operator new();
        *(_QWORD *)(a1 + 16) = v22;
        memcpy(v22, &gACAMAgingUpdatorParameterD48ATL, 0x14A0uLL);
        v23 = operator new();
        *(_QWORD *)(a1 + 24) = v23;
        v24 = unk_2566876C0;
        *(_OWORD *)v23 = gACAMCommonParameterD48ATL;
        *(_OWORD *)(v23 + 16) = v24;
        *(_QWORD *)(v23 + 32) = qword_2566876D0;
        v25 = (void *)operator new();
        *(_QWORD *)(a1 + 32) = v25;
        memcpy(v25, &gACAMAgingTableD48ATL, 0x5010uLL);
        v13 = &gACAMConfigurationD48ATL;
        goto LABEL_42;
      }
    }
    goto LABEL_43;
  }
  if (v6 > -1546433661)
  {
    if (v6 == -1546433660)
    {
      v80 = (void *)operator new();
      *(_QWORD *)(a1 + 8) = v80;
      memcpy(v80, &gACAMAgingModelParameterD94LGC, 0x4C0uLL);
      v81 = operator new();
      ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v81, gOcpNegRawDataD94LGC, gOcpPosRawDataD94LGC, gTempGridRawDataD94LGC, gCRateChgGridRawDataD94LGC, gCRateDcgGridRawDataD94LGC, (uint64_t)&gResistanceNegChgRawDataD94LGC, (uint64_t)&gResistancePosChgRawDataD94LGC, (uint64_t)&gResistanceNegDcgRawDataD94LGC, (uint64_t)&gResistancePosDcgRawDataD94LGC, gWRaFreshRawDataD94LGC, gWRcFreshRawDataD94LGC);
      *(_QWORD *)a1 = v81;
      v82 = (void *)operator new();
      *(_QWORD *)(a1 + 16) = v82;
      memcpy(v82, &gACAMAgingUpdatorParameterD94LGC, 0x14A0uLL);
      v83 = operator new();
      *(_QWORD *)(a1 + 24) = v83;
      v84 = unk_2564E85A8;
      *(_OWORD *)v83 = gACAMCommonParameterD94LGC;
      *(_OWORD *)(v83 + 16) = v84;
      *(_QWORD *)(v83 + 32) = qword_2564E85B8;
      v85 = (void *)operator new();
      *(_QWORD *)(a1 + 32) = v85;
      memcpy(v85, &gACAMAgingTableD94LGC, 0x5010uLL);
      v13 = &gACAMConfigurationD94LGC;
      goto LABEL_42;
    }
    if (v6 == -1546433627)
    {
      v32 = (void *)operator new();
      *(_QWORD *)(a1 + 8) = v32;
      memcpy(v32, &gACAMAgingModelParameterD84LGC, 0x4C0uLL);
      v33 = operator new();
      ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v33, gOcpNegRawDataD84LGC, gOcpPosRawDataD84LGC, gTempGridRawDataD84LGC, gCRateChgGridRawDataD84LGC, gCRateDcgGridRawDataD84LGC, (uint64_t)&gResistanceNegChgRawDataD84LGC, (uint64_t)&gResistancePosChgRawDataD84LGC, (uint64_t)&gResistanceNegDcgRawDataD84LGC, (uint64_t)&gResistancePosDcgRawDataD84LGC, gWRaFreshRawDataD84LGC, gWRcFreshRawDataD84LGC);
      *(_QWORD *)a1 = v33;
      v34 = (void *)operator new();
      *(_QWORD *)(a1 + 16) = v34;
      memcpy(v34, &gACAMAgingUpdatorParameterD84LGC, 0x14A0uLL);
      v35 = operator new();
      *(_QWORD *)(a1 + 24) = v35;
      v36 = unk_256784B78;
      *(_OWORD *)v35 = gACAMCommonParameterD84LGC;
      *(_OWORD *)(v35 + 16) = v36;
      *(_QWORD *)(v35 + 32) = qword_256784B88;
      v37 = (void *)operator new();
      *(_QWORD *)(a1 + 32) = v37;
      memcpy(v37, &gACAMAgingTableD84LGC, 0x5010uLL);
      v13 = &gACAMConfigurationD84LGC;
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  if (v6 == -1546437851)
  {
    v56 = (void *)operator new();
    *(_QWORD *)(a1 + 8) = v56;
    memcpy(v56, &gACAMAgingModelParameterD48LGC, 0x4C0uLL);
    v57 = operator new();
    ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v57, gOcpNegRawDataD48LGC, gOcpPosRawDataD48LGC, gTempGridRawDataD48LGC, gCRateChgGridRawDataD48LGC, gCRateDcgGridRawDataD48LGC, (uint64_t)&gResistanceNegChgRawDataD48LGC, (uint64_t)&gResistancePosChgRawDataD48LGC, (uint64_t)&gResistanceNegDcgRawDataD48LGC, (uint64_t)&gResistancePosDcgRawDataD48LGC, gWRaFreshRawDataD48LGC, gWRcFreshRawDataD48LGC);
    *(_QWORD *)a1 = v57;
    v58 = (void *)operator new();
    *(_QWORD *)(a1 + 16) = v58;
    memcpy(v58, &gACAMAgingUpdatorParameterD48LGC, 0x14A0uLL);
    v59 = operator new();
    *(_QWORD *)(a1 + 24) = v59;
    v60 = unk_2566B7668;
    *(_OWORD *)v59 = gACAMCommonParameterD48LGC;
    *(_OWORD *)(v59 + 16) = v60;
    *(_QWORD *)(v59 + 32) = qword_2566B7678;
    v61 = (void *)operator new();
    *(_QWORD *)(a1 + 32) = v61;
    memcpy(v61, &gACAMAgingTableD48LGC, 0x5010uLL);
    v13 = &gACAMConfigurationD48LGC;
    goto LABEL_42;
  }
  if (v6 != -1546437566)
    goto LABEL_43;
  v7 = (void *)operator new();
  *(_QWORD *)(a1 + 8) = v7;
  memcpy(v7, &gACAMAgingModelParameterD38LGC, 0x4C0uLL);
  v8 = operator new();
  ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(v8, gOcpNegRawDataD38LGC, gOcpPosRawDataD38LGC, gTempGridRawDataD38LGC, gCRateChgGridRawDataD38LGC, gCRateDcgGridRawDataD38LGC, (uint64_t)&gResistanceNegChgRawDataD38LGC, (uint64_t)&gResistancePosChgRawDataD38LGC, (uint64_t)&gResistanceNegDcgRawDataD38LGC, (uint64_t)&gResistancePosDcgRawDataD38LGC, gWRaFreshRawDataD38LGC, gWRcFreshRawDataD38LGC);
  *(_QWORD *)a1 = v8;
  v9 = (void *)operator new();
  *(_QWORD *)(a1 + 16) = v9;
  memcpy(v9, &gACAMAgingUpdatorParameterD38LGC, 0x14A0uLL);
  v10 = operator new();
  *(_QWORD *)(a1 + 24) = v10;
  v11 = unk_2564E1DC8;
  *(_OWORD *)v10 = gACAMCommonParameterD38LGC;
  *(_OWORD *)(v10 + 16) = v11;
  *(_QWORD *)(v10 + 32) = qword_2564E1DD8;
  v12 = (void *)operator new();
  *(_QWORD *)(a1 + 32) = v12;
  memcpy(v12, &gACAMAgingTableD38LGC, 0x5010uLL);
  v13 = &gACAMConfigurationD38LGC;
LABEL_42:
  memcpy(v4, v13, 0x2E0uLL);
  return a1;
}

void sub_236E6F830(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B8057D4](v1, 0x10C0C407B3330CALL);
  _Unwind_Resume(a1);
}

uint64_t ACAMUtility::string_hash(ACAMUtility *this, const char *a2, int a3)
{
  if (*((_BYTE *)this + (int)a2))
    return (33 * ACAMUtility::string_hash(this, (const char *)((_DWORD)a2 + 1), a3)) ^ *((char *)this + (int)a2);
  else
    return 5381;
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

uint64_t ACAMPerformanceModelParameter::ACAMPerformanceModelParameter<201,149,3,16,2,103,3>(uint64_t a1, double *a2, double *a3, double *a4, double *a5, double *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, double *a11, double *a12)
{
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  _OWORD *v24;
  _OWORD *v25;
  _OWORD *v26;
  _OWORD *v27;
  _OWORD *v28;
  _OWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  _OWORD *v38;
  _OWORD *v39;
  _OWORD *v40;
  _OWORD *v41;
  _OWORD *v42;
  _OWORD *v43;
  _OWORD *v44;
  _OWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  double *v51;
  BOOL v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  BOOL v56;
  BOOL v57;

  *(_BYTE *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  *(_BYTE *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 224) = 0;
  *(_BYTE *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 272) = 0;
  *(_QWORD *)(a1 + 280) = 0;
  *(_BYTE *)(a1 + 288) = 0;
  *(_QWORD *)(a1 + 328) = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = 0;
  *(_BYTE *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 304) = 0;
  *(_QWORD *)(a1 + 312) = 0;
  *(_QWORD *)(a1 + 296) = 0;
  *(_BYTE *)(a1 + 320) = 0;
  *(_OWORD *)(a1 + 16) = xmmword_236E72C30;
  *(_OWORD *)(a1 + 32) = xmmword_236E72C40;
  *(_OWORD *)(a1 + 48) = xmmword_236E72C50;
  *(_OWORD *)(a1 + 64) = xmmword_236E72C60;
  *(_OWORD *)(a1 + 80) = xmmword_236E72C70;
  *(_QWORD *)(a1 + 96) = 22981;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  v15 = *a2 > a2[200];
  *(_QWORD *)(a1 + 104) = a2;
  *(_QWORD *)(a1 + 112) = 201;
  *(_BYTE *)(a1 + 120) = v15;
  v16 = *a3 > a3[148];
  *(_QWORD *)(a1 + 128) = a2 + 201;
  *(_QWORD *)(a1 + 136) = a3;
  *(_QWORD *)(a1 + 144) = 149;
  *(_BYTE *)(a1 + 152) = v16;
  v17 = *a4 > a4[2];
  *(_QWORD *)(a1 + 160) = a3 + 149;
  *(_QWORD *)(a1 + 168) = a4;
  *(_QWORD *)(a1 + 176) = 3;
  *(_BYTE *)(a1 + 184) = v17;
  v18 = *a5 > a5[15];
  *(_QWORD *)(a1 + 192) = a5;
  *(_QWORD *)(a1 + 200) = 16;
  *(_BYTE *)(a1 + 208) = v18;
  v19 = *a6 > a6[1];
  *(_QWORD *)(a1 + 216) = a6;
  *(_QWORD *)(a1 + 224) = 2;
  *(_BYTE *)(a1 + 232) = v19;
  *(_QWORD *)(a1 + 240) = operator new[]();
  *(_QWORD *)(a1 + 248) = operator new[]();
  *(_QWORD *)(a1 + 256) = operator new[]();
  v20 = 0;
  v21 = 0;
  *(_QWORD *)(a1 + 264) = operator new[]();
  do
  {
    v22 = (_OWORD *)operator new[]();
    v23 = v22 + 33;
    *v22 = xmmword_236E72C80;
    v24 = v22 + 1;
    v25 = v24;
    do
    {
      *(_QWORD *)v25 = 0;
      *((_QWORD *)v25 + 1) = 0;
      *((_BYTE *)v25 + 16) = 0;
      *((_QWORD *)v25 + 3) = 0;
      v25 += 2;
    }
    while (v25 != v23);
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8 * v21) = v24;
    v26 = (_OWORD *)operator new[]();
    v27 = v26 + 33;
    *v26 = xmmword_236E72C80;
    v28 = v26 + 1;
    v29 = v28;
    do
    {
      *(_QWORD *)v29 = 0;
      *((_QWORD *)v29 + 1) = 0;
      *((_BYTE *)v29 + 16) = 0;
      *((_QWORD *)v29 + 3) = 0;
      v29 += 2;
    }
    while (v29 != v27);
    v30 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 248) + 8 * v21) = v28;
    v31 = *(_QWORD *)(a1 + 240);
    v32 = *(_QWORD *)(a1 + 248);
    v33 = v20;
    do
    {
      v34 = *(double *)(a7 + v33) > *(double *)(a7 + v33 + 816);
      v35 = *(_QWORD *)(v31 + 8 * v21) + v30;
      *(_QWORD *)v35 = a7 + v33;
      *(_QWORD *)(v35 + 8) = 103;
      *(_BYTE *)(v35 + 16) = v34;
      *(_QWORD *)(v35 + 24) = a7 + v33 + 824;
      v36 = *(double *)(a8 + v33) > *(double *)(a8 + v33 + 816);
      v37 = *(_QWORD *)(v32 + 8 * v21) + v30;
      *(_QWORD *)v37 = a8 + v33;
      *(_QWORD *)(v37 + 8) = 103;
      *(_BYTE *)(v37 + 16) = v36;
      *(_QWORD *)(v37 + 24) = a8 + v33 + 824;
      v30 += 32;
      v33 += 1648;
    }
    while (v30 != 512);
    v38 = (_OWORD *)operator new[]();
    v39 = v38 + 1;
    *v38 = xmmword_236E72C90;
    v40 = v38 + 5;
    v41 = v39;
    do
    {
      *(_QWORD *)v41 = 0;
      *((_QWORD *)v41 + 1) = 0;
      *((_BYTE *)v41 + 16) = 0;
      *((_QWORD *)v41 + 3) = 0;
      v41 += 2;
    }
    while (v41 != v40);
    *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8 * v21) = v39;
    v42 = (_OWORD *)operator new[]();
    v43 = v42 + 1;
    *v42 = xmmword_236E72C90;
    v44 = v42 + 5;
    v45 = v43;
    do
    {
      *(_QWORD *)v45 = 0;
      *((_QWORD *)v45 + 1) = 0;
      *((_BYTE *)v45 + 16) = 0;
      *((_QWORD *)v45 + 3) = 0;
      v45 += 2;
    }
    while (v45 != v44);
    v46 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8 * v21) = v43;
    v47 = *(_QWORD *)(a1 + 256);
    v48 = *(_QWORD *)(a1 + 264);
    v49 = 1;
    do
    {
      v50 = v49;
      v51 = (double *)(a9 + 3296 * v21 + 1648 * v46);
      v52 = *v51 > v51[102];
      v53 = *(_QWORD *)(v47 + 8 * v21) + 32 * v46;
      *(_QWORD *)v53 = v51;
      *(_QWORD *)(v53 + 8) = 103;
      *(_BYTE *)(v53 + 16) = v52;
      *(_QWORD *)(v53 + 24) = v51 + 103;
      v54 = (double *)(a10 + 3296 * v21 + 1648 * v46);
      LOBYTE(v51) = *v54 > v54[102];
      v55 = *(_QWORD *)(v48 + 8 * v21) + 32 * v46;
      *(_QWORD *)v55 = v54;
      *(_QWORD *)(v55 + 8) = 103;
      *(_BYTE *)(v55 + 16) = (_BYTE)v51;
      *(_QWORD *)(v55 + 24) = v54 + 103;
      v46 = 1;
      v49 = 0;
    }
    while ((v50 & 1) != 0);
    ++v21;
    v20 += 26368;
  }
  while (v21 != 3);
  v56 = *a11 > a11[2];
  *(_QWORD *)(a1 + 272) = a11;
  *(_QWORD *)(a1 + 280) = 3;
  *(_BYTE *)(a1 + 288) = v56;
  v57 = *a12 > a12[2];
  *(_QWORD *)(a1 + 296) = a11 + 3;
  *(_QWORD *)(a1 + 304) = a12;
  *(_QWORD *)(a1 + 312) = 3;
  *(_BYTE *)(a1 + 320) = v57;
  *(_QWORD *)(a1 + 328) = a12 + 3;
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x23B805774](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x23B805780](v13);
  return a1;
}

void sub_236E6FEA4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x23B805780](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x236E6FE84);
}

void sub_236E6FEEC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_236E70020(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void ACAMUtility::ACAMParameterPack::~ACAMParameterPack(ACAMPerformanceModelParameter **this)
{
  ACAMPerformanceModelParameter *v2;
  ACAMPerformanceModelParameter *v3;
  ACAMPerformanceModelParameter *v4;
  ACAMPerformanceModelParameter *v5;
  ACAMPerformanceModelParameter *v6;

  v2 = *this;
  if (v2)
  {
    ACAMPerformanceModelParameter::~ACAMPerformanceModelParameter(v2);
    MEMORY[0x23B8057D4]();
  }
  v3 = this[1];
  if (v3)
    MEMORY[0x23B8057D4](v3, 0x1000C403BB0EBA7);
  v4 = this[2];
  if (v4)
    MEMORY[0x23B8057D4](v4, 0x1000C4003173957);
  v5 = this[3];
  if (v5)
    MEMORY[0x23B8057D4](v5, 0x1000C400A747E1ELL);
  v6 = this[4];
  if (v6)
    MEMORY[0x23B8057D4](v6, 0x1000C40400E7B01);
}

std::string *std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]<true,0>(std::string *this, __int128 *a2, uint64_t a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::set<unsigned long>::set[abi:ne180100]((uint64_t *)&this[1], a3);
  return this;
}

void sub_236E701F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *std::set<unsigned long>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<unsigned long>::insert[abi:ne180100]<std::__tree_const_iterator<unsigned long,std::__tree_node<unsigned long,void *> *,long>>(a1, *(_QWORD **)a2, (_QWORD *)(a2 + 8));
  return a1;
}

void sub_236E70248(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<unsigned long>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<unsigned long>::insert[abi:ne180100]<std::__tree_const_iterator<unsigned long,std::__tree_node<unsigned long,void *> *,long>>(uint64_t *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t **v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(v5, v6, v4 + 4, v4 + 4);
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(uint64_t **a1, _QWORD *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t v11;

  v6 = (uint64_t **)std::__tree<unsigned long>::__find_equal<unsigned long>(a1, a2, &v11, &v10, a3);
  v7 = *v6;
  if (!*v6)
  {
    v8 = v6;
    v7 = (uint64_t *)operator new(0x28uLL);
    v7[4] = *a4;
    std::__tree<unsigned long>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

_QWORD *std::__tree<unsigned long>::__find_equal<unsigned long>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, unint64_t *a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    v8 = *a2;
    if ((_QWORD *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (_QWORD *)*a2;
      do
      {
        v10 = v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (_QWORD *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (v10[4] < *a5)
      goto LABEL_17;
    v16 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = v16;
          v18 = v16[4];
          if (v15 >= v18)
            break;
          v16 = (_QWORD *)*v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = (_QWORD *)v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (_QWORD *)a2[1];
    do
    {
      a4 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (_QWORD *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          v22 = v20[4];
          if (v6 >= v22)
            break;
          v20 = (_QWORD *)*v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = (_QWORD *)v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t *std::__tree<unsigned long>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree<unsigned long>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<unsigned long>::destroy(a1, *a2);
    std::__tree<unsigned long>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::unordered_map<std::string,double>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,double> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_236E7079C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,double> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__construct_node_hash<std::pair<std::string const,double> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_236E70A08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

double std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__construct_node_hash<std::pair<std::string const,double> const&>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  double result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  result = *(double *)(a3 + 24);
  *((double *)v8 + 5) = result;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_236E70AB8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25086D330, MEMORY[0x24BEDAB00]);
}

void sub_236E71358(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t *std::__tree<unsigned long>::__emplace_unique_key_args<unsigned long,unsigned long const&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<unsigned long>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void std::vector<OBCData>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<OBCData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SBCData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

_QWORD *simpleList<ACAMPersistentStates>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = result;
  v2 = *result;
  if (*result)
  {
    do
    {
      v3 = *(_QWORD *)(v2 + 800);
      v4 = *(_QWORD *)(v2 + 760);
      if (v4)
      {
        do
        {
          v5 = *(_QWORD *)(v4 + 40);
          MEMORY[0x23B8057D4]();
          v4 = v5;
        }
        while (v5);
      }
      *(_QWORD *)(v2 + 760) = 0;
      *(_QWORD *)(v2 + 768) = 0;
      *(_QWORD *)(v2 + 776) = 0;
      if (*(char *)(v2 + 759) < 0)
        operator delete(*(void **)(v2 + 736));
      if (*(char *)(v2 + 719) < 0)
        operator delete(*(void **)(v2 + 696));
      result = (_QWORD *)MEMORY[0x23B8057D4](v2, 0x1032C40A1A9FC8BLL);
      v2 = v3;
    }
    while (v3);
  }
  *v1 = 0;
  v1[1] = 0;
  v1[2] = 0;
  return result;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::vector<std::vector<SmartBatteryData>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<SmartBatteryData>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<SmartBatteryData>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t std::unordered_map<std::string,std::set<unsigned long>>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 48 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::set<unsigned long>> const&>(a1, a2, (__int128 *)a2);
      a2 += 48;
      v5 -= 48;
    }
    while (v5);
  }
  return a1;
}

void sub_236E71828(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::set<unsigned long>> const&>(uint64_t a1, unsigned __int8 *a2, __int128 *a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__construct_node_hash<std::pair<std::string const,std::set<unsigned long>> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  v25[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return i;
}

void sub_236E71AA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__construct_node_hash<std::pair<std::string const,std::set<unsigned long>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x40uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  result = std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100]((std::string *)(v8 + 16), a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_236E71B18(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::set<unsigned long>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::set<unsigned long>::set[abi:ne180100]((uint64_t *)&this[1], (uint64_t)a2 + 24);
  return this;
}

void sub_236E71B88(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::set<unsigned long>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::set<unsigned long>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::set<unsigned long>>,0>(uint64_t a1)
{
  std::__tree<unsigned long>::destroy(a1 + 24, *(_QWORD **)(a1 + 32));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::set<unsigned long>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::vector<std::vector<SmartBatteryData>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>,std::reverse_iterator<std::vector<SmartBatteryData>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<SmartBatteryData>>,std::reverse_iterator<std::vector<SmartBatteryData>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<SmartBatteryData>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<SmartBatteryData>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<SmartBatteryData>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::set<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::set<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::set<unsigned long>>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t std::unordered_map<std::string,BOOL>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,BOOL> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_236E72058(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,BOOL> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__construct_node_hash<std::pair<std::string const,BOOL> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_236E722C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__construct_node_hash<std::pair<std::string const,BOOL> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  v8[40] = *(_BYTE *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_236E72374(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,double>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void OnDeviceACAMUtility::createRuntimeOptions()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236E59000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to alloc defaults for OnDeviceACAM", v0, 2u);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAD08](this, __c);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_25086D350();
}

void operator delete(void *__p)
{
  off_25086D358(__p);
}

uint64_t operator delete()
{
  return off_25086D360();
}

uint64_t operator new[]()
{
  return off_25086D368();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25086D370(__sz);
}

uint64_t operator new()
{
  return off_25086D378();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

