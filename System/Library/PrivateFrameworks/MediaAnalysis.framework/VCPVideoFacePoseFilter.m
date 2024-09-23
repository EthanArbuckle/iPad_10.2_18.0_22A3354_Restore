@implementation VCPVideoFacePoseFilter

- (int)rotationToEulerAngles:(float)a3[3][3] angles:(float)a4[3]
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;

  a4[2] = 0.0;
  *(_QWORD *)a4 = 0;
  v6 = asinf((*a3)[6]);
  a4[1] = -v6;
  v7 = cosf(v6);
  if (v7 == 0.0)
  {
    a4[2] = 0.0;
    v9 = (*a3)[1];
    if ((*a3)[6] >= 0.0)
    {
      v9 = -v9;
      v10 = -(*a3)[5];
    }
    else
    {
      v10 = (*a3)[5];
    }
    *a4 = atan2f(v9, v10);
  }
  else
  {
    v8 = v7;
    *a4 = atan2f((*a3)[7] / v7, (*a3)[8] / v7);
    a4[2] = atan2f((*a3)[3] / v8, (*a3)[0] / v8);
  }
  return 0;
}

- (int)eulerAnglesToRotation:(float)a3[3] R:(float)a4[3][3]
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int v10;
  float *v11;
  unsigned int v12;
  uint64_t i;
  _QWORD v15[2];
  void *v16[2];
  int v17;
  int v18;
  void *v19[2];
  uint64_t v20;
  void *v21[3];
  void *v22[3];
  void *memptr[3];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v6 = (char *)memptr[0];
  v22[0] = memptr[0];
  v22[2] = (void *)0x300000003;
  *(_QWORD *)((char *)memptr[0] + 12) = 0;
  *(_QWORD *)(v6 + 4) = 0;
  *(_QWORD *)(v6 + 20) = 0;
  *(_QWORD *)(v6 + 28) = 0x3F80000000000000;
  *(_DWORD *)v6 = 1065353216;
  *((_DWORD *)v6 + 4) = 1065353216;
  v21[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v7 = (char *)memptr[0];
  v21[0] = memptr[0];
  v21[2] = (void *)0x300000003;
  *(_QWORD *)((char *)memptr[0] + 12) = 0;
  *(_QWORD *)(v7 + 4) = 0;
  *(_QWORD *)(v7 + 20) = 0;
  *(_QWORD *)(v7 + 28) = 0x3F80000000000000;
  *(_DWORD *)v7 = 1065353216;
  *((_DWORD *)v7 + 4) = 1065353216;
  v19[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v8 = (char *)memptr[0];
  v19[0] = memptr[0];
  v20 = 0x300000003;
  *(_QWORD *)((char *)memptr[0] + 12) = 0;
  *(_QWORD *)(v8 + 4) = 0;
  *(_QWORD *)(v8 + 20) = 0;
  *(_QWORD *)(v8 + 28) = 0x3F80000000000000;
  *(_DWORD *)v8 = 1065353216;
  *((_DWORD *)v8 + 4) = 1065353216;
  *((float *)v6 + 4) = cosf(*a3);
  *((float *)v6 + 7) = -sinf(*a3);
  *((float *)v6 + 5) = sinf(*a3);
  *((float *)v6 + 8) = cosf(*a3);
  *(float *)v7 = cosf(a3[1]);
  *((float *)v7 + 6) = sinf(a3[1]);
  *((float *)v7 + 2) = -sinf(a3[1]);
  *((float *)v7 + 8) = cosf(a3[1]);
  *(float *)v8 = cosf(a3[2]);
  *((float *)v8 + 3) = -sinf(a3[2]);
  *((float *)v8 + 1) = sinf(a3[2]);
  *((float *)v8 + 4) = cosf(a3[2]);
  v15[0] = v19;
  v15[1] = v21;
  v16[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v16[0] = memptr[0];
  v17 = v20;
  v18 = 3;
  memptr[1] = v15;
  memptr[2] = v22;
  v24 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::Matrix<float,0u,0u,false>>((uint64_t)v16, (uint64_t)memptr);
  v9 = 0;
  v10 = v17;
  v11 = (float *)v16[0];
  do
  {
    v12 = 0;
    for (i = 0; i != 3; ++i)
    {
      (*a4)[i] = v11[v9 + v12];
      v12 += v10;
    }
    ++v9;
    ++a4;
  }
  while (v9 != 3);
  free(v11);
  free(v19[0]);
  free(v21[0]);
  free(v22[0]);
  return 0;
}

- (int)kalmanFiltering:(float)a3[3] T:(float)a4[3]
{
  _DWORD *v7;
  uint64_t i;
  _OWORD *v9;
  size_t v10;
  char *v11;
  uint64_t j;
  size_t v13;
  int v14;
  size_t v15;
  float *v16;
  uint64_t v17;
  float *v18;
  float **v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  _OWORD *v25;
  size_t v26;
  size_t v27;
  float *v28;
  uint64_t v29;
  void **v30;
  float *v31;
  float *v32;
  uint64_t v33;
  float v34;
  float v35;
  float v36;
  _DWORD *v37;
  size_t v38;
  size_t v39;
  size_t v40;
  size_t v41;
  char *v42;
  uint64_t v43;
  float *v44;
  float *v45;
  uint64_t v46;
  float *v47;
  float v48;
  float v49;
  float v50;
  size_t v51;
  size_t v52;
  char *v53;
  uint64_t v54;
  float *v55;
  float *v56;
  uint64_t v57;
  float *v58;
  float v59;
  float v60;
  float v61;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  int v65;
  void *v67[2];
  unsigned int v68;
  int v69;
  void *v70[2];
  int v71;
  void *v72[3];
  void *v73[3];
  void *v74[2];
  void *v75;
  void *v76[3];
  void *v77[2];
  int v78;
  int v79;
  void *v80[2];
  uint64_t v81;
  void *v82[2];
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  int v87;
  void *v88;
  void *p_previousCovar;
  void **v90;
  int v91;
  int v92;
  void *v93;
  float *v94;
  void **v95;
  int v96;
  int v97;
  void *memptr;
  float *v99;
  Matrix<float, 12U, 1U, false> *p_previousState;
  void *v101;
  void **v102;
  void *v103;
  char v104;
  void *v105;
  uint64_t v106;
  void **v107;
  int v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v84 = *(_QWORD *)a4;
  v85 = *((_DWORD *)a4 + 2);
  v86 = *(_QWORD *)a3;
  v87 = *((_DWORD *)a3 + 2);
  v82[1] = (void *)144;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x240uLL, 0x49090899uLL);
  v7 = memptr;
  v82[0] = memptr;
  v83 = 0xC0000000CLL;
  bzero(memptr, 0x240uLL);
  for (i = 0; i != 156; i += 13)
    v7[i] = 1065353216;
  v7[36] = 1022739087;
  v7[114] = 1022739087;
  v7[49] = 1022739087;
  v7[127] = 1022739087;
  v7[62] = 1022739087;
  v7[140] = 1022739087;
  v80[1] = (void *)72;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x120uLL, 0x49090899uLL);
  v9 = memptr;
  v80[0] = memptr;
  v81 = 0xC00000006;
  *(_OWORD *)((char *)memptr + 20) = 0u;
  *(_OWORD *)((char *)v9 + 36) = 0u;
  *(_OWORD *)((char *)v9 + 52) = 0u;
  *(_OWORD *)((char *)v9 + 68) = 0u;
  *(_OWORD *)((char *)v9 + 84) = 0u;
  *(_OWORD *)((char *)v9 + 100) = 0u;
  *(_OWORD *)((char *)v9 + 116) = 0u;
  *(_OWORD *)((char *)v9 + 132) = 0u;
  *(_OWORD *)((char *)v9 + 148) = 0u;
  *(_OWORD *)((char *)v9 + 164) = 0u;
  *(_OWORD *)((char *)v9 + 180) = 0u;
  *(_OWORD *)((char *)v9 + 196) = 0u;
  *(_OWORD *)((char *)v9 + 212) = 0u;
  *(_OWORD *)((char *)v9 + 228) = 0u;
  *(_OWORD *)((char *)v9 + 244) = 0u;
  v9[17] = 0u;
  *(_OWORD *)((char *)v9 + 4) = 0u;
  *(_OWORD *)((char *)v9 + 260) = 0u;
  *(_DWORD *)v9 = 1065353216;
  *((_DWORD *)v9 + 39) = 1065353216;
  *((_DWORD *)v9 + 7) = 1065353216;
  *((_DWORD *)v9 + 46) = 1065353216;
  *((_DWORD *)v9 + 14) = 1065353216;
  *((_DWORD *)v9 + 53) = 1065353216;
  if (!self->_previousStateIsValid)
  {
    self->_previousState.m_data[0] = *a4;
    self->_previousState.m_data[1] = a4[1];
    self->_previousState.m_data[2] = a4[2];
    self->_previousState.m_data[6] = *a3;
    self->_previousState.m_data[7] = a3[1];
    self->_previousState.m_data[8] = a3[2];
    bzero(&self->_previousCovar, 0x240uLL);
  }
  v10 = (4 * v83 + 31) & 0x7FFFFFFE0;
  v77[1] = (void *)(v10 >> 2);
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v10, 0x49090899uLL);
  v77[0] = memptr;
  v78 = v83;
  v79 = 1;
  v99 = (float *)v82;
  p_previousState = &self->_previousState;
  LODWORD(v101) = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,12u,1u,false>>((uint64_t)v77, (uint64_t)&memptr);
  v76[1] = (void *)144;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0x240uLL, 0x49090899uLL);
  v11 = (char *)memptr;
  v76[0] = memptr;
  v76[2] = (void *)0xC0000000CLL;
  bzero(memptr, 0x240uLL);
  for (j = 0; j != 624; j += 52)
    *(_DWORD *)&v11[j] = 1065353216;
  v88 = v82;
  p_previousCovar = &self->_previousCovar;
  v105 = v82;
  v13 = (4 * (v83 * v83) + 31) & 0x7FFFFFFE0;
  v99 = 0;
  p_previousState = (Matrix<float, 12U, 1U, false> *)(v13 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v13, 0x49090899uLL);
  v99 = (float *)v93;
  v14 = *((_DWORD *)v105 + 4);
  LODWORD(v101) = *((_DWORD *)v88 + 4);
  HIDWORD(v101) = v14;
  v94 = (float *)&v88;
  v95 = &v105;
  v96 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,12u,12u,false>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>((uint64_t)&v99, (uint64_t)&v93);
  v102 = v76;
  v15 = (4 * (HIDWORD(v101) * (_DWORD)v101) + 31) & 0x7FFFFFFE0;
  v74[1] = (void *)(v15 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v15, 0x49090899uLL);
  v16 = (float *)v93;
  v74[0] = v93;
  v75 = v101;
  v17 = (HIDWORD(v101) * (_DWORD)v101);
  if ((_DWORD)v17)
  {
    v18 = v99;
    v19 = (float **)*v102;
    v20 = 4 * v17;
    do
    {
      v21 = *v18++;
      v22 = v21;
      v23 = *(float *)v19;
      v19 = (float **)((char *)v19 + 4);
      *v16++ = v22 + v23;
      v20 -= 4;
    }
    while (v20);
  }
  free(v99);
  v73[1] = (void *)40;
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, 0xA0uLL, 0x49090899uLL);
  v24 = 0;
  v25 = memptr;
  v73[0] = memptr;
  v73[2] = (void *)0x600000006;
  *((_OWORD *)memptr + 2) = 0u;
  v25[3] = 0u;
  v25[4] = 0u;
  v25[5] = 0u;
  v25[6] = 0u;
  v25[7] = 0u;
  v25[8] = 0u;
  *v25 = 0u;
  v25[1] = 0u;
  do
  {
    *(_DWORD *)((char *)v25 + v24) = 1065353216;
    v24 += 28;
  }
  while (v24 != 168);
  v88 = v80;
  p_previousCovar = v74;
  v70[0] = v80;
  v105 = v73;
  v106 = 0x40000000;
  v26 = (4 * (v81 * v81) + 31) & 0x7FFFFFFE0;
  v99 = 0;
  p_previousState = (Matrix<float, 12U, 1U, false> *)(v26 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v26, 0x49090899uLL);
  v99 = (float *)v93;
  LODWORD(v101) = *((_DWORD *)v88 + 4);
  HIDWORD(v101) = v81;
  v94 = (float *)&v88;
  v95 = v70;
  v96 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>((uint64_t)&v99, (uint64_t)&v93);
  v102 = &v105;
  v27 = (4 * (HIDWORD(v101) * (_DWORD)v101) + 31) & 0x7FFFFFFE0;
  v72[0] = 0;
  v72[1] = (void *)(v27 >> 2);
  v93 = 0;
  malloc_type_posix_memalign(&v93, 0x20uLL, v27, 0x49090899uLL);
  v28 = (float *)v93;
  v72[0] = v93;
  v72[2] = v101;
  v29 = (HIDWORD(v101) * (_DWORD)v101);
  if ((_DWORD)v29)
  {
    v30 = v102;
    v31 = v99;
    v32 = *(float **)*v102;
    v33 = 4 * v29;
    do
    {
      v34 = *v31++;
      v35 = v34;
      v36 = *v32++;
      *v28++ = v35 + (float)(v36 * *((float *)v30 + 2));
      v33 -= 4;
    }
    while (v33);
  }
  free(v99);
  v37 = (_DWORD *)cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)&memptr, v72, 3, 0);
  if (v104)
  {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v37, &-[VCPVideoFacePoseFilter kalmanFiltering:T:]::kThreshold, (uint64_t)v70);
    v105 = v80;
    v88 = v74;
    p_previousCovar = &v105;
    v38 = (4 * (v71 * (_DWORD)v75) + 31) & 0x7FFFFFFE0;
    v67[1] = (void *)(v38 >> 2);
    v93 = 0;
    malloc_type_posix_memalign(&v93, 0x20uLL, v38, 0x49090899uLL);
    v67[0] = v93;
    v68 = *((_DWORD *)v88 + 4);
    v69 = v71;
    v94 = (float *)&v88;
    v95 = v70;
    v96 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>((uint64_t)v67, (uint64_t)&v93);
    v88 = &v84;
    p_previousCovar = 0;
    v39 = (4 * (v79 * v81) + 31) & 0x7FFFFFFE0;
    v90 = (void **)(v39 >> 2);
    v105 = 0;
    malloc_type_posix_memalign(&v105, 0x20uLL, v39, 0x49090899uLL);
    p_previousCovar = v105;
    v91 = v81;
    v92 = v79;
    v106 = (uint64_t)v80;
    v107 = v77;
    v108 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)&p_previousCovar, (uint64_t)&v105);
    v93 = v77;
    v94 = 0;
    v40 = (4 * v68 + 31) & 0x7FFFFFFE0;
    v95 = (void **)(v40 >> 2);
    v105 = 0;
    malloc_type_posix_memalign(&v105, 0x20uLL, v40, 0x49090899uLL);
    v94 = (float *)v105;
    v96 = v68;
    v106 = (uint64_t)v67;
    v107 = &v88;
    v108 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::Matrix<float,6u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::detail::SubOp>>((uint64_t)&v94, (uint64_t)&v105);
    v41 = (4 * (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4)) + 31) & 0x7FFFFFFE0;
    v105 = 0;
    malloc_type_posix_memalign(&v105, 0x20uLL, v41, 0x49090899uLL);
    v42 = (char *)v105;
    v43 = (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4));
    if ((_DWORD)v43)
    {
      v44 = v94;
      v45 = *(float **)v93;
      v46 = 4 * v43;
      v47 = (float *)v105;
      do
      {
        v48 = *v45++;
        v49 = v48;
        v50 = *v44++;
        *v47++ = v49 + v50;
        v46 -= 4;
      }
      while (v46);
    }
    free(v94);
    free(p_previousCovar);
    v105 = v67;
    v106 = (uint64_t)v80;
    v51 = (4 * HIDWORD(v75) * v68 + 31) & 0x7FFFFFFE0;
    v93 = v74;
    v95 = (void **)(v51 >> 2);
    v88 = 0;
    malloc_type_posix_memalign(&v88, 0x20uLL, v51, 0x49090899uLL);
    v94 = (float *)v88;
    v96 = v68;
    v97 = HIDWORD(v75);
    p_previousCovar = &v105;
    v90 = v74;
    v91 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>,cva::Matrix<float,0u,0u,false>>((uint64_t)&v94, (uint64_t)&v88);
    v52 = (4 * (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4)) + 31) & 0x7FFFFFFE0;
    v88 = 0;
    malloc_type_posix_memalign(&v88, 0x20uLL, v52, 0x49090899uLL);
    v53 = (char *)v88;
    v54 = (*((_DWORD *)v93 + 5) * *((_DWORD *)v93 + 4));
    if ((_DWORD)v54)
    {
      v55 = v94;
      v56 = *(float **)v93;
      v57 = 4 * v54;
      v58 = (float *)v88;
      do
      {
        v59 = *v56++;
        v60 = v59;
        v61 = *v55++;
        *v58++ = v60 - v61;
        v57 -= 4;
      }
      while (v57);
    }
    free(v94);
    for (k = 0; k != 3; ++k)
    {
      a4[k] = *(float *)&v42[k * 4];
      a3[k] = *(float *)&v42[k * 4 + 24];
    }
    for (m = 0; m != 12; ++m)
      self->_previousState.m_data[m] = *(float *)&v42[m * 4];
    for (n = 0; n != 144; ++n)
      self->_previousCovar.m_data[n] = *(float *)&v53[n * 4];
    self->_previousStateIsValid = 1;
    free(v53);
    free(v42);
    free(v67[0]);
    free(v70[0]);
    v65 = 0;
  }
  else
  {
    v65 = -18;
  }
  free(v103);
  free(v101);
  free(memptr);
  free(v72[0]);
  free(v73[0]);
  free(v74[0]);
  free(v76[0]);
  free(v77[0]);
  free(v80[0]);
  free(v82[0]);
  return v65;
}

- (int)filteringPose:(id *)a3
{
  uint64_t v5;
  __int128 v6;
  _BYTE *v7;
  uint64_t v8;
  int v9;
  int result;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  char *v15;
  __int128 v16;
  _BYTE v17[12];
  _DWORD v18[3];
  _BYTE v19[36];
  uint64_t v20;

  v5 = 0;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = *((_OWORD *)a3 + 3);
  v7 = v19;
  do
  {
    v8 = 0;
    v16 = v6;
    v9 = *(_DWORD *)((unint64_t)&v16 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
    do
    {
      *(_DWORD *)&v7[4 * v8] = *((_DWORD *)a3 + 4 * v8 + (v5 & 3));
      ++v8;
    }
    while (v8 != 3);
    v18[v5++] = v9;
    v7 += 12;
  }
  while (v5 != 3);
  result = -[VCPVideoFacePoseFilter rotationToEulerAngles:angles:](self, "rotationToEulerAngles:angles:", v19, v17, v16);
  if (!result)
  {
    result = -[VCPVideoFacePoseFilter kalmanFiltering:T:](self, "kalmanFiltering:T:", v17, v18);
    if (!result)
    {
      result = -[VCPVideoFacePoseFilter eulerAnglesToRotation:R:](self, "eulerAnglesToRotation:R:", v17, v19);
      if (!result)
      {
        v11 = 0;
        *((_OWORD *)a3 + 2) = 0u;
        *((_OWORD *)a3 + 3) = 0u;
        *(_OWORD *)a3 = 0u;
        *((_OWORD *)a3 + 1) = 0u;
        v12 = v19;
        do
        {
          v13 = 0;
          v14 = v18[v11];
          do
          {
            v15 = (char *)a3 + 4 * v11;
            *(_DWORD *)&v15[16 * v13] = *(_DWORD *)&v12[4 * v13];
            *((_DWORD *)v15 + 12) = v14;
            ++v13;
          }
          while (v13 != 3);
          ++v11;
          v12 += 12;
        }
        while (v11 != 3);
        return 0;
      }
    }
  }
  return result;
}

- (void)reset
{
  self->_previousStateIsValid = 0;
}

- (id).cxx_construct
{
  bzero(&self->_previousState, 0x270uLL);
  return self;
}

@end
