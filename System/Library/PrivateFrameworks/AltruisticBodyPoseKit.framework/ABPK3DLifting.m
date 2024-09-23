@implementation ABPK3DLifting

- (ABPK3DLifting)init
{
  NSObject *v3;
  ABPK3DLifting *v4;
  ABPK3DLifting *v5;
  ABPKMLModelConfiguration3DLifting *v6;
  ABPKMLModelConfiguration3DLifting *mlConfig;
  vector<simd_float4x4, std::allocator<simd_float4x4>> *p_liftingResultAsModelPoses;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  ABPKSkeletonDefinition *v10;
  ABPKSkeletonDefinition *abpkLiftingSkeletonDefinition;
  ABPK3DLifting *v12;
  __int128 v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  objc_super v16;

  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ", (uint8_t *)&v14, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)ABPK3DLifting;
  v4 = -[ABPK3DLifting init](&v16, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  v6 = objc_alloc_init(ABPKMLModelConfiguration3DLifting);
  mlConfig = v4->_mlConfig;
  v4->_mlConfig = v6;

  std::vector<simd_float4x4>::vector(&v14, 0x11uLL);
  p_liftingResultAsModelPoses = &v4->_liftingResultAsModelPoses;
  begin = v5->_liftingResultAsModelPoses.__begin_;
  if (begin)
  {
    v5->_liftingResultAsModelPoses.__end_ = begin;
    operator delete(begin);
    p_liftingResultAsModelPoses->__begin_ = 0;
    p_liftingResultAsModelPoses->__end_ = 0;
    p_liftingResultAsModelPoses->__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_liftingResultAsModelPoses->__begin_ = v14;
  v5->_liftingResultAsModelPoses.__end_cap_.__value_ = v15;
  v10 = -[ABPKSkeletonDefinition initWithType:]([ABPKSkeletonDefinition alloc], "initWithType:", 3);
  abpkLiftingSkeletonDefinition = v5->_abpkLiftingSkeletonDefinition;
  v5->_abpkLiftingSkeletonDefinition = v10;

  if (!-[ABPK3DLifting initMLNetwork](v5, "initMLNetwork"))
    v12 = 0;
  else
LABEL_7:
    v12 = v5;

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ABPK3DLifting;
  -[ABPK3DLifting dealloc](&v3, sel_dealloc);
}

- (BOOL)initMLNetwork
{
  NSObject *v3;
  NSArray *v4;
  NSArray *inputTensorNames;
  NSArray *v6;
  NSArray *outputTensorNames;
  void *v8;
  void *v9;
  ABPKMLNetworkV2 *v10;
  ABPKMLNetworkV2 *networkV2;
  NSMutableDictionary *v12;
  NSMutableDictionary *inputBufferDict;
  NSMutableDictionary *v14;
  NSMutableDictionary *outputBufferDict;
  BOOL v16;
  void *context;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSArray *v22;
  NSArray *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[8];
  std::__shared_weak_count *v31;

  -[ABPK3DLifting _startLoading3DLiftingMLModelSignpost](self, "_startLoading3DLiftingMLModelSignpost");
  __ABPKLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v3, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Initializing ML Network ", buf, 2u);
  }

  -[ABPKMLModelConfiguration3DLifting inputTensorNames](self->_mlConfig, "inputTensorNames");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputTensorNames = self->_inputTensorNames;
  self->_inputTensorNames = v4;

  -[ABPKMLModelConfiguration3DLifting outputTensorNames](self->_mlConfig, "outputTensorNames");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputTensorNames = self->_outputTensorNames;
  self->_outputTensorNames = v6;

  self->_useEspressoV2 = 0;
  -[ABPKMLModelConfiguration3DLifting compiledMLModelPath](self->_mlConfig, "compiledMLModelPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_13;
  if (!objc_msgSend(v8, "hasSuffix:", CFSTR(".bundle")))
  {
    context = (void *)espresso_create_context();
    self->_context = context;
    if (context)
    {
      Espresso::get_internal_context((Espresso *)context, v18);
      self->_plan = (void *)espresso_create_plan();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v19, "UTF8String");
      espresso_plan_add_network();
      espresso_plan_build();
      -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", 0);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "UTF8String");
      espresso_network_bind_buffer();

      v21 = MEMORY[0x24BDAC760];
      v22 = self->_inputTensorNames;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __30__ABPK3DLifting_initMLNetwork__block_invoke;
      v29[3] = &unk_24CA6E8C8;
      v29[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](v22, "enumerateObjectsUsingBlock:", v29);
      v23 = self->_outputTensorNames;
      v28[0] = v21;
      v28[1] = 3221225472;
      v28[2] = __30__ABPK3DLifting_initMLNetwork__block_invoke_2;
      v28[3] = &unk_24CA6E8C8;
      v28[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](v23, "enumerateObjectsUsingBlock:", v28);

      v24 = v31;
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      goto LABEL_6;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  self->_useEspressoV2 = 1;
  v10 = -[ABPKMLNetworkV2 initWithNetworkPath:inputNames:outputNames:useSurface:]([ABPKMLNetworkV2 alloc], "initWithNetworkPath:inputNames:outputNames:useSurface:", v9, self->_inputTensorNames, self->_outputTensorNames, 0);
  networkV2 = self->_networkV2;
  self->_networkV2 = v10;

  -[ABPKMLNetworkV2 inputBuffers](self->_networkV2, "inputBuffers");
  v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  inputBufferDict = self->inputBufferDict;
  self->inputBufferDict = v12;

  -[ABPKMLNetworkV2 outputBuffers](self->_networkV2, "outputBuffers");
  v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  outputBufferDict = self->outputBufferDict;
  self->outputBufferDict = v14;

LABEL_6:
  -[ABPK3DLifting _endLoading3DLiftingMLModelSignpost](self, "_endLoading3DLiftingMLModelSignpost");
  v16 = 1;
LABEL_14:

  return v16;
}

void __30__ABPK3DLifting_initMLNetwork__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = objc_retainAutorelease(a2);
  objc_msgSend(v2, "UTF8String", 0, 0, 0, 0);
  espresso_network_query_blob_dimensions();

}

void __30__ABPK3DLifting_initMLNetwork__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = objc_retainAutorelease(a2);
  objc_msgSend(v2, "UTF8String", 0, 0, 0, 0);
  espresso_network_query_blob_dimensions();

}

- (int)runLiftingModelWithData:(id)a3 atTimestamp:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *inputBufferDict;
  void *v11;
  void *v12;
  _WORD *v13;
  uint64_t i;
  __int128 v20;
  NSMutableDictionary *outputBufferDict;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t j;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  id v31;
  int v32;
  void *v33;
  __int128 *v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  _OWORD *data;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  float32x2_t v52;
  uint8_t *v53;
  ABPK3DLiftingResult *v54;
  ABPK3DLiftingResult *liftingResult;
  _OWORD v57[17];
  uint8_t buf[272];
  _OWORD v59[12];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ABPK3DLifting _startRunLiftingModelSignpostWithTimestamp:](self, "_startRunLiftingModelSignpostWithTimestamp:", a4);
  __ABPKLogSharedInstance();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v7, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Run Lifting Model With Data ", buf, 2u);
  }

  if (self->_useEspressoV2)
  {
    objc_msgSend(v6, "liftingData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "liftingData3D");

    inputBufferDict = self->inputBufferDict;
    -[NSArray objectAtIndexedSubscript:](self->_inputTensorNames, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](inputBufferDict, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (_WORD *)objc_msgSend(v12, "bytes");

    for (i = 0; i != 128; i += 4)
    {
      _S0 = *(_DWORD *)(v9 + i);
      __asm { FCVT            H0, S0 }
      *v13 = _S0;
      v13 += 32;
    }
    -[ABPKMLNetworkV2 execute](self->_networkV2, "execute");
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputTensorNames, "objectAtIndexedSubscript:", 0);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v31, "UTF8String");
    v32 = espresso_network_bind_buffer();

    if (v32)
      goto LABEL_13;
    objc_msgSend(v6, "liftingData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (__int128 *)objc_msgSend(v33, "liftingData3D");

    v35 = *(_OWORD **)buf;
    v36 = *v34;
    v37 = v34[1];
    v38 = v34[3];
    *(_OWORD *)(*(_QWORD *)buf + 32) = v34[2];
    v35[3] = v38;
    *v35 = v36;
    v35[1] = v37;
    v39 = v34[4];
    v40 = v34[5];
    v41 = v34[7];
    v35[6] = v34[6];
    v35[7] = v41;
    v35[4] = v39;
    v35[5] = v40;
    if (espresso_plan_execute_sync())
    {
LABEL_13:
      v42 = -6662;
      goto LABEL_18;
    }
  }
  -[ABPK3DLifting _endRunLiftingModelSignpostWithTimestamp:](self, "_endRunLiftingModelSignpostWithTimestamp:", a4);
  -[ABPK3DLifting _startPostProcessDataSignpostWithTimestamp:](self, "_startPostProcessDataSignpostWithTimestamp:", a4);
  if (self->_useEspressoV2)
  {
    outputBufferDict = self->outputBufferDict;
    -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](outputBufferDict, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "bytes");

    for (j = 0; j != 48; ++j)
    {
      v26 = self->outputBufferDict;
      -[NSArray objectAtIndexedSubscript:](self->_outputTensorNames, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _H0 = *(_WORD *)(v24 + 2 * objc_msgSend(v28, "strideChannels") * j);
      __asm { FCVT            S0, H0 }
      *((_DWORD *)v59 + j) = _S0;

    }
  }
  else
  {
    data = self->_outputTensor.data;
    v44 = data[9];
    v59[8] = data[8];
    v59[9] = v44;
    v45 = data[11];
    v59[10] = data[10];
    v59[11] = v45;
    v46 = data[5];
    v59[4] = data[4];
    v59[5] = v46;
    v47 = data[7];
    v59[6] = data[6];
    v59[7] = v47;
    v48 = data[1];
    v59[0] = *data;
    v59[1] = v48;
    v49 = data[3];
    v59[2] = data[2];
    v59[3] = v49;
  }
  v50 = 0;
  *(_OWORD *)buf = 0u;
  v57[0] = 0u;
  v51 = 1;
  do
  {
    *(_QWORD *)&v20 = *(_QWORD *)((char *)v59 + v50);
    v52 = vmla_f32(*(float32x2_t *)((char *)&unk_210881E70 + v50), *(float32x2_t *)((char *)&unk_210881F30 + v50), *(float32x2_t *)&v20);
    DWORD2(v20) = *(_DWORD *)((char *)v59 + v50 + 8);
    v53 = &buf[v51 * 16];
    *(_OWORD *)v53 = v20;
    v57[v51] = v20;
    *((float *)v53 + 2) = (float)(*(float *)((char *)&unk_210881E70 + v50 + 8)
                                + (float)(*((float *)&v20 + 2) * *(float *)((char *)&unk_210881F30 + v50 + 8)))
                        * 10.0;
    *(float32x2_t *)v53 = vmul_f32(v52, (float32x2_t)0x41200000C1200000);
    v50 += 12;
    ++v51;
  }
  while (v50 != 192);
  -[ABPK3DLifting _adjustBoneLength:](self, "_adjustBoneLength:", buf, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(10.0)), 524288.377, v57[0]);
  -[ABPK3DLifting _transformRelativeToHip:count:](self, "_transformRelativeToHip:count:", buf, 17);
  v54 = -[ABPK3DLiftingResult initWithJoints:numberOfJoints:rawNetworkOutputs:referenceDetectionResult:]([ABPK3DLiftingResult alloc], "initWithJoints:numberOfJoints:rawNetworkOutputs:referenceDetectionResult:", buf, 17, v57, v6);
  liftingResult = self->_liftingResult;
  self->_liftingResult = v54;

  -[ABPK3DLifting _endPostProcessDataSignpostWithTimestamp:](self, "_endPostProcessDataSignpostWithTimestamp:", a4);
  v42 = 0;
LABEL_18:

  return v42;
}

- (id)getLiftingResults
{
  return self->_liftingResult;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)get3DLiftingResultsAsModelPoses
{
  uint64_t v3;
  uint64_t v4;
  __int128 *v5;
  float32x4_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float32x4_t v11;
  float32x4_t *v12;
  float32x4_t v14;

  v3 = 0;
  v4 = 0;
  v5 = (__int128 *)MEMORY[0x24BDAEE00];
  v14 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  do
  {
    v6 = *(float32x4_t *)(-[ABPK3DLiftingResult joints](self->_liftingResult, "joints", *(_OWORD *)&v14) + v4);
    v7 = (_OWORD *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    v8 = *v5;
    v9 = v5[1];
    v10 = v5[3];
    v7[2] = v5[2];
    v7[3] = v10;
    *v7 = v8;
    v7[1] = v9;
    v11 = vdivq_f32(v6, v14);
    v12 = (float32x4_t *)((char *)self->_liftingResultAsModelPoses.__begin_ + v3);
    v11.i32[3] = v12[3].i32[3];
    v12[3] = v11;
    v4 += 16;
    v3 += 64;
  }
  while (v4 != 272);
  return self->_liftingResultAsModelPoses.__begin_;
}

- (void)_adjustBoneLength:(ABPK3DLifting *)self
{
  float32x4_t *v2;
  float32x4_t *v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[16];
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _OWORD buf[17];
  uint64_t v37;

  v3 = v2;
  v37 = *MEMORY[0x24BDAC8D0];
  __ABPKLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_210836000, v5, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: Adjust bone length ", (uint8_t *)buf, 2u);
  }

  memcpy(buf, v3, sizeof(buf));
  __ABPKLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_DEBUG, " ABPK3DLifting: _abpkLiftingSkeletonDefinition once init ", v31, 2u);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  *(_OWORD *)v31 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ABPKSkeletonDefinition getChildrenIndices:](self->_abpkLiftingSkeletonDefinition, "getChildrenIndices:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "intValue");
        std::deque<std::pair<int,int>>::push_back(v31, &v26);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v8);
  }

  for (i = *((_QWORD *)&v33 + 1); *((_QWORD *)&v33 + 1); i = *((_QWORD *)&v33 + 1))
  {
    v12 = (int *)(*(_QWORD *)(*(_QWORD *)&v31[8] + (((unint64_t)v33 >> 6) & 0x3FFFFFFFFFFFFF8))
                + 8 * (v33 & 0x1FF));
    v14 = *v12;
    v13 = v12[1];
    *(_QWORD *)&v33 = v33 + 1;
    *((_QWORD *)&v33 + 1) = i - 1;
    if ((unint64_t)v33 >= 0x400)
    {
      operator delete(**(void ***)&v31[8]);
      *(_QWORD *)&v31[8] += 8;
      *(_QWORD *)&v33 = v33 - 512;
    }
    v15 = vsubq_f32(v3[v14], v3[v13]);
    v16 = vmulq_f32(v15, v15);
    v16.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).u64[0];
    v16.f32[0] = sqrtf(v16.f32[0]);
    buf[v14] = vmlaq_n_f32((float32x4_t)buf[v13], vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 0)), -[ABPK3DLifting _adjustBoneLength:]::bones[v14] * 1000.0);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[ABPKSkeletonDefinition getChildrenIndices:](self->_abpkLiftingSkeletonDefinition, "getChildrenIndices:", v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v23;
      v20 = v14 << 32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v17);
          v26 = v20 | objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21), "intValue");
          std::deque<std::pair<int,int>>::push_back(v31, &v26);
          ++v21;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v18);
    }

  }
  memcpy(v3, buf, 0x110uLL);
  std::deque<std::pair<int,int>>::~deque[abi:ne180100](v31);
}

- (void)_transformRelativeToHip:(ABPK3DLifting *)self count:(SEL)a2
{
  float32x2_t *v2;
  uint64_t v3;
  float32x4_t v4;
  int32x4_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x4_t v8;
  float32x4_t v9;
  int32x4_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  float32x2_t v23;
  float32x2_t v24;
  int32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;

  if (v3)
  {
    v4 = *(float32x4_t *)v2[14].f32;
    v5 = (int32x4_t)vmulq_f32(v4, v4);
    v5.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v5, 2), vadd_f32(*(float32x2_t *)v5.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v5.i8, 1))).u32[0];
    v6 = vrsqrte_f32((float32x2_t)v5.u32[0]);
    v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v6, v6)));
    v8 = vmulq_n_f32(v4, vmul_f32(v7, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v7, v7))).f32[0]);
    v9 = *(float32x4_t *)v2[8].f32;
    v10 = (int32x4_t)vmulq_f32(v9, v9);
    v10.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2), vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1))).u32[0];
    v11 = vrsqrte_f32((float32x2_t)v10.u32[0]);
    v12 = vmul_f32(v11, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v11, v11)));
    v13 = vmulq_n_f32(v9, vmul_f32(v12, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v12, v12))).f32[0]);
    v14 = vmulq_f32(v8, v13);
    v15 = vmlsq_lane_f32(v8, v13, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))), 0);
    v16 = (int32x4_t)vmulq_f32(v15, v15);
    v16.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1))).u32[0];
    v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
    v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
    v19 = vmulq_n_f32(v15, vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]);
    v20 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19), (int8x16_t)v19, 0xCuLL), vnegq_f32(v13)), v19, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL));
    v21 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL);
    v22 = (int32x4_t)vmulq_f32(v20, v20);
    v22.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), *(float32x2_t *)v22.i8)).u32[0];
    v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
    v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
    v25 = (int32x4_t)vmulq_n_f32(v21, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
    v26 = (float32x4_t)vzip1q_s32((int32x4_t)v13, (int32x4_t)v19);
    v26.i32[2] = v25.i32[0];
    v27 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v13, v25), vdupq_lane_s32(*(int32x2_t *)v19.f32, 1));
    v28 = (float32x4_t)vzip2q_s32((int32x4_t)v13, (int32x4_t)v19);
    v28.i32[2] = v25.i32[2];
    do
    {
      *(float32x4_t *)v2->f32 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(_OWORD *)v2->f32)), v27, *v2, 1), v28, *(float32x4_t *)v2->f32, 2);
      v2 += 2;
      --v3;
    }
    while (v3);
  }
}

- (void)_startLoading3DLiftingMLModelSignpost
{
  kdebug_trace();
}

- (void)_endLoading3DLiftingMLModelSignpost
{
  kdebug_trace();
}

- (void)_startPrepareLiftingInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endPrepareLiftingInputSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startPostProcessDataSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endPostProcessDataSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_startRunLiftingModelSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void)_endRunLiftingModelSignpostWithTimestamp:(double)a3
{
  kdebug_trace();
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_mlConfig, 0);
  objc_storeStrong((id *)&self->_abpkLiftingSkeletonDefinition, 0);
  begin = self->_liftingResultAsModelPoses.__begin_;
  if (begin)
  {
    self->_liftingResultAsModelPoses.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_liftingResult, 0);
  objc_storeStrong((id *)&self->outputBufferDict, 0);
  objc_storeStrong((id *)&self->inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  return self;
}

@end
