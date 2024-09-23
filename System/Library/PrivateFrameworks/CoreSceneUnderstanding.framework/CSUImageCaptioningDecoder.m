@implementation CSUImageCaptioningDecoder

- (CSUImageCaptioningDecoder)initWithConfiguration:(id)a3
{
  id v5;
  CSUImageCaptioningDecoder *v6;
  CSUImageCaptioningDecoder *v7;
  CSUImageCaptioningDecoderE1 *imageCaptioningDecoderE1;
  CSUImageCaptioningDecoderE5 *imageCaptioningDecoderE5;
  CSUImageCaptioningDecoderAXKVCacheE1 *imageCaptioningDecoderAXKVCacheE1;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CSUImageCaptioningDecoderE1 *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CSUImageCaptioningDecoderAXKVCacheE1 *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CSUImageCaptioningDecoderE5 *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CSUImageCaptioningDecoder *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v41;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CSUImageCaptioningDecoder;
  v6 = -[CSUImageCaptioningDecoder init](&v41, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  objc_storeStrong((id *)&v6->_configuration, a3);
  imageCaptioningDecoderE1 = v7->_imageCaptioningDecoderE1;
  v7->_imageCaptioningDecoderE1 = 0;

  imageCaptioningDecoderE5 = v7->_imageCaptioningDecoderE5;
  v7->_imageCaptioningDecoderE5 = 0;

  imageCaptioningDecoderAXKVCacheE1 = v7->_imageCaptioningDecoderAXKVCacheE1;
  v7->_imageCaptioningDecoderAXKVCacheE1 = 0;

  v15 = objc_msgSend_runtimeEngine(v5, v11, v12, v13, v14);
  if (v15 == 3)
  {
    v25 = [CSUImageCaptioningDecoderAXKVCacheE1 alloc];
    v29 = objc_msgSend_initWithConfiguration_(v25, v26, (uint64_t)v5, v27, v28);
    v24 = v7->_imageCaptioningDecoderAXKVCacheE1;
    v7->_imageCaptioningDecoderAXKVCacheE1 = (CSUImageCaptioningDecoderAXKVCacheE1 *)v29;
    goto LABEL_8;
  }
  if (v15 == 2)
  {
    v30 = [CSUImageCaptioningDecoderE5 alloc];
    v34 = objc_msgSend_initWithConfiguration_(v30, v31, (uint64_t)v5, v32, v33);
    v24 = v7->_imageCaptioningDecoderE5;
    v7->_imageCaptioningDecoderE5 = (CSUImageCaptioningDecoderE5 *)v34;
    goto LABEL_8;
  }
  if (v15 != 1)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v16, (uint64_t)CFSTR("Runtime not supported!"), v17, v18);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logInternalError_(CSUError, v37, (uint64_t)v36, v38, v39);

LABEL_10:
    v35 = 0;
    goto LABEL_11;
  }
  v19 = [CSUImageCaptioningDecoderE1 alloc];
  v23 = objc_msgSend_initWithConfiguration_(v19, v20, (uint64_t)v5, v21, v22);
  v24 = v7->_imageCaptioningDecoderE1;
  v7->_imageCaptioningDecoderE1 = (CSUImageCaptioningDecoderE1 *)v23;
LABEL_8:

  v35 = v7;
LABEL_11:

  return v35;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  CSUImageCaptioningDecoderE1 *imageCaptioningDecoderE1;
  CSUImageCaptioningDecoderE5 *imageCaptioningDecoderE5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CSUCaptionPostProcessingHandler *v17;
  CSUImageCaptioningDecoderAXKVCacheE1 *imageCaptioningDecoderAXKVCacheE1;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CSUCaptionPostProcessingHandler *postProcessingHandler;

  imageCaptioningDecoderE1 = self->_imageCaptioningDecoderE1;
  if (imageCaptioningDecoderE1)
  {
    LODWORD(imageCaptioningDecoderE5) = objc_msgSend_loadResources_(imageCaptioningDecoderE1, a2, (uint64_t)a3, v3, v4);
    if ((_DWORD)imageCaptioningDecoderE5)
    {
      objc_msgSend_procUtils(self->_imageCaptioningDecoderE1, v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_postProcessingHandler(v12, v13, v14, v15, v16);
      v17 = (CSUCaptionPostProcessingHandler *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      postProcessingHandler = self->_postProcessingHandler;
      self->_postProcessingHandler = v17;

      LOBYTE(imageCaptioningDecoderE5) = 1;
    }
  }
  else
  {
    imageCaptioningDecoderAXKVCacheE1 = self->_imageCaptioningDecoderAXKVCacheE1;
    if (imageCaptioningDecoderAXKVCacheE1)
    {
      LODWORD(imageCaptioningDecoderE5) = objc_msgSend_loadResources_(imageCaptioningDecoderAXKVCacheE1, a2, (uint64_t)a3, v3, v4);
      if ((_DWORD)imageCaptioningDecoderE5)
      {
        objc_msgSend_procUtils(self->_imageCaptioningDecoderAXKVCacheE1, v19, v20, v21, v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_postProcessingHandler(v12, v23, v24, v25, v26);
        v17 = (CSUCaptionPostProcessingHandler *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    else
    {
      imageCaptioningDecoderE5 = self->_imageCaptioningDecoderE5;
      if (imageCaptioningDecoderE5)
      {
        LODWORD(imageCaptioningDecoderE5) = objc_msgSend_loadResources_(imageCaptioningDecoderE5, a2, (uint64_t)a3, v3, v4);
        if ((_DWORD)imageCaptioningDecoderE5)
        {
          objc_msgSend_procUtils(self->_imageCaptioningDecoderE5, v27, v28, v29, v30);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_postProcessingHandler(v12, v31, v32, v33, v34);
          v17 = (CSUCaptionPostProcessingHandler *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
    }
  }
  return (char)imageCaptioningDecoderE5;
}

- (id)computeDecodedCaptionsForFeaturesWithCSUBuffer:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CSUImageCaptioningDecoderConfiguration *configuration;
  void *v19;
  _BOOL8 v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  std::runtime_error *exception;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v17 = objc_msgSend_runtimeEngine(self->_configuration, v9, v10, v11, v12);
  configuration = self->_configuration;
  if (v17 == 1)
  {
    objc_msgSend_bridgeNetworkPath(configuration, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    objc_msgSend_computeDecodedCaptionsForFeaturesE1_withDecodingMethod_runDecoderOnly_error_(self, v21, (uint64_t)v8, a4, v20, a5);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend_runtimeEngine(configuration, v13, v14, v15, v16) == 2)
    {
      v28 = v8;
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = (uint64_t *)objc_msgSend_espressoBuffer(v28, v29, v30, v31, v32);

          v34 = v33[19];
          v35 = objc_alloc(MEMORY[0x24BDBFFF0]);
          v36 = *v33;
          objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v37, v34, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v51[0] = v40;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v41, (uint64_t)v51, 1, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v35, v44, v36, (uint64_t)v43, 65568, &unk_250B1CD98, 0, a5);

          objc_msgSend_computeDecodedCaptionsForFeaturesE5_withDecodingMethod_runDecoderOnly_error_(self, v46, (uint64_t)v45, a4, 0, a5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
      }
      else
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
      }
      __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    if (objc_msgSend_runtimeEngine(self->_configuration, v24, v25, v26, v27) != 3)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v47, 3, (uint64_t)CFSTR("Unknown Runtime engine requested"), v48);
      v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend_computeDecodedCaptionsForFeaturesAXKVCacheE1_withDecodingMethod_runDecoderOnly_error_(self, v47, (uint64_t)v8, a4, 0, a5);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;
LABEL_11:

  return v23;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _BOOL8 v34;
  const char *v35;
  void *v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  unint64_t *v78;
  unint64_t v79;
  _OWORD v81[10];
  uint64_t v82;
  _OWORD v83[10];
  uint64_t v84;
  uint64_t (**v85)();
  void *v86;
  void *v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  _QWORD v90[2];

  v90[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend_runtimeEngine(self->_configuration, v9, v10, v11, v12) == 1)
  {
    objc_msgSend_tensorForInputEmbedding_(CSUDataUtilities, v13, (uint64_t)v8, v15, v16);
    v17 = *(_OWORD *)(v88 + 40);
    v18 = *(_OWORD *)(v88 + 24);
    v83[0] = *(_OWORD *)(v88 + 8);
    v83[1] = v18;
    v83[2] = v17;
    v19 = *(_OWORD *)(v88 + 72);
    v20 = *(_OWORD *)(v88 + 104);
    v21 = *(_OWORD *)(v88 + 56);
    v83[5] = *(_OWORD *)(v88 + 88);
    v83[6] = v20;
    v83[3] = v21;
    v83[4] = v19;
    v22 = *(_OWORD *)(v88 + 120);
    v23 = *(_OWORD *)(v88 + 136);
    v24 = *(_OWORD *)(v88 + 152);
    v84 = *(_QWORD *)(v88 + 168);
    v83[8] = v23;
    v83[9] = v24;
    v83[7] = v22;
    objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v25, (uint64_t)v83, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bridgeNetworkPath(self->_configuration, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    objc_msgSend_computeDecodedCaptionsForFeaturesE1_withDecodingMethod_runDecoderOnly_error_(self, v35, (uint64_t)v28, a4, v34, a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = &off_250B0DCE8;
    v37 = v89;
    if (v89)
    {
      p_shared_owners = (unint64_t *)&v89->__shared_owners_;
      do
        v39 = __ldaxr(p_shared_owners);
      while (__stlxr(v39 - 1, p_shared_owners));
      if (!v39)
      {
LABEL_6:
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
  }
  else
  {
    if (objc_msgSend_runtimeEngine(self->_configuration, v13, v14, v15, v16) == 2)
    {
      v44 = objc_msgSend_length(v8, v40, v41, v42, v43);
      v45 = objc_alloc(MEMORY[0x24BDBFFF0]);
      v46 = objc_retainAutorelease(v8);
      v51 = objc_msgSend_bytes(v46, v47, v48, v49, v50);
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v52, v44 >> 2, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = v55;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v56, (uint64_t)v90, 1, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v45, v59, v51, (uint64_t)v58, 65568, &unk_250B1CDB0, 0, a5);

      objc_msgSend_computeDecodedCaptionsForFeaturesE5_withDecodingMethod_runDecoderOnly_error_(self, v61, (uint64_t)v60, a4, 0, a5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    if (objc_msgSend_runtimeEngine(self->_configuration, v40, v41, v42, v43) != 3)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v62, 3, (uint64_t)CFSTR("Unknown Runtime engine requested"), v64);
      v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend_tensorForInputEmbedding_(CSUDataUtilities, v62, (uint64_t)v8, v63, v64);
    v65 = *(_OWORD *)(v88 + 40);
    v66 = *(_OWORD *)(v88 + 24);
    v81[0] = *(_OWORD *)(v88 + 8);
    v81[1] = v66;
    v81[2] = v65;
    v67 = *(_OWORD *)(v88 + 72);
    v68 = *(_OWORD *)(v88 + 104);
    v69 = *(_OWORD *)(v88 + 56);
    v81[5] = *(_OWORD *)(v88 + 88);
    v81[6] = v68;
    v81[3] = v69;
    v81[4] = v67;
    v70 = *(_OWORD *)(v88 + 120);
    v71 = *(_OWORD *)(v88 + 136);
    v72 = *(_OWORD *)(v88 + 152);
    v82 = *(_QWORD *)(v88 + 168);
    v81[8] = v71;
    v81[9] = v72;
    v81[7] = v70;
    objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v73, (uint64_t)v81, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_computeDecodedCaptionsForFeaturesAXKVCacheE1_withDecodingMethod_runDecoderOnly_error_(self, v77, (uint64_t)v76, a4, 1, a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = &off_250B0DCE8;
    v37 = v89;
    if (v89)
    {
      v78 = (unint64_t *)&v89->__shared_owners_;
      do
        v79 = __ldaxr(v78);
      while (__stlxr(v79 - 1, v78));
      if (!v79)
        goto LABEL_6;
    }
  }
  if (v86)
  {
    v87 = v86;
    operator delete(v86);
  }
LABEL_17:

  return v36;
}

- (id)computeDecodedCaptionsForFeaturesE1:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  v7 = a5;
  v13 = a3;
  if (self->_imageCaptioningDecoderE1 && (objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0)
  {
    objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_runDecoderOnly_error_(self->_imageCaptioningDecoderE1, v14, (uint64_t)v13, a4, v7, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postProcessResults_error_(self, v16, (uint64_t)v15, (uint64_t)a6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)computeDecodedCaptionsForFeaturesAXKVCacheE1:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;

  v7 = a5;
  v13 = a3;
  if (self->_imageCaptioningDecoderAXKVCacheE1
    && (objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0)
  {
    objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_runDecoderOnly_error_(self->_imageCaptioningDecoderAXKVCacheE1, v14, (uint64_t)v13, a4, v7, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postProcessResults_error_(self, v16, (uint64_t)v15, (uint64_t)a6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)computeDecodedCaptionsForFeaturesE5:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v7 = a5;
  v13 = a3;
  if (self->_imageCaptioningDecoderE5 && (objc_msgSend_loadResources_(self, v10, (uint64_t)a6, v11, v12) & 1) != 0)
  {
    objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_runDecoderOnly_error_(self->_imageCaptioningDecoderE5, v14, (uint64_t)v13, a4, v7, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend_postProcessResults_error_(self, v15, (uint64_t)v17, (uint64_t)a6, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)getBridgeLayerOutputE5:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CSUImageCaptioningDecoderE5 *imageCaptioningDecoderE5;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;

  v6 = a3;
  if ((objc_msgSend_loadResources_(self, v7, (uint64_t)a4, v8, v9) & 1) != 0)
  {
    if (self->_imageCaptioningDecoderE1 || (imageCaptioningDecoderE5 = self->_imageCaptioningDecoderE5) == 0)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v10, 3, (uint64_t)CFSTR("Found null object of ML inferences"), v13);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_configuration(imageCaptioningDecoderE5, v10, v11, v12, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bridgeInputShape(v17, v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend_copyFromNSDataAndReshape_shape_(CSUMLMultiArrayUtilities, v23, (uint64_t)v6, (uint64_t)v22, v24);

      objc_msgSend_getBridgeLayerOutput_error_(self->_imageCaptioningDecoderE5, v26, (uint64_t)v25, (uint64_t)a4, v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)getBridgeLayerOutputE1:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CSUImageCaptioningDecoderE1 *imageCaptioningDecoderE1;
  void *v14;

  v6 = a3;
  if ((objc_msgSend_loadResources_(self, v7, (uint64_t)a4, v8, v9) & 1) != 0)
  {
    imageCaptioningDecoderE1 = self->_imageCaptioningDecoderE1;
    if (imageCaptioningDecoderE1 && !self->_imageCaptioningDecoderE5)
    {
      objc_msgSend_getBridgeLayerOutput_error_(imageCaptioningDecoderE1, v10, (uint64_t)v6, (uint64_t)a4, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    }
    else
    {
      objc_msgSend_errorWithCode_message_(CSUError, v10, 3, (uint64_t)CFSTR("Found null object of ML inferences"), v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  else
  {

    return 0;
  }
}

- (id)postProcessResults:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  v6 = a3;
  v11 = objc_msgSend_runtimeEngine(self->_configuration, v7, v8, v9, v10);
  switch(v11)
  {
    case 1:
      objc_msgSend_postProcessResults_error_(self->_imageCaptioningDecoderE1, v12, (uint64_t)v6, (uint64_t)a4, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend_postProcessResults_error_(self->_imageCaptioningDecoderE5, v12, (uint64_t)v6, (uint64_t)a4, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend_postProcessResults_error_(self->_imageCaptioningDecoderAXKVCacheE1, v12, (uint64_t)v6, (uint64_t)a4, v13);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v15 = (void *)v14;

      return v15;
  }
  sub_23A016E78();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_23A09E598(v16);

  return v6;
}

- (CSUImageCaptioningDecoderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_postProcessingHandler, 0);
  objc_storeStrong((id *)&self->_imageCaptioningDecoderE5, 0);
  objc_storeStrong((id *)&self->_imageCaptioningDecoderAXKVCacheE1, 0);
  objc_storeStrong((id *)&self->_imageCaptioningDecoderE1, 0);
}

@end
