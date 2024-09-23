@implementation VCPVideoFullFaceDetector

- (id)faceRanges
{
  return self->_faceRanges;
}

- (VCPVideoFullFaceDetector)initWithTransform:(CGAffineTransform *)a3
{
  VCPVideoFullFaceDetector *v4;
  __int128 v5;
  VCPVideoFullFaceDetector *v6;
  uint64_t v7;
  NSMutableArray *frameFaceResults;
  _OWORD v10[3];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPVideoFullFaceDetector;
  v4 = -[VCPVideoFullFaceDetector init](&v11, sel_init);
  v5 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&a3->tx;
  v6 = -[VCPVideoFullFaceDetector initWithTransform:withExistingFaceprints:](v4, "initWithTransform:withExistingFaceprints:", v10, 0);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    frameFaceResults = v6->_frameFaceResults;
    v6->_frameFaceResults = (NSMutableArray *)v7;

  }
  return v6;
}

- (VCPVideoFullFaceDetector)initWithTransform:(CGAffineTransform *)a3 withExistingFaceprints:(id)a4
{
  id v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  VCPVideoFullFaceDetector *v47;
  void *v48;
  id v50;
  _OWORD v51[3];
  objc_super v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 buf;
  void *v58;
  void *v59;
  uint64_t *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)VCPVideoFullFaceDetector;
  v8 = -[VCPVideoFullFaceDetector init](&v52, sel_init);
  if (v8)
  {
    v9 = *(_OWORD *)&a3->c;
    v51[0] = *(_OWORD *)&a3->a;
    v51[1] = v9;
    v51[2] = *(_OWORD *)&a3->tx;
    *((_DWORD *)v8 + 2) = angleForTransform(v51);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v10;

    v12 = MEMORY[0x1E0CA2E28];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)(v8 + 12) = *MEMORY[0x1E0CA2E28];
    *(_QWORD *)(v8 + 28) = v13;
    v14 = *(_QWORD *)(v12 + 16);
    *(_OWORD *)(v8 + 92) = *(_OWORD *)v12;
    *(_QWORD *)(v8 + 108) = v14;
    v15 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = 0;

    *((_DWORD *)v8 + 14) = 31;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v8 + 15);
    *((_QWORD *)v8 + 15) = v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v8 + 16);
    *((_QWORD *)v8 + 16) = v18;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v8 + 18);
    *((_QWORD *)v8 + 18) = v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v8 + 19);
    *((_QWORD *)v8 + 19) = v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v8 + 20);
    *((_QWORD *)v8 + 20) = v24;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v8 + 21);
    *((_QWORD *)v8 + 21) = v26;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v8 + 17);
    *((_QWORD *)v8 + 17) = v28;

    objc_storeStrong((id *)v8 + 10, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v8 + 22);
    *((_QWORD *)v8 + 22) = v30;

    *((_DWORD *)v8 + 22) = 0;
    v32 = (void *)*((_QWORD *)v8 + 23);
    *((_QWORD *)v8 + 23) = 0;

    v53 = 0;
    v54 = &v53;
    v55 = 0x2050000000;
    v33 = (void *)getGDVUStreamingGalleryClass(void)::softClass;
    v56 = getGDVUStreamingGalleryClass(void)::softClass;
    if (!getGDVUStreamingGalleryClass(void)::softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v58 = ___ZL28getGDVUStreamingGalleryClassv_block_invoke;
      v59 = &unk_1E6B15540;
      v60 = &v53;
      ___ZL28getGDVUStreamingGalleryClassv_block_invoke((uint64_t)&buf);
      v33 = (void *)v54[3];
    }
    v34 = objc_retainAutorelease(v33);
    _Block_object_dispose(&v53, 8);
    v35 = [v34 alloc];
    v53 = 0;
    v54 = &v53;
    v55 = 0x2050000000;
    v36 = (void *)getGDVUEntityRecognitionClientClass(void)::softClass;
    v56 = getGDVUEntityRecognitionClientClass(void)::softClass;
    if (!getGDVUEntityRecognitionClientClass(void)::softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v58 = ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke;
      v59 = &unk_1E6B15540;
      v60 = &v53;
      ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke((uint64_t)&buf);
      v36 = (void *)v54[3];
    }
    v37 = objc_retainAutorelease(v36);
    _Block_object_dispose(&v53, 8);
    objc_msgSend(v37, "photos");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v39 = objc_msgSend(v35, "initWithClient:error:", v38, &v50);
    v40 = v50;
    v41 = (void *)*((_QWORD *)v8 + 24);
    *((_QWORD *)v8 + 24) = v39;

    if (*((_QWORD *)v8 + 24))
    {
      +[VCPCNNSmileDetector detector](VCPCNNSmileDetector, "detector");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)*((_QWORD *)v8 + 8);
      *((_QWORD *)v8 + 8) = v42;

      v44 = (void *)*((_QWORD *)v8 + 8);
      if (v44)
      {
        +[VCPCNNPoseEstimator estimator](VCPCNNPoseEstimator, "estimator");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)*((_QWORD *)v8 + 9);
        *((_QWORD *)v8 + 9) = v45;

        if (*((_QWORD *)v8 + 9))
          v44 = v8;
        else
          v44 = 0;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v40, "description");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v48;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to init GDVUStreamingGallery %@", (uint8_t *)&buf, 0xCu);

      }
      v44 = 0;
    }
    v47 = v44;

  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (int)detectFaces:(__CVBuffer *)a3 faces:(id)a4 torsos:(id)a5 frameStats:(id)a6
{
  int Height;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  id v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  void *v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  id v57;
  uint64_t v58;
  __int128 v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  void *v64;
  void *v65;
  double x;
  double y;
  double v68;
  double v69;
  int v70;
  int v71;
  int v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  BOOL v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t j;
  uint64_t v86;
  void *v87;
  void *v88;
  VCPHuman *v89;
  void *v90;
  __int128 v92;
  id v93;
  VCPFace *v94;
  id v95;
  id v96;
  void *v97;
  int Width;
  uint64_t v99;
  void *context;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  int v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  unsigned __int8 v114;
  CGAffineTransform v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  uint8_t v130[128];
  uint8_t v131[16];
  uint8_t v132[128];
  uint8_t buf[24];
  _BYTE v134[128];
  uint64_t v135;
  CGRect v136;
  CGRect v137;

  v135 = *MEMORY[0x1E0C80C00];
  v103 = a4;
  v109 = a5;
  v106 = a6;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  context = (void *)MEMORY[0x1BCCA1B2C]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v105 = (void *)objc_msgSend(v10, "initWithCVPixelBuffer:options:", a3, MEMORY[0x1E0C9AA70]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  VCPSignPostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPVideoFullFaceDetectorFaceHumanDetection", ", buf, 2u);
  }

  v129 = 0;
  v15 = objc_opt_class();
  if (_os_feature_enabled_impl())
    v16 = 15;
  else
    v16 = 11;
  v17 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v129, v15, v16);
  v18 = v129;
  v108 = v17;
  v104 = v18;
  if (v17)
  {
    v19 = 0;
    LODWORD(v20) = 4;
    goto LABEL_96;
  }
  if (v18)
    objc_msgSend(v107, "addObject:", v18);
  if (!_os_feature_enabled_impl())
  {
    v25 = 0;
LABEL_18:
    v97 = v25;
    v127 = 0;
    v26 = objc_msgSend(v105, "performRequests:error:", v107, &v127);
    v19 = v127;
    if ((v26 & 1) == 0)
    {
      v108 = -18;
      goto LABEL_31;
    }
    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_END, v12, "VCPVideoFullFaceDetectorFaceHumanDetection", ", buf, 2u);
    }

    objc_msgSend(v107, "removeAllObjects");
    VCPSignPostLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_signpost_id_generate(v29);

    VCPSignPostLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "VCPVideoFullFaceDetectorFaceTorsoprint", ", buf, 2u);
    }

    v126 = 0;
    v33 = objc_opt_class();
    if (_os_feature_enabled_impl())
      v34 = 15;
    else
      v34 = 11;
    v35 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v126, v33, v34);
    v96 = v126;
    v108 = v35;
    if (v35)
    {
      LODWORD(v20) = 4;
LABEL_94:

      goto LABEL_95;
    }
    objc_msgSend(v104, "results");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setInputFaceObservations:", v36);

    if (v96)
      objc_msgSend(v107, "addObject:", v96);
    if (!_os_feature_enabled_impl())
      goto LABEL_44;
    v125 = 0;
    v37 = objc_opt_class();
    if (_os_feature_enabled_impl())
      v38 = 15;
    else
      v38 = 11;
    v39 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v125, v37, v38);
    v95 = v125;
    v108 = v39;
    if (v39)
    {
      LODWORD(v20) = 4;
LABEL_93:

      goto LABEL_94;
    }
    objc_msgSend(v97, "results");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setInputDetectedObjectObservations:", v40);

    if (v95)
      objc_msgSend(v107, "addObject:");
    else
LABEL_44:
      v95 = 0;
    v124 = v19;
    v41 = objc_msgSend(v105, "performRequests:error:", v107, &v124);
    v93 = v124;

    if (v41)
    {
      VCPSignPostLog();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v43, OS_SIGNPOST_INTERVAL_END, v30, "VCPVideoFullFaceDetectorFaceTorsoprint", ", buf, 2u);
      }

      objc_msgSend(v96, "results");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44 == 0;

      if (!v45)
      {
        objc_msgSend(v96, "results");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "addObjectsFromArray:", v46);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      objc_msgSend(v95, "results");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
      if (v49)
      {
        v50 = *(_QWORD *)v121;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v121 != v50)
              objc_enumerationMutation(v48);
            v52 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
            v53 = (void *)MEMORY[0x1BCCA1B2C]();
            objc_msgSend(v52, "groupId");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v54 == 0;

            if (!v55)
            {
              objc_msgSend(v52, "groupId");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setObject:forKeyedSubscript:", v52, v56);

            }
            objc_autoreleasePoolPop(v53);
          }
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
        }
        while (v49);
      }

      memset(buf, 0, 16);
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v57 = v102;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
      if (v58)
      {
        v108 = 0;
        v60 = (double)Width;
        v61 = (double)-Height;
        v62 = (double)Height;
        v99 = *(_QWORD *)v117;
        *(_QWORD *)&v59 = 138412290;
        v92 = v59;
LABEL_62:
        v63 = 0;
        while (1)
        {
          if (*(_QWORD *)v117 != v99)
            objc_enumerationMutation(v57);
          v64 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v63);
          v65 = (void *)MEMORY[0x1BCCA1B2C]();
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v131 = v92;
            *(_QWORD *)&v131[4] = v64;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPVideoFullFaceDetector] Detected face %@", v131, 0xCu);
          }
          objc_msgSend(v64, "boundingBox", v92);
          *(_OWORD *)&v115.b = *(_OWORD *)buf;
          v115.a = v60;
          v115.d = v61;
          v115.tx = 0.0;
          v115.ty = v62;
          v137 = CGRectApplyAffineTransform(v136, &v115);
          x = v137.origin.x;
          y = v137.origin.y;
          v68 = v137.size.width;
          v69 = v137.size.height;
          v114 = 0;
          v70 = -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:](self->_smileDetector, "detectSmileForFace:inBuffer:smile:", a3, &v114);
          if (v70)
          {
            LODWORD(v20) = 4;
            v108 = v70;
          }
          else
          {
            *(_QWORD *)v131 = 0;
            v71 = -[VCPCNNPoseEstimator detectPoseForFace:inBuffer:yaw:](self->_poseEstimator, "detectPoseForFace:inBuffer:yaw:", a3, v131, x, y, v68, v69);
            v72 = v108;
            if (v71)
              v72 = v71;
            v108 = v72;
            if (v71)
            {
              LODWORD(v20) = 4;
            }
            else
            {
              v94 = objc_alloc_init(VCPFace);
              -[VCPFace setSmile:](v94, "setSmile:", v114);
              -[VCPFace setYaw:](v94, "setYaw:", *(_QWORD *)v131);
              -[VCPFace setBounds:](v94, "setBounds:", x, y, v68, v69);
              LODWORD(v73) = 1.0;
              -[VCPFace setConfidence:](v94, "setConfidence:", v73);
              -[VCPFace setObservation:](v94, "setObservation:", v64);
              objc_msgSend(v103, "addObject:", v94);
              objc_msgSend(v64, "groupId");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              if (v74)
              {
                objc_msgSend(v64, "groupId");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectForKeyedSubscript:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v76 == 0;

                if (!v77)
                {
                  objc_msgSend(v64, "groupId");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectForKeyedSubscript:", v78);
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v79, "torsoprint");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setTorsoprint:", v80);

                  objc_msgSend(v64, "groupId");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectForKeyedSubscript:", v81);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v82, "boundingBox");
                  -[VCPFace setTorsoBounds:](v94, "setTorsoBounds:");

                  objc_msgSend(v64, "groupId");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "removeObjectForKey:", v83);

                }
              }

              LODWORD(v20) = 0;
            }
          }
          objc_autoreleasePoolPop(v65);
          if ((_DWORD)v20)
            break;
          if (v58 == ++v63)
          {
            v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
            if (v58)
              goto LABEL_62;
            goto LABEL_84;
          }
        }
      }
      else
      {
        v108 = 0;
LABEL_84:

        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v57 = v47;
        v20 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v110, v130, 16);
        if (v20)
        {
          v84 = *(_QWORD *)v111;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v111 != v84)
                objc_enumerationMutation(v57);
              v86 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * j);
              v87 = (void *)MEMORY[0x1BCCA1B2C]();
              objc_msgSend(v57, "objectForKeyedSubscript:", v86);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_alloc_init(VCPHuman);
              objc_msgSend(v88, "torsoprint");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              -[VCPHuman setTorsoprint:](v89, "setTorsoprint:", v90);

              objc_msgSend(v88, "boundingBox");
              -[VCPHuman setBounds:](v89, "setBounds:");
              objc_msgSend(v109, "addObject:", v89);

              objc_autoreleasePoolPop(v87);
            }
            v20 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v110, v130, 16);
          }
          while (v20);
        }
      }

    }
    else
    {
      v108 = -18;
      LODWORD(v20) = 4;
    }
    v19 = v93;
    goto LABEL_93;
  }
  v128 = 0;
  v21 = objc_opt_class();
  if (_os_feature_enabled_impl())
    v22 = 15;
  else
    v22 = 11;
  v23 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v128, v21, v22);
  v24 = v128;
  v25 = v24;
  v108 = v23;
  if (!v23)
  {
    if (v24)
      objc_msgSend(v107, "addObject:", v24);
    goto LABEL_18;
  }
  v97 = v24;
  v19 = 0;
LABEL_31:
  LODWORD(v20) = 4;
LABEL_95:

LABEL_96:
  objc_autoreleasePoolPop(context);
  if ((_DWORD)v20 != 4)
    objc_msgSend(v106, "setFrameProcessedByFaceDetector:", 1);
  if (v108 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v19;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPVideoFullFaceDetector] Failed to detect faces - %@", buf, 0xCu);
  }

  return v108;
}

- (float)minProcessTimeIntervalInSecs
{
  return 1.0;
}

- (void)removeSmallestKeyFace
{
  NSMutableDictionary *keyFaces;
  _QWORD v4[6];
  _QWORD v5[3];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 2139095039;
  keyFaces = self->_keyFaces;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__VCPVideoFullFaceDetector_removeSmallestKeyFace__block_invoke;
  v4[3] = &unk_1E6B156A8;
  v4[4] = v5;
  v4[5] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyFaces, "enumerateKeysAndObjectsUsingBlock:", v4);
  if (v8[5])
    -[NSMutableDictionary removeObjectForKey:](self->_keyFaces, "removeObjectForKey:");
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);

}

void __49__VCPVideoFullFaceDetector_removeSmallestKeyFace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  double v7;
  double v8;
  double v9;
  float v10;
  id v11;

  v11 = a2;
  v6 = a3;
  objc_msgSend(v6, "bounds");
  v8 = v7;
  objc_msgSend(v6, "bounds");
  v10 = v8 * v9;
  if (*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
  }

}

- (BOOL)compareFace:(id)a3 withFace:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v5, "yaw");
    if (v9 == objc_msgSend(v7, "yaw"))
    {
      objc_msgSend(v5, "bounds");
      v11 = v10;
      objc_msgSend(v5, "bounds");
      v13 = v12;
      objc_msgSend(v7, "bounds");
      v15 = v14;
      objc_msgSend(v7, "bounds");
      v8 = v11 * v13 < v15 * v16;
    }
    else
    {
      v8 = fabs((double)(objc_msgSend(v5, "yaw") - 2)) > fabs((double)(objc_msgSend(v7, "yaw") - 2));
    }
  }

  return v8;
}

- (BOOL)locationChange:(CGRect)a3 relativeTo:(CGRect)a4 landscape:(BOOL)a5
{
  return a5 && vabdd_f64(a3.origin.x + a3.size.width * 0.5, a4.origin.x + a4.size.width * 0.5) > 0.25;
}

- (int)detectTrackFacesInFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 faces:(id)a5 torsos:(id)a6 frameStats:(id)a7
{
  id v10;
  void *v11;
  NSMutableDictionary *faceTrackers;
  int64_t var3;
  id v14;
  int64_t v15;
  double Seconds;
  float v17;
  int v18;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  VCPFace *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  float v37;
  uint64_t j;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double width;
  double height;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  float v66;
  id v67;
  NSMutableDictionary *v68;
  void *v69;
  NSMutableDictionary *keyFaces;
  void *v71;
  void *v72;
  NSMutableDictionary *v73;
  void *v74;
  void *v75;
  NSMutableDictionary *v76;
  void *v77;
  VCPVideoObjectTracker *v78;
  VCPVideoObjectTracker *v79;
  NSMutableDictionary *v80;
  void *v81;
  NSMutableArray *reservedIDs;
  __int128 v83;
  int *v85;
  void *v86;
  void *v87;
  void *v88;
  __CVBuffer *v89;
  id v90;
  id v92;
  id obj;
  id obja;
  void *v96;
  id v97;
  __int128 v98;
  int64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[3];
  __int128 v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  CMTime time;
  _QWORD v116[4];
  id v117;
  id v118;
  __CVBuffer *v119;
  __int128 v120;
  int64_t v121;
  CMTime rhs;
  CMTime lhs;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  v127 = *MEMORY[0x1E0C80C00];
  v90 = a5;
  v10 = a6;
  v97 = a7;
  v86 = v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  faceTrackers = self->_faceTrackers;
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = __90__VCPVideoFullFaceDetector_detectTrackFacesInFrame_withTimestamp_faces_torsos_frameStats___block_invoke;
  v116[3] = &unk_1E6B156D0;
  v120 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v119 = a3;
  v121 = var3;
  v14 = v11;
  v117 = v14;
  v92 = v88;
  v118 = v92;
  v87 = v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](faceTrackers, "enumerateKeysAndObjectsUsingBlock:", v116);
  -[NSMutableDictionary removeObjectsForKeys:](self->_faceTrackers, "removeObjectsForKeys:", v14);
  v15 = a4->var3;
  *(_OWORD *)(&self->_latestFrameArea + 1) = *(_OWORD *)&a4->var0;
  *(_QWORD *)&self->_timeLastTracking.flags = v15;
  lhs = *(CMTime *)a4;
  *(_OWORD *)&rhs.value = *(_OWORD *)(&self->super._angle + 1);
  rhs.epoch = *(_QWORD *)&self->super._timeLastDetection.flags;
  CMTimeSubtract(&time, &lhs, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  -[VCPVideoFullFaceDetector minProcessTimeIntervalInSecs](self, "minProcessTimeIntervalInSecs");
  if (Seconds < v17)
  {
    objc_msgSend(v90, "addObjectsFromArray:", v92);
    v18 = 0;
    goto LABEL_45;
  }
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  v18 = -[VCPVideoFullFaceDetector detectFaces:faces:torsos:frameStats:](self, "detectFaces:faces:torsos:frameStats:", a3, v90, v10, v97);
  if (v18)
    goto LABEL_45;
  v85 = &self->super._angle + 1;
  v89 = a3;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v90;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v112;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v112 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1BCCA1B2C]();
        v26 = objc_alloc_init(VCPFace);
        v108[1] = 0;
        v108[2] = 0;
        v109 = xmmword_1B6FBCA30;
        v108[0] = 0x3FF0000000000000;
        v110 = 0x3FF0000000000000;
        objc_msgSend(v24, "faceBoundsWithTransform:height:transform:", WidthOfPlane, HeightOfPlane, v108);
        -[VCPFace setBounds:](v26, "setBounds:");
        objc_msgSend(v97, "detectedFaces");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v26);

        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_reservedIDs);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeAllObjects](self->_reservedIDs, "removeAllObjects");
  objc_msgSend(obj, "sortUsingComparator:", &__block_literal_global_5);
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  objc_msgSend(obj, "reverseObjectEnumerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v29;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
  if (v30)
  {
    obja = *(id *)v105;
LABEL_13:
    v31 = 0;
    while (1)
    {
      if (*(id *)v105 != obja)
        objc_enumerationMutation(v29);
      v32 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v31);
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v33 = v92;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
      if (!v34)
        break;
      v35 = 0;
      v36 = *(_QWORD *)v101;
      v37 = 0.0;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v101 != v36)
            objc_enumerationMutation(v33);
          v39 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
          objc_msgSend(v32, "bounds", v85);
          v41 = v40;
          v43 = v42;
          v45 = v44;
          v47 = v46;
          objc_msgSend(v39, "bounds");
          v132.origin.x = v48;
          v132.origin.y = v49;
          v132.size.width = v50;
          v132.size.height = v51;
          v128.origin.x = v41;
          v128.origin.y = v43;
          v128.size.width = v45;
          v128.size.height = v47;
          v129 = CGRectIntersection(v128, v132);
          width = v129.size.width;
          height = v129.size.height;
          objc_msgSend(v32, "bounds", v129.origin.x, v129.origin.y);
          v55 = v54;
          v57 = v56;
          v59 = v58;
          v61 = v60;
          objc_msgSend(v39, "bounds");
          v133.origin.x = v62;
          v133.origin.y = v63;
          v133.size.width = v64;
          v133.size.height = v65;
          v130.origin.x = v55;
          v130.origin.y = v57;
          v130.size.width = v59;
          v130.size.height = v61;
          v131 = CGRectUnion(v130, v133);
          v66 = width * height / (v131.size.width * v131.size.height);
          if (v37 < v66)
          {
            v67 = v39;

            v37 = v66;
            v35 = v67;
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
      }
      while (v34);

      if (!v35 || v37 <= 0.05)
        goto LABEL_32;
      objc_msgSend(v32, "setTrackID:", objc_msgSend(v35, "trackID"));
      v68 = self->_faceTrackers;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v68, "removeObjectForKey:", v69);

      objc_msgSend(v33, "removeObject:", v35);
      keyFaces = self->_keyFaces;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](keyFaces, "objectForKeyedSubscript:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v72 && -[VCPVideoFullFaceDetector compareFace:withFace:](self, "compareFace:withFace:", v72, v32))
      {
        v73 = self->_keyFaces;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v73, "setObject:forKey:", v32, v74);

      }
LABEL_36:
      if ((unint64_t)-[NSMutableDictionary count](self->_faceTrackers, "count") > 4)
      {
        reservedIDs = self->_reservedIDs;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
        v79 = (VCPVideoObjectTracker *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](reservedIDs, "addObject:", v79);
      }
      else
      {
        v78 = [VCPVideoObjectTracker alloc];
        objc_msgSend(v32, "bounds");
        v98 = *(_OWORD *)&a4->var0;
        v99 = a4->var3;
        v79 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v78, "initWithObjectBounds:inFrame:timestamp:", v89, &v98);
        if (!v79)
        {

          v18 = -108;
          goto LABEL_44;
        }
        v80 = self->_faceTrackers;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v80, "setObject:forKey:", v79, v81);

      }
      ++v31;
      v29 = v96;
      if (v31 == v30)
      {
        v30 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
        if (v30)
          goto LABEL_13;
        goto LABEL_42;
      }
    }

    v35 = 0;
LABEL_32:
    if (objc_msgSend(v28, "count", v85))
    {
      objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setTrackID:", objc_msgSend(v75, "intValue"));

      objc_msgSend(v28, "removeObjectAtIndex:", 0);
    }
    else
    {
      ++self->_latestTrackID;
      objc_msgSend(v32, "setTrackID:");
      v76 = self->_keyFaces;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v32, "trackID"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v76, "setObject:forKey:", v32, v77);

      if ((unint64_t)-[NSMutableDictionary count](self->_keyFaces, "count") >= 0x1F)
        -[VCPVideoFullFaceDetector removeSmallestKeyFace](self, "removeSmallestKeyFace");
    }
    goto LABEL_36;
  }
LABEL_42:

  v18 = 0;
  v83 = *(_OWORD *)&a4->var0;
  *((_QWORD *)v85 + 2) = a4->var3;
  *(_OWORD *)v85 = v83;
LABEL_44:

LABEL_45:
  return v18;
}

void __90__VCPVideoFullFaceDetector_detectTrackFacesInFrame_withTimestamp_faces_torsos_frameStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  VCPFace *v7;
  CMTime v8;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CGRect v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "trackObjectInFrame:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "objectBounds");
  if (CGRectIsEmpty(v12))
    goto LABEL_6;
  if (v6)
    objc_msgSend(v6, "start");
  else
    memset(&v8, 0, sizeof(v8));
  lhs = *(CMTime *)(a1 + 56);
  rhs = v8;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) > 5.0)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5, *(_OWORD *)&v8.value, v8.epoch);
  }
  else
  {
    v7 = objc_alloc_init(VCPFace);
    objc_msgSend(v6, "objectBounds");
    -[VCPFace setBounds:](v7, "setBounds:");
    -[VCPFace setTrackID:](v7, "setTrackID:", objc_msgSend(v5, "intValue"));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
}

uint64_t __90__VCPVideoFullFaceDetector_detectTrackFacesInFrame_withTimestamp_faces_torsos_frameStats___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  float v14;
  uint64_t v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "bounds");
  v7 = v6;
  objc_msgSend(v4, "bounds");
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;
  objc_msgSend(v5, "bounds");
  v12 = v7 * v9;
  v14 = v11 * v13;
  if (v12 < v14)
    v15 = -1;
  else
    v15 = v12 > v14;

  return v15;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  int v12;
  void *v13;
  double Seconds;
  float v15;
  double v16;
  NSMutableArray *frameFaceResults;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  float v24;
  double v25;
  float v26;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  int angle;
  BOOL v30;
  int v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  uint64_t v40;
  double width;
  double height;
  NSMutableDictionary *activeFaces;
  void *v44;
  void *v45;
  float v46;
  NSMutableDictionary *faceTrackers;
  void *v48;
  void *v49;
  VCPFaceDetectionRange *v50;
  NSMutableDictionary *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  CGFloat x;
  double y;
  double v57;
  double v58;
  void *v59;
  void *v60;
  NSMutableArray *v61;
  void *v62;
  void *v63;
  void *context;
  void *v66;
  void *v67;
  int v68;
  id v69;
  CMTime *v70;
  id obj;
  unint64_t *v72;
  size_t v73;
  size_t v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  CMTime *v78;
  __int128 v79;
  CMTimeEpoch epoch;
  CMTime v81;
  CMTime v82;
  __int128 v83;
  CMTimeEpoch v84;
  CMTime v85;
  CMTime v86;
  CMTime v87;
  CMTime v88;
  _QWORD v89[3];
  __int128 v90;
  uint64_t v91;
  CGRect lhs;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  CMTimeRange v97;
  CMTime duration;
  CMTime start;
  CMTimeRange v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  int64_t var3;
  CMTime v107;
  CMTime time;
  CMTime v109;
  CMTime rhs;
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[3];
  _QWORD v114[3];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v69 = a6;
  if (!self->super._results)
  {
    v78 = (CMTime *)a4;
    v70 = (CMTime *)a5;
    v72 = a7;
    if (CVPixelBufferGetPixelFormatType(a3) != 875704438 && CVPixelBufferGetPixelFormatType(a3) != 875704422)
    {
      v12 = -50;
      goto LABEL_3;
    }
    objc_msgSend(v69, "detectedFaces");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    objc_msgSend(v69, "setFrameProcessedByFaceDetector:", 0);
    lhs.origin = *(CGPoint *)&a4->var0;
    *(_QWORD *)&lhs.size.width = a4->var3;
    rhs = *(CMTime *)(&self->_latestFrameArea + 1);
    CMTimeSubtract(&time, (CMTime *)&lhs, &rhs);
    if (CMTimeGetSeconds(&time) < 0.0599999987)
    {
      lhs.origin = *(CGPoint *)&a4->var0;
      *(_QWORD *)&lhs.size.width = a4->var3;
      rhs = *(CMTime *)(&self->super._angle + 1);
      CMTimeSubtract(&v107, (CMTime *)&lhs, &rhs);
      Seconds = CMTimeGetSeconds(&v107);
      -[VCPVideoFullFaceDetector minProcessTimeIntervalInSecs](self, "minProcessTimeIntervalInSecs");
      v16 = v15;
      if (Seconds < v16)
      {
        *(float *)&v16 = self->_latestFrameArea;
        objc_msgSend(v69, "setFaceArea:", v16);
        v68 = 0;
        goto LABEL_66;
      }
    }
    frameFaceResults = self->_frameFaceResults;
    if (frameFaceResults)
      frameFaceResults = (NSMutableArray *)-[NSMutableArray removeAllObjects](frameFaceResults, "removeAllObjects");
    context = (void *)MEMORY[0x1BCCA1B2C](frameFaceResults);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    v105 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v66 = (void *)v18;
    v68 = -[VCPVideoFullFaceDetector detectTrackFacesInFrame:withTimestamp:faces:torsos:frameStats:](self, "detectTrackFacesInFrame:withTimestamp:faces:torsos:frameStats:", a3, &v105, v67);
    if (!v68)
    {
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v19 = v66;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v102 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
            start = *v78;
            -[VCPVideoFullFaceDetector minProcessTimeIntervalInSecs](self, "minProcessTimeIntervalInSecs");
            CMTimeMake(&duration, (uint64_t)(float)(v24 * 1000.0), 1000);
            CMTimeRangeMake(&v100, &start, &duration);
            v97 = v100;
            objc_msgSend(v23, "setTimerange:", &v97);
            -[NSMutableArray addObject:](self->_allTorsos, "addObject:", v23);
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
        }
        while (v20);
      }

      v26 = 0.0;
      if (v67 && objc_msgSend(v67, "count"))
      {
        WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        angle = self->super._angle;
        if (angle)
          v30 = angle == 180;
        else
          v30 = 1;
        v31 = v30;
        v76 = v31;
        *v72 |= 0x20uLL;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        obj = v67;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v115, 16);
        if (v32)
        {
          v73 = HeightOfPlane;
          v74 = WidthOfPlane;
          v75 = *(_QWORD *)v94;
          do
          {
            v77 = v32;
            for (j = 0; j != v77; ++j)
            {
              if (*(_QWORD *)v94 != v75)
                objc_enumerationMutation(obj);
              v34 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
              v35 = objc_msgSend(v34, "flagsForOrientation:width:height:", v76, v74, v73);
              v89[1] = 0;
              v89[2] = 0;
              memset(&lhs, 0, sizeof(lhs));
              v89[0] = 0x3FF0000000000000;
              v90 = xmmword_1B6FBCA30;
              v91 = 0x3FF0000000000000;
              objc_msgSend(v34, "faceBoundsWithTransform:height:transform:", v74, v73, v89);
              lhs.origin.x = v36;
              lhs.origin.y = v37;
              lhs.size.width = v38;
              lhs.size.height = v39;
              v40 = MediaAnalysisFacePosition(&lhs);
              width = lhs.size.width;
              height = lhs.size.height;
              activeFaces = self->super._activeFaces;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v34, "trackID"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](activeFaces, "objectForKey:", v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v34, "confidence");
              if (v46 <= 0.4)
              {
                faceTrackers = self->_faceTrackers;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v34, "trackID"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](faceTrackers, "objectForKeyedSubscript:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v49)
                  goto LABEL_60;
                objc_msgSend(v49, "start");
                rhs = *v78;
                v109 = v87;
                CMTimeSubtract(&v88, &rhs, &v109);
                if (CMTimeGetSeconds(&v88) >= 1.0)
                  goto LABEL_60;

              }
              if (v45
                && (objc_msgSend(v45, "last"),
                    objc_msgSend(v45, "start"),
                    rhs = v87,
                    v109 = v85,
                    CMTimeSubtract(&v86, &rhs, &v109),
                    CMTimeGetSeconds(&v86) <= 1.0))
              {
                v79 = *(_OWORD *)&v78->value;
                epoch = v78->epoch;
                objc_msgSend(v45, "setLast:", &v79);
                objc_msgSend(v45, "setFlags:", objc_msgSend(v45, "flags") | v35);
                objc_msgSend(v45, "setPosition:", objc_msgSend(v45, "position") | v40);
              }
              else
              {
                v50 = objc_alloc_init(VCPFaceDetectionRange);
                v83 = *(_OWORD *)&v78->value;
                v84 = v78->epoch;
                -[VCPFaceDetectionRange setStart:](v50, "setStart:", &v83);
                rhs = *v78;
                v109 = *v70;
                CMTimeAdd(&v82, &rhs, &v109);
                v81 = v82;
                -[VCPFaceDetectionRange setLast:](v50, "setLast:", &v81);
                -[VCPFaceDetectionRange setFlags:](v50, "setFlags:", v35);
                -[VCPFaceDetectionRange setBounds:](v50, "setBounds:", lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height);
                objc_msgSend(v34, "torsoBounds");
                -[VCPFaceDetectionRange setTorsoBounds:](v50, "setTorsoBounds:");
                -[VCPFaceDetectionRange setPosition:](v50, "setPosition:", v40);
                -[VCPFaceDetectionRange setFaceID:](v50, "setFaceID:", (int)objc_msgSend(v34, "trackID"));
                v51 = self->super._activeFaces;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v34, "trackID"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKey:](v51, "setObject:forKey:", v50, v52);

                -[NSMutableArray addObject:](self->_allFaces, "addObject:", v50);
              }
              *v72 |= v35;
              if (self->_frameFaceResults)
              {
                v113[0] = CFSTR("facePosition");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
                v53 = objc_claimAutoreleasedReturnValue();
                v54 = (void *)v53;
                if (lhs.origin.x < 1.0)
                  x = lhs.origin.x;
                else
                  x = 1.0;
                if (lhs.origin.x <= 0.0)
                  x = 0.0;
                if (lhs.origin.y < 1.0)
                  y = lhs.origin.y;
                else
                  y = 1.0;
                if (lhs.origin.y <= 0.0)
                  y = 0.0;
                v57 = 1.0 - lhs.origin.x;
                if (lhs.size.width < 1.0 - lhs.origin.x)
                  v57 = lhs.size.width;
                v114[0] = v53;
                v113[1] = CFSTR("faceBounds");
                if (lhs.size.width <= 0.0)
                  v57 = 0.0;
                v58 = 1.0 - lhs.origin.y;
                if (lhs.size.height < 1.0 - lhs.origin.y)
                  v58 = lhs.size.height;
                if (lhs.size.height <= 0.0)
                  v58 = 0.0;
                NSStringFromRect(*(NSRect *)&x);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v114[1] = v59;
                v113[2] = CFSTR("facePoseYaw");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v34, "yaw"));
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v114[2] = v60;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 3);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                v61 = self->_frameFaceResults;
                v111[0] = CFSTR("flags");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v111[1] = CFSTR("attributes");
                v112[0] = v62;
                v112[1] = v49;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](v61, "addObject:", v63);

LABEL_60:
              }

              v26 = v26 + width * height;
            }
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v115, 16);
          }
          while (v32);
        }

      }
      *(float *)&v25 = v26;
      objc_msgSend(v69, "setFaceArea:", v25);
      self->_latestFrameArea = v26;
    }

    objc_autoreleasePoolPop(context);
    goto LABEL_66;
  }
  v12 = -18;
LABEL_3:
  v68 = v12;
LABEL_66:

  return v68;
}

- (id)frameFaceResults
{
  NSMutableArray *frameFaceResults;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  frameFaceResults = self->_frameFaceResults;
  v4 = CFSTR("FaceResults");
  v5[0] = frameFaceResults;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)clusterFaces
{
  NSMutableDictionary *keyFaces;
  uint64_t v4;
  NSArray *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSMutableArray *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  GDVUStreamingGallery *gallery;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  NSMutableDictionary *facePrints;
  void *v43;
  id v44;
  double v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t mm;
  void *v59;
  uint64_t v60;
  NSMutableDictionary *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  NSMutableDictionary *v67;
  void *v68;
  void *v69;
  id v70;
  int v71;
  id v72;
  uint64_t v73;
  int v74;
  GDVUStreamingGallery *v75;
  uint64_t v76;
  id v78;
  uint64_t v79;
  char v80;
  int v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t n;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  void *v98;
  void *v99;
  void *v100;
  BOOL v101;
  NSMutableDictionary *v102;
  void *v103;
  NSMutableArray *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t ii;
  void *v108;
  uint64_t v109;
  NSMutableArray *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t jj;
  void *v114;
  int v115;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id obj;
  id v123;
  id v124;
  uint64_t v125;
  void *v126;
  id v127;
  void *v128;
  void *context;
  id v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t kk;
  uint64_t v141;
  void *v142;
  id v143;
  NSMutableArray *v144;
  void *v145;
  uint64_t v146;
  VCPVideoFullFaceDetector *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  id v186;
  id v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _QWORD v196[7];
  uint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  int v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t v203;
  uint64_t (*v204)(uint64_t, uint64_t);
  void (*v205)(uint64_t);
  id v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t v214;
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  uint8_t v225[128];
  __int128 buf;
  VCPProtoTimeRange *(*v227)(uint64_t);
  void *v228;
  uint64_t *v229;
  uint64_t v230;

  v230 = *MEMORY[0x1E0C80C00];
  v207 = 0;
  v208 = &v207;
  v209 = 0x2020000000;
  v210 = 0;
  v201 = 0;
  v202 = &v201;
  v203 = 0x3032000000;
  v204 = __Block_byref_object_copy__1;
  v205 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v206 = (id)objc_claimAutoreleasedReturnValue();
  v197 = 0;
  v198 = &v197;
  v199 = 0x2020000000;
  v200 = 0;
  keyFaces = self->_keyFaces;
  v4 = MEMORY[0x1E0C809B0];
  v196[0] = MEMORY[0x1E0C809B0];
  v196[1] = 3221225472;
  v196[2] = __40__VCPVideoFullFaceDetector_clusterFaces__block_invoke;
  v196[3] = &unk_1E6B15718;
  v196[4] = &v197;
  v196[5] = &v201;
  v196[6] = &v207;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](keyFaces, "enumerateKeysAndObjectsUsingBlock:", v196);
  v194 = 0u;
  v195 = 0u;
  v192 = 0u;
  v193 = 0u;
  v147 = self;
  v5 = self->_existingFaceprints;
  v6 = 0;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v192, v225, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v193;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v193 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("faceId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "intValue");
        if (v12 > v6)
          v6 = v12;

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v192, v225, 16);
    }
    while (v7);
  }

  v139 = (v6 + 1);
  if ((unint64_t)-[NSMutableDictionary count](v147->_keyFaces, "count") < 2)
  {
    if (-[NSMutableDictionary count](v147->_keyFaces, "count") == 1)
    {
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v34 = v147->_allFaces;
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v148, v215, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v149;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v149 != v36)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * j), "setFaceID:", (int)v139);
          }
          v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v148, v215, 16);
        }
        while (v35);
      }

      objc_msgSend((id)v202[5], "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        objc_msgSend(v38, "faceprint");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40 == 0;

        if (!v41)
        {
          facePrints = v147->_facePrints;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v139);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](facePrints, "setObject:forKey:", v39, v43);

        }
      }

    }
    goto LABEL_156;
  }
  context = (void *)MEMORY[0x1BCCA1B2C]();
  if (_os_feature_enabled_impl())
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VideoFullFaceDetector - use VU for in-asset face clustering", (uint8_t *)&buf, 2u);
    }
    v13 = *((_DWORD *)v198 + 6);
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    v191 = 0u;
    v14 = v147->_allTorsos;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v188, v224, 16);
    if (v15)
    {
      v16 = v13 + 1;
      v17 = *(_QWORD *)v189;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v189 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * k);
          objc_msgSend(v19, "torsoprint");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (!v21)
          {
            v22 = objc_alloc_init(MEMORY[0x1E0CEDEE0]);
            objc_msgSend(v19, "torsoprint");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setTorsoprint:", v23);

            objc_msgSend(v22, "setFaceId:", v16);
            objc_msgSend(v19, "setHumanID:", objc_msgSend(v22, "faceId"));
            objc_msgSend((id)v202[5], "addObject:", v22);

            ++v16;
          }
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v188, v224, 16);
      }
      while (v15);
    }

    v211 = 0;
    v212 = &v211;
    v213 = 0x2050000000;
    v24 = (void *)getGDVUContextClass(void)::softClass;
    v214 = getGDVUContextClass(void)::softClass;
    if (!getGDVUContextClass(void)::softClass)
    {
      *(_QWORD *)&buf = v4;
      *((_QWORD *)&buf + 1) = 3221225472;
      v227 = ___ZL19getGDVUContextClassv_block_invoke;
      v228 = &unk_1E6B15540;
      v229 = &v211;
      ___ZL19getGDVUContextClassv_block_invoke((uint64_t)&buf);
      v24 = (void *)v212[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v211, 8);
    v130 = objc_alloc_init(v25);
    v26 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v130, "setMoment:", v26);

    gallery = v147->_gallery;
    v28 = v202[5];
    v187 = 0;
    -[GDVUStreamingGallery addWithObservations:observationIdentifiers:trackIdentifiers:context:error:](gallery, "addWithObservations:observationIdentifiers:trackIdentifiers:context:error:", v28, 0, 0, v130, &v187);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v187;
    v143 = v29;
    v30 = objc_msgSend(v29, "count");
    if (v30 == objc_msgSend((id)v202[5], "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      for (m = 0; m < (int)objc_msgSend((id)v202[5], "count"); ++m)
      {
        objc_msgSend((id)v202[5], "objectAtIndexedSubscript:", m);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "objectAtIndexedSubscript:", m);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "setObject:forKeyedSubscript:", v32, v33);

      }
      v75 = v147->_gallery;
      v186 = 0;
      -[GDVUStreamingGallery updateWithMaxKeyFacesPerCluster:sortBy:error:](v75, "updateWithMaxKeyFacesPerCluster:sortBy:error:", 1, &unk_1E6B76188, &v186);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v186;
      v76 = objc_msgSend(v126, "count");
      if (v76 == objc_msgSend((id)v202[5], "count") && v127 == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v184 = 0u;
        v185 = 0u;
        v182 = 0u;
        v183 = 0u;
        v83 = v126;
        v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v182, v223, 16);
        v133 = v83;
        if (v84)
        {
          v85 = *(_QWORD *)v183;
          do
          {
            for (n = 0; n != v84; ++n)
            {
              if (*(_QWORD *)v183 != v85)
                objc_enumerationMutation(v83);
              objc_msgSend(*(id *)(*((_QWORD *)&v182 + 1) + 8 * n), "entityIdentifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "stringValue");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "addObject:", v88);

            }
            v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v182, v223, 16);
          }
          while (v84);
        }

        v180 = 0u;
        v181 = 0u;
        v178 = 0u;
        v179 = 0u;
        v124 = v82;
        v89 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v178, v222, 16);
        if (v89)
        {
          v119 = v89;
          v90 = *(_QWORD *)v179;
          v117 = *(_QWORD *)v179;
          do
          {
            v121 = 0;
            v91 = (int)v139;
            do
            {
              if (*(_QWORD *)v179 != v90)
                objc_enumerationMutation(v124);
              v142 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * v121);
              v174 = 0u;
              v175 = 0u;
              v176 = 0u;
              v177 = 0u;
              v137 = v83;
              v92 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v174, v221, 16);
              if (v92)
              {
                v141 = *(_QWORD *)v175;
                while (2)
                {
                  v93 = 0;
                  v135 = (id)v92;
                  do
                  {
                    if (*(_QWORD *)v175 != v141)
                      objc_enumerationMutation(v137);
                    v94 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v93);
                    objc_msgSend(v94, "entityIdentifier", v117);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v95, "stringValue");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    v97 = objc_msgSend(v142, "isEqualToString:", v96);

                    if ((v97 & 1) != 0)
                    {
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v94, "observationIdentifier"));
                      v98 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v145, "objectForKeyedSubscript:", v98);
                      v99 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v99)
                      {

                        v74 = 1;
                        goto LABEL_151;
                      }
                      if (objc_msgSend(v94, "isKeyFace"))
                      {
                        objc_msgSend(v99, "faceprint");
                        v100 = (void *)objc_claimAutoreleasedReturnValue();
                        v101 = v100 == 0;

                        if (v101)
                        {
                          if ((int)MediaAnalysisLogLevel() >= 4
                            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                          {
                            LOWORD(buf) = 0;
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "FullFaceDetector : cluster keyface does not contain faceprint", (uint8_t *)&buf, 2u);
                          }
                        }
                        else
                        {
                          v102 = v147->_facePrints;
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v91);
                          v103 = (void *)objc_claimAutoreleasedReturnValue();
                          -[NSMutableDictionary setObject:forKey:](v102, "setObject:forKey:", v99, v103);

                        }
                      }
                      v172 = 0u;
                      v173 = 0u;
                      v170 = 0u;
                      v171 = 0u;
                      v104 = v147->_allFaces;
                      v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v170, v220, 16);
                      if (v105)
                      {
                        v106 = *(_QWORD *)v171;
                        do
                        {
                          for (ii = 0; ii != v105; ++ii)
                          {
                            if (*(_QWORD *)v171 != v106)
                              objc_enumerationMutation(v104);
                            v108 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * ii);
                            v109 = objc_msgSend(v108, "faceID");
                            if (v109 == objc_msgSend(v99, "faceId"))
                              objc_msgSend(v108, "setFaceID:", v91);
                          }
                          v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v104, "countByEnumeratingWithState:objects:count:", &v170, v220, 16);
                        }
                        while (v105);
                      }

                      v168 = 0u;
                      v169 = 0u;
                      v166 = 0u;
                      v167 = 0u;
                      v110 = v147->_allTorsos;
                      v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v166, v219, 16);
                      if (v111)
                      {
                        v112 = *(_QWORD *)v167;
                        do
                        {
                          for (jj = 0; jj != v111; ++jj)
                          {
                            if (*(_QWORD *)v167 != v112)
                              objc_enumerationMutation(v110);
                            v114 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * jj);
                            v115 = objc_msgSend(v114, "humanID");
                            if (objc_msgSend(v99, "faceId") == v115)
                              objc_msgSend(v114, "setHumanID:", v91);
                          }
                          v111 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v110, "countByEnumeratingWithState:objects:count:", &v166, v219, 16);
                        }
                        while (v111);
                      }

                      v83 = v133;
                      v92 = (uint64_t)v135;

                    }
                    ++v93;
                  }
                  while (v93 != v92);
                  v92 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v174, v221, 16);
                  if (v92)
                    continue;
                  break;
                }
              }

              ++v91;
              ++v121;
              v90 = v117;
            }
            while (v121 != v119);
            v74 = 0;
            LODWORD(v139) = v91;
            v119 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v178, v222, 16);
          }
          while (v119);
        }
        else
        {
          v74 = 0;
        }
LABEL_151:

      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v127, "description");
          v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v79 = objc_msgSend(v78, "UTF8String");
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v79;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Gallery failed to cluster %s", (uint8_t *)&buf, 0xCu);

        }
        v74 = 1;
      }

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v127, "description");
        v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v73 = objc_msgSend(v72, "UTF8String");
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = v73;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Gallery failed to add observation %s", (uint8_t *)&buf, 0xCu);

      }
      v74 = 1;
    }

    v81 = -18;
    if (v74)
      goto LABEL_154;
    goto LABEL_148;
  }
  if (v208[3])
  {
    v44 = objc_alloc(MEMORY[0x1E0CEDDF8]);
    LODWORD(v45) = 1049750405;
    v46 = objc_msgSend(v44, "initWithType:cachePath:state:threshold:requestRevision:", *MEMORY[0x1E0CEE280], CFSTR("/tmp/"), 0, v208[3], v45);
    v165 = 0;
    v131 = (void *)v46;
    objc_msgSend(MEMORY[0x1E0CEDDF0], "clustererBuilderWithOptions:error:", v46, &v165);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v165;
    v49 = v48;
    v132 = v47;
    if (v47)
    {
      v50 = v202[5];
      v164 = v48;
      objc_msgSend(v47, "vcp_updateModelByAddingFaces:error:", v50, &v164);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v164;

      if (v128)
      {
        v162 = 0u;
        v163 = 0u;
        v160 = 0u;
        v161 = 0u;
        obj = v128;
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v218, 16);
        if (v51)
        {
          v120 = *(_QWORD *)v161;
          v52 = v6 + 1;
          do
          {
            v125 = 0;
            v146 = v52;
            v118 = v51;
            do
            {
              if (*(_QWORD *)v161 != v120)
                objc_enumerationMutation(obj);
              v53 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v125);
              v156 = 0u;
              v157 = 0u;
              v158 = 0u;
              v159 = 0u;
              objc_msgSend(v53, "objects");
              v134 = (id)objc_claimAutoreleasedReturnValue();
              v138 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v156, v217, 16);
              if (v138)
              {
                v136 = *(id *)v157;
                do
                {
                  for (kk = 0; kk != v138; ++kk)
                  {
                    if (*(id *)v157 != v136)
                      objc_enumerationMutation(v134);
                    v54 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * kk);
                    v152 = 0u;
                    v153 = 0u;
                    v154 = 0u;
                    v155 = 0u;
                    v144 = v147->_allFaces;
                    v55 = 0;
                    v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v144, "countByEnumeratingWithState:objects:count:", &v152, v216, 16);
                    if (v56)
                    {
                      v57 = *(_QWORD *)v153;
                      do
                      {
                        for (mm = 0; mm != v56; ++mm)
                        {
                          if (*(_QWORD *)v153 != v57)
                            objc_enumerationMutation(v144);
                          v59 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * mm);
                          v60 = objc_msgSend(v59, "faceID");
                          if (v60 == (int)objc_msgSend(v54, "intValue"))
                          {
                            v61 = v147->_keyFaces;
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v59, "faceID"));
                            v62 = (void *)objc_claimAutoreleasedReturnValue();
                            -[NSMutableDictionary objectForKeyedSubscript:](v61, "objectForKeyedSubscript:", v62);
                            v63 = (void *)objc_claimAutoreleasedReturnValue();

                            if (!v55
                              || -[VCPVideoFullFaceDetector compareFace:withFace:](v147, "compareFace:withFace:", v55, v63))
                            {
                              objc_msgSend(v63, "observation");
                              v64 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v64, "faceprint");
                              v65 = (void *)objc_claimAutoreleasedReturnValue();
                              v66 = v65 == 0;

                              if (!v66)
                              {
                                v67 = v147->_facePrints;
                                objc_msgSend(v63, "observation");
                                v68 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v146);
                                v69 = (void *)objc_claimAutoreleasedReturnValue();
                                -[NSMutableDictionary setObject:forKey:](v67, "setObject:forKey:", v68, v69);

                                v70 = v63;
                                v55 = v70;
                              }
                            }
                            objc_msgSend(v59, "setFaceID:", v146);

                          }
                        }
                        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v144, "countByEnumeratingWithState:objects:count:", &v152, v216, 16);
                      }
                      while (v56);
                    }

                  }
                  v138 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v156, v217, 16);
                }
                while (v138);
              }

              ++v146;
              ++v125;
            }
            while (v125 != v118);
            v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v218, 16);
            v52 = v146;
          }
          while (v51);
        }

        v71 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v123;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to cluster faces - %@", (uint8_t *)&buf, 0xCu);
        }
        v71 = 1;
      }

      v81 = -18;
      v49 = v123;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v49;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create Vision clusterer - %@", (uint8_t *)&buf, 0xCu);
      }
      v81 = -108;
      v71 = 1;
    }

    if (v71)
    {
LABEL_154:
      v80 = 0;
      goto LABEL_155;
    }
LABEL_148:
    v80 = 1;
    goto LABEL_155;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to retrieve faceprint revision from key faces", (uint8_t *)&buf, 2u);
  }
  v80 = 0;
  v81 = -18;
LABEL_155:
  objc_autoreleasePoolPop(context);
  if ((v80 & 1) != 0)
LABEL_156:
    v81 = 0;
  _Block_object_dispose(&v197, 8);
  _Block_object_dispose(&v201, 8);

  _Block_object_dispose(&v207, 8);
  return v81;
}

void __40__VCPVideoFullFaceDetector_clusterFaces__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  objc_msgSend(v5, "observation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v18, "intValue");
    objc_msgSend(v5, "observation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFaceId:", v7);

    v9 = *(_QWORD *)(a1[4] + 8);
    v10 = objc_msgSend(v18, "intValue");
    v11 = *(_DWORD *)(v9 + 24);
    if (v11 <= v10)
      v11 = v10;
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v11;
    v12 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    objc_msgSend(v5, "observation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    objc_msgSend(v5, "observation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "faceprint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v5, "observation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "faceprint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v17, "requestRevision");

    }
  }

}

- (int)updateWithExistingFaces
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSMutableDictionary *facePrints;
  uint64_t v14;
  id v15;
  int v16;
  void *v18;
  NSArray *obj;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_existingFaceprints;
  v2 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v32 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributes"), v18);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("faceId"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attributes"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("facePrint"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          v10 = v9 == 0;
        else
          v10 = 1;
        if (v10)
          goto LABEL_17;
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, 0);
        objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("facePrint"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {

LABEL_17:
          v16 = -18;
          goto LABEL_18;
        }
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, v7);

      }
      v2 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v2)
        continue;
      break;
    }
  }

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  facePrints = self->_facePrints;
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke;
  v23[3] = &unk_1E6B15768;
  v24 = v21;
  v26 = &v27;
  v15 = v18;
  v25 = v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](facePrints, "enumerateKeysAndObjectsUsingBlock:", v23);
  v16 = *((_DWORD *)v28 + 6);
  if (!v16)
  {
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_3;
    v22[3] = &unk_1E6B15790;
    v22[4] = self;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v22);
  }

  _Block_object_dispose(&v27, 8);
LABEL_18:

  return v16;
}

void __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, _BYTE *);
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  uint64_t v26;
  int v27;

  v5 = a2;
  v6 = a3;
  v24 = 0;
  v25 = (float *)&v24;
  v26 = 0x2020000000;
  v27 = 1065353216;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v6, "faceprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_2;
    v15 = &unk_1E6B15740;
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 48);
    v16 = v9;
    v17 = v10;
    v18 = &v24;
    v19 = &v20;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v12);
    if (v21[3] >= 1 && v25[6] < 0.285)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v5);

    }
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  float v10;
  int v11;
  id v12;

  v12 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "faceprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeDistance:withDistanceFunction:error:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    if (v10 < *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v9, "floatValue");
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v12, "integerValue");
    }
  }
  else
  {
    *a4 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -18;
  }

}

void __51__VCPVideoFullFaceDetector_updateWithExistingFaces__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObjectForKey:", v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "faceID", (_QWORD)v13);
        if (v12 == (int)objc_msgSend(v5, "intValue"))
          objc_msgSend(v11, "setFaceID:", (int)objc_msgSend(v6, "intValue"));
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (int)finishAnalysisPass:(id *)a3
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  CFDictionaryRef v38;
  CFDictionaryRef v39;
  void *v40;
  void *v41;
  NSMutableDictionary *faceRanges;
  void *v43;
  void *v44;
  NSMutableDictionary *v45;
  void *v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  __int128 v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  CFDictionaryRef v66;
  CFDictionaryRef v67;
  void *v68;
  void *v69;
  NSMutableDictionary *facePrints;
  id v71;
  uint64_t v72;
  NSDictionary *results;
  NSMutableArray *obj;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v81;
  VCPVideoFullFaceDetector *v82;
  _QWORD v83[4];
  id v84;
  CMTimeRange *p_time;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange time;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CMTime v93;
  __int128 v94;
  CMTimeEpoch v95;
  CMTime v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  CMTime rhs;
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _BYTE v106[128];
  _QWORD v107[4];
  _QWORD v108[4];
  _BYTE v109[128];
  uint64_t v110;
  CGRect v111;

  v110 = *MEMORY[0x1E0C80C00];
  if (self->super._results)
    return -18;
  v3 = -[VCPVideoFullFaceDetector clusterFaces](self, "clusterFaces");
  if (!v3
    && (!-[NSArray count](self->_existingFaceprints, "count")
     || !-[NSMutableDictionary count](self->_facePrints, "count")
     || (v3 = -[VCPVideoFullFaceDetector updateWithExistingFaces](self, "updateWithExistingFaces")) == 0))
  {
    v82 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    obj = self->_allFaces;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
    if (v5)
    {
      v78 = *(_QWORD *)v98;
      do
      {
        v6 = v5;
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v98 != v78)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          memset(&v96, 0, sizeof(v96));
          if (v8)
          {
            objc_msgSend(v8, "start");
            v94 = 0uLL;
            v95 = 0;
            objc_msgSend(v8, "last");
          }
          else
          {
            v94 = 0uLL;
            v95 = 0;
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "position"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("facePosition"));

          objc_msgSend(v8, "bounds");
          if (v11 < 1.0)
            v15 = v11;
          else
            v15 = 1.0;
          if (v11 <= 0.0)
            v15 = 0.0;
          if (v12 < 1.0)
            v16 = v12;
          else
            v16 = 1.0;
          if (v12 <= 0.0)
            v16 = 0.0;
          v17 = 1.0 - v11;
          if (v13 < v17)
            v17 = v13;
          if (v13 <= 0.0)
            v18 = 0.0;
          else
            v18 = v17;
          v19 = 1.0 - v12;
          if (v14 < 1.0 - v12)
            v19 = v14;
          if (v14 <= 0.0)
            v20 = 0.0;
          else
            v20 = v19;
          v21 = v15;
          v22 = v16;
          NSStringFromRect(*(NSRect *)(&v18 - 2));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("faceBounds"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "faceID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v24, CFSTR("faceId"));

          objc_msgSend(v8, "torsoBounds");
          if (!CGRectIsEmpty(v111))
          {
            objc_msgSend(v8, "torsoBounds");
            if (v25 < 1.0)
              v29 = v25;
            else
              v29 = 1.0;
            if (v25 <= 0.0)
              v29 = 0.0;
            if (v26 < 1.0)
              v30 = v26;
            else
              v30 = 1.0;
            if (v26 <= 0.0)
              v30 = 0.0;
            v31 = 1.0 - v25;
            if (v27 < v31)
              v31 = v27;
            if (v27 <= 0.0)
              v32 = 0.0;
            else
              v32 = v31;
            v33 = 1.0 - v26;
            if (v28 < 1.0 - v26)
              v33 = v28;
            if (v28 <= 0.0)
              v34 = 0.0;
            else
              v34 = v33;
            v35 = v29;
            v36 = v30;
            NSStringFromRect(*(NSRect *)(&v32 - 2));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v37, CFSTR("humanBounds"));

          }
          v107[0] = CFSTR("start");
          time.start = v96;
          v38 = CMTimeCopyAsDictionary(&time.start, 0);
          v108[0] = v38;
          v107[1] = CFSTR("duration");
          *(_OWORD *)&time.start.value = v94;
          time.start.epoch = v95;
          rhs = v96;
          CMTimeSubtract(&v93, &time.start, &rhs);
          time.start = v93;
          v39 = CMTimeCopyAsDictionary(&time.start, 0);
          v108[1] = v39;
          v107[2] = CFSTR("flags");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "flags"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v107[3] = CFSTR("attributes");
          v108[2] = v40;
          v108[3] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v41);

          faceRanges = v82->_faceRanges;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "faceID"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](faceRanges, "objectForKeyedSubscript:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v44, "addObject:", v8);
          v45 = v82->_faceRanges;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "faceID"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v45, "setObject:forKey:", v44, v46);

        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
      }
      while (v5);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v76 = v82->_allTorsos;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
    if (v47)
    {
      v77 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v90 != v77)
            objc_enumerationMutation(v76);
          v49 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
          memset(&time, 0, sizeof(time));
          if (v49)
            objc_msgSend(v49, "timerange");
          else
            memset(&range, 0, sizeof(range));
          v50 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&otherRange.start.epoch = v50;
          *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
          CMTimeRangeGetIntersection(&time, &range, &otherRange);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "bounds");
          if (v52 < 1.0)
            v56 = v52;
          else
            v56 = 1.0;
          if (v52 <= 0.0)
            v56 = 0.0;
          if (v53 < 1.0)
            v57 = v53;
          else
            v57 = 1.0;
          if (v53 <= 0.0)
            v57 = 0.0;
          v58 = 1.0 - v52;
          if (v54 < v58)
            v58 = v54;
          if (v54 <= 0.0)
            v59 = 0.0;
          else
            v59 = v58;
          v60 = 1.0 - v53;
          if (v55 < 1.0 - v53)
            v60 = v55;
          if (v55 <= 0.0)
            v61 = 0.0;
          else
            v61 = v60;
          v62 = v56;
          v63 = v57;
          NSStringFromRect(*(NSRect *)(&v59 - 2));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v64, CFSTR("humanBounds"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v49, "humanID"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setObject:forKeyedSubscript:", v65, CFSTR("faceId"));

          v104[0] = CFSTR("start");
          rhs = time.start;
          v66 = CMTimeCopyAsDictionary(&rhs, 0);
          v105[0] = v66;
          v104[1] = CFSTR("duration");
          rhs = time.duration;
          v67 = CMTimeCopyAsDictionary(&rhs, 0);
          v104[2] = CFSTR("attributes");
          v105[1] = v67;
          v105[2] = v51;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "addObject:", v68);

        }
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
      }
      while (v47);
    }

    time.start.value = 0;
    *(_QWORD *)&time.start.timescale = &time;
    time.start.epoch = 0x2020000000;
    LODWORD(time.duration.value) = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    facePrints = v82->_facePrints;
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __47__VCPVideoFullFaceDetector_finishAnalysisPass___block_invoke;
    v83[3] = &unk_1E6B157B8;
    p_time = &time;
    v71 = v69;
    v84 = v71;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](facePrints, "enumerateKeysAndObjectsUsingBlock:", v83);
    v3 = *(_DWORD *)(*(_QWORD *)&time.start.timescale + 24);
    if (!v3)
    {
      v102[0] = CFSTR("FaceResults");
      v102[1] = CFSTR("FacePrintResults");
      v103[0] = v81;
      v103[1] = v71;
      v102[2] = CFSTR("TorsoResults");
      v103[2] = v79;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3);
      v72 = objc_claimAutoreleasedReturnValue();
      results = v82->super._results;
      v82->super._results = (NSDictionary *)v72;

      v3 = *(_DWORD *)(*(_QWORD *)&time.start.timescale + 24);
    }

    _Block_object_dispose(&time, 8);
  }
  return v3;
}

void __47__VCPVideoFullFaceDetector_finishAnalysisPass___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v8, "faceprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v8, "faceprint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v11, CFSTR("facePrint"));

    objc_msgSend(v10, "encodedData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("faceId"));
      objc_msgSend(v10, "encodedData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("facePrint"));

      objc_msgSend(v8, "torsoprint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
        objc_msgSend(v8, "torsoprint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "encodeObject:forKey:", v17, CFSTR("torsoPrint"));

        objc_msgSend(v16, "encodedData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v16, "encodedData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("torsoPrint"));

        }
        else
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -18;
          *a4 = 1;
        }

      }
      v20 = *(void **)(a1 + 32);
      v22 = CFSTR("attributes");
      v23[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v21);

    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -18;
      *a4 = 1;
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gallery, 0);
  objc_storeStrong((id *)&self->_frameFaceResults, 0);
  objc_storeStrong((id *)&self->_faceRanges, 0);
  objc_storeStrong((id *)&self->_allFaces, 0);
  objc_storeStrong((id *)&self->_torsoPrints, 0);
  objc_storeStrong((id *)&self->_facePrints, 0);
  objc_storeStrong((id *)&self->_reservedIDs, 0);
  objc_storeStrong((id *)&self->_allTorsos, 0);
  objc_storeStrong((id *)&self->_keyFaces, 0);
  objc_storeStrong((id *)&self->_faceTrackers, 0);
  objc_storeStrong((id *)&self->_existingFaceprints, 0);
  objc_storeStrong((id *)&self->_poseEstimator, 0);
  objc_storeStrong((id *)&self->_smileDetector, 0);
}

@end
