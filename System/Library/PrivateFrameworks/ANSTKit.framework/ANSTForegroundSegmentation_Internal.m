@implementation ANSTForegroundSegmentation_Internal

+ (BOOL)supportsVersion:(unint64_t)a3
{
  return a3 == 0x20000;
}

- (ANSTForegroundSegmentation_Internal)initWithConfiguration:(id)a3
{
  id v5;
  ANSTForegroundSegmentation_Internal *v6;
  ANSTForegroundSegmentation_Internal *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANSTForegroundSegmentation_Internal;
  v6 = -[ANSTForegroundSegmentation initWithConfiguration:](&v13, sel_initWithConfiguration_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_readyForInference = 0;
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2358CB000, v8, OS_LOG_TYPE_DEFAULT, "ANSTForegroundSegmentation (ViSegHQ) initialized with config %{public}@.", buf, 0xCu);

    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  if (self->_readyForInference)
    objc_msgSend_undoPrepareSideEffects(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)ANSTForegroundSegmentation_Internal;
  -[ANSTForegroundSegmentation_Internal dealloc](&v4, sel_dealloc);
}

- (unint64_t)version
{
  uint64_t v2;

  return objc_msgSend_version(self->_config, a2, v2);
}

- (void)undoPrepareSideEffects
{
  OpaqueVTPixelTransferSession *pixelTransferSession;
  ANSTVMTrackerEspresso *vmtrackerNetworkEspresso;

  CVPixelBufferRelease(self->_resizedInputBuffer);
  CVPixelBufferPoolRelease(self->_outputBufferPool);
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    CFRelease(self->_pixelTransferSession);
  }
  vmtrackerNetworkEspresso = self->_vmtrackerNetworkEspresso;
  self->_vmtrackerNetworkEspresso = 0;

  self->_readyForInference = 0;
}

- (BOOL)prepareWithError:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  const char *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  BOOL v10;
  void **p_config;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  os_signpost_id_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  ANSTVMTrackerEspresso *v30;
  const char *v31;
  ANSTVMTrackerEspresso *v32;
  ANSTVMTrackerEspresso *vmtrackerNetworkEspresso;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  __CVBuffer *PixelBuffer_width_height;
  OpaqueVTPixelTransferSession **p_pixelTransferSession;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  ANSTVMTrackerEspresso *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  __CVPixelBufferPool *v100;
  const char *v101;
  uint64_t v102;
  os_signpost_id_t v103;
  uint8_t v104[8];
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  const __CFString *v112;
  uint64_t v113;
  _QWORD v114[2];

  v114[1] = *MEMORY[0x24BDAC8D0];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v104 = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_235916999, v104, 2u);
  }

  if (self->_readyForInference)
  {
    v9 = os_signpost_id_make_with_pointer(v5, self);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v104 = 0;
      _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v9, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_235916999, v104, 2u);
    }
    v10 = 1;
    goto LABEL_53;
  }
  p_config = (void **)&self->_config;
  if (objc_msgSend_networkEngineType(self->_config, v7, v8))
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_23590E514(v5, v12, v13, v14, v15, v16, v17, v18);

    if (a3)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v113 = *MEMORY[0x24BDD0FC8];
      v114[0] = CFSTR("ANSTKit has deprecated non-ANE execution support. Please stop configuring ANSTForegroundSegmentation for executing on non-ANE platforms.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)v114, &v113, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_undoPrepareSideEffects(self, v19, v20);
    v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
      goto LABEL_52;
    *(_WORD *)v104 = 0;
LABEL_51:
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v24, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_235916999, v104, 2u);
LABEL_52:
    v10 = 0;
    goto LABEL_53;
  }
  v25 = (void *)objc_opt_class();
  v28 = objc_msgSend_version(*p_config, v26, v27);
  if ((objc_msgSend_supportsVersion_(v25, v29, v28) & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_23590E47C((void **)&self->_config, (char *)v5, v60);

    if (a3)
    {
      v63 = (void *)MEMORY[0x24BDD1540];
      v111 = *MEMORY[0x24BDD0FC8];
      v112 = CFSTR("Unsupported algorithm version");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v61, (uint64_t)&v112, &v111, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v63, v65, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v64);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_undoPrepareSideEffects(self, v61, v62);
    v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
      goto LABEL_52;
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  v30 = [ANSTVMTrackerEspresso alloc];
  v32 = (ANSTVMTrackerEspresso *)objc_msgSend_initWithConfiguration_(v30, v31, (uint64_t)*p_config);
  vmtrackerNetworkEspresso = self->_vmtrackerNetworkEspresso;
  self->_vmtrackerNetworkEspresso = v32;

  if (!self->_vmtrackerNetworkEspresso)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_23590E32C(v5, v66, v67, v68, v69, v70, v71, v72);

    v73 = self->_vmtrackerNetworkEspresso;
    self->_vmtrackerNetworkEspresso = 0;

    if (a3)
    {
      v76 = (void *)MEMORY[0x24BDD1540];
      v109 = *MEMORY[0x24BDD0FC8];
      v110 = CFSTR("Failed to prepare espresso network.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v74, (uint64_t)&v110, &v109, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v76, v78, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v77);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_undoPrepareSideEffects(self, v74, v75);
    v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
      goto LABEL_52;
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  v36 = objc_msgSend_networkInputBufferPixelFormat(self, v34, v35);
  v39 = objc_msgSend_networkInputBufferWidth(self, v37, v38);
  v42 = objc_msgSend_networkInputBufferHeight(self, v40, v41);
  PixelBuffer_width_height = (__CVBuffer *)objc_msgSend_createPixelBuffer_width_height_(self, v43, v36, v39, v42);
  self->_resizedInputBuffer = PixelBuffer_width_height;
  if (!PixelBuffer_width_height)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_23590E39C(v5, v79, v80, v81, v82, v83, v84, v85);

    if (a3)
    {
      v88 = (void *)MEMORY[0x24BDD1540];
      v107 = *MEMORY[0x24BDD0FC8];
      v108 = CFSTR("Failed to prepare resized input buffer.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v86, (uint64_t)&v108, &v107, 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v88, v90, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v89);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_undoPrepareSideEffects(self, v86, v87);
    v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
      goto LABEL_52;
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  p_pixelTransferSession = &self->_pixelTransferSession;
  if (VTPixelTransferSessionCreate(0, &self->_pixelTransferSession)
    || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9680], (CFTypeRef)*MEMORY[0x24BDF98F0])
    || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9678], (CFTypeRef)*MEMORY[0x24BDBD270]))
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_23590E40C(v5, v48, v49, v50, v51, v52, v53, v54);

    if (a3)
    {
      v57 = (void *)MEMORY[0x24BDD1540];
      v105 = *MEMORY[0x24BDD0FC8];
      v106 = CFSTR("Failed to prepare VTPixelTransferSession.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v55, (uint64_t)&v106, &v105, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v57, v59, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v58);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_undoPrepareSideEffects(self, v55, v56);
    v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
      goto LABEL_52;
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  v92 = objc_msgSend_outputBufferWidth(self, v46, v47);
  v95 = objc_msgSend_outputBufferHeight(self, v93, v94);
  v98 = objc_msgSend_outputBufferPixelFormat(self, v96, v97);
  v100 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v99, 2, v92, v95, v98);
  self->_outputBufferPool = v100;
  if (!v100)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v101, (uint64_t)CFSTR("ANSTErrorDomain"), 3, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_undoPrepareSideEffects(self, v101, v102);
    v24 = os_signpost_id_make_with_pointer(v5, self);

    if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
      goto LABEL_52;
    *(_WORD *)v104 = 0;
    goto LABEL_51;
  }
  self->_frameCount = 0;
  v10 = 1;
  self->_readyForInference = 1;
  v103 = os_signpost_id_make_with_pointer(v5, self);

  if (v103 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v104 = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v103, "ANSTForegroundSegmentation_prepareWithError", (const char *)&unk_235916999, v104, 2u);
  }
LABEL_53:

  return v10;
}

- (unint64_t)networkInputBufferWidth
{
  uint64_t v2;
  void **p_config;
  unint64_t v4;
  char *v6;
  uint64_t v7;

  p_config = (void **)&self->_config;
  v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (v4 < 4)
    return qword_235914C58[v4];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    sub_23590E584(p_config, v6, v7);

  return 512;
}

- (unint64_t)networkInputBufferHeight
{
  uint64_t v2;
  void **p_config;
  unint64_t v4;
  char *v6;
  uint64_t v7;

  p_config = (void **)&self->_config;
  v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (v4 < 4)
    return qword_235914C78[v4];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    sub_23590E5F8(p_config, v6, v7);

  return 384;
}

- (unsigned)networkInputBufferPixelFormat
{
  return 1111970369;
}

- (unsigned)outputBufferPixelFormat
{
  return 1278226534;
}

- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer error:(id *)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  size_t Width;
  const char *v10;
  uint64_t v11;
  size_t Height;
  const char *v13;
  uint64_t v14;
  OSType PixelFormatType;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  void *v51;
  const char *v52;
  unint64_t frameCount;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t OutputMaskBuffer;
  const char *v68;
  __CVBuffer *CVPixelBuffer_Float32_fromEspressoBufferFloat32;
  ANSTForegroundSegmentationResult *v70;
  const char *v71;
  void *v72;
  os_signpost_id_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  void *v83;
  const char *v84;
  uint8_t v86[8];
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  const __CFString *v90;
  uint64_t v91;
  const __CFString *v92;
  uint64_t v93;
  const __CFString *v94;
  uint64_t v95;
  _QWORD v96[2];

  v96[1] = *MEMORY[0x24BDAC8D0];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v86 = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ANSTForegroundSegmentation_resultForPixelBuffer", (const char *)&unk_235916999, v86, 2u);
  }

  if (!self->_readyForInference)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_23590E66C(v7, v31, v32, v33, v34, v35, v36, v37);

    if (a4)
    {
      v39 = (void *)MEMORY[0x24BDD1540];
      v95 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v96, &v95, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v39, v41, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v40);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v30 = os_signpost_id_make_with_pointer(v7, self);

    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
      goto LABEL_55;
    *(_WORD *)v86 = 0;
    goto LABEL_54;
  }
  if (!resizedInputBuffer)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_23590E6DC(v7, v42, v43, v44, v45, v46, v47, v48);

    if (a4)
    {
      v50 = (void *)MEMORY[0x24BDD1540];
      v93 = *MEMORY[0x24BDD0FC8];
      v94 = CFSTR("Nil input buffer.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v49, (uint64_t)&v94, &v93, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v51);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v30 = os_signpost_id_make_with_pointer(v7, self);

    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
      goto LABEL_55;
    *(_WORD *)v86 = 0;
    goto LABEL_54;
  }
  Width = CVPixelBufferGetWidth(resizedInputBuffer);
  if (Width != objc_msgSend_networkInputBufferWidth(self, v10, v11)
    || (Height = CVPixelBufferGetHeight(resizedInputBuffer),
        Height != objc_msgSend_networkInputBufferHeight(self, v13, v14))
    || (PixelFormatType = CVPixelBufferGetPixelFormatType(resizedInputBuffer),
        PixelFormatType != objc_msgSend_networkInputBufferPixelFormat(self, v16, v17)))
  {
    if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, resizedInputBuffer, self->_resizedInputBuffer))
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_23590E82C(v7, v19, v20, v21, v22, v23, v24, v25);

      if (a4)
      {
        v27 = (void *)MEMORY[0x24BDD1540];
        v91 = *MEMORY[0x24BDD0FC8];
        v92 = CFSTR("Failed to transfer input pixel buffer.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)&v92, &v91, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v27, v29, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v28);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v30 = os_signpost_id_make_with_pointer(v7, self);

      if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
        goto LABEL_55;
      *(_WORD *)v86 = 0;
LABEL_54:
      _os_signpost_emit_with_name_impl(&dword_2358CB000, v7, OS_SIGNPOST_INTERVAL_END, v30, "ANSTForegroundSegmentation_resultForPixelBuffer", (const char *)&unk_235916999, v86, 2u);
LABEL_55:
      v72 = 0;
      goto LABEL_56;
    }
    resizedInputBuffer = self->_resizedInputBuffer;
  }
  frameCount = self->_frameCount;
  self->_frameCount = frameCount + 1;
  if (!frameCount)
  {
    if ((objc_msgSend_runInitializerModel_(self->_vmtrackerNetworkEspresso, v18, (uint64_t)resizedInputBuffer) & 1) == 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_23590E7BC(v7, v74, v75, v76, v77, v78, v79, v80);

      if (a4)
      {
        v82 = (void *)MEMORY[0x24BDD1540];
        v89 = *MEMORY[0x24BDD0FC8];
        v90 = CFSTR("Failed to run initializer network.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v81, (uint64_t)&v90, &v89, 1);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v82, v84, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v83);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v30 = os_signpost_id_make_with_pointer(v7, self);

      if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
        goto LABEL_55;
      *(_WORD *)v86 = 0;
      goto LABEL_54;
    }
LABEL_43:
    if ((objc_msgSend_runInferenceModel_(self->_vmtrackerNetworkEspresso, v18, (uint64_t)resizedInputBuffer) & 1) == 0)
      goto LABEL_35;
    goto LABEL_44;
  }
  if (0xCCCCCCCCCCCCCCCDLL * (frameCount + 1) > 0x3333333333333333)
    goto LABEL_43;
  if ((objc_msgSend_runUpdateModel_(self->_vmtrackerNetworkEspresso, v18, (uint64_t)resizedInputBuffer) & 1) == 0)
  {
LABEL_35:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_23590E74C(v7, v56, v57, v58, v59, v60, v61, v62);

    if (a4)
    {
      v64 = (void *)MEMORY[0x24BDD1540];
      v87 = *MEMORY[0x24BDD0FC8];
      v88 = CFSTR("Failed to run vmtracker network.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v63, (uint64_t)&v88, &v87, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v64, v66, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v65);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v30 = os_signpost_id_make_with_pointer(v7, self);

    if (v30 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
      goto LABEL_55;
    *(_WORD *)v86 = 0;
    goto LABEL_54;
  }
LABEL_44:
  OutputMaskBuffer = objc_msgSend_getOutputMaskBuffer(self->_vmtrackerNetworkEspresso, v54, v55);
  CVPixelBuffer_Float32_fromEspressoBufferFloat32 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Float32_fromEspressoBufferFloat32_(self, v68, OutputMaskBuffer);
  v70 = [ANSTForegroundSegmentationResult alloc];
  v72 = (void *)objc_msgSend_initWithMask_(v70, v71, (uint64_t)CVPixelBuffer_Float32_fromEspressoBufferFloat32);
  CVPixelBufferRelease(CVPixelBuffer_Float32_fromEspressoBufferFloat32);
  v73 = os_signpost_id_make_with_pointer(v7, self);

  if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v86 = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v7, OS_SIGNPOST_INTERVAL_END, v73, "ANSTForegroundSegmentation_resultForPixelBuffer", (const char *)&unk_235916999, v86, 2u);
  }
LABEL_56:

  return v72;
}

- (__CVBuffer)_createCVPixelBuffer_Float32_fromEspressoBufferFloat32:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t var5;
  unint64_t v14;
  size_t BytesPerRow;
  char *var0;
  char *BaseAddress;
  char *v18;
  size_t v19;
  CVPixelBufferRef pixelBufferOut;

  if (a3->var6 != 1)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_23590E974(v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_10;
  }
  if (a3->var14 != 65568)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_23590E908();
    goto LABEL_10;
  }
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputBufferPool, &pixelBufferOut))
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_23590E89C();
LABEL_10:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  var5 = a3->var5;
  v14 = 4 * a3->var4;
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  var0 = (char *)a3->var0;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  v18 = BaseAddress;
  if (v14 == BytesPerRow)
  {
    memcpy(BaseAddress, var0, var5 * v14);
  }
  else if (var5)
  {
    if (v14 >= BytesPerRow)
      v19 = BytesPerRow;
    else
      v19 = v14;
    do
    {
      memcpy(v18, var0, v19);
      v18 += BytesPerRow;
      var0 += v14;
      --var5;
    }
    while (var5);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vmtrackerNetworkEspresso, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
