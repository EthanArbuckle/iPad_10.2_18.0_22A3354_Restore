@implementation ICDocCamImageSequenceAnalyzer

- (ICDocCamImageSequenceAnalyzer)initWithOptions:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  ICDocCamImageSequenceAnalyzer *v8;
  uint64_t v9;
  NSMutableArray *frameArray;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *frameArraySem;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *dq;
  uint64_t v16;
  id callback;
  VNSequenceRequestHandler *v18;
  VNSequenceRequestHandler *seqHandler;
  uint64_t v20;
  NSDictionary *sessionOptions;
  void *v22;
  void *v23;
  int v24;
  dispatch_semaphore_t v25;
  OS_dispatch_semaphore *queueSizeSem;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ICDocCamImageSequenceAnalyzer;
  v8 = -[ICDocCamImageSequenceAnalyzer init](&v32, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    frameArray = v8->_frameArray;
    v8->_frameArray = (NSMutableArray *)v9;

    v11 = dispatch_semaphore_create(1);
    frameArraySem = v8->_frameArraySem;
    v8->_frameArraySem = (OS_dispatch_semaphore *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.VisionKit", v13);
    dq = v8->_dq;
    v8->_dq = (OS_dispatch_queue *)v14;

    v16 = MEMORY[0x212B988FC](v7);
    callback = v8->_callback;
    v8->_callback = (id)v16;

    v18 = (VNSequenceRequestHandler *)objc_alloc_init(MEMORY[0x24BDF9CE0]);
    seqHandler = v8->_seqHandler;
    v8->_seqHandler = v18;

    v20 = objc_msgSend(v6, "mutableCopy");
    sessionOptions = v8->_sessionOptions;
    v8->_sessionOptions = (NSDictionary *)v20;

    -[NSDictionary objectForKeyedSubscript:](v8->_sessionOptions, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_MaxBufferQueueSize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[NSDictionary objectForKeyedSubscript:](v8->_sessionOptions, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_MaxBufferQueueSize"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "intValue");

      v25 = dispatch_semaphore_create(v24);
      queueSizeSem = v8->_queueSizeSem;
      v8->_queueSizeSem = (OS_dispatch_semaphore *)v25;
    }
    else
    {
      queueSizeSem = v8->_queueSizeSem;
      v8->_queueSizeSem = 0;
    }

    v8->_bRealTime = 0;
    -[NSDictionary objectForKeyedSubscript:](v8->_sessionOptions, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_RealTime"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[NSDictionary objectForKeyedSubscript:](v8->_sessionOptions, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_RealTime"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_bRealTime = objc_msgSend(v28, "BOOLValue");

    }
    v8->_bSynchronous = 0;
    -[NSDictionary objectForKeyedSubscript:](v8->_sessionOptions, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Synchronous"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[NSDictionary objectForKeyedSubscript:](v8->_sessionOptions, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Synchronous"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_bSynchronous = objc_msgSend(v30, "BOOLValue");

    }
    perfInit();
  }

  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICDocCamImageSequenceAnalyzer;
  -[ICDocCamImageSequenceAnalyzer dealloc](&v2, sel_dealloc);
}

- (void)addFrame:(__CVBuffer *)a3 metaData:(id)a4 frameOptions:(id)a5 rectangleRequest:(id)a6 pixelFocalLength:(float)a7 cameraIntrinsicData:(__CFData *)a8
{
  id v14;
  id v15;
  id v16;
  ICDocCamImageSequenceFrame *v17;
  NSObject *queueSizeSem;
  uint64_t v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  void *v23;
  NSObject *dq;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD v27[5];
  id v28;
  id v29;
  __CFData *v30;
  float v31;

  v14 = a4;
  v15 = a6;
  v16 = a5;
  v17 = objc_alloc_init(ICDocCamImageSequenceFrame);
  -[ICDocCamImageSequenceFrame setPb:](v17, "setPb:", CVPixelBufferRetain(a3));
  -[ICDocCamImageSequenceFrame setFrameOptions:](v17, "setFrameOptions:", v16);

  if (!self->_bSynchronous)
  {
    queueSizeSem = self->_queueSizeSem;
    if (queueSizeSem)
      dispatch_semaphore_wait(queueSizeSem, 0xFFFFFFFFFFFFFFFFLL);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameArraySem, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableArray addObject:](self->_frameArray, "addObject:", v17);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameArraySem);
  v19 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke;
  v27[3] = &unk_24C5B8350;
  v27[4] = self;
  v30 = a8;
  v31 = a7;
  v20 = v15;
  v28 = v20;
  v21 = v14;
  v29 = v21;
  v22 = (void (**)(_QWORD))MEMORY[0x212B988FC](v27);
  v23 = v22;
  if (self->_bSynchronous)
  {
    v22[2](v22);
  }
  else
  {
    dq = self->_dq;
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_3;
    v25[3] = &unk_24C5B7DE0;
    v26 = v22;
    dispatch_async(dq, v25);

  }
}

void __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  intptr_t v12;
  uint64_t v13;
  __CVBuffer *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  size_t Width;
  double v25;
  double v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  CFDataRef v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  void *v52;
  double v53;
  int v54;
  id v55;
  uint64_t v56;
  void *v57;
  char v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  int v63;
  double v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  id v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *context;
  void *v89;
  void *v90;
  _QWORD block[5];
  id v92;
  id v93;
  id v94;
  UInt8 bytes[16];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  const __CFString *v102;
  void *v103;
  uint64_t v104;
  CFDataRef v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (*(_BYTE *)(v2 + 64))
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeLastObject");
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v99 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
          if (v10 != v4)
          {
            CVPixelBufferRelease((CVPixelBufferRef)objc_msgSend(v10, "pb"));
            v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
            if (v11)
              dispatch_semaphore_signal(v11);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", 0);
  }
  v12 = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (v4)
  {
    context = (void *)MEMORY[0x212B98734](v12);
    v13 = objc_msgSend(v4, "pb");
    if (!v13)
      __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_cold_1();
    v14 = (__CVBuffer *)v13;
    objc_msgSend(v4, "frameOptions");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_19;
    v16 = (void *)v15;
    objc_msgSend(v4, "frameOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_Orientation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "frameOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_Orientation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "intValue");

    }
    else
    {
LABEL_19:
      v21 = 1;
    }
    v22 = *(_QWORD *)(a1 + 56);
    if (v22)
    {
      v106 = *MEMORY[0x24BDF9F40];
      v107 = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      Width = CVPixelBufferGetWidth(v14);
      v96 = 0u;
      v97 = 0u;
      *(_OWORD *)bytes = 0u;
      *(float *)&v25 = (float)CVPixelBufferGetHeight(v14);
      LODWORD(v26) = *(_DWORD *)(a1 + 64);
      +[ICDocCamViewController cameraIntrinsicMatrixForWidth:height:pixelFocalLength:](ICDocCamViewController, "cameraIntrinsicMatrixForWidth:height:pixelFocalLength:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)Width)), v25, v26);
      *(_DWORD *)&bytes[8] = v27;
      DWORD2(v96) = v28;
      *(_QWORD *)bytes = v29;
      *(_QWORD *)&v96 = v30;
      DWORD2(v97) = v31;
      *(_QWORD *)&v97 = v32;
      v33 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 48);
      v104 = *MEMORY[0x24BDF9F40];
      v105 = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF9C28]), "initWithCVPixelBuffer:orientation:options:", v14, v21, v23);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Rectangles"));
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Rectangles"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "BOOLValue");

      if (v39)
      {
        if (*(_QWORD *)(a1 + 40))
          objc_msgSend(v90, "addObject:");
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Registration"));
    v40 = objc_claimAutoreleasedReturnValue();
    if (!v40)
      goto LABEL_31;
    v41 = (void *)v40;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Registration"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "BOOLValue");

    if (!v43)
      goto LABEL_31;
    v44 = objc_alloc(MEMORY[0x24BDF9CF0]);
    v45 = objc_msgSend(v44, "initWithTargetedCVPixelBuffer:options:", v14, MEMORY[0x24BDBD1B8]);
    if (v45)
    {
      v46 = v35;
      v89 = (void *)v45;
      objc_msgSend(v35, "addObject:", v45);
    }
    else
    {
LABEL_31:
      v89 = 0;
      v46 = v35;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_SceneClassification"));
    v47 = objc_claimAutoreleasedReturnValue();
    if (v47
      && (v48 = (void *)v47,
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_SceneClassification")), v49 = (void *)objc_claimAutoreleasedReturnValue(), v50 = objc_msgSend(v49, "BOOLValue"), v49, v48, v50))
    {
      v51 = objc_alloc_init(MEMORY[0x24BDF9CC8]);
      v52 = v90;
      if (v51)
        objc_msgSend(v90, "addObject:", v51);
    }
    else
    {
      v51 = 0;
      v52 = v90;
    }
    if (!objc_msgSend(v52, "count"))
      goto LABEL_64;
    v53 = timeElapsedSinceInit();
    v94 = 0;
    v54 = objc_msgSend(v34, "performRequests:error:", v52, &v94);
    v55 = v94;
    v56 = objc_msgSend(v46, "count");
    if (v56 && v54)
    {
      v57 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v93 = v55;
      v58 = objc_msgSend(v57, "performRequests:onCVPixelBuffer:error:", v46, v14, &v93);
      v87 = v93;

      v59 = timeElapsedSinceInit();
      if ((v58 & 1) == 0)
        goto LABEL_62;
      v60 = v59;
    }
    else
    {
      v61 = v34;
      v62 = v23;
      if (v56)
        v63 = 0;
      else
        v63 = v54;
      v64 = timeElapsedSinceInit();
      if (v63 != 1)
      {
        v87 = v55;
        v23 = v62;
        v34 = v61;
        v46 = v35;
        goto LABEL_62;
      }
      v60 = v64;
      v87 = v55;
      v23 = v62;
      v34 = v61;
      v46 = v35;
    }
    v52 = v90;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
LABEL_63:

LABEL_64:
      CVPixelBufferRelease(v14);

      objc_autoreleasePoolPop(context);
      goto LABEL_65;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "results");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v66, CFSTR("ICDocCamImageSequenceAnalyzer_Rectangles"));
    v86 = v23;
    objc_msgSend(v89, "results");
    v67 = objc_claimAutoreleasedReturnValue();
    if (v67)
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v67, CFSTR("ICDocCamImageSequenceAnalyzer_Registration"));
    v68 = (void *)MEMORY[0x24BDBCED8];
    v102 = CFSTR("ICDocCamImageSequenceAnalyzerResults");
    v103 = v65;
    v85 = v65;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "dictionaryWithDictionary:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "frameOptions");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_Timestamp"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      objc_msgSend(v4, "frameOptions");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceFrame_Timestamp"));
      v74 = v34;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v75, CFSTR("ICDocCamImageSequenceFrame_Timestamp"));

      v34 = v74;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_Debug"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v76)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v60 - v53);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v77, CFSTR("ICDocCamImageSequenceFrame_RequestTime"));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", CFSTR("ICDocCamImageSequenceAnalyzer_SceneClassification"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      objc_msgSend(v51, "results");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v79, CFSTR("ICDocCamImageSequenceAnalyzer_SceneClassification"));

    }
    v80 = *(_QWORD *)(a1 + 48);
    if (v80)
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v80, CFSTR("ICDocCamImageSequenceFrame_MetaData"));
    dispatch_get_global_queue(2, 0);
    v81 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_2;
    block[3] = &unk_24C5B7BF0;
    block[4] = *(_QWORD *)(a1 + 32);
    v92 = v70;
    v82 = v70;
    dispatch_async(v81, block);

    v23 = v86;
LABEL_62:
    v52 = v90;
    goto LABEL_63;
  }
LABEL_65:
  v83 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (v83)
    dispatch_semaphore_signal(v83);

}

uint64_t __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

uint64_t __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finish
{
  dispatch_sync((dispatch_queue_t)self->_dq, &__block_literal_global_4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seqHandler, 0);
  objc_storeStrong((id *)&self->_queueSizeSem, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_sessionOptions, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_frameArraySem, 0);
  objc_storeStrong((id *)&self->_frameArray, 0);
}

void __118__ICDocCamImageSequenceAnalyzer_addFrame_metaData_frameOptions_rectangleRequest_pixelFocalLength_cameraIntrinsicData___block_invoke_cold_1()
{
  __assert_rtn("-[ICDocCamImageSequenceAnalyzer addFrame:metaData:frameOptions:rectangleRequest:pixelFocalLength:cameraIntrinsicData:]_block_invoke", "ICDocCamImageSequenceAnalyzer.m", 184, "pb");
}

@end
