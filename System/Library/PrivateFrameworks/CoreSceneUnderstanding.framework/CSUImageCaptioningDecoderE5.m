@implementation CSUImageCaptioningDecoderE5

- (CSUImageCaptioningDecoderE5)initWithConfiguration:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CSUImageCaptioningDecoderE5 *v10;
  CSUImageCaptioningDecoderE5 *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSUImageCaptioningDecoderE5;
  v10 = -[CSUImageCaptioningDecoderE5 init](&v13, sel_init);
  if (v10 && objc_msgSend_runtimeEngine(v5, v6, v7, v8, v9) == 2)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)loadBridge:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t IsPrecompiled;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CSUCoreMLInference *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  CSUCoreMLInference **p_bridgeE5Net;
  CSUCoreMLInference *bridgeE5Net;
  BOOL v42;
  int v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_bridgeNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || self->_bridgeE5Net)
    return 1;
  IsPrecompiled = objc_msgSend_bridgeIsPrecompiled(self->_configuration, v8, v9, v10, v11);
  objc_msgSend_bridgeNetworkPath(self->_configuration, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v17, v18, (uint64_t)CFSTR("model.specialization.bundle"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x24BDD1580]);
  if ((objc_msgSend_fileExistsAtPath_(v22, v23, (uint64_t)v21, v24, v25) & 1) == 0)
  {
    sub_23A016E78();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_bridgeNetworkPath(self->_configuration, v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138412290;
      v46 = v31;
      _os_log_impl(&dword_239FE9000, v26, OS_LOG_TYPE_INFO, "Could not fing the pre-compiled bundle for %@.", (uint8_t *)&v45, 0xCu);

    }
    IsPrecompiled = 0;
  }
  v32 = [CSUCoreMLInference alloc];
  objc_msgSend_bridgeNetworkPath(self->_configuration, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_initWithCompiledModelFromUri_useComputeUnit_usePrecompiledE5Bundle_error_(v32, v38, (uint64_t)v37, 3, IsPrecompiled, a3);
  bridgeE5Net = self->_bridgeE5Net;
  p_bridgeE5Net = &self->_bridgeE5Net;
  *p_bridgeE5Net = (CSUCoreMLInference *)v39;

  v42 = *p_bridgeE5Net == 0;
  return !v42;
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
  v9 = (CSUCaptioningProcUtils *)objc_msgSend_initWithDecoderConfiguration_beamWidth_beamScorerType_error_(v7, v8, (uint64_t)self->_configuration, v5, 0, a4);
  procUtils = self->_procUtils;
  self->_procUtils = v9;

  return self->_procUtils != 0;
}

- (BOOL)loadDecoder:(id *)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t IsPrecompiled;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CSUCoreMLInference *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  CSUCoreMLInference *v36;
  CSUCoreMLInference *decoderE5Net;
  CSUCoreMLInference *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  MLMultiArray *v46;
  MLMultiArray *inputTokensE5;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  MLMultiArray *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  BOOL v64;
  id v65;
  void *v66;
  _QWORD v67[2];
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (self->_decoderE5Net)
    return 1;
  if ((objc_msgSend_loadPostProcUtilsWithBeamWidth_error_(self, a2, 3, (uint64_t)a3, v3) & 1) == 0)
    return 0;
  IsPrecompiled = objc_msgSend_decoderIsPrecompiled(self->_configuration, v7, v8, v9, v10);
  objc_msgSend_decoderNetworkPath(self->_configuration, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v16, v17, (uint64_t)CFSTR("model.specialization.bundle"), v18, v19);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = objc_alloc_init(MEMORY[0x24BDD1580]);
  if ((objc_msgSend_fileExistsAtPath_(v65, v20, (uint64_t)v66, v21, v22) & 1) == 0)
  {
    sub_23A016E78();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_decoderNetworkPath(self->_configuration, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v69 = v28;
      _os_log_impl(&dword_239FE9000, v23, OS_LOG_TYPE_INFO, "Could not fing the pre-compiled bundle for %@.", buf, 0xCu);

    }
    IsPrecompiled = 0;
  }
  v29 = [CSUCoreMLInference alloc];
  objc_msgSend_decoderNetworkPath(self->_configuration, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (CSUCoreMLInference *)objc_msgSend_initWithCompiledModelFromUri_useComputeUnit_usePrecompiledE5Bundle_error_(v29, v35, (uint64_t)v34, 3, IsPrecompiled, a3);
  decoderE5Net = self->_decoderE5Net;
  self->_decoderE5Net = v36;

  v38 = self->_decoderE5Net;
  v64 = v38 != 0;
  if (v38)
  {
    v39 = objc_alloc(MEMORY[0x24BDBFFF0]);
    objc_msgSend_decoderInputSeqShape(self->_configuration, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (MLMultiArray *)objc_msgSend_initWithShape_dataType_error_(v39, v45, (uint64_t)v44, 65568, (uint64_t)a3);
    inputTokensE5 = self->_inputTokensE5;
    self->_inputTokensE5 = v46;

    v55 = objc_msgSend_maxSeqLen(self->_configuration, v48, v49, v50, v51);
    if (v55)
    {
      for (i = 0; i != v55; ++i)
      {
        v57 = self->_inputTokensE5;
        v67[0] = &unk_250B1C810;
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v52, i, v53, v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v67[1] = v58;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v59, (uint64_t)v67, 2, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v57, v62, (uint64_t)&unk_250B1CE40, (uint64_t)v61, v63);

      }
    }
  }

  return v64;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  int Decoder;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CSUCoreMLInference *bridgeE5Net;
  BOOL result;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  if (!self->_decoderE5Net)
  {
    Decoder = objc_msgSend_loadDecoder_(self, a2, (uint64_t)a3, v3, v4);
    objc_msgSend_bridgeNetworkPath(self->_configuration, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_3;
    return Decoder;
  }
  Decoder = 1;
  objc_msgSend_bridgeNetworkPath(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return Decoder;
LABEL_3:
  bridgeE5Net = self->_bridgeE5Net;
  if (bridgeE5Net)
    result = Decoder;
  else
    result = 0;
  if (!bridgeE5Net && ((Decoder ^ 1) & 1) == 0)
    return objc_msgSend_loadBridge_(self, v9, (uint64_t)a3, v10, v11);
  return result;
}

- (id)getBridgeLayerOutput:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CSUCoreMLInference *bridgeE5Net;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CSUCoreMLInference *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend_loadBridge_(self, v7, (uint64_t)a4, v8, v9) & 1) != 0)
  {
    bridgeE5Net = self->_bridgeE5Net;
    objc_msgSend_inputEncodedFeaturesTensorNameOfBridge(self->_configuration, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v15;
    v35[0] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v35, (uint64_t)&v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(bridgeE5Net) = objc_msgSend_setInputFeatures_error_(bridgeE5Net, v18, (uint64_t)v17, (uint64_t)a4, v19);

    if ((bridgeE5Net & 1) != 0)
    {
      if ((objc_msgSend_predict_(self->_bridgeE5Net, v20, (uint64_t)a4, v21, v22) & 1) != 0)
      {
        v27 = self->_bridgeE5Net;
        objc_msgSend_outputTensorNameOfBridge(self->_configuration, v23, v24, v25, v26);
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_getOutputFor_(v27, v29, (uint64_t)v28, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
      sub_23A016E78();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_23A09DD70();
    }
    else
    {
      sub_23A016E78();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_23A09DD9C();
    }
    v32 = 0;
    goto LABEL_11;
  }
  v32 = 0;
LABEL_12:

  return v32;
}

- (id)computeDecodedCaptionsForFeatures:(id)a3 withDecodingMethod:(int64_t)a4 runDecoderOnly:(BOOL)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CSUImageCaptioningDecoderConfiguration *configuration;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  MLMultiArray *v25;
  MLMultiArray *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  MLMultiArray *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  MLMultiArray *v35;
  MLMultiArray *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  MLMultiArray *v43;
  MLMultiArray *encodedFeaturesBufferE5;
  void *v45;
  NSObject *v47;

  v10 = a3;
  if ((objc_msgSend_loadResources_(self, v11, (uint64_t)a6, v12, v13) & 1) == 0)
    goto LABEL_16;
  configuration = self->_configuration;
  if (!self->_bridgeE5Net || a5)
  {
    objc_msgSend_decoderEmbeddingShape(configuration, v14, v15, v16, v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_reshapeMLMultiArray_toShape_(CSUMLMultiArrayUtilities, v41, (uint64_t)v10, (uint64_t)v40, v42);
    v43 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    encodedFeaturesBufferE5 = self->_encodedFeaturesBufferE5;
    self->_encodedFeaturesBufferE5 = v43;

    if (self->_encodedFeaturesBufferE5)
      goto LABEL_8;
    if (a6)
    {
      objc_msgSend_errorWithCode_message_(CSUError, v37, 12, (uint64_t)CFSTR("Incorrect shape to run Captioner"), v39);
      v45 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v22 = v10;
      goto LABEL_18;
    }
LABEL_16:
    v45 = 0;
    goto LABEL_17;
  }
  objc_msgSend_bridgeInputShape(configuration, v14, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reshapeMLMultiArray_toShape_(CSUMLMultiArrayUtilities, v20, (uint64_t)v10, (uint64_t)v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_getBridgeLayerOutput_error_(self, v23, (uint64_t)v22, (uint64_t)a6, v24);
    v25 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
    v26 = self->_encodedFeaturesBufferE5;
    self->_encodedFeaturesBufferE5 = v25;

    v31 = self->_encodedFeaturesBufferE5;
    if (v31)
    {
      objc_msgSend_decoderEmbeddingShape(self->_configuration, v27, v28, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_reshapeMLMultiArray_toShape_(CSUMLMultiArrayUtilities, v33, (uint64_t)v31, (uint64_t)v32, v34);
      v35 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
      v36 = self->_encodedFeaturesBufferE5;
      self->_encodedFeaturesBufferE5 = v35;

      v10 = v22;
LABEL_8:
      if (a4)
        objc_msgSend_getCaptionsAfterBeamSearchDecodingOnEncodedFeatures_(self, v37, (uint64_t)a6, v38, v39);
      else
        objc_msgSend_getCaptionsAfterGreedyDecodingOnEncodedFeatures_(self, v37, (uint64_t)a6, v38, v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    sub_23A016E78();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_23A09DDC8();

    v45 = 0;
  }
  else if (a6)
  {
    objc_msgSend_errorWithCode_message_(CSUError, v23, 12, (uint64_t)CFSTR("Incorrect shape to run bridge model of Captioner"), v24);
    v22 = 0;
    v45 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
    v45 = 0;
  }
LABEL_18:

  return v45;
}

- (vector<float,)nextTokensForInputs:(CSUImageCaptioningDecoderE5 *)self AndforMaskPosition:(SEL)a3
{
  uint64_t v5;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  size_t v14;
  char *v15;
  const void *v16;
  uint64_t v17;
  size_t v18;
  MLMultiArray *inputTokensE5;
  uint64_t v20;
  int64_t v21;
  char *v22;
  char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  CSUCoreMLInference *decoderE5Net;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  CSUCoreMLInference *v45;
  char v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CSUCoreMLInference *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char *v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  _BYTE *v88;
  _BYTE *v89;
  int64_t v90;
  float *v91;
  float *v92;
  void *v93;
  vector<float, std::allocator<float>> *result;
  NSObject *v95;
  uint64_t v96;
  _QWORD v97[4];
  id v98;
  uint64_t *v99;
  unint64_t v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  __n128 (*v105)(__n128 *, __n128 *);
  void (*v106)(uint64_t);
  void *v107;
  void *__p;
  char *v109;
  char *v110;
  id v111;
  id v112;
  _QWORD v113[4];
  void *v114;
  char *v115;
  char *v116;
  char *v117;
  unint64_t v118;
  unint64_t v119;
  _QWORD v120[2];
  _QWORD v121[4];

  v121[2] = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend_count(self->_inputTokensE5, a3, (uint64_t)a4, *(uint64_t *)&a5, v5);
  v13 = v10;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  if (v10)
  {
    if (v10 >> 62)
      sub_239FEBE68();
    v14 = 4 * v10;
    v15 = (char *)operator new(4 * v10);
    v13 = (unint64_t)&v15[4 * v13];
    v117 = v15;
    v119 = v13;
    bzero(v15, v14);
    v118 = v13;
    v16 = *(const void **)a4;
    v17 = *((_QWORD *)a4 + 1);
    v18 = v17 - *(_QWORD *)a4;
    if (v17 != *(_QWORD *)a4)
      goto LABEL_4;
  }
  else
  {
    v15 = 0;
    v16 = *(const void **)a4;
    v96 = *((_QWORD *)a4 + 1);
    v18 = v96 - *(_QWORD *)a4;
    if (v96 != *(_QWORD *)a4)
LABEL_4:
      memmove(v15, v16, v18);
  }
  inputTokensE5 = self->_inputTokensE5;
  v20 = MEMORY[0x24BDAC760];
  v113[0] = MEMORY[0x24BDAC760];
  v113[1] = 3321888768;
  v113[2] = sub_23A01A5B0;
  v113[3] = &unk_250B0BFF8;
  v115 = 0;
  v116 = 0;
  v114 = 0;
  v21 = v13 - (_QWORD)v15;
  if (v21)
  {
    if (v21 < 0)
      sub_239FEBE68();
    v22 = (char *)operator new(v21);
    v23 = &v22[4 * (v21 >> 2)];
    v114 = v22;
    v116 = v23;
    memcpy(v22, v15, v21);
    v115 = v23;
  }
  objc_msgSend_getMutableBytesWithHandler_(inputTokensE5, (const char *)v16, (uint64_t)v113, v11, v12);
  if (!self->_encodedFeaturesBufferE5)
  {
    sub_23A016E78();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_23A09DE4C();

  }
  decoderE5Net = self->_decoderE5Net;
  objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v24, v25, v26, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v30;
  v121[0] = self->_encodedFeaturesBufferE5;
  objc_msgSend_inputWordIdsTensorName(self->_configuration, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v35;
  v121[1] = self->_inputTokensE5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v36, (uint64_t)v121, (uint64_t)v120, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = 0;
  LOBYTE(decoderE5Net) = objc_msgSend_setInputFeatures_error_(decoderE5Net, v38, (uint64_t)v37, (uint64_t)&v112, v39);
  v40 = v112;

  if ((decoderE5Net & 1) == 0)
  {
    sub_23A016E78();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_23A09DE20();

  }
  v45 = self->_decoderE5Net;
  v111 = v40;
  v46 = objc_msgSend_predict_(v45, v41, (uint64_t)&v111, v42, v43);
  v47 = v111;

  if ((v46 & 1) != 0)
  {
    v52 = self->_decoderE5Net;
    objc_msgSend_outputWordProbsTensorName(self->_configuration, v48, v49, v50, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getOutputFor_(v52, v54, (uint64_t)v53, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_shape(v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_count(v62, v63, v64, v65, v66);

    objc_msgSend_shape(v57, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v72, v73, v67 - 1, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend_unsignedIntegerValue(v76, v77, v78, v79, v80);

    v102 = 0;
    v103 = &v102;
    v104 = 0x4812000000;
    v105 = sub_23A01A6E4;
    v106 = sub_23A01A708;
    v107 = &unk_23A0C154D;
    __p = 0;
    v109 = 0;
    v110 = 0;
    if (v81)
    {
      if (v81 >> 62)
        sub_239FEBE68();
      v82 = (char *)operator new(4 * v81);
      __p = v82;
      v110 = &v82[4 * v81];
      bzero(v82, 4 * v81);
      v109 = &v82[4 * v81];
    }
    v97[0] = v20;
    v97[1] = 3221225472;
    v97[2] = sub_23A01A720;
    v97[3] = &unk_250B0E500;
    v83 = v57;
    v99 = &v102;
    v100 = v81;
    v101 = a5;
    v98 = v83;
    objc_msgSend_getBytesWithHandler_(v83, v84, (uint64_t)v97, v85, v86);
    v87 = v103;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    retstr->__begin_ = 0;
    v89 = (_BYTE *)v87[6];
    v88 = (_BYTE *)v87[7];
    v90 = v88 - v89;
    if (v88 != v89)
    {
      if (v90 < 0)
        sub_239FEBE68();
      v91 = (float *)operator new(v88 - v89);
      retstr->__begin_ = v91;
      v92 = &v91[v90 >> 2];
      retstr->__end_cap_.__value_ = v92;
      memcpy(v91, v89, v90);
      retstr->__end_ = v92;
    }

    _Block_object_dispose(&v102, 8);
    if (__p)
    {
      v109 = (char *)__p;
      operator delete(__p);
    }

    v93 = v114;
    if (v114)
LABEL_26:
      operator delete(v93);
  }
  else
  {
    sub_23A016E78();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      sub_23A09DDF4();

    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    v93 = v114;
    if (v114)
      goto LABEL_26;
  }
  if (v15)
    operator delete(v15);

  return result;
}

- (id)getCaptionsAfterBeamSearchDecodingOnEncodedFeatures:(id *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CSUCaptioningProcUtils *procUtils;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  _DWORD *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  char *v25;
  char *v26;
  char *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  float v39;
  _BYTE *v40;
  _BYTE *v41;
  int64_t v42;
  char *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  char *v50;
  int v51;
  std::__shared_weak_count *v52;
  NSObject *v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t *v75;
  unint64_t v76;
  char *v77;
  id v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  _DWORD **v84;
  _DWORD **v85;
  _DWORD *v86;
  _DWORD *v87;
  uint64_t v88;
  size_t v89;
  unint64_t v90;
  __int128 *v91;
  unint64_t v92;
  size_t v93;
  __int128 *v94;
  uint64_t v95;
  _BYTE *v96;
  unint64_t v97;
  uint64_t v98;
  _BYTE *v99;
  _BYTE *v100;
  int v101;
  __int128 *v102;
  size_t v103;
  unint64_t v104;
  size_t v105;
  unint64_t v106;
  void **v107;
  unint64_t v108;
  size_t v109;
  void **v110;
  size_t v111;
  char *v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  char *v116;
  std::__shared_weak_count *v117;
  unint64_t *v118;
  unint64_t v119;
  void *v120;
  int v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  CSUCaptionResult *v131;
  double v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  id *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  _QWORD *v153;
  void *v154;
  char *v155;
  void *v156;
  void *v157;
  _DWORD *v159;
  _DWORD **v160;
  _DWORD **v161;
  id v162;
  void *v164;
  int v165;
  _DWORD *v166;
  uint64_t v167;
  std::__shared_weak_count *v168;
  void *v169;
  char *v170;
  _QWORD v171[2];
  unsigned int v172;
  CSUImageCaptioningDecoderE5 *v173;
  uint8_t v174;
  char v175[15];
  void *__p[2];
  int64_t v177;
  std::__shared_weak_count *v178;
  unsigned __int8 v179;
  uint64_t v180;
  std::__shared_weak_count *v181;
  char *v182;
  std::__shared_weak_count *v183;
  char *v184;
  __int128 v185;
  int64_t v186;
  uint64_t v187;
  std::__shared_weak_count *v188;
  __int128 v189;
  _DWORD *v190;

  v173 = self;
  v172 = 0;
  v171[0] = &v173;
  v171[1] = &v172;
  v159 = operator new(4uLL);
  *v159 = 0;
  procUtils = self->_procUtils;
  if (procUtils)
  {
    objc_msgSend_beamSearch(procUtils, v4, v5, v6, v7);
    v9 = v167;
    v11 = v167 + 192;
    v10 = *(char **)(v167 + 192);
    if (!v10)
      goto LABEL_18;
LABEL_5:
    v12 = *(char **)(v9 + 200);
    v13 = v10;
    if (v12 == v10)
    {
LABEL_17:
      *(_QWORD *)(v9 + 200) = v10;
      operator delete(v13);
      goto LABEL_18;
    }
    while (1)
    {
      v14 = (std::__shared_weak_count *)*((_QWORD *)v12 - 1);
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
          break;
      }
      v17 = (void *)*((_QWORD *)v12 - 5);
      if (v17)
        goto LABEL_13;
LABEL_7:
      v12 -= 48;
      if (v12 == v10)
      {
        v13 = *(char **)v11;
        goto LABEL_17;
      }
    }
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    v17 = (void *)*((_QWORD *)v12 - 5);
    if (!v17)
      goto LABEL_7;
LABEL_13:
    *((_QWORD *)v12 - 4) = v17;
    operator delete(v17);
    goto LABEL_7;
  }
  v9 = 0;
  v168 = 0;
  v11 = 192;
  v10 = (char *)MEMORY[0xC0];
  if (MEMORY[0xC0])
    goto LABEL_5;
LABEL_18:
  *(_QWORD *)v11 = 0;
  *(_QWORD *)(v11 + 8) = 0;
  *(_QWORD *)(v11 + 16) = 0;
  v18 = operator new(4uLL);
  v188 = 0;
  *(_QWORD *)&v189 = v18;
  *v18 = *v159;
  *((_QWORD *)&v189 + 1) = v18 + 1;
  v190 = v18 + 1;
  v187 = 0;
  sub_23A01C6D0(v11 - 24, &v189, &v187, 0.00000011921);
  v19 = v188;
  if (v188)
  {
    v20 = (unint64_t *)&v188->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if ((_QWORD)v189)
  {
    *((_QWORD *)&v189 + 1) = v189;
    operator delete((void *)v189);
  }
  v22 = *(_DWORD *)v9 - 1;
  if (*(_BYTE *)(v9 + 16) && *(_DWORD *)(v9 + 12) < v22)
    v22 = *(_DWORD *)(v9 + 12);
  sub_23A01C8B8(v11 - 24, (uint64_t *)&v185);
  if (v22 >= 1)
  {
    v23 = 0;
    v165 = v22;
    while (1)
    {
      v25 = *(char **)v11;
      if (!*(_QWORD *)v11)
        goto LABEL_47;
      v26 = *(char **)(v9 + 200);
      v27 = *(char **)v11;
      if (v26 != v25)
        break;
LABEL_46:
      *(_QWORD *)(v9 + 200) = v25;
      operator delete(v27);
LABEL_47:
      *(_QWORD *)v11 = 0;
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      v32 = *((_QWORD *)&v185 + 1);
      v33 = v185;
      if ((_QWORD)v185 != *((_QWORD *)&v185 + 1))
      {
        v34 = 0;
        while (*(_BYTE *)(v9 + 8))
        {
          v35 = *(_QWORD *)(v9 + 128);
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
          v38 = *(_DWORD *)(*(_QWORD *)(v33 + 16) - 4);
          if (v38 != (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v35 + 32))(v35, v36, v37)
            || *(_QWORD *)(v33 + 16) - *(_QWORD *)(v33 + 8) < 5uLL)
          {
            break;
          }
          v39 = *(float *)v33;
          v183 = 0;
          v184 = 0;
          v182 = 0;
          v41 = *(_BYTE **)(v33 + 8);
          v40 = *(_BYTE **)(v33 + 16);
          v42 = v40 - v41;
          if (v40 != v41)
          {
            if (v42 < 0)
              sub_239FEBE68();
            v182 = (char *)operator new(v40 - v41);
            v183 = (std::__shared_weak_count *)v182;
            v43 = &v182[4 * (v42 >> 2)];
            v184 = v43;
            memcpy(v182, v41, v42);
            v183 = (std::__shared_weak_count *)v43;
          }
          v44 = *(std::__shared_weak_count **)(v33 + 40);
          v180 = *(_QWORD *)(v33 + 32);
          v181 = v44;
          if (v44)
          {
            v45 = (unint64_t *)&v44->__shared_owners_;
            do
              v46 = __ldxr(v45);
            while (__stxr(v46 + 1, v45));
          }
          sub_23A01C6D0(v11 - 24, &v182, &v180, v39);
          v47 = v181;
          if (v181)
          {
            v48 = (unint64_t *)&v181->__shared_owners_;
            do
              v49 = __ldaxr(v48);
            while (__stlxr(v49 - 1, v48));
            if (!v49)
            {
              ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
              std::__shared_weak_count::__release_weak(v47);
              ++v34;
              v50 = v182;
              if (!v182)
                goto LABEL_50;
LABEL_68:
              v183 = (std::__shared_weak_count *)v50;
              operator delete(v50);
              goto LABEL_50;
            }
          }
          ++v34;
          v50 = v182;
          if (v182)
            goto LABEL_68;
LABEL_50:
          v33 += 48;
          if (v33 == v32)
            goto LABEL_84;
        }
        sub_23A01CAB0((uint64_t)__p, v9, v33 + 8, (uint64_t)v171, v23);
        v51 = v179;
        if (v179)
        {
          (***(void (****)(_QWORD, void **))(v9 + 152))(*(_QWORD *)(v9 + 152), __p);
          sub_23A01CF9C(v9, (uint64_t)__p, v33 + 8, *(float *)v33);
          v52 = v178;
          if (!v178)
            goto LABEL_78;
        }
        else
        {
          sub_23A016E78();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            sub_23A09DEE8(&v174, v175, v53);

            v52 = v178;
            if (!v178)
              goto LABEL_78;
          }
          else
          {

            v52 = v178;
            if (!v178)
              goto LABEL_78;
          }
        }
        v54 = (unint64_t *)&v52->__shared_owners_;
        do
          v55 = __ldaxr(v54);
        while (__stlxr(v55 - 1, v54));
        if (!v55)
        {
          ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
          std::__shared_weak_count::__release_weak(v52);
        }
LABEL_78:
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (!v51)
        {
LABEL_84:
          v57 = *(_QWORD *)(v9 + 192);
          v56 = *(_QWORD *)(v9 + 200);
          v22 = v165;
          goto LABEL_86;
        }
        goto LABEL_50;
      }
      v57 = 0;
      v56 = 0;
      v34 = 0;
LABEL_86:
      if (v34 == -1431655765 * ((unint64_t)(v56 - v57) >> 4))
      {
        sub_23A016E78();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          sub_23A09DE78(v23, v64);

        goto LABEL_102;
      }
      sub_23A01C8B8(v11 - 24, (uint64_t *)__p);
      v58 = v185;
      if (!(_QWORD)v185)
        goto LABEL_32;
      v59 = *((_QWORD *)&v185 + 1);
      v24 = (void *)v185;
      if (*((_QWORD *)&v185 + 1) != (_QWORD)v185)
      {
        while (1)
        {
          v60 = *(std::__shared_weak_count **)(v59 - 8);
          if (v60)
          {
            v61 = (unint64_t *)&v60->__shared_owners_;
            do
              v62 = __ldaxr(v61);
            while (__stlxr(v62 - 1, v61));
            if (!v62)
              break;
          }
          v63 = *(void **)(v59 - 40);
          if (v63)
            goto LABEL_96;
LABEL_90:
          v59 -= 48;
          if (v59 == v58)
          {
            v24 = (void *)v185;
            goto LABEL_31;
          }
        }
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
        v63 = *(void **)(v59 - 40);
        if (!v63)
          goto LABEL_90;
LABEL_96:
        *(_QWORD *)(v59 - 32) = v63;
        operator delete(v63);
        goto LABEL_90;
      }
LABEL_31:
      *((_QWORD *)&v185 + 1) = v58;
      operator delete(v24);
LABEL_32:
      v185 = *(_OWORD *)__p;
      v186 = v177;
      v23 = (v23 + 1);
      if ((_DWORD)v23 == v22)
        goto LABEL_102;
    }
    while (1)
    {
      v28 = (std::__shared_weak_count *)*((_QWORD *)v26 - 1);
      if (v28)
      {
        v29 = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
          break;
      }
      v31 = (void *)*((_QWORD *)v26 - 5);
      if (v31)
        goto LABEL_42;
LABEL_36:
      v26 -= 48;
      if (v26 == v25)
      {
        v27 = *(char **)v11;
        goto LABEL_46;
      }
    }
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    v31 = (void *)*((_QWORD *)v26 - 5);
    if (!v31)
      goto LABEL_36;
LABEL_42:
    *((_QWORD *)v26 - 4) = v31;
    operator delete(v31);
    goto LABEL_36;
  }
LABEL_102:
  v65 = v185;
  if ((_QWORD)v185)
  {
    v66 = *((_QWORD *)&v185 + 1);
    v67 = (void *)v185;
    if (*((_QWORD *)&v185 + 1) == (_QWORD)v185)
    {
LABEL_115:
      *((_QWORD *)&v185 + 1) = v65;
      operator delete(v67);
      goto LABEL_116;
    }
    while (1)
    {
      v68 = *(std::__shared_weak_count **)(v66 - 8);
      if (v68)
      {
        v69 = (unint64_t *)&v68->__shared_owners_;
        do
          v70 = __ldaxr(v69);
        while (__stlxr(v70 - 1, v69));
        if (!v70)
          break;
      }
      v71 = *(void **)(v66 - 40);
      if (v71)
        goto LABEL_111;
LABEL_105:
      v66 -= 48;
      if (v66 == v65)
      {
        v67 = (void *)v185;
        goto LABEL_115;
      }
    }
    ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
    std::__shared_weak_count::__release_weak(v68);
    v71 = *(void **)(v66 - 40);
    if (!v71)
      goto LABEL_105;
LABEL_111:
    *(_QWORD *)(v66 - 32) = v71;
    operator delete(v71);
    goto LABEL_105;
  }
LABEL_116:
  sub_23A01C4B4(v11 - 24, (uint64_t)&v169);
  if (!v168)
    goto LABEL_120;
  v75 = (unint64_t *)&v168->__shared_owners_;
  do
    v76 = __ldaxr(v75);
  while (__stlxr(v76 - 1, v75));
  if (!v76)
  {
    ((void (*)(std::__shared_weak_count *))v168->__on_zero_shared)(v168);
    std::__shared_weak_count::__release_weak(v168);
    v77 = (char *)v169;
    if (v170 != v169)
      goto LABEL_121;
  }
  else
  {
LABEL_120:
    v77 = (char *)v169;
    if (v170 != v169)
    {
LABEL_121:
      v78 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v83 = v78;
      v84 = (_DWORD **)v169;
      v160 = (_DWORD **)v170;
      if (v169 != v170)
      {
        v162 = v78;
        do
        {
          HIBYTE(v177) = 0;
          LOBYTE(__p[0]) = 0;
          v85 = v84;
          v86 = *v84;
          v161 = v85;
          v87 = v85[1];
          v166 = v87;
          while (v86 != v87)
          {
            if (!*v86)
              goto LABEL_125;
            objc_msgSend_vocabulary(v173->_procUtils, v79, v80, v81, v82);
            (*(void (**)(__int128 *__return_ptr, char *, _QWORD))(*(_QWORD *)v182 + 40))(&v185, v182, *v86);
            v88 = HIBYTE(v186);
            if (v186 >= 0)
              v89 = 22;
            else
              v89 = (v186 & 0x7FFFFFFFFFFFFFFFLL) - 1;
            if (v186 < 0)
              v88 = *((_QWORD *)&v185 + 1);
            if (v89 == v88)
            {
              if (v89 == 0x7FFFFFFFFFFFFFF6)
                sub_239FEBDE0();
              v90 = v89 + 1;
              if (v186 >= 0)
                v91 = &v185;
              else
                v91 = (__int128 *)v185;
              if (v89 >= 0x3FFFFFFFFFFFFFF3)
              {
                v93 = 0x7FFFFFFFFFFFFFF7;
              }
              else
              {
                v92 = 2 * v89;
                if (v90 > 2 * v89)
                  v92 = v89 + 1;
                if (v92 >= 0x17)
                {
                  v97 = (v92 & 0xFFFFFFFFFFFFFFF8) + 8;
                  v98 = v92 | 7;
                  if (v98 == 23)
                    v98 = v97;
                  v93 = v98 + 1;
                }
                else
                {
                  v93 = 23;
                }
              }
              v99 = operator new(v93);
              v100 = v99;
              if (v89)
              {
                memmove(v99, v91, v89);
                v100[v89] = 32;
                if (v89 == 22)
                  goto LABEL_158;
              }
              else
              {
                *v99 = 32;
              }
              operator delete(v91);
LABEL_158:
              *((_QWORD *)&v185 + 1) = v89 + 1;
              v186 = v93 | 0x8000000000000000;
              *(_QWORD *)&v185 = v100;
              v96 = &v100[v90];
              goto LABEL_159;
            }
            v94 = &v185;
            if (v186 < 0)
              v94 = (__int128 *)v185;
            *((_BYTE *)v94 + v88) = 32;
            v95 = v88 + 1;
            if (SHIBYTE(v186) < 0)
              *((_QWORD *)&v185 + 1) = v95;
            else
              HIBYTE(v186) = v95 & 0x7F;
            v96 = (char *)v94 + v95;
LABEL_159:
            *v96 = 0;
            v190 = (_DWORD *)v186;
            v189 = v185;
            v186 = 0;
            v185 = 0uLL;
            v101 = SHIBYTE(v190);
            v164 = (void *)v189;
            if (SHIBYTE(v190) >= 0)
              v102 = &v189;
            else
              v102 = (__int128 *)v189;
            if (SHIBYTE(v190) >= 0)
              v103 = HIBYTE(v190);
            else
              v103 = *((_QWORD *)&v189 + 1);
            if (v177 >= 0)
              v104 = 22;
            else
              v104 = (v177 & 0x7FFFFFFFFFFFFFFFLL) - 1;
            if (v177 >= 0)
              v105 = HIBYTE(v177);
            else
              v105 = (size_t)__p[1];
            if (v104 - v105 < v103)
            {
              v106 = v105 + v103;
              if (0x7FFFFFFFFFFFFFF6 - v104 < v105 + v103 - v104)
                sub_239FEBDE0();
              if (v177 >= 0)
                v107 = __p;
              else
                v107 = (void **)__p[0];
              if (v104 >= 0x3FFFFFFFFFFFFFF3)
              {
                v113 = 0x7FFFFFFFFFFFFFF6;
              }
              else
              {
                v108 = 2 * v104;
                if (v106 > 2 * v104)
                  v108 = v105 + v103;
                if (v108 < 0x17)
                {
                  v109 = 23;
LABEL_192:
                  v115 = (char *)operator new(v109);
                  v116 = v115;
                  if (v105)
                    memmove(v115, v107, v105);
                  memcpy(&v116[v105], v102, v103);
                  if (v104 != 22)
                    operator delete(v107);
                  __p[1] = (void *)(v105 + v103);
                  v177 = v109 | 0x8000000000000000;
                  __p[0] = v116;
                  v112 = &v116[v106];
                  v83 = v162;
                  goto LABEL_197;
                }
                v114 = (v108 & 0xFFFFFFFFFFFFFFF8) + 8;
                v113 = v108 | 7;
                if (v113 == 23)
                  v113 = v114;
              }
              v109 = v113 + 1;
              goto LABEL_192;
            }
            if (!v103)
              goto LABEL_198;
            if (v177 >= 0)
              v110 = __p;
            else
              v110 = (void **)__p[0];
            memmove((char *)v110 + v105, v102, v103);
            v111 = v105 + v103;
            if (SHIBYTE(v177) < 0)
              __p[1] = (void *)(v105 + v103);
            else
              HIBYTE(v177) = v111 & 0x7F;
            v112 = (char *)v110 + v111;
LABEL_197:
            *v112 = 0;
LABEL_198:
            if (v101 < 0)
            {
              operator delete(v164);
              if ((SHIBYTE(v186) & 0x80000000) == 0)
              {
LABEL_200:
                v117 = v183;
                if (!v183)
                  goto LABEL_125;
                goto LABEL_204;
              }
            }
            else if ((SHIBYTE(v186) & 0x80000000) == 0)
            {
              goto LABEL_200;
            }
            operator delete((void *)v185);
            v117 = v183;
            if (!v183)
              goto LABEL_125;
LABEL_204:
            v118 = (unint64_t *)&v117->__shared_owners_;
            do
              v119 = __ldaxr(v118);
            while (__stlxr(v119 - 1, v118));
            if (!v119)
            {
              ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
              std::__shared_weak_count::__release_weak(v117);
            }
LABEL_125:
            ++v86;
            v87 = v166;
          }
          MEMORY[0x23B83FDBC](&v185);
          LODWORD(v189) = 0x4000;
          std::locale::locale((std::locale *)&v189 + 1, (const std::locale *)&v185);
          sub_23A01F000((unsigned __int8 *)__p, (const std::locale *)&v189);
          std::locale::~locale((std::locale *)&v189 + 1);
          std::locale::~locale((std::locale *)&v185);
          MEMORY[0x23B83FDBC]();
          LODWORD(v189) = 0x4000;
          std::locale::locale((std::locale *)&v189 + 1, (const std::locale *)&v185);
          sub_23A01F1FC((char *)__p, (const std::locale *)&v189);
          std::locale::~locale((std::locale *)&v189 + 1);
          std::locale::~locale((std::locale *)&v185);
          v120 = (void *)MEMORY[0x24BDD17C8];
          v121 = SHIBYTE(v177);
          v122 = __p[0];
          v128 = objc_msgSend_defaultCStringEncoding(MEMORY[0x24BDD17C8], v123, v124, v125, v126);
          if (v121 >= 0)
            objc_msgSend_stringWithCString_encoding_(v120, v127, (uint64_t)__p, v128, v129);
          else
            objc_msgSend_stringWithCString_encoding_(v120, v127, (uint64_t)v122, v128, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = [CSUCaptionResult alloc];
          LODWORD(v132) = *((_DWORD *)v161 + 6);
          v136 = (void *)objc_msgSend_initWithCaption_score_(v131, v133, (uint64_t)v130, v134, v135, v132);
          objc_msgSend_addObject_(v83, v137, (uint64_t)v136, v138, v139);

          if (SHIBYTE(v177) < 0)
            operator delete(__p[0]);
          v84 = v161 + 4;
        }
        while (v161 + 4 != v160);
      }
      objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v79, (uint64_t)v83, v81, v82);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v141, (uint64_t)v140, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      v145 = v144;
      goto LABEL_218;
    }
  }
  v145 = a3;
  if (!a3)
    goto LABEL_219;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v72, (uint64_t)CFSTR("Captioning model failed to generate output at timestep %d"), v73, v74, v172);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v146, (uint64_t)v83, v147, v148);
  v149 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v149;
  objc_msgSend_logInternalError_(CSUError, v150, (uint64_t)v149, v151, v152);
  v145 = 0;
LABEL_218:

  v77 = (char *)v169;
LABEL_219:
  if (v77)
  {
    v153 = v170;
    v154 = v77;
    if (v170 != v77)
    {
      v155 = v170;
      do
      {
        v157 = (void *)*((_QWORD *)v155 - 4);
        v155 -= 32;
        v156 = v157;
        if (v157)
        {
          *(v153 - 3) = v156;
          operator delete(v156);
        }
        v153 = v155;
      }
      while (v155 != v77);
      v154 = v169;
    }
    v170 = v77;
    operator delete(v154);
  }
  operator delete(v159);
  return v145;
}

- (id)getCaptionsAfterGreedyDecodingOnEncodedFeatures:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  CSUCoreMLInference *decoderE5Net;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CSUCoreMLInference *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  std::__shared_weak_count_vtbl *v79;
  std::__shared_weak_count_vtbl *v80;
  MLMultiArray *inputTokensE5;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  _BYTE *v90;
  char *v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  _OWORD *v96;
  char *v97;
  uint64_t v98;
  __int128 v99;
  int v100;
  float *v107;
  uint64_t v108;
  float32x4_t *v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  _BYTE *v114;
  float32x4_t *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  float *v119;
  _OWORD *v120;
  float *v121;
  uint64_t v122;
  __int128 v123;
  __int32 v124;
  BOOL v125;
  char v126;
  float32x4_t *v127;
  float *v128;
  unint64_t v129;
  float *v130;
  uint64_t v131;
  float32x4_t *v132;
  uint64_t v133;
  float32x4_t v134;
  float64x2_t v135;
  float64x2_t v136;
  float64x2_t v137;
  float64x2_t v138;
  float v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  char *v145;
  unsigned int *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  std::__shared_weak_count *v152;
  unint64_t *p_shared_owners;
  unint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  std::__shared_weak_count *v163;
  unint64_t *v164;
  unint64_t v165;
  void *v166;
  CSUCaptionResult *v167;
  double v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  id v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  id v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  id *v193;
  unint64_t v194;
  id v195;
  void *__p;
  char v197;
  _QWORD v198[6];
  _QWORD v199[4];
  id v200;
  void **v201;
  uint64_t *v202;
  uint64_t v203;
  uint64_t v204;
  std::__shared_weak_count *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  void **v209;
  uint64_t v210;
  uint64_t v211;
  float32x4_t *v212;
  float *v213;
  float *v214;
  char *v215;
  char *v216;
  char *v217;
  _QWORD v218[2];
  _QWORD v219[4];

  v5 = a3;
  v219[2] = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_maxSeqLen(self->_configuration, a2, (uint64_t)a3, v3, v4);
  v215 = 0;
  v216 = 0;
  v217 = 0;
  v212 = 0;
  v213 = 0;
  v12 = 0.0;
  v214 = 0;
  if (!v7)
  {
    v195 = 0;
    v127 = 0;
    v128 = 0;
    goto LABEL_71;
  }
  v13 = v7;
  v195 = 0;
  v14 = 0;
  v193 = v5;
  v194 = v7;
  do
  {
    if (!self->_encodedFeaturesBufferE5)
      goto LABEL_98;
    decoderE5Net = self->_decoderE5Net;
    objc_msgSend_inputEncodedFeaturesTensorName(self->_configuration, v8, v9, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v218[0] = v16;
    v219[0] = self->_encodedFeaturesBufferE5;
    objc_msgSend_inputWordIdsTensorName(self->_configuration, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v218[1] = v21;
    v219[1] = self->_inputTokensE5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)v219, (uint64_t)v218, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(decoderE5Net) = objc_msgSend_setInputFeatures_error_(decoderE5Net, v24, (uint64_t)v23, (uint64_t)v5, v25);

    if ((decoderE5Net & 1) == 0)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v26, (uint64_t)CFSTR("Decoder model failed to set input features"), v27, v28);
      goto LABEL_97;
    }
    if (!objc_msgSend_predict_(self->_decoderE5Net, v26, (uint64_t)v5, v27, v28))
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v29, (uint64_t)CFSTR("Decoder model failed to generate output"), v31, v32);
LABEL_97:
      v188 = (id)objc_claimAutoreleasedReturnValue();
      *v5 = v188;
      objc_msgSend_logInternalError_(CSUError, v189, (uint64_t)v188, v190, v191);
LABEL_98:
      v184 = 0;
      goto LABEL_99;
    }
    v33 = self->_decoderE5Net;
    objc_msgSend_outputWordProbsTensorName(self->_configuration, v29, v30, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getOutputFor_(v33, v35, (uint64_t)v34, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_configuration(self, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = objc_msgSend_saveDecoderFeatures(v43, v44, v45, v46, v47);

    if ((_DWORD)v34)
      v195 = v38;
    else
      v195 = 0;
    objc_msgSend_shape(v38, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_count(v52, v53, v54, v55, v56);

    objc_msgSend_shape(v38, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v62, v63, v57 - 1, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_unsignedLongValue(v66, v67, v68, v69, v70);

    v208 = 0;
    v209 = &v208;
    v210 = 0x2020000000;
    v211 = 0;
    v204 = 0;
    v205 = (std::__shared_weak_count *)&v204;
    v206 = 0x2020000000;
    v207 = v71 + 1;
    v199[0] = MEMORY[0x24BDAC760];
    v199[1] = 3221225472;
    v199[2] = sub_23A01C218;
    v199[3] = &unk_250B0E528;
    v72 = v38;
    v200 = v72;
    v201 = &v208;
    v202 = &v204;
    v203 = v14;
    objc_msgSend_getBytesWithHandler_(v72, v73, (uint64_t)v199, v74, v75);
    v79 = v205[1].__vftable;
    if (v79)
    {
      v80 = v205[1].__vftable;
      if (v14 + 1 < v13)
      {
        inputTokensE5 = self->_inputTokensE5;
        v198[0] = MEMORY[0x24BDAC760];
        v198[1] = 3221225472;
        v198[2] = sub_23A01C32C;
        v198[3] = &unk_250B0E550;
        v198[4] = &v204;
        v198[5] = v14;
        objc_msgSend_getMutableBytesWithHandler_(inputTokensE5, v76, (uint64_t)v198, v77, v78);
        v80 = v205[1].__vftable;
      }
      v82 = v216;
      if (v216 < v217)
      {
        *(_DWORD *)v216 = (_DWORD)v80;
        v83 = (uint64_t)(v82 + 4);
        goto LABEL_35;
      }
      v84 = v215;
      v85 = (v216 - v215) >> 2;
      v86 = v85 + 1;
      if ((unint64_t)(v85 + 1) >> 62)
        sub_239FEBE68();
      v87 = v217 - v215;
      if ((v217 - v215) >> 1 > v86)
        v86 = v87 >> 1;
      if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFFCLL)
        v88 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v88 = v86;
      if (v88)
      {
        if (v88 >> 62)
          sub_239FF1A44();
        v89 = v88;
        v90 = operator new(4 * v88);
        v88 = v89;
        v91 = &v90[4 * v85];
        *(_DWORD *)v91 = (_DWORD)v80;
        v83 = (uint64_t)(v91 + 4);
        if (v82 != v84)
        {
LABEL_23:
          v92 = v82 - 4 - v84;
          if (v92 < 0x2C)
            goto LABEL_110;
          if ((unint64_t)(v84 - v90) < 0x20)
            goto LABEL_110;
          v93 = (v92 >> 2) + 1;
          v94 = 4 * (v93 & 0x7FFFFFFFFFFFFFF8);
          v95 = &v82[-v94];
          v91 -= v94;
          v96 = &v90[4 * v85 - 16];
          v97 = v82 - 16;
          v98 = v93 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v99 = *(_OWORD *)v97;
            *(v96 - 1) = *((_OWORD *)v97 - 1);
            *v96 = v99;
            v96 -= 2;
            v97 -= 32;
            v98 -= 8;
          }
          while (v98);
          v82 = v95;
          if (v93 != (v93 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_110:
            do
            {
              v100 = *((_DWORD *)v82 - 1);
              v82 -= 4;
              *((_DWORD *)v91 - 1) = v100;
              v91 -= 4;
            }
            while (v82 != v84);
          }
        }
      }
      else
      {
        v90 = 0;
        v91 = (char *)(4 * v85);
        *(_DWORD *)(4 * v85) = (_DWORD)v80;
        v83 = 4 * v85 + 4;
        if (v82 != v84)
          goto LABEL_23;
      }
      v215 = v91;
      v217 = &v90[4 * v88];
      if (v84)
        operator delete(v84);
      v5 = v193;
LABEL_35:
      v216 = (char *)v83;
      _H0 = *(_WORD *)v209[3];
      __asm { FCVT            S11, H0 }
      v107 = v213;
      if (v213 < v214)
      {
        *(_DWORD *)v213 = _S11;
        v108 = (uint64_t)(v107 + 1);
LABEL_58:
        v213 = (float *)v108;
        v13 = v194;
        goto LABEL_59;
      }
      v109 = v212;
      v110 = ((char *)v213 - (char *)v212) >> 2;
      v111 = v110 + 1;
      if ((unint64_t)(v110 + 1) >> 62)
        sub_239FEBE68();
      v112 = (char *)v214 - (char *)v212;
      if (((char *)v214 - (char *)v212) >> 1 > v111)
        v111 = v112 >> 1;
      if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFFCLL)
        v113 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v113 = v111;
      if (v113)
      {
        if (v113 >> 62)
          sub_239FF1A44();
        v114 = operator new(4 * v113);
        v115 = (float32x4_t *)&v114[4 * v110];
        v115->i32[0] = _S11;
        v108 = (uint64_t)v115->i64 + 4;
        if (v107 != (float *)v109)
        {
LABEL_46:
          v116 = (char *)(v107 - 1) - (char *)v109;
          if (v116 < 0x2C)
            goto LABEL_111;
          if ((unint64_t)((char *)v109 - v114) < 0x20)
            goto LABEL_111;
          v117 = (v116 >> 2) + 1;
          v118 = 4 * (v117 & 0x7FFFFFFFFFFFFFF8);
          v119 = &v107[v118 / 0xFFFFFFFFFFFFFFFCLL];
          v115 = (float32x4_t *)((char *)v115 - v118);
          v120 = &v114[4 * v110 - 16];
          v121 = v107 - 4;
          v122 = v117 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v123 = *(_OWORD *)v121;
            *(v120 - 1) = *((_OWORD *)v121 - 1);
            *v120 = v123;
            v120 -= 2;
            v121 -= 8;
            v122 -= 8;
          }
          while (v122);
          v107 = v119;
          if (v117 != (v117 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_111:
            do
            {
              v124 = *((_DWORD *)v107-- - 1);
              v115[-1].i32[3] = v124;
              v115 = (float32x4_t *)((char *)v115 - 4);
            }
            while (v107 != (float *)v109);
          }
        }
      }
      else
      {
        v114 = 0;
        v115 = (float32x4_t *)(4 * v110);
        *(_DWORD *)(4 * v110) = _S11;
        v108 = 4 * v110 + 4;
        if (v107 != (float *)v109)
          goto LABEL_46;
      }
      v212 = v115;
      v214 = (float *)&v114[4 * v113];
      if (v109)
        operator delete(v109);
      v5 = v193;
      goto LABEL_58;
    }
LABEL_59:
    v125 = v79 == 0;

    _Block_object_dispose(&v204, 8);
    _Block_object_dispose(&v208, 8);

    v126 = ++v14 == v13 || v125;
  }
  while ((v126 & 1) == 0);
  v127 = v212;
  v128 = v213;
  if (v212 != (float32x4_t *)v213)
  {
    v129 = (char *)v213 - (char *)v212 - 4;
    v12 = 0.0;
    v130 = (float *)v212;
    if (v129 < 0x1C)
      goto LABEL_112;
    v131 = (v129 >> 2) + 1;
    v130 = &v212->f32[v131 & 0x7FFFFFFFFFFFFFF8];
    v132 = v212 + 1;
    v133 = v131 & 0x7FFFFFFFFFFFFFF8;
    do
    {
      v134 = v132[-1];
      v135 = vcvt_hight_f64_f32(v134);
      v136 = vcvtq_f64_f32(*(float32x2_t *)v134.f32);
      v137 = vcvt_hight_f64_f32(*v132);
      v138 = vcvtq_f64_f32(*(float32x2_t *)v132->f32);
      v12 = v12
          + v136.f64[0]
          + v136.f64[1]
          + v135.f64[0]
          + v135.f64[1]
          + v138.f64[0]
          + v138.f64[1]
          + v137.f64[0]
          + v137.f64[1];
      v132 += 2;
      v133 -= 8;
    }
    while (v133);
    if (v131 != (v131 & 0x7FFFFFFFFFFFFFF8))
    {
LABEL_112:
      do
      {
        v139 = *v130++;
        v12 = v12 + v139;
      }
      while (v130 != v213);
    }
  }
LABEL_71:
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v8, v9, v10, v11);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v215;
  v146 = (unsigned int *)v216;
  if (v215 != v216)
  {
    while (2)
    {
      v147 = *(unsigned int *)v145;
      if (!(_DWORD)v147)
        break;
      objc_msgSend_vocabulary(self->_procUtils, v140, v141, v142, v143);
      (*(void (**)(void **__return_ptr, void *, uint64_t))(*(_QWORD *)v208 + 40))(&__p, v208, v147);
      if (v197 < 0)
      {
        operator delete(__p);
        v152 = (std::__shared_weak_count *)v209;
        if (!v209)
          goto LABEL_83;
      }
      else
      {
        v152 = (std::__shared_weak_count *)v209;
        if (!v209)
          goto LABEL_83;
      }
      p_shared_owners = (unint64_t *)&v152->__shared_owners_;
      do
        v154 = __ldaxr(p_shared_owners);
      while (__stlxr(v154 - 1, p_shared_owners));
      if (!v154)
      {
        ((void (*)(std::__shared_weak_count *))v152->__on_zero_shared)(v152);
        std::__shared_weak_count::__release_weak(v152);
      }
LABEL_83:
      v155 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_vocabulary(self->_procUtils, v148, v149, v150, v151);
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v204 + 40))(&v208, v204, v147);
      if (v210 >= 0)
        objc_msgSend_stringWithUTF8String_(v155, v156, (uint64_t)&v208, v157, v158);
      else
        objc_msgSend_stringWithUTF8String_(v155, v156, (uint64_t)v208, v157, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v144, v160, (uint64_t)v159, v161, v162);

      if (SHIBYTE(v210) < 0)
      {
        operator delete(v208);
        v163 = v205;
        if (!v205)
          goto LABEL_73;
      }
      else
      {
        v163 = v205;
        if (!v205)
          goto LABEL_73;
      }
      v164 = (unint64_t *)&v163->__shared_owners_;
      do
        v165 = __ldaxr(v164);
      while (__stlxr(v165 - 1, v164));
      if (!v165)
      {
        ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
        std::__shared_weak_count::__release_weak(v163);
      }
LABEL_73:
      v145 += 4;
      if (v145 == (char *)v146)
        break;
      continue;
    }
  }
  objc_msgSend_componentsJoinedByString_(v144, v140, (uint64_t)CFSTR(" "), v142, v143);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = [CSUCaptionResult alloc];
  v168 = v12 / (double)(unint64_t)(((char *)v128 - (char *)v127) >> 2);
  *(float *)&v168 = v168;
  v172 = (void *)objc_msgSend_initWithCaption_score_(v167, v169, (uint64_t)v166, v170, v171, v168);
  v173 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_addObject_(v173, v174, (uint64_t)v172, v175, v176);
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v177, (uint64_t)v173, v178, v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createCaptionResultsWithResults_(CSUCaptionResults, v181, (uint64_t)v180, v182, v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setDecoderFeaturesMLMultiArray_(v184, v185, (uint64_t)v195, v186, v187);
LABEL_99:

  if (v212)
    operator delete(v212);
  if (v215)
    operator delete(v215);
  return v184;
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
  id v25;

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
      sub_23A09DF54();

    v25 = v6;
    return v25;
  }
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
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_procUtils, 0);
  objc_storeStrong((id *)&self->_encodedFeaturesBufferE5, 0);
  objc_storeStrong((id *)&self->_inputTokensE5, 0);
  objc_storeStrong((id *)&self->_bridgeE5Net, 0);
  objc_storeStrong((id *)&self->_decoderE5Net, 0);
}

@end
