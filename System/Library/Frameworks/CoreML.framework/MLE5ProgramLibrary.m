@implementation MLE5ProgramLibrary

void __44__MLE5ProgramLibrary_prepareAndReturnError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_programLibraryHandleWithForceRespecialization:error:", 0, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v4 != 0;
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  NSObject *v5;
  int v6;
  BOOL v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__15;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[MLE5ProgramLibrary lazyInitQueue](self, "lazyInitQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MLE5ProgramLibrary_prepareAndReturnError___block_invoke;
  block[3] = &unk_1E3D66D28;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  v6 = *((unsigned __int8 *)v17 + 24);
  if (a3 && !*((_BYTE *)v17 + 24))
  {
    *a3 = objc_retainAutorelease((id)v11[5]);
    v6 = *((unsigned __int8 *)v17 + 24);
  }
  v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (OS_dispatch_queue)lazyInitQueue
{
  return self->_lazyInitQueue;
}

- (NSString)modelDisplayName
{
  void *v2;
  void *v3;

  -[MLE5ProgramLibrary impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (e5rt_program_library)_programLibraryHandleWithForceRespecialization:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  e5rt_program_library *result;
  e5rt_program_library **p_programLibraryHandle;
  void *v9;

  v5 = a3;
  p_programLibraryHandle = &self->_programLibraryHandle;
  result = self->_programLibraryHandle;
  if (a3)
  {
    if (result)
    {
      e5rt_program_library_release();
      *p_programLibraryHandle = 0;
    }
  }
  else if (result)
  {
    return result;
  }
  -[MLE5ProgramLibrary impl](self, "impl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *p_programLibraryHandle = (e5rt_program_library *)objc_msgSend(v9, "createProgramLibraryHandleWithRespecialization:error:", v5, a4);

  return *p_programLibraryHandle;
}

- (MLE5ProgramLibraryImpl)impl
{
  return self->_impl;
}

- (MLE5ProgramLibrary)initWithImpl:(id)a3 container:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  MLE5ProgramLibrary *v12;
  MLE5ProgramLibrary *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *lazyInitQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLE5ProgramLibrary;
  v12 = -[MLE5ProgramLibrary init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_impl, a3);
    v14 = dispatch_queue_create("com.apple.coreml.MLE5ProgramLibrary.lazyInitQueue", 0);
    lazyInitQueue = v13->_lazyInitQueue;
    v13->_lazyInitQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_container, a4);
    objc_storeStrong((id *)&v13->_modelConfiguration, a5);
  }

  return v13;
}

- (MLE5ProgramLibrary)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  MLE5ProgramLibrary *v13;
  MLE5ProgramLibraryE5BundleImpl *v14;
  MLE5ProgramLibraryOnDeviceAOTCompilationImpl *v15;
  MLE5ProgramLibraryOnDeviceAOTCompilationImpl *v16;
  uint64_t v17;
  MLE5ProgramLibraryOnDeviceAOTCompilationImpl *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  _QWORD v28[5];
  uint8_t buf[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  uint64_t (*v34)(uint64_t);
  const char *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "compilerOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (objc_msgSend(v9, "usePrecompiledE5Bundle"))
    {
      objc_msgSend(v8, "findPrecompiledE5BundleAndReturnError:", a5);
      v13 = (MLE5ProgramLibrary *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v15 = 0;
        goto LABEL_30;
      }
      v14 = -[MLE5ProgramLibraryE5BundleImpl initWithE5BundleAtURL:configuration:]([MLE5ProgramLibraryE5BundleImpl alloc], "initWithE5BundleAtURL:configuration:", v13, v9);
    }
    else
    {
      v16 = [MLE5ProgramLibraryOnDeviceAOTCompilationImpl alloc];
      objc_msgSend(v8, "URLOfMILText");
      v13 = (MLE5ProgramLibrary *)objc_claimAutoreleasedReturnValue();
      v14 = -[MLE5ProgramLibraryOnDeviceAOTCompilationImpl initWithMILTextAtURL:container:configuration:](v16, "initWithMILTextAtURL:container:configuration:", v13, v8, v9);
    }
    v15 = (MLE5ProgramLibraryOnDeviceAOTCompilationImpl *)v14;

    goto LABEL_26;
  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x4012000000;
    v33 = __Block_byref_object_copy__23892;
    v34 = __Block_byref_object_dispose__23893;
    v35 = "";
    objc_msgSend(v8, "compilerOutput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "program");
    }
    else
    {
      v36 = 0;
      v37 = 0;
    }

    v17 = v31[6];
    if (v17)
    {
      v18 = [MLE5ProgramLibraryOnDeviceAOTCompilationImpl alloc];
      v19 = v31[6];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __60__MLE5ProgramLibrary_initWithContainer_configuration_error___block_invoke;
      v28[3] = &unk_1E3D66D00;
      v28[4] = &v30;
      v15 = -[MLE5ProgramLibraryOnDeviceAOTCompilationImpl initWithIRProgram:container:configuration:deallocator:](v18, "initWithIRProgram:container:configuration:deallocator:", v19, v8, v9, v28);
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "Unable to find a MLProgram in the in-model model asset.", buf, 2u);
      }

      if (a5)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find a MLProgram in the in-model model asset."));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = 0;
    }
    _Block_object_dispose(&v30, 8);
    v24 = v37;
    if (!v37)
      goto LABEL_25;
    p_shared_owners = (unint64_t *)&v37->__shared_owners_;
    do
      v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
      if (v17)
        goto LABEL_26;
    }
    else
    {
LABEL_25:
      if (v17)
      {
LABEL_26:
        self = -[MLE5ProgramLibrary initWithImpl:container:configuration:](self, "initWithImpl:container:configuration:", v15, v8, v9);
        v13 = self;
        goto LABEL_30;
      }
    }
LABEL_28:
    v13 = 0;
    goto LABEL_30;
  }
  if (!a5)
  {
    v15 = 0;
    goto LABEL_28;
  }
  +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("In-memory model support is disabled."));
  v15 = 0;
  v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_programLibraryHandle)
    e5rt_program_library_release();
  v3.receiver = self;
  v3.super_class = (Class)MLE5ProgramLibrary;
  -[MLE5ProgramLibrary dealloc](&v3, sel_dealloc);
}

- (e5rt_execution_stream_operation)createOperationForFunctionName:(id)a3 forceRespecialization:(BOOL)a4 hasRangeShapeInputs:(BOOL)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  id v12;
  e5rt_execution_stream_operation *v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v10 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__16;
  v26 = 0;
  -[MLE5ProgramLibrary lazyInitQueue](self, "lazyInitQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__MLE5ProgramLibrary_createOperationForFunctionName_forceRespecialization_hasRangeShapeInputs_error___block_invoke;
  block[3] = &unk_1E3D66D50;
  v19 = a4;
  block[4] = self;
  v17 = &v21;
  v12 = v10;
  v20 = a5;
  v16 = v12;
  v18 = &v27;
  dispatch_sync(v11, block);

  v13 = (e5rt_execution_stream_operation *)v28[3];
  if (a6 && !v13)
  {
    *a6 = objc_retainAutorelease((id)v22[5]);
    v13 = (e5rt_execution_stream_operation *)v28[3];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)segmentationAnalyticsAndReturnError:(id *)a3
{
  NSObject *v5;
  void *v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  -[MLE5ProgramLibrary lazyInitQueue](self, "lazyInitQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MLE5ProgramLibrary_segmentationAnalyticsAndReturnError___block_invoke;
  block[3] = &unk_1E3D66D28;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v5, block);

  v6 = (void *)v16[3];
  if (!v6 && a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (id)newStateForFunctionNamed:(id)a3 stateNames:(id)a4 clientBuffers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD block[4];
  id v23;
  id v24;
  MLE5ProgramLibrary *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__15;
  v40 = __Block_byref_object_dispose__16;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__15;
  v34 = __Block_byref_object_dispose__16;
  v35 = 0;
  -[MLE5ProgramLibrary functionNames](self, "functionNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5ProgramLibrary lazyInitQueue](self, "lazyInitQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MLE5ProgramLibrary_newStateForFunctionNamed_stateNames_clientBuffers_error___block_invoke;
  block[3] = &unk_1E3D66D78;
  v15 = v11;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  v25 = self;
  v17 = v10;
  v26 = v17;
  v18 = v13;
  v27 = v18;
  v28 = &v30;
  v29 = &v36;
  dispatch_sync(v14, block);

  v19 = (void *)v37[5];
  if (a6 && !v19)
  {
    *a6 = objc_retainAutorelease((id)v31[5]);
    v19 = (void *)v37[5];
  }
  v20 = v19;

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20;
}

- (id)_allocateStateBufferForFeatureNamed:(id)a3 entryFunctionName:(id)a4 programFunctionNames:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  e5rt_program_library *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MLStateConstraint *v23;
  _OWORD *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  char *v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  char *v57;
  char *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  _OWORD *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t m;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t *v93;
  char *v94;
  char *v95;
  _OWORD *v96;
  id v97;
  uint64_t v98;
  char *data;
  uint64_t n;
  void *v101;
  void *v102;
  void *v103;
  MLStateConstraint *v104;
  _OWORD *v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t ii;
  char *v111;
  std::vector<std::string>::pointer end;
  std::string *v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  std::string *v117;
  void *v118;
  void *v119;
  _QWORD *v120;
  void *v121;
  std::string *p_buf;
  void *v123;
  int v124;
  uint64_t v125;
  std::string::size_type size;
  void *v127;
  void **v128;
  std::string *v129;
  void **v130;
  std::string *v131;
  NSObject *v132;
  void *v133;
  std::string *v134;
  void *v135;
  _QWORD *v136;
  _QWORD **v137;
  BOOL v138;
  std::string *v139;
  id v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  id v146;
  uint64_t v147;
  NSObject *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  id v152;
  NSObject *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  id v157;
  NSObject *v158;
  NSObject *v159;
  uint64_t last_error_message;
  id v161;
  std::logic_error *exception;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  uint64_t v169;
  id v170;
  id v171;
  id v172;
  id v173;
  uint64_t v175;
  uint64_t v176;
  int v177;
  void *v178;
  id v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  uint64_t i;
  uint64_t v184;
  void *v185;
  uint64_t v186;
  id v187;
  id obj;
  id obja;
  id objb;
  id objc;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _QWORD **v200;
  _QWORD *v201;
  uint64_t v202;
  uint64_t *v203;
  _QWORD *v204[2];
  void **v205;
  uint64_t v206;
  uint64_t v207;
  int v208;
  int v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  void *v214[2];
  char v215;
  int v216;
  void *v217;
  uint64_t *v218;
  uint64_t *v219;
  void *v220;
  _QWORD *v221;
  __int128 v222;
  uint64_t v223;
  void *v224;
  char *v225;
  unint64_t v226;
  void *v227;
  uint64_t v228;
  _BYTE v229[128];
  std::vector<std::string> v230[2];
  __int128 v231;
  int v232;
  int v233;
  void *v234[2];
  __int128 v235;
  __int128 v236;
  __int128 v237;
  void *__p[2];
  __int128 v239;
  __int128 v240;
  __int128 v241;
  std::__split_buffer<std::string> __v;
  int v243;
  int v244;
  std::string buf;
  id v246;
  __int16 v247;
  void *v248;
  int v249;
  uint64_t v250;

  v250 = *MEMORY[0x1E0C80C00];
  v171 = a3;
  v168 = a4;
  v167 = a5;
  -[MLE5ProgramLibrary container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelAssetDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "usesMultiFunctionSyntax");

  -[MLE5ProgramLibrary container](self, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modelAssetDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v13, "modelDescriptionOfFunctionNamed:", v168);
  else
    objc_msgSend(v13, "defaultModelDescription");
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[MLE5ProgramLibrary _programLibraryHandleWithForceRespecialization:error:](self, "_programLibraryHandleWithForceRespecialization:error:", 0, a6);
  if (!v14)
  {
    v118 = 0;
    goto LABEL_254;
  }
  -[MLE5ProgramLibrary container](self, "container");
  v169 = (uint64_t)v14;
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "compilerVersionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v168;
  v16 = v166;
  v172 = v167;
  v17 = v15;
  v18 = v16;
  v170 = v17;
  v165 = v18;
  if (!v18)
  {
    v201 = 0;
    v202 = 0;
    v200 = &v201;
    goto LABEL_159;
  }
  v204[0] = 0;
  v204[1] = 0;
  v203 = (uint64_t *)v204;
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  v181 = v18;
  objc_msgSend(v181, "inputDescriptionsByName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v210, v234, 16);
  if (!v182)
    goto LABEL_128;
  v180 = *(_QWORD *)v211;
  do
  {
    for (i = 0; i != v182; ++i)
    {
      if (*(_QWORD *)v211 != v180)
        objc_enumerationMutation(v19);
      v20 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * i);
      objc_msgSend(v181, "inputDescriptionsByName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v20);
      v185 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v185, "type");
      v192 = v20;
      if (v22 != 4)
      {
        if (v22 == 5)
        {
          objc_msgSend(v185, "multiArrayConstraint");
          v25 = (id)objc_claimAutoreleasedReturnValue();
          v205 = 0;
          v206 = 0;
          v207 = 0;
          v208 = 0;
          obj = v25;
          objc_msgSend(v25, "shape");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          CoreML::numericVectorFromObjC<long long>((uint64_t)&v227, v26);

          objc_msgSend(obj, "shapeConstraint");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "type");

          switch(v28)
          {
            case 1:
              memset(&buf, 0, sizeof(buf));
              std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&buf, v227, v228, (v228 - (uint64_t)v227) >> 3);
              std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__assign_alt[abi:ne180100]<0ul,CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLFixedShape>((uint64_t)&v205, (uint64_t)&v205, (__n128 *)&buf);
              if (buf.__r_.__value_.__r.__words[0])
                operator delete(buf.__r_.__value_.__l.__data_);
              break;
            case 2:
              objc_msgSend(obj, "shapeConstraint");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "enumeratedShapes");
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v225 = 0;
              v224 = 0;
              v226 = 0;
              std::vector<std::vector<long long>>::reserve(&v224, objc_msgSend(v52, "count"));
              v241 = 0u;
              v240 = 0u;
              v239 = 0u;
              *(_OWORD *)__p = 0u;
              v53 = v52;
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", __p, &buf, 16);
              if (v54)
              {
                v55 = *(_QWORD *)v239;
                do
                {
                  for (j = 0; j != v54; ++j)
                  {
                    if (*(_QWORD *)v239 != v55)
                      objc_enumerationMutation(v53);
                    CoreML::numericVectorFromObjC<long long>((uint64_t)&v222, *((void **)__p[1] + j));
                    v57 = v225;
                    if ((unint64_t)v225 >= v226)
                    {
                      v59 = 0xAAAAAAAAAAAAAAABLL * ((v225 - (_BYTE *)v224) >> 3);
                      v60 = v59 + 1;
                      if (v59 + 1 > 0xAAAAAAAAAAAAAAALL)
                        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                      if (0x5555555555555556 * ((uint64_t)(v226 - (_QWORD)v224) >> 3) > v60)
                        v60 = 0x5555555555555556 * ((uint64_t)(v226 - (_QWORD)v224) >> 3);
                      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v226 - (_QWORD)v224) >> 3) >= 0x555555555555555)
                        v61 = 0xAAAAAAAAAAAAAAALL;
                      else
                        v61 = v60;
                      v221 = &v226;
                      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<long long>>>(v61);
                      v63 = &v62[24 * v59];
                      v217 = v62;
                      v218 = (uint64_t *)v63;
                      v220 = &v62[24 * v64];
                      *(_OWORD *)v63 = v222;
                      *((_QWORD *)v63 + 2) = v223;
                      v219 = (uint64_t *)(v63 + 24);
                      std::vector<std::vector<long long>>::__swap_out_circular_buffer(&v224, &v217);
                      v58 = v225;
                      std::__split_buffer<std::vector<long long>>::~__split_buffer((uint64_t)&v217);
                    }
                    else
                    {
                      *(_OWORD *)v225 = v222;
                      *((_QWORD *)v57 + 2) = v223;
                      v58 = v57 + 24;
                    }
                    v225 = v58;
                  }
                  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", __p, &buf, 16);
                }
                while (v54);
              }

              CoreML::NNCompiler::MLEnumeratedShape::MLEnumeratedShape(&v217, (uint64_t)&v227, (uint64_t *)&v224);
              std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__assign_alt[abi:ne180100]<2ul,CoreML::NNCompiler::MLEnumeratedShape,CoreML::NNCompiler::MLEnumeratedShape>((uint64_t)&v205, (uint64_t)&v205, (uint64_t)&v217);
              *(_QWORD *)&v222 = &v220;
              std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v222);
              if (v217)
              {
                v218 = (uint64_t *)v217;
                operator delete(v217);
              }
              v217 = &v224;
              std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v217);

              break;
            case 3:
              objc_msgSend(obj, "shapeConstraint");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "sizeRangeForDimension");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v225 = 0;
              v224 = 0;
              v226 = 0;
              std::vector<CoreML::NNCompiler::MLRangeShape::Range>::reserve(&v224, objc_msgSend(v30, "count"));
              v241 = 0u;
              v240 = 0u;
              v239 = 0u;
              *(_OWORD *)__p = 0u;
              v31 = v30;
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __p, &buf, 16);
              if (v32)
              {
                v33 = *(_QWORD *)v239;
                do
                {
                  for (k = 0; k != v32; ++k)
                  {
                    if (*(_QWORD *)v239 != v33)
                      objc_enumerationMutation(v31);
                    v35 = objc_msgSend(*((id *)__p[1] + k), "rangeValue");
                    v36 = v35;
                    v38 = v37 + v35 - 1;
                    v39 = v225;
                    if ((unint64_t)v225 >= v226)
                    {
                      v41 = v224;
                      v42 = (v225 - (_BYTE *)v224) >> 4;
                      v43 = v42 + 1;
                      if ((unint64_t)(v42 + 1) >> 60)
                        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                      v44 = v226 - (_QWORD)v224;
                      if ((uint64_t)(v226 - (_QWORD)v224) >> 3 > v43)
                        v43 = v44 >> 3;
                      if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0)
                        v45 = 0xFFFFFFFFFFFFFFFLL;
                      else
                        v45 = v43;
                      if (v45)
                        v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v45);
                      else
                        v46 = 0;
                      v47 = (uint64_t *)(v45 + 16 * v42);
                      *v47 = v36;
                      v47[1] = v38;
                      v48 = (char *)v47;
                      if (v39 == v41)
                      {
                        v20 = v192;
                      }
                      else
                      {
                        v20 = v192;
                        do
                        {
                          *((_OWORD *)v48 - 1) = *((_OWORD *)v39 - 1);
                          v48 -= 16;
                          v39 -= 2;
                        }
                        while (v39 != v41);
                        v39 = v224;
                      }
                      v40 = (char *)(v47 + 2);
                      v224 = v48;
                      v226 = v45 + 16 * v46;
                      if (v39)
                        operator delete(v39);
                    }
                    else
                    {
                      *(_QWORD *)v225 = v35;
                      v39[1] = v38;
                      v40 = (char *)(v39 + 2);
                      v20 = v192;
                    }
                    v225 = v40;
                  }
                  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", __p, &buf, 16);
                }
                while (v32);
              }

              CoreML::NNCompiler::MLRangeShape::MLRangeShape(&v217, (uint64_t)&v227, (uint64_t)&v224);
              std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__assign_alt[abi:ne180100]<1ul,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLRangeShape>((uint64_t)&v205, (uint64_t)&v205, (uint64_t)&v217);
              if (v220)
              {
                v221 = v220;
                operator delete(v220);
              }
              if (v217)
              {
                v218 = (uint64_t *)v217;
                operator delete(v217);
              }
              if (v224)
                operator delete(v224);

              break;
          }
          v65 = objc_msgSend(obj, "dataType");
          v66 = 65552;
          if (v65 != 65552)
          {
            if (v65 == 131104)
            {
              v66 = 131104;
            }
            else if (v65 == 65568)
            {
              v66 = 65568;
            }
            else
            {
              v66 = 65600;
            }
          }
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v214, (uint64_t)&v205);
          v216 = v66;
          if (v227)
            operator delete(v227);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v205);

          std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v230[0].__end_, (uint64_t)v214);
          v232 = v216;
          v233 = 0;
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&__v.__begin_, (uint64_t)&v230[0].__end_);
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
          __p[0] = &buf;
          v67 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v203, &buf, (_OWORD **)__p);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v67 + 4), (uint64_t)&__v.__begin_);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf.__r_.__value_.__l.__data_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v230[0].__end_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v214);

        }
        else if (v22 == 8)
        {
          objc_msgSend(v185, "stateConstraint");
          v23 = (MLStateConstraint *)objc_claimAutoreleasedReturnValue();
          std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&__v.__begin_, (uint64_t)v230);
          v243 = DWORD2(v231);
          v244 = 0;
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&buf.__r_.__value_.__l.__size_, (uint64_t)&__v.__begin_);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
          v214[0] = __p;
          v24 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v203, __p, (_OWORD **)v214);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v24 + 4), (uint64_t)&buf.__r_.__value_.__l.__size_);
          if (SBYTE7(v239) < 0)
            operator delete(__p[0]);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&buf.__r_.__value_.__l.__size_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v230);

        }
        goto LABEL_126;
      }
      objc_msgSend(v185, "imageConstraint");
      v179 = (id)objc_claimAutoreleasedReturnValue();
      v49 = +[MLImageConstraint imagePixelTypeFromOSType:](MLImageConstraint, "imagePixelTypeFromOSType:", objc_msgSend(v179, "pixelFormatType"));
      v50 = 10;
      if (v49 <= 29)
      {
        if (v49 == 20)
        {
          v50 = 20;
        }
        else if (!v49)
        {
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "This is a logic error, encountered unsupported pixel format type.");
          __cxa_throw(exception, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
        }
      }
      else if (v49 == 30)
      {
        v50 = 30;
      }
      else if (v49 == 40)
      {
        v50 = 40;
      }
      v177 = v50;
      v205 = 0;
      v206 = 0;
      v207 = 0;
      v208 = 0;
      v209 = 0;
      v176 = objc_msgSend(v179, "pixelsWide");
      v175 = objc_msgSend(v179, "pixelsHigh");
      objc_msgSend(v179, "sizeConstraint");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v178, "type");
      switch(v68)
      {
        case 0:
          CoreML::NNCompiler::MLImageShapeInfo::MLImageShapeInfo((uint64_t)&buf, v176, v175, v177);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>>((uint64_t)&v205, (uint64_t)&buf);
          goto LABEL_122;
        case 2:
          v218 = 0;
          v217 = 0;
          v219 = 0;
          objc_msgSend(v178, "enumeratedImageSizes");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          std::vector<std::pair<unsigned long,unsigned long>>::reserve(&v217, objc_msgSend(v76, "count"));

          v241 = 0u;
          v240 = 0u;
          v239 = 0u;
          *(_OWORD *)__p = 0u;
          objc_msgSend(v178, "enumeratedImageSizes");
          obja = (id)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __p, &buf, 16);
          if (v77)
          {
            v78 = *(_QWORD *)v239;
            v79 = v219;
            v80 = v218;
            v81 = (uint64_t *)v217;
            do
            {
              for (m = 0; m != v77; ++m)
              {
                if (*(_QWORD *)v239 != v78)
                  objc_enumerationMutation(obja);
                v83 = (void *)*((_QWORD *)__p[1] + m);
                v84 = objc_msgSend(v83, "pixelsWide");
                v85 = v19;
                v86 = objc_msgSend(v83, "pixelsHigh");
                v87 = v86;
                if (v80 >= v79)
                {
                  v88 = ((char *)v80 - (char *)v81) >> 4;
                  v89 = v88 + 1;
                  if ((unint64_t)(v88 + 1) >> 60)
                  {
                    v217 = v81;
                    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                  }
                  if (v79 - v81 > v89)
                    v89 = v79 - v81;
                  if ((unint64_t)((char *)v79 - (char *)v81) >= 0x7FFFFFFFFFFFFFF0)
                    v90 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v90 = v89;
                  v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v90);
                  v93 = (uint64_t *)&v91[16 * v88];
                  *v93 = v84;
                  v93[1] = v87;
                  if (v80 == v81)
                  {
                    v95 = &v91[16 * v88];
                  }
                  else
                  {
                    v94 = &v91[16 * v88];
                    do
                    {
                      v95 = v94 - 16;
                      *((_OWORD *)v94 - 1) = *((_OWORD *)v80 - 1);
                      v80 -= 2;
                      v94 -= 16;
                    }
                    while (v80 != v81);
                  }
                  v79 = (uint64_t *)&v91[16 * v92];
                  v80 = v93 + 2;
                  v19 = v85;
                  if (v81)
                    operator delete(v81);
                  v81 = (uint64_t *)v95;
                }
                else
                {
                  *v80 = v84;
                  v80[1] = v86;
                  v80 += 2;
                }
              }
              v219 = v79;
              v218 = v80;
              v217 = v81;
              v77 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __p, &buf, 16);
            }
            while (v77);
          }

          v20 = v192;
          CoreML::NNCompiler::MLImageShapeInfo::MLImageShapeInfo((uint64_t)v214, v176, v175, (uint64_t **)&v217, v177);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>>((uint64_t)&v205, (uint64_t)v214);
          v209 = v216;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v214);
          if (v217)
            operator delete(v217);
          break;
        case 3:
          v69 = (void *)objc_msgSend(v178, "pixelsWideRange");
          v70 = objc_msgSend(v178, "pixelsWideRange");
          v72 = v71;
          v73 = objc_msgSend(v178, "pixelsHighRange");
          v74 = objc_msgSend(v178, "pixelsHighRange");
          __p[0] = v69;
          __p[1] = (void *)(v72 + v70 - 1);
          *(_QWORD *)&v239 = v73;
          *((_QWORD *)&v239 + 1) = v75 + v74 - 1;
          CoreML::NNCompiler::MLImageShapeInfo::MLImageShapeInfo((uint64_t)&buf, v176, v175, (uint64_t *)__p, v177);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>>((uint64_t)&v205, (uint64_t)&buf);
LABEL_122:
          v209 = v249;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&buf);
          break;
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v230[0].__end_, (uint64_t)&v205);
      v232 = v209;
      v233 = 1;
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&__v.__begin_, (uint64_t)&v230[0].__end_);
      std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
      __p[0] = &buf;
      v96 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v203, &buf, (_OWORD **)__p);
      std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v96 + 4), (uint64_t)&__v.__begin_);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v230[0].__end_);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v205);

LABEL_126:
    }
    v182 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v210, v234, 16);
  }
  while (v182);
LABEL_128:

  v97 = v181;
  *((_QWORD *)&v210 + 1) = 0;
  *(_QWORD *)&v211 = 0;
  *(_QWORD *)&v210 = (char *)&v210 + 8;
  memset(v230, 0, sizeof(v230));
  v231 = 0u;
  objc_msgSend(v97, "stateDescriptionsByName");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", v230, &buf, 16);
  if (v98)
  {
    data = v230[0].__end_cap_.__value_->__r_.__value_.__l.__data_;
    do
    {
      for (n = 0; n != v98; ++n)
      {
        if (v230[0].__end_cap_.__value_->__r_.__value_.__l.__data_ != data)
          objc_enumerationMutation(v193);
        v101 = (void *)*((_QWORD *)&v230[0].__end_->__r_.__value_.__l.__data_ + n);
        objc_msgSend(v97, "stateDescriptionsByName");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectForKeyedSubscript:", v101);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v103, "stateConstraint");
        v104 = (MLStateConstraint *)objc_claimAutoreleasedReturnValue();
        std::__variant_detail::__move_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&__v.__begin_, (uint64_t)__p);
        v243 = DWORD2(v241);
        v244 = 0;
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v234[1], (uint64_t)&__v.__begin_);
        std::string::basic_string[abi:ne180100]<0>(v214, (char *)objc_msgSend(objc_retainAutorelease(v101), "UTF8String"));
        v205 = v214;
        v105 = std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v210, v214, (_OWORD **)&v205);
        std::__variant_detail::__assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>>((uint64_t)(v105 + 4), (uint64_t)&v234[1]);
        if (v215 < 0)
          operator delete(v214[0]);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v234[1]);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLMultiArrayShapeInfo,CoreML::NNCompiler::MLImageShapeInfo>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&__v.__begin_);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<CoreML::NNCompiler::MLFixedShape,CoreML::NNCompiler::MLRangeShape,CoreML::NNCompiler::MLEnumeratedShape>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)__p);

      }
      v98 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", v230, &buf, 16);
    }
    while (v98);
  }

  objc_msgSend(v97, "outputDescriptionsByName");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v194, "allKeys");
  v106 = (id)objc_claimAutoreleasedReturnValue();
  memset(v230, 0, 24);
  std::vector<std::string>::reserve(v230, objc_msgSend(v106, "count"));
  objb = (id)MEMORY[0x1A1AD6ED8]();
  v236 = 0u;
  v237 = 0u;
  *(_OWORD *)v234 = 0u;
  v235 = 0u;
  v107 = v106;
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", v234, &buf, 16);
  if (v108)
  {
    v109 = *(_QWORD *)v235;
    do
    {
      for (ii = 0; ii != v108; ++ii)
      {
        if (*(_QWORD *)v235 != v109)
          objc_enumerationMutation(v107);
        v111 = (char *)objc_msgSend(objc_retainAutorelease(*((id *)v234[1] + ii)), "UTF8String");
        end = v230[0].__end_;
        if (v230[0].__end_ >= v230[0].__end_cap_.__value_)
        {
          v114 = 0xAAAAAAAAAAAAAAABLL * (((char *)v230[0].__end_ - (char *)v230[0].__begin_) >> 3);
          v115 = v114 + 1;
          if (v114 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v230[0].__end_cap_.__value_ - (char *)v230[0].__begin_) >> 3) > v115)
            v115 = 0x5555555555555556 * (((char *)v230[0].__end_cap_.__value_ - (char *)v230[0].__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v230[0].__end_cap_.__value_ - (char *)v230[0].__begin_) >> 3) >= 0x555555555555555)
            v116 = 0xAAAAAAAAAAAAAAALL;
          else
            v116 = v115;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v230[0].__end_cap_;
          if (v116)
            v117 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v230[0].__end_cap_, v116);
          else
            v117 = 0;
          __v.__first_ = v117;
          __v.__begin_ = v117 + v114;
          __v.__end_ = __v.__begin_;
          __v.__end_cap_.__value_ = &v117[v116];
          std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, v111);
          ++__v.__end_;
          std::vector<std::string>::__swap_out_circular_buffer(v230, &__v);
          v113 = v230[0].__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v230[0].__end_->__r_.__value_.__r.__words, v111);
          v113 = end + 1;
        }
        v230[0].__end_ = v113;
      }
      v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", v234, &buf, 16);
    }
    while (v108);
  }

  objc_autoreleasePoolPop(objb);
  CoreML::MLNeuralNetworkUtilities::getEspressoConfigurationsFromShapeInfos((uint64_t)&v200, &v203, &v210, (uint64_t)v230, 1, 0, v170);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v230;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::destroy(*((_QWORD **)&v210 + 1));
  std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::destroy(v204[0]);
LABEL_159:

  if (!v202)
  {
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v173;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 1);
    v187 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_212;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v200;
  if (v200 == &v201)
  {
LABEL_208:
    v187 = v119;
    goto LABEL_211;
  }
  v121 = (void *)*MEMORY[0x1E0CB2D50];
  while (2)
  {
    CoreML::MLNeuralNetworkUtilities::hashConfigShapesToConfigurationName(&buf, (const Espresso::net_configuration *)(v120 + 7));
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_buf = &buf;
    else
      p_buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    objc_msgSend(v173, "stringByAppendingFormat:", CFSTR("_%s"), p_buf);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v172, "containsObject:", v123))
    {
      objc_msgSend(v119, "addObject:", v123);

      v124 = 3;
      goto LABEL_194;
    }

    CoreML::MLNeuralNetworkUtilities::encodeConfigurationNameIfNeeded((std::string *)v234, (uint64_t)&buf, v170);
    v125 = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    else
      size = buf.__r_.__value_.__l.__size_;
    v127 = (void *)BYTE7(v235);
    if ((SBYTE7(v235) & 0x80u) == 0)
    {
      v128 = v234;
    }
    else
    {
      v127 = v234[1];
      v128 = (void **)v234[0];
    }
    if ((void *)size == v127)
    {
      if ((*((_BYTE *)&buf.__r_.__value_.__s + 23) & 0x80) != 0)
      {
        if (memcmp(buf.__r_.__value_.__l.__data_, v128, buf.__r_.__value_.__l.__size_))
          goto LABEL_181;
      }
      else if (*((_BYTE *)&buf.__r_.__value_.__s + 23))
      {
        v129 = &buf;
        v130 = v128;
        while (v129->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v130)
        {
          v129 = (std::string *)((char *)v129 + 1);
          v130 = (void **)((char *)v130 + 1);
          if (!--v125)
            goto LABEL_184;
        }
        goto LABEL_181;
      }
LABEL_184:
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v132 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v139 = &buf;
        else
          v139 = (std::string *)buf.__r_.__value_.__r.__words[0];
        LODWORD(__v.__first_) = 136315138;
        *(std::__split_buffer<std::string>::pointer *)((char *)&__v.__first_ + 4) = v139;
        _os_log_error_impl(&dword_19C486000, v132, OS_LOG_TYPE_ERROR, "Unable to find a function for configuration name (%s), the model is broken.", (uint8_t *)&__v, 0xCu);
      }

      if (a6)
      {
        v133 = (void *)MEMORY[0x1E0CB35C8];
        __p[0] = v121;
        if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v134 = &buf;
        else
          v134 = (std::string *)buf.__r_.__value_.__r.__words[0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find a function for configuration name (%s), the model is broken."), v134);
        v131 = (std::string *)objc_claimAutoreleasedReturnValue();
        v230[0].__begin_ = v131;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v230, __p, 1);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v135);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        v124 = 1;
        goto LABEL_190;
      }
      v124 = 1;
    }
    else
    {
LABEL_181:
      objc_msgSend(v173, "stringByAppendingFormat:", CFSTR("_%s"), v128);
      v131 = (std::string *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v172, "containsObject:", v131))
      {

        goto LABEL_184;
      }
      objc_msgSend(v119, "addObject:", v131);
      v124 = 3;
LABEL_190:

    }
    if (SBYTE7(v235) < 0)
      operator delete(v234[0]);
LABEL_194:
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v124 == 3)
    {
      v136 = (_QWORD *)v120[1];
      if (v136)
      {
        do
        {
          v137 = (_QWORD **)v136;
          v136 = (_QWORD *)*v136;
        }
        while (v136);
      }
      else
      {
        do
        {
          v137 = (_QWORD **)v120[2];
          v138 = *v137 == v120;
          v120 = v137;
        }
        while (!v138);
      }
      v120 = v137;
      if (v137 == &v201)
        goto LABEL_208;
      continue;
    }
    break;
  }
  v187 = 0;
LABEL_211:

LABEL_212:
  std::__tree<std::__value_type<std::string,Espresso::net_configuration>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::net_configuration>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::net_configuration>>>::destroy(v201);

  if (objc_msgSend(v187, "count"))
  {
    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    v140 = v187;
    v141 = 0;
    v142 = 0;
    v143 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v196, v229, 16);
    if (v143)
    {
      v195 = *(_QWORD *)v197;
      v184 = *MEMORY[0x1E0C99778];
      v186 = *MEMORY[0x1E0C99768];
      objc = v140;
LABEL_215:
      v144 = 0;
      while (1)
      {
        if (*(_QWORD *)v197 != v195)
          objc_enumerationMutation(objc);
        v145 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v196 + 1) + 8 * v144));
        if (!v234[0])
        {
          std::unique_ptr<e5rt_program_function,MLE5ObjectDeleter<e5rt_program_function>>::reset[abi:ne180100]((uint64_t *)v234);
LABEL_251:
          v118 = 0;
          v161 = objc;
          goto LABEL_252;
        }
        __v.__first_ = 0;
        v146 = objc_retainAutorelease(v171);
        objc_msgSend(v146, "UTF8String");
        v147 = e5rt_program_function_retain_inout_tensor_desc();
        v230[0].__begin_ = __v.__first_;
        if ((_DWORD)v147)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v148 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
          {
            last_error_message = e5rt_get_last_error_message();
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = last_error_message;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v147;
            _os_log_error_impl(&dword_19C486000, v148, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", (uint8_t *)&buf, 0x12u);
          }

          if (!a6)
            goto LABEL_244;
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v147);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v149, CFSTR("Failed to get port for state with name = %@"), v146);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          MLE5MultiArrayShapeForTensor();
          v150 = objc_claimAutoreleasedReturnValue();
          v149 = (void *)v150;
          if (v142)
            v151 = v142;
          else
            v151 = (void *)v150;
          v152 = v151;

          if ((objc_msgSend(v152, "isEqualToArray:", v149) & 1) == 0)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v153 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.__r_.__value_.__l.__data_) = 138413058;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v145;
              WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v171;
              HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
              v246 = v152;
              v247 = 2112;
              v248 = v149;
              _os_log_error_impl(&dword_19C486000, v153, OS_LOG_TYPE_ERROR, "The function (%@) has invalid descriptor for state (%@), expected shape (%@) but got (%@)", (uint8_t *)&buf, 0x2Au);
            }

            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v186, CFSTR("The function (%@) has invalid descriptor for state (%@), expected shape (%@) but got (%@)"), v145, v146, v152, v149);
          }
          MLE5MultiArrayStridesForTensor();
          v154 = objc_claimAutoreleasedReturnValue();
          v155 = (void *)v154;
          if (v141)
            v156 = v141;
          else
            v156 = (void *)v154;
          v157 = v156;

          if ((objc_msgSend(v157, "isEqualToArray:", v155) & 1) == 0)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v158 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf.__r_.__value_.__l.__data_) = 138413058;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v145;
              WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v171;
              HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
              v246 = v157;
              v247 = 2112;
              v248 = v155;
              _os_log_error_impl(&dword_19C486000, v158, OS_LOG_TYPE_ERROR, "The function (%@) has invalid descriptor for state (%@), expected strides (%@) but got (%@)", (uint8_t *)&buf, 0x2Au);
            }

            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v186, CFSTR("The function (%@) has invalid descriptor for state (%@), expected strides (%@) but got (%@)"), v145, v146, v157, v155);
          }
          if (MLE5MultiArrayDataTypeForTensor() != 65552)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v159 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.__r_.__value_.__l.__data_) = 0;
              _os_log_error_impl(&dword_19C486000, v159, OS_LOG_TYPE_ERROR, "States are only supported for Float16 tensors.", (uint8_t *)&buf, 2u);
            }

            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v184, CFSTR("States are only supported for Float16 tensors."));
          }

          v141 = v157;
          v142 = v152;
        }

LABEL_244:
        std::unique_ptr<e5rt_tensor_desc,MLE5ObjectDeleter<e5rt_tensor_desc>>::reset[abi:ne180100]((uint64_t *)v230);
        std::unique_ptr<e5rt_program_function,MLE5ObjectDeleter<e5rt_program_function>>::reset[abi:ne180100]((uint64_t *)v234);
        if ((_DWORD)v147)
          goto LABEL_251;
        if (v143 == ++v144)
        {
          v140 = objc;
          v143 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v196, v229, 16);
          if (v143)
            goto LABEL_215;
          break;
        }
      }
    }

    v161 = +[MLMultiArray newMultiArrayForState:strides:dtype:error:](MLMultiArray, "newMultiArrayForState:strides:dtype:error:", v142, v141, 65552, a6);
    if (v161)
    {
      v161 = v161;
      v118 = v161;
    }
    else
    {
      v118 = 0;
    }
LABEL_252:

  }
  else
  {
    v118 = 0;
  }

LABEL_254:
  return v118;
}

- (NSArray)functionNames
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__16;
  v12 = (id)MEMORY[0x1E0C9AA60];
  -[MLE5ProgramLibrary lazyInitQueue](self, "lazyInitQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__MLE5ProgramLibrary_functionNames__block_invoke;
  v6[3] = &unk_1E3D66E20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSString)serializedMILText
{
  void *v2;
  void *v3;

  -[MLE5ProgramLibrary impl](self, "impl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedMILText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MLProgramE5Container)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_lazyInitQueue, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

void __35__MLE5ProgramLibrary_functionNames__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t num_functions;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t last_error_message;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v2, OS_LOG_TYPE_ERROR, "MLE5ProgramLibrary must be successfully prepared before calling .functionNames property.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("MLE5ProgramLibrary must be successfully prepared before calling .functionNames property."));
  }
  num_functions = e5rt_program_library_get_num_functions();
  v4 = (_QWORD *)MEMORY[0x1E0C99750];
  if ((_DWORD)num_functions)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      last_error_message = e5rt_get_last_error_message();
      *(_DWORD *)buf = 138412802;
      v27 = v21;
      v28 = 2080;
      v29 = last_error_message;
      v30 = 1024;
      v31 = num_functions;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Failed to get num of functions for the model: %@ E5RT: %s (%d)", buf, 0x1Cu);

    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", *v4, CFSTR("Failed to get num of functions for the model: %@ E5RT: %s (%d)"), v7, e5rt_get_last_error_message(), num_functions);

  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v24;
    _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Allocation size is too large or zero. Failed to allocate memory to get function names for the model: %@", buf, 0xCu);

  }
  v9 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "raise:format:", *v4, CFSTR("Allocation size is too large or zero. Failed to allocate memory to get function names for the model: %@"), v10);

  v11 = malloc_type_malloc(0, 0x50040EE9192B6uLL);
  if (!v11)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v25;
      _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Failed to allocate memory to get function names for the model: %@", buf, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", *v4, CFSTR("Failed to allocate memory to get function names for the model: %@"), v14);

  }
  if (e5rt_program_library_get_function_names())
  {
    free(v11);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Failed to get function names for the model: %@", buf, 0xCu);

    }
    v16 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", *v4, CFSTR("Failed to get function names for the model: %@"), v17);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  free(v11);
}

void __78__MLE5ProgramLibrary_newStateForFunctionNamed_stateNames_clientBuffers_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MLState *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v5)
        objc_enumerationMutation(v3);
      v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v9 = *(void **)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 56);
        v11 = *(_QWORD *)(a1 + 64);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        obj = *(id *)(v12 + 40);
        objc_msgSend(v9, "_allocateStateBufferForFeatureNamed:entryFunctionName:programFunctionNames:error:", v7, v10, v11, &obj);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v12 + 40), obj);
        v8 = (void *)v13;
        if (!v13)
          break;
      }
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v7);

      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    v14 = -[MLState initWithBackings:]([MLState alloc], "initWithBackings:", v2);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v3 = *(id *)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
  }

}

void __58__MLE5ProgramLibrary_segmentationAnalyticsAndReturnError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t segmentation_analytics;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t last_error_message;
  id obj;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_programLibraryHandleWithForceRespecialization:error:", 0, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    segmentation_analytics = e5rt_program_library_get_segmentation_analytics();
    if ((_DWORD)segmentation_analytics)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        v15 = last_error_message;
        v16 = 1024;
        v17 = segmentation_analytics;
        _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), segmentation_analytics);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v7, CFSTR("Failed to get segmentation analytics for the model: %@."), v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
}

void __101__MLE5ProgramLibrary_createOperationForFunctionName_forceRespecialization_hasRangeShapeInputs_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  uint64_t options_set_operation_name;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t options_set_override_compute_gpu_device;
  NSObject *v35;
  uint64_t last_error_message;
  void *v37;
  uint64_t options_set_dynamic_callables;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t options_set_mutable_mil_weight_paths;
  NSObject *v43;
  void *v44;
  uint64_t precompiled_compute_operation_with_options;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t options_set_experimental_disable_compile_time_mpsgraph_type_inference;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id obj;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_programLibraryHandleWithForceRespecialization:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    v6 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v63 = *(id *)(v7 + 40);
    objc_storeStrong((id *)(v7 + 40), v63);
    if (!v64)
    {
LABEL_41:
      std::unique_ptr<e5rt_program_function,MLE5ObjectDeleter<e5rt_program_function>>::reset[abi:ne180100](&v64);
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "modelConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 65);
    objc_msgSend(*(id *)(a1 + 32), "container");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelVersionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v12 + 40);
    v13 = (id *)(v12 + 40);
    v14 = v15;
    v16 = v8;
    v17 = v11;
    v67 = 0;
    v18 = e5rt_precompiled_compute_op_create_options_create_with_program_function();
    if ((_DWORD)v18)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        v70 = last_error_message;
        v71 = 1024;
        v72 = v18;
        _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v20, CFSTR("Failed to configure the model specializer for the compute devices available on the system."));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v62 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v16, "modelDisplayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (!v23)
    {
      objc_msgSend(v16, "modelDisplayName");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v24, "UTF8String");
      options_set_operation_name = e5rt_precompiled_compute_op_create_options_set_operation_name();

      if ((_DWORD)options_set_operation_name)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v56 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          v70 = v56;
          v71 = 1024;
          v72 = options_set_operation_name;
          _os_log_error_impl(&dword_19C486000, v26, OS_LOG_TYPE_ERROR, "Failed to set name for precompiled compute create options. E5RT: %s (%d)", buf, 0x12u);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to set name for precompiled compute create options. E5RT: %s (%d)"), e5rt_get_last_error_message(), options_set_operation_name);
      }
    }
    objc_msgSend(v16, "preferredMetalDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v29 = v27;
      v68 = 0;
      v30 = e5rt_compute_gpu_device_retain_from_mtl_device();
      if ((_DWORD)v30)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v57 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          v70 = v57;
          v71 = 1024;
          v72 = v30;
          _os_log_error_impl(&dword_19C486000, v31, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v32, CFSTR("The preferred MTLDevice %@ is not supported."), v29);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v66 = 0;
LABEL_17:

LABEL_18:
        v62 = 0;
        std::unique_ptr<e5rt_compute_gpu_device,MLE5ObjectDeleter<e5rt_compute_gpu_device>>::reset[abi:ne180100](&v66);
        v21 = 0;
        goto LABEL_34;
      }
      v33 = v68;
      v66 = v68;

      if (!v33)
        goto LABEL_18;
      options_set_override_compute_gpu_device = e5rt_precompiled_compute_op_create_options_set_override_compute_gpu_device();
      if ((_DWORD)options_set_override_compute_gpu_device)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v60 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          v70 = v60;
          v71 = 1024;
          v72 = options_set_override_compute_gpu_device;
          _os_log_error_impl(&dword_19C486000, v35, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), options_set_override_compute_gpu_device);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v29, CFSTR("The model specializer was unable to use the requested preferred GPU compute device."));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      std::unique_ptr<e5rt_compute_gpu_device,MLE5ObjectDeleter<e5rt_compute_gpu_device>>::reset[abi:ne180100](&v66);
    }
    objc_msgSend(v16, "e5rtDynamicCallableFunctions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    options_set_dynamic_callables = e5rt_precompiled_compute_op_create_options_set_dynamic_callables();

    if ((_DWORD)options_set_dynamic_callables)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v58 = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        v70 = v58;
        v71 = 1024;
        v72 = options_set_dynamic_callables;
        _os_log_error_impl(&dword_19C486000, v39, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), options_set_dynamic_callables);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v40, CFSTR("The model specializer was unable to set the dynamic callable functions."));
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v16, "e5rtMutableMILWeightURLs");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      options_set_mutable_mil_weight_paths = e5rt_precompiled_compute_op_create_options_set_mutable_mil_weight_paths();

      if ((_DWORD)options_set_mutable_mil_weight_paths)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v59 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          v70 = v59;
          v71 = 1024;
          v72 = options_set_mutable_mil_weight_paths;
          _os_log_error_impl(&dword_19C486000, v43, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), options_set_mutable_mil_weight_paths);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v44, CFSTR("The model specializer was unable to set the mutable MIL weight URLs."));
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (!v9
          || (objc_msgSend(v16, "usesCompileTimeMPSGraphTypeInferenceForModelVersion:", v17),
              options_set_experimental_disable_compile_time_mpsgraph_type_inference = e5rt_precompiled_compute_op_create_options_set_experimental_disable_compile_time_mpsgraph_type_inference(),
              !(_DWORD)options_set_experimental_disable_compile_time_mpsgraph_type_inference))
        {
          v21 = v67;
          v62 = v67;
          goto LABEL_34;
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v61 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          v70 = v61;
          v71 = 1024;
          v72 = options_set_experimental_disable_compile_time_mpsgraph_type_inference;
          _os_log_error_impl(&dword_19C486000, v54, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), options_set_experimental_disable_compile_time_mpsgraph_type_inference);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v55, CFSTR("The model specializer was unable to configure MPSGraph compile time type inference."));
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v21 = 0;
    v62 = 0;
LABEL_34:

LABEL_35:
    objc_storeStrong(v13, v14);

    if (v21)
    {
      precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();
      if ((_DWORD)precompiled_compute_operation_with_options)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v52 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          v70 = v52;
          v71 = 1024;
          v72 = precompiled_compute_operation_with_options;
          _os_log_error_impl(&dword_19C486000, v46, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
        }

        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), precompiled_compute_operation_with_options);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "modelDisplayName");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v47, CFSTR("Failed to prepare the model for predictions. ML program was %@ and the function name was %@."), v48, *(_QWORD *)(a1 + 40));
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v51 = *(void **)(v50 + 40);
        *(_QWORD *)(v50 + 40) = v49;

      }
    }
    std::unique_ptr<e5rt_precompiled_compute_op_create_options,MLE5ObjectDeleter<e5rt_precompiled_compute_op_create_options>>::reset[abi:ne180100](&v62);
    goto LABEL_41;
  }
}

void __60__MLE5ProgramLibrary_initWithContainer_configuration_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(std::__shared_weak_count **)(v1 + 56);
  *(_QWORD *)(v1 + 48) = 0;
  *(_QWORD *)(v1 + 56) = 0;
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
}

@end
