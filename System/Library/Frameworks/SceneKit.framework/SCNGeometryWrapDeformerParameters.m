@implementation SCNGeometryWrapDeformerParameters

- (SCNGeometryWrapDeformerParameters)initWithDrivingNode:(__n128)a3 deformedNode:(__n128)a4 bindingMode:(__n128)a5 bindingTransform:(uint64_t)a6 drivingNodeUVChannel:(uint64_t)a7 deformedNodeUVChannel:(uint64_t)a8
{
  SCNGeometryWrapDeformerParameters *v16;
  SCNGeometryWrapDeformerParameters *v17;
  _QWORD v23[7];
  objc_super v24;

  v24.receiver = a1;
  v24.super_class = (Class)SCNGeometryWrapDeformerParameters;
  v16 = -[SCNGeometryWrapDeformerParameters init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_isLegacySingleLayerDeformer = 1;
    v16->_bindingMode = a9;
    *(__n128 *)v16->_anon_a0 = a2;
    *(__n128 *)&v16->_anon_a0[16] = a3;
    *(__n128 *)&v16->_anon_a0[32] = a4;
    *(__n128 *)&v16->_anon_a0[48] = a5;
    v16->_legacyDrivingNodeUVChannel = a10;
    v16->_legacyDeformedNodeUVChannel = a11;
    +[SCNTransaction begin](SCNTransaction, "begin");
    +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.0);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __142__SCNGeometryWrapDeformerParameters_initWithDrivingNode_deformedNode_bindingMode_bindingTransform_drivingNodeUVChannel_deformedNodeUVChannel___block_invoke;
    v23[3] = &unk_1EA5A17B0;
    v23[4] = v17;
    v23[5] = a7;
    v23[6] = a8;
    +[SCNTransaction enqueueCommandForObject:immediateTransactionBlock:](SCNTransaction, "enqueueCommandForObject:immediateTransactionBlock:", a8, v23);
    +[SCNTransaction commit](SCNTransaction, "commit");
  }
  return v17;
}

uint64_t __142__SCNGeometryWrapDeformerParameters_initWithDrivingNode_deformedNode_bindingMode_bindingTransform_drivingNodeUVChannel_deformedNodeUVChannel___block_invoke(id *a1)
{
  return objc_msgSend(a1[4], "initParametersIfNeededWithDrivingNodeRef:deformedNodeRef:", objc_msgSend(a1[5], "nodeRef"), objc_msgSend(a1[6], "nodeRef"));
}

- (SCNGeometryWrapDeformerParameters)initWithInnerLayerNode:(__n128)a3 outerLayerNode:(__n128)a4 deformedNode:(__n128)a5 bindingMode:(uint64_t)a6 bindingTransform:(uint64_t)a7
{
  SCNGeometryWrapDeformerParameters *v14;
  SCNGeometryWrapDeformerParameters *v15;
  _QWORD v21[8];
  objc_super v22;

  v22.receiver = a1;
  v22.super_class = (Class)SCNGeometryWrapDeformerParameters;
  v14 = -[SCNGeometryWrapDeformerParameters init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_bindingMode = a10;
    *(__n128 *)v14->_anon_a0 = a2;
    *(__n128 *)&v14->_anon_a0[16] = a3;
    *(__n128 *)&v14->_anon_a0[32] = a4;
    *(__n128 *)&v14->_anon_a0[48] = a5;
    +[SCNTransaction begin](SCNTransaction, "begin");
    +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.0);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __117__SCNGeometryWrapDeformerParameters_initWithInnerLayerNode_outerLayerNode_deformedNode_bindingMode_bindingTransform___block_invoke;
    v21[3] = &unk_1EA5A17D8;
    v21[4] = v15;
    v21[5] = a7;
    v21[6] = a8;
    v21[7] = a9;
    +[SCNTransaction enqueueCommandForObject:immediateTransactionBlock:](SCNTransaction, "enqueueCommandForObject:immediateTransactionBlock:", a9, v21);
    +[SCNTransaction commit](SCNTransaction, "commit");
  }
  return v15;
}

uint64_t __117__SCNGeometryWrapDeformerParameters_initWithInnerLayerNode_outerLayerNode_deformedNode_bindingMode_bindingTransform___block_invoke(id *a1)
{
  return objc_msgSend(a1[4], "initParametersIfNeededWithInnerLayerNodeRef:outerLayerNodeRef:deformedNodeRef:", objc_msgSend(a1[5], "nodeRef"), objc_msgSend(a1[6], "nodeRef"), objc_msgSend(a1[7], "nodeRef"));
}

- (void)dealloc
{
  objc_super v3;

  free(self->_bindingData.pointIndices);
  free(self->_bindingData.barycentricCoords);
  free(self->_bindingData.innerLayerInfluences);
  free(self->_bindingData.innerLayerTNBs);
  free(self->_bindingData.outerLayerTNBs);
  free(self->_bindingData.innerLayerOffsets);
  free(self->_bindingData.outerLayerOffsets);
  free(self->_bindingData.legacyOffsetsOrTransforms);
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryWrapDeformerParameters;
  -[SCNGeometryWrapDeformerParameters dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)bindingMode
{
  return self->_bindingMode;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t *p_legacyOffsetsOrTransformsLength;
  unint64_t legacyOffsetsOrTransformsLength;
  const __CFString *v7;
  unint64_t offsetsLength;

  objc_msgSend(a3, "encodeInt32:forKey:", self->_vertexCount, CFSTR("vertexCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_bindingMode), CFSTR("bindingMode"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_bindingData.pointIndicesStride), CFSTR("bindingPointIndicesStride"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_bindingData.barycentricCoordsStride), CFSTR("bindingBarycentricCoordsStride"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_bindingData.pointIndicesFormat), CFSTR("bindingPointIndicesFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_bindingData.barycentricCoordsFormat), CFSTR("bindingBarycentricCoordsFormat"));
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_bindingData.pointIndices, self->_bindingData.pointIndicesStride * self->_vertexCount, CFSTR("bindingPointIndices"));
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_bindingData.barycentricCoords, self->_bindingData.barycentricCoordsStride * self->_vertexCount, CFSTR("bindingBarycentricCoords"));
  if (self->_isLegacySingleLayerDeformer)
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("isLegacySingleLayerDeformer"));
    legacyOffsetsOrTransformsLength = self->_bindingData.legacyOffsetsOrTransformsLength;
    p_legacyOffsetsOrTransformsLength = &self->_bindingData.legacyOffsetsOrTransformsLength;
    objc_msgSend(a3, "encodeBytes:length:forKey:", *(p_legacyOffsetsOrTransformsLength - 1), legacyOffsetsOrTransformsLength, CFSTR("bindingOffsetsOrTransforms"));
    v7 = CFSTR("bindingOffsetsOrTransformsLength");
  }
  else
  {
    objc_msgSend(a3, "encodeBytes:length:forKey:", self->_bindingData.innerLayerInfluences, self->_bindingData.innerLayerInfluencesLength, CFSTR("bindingInnerLayerInfluences"));
    objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_bindingData.innerLayerInfluencesLength), CFSTR("bindingInnerLayerInfluencesLength"));
    if (self->_bindingMode != 1)
      return;
    objc_msgSend(a3, "encodeBytes:length:forKey:", self->_bindingData.innerLayerTNBs, self->_bindingData.tnbMatricesLength, CFSTR("bindingInnerTNBs"));
    objc_msgSend(a3, "encodeBytes:length:forKey:", self->_bindingData.outerLayerTNBs, self->_bindingData.tnbMatricesLength, CFSTR("bindingOuterTNBs"));
    objc_msgSend(a3, "encodeInt32:forKey:", LODWORD(self->_bindingData.tnbMatricesLength), CFSTR("bindingSpaceVectorsLength"));
    offsetsLength = self->_bindingData.offsetsLength;
    p_legacyOffsetsOrTransformsLength = &self->_bindingData.offsetsLength;
    objc_msgSend(a3, "encodeBytes:length:forKey:", *(p_legacyOffsetsOrTransformsLength - 2), offsetsLength, CFSTR("bindingInnerOffsets"));
    objc_msgSend(a3, "encodeBytes:length:forKey:", *(p_legacyOffsetsOrTransformsLength - 1), *p_legacyOffsetsOrTransformsLength, CFSTR("bindingOuterOffsets"));
    v7 = CFSTR("bindingOffsetsLength");
  }
  objc_msgSend(a3, "encodeInt32:forKey:", *(unsigned int *)p_legacyOffsetsOrTransformsLength, v7);
}

- (SCNGeometryWrapDeformerParameters)initWithCoder:(id)a3
{
  SCNGeometryWrapDeformerParameters *v4;
  uint64_t vertexCount;
  size_t v6;
  size_t v7;
  const void *v8;
  const void *v9;
  int v10;
  int v11;
  uint64_t v12;
  size_t v13;
  const void *v14;
  float *legacyOffsetsOrTransforms;
  int v16;
  const void *v17;
  int v18;
  const void *v19;
  const void *v20;
  int v21;
  const void *v22;
  uint64_t v23;
  size_t __n;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SCNGeometryWrapDeformerParameters;
  v4 = -[SCNGeometryWrapDeformerParameters init](&v26, sel_init);
  if (v4)
  {
    v4->_vertexCount = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("vertexCount"));
    v4->_bindingMode = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bindingMode"));
    v4->_bindingData.pointIndicesStride = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bindingPointIndicesStride"));
    v4->_bindingData.barycentricCoordsStride = (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bindingBarycentricCoordsStride"));
    v4->_bindingData.pointIndicesFormat = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bindingPointIndicesFormat"));
    v4->_bindingData.barycentricCoordsFormat = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bindingBarycentricCoordsFormat"));
    vertexCount = v4->_vertexCount;
    v6 = v4->_bindingData.pointIndicesStride * vertexCount;
    v7 = v4->_bindingData.barycentricCoordsStride * vertexCount;
    v4->_bindingData.pointIndices = malloc_type_malloc(v6, 0x6FF4546EuLL);
    v4->_bindingData.barycentricCoords = malloc_type_malloc(v7, 0xC143D459uLL);
    __n = 0;
    v8 = (const void *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingPointIndices"), &__n);
    if (__n != v6)
      -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.8();
    memcpy(v4->_bindingData.pointIndices, v8, v6);
    v9 = (const void *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingBarycentricCoords"), &__n);
    if (__n != v7)
      -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.7();
    memcpy(v4->_bindingData.barycentricCoords, v9, v7);
    v10 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isLegacySingleLayerDeformer"));
    v4->_isLegacySingleLayerDeformer = v10;
    if (v10)
    {
      v11 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bindingOffsetsOrTransformsLength"));
      v4->_bindingData.legacyOffsetsOrTransformsLength = v11;
      v4->_bindingData.legacyOffsetsOrTransforms = (float *)malloc_type_malloc(v11, 0xAE8E491uLL);
      __n = 0;
      v12 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingOffsetsOrTransforms"), &__n);
      v13 = __n;
      if (__n != v4->_bindingData.legacyOffsetsOrTransformsLength)
        -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.1();
      v14 = (const void *)v12;
      legacyOffsetsOrTransforms = v4->_bindingData.legacyOffsetsOrTransforms;
LABEL_14:
      memcpy(legacyOffsetsOrTransforms, v14, v13);
      return v4;
    }
    v16 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bindingInnerLayerInfluencesLength"));
    v4->_bindingData.innerLayerInfluencesLength = v16;
    v4->_bindingData.innerLayerInfluences = (float *)malloc_type_malloc(v16, 0x88916601uLL);
    __n = 0;
    v17 = (const void *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingInnerLayerInfluences"), &__n);
    if (__n != v4->_bindingData.innerLayerInfluencesLength)
      -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.6();
    memcpy(v4->_bindingData.innerLayerInfluences, v17, __n);
    if (v4->_bindingMode == 1)
    {
      v18 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bindingSpaceVectorsLength"));
      v4->_bindingData.tnbMatricesLength = v18;
      v4->_bindingData.innerLayerTNBs = (float *)malloc_type_malloc(v18, 0x76B5D387uLL);
      v4->_bindingData.outerLayerTNBs = (float *)malloc_type_malloc(v4->_bindingData.tnbMatricesLength, 0xFEFA8B55uLL);
      __n = 0;
      v19 = (const void *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingInnerTNBs"), &__n);
      if (__n != v4->_bindingData.tnbMatricesLength)
        -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.5();
      memcpy(v4->_bindingData.innerLayerTNBs, v19, __n);
      v20 = (const void *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingOuterTNBs"), &__n);
      if (__n != v4->_bindingData.tnbMatricesLength)
        -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.4();
      memcpy(v4->_bindingData.outerLayerTNBs, v20, __n);
      v21 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("bindingOffsetsLength"));
      v4->_bindingData.offsetsLength = v21;
      v4->_bindingData.innerLayerOffsets = (float *)malloc_type_malloc(v21, 0x8B1D5943uLL);
      v4->_bindingData.outerLayerOffsets = (float *)malloc_type_malloc(v4->_bindingData.offsetsLength, 0x84C0860AuLL);
      v22 = (const void *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingInnerOffsets"), &__n);
      if (__n != v4->_bindingData.offsetsLength)
        -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.3();
      memcpy(v4->_bindingData.innerLayerOffsets, v22, __n);
      v23 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bindingOuterOffsets"), &__n);
      v13 = __n;
      if (__n != v4->_bindingData.offsetsLength)
        -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.2();
      v14 = (const void *)v23;
      legacyOffsetsOrTransforms = v4->_bindingData.outerLayerOffsets;
      goto LABEL_14;
    }
  }
  return v4;
}

- (void)initParametersIfNeededWithDrivingNodeRef:(__C3DNode *)a3 deformedNodeRef:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t Geometry;
  uint64_t Mesh;
  uint64_t v9;
  uint64_t v10;
  const void *PositionSource;
  const void *v12;
  unsigned int Count;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  const void *SourceWithSemanticAtIndex;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ChannelForSourceWithSemanticAtIndex;
  uint64_t v38;
  uint64_t v39;

  if (!self->_vertexCount)
  {
    v4 = v3;
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.legacyOffsetsOrTransforms);
    Geometry = C3DNodeGetGeometry((uint64_t)a3);
    Mesh = C3DGeometryGetMesh(Geometry);
    v9 = C3DNodeGetGeometry(v4);
    v10 = C3DGeometryGetMesh(v9);
    PositionSource = C3DMeshGetPositionSource(Mesh, 0);
    v12 = C3DMeshGetPositionSource(v10, 0);
    ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(Mesh, 0, 0);
    v36 = C3DMeshGetChannelForSourceWithSemanticAtIndex(v10, 0, 0);
    v38 = (uint64_t)v12;
    Count = C3DMeshSourceGetCount((uint64_t)v12);
    self->_vertexCount = Count;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_1DD02A640;
    v14 = malloc_type_malloc(4 * (Count & 0x7FFFFFFF), 0x1000040BDFB0063uLL);
    self->_bindingData.barycentricCoords = v14;
    v15 = C3DMeshSourceGetCount((uint64_t)PositionSource) - 1;
    v16 = 1;
    if (v15 > 0xFF)
      v16 = 2;
    v17 = HIWORD(v15);
    if (HIWORD(v15))
      v18 = 4;
    else
      v18 = v16;
    v19 = 3 << (v15 > 0xFF);
    if (v17)
      v19 = 12;
    self->_bindingData.pointIndicesStride = v19;
    v20 = malloc_type_malloc(v19 * (unint64_t)self->_vertexCount, 0x7AFBD8ACuLL);
    self->_bindingData.pointIndices = v20;
    v39 = (uint64_t)PositionSource;
    v35 = (uint64_t)v14;
    if (v18 == 1)
    {
      v22 = 0;
      v23 = 2;
      v21 = (uint64_t)v20;
    }
    else
    {
      v21 = 0;
      if (v18 == 2)
      {
        v23 = 14;
        v22 = (uint64_t)v20;
      }
      else
      {
        v22 = 0;
        v23 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v23;
    if (v17)
      v24 = (uint64_t)v20;
    else
      v24 = 0;
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(Mesh, 3, self->_legacyDrivingNodeUVChannel, 0);
    if (!SourceWithSemanticAtIndex)
    {
      v26 = scn_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        -[SCNGeometryWrapDeformerParameters initParametersIfNeededWithDrivingNodeRef:deformedNodeRef:].cold.2(v26, v27, v28);
    }
    v29 = C3DMeshGetSourceWithSemanticAtIndex(v10, 3, self->_legacyDeformedNodeUVChannel, 0);
    if (!v29)
    {
      v30 = scn_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[SCNGeometryWrapDeformerParameters initParametersIfNeededWithDrivingNodeRef:deformedNodeRef:].cold.1(v30, v31, v32);
    }
    v33 = C3DMeshGetChannelForSourceWithSemanticAtIndex(Mesh, 3, self->_legacyDrivingNodeUVChannel);
    v34 = C3DMeshGetChannelForSourceWithSemanticAtIndex(v10, 3, self->_legacyDeformedNodeUVChannel);
    C3DWrapDeformerComputeBindingPointIndicesAndBarycentricCoordsFromUVs(self->_bindingMode, self->_vertexCount, v10, Mesh, v38, v39, (uint64_t)v29, (uint64_t)SourceWithSemanticAtIndex, *(float32x4_t *)self->_anon_a0, *(float32x4_t *)&self->_anon_a0[16], *(float32x4_t *)&self->_anon_a0[32], *(float32x4_t *)&self->_anon_a0[48], v36, v34, ChannelForSourceWithSemanticAtIndex, v33, 0, v21, v22,
      v24,
      0,
      v35,
      &self->_bindingData.legacyOffsetsOrTransforms,
      &self->_bindingData.legacyOffsetsOrTransformsLength);
  }
}

- (void)initParametersIfNeededWithInnerLayerNodeRef:(SCNGeometryWrapDeformerParameters *)self outerLayerNodeRef:(SEL)a2 deformedNodeRef:(__C3DNode *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Geometry;
  uint64_t Mesh;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  unsigned int Count;
  void *v17;
  uint64_t v18;
  char v19;
  int v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  float *v35;
  uint64_t v36;
  uint64_t ChannelForSourceWithSemanticAtIndex;
  uint64_t v38;
  const void *v39;
  const void *PositionSource;
  int v41;

  if (!self->_vertexCount)
  {
    v5 = v4;
    v6 = v3;
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.innerLayerInfluences);
    free(self->_bindingData.innerLayerTNBs);
    free(self->_bindingData.outerLayerTNBs);
    free(self->_bindingData.innerLayerOffsets);
    free(self->_bindingData.outerLayerOffsets);
    Geometry = C3DNodeGetGeometry((uint64_t)a3);
    Mesh = C3DGeometryGetMesh(Geometry);
    v11 = C3DNodeGetGeometry(v6);
    v12 = C3DGeometryGetMesh(v11);
    v13 = C3DNodeGetGeometry(v5);
    v14 = C3DGeometryGetMesh(v13);
    PositionSource = C3DMeshGetPositionSource(Mesh, 0);
    v39 = C3DMeshGetPositionSource(v12, 0);
    v41 = v14;
    v15 = C3DMeshGetPositionSource(v14, 0);
    ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(Mesh, 0, 0);
    v36 = C3DMeshGetChannelForSourceWithSemanticAtIndex(v12, 0, 0);
    v38 = (uint64_t)v15;
    Count = C3DMeshSourceGetCount((uint64_t)v15);
    self->_vertexCount = Count;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_1DD02A650;
    v17 = malloc_type_malloc(8 * (Count & 0x7FFFFFFF), 0x100004052888210uLL);
    v18 = 0;
    self->_bindingData.barycentricCoords = v17;
    v19 = 1;
    do
    {
      v20 = v19 & 1;
      if ((v19 & 1) != 0)
        v21 = Mesh;
      else
        v21 = v12;
      v22 = C3DMeshGetPositionSource(v21, 0);
      v23 = C3DMeshSourceGetCount((uint64_t)v22);
      v19 = 0;
      if (v18 <= v23)
        v18 = v23;
    }
    while (v20);
    v24 = v18 - 1;
    v25 = 1;
    if ((v18 - 1) > 0xFF)
      v25 = 2;
    v26 = HIWORD(v24);
    if (HIWORD(v24))
      v27 = 4;
    else
      v27 = v25;
    v28 = 3 << ((v18 - 1) > 0xFF);
    if (v26)
      v28 = 12;
    self->_bindingData.pointIndicesStride = v28;
    v29 = malloc_type_malloc(v28 * (unint64_t)self->_vertexCount, 0xD353DEA5uLL);
    self->_bindingData.pointIndices = v29;
    if (v27 == 1)
    {
      v31 = 0;
      v32 = 2;
      v30 = (uint64_t)v29;
    }
    else
    {
      v30 = 0;
      if (v27 == 2)
      {
        v32 = 14;
        v31 = (uint64_t)v29;
      }
      else
      {
        v30 = 0;
        v31 = 0;
        v32 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v32;
    if (v26)
      v33 = (uint64_t)v29;
    else
      v33 = 0;
    v34 = 4 * self->_vertexCount;
    self->_bindingData.innerLayerInfluencesLength = v34;
    v35 = (float *)malloc_type_malloc(v34, 0xE9686779uLL);
    self->_bindingData.innerLayerInfluences = v35;
    C3DWrapDeformerComputeSharedBindingPointIndicesAndBarycentricCoordsFromSandwichedPositions(self->_bindingMode, self->_vertexCount, v41, Mesh, v12, v38, (uint64_t)PositionSource, (uint64_t)v39, *(__n128 *)self->_anon_a0, *(__n128 *)&self->_anon_a0[16], *(__n128 *)&self->_anon_a0[32], *(__n128 *)&self->_anon_a0[48], ChannelForSourceWithSemanticAtIndex, v36, 1, v30, v31, v33, (uint64_t)v17,
      0,
      (uint64_t)v35,
      (void **)&self->_bindingData.innerLayerTNBs,
      (void **)&self->_bindingData.outerLayerTNBs,
      &self->_bindingData.tnbMatricesLength,
      (void **)&self->_bindingData.innerLayerOffsets,
      &self->_bindingData.outerLayerOffsets,
      &self->_bindingData.offsetsLength);
  }
}

- (id)extraLayerMeshesWithDrivingMesh0:(__C3DMesh *)a3 drivingMesh1:(__C3DMesh *)a4
{
  const void *PositionSource;
  const void *v7;
  uint64_t Count;
  const __CFAllocator *v9;
  unint64_t i;
  const UInt8 *v11;
  uint64_t v12;
  double v13;
  unsigned int v14;
  unsigned int v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  CFDataRef v20;
  const __CFArray *v21;
  const __CFArray *MeshElements;
  const void *v23;
  const __CFAllocator *bytesDeallocator;
  char ChannelForSourceWithSemanticAtIndex;
  __C3DMesh *v27;
  void *v28;
  float32x4_t v29;
  float32x4_t v30;
  char v31;
  void *values;

  PositionSource = C3DMeshGetPositionSource((uint64_t)a3, 0);
  v7 = C3DMeshGetPositionSource((uint64_t)a4, 0);
  Count = C3DMeshSourceGetCount((uint64_t)PositionSource);
  v27 = a3;
  ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex((uint64_t)a3, 0, 0);
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 39);
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE10];
  for (i = 1; i != 40; ++i)
  {
    v11 = (const UInt8 *)malloc_type_malloc(12 * Count, 0x15D041F9uLL);
    if (Count >= 1)
    {
      v12 = 0;
      v13 = (double)i * 0.025;
      *(float *)&v13 = v13;
      v29 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v13, 0);
      v14 = 2;
      v15 = 1;
      do
      {
        *(double *)v16.i64 = C3DMeshSourceGetValueAtIndexAsVector3((uint64_t)PositionSource, v12);
        v30 = v16;
        *(double *)v17.i64 = C3DMeshSourceGetValueAtIndexAsVector3((uint64_t)v7, v12);
        v18 = vmlaq_f32(v30, vsubq_f32(v17, v30), v29);
        *(_DWORD *)&v11[4 * v14 - 8] = v18.i32[0];
        *(_DWORD *)&v11[4 * v14 - 4] = v18.i32[1];
        *(_DWORD *)&v11[4 * v14] = v18.i32[2];
        v12 = v15;
        v14 += 3;
      }
      while (Count > v15++);
    }
    v20 = CFDataCreateWithBytesNoCopy(v9, v11, 12 * Count, bytesDeallocator);
    values = 0;
    values = (void *)C3DMeshSourceCreate(v20, 0, Count, 3, 1);
    v21 = CFArrayCreate(v9, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    v31 = ChannelForSourceWithSemanticAtIndex;
    MeshElements = (const __CFArray *)C3DMeshGetMeshElements((uint64_t)v27, 0);
    v23 = (const void *)C3DMeshCreateWithMeshSourcesAndMeshElements(v21, MeshElements, (uint64_t)&v31);
    objc_msgSend(v28, "addObject:", v23);
    CFRelease(v23);
    CFRelease(v21);
  }
  return v28;
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 213, "decodedLength == _bindingData.legacyOffsetsOrTransformsLength");
}

- (void)initWithCoder:.cold.2()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 250, "decodedLength == _bindingData.offsetsLength");
}

- (void)initWithCoder:.cold.3()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 246, "decodedLength == _bindingData.offsetsLength");
}

- (void)initWithCoder:.cold.4()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 238, "decodedLength == _bindingData.tnbMatricesLength");
}

- (void)initWithCoder:.cold.5()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 234, "decodedLength == _bindingData.tnbMatricesLength");
}

- (void)initWithCoder:.cold.6()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 223, "decodedLength == _bindingData.innerLayerInfluencesLength");
}

- (void)initWithCoder:.cold.7()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 202, "decodedLength == bindingBarycentricCoordsLength");
}

- (void)initWithCoder:.cold.8()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 198, "decodedLength == bindingPointIndicesLength");
}

- (void)initParametersIfNeededWithDrivingNodeRef:(uint64_t)a3 deformedNodeRef:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "deformedTexcoordSource";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)initParametersIfNeededWithDrivingNodeRef:(uint64_t)a3 deformedNodeRef:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "driverTexcoordSource";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
