@implementation ANSTVMTrackerEspresso

+ (ANSTVMTrackerEspresso)new
{
  ANSTVMTrackerEspresso *result;

  result = (ANSTVMTrackerEspresso *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTVMTrackerEspresso)init
{
  ANSTVMTrackerEspresso *result;

  result = (ANSTVMTrackerEspresso *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTVMTrackerEspresso)initWithConfiguration:(id)a3
{
  id v5;
  ANSTVMTrackerEspresso *v6;
  ANSTVMTrackerEspresso *v7;
  const char *v8;
  uint64_t v9;
  ANSTVMTrackerEspresso *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANSTVMTrackerEspresso;
  v6 = -[ANSTVMTrackerEspresso init](&v12, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_configuration, a3),
        v7->_firstFrame = 1,
        !objc_msgSend_initNetwork(v7, v8, v9)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (BOOL)initNetwork
{
  ANSTBaseNetworkEspresso *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  ANSTBaseNetworkEspresso *v17;
  ANSTBaseNetworkEspresso *memoryNetwork;
  const char *v19;
  uint64_t v20;
  int BlobDimensionByName_andDestination;
  ANSTBaseNetworkEspresso *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  ANSTBaseNetworkEspresso *v36;
  ANSTBaseNetworkEspresso *maskNetwork;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  ANSTBaseNetworkEspresso *v42;
  uint64_t v43;
  const char *v44;
  ANSTBaseNetworkEspresso *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  ANSTBaseNetworkEspresso *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  ANSTBaseNetworkEspresso *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  ANSTBaseNetworkEspresso *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  ANSTBaseNetworkEspresso *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  ANSTBaseNetworkEspresso *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  ANSTBaseNetworkEspresso *v84;
  ANSTBaseNetworkEspresso *updateNetwork;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  ANSTBaseNetworkEspresso *v90;
  uint64_t v91;
  const char *v92;
  ANSTBaseNetworkEspresso *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  unint64_t v98;
  ANSTBaseNetworkEspresso *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  ANSTBaseNetworkEspresso *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  unint64_t v109;
  ANSTBaseNetworkEspresso *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  double v115;
  double v116;
  int v117;
  const char *v118;
  uint64_t v119;
  double v120;
  int v121;
  NSObject *v122;
  _OWORD v124[2];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v3 = [ANSTBaseNetworkEspresso alloc];
  v6 = objc_msgSend_networkEngineType(self->_configuration, v4, v5);
  v9 = objc_msgSend_qualityOfService(self->_configuration, v7, v8);
  objc_msgSend__memoryNetworkName(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__expectedMemoryNetworkFileName(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkFileName_(v3, v16, v6, v9, v12, v15);
  memoryNetwork = self->_memoryNetwork;
  self->_memoryNetwork = v17;

  BlobDimensionByName_andDestination = objc_msgSend_prepare(self->_memoryNetwork, v19, v20);
  if (BlobDimensionByName_andDestination)
  {
    v22 = [ANSTBaseNetworkEspresso alloc];
    v25 = objc_msgSend_networkEngineType(self->_configuration, v23, v24);
    v28 = objc_msgSend_qualityOfService(self->_configuration, v26, v27);
    objc_msgSend__maskNetworkName(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__expectedMaskNetworkFileName(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkFileName_(v22, v35, v25, v28, v31, v34);
    maskNetwork = self->_maskNetwork;
    self->_maskNetwork = v36;

    BlobDimensionByName_andDestination = objc_msgSend_prepare(self->_maskNetwork, v38, v39);
    if (BlobDimensionByName_andDestination)
    {
      memset(v124, 0, sizeof(v124));
      v42 = self->_maskNetwork;
      v43 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v40, v41, 0, 0, 0, 0);
      self->_hiddenStateTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v42, v44, v43);
      v45 = self->_maskNetwork;
      v48 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkInputHiddenStateTensorName, v46, v47);
      BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v45, v49, v48, v124);
      if (BlobDimensionByName_andDestination)
      {
        bzero(self->_hiddenStateTensor->var0, 4 * self->_hiddenStateTensor->var13);
        v50 = self->_maskNetwork;
        v53 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v51, v52);
        self->_probTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v50, v54, v53);
        v55 = self->_maskNetwork;
        v58 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v56, v57);
        BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v55, v59, v58, v124);
        if (BlobDimensionByName_andDestination)
        {
          bzero(self->_probTensor->var0, 4 * self->_probTensor->var13);
          v60 = self->_maskNetwork;
          v63 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v61, v62);
          self->_outputMaskBuffer = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v60, v64, v63);
          v65 = self->_maskNetwork;
          v68 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v66, v67);
          BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v65, v69, v68, v124);
          if (BlobDimensionByName_andDestination)
          {
            bzero(self->_outputMaskBuffer->var0, 4 * self->_outputMaskBuffer->var13);
            v70 = [ANSTBaseNetworkEspresso alloc];
            v73 = objc_msgSend_networkEngineType(self->_configuration, v71, v72);
            v76 = objc_msgSend_qualityOfService(self->_configuration, v74, v75);
            objc_msgSend__updateNetworkName(self, v77, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend__expectedUpdateNetworkFileName(self, v80, v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkFileName_(v70, v83, v73, v76, v79, v82);
            updateNetwork = self->_updateNetwork;
            self->_updateNetwork = v84;

            BlobDimensionByName_andDestination = objc_msgSend_prepare(self->_updateNetwork, v86, v87);
            if (BlobDimensionByName_andDestination)
            {
              v90 = self->_updateNetwork;
              v91 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v88, v89);
              self->_keyTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v90, v92, v91);
              v93 = self->_updateNetwork;
              v96 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v94, v95);
              BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v93, v97, v96, v124);
              if (BlobDimensionByName_andDestination)
              {
                bzero(self->_keyTensor->var0, 4 * self->_keyTensor->var13);
                v98 = 4 * self->_keyTensor->var11 * (unint64_t)((double)self->_keyTensor->var6 * 0.5);
                self->_keyTensorSwapSpaceSize = v98;
                self->_keyTensorSwapSpace = malloc_type_malloc(v98, 0x6264D253uLL);
                v99 = self->_updateNetwork;
                v102 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v100, v101);
                self->_valueTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v99, v103, v102);
                v104 = self->_updateNetwork;
                v107 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v105, v106);
                BlobDimensionByName_andDestination = objc_msgSend_getBlobDimensionByName_andDestination_(v104, v108, v107, v124);
                if (BlobDimensionByName_andDestination)
                {
                  bzero(self->_valueTensor->var0, 4 * self->_valueTensor->var13);
                  v109 = 4 * self->_valueTensor->var9 * (unint64_t)((double)self->_valueTensor->var4 * 0.5);
                  self->_valueTensorSwapSpaceSize = v109;
                  self->_valueTensorSwapSpace = malloc_type_malloc(v109, 0xD9557E10uLL);
                  v110 = self->_memoryNetwork;
                  v113 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkInputMaskTensorName, v111, v112);
                  objc_msgSend_getResolutionByBlobName_(v110, v114, v113);
                  v117 = sub_2358DF800((unint64_t)v115, (const char *)v116, &self->_initialMask);
                  if (v117)
                  {
                    v121 = v117;
                    _ANSTLoggingGetOSLogForCategoryANSTKit();
                    v122 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                      sub_235910278(v121, v122);

                    LOBYTE(BlobDimensionByName_andDestination) = 0;
                  }
                  else
                  {
                    LODWORD(v120) = -1.0;
                    LOBYTE(BlobDimensionByName_andDestination) = objc_msgSend__setInitialMaskWithValue_(self, v118, v119, v120);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return BlobDimensionByName_andDestination;
}

- (id)_memoryNetworkName
{
  return CFSTR("visegHQ_memory");
}

- (id)_updateNetworkName
{
  return CFSTR("visegHQ_mask_memory_shared");
}

- (id)_maskNetworkName
{
  return CFSTR("visegHQ_mask_memory_shared");
}

- (id)_expectedMemoryNetworkFileName
{
  uint64_t v2;
  void **p_configuration;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  char *v8;
  uint64_t v9;

  p_configuration = (void **)&self->_configuration;
  if (objc_msgSend_version(self->_configuration, a2, v2) == 0x20000)
  {
    v6 = objc_msgSend_networkResolution(*p_configuration, v4, v5);
    if (v6 < 4)
      return off_2506E3DE0[v6];
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    sub_2359102EC(p_configuration, v8, v9);

  return 0;
}

- (id)_expectedUpdateNetworkFileName
{
  uint64_t v2;
  void **p_configuration;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  char *v8;
  uint64_t v9;

  p_configuration = (void **)&self->_configuration;
  if (objc_msgSend_version(self->_configuration, a2, v2) == 0x20000)
  {
    v6 = objc_msgSend_networkResolution(*p_configuration, v4, v5);
    if (v6 < 4)
      return off_2506E3E00[v6];
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    sub_23591036C(p_configuration, v8, v9);

  return 0;
}

- (id)_expectedMaskNetworkFileName
{
  uint64_t v2;
  void **p_configuration;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  char *v8;
  uint64_t v9;

  p_configuration = (void **)&self->_configuration;
  if (objc_msgSend_version(self->_configuration, a2, v2) == 0x20000)
  {
    v6 = objc_msgSend_networkResolution(*p_configuration, v4, v5);
    if (v6 < 4)
      return off_2506E3E20[v6];
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    sub_2359103EC(p_configuration, v8, v9);

  return 0;
}

- (BOOL)runInitializerModel:(__CVBuffer *)a3
{
  int v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  ANSTBaseNetworkEspresso *memoryNetwork;
  uint64_t v12;
  const char *v13;
  const void **TensorByName;
  ANSTBaseNetworkEspresso *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const void **v20;
  ANSTBaseNetworkEspresso *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const void **v26;

  v4 = objc_msgSend_setInput_fromCVPixelBuffer_(self->_memoryNetwork, a2, kANSTVMTrackerNetworkInputTensorName, a3);
  if (v4)
  {
    v4 = objc_msgSend_setInput_fromCVPixelBuffer_(self->_memoryNetwork, v5, kANSTVMTrackerNetworkInputMaskTensorName, self->_initialMask);
    if (v4)
    {
      v4 = objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_memoryNetwork, v6, (uint64_t)self->_hiddenStateTensor, kANSTVMTrackerNetworkInputHiddenStateTensorName);
      if (v4)
      {
        v4 = objc_msgSend_runNetwork(self->_memoryNetwork, v7, v8);
        if (v4)
        {
          memoryNetwork = self->_memoryNetwork;
          v12 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v9, v10);
          TensorByName = (const void **)objc_msgSend_getTensorByName_(memoryNetwork, v13, v12);
          memcpy(self->_keyTensor->var0, *TensorByName, 4 * self->_keyTensor->var13);
          v15 = self->_memoryNetwork;
          v18 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v16, v17);
          v20 = (const void **)objc_msgSend_getTensorByName_(v15, v19, v18);
          memcpy(self->_valueTensor->var0, *v20, 4 * self->_valueTensor->var13);
          v21 = self->_memoryNetwork;
          v24 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v22, v23);
          v26 = (const void **)objc_msgSend_getTensorByName_(v21, v25, v24);
          memcpy(self->_hiddenStateTensor->var0, *v26, 4 * self->_hiddenStateTensor->var13);
          self->_firstFrame = 0;
          LOBYTE(v4) = 1;
        }
      }
    }
  }
  return v4;
}

- (BOOL)runInferenceModel:(__CVBuffer *)a3
{
  BOOL v3;
  NSObject *v6;
  os_signpost_id_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  ANSTBaseNetworkEspresso *maskNetwork;
  uint64_t v19;
  const char *v20;
  ANSTBaseNetworkEspresso *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  ANSTBaseNetworkEspresso *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  os_signpost_id_t v31;
  os_signpost_id_t v32;
  uint8_t *v33;
  uint8_t v35[16];
  __int16 v36;
  uint8_t v37[2];
  uint8_t buf[16];

  if (!self->_firstFrame)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2358CB000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ANSTVMTrackerEspresso_runInferenceModel", (const char *)&unk_235916999, buf, 2u);
    }

    if (objc_msgSend_setInput_fromCVPixelBuffer_(self->_maskNetwork, v8, kANSTVMTrackerNetworkInputTensorName, a3)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v9, (uint64_t)self->_outputMaskBuffer, kANSTVMTrackerNetworkInputMattingTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v10, (uint64_t)self->_probTensor, kANSTVMTrackerNetworkInputProbTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v11, (uint64_t)self->_keyTensor, kANSTVMTrackerNetworkInputKeyTensorName)
      && objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v12, (uint64_t)self->_valueTensor, kANSTVMTrackerNetworkInputValueTensorName)&& (objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_maskNetwork, v13, (uint64_t)self->_hiddenStateTensor, kANSTVMTrackerNetworkInputHiddenStateTensorName) & 1) != 0)
    {
      if ((objc_msgSend_runNetwork(self->_maskNetwork, v14, v15) & 1) != 0)
      {
        maskNetwork = self->_maskNetwork;
        v19 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v16, v17);
        self->_outputMaskBuffer = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(maskNetwork, v20, v19);
        v21 = self->_maskNetwork;
        v24 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v22, v23);
        self->_probTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v21, v25, v24);
        v26 = self->_maskNetwork;
        v29 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v27, v28);
        self->_hiddenStateTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v26, v30, v29);
        self->_firstFrame = 0;
        v31 = os_signpost_id_make_with_pointer(v6, self);

        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_2358CB000, v6, OS_SIGNPOST_INTERVAL_END, v31, "ANSTVMTrackerEspresso_runInferenceModel", (const char *)&unk_235916999, v35, 2u);
        }
        v3 = 1;
        goto LABEL_22;
      }
      v32 = os_signpost_id_make_with_pointer(v6, self);

      if (v32 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6))
      {
LABEL_21:
        v3 = 0;
LABEL_22:

        return v3;
      }
      v36 = 0;
      v33 = (uint8_t *)&v36;
    }
    else
    {
      v32 = os_signpost_id_make_with_pointer(v6, self);

      if (v32 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6))
        goto LABEL_21;
      *(_WORD *)v37 = 0;
      v33 = v37;
    }
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v6, OS_SIGNPOST_INTERVAL_END, v32, "ANSTVMTrackerEspresso_runInferenceModel", (const char *)&unk_235916999, v33, 2u);
    goto LABEL_21;
  }
  return 0;
}

- (BOOL)runUpdateModel:(__CVBuffer *)a3
{
  BOOL v3;
  NSObject *v6;
  os_signpost_id_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  ANSTBaseNetworkEspresso *updateNetwork;
  uint64_t v19;
  const char *v20;
  const void **TensorByName;
  ANSTBaseNetworkEspresso *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const void **v27;
  ANSTBaseNetworkEspresso *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const void **v33;
  ANSTBaseNetworkEspresso *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  ANSTBaseNetworkEspresso *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  $FD4688982923A924290ECB669CAF1EC2 *valueTensor;
  $FD4688982923A924290ECB669CAF1EC2 *keyTensor;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  size_t keyTensorSwapSpaceSize;
  char *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  size_t valueTensorSwapSpaceSize;
  char *v57;
  os_signpost_id_t v58;
  os_signpost_id_t v59;
  const char *v60;
  uint8_t *v61;
  __int16 v63[8];
  __int16 v64;
  uint8_t v65[2];
  uint8_t buf[16];

  if (!self->_firstFrame)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);

    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2358CB000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ANSTVMTrackerEspresso_runUpdateModel", (const char *)&unk_235916999, buf, 2u);
    }

    if (objc_msgSend_setInput_fromCVPixelBuffer_(self->_updateNetwork, v8, kANSTVMTrackerNetworkInputTensorName, a3)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v9, (uint64_t)self->_outputMaskBuffer, kANSTVMTrackerNetworkInputMattingTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v10, (uint64_t)self->_probTensor, kANSTVMTrackerNetworkInputProbTensorName)&& objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v11, (uint64_t)self->_keyTensor, kANSTVMTrackerNetworkInputKeyTensorName)
      && objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v12, (uint64_t)self->_valueTensor, kANSTVMTrackerNetworkInputValueTensorName)&& (objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(self->_updateNetwork, v13, (uint64_t)self->_hiddenStateTensor, kANSTVMTrackerNetworkInputHiddenStateTensorName) & 1) != 0)
    {
      if ((objc_msgSend_runNetwork(self->_updateNetwork, v14, v15) & 1) != 0)
      {
        updateNetwork = self->_updateNetwork;
        v19 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputHiddenTensorName, v16, v17);
        TensorByName = (const void **)objc_msgSend_getTensorByName_(updateNetwork, v20, v19);
        memcpy(self->_hiddenStateTensor->var0, *TensorByName, 4 * self->_hiddenStateTensor->var13);
        v22 = self->_updateNetwork;
        v25 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputMattingTensorName, v23, v24);
        v27 = (const void **)objc_msgSend_getTensorByName_(v22, v26, v25);
        memcpy(self->_outputMaskBuffer->var0, *v27, 4 * self->_outputMaskBuffer->var13);
        v28 = self->_updateNetwork;
        v31 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputTensorName, v29, v30);
        v33 = (const void **)objc_msgSend_getTensorByName_(v28, v32, v31);
        memcpy(self->_probTensor->var0, *v33, 4 * self->_probTensor->var13);
        v34 = self->_updateNetwork;
        v37 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputKeyTensorName, v35, v36);
        self->_keyTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v34, v38, v37);
        v39 = self->_updateNetwork;
        v42 = objc_msgSend_UTF8String((void *)kANSTVMTrackerNetworkOutputValueTensorName, v40, v41);
        valueTensor = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v39, v43, v42);
        self->_valueTensor = valueTensor;
        keyTensor = self->_keyTensor;
        if (keyTensor->var8)
        {
          v46 = 0;
          do
          {
            if (keyTensor->var7)
            {
              v47 = 0;
              do
              {
                v48 = (char *)keyTensor->var0 + 4 * keyTensor->var13 * v46 + 4 * keyTensor->var12 * v47;
                keyTensorSwapSpaceSize = self->_keyTensorSwapSpaceSize;
                v50 = &v48[keyTensorSwapSpaceSize];
                memcpy(self->_keyTensorSwapSpace, &v48[keyTensorSwapSpaceSize], keyTensorSwapSpaceSize);
                memcpy(v50, v48, self->_keyTensorSwapSpaceSize);
                memcpy(v48, self->_keyTensorSwapSpace, self->_keyTensorSwapSpaceSize);
                ++v47;
                keyTensor = self->_keyTensor;
              }
              while (v47 < keyTensor->var7);
            }
            ++v46;
          }
          while (v46 < keyTensor->var8);
          valueTensor = self->_valueTensor;
        }
        if (valueTensor->var8)
        {
          v51 = 0;
          do
          {
            if (valueTensor->var7)
            {
              v52 = 0;
              do
              {
                if (valueTensor->var6)
                {
                  v53 = 0;
                  do
                  {
                    if (valueTensor->var5)
                    {
                      v54 = 0;
                      do
                      {
                        v55 = (char *)valueTensor->var0
                            + 4 * valueTensor->var13 * v51
                            + 4 * valueTensor->var12 * v52
                            + 4 * valueTensor->var11 * v53
                            + 4 * valueTensor->var10 * v54;
                        valueTensorSwapSpaceSize = self->_valueTensorSwapSpaceSize;
                        v57 = &v55[valueTensorSwapSpaceSize];
                        memcpy(self->_valueTensorSwapSpace, &v55[valueTensorSwapSpaceSize], valueTensorSwapSpaceSize);
                        memcpy(v57, v55, self->_valueTensorSwapSpaceSize);
                        memcpy(v55, self->_valueTensorSwapSpace, self->_valueTensorSwapSpaceSize);
                        ++v54;
                        valueTensor = self->_valueTensor;
                      }
                      while (v54 < valueTensor->var5);
                    }
                    ++v53;
                  }
                  while (v53 < valueTensor->var6);
                }
                ++v52;
              }
              while (v52 < valueTensor->var7);
            }
            ++v51;
          }
          while (v51 < valueTensor->var8);
        }
        self->_firstFrame = 0;
        v58 = os_signpost_id_make_with_pointer(v6, self);

        if (v58 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v6))
        {
          v63[0] = 0;
          _os_signpost_emit_with_name_impl(&dword_2358CB000, v6, OS_SIGNPOST_INTERVAL_END, v58, "ANSTVMTrackerEspresso_runUpdateModel", (const char *)&unk_235916999, (uint8_t *)v63, 2u);
        }
        v3 = 1;
        goto LABEL_41;
      }
      v59 = os_signpost_id_make_with_pointer(v6, self);

      if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6))
      {
LABEL_40:
        v3 = 0;
LABEL_41:

        return v3;
      }
      v64 = 0;
      v60 = "ANSTVMTrackerEspresso_runUpdateModel";
      v61 = (uint8_t *)&v64;
    }
    else
    {
      v59 = os_signpost_id_make_with_pointer(v6, self);

      if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v6))
        goto LABEL_40;
      *(_WORD *)v65 = 0;
      v60 = "ANSTVMTrackerEspresso_runInferenceModel";
      v61 = v65;
    }
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v6, OS_SIGNPOST_INTERVAL_END, v59, v60, (const char *)&unk_235916999, v61, 2u);
    goto LABEL_40;
  }
  return 0;
}

- (BOOL)_setInitialMaskWithValue:(float)a3
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  float *BaseAddress;
  uint64_t i;
  uint64_t j;

  PixelFormatType = CVPixelBufferGetPixelFormatType(self->_initialMask);
  if (PixelFormatType == 1278226534)
  {
    CVPixelBufferLockBaseAddress(self->_initialMask, 0);
    Width = CVPixelBufferGetWidth(self->_initialMask);
    Height = CVPixelBufferGetHeight(self->_initialMask);
    BytesPerRow = CVPixelBufferGetBytesPerRow(self->_initialMask);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(self->_initialMask);
    if (Height)
    {
      for (i = 0; i != Height; ++i)
      {
        if (Width)
        {
          for (j = 0; j != Width; ++j)
            BaseAddress[j] = a3;
        }
        BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
      }
    }
    CVPixelBufferUnlockBaseAddress(self->_initialMask, 0);
  }
  return PixelFormatType == 1278226534;
}

- ($FD4688982923A924290ECB669CAF1EC2)getOutputMaskBuffer
{
  return self->_outputMaskBuffer;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_initialMask);
  self->_initialMask = 0;
  free(self->_keyTensorSwapSpace);
  self->_keyTensorSwapSpace = 0;
  free(self->_valueTensorSwapSpace);
  self->_valueTensorSwapSpace = 0;
  v3.receiver = self;
  v3.super_class = (Class)ANSTVMTrackerEspresso;
  -[ANSTVMTrackerEspresso dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_updateNetwork, 0);
  objc_storeStrong((id *)&self->_maskNetwork, 0);
  objc_storeStrong((id *)&self->_memoryNetwork, 0);
}

@end
