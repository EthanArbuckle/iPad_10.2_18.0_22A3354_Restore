@implementation MTLBVHDescriptor

- (BOOL)requiresResourceBuffer
{
  NSArray **p_geometryDescriptors;
  unint64_t v4;
  BOOL result;
  void *v6;

  p_geometryDescriptors = &self->_geometryDescriptors;
  v4 = objc_msgSend(objc_loadWeak((id *)&self->_geometryDescriptors), "count");
  result = 1;
  if (v4 <= 1 && self->_primitiveKeyframeCount <= 1)
  {
    if (!v4)
      return 0;
    v6 = (void *)objc_msgSend(objc_loadWeak((id *)p_geometryDescriptors), "objectAtIndexedSubscript:", 0);
    if ((objc_msgSend(v6, "primitiveType") || !objc_msgSend(v6, "transformationMatrixBuffer"))
      && (!objc_msgSend(v6, "primitiveDataBuffer") || !objc_msgSend(v6, "primitiveDataElementSize"))
      && objc_msgSend(v6, "primitiveType") != 2)
    {
      return 0;
    }
  }
  return result;
}

- (MTLBVHDescriptor)init
{
  MTLBVHDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLBVHDescriptor;
  result = -[MTLBVHDescriptor init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_maxDepth = vdupq_n_s64(0x20uLL);
    result->_minPrimitivesPerInnerNode = 0;
    result->_maxPrimitivesPerInnerNode = 0;
    result->_maxPrimitivesPerLeaf = 32;
    result->_splitHeuristic = 3;
    *(_OWORD *)&result->_traversalCost = xmmword_1827FE3F0;
    *(_OWORD *)&result->_temporalSplitBias = xmmword_1827FE400;
    *(_OWORD *)&result->_branchingFactor = xmmword_1827FE3E0;
    LOWORD(result->_primitiveCost) = 0;
    *(_DWORD *)&result->_useFastBuild = 0x1000000;
    result->_fragmentCount = 0;
    result->_primitiveDataSize = 0;
    *(int64x2_t *)&result->_primitiveKeyframeCount = vdupq_n_s64(1uLL);
  }
  return result;
}

- (PipelineKey)cachedPipelineKey
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].fragmentCost;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].vertexStride;
  *(_OWORD *)&retstr->boundingBoxStride = v3;
  *(_QWORD *)&retstr->temporalSplitBias = *((_QWORD *)&self[2].var0 + 1);
  return self;
}

- (void)updatePipelineKey
{
  NSArray **p_geometryDescriptors;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  MTLAttributeFormat v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  int v18;
  float v19;
  char v20;
  int v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t minPrimitivesPerLeaf;
  float v28;
  float v29;
  float traversalCost;
  float splitCapacity;
  uint64_t v32;
  _BOOL4 v33;
  unint64_t branchingFactor;
  unint64_t v35;
  char v36;
  float minOverlap;
  unint64_t primitiveKeyframeCount;
  unint64_t v39;
  int v40;
  uint64_t v41;
  unsigned __int8 v42;
  int v43;
  int v44;
  float v45;
  unsigned int v46;

  p_geometryDescriptors = &self->_geometryDescriptors;
  v4 = objc_msgSend(objc_loadWeak((id *)&self->_geometryDescriptors), "count");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_loadWeak((id *)p_geometryDescriptors), "objectAtIndexedSubscript:", 0);
    v6 = objc_msgSend(v5, "primitiveType");
    if (v6 == 1)
    {
      LODWORD(v19) = objc_msgSend(v5, "boundingBoxStride");
      v18 = 0;
      v20 = 0;
    }
    else
    {
      if (!v6)
      {
        v7 = objc_msgSend(v5, "vertexStride");
        v8 = objc_msgSend(v5, "vertexFormat");
        if (!v7)
          LODWORD(v7) = MTLAttributeFormatSize(v8, v9, v10, v11, v12, v13, v14, v15);
        v16 = (objc_msgSend(v5, "vertexFormat") & 0x3F) << 7;
        if (objc_msgSend(v5, "indexBuffer"))
        {
          if (objc_msgSend(v5, "indexType"))
            v17 = 0x1000000;
          else
            v17 = 0x800000;
        }
        else
        {
          v17 = 0;
        }
        v18 = ((objc_msgSend(v5, "polygonType") & 3) << 8) | v17;
        goto LABEL_16;
      }
      v18 = 0;
      v20 = 0;
      v19 = 0.0;
    }
    LODWORD(v7) = 0;
    v16 = 0;
    v21 = 0;
    goto LABEL_17;
  }
  v18 = 0;
  LODWORD(v7) = 0;
  v16 = 0;
LABEL_16:
  v19 = 0.0;
  v21 = (self->_splitHeuristic == 3) << 26;
  v20 = 1;
LABEL_17:
  v22 = *(&self->_deterministic + 1) && self->_primitiveKeyframeCount > 1;
  v23 = 104;
  if (!self->_deterministic)
    v23 = 100;
  v24 = 0x8000000;
  if (!v22)
    v24 = 0;
  v25 = v24 & 0xFFFFFFFFFE01FFFFLL | v16 & 0x1FE0 | ((unint64_t)LODWORD(self->_maxPrimitivesPerInnerNode) << 17) | ((unint64_t)*((unsigned __int8 *)&self->_deterministic + 2) << 28);
  v45 = v19;
  v46 = v7;
  v43 = v21;
  v44 = v18;
  if (LOBYTE(self->_primitiveCost) && self->_branchingFactor >= 3)
    v26 = (BYTE1(self->_primitiveCost) ^ 1) << 29;
  else
    v26 = 0;
  minPrimitivesPerLeaf = self->_minPrimitivesPerLeaf;
  v28 = *(&self->_minOverlap + 1);
  v29 = *(float *)((char *)&self->super.isa + v23);
  traversalCost = self->_traversalCost;
  splitCapacity = self->_splitCapacity;
  v32 = BYTE1(self->_primitiveCost);
  v33 = -[MTLBVHDescriptor requiresResourceBuffer](self, "requiresResourceBuffer", self->_maxPrimitivesPerLeaf);
  branchingFactor = self->_branchingFactor;
  v35 = v25 | v26 | (v32 << 30) | branchingFactor & 0xF | (16 * self->_deterministic) | 0x6000000;
  if (*(&self->_deterministic + 1))
    v35 = v35 & 0x7FFFFFFFFLL | ((self->_maxSubKeyframeTemporalSplits & 0xF) << 35);
  v36 = v20 ^ 1;
  minOverlap = 1.0;
  if (!v4)
    v36 = 1;
  if ((v36 & 1) == 0 && self->_splitHeuristic == 3)
    minOverlap = self->_minOverlap;
  primitiveKeyframeCount = self->_primitiveKeyframeCount;
  v39 = (unint64_t)(float)(minOverlap * (float)self->_fragmentCount);
  if (v22)
    v39 *= (primitiveKeyframeCount - 1) * (1 << LODWORD(self->_maxSubKeyframeTemporalSplits));
  if (refitUpdatesOpacityAndFunctionTableOffset(void)::pred != -1)
    dispatch_once(&refitUpdatesOpacityAndFunctionTableOffset(void)::pred, &__block_literal_global_1);
  if (v33)
    v40 = 0x8000000;
  else
    v40 = 0;
  v41 = refitUpdatesOpacityAndFunctionTableOffset(void)::useNewRefitBehavior == 0;
  *(_DWORD *)&self->_pipelineKey.var0 = v43 | v40 | v44 & 0xFFC003FF | ((minPrimitivesPerLeaf & 0xF) << 10) | (v42 << 14) | ((primitiveKeyframeCount > 1) << 28);
  *(_QWORD *)((char *)&self->_pipelineKey.var0 + 4) = v35 & 0xFFFFFFFFFFFFFF9FLL | ((unint64_t)(branchingFactor != 2) << 6) | (32 * (v39 > 0x2000)) | (v41 << 41);
  self->_pipelineKey.vertexStride = 0;
  self->_pipelineKey.boundingBoxStride = v46;
  self->_pipelineKey.minOverlap = v45;
  self->_pipelineKey.traversalCost = v28;
  self->_pipelineKey.fragmentCost = v29;
  self->_pipelineKey.temporalSplitBias = traversalCost;
  *(float *)&self->_pipelineKeyValid = splitCapacity;
  self->_useFastBuild = 1;
}

- (BOOL)primitiveMotion
{
  return self->_primitiveKeyframeCount > 1;
}

- (unint64_t)maxSubKeyframeTemporalSplits
{
  if (*(&self->_deterministic + 1) && self->_primitiveKeyframeCount >= 2)
    return self->_maxSubKeyframeTemporalSplits;
  else
    return 0;
}

- (void)updateMaxDepth
{
  self->_clampedMaxDepth = _MTLClampMaxDepthForDescriptor(self);
}

- (void)setBranchingFactor:(unint64_t)a3
{
  if (self->_branchingFactor != a3)
  {
    self->_branchingFactor = a3;
    -[MTLBVHDescriptor updateMaxDepth](self, "updateMaxDepth");
  }
}

- (void)setUseTemporalSplits:(BOOL)a3
{
  if (*(&self->_deterministic + 1) != a3)
  {
    *(&self->_deterministic + 1) = a3;
    -[MTLBVHDescriptor updateMaxDepth](self, "updateMaxDepth");
  }
}

- (void)setMaxDepth:(unint64_t)a3
{
  if (self->_maxDepth != a3)
  {
    self->_maxDepth = a3;
    -[MTLBVHDescriptor updateMaxDepth](self, "updateMaxDepth");
  }
}

- (unint64_t)maxDepth
{
  return self->_clampedMaxDepth;
}

- (unint64_t)actualMaxDepth
{
  return self->_maxDepth;
}

- (void)setFragmentCount:(unint64_t)a3
{
  self->_fragmentCount = a3;
  -[MTLBVHDescriptor updateMaxDepth](self, "updateMaxDepth");
}

- (unint64_t)fragmentCount
{
  return self->_fragmentCount;
}

- (void)setPrimitiveDataSize:(unint64_t)a3
{
  self->_primitiveDataSize = a3;
}

- (unint64_t)primitiveDataSize
{
  return self->_primitiveDataSize;
}

- (unint64_t)branchingFactor
{
  return self->_branchingFactor;
}

- (unint64_t)minPrimitivesPerLeaf
{
  return self->_minPrimitivesPerLeaf;
}

- (void)setMinPrimitivesPerLeaf:(unint64_t)a3
{
  self->_minPrimitivesPerLeaf = a3;
}

- (unint64_t)maxPrimitivesPerLeaf
{
  return self->_maxPrimitivesPerLeaf;
}

- (void)setMaxPrimitivesPerLeaf:(unint64_t)a3
{
  self->_maxPrimitivesPerLeaf = a3;
}

- (unint64_t)minPrimitivesPerInnerNode
{
  return self->_minPrimitivesPerInnerNode;
}

- (void)setMinPrimitivesPerInnerNode:(unint64_t)a3
{
  self->_minPrimitivesPerInnerNode = a3;
}

- (unint64_t)maxPrimitivesPerInnerNode
{
  return self->_maxPrimitivesPerInnerNode;
}

- (void)setMaxPrimitivesPerInnerNode:(unint64_t)a3
{
  self->_maxPrimitivesPerInnerNode = a3;
}

- (float)primitiveCost
{
  return self->_traversalCost;
}

- (void)setPrimitiveCost:(float)a3
{
  self->_traversalCost = a3;
}

- (float)traversalCost
{
  return self->_motionTraversalCost;
}

- (void)setTraversalCost:(float)a3
{
  self->_motionTraversalCost = a3;
}

- (NSArray)geometryDescriptors
{
  return (NSArray *)objc_loadWeak((id *)&self->_geometryDescriptors);
}

- (void)setGeometryDescriptors:(id)a3
{
  objc_storeWeak((id *)&self->_geometryDescriptors, a3);
}

- (float)motionTraversalCost
{
  return self->_primitiveMotionStartTime;
}

- (void)setMotionTraversalCost:(float)a3
{
  self->_primitiveMotionStartTime = a3;
}

- (unint64_t)primitiveKeyframeCount
{
  return self->_primitiveKeyframeCount;
}

- (void)setPrimitiveKeyframeCount:(unint64_t)a3
{
  self->_primitiveKeyframeCount = a3;
}

- (BOOL)motion
{
  return self->_deterministic;
}

- (void)setMotion:(BOOL)a3
{
  self->_deterministic = a3;
}

- (float)primitiveMotionStartTime
{
  return self->_primitiveMotionEndTime;
}

- (void)setPrimitiveMotionStartTime:(float)a3
{
  self->_primitiveMotionEndTime = a3;
}

- (float)primitiveMotionEndTime
{
  return self->_temporalSplitBias;
}

- (void)setPrimitiveMotionEndTime:(float)a3
{
  self->_temporalSplitBias = a3;
}

- (BOOL)useTemporalSplits
{
  return *(&self->_deterministic + 1);
}

- (float)temporalSplitBias
{
  return self->_splitCapacity;
}

- (void)setTemporalSplitBias:(float)a3
{
  self->_splitCapacity = a3;
}

- (BOOL)disallowMixingTemporalSplitsAndLeafNodes
{
  return *(&self->_deterministic + 2);
}

- (void)setDisallowMixingTemporalSplitsAndLeafNodes:(BOOL)a3
{
  *(&self->_deterministic + 2) = a3;
}

- (BOOL)useFastBuild
{
  return LOBYTE(self->_primitiveCost);
}

- (void)setUseFastBuild:(BOOL)a3
{
  LOBYTE(self->_primitiveCost) = a3;
}

- (BOOL)deterministic
{
  return BYTE1(self->_primitiveCost);
}

- (void)setDeterministic:(BOOL)a3
{
  BYTE1(self->_primitiveCost) = a3;
}

- (void)setMaxSubKeyframeTemporalSplits:(unint64_t)a3
{
  self->_maxSubKeyframeTemporalSplits = a3;
}

- (unint64_t)splitHeuristic
{
  return self->_splitHeuristic;
}

- (void)setSplitHeuristic:(unint64_t)a3
{
  self->_splitHeuristic = a3;
}

- (float)splitCapacity
{
  return self->_minOverlap;
}

- (void)setSplitCapacity:(float)a3
{
  self->_minOverlap = a3;
}

- (float)minOverlap
{
  return *(&self->_minOverlap + 1);
}

- (void)setMinOverlap:(float)a3
{
  *(&self->_minOverlap + 1) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometryDescriptors);
}

@end
