@implementation ANSTISPAlgorithmV1

+ (unint64_t)_version
{
  return 0x10000;
}

- (ANSTISPAlgorithmV1)initWithConfiguration:(id)a3
{
  id v5;
  ANSTISPAlgorithmV1 *v6;
  ANSTISPAlgorithmV1 *v7;
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
  v13.super_class = (Class)ANSTISPAlgorithmV1;
  v6 = -[ANSTISPAlgorithm initWithConfiguration:](&v13, sel_initWithConfiguration_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_readyForInference = 0;
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v7->_config, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2358CB000, v8, OS_LOG_TYPE_DEFAULT, "ANSTISPAlgorithmV1 (ANST v2.4 model + v2.5 post-processing) initialized with config %{public}@.", buf, 0xCu);

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
  v4.super_class = (Class)ANSTISPAlgorithmV1;
  -[ANSTISPAlgorithmV1 dealloc](&v4, sel_dealloc);
}

- (void)undoPrepareSideEffects
{
  AcANSTContext *det;
  NSObject *v4;
  NSObject *v5;
  OpaqueVTPixelTransferSession *pixelTransferSession;
  ANSTBaseNetworkEspresso *network;

  det = self->_det;
  if (det)
  {
    if (AcANSTStop(det))
    {
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_2359104D8();

    }
    if (AcANSTDestroy((uint64_t)self->_det))
    {
      _ANSTLoggingGetOSLogForCategoryANSTKit();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_23591046C();

    }
    self->_det = 0;
  }
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    CFRelease(self->_pixelTransferSession);
    self->_pixelTransferSession = 0;
  }
  CVPixelBufferRelease(self->_resizedInputBuffer);
  self->_resizedInputBuffer = 0;
  CVPixelBufferPoolRelease(self->_outputSemanticBufferPool);
  self->_outputSemanticBufferPool = 0;
  CVPixelBufferPoolRelease(self->_outputSaliencyBufferPool);
  self->_outputSaliencyBufferPool = 0;
  network = self->_network;
  self->_network = 0;

  self->_readyForInference = 0;
}

- (BOOL)prepareWithError:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  BOOL v8;
  uint64_t **p_det;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  os_signpost_id_t v18;
  NSMutableArray *v20;
  NSMutableArray *networkOutputNames;
  const char *v22;
  uint64_t i;
  NSMutableArray *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  os_signpost_id_t v40;
  const char *v41;
  ANSTBaseNetworkEspresso *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  ANSTBaseNetworkEspresso *v52;
  ANSTBaseNetworkEspresso *network;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  ANSTBaseNetworkEspresso *v58;
  uint64_t v59;
  const char *v60;
  double v61;
  uint64_t v62;
  ANSTBaseNetworkEspresso *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  double v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  __CVBuffer *PixelBuffer_width_height;
  OpaqueVTPixelTransferSession **p_pixelTransferSession;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  const char *v121;
  const char *v122;
  __CVPixelBufferPool *v123;
  os_signpost_id_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  const char *v136;
  char v137;
  uint8_t buf[8];
  uint64_t v139;
  const __CFString *v140;
  uint64_t v141;
  const __CFString *v142;
  uint64_t v143;
  const __CFString *v144;
  uint64_t v145;
  const __CFString *v146;
  uint64_t v147;
  const __CFString *v148;
  uint64_t v149;
  const __CFString *v150;
  uint64_t v151;
  _QWORD v152[2];

  v152[1] = *MEMORY[0x24BDAC8D0];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_235916999, buf, 2u);
  }

  if (!self->_readyForInference)
  {
    v137 = 0;
    p_det = (uint64_t **)&self->_det;
    v10 = AcANSTCreate((AcDetNode ***)&self->_det, (uint64_t)&v137, (uint64_t)&self->_detState);
    if ((_DWORD)v10
      || (v10 = AcANSTStart(*p_det, (uint64_t)&self->_detState), (_DWORD)v10)
      || (v10 = AcANSTGetParams(*p_det, self->_detState.data, (uint64_t)&self->_detParams), (_DWORD)v10)
      || (v10 = AcANSTUseLowThresholds(*p_det), (_DWORD)v10)
      || (v10 = AcANSTSetRunSaliency(*p_det, 1), (_DWORD)v10)
      || (v10 = AcANSTSetRunSaliencyObjectDetection(*p_det, 1), (_DWORD)v10)
      || (v10 = AcANSTSetRunViSeg(*p_det, 1), (_DWORD)v10))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("Failed to setup ANST network config (AcReturn code %d)"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_2359107F8();

      if (a3)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v151 = *MEMORY[0x24BDD0FC8];
        v152[0] = v12;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v152, &v151, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v15, v17, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v16);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_undoPrepareSideEffects(self, v13, v14);
      v18 = os_signpost_id_make_with_pointer(v5, self);

      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v18, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_235916999, buf, 2u);
      }

      v8 = 0;
      goto LABEL_24;
    }
    objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v11, 25);
    v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    networkOutputNames = self->_networkOutputNames;
    self->_networkOutputNames = v20;

    for (i = 0; i != 25; ++i)
    {
      v24 = self->_networkOutputNames;
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v22, (uint64_t)self->_detParams.netOutputNames[i]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v24, v26, (uint64_t)v25);

    }
    if (objc_msgSend_networkEngineType(self->_config, v22, v27))
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_235910788(v5, v28, v29, v30, v31, v32, v33, v34);

      if (a3)
      {
        v37 = (void *)MEMORY[0x24BDD1540];
        v149 = *MEMORY[0x24BDD0FC8];
        v150 = CFSTR("ANSTKit has deprecated non-ANE execution support. Please stop configuring ANSTISPAlgorithm for executing on non-ANE platforms.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)&v150, &v149, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v37, v39, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v38);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_undoPrepareSideEffects(self, v35, v36);
      v40 = os_signpost_id_make_with_pointer(v5, self);

      if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
        goto LABEL_68;
      *(_WORD *)buf = 0;
      v41 = "ANSTISPAlgorithm_prepareWithError";
    }
    else
    {
      v42 = [ANSTBaseNetworkEspresso alloc];
      v45 = objc_msgSend_networkEngineType(self->_config, v43, v44);
      v48 = objc_msgSend_qualityOfService(self->_config, v46, v47);
      if (objc_msgSend_networkResolution(self->_config, v49, v50) == 1)
        v52 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkResolution_(v42, v51, v45, v48, CFSTR("anst"), CFSTR("resolution1024x576"));
      else
        v52 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_networkResolution_(v42, v51, v45, v48, CFSTR("anst"), CFSTR("resolution512x384"));
      network = self->_network;
      self->_network = v52;

      if ((objc_msgSend_prepare(self->_network, v54, v55) & 1) != 0)
      {
        v58 = self->_network;
        v59 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v56, v57);
        objc_msgSend_getResolutionByBlobName_(v58, v60, v59);
        v62 = v61;
        v63 = self->_network;
        v66 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v64, v65);
        objc_msgSend_getResolutionByBlobName_(v63, v67, v66);
        v69 = v68;
        if (objc_msgSend_networkInputBufferWidth(self, v70, v71) == v62
          && objc_msgSend_networkInputBufferHeight(self, v72, v73) == v69)
        {
          v76 = objc_msgSend_networkInputBufferPixelFormat(self, v74, v75);
          PixelBuffer_width_height = (__CVBuffer *)objc_msgSend_createPixelBuffer_width_height_(self, v77, v76, v62, v69);
          self->_resizedInputBuffer = PixelBuffer_width_height;
          if (PixelBuffer_width_height)
          {
            p_pixelTransferSession = &self->_pixelTransferSession;
            if (VTPixelTransferSessionCreate(0, &self->_pixelTransferSession)
              || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9680], (CFTypeRef)*MEMORY[0x24BDF98F0])|| VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9678], (CFTypeRef)*MEMORY[0x24BDBD270]))
            {
              if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
                sub_235910624(v5, v81, v82, v83, v84, v85, v86, v87);

              if (a3)
              {
                v90 = (void *)MEMORY[0x24BDD1540];
                v141 = *MEMORY[0x24BDD0FC8];
                v142 = CFSTR("Failed to prepare VTPixelTransferSession.");
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v88, (uint64_t)&v142, &v141, 1);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_userInfo_(v90, v92, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v91);
                *a3 = (id)objc_claimAutoreleasedReturnValue();

              }
              objc_msgSend_undoPrepareSideEffects(self, v88, v89);
              v40 = os_signpost_id_make_with_pointer(v5, self);

              if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
                goto LABEL_68;
              *(_WORD *)buf = 0;
              v41 = "ANSTISPAlgorithmV1_prepareWithError";
            }
            else
            {
              self->_outputSemanticBufferPool = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v80, 5, v62 >> 1, v69 >> 1, 1278226488);
              v123 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v122, 1, 64, 48, 1278226488);
              self->_outputSaliencyBufferPool = v123;
              if (self->_outputSemanticBufferPool && v123)
              {
                v8 = 1;
                self->_readyForInference = 1;
                v124 = os_signpost_id_make_with_pointer(v5, self);

                if (v124 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v124, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_235916999, buf, 2u);
                }
                goto LABEL_69;
              }
              if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
                sub_2359105B4(v5, v125, v126, v127, v128, v129, v130, v131);

              if (a3)
              {
                v134 = (void *)MEMORY[0x24BDD1540];
                v139 = *MEMORY[0x24BDD0FC8];
                v140 = CFSTR("Failed to prepare output pixel buffer pool.");
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v132, (uint64_t)&v140, &v139, 1);
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_userInfo_(v134, v136, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v135);
                *a3 = (id)objc_claimAutoreleasedReturnValue();

              }
              objc_msgSend_undoPrepareSideEffects(self, v132, v133);
              v40 = os_signpost_id_make_with_pointer(v5, self);

              if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
              {
LABEL_68:
                v8 = 0;
LABEL_69:
                v12 = v5;
LABEL_24:

                return v8;
              }
              *(_WORD *)buf = 0;
              v41 = "ANSTISPAlgorithmV1_prepareWithError";
            }
          }
          else
          {
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              sub_235910544(v5, v110, v111, v112, v113, v114, v115, v116);

            if (a3)
            {
              v119 = (void *)MEMORY[0x24BDD1540];
              v143 = *MEMORY[0x24BDD0FC8];
              v144 = CFSTR("Failed to prepare resized input buffer.");
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v117, (uint64_t)&v144, &v143, 1);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v119, v121, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v120);
              *a3 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend_undoPrepareSideEffects(self, v117, v118);
            v40 = os_signpost_id_make_with_pointer(v5, self);

            if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
              goto LABEL_68;
            *(_WORD *)buf = 0;
            v41 = "ANSTISPAlgorithmV1_prepareWithError";
          }
        }
        else
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            sub_235910694();

          if (a3)
          {
            v107 = (void *)MEMORY[0x24BDD1540];
            v145 = *MEMORY[0x24BDD0FC8];
            v146 = CFSTR("Prepared espresso network returned unexpected input width or height.");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v105, (uint64_t)&v146, &v145, 1);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v107, v109, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v108);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend_undoPrepareSideEffects(self, v105, v106);
          v40 = os_signpost_id_make_with_pointer(v5, self);

          if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
            goto LABEL_68;
          *(_WORD *)buf = 0;
          v41 = "ANSTISPAlgorithmV1_prepareWithError";
        }
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          sub_235910718(v5, v93, v94, v95, v96, v97, v98, v99);

        if (a3)
        {
          v102 = (void *)MEMORY[0x24BDD1540];
          v147 = *MEMORY[0x24BDD0FC8];
          v148 = CFSTR("Failed to prepare espresso network.");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v100, (uint64_t)&v148, &v147, 1);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v102, v104, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v103);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend_undoPrepareSideEffects(self, v100, v101);
        v40 = os_signpost_id_make_with_pointer(v5, self);

        if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
          goto LABEL_68;
        *(_WORD *)buf = 0;
        v41 = "ANSTISPAlgorithmV1_prepareWithError";
      }
    }
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v40, v41, (const char *)&unk_235916999, buf, 2u);
    goto LABEL_68;
  }
  v7 = os_signpost_id_make_with_pointer(v5, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v7, "ANSTISPAlgorithmV1_prepareWithError", (const char *)&unk_235916999, buf, 2u);
  }

  return 1;
}

- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer orientation:(int64_t)a4 error:(id *)a5
{
  NSObject *v9;
  os_signpost_id_t v10;
  const char *v11;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  os_signpost_id_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  void *v41;
  const char *v42;
  OSType v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  void *v59;
  const char *v60;
  ANSTBaseNetworkEspresso *network;
  uint64_t v62;
  const char *v63;
  double v64;
  ANSTBaseNetworkEspresso *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  double v70;
  const char *v71;
  const char *v72;
  ANSTBaseNetworkEspresso *v73;
  id v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t TensorByName;
  const char *v80;
  const char *v81;
  uint64_t v82;
  ANSTBaseNetworkEspresso *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  void *v94;
  void *v95;
  void *v96;
  const char *v97;
  os_signpost_id_t v98;
  void *v99;
  void *v100;
  const char *v101;
  uint8_t v103[8];
  uint64_t v104;
  const __CFString *v105;
  uint64_t v106;
  const __CFString *v107;
  uint64_t v108;
  const __CFString *v109;
  uint64_t v110;
  const __CFString *v111;
  uint64_t v112;
  const __CFString *v113;
  uint64_t v114;
  _QWORD v115[2];

  v115[1] = *MEMORY[0x24BDAC8D0];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v103 = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ANSTISPAlgorithmV1_resultForPixelBuffer", (const char *)&unk_235916999, v103, 2u);
  }

  if (!self->_readyForInference)
  {
    if (a5)
    {
      v29 = (void *)MEMORY[0x24BDD1540];
      v114 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v115, &v114, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v29, v31, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v30);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_55;
    *(_WORD *)v103 = 0;
    goto LABEL_54;
  }
  if (!resizedInputBuffer)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_235910878(v9, v32, v33, v34, v35, v36, v37, v38);

    if (a5)
    {
      v40 = (void *)MEMORY[0x24BDD1540];
      v112 = *MEMORY[0x24BDD0FC8];
      v113 = CFSTR("Nil input buffer.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v39, (uint64_t)&v113, &v112, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v40, v42, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v41);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_55;
    *(_WORD *)v103 = 0;
    goto LABEL_54;
  }
  Width = CVPixelBufferGetWidth(resizedInputBuffer);
  Height = CVPixelBufferGetHeight(resizedInputBuffer);
  PixelFormatType = CVPixelBufferGetPixelFormatType(resizedInputBuffer);
  if (Width < Height)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_2359108E8(v9, v17, v18, v19, v20, v21, v22, v23);

    if (a5)
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      v110 = *MEMORY[0x24BDD0FC8];
      v111 = CFSTR("Input pixel buffer width < height. ANSTISPAlgorithmV1 only supports landscape input.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)&v111, &v110, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v26);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_55;
    *(_WORD *)v103 = 0;
LABEL_54:
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v9, OS_SIGNPOST_INTERVAL_END, v28, "ANSTISPAlgorithmV1_resultForPixelBuffer", (const char *)&unk_235916999, v103, 2u);
LABEL_55:
    v94 = 0;
    goto LABEL_56;
  }
  v43 = PixelFormatType;
  if (Width != objc_msgSend_networkInputBufferWidth(self, v15, v16)
    || Height != objc_msgSend_networkInputBufferHeight(self, v44, v45)
    || v43 != objc_msgSend_networkInputBufferPixelFormat(self, v46, v47))
  {
    if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, resizedInputBuffer, self->_resizedInputBuffer))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_235910958(v9, v50, v51, v52, v53, v54, v55, v56);

      if (a5)
      {
        v58 = (void *)MEMORY[0x24BDD1540];
        v108 = *MEMORY[0x24BDD0FC8];
        v109 = CFSTR("Failed to transfer input pixel buffer.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v57, (uint64_t)&v109, &v108, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v58, v60, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v59);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v28 = os_signpost_id_make_with_pointer(v9, self);

      if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
        goto LABEL_55;
      *(_WORD *)v103 = 0;
      goto LABEL_54;
    }
    resizedInputBuffer = self->_resizedInputBuffer;
  }
  self->_detControl.originalImageWidth = Width;
  self->_detControl.originalImageHeight = Height;
  network = self->_network;
  v62 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v48, v49);
  objc_msgSend_getResolutionByBlobName_(network, v63, v62);
  self->_detControl.networkInputWidth = v64;
  v65 = self->_network;
  v68 = objc_msgSend_UTF8String((void *)kANSTNetworkInputName, v66, v67);
  objc_msgSend_getResolutionByBlobName_(v65, v69, v68);
  self->_detControl.networkInputHeight = v70;
  self->_detControl.imageOrientation = AcImageOrientationFromANSTImageOrientation(a4);
  if (!objc_msgSend_setInput_fromCVPixelBuffer_(self->_network, v71, kANSTNetworkInputName, resizedInputBuffer))goto LABEL_49;
  v73 = self->_network;
  objc_msgSend_objectAtIndexedSubscript_(self->_networkOutputNames, v72, 17);
  v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v77 = objc_msgSend_UTF8String(v74, v75, v76);
  TensorByName = objc_msgSend_getTensorByName_(v73, v78, v77);
  if (!objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(v73, v80, TensorByName, kANSTNetworkInputLastMaskName)|| (v83 = self->_network, v84 = objc_msgSend_UTF8String((void *)kANSTNetworkOutputExtraSalientMaskName, v81, v82), v86 = objc_msgSend_getTensorByName_(v83, v85, v84), (objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(v83, v87, v86, kANSTNetworkInputSalientMaskName) & 1) == 0))
  {

    goto LABEL_49;
  }
  v90 = objc_msgSend_runNetwork(self->_network, v88, v89);

  if ((v90 & 1) == 0)
  {
LABEL_49:
    if (a5)
    {
      v99 = (void *)MEMORY[0x24BDD1540];
      v106 = *MEMORY[0x24BDD0FC8];
      v107 = CFSTR("Failed to execute espresso inference.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v72, (uint64_t)&v107, &v106, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v99, v101, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v100);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = os_signpost_id_make_with_pointer(v9, self);

    if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_55;
    *(_WORD *)v103 = 0;
    goto LABEL_54;
  }
  objc_msgSend__networkResult(self, v72, v91);
  v92 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)v92;
  if (a5 && !v92)
  {
    v95 = (void *)MEMORY[0x24BDD1540];
    v104 = *MEMORY[0x24BDD0FC8];
    v105 = CFSTR("Failed to create inference result.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v93, (uint64_t)&v105, &v104, 1);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v95, v97, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v96);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v98 = os_signpost_id_make_with_pointer(v9, self);

  if (v98 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v103 = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v9, OS_SIGNPOST_INTERVAL_END, v98, "ANSTISPAlgorithmV1_resultForPixelBuffer", (const char *)&unk_235916999, v103, 2u);
  }
LABEL_56:

  return v94;
}

- (id)_networkResult
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const char *v14;
  uint64_t v15;
  int *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t TensorByName;
  int v24;
  int v25;
  int v26;
  int v27;
  os_signpost_id_t v28;
  const char *v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  __CVBuffer *CVPixelBuffer_Uint8_fromEspressoBufferFloat32;
  void *v40;
  const char *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  __CVBuffer *v49;
  void *v50;
  const char *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  __CVBuffer *v59;
  void *v60;
  const char *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  __CVBuffer *v69;
  void *v70;
  const char *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  __CVBuffer *v79;
  ANSTISPAlgorithmResult *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  uint8_t v86[8];
  uint64_t v87[3];
  uint64_t v88;
  int v89;
  uint8_t buf[12];
  int v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE v94[21032];
  uint64_t v95;

  v2 = MEMORY[0x24BDAC7A8](self, a2);
  v95 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v2 + 204904) = 0;
  *(float32x2_t *)(v2 + 204912) = vcvt_f32_u32(*(uint32x2_t *)(v2 + 204880));
  v5 = objc_msgSend_runningFrameRate(*(void **)(v2 + 32), v3, v4);
  if (!v5)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if (v5 != 1)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_235910A34();

    goto LABEL_7;
  }
  v6 = 1;
LABEL_8:
  *(_BYTE *)(v2 + 204901) = v6;
  bzero(v94, 0x5228uLL);
  if (!objc_msgSend_enableObjectTracking(*(void **)(v2 + 32), v8, v9))
    goto LABEL_30;
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, (const void *)v2);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ANSTISPAlgorithmV1_RTCVPostProcess", (const char *)&unk_235916999, buf, 2u);
  }

  v15 = 0;
  v16 = &v91;
  do
  {
    v17 = *(void **)(v2 + 40);
    objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v14, v15);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend_UTF8String(v18, v19, v20);
    TensorByName = objc_msgSend_getTensorByName_(v17, v22, v21);

    v24 = *(_DWORD *)(TensorByName + 96) * *(_DWORD *)(TensorByName + 88);
    v25 = *(_DWORD *)(TensorByName + 80);
    *(_QWORD *)(v16 - 3) = *(_QWORD *)TensorByName;
    *(v16 - 1) = v24;
    *v16 = v25;
    v16[1] = 4 * v25;
    v16[2] = 6;
    ++v15;
    v16 += 6;
  }
  while (v15 != 25);
  v89 = 1;
  v88 = 0x700000011;
  v87[0] = (uint64_t)buf;
  v87[1] = (uint64_t)&v92;
  v87[2] = (uint64_t)&v93;
  AcANSTPostProcessMultiNetOutputs(*(_QWORD **)(v2 + 56), (uint32x2_t *)(v2 + 204880), v2 + 64, v87, (unsigned int *)&v88, 0, (_DWORD *)(v2 + 2464), (uint64_t)v94);
  v27 = v26;
  v28 = os_signpost_id_make_with_pointer(v12, (const void *)v2);

  if (v28 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v12))
  {
    *(_WORD *)v86 = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v12, OS_SIGNPOST_INTERVAL_END, v28, "ANSTISPAlgorithmV1_RTCVPostProcess", (const char *)&unk_235916999, v86, 2u);
  }

  if (v27)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_2359109C8();

    return 0;
  }
  else
  {
LABEL_30:
    if (objc_msgSend_enableSegmentation(*(void **)(v2 + 32), v10, v11))
    {
      v31 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v30, 18);
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v35 = objc_msgSend_UTF8String(v32, v33, v34);
      v37 = objc_msgSend_getTensorByName_(v31, v36, v35);

      CVPixelBuffer_Uint8_fromEspressoBufferFloat32 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v38, v37);
      v40 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v41, 19);
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v45 = objc_msgSend_UTF8String(v42, v43, v44);
      v47 = objc_msgSend_getTensorByName_(v40, v46, v45);

      v49 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v48, v47);
      v50 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v51, 20);
      v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v55 = objc_msgSend_UTF8String(v52, v53, v54);
      v57 = objc_msgSend_getTensorByName_(v50, v56, v55);

      v59 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v58, v57);
      v60 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v61, 21);
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v65 = objc_msgSend_UTF8String(v62, v63, v64);
      v67 = objc_msgSend_getTensorByName_(v60, v66, v65);

      v69 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v68, v67);
      v70 = *(void **)(v2 + 40);
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(v2 + 48), v71, 22);
      v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v75 = objc_msgSend_UTF8String(v72, v73, v74);
      v77 = objc_msgSend_getTensorByName_(v70, v76, v75);

      v79 = (__CVBuffer *)objc_msgSend__createCVPixelBuffer_Uint8_fromEspressoBufferFloat32_((void *)v2, v78, v77);
    }
    else
    {
      CVPixelBuffer_Uint8_fromEspressoBufferFloat32 = 0;
      v49 = 0;
      v59 = 0;
      v69 = 0;
      v79 = 0;
    }
    v80 = [ANSTISPAlgorithmResult alloc];
    if (objc_msgSend_enableObjectTracking(*(void **)(v2 + 32), v81, v82))
      v84 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v80, v83, (uint64_t)v94, CVPixelBuffer_Uint8_fromEspressoBufferFloat32, v49, v59, v69, v79, 0);
    else
      v84 = objc_msgSend_initWithAcResult_personMask_salientPersonMask_skinMask_hairMask_skyMask_saliencyMask_(v80, v83, 0, CVPixelBuffer_Uint8_fromEspressoBufferFloat32, v49, v59, v69, v79, 0);
    v85 = (void *)v84;
    CVPixelBufferRelease(CVPixelBuffer_Uint8_fromEspressoBufferFloat32);
    CVPixelBufferRelease(v49);
    CVPixelBufferRelease(v59);
    CVPixelBufferRelease(v69);
    CVPixelBufferRelease(v79);
    CVPixelBufferRelease(0);
    return v85;
  }
}

- (unint64_t)networkInputBufferWidth
{
  uint64_t v2;
  void **p_config;
  uint64_t v4;
  char *v6;
  uint64_t v7;

  p_config = (void **)&self->_config;
  v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (v4)
  {
    if (v4 == 1)
      return 1024;
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
      sub_235910AB4(p_config, v6, v7);

  }
  return 512;
}

- (unint64_t)networkInputBufferHeight
{
  uint64_t v2;
  void **p_config;
  uint64_t v4;
  char *v6;
  uint64_t v7;

  p_config = (void **)&self->_config;
  v4 = objc_msgSend_networkResolution(self->_config, a2, v2);
  if (!v4)
    return 384;
  if (v4 == 1)
    return 576;
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    sub_235910B30(p_config, v6, v7);

  return 512;
}

- (unsigned)networkInputBufferPixelFormat
{
  return 1111970369;
}

- (__CVBuffer)_createCVPixelBuffer_Uint8_fromEspressoBufferFloat32:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t var4;
  unint64_t var5;
  size_t BytesPerRow;
  char *var0;
  char *BaseAddress;
  uint64_t i;
  char *v18;
  float *v19;
  unint64_t v20;
  float v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CVPixelBufferRef pixelBufferOut;

  if (a3->var6 != 1)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235910CF4(v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_21;
  }
  if (a3->var14 != 65568)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235910C88();
    goto LABEL_21;
  }
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputSemanticBufferPool, &pixelBufferOut))
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235910C1C();
LABEL_21:

    return 0;
  }
  var4 = a3->var4;
  var5 = a3->var5;
  if (var4 != CVPixelBufferGetWidth(pixelBufferOut) || var5 != CVPixelBufferGetHeight(pixelBufferOut))
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235910BAC(v4, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_21;
  }
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  var0 = (char *)a3->var0;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  if (var5)
  {
    for (i = 0; i != var5; ++i)
    {
      if (var4)
      {
        v18 = &BaseAddress[i * BytesPerRow];
        v19 = (float *)&var0[4 * i * var4];
        v20 = var4;
        do
        {
          v21 = *v19++;
          *v18++ = (int)v21;
          --v20;
        }
        while (v20);
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (__CVBuffer)_createCVPixelBuffer_Uint8_fromAcSaliencyHeatMap:(id *)a3
{
  $89BB12214744E703B6C4B42151811E52 *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v17;
  CVPixelBufferRef pixelBufferOut;

  if (!a3->var4)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235910D64(v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_7;
  }
  v3 = a3;
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputSaliencyBufferPool, &pixelBufferOut))
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235910DD4();
LABEL_7:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  Width = CVPixelBufferGetWidth(pixelBufferOut);
  Height = CVPixelBufferGetHeight(pixelBufferOut);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  if (Height)
  {
    v17 = BaseAddress;
    do
    {
      memcpy(v17, v3, Width);
      v17 += BytesPerRow;
      v3 = ($89BB12214744E703B6C4B42151811E52 *)((char *)v3 + Width);
      --Height;
    }
    while (Height);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOutputNames, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
