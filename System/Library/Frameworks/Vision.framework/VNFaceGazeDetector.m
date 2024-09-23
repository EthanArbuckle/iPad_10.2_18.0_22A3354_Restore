@implementation VNFaceGazeDetector

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  int v7;
  int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t context;
  uint64_t plan;
  shared_ptr<vision::mod::GazeFollowPredictor> *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  shared_ptr<vision::mod::CamGazePredictor> v27;
  __shared_weak_count *cntrl;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  shared_ptr<vision::mod::GazeFollowPredictor> *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  shared_ptr<vision::mod::GazeFollowPredictor> v46;
  __shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t v54;
  id v55;
  __int128 v56;
  id v57;
  void *v58;
  void *v59;
  void *__p[2];
  char v61;
  void *v62[2];
  uint64_t v63;
  shared_ptr<vision::mod::GazeFollowPredictor> v64;
  objc_super v65;
  _OWORD v66[2];

  v65.receiver = self;
  v65.super_class = (Class)VNFaceGazeDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v65, sel_completeInitializationForSession_error_, a3))
  {
    -[VNDetector boundComputeDeviceForComputeStage:error:](self, "boundComputeDeviceForComputeStage:error:", CFSTR("VNComputeStageMain"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v19 = 0;
LABEL_99:

      return v19;
    }
    v7 = +[VNEspressoHelpers espressoEngineForComputeDevice:](VNEspressoHelpers, "espressoEngineForComputeDevice:", v6);
    v8 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:](VNEspressoHelpers, "espressoStorageTypeForComputeDevice:", v6);
    v9 = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:](VNEspressoHelpers, "espressoDeviceIDForComputeDevice:", v6);
    objc_msgSend(MEMORY[0x1E0DC6C18], "camGazeV2AndReturnError:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      v19 = 0;
LABEL_98:

      goto LABEL_99;
    }
    objc_msgSend(v10, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "VisionCoreFileSystemPathAndReturnError:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_44;
    v55 = objc_retainAutorelease(v13);
    std::string::basic_string[abi:ne180100]<0>(v62, (char *)objc_msgSend(v55, "UTF8String"));
    objc_msgSend(v55, "lastPathComponent");
    v57 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v57, "UTF8String"));
    v59 = v13;
    v14 = (char *)operator new(0x168uLL);
    v15 = v14;
    *(_QWORD *)&v16 = __PAIR64__(v8, v7);
    *((_QWORD *)&v16 + 1) = v9;
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *(_OWORD *)(v14 + 24) = 0u;
    v17 = v14 + 24;
    *(_QWORD *)v14 = &off_1E453B798;
    *(_OWORD *)(v14 + 136) = 0u;
    v18 = (uint64_t *)(v14 + 136);
    *(_OWORD *)(v14 + 40) = 0u;
    *(_OWORD *)(v14 + 56) = 0u;
    *(_OWORD *)(v14 + 72) = 0u;
    *(_OWORD *)(v14 + 88) = 0u;
    *(_OWORD *)(v14 + 104) = 0u;
    *(_OWORD *)(v14 + 116) = 0u;
    *(_OWORD *)(v14 + 152) = 0u;
    *(_OWORD *)(v14 + 168) = 0u;
    *(_OWORD *)(v14 + 184) = 0u;
    *(_OWORD *)(v14 + 200) = 0u;
    *(_OWORD *)(v14 + 216) = 0u;
    *(_OWORD *)(v14 + 232) = 0u;
    *(_OWORD *)(v14 + 248) = 0u;
    *((_DWORD *)v14 + 78) = 0;
    *(_OWORD *)(v14 + 264) = 0u;
    *(_OWORD *)(v14 + 280) = 0u;
    *(_OWORD *)(v14 + 296) = 0u;
    v56 = v16;
    *((_OWORD *)v14 + 20) = v16;
    if (SHIBYTE(v63) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v14 + 14, (const std::string::value_type *)v62[0], (std::string::size_type)v62[1]);
    }
    else
    {
      *((_OWORD *)v14 + 21) = *(_OWORD *)v62;
      *((_QWORD *)v14 + 44) = v63;
    }
    *(_QWORD *)&v66[0] = v17;
    *((_QWORD *)&v66[0] + 1) = v15;
    context = espresso_create_context();
    *v18 = context;
    if (context)
    {
      plan = espresso_create_plan();
      *((_QWORD *)v15 + 18) = plan;
      if (plan)
      {
        if (!espresso_plan_add_network()
          && !espresso_plan_build()
          && !espresso_network_query_blob_dimensions()
          && !espresso_network_bind_buffer())
        {
          v23 = 0;
          v64 = (shared_ptr<vision::mod::GazeFollowPredictor>)v66[0];
          v22 = (shared_ptr<vision::mod::GazeFollowPredictor> *)v66;
          goto LABEL_19;
        }
        espresso_plan_get_error_info();
      }
    }
    v22 = &v64;
    v23 = 9823;
LABEL_19:
    v13 = v59;
    v22->__ptr_ = 0;
    v22->__cntrl_ = 0;
    v24 = (std::__shared_weak_count *)*((_QWORD *)&v66[0] + 1);
    if (*((_QWORD *)&v66[0] + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v66[0] + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v27 = (shared_ptr<vision::mod::CamGazePredictor>)v64;
    v64 = (shared_ptr<vision::mod::GazeFollowPredictor>)0;
    cntrl = self->_gazePredictor.__cntrl_;
    self->_gazePredictor = v27;
    if (cntrl)
    {
      v29 = (unint64_t *)((char *)cntrl + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v31 = (std::__shared_weak_count *)v64.__cntrl_;
    if (v64.__cntrl_)
    {
      v32 = (unint64_t *)((char *)v64.__cntrl_ + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    if (v61 < 0)
      operator delete(__p[0]);

    if (SHIBYTE(v63) < 0)
      operator delete(v62[0]);
    if (self->_gazePredictor.__ptr_)
    {
      +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", CFSTR("gazefollowingflow-u67ev5hbea_50540_fp16.espresso"), a4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (!v34)
        goto LABEL_95;
      v58 = v34;
      std::string::basic_string[abi:ne180100]<0>(v62, (char *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String"));
      std::string::basic_string[abi:ne180100]<0>(__p, "gazefollowingflow-u67ev5hbea_50540_fp16.espresso");
      v54 = v23;
      v36 = (char *)operator new(0x3A0uLL);
      v37 = v36;
      *((_QWORD *)v36 + 1) = 0;
      *((_QWORD *)v36 + 2) = 0;
      *(_QWORD *)v36 = &off_1E453B840;
      *(_OWORD *)(v36 + 24) = 0u;
      v38 = v36 + 24;
      *(_OWORD *)(v36 + 40) = 0u;
      *(_OWORD *)(v36 + 56) = 0u;
      *(_OWORD *)(v36 + 72) = 0u;
      *(_OWORD *)(v36 + 88) = 0u;
      *(_OWORD *)(v36 + 104) = 0u;
      *(_OWORD *)(v36 + 120) = 0u;
      *(_OWORD *)(v36 + 136) = 0u;
      *(_OWORD *)(v36 + 152) = 0u;
      *(_OWORD *)(v36 + 168) = 0u;
      *(_OWORD *)(v36 + 184) = 0u;
      *(_OWORD *)(v36 + 200) = 0u;
      *(_OWORD *)(v36 + 216) = 0u;
      *(_OWORD *)(v36 + 232) = 0u;
      *(_OWORD *)(v36 + 248) = 0u;
      *((_DWORD *)v36 + 90) = 0;
      *(_OWORD *)(v36 + 264) = 0u;
      *(_OWORD *)(v36 + 280) = 0u;
      *(_OWORD *)(v36 + 296) = 0u;
      *(_OWORD *)(v36 + 312) = 0u;
      *(_OWORD *)(v36 + 328) = 0u;
      *(_OWORD *)(v36 + 344) = 0u;
      *((_DWORD *)v36 + 136) = 0;
      *((_OWORD *)v36 + 32) = 0u;
      *((_OWORD *)v36 + 33) = 0u;
      *((_OWORD *)v36 + 30) = 0u;
      *((_OWORD *)v36 + 31) = 0u;
      *((_OWORD *)v36 + 28) = 0u;
      *((_OWORD *)v36 + 29) = 0u;
      *((_OWORD *)v36 + 26) = 0u;
      *((_OWORD *)v36 + 27) = 0u;
      *((_OWORD *)v36 + 24) = 0u;
      *((_OWORD *)v36 + 25) = 0u;
      *((_OWORD *)v36 + 23) = 0u;
      *(_OWORD *)(v36 + 552) = 0u;
      *(_OWORD *)(v36 + 568) = 0u;
      *(_OWORD *)(v36 + 584) = 0u;
      *(_OWORD *)(v36 + 600) = 0u;
      *(_OWORD *)(v36 + 616) = 0u;
      *(_OWORD *)(v36 + 632) = 0u;
      *(_OWORD *)(v36 + 648) = 0u;
      *(_OWORD *)(v36 + 664) = 0u;
      *(_OWORD *)(v36 + 680) = 0u;
      *(_OWORD *)(v36 + 696) = 0u;
      *((_DWORD *)v36 + 178) = 0;
      *((_DWORD *)v36 + 220) = 0;
      *((_OWORD *)v36 + 53) = 0u;
      *((_OWORD *)v36 + 54) = 0u;
      *((_OWORD *)v36 + 51) = 0u;
      *((_OWORD *)v36 + 52) = 0u;
      *((_OWORD *)v36 + 49) = 0u;
      *((_OWORD *)v36 + 50) = 0u;
      *((_OWORD *)v36 + 47) = 0u;
      *((_OWORD *)v36 + 48) = 0u;
      *((_OWORD *)v36 + 45) = 0u;
      *((_OWORD *)v36 + 46) = 0u;
      *(_OWORD *)(v36 + 888) = v56;
      if (SHIBYTE(v63) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v36 + 904), (const std::string::value_type *)v62[0], (std::string::size_type)v62[1]);
      }
      else
      {
        *(_OWORD *)(v36 + 904) = *(_OWORD *)v62;
        *((_QWORD *)v36 + 115) = v63;
      }
      *(_QWORD *)&v66[0] = v38;
      *((_QWORD *)&v66[0] + 1) = v37;
      v39 = espresso_create_context();
      *((_QWORD *)v37 + 46) = v39;
      if (v39)
      {
        v40 = espresso_create_plan();
        *((_QWORD *)v37 + 47) = v40;
        if (v40)
        {
          if (espresso_plan_add_network())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Failed to add network. %s");
          }
          else if (espresso_plan_build())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Failed to build plan. %s");
          }
          else if (espresso_network_query_blob_dimensions())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not query the dimensions of input facecrop blob: %s");
          }
          else if (espresso_network_query_blob_dimensions())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not query the dimensions of input image blob: %s");
          }
          else if (espresso_network_query_blob_dimensions())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not query the dimensions of input FaceLocation blob: %s");
          }
          else if (espresso_network_query_blob_dimensions())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not query the dimensions of output blob: %s");
          }
          else if (espresso_network_bind_buffer())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not bind to the output blob: %s");
          }
          else if (espresso_network_query_blob_dimensions())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not query the dimensions of face branch output blob: %s");
          }
          else if (espresso_network_bind_buffer())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not bind to the face branch output blob: %s");
          }
          else if (espresso_network_query_blob_dimensions())
          {
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not query the dimensions of angle tri output blob: %s");
          }
          else
          {
            if (!espresso_network_bind_buffer())
            {
              v64 = (shared_ptr<vision::mod::GazeFollowPredictor>)v66[0];
              v41 = (shared_ptr<vision::mod::GazeFollowPredictor> *)v66;
              v42 = v54;
LABEL_72:
              v41->__ptr_ = 0;
              v41->__cntrl_ = 0;
              v43 = (std::__shared_weak_count *)*((_QWORD *)&v66[0] + 1);
              v13 = v59;
              if (*((_QWORD *)&v66[0] + 1))
              {
                v44 = (unint64_t *)(*((_QWORD *)&v66[0] + 1) + 8);
                do
                  v45 = __ldaxr(v44);
                while (__stlxr(v45 - 1, v44));
                if (!v45)
                {
                  ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
                  std::__shared_weak_count::__release_weak(v43);
                }
              }
              v46 = v64;
              v64 = (shared_ptr<vision::mod::GazeFollowPredictor>)0;
              v47 = self->_gazeFollowPredictor.__cntrl_;
              self->_gazeFollowPredictor = v46;
              if (v47)
              {
                v48 = (unint64_t *)((char *)v47 + 8);
                do
                  v49 = __ldaxr(v48);
                while (__stlxr(v49 - 1, v48));
                if (!v49)
                {
                  (*(void (**)(__shared_weak_count *))(*(_QWORD *)v47 + 16))(v47);
                  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v47);
                }
              }
              v50 = (std::__shared_weak_count *)v64.__cntrl_;
              if (v64.__cntrl_)
              {
                v51 = (unint64_t *)((char *)v64.__cntrl_ + 8);
                do
                  v52 = __ldaxr(v51);
                while (__stlxr(v52 - 1, v51));
                if (!v52)
                {
                  ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
                  std::__shared_weak_count::__release_weak(v50);
                }
              }
              if (v61 < 0)
                operator delete(__p[0]);
              if (SHIBYTE(v63) < 0)
                operator delete(v62[0]);
              if (self->_gazeFollowPredictor.__ptr_)
              {
                v19 = 1;
                v35 = v58;
LABEL_96:

                goto LABEL_97;
              }
              v35 = v58;
              if (a4)
              {
                VNErrorForCVMLStatus((id)v42);
                v19 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_96;
              }
LABEL_95:
              v19 = 0;
              goto LABEL_96;
            }
            espresso_plan_get_error_info();
            syslog(5, "[Espresso Error]: Could not bind to the angle tri output blob: %s");
          }
        }
      }
      syslog(5, "[ERROR]: Failed to initialize GazeFollowPredictor object");
      v41 = &v64;
      v42 = 9823;
      goto LABEL_72;
    }
    if (a4)
    {
      VNErrorForCVMLStatus((id)v23);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_97:

      goto LABEL_98;
    }
LABEL_44:
    v19 = 0;
    goto LABEL_97;
  }
  return 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  CamGazePredictor *ptr;
  unint64_t v22;
  unint64_t v23;
  __CVBuffer *v24;
  id v25;
  BOOL v26;
  id v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "width");
    v20 = objc_msgSend(v18, "height");
    ptr = self->_gazePredictor.__ptr_;
    v22 = *(_QWORD *)ptr;
    v23 = *((_QWORD *)ptr + 1);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNImageBufferOption_CreateFromPixelBufferPool"));
    v28 = 0;
    v24 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)(float)v22, (unint64_t)(float)v23, 1111970369, v16, a8, &v28, x * (double)v19, y * (double)v20, width * (double)v19, height * (double)v20);
    v25 = v28;
    *a7 = v24;
    v26 = v24 != 0;
    if (v24)
      -[VNDetector recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:](self, "recordImageCropQuickLookInfoToOptionsSafe:cacheKey:imageBuffer:", v16, v25, v18);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  void *v18;
  void *v19;
  char *v20;
  double v21;
  GazeFollowPredictor *ptr;
  float v23;
  void *v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  dispatch_block_t v51;
  void (**v52)(_QWORD);
  VNFaceGazeDetector *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (**v61)(_QWORD);
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  char *v96;
  uint64_t v97;
  void *v98;
  int v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  int v105;
  NSObject *v106;
  GazeFollowPredictor *v107;
  double v108;
  double v109;
  float32x4_t v110;
  char v111;
  double v112;
  double v113;
  double v114;
  double v115;
  int v116;
  int v117;
  BOOL v118;
  __CVBuffer *v119;
  VNFaceGaze *v120;
  void *v121;
  double v122;
  VNFaceGaze *v123;
  void *v124;
  void *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  size_t v130;
  uint64_t v131;
  void *v132;
  int v133;
  __CVBuffer *v134;
  char v135;
  double v136;
  const __CFString *v137;
  void *v138;
  void *v139;
  double v140;
  uint64_t v141;
  void *v142;
  double v143;
  void *v144;
  double v145;
  uint64_t v146;
  int v147;
  void *v148;
  dispatch_group_t v149;
  void *v150;
  dispatch_group_t v151;
  void *v152;
  void *v153;
  id v154;
  id v155;
  void *v156;
  VNFaceGazeDetector *v157;
  id v158;
  id v159;
  id *v160;
  id *to;
  NSObject *v162;
  id *v163;
  id v164;
  id v165;
  _QWORD v166[4];
  NSObject *v167;
  VNFaceGazeDetector *v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  void ***v174;
  uint64_t *v175;
  uint64_t *v176;
  _QWORD *v177;
  _QWORD *v178;
  id v179[11];
  unsigned int v180;
  int v181;
  __int128 v182;
  _QWORD block[4];
  NSObject *v184;
  id v185;
  id v186;
  id v187;
  id v188;
  void ***v189;
  _QWORD *v190;
  id v191[7];
  int v192;
  unsigned int v193;
  _QWORD v194[4];
  id location;
  _QWORD v196[6];
  int v197;
  uint64_t v198;
  uint64_t *v199;
  uint64_t v200;
  __n128 (*v201)(__n128 *, __n128 *);
  void (*v202)(uint64_t);
  const char *v203;
  _QWORD v204[3];
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  __n128 (*v208)(__n128 *, __n128 *);
  void (*v209)(uint64_t);
  const char *v210;
  void *__p[3];
  char v212;
  float v213;
  __int128 v214;
  void **aBlock;
  uint64_t p_aBlock;
  uint64_t v217;
  uint64_t (*v218)(uint64_t, uint64_t);
  void (*v219)(uint64_t);
  id v220;
  uint64_t v221;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a4;
  v165 = a6;
  v163 = a7;
  v164 = a8;
  +[VNValidationUtilities requiredFaceObservationsInOptions:error:](VNValidationUtilities, "requiredFaceObservationsInOptions:error:", v17, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    goto LABEL_23;
  v20 = (char *)objc_msgSend(v18, "count");
  if (!v20)
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_25;
  }
  *(_QWORD *)((char *)&v214 + 5) = 0;
  *(_QWORD *)&v214 = 0;
  if (!+[VNValidationUtilities getFloatValue:forKey:inOptions:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:error:", &v214, CFSTR("VNFaceGazeDetectorProcessOption_GazeHeatMapThreshold"), v17, a7))goto LABEL_23;
  if (!+[VNValidationUtilities getFloatValue:forKey:inOptions:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:error:", (char *)&v214 + 8, CFSTR("VNFaceGazeDetectorProcessOption_MinimumFaceDimension"), v17, a7))goto LABEL_23;
  v213 = 0.0;
  if (!+[VNValidationUtilities getFloatValue:forKey:inOptions:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:error:", &v213, CFSTR("VNFaceGazeDetectorProcessOption_CommonGazeLocationRadius"), v17, a7))goto LABEL_23;
  *(float *)&v21 = v213;
  if (v213 > 0.0)
  {
    ptr = self->_gazeFollowPredictor.__ptr_;
    v23 = (float)*((unint64_t *)ptr + 29);
    if (v23 >= (float)*((unint64_t *)ptr + 30))
      v23 = (float)*((unint64_t *)ptr + 30);
    *(float *)&v21 = v23 * v213;
    if ((float)(v23 * v213) < 1.0)
      *(float *)&v21 = 1.0;
    DWORD1(v214) = (unint64_t)*(float *)&v21;
  }
  v212 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v212, CFSTR("VNFaceGazeDetectorProcessOption_DontFollowGaze"), v17, 0, a7, v21))
  {
LABEL_23:
    v25 = 0;
    goto LABEL_25;
  }
  BYTE12(v214) = v212;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v17, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v156 = v24;
  if (!v24)
    goto LABEL_100;
  v154 = v17;
  v26 = objc_msgSend(v24, "width");
  v27 = objc_msgSend(v25, "height");
  v205 = 0;
  v206 = &v205;
  v207 = 0x4812000000;
  v208 = __Block_byref_object_copy__31784;
  v209 = __Block_byref_object_dispose__31785;
  v210 = "";
  std::vector<CamGaze_output_label>::vector(__p, (unint64_t)v20);
  v198 = 0;
  v199 = &v198;
  v200 = 0x4812000000;
  v201 = __Block_byref_object_copy__42_31787;
  v202 = __Block_byref_object_dispose__43_31788;
  v203 = "";
  std::vector<GazeFollowOutputsPerFace>::vector(v204, (unint64_t)v20);
  v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v20);
  v196[0] = 0;
  v196[1] = v196;
  v196[2] = 0x3812000000;
  v196[3] = __Block_byref_object_copy__46;
  v196[4] = __Block_byref_object_dispose__47;
  v196[5] = "";
  v197 = 0;
  objc_initWeak(&location, self);
  v28 = (void *)objc_opt_class();
  v147 = objc_msgSend(v28, "VNClassCode");
  objc_msgSend(v28, "detectorCropCreationAsyncTasksQueue");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = dispatch_group_create();
  objc_msgSend(v28, "detectorCropProcessingAsyncTasksQueue");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = dispatch_group_create();
  VNValidatedLog(1, (uint64_t)CFSTR("Start processing cropProcessingGroup. currentDetector: %@"), v29, v30, v31, v32, v33, v34, (uint64_t)self);
  v35 = 0;
  v143 = width * (double)v26;
  v145 = x * (double)v26;
  v140 = y * (double)v27;
  v36 = height * (double)v27;
  v157 = self;
  do
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      objc_msgSend(v37, "unalignedBoundingBox");
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
    }
    else
    {
      v42 = 0;
      v44 = 0;
      v46 = 0;
      v40 = 0;
    }

    aBlock = 0;
    p_aBlock = (uint64_t)&aBlock;
    v217 = 0x3032000000;
    v218 = __Block_byref_object_copy__51;
    v219 = __Block_byref_object_dispose__52;
    v220 = 0;
    v194[0] = 0;
    v194[1] = v194;
    v194[2] = 0x2020000000;
    v194[3] = 0;
    v47 = (void *)objc_msgSend(v17, "mutableCopy");
    v48 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
    block[3] = &unk_1E4548AB0;
    objc_copyWeak(v191, &location);
    v192 = v147;
    v189 = &aBlock;
    v191[1] = v35;
    v49 = v151;
    v184 = v49;
    v193 = a3;
    v191[2] = v40;
    v191[3] = v42;
    v191[4] = v44;
    v191[5] = v46;
    v50 = v47;
    v185 = v50;
    v186 = v165;
    v190 = v194;
    v188 = v164;
    v191[6] = v20;
    v159 = v152;
    v187 = v159;
    v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
    v166[0] = v48;
    v166[1] = 3221225472;
    v166[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
    v166[3] = &unk_1E4548B28;
    objc_copyWeak(v179, &location);
    v174 = &aBlock;
    v180 = a3;
    v52 = v51;
    v181 = v147;
    v173 = v52;
    v179[1] = v35;
    v162 = v149;
    v53 = v157;
    v167 = v162;
    v168 = v157;
    v175 = &v205;
    v176 = &v198;
    v177 = v194;
    v179[2] = v40;
    v179[3] = v42;
    v179[4] = v44;
    v179[5] = v46;
    v169 = v156;
    v179[6] = *(id *)&v145;
    v179[7] = *(id *)&v140;
    v179[8] = *(id *)&v143;
    v179[9] = *(id *)&v36;
    v54 = v50;
    v182 = v214;
    v170 = v54;
    v178 = v196;
    v155 = v153;
    v171 = v155;
    v179[10] = v20;
    v158 = v150;
    v172 = v158;
    v61 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v166);
    v62 = v49;
    if ((unint64_t)v20 < 2)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Performing createRegionOfInterestCropForProcessingBlock. currentDetector: %@"), v55, v56, v57, v58, v59, v60, (uint64_t)v157);
      v52[2](v52);
      VNValidatedLog(1, (uint64_t)CFSTR("Performing processRegionOfInterestBlock. currentDetector: %@"), v69, v70, v71, v72, v73, v74, (uint64_t)v157);
      v61[2](v61);
      VNValidatedLog(1, (uint64_t)CFSTR("Finish processing createRegionOfInterestCropForProcessingBlock and processRegionOfInterestBlock. currentDetector: %@"), v75, v76, v77, v78, v79, v80, (uint64_t)v157);
    }
    else
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Scheduling createRegionOfInterestCropForProcessingBlock. currentDetector: %@; group: %@"),
        v55,
        v56,
        v57,
        v58,
        v59,
        v60,
        (uint64_t)v157);
      objc_msgSend(v159, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v49, v52);
      VNValidatedLog(1, (uint64_t)CFSTR("Scheduling processRegionOfInterestBlock. currentDetector: %@; group: %@"),
        v63,
        v64,
        v65,
        v66,
        v67,
        v68,
        (uint64_t)v157);
      objc_msgSend(v158, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v162, v61);
    }

    objc_destroyWeak(v179);
    objc_destroyWeak(v191);

    _Block_object_dispose(v194, 8);
    _Block_object_dispose(&aBlock, 8);

    ++v35;
    v17 = v154;
  }
  while (v20 != v35);
  if ((unint64_t)v20 > 1)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("Waiting for cropCreationGroup. currentDetector: %@; group: %@"),
      v81,
      v82,
      v83,
      v84,
      v85,
      v86,
      (uint64_t)v157);
    if ((objc_msgSend(v159, "dispatchGroupWait:error:", v49, v163) & 1) != 0)
    {
      VNValidatedLog(1, (uint64_t)CFSTR("Waiting for cropProcessingGroup. currentDetector: %@; group: %@"),
        v88,
        v89,
        v90,
        v91,
        v92,
        v93,
        (uint64_t)v157);
      if ((objc_msgSend(v158, "dispatchGroupWait:error:", v162, v163) & 1) != 0)
      {
        VNValidatedLog(1, (uint64_t)CFSTR("Finish processing cropCreationGroup and cropProcessingGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@"),
          v88,
          v89,
          v90,
          v91,
          v92,
          v93,
          (uint64_t)v157);
        goto LABEL_30;
      }
      v137 = CFSTR("Timed out waiting for face gaze cropProcessingGroup for face observations: %@. currentDetector: %@; group: %@");
    }
    else
    {
      v137 = CFSTR("Timed out waiting for face gaze cropCreationGroup for face observations: %@. currentDetector: %@; group: %@");
    }
    VNValidatedLog(4, (uint64_t)v137, v88, v89, v90, v91, v92, v93, (uint64_t)v19);
    goto LABEL_93;
  }
LABEL_30:
  if (!+[VNValidationUtilities validateAsyncStatusResults:error:](VNValidationUtilities, "validateAsyncStatusResults:error:", v155, v163))
  {
LABEL_93:
    v25 = 0;
    goto LABEL_98;
  }
  vision::mod::GazeFollowPredictor::postProcessGazeLabels((uint64_t)v157->_gazeFollowPredictor.__ptr_, v199[6], v199[7], (uint64_t)&v214);
  objc_msgSend(v19, "valueForKey:", CFSTR("uuid"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v154, v163);
  v94 = objc_claimAutoreleasedReturnValue();
  v95 = (void *)v94;
  if (!v94)
  {
    v25 = 0;
    goto LABEL_97;
  }
  v138 = (void *)v94;
  v96 = 0;
  v97 = 48;
  v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v20);
  while (1)
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", v96);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = *(_DWORD *)(v206[6] + 4 * (_QWORD)v96);
    v146 = v199[6];
    to = v98;
    v100 = v139;
    v160 = v95;
    v142 = v100;
    if (v53)
    {
      if (!v99)
      {
        v101 = v146;
        switch(*(_DWORD *)(v146 + v97 - 32))
        {
          case 0:
            v148 = 0;
            v102 = 2;
            goto LABEL_42;
          case 1:
            goto LABEL_37;
          case 2:
            goto LABEL_41;
          case 3:
            if (*(_DWORD *)(v146 + v97 + 12) == -1)
            {
              v148 = 0;
            }
            else
            {
              objc_msgSend(v100, "objectAtIndex:");
              v148 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v102 = 5;
            goto LABEL_42;
          case 4:
            v148 = 0;
            v102 = 4;
            goto LABEL_42;
          default:
            goto LABEL_40;
        }
      }
      v101 = v146;
      if (v99 == 2)
      {
LABEL_41:
        v148 = 0;
        v102 = 1;
      }
      else
      {
        if (v99 != 1)
        {
LABEL_40:
          v148 = 0;
          v141 = 0;
LABEL_43:
          v103 = v101 + v97;
          v104 = *(_DWORD *)(v101 + v97 + 4);
          if (v104 < 0 || (v105 = *(_DWORD *)(v103 + 8), v105 < 0))
          {
            v106 = v62;
            v108 = -1.0;
            v109 = -1.0;
          }
          else
          {
            v106 = v62;
            v107 = v157->_gazeFollowPredictor.__ptr_;
            v108 = (double)v104 / (float)*((unint64_t *)v107 + 29);
            v109 = 1.0 - (double)v105 / (float)*((unint64_t *)v107 + 30);
          }
          v110 = *(float32x4_t *)(v103 + 20);
          v111 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v110), (int8x16_t)vcgezq_f32(v110)))));
          if ((v111 & 1) != 0)
            v112 = *MEMORY[0x1E0C9D628];
          else
            v112 = v110.f32[0];
          if ((v111 & 1) != 0)
            v113 = *(double *)(MEMORY[0x1E0C9D628] + 8);
          else
            v113 = 1.0 - COERCE_FLOAT(HIDWORD(*(_QWORD *)(v103 + 20))) - COERCE_FLOAT(*(_QWORD *)(v103 + 28));
          if ((v111 & 1) != 0)
            v114 = *(double *)(MEMORY[0x1E0C9D628] + 16);
          else
            v114 = COERCE_FLOAT(HIDWORD(*(_OWORD *)(v103 + 20)));
          if ((v111 & 1) != 0)
            v115 = *(double *)(MEMORY[0x1E0C9D628] + 24);
          else
            v115 = COERCE_FLOAT(*(_QWORD *)(v103 + 28));
          v116 = *(_DWORD *)(v103 + 16);
          v117 = *(_DWORD *)(v103 - 32);
          v118 = v117 == -1 || v117 == 2;
          if (v118
            || (v126 = *(char **)(v101 + v97 - 24), v127 = *(char **)(v101 + v97 - 16), v128 = v127 - v126, v127 == v126)
            || (v129 = *(_QWORD *)(*(_QWORD *)(v101 + v97 - 24) + 8) - *(_QWORD *)v126) == 0)
          {
            v119 = 0;
          }
          else
          {
            v130 = 0xAAAAAAAAAAAAAAABLL * (v128 >> 3);
            v131 = v129 >> 2;
            v119 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v129 >> 2, v130, 1278226534, v163);
            if (!v119)
            {
              v124 = 0;
              goto LABEL_66;
            }
            aBlock = (void **)MEMORY[0x1E0C809B0];
            p_aBlock = 3221225472;
            v217 = (uint64_t)__70__VNFaceGazeDetector__createPixelBuffer_forGazeMapOfGazeFollow_error___block_invoke;
            v218 = (uint64_t (*)(uint64_t, uint64_t))&__block_descriptor_56_e25_B24__0____CVBuffer__8__16l;
            v219 = (void (*)(uint64_t))v131;
            v220 = (id)v130;
            v221 = v146 + v97 - 48;
            v132 = _Block_copy(&aBlock);
            v133 = VNExecuteBlockWithPixelBuffer(v119, 0, v132, v163);
            if (v133)
              v134 = v119;
            else
              v134 = 0;

            if (v134)
              v135 = v133;
            else
              v135 = 0;
            if ((v135 & 1) != 0)
            {
              v119 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:]([VNPixelBufferObservation alloc], "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v160, 0, v134);
              CVPixelBufferRelease(v134);
              LODWORD(v136) = *(_DWORD *)(v146 + v97);
              -[__CVBuffer setConfidence:](v119, "setConfidence:", v136);
            }
            else
            {
              v119 = 0;
              v124 = 0;
              if (!v133)
                goto LABEL_66;
            }
          }
          v120 = [VNFaceGaze alloc];
          objc_msgSend(to, "uuid");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v122) = v116;
          v123 = -[VNFaceGaze initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:](v120, "initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:", v121, v141, v148, v119, v160, v108, v109, v112, v113, v114, v115, v122);

          objc_msgSend(to, "vn_cloneObject");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "setGaze:", v123);

LABEL_66:
          goto LABEL_67;
        }
LABEL_37:
        v148 = 0;
        v102 = 3;
      }
LABEL_42:
      v141 = v102;
      goto LABEL_43;
    }
    v106 = v62;
    v124 = 0;
LABEL_67:

    v62 = v106;
    v95 = v138;
    if (!v124)
      break;
    objc_msgSend(v144, "addObject:", v124);

    ++v96;
    v97 += 136;
    v53 = v157;
    v125 = v144;
    if (v20 == v96)
    {
      v25 = v144;
      goto LABEL_96;
    }
  }
  v25 = 0;
  v125 = v144;
LABEL_96:

LABEL_97:
LABEL_98:

  objc_destroyWeak(&location);
  _Block_object_dispose(v196, 8);

  _Block_object_dispose(&v198, 8);
  aBlock = (void **)v204;
  std::vector<GazeFollowOutputsPerFace>::__destroy_vector::operator()[abi:ne180100](&aBlock);
  _Block_object_dispose(&v205, 8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_100:

LABEL_25:
  return v25;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  cntrl = self->_gazeFollowPredictor.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  v6 = self->_gazePredictor.__cntrl_;
  if (v6)
  {
    v7 = (unint64_t *)((char *)v6 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v6 + 16))(v6, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

void __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t (**v12)(void *, id *, double, double, double, double);
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  VNAsyncStatus *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  VNAsyncStatus *v29;
  uint64_t v30;
  void *v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  int v41;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E4548A88;
    v41 = *(_DWORD *)(a1 + 148);
    v9 = WeakRetained;
    v34 = v9;
    v39 = *(_OWORD *)(a1 + 104);
    v40 = *(_OWORD *)(a1 + 120);
    v35 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 80);
    v36 = v10;
    v38 = v11;
    v37 = *(id *)(a1 + 64);
    v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    v13 = *(double *)(a1 + 104);
    v14 = *(double *)(a1 + 112);
    v15 = *(double *)(a1 + 120);
    v16 = *(double *)(a1 + 128);
    v32 = 0;
    v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    v18 = v32;
    v19 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v17, v18);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    VNValidatedLog(1, (uint64_t)CFSTR("createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@"),
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    if (*(_QWORD *)(a1 + 136) >= 2uLL)
      objc_msgSend(*(id *)(a1 + 56), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v28);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

  }
}

void __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  id v20;
  VNAsyncStatus *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  VNAsyncStatus *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  int v49;
  int v50;
  __int128 v51;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing; currentDetector: %@"),
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E4548B00;
    v41 = *(id *)(a1 + 80);
    v10 = v9;
    v49 = *(_DWORD *)(a1 + 220);
    v11 = *(_QWORD *)(a1 + 136);
    v36 = v10;
    v44 = v11;
    v12 = *(id *)(a1 + 32);
    v13 = *(_OWORD *)(a1 + 104);
    v42 = *(_OWORD *)(a1 + 88);
    v43 = v13;
    v14 = *(_OWORD *)(a1 + 160);
    v45 = *(_OWORD *)(a1 + 144);
    v50 = *(_DWORD *)(a1 + 216);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v37 = v12;
    v38 = v15;
    v46 = v14;
    v39 = v16;
    v17 = *(_OWORD *)(a1 + 192);
    v47 = *(_OWORD *)(a1 + 176);
    v48 = v17;
    v40 = *(id *)(a1 + 56);
    v51 = *(_OWORD *)(a1 + 224);
    v18 = _Block_copy(aBlock);
    v34 = 0;
    v19 = VNExecuteBlock(v18, (uint64_t)&v34);
    v20 = v34;
    v21 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v19, v20);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 48));
    objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 48));
    VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: finish processing; currentDetector: %@"),
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      (uint64_t)v10);
    kdebug_trace();
    if (*(_QWORD *)(a1 + 208) >= 2uLL)
      objc_msgSend(*(id *)(a1 + 72), "dispatchReportBlockCompletion");

  }
  else
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Currently executed Detector should not be nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", 0, v30);
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
}

uint64_t __70__VNFaceGazeDetector__createPixelBuffer_forGazeMapOfGazeFollow_error___block_invoke(_QWORD *a1, CVPixelBufferRef pixelBuffer)
{
  uint64_t v4;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;

  v4 = a1[4];
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a1[5])
  {
    v7 = BaseAddress;
    v8 = 0;
    v9 = 0;
    v10 = 4 * v4;
    do
    {
      memcpy(v7, *(const void **)(*(_QWORD *)(a1[6] + 24) + v8), v10);
      v7 += BytesPerRow;
      ++v9;
      v8 += 24;
    }
    while (v9 < a1[5]);
  }
  return 1;
}

BOOL __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _BOOL8 v18;
  _QWORD aBlock[4];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  int v34;
  int v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 72), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dependent task execution"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v18 = 0;
      *a2 = v4;
      return v18;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@"),
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(_QWORD *)(a1 + 32));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "completed") & 1) == 0)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    return 0;
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E4548AD8;
  v21 = *(id *)(a1 + 32);
  v34 = *(_DWORD *)(a1 + 184);
  v11 = *(id *)(a1 + 40);
  v35 = *(_DWORD *)(a1 + 188);
  v26 = &v37;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(a1 + 56);
  v22 = v11;
  v23 = v12;
  v27 = *(_OWORD *)(a1 + 88);
  v14 = *(_QWORD *)(a1 + 112);
  v28 = *(_QWORD *)(a1 + 104);
  v29 = v14;
  v15 = *(_OWORD *)(a1 + 136);
  v30 = *(_OWORD *)(a1 + 120);
  v31 = v15;
  v24 = v13;
  v16 = *(_OWORD *)(a1 + 168);
  v32 = *(_OWORD *)(a1 + 152);
  v33 = v16;
  v25 = *(id *)(a1 + 64);
  v36 = *(_OWORD *)(a1 + 192);
  v17 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), 1uLL);
  objc_msgSend((id)objc_opt_class(), "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v17, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 188), a2);
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), 1uLL);
  v18 = *((_BYTE *)v38 + 24) != 0;

  _Block_object_dispose(&v37, 8);
  return v18;
}

uint64_t __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CVBuffer *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  __int128 v23;
  char v24;
  float *v25;
  float v26;
  float v27;
  float v28;
  _BOOL4 v29;
  int v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v44;
  float v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CVBuffer *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  float v59;
  unint64_t v60;
  float v61;
  uint64_t v62;
  char v63;
  unint64_t v64;
  float v65;
  unint64_t v66;
  uint64_t *v67;
  float **v68;
  float *v69;
  __int128 v70;
  __int128 v71;
  const char *v72;
  unint64_t v73;
  unint64_t v74;
  int v75;
  int v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  float *v80;
  _DWORD *v81;
  _DWORD *v82;
  double v83;
  float v84;
  double v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  float *v97;
  float *v98;
  double v99;
  float v100;
  unint64_t v101;
  uint64_t v102;
  float v103;
  float v104;
  double v105;
  float *v106;
  float *v107;
  float v108;
  float *v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  double v115;
  double v116;
  float v117;
  float v118;
  float **v119;
  float v120;
  uint64_t *v121;
  float v122;
  __int128 *v123;
  float v124;
  _OWORD *v125;
  double v126;
  uint64_t v127;
  CVPixelBufferRef pixelBuffer;
  __CVBuffer *pixelBuffera;
  id v130;
  void *v131;
  id v132;
  id v133;
  char v134;
  void *__p[2];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;
  vImage_Buffer src;
  __int128 v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: start processing; currentDetector: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(_QWORD *)(a1 + 32));
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48);
  v12 = *(_QWORD *)(a1 + 104);
  v13 = *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(double *)(a1 + 144);
  v16 = *(double *)(a1 + 152);
  v17 = *(double *)(a1 + 160);
  v18 = *(double *)(a1 + 168);
  v19 = *(void **)(a1 + 64);
  v133 = *(id *)(a1 + 56);
  v132 = v19;
  if (!v14)
    goto LABEL_9;
  *(_DWORD *)(v10 + 4 * v12) = 2;
  v20 = v11 + 136 * v12;
  *(_DWORD *)(v20 + 16) = -1;
  v21 = (_DWORD *)(v20 + 16);
  src.data = CVPixelBufferGetBaseAddress(v13);
  src.height = CVPixelBufferGetHeight(v13);
  src.width = CVPixelBufferGetWidth(v13);
  src.rowBytes = CVPixelBufferGetBytesPerRow(v13);
  v22 = *(_QWORD *)(v14 + 56);
  if ((ImageProcessing_reallocVImageBuffer(v22 + 64, (unint64_t)(float)*(unint64_t *)v22, (unint64_t)(float)*(unint64_t *)(v22 + 8), 4) & 0x80) != 0)vImageScale_ARGB8888(&src, (const vImage_Buffer *)(v22 + 64), 0, 0x20u);
  v23 = *(_OWORD *)(v22 + 80);
  *(_OWORD *)__p = *(_OWORD *)(v22 + 64);
  v136 = v23;
  if (espresso_network_bind_input_vimagebuffer_bgra8())
    goto LABEL_7;
  if (!espresso_plan_execute_sync())
  {
    v25 = *(float **)(v22 + 128);
    v26 = *v25;
    v27 = v25[1];
    v28 = v25[2];
    v29 = v27 > *v25;
    if (v27 <= v28)
      v29 = 0;
    if (v28 <= v27 || v28 <= v26)
      v31 = v29;
    else
      v31 = 2;
    *(_DWORD *)(v10 + 4 * v12) = v31;
    v32 = v133;
    v130 = v132;
    v131 = v32;
    v33 = objc_msgSend(v32, "width");
    v34 = objc_msgSend(v32, "height");
    v35 = v11 + 136 * v12;
    v36 = (double)v33;
    v37 = (double)v34;
    v38 = VNNormalizedRectForPixelRectInBounds(*(double *)(a1 + 112) * (double)v33, *(double *)(a1 + 120) * (double)v34, *(double *)(a1 + 128) * (double)v33, *(double *)(a1 + 136) * (double)v34, v15, v16, v17, v18);
    v41 = v40;
    v43 = v42;
    *(float *)&v40 = v38;
    v44 = 1.0 - v39 - v42;
    v45 = v42;
    *(_DWORD *)v35 = LODWORD(v40);
    *(float *)(v35 + 4) = v44;
    *(float *)&v42 = v41;
    *(float *)(v35 + 8) = v45;
    *(_DWORD *)(v35 + 12) = LODWORD(v42);
    if (v31)
    {
      if (v31 == 1)
      {
        v24 = 1;
        *v21 = 1;
LABEL_24:
        v46 = v130;
LABEL_25:

        goto LABEL_26;
      }
      *v21 = 2;
LABEL_23:
      v24 = 1;
      goto LABEL_24;
    }
    *v21 = 0;
    if (*(_BYTE *)(a1 + 196))
      goto LABEL_23;
    v126 = v38;
    *(double *)&pixelBuffer = v39;
    v120 = v38;
    v124 = v44;
    v46 = v130;
    v54 = (__CVBuffer *)objc_msgSend(v131, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(float)**(unint64_t **)(v14 + 72), (unint64_t)(float)*(unint64_t *)(*(_QWORD *)(v14 + 72) + 8), 1111970369, v130, a2, v15, v16, v17, v18);
    if (!v54
      || (v55 = objc_msgSend(v131, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(float)*(unint64_t *)(*(_QWORD *)(v14 + 72) + 32), (unint64_t)(float)*(unint64_t *)(*(_QWORD *)(v14 + 72) + 40), 1111970369, v130, a2, v126 * v36, *(double *)&pixelBuffer * v37, v41 * v36, v43 * v37)) == 0)
    {
      pixelBuffera = 0;
LABEL_37:
      v63 = 0;
      v134 = 0;
LABEL_38:
      CVPixelBufferRelease(v54);
      CVPixelBufferRelease(pixelBuffera);
      v24 = v63 | v134;
      goto LABEL_25;
    }
    pixelBuffera = (__CVBuffer *)v55;
    v56 = *(_QWORD *)(v14 + 72);
    vision::mod::GazeFollowPredictor::releaseCachedImageBuffers((void **)v56);
    v127 = v56;
    v58 = *(void **)v56;
    v57 = *(_QWORD *)(v56 + 8);
    if ((float)(unint64_t)v58 != (float)CVPixelBufferGetWidth(v54)
      || (v59 = (float)v57, (float)v57 != (float)CVPixelBufferGetHeight(v54))
      || (v60 = *(_QWORD *)(v127 + 40),
          v61 = (float)*(unint64_t *)(v127 + 32),
          v61 != (float)CVPixelBufferGetWidth(pixelBuffera))
      || (float)v60 != (float)CVPixelBufferGetHeight(pixelBuffera))
    {
      v62 = 10876;
LABEL_34:
      if (a2)
      {
        VNErrorForCVMLStatus((id)v62);
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_37;
    }
    v118 = v41;
    *(float *)(v127 + 224) = (float)(v118 * 0.5) + v120;
    v122 = v43;
    *(float *)(v127 + 228) = (float)(v122 * 0.5) + v124;
    CVPixelBufferLockBaseAddress(pixelBuffera, 1uLL);
    *(_QWORD *)(v127 + 136) = (unint64_t)(float)v60;
    *(_QWORD *)(v127 + 144) = (unint64_t)v61;
    v125 = (_OWORD *)(v127 + 128);
    *(_QWORD *)(v127 + 128) = CVPixelBufferGetBaseAddress(pixelBuffera);
    *(_QWORD *)(v127 + 152) = CVPixelBufferGetBytesPerRow(pixelBuffera);
    CVPixelBufferLockBaseAddress(v54, 1uLL);
    *(_QWORD *)(v127 + 200) = (unint64_t)v59;
    *(_QWORD *)(v127 + 208) = (unint64_t)(float)(unint64_t)v58;
    v123 = (__int128 *)(v127 + 192);
    *(_QWORD *)(v127 + 192) = CVPixelBufferGetBaseAddress(v54);
    *(_QWORD *)(v127 + 216) = CVPixelBufferGetBytesPerRow(v54);
    v64 = *(_QWORD *)(v127 + 240);
    v65 = (float)*(unint64_t *)(v127 + 232);
    v121 = (uint64_t *)(v11 + 136 * v12 + 24);
    std::vector<std::vector<long long>>::__clear[abi:ne180100](v121);
    LODWORD(src.data) = 0;
    std::vector<float>::vector(__p, (unint64_t)v65, &src);
    v66 = (unint64_t)(float)v64;
    std::vector<std::vector<float>>::resize(v121, v66, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v67 = (uint64_t *)(v11 + 136 * v12 + 88);
    std::vector<std::vector<long long>>::__clear[abi:ne180100](v67);
    LODWORD(src.data) = 0;
    std::vector<float>::vector(__p, (unint64_t)v65, &src);
    std::vector<std::vector<float>>::resize(v67, v66, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v68 = (float **)(v11 + 136 * v12);
    v69 = v68[14];
    v68 += 14;
    v68[1] = v69;
    LODWORD(__p[0]) = 0;
    v119 = v68;
    v46 = v130;
    std::vector<float>::resize((char **)v68, 2uLL, __p);
    v70 = *(_OWORD *)(v127 + 144);
    *(_OWORD *)&src.data = *v125;
    *(_OWORD *)&src.width = v70;
    espresso_network_bind_input_vimagebuffer_bgra8();
    v71 = *(_OWORD *)(v127 + 208);
    v146 = *v123;
    v147 = v71;
    espresso_network_bind_input_vimagebuffer_bgra8();
    v145 = 0;
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    *(_OWORD *)__p = 0u;
    v136 = 0u;
    v149 = xmmword_1A15C3FE0;
    espresso_buffer_pack_tensor_shape();
    __p[0] = (void *)(v127 + 224);
    LODWORD(v145) = 65568;
    if (espresso_network_bind_buffer())
    {
      syslog(5, "[Espresso Error]: Could not bind the input blobs to espresso model");
LABEL_47:
      v62 = 10843;
      goto LABEL_48;
    }
    if (espresso_plan_execute_sync())
    {
      v46 = v130;
      espresso_plan_get_error_info();
      syslog(5, "[Espresso Error]: Could not execute plan: %s", v72);
      goto LABEL_47;
    }
    v73 = *(_QWORD *)(v127 + 232);
    if (v73)
    {
      v74 = 0;
      v75 = 0;
      v76 = 0;
      v77 = *(_QWORD *)(v127 + 240);
      v78 = *v121;
      v79 = v11 + 136 * v12;
      v80 = (float *)(v79 + 48);
      v81 = (_DWORD *)(v79 + 52);
      v82 = (_DWORD *)(v79 + 56);
      v83 = (double)v77;
      v85 = (double)v73;
      v86 = NAN;
      v87 = NAN;
      v89 = NAN;
      v90 = NAN;
      v91 = *(_QWORD *)(v127 + 232);
      v92 = v77;
      do
      {
        if (v77)
        {
          v93 = 0;
          v94 = (_QWORD *)(v78 + 24 * v74);
          v95 = v94 + 3;
          v98 = (float *)*v94;
          v96 = v94 - 3;
          v97 = v98;
          v99 = (double)(int)v74 + 0.5;
          v101 = v74 + 1;
          v102 = *(_QWORD *)(v127 + 360) + 4 * v77 * v74;
          do
          {
            v103 = *(float *)(v102 + 4 * v93);
            *v97 = v103;
            if (v103 > *v80)
            {
              *v80 = v103;
              *v81 = v93;
              *v82 = v74;
            }
            v104 = *(float *)(a1 + 184);
            if (v103 > v104)
            {
              if (v92 > v93)
              {
                if (v93)
                {
                  v90 = ((double)v93
                       + 0.5
                       - (float)((float)(*v97 - v104) / (float)((float)(*v97 - v104) + (float)(v104 - *(v97 - 1)))))
                      / v83;
                  v92 = v93;
                }
                else
                {
                  v92 = 0;
                  v84 = 0.5 / (double)v77;
                  v90 = v84;
                }
              }
              if ((uint64_t)v93 > v76)
              {
                if (v77 - 1 <= v93)
                  v105 = (double)(int)v93 + 0.5;
                else
                  v105 = (double)(int)v93
                       + 0.5
                       + (float)((float)(*v97 - v104) / (float)((float)(*v97 - v104) + (float)(v104 - v97[1])));
                v89 = v105 / v83;
                v76 = v93;
              }
              if (v91 > v74)
              {
                v91 = 0;
                v88 = 0.5 / (double)v73;
                v87 = v88;
                if (v74)
                {
                  v87 = ((double)v74
                       + 0.5
                       - (float)((float)(*v97 - v104)
                               / (float)((float)(*v97 - v104) + (float)(v104 - *(float *)(*v96 + 4 * v93)))))
                      / v85;
                  v91 = v74;
                }
              }
              if ((uint64_t)v74 > v75)
              {
                if (v73 - 1 <= v74)
                {
                  v75 = v74;
                  v100 = v99 / v85;
                  v86 = v100;
                }
                else
                {
                  v86 = (v99
                       + (float)((float)(*v97 - v104)
                               / (float)((float)(*v97 - v104) + (float)(v104 - *(float *)(*v95 + 4 * v93)))))
                      / v85;
                  v75 = v74;
                }
              }
            }
            ++v93;
            ++v97;
          }
          while (v77 != v93);
        }
        else
        {
          v101 = v74 + 1;
        }
        v74 = v101;
      }
      while (v101 != v73);
    }
    else
    {
      v90 = NAN;
      v89 = NAN;
      v87 = NAN;
      v86 = NAN;
    }
    if (*(float *)(v11 + 136 * v12 + 48) > *(float *)(a1 + 184))
    {
      v106 = (float *)(v11 + 136 * v12);
      v106[17] = v90;
      v106[18] = v87;
      v106[19] = v86 - v87;
      v106[20] = v89 - v90;
    }
    v107 = *(float **)(v127 + 696);
    v108 = *v107;
    v109 = *v119;
    *v109 = *v107;
    v110 = v107[1];
    v109[1] = v110;
    v111 = 1.0;
    v112 = 1.0;
    if (v108 <= 1.0)
    {
      v112 = v108;
      if (v108 < -1.0)
        v112 = -1.0;
    }
    if (v110 <= 1.0)
    {
      v111 = v110;
      if (v110 < -1.0)
        v111 = -1.0;
    }
    v113 = acosf(v111);
    v114 = asinf(v112);
    if (v112 >= 0.0)
    {
      if (v111 < 0.0)
      {
        v115 = v114;
        v116 = 3.14159265;
        goto LABEL_92;
      }
    }
    else
    {
      v113 = -v113;
      if (v111 < 0.0)
      {
        v115 = v114;
        v116 = -3.14159265;
LABEL_92:
        v114 = v116 - v115;
      }
    }
    v117 = ((float)((float)(v112 * v112) * v113) + (1.0 - (float)(v112 * v112)) * v114) * 180.0 / 3.14159265;
    *(float *)(v11 + 136 * v12 + 64) = v117;
    v62 = 10880;
    v46 = v130;
LABEL_48:
    CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
    *v125 = 0u;
    *(_OWORD *)(v127 + 144) = 0u;
    CVPixelBufferUnlockBaseAddress(v54, 1uLL);
    *v123 = 0u;
    *(_OWORD *)(v127 + 208) = 0u;
    if ((v62 & 0xDB) == 0x80)
    {
      v63 = 1;
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  espresso_plan_get_error_info();
LABEL_7:
  if (!a2)
  {
LABEL_9:
    v24 = 0;
    goto LABEL_26;
  }
  VNErrorForCVMLStatus((id)0x295B);
  v24 = 0;
  *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v24 & 1;
  VNValidatedLog(1, (uint64_t)CFSTR("processRegionOfInterest Netto: finish processing; currentDetector: %@"),
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    *(_QWORD *)(a1 + 32));
  kdebug_trace();
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
}

uint64_t __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, a2, *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("VNComputeStageMain");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities espressoV1ModelComputeDevices](VNComputeDeviceUtilities, "espressoV1ModelComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "image");
  +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:error:](VNEspressoHelpers, "pathForEspressoNetworkModelFileWithName:error:", CFSTR("gazefollowingflow-u67ev5hbea_50540_fp16.espresso"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "supportedImageSizeSetForEspressoModelAtPath:inputImageBlobName:analysisPixelFormatType:error:", v7, v6, 1111970369, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
