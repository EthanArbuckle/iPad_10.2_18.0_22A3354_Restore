@implementation CVNLPActivationMatrix

- (CVNLPActivationMatrix)initWithBuffer:(id *)a3 domainType:(int64_t)a4 characterObservations:(id)a5 blankIndex:(int64_t)a6 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a7
{
  id v13;
  unint64_t var6;
  unint64_t var8;
  CVNLPActivationMatrix *v16;
  CVNLPActivationMatrix *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t var11;
  __int128 v27;
  MLMultiArray *indexArray;
  objc_super v30;

  v13 = a5;
  var6 = a3->var6;
  var8 = a3->var8;
  v30.receiver = self;
  v30.super_class = (Class)CVNLPActivationMatrix;
  v16 = -[CVNLPActivationMatrix init](&v30, sel_init);
  v17 = v16;
  if (v16)
  {
    v18 = *(_OWORD *)&a3->var0;
    v19 = *(_OWORD *)&a3->var2[2];
    *(_OWORD *)v16->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a3->var2;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::dim[2] = v19;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::data = v18;
    v20 = *(_OWORD *)a3->var3;
    v21 = *(_OWORD *)&a3->var3[2];
    v22 = *(_OWORD *)&a3->var6;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a3->var4;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::channels = v22;
    *(_OWORD *)v16->$70B10377DC9035999D77C63B14D421A0::stride = v20;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::stride[2] = v21;
    v23 = *(_OWORD *)&a3->var8;
    v24 = *(_OWORD *)&a3->var10;
    v25 = *(_OWORD *)&a3->var12;
    *(_QWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::storage_type = *(_QWORD *)&a3->var14;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::stride_height = v24;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v25;
    *(_OWORD *)&v16->$70B10377DC9035999D77C63B14D421A0::sequence_length = v23;
    v16->__doubleScoreMatrix = 0;
    v16->__timestepCount = var8;
    objc_storeStrong((id *)&v16->_characterObservations, a5);
    v17->__observationCount = var6;
    v17->__timeStride = a3->var13;
    var11 = a3->var11;
    v17->_blankIndex = a6;
    v17->__observationStride = var11;
    v17->__type = 1;
    v27 = *(_OWORD *)&a7->strategy;
    *(_QWORD *)&v17->__pruningPolicy.maxNumberOfCandidates = *(_QWORD *)&a7->maxNumberOfCandidates;
    *(_OWORD *)&v17->__pruningPolicy.strategy = v27;
    v17->__cachedPriorityQueueTimestep = -1;
    v17->_domainType = a4;
    v17->__isDoubleDataType = 0;
    indexArray = v17->__indexArray;
    v17->__indexArray = 0;

    v17->__usingIndexes = 0;
    v17->__cachedBlankIndexTimestep = -1;
  }

  return v17;
}

- (CVNLPActivationMatrix)initWithBuffer:(id *)a3 indexBuffer:(id *)a4 domainType:(int64_t)a5 characterObservations:(id)a6 blankIndex:(int64_t)a7 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a8
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CVNLPActivationMatrix *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CVNLPTextDecodingPruningPolicy v23;
  _OWORD v24[10];
  uint64_t v25;

  v9 = *(_OWORD *)&a3->var12;
  v24[8] = *(_OWORD *)&a3->var10;
  v24[9] = v9;
  v25 = *(_QWORD *)&a3->var14;
  v10 = *(_OWORD *)&a3->var4;
  v24[4] = *(_OWORD *)&a3->var3[2];
  v24[5] = v10;
  v11 = *(_OWORD *)&a3->var8;
  v24[6] = *(_OWORD *)&a3->var6;
  v24[7] = v11;
  v12 = *(_OWORD *)a3->var2;
  v24[0] = *(_OWORD *)&a3->var0;
  v24[1] = v12;
  v13 = *(_OWORD *)a3->var3;
  v24[2] = *(_OWORD *)&a3->var2[2];
  v24[3] = v13;
  v23 = *a8;
  result = (CVNLPActivationMatrix *)objc_msgSend_initWithBuffer_domainType_characterObservations_blankIndex_pruningPolicy_(self, a2, (uint64_t)v24, a5, a6, a7, &v23);
  if (result)
  {
    v15 = *(_OWORD *)&a4->var0;
    v16 = *(_OWORD *)&a4->var2[2];
    *(_OWORD *)result->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a4->var2;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::dim[2] = v16;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::data = v15;
    v17 = *(_OWORD *)a4->var3;
    v18 = *(_OWORD *)&a4->var3[2];
    v19 = *(_OWORD *)&a4->var6;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a4->var4;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::channels = v19;
    *(_OWORD *)result->$70B10377DC9035999D77C63B14D421A0::stride = v17;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::stride[2] = v18;
    v20 = *(_OWORD *)&a4->var8;
    v21 = *(_OWORD *)&a4->var10;
    v22 = *(_OWORD *)&a4->var12;
    *(_QWORD *)&result->$70B10377DC9035999D77C63B14D421A0::storage_type = *(_QWORD *)&a4->var14;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::stride_height = v21;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v22;
    *(_OWORD *)&result->$70B10377DC9035999D77C63B14D421A0::sequence_length = v20;
    result->__usingIndexes = a4->var0 != 0;
  }
  return result;
}

- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 domainType:(int64_t)a4 characterObservations:(id)a5 blankIndex:(int64_t)a6 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a7
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CVNLPActivationMatrix *v42;
  CVNLPActivationMatrix *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  MLMultiArray *indexArray;
  id v71;
  objc_super v72;

  v12 = a3;
  v71 = a5;
  objc_msgSend_shape(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_count(v16, v17, v18, v19);

  objc_msgSend_shape(v12, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v23, v24, 1, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_integerValue(v26, v27, v28, v29);

  objc_msgSend_shape(v12, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v34, v35, 0, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_integerValue(v37, v38, v39, v40);

  v72.receiver = self;
  v72.super_class = (Class)CVNLPActivationMatrix;
  v42 = -[CVNLPActivationMatrix init](&v72, sel_init);
  v43 = v42;
  if (v42)
  {
    objc_storeStrong((id *)&v42->__multiArray, a3);
    v43->__timestepCount = v41;
    v43->__observationCount = v30;
    objc_msgSend_strides(v12, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v47, v48, 0, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v43->__timeStride = objc_msgSend_integerValue(v50, v51, v52, v53);

    objc_msgSend_strides(v12, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v57, v58, 1, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v43->__observationStride = objc_msgSend_integerValue(v60, v61, v62, v63);

    objc_storeStrong((id *)&v43->_characterObservations, a5);
    v43->_blankIndex = a6;
    v43->__type = 0;
    v64 = *(_OWORD *)&a7->strategy;
    *(_QWORD *)&v43->__pruningPolicy.maxNumberOfCandidates = *(_QWORD *)&a7->maxNumberOfCandidates;
    *(_OWORD *)&v43->__pruningPolicy.strategy = v64;
    v43->__cachedPriorityQueueTimestep = -1;
    v43->_domainType = a4;
    v43->__isDoubleDataType = objc_msgSend_dataType(v43->__multiArray, v65, v66, v67) == 65600;
    v43->__usingIndexes = 0;
    indexArray = v43->__indexArray;
    v43->__indexArray = 0;

    v43->__cachedBlankIndexTimestep = -1;
  }

  return v43;
}

- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 characterObservations:(id)a4 blankIndex:(int64_t)a5 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a6
{
  CVNLPTextDecodingPruningPolicy v7;

  v7 = *a6;
  return (CVNLPActivationMatrix *)objc_msgSend_initWithMultiArray_domainType_characterObservations_blankIndex_pruningPolicy_(self, a2, (uint64_t)a3, 0, a4, a5, &v7);
}

- (CVNLPActivationMatrix)initWithMultiArray:(id)a3 indexArray:(id)a4 domainType:(int64_t)a5 characterObservations:(id)a6 blankIndex:(int64_t)a7 pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a8
{
  id v15;
  const char *v16;
  uint64_t v17;
  CVNLPActivationMatrix *v18;
  CVNLPTextDecodingPruningPolicy v20;

  v15 = a4;
  v20 = *a8;
  v17 = objc_msgSend_initWithMultiArray_domainType_characterObservations_blankIndex_pruningPolicy_(self, v16, (uint64_t)a3, a5, a6, a7, &v20);
  v18 = (CVNLPActivationMatrix *)v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 56), a4);
    v18->__usingIndexes = v15 != 0;
  }

  return v18;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  if (objc_msgSend__cachedTimesample(self, a2, v2, v3))
  {
    v8 = objc_msgSend__cachedTimesample(self, v5, v6, v7);
    v11 = v8;
    if (v8)
    {
      v12 = *(void **)(v8 + 40);
      if (v12)
      {
        *(_QWORD *)(v11 + 48) = v12;
        operator delete(v12);
      }
      v13 = *(void **)v11;
      if (*(_QWORD *)v11)
      {
        *(_QWORD *)(v11 + 8) = v13;
        operator delete(v13);
      }
      MEMORY[0x1B5E07CD8](v11, 0x1020C40A634FBC0);
    }
    objc_msgSend_set_cachedTimesample_(self, v9, 0, v10);
  }
  v14.receiver = self;
  v14.super_class = (Class)CVNLPActivationMatrix;
  -[CVNLPActivationMatrix dealloc](&v14, sel_dealloc);
}

- (MLMultiArray)getActivationsMultiArray
{
  return self->__multiArray;
}

- (MLMultiArray)getIndicesMultiArray
{
  return self->__indexArray;
}

- (int64_t)timestepCount
{
  return self->__timestepCount;
}

- (int64_t)observationCount
{
  return self->__observationCount;
}

- (double)probabilityForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  double result;
  int64_t domainType;

  objc_msgSend__valueForObservationIndex_timestep_(self, a2, a3, a4);
  domainType = self->_domainType;
  if (domainType == 1)
    return exp(result);
  if (domainType)
    return 0.0;
  return result;
}

- (double)logProbabilityForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  long double v5;
  int64_t domainType;
  double v7;

  objc_msgSend__valueForObservationIndex_timestep_(self, a2, a3, a4);
  domainType = self->_domainType;
  if (domainType == 1)
    return v5;
  v7 = 0.0;
  if (!domainType)
    return log(v5);
  return v7;
}

- (double)_valueForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  int64_t v4;
  int64_t type;
  double result;
  _BOOL4 isDoubleDataType;
  uint64_t v8;

  v4 = self->__observationStride * a3 + self->__timeStride * a4;
  type = self->__type;
  if (type == 1)
    return *((float *)self->$70B10377DC9035999D77C63B14D421A0::data + v4);
  result = 0.0;
  if (!type)
  {
    isDoubleDataType = self->__isDoubleDataType;
    v8 = objc_msgSend_dataPointer(self->__multiArray, a2, a3, a4, 0.0);
    if (isDoubleDataType)
      return *(double *)(v8 + 8 * v4);
    else
      return *(float *)(v8 + 4 * v4);
  }
  return result;
}

- (int64_t)blankIndexForTimestep:(int64_t)a3
{
  uint64_t v5;

  if (!self->__usingIndexes)
    return self->_blankIndex;
  if (self->__cachedBlankIndexTimestep != a3)
  {
    self->__cachedBlankIndex = -1;
    if (self->__observationCount >= 1)
    {
      v5 = 0;
      while (objc_msgSend_characterIndexForObservationIndex_timestep_(self, a2, v5, a3) != self->_blankIndex)
      {
        if (++v5 >= self->__observationCount)
          goto LABEL_10;
      }
      self->__cachedBlankIndex = v5;
    }
LABEL_10:
    self->__cachedBlankIndexTimestep = a3;
  }
  return self->__cachedBlankIndex;
}

- (double)probabilityForBlankAtTimestep:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  double result;

  v6 = objc_msgSend_blankIndexForTimestep_(self, a2, a3, v3);
  if (v6 == -1)
    return 0.01;
  objc_msgSend_probabilityForObservationIndex_timestep_(self, v7, v6, a3);
  return result;
}

- (double)logProbabilityForBlankAtTimestep:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  double result;

  v6 = objc_msgSend_blankIndexForTimestep_(self, a2, a3, v3);
  if (v6 == -1)
    return -4.60517019;
  objc_msgSend_logProbabilityForObservationIndex_timestep_(self, v7, v6, a3);
  return result;
}

- (int64_t)characterIndexForObservationIndex:(int64_t)a3 timestep:(int64_t)a4
{
  int64_t v4;
  int64_t type;
  _BOOL4 isDoubleDataType;
  uint64_t v7;

  if (!self->__usingIndexes)
    return a3;
  v4 = self->__observationStride * a3 + self->__timeStride * a4;
  type = self->__type;
  if (type == 1)
    return (uint64_t)*((float *)self->$70B10377DC9035999D77C63B14D421A0::data + v4);
  if (type)
    return a3;
  isDoubleDataType = self->__isDoubleDataType;
  v7 = objc_msgSend_dataPointer(self->__indexArray, a2, a3, a4);
  if (isDoubleDataType)
    return (uint64_t)*(double *)(v7 + 8 * v4);
  return (uint64_t)*(float *)(v7 + 4 * v4);
}

- (void)enumerateNonBlankCandidatesInTimestep:(int64_t)a3 block:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  if (self->__pruningPolicy.shouldSort && self->__cachedPriorityQueueTimestep != a3 && !self->__usingIndexes)
    objc_msgSend__sortNonBlankCandidatesForTimestep_(self, v6, a3, v7);
  objc_msgSend__enumerateNonBlankCandidatesInTimestep_block_(self, v6, a3, (uint64_t)v8);

}

- (id)_candidateSymbolAtIndex:(int64_t)a3 forTimestep:(int64_t)a4 outputScore:(double *)a5
{
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  float *v16;

  if (self->__pruningPolicy.shouldSort && !self->__usingIndexes)
  {
    v15 = (_QWORD *)sub_1B0353FC8((uint64_t)self->__cachedTimesample, (uint64_t)&self->__pruningPolicy, 0.0);
    if (a3 >= (unint64_t)((uint64_t)(v15[1] - *v15) >> 3))
      sub_1B0355174();
    v16 = (float *)(*v15 + 8 * a3);
    *a5 = v16[1];
    v9 = *(unsigned int *)v16;
    goto LABEL_8;
  }
  v9 = objc_msgSend_characterIndexForObservationIndex_timestep_(self, a2, a3, a4);
  objc_msgSend__valueForObservationIndex_timestep_(self, v10, a3, a4);
  *(_QWORD *)a5 = v13;
  if (v9 != -1)
  {
LABEL_8:
    objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v11, v9, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    return v14;
  }
  v14 = 0;
  return v14;
}

- (void)_enumerateNonBlankCandidatesInTimestep:(int64_t)a3 block:(id)a4
{
  void (**v6)(id, void *, _BYTE *, double);
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  int64_t observationCount;
  CVNLPTextDecodingPruningPolicy *p_pruningPolicy;
  int64_t domainType;
  double v16;
  uint64_t v17;
  unint64_t v18;
  int64_t strategy;
  BOOL v20;
  void *v21;
  int64_t v22;
  double v23;
  double v24;
  double v25;
  long double v26;
  double threshold;
  double v28;
  double v29;
  long double v30;
  float v31;
  _QWORD *v32;
  double v33;
  char v34;

  v6 = (void (**)(id, void *, _BYTE *, double))a4;
  v34 = 0;
  v10 = objc_msgSend_blankIndexForTimestep_(self, v7, a3, v8);
  if (v10 == -1)
  {
    domainType = self->_domainType;
    v16 = -4.60517019;
    if (domainType != 1)
      v16 = 0.0;
    if (domainType)
      v12 = v16;
    else
      v12 = 0.01;
    observationCount = self->__observationCount;
    p_pruningPolicy = &self->__pruningPolicy;
    if (!self->__pruningPolicy.shouldSort)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend__valueForObservationIndex_timestep_(self, v9, v10, a3);
    v12 = v11;
    observationCount = self->__observationCount;
    p_pruningPolicy = &self->__pruningPolicy;
    if (!self->__pruningPolicy.shouldSort)
      goto LABEL_11;
  }
  if (!self->__usingIndexes)
  {
    v31 = v12;
    v32 = (_QWORD *)sub_1B0353FC8((uint64_t)self->__cachedTimesample, (uint64_t)p_pruningPolicy, v31);
    observationCount = (uint64_t)(v32[1] - *v32) >> 3;
    if (observationCount >= 1)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_11:
  if (observationCount >= 1)
  {
LABEL_12:
    v17 = 0;
    v18 = 0;
    strategy = p_pruningPolicy->strategy;
    while (1)
    {
      if (v18 >= self->__pruningPolicy.maxNumberOfCandidates || !strategy && v12 > self->__pruningPolicy.threshold)
        goto LABEL_46;
      if (v10 != v17 || self->__pruningPolicy.shouldSort && !self->__usingIndexes)
        break;
LABEL_16:
      if (observationCount == ++v17)
        goto LABEL_46;
    }
    v33 = 0.0;
    objc_msgSend__candidateSymbolAtIndex_forTimestep_outputScore_(self, v9, v17, a3, &v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
LABEL_15:

      goto LABEL_16;
    }
    v22 = self->_domainType;
    if (v22)
    {
      if (v22 == 1)
      {
        v23 = v33;
        v24 = fmax(v12, v33);
        v25 = fmin(v12, v33);
        if (v25 >= -1021.0)
        {
          v26 = exp(v25 - v24);
          v12 = log1p(v26) + v24;
          if (strategy != 1)
          {
LABEL_35:
            v6[2](v6, v21, &v34, v23);
            ++v18;
            if (strategy != 1)
              goto LABEL_13;
            v22 = self->_domainType;
LABEL_37:
            if (v22 == 1)
            {
              threshold = self->__pruningPolicy.threshold;
              v28 = fmax(v12, threshold);
              v29 = fmin(v12, threshold);
              if (v29 >= -1021.0)
              {
                v30 = exp(v29 - v28);
                v28 = log1p(v30) + v28;
              }
              v20 = v28 > 0.0;
              if (v34)
              {
LABEL_44:

                goto LABEL_46;
              }
              goto LABEL_14;
            }
            if (!v22)
            {
              v20 = v12 + self->__pruningPolicy.threshold > 1.0;
              if (v34)
                goto LABEL_44;
              goto LABEL_14;
            }
LABEL_13:
            v20 = 0;
            if (v34)
              goto LABEL_44;
LABEL_14:
            if (v20)
              goto LABEL_44;
            goto LABEL_15;
          }
        }
        else
        {
          v12 = v24;
          if (strategy != 1)
            goto LABEL_35;
        }
      }
      else
      {
        v23 = v33;
        if (strategy != 1)
          goto LABEL_35;
      }
    }
    else
    {
      v23 = v33;
      v12 = v33 + v12;
      if (strategy != 1)
        goto LABEL_35;
    }
    if (v23 <= self->__pruningPolicy.threshold)
      goto LABEL_37;
    goto LABEL_35;
  }
LABEL_46:

}

- (void)_sortNonBlankCandidatesForTimestep:(int64_t)a3
{
  void **cachedTimesample;
  void *v6;
  void *v7;
  _OWORD *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  float v14;
  int64_t observationCount;
  uint64_t v16;
  double v17;
  float v18;
  float **v19;
  unint64_t v20;
  float *v21;
  float *v22;
  float *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  float *v34;
  uint64_t v35;
  uint64_t v36;
  float *v37;
  _OWORD *v38;
  float *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  float *v43;
  float *v44;
  uint64_t v45;
  unint64_t v46;
  float v47;
  int v48;
  char *v49;
  int v50;
  char *v51;

  cachedTimesample = (void **)self->__cachedTimesample;
  if (cachedTimesample)
  {
    v6 = cachedTimesample[5];
    if (v6)
    {
      cachedTimesample[6] = v6;
      operator delete(v6);
    }
    v7 = *cachedTimesample;
    if (*cachedTimesample)
    {
      cachedTimesample[1] = v7;
      operator delete(v7);
    }
    MEMORY[0x1B5E07CD8](cachedTimesample, 0x1020C40A634FBC0);
    self->__cachedPriorityQueueTimestep = -1;
    self->__cachedTimesample = 0;
  }
  v8 = (_OWORD *)operator new();
  *v8 = 0u;
  v8[1] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  self->__cachedTimesample = v8;
  v12 = objc_msgSend_blankIndexForTimestep_(self, v9, a3, v10);
  if (v12 != -1)
  {
    objc_msgSend__valueForObservationIndex_timestep_(self, v11, v12, a3);
    v14 = v13;
    if (self->__pruningPolicy.strategy)
      goto LABEL_9;
LABEL_12:
    if (v14 <= self->__pruningPolicy.threshold)
      goto LABEL_14;
LABEL_13:
    if (v14 > (float)(1.0 - v14))
      goto LABEL_49;
    goto LABEL_14;
  }
  v14 = 0.01;
  if (!self->__pruningPolicy.strategy)
    goto LABEL_12;
LABEL_9:
  if (v14 > 3.4028e38)
    goto LABEL_13;
LABEL_14:
  observationCount = self->__observationCount;
  if (observationCount >= 1)
  {
    v16 = 0;
    while (v16 == v12)
    {
LABEL_18:
      if (++v16 >= observationCount)
        goto LABEL_49;
    }
    objc_msgSend__valueForObservationIndex_timestep_(self, v11, v16, a3);
    v18 = v17;
    v19 = (float **)self->__cachedTimesample;
    v21 = v19[1];
    v20 = (unint64_t)v19[2];
    if ((unint64_t)v21 < v20)
    {
      *(_DWORD *)v21 = v16;
      v21[1] = v18;
      v22 = v21 + 2;
      goto LABEL_43;
    }
    v23 = *v19;
    v24 = (char *)v21 - (char *)*v19;
    v25 = v24 >> 3;
    v26 = (v24 >> 3) + 1;
    if (v26 >> 61)
      sub_1B02D7758();
    v27 = v20 - (_QWORD)v23;
    if (v27 >> 2 > v26)
      v26 = v27 >> 2;
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
      v28 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v28 = v26;
    if (v28)
    {
      if (v28 >> 61)
        sub_1B02D72AC();
      v29 = operator new(8 * v28);
      v30 = (uint64_t)&v29[8 * v25];
      *(_DWORD *)v30 = v16;
      *(float *)(v30 + 4) = v18;
      v31 = (char *)((char *)v21 - (char *)v23);
      if (v21 != v23)
      {
LABEL_31:
        v32 = v31 - 8;
        if ((unint64_t)(v31 - 8) >= 0x58)
        {
          v33 = v30;
          if ((unint64_t)((char *)v21 - v29 - v24) >= 0x20)
          {
            v35 = ((unint64_t)v32 >> 3) + 1;
            v36 = 8 * (v35 & 0x3FFFFFFFFFFFFFFCLL);
            v37 = &v21[v36 / 0xFFFFFFFFFFFFFFFCLL];
            v33 = v30 - v36;
            v38 = &v29[8 * v25 - 16];
            v39 = v21 - 4;
            v40 = v35 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v41 = *(_OWORD *)v39;
              *(v38 - 1) = *((_OWORD *)v39 - 1);
              *v38 = v41;
              v38 -= 2;
              v39 -= 8;
              v40 -= 4;
            }
            while (v40);
            v21 = v37;
            if (v35 == (v35 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_41:
              v21 = *v19;
              v43 = (float *)&v29[8 * v28];
              v22 = (float *)(v30 + 8);
              *v19 = (float *)v33;
              v19[1] = (float *)(v30 + 8);
              v19[2] = v43;
              if (!v21)
                goto LABEL_43;
              goto LABEL_42;
            }
          }
        }
        else
        {
          v33 = v30;
        }
        do
        {
          v42 = *((_QWORD *)v21 - 1);
          v21 -= 2;
          *(_QWORD *)(v33 - 8) = v42;
          v33 -= 8;
        }
        while (v21 != v23);
        goto LABEL_41;
      }
    }
    else
    {
      v29 = 0;
      v30 = 8 * v25;
      *(_DWORD *)v30 = v16;
      *(float *)(v30 + 4) = v18;
      v31 = (char *)((char *)v21 - (char *)v23);
      if (v21 != v23)
        goto LABEL_31;
    }
    v34 = (float *)&v29[8 * v28];
    v22 = (float *)(v30 + 8);
    *v19 = (float *)v30;
    v19[1] = (float *)(v30 + 8);
    v19[2] = v34;
    if (!v21)
    {
LABEL_43:
      v19[1] = v22;
      v44 = *v19;
      v45 = (char *)v22 - (char *)*v19;
      if (v45 >= 9)
      {
        v46 = (((unint64_t)v45 >> 3) - 2) >> 1;
        v47 = *(v22 - 1);
        if (v44[2 * v46 + 1] < v47)
        {
          v50 = *((_DWORD *)v22 - 2);
          v49 = (char *)(v22 - 2);
          v48 = v50;
          do
          {
            v51 = v49;
            v49 = (char *)&v44[2 * v46];
            *(_QWORD *)v51 = *(_QWORD *)v49;
            if (!v46)
              break;
            v46 = (v46 - 1) >> 1;
          }
          while (v44[2 * v46 + 1] < v47);
          *(_DWORD *)v49 = v48;
          *((float *)v49 + 1) = v47;
        }
      }
      *((_BYTE *)v19 + 32) = 0;
      observationCount = self->__observationCount;
      goto LABEL_18;
    }
LABEL_42:
    operator delete(v21);
    goto LABEL_43;
  }
LABEL_49:
  self->__cachedPriorityQueueTimestep = a3;
}

- (id)topCandidateForTimestep:(int64_t)a3 outputLogProbability:(double *)a4
{
  return (id)objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, a2, a3, (uint64_t)a4, 0);
}

- (id)topCandidateForTimestep:(int64_t)a3 outputLogProbability:(double *)a4 outputIndex:(int64_t *)a5
{
  uint64_t v9;
  int64_t v10;
  const char *v11;
  uint64_t v12;
  _QWORD *cachedTimesample;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  float *v18;
  int64_t v19;
  float v20;
  int64_t domainType;
  float v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  double v37;
  double v38;
  BOOL v39;
  double v41;

  if (self->__usingIndexes)
  {
    if (a4)
    {
      objc_msgSend_logProbabilityForObservationIndex_timestep_(self, a2, 0, a3);
      *(_QWORD *)a4 = v9;
    }
    v10 = objc_msgSend_characterIndexForObservationIndex_timestep_(self, a2, 0, a3);
    if (a5)
      *a5 = v10;
    objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v11, v10, v12);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (self->__cachedPriorityQueueTimestep == a3)
  {
    cachedTimesample = self->__cachedTimesample;
    if (cachedTimesample)
    {
      if (*((_QWORD *)self->__cachedTimesample + 1) != *cachedTimesample)
      {
        objc_msgSend_logProbabilityForBlankAtTimestep_(self, a2, a3, (uint64_t)a4);
        v17 = v16;
        v18 = *(float **)self->__cachedTimesample;
        v19 = *(unsigned int *)v18;
        v20 = v18[1];
        domainType = self->_domainType;
        if (domainType != 1)
        {
          if (domainType)
          {
LABEL_41:
            if (a4)
            {
              v41 = 1.0;
              if (v17 == 0.0)
                v41 = v17;
              *a4 = v41;
            }
            if (a5)
              *a5 = self->_blankIndex;
            objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v14, self->_blankIndex, v15);
            return (id)objc_claimAutoreleasedReturnValue();
          }
          v20 = logf(v20);
        }
        v22 = 0.0;
        if (v17 != 0.0)
          v22 = 1.0;
        if (v20 > v22)
        {
          if (a4)
            *a4 = v20;
          if (a5)
            *a5 = v19;
          objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v14, v19, v15);
          return (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_41;
      }
    }
  }
  v26 = objc_msgSend_blankIndexForTimestep_(self, a2, a3, (uint64_t)a4);
  if (v26 == -1)
  {
    v28 = 0.01;
    if (objc_msgSend_observationCount(self, v23, v24, v25) < 1)
      goto LABEL_34;
  }
  else
  {
    objc_msgSend_probabilityForObservationIndex_timestep_(self, v23, v26, a3);
    v28 = v27;
    if (objc_msgSend_observationCount(self, v29, v30, v31) < 1)
      goto LABEL_34;
  }
  if (v28 < 1.0 - v28)
  {
    v35 = 0;
    v36 = v26;
    v37 = v28;
    do
    {
      if (v26 != v35)
      {
        objc_msgSend_probabilityForObservationIndex_timestep_(self, v32, v35, a3);
        v39 = v38 <= v37;
        v37 = fmax(v38, v37);
        if (!v39)
          v36 = v35;
        v28 = v38 + v28;
      }
      ++v35;
    }
    while (v35 < objc_msgSend_observationCount(self, v32, v33, v34) && v37 < 1.0 - v28);
    goto LABEL_35;
  }
LABEL_34:
  v37 = v28;
  v36 = v26;
LABEL_35:
  if (a4)
    *a4 = log(v37);
  if (a5)
    *a5 = v36;
  objc_msgSend_objectAtIndexedSubscript_(self->_characterObservations, v32, v36, v34);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)topCandidateForTimestep:(int64_t)a3 outputProbability:(double *)a4 outputIndex:(int64_t *)a5
{
  void *v6;
  long double __x;

  __x = 0.0;
  objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, a2, a3, (uint64_t)&__x, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = exp(__x);
  return v6;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  int64_t blankIndex;
  __CFString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v5, v6, (uint64_t)CFSTR("Activation Matrix with %ld timesteps, %ld observations \n"), v7, self->__timestepCount, self->__observationCount);
  if (self->__timestepCount >= 1)
  {
    objc_msgSend_logProbabilityForBlankAtTimestep_(self, v8, 0, v9);
    v11 = v10;
    v38 = -1;
    v39 = 0;
    objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, v12, 0, (uint64_t)&v39, &v38);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if (v38 == self->_blankIndex)
    {
      v17 = CFSTR("<B>");
      objc_msgSend_appendFormat_(v5, v14, (uint64_t)CFSTR("\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n"), v15, 0, v11, v38, CFSTR("<B>"), v39, v38);
    }
    else
    {
      sub_1B0360D78(v13);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v5, v18, (uint64_t)CFSTR("\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n"), v19, 0, v11, self->_blankIndex, v17, v39, v38);
    }

    if (self->__timestepCount >= 2)
    {
      v22 = 1;
      objc_msgSend_logProbabilityForBlankAtTimestep_(self, v20, 1, v21);
      while (1)
      {
        v27 = v24;
        v38 = -1;
        v39 = 0;
        objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self, v23, v22, (uint64_t)&v39, &v38);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v28;
        blankIndex = self->_blankIndex;
        if (v22 == self->__timestepCount - 1 || v38 != blankIndex)
        {
          if (v38 == blankIndex)
          {
            v34 = CFSTR("<B>");
            objc_msgSend_appendFormat_(v5, v29, (uint64_t)CFSTR("\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n"), v30, v22, v27, v38, CFSTR("<B>"), v39, v38);
          }
          else
          {
            sub_1B0360D78(v28);
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendFormat_(v5, v35, (uint64_t)CFSTR("\t t%ld, <B>:%.2f [%ld], sym=%@:%.2f [%ld]\n"), v36, v22, v27, self->_blankIndex, v34, v39, v38);
          }

        }
        if (++v22 >= self->__timestepCount)
          break;
        objc_msgSend_logProbabilityForBlankAtTimestep_(self, v25, v22, v26);
      }
    }
  }
  return v5;
}

- (NSOrderedSet)characterObservations
{
  return self->_characterObservations;
}

- (void)setCharacterObservations:(id)a3
{
  objc_storeStrong((id *)&self->_characterObservations, a3);
}

- (int64_t)blankIndex
{
  return self->_blankIndex;
}

- (void)setBlankIndex:(int64_t)a3
{
  self->_blankIndex = a3;
}

- (int64_t)domainType
{
  return self->_domainType;
}

- ($FD4688982923A924290ECB669CAF1EC2)_espressoBuffer
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[1].var11;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[1].var9;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[1].var13;
  v4 = *(_OWORD *)&self[1].var3[3];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[1].var3[1];
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[1].var7;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var14;
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[1].var2[3];
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[1].var2[1];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)set_espressoBuffer:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::dim[2] = v4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::data = v3;
  v5 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  v7 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::channels = v7;
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::stride = v5;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride[2] = v6;
  v8 = *(_OWORD *)&a3->var8;
  v9 = *(_OWORD *)&a3->var10;
  v10 = *(_OWORD *)&a3->var12;
  *(_QWORD *)&self->$70B10377DC9035999D77C63B14D421A0::storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_height = v9;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v10;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::sequence_length = v8;
}

- ($FD4688982923A924290ECB669CAF1EC2)_indexBuffer
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  *(_QWORD *)&retstr->var14 = self[2].var13;
  v3 = *(_OWORD *)&self[2].var11;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[2].var9;
  *(_OWORD *)&retstr->var12 = v3;
  v4 = *(_OWORD *)&self[2].var3[3];
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[2].var3[1];
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[2].var7;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[2].var5;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var14;
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[2].var2[3];
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[2].var2[1];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)set_indexBuffer:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::dim = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::dim[2] = v4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::data = v3;
  v5 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  v7 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::channels = v7;
  *(_OWORD *)self->$70B10377DC9035999D77C63B14D421A0::stride = v5;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride[2] = v6;
  v8 = *(_OWORD *)&a3->var8;
  v9 = *(_OWORD *)&a3->var10;
  v10 = *(_OWORD *)&a3->var12;
  *(_QWORD *)&self->$70B10377DC9035999D77C63B14D421A0::storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_height = v9;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::stride_batch_number = v10;
  *(_OWORD *)&self->$70B10377DC9035999D77C63B14D421A0::sequence_length = v8;
}

- (double)_doubleScoreMatrix
{
  return self->__doubleScoreMatrix;
}

- (void)set_doubleScoreMatrix:(double *)a3
{
  self->__doubleScoreMatrix = a3;
}

- (MLMultiArray)_multiArray
{
  return self->__multiArray;
}

- (void)set_multiArray:(id)a3
{
  objc_storeStrong((id *)&self->__multiArray, a3);
}

- (MLMultiArray)_indexArray
{
  return self->__indexArray;
}

- (void)set_indexArray:(id)a3
{
  objc_storeStrong((id *)&self->__indexArray, a3);
}

- (int64_t)_timestepCount
{
  return self->__timestepCount;
}

- (void)set_timestepCount:(int64_t)a3
{
  self->__timestepCount = a3;
}

- (int64_t)_observationCount
{
  return self->__observationCount;
}

- (void)set_observationCount:(int64_t)a3
{
  self->__observationCount = a3;
}

- (int64_t)_timeStride
{
  return self->__timeStride;
}

- (void)set_timeStride:(int64_t)a3
{
  self->__timeStride = a3;
}

- (int64_t)_observationStride
{
  return self->__observationStride;
}

- (void)set_observationStride:(int64_t)a3
{
  self->__observationStride = a3;
}

- (int64_t)_type
{
  return self->__type;
}

- (void)set_type:(int64_t)a3
{
  self->__type = a3;
}

- (CVNLPTextDecodingPruningPolicy)_pruningPolicy
{
  *retstr = *(CVNLPTextDecodingPruningPolicy *)((char *)self + 136);
  return self;
}

- (void)set_pruningPolicy:(CVNLPTextDecodingPruningPolicy *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->strategy;
  *(_QWORD *)&self->__pruningPolicy.maxNumberOfCandidates = *(_QWORD *)&a3->maxNumberOfCandidates;
  *(_OWORD *)&self->__pruningPolicy.strategy = v3;
}

- (int64_t)_cachedPriorityQueueTimestep
{
  return self->__cachedPriorityQueueTimestep;
}

- (void)set_cachedPriorityQueueTimestep:(int64_t)a3
{
  self->__cachedPriorityQueueTimestep = a3;
}

- (void)_cachedTimesample
{
  return self->__cachedTimesample;
}

- (void)set_cachedTimesample:(void *)a3
{
  self->__cachedTimesample = a3;
}

- (BOOL)_isDoubleDataType
{
  return self->__isDoubleDataType;
}

- (void)set_isDoubleDataType:(BOOL)a3
{
  self->__isDoubleDataType = a3;
}

- (BOOL)_usingIndexes
{
  return self->__usingIndexes;
}

- (void)set_usingIndexes:(BOOL)a3
{
  self->__usingIndexes = a3;
}

- (int64_t)_cachedBlankIndexTimestep
{
  return self->__cachedBlankIndexTimestep;
}

- (int64_t)_cachedBlankIndex
{
  return self->__cachedBlankIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indexArray, 0);
  objc_storeStrong((id *)&self->__multiArray, 0);
  objc_storeStrong((id *)&self->_characterObservations, 0);
}

@end
