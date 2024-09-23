@implementation CSUImageCaptioningDecoderAXKVCacheE1

- (CSUImageCaptioningDecoderAXKVCacheE1)initWithConfiguration:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CSUImageCaptioningDecoderAXKVCacheE1 *v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CSUImageCaptioningDecoderAXKVCacheE1 *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CSUImageCaptioningDecoderAXKVCacheE1;
  v10 = -[CSUImageCaptioningDecoderAXKVCacheE1 init](&v34, sel_init);
  if (v10)
  {
    objc_msgSend_supportedComputeDevices(v5, v6, v7, v8, v9);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v30, (uint64_t)v35, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_setComputeDevice_(v5, v13, v17, v18, v19, (_QWORD)v30);

              objc_storeStrong((id *)&v10->_configuration, a3);
              v28 = v10;
              goto LABEL_16;
            }
          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v30, (uint64_t)v35, 16);
      }
      while (v14);
    }

    sub_23A016E78();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_23A09E4C4(v20, v21, v22, v23, v24, v25, v26, v27);

    v28 = 0;
LABEL_16:

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)loadPostProcUtilsWithBeamWidth:(int)a3 error:(id *)a4
{
  uint64_t v5;
  CSUCaptioningProcUtils *v7;
  const char *v8;
  CSUCaptioningProcUtils *v9;
  CSUCaptioningProcUtils *procUtils;

  v5 = *(_QWORD *)&a3;
  v7 = [CSUCaptioningProcUtils alloc];
  v9 = (CSUCaptioningProcUtils *)objc_msgSend_initWithDecoderConfiguration_beamWidth_beamScorerType_error_(v7, v8, (uint64_t)self->_configuration, v5, 1, a4);
  procUtils = self->_procUtils;
  self->_procUtils = v9;

  return self->_procUtils != 0;
}

- (BOOL)loadDecoderObj:(id *)a3
{
  CSUImageCaptionDecoderAXKVCacheE1Network *v5;
  CSUImageCaptionDecoderAXKVCacheE1Network *decoderNetObj;
  uint64_t v7;

  v5 = (CSUImageCaptionDecoderAXKVCacheE1Network *)objc_opt_new();
  decoderNetObj = self->_decoderNetObj;
  self->_decoderNetObj = v5;

  return MEMORY[0x24BEDD108](self->_decoderNetObj, sel_loadDecoderNetworkfromConfiguration_error_, self->_configuration, a3, v7);
}

- (BOOL)loadDecoder:(id *)a3
{
  uint64_t v3;
  char PostProcUtilsWithBeamWidth_error;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char DecoderObj;
  id v14;
  BOOL v15;
  id v16;
  id v17;

  if (self->_decoderNetObj)
    return 1;
  v17 = 0;
  PostProcUtilsWithBeamWidth_error = objc_msgSend_loadPostProcUtilsWithBeamWidth_error_(self, a2, 3, (uint64_t)&v17, v3);
  v8 = v17;
  v12 = v8;
  if ((PostProcUtilsWithBeamWidth_error & 1) != 0)
  {
    v16 = v8;
    DecoderObj = objc_msgSend_loadDecoderObj_(self, v9, (uint64_t)&v16, v10, v11);
    v14 = v16;

    if ((DecoderObj & 1) != 0)
    {
      v15 = 1;
LABEL_12:
      v12 = v14;
      goto LABEL_13;
    }
    if (!a3)
    {
      v15 = 0;
      goto LABEL_12;
    }
    v12 = v14;
    goto LABEL_10;
  }
  if (a3)
  {
LABEL_10:
    v12 = objc_retainAutorelease(v12);
    v15 = 0;
    *a3 = v12;
    goto LABEL_13;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;

  if (self->_decoderNetObj)
    return 1;
  else
    return objc_msgSend_loadDecoder_(self, a2, (uint64_t)a3, v3, v4);
}

- (BOOL)compareTensorShapesForShape1:(const void *)a3 Shape2:(const void *)a4
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD **)a3;
  v5 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (!v5)
    return 1;
  v6 = v5 >> 3;
  v7 = *(_QWORD **)a4;
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = v6;
  if (*v4 != *v7)
    return 0;
  v9 = 1;
  do
  {
    v10 = v9;
    if (v8 == v9)
      break;
    v11 = v4[v9];
    v12 = v7[v9++];
  }
  while (v11 == v12);
  return v10 >= v6;
}

- (ModelOutput)nextTokensForInputs:(SEL)a3 KVCache:(const void *)a4 AndforMaskPosition:(const void *)a5
{
  CSUImageCaptionDecoderAXKVCacheE1Network *decoderNetObj;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CSUImageCaptionDecoderAXKVCacheE1Network *v21;
  ModelOutput *result;
  id v23;

  decoderNetObj = self->_decoderNetObj;
  v11 = a6;
  v23 = 0;
  objc_msgSend_buildNetworkForSequenceLength_error_(decoderNetObj, a3, a6, (uint64_t)&v23, *(uint64_t *)&a6);
  v15 = v23;
  if (v15)
  {
    objc_msgSend_logInternalError_(CSUError, v12, (uint64_t)v15, v13, v14);
    v16 = 0uLL;
    *(shared_ptr<std::unordered_map<std::string, std::vector<float>>> *)((char *)&retstr->var1 + 1) = 0u;
  }
  else
  {
    objc_msgSend_copyInputContextIDs_EncoderFeatures_KVCache_MaskPosition_(self->_decoderNetObj, v12, (uint64_t)a4, (uint64_t)&self->_encodedFeaturesBuffer, (uint64_t)a5, v11);
    v21 = self->_decoderNetObj;
    if (v21)
    {
      objc_msgSend_predict(v21, v17, v18, v19, v20);
      goto LABEL_6;
    }
    v16 = 0uLL;
    *(_OWORD *)&retstr->var1.var1 = 0u;
  }
  *(_OWORD *)&retstr->var0.__begin_ = v16;
  *(_OWORD *)&retstr->var0.__end_cap_.__value_ = v16;
LABEL_6:

  return result;
}

- (BOOL)populateInputBuffer:(id)a3 WithError:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int32x4_t *v12;
  int32x4_t *v13;
  int64_t v14;
  char *v15;
  int v16;
  int32x4_t *v17;
  uint64_t v18;
  unint64_t v19;
  int32x4_t *v20;
  int32x4_t v21;
  uint64_t v22;
  int32x4_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int8x16_t v28;
  int v29;
  _OWORD *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *p_shared_owners;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  __shared_weak_count *v60;
  TensorStorage *v61;
  unint64_t *v62;
  unint64_t v63;
  __shared_weak_count *cntrl;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  std::runtime_error *exception;
  __int16 v79;
  uint64_t (**v80)();
  std::__shared_weak_count *v81;
  void *__p;
  char *v83;
  TensorStorage *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  char *v88;
  void *v89;
  void *v90;
  char *v91;
  uint64_t (**v92)();
  void *v93;
  int32x4_t *v94;
  std::__shared_weak_count *v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_63;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_63:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v11 = objc_msgSend_espressoBuffer(v6, v7, v8, v9, v10);

  LOWORD(v80) = 1;
  sub_239FF3910((uint64_t)&v92, v11, &v80);
  v89 = 0;
  v90 = 0;
  v91 = 0;
  v12 = (int32x4_t *)v93;
  v13 = v94;
  v14 = (char *)v94 - (_BYTE *)v93;
  if (v94 != v93)
  {
    if (v14 < 0)
      sub_239FEBE68();
    v89 = operator new((char *)v94 - (_BYTE *)v93);
    v90 = v89;
    v15 = (char *)v89 + 8 * (v14 >> 3);
    v91 = v15;
    memcpy(v89, v12, v14);
    v90 = v15;
    if ((unint64_t)(v14 - 8) >= 0x38)
    {
      v19 = ((unint64_t)(v14 - 8) >> 3) + 1;
      v17 = (int32x4_t *)((char *)v12 + 8 * (v19 & 0x3FFFFFFFFFFFFFF8));
      v20 = v12 + 2;
      v21.i64[0] = 0x100000001;
      v21.i64[1] = 0x100000001;
      v22 = v19 & 0x3FFFFFFFFFFFFFF8;
      v23.i64[0] = 0x100000001;
      v23.i64[1] = 0x100000001;
      do
      {
        v25 = v20[-2];
        v24 = v20[-1];
        v27 = *v20;
        v26 = v20[1];
        v20 += 4;
        v21 = vmulq_s32(v21, vuzp1q_s32(v25, v24));
        v23 = vmulq_s32(v23, vuzp1q_s32(v27, v26));
        v22 -= 8;
      }
      while (v22);
      v28 = (int8x16_t)vmulq_s32(v23, v21);
      *(int32x2_t *)v28.i8 = vmul_s32(*(int32x2_t *)v28.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
      v16 = v28.i32[0] * v28.i32[1];
      if (v19 == (v19 & 0x3FFFFFFFFFFFFFF8))
        goto LABEL_12;
    }
    else
    {
      v16 = 1;
      v17 = v12;
    }
    do
    {
      v29 = v17->i32[0];
      v17 = (int32x4_t *)((char *)v17 + 8);
      v16 *= v29;
    }
    while (v17 != v13);
LABEL_12:
    v18 = v16;
    goto LABEL_13;
  }
  v18 = 0;
LABEL_13:
  v30 = operator new(0x28uLL);
  v87 = (char *)v30 + 40;
  v88 = (char *)v30 + 40;
  *v30 = 0u;
  v30[1] = 0u;
  *((_QWORD *)v30 + 4) = 0;
  v86 = v30;
  objc_msgSend_decoderNet(self->_decoderNetObj, v31, v32, v33, v34);
  objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v35, v36, v37, v38);
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v39, v40, v41, v42, v43);
  espresso_network_query_blob_shape();

  v47 = v81;
  if (!v81)
    goto LABEL_17;
  p_shared_owners = (unint64_t *)&v81->__shared_owners_;
  do
    v49 = __ldaxr(p_shared_owners);
  while (__stlxr(v49 - 1, p_shared_owners));
  if (v49)
  {
LABEL_17:
    v50 = v96;
    if (v96)
      goto LABEL_18;
LABEL_46:
    v52 = 1;
    if (v18 == 1)
      goto LABEL_26;
    goto LABEL_47;
  }
  ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
  std::__shared_weak_count::__release_weak(v47);
  v50 = v96;
  if (!v96)
    goto LABEL_46;
LABEL_18:
  if (v50 == 1)
  {
    v51 = 0;
    v52 = 1;
LABEL_23:
    v57 = v50 - v51;
    v58 = (uint64_t *)((char *)v86 + 8 * v51);
    do
    {
      v59 = *v58++;
      v52 *= v59;
      --v57;
    }
    while (v57);
    goto LABEL_25;
  }
  v51 = v50 & 0xFFFFFFFFFFFFFFFELL;
  v53 = (char *)v86 + 8;
  v54 = 1;
  v55 = v50 & 0xFFFFFFFFFFFFFFFELL;
  v56 = 1;
  do
  {
    v54 *= *(v53 - 1);
    v56 *= *v53;
    v53 += 2;
    v55 -= 2;
  }
  while (v55);
  v52 = v56 * v54;
  if (v50 != v51)
    goto LABEL_23;
LABEL_25:
  if (v18 == v52)
  {
LABEL_26:
    if ((objc_msgSend_compareTensorShapesForShape1_Shape2_(self, v44, (uint64_t)&v89, (uint64_t)&v86, v46) & 1) == 0)
      espresso_buffer_pack_tensor_shape();
    v79 = 1;
    sub_239FF3910((uint64_t)&v80, v11, &v79);
    self->_encodedFeaturesBuffer.type_ = (int)v81;
    if (&self->_encodedFeaturesBuffer != (EspressoTensor *)&v80)
      sub_239FF49DC(&self->_encodedFeaturesBuffer.shape_.sizes_.__begin_, (char *)__p, v83, (v83 - (_BYTE *)__p) >> 3);
    v61 = v84;
    v60 = (__shared_weak_count *)v85;
    if (v85)
    {
      v62 = (unint64_t *)(v85 + 8);
      do
        v63 = __ldxr(v62);
      while (__stxr(v63 + 1, v62));
    }
    cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
    self->_encodedFeaturesBuffer.storage_.__ptr_ = v61;
    self->_encodedFeaturesBuffer.storage_.__cntrl_ = v60;
    if (cntrl)
    {
      v65 = (unint64_t *)((char *)cntrl + 8);
      do
        v66 = __ldaxr(v65);
      while (__stlxr(v66 - 1, v65));
      if (!v66)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v80 = &off_250B0DCE8;
    v67 = (std::__shared_weak_count *)v85;
    if (v85)
    {
      v68 = (unint64_t *)(v85 + 8);
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
        std::__shared_weak_count::__release_weak(v67);
      }
    }
    if (__p)
    {
      v83 = (char *)__p;
      operator delete(__p);
    }
    goto LABEL_49;
  }
LABEL_47:
  if (a4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v44, (uint64_t)CFSTR("the features fed to the decoder has %zu elements, but the decoder model is expected to have %zu elements for the node corresponding to the encoder feature input"), v45, v46, v18, v52);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v71, (uint64_t)v70, v72, v73);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_49:
  if (v86)
  {
    v87 = v86;
    operator delete(v86);
  }
  if (v89)
  {
    v90 = v89;
    operator delete(v89);
  }
  v92 = &off_250B0DCE8;
  v74 = v95;
  if (v95)
  {
    v75 = (unint64_t *)&v95->__shared_owners_;
    do
      v76 = __ldaxr(v75);
    while (__stlxr(v76 - 1, v75));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
  if (v93)
  {
    v94 = (int32x4_t *)v93;
    operator delete(v93);
  }

  return v18 == v52;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v9 = a3;
  if ((objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0
    && objc_msgSend_populateInputBuffer_WithError_(self, v13, (uint64_t)v9, (uint64_t)a6, v14))
  {
    if (a4)
      objc_msgSend_getCaptionsAfterBeamSearchDecodingOnEncodedFeatures(self, v15, v16, v17, v18);
    else
      objc_msgSend_getCaptionsAfterGreedyDecodingOnEncodedFeatures(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
  else
  {

    return 0;
  }
}

- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CSUCaptioningProcUtils *procUtils;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  void *v16;
  _DWORD *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  char *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  float v41;
  _BYTE *v42;
  _BYTE *v43;
  int64_t v44;
  std::__shared_weak_count *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  int v53;
  std::__shared_weak_count *v54;
  NSObject *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  void *v73;
  unint64_t *v74;
  unint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _DWORD **v80;
  _DWORD **v81;
  _DWORD *v82;
  _DWORD *v83;
  uint64_t v84;
  size_t v85;
  unint64_t v86;
  __int128 *v87;
  unint64_t v88;
  size_t v89;
  __int128 *v90;
  uint64_t v91;
  _BYTE *v92;
  unint64_t v93;
  uint64_t v94;
  _BYTE *v95;
  _BYTE *v96;
  int v97;
  __int128 *v98;
  size_t v99;
  unint64_t v100;
  size_t v101;
  unint64_t v102;
  void **v103;
  unint64_t v104;
  size_t v105;
  void **v106;
  size_t v107;
  char *v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  char *v112;
  std::__shared_weak_count *v113;
  unint64_t *v114;
  unint64_t v115;
  void *v116;
  int v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  CSUCaptionResult *v127;
  double v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  id v141;
  char *v142;
  _QWORD *v143;
  void *v144;
  char *v145;
  void *v146;
  void *v147;
  _DWORD *v149;
  _DWORD **v150;
  id v151;
  _DWORD **v152;
  void *v153;
  CSUImageCaptioningDecoderAXKVCacheE1 *v154;
  int v155;
  _DWORD *v156;
  uint64_t v157;
  std::__shared_weak_count *v158;
  void *v159;
  char *v160;
  uint8_t v161;
  char v162[15];
  void *v163[2];
  int64_t v164;
  std::__shared_weak_count *v165;
  unsigned __int8 v166;
  uint64_t v167;
  std::__shared_weak_count *v168;
  void *__p;
  std::__shared_weak_count *v170;
  std::__shared_weak_count *v171;
  __int128 v172;
  int64_t v173;
  uint64_t v174;
  std::__shared_weak_count *v175;
  __int128 v176;
  _DWORD *v177;

  v149 = operator new(4uLL);
  *v149 = 0;
  v154 = self;
  procUtils = self->_procUtils;
  if (procUtils)
  {
    objc_msgSend_beamSearch(procUtils, v3, v4, v5, v6);
    v8 = v157;
    v10 = v157 + 192;
    v9 = *(char **)(v157 + 192);
    if (!v9)
      goto LABEL_18;
LABEL_5:
    v11 = *(char **)(v8 + 200);
    v12 = v9;
    if (v11 == v9)
    {
LABEL_17:
      *(_QWORD *)(v8 + 200) = v9;
      operator delete(v12);
      goto LABEL_18;
    }
    while (1)
    {
      v13 = (std::__shared_weak_count *)*((_QWORD *)v11 - 1);
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
          break;
      }
      v16 = (void *)*((_QWORD *)v11 - 5);
      if (v16)
        goto LABEL_13;
LABEL_7:
      v11 -= 48;
      if (v11 == v9)
      {
        v12 = *(char **)v10;
        goto LABEL_17;
      }
    }
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    v16 = (void *)*((_QWORD *)v11 - 5);
    if (!v16)
      goto LABEL_7;
LABEL_13:
    *((_QWORD *)v11 - 4) = v16;
    operator delete(v16);
    goto LABEL_7;
  }
  v8 = 0;
  v158 = 0;
  v10 = 192;
  v9 = (char *)MEMORY[0xC0];
  if (MEMORY[0xC0])
    goto LABEL_5;
LABEL_18:
  *(_QWORD *)v10 = 0;
  *(_QWORD *)(v10 + 8) = 0;
  *(_QWORD *)(v10 + 16) = 0;
  v17 = operator new(4uLL);
  v175 = 0;
  *(_QWORD *)&v176 = v17;
  *v17 = *v149;
  *((_QWORD *)&v176 + 1) = v17 + 1;
  v177 = v17 + 1;
  v174 = 0;
  sub_23A01C6D0(v10 - 24, &v176, &v174, 0.00000011921);
  v18 = v175;
  if (v175)
  {
    v19 = (unint64_t *)&v175->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if ((_QWORD)v176)
  {
    *((_QWORD *)&v176 + 1) = v176;
    operator delete((void *)v176);
  }
  v21 = *(_DWORD *)v8 - 1;
  if (*(_BYTE *)(v8 + 16) && *(_DWORD *)(v8 + 12) < v21)
    v21 = *(_DWORD *)(v8 + 12);
  sub_23A01C8B8(v10 - 24, (uint64_t *)&v172);
  if (v21 >= 1)
  {
    v22 = 0;
    v155 = v21;
    while (1)
    {
      v24 = *(char **)v10;
      if (!*(_QWORD *)v10)
        goto LABEL_47;
      v25 = *(char **)(v8 + 200);
      v26 = *(char **)v10;
      if (v25 != v24)
        break;
LABEL_46:
      *(_QWORD *)(v8 + 200) = v24;
      operator delete(v26);
LABEL_47:
      *(_QWORD *)v10 = 0;
      *(_QWORD *)(v10 + 8) = 0;
      *(_QWORD *)(v10 + 16) = 0;
      v31 = *((_QWORD *)&v172 + 1);
      v32 = v172;
      if ((_QWORD)v172 != *((_QWORD *)&v172 + 1))
      {
        v33 = 0;
        while (1)
        {
          v34 = (uint64_t *)(v32 + 8);
          if (!*(_BYTE *)(v8 + 8))
            break;
          v35 = *(_QWORD *)(v8 + 128);
          if (*(char *)(v35 + 55) < 0)
          {
            v36 = *(_QWORD *)(v35 + 32);
            v37 = *(_QWORD *)(v35 + 40);
          }
          else
          {
            v36 = v35 + 32;
            v37 = *(unsigned __int8 *)(v35 + 55);
          }
          v39 = *(_DWORD *)(*(_QWORD *)(v32 + 16) - 4);
          v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v35 + 32))(v35, v36, v37);
          v38 = *v34;
          if (v39 != v40 || (unint64_t)(*(_QWORD *)(v32 + 16) - v38) < 5)
            goto LABEL_70;
          v41 = *(float *)v32;
          v170 = 0;
          v171 = 0;
          __p = 0;
          v43 = *(_BYTE **)(v32 + 8);
          v42 = *(_BYTE **)(v32 + 16);
          v44 = v42 - v43;
          if (v42 != v43)
          {
            if (v44 < 0)
              sub_239FEBE68();
            __p = operator new(v42 - v43);
            v170 = (std::__shared_weak_count *)__p;
            v45 = (std::__shared_weak_count *)((char *)__p + 4 * (v44 >> 2));
            v171 = v45;
            memcpy(__p, v43, v44);
            v170 = v45;
          }
          v46 = *(std::__shared_weak_count **)(v32 + 40);
          v167 = *(_QWORD *)(v32 + 32);
          v168 = v46;
          if (v46)
          {
            v47 = (unint64_t *)&v46->__shared_owners_;
            do
              v48 = __ldxr(v47);
            while (__stxr(v48 + 1, v47));
          }
          sub_23A01C6D0(v10 - 24, &__p, &v167, v41);
          v49 = v168;
          if (v168)
          {
            v50 = (unint64_t *)&v168->__shared_owners_;
            do
              v51 = __ldaxr(v50);
            while (__stlxr(v51 - 1, v50));
            if (!v51)
            {
              ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
              std::__shared_weak_count::__release_weak(v49);
              ++v33;
              v52 = (std::__shared_weak_count *)__p;
              if (!__p)
                goto LABEL_50;
LABEL_69:
              v170 = v52;
              operator delete(v52);
              goto LABEL_50;
            }
          }
          ++v33;
          v52 = (std::__shared_weak_count *)__p;
          if (__p)
            goto LABEL_69;
LABEL_50:
          v32 += 48;
          if (v32 == v31)
            goto LABEL_85;
        }
        v38 = *v34;
LABEL_70:
        sub_23A02FC18((uint64_t)v163, v8, v38, *(_QWORD *)(v32 + 16), v154, v22, v32 + 32);
        v53 = v166;
        if (v166)
        {
          (***(void (****)(_QWORD, void **))(v8 + 152))(*(_QWORD *)(v8 + 152), v163);
          sub_23A01CF9C(v8, (uint64_t)v163, v32 + 8, *(float *)v32);
          v54 = v165;
          if (!v165)
            goto LABEL_79;
        }
        else
        {
          sub_23A016E78();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            sub_23A09DEE8(&v161, v162, v55);

            v54 = v165;
            if (!v165)
              goto LABEL_79;
          }
          else
          {

            v54 = v165;
            if (!v165)
              goto LABEL_79;
          }
        }
        v56 = (unint64_t *)&v54->__shared_owners_;
        do
          v57 = __ldaxr(v56);
        while (__stlxr(v57 - 1, v56));
        if (!v57)
        {
          ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
          std::__shared_weak_count::__release_weak(v54);
        }
LABEL_79:
        if (v163[0])
        {
          v163[1] = v163[0];
          operator delete(v163[0]);
        }
        if (!v53)
        {
LABEL_85:
          v59 = *(_QWORD *)(v8 + 192);
          v58 = *(_QWORD *)(v8 + 200);
          v21 = v155;
          goto LABEL_87;
        }
        goto LABEL_50;
      }
      v59 = 0;
      v58 = 0;
      v33 = 0;
LABEL_87:
      if (v33 == -1431655765 * ((unint64_t)(v58 - v59) >> 4))
      {
        sub_23A016E78();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          sub_23A09DE78(v22, v66);

        goto LABEL_103;
      }
      sub_23A01C8B8(v10 - 24, (uint64_t *)v163);
      v60 = v172;
      if (!(_QWORD)v172)
        goto LABEL_32;
      v61 = *((_QWORD *)&v172 + 1);
      v23 = (void *)v172;
      if (*((_QWORD *)&v172 + 1) != (_QWORD)v172)
      {
        while (1)
        {
          v62 = *(std::__shared_weak_count **)(v61 - 8);
          if (v62)
          {
            v63 = (unint64_t *)&v62->__shared_owners_;
            do
              v64 = __ldaxr(v63);
            while (__stlxr(v64 - 1, v63));
            if (!v64)
              break;
          }
          v65 = *(void **)(v61 - 40);
          if (v65)
            goto LABEL_97;
LABEL_91:
          v61 -= 48;
          if (v61 == v60)
          {
            v23 = (void *)v172;
            goto LABEL_31;
          }
        }
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
        v65 = *(void **)(v61 - 40);
        if (!v65)
          goto LABEL_91;
LABEL_97:
        *(_QWORD *)(v61 - 32) = v65;
        operator delete(v65);
        goto LABEL_91;
      }
LABEL_31:
      *((_QWORD *)&v172 + 1) = v60;
      operator delete(v23);
LABEL_32:
      v172 = *(_OWORD *)v163;
      v173 = v164;
      v22 = (v22 + 1);
      if ((_DWORD)v22 == v21)
        goto LABEL_103;
    }
    while (1)
    {
      v27 = (std::__shared_weak_count *)*((_QWORD *)v25 - 1);
      if (v27)
      {
        v28 = (unint64_t *)&v27->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
          break;
      }
      v30 = (void *)*((_QWORD *)v25 - 5);
      if (v30)
        goto LABEL_42;
LABEL_36:
      v25 -= 48;
      if (v25 == v24)
      {
        v26 = *(char **)v10;
        goto LABEL_46;
      }
    }
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
    v30 = (void *)*((_QWORD *)v25 - 5);
    if (!v30)
      goto LABEL_36;
LABEL_42:
    *((_QWORD *)v25 - 4) = v30;
    operator delete(v30);
    goto LABEL_36;
  }
LABEL_103:
  v67 = v172;
  if (!(_QWORD)v172)
    goto LABEL_117;
  v68 = *((_QWORD *)&v172 + 1);
  v69 = (void *)v172;
  if (*((_QWORD *)&v172 + 1) != (_QWORD)v172)
  {
    while (1)
    {
      v70 = *(std::__shared_weak_count **)(v68 - 8);
      if (v70)
      {
        v71 = (unint64_t *)&v70->__shared_owners_;
        do
          v72 = __ldaxr(v71);
        while (__stlxr(v72 - 1, v71));
        if (!v72)
          break;
      }
      v73 = *(void **)(v68 - 40);
      if (v73)
        goto LABEL_112;
LABEL_106:
      v68 -= 48;
      if (v68 == v67)
      {
        v69 = (void *)v172;
        goto LABEL_116;
      }
    }
    ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
    std::__shared_weak_count::__release_weak(v70);
    v73 = *(void **)(v68 - 40);
    if (!v73)
      goto LABEL_106;
LABEL_112:
    *(_QWORD *)(v68 - 32) = v73;
    operator delete(v73);
    goto LABEL_106;
  }
LABEL_116:
  *((_QWORD *)&v172 + 1) = v67;
  operator delete(v69);
LABEL_117:
  sub_23A01C4B4(v10 - 24, (uint64_t)&v159);
  if (v158)
  {
    v74 = (unint64_t *)&v158->__shared_owners_;
    do
      v75 = __ldaxr(v74);
    while (__stlxr(v75 - 1, v74));
    if (!v75)
    {
      ((void (*)(std::__shared_weak_count *))v158->__on_zero_shared)(v158);
      std::__shared_weak_count::__release_weak(v158);
    }
  }
  v151 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v80 = (_DWORD **)v159;
  v150 = (_DWORD **)v160;
  if (v159 == v160)
    goto LABEL_215;
  while (2)
  {
    HIBYTE(v164) = 0;
    LOBYTE(v163[0]) = 0;
    v81 = v80;
    v82 = *v80;
    v152 = v81;
    v83 = v81[1];
    v156 = v83;
    while (v82 != v83)
    {
      if (!*v82)
        goto LABEL_126;
      objc_msgSend_vocabulary(v154->_procUtils, v76, v77, v78, v79);
      (*(void (**)(__int128 *__return_ptr, void *, _QWORD))(*(_QWORD *)__p + 40))(&v172, __p, *v82);
      v84 = HIBYTE(v173);
      if (v173 >= 0)
        v85 = 22;
      else
        v85 = (v173 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v173 < 0)
        v84 = *((_QWORD *)&v172 + 1);
      if (v85 == v84)
      {
        if (v85 == 0x7FFFFFFFFFFFFFF6)
          sub_239FEBDE0();
        v86 = v85 + 1;
        if (v173 >= 0)
          v87 = &v172;
        else
          v87 = (__int128 *)v172;
        if (v85 >= 0x3FFFFFFFFFFFFFF3)
        {
          v89 = 0x7FFFFFFFFFFFFFF7;
        }
        else
        {
          v88 = 2 * v85;
          if (v86 > 2 * v85)
            v88 = v85 + 1;
          if (v88 >= 0x17)
          {
            v93 = (v88 & 0xFFFFFFFFFFFFFFF8) + 8;
            v94 = v88 | 7;
            if (v94 == 23)
              v94 = v93;
            v89 = v94 + 1;
          }
          else
          {
            v89 = 23;
          }
        }
        v95 = operator new(v89);
        v96 = v95;
        if (v85)
        {
          memmove(v95, v87, v85);
          v96[v85] = 32;
          if (v85 == 22)
            goto LABEL_159;
        }
        else
        {
          *v95 = 32;
        }
        operator delete(v87);
LABEL_159:
        *((_QWORD *)&v172 + 1) = v85 + 1;
        v173 = v89 | 0x8000000000000000;
        *(_QWORD *)&v172 = v96;
        v92 = &v96[v86];
        goto LABEL_160;
      }
      v90 = &v172;
      if (v173 < 0)
        v90 = (__int128 *)v172;
      *((_BYTE *)v90 + v84) = 32;
      v91 = v84 + 1;
      if (SHIBYTE(v173) < 0)
        *((_QWORD *)&v172 + 1) = v91;
      else
        HIBYTE(v173) = v91 & 0x7F;
      v92 = (char *)v90 + v91;
LABEL_160:
      *v92 = 0;
      v177 = (_DWORD *)v173;
      v176 = v172;
      v173 = 0;
      v172 = 0uLL;
      v97 = SHIBYTE(v177);
      v153 = (void *)v176;
      if (SHIBYTE(v177) >= 0)
        v98 = &v176;
      else
        v98 = (__int128 *)v176;
      if (SHIBYTE(v177) >= 0)
        v99 = HIBYTE(v177);
      else
        v99 = *((_QWORD *)&v176 + 1);
      if (v164 >= 0)
        v100 = 22;
      else
        v100 = (v164 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v164 >= 0)
        v101 = HIBYTE(v164);
      else
        v101 = (size_t)v163[1];
      if (v100 - v101 < v99)
      {
        v102 = v101 + v99;
        if (0x7FFFFFFFFFFFFFF6 - v100 < v101 + v99 - v100)
          sub_239FEBDE0();
        if (v164 >= 0)
          v103 = v163;
        else
          v103 = (void **)v163[0];
        if (v100 >= 0x3FFFFFFFFFFFFFF3)
        {
          v109 = 0x7FFFFFFFFFFFFFF6;
        }
        else
        {
          v104 = 2 * v100;
          if (v102 > 2 * v100)
            v104 = v101 + v99;
          if (v104 < 0x17)
          {
            v105 = 23;
LABEL_193:
            v111 = (char *)operator new(v105);
            v112 = v111;
            if (v101)
              memmove(v111, v103, v101);
            memcpy(&v112[v101], v98, v99);
            if (v100 != 22)
              operator delete(v103);
            v163[1] = (void *)(v101 + v99);
            v164 = v105 | 0x8000000000000000;
            v163[0] = v112;
            v108 = &v112[v102];
            goto LABEL_198;
          }
          v110 = (v104 & 0xFFFFFFFFFFFFFFF8) + 8;
          v109 = v104 | 7;
          if (v109 == 23)
            v109 = v110;
        }
        v105 = v109 + 1;
        goto LABEL_193;
      }
      if (!v99)
        goto LABEL_199;
      if (v164 >= 0)
        v106 = v163;
      else
        v106 = (void **)v163[0];
      memmove((char *)v106 + v101, v98, v99);
      v107 = v101 + v99;
      if (SHIBYTE(v164) < 0)
        v163[1] = (void *)(v101 + v99);
      else
        HIBYTE(v164) = v107 & 0x7F;
      v108 = (char *)v106 + v107;
LABEL_198:
      *v108 = 0;
LABEL_199:
      if (v97 < 0)
      {
        operator delete(v153);
        if ((SHIBYTE(v173) & 0x80000000) == 0)
        {
LABEL_201:
          v113 = v170;
          if (!v170)
            goto LABEL_126;
          goto LABEL_205;
        }
      }
      else if ((SHIBYTE(v173) & 0x80000000) == 0)
      {
        goto LABEL_201;
      }
      operator delete((void *)v172);
      v113 = v170;
      if (!v170)
        goto LABEL_126;
LABEL_205:
      v114 = (unint64_t *)&v113->__shared_owners_;
      do
        v115 = __ldaxr(v114);
      while (__stlxr(v115 - 1, v114));
      if (!v115)
      {
        ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
        std::__shared_weak_count::__release_weak(v113);
      }
LABEL_126:
      ++v82;
      v83 = v156;
    }
    MEMORY[0x23B83FDBC](&v172);
    LODWORD(v176) = 0x4000;
    std::locale::locale((std::locale *)&v176 + 1, (const std::locale *)&v172);
    sub_23A01F000((unsigned __int8 *)v163, (const std::locale *)&v176);
    std::locale::~locale((std::locale *)&v176 + 1);
    std::locale::~locale((std::locale *)&v172);
    MEMORY[0x23B83FDBC]();
    LODWORD(v176) = 0x4000;
    std::locale::locale((std::locale *)&v176 + 1, (const std::locale *)&v172);
    sub_23A01F1FC((char *)v163, (const std::locale *)&v176);
    std::locale::~locale((std::locale *)&v176 + 1);
    std::locale::~locale((std::locale *)&v172);
    v116 = (void *)MEMORY[0x24BDD17C8];
    v117 = SHIBYTE(v164);
    v118 = v163[0];
    v124 = objc_msgSend_defaultCStringEncoding(MEMORY[0x24BDD17C8], v119, v120, v121, v122);
    if (v117 >= 0)
      objc_msgSend_stringWithCString_encoding_(v116, v123, (uint64_t)v163, v124, v125);
    else
      objc_msgSend_stringWithCString_encoding_(v116, v123, (uint64_t)v118, v124, v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = [CSUCaptionResult alloc];
    LODWORD(v128) = *((_DWORD *)v152 + 6);
    v132 = (void *)objc_msgSend_initWithCaption_score_(v127, v129, (uint64_t)v126, v130, v131, v128);
    objc_msgSend_addObject_(v151, v133, (uint64_t)v132, v134, v135);

    if (SHIBYTE(v164) < 0)
      operator delete(v163[0]);
    v80 = v152 + 4;
    if (v152 + 4 != v150)
      continue;
    break;
  }
LABEL_215:
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v76, (uint64_t)v151, v78, v79);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v137, (uint64_t)v136, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v141 = v140;
  v142 = (char *)v159;
  if (v159)
  {
    v143 = v160;
    v144 = v159;
    if (v160 != v159)
    {
      v145 = v160;
      do
      {
        v147 = (void *)*((_QWORD *)v145 - 4);
        v145 -= 32;
        v146 = v147;
        if (v147)
        {
          *(v143 - 3) = v146;
          operator delete(v146);
        }
        v143 = v145;
      }
      while (v145 != v142);
      v144 = v159;
    }
    v160 = v142;
    operator delete(v144);
  }
  operator delete(v149);
  return v141;
}

- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23A016E78();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_23A09E4F4(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (id)postProcessResults:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v6 = a3;
  objc_msgSend_postProcessingHandler(self->_procUtils, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_postProcessingHandler(self->_procUtils, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_genderOptionForBeamSearch(self->_procUtils, v17, v18, v19, v20);
    objc_msgSend_postProcessResults_genderOption_error_(v16, v22, (uint64_t)v6, v21, (uint64_t)a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    return v23;
  }
  else
  {
    sub_23A016E78();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_23A09E524(v24, v25, v26);

    v27 = v6;
    return v27;
  }
}

- (CSUImageCaptionDecoderAXKVCacheE1Network)decoderNetObj
{
  return self->_decoderNetObj;
}

- (void)setDecoderNetObj:(id)a3
{
  objc_storeStrong((id *)&self->_decoderNetObj, a3);
}

- (CSUCaptioningProcUtils)procUtils
{
  return self->_procUtils;
}

- (CSUImageCaptioningDecoderConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *begin;

  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_procUtils, 0);
  objc_storeStrong((id *)&self->_decoderNetObj, 0);
  self->_encodedFeaturesBuffer._vptr$Tensor = (void **)&off_250B0DCE8;
  cntrl = self->_encodedFeaturesBuffer.storage_.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (v5)
  {
LABEL_5:
    begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
    if (!begin)
      return;
    goto LABEL_6;
  }
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  begin = self->_encodedFeaturesBuffer.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_6:
    self->_encodedFeaturesBuffer.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 4;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 1) = &off_250B0DB88;
  return self;
}

@end
