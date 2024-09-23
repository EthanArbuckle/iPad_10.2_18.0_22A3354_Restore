@implementation ANSTVideoMaskRefineAlgorithmV1

+ (unint64_t)_version
{
  return 0x10000;
}

- (ANSTVideoMaskRefineAlgorithmV1)initWithConfiguration:(id)a3
{
  id v5;
  ANSTVideoMaskRefineAlgorithmV1 *v6;
  ANSTVideoMaskRefineAlgorithmV1 *v7;
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
  v13.super_class = (Class)ANSTVideoMaskRefineAlgorithmV1;
  v6 = -[ANSTVideoMaskRefineAlgorithm initWithConfiguration:](&v13, sel_initWithConfiguration_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_readyForInference = 0;
    v7->_isFirstFrame = 1;
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2358CB000, v8, OS_LOG_TYPE_DEFAULT, "ANSTVideoMaskRefineAlgorithmV1 (VMRefiner v1.1) initialized with config %{public}@.", buf, 0xCu);

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
  v4.super_class = (Class)ANSTVideoMaskRefineAlgorithmV1;
  -[ANSTVideoMaskRefineAlgorithmV1 dealloc](&v4, sel_dealloc);
}

- (void)undoPrepareSideEffects
{
  OpaqueVTPixelTransferSession *pixelTransferSession;
  ANSTBaseNetworkEspresso *network;

  CVPixelBufferRelease(self->_resizedInputBuffer);
  CVPixelBufferPoolRelease(self->_outputBufferPool_256x192);
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(self->_pixelTransferSession);
    CFRelease(pixelTransferSession);
  }
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
  ANSTBaseNetworkEspresso *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  ANSTBaseNetworkEspresso *v17;
  ANSTBaseNetworkEspresso *network;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  os_signpost_id_t v35;
  const char *v36;
  ANSTBaseNetworkEspresso *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  ANSTBaseNetworkEspresso *v43;
  const char *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  __CVBuffer *PixelBuffer_width_height;
  OpaqueVTPixelTransferSession **p_pixelTransferSession;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  const char *v67;
  os_signpost_id_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  const char *v80;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  const char *v96;
  __CVPixelBufferPool *v97;
  os_signpost_id_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  const char *v110;
  uint8_t v111[16];
  uint64_t v112;
  const __CFString *v113;
  uint64_t v114;
  const __CFString *v115;
  uint64_t v116;
  const __CFString *v117;
  uint64_t v118;
  const __CFString *v119;
  uint8_t buf[16];
  __int128 v121;
  uint64_t v122;
  const __CFString *v123;
  uint64_t v124;
  _QWORD v125[2];

  v125[1] = *MEMORY[0x24BDAC8D0];
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_235916999, buf, 2u);
  }

  if (!self->_readyForInference)
  {
    v9 = [ANSTBaseNetworkEspresso alloc];
    v12 = objc_msgSend_networkEngineType(self->_config, v10, v11);
    v15 = objc_msgSend_qualityOfService(self->_config, v13, v14);
    v17 = (ANSTBaseNetworkEspresso *)objc_msgSend_initWithNetworkEngine_qualityOfService_networkName_(v9, v16, v12, v15, CFSTR("vmrefiner"));
    network = self->_network;
    self->_network = v17;

    if (objc_msgSend_networkEngineType(self->_config, v19, v20))
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_235911298(v5, v23, v24, v25, v26, v27, v28, v29);

      if (a3)
      {
        v32 = (void *)MEMORY[0x24BDD1540];
        v124 = *MEMORY[0x24BDD0FC8];
        v125[0] = CFSTR("ANSTKit has deprecated non-ANE execution support. Please stop configuring ANSTVideoMaskRefineAlgorithm for executing on non-ANE platforms.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)v125, &v124, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v33);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_undoPrepareSideEffects(self, v30, v31);
      v35 = os_signpost_id_make_with_pointer(v5, self);

      if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
        goto LABEL_38;
      *(_WORD *)buf = 0;
LABEL_37:
      _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v35, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_235916999, buf, 2u);
LABEL_38:

      return 0;
    }
    if ((objc_msgSend_prepare(self->_network, v21, v22) & 1) == 0)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_235911228(v5, v69, v70, v71, v72, v73, v74, v75);

      if (a3)
      {
        v78 = (void *)MEMORY[0x24BDD1540];
        v122 = *MEMORY[0x24BDD0FC8];
        v123 = CFSTR("Failed to prepare espresso network.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v76, (uint64_t)&v123, &v122, 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v78, v80, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v79);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_undoPrepareSideEffects(self, v76, v77);
      v35 = os_signpost_id_make_with_pointer(v5, self);

      if (v35 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
        goto LABEL_38;
      *(_WORD *)buf = 0;
      goto LABEL_37;
    }
    *(_OWORD *)buf = 0u;
    v121 = 0u;
    v37 = self->_network;
    objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v36, 2);
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v41 = objc_msgSend_UTF8String(v38, v39, v40);
    self->_lastPersonMask = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v37, v42, v41);

    v43 = self->_network;
    objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v44, 2);
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v48 = objc_msgSend_UTF8String(v45, v46, v47);
    LOBYTE(v43) = objc_msgSend_getBlobDimensionByName_andDestination_(v43, v49, v48, buf);

    if ((v43 & 1) != 0)
    {
      bzero(self->_lastPersonMask->var0, 4 * self->_lastPersonMask->var13);
      PixelBuffer_width_height = (__CVBuffer *)objc_msgSend_createPixelBuffer_width_height_(self, v52, 1111970369, 256, 192);
      self->_resizedInputBuffer = PixelBuffer_width_height;
      if (PixelBuffer_width_height)
      {
        p_pixelTransferSession = &self->_pixelTransferSession;
        if (VTPixelTransferSessionCreate(0, &self->_pixelTransferSession)
          || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9680], (CFTypeRef)*MEMORY[0x24BDF98F0])|| VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9678], (CFTypeRef)*MEMORY[0x24BDBD270]))
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            sub_2359111B8(v5, v56, v57, v58, v59, v60, v61, v62);

          if (a3)
          {
            v65 = (void *)MEMORY[0x24BDD1540];
            v114 = *MEMORY[0x24BDD0FC8];
            v115 = CFSTR("Failed to prepare VTPixelTransferSession.");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v63, (uint64_t)&v115, &v114, 1);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v65, v67, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v66);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend_undoPrepareSideEffects(self, v63, v64);
          v68 = os_signpost_id_make_with_pointer(v5, self);

          if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
            goto LABEL_53;
          *(_WORD *)v111 = 0;
        }
        else
        {
          v97 = (__CVPixelBufferPool *)objc_msgSend_pixelBufferPoolCreateWithMinCapacity_width_height_pixelFormat_(self, v55, 3, 256, 192, 1278226534);
          self->_outputBufferPool_256x192 = v97;
          if (v97)
          {
            v8 = 1;
            self->_readyForInference = 1;
            v98 = os_signpost_id_make_with_pointer(v5, self);

            if (v98 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
            {
              *(_WORD *)v111 = 0;
              _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v98, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_235916999, v111, 2u);
            }
            goto LABEL_54;
          }
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            sub_235911148(v5, v99, v100, v101, v102, v103, v104, v105);

          if (a3)
          {
            v108 = (void *)MEMORY[0x24BDD1540];
            v112 = *MEMORY[0x24BDD0FC8];
            v113 = CFSTR("Failed to prepare output pixel buffer pool.");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v106, (uint64_t)&v113, &v112, 1);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v108, v110, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v109);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend_undoPrepareSideEffects(self, v106, v107);
          v68 = os_signpost_id_make_with_pointer(v5, self);

          if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
          {
LABEL_53:
            v8 = 0;
LABEL_54:

            return v8;
          }
          *(_WORD *)v111 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          sub_2359110D8(v5, v85, v86, v87, v88, v89, v90, v91);

        if (a3)
        {
          v94 = (void *)MEMORY[0x24BDD1540];
          v116 = *MEMORY[0x24BDD0FC8];
          v117 = CFSTR("Failed to prepare resized input buffer.");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, (uint64_t)&v117, &v116, 1);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v94, v96, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v95);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend_undoPrepareSideEffects(self, v92, v93);
        v68 = os_signpost_id_make_with_pointer(v5, self);

        if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
          goto LABEL_53;
        *(_WORD *)v111 = 0;
      }
    }
    else
    {
      if (a3)
      {
        v82 = (void *)MEMORY[0x24BDD1540];
        v118 = *MEMORY[0x24BDD0FC8];
        v119 = CFSTR("Failed to get last person mask output blob dimensions");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v50, (uint64_t)&v119, &v118, 1);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v82, v84, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v83);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_undoPrepareSideEffects(self, v50, v51);
      v68 = os_signpost_id_make_with_pointer(v5, self);

      if (v68 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v5))
        goto LABEL_53;
      *(_WORD *)v111 = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v68, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_235916999, v111, 2u);
    goto LABEL_53;
  }
  v7 = os_signpost_id_make_with_pointer(v5, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v5, OS_SIGNPOST_INTERVAL_END, v7, "ANSTVideoMaskRefineAlgorithmV1_prepareWithError", (const char *)&unk_235916999, buf, 2u);
  }

  return 1;
}

- (id)resultForPixelBuffer:(__CVBuffer *)resizedInputBuffer coarseSegementationMasks:(id)a4 error:(id *)a5
{
  id v8;
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
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  os_signpost_id_t v27;
  void *v28;
  void *v29;
  const char *v30;
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
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  ANSTBaseNetworkEspresso *network;
  uint64_t v60;
  ANSTBaseNetworkEspresso *v61;
  void *v62;
  const char *v63;
  const char *v64;
  ANSTBaseNetworkEspresso *v65;
  void *v66;
  const char *v67;
  const char *v68;
  ANSTBaseNetworkEspresso *v69;
  void *v70;
  const char *v71;
  const char *v72;
  ANSTBaseNetworkEspresso *v73;
  void *v74;
  const char *v75;
  const char *v76;
  ANSTBaseNetworkEspresso *v77;
  void *v78;
  const char *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
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
  void *v101;
  void *v102;
  const char *v103;
  void *v104;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  void *v114;
  void *v115;
  const char *v116;
  void *v117;
  void *v118;
  const char *v119;
  $FD4688982923A924290ECB669CAF1EC2 *lastPersonMask;
  void *v121;
  const char *v122;
  char v123;
  const char *v124;
  uint64_t v125;
  os_signpost_id_t v126;
  void *v127;
  void *v128;
  const char *v129;
  void *v130;
  uint8_t buf[16];
  uint64_t v132;
  const __CFString *v133;
  uint64_t v134;
  const __CFString *v135;
  uint64_t v136;
  const __CFString *v137;
  uint64_t v138;
  const __CFString *v139;
  uint64_t v140;
  const __CFString *v141;
  uint64_t v142;
  const __CFString *v143;
  uint64_t v144;
  const __CFString *v145;
  uint64_t v146;
  const __CFString *v147;
  uint64_t v148;
  _QWORD v149[3];

  v149[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ANSTVideoMaskRefineAlgorithm_resultForPixelBuffer", (const char *)&unk_235916999, buf, 2u);
  }

  if (!self->_readyForInference)
  {
    if (a5)
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v148 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v149, &v148, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v29);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  if (!resizedInputBuffer)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_235911308(v9, v31, v32, v33, v34, v35, v36, v37);

    if (a5)
    {
      v39 = (void *)MEMORY[0x24BDD1540];
      v146 = *MEMORY[0x24BDD0FC8];
      v147 = CFSTR("Nil input buffer.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)&v147, &v146, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v39, v41, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v40);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  Width = CVPixelBufferGetWidth(resizedInputBuffer);
  Height = CVPixelBufferGetHeight(resizedInputBuffer);
  PixelFormatType = CVPixelBufferGetPixelFormatType(resizedInputBuffer);
  if (Width < Height)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_235911378(v9, v16, v17, v18, v19, v20, v21, v22);

    if (a5)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v144 = *MEMORY[0x24BDD0FC8];
      v145 = CFSTR("Input pixel buffer width < height. ANSTISPAlgorithm only supports landscape input.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)&v145, &v144, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
LABEL_71:
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v9, OS_SIGNPOST_INTERVAL_END, v27, "ANSTVideoMaskRefineAlgorithm_resultForPixelBuffer", (const char *)&unk_235916999, buf, 2u);
LABEL_72:
    v104 = 0;
    goto LABEL_73;
  }
  if (Width != 256 || Height != 192 || PixelFormatType != 1111970369)
  {
    if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, resizedInputBuffer, self->_resizedInputBuffer))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_235911538(v9, v42, v43, v44, v45, v46, v47, v48);

      if (a5)
      {
        v50 = (void *)MEMORY[0x24BDD1540];
        v142 = *MEMORY[0x24BDD0FC8];
        v143 = CFSTR("Failed to transfer input pixel buffer.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v49, (uint64_t)&v143, &v142, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v51);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v27 = os_signpost_id_make_with_pointer(v9, self);

      if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
        goto LABEL_72;
      *(_WORD *)buf = 0;
      goto LABEL_71;
    }
    resizedInputBuffer = self->_resizedInputBuffer;
  }
  objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)CFSTR("Skin"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v8, v54, (uint64_t)CFSTR("Hair"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v8, v56, (uint64_t)CFSTR("Person"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53 || !v55 || !v57)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_2359113E8(v9, v82, v83, v84, v85, v86, v87, v88);

    if (a5)
    {
      v90 = (void *)MEMORY[0x24BDD1540];
      v140 = *MEMORY[0x24BDD0FC8];
      v141 = CFSTR("Missing one or more required coarse input mask.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v89, (uint64_t)&v141, &v140, 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v90, v92, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v91);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  if (CVPixelBufferGetWidth((CVPixelBufferRef)v53) != 256
    || CVPixelBufferGetHeight((CVPixelBufferRef)v53) != 192
    || CVPixelBufferGetWidth((CVPixelBufferRef)v55) != 256
    || CVPixelBufferGetHeight((CVPixelBufferRef)v55) != 192
    || CVPixelBufferGetWidth((CVPixelBufferRef)v57) != 256
    || CVPixelBufferGetHeight((CVPixelBufferRef)v57) != 192)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_2359114C8(v9, v93, v94, v95, v96, v97, v98, v99);

    if (a5)
    {
      v101 = (void *)MEMORY[0x24BDD1540];
      v138 = *MEMORY[0x24BDD0FC8];
      v139 = CFSTR("Unexpected input mask dimension. VMRefiner expects 256 x 192 input.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v100, (uint64_t)&v139, &v138, 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v101, v103, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v102);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  if (CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v53) != 1278226488
    || CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v55) != 1278226488
    || CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v57) != 1278226488)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_235911458(v9, v106, v107, v108, v109, v110, v111, v112);

    if (a5)
    {
      v114 = (void *)MEMORY[0x24BDD1540];
      v136 = *MEMORY[0x24BDD0FC8];
      v137 = CFSTR("Unexpected input mask pixel format. VMRefiner expects OneComponent8.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v113, (uint64_t)&v137, &v136, 1);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v114, v116, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v115);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  network = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v58, 0);
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = network;
  v62 = (void *)v60;
  if (!objc_msgSend_setInput_fromCVPixelBuffer_(v61, v63, v60, resizedInputBuffer))
    goto LABEL_83;
  v130 = v62;
  v65 = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v64, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_setInput_fromCVPixelBuffer_(v65, v67, (uint64_t)v66, v53))
  {
LABEL_82:

    v62 = v130;
LABEL_83:

    goto LABEL_84;
  }
  v69 = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v68, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_setInput_fromCVPixelBuffer_(v69, v71, (uint64_t)v70, v55) & 1) == 0)
  {

    goto LABEL_82;
  }
  v73 = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v72, 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v73) = objc_msgSend_setInput_fromCVPixelBuffer_(v73, v75, (uint64_t)v74, v57);

  if (!(_DWORD)v73)
    goto LABEL_84;
  v77 = self->_network;
  if (self->_isFirstFrame)
  {
    objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v76, 4);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend_setInput_fromCVPixelBuffer_(v77, v79, (uint64_t)v78, v57);

    if (v80)
    {
      self->_isFirstFrame = 0;
      goto LABEL_90;
    }
LABEL_84:
    if (a5)
    {
      v117 = (void *)MEMORY[0x24BDD1540];
      v134 = *MEMORY[0x24BDD0FC8];
      v135 = CFSTR("Failed to set network input buffers");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v76, (uint64_t)&v135, &v134, 1);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v117, v119, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v118);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  lastPersonMask = self->_lastPersonMask;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkInputNames, v76, 4);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend_bindNetworkInputWithEspressoBuffer_withInputName_(v77, v122, (uint64_t)lastPersonMask, v121);

  if ((v123 & 1) == 0)
    goto LABEL_84;
LABEL_90:
  if ((objc_msgSend_runNetwork(self->_network, v76, v81) & 1) == 0)
  {
    if (a5)
    {
      v127 = (void *)MEMORY[0x24BDD1540];
      v132 = *MEMORY[0x24BDD0FC8];
      v133 = CFSTR("Failed to run network");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v124, (uint64_t)&v133, &v132, 1);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v127, v129, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v128);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = os_signpost_id_make_with_pointer(v9, self);

    if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
      goto LABEL_72;
    *(_WORD *)buf = 0;
    goto LABEL_71;
  }
  objc_msgSend__networkResult(self, v124, v125);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = os_signpost_id_make_with_pointer(v9, self);

  if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2358CB000, v9, OS_SIGNPOST_INTERVAL_END, v126, "ANSTVideoMaskRefineAlgorithm_resultForPixelBuffer", (const char *)&unk_235916999, buf, 2u);
  }
LABEL_73:

  return v104;
}

- (id)_networkResult
{
  ANSTBaseNetworkEspresso *network;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t TensorByName;
  const char *v10;
  uint64_t CVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32;
  const char *v12;
  __CVBuffer *v13;
  ANSTBaseNetworkEspresso *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  __CVBuffer *v24;
  ANSTBaseNetworkEspresso *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  __CVBuffer *v33;
  ANSTVideoMaskRefineAlgorithmResult *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  network = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, a2, 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend_UTF8String(v4, v5, v6);
  TensorByName = objc_msgSend_getTensorByName_(network, v8, v7);

  CVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32 = objc_msgSend__createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32_(self, v10, TensorByName);
  if (!CVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_2359115A8(v37, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_11;
  }
  v13 = (__CVBuffer *)CVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32;
  v14 = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v12, 1);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend_UTF8String(v15, v16, v17);
  v20 = objc_msgSend_getTensorByName_(v14, v19, v18);

  v22 = objc_msgSend__createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32_(self, v21, v20);
  if (!v22)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_235911618(v37, v45, v46, v47, v48, v49, v50, v51);
    goto LABEL_11;
  }
  v24 = (__CVBuffer *)v22;
  v25 = self->_network;
  objc_msgSend_objectAtIndexedSubscript_((void *)kANSTRefinerNetworkOutputNames, v23, 2);
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = objc_msgSend_UTF8String(v26, v27, v28);
  self->_lastPersonMask = ($FD4688982923A924290ECB669CAF1EC2 *)objc_msgSend_getTensorByName_(v25, v30, v29);

  v32 = objc_msgSend__createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32_(self, v31, (uint64_t)self->_lastPersonMask);
  if (!v32)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_235911688(v37, v52, v53, v54, v55, v56, v57, v58);
LABEL_11:

    v36 = 0;
    return v36;
  }
  v33 = (__CVBuffer *)v32;
  v34 = [ANSTVideoMaskRefineAlgorithmResult alloc];
  v36 = (void *)objc_msgSend_initWithSkinMask_hairMask_personMask_(v34, v35, (uint64_t)v13, v24, v33);
  CVPixelBufferRelease(v13);
  CVPixelBufferRelease(v24);
  CVPixelBufferRelease(v33);
  return v36;
}

- (__CVBuffer)_createCVPixelBuffer_256x192_Float32_fromEspressoBufferFloat32:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t var5;
  unint64_t v21;
  size_t BytesPerRow;
  char *var0;
  char *BaseAddress;
  char *v25;
  size_t v26;
  CVPixelBufferRef pixelBufferOut;

  if (a3->var6 != 1)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235911840(v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_12;
  }
  if (a3->var4 != 256 || a3->var5 != 192)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_2359117D0(v4, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_12;
  }
  if (a3->var14 != 65568)
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_235911764();
    goto LABEL_12;
  }
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(0, self->_outputBufferPool_256x192, &pixelBufferOut))
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_2359116F8();
LABEL_12:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  var5 = a3->var5;
  v21 = 4 * a3->var4;
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
  var0 = (char *)a3->var0;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
  v25 = BaseAddress;
  if (v21 == BytesPerRow)
  {
    memcpy(BaseAddress, var0, var5 * v21);
  }
  else if (var5)
  {
    if (v21 >= BytesPerRow)
      v26 = BytesPerRow;
    else
      v26 = v21;
    do
    {
      memcpy(v25, var0, v26);
      v25 += BytesPerRow;
      var0 += v21;
      --var5;
    }
    while (var5);
  }
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  return pixelBufferOut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
