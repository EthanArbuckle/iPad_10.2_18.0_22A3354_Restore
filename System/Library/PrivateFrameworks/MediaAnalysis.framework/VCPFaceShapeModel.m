@implementation VCPFaceShapeModel

- (VCPFaceShapeModel)initWithMode:(int)a3
{
  uint64_t v3;
  VCPFaceShapeModel *v4;
  VCPFaceShapeModel *v5;
  VCPFaceShapeModel *v6;
  VCPFaceShapeModel *v7;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)VCPFaceShapeModel;
  v4 = -[VCPFaceShapeModel init](&v9, sel_init);
  v5 = v4;
  if (v4 && -[VCPFaceShapeModel setupModel:](v4, "setupModel:", v3))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

- (BOOL)isIdentityInit
{
  if (self->_shapeUpdateInProgress && self->_processingMode != 1)
    dispatch_group_wait((dispatch_group_t)self->_updateShapeGroup, 0xFFFFFFFFFFFFFFFFLL);
  return self->_identityInit;
}

- (int)setCameraIntrinsics:(float)a3 uc:(float)a4 vc:(float)a5
{
  __int128 v6;
  double v7;
  double v8;
  VCPPnPSolver *v9;
  double v10;
  VCPPnPSolver *v11;
  VCPPnPSolver *poseSolver;

  *(float *)&intrinsic_matrix = a3;
  *((float *)&intrinsic_matrix + 2) = a4;
  dword_1EF14F240 = LODWORD(a3);
  dword_1EF14F244 = LODWORD(a5);
  v6 = *(_OWORD *)&dword_1EF14F240;
  *(_OWORD *)self->_intrinsicMatrix = intrinsic_matrix;
  *(_OWORD *)&self->_intrinsicMatrix[4] = v6;
  LODWORD(self->_intrinsicMatrix[8]) = dword_1EF14F250;
  v7 = self->_intrinsicMatrix[2];
  v8 = self->_intrinsicMatrix[5];
  v9 = [VCPPnPSolver alloc];
  *(float *)&v10 = self->_intrinsicMatrix[0];
  v11 = -[VCPPnPSolver initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:](v9, "initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:", 1, v10, v7, v8);
  poseSolver = self->_poseSolver;
  self->_poseSolver = v11;

  if (self->_poseSolver)
    return 0;
  else
    return -108;
}

- (void)updateIntrinsic:(float)a3 vc:(float)a4
{
  *((float *)&intrinsic_matrix + 2) = a3;
  dword_1EF14F244 = LODWORD(a4);
  self->_intrinsicMatrix[2] = a3;
  self->_intrinsicMatrix[5] = a4;
  -[VCPPnPSolver updateIntrinsic:vc:](self->_poseSolver, "updateIntrinsic:vc:");
}

- (void)updateFocalLengthInPixels:(float)a3
{
  VCPPnPSolver *poseSolver;

  dword_1EF14F240 = LODWORD(a3);
  *(float *)&intrinsic_matrix = a3;
  self->_intrinsicMatrix[4] = a3;
  self->_intrinsicMatrix[0] = a3;
  poseSolver = self->_poseSolver;
  if (poseSolver)
    -[VCPPnPSolver updateFocalLengthInPixels:](poseSolver, "updateFocalLengthInPixels:");
}

- (int)setupModel:(int)a3
{
  void *v4;
  void *v5;
  id v6;
  FILE *v7;
  void *v8;
  id v9;
  FILE *v10;
  void *v11;
  id v12;
  FILE *v13;
  int v14;
  VCPFaceTensorModel *v15;
  VCPFaceTensorModel *tensorModel;
  VCPFaceTensorModel *v17;
  size_t v18;
  size_t v19;
  const std::nothrow_t *v20;
  int *v21;
  float *v22;
  uint64_t numBoundaryLms;
  size_t v24;
  int *v25;
  unint64_t numBoundaryVertices;
  size_t v27;
  const std::nothrow_t *v28;
  int *v29;
  size_t v30;
  $18698D32E93F98CA3BC0140E41567ABB *v31;
  BOOL *v32;
  int *v33;
  size_t v34;
  uint64_t v35;
  size_t v36;
  BOOL *v37;
  float *v38;
  float *v39;
  _OWORD *v40;
  _OWORD *v41;
  _OWORD *v42;
  float *v43;
  float *v44;
  const std::nothrow_t *v45;
  uint64_t numVertices;
  size_t v47;
  size_t v48;
  size_t v49;
  float *v50;
  size_t v51;
  float *v52;
  float *v53;
  float *v54;
  float *v55;
  float *v56;
  int v57;
  size_t v58;
  const std::nothrow_t *v59;
  float *v60;
  float *v61;
  OS_dispatch_queue *v62;
  OS_dispatch_queue *updateShapeQueue;
  OS_dispatch_group *v64;
  OS_dispatch_group *updateShapeGroup;
  uint64_t v66;
  uint64_t i;
  uint64_t v68;
  uint64_t j;
  float *__dst;
  float *v72;
  float *v73;
  float *v74;
  _OWORD *v75;
  float *v76;
  void *v77;
  void *v78;
  int __ptr;

  self->_processingMode = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("face_model_tensor.dat"), v5);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = fopen((const char *)objc_msgSend(v6, "UTF8String"), "rb");

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("face_model_landmark_coordinates.dat"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = fopen((const char *)objc_msgSend(v9, "UTF8String"), "rb");

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("face_model_boundary.dat"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = fopen((const char *)objc_msgSend(v12, "UTF8String"), "rb");

  v14 = -23;
  if (v7 && v10 && v13)
  {
    v15 = -[VCPFaceTensorModel initWithModelFile:]([VCPFaceTensorModel alloc], "initWithModelFile:", v7);
    tensorModel = self->_tensorModel;
    self->_tensorModel = v15;

    v17 = self->_tensorModel;
    if (!v17)
    {
      v14 = -108;
      goto LABEL_82;
    }
    self->_numVertices = -[VCPFaceTensorModel numVertices](v17, "numVertices");
    self->_numBoundaryLms = 11;
    self->_numInternalLms = 52;
    __ptr = 0;
    if (fread(&__ptr, 4uLL, 1uLL, v10) != 1 || __ptr != self->_numInternalLms)
      goto LABEL_80;
    v77 = v8;
    v18 = 3 * __ptr;
    if (__ptr < 0)
      v19 = -1;
    else
      v19 = 12 * __ptr;
    v20 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v21 = (int *)operator new[](v19, MEMORY[0x1E0DE4E10]);
    self->_lmCoord = v21;
    v22 = (float *)operator new[](v19, v20);
    self->_lmWeight = v22;
    v14 = -108;
    if (!v21)
      goto LABEL_86;
    v8 = v77;
    if (!v22)
      goto LABEL_82;
    if (fread(v21, 4uLL, v18, v10) != v18 || fread(self->_lmWeight, 4uLL, v18, v10) != v18)
      goto LABEL_80;
    numBoundaryLms = self->_numBoundaryLms;
    if ((int)numBoundaryLms < 0)
      v24 = -1;
    else
      v24 = 4 * numBoundaryLms;
    v25 = (int *)operator new[](v24, MEMORY[0x1E0DE4E10]);
    self->_boundaryLmIndices = v25;
    if (!v25)
      goto LABEL_82;
    if (fread(&self->_numBoundaryVertices, 4uLL, 1uLL, v13) != 1)
      goto LABEL_80;
    numBoundaryVertices = self->_numBoundaryVertices;
    if ((numBoundaryVertices & 0x80000000) != 0)
      v27 = -1;
    else
      v27 = 4 * numBoundaryVertices;
    v28 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v29 = (int *)operator new[](v27, MEMORY[0x1E0DE4E10]);
    self->_boundaryVertices = v29;
    if (is_mul_ok(numBoundaryVertices, 0xCuLL))
      v30 = 12 * numBoundaryVertices;
    else
      v30 = -1;
    v31 = ($18698D32E93F98CA3BC0140E41567ABB *)operator new[](v30, v28);
    self->_chPts = v31;
    v32 = (BOOL *)operator new[](numBoundaryVertices, v28);
    v33 = v29;
    self->_chPtSelected = v32;
    v14 = -108;
    if (!v33)
      goto LABEL_86;
    v8 = v77;
    if (!v31 || !v32)
      goto LABEL_82;
    v34 = fread(v33, 4uLL, numBoundaryVertices, v13);
    v35 = self->_numBoundaryVertices;
    if (v34 != v35)
      goto LABEL_80;
    v36 = self->_numBoundaryLms * (uint64_t)(int)v35;
    v37 = (BOOL *)operator new[](v36, MEMORY[0x1E0DE4E10]);
    self->_boundaryLandmarkValidity = v37;
    if (!v37)
      goto LABEL_82;
    if (fread(v37, 1uLL, v36, v13) != self->_numBoundaryVertices * (uint64_t)self->_numBoundaryLms)
    {
LABEL_80:
      v14 = -19;
      goto LABEL_82;
    }
    self->_boundaryLmUpdated = 0;
    v38 = (float *)operator new[](0x7D4uLL, MEMORY[0x1E0DE4E10]);
    v39 = v38;
    if (v38)
      bzero(v38, 0x7D4uLL);
    self->_curCoeff = v39;
    v40 = operator new[](0xCCuLL, MEMORY[0x1E0DE4E10]);
    if (v40)
    {
      *(_OWORD *)((char *)v40 + 188) = 0u;
      v40[10] = 0u;
      v40[11] = 0u;
      v40[8] = 0u;
      v40[9] = 0u;
      v40[6] = 0u;
      v40[7] = 0u;
      v40[4] = 0u;
      v40[5] = 0u;
      v40[2] = 0u;
      v40[3] = 0u;
      *v40 = 0u;
      v40[1] = 0u;
    }
    v75 = v40;
    v76 = v39;
    self->_curExprWeights = (float *)v40;
    v41 = operator new[](0xCCuLL, MEMORY[0x1E0DE4E10]);
    v42 = v41;
    if (v41)
    {
      *(_OWORD *)((char *)v41 + 188) = 0u;
      v41[10] = 0u;
      v41[11] = 0u;
      v41[8] = 0u;
      v41[9] = 0u;
      v41[6] = 0u;
      v41[7] = 0u;
      v41[4] = 0u;
      v41[5] = 0u;
      v41[2] = 0u;
      v41[3] = 0u;
      *v41 = 0u;
      v41[1] = 0u;
    }
    self->_prevExprWeights = (float *)v41;
    v43 = (float *)operator new[](0xF51E4uLL, MEMORY[0x1E0DE4E10]);
    v44 = v43;
    if (v43)
      bzero(v43, 0xF51E4uLL);
    self->_exprWeightDiagMatrix = v44;
    v45 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v74 = (float *)operator new[](0x9990uLL, MEMORY[0x1E0DE4E10]);
    self->_lm3dMeanBlendshapes = v74;
    numVertices = self->_numVertices;
    if (1503 * (int)numVertices < 0)
      v47 = -1;
    else
      v47 = 6012 * (_DWORD)numVertices;
    v73 = (float *)operator new[](v47, v45);
    self->_lm3dBlendshapeComponents = v73;
    v72 = (float *)operator new[](0x9990uLL, v45);
    self->_lm3dBlendshapes = v72;
    if ((int)numVertices < 0)
      v48 = -1;
    else
      v48 = 12 * (_DWORD)numVertices;
    if ((int)numVertices < 0)
      v49 = -1;
    else
      v49 = 8 * numVertices;
    __dst = (float *)operator new[](v48, v45);
    self->_curMesh = __dst;
    v50 = (float *)operator new[](v49, v45);
    self->_cur2D = v50;
    if (156 * (int)numVertices < 0)
      v51 = -1;
    else
      v51 = 624 * (_DWORD)numVertices;
    v52 = (float *)operator new[](v51, v45);
    self->_curBlendshapes = v52;
    v14 = -108;
    if (!v76)
      goto LABEL_86;
    v8 = v77;
    if (!v75 || !v42 || !v74 || !v73 || !v72 || !__dst || !v50 || !v52)
      goto LABEL_82;
    v53 = (float *)operator new[](0x7D4uLL, MEMORY[0x1E0DE4E10]);
    v54 = v53;
    if (v53)
      bzero(v53, 0x7D4uLL);
    self->_transformedCoeff = v54;
    v55 = (float *)operator new[](0x2F4uLL, MEMORY[0x1E0DE4E10]);
    if (v55)
    {
      v56 = v55;
      bzero(v55, 0x2F4uLL);
      self->_blendShapeDelta = v56;
      if (v54)
      {
        memcpy(__dst, -[VCPFaceTensorModel meanBlendshape](self->_tensorModel, "meanBlendshape"), 12 * self->_numVertices);
        memcpy(self->_curBlendshapes, -[VCPFaceTensorModel meanBlendshape](self->_tensorModel, "meanBlendshape"), 624 * self->_numVertices);
        v57 = 156 * self->_numVertices;
        if (v57 < 0)
          v58 = -1;
        else
          v58 = 4 * v57;
        v59 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
        v60 = (float *)operator new[](v58, MEMORY[0x1E0DE4E10]);
        self->_asyncBlendshapes = v60;
        v61 = (float *)operator new[](0x9990uLL, v59);
        self->_asyncLmBlendshapes = v61;
        v14 = -108;
        if (v60)
        {
          v8 = v77;
          if (!v61)
            goto LABEL_82;
          v62 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaanalysisd.VCPFaceShapeUpdate", 0);
          updateShapeQueue = self->_updateShapeQueue;
          self->_updateShapeQueue = v62;

          v64 = (OS_dispatch_group *)dispatch_group_create();
          updateShapeGroup = self->_updateShapeGroup;
          self->_updateShapeGroup = v64;

          v66 = 0;
          for (i = 0; i != 156; i += 3)
          {
            -[VCPFaceShapeModel getInternal3dLandmarksCoordinates:lm3dPos:](self, "getInternal3dLandmarksCoordinates:lm3dPos:", -[VCPFaceTensorModel meanBlendshape](self->_tensorModel, "meanBlendshape")+ 4 * (int)i * self->_numVertices, &self->_lm3dMeanBlendshapes[v66]);
            v66 += 189;
          }
          v68 = 0;
          for (j = 0; j != 1503; j += 3)
          {
            -[VCPFaceShapeModel getInternal3dLandmarksCoordinates:lm3dPos:](self, "getInternal3dLandmarksCoordinates:lm3dPos:", -[VCPFaceTensorModel componentsBlendshape](self->_tensorModel, "componentsBlendshape")+ 4 * (int)j * self->_numVertices, &self->_lm3dBlendshapeComponents[v68]);
            v68 += 189;
          }
          memcpy(self->_lm3dBlendshapes, self->_lm3dMeanBlendshapes, 0x9990uLL);
          memcpy(self->_LM3D, self->_lm3dMeanBlendshapes, 12 * self->_numInternalLms);
          self->_detectionModeCounterShapeModel = 0;
          self->_numFrmsSinceLastShapeUpdate = 41;
          self->_identityInit = 0;
          self->_shapeUpdateInProgress = 0;
          self->_eulerAngle[0] = 0.0;
          *(_QWORD *)&self->_eulerAngle[1] = 0;
          self->_vertexCount = 1220;
          v14 = 0;
          *(_QWORD *)self->_meshVertices = operator new[]();
          v8 = v77;
          goto LABEL_74;
        }
LABEL_86:
        v8 = v77;
        goto LABEL_82;
      }
    }
    else
    {
      self->_blendShapeDelta = 0;
    }
    v14 = -108;
    goto LABEL_86;
  }
LABEL_74:
  if (!v7)
  {
    if (!v10)
      goto LABEL_77;
    goto LABEL_76;
  }
LABEL_82:
  fclose(v7);
  if (v10)
LABEL_76:
    fclose(v10);
LABEL_77:
  if (v13)
    fclose(v13);

  return v14;
}

- (void)dealloc
{
  int *lmCoord;
  float *lmWeight;
  int *boundaryLmIndices;
  int *boundaryVertices;
  $18698D32E93F98CA3BC0140E41567ABB *chPts;
  BOOL *chPtSelected;
  BOOL *boundaryLandmarkValidity;
  float *curCoeff;
  float *curExprWeights;
  float *prevExprWeights;
  float *exprWeightDiagMatrix;
  float *lm3dMeanBlendshapes;
  float *lm3dBlendshapeComponents;
  float *lm3dBlendshapes;
  float *curMesh;
  float *cur2D;
  float *curBlendshapes;
  float *transformedCoeff;
  float *blendShapeDelta;
  float *asyncBlendshapes;
  float *asyncLmBlendshapes;
  uint64_t v24;
  objc_super v25;

  lmCoord = self->_lmCoord;
  if (lmCoord)
    MEMORY[0x1BCCA128C](lmCoord, 0x1000C8052888210);
  lmWeight = self->_lmWeight;
  if (lmWeight)
    MEMORY[0x1BCCA128C](lmWeight, 0x1000C8052888210);
  boundaryLmIndices = self->_boundaryLmIndices;
  if (boundaryLmIndices)
    MEMORY[0x1BCCA128C](boundaryLmIndices, 0x1000C8052888210);
  boundaryVertices = self->_boundaryVertices;
  if (boundaryVertices)
    MEMORY[0x1BCCA128C](boundaryVertices, 0x1000C8052888210);
  chPts = self->_chPts;
  if (chPts)
    MEMORY[0x1BCCA128C](chPts, 0x1000C803E1C8BA9);
  chPtSelected = self->_chPtSelected;
  if (chPtSelected)
    MEMORY[0x1BCCA128C](chPtSelected, 0x1000C8077774924);
  boundaryLandmarkValidity = self->_boundaryLandmarkValidity;
  if (boundaryLandmarkValidity)
    MEMORY[0x1BCCA128C](boundaryLandmarkValidity, 0x1000C8077774924);
  curCoeff = self->_curCoeff;
  if (curCoeff)
    MEMORY[0x1BCCA128C](curCoeff, 0x1000C8052888210);
  curExprWeights = self->_curExprWeights;
  if (curExprWeights)
    MEMORY[0x1BCCA128C](curExprWeights, 0x1000C8052888210);
  prevExprWeights = self->_prevExprWeights;
  if (prevExprWeights)
    MEMORY[0x1BCCA128C](prevExprWeights, 0x1000C8052888210);
  exprWeightDiagMatrix = self->_exprWeightDiagMatrix;
  if (exprWeightDiagMatrix)
    MEMORY[0x1BCCA128C](exprWeightDiagMatrix, 0x1000C8052888210);
  lm3dMeanBlendshapes = self->_lm3dMeanBlendshapes;
  if (lm3dMeanBlendshapes)
    MEMORY[0x1BCCA128C](lm3dMeanBlendshapes, 0x1000C8052888210);
  lm3dBlendshapeComponents = self->_lm3dBlendshapeComponents;
  if (lm3dBlendshapeComponents)
    MEMORY[0x1BCCA128C](lm3dBlendshapeComponents, 0x1000C8052888210);
  lm3dBlendshapes = self->_lm3dBlendshapes;
  if (lm3dBlendshapes)
    MEMORY[0x1BCCA128C](lm3dBlendshapes, 0x1000C8052888210);
  curMesh = self->_curMesh;
  if (curMesh)
    MEMORY[0x1BCCA128C](curMesh, 0x1000C8052888210);
  cur2D = self->_cur2D;
  if (cur2D)
    MEMORY[0x1BCCA128C](cur2D, 0x1000C8052888210);
  curBlendshapes = self->_curBlendshapes;
  if (curBlendshapes)
    MEMORY[0x1BCCA128C](curBlendshapes, 0x1000C8052888210);
  transformedCoeff = self->_transformedCoeff;
  if (transformedCoeff)
    MEMORY[0x1BCCA128C](transformedCoeff, 0x1000C8052888210);
  blendShapeDelta = self->_blendShapeDelta;
  if (blendShapeDelta)
    MEMORY[0x1BCCA128C](blendShapeDelta, 0x1000C8052888210);
  asyncBlendshapes = self->_asyncBlendshapes;
  if (asyncBlendshapes)
    MEMORY[0x1BCCA128C](asyncBlendshapes, 0x1000C8052888210);
  asyncLmBlendshapes = self->_asyncLmBlendshapes;
  if (asyncLmBlendshapes)
    MEMORY[0x1BCCA128C](asyncLmBlendshapes, 0x1000C8052888210);
  v24 = *(_QWORD *)self->_meshVertices;
  if (v24)
    MEMORY[0x1BCCA128C](v24, 0x1000C80451B5BE8);
  v25.receiver = self;
  v25.super_class = (Class)VCPFaceShapeModel;
  -[VCPFaceShapeModel dealloc](&v25, sel_dealloc);
}

- (void)getEulerAngle:(float *)a3
{
  uint64_t v3;
  float v4;

  v3 = *(_QWORD *)self->_eulerAngle;
  a3[2] = self->_eulerAngle[2];
  *(_QWORD *)a3 = v3;
  v4 = dbl_1B6FBD960[a3[2] < 0.0] + a3[2];
  a3[2] = v4;
}

- (void)project3Dto2D:(float *)a3 intrinsinc:(float *)a4 extrinsic:(float *)a5 numVert:(int)a6 out2dpts:(float *)a7
{
  uint64_t v8;
  const float *v10;
  float32x2_t v11;
  float __C[12];
  float32x2_t v13;
  uint64_t v14;
  uint64_t __B;
  int v16;
  int v17;
  uint64_t v18;

  LODWORD(v8) = a6;
  v18 = *MEMORY[0x1E0C80C00];
  matrix_multiplication(a4, a5, __C, 3, 3, 4);
  if ((int)v8 >= 1)
  {
    v8 = v8;
    do
    {
      __B = *(_QWORD *)a3;
      v16 = *((_DWORD *)a3 + 2);
      v17 = 1065353216;
      matrix_multiplication(__C, (const float *)&__B, (float *)&v13, 3, 4, 1);
      v10 = (const float *)&v14;
      v11 = vld1_dup_f32(v10);
      *(float32x2_t *)a7 = vdiv_f32(v13, v11);
      a7 += 2;
      a3 += 3;
      --v8;
    }
    while (v8);
  }
}

- (void)getOneInternalLandmarkCoordinates:(const float *)a3 lmCoord:(const int *)a4 lmWeight:(const float *)a5 lm3dPos:(float *)a6
{
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v6 = 0;
  v13 = *MEMORY[0x1E0C80C00];
  v11 = *(_QWORD *)a4;
  v12 = a4[2];
  v9 = *(_QWORD *)a5;
  v10 = *((_DWORD *)a5 + 2);
  do
  {
    v7 = 0;
    a6[v6] = 0.0;
    v8 = 0.0;
    do
    {
      v8 = v8 + (float)(a3[3 * *(_DWORD *)((char *)&v11 + v7) + (int)v6] * *(float *)((char *)&v9 + v7));
      a6[v6] = v8;
      v7 += 4;
    }
    while (v7 != 12);
    ++v6;
  }
  while (v6 != 3);
}

- (void)updateBoundaryLandmarkCoordinates:(const float *)a3 pts2D:(const float *)a4 lm2D:(const float *)a5 lm3dPos:(float *)a6
{
  char *v10;
  uint64_t numBoundaryVertices;
  uint64_t v12;
  int *boundaryVertices;
  _DWORD *v14;
  int ExtendedFaceHull;
  int numInternalLms;
  int v17;
  uint64_t v18;
  uint64_t chCount;
  uint64_t v20;
  int v21;
  int v22;
  float v23;
  float v24;
  int *p_var2;
  int v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  const float *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (!self->_boundaryLmUpdated)
  {
    v10 = (char *)v33 - ((12 * self->_numBoundaryVertices + 15) & 0x1FFFFFFFF0);
    numBoundaryVertices = self->_numBoundaryVertices;
    if ((int)numBoundaryVertices >= 1)
    {
      v12 = 0;
      boundaryVertices = self->_boundaryVertices;
      v14 = v10 + 8;
      do
      {
        *((_QWORD *)v14 - 1) = *(_QWORD *)&a4[2 * boundaryVertices[v12]];
        *v14 = v12;
        v14 += 3;
        ++v12;
      }
      while (numBoundaryVertices != v12);
    }
    ExtendedFaceHull = getExtendedFaceHull(v10, numBoundaryVertices, (uint64_t)self->_chPts);
    self->_chCount = ExtendedFaceHull;
    bzero(self->_chPtSelected, ExtendedFaceHull);
    numInternalLms = self->_numInternalLms;
    if (numInternalLms <= 62)
    {
      do
      {
        v17 = self->_numInternalLms;
        v18 = kBoundaryLmOrder[numInternalLms - v17];
        chCount = self->_chCount;
        if ((int)chCount < 1)
          goto LABEL_16;
        v20 = 0;
        v21 = 0;
        v22 = v18 + v17;
        v23 = a5[2 * v22];
        v24 = a5[2 * v22 + 1];
        p_var2 = &self->_chPts->var2;
        v26 = -1;
        v27 = 1.0e20;
        do
        {
          if (!self->_chPtSelected[v20])
          {
            v28 = *p_var2;
            if (self->_boundaryLandmarkValidity[v28 + self->_numBoundaryVertices * (uint64_t)(int)v18]
              && (float)((float)((float)(v24 - *((float *)p_var2 - 1)) * (float)(v24 - *((float *)p_var2 - 1)))
                       + (float)((float)(v23 - *((float *)p_var2 - 2)) * (float)(v23 - *((float *)p_var2 - 2)))) < v27)
            {
              v26 = self->_boundaryVertices[v28];
              v27 = (float)((float)(v24 - *((float *)p_var2 - 1)) * (float)(v24 - *((float *)p_var2 - 1)))
                  + (float)((float)(v23 - *((float *)p_var2 - 2)) * (float)(v23 - *((float *)p_var2 - 2)));
              v21 = v20;
            }
          }
          ++v20;
          p_var2 += 3;
        }
        while (chCount != v20);
        if (v26 == -1)
        {
LABEL_16:
          self->_boundaryLmIndices[v18] = kDefaultBoundaryLmIndices[v18];
        }
        else
        {
          self->_boundaryLmIndices[v18] = v26;
          self->_chPtSelected[v21] = 1;
        }
        ++numInternalLms;
      }
      while (numInternalLms != 63);
    }
    self->_boundaryLmUpdated = 1;
  }
  if (self->_numBoundaryLms >= 1)
  {
    v29 = 0;
    do
    {
      v30 = &a6[3 * (int)v29 + 3 * self->_numInternalLms];
      v31 = &a3[3 * self->_boundaryLmIndices[v29]];
      v32 = *(_QWORD *)v31;
      v30[2] = v31[2];
      *(_QWORD *)v30 = v32;
      ++v29;
    }
    while (v29 < self->_numBoundaryLms);
  }
}

- (void)getInternal3dLandmarksCoordinates:(const float *)a3 lm3dPos:(float *)a4
{
  uint64_t v7;
  uint64_t v8;

  if (self->_numInternalLms >= 1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      -[VCPFaceShapeModel getOneInternalLandmarkCoordinates:lmCoord:lmWeight:lm3dPos:](self, "getOneInternalLandmarkCoordinates:lmCoord:lmWeight:lm3dPos:", a3, &self->_lmCoord[v7], &self->_lmWeight[v7], &a4[v7]);
      ++v8;
      v7 += 3;
    }
    while (v8 < self->_numInternalLms);
  }
}

- (void)updateBoundary3dLandmarkBlendshapes:(const float *)a3 numBlendshapes:(int)a4 pts2D:(const float *)a5 lm2D:(const float *)a6 lmBlendshapes:(float *)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v17;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a4 >= 1)
  {
    v20 = v12;
    v21 = v11;
    v22 = v10;
    v23 = v9;
    v24 = v8;
    v25 = v7;
    v26 = v13;
    v27 = v14;
    v17 = a4;
    do
    {
      -[VCPFaceShapeModel updateBoundaryLandmarkCoordinates:pts2D:lm2D:lm3dPos:](self, "updateBoundaryLandmarkCoordinates:pts2D:lm2D:lm3dPos:", a3, self->_cur2D, a6, a7, v20, v21, v22, v23, v24, v25, v26, v27);
      a3 += 3 * self->_numVertices;
      a7 += 189;
      --v17;
    }
    while (v17);
  }
}

- (void)moveBoundaryLandmarks:(const float *)a3 output:(float *)a4 isInput:(BOOL)a5
{
  _BOOL4 v5;
  float *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v5 = a5;
  memcpy(a4, a3, 0x140uLL);
  v9 = a4 + 80;
  if (v5)
  {
    v10 = *(_OWORD *)(a3 + 106);
    *(_OWORD *)v9 = *(_OWORD *)(a3 + 102);
    *((_OWORD *)a4 + 21) = v10;
    v11 = *(_OWORD *)(a3 + 110);
    v12 = *(_OWORD *)(a3 + 114);
    v13 = *(_OWORD *)(a3 + 122);
    *((_OWORD *)a4 + 24) = *(_OWORD *)(a3 + 118);
    *((_OWORD *)a4 + 25) = v13;
    *((_OWORD *)a4 + 22) = v11;
    *((_OWORD *)a4 + 23) = v12;
    memcpy(&a4[2 * self->_numInternalLms], a3 + 80, 8 * self->_numBoundaryLms);
  }
  else
  {
    memcpy(v9, &a3[2 * self->_numInternalLms], 8 * self->_numBoundaryLms);
    v14 = *((_OWORD *)a3 + 21);
    *(_OWORD *)(a4 + 102) = *((_OWORD *)a3 + 20);
    *(_OWORD *)(a4 + 106) = v14;
    v15 = *((_OWORD *)a3 + 25);
    v17 = *((_OWORD *)a3 + 22);
    v16 = *((_OWORD *)a3 + 23);
    *(_OWORD *)(a4 + 118) = *((_OWORD *)a3 + 24);
    *(_OWORD *)(a4 + 122) = v15;
    *(_OWORD *)(a4 + 110) = v17;
    *(_OWORD *)(a4 + 114) = v16;
  }
}

- (void)projectAndUpdateBoundary
{
  -[VCPFaceShapeModel project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:](self, "project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:", self->_curMesh, self->_intrinsicMatrix, self->_extrinsicMatrix, self->_numVertices, self->_cur2D);
  self->_boundaryLmUpdated = 0;
  -[VCPFaceShapeModel updateBoundaryLandmarkCoordinates:pts2D:lm2D:lm3dPos:](self, "updateBoundaryLandmarkCoordinates:pts2D:lm2D:lm3dPos:", self->_curMesh, self->_cur2D, self->_LM2D, self->_LM3D);
}

- (void)updateMeshAndLm3dAfterExpressionChange
{
  -[VCPFaceTensorModel calculateMesh:numVertices:blendshapes:outputMesh:](self->_tensorModel, "calculateMesh:numVertices:blendshapes:outputMesh:", self->_curExprWeights, self->_numVertices, self->_curBlendshapes, self->_curMesh);
  -[VCPFaceTensorModel calculateMesh:numVertices:blendshapes:outputMesh:](self->_tensorModel, "calculateMesh:numVertices:blendshapes:outputMesh:", self->_curExprWeights, 63, self->_lm3dBlendshapes, self->_LM3D);
}

- (void)resetIdentityAndExpressions
{
  float *curExprWeights;

  bzero(self->_curCoeff, 0x7D4uLL);
  curExprWeights = self->_curExprWeights;
  *(_OWORD *)(curExprWeights + 47) = 0u;
  *((_OWORD *)curExprWeights + 10) = 0u;
  *((_OWORD *)curExprWeights + 11) = 0u;
  *((_OWORD *)curExprWeights + 8) = 0u;
  *((_OWORD *)curExprWeights + 9) = 0u;
  *((_OWORD *)curExprWeights + 6) = 0u;
  *((_OWORD *)curExprWeights + 7) = 0u;
  *((_OWORD *)curExprWeights + 4) = 0u;
  *((_OWORD *)curExprWeights + 5) = 0u;
  *((_OWORD *)curExprWeights + 2) = 0u;
  *((_OWORD *)curExprWeights + 3) = 0u;
  *(_OWORD *)curExprWeights = 0u;
  *((_OWORD *)curExprWeights + 1) = 0u;
  memcpy(self->_curMesh, -[VCPFaceTensorModel meanBlendshape](self->_tensorModel, "meanBlendshape"), 12 * self->_numVertices);
  memcpy(self->_curBlendshapes, -[VCPFaceTensorModel meanBlendshape](self->_tensorModel, "meanBlendshape"), 624 * self->_numVertices);
  memcpy(self->_lm3dBlendshapes, self->_lm3dMeanBlendshapes, 0x9990uLL);
  memcpy(self->_LM3D, self->_lm3dMeanBlendshapes, 12 * self->_numInternalLms);
  self->_identityInit = 0;
  self->_detectionModeCounterShapeModel = 0;
  self->_numFrmsSinceLastShapeUpdate = 41;
  self->_eulerAngle[0] = 0.0;
  *(_QWORD *)&self->_eulerAngle[1] = 0;
}

- (void)updateIdentityShape:(float *)a3
{
  __int128 v5;
  float *curExprWeights;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  NSObject *updateShapeGroup;
  NSObject *updateShapeQueue;
  _QWORD block[5];

  if (fabsf(self->_eulerAngle[0]) <= 20.0
    && fabsf(self->_eulerAngle[1]) <= 20.0
    && self->_numFrmsSinceLastShapeUpdate >= 41
    && !self->_shapeUpdateInProgress)
  {
    -[VCPFaceShapeModel updateBoundaryLmForShapeOptimization](self, "updateBoundaryLmForShapeOptimization");
    memcpy(self->_asyncBlendshapes, self->_curBlendshapes, 624 * self->_numVertices);
    memcpy(self->_asyncLmBlendshapes, self->_lm3dBlendshapes, 0x9990uLL);
    *(_OWORD *)self->_asyncExtMat = *(_OWORD *)self->_extrinsicMatrix;
    v5 = *(_OWORD *)&self->_extrinsicMatrix[8];
    *(_OWORD *)&self->_asyncExtMat[4] = *(_OWORD *)&self->_extrinsicMatrix[4];
    *(_OWORD *)&self->_asyncExtMat[8] = v5;
    memcpy(self->_asyncLm2d, a3, sizeof(self->_asyncLm2d));
    curExprWeights = self->_curExprWeights;
    *(_OWORD *)self->_asyncWeights = *(_OWORD *)curExprWeights;
    v7 = *((_OWORD *)curExprWeights + 4);
    v9 = *((_OWORD *)curExprWeights + 1);
    v8 = *((_OWORD *)curExprWeights + 2);
    *(_OWORD *)&self->_asyncWeights[12] = *((_OWORD *)curExprWeights + 3);
    *(_OWORD *)&self->_asyncWeights[16] = v7;
    *(_OWORD *)&self->_asyncWeights[4] = v9;
    *(_OWORD *)&self->_asyncWeights[8] = v8;
    v10 = *((_OWORD *)curExprWeights + 8);
    v12 = *((_OWORD *)curExprWeights + 5);
    v11 = *((_OWORD *)curExprWeights + 6);
    *(_OWORD *)&self->_asyncWeights[28] = *((_OWORD *)curExprWeights + 7);
    *(_OWORD *)&self->_asyncWeights[32] = v10;
    *(_OWORD *)&self->_asyncWeights[20] = v12;
    *(_OWORD *)&self->_asyncWeights[24] = v11;
    v14 = *((_OWORD *)curExprWeights + 10);
    v13 = *((_OWORD *)curExprWeights + 11);
    v15 = *((_OWORD *)curExprWeights + 9);
    *(_OWORD *)&self->_asyncWeights[47] = *(_OWORD *)(curExprWeights + 47);
    *(_OWORD *)&self->_asyncWeights[40] = v14;
    *(_OWORD *)&self->_asyncWeights[44] = v13;
    *(_OWORD *)&self->_asyncWeights[36] = v15;
    if (self->_processingMode == 2)
    {
      -[VCPFaceShapeModel updateShapeCoeff:extrinsicMatrix:pts2D:exprWeights:outputblendshapes:](self, "updateShapeCoeff:extrinsicMatrix:pts2D:exprWeights:outputblendshapes:", self->_asyncLmBlendshapes, self->_asyncExtMat, self->_asyncLm2d);
      memcpy(self->_curBlendshapes, self->_asyncBlendshapes, 624 * self->_numVertices);
      memcpy(self->_lm3dBlendshapes, self->_asyncLmBlendshapes, 0x9990uLL);
    }
    else
    {
      updateShapeGroup = self->_updateShapeGroup;
      updateShapeQueue = self->_updateShapeQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__VCPFaceShapeModel_updateIdentityShape___block_invoke;
      block[3] = &unk_1E6B15468;
      block[4] = self;
      dispatch_group_async(updateShapeGroup, updateShapeQueue, block);
    }
    self->_numFrmsSinceLastShapeUpdate = 0;
  }
}

void *__41__VCPFaceShapeModel_updateIdentityShape___block_invoke(uint64_t a1)
{
  void *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1636) = 1;
  objc_msgSend(*(id *)(a1 + 32), "updateShapeCoeff:extrinsicMatrix:pts2D:exprWeights:outputblendshapes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1672), *(_QWORD *)(a1 + 32) + 1680, *(_QWORD *)(a1 + 32) + 1728, *(_QWORD *)(a1 + 32) + 2232, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1664));
  memcpy(*(void **)(*(_QWORD *)(a1 + 32) + 128), *(const void **)(*(_QWORD *)(a1 + 32) + 1664), 624 * *(int *)(*(_QWORD *)(a1 + 32) + 16));
  result = memcpy(*(void **)(*(_QWORD *)(a1 + 32) + 1608), *(const void **)(*(_QWORD *)(a1 + 32) + 1672), 0x9990uLL);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1636) = 0;
  return result;
}

- (BOOL)trackFaceMesh:(float *)a3
{
  float *LM2D;
  _BOOL4 v6;
  float *prevExprWeights;
  float *curExprWeights;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  LM2D = self->_LM2D;
  -[VCPFaceShapeModel moveBoundaryLandmarks:output:isInput:](self, "moveBoundaryLandmarks:output:isInput:", a3, self->_LM2D, 1);
  -[VCPFaceTensorModel calculateMesh:numVertices:blendshapes:outputMesh:](self->_tensorModel, "calculateMesh:numVertices:blendshapes:outputMesh:", self->_curExprWeights, self->_numVertices, self->_curBlendshapes, self->_curMesh);
  -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
  v6 = -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 2, 1, 1);
  if (v6)
  {
    -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
    -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 4, 1, 0);
    -[VCPFaceShapeModel project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:](self, "project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:", self->_curMesh, self->_intrinsicMatrix, self->_extrinsicMatrix, self->_numVertices, self->_cur2D);
    self->_boundaryLmUpdated = 0;
    -[VCPFaceShapeModel updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:](self, "updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:", self->_curBlendshapes, 52, self->_cur2D, LM2D, self->_lm3dBlendshapes);
    -[VCPFaceShapeModel calculateBlendshapeWeights:prevWeights:lmBlendshapes:maxIter:](self, "calculateBlendshapeWeights:prevWeights:lmBlendshapes:maxIter:", self->_curExprWeights, self->_prevExprWeights, self->_lm3dBlendshapes, 5);
    curExprWeights = self->_curExprWeights;
    prevExprWeights = self->_prevExprWeights;
    v9 = *((_OWORD *)curExprWeights + 4);
    v11 = *((_OWORD *)curExprWeights + 1);
    v10 = *((_OWORD *)curExprWeights + 2);
    *((_OWORD *)prevExprWeights + 3) = *((_OWORD *)curExprWeights + 3);
    *((_OWORD *)prevExprWeights + 4) = v9;
    *((_OWORD *)prevExprWeights + 1) = v11;
    *((_OWORD *)prevExprWeights + 2) = v10;
    v12 = *((_OWORD *)curExprWeights + 8);
    v14 = *((_OWORD *)curExprWeights + 5);
    v13 = *((_OWORD *)curExprWeights + 6);
    *((_OWORD *)prevExprWeights + 7) = *((_OWORD *)curExprWeights + 7);
    *((_OWORD *)prevExprWeights + 8) = v12;
    *((_OWORD *)prevExprWeights + 5) = v14;
    *((_OWORD *)prevExprWeights + 6) = v13;
    v16 = *((_OWORD *)curExprWeights + 10);
    v15 = *((_OWORD *)curExprWeights + 11);
    v17 = *((_OWORD *)curExprWeights + 9);
    *(_OWORD *)(prevExprWeights + 47) = *(_OWORD *)(curExprWeights + 47);
    *((_OWORD *)prevExprWeights + 10) = v16;
    *((_OWORD *)prevExprWeights + 11) = v15;
    *((_OWORD *)prevExprWeights + 9) = v17;
    *(_OWORD *)prevExprWeights = *(_OWORD *)curExprWeights;
    -[VCPFaceShapeModel updateMeshAndLm3dAfterExpressionChange](self, "updateMeshAndLm3dAfterExpressionChange");
    -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
    -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 1, 1, 0);
    -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
    -[VCPFaceShapeModel project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:](self, "project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:", self->_LM3D, self->_intrinsicMatrix, self->_extrinsicMatrix, 63, LM2D);
    -[VCPFaceShapeModel moveBoundaryLandmarks:output:isInput:](self, "moveBoundaryLandmarks:output:isInput:", LM2D, a3, 0);
    ++self->_numFrmsSinceLastShapeUpdate;
  }
  return v6;
}

- (void)updateShapeCoeff:(float *)a3 extrinsicMatrix:(float *)a4 pts2D:(float *)a5 exprWeights:(float *)a6 outputblendshapes:(float *)a7
{
  float *v10;

  LODWORD(v10) = 5;
  -[VCPFaceShapeModel calculateIdentityCoefficients:extrinsicMatrix:pts2D:exprWeights:lm3DMeanBlendshapes:lm3DComponents:maxIter:](self, "calculateIdentityCoefficients:extrinsicMatrix:pts2D:exprWeights:lm3DMeanBlendshapes:lm3DComponents:maxIter:", self->_curCoeff, a4, a5, a6, self->_lm3dMeanBlendshapes, self->_lm3dBlendshapeComponents, v10);
  -[VCPFaceTensorModel calculateModelBlendshapes:outputBlendshapes:](self->_tensorModel, "calculateModelBlendshapes:outputBlendshapes:", self->_curCoeff, a7);
  CalculateBlendshapes(self->_curCoeff, self->_transformedCoeff, self->_blendShapeDelta, 63, 501, 52, -[VCPFaceTensorModel tensorCoeff](self->_tensorModel, "tensorCoeff"), self->_lm3dMeanBlendshapes, self->_lm3dBlendshapeComponents, -[VCPFaceTensorModel blendshapeComponentIndex](self->_tensorModel, "blendshapeComponentIndex"), a3);
  self->_identityInit = 1;
}

- (void)updateBoundaryLmForShapeOptimization
{
  -[VCPFaceShapeModel updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:](self, "updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:", -[VCPFaceTensorModel meanBlendshape](self->_tensorModel, "meanBlendshape"), 52, self->_cur2D, self->_LM2D, self->_lm3dMeanBlendshapes);
  -[VCPFaceShapeModel updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:](self, "updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:", self->_curBlendshapes, 52, self->_cur2D, self->_LM2D, self->_lm3dBlendshapes);
  -[VCPFaceShapeModel updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:](self, "updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:", -[VCPFaceTensorModel componentsBlendshape](self->_tensorModel, "componentsBlendshape"), 501, self->_cur2D, self->_LM2D, self->_lm3dBlendshapeComponents);
}

- (void)reestimateProjectionMatrixPnP
{
  -[VCPFaceShapeModel calculatePosePnpSolver:](self, "calculatePosePnpSolver:", self->_numInternalLms);
  -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
  -[VCPFaceShapeModel calculatePosePnpSolver:](self, "calculatePosePnpSolver:", 63);
}

- (BOOL)fitOneImage:(float *)a3
{
  float *LM2D;
  int detectionModeCounterShapeModel;
  _BOOL4 v6;
  BOOL result;
  BOOL v8;
  _BOOL4 v9;
  _BOOL4 v10;
  float *prevExprWeights;
  float *curExprWeights;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  ++self->_detectionModeCounterShapeModel;
  LM2D = self->_LM2D;
  -[VCPFaceShapeModel moveBoundaryLandmarks:output:isInput:](self, "moveBoundaryLandmarks:output:isInput:", a3, self->_LM2D, 1);
  detectionModeCounterShapeModel = self->_detectionModeCounterShapeModel;
  if (detectionModeCounterShapeModel > 3)
  {
    if (detectionModeCounterShapeModel != 4)
      -[VCPFaceShapeModel reestimateProjectionMatrixPnP](self, "reestimateProjectionMatrixPnP");
  }
  else if (!self->_identityInit)
  {
    -[VCPFaceShapeModel reestimateProjectionMatrixPnP](self, "reestimateProjectionMatrixPnP");
    -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
    v6 = -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 2, 0, 1);
    result = 0;
    if (!v6)
      return result;
    -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
    v8 = -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 5, 0, 0);
    result = 0;
    if (!v8)
      return result;
    return 1;
  }
  -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
  v9 = -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 2, 0, 0);
  result = 0;
  if (v9)
  {
    -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
    v10 = -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 5, 0, 0);
    result = 0;
    if (v10)
    {
      -[VCPFaceShapeModel project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:](self, "project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:", self->_curMesh, self->_intrinsicMatrix, self->_extrinsicMatrix, self->_numVertices, self->_cur2D);
      self->_boundaryLmUpdated = 0;
      -[VCPFaceShapeModel updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:](self, "updateBoundary3dLandmarkBlendshapes:numBlendshapes:pts2D:lm2D:lmBlendshapes:", self->_curBlendshapes, 52, self->_cur2D, LM2D, self->_lm3dBlendshapes);
      -[VCPFaceShapeModel calculateBlendshapeWeights:prevWeights:lmBlendshapes:maxIter:](self, "calculateBlendshapeWeights:prevWeights:lmBlendshapes:maxIter:", self->_curExprWeights, 0, self->_lm3dBlendshapes, 15);
      curExprWeights = self->_curExprWeights;
      prevExprWeights = self->_prevExprWeights;
      v13 = *((_OWORD *)curExprWeights + 4);
      v15 = *((_OWORD *)curExprWeights + 1);
      v14 = *((_OWORD *)curExprWeights + 2);
      *((_OWORD *)prevExprWeights + 3) = *((_OWORD *)curExprWeights + 3);
      *((_OWORD *)prevExprWeights + 4) = v13;
      *((_OWORD *)prevExprWeights + 1) = v15;
      *((_OWORD *)prevExprWeights + 2) = v14;
      v16 = *((_OWORD *)curExprWeights + 8);
      v18 = *((_OWORD *)curExprWeights + 5);
      v17 = *((_OWORD *)curExprWeights + 6);
      *((_OWORD *)prevExprWeights + 7) = *((_OWORD *)curExprWeights + 7);
      *((_OWORD *)prevExprWeights + 8) = v16;
      *((_OWORD *)prevExprWeights + 5) = v18;
      *((_OWORD *)prevExprWeights + 6) = v17;
      v20 = *((_OWORD *)curExprWeights + 10);
      v19 = *((_OWORD *)curExprWeights + 11);
      v21 = *((_OWORD *)curExprWeights + 9);
      *(_OWORD *)(prevExprWeights + 47) = *(_OWORD *)(curExprWeights + 47);
      *((_OWORD *)prevExprWeights + 10) = v20;
      *((_OWORD *)prevExprWeights + 11) = v19;
      *((_OWORD *)prevExprWeights + 9) = v21;
      *(_OWORD *)prevExprWeights = *(_OWORD *)curExprWeights;
      -[VCPFaceShapeModel updateMeshAndLm3dAfterExpressionChange](self, "updateMeshAndLm3dAfterExpressionChange");
      -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
      -[VCPFaceShapeModel optimizeProjectionMatrix:tracking:firstPass:](self, "optimizeProjectionMatrix:tracking:firstPass:", 2, 0, 0);
      -[VCPFaceShapeModel project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:](self, "project3Dto2D:intrinsinc:extrinsic:numVert:out2dpts:", self->_curMesh, self->_intrinsicMatrix, self->_extrinsicMatrix, self->_numVertices, self->_cur2D);
      self->_boundaryLmUpdated = 0;
      if (!self->_identityInit)
        -[VCPFaceShapeModel updateIdentityShape:](self, "updateIdentityShape:", LM2D);
      return 1;
    }
  }
  return result;
}

- (void)calculateBlendshapeWeights:(float *)a3 prevWeights:(float *)a4 lmBlendshapes:(float *)a5 maxIter:(int)a6
{
  float *v11;
  BOOL v12;
  _QWORD *v13;
  float *LM2D;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  float v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27[4];
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54[4];
  uint64_t v55[2];
  _BYTE v56[24];
  _BYTE *v57;
  _BYTE v58[24];
  _BYTE *v59;
  float __C[12];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  matrix_multiplication(self->_intrinsicMatrix, self->_extrinsicMatrix, __C, 3, 3, 4);
  if (a4)
    v11 = a4;
  else
    v11 = a3;
  v12 = a4 != 0;
  v13 = operator new(0x38uLL);
  LM2D = self->_LM2D;
  *v13 = &unk_1E6B14490;
  v13[1] = LossFuncExpr;
  v13[2] = v11;
  v13[3] = a5;
  v13[4] = __C;
  v13[5] = LM2D;
  *((_BYTE *)v13 + 48) = v12;
  v59 = v13;
  v15 = operator new(0x38uLL);
  *v15 = &unk_1E6B14388;
  v15[1] = CloseFormDerivativeLossExpr;
  v15[2] = v11;
  v15[3] = a5;
  v15[4] = __C;
  v15[5] = LM2D;
  *((_BYTE *)v15 + 48) = v12;
  v57 = v15;
  v55[1] = (uint64_t)&unk_1E6B14270;
  v16 = operator new[]();
  v17 = 0;
  v55[0] = v16;
  do
  {
    *(double *)(v16 + 8 * v17) = a3[v17];
    ++v17;
  }
  while (v17 != 51);
  dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,51l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v54, v55);
  if (!v59)
    std::__throw_bad_function_call[abi:ne180100]();
  v18 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v59 + 48))(v59, v54);
  if (v54[0])
    MEMORY[0x1BCCA128C](v54[0], 0x1000C8000313F17);
  v33[0] = &unk_1E6B141E0;
  v33[1] = &unk_1E6B14240;
  v33[2] = 0;
  v34 = 1;
  v35 = 0;
  v36 = 5;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = &unk_1E6B14270;
  v41 = 0;
  v42 = 0;
  v43 = &unk_1E6B14270;
  v44 = 0;
  v45 = 0;
  v46 = &unk_1E6B14270;
  v49 = 0;
  v50 = &unk_1E6B14270;
  v48 = 0u;
  v47 = 0u;
  v51 = 0;
  v52 = 0;
  v53 = &unk_1E6B14270;
  v28 = 0;
  v29 = 0x3FF0000000000000;
  v30 = a6;
  v31 = 0;
  v32 = 0;
  dlib::find_min_box_constrained<dlib::lbfgs_search_strategy,dlib::objective_delta_stop_strategy,std::function<double ()(dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>)>,std::function<dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout> ()(dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>)>,dlib::matrix<double,51l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>((dlib::lbfgs_search_strategy *)v33, (uint64_t)&v28, (uint64_t)v58, (uint64_t)v56, v55, 0.0, 1.0);
  dlib::lbfgs_search_strategy::~lbfgs_search_strategy((dlib::lbfgs_search_strategy *)v33);
  dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,51l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v27, v55);
  if (!v59)
    std::__throw_bad_function_call[abi:ne180100]();
  v19 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v59 + 48))(v59, v27);
  if (v27[0])
    MEMORY[0x1BCCA128C](v27[0], 0x1000C8000313F17);
  v20 = v55[0];
  if (v19 <= v18)
  {
    for (i = 0; i != 51; ++i)
    {
      v22 = *(double *)(v20 + 8 * i);
      a3[i] = v22;
    }
    goto LABEL_17;
  }
  if (v55[0])
LABEL_17:
    MEMORY[0x1BCCA128C](v20, 0x1000C8000313F17);
  v23 = v57;
  if (v57 == v56)
  {
    v24 = 4;
    v23 = v56;
  }
  else
  {
    if (!v57)
      goto LABEL_23;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_23:
  v25 = v59;
  if (v59 == v58)
  {
    v26 = 4;
    v25 = v58;
  }
  else
  {
    if (!v59)
      return;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
}

- (void)calculateIdentityCoefficients:(float *)a3 extrinsicMatrix:(float *)a4 pts2D:(float *)a5 exprWeights:(float *)a6 lm3DMeanBlendshapes:(float *)a7 lm3DComponents:(float *)a8 maxIter:(int)a9
{
  uint64_t v15;
  int v16;
  float v17;
  int v18;
  float *v19;
  float *v20;
  int *v21;
  _QWORD *v22;
  float *v23;
  int *v24;
  float *exprWeightDiagMatrix;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39[4];
  __int16 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66[4];
  uint64_t v67[2];
  _BYTE v68[24];
  _BYTE *v69;
  _BYTE v70[24];
  _BYTE *v71;
  float __C[12];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  matrix_multiplication(self->_intrinsicMatrix, a4, __C, 3, 3, 4);
  bzero(self->_exprWeightDiagMatrix, 0xF51E4uLL);
  v15 = 0;
  v16 = 0;
  do
  {
    if (v15)
      v17 = a6[(v15 - 1)];
    else
      v17 = 1.0;
    v18 = -[VCPFaceTensorModel blendshapeComponentIndex](self->_tensorModel, "blendshapeComponentIndex")[4 * v15];
    if (v18 >= 1)
    {
      v19 = &self->_exprWeightDiagMatrix[502 * v16];
      v16 += v18;
      do
      {
        *v19 = v17;
        v19 += 502;
        --v18;
      }
      while (v18);
    }
    ++v15;
  }
  while (v15 != 52);
  v20 = -[VCPFaceTensorModel tensorCoeff](self->_tensorModel, "tensorCoeff");
  v21 = -[VCPFaceTensorModel blendshapeComponentIndex](self->_tensorModel, "blendshapeComponentIndex");
  v22 = operator new(0x60uLL);
  *v22 = &unk_1E6B14438;
  v22[1] = LossFuncIdentity;
  v22[2] = a6;
  v22[3] = __C;
  v22[4] = a5;
  v22[5] = a3;
  *((_OWORD *)v22 + 3) = *(_OWORD *)&self->_transformedCoeff;
  v22[8] = v20;
  v22[9] = v21;
  v22[10] = a7;
  v22[11] = a8;
  v71 = v22;
  v23 = -[VCPFaceTensorModel tensorCoeff](self->_tensorModel, "tensorCoeff");
  v24 = -[VCPFaceTensorModel blendshapeComponentIndex](self->_tensorModel, "blendshapeComponentIndex");
  v38 = *(_OWORD *)&self->_transformedCoeff;
  exprWeightDiagMatrix = self->_exprWeightDiagMatrix;
  v26 = operator new(0x68uLL);
  *v26 = &unk_1E6B14330;
  v26[1] = CloseFormDerivativeLossIdentity;
  v26[2] = a6;
  v26[3] = __C;
  v26[4] = a5;
  v26[5] = a3;
  *((_OWORD *)v26 + 3) = v38;
  v26[8] = v23;
  v26[9] = v24;
  v26[10] = a7;
  v26[11] = a8;
  v26[12] = exprWeightDiagMatrix;
  v69 = v26;
  v67[1] = (uint64_t)&unk_1E6B14270;
  v27 = operator new[]();
  v28 = 0;
  v67[0] = v27;
  do
  {
    *(double *)(v27 + 8 * v28) = a3[v28];
    ++v28;
  }
  while (v28 != 501);
  dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,501l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v66, v67);
  if (!v71)
    std::__throw_bad_function_call[abi:ne180100]();
  v29 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v71 + 48))(v71, v66);
  if (v66[0])
    MEMORY[0x1BCCA128C](v66[0], 0x1000C8000313F17);
  if (v29 >= 200.0)
  {
    v45[0] = &unk_1E6B141E0;
    v45[1] = &unk_1E6B14240;
    v45[2] = 0;
    v46 = 1;
    v47 = 0;
    v48 = 5;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v52 = &unk_1E6B14270;
    v53 = 0;
    v54 = 0;
    v55 = &unk_1E6B14270;
    v56 = 0;
    v57 = 0;
    v58 = &unk_1E6B14270;
    v61 = 0;
    v62 = &unk_1E6B14270;
    v60 = 0u;
    v59 = 0u;
    v63 = 0;
    v64 = 0;
    v65 = &unk_1E6B14270;
    v40 = 0;
    v41 = 0x3FF0000000000000;
    v42 = a9;
    v43 = 0;
    v44 = 0;
    dlib::find_min<dlib::lbfgs_search_strategy,dlib::objective_delta_stop_strategy,std::function<double ()(dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>)>,std::function<dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout> ()(dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>)>,dlib::matrix<double,501l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>((uint64_t)v45, (uint64_t)&v40, (uint64_t)v70, (uint64_t)v68, v67, -1.0);
    dlib::lbfgs_search_strategy::~lbfgs_search_strategy((dlib::lbfgs_search_strategy *)v45);
    dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,501l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v39, v67);
    if (!v71)
      std::__throw_bad_function_call[abi:ne180100]();
    v30 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v71 + 48))(v71, v39);
    if (v39[0])
      MEMORY[0x1BCCA128C](v39[0], 0x1000C8000313F17);
    if (v30 <= v29)
    {
      v31 = 0;
      v32 = v67[0];
      do
      {
        v33 = *(double *)(v32 + 8 * v31);
        a3[v31++] = v33;
      }
      while (v31 != 501);
    }
  }
  if (v67[0])
    MEMORY[0x1BCCA128C](v67[0], 0x1000C8000313F17);
  v34 = v69;
  if (v69 == v68)
  {
    v35 = 4;
    v34 = v68;
  }
  else
  {
    if (!v69)
      goto LABEL_28;
    v35 = 5;
  }
  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_28:
  v36 = v71;
  if (v71 == v70)
  {
    v37 = 4;
    v36 = v70;
  }
  else
  {
    if (!v71)
      return;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
}

- (matrix<double,)getPoseParam
{
  double v3;
  double v4;

  *(float64x2_t *)retstr->var0.var0 = vcvtq_f64_f32(*(float32x2_t *)((char *)&self[6].var0.var0[1] + 4));
  v3 = *(float *)&self[5].var0.var0[3];
  retstr->var0.var0[2] = *((float *)&self[6].var0.var0[2] + 1);
  retstr->var0.var0[3] = v3;
  v4 = *(float *)&self[6].var0.var0[1];
  retstr->var0.var0[4] = *(float *)&self[5].var0.var0[5];
  retstr->var0.var0[5] = v4;
  return self;
}

- (BOOL)optimizeProjectionMatrix:(int)a3 tracking:(BOOL)a4 firstPass:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _QWORD *v9;
  double v10;
  float32x2_t *eulerAngle;
  double v12;
  unint64_t i;
  __int128 v14;
  double v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v26[4];
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53[4];
  uint64_t v54[4];
  uint64_t v55[4];
  uint64_t v56[4];
  float64x2_t v57;
  _BYTE v58[32];
  float32x2_t v59;
  float v60;
  _OWORD v61[3];
  _BYTE v62[24];
  _BYTE *v63;
  uint64_t v64;

  v5 = a5;
  v6 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  -[VCPFaceShapeModel getPoseParam](self, "getPoseParam");
  v9 = operator new(0x20uLL);
  *v9 = &unk_1E6B143E0;
  v9[1] = LossFuncProjectionMatrix;
  v9[2] = self->_LM2D;
  v9[3] = self->_LM3D;
  v63 = v9;
  dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,6l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v56, &v57);
  if (!v63)
    std::__throw_bad_function_call[abi:ne180100]();
  v10 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v63 + 48))(v63, v56);
  if (v56[0])
    MEMORY[0x1BCCA128C](v56[0], 0x1000C8000313F17);
  eulerAngle = (float32x2_t *)self->_eulerAngle;
  if (v5 && v10 > flt_1B6FBD9A8[fabsf(self->_eulerAngle[1]) > 32.0])
  {
    -[VCPFaceShapeModel calculatePosePnpSolver:](self, "calculatePosePnpSolver:", self->_numInternalLms);
    -[VCPFaceShapeModel getPoseParam](self, "getPoseParam");
    dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,6l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v55, v61);
    if (!v63)
      std::__throw_bad_function_call[abi:ne180100]();
    v12 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v63 + 48))(v63, v55);
    if (v55[0])
      MEMORY[0x1BCCA128C](v55[0], 0x1000C8000313F17);
    if (v12 > 12000.0)
    {
      -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
      -[VCPFaceShapeModel calculatePosePnpSolver:](self, "calculatePosePnpSolver:", 63);
      -[VCPFaceShapeModel getPoseParam](self, "getPoseParam");
      for (i = 0; i != 12; i += 4)
      {
        v14 = v61[i / 4];
        v61[i / 4] = *(_OWORD *)&v59.f32[i];
        *(_OWORD *)&v59.f32[i] = v14;
      }
      dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,6l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v54, v61);
      if (!v63)
        std::__throw_bad_function_call[abi:ne180100]();
      v12 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v63 + 48))(v63, v54);
      if (v54[0])
        MEMORY[0x1BCCA128C](v54[0], 0x1000C8000313F17);
    }
    if (v12 >= v10)
    {
      *eulerAngle = vcvt_f32_f64(v57);
      v15 = *(double *)&v58[24];
      v16 = *(double *)v58;
      self->_eulerAngle[2] = v16;
      v59 = vcvt_f32_f64(*(float64x2_t *)&v58[8]);
      v17 = v15;
      v60 = v17;
      GetRotationMatrixFromEulerAngle(self->_eulerAngle, self->_rotMatrix);
      *(float *)&v18 = CombineRotAndTransMat2Proj(self->_rotMatrix, (float *)&v59, self->_extrinsicMatrix);
      -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary", v18);
    }
    else
    {
      v57 = (float64x2_t)v61[0];
      *(_OWORD *)v58 = v61[1];
      *(_OWORD *)&v58[16] = v61[2];
      -[VCPFaceShapeModel projectAndUpdateBoundary](self, "projectAndUpdateBoundary");
      dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,6l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v53, &v57);
      if (!v63)
        std::__throw_bad_function_call[abi:ne180100]();
      v10 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v63 + 48))(v63, v53);
      if (v53[0])
        MEMORY[0x1BCCA128C](v53[0], 0x1000C8000313F17);
    }
  }
  if (v6)
  {
    if (v10 >= 300.0)
    {
      if (v10 >= 500.0)
      {
        if (v10 > 50000.0)
          a3 = 10;
      }
      else if (a3 >= 2)
      {
        a3 = 2;
      }
    }
    else
    {
      a3 = 1;
    }
  }
  v32[0] = &unk_1E6B141E0;
  v32[1] = &unk_1E6B14240;
  v32[2] = 0;
  v33 = 1;
  v34 = 0;
  v35 = 5;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = &unk_1E6B14270;
  v40 = 0;
  v41 = 0;
  v42 = &unk_1E6B14270;
  v43 = 0;
  v44 = 0;
  v45 = &unk_1E6B14270;
  v48 = 0;
  v49 = &unk_1E6B14270;
  v47 = 0u;
  v46 = 0u;
  v50 = 0;
  v51 = 0;
  v52 = &unk_1E6B14270;
  v27 = 0;
  v28 = 0x3FF0000000000000;
  v29 = a3;
  v30 = 0;
  v31 = 0;
  dlib::find_min_using_approximate_derivatives<dlib::lbfgs_search_strategy,dlib::objective_delta_stop_strategy,std::function<double ()(dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>)>,dlib::matrix<double,6l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>((uint64_t)v32, (uint64_t)&v27, (uint64_t)v62, (uint64_t *)&v57, -1.0, 0.0001);
  dlib::lbfgs_search_strategy::~lbfgs_search_strategy((dlib::lbfgs_search_strategy *)v32);
  dlib::matrix<double,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix<double,6l,1l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>(v26, &v57);
  if (!v63)
    std::__throw_bad_function_call[abi:ne180100]();
  v19 = (*(double (**)(_BYTE *, uint64_t *))(*(_QWORD *)v63 + 48))(v63, v26);
  if (v26[0])
    MEMORY[0x1BCCA128C](v26[0], 0x1000C8000313F17);
  if (v19 < v10)
  {
    *eulerAngle = vcvt_f32_f64(v57);
    v20 = *(double *)&v58[24];
    v21 = *(double *)v58;
    self->_eulerAngle[2] = v21;
    *(float32x2_t *)&v61[0] = vcvt_f32_f64(*(float64x2_t *)&v58[8]);
    v22 = v20;
    *((float *)v61 + 2) = v22;
    GetRotationMatrixFromEulerAngle(self->_eulerAngle, self->_rotMatrix);
    CombineRotAndTransMat2Proj(self->_rotMatrix, (float *)v61, self->_extrinsicMatrix);
  }
  v23 = v63;
  if (v63 == v62)
  {
    v24 = 4;
    v23 = v62;
    goto LABEL_37;
  }
  if (v63)
  {
    v24 = 5;
LABEL_37:
    (*(void (**)(void))(*v23 + 8 * v24))();
  }
  return v10 <= 100000.0;
}

- (void)calculatePosePnpSolver:(int)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;

  if (!-[VCPPnPSolver estimateExtrinsicsWith:andPoints3D:andNumPoints:](self->_poseSolver, "estimateExtrinsicsWith:andPoints3D:andNumPoints:", self->_LM2D, self->_LM3D, *(_QWORD *)&a3))
  {
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[0] = v4;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[1] = v5;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[2] = v6;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[3] = v7;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[4] = v8;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[5] = v9;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[6] = v10;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[7] = v11;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[8] = v12;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[9] = v13;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[10] = v14;
    -[VCPPnPSolver pose](self->_poseSolver, "pose");
    self->_extrinsicMatrix[11] = v15;
    *(_QWORD *)self->_rotMatrix = *(_QWORD *)self->_extrinsicMatrix;
    self->_rotMatrix[2] = self->_extrinsicMatrix[2];
    *(_QWORD *)&self->_rotMatrix[3] = *(_QWORD *)&self->_extrinsicMatrix[4];
    self->_rotMatrix[5] = self->_extrinsicMatrix[6];
    *(_QWORD *)&self->_rotMatrix[6] = *(_QWORD *)&self->_extrinsicMatrix[8];
    self->_rotMatrix[8] = self->_extrinsicMatrix[10];
    GetEulerAngleFromMatrix(self->_rotMatrix, (float32x2_t *)self->_eulerAngle);
  }
}

- (__n64)getPose
{
  __n64 result;

  result.n64_u32[0] = *(_DWORD *)(a1 + 252);
  result.n64_u32[1] = *(_DWORD *)(a1 + 268);
  return result;
}

- (id)blendShapes
{
  void *v3;
  unint64_t i;
  void *v5;
  double v6;
  void *v7;

  if (self->_curExprWeights)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 51; ++i)
    {
      VCPBlendShapeLocationFromIndex(i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        *(float *)&v6 = self->_curExprWeights[i];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v5);

      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)updateMeshVertices
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  v3 = 0x3FFFFFFFFFFFF1B4;
  do
  {
    *(float *)(*(_QWORD *)self->_meshVertices + v2) = self->_curMesh[v3 + 3660] / 1000.0;
    *(float *)(*(_QWORD *)self->_meshVertices + v2 + 4) = self->_curMesh[v3 + 3661] / 1000.0;
    *(float *)(*(_QWORD *)self->_meshVertices + v2 + 8) = self->_curMesh[v3 + 3662] / 1000.0;
    v2 += 16;
    v3 += 3;
  }
  while (v3 * 4);
}

- (int)processingMode
{
  return self->_processingMode;
}

- (void)setProcessingMode:(int)a3
{
  self->_processingMode = a3;
}

- (uint64_t)meshVertices
{
  return *(_QWORD *)(a1 + 2448);
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (int)detectionModeCounterShapeModel
{
  return self->_detectionModeCounterShapeModel;
}

- (void)setDetectionModeCounterShapeModel:(int)a3
{
  self->_detectionModeCounterShapeModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateShapeQueue, 0);
  objc_storeStrong((id *)&self->_updateShapeGroup, 0);
  objc_storeStrong((id *)&self->_poseSolver, 0);
  objc_storeStrong((id *)&self->_tensorModel, 0);
}

- (void)calculateBlendshapeWeights:(int)a1 prevWeights:lmBlendshapes:maxIter:.cold.1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1 >= 3 && OUTLINED_FUNCTION_3_0(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], v1, " VCPFaceShapeModel - caught exception in find_min_box_constrained()", v2, v3, v4, v5, 0);
}

- (void)calculateIdentityCoefficients:(int)a1 extrinsicMatrix:pts2D:exprWeights:lm3DMeanBlendshapes:lm3DComponents:maxIter:.cold.1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1 >= 3 && OUTLINED_FUNCTION_3_0(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], v1, "VCPFaceShapeModel - caught exception in find_min()", v2, v3, v4, v5, 0);
}

- (void)optimizeProjectionMatrix:(int)a1 tracking:firstPass:.cold.1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1 >= 3 && OUTLINED_FUNCTION_3_0(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0_1(&dword_1B6C4A000, MEMORY[0x1E0C81028], v1, " VCPFaceShapeModel - caught exception in find_min_using_approximate_derivatives()", v2, v3, v4, v5, 0);
}

@end
