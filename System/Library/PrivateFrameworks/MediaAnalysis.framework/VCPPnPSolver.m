@implementation VCPPnPSolver

- (VCPPnPSolver)initWithFocalLengthInPixels:(float)a3 principalPoint:(CGPoint)a4 cameraTowardsPositiveZ:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  VCPPnPSolver *result;
  float v10;
  float v11;
  float v12;
  objc_super v13;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)VCPPnPSolver;
  result = -[VCPPnPSolver init](&v13, sel_init);
  if (result)
  {
    result->_fu = a3;
    result->_fv = a3;
    v10 = x;
    v11 = y;
    result->_uc = v10;
    result->_vc = v11;
    v12 = -1.0;
    if (v5)
      v12 = 1.0;
    result->_points2D = 0;
    result->_points3D = 0;
    result->_numPoints = 0;
    result->_alphas = 0;
    result->_points3DCamera = 0;
    result->_cameraOrientation = v12;
  }
  return result;
}

- (void)updateIntrinsic:(float)a3 vc:(float)a4
{
  self->_uc = a3;
  self->_vc = a4;
}

- (void)updateFocalLengthInPixels:(float)a3
{
  self->_fu = a3;
  self->_fv = a3;
}

- (void)dealloc
{
  float *alphas;
  float *points3DCamera;
  objc_super v5;

  alphas = self->_alphas;
  if (alphas)
    MEMORY[0x1BCCA128C](alphas, 0x1000C8052888210);
  points3DCamera = self->_points3DCamera;
  if (points3DCamera)
    MEMORY[0x1BCCA128C](points3DCamera, 0x1000C8052888210);
  v5.receiver = self;
  v5.super_class = (Class)VCPPnPSolver;
  -[VCPPnPSolver dealloc](&v5, sel_dealloc);
}

- (int)getControlPoints
{
  float (*controlPointsWorld)[3];
  uint64_t numPoints;
  uint64_t v5;
  const float *pointsWorld;
  uint64_t i;
  uint64_t j;
  uint64_t v9;
  const float *v10;
  int v11;
  float *v12;
  unsigned int v13;
  uint64_t k;
  uint64_t v15;
  char *v16;
  float *v17;
  float *v18;
  uint64_t v19;
  float *v20;
  float *v21;
  float v22;
  int v23;
  uint64_t v24;
  float v25;
  char *v26;
  int v27;
  void **v29;
  _QWORD v30[2];
  void *v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  char v36;
  void *v37[2];
  int v38;
  int v39;

  self->_controlPointsWorld[0][0] = 0.0;
  controlPointsWorld = self->_controlPointsWorld;
  *(_QWORD *)&self->_controlPointsWorld[0][1] = 0;
  numPoints = self->_numPoints;
  if ((int)numPoints >= 1)
  {
    v5 = 0;
    pointsWorld = self->_pointsWorld;
    do
    {
      for (i = 0; i != 3; ++i)
        (*controlPointsWorld)[i] = pointsWorld[i] + (*controlPointsWorld)[i];
      ++v5;
      pointsWorld += 3;
    }
    while (v5 != numPoints);
  }
  for (j = 0; j != 3; ++j)
    (*controlPointsWorld)[j] = (*controlPointsWorld)[j] / (float)(int)numPoints;
  v37[0] = 0;
  v37[1] = 0;
  v38 = numPoints;
  v39 = 3;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v37, (3 * numPoints));
  if ((int)numPoints >= 1)
  {
    v9 = 0;
    v10 = self->_pointsWorld;
    v11 = v38;
    v12 = (float *)v37[0];
    do
    {
      v13 = 0;
      for (k = 0; k != 3; ++k)
      {
        v12[v9 + v13] = v10[k] - (*controlPointsWorld)[k];
        v13 += v11;
      }
      ++v9;
      v10 += 3;
    }
    while (v9 != numPoints);
  }
  v29 = v37;
  v30[0] = &v29;
  v30[1] = v37;
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::Matrix<float,0u,0u,false>>>((uint64_t)&v31, v30, 3, 0);
  if (v36)
  {
    v15 = v33;
    v16 = (char *)v32;
    if (v34)
      v17 = (float *)v32;
    else
      v17 = 0;
    v18 = (float *)((char *)v32 + 4 * (v33 * v34));
    if (!v34)
      v18 = 0;
    for (; v17 != v18; v17 += v15)
      *v17 = -*v17;
    v19 = 0;
    v20 = (float *)v35;
    v21 = self->_controlPointsWorld[1];
    while (1)
    {
      v22 = v20[v19];
      if (v22 < 0.0)
        break;
      v23 = 0;
      v24 = 0;
      v25 = sqrtf(v22 / (float)self->_numPoints);
      v26 = &v16[4 * v19++];
      do
      {
        v21[v24] = (*controlPointsWorld)[v24] + (float)(v25 * *(float *)&v26[4 * v23]);
        ++v24;
        v23 += v15;
      }
      while (v24 != 3);
      v21 += 3;
      if (v19 == 3)
      {
        v27 = 0;
        goto LABEL_29;
      }
    }
    v27 = -18;
  }
  else
  {
    v27 = -18;
    v20 = (float *)v35;
  }
LABEL_29:
  free(v20);
  free(v32);
  free(v31);
  free(v37[0]);
  return v27;
}

- (int)computeBarycentricCoordinates
{
  uint64_t v3;
  float *v4;
  _OWORD *v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  char *v9;
  float *v10;
  float *v11;
  uint64_t numPoints;
  uint64_t v13;
  uint64_t v14;
  const float *pointsWorld;
  int v16;
  float *alphas;
  char *v18;
  char *v19;
  float *v20;
  uint64_t i;
  int v22;
  void *v24;
  int v25;
  int v26;
  void *v27[10];
  char v28;
  _OWORD v29[2];
  int v30;

  v3 = 0;
  v30 = 0;
  memset(v29, 0, sizeof(v29));
  v4 = self->_controlPointsWorld[1];
  v5 = v29;
  do
  {
    v6 = 0;
    v7 = self->_controlPointsWorld[0][v3];
    do
    {
      *(float *)((char *)v5 + v6 * 4) = v4[v6] - v7;
      v6 += 3;
    }
    while (v6 != 9);
    ++v3;
    v5 = (_OWORD *)((char *)v5 + 4);
    ++v4;
  }
  while (v3 != 3);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,3u,3u,false>>((uint64_t)v27, (uint64_t)v29, 3);
  if (v28)
  {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(v27, &-[VCPPnPSolver computeBarycentricCoordinates]::kThreshold, (uint64_t)&v24);
    v8 = v25;
    v9 = (char *)v24;
    if (v26)
      v10 = (float *)((char *)v24 + 4);
    else
      v10 = 0;
    v11 = (float *)((char *)v24 + 4 * (v25 * v26) + 4);
    if (!v26)
      v11 = 0;
    for (; v10 != v11; v10 += v8)
      *v10 = -*v10;
    numPoints = self->_numPoints;
    if ((int)numPoints >= 1)
    {
      v13 = 0;
      v14 = v8;
      pointsWorld = self->_pointsWorld;
      v16 = 2 * v8;
      alphas = self->_alphas;
      v18 = &v9[4 * v16];
      v19 = &v9[4 * v14];
      v20 = alphas + 1;
      do
      {
        for (i = 0; i != 3; ++i)
          v20[i] = (float)((float)(*(float *)&v19[i * 4]
                                 * (float)(pointsWorld[3 * v13 + 1] - self->_controlPointsWorld[0][1]))
                         + (float)(*(float *)&v9[i * 4] * (float)(pointsWorld[3 * v13] - self->_controlPointsWorld[0][0])))
                 + (float)(*(float *)&v18[i * 4] * (float)(pointsWorld[3 * v13 + 2] - self->_controlPointsWorld[0][2]));
        alphas[4 * v13] = (float)((float)(1.0 - alphas[4 * v13 + 1]) - alphas[4 * v13 + 2]) - alphas[4 * v13 + 3];
        ++v13;
        v20 += 4;
      }
      while (v13 != numPoints);
    }
    free(v9);
    v22 = 0;
  }
  else
  {
    v22 = -18;
  }
  free(v27[6]);
  free(v27[3]);
  free(v27[0]);
  return v22;
}

- (void)computeControlPointsCamera:(const float *)a3 Vt:(void *)a4
{
  uint64_t v4;
  int v5;
  float (*controlPointsCamera)[3];
  int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  float (*v11)[3];
  uint64_t v12;
  unsigned int v13;

  v4 = 0;
  v5 = *((_DWORD *)a4 + 4);
  *(_OWORD *)&self->_controlPointsCamera[0][0] = 0u;
  controlPointsCamera = self->_controlPointsCamera;
  *(_OWORD *)&(*controlPointsCamera)[4] = 0u;
  *(_OWORD *)&(*controlPointsCamera)[8] = 0u;
  v7 = *((_DWORD *)a4 + 4);
  v8 = *(_QWORD *)a4;
  do
  {
    v9 = 0;
    v10 = 0;
    v11 = controlPointsCamera;
    do
    {
      v12 = 0;
      v13 = v9;
      do
      {
        (*v11)[v12] = (*v11)[v12]
                    + (float)(a3[v4] * *(float *)(v8 + 4 * (v5 + ~(_DWORD)v4) + 4 * v13));
        v13 += v7;
        ++v12;
      }
      while (v12 != 3);
      ++v10;
      v9 += 3 * v7;
      ++v11;
    }
    while (v10 != 4);
    ++v4;
  }
  while (v4 != 4);
}

- (void)computePoints3DCamera
{
  uint64_t numPoints;
  uint64_t v3;
  float *alphas;
  float *points3DCamera;
  float (*controlPointsCamera)[3];
  uint64_t v7;
  float *v8;
  float *v9;
  uint64_t v10;
  float v11;
  float *v12;
  float v13;

  numPoints = self->_numPoints;
  if ((int)numPoints >= 1)
  {
    v3 = 0;
    alphas = self->_alphas;
    points3DCamera = self->_points3DCamera;
    controlPointsCamera = self->_controlPointsCamera;
    do
    {
      v7 = 0;
      v8 = &points3DCamera[3 * v3];
      v9 = (float *)controlPointsCamera;
      do
      {
        v10 = 0;
        v8[v7] = 0.0;
        v11 = 0.0;
        v12 = v9;
        do
        {
          v13 = *v12;
          v12 += 3;
          v11 = v11 + (float)(alphas[v10] * v13);
          v8[v7] = v11;
          ++v10;
        }
        while (v10 != 4);
        ++v7;
        ++v9;
      }
      while (v7 != 3);
      ++v3;
      alphas += 4;
    }
    while (v3 != numPoints);
  }
}

- (int)computeSVDVt:(void *)a3 Vt:(void *)a4
{
  int v5;
  void *v7;
  _QWORD v8[2];
  void *v9;
  void *v10[7];
  char v11;

  v7 = a3;
  v8[0] = &v7;
  v8[1] = a3;
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::Matrix<float,0u,0u,false>>>((uint64_t)&v9, v8, 3, 0);
  if (v11)
  {
    cva::MatrixMixin<cva::Matrix<float,0u,0u,false>,float,0u,0u>::copyTo<cva::Matrix<float,0u,0u,false>>((uint64_t)v10, (uint64_t)a4);
    v5 = 0;
  }
  else
  {
    v5 = -18;
  }
  free(v10[3]);
  free(v10[0]);
  free(v9);
  return v5;
}

- (int)computeL6x10:(void *)a3 L6x10:(void *)a4
{
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  char v55;
  _QWORD v56[19];

  v4 = 0;
  v56[18] = *MEMORY[0x1E0C80C00];
  v5 = &v55;
  v6 = *((_DWORD *)a3 + 4);
  v7 = *(_QWORD *)a3;
  do
  {
    v8 = 0;
    v9 = 0;
    v11 = 1;
    v12 = v5;
    do
    {
      v13 = 0;
      v14 = 0;
      do
      {
        v10 = v7 + 4 * (v6 + ~(_DWORD)v4);
        *(float *)&v12[v13] = *(float *)(v10 + 4 * (3 * v6 * v9 + v14))
                            - *(float *)(v10 + 4 * (3 * v6 * v11 + v14));
        v14 += v6;
        v13 += 4;
      }
      while (v13 != 12);
      if (v11 > 2)
        v11 = ++v9;
      ++v11;
      ++v8;
      v12 += 12;
    }
    while (v8 != 6);
    ++v4;
    v5 += 72;
  }
  while (v4 != 4);
  v15 = 0;
  v16 = *((unsigned int *)a4 + 4);
  v17 = 2 * v16;
  v18 = *(_QWORD *)a4;
  v19 = 4 * v16;
  v20 = 5 * v16;
  v21 = 3 * v16;
  v22 = 6 * v16;
  v23 = 8 * v16;
  v24 = 7 * v16;
  v25 = 9 * v16;
  v26 = *(_QWORD *)a4 + 4 * v16;
  v27 = *(_QWORD *)a4 + 4 * v17;
  v28 = *(_QWORD *)a4 + 4 * v21;
  v29 = *(_QWORD *)a4 + 4 * v19;
  v30 = *(_QWORD *)a4 + 4 * v20;
  v31 = *(_QWORD *)a4 + 4 * v22;
  v32 = (float *)v56;
  v33 = *(_QWORD *)a4 + 4 * v24;
  v34 = *(_QWORD *)a4 + 4 * v23;
  v35 = *(_QWORD *)a4 + 4 * v25;
  do
  {
    v36 = *(v32 - 36);
    v37 = *(v32 - 35);
    v38 = *(v32 - 34);
    *(float *)(v18 + v15) = (float)((float)(v37 * v37) + (float)(v36 * v36)) + (float)(v38 * v38);
    v39 = *(v32 - 18);
    v40 = *(v32 - 17);
    v41 = *(v32 - 16);
    v42 = (float)((float)(v37 * v40) + (float)(v36 * v39)) + (float)(v38 * v41);
    *(float *)(v26 + v15) = v42 + v42;
    *(float *)(v27 + v15) = (float)((float)(v40 * v40) + (float)(v39 * v39)) + (float)(v41 * v41);
    v43 = *v32;
    v44 = v32[1];
    v45 = v32[2];
    v46 = (float)((float)(v37 * v44) + (float)(v36 * *v32)) + (float)(v38 * v45);
    *(float *)(v28 + v15) = v46 + v46;
    v47 = (float)((float)(v40 * v44) + (float)(v39 * v43)) + (float)(v41 * v45);
    *(float *)(v29 + v15) = v47 + v47;
    *(float *)(v30 + v15) = (float)((float)(v44 * v44) + (float)(v43 * v43)) + (float)(v45 * v45);
    v48 = v32[18];
    v49 = v32[19];
    v50 = (float)(v37 * v49) + (float)(v36 * v48);
    v51 = v32[20];
    *(float *)(v31 + v15) = (float)(v50 + (float)(v38 * v51)) + (float)(v50 + (float)(v38 * v51));
    v52 = (float)((float)(v40 * v49) + (float)(v39 * v48)) + (float)(v41 * v51);
    *(float *)(v33 + v15) = v52 + v52;
    v53 = (float)((float)(v44 * v49) + (float)(v43 * v48)) + (float)(v45 * v51);
    *(float *)(v34 + v15) = v53 + v53;
    *(float *)(v35 + v15) = (float)((float)(v49 * v49) + (float)(v48 * v48)) + (float)(v51 * v51);
    v15 += 4;
    v32 += 3;
  }
  while (v15 != 24);
  return 0;
}

- (void)computeR6x1:(void *)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  float *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  v3 = self->_controlPointsWorld[0][0] - self->_controlPointsWorld[1][0];
  v4 = self->_controlPointsWorld[0][1] - self->_controlPointsWorld[1][1];
  v5 = (float)(v4 * v4) + (float)(v3 * v3);
  v6 = self->_controlPointsWorld[0][2] - self->_controlPointsWorld[1][2];
  v7 = *(float **)a3;
  *v7 = v5 + (float)(v6 * v6);
  v8 = self->_controlPointsWorld[0][0] - self->_controlPointsWorld[2][0];
  v9 = self->_controlPointsWorld[0][1] - self->_controlPointsWorld[2][1];
  v10 = (float)(v9 * v9) + (float)(v8 * v8);
  v11 = self->_controlPointsWorld[0][2] - self->_controlPointsWorld[2][2];
  v7[1] = v10 + (float)(v11 * v11);
  v12 = self->_controlPointsWorld[0][0] - self->_controlPointsWorld[3][0];
  v13 = self->_controlPointsWorld[0][1] - self->_controlPointsWorld[3][1];
  v14 = (float)(v13 * v13) + (float)(v12 * v12);
  v15 = self->_controlPointsWorld[0][2] - self->_controlPointsWorld[3][2];
  v7[2] = v14 + (float)(v15 * v15);
  v16 = self->_controlPointsWorld[1][0] - self->_controlPointsWorld[2][0];
  v17 = self->_controlPointsWorld[1][1] - self->_controlPointsWorld[2][1];
  v18 = (float)(v17 * v17) + (float)(v16 * v16);
  v19 = self->_controlPointsWorld[1][2] - self->_controlPointsWorld[2][2];
  v7[3] = v18 + (float)(v19 * v19);
  v20 = self->_controlPointsWorld[1][0] - self->_controlPointsWorld[3][0];
  v21 = self->_controlPointsWorld[1][1] - self->_controlPointsWorld[3][1];
  v22 = (float)(v21 * v21) + (float)(v20 * v20);
  v23 = self->_controlPointsWorld[1][2] - self->_controlPointsWorld[3][2];
  v7[4] = v22 + (float)(v23 * v23);
  v24 = self->_controlPointsWorld[2][0] - self->_controlPointsWorld[3][0];
  v25 = self->_controlPointsWorld[2][2] - self->_controlPointsWorld[3][2];
  v7[5] = (float)((float)((float)(self->_controlPointsWorld[2][1] - self->_controlPointsWorld[3][1])
                        * (float)(self->_controlPointsWorld[2][1] - self->_controlPointsWorld[3][1]))
                + (float)(v24 * v24))
        + (float)(v25 * v25);
}

- (int)estimateBetasN1:(void *)a3 R6x1:(void *)a4 betas:(float *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  unsigned int v18;
  int v19;
  size_t v20;
  void *v21;
  size_t v22;
  float *v23;
  float v24;
  float v25;
  float v26;
  unsigned int v28;
  _DWORD *v29;
  void *v30[9];
  unsigned int v31;
  char v32;
  void *v33;
  size_t v34;
  unint64_t v35;
  void *v36[2];
  uint64_t v37;
  void *v38;
  size_t v39;
  unint64_t v40;
  void *memptr;

  v36[0] = 0;
  v36[1] = 0;
  v33 = 0;
  v34 = 0;
  v37 = 0x400000006;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v36, 0x18uLL);
  v35 = 0x100000004;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v33, 4uLL);
  v8 = 0;
  v9 = *(_QWORD *)a3;
  v10 = *((unsigned int *)a3 + 4);
  v11 = (char *)v36[0];
  v12 = *(_QWORD *)a3 + 4 * (6 * v10);
  v13 = *(_QWORD *)a3 + 4 * (3 * v10);
  v14 = *(_QWORD *)a3 + 4 * v10;
  v15 = (char *)v36[0] + 4 * (3 * v37);
  v16 = (char *)v36[0] + 4 * (2 * v37);
  v17 = (char *)v36[0] + 4 * v37;
  do
  {
    *(_DWORD *)&v11[v8] = *(_DWORD *)(v9 + v8);
    *(_DWORD *)&v17[v8] = *(_DWORD *)(v14 + v8);
    *(_DWORD *)&v16[v8] = *(_DWORD *)(v13 + v8);
    *(_DWORD *)&v15[v8] = *(_DWORD *)(v12 + v8);
    v8 += 4;
  }
  while (v8 != 24);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)v30, v36, 3, 0);
  if (!v32)
  {
    v19 = -18;
    goto LABEL_14;
  }
  v28 = 925353388;
  v29 = a4;
  if (__PAIR64__(*((_DWORD *)a4 + 5), v31) != v35)
  {
    if (*(void **)a4 == v33)
    {
      v20 = (4 * *((_DWORD *)a4 + 5) * v31 + 31) & 0x7FFFFFFE0;
      v38 = 0;
      v39 = v20 >> 2;
      memptr = 0;
      malloc_type_posix_memalign(&memptr, 0x20uLL, v20, 0x49090899uLL);
      v38 = memptr;
      v40 = __PAIR64__(v29[5], v31);
      cva::SVD<cva::Matrix<float,0u,0u,false>,true>::initialize<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)v30, (uint64_t)&v38, (uint64_t)v29, &v28);
      v21 = v33;
      v22 = v34;
      v33 = v38;
      v34 = v39;
      v38 = v21;
      v39 = v22;
      v35 = v40;
      v40 = 0;
      free(v21);
      goto LABEL_10;
    }
    v18 = *((_DWORD *)a4 + 5);
    v35 = __PAIR64__(v18, v31);
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v33, v18 * v31);
    a4 = v29;
  }
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::initialize<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)v30, (uint64_t)&v33, (uint64_t)a4, &v28);
LABEL_10:
  v23 = (float *)v33;
  v24 = *(float *)v33;
  if (*(float *)v33 >= 0.0)
  {
    v25 = sqrtf(v24);
    *a5 = v25;
    a5[1] = v23[1] / v25;
    a5[2] = v23[2] / v25;
    v26 = v23[3];
  }
  else
  {
    v25 = sqrtf(-v24);
    *a5 = v25;
    a5[1] = (float)-v23[1] / v25;
    a5[2] = (float)-v23[2] / v25;
    v26 = -v23[3];
  }
  v19 = 0;
  a5[3] = v26 / v25;
LABEL_14:
  free(v30[6]);
  free(v30[3]);
  free(v30[0]);
  free(v33);
  free(v36[0]);
  return v19;
}

- (int)estimateBetasN2:(void *)a3 R6x1:(void *)a4 betas:(float *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  unsigned int v16;
  int v17;
  size_t v18;
  void *v19;
  size_t v20;
  float *v21;
  float v22;
  float v23;
  float v24;
  _BOOL4 v25;
  float v26;
  float v27;
  unsigned int v29;
  _DWORD *v30;
  void *v31[9];
  unsigned int v32;
  char v33;
  void *v34;
  size_t v35;
  unint64_t v36;
  void *v37[2];
  uint64_t v38;
  void *v39;
  size_t v40;
  unint64_t v41;
  void *memptr;

  v37[0] = 0;
  v37[1] = 0;
  v34 = 0;
  v35 = 0;
  v38 = 0x300000006;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v37, 0x12uLL);
  v36 = 0x100000003;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v34, 3uLL);
  v8 = 0;
  v9 = *(_QWORD *)a3;
  v10 = *((unsigned int *)a3 + 4);
  v11 = (char *)v37[0];
  v12 = *(_QWORD *)a3 + 4 * (2 * v10);
  v13 = *(_QWORD *)a3 + 4 * v10;
  v14 = (char *)v37[0] + 4 * (2 * v38);
  v15 = (char *)v37[0] + 4 * v38;
  do
  {
    *(_DWORD *)&v11[v8] = *(_DWORD *)(v9 + v8);
    *(_DWORD *)&v15[v8] = *(_DWORD *)(v13 + v8);
    *(_DWORD *)&v14[v8] = *(_DWORD *)(v12 + v8);
    v8 += 4;
  }
  while (v8 != 24);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)v31, v37, 3, 0);
  if (!v33)
  {
    v17 = -18;
    goto LABEL_18;
  }
  v29 = 925353388;
  v30 = a4;
  if (__PAIR64__(*((_DWORD *)a4 + 5), v32) != v36)
  {
    if (*(void **)a4 == v34)
    {
      v18 = (4 * *((_DWORD *)a4 + 5) * v32 + 31) & 0x7FFFFFFE0;
      v39 = 0;
      v40 = v18 >> 2;
      memptr = 0;
      malloc_type_posix_memalign(&memptr, 0x20uLL, v18, 0x49090899uLL);
      v39 = memptr;
      v41 = __PAIR64__(v30[5], v32);
      cva::SVD<cva::Matrix<float,0u,0u,false>,true>::initialize<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)v31, (uint64_t)&v39, (uint64_t)v30, &v29);
      v19 = v34;
      v20 = v35;
      v34 = v39;
      v35 = v40;
      v39 = v19;
      v40 = v20;
      v36 = v41;
      v41 = 0;
      free(v19);
      goto LABEL_10;
    }
    v16 = *((_DWORD *)a4 + 5);
    v36 = __PAIR64__(v16, v32);
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v34, v16 * v32);
    a4 = v30;
  }
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::initialize<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)v31, (uint64_t)&v34, (uint64_t)a4, &v29);
LABEL_10:
  v21 = (float *)v34;
  v22 = *(float *)v34;
  if (*(float *)v34 >= 0.0)
  {
    v23 = sqrtf(v22);
    *a5 = v23;
    v26 = v21[2];
    v25 = v26 > 0.0;
  }
  else
  {
    v23 = sqrtf(-v22);
    *a5 = v23;
    v24 = v21[2];
    v25 = v24 < 0.0;
    v26 = -v24;
  }
  v27 = sqrtf(v26);
  if (!v25)
    v27 = 0.0;
  a5[1] = v27;
  if (v21[1] < 0.0)
    *a5 = -v23;
  v17 = 0;
  *((_QWORD *)a5 + 1) = 0;
LABEL_18:
  free(v31[6]);
  free(v31[3]);
  free(v31[0]);
  free(v34);
  free(v37[0]);
  return v17;
}

- (int)estimateBetasN3:(void *)a3 R6x1:(void *)a4 betas:(float *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  unsigned int v20;
  int v21;
  size_t v22;
  void *v23;
  size_t v24;
  float *v25;
  float v26;
  float v27;
  float v28;
  _BOOL4 v29;
  float v30;
  float v31;
  unsigned int v33;
  _DWORD *v34;
  void *v35[9];
  unsigned int v36;
  char v37;
  void *v38;
  size_t v39;
  unint64_t v40;
  void *v41[2];
  uint64_t v42;
  void *v43;
  size_t v44;
  unint64_t v45;
  void *memptr;

  v41[0] = 0;
  v41[1] = 0;
  v38 = 0;
  v39 = 0;
  v42 = 0x500000006;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v41, 0x1EuLL);
  v40 = 0x100000005;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v38, 5uLL);
  v8 = 0;
  v9 = *((unsigned int *)a3 + 4);
  v10 = *(_QWORD *)a3;
  v11 = (char *)v41[0];
  v12 = *(_QWORD *)a3 + 4 * (4 * v9);
  v13 = *(_QWORD *)a3 + 4 * (3 * v9);
  v14 = *(_QWORD *)a3 + 4 * (2 * v9);
  v15 = *(_QWORD *)a3 + 4 * v9;
  v16 = (char *)v41[0] + 4 * (4 * v42);
  v17 = (char *)v41[0] + 4 * (3 * v42);
  v18 = (char *)v41[0] + 4 * (2 * v42);
  v19 = (char *)v41[0] + 4 * v42;
  do
  {
    *(_DWORD *)&v11[v8] = *(_DWORD *)(v10 + v8);
    *(_DWORD *)&v19[v8] = *(_DWORD *)(v15 + v8);
    *(_DWORD *)&v18[v8] = *(_DWORD *)(v14 + v8);
    *(_DWORD *)&v17[v8] = *(_DWORD *)(v13 + v8);
    *(_DWORD *)&v16[v8] = *(_DWORD *)(v12 + v8);
    v8 += 4;
  }
  while (v8 != 24);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)v35, v41, 3, 0);
  if (!v37)
  {
    v21 = -18;
    goto LABEL_18;
  }
  v33 = 925353388;
  v34 = a4;
  if (__PAIR64__(*((_DWORD *)a4 + 5), v36) != v40)
  {
    if (*(void **)a4 == v38)
    {
      v22 = (4 * *((_DWORD *)a4 + 5) * v36 + 31) & 0x7FFFFFFE0;
      v43 = 0;
      v44 = v22 >> 2;
      memptr = 0;
      malloc_type_posix_memalign(&memptr, 0x20uLL, v22, 0x49090899uLL);
      v43 = memptr;
      v45 = __PAIR64__(v34[5], v36);
      cva::SVD<cva::Matrix<float,0u,0u,false>,true>::initialize<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)v35, (uint64_t)&v43, (uint64_t)v34, &v33);
      v23 = v38;
      v24 = v39;
      v38 = v43;
      v39 = v44;
      v43 = v23;
      v44 = v24;
      v40 = v45;
      v45 = 0;
      free(v23);
      goto LABEL_10;
    }
    v20 = *((_DWORD *)a4 + 5);
    v40 = __PAIR64__(v20, v36);
    cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)&v38, v20 * v36);
    a4 = v34;
  }
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::initialize<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)v35, (uint64_t)&v38, (uint64_t)a4, &v33);
LABEL_10:
  v25 = (float *)v38;
  v26 = *(float *)v38;
  if (*(float *)v38 >= 0.0)
  {
    v27 = sqrtf(v26);
    *a5 = v27;
    v30 = v25[2];
    v29 = v30 > 0.0;
  }
  else
  {
    v27 = sqrtf(-v26);
    *a5 = v27;
    v28 = v25[2];
    v29 = v28 < 0.0;
    v30 = -v28;
  }
  v31 = sqrtf(v30);
  if (!v29)
    v31 = 0.0;
  a5[1] = v31;
  if (v25[1] < 0.0)
  {
    v27 = -v27;
    *a5 = v27;
  }
  v21 = 0;
  a5[2] = v25[3] / v27;
  a5[3] = 0.0;
LABEL_18:
  free(v35[6]);
  free(v35[3]);
  free(v35[0]);
  free(v38);
  free(v41[0]);
  return v21;
}

- (int)correctSigns
{
  float *points3DCamera;
  uint64_t v3;
  float (*controlPointsCamera)[3];
  uint64_t i;
  uint64_t numPoints;
  float *v7;

  points3DCamera = self->_points3DCamera;
  if ((float)(points3DCamera[2] * self->_cameraOrientation) < 0.0)
  {
    v3 = 0;
    controlPointsCamera = self->_controlPointsCamera;
    do
    {
      for (i = 0; i != 3; ++i)
        (*controlPointsCamera)[i] = -(*controlPointsCamera)[i];
      ++v3;
      ++controlPointsCamera;
    }
    while (v3 != 4);
    numPoints = self->_numPoints;
    if ((int)numPoints >= 1)
    {
      v7 = points3DCamera + 2;
      do
      {
        *((float32x2_t *)v7 - 1) = vneg_f32(*(float32x2_t *)(v7 - 2));
        *v7 = -*v7;
        v7 += 3;
        --numPoints;
      }
      while (numPoints);
    }
  }
  return 0;
}

- (float)computeProjectionError:(float)a3[3][3] T:(float)a4[3]
{
  int numPoints;
  float cameraOrientation;
  float v6;
  float v7;
  float *v8;
  float *v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;

  numPoints = self->_numPoints;
  if (numPoints < 1)
  {
    v10 = 0.0;
  }
  else
  {
    cameraOrientation = self->_cameraOrientation;
    v6 = cameraOrientation * self->_fu;
    v7 = cameraOrientation * self->_fv;
    v8 = (float *)(self->_pointsWorld + 2);
    v9 = (float *)(self->_pointsImage + 1);
    v10 = 0.0;
    v11 = self->_numPoints;
    do
    {
      v12 = *(v8 - 2);
      v13 = *(v8 - 1);
      v14 = *v8;
      v8 += 3;
      v15 = (float)((float)((float)((*a3)[1] * v13) + (float)((*a3)[0] * v12)) + (float)((*a3)[2] * v14)) + *a4;
      v16 = (float)((float)(v13 * (*a3)[4]) + (float)((*a3)[3] * v12)) + (float)((*a3)[5] * v14);
      v17 = 1.0
          / (float)(a4[2] + (float)((float)((float)(v13 * (*a3)[7]) + (float)((*a3)[6] * v12)) + (float)((*a3)[8] * v14)));
      v18 = *(v9 - 1) - (float)(self->_uc + (float)((float)(v15 * v6) * v17));
      v19 = *v9 - (float)(self->_vc + (float)((float)((float)(a4[1] + v16) * v7) * v17));
      v10 = v10 + sqrtf((float)(v19 * v19) + (float)(v18 * v18));
      v9 += 2;
      --v11;
    }
    while (v11);
  }
  return v10 / (float)numPoints;
}

- (int)computeRT:(float)a3[3][3] T:(float)a4[3]
{
  uint64_t numPoints;
  uint64_t v8;
  float *points3DCamera;
  const float *pointsWorld;
  uint64_t i;
  uint64_t v12;
  float v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  float *v17;
  const float *v18;
  uint64_t v19;
  float *v20;
  uint64_t v21;
  float v22;
  float *v23;
  uint64_t v24;
  float *v25;
  int v26;
  float *v27;
  uint64_t v28;
  uint64_t v29;
  float (*__attribute__((__org_arrdim(0,3))) v30)[3];
  int v31;
  uint64_t j;
  float v33;
  float v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  float *v38;
  float v39;
  float v40;
  float v41;
  int v42;
  void *memptr[2];
  unsigned int v45;
  void *v46;
  int v47;
  void *v48;
  char v49;
  void *v50[3];
  uint64_t v51;
  float v52;
  uint64_t v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v53 = 0;
  v54 = 0;
  v51 = 0;
  v52 = 0.0;
  numPoints = self->_numPoints;
  if ((int)numPoints >= 1)
  {
    v8 = 0;
    points3DCamera = self->_points3DCamera;
    pointsWorld = self->_pointsWorld;
    do
    {
      for (i = 0; i != 3; ++i)
      {
        *(float *)((char *)&v53 + i * 4) = points3DCamera[i] + *(float *)((char *)&v53 + i * 4);
        *(float *)((char *)&v51 + i * 4) = pointsWorld[i] + *(float *)((char *)&v51 + i * 4);
      }
      ++v8;
      pointsWorld += 3;
      points3DCamera += 3;
    }
    while (v8 != numPoints);
  }
  v12 = 0;
  v13 = (float)(int)numPoints;
  do
  {
    *(float *)((char *)&v53 + v12) = *(float *)((char *)&v53 + v12) / v13;
    *(float *)((char *)&v51 + v12) = *(float *)((char *)&v51 + v12) / v13;
    v12 += 4;
  }
  while (v12 != 12);
  v50[1] = (void *)16;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x40uLL, 0x49090899uLL);
  v14 = (float *)memptr[0];
  v50[0] = memptr[0];
  v50[2] = (void *)0x300000003;
  *((_DWORD *)memptr[0] + 8) = 0;
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v15 = self->_numPoints;
  if ((int)v15 >= 1)
  {
    v16 = 0;
    v17 = self->_points3DCamera;
    v18 = self->_pointsWorld;
    do
    {
      v19 = 0;
      v20 = v14;
      do
      {
        v21 = 0;
        v22 = *((float *)&v53 + v19);
        v23 = v20;
        do
        {
          *v23 = *v23
               + (float)((float)(v17[3 * v16 + v19] - v22) * (float)(v18[v21] - *(float *)((char *)&v51 + v21 * 4)));
          v23 += 3;
          ++v21;
        }
        while (v21 != 3);
        ++v19;
        ++v20;
      }
      while (v19 != 3);
      ++v16;
      v18 += 3;
    }
    while (v16 != v15);
  }
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>((uint64_t)memptr, v50, 3, 0);
  if (v49)
  {
    v24 = 0;
    v25 = (float *)memptr[0];
    v26 = v47;
    v27 = (float *)v46;
    v28 = v45;
    v29 = 2 * v45;
    v30 = a3;
    do
    {
      v31 = 0;
      for (j = 0; j != 3; ++j)
      {
        (*v30)[j] = (float)((float)(v25[v24 + v28] * v27[v31 + 1]) + (float)(v25[v24] * v27[v31]))
                  + (float)(v25[v24 + v29] * v27[v31 + 2]);
        v31 += v26;
      }
      ++v24;
      ++v30;
    }
    while (v24 != 3);
    v34 = (*a3)[7];
    v33 = (*a3)[8];
    v35 = (*a3)[6];
    if ((float)((float)((float)((float)((float)((float)((float)((*a3)[1] * (*a3)[5]) * v35)
                                               + (float)((float)((*a3)[0] * (*a3)[4]) * v33))
                                       + (float)((float)((*a3)[2] * (*a3)[3]) * v34))
                               + (float)((float)-(float)((*a3)[2] * (*a3)[4]) * v35))
                       + (float)((float)-(float)((*a3)[1] * (*a3)[3]) * v33))
               + (float)((float)-(float)((*a3)[0] * (*a3)[5]) * v34)) < 0.0)
    {
      (*a3)[6] = -v35;
      (*a3)[7] = -v34;
      (*a3)[8] = -v33;
    }
    v36 = 0;
    v37 = v51;
    v38 = &(*a3)[2];
    v39 = v52;
    do
    {
      v40 = (float)(*(v38 - 1) * *((float *)&v37 + 1)) + (float)(*(v38 - 2) * *(float *)&v37);
      v41 = *v38;
      v38 += 3;
      a4[v36] = *(float *)((char *)&v53 + v36 * 4) - (float)(v40 + (float)(v41 * v39));
      ++v36;
    }
    while (v36 != 3);
    v42 = 0;
  }
  else
  {
    v42 = -18;
  }
  free(v48);
  free(v46);
  free(memptr[0]);
  free(v50[0]);
  return v42;
}

- (int)estimateRT:(void *)a3 betas:(const float *)a4 R:(float)a5[3][3] T:(float)a6[3] projectionError:(float *)a7
{
  int v11;
  int v12;

  -[VCPPnPSolver computeControlPointsCamera:Vt:](self, "computeControlPointsCamera:Vt:", a4, a3);
  -[VCPPnPSolver computePoints3DCamera](self, "computePoints3DCamera");
  -[VCPPnPSolver correctSigns](self, "correctSigns");
  v11 = -[VCPPnPSolver computeRT:T:](self, "computeRT:T:", a5, a6);
  if (!v11)
  {
    -[VCPPnPSolver computeProjectionError:T:](self, "computeProjectionError:T:", a5, a6);
    *(_DWORD *)a7 = v12;
  }
  return v11;
}

- (int)configureGaussNewton:(void *)a3 R6x1:(void *)a4 betas:(float)a5[4] jacobian:(void *)a6 residual:(void *)a7
{
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
  float v24;
  float v25;
  float v26;

  v7 = 0;
  v8 = *((unsigned int *)a3 + 4);
  v9 = *(_QWORD *)a3;
  v10 = *(_QWORD *)a6;
  v11 = *((unsigned int *)a6 + 4);
  v12 = *(_QWORD *)a4;
  v13 = *(_QWORD *)a7;
  v14 = *(_QWORD *)a3 + 4 * (9 * v8);
  v15 = *(_QWORD *)a3 + 4 * (8 * v8);
  v16 = *(_QWORD *)a3 + 4 * (5 * v8);
  v17 = *(_QWORD *)a3 + 4 * (7 * v8);
  v18 = *(_QWORD *)a3 + 4 * (4 * v8);
  v19 = *(_QWORD *)a3 + 4 * (2 * v8);
  v20 = *(_QWORD *)a3 + 4 * (6 * v8);
  v21 = *(_QWORD *)a3 + 4 * (3 * v8);
  v22 = v9 + 4 * v8;
  v23 = *(_QWORD *)a6 + 4 * (3 * v11);
  do
  {
    *(float *)(v10 + v7) = (float)((float)((float)(*(float *)(v22 + v7) * a5[1])
                                         + (float)((float)(*(float *)(v9 + v7) + *(float *)(v9 + v7)) * *a5))
                                 + (float)(*(float *)(v21 + v7) * a5[2]))
                         + (float)(*(float *)(v20 + v7) * a5[3]);
    *(float *)(v10 + 4 * v11 + v7) = (float)((float)((float)((float)(*(float *)(v19 + v7) + *(float *)(v19 + v7)) * a5[1])
                                                   + (float)(*(float *)(v22 + v7) * *a5))
                                           + (float)(*(float *)(v18 + v7) * a5[2]))
                                   + (float)(*(float *)(v17 + v7) * a5[3]);
    *(float *)(v10 + 4 * (2 * v11) + v7) = (float)((float)((float)(*(float *)(v18 + v7) * a5[1])
                                                                         + (float)(*(float *)(v21 + v7) * *a5))
                                                                 + (float)((float)(*(float *)(v16 + v7)
                                                                                 + *(float *)(v16 + v7))
                                                                         * a5[2]))
                                                         + (float)(*(float *)(v15 + v7) * a5[3]);
    *(float *)(v23 + v7) = (float)((float)((float)(*(float *)(v17 + v7) * a5[1]) + (float)(*(float *)(v20 + v7) * *a5))
                                 + (float)(*(float *)(v15 + v7) * a5[2]))
                         + (float)((float)(*(float *)(v14 + v7) + *(float *)(v14 + v7)) * a5[3]);
    v24 = a5[1];
    v25 = a5[2];
    v26 = a5[3];
    *(float *)(v13 + v7) = *(float *)(v12 + v7)
                         - (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(*a5 * *(float *)(v22 + v7)) * v24)
                                                                                                 + (float)((float)(*(float *)(v9 + v7) * *a5) * *a5))
                                                                                         + (float)((float)(v24 * *(float *)(v19 + v7))
                                                                                                 * v24))
                                                                                 + (float)((float)(*a5
                                                                                                 * *(float *)(v21 + v7))
                                                                                         * v25))
                                                                         + (float)((float)(v24 * *(float *)(v18 + v7))
                                                                                 * v25))
                                                                 + (float)((float)(v25 * *(float *)(v16 + v7)) * v25))
                                                         + (float)((float)(*a5 * *(float *)(v20 + v7)) * v26))
                                                 + (float)((float)(v24 * *(float *)(v17 + v7)) * v26))
                                         + (float)((float)(v25 * *(float *)(v15 + v7)) * v26))
                                 + (float)((float)(v26 * *(float *)(v14 + v7)) * v26));
    v7 += 4;
  }
  while (v7 != 24);
  return 0;
}

- (int)optimizeBetas:(void *)a3 R6x1:(void *)a4 betas:(float)a5[4]
{
  _OWORD *v9;
  int v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  void *v16[2];
  int v17;
  int v18;
  void *memptr[2];
  int v20;
  void *v21;
  void *v22[2];
  uint64_t v23;
  void *v24[3];
  void *v25;

  v24[1] = (void *)24;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x60uLL, 0x49090899uLL);
  v9 = memptr[0];
  v24[0] = memptr[0];
  v24[2] = (void *)0x400000006;
  *((_OWORD *)memptr[0] + 2) = 0u;
  v9[3] = 0u;
  v9[4] = 0u;
  v9[5] = 0u;
  *v9 = 0u;
  v9[1] = 0u;
  v22[1] = (void *)8;
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, 0x20uLL, 0x49090899uLL);
  v10 = 0;
  v11 = memptr[0];
  v22[0] = memptr[0];
  v23 = 0x100000006;
  *(_QWORD *)memptr[0] = 0;
  v11[1] = 0;
  v11[2] = 0;
  do
  {
    -[VCPPnPSolver configureGaussNewton:R6x1:betas:jacobian:residual:](self, "configureGaussNewton:R6x1:betas:jacobian:residual:", a3, a4, a5, v24, v22);
    cva::QR<cva::Matrix<float,0u,0u,false>>::QR<cva::Matrix<float,0u,0u,false>>((uint64_t)memptr, (uint64_t)v24);
    v12 = (4 * (HIDWORD(v23) * v20) + 31) & 0x7FFFFFFE0;
    v16[0] = 0;
    v16[1] = (void *)(v12 >> 2);
    v25 = 0;
    malloc_type_posix_memalign(&v25, 0x20uLL, v12, 0x49090899uLL);
    v16[0] = v25;
    v17 = v20;
    v18 = HIDWORD(v23);
    cva::QR<cva::Matrix<float,0u,0u,false>>::initialize<cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>>((uint64_t)memptr, (uint64_t)v16, (uint64_t)v22);
    v13 = 0;
    v14 = (char *)v16[0];
    do
    {
      a5[v13] = *(float *)&v14[v13 * 4] + a5[v13];
      ++v13;
    }
    while (v13 != 4);
    free(v14);
    free(v21);
    free(memptr[0]);
    ++v10;
  }
  while (v10 != 10);
  free(v22[0]);
  free(v24[0]);
  return 0;
}

- (int)estimatePose:(float *)a3
{
  int v5;
  int numPoints;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char *v10;
  float *alphas;
  const float *pointsImage;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int v20;
  int v21;
  _OWORD *v22;
  _QWORD *v23;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  void **v28;
  float v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t i;
  float v35;
  void *v36[3];
  void *v37[3];
  void *v38[3];
  void *v39[2];
  int v40;
  int v41;
  _DWORD v42[9];
  void *memptr[14];
  _BYTE v44[16];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = -[VCPPnPSolver getControlPoints](self, "getControlPoints");
  if (!v5)
  {
    v5 = -[VCPPnPSolver computeBarycentricCoordinates](self, "computeBarycentricCoordinates");
    if (!v5)
    {
      v39[0] = 0;
      v39[1] = 0;
      numPoints = self->_numPoints;
      v40 = 2 * numPoints;
      v41 = 12;
      cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v39, (24 * numPoints));
      v7 = self->_numPoints;
      if ((int)v7 >= 1)
      {
        v8 = 0;
        v9 = v40;
        v10 = (char *)v39[0];
        pointsImage = self->_pointsImage;
        alphas = self->_alphas;
        v13 = 3 * v40;
        v14 = 2 * v40;
        do
        {
          v15 = 0;
          v16 = 0;
          v17 = &v10[8 * v8];
          v18 = (2 * v8) | 1;
          v19 = &v10[4 * v18];
          do
          {
            *(float *)&v17[4 * v16] = alphas[v15] * self->_fu;
            v20 = v9 + v16;
            *(_DWORD *)&v17[4 * v20] = 0;
            v21 = v14 + v16;
            *(float *)&v17[4 * v21] = (float)(self->_cameraOrientation * alphas[v15])
                                    * (float)(self->_uc - pointsImage[2 * v8]);
            *(_DWORD *)&v19[4 * v16] = 0;
            *(float *)&v19[4 * v20] = alphas[v15] * self->_fv;
            *(float *)&v19[4 * v21] = (float)(self->_cameraOrientation * alphas[v15])
                                    * (float)(self->_vc - pointsImage[v18]);
            v16 += v13;
            ++v15;
          }
          while (v15 != 4);
          ++v8;
          alphas += 4;
        }
        while (v8 != v7);
      }
      v38[0] = 0;
      v38[1] = 0;
      v38[2] = (void *)0xC0000000CLL;
      cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v38, 0x90uLL);
      v5 = -[VCPPnPSolver computeSVDVt:Vt:](self, "computeSVDVt:Vt:", v39, v38);
      if (!v5)
      {
        v37[1] = (void *)64;
        memptr[0] = 0;
        malloc_type_posix_memalign(memptr, 0x20uLL, 0x100uLL, 0x49090899uLL);
        v22 = memptr[0];
        v37[0] = memptr[0];
        v37[2] = (void *)0xA00000006;
        *((_OWORD *)memptr[0] + 2) = 0u;
        v22[3] = 0u;
        v22[4] = 0u;
        v22[5] = 0u;
        v22[6] = 0u;
        v22[7] = 0u;
        v22[8] = 0u;
        v22[9] = 0u;
        v22[10] = 0u;
        v22[11] = 0u;
        v22[12] = 0u;
        v22[13] = 0u;
        v22[14] = 0u;
        *v22 = 0u;
        v22[1] = 0u;
        v36[1] = (void *)8;
        memptr[0] = 0;
        malloc_type_posix_memalign(memptr, 0x20uLL, 0x20uLL, 0x49090899uLL);
        v23 = memptr[0];
        v36[0] = memptr[0];
        v36[2] = (void *)0x100000006;
        *(_QWORD *)memptr[0] = 0;
        v23[1] = 0;
        v23[2] = 0;
        v5 = -[VCPPnPSolver computeL6x10:L6x10:](self, "computeL6x10:L6x10:", v38, v37);
        if (!v5)
        {
          -[VCPPnPSolver computeR6x1:](self, "computeR6x1:", v36);
          v25 = 0;
          v26 = 0;
          v27 = v42;
          v28 = memptr;
          v29 = 3.4028e38;
          while (1)
          {
            v35 = 0.0;
            if ((_DWORD)v25 == 1)
              v30 = -[VCPPnPSolver estimateBetasN2:R6x1:betas:](self, "estimateBetasN2:R6x1:betas:", v37, v36, v44);
            else
              v30 = (_DWORD)v25
                  ? -[VCPPnPSolver estimateBetasN3:R6x1:betas:](self, "estimateBetasN3:R6x1:betas:", v37, v36, v44)
                  : -[VCPPnPSolver estimateBetasN1:R6x1:betas:](self, "estimateBetasN1:R6x1:betas:", v37, v36, v44);
            v5 = v30;
            if (v30)
              break;
            v5 = -[VCPPnPSolver optimizeBetas:R6x1:betas:](self, "optimizeBetas:R6x1:betas:", v37, v36, v44);
            if (v5)
              break;
            v5 = -[VCPPnPSolver estimateRT:betas:R:T:projectionError:](self, "estimateRT:betas:R:T:projectionError:", v38, v44, v28, v27, &v35);
            if (v5)
              break;
            if (v35 < v29)
              v26 = v25;
            v31 = v25 + 1;
            if (v35 < v29)
              v29 = v35;
            v27 += 3;
            v28 = (void **)((char *)v28 + 36);
            ++v25;
            if (v31 == 3)
            {
              v32 = 0;
              v33 = (char *)memptr + 36 * v26;
              do
              {
                for (i = 0; i != 3; ++i)
                  *((_DWORD *)&self[1].super.isa + 4 * i + v32) = *(_DWORD *)&v33[4 * i];
                LODWORD(self[1]._controlPointsWorld[0][v32 + 1]) = v42[3 * v26 + v32];
                ++v32;
                v33 += 12;
              }
              while (v32 != 3);
              v5 = 0;
              *a3 = v29;
              break;
            }
          }
        }
        free(v36[0]);
        free(v37[0]);
      }
      free(v38[0]);
      free(v39[0]);
    }
  }
  return v5;
}

- (int)estimateExtrinsicsWith:(const float *)a3 andPoints3D:(const float *)a4 andNumPoints:(int)a5
{
  int result;
  float *alphas;
  float *points3DCamera;
  const std::nothrow_t *v12;
  float *v13;
  float *v14;
  int v15;

  v15 = 0;
  result = -50;
  if (a4 && a3 && (a5 - 4) <= 0x7CC)
  {
    if (self->_numPoints >= a5)
      goto LABEL_11;
    alphas = self->_alphas;
    if (alphas)
      MEMORY[0x1BCCA128C](alphas, 0x1000C8052888210);
    points3DCamera = self->_points3DCamera;
    if (points3DCamera)
      MEMORY[0x1BCCA128C](points3DCamera, 0x1000C8052888210);
    v12 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v13 = (float *)operator new[](4 * (4 * a5), MEMORY[0x1E0DE4E10]);
    self->_alphas = v13;
    v14 = (float *)operator new[](4 * (3 * a5), v12);
    self->_points3DCamera = v14;
    result = -108;
    if (v13)
    {
      if (v14)
      {
LABEL_11:
        self->_numPoints = a5;
        self->_pointsWorld = a4;
        self->_pointsImage = a3;
        return -[VCPPnPSolver estimatePose:](self, "estimatePose:", &v15);
      }
    }
  }
  return result;
}

- (double)pose
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 192), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setPose:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 192), v5, 64, 1, 0);
}

@end
