@implementation _ANEProgramForEvaluation

- (_ANEProgramForEvaluation)initWithController:(id)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5
{
  int v5;
  id v9;
  _ANEProgramForEvaluation *v10;
  _ANEProgramForEvaluation *v11;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *requestsInFlight;
  objc_super v15;

  v5 = a5;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_ANEProgramForEvaluation;
  v10 = -[_ANEProgramForEvaluation init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_controller, a3);
    v11->_programHandle = objc_msgSend(v9, "programHandle");
    v11->_intermediateBufferHandle = a4;
    v11->_queueDepth = v5;
    v12 = dispatch_semaphore_create(v5);
    requestsInFlight = v11->_requestsInFlight;
    v11->_requestsInFlight = (OS_dispatch_semaphore *)v12;

    v11->_currentAsyncRequestsInFlight = 0;
    -[_ANEDeviceController start](v11->_controller, "start");
  }

  return v11;
}

+ (id)programWithController:(id)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithController:intermediateBufferHandle:queueDepth:", v8, a4, v5);

  return v9;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (_ANEDeviceController)controller
{
  return self->_controller;
}

+ (id)new
{
  return 0;
}

- (_ANEProgramForEvaluation)init
{

  return 0;
}

+ (id)programWithHandle:(unint64_t)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5
{
  uint64_t v5;
  void *v8;
  void *v9;

  v5 = a5;
  +[_ANEDeviceController controllerWithProgramHandle:](_ANEDeviceController, "controllerWithProgramHandle:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithController:intermediateBufferHandle:queueDepth:", v8, a4, v5);

  return v9;
}

- (void)dealloc
{
  _ANEDeviceController *controller;
  objc_super v4;

  -[_ANEDeviceController stop](self->_controller, "stop");
  controller = self->_controller;
  self->_controller = 0;

  v4.receiver = self;
  v4.super_class = (Class)_ANEProgramForEvaluation;
  -[_ANEProgramForEvaluation dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { programHandle=%llu : intermediateBufferHandle=%llu : queueDepth=%d }"), v5, -[_ANEProgramForEvaluation programHandle](self, "programHandle"), -[_ANEProgramForEvaluation intermediateBufferHandle](self, "intermediateBufferHandle"), -[_ANEProgramForEvaluation queueDepth](self, "queueDepth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)programInferenceOtherErrorForMessage:(ANENotificationMessageStruct *)a3 model:(id)a4 methodName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int var1;
  int var0;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: ANEProgramProcessRequestDirect() Failed with status=0x%x : statusType=0x%x"), v8, a3->var1, a3->var0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANELog common](_ANELog, "common");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    var0 = a3->var0;
    var1 = a3->var1;
    *(_DWORD *)buf = 138413058;
    v19 = v8;
    v20 = 1024;
    v21 = var1;
    v22 = 1024;
    v23 = var0;
    v24 = 2112;
    v25 = v7;
    _os_log_error_impl(&dword_1D3352000, v10, OS_LOG_TYPE_ERROR, "%@: ANEProgramProcessRequestDirect() Failed with status=0x%x : statusType=0x%x lModel=%@", buf, 0x22u);
  }

  v11 = a3->var1;
  if (v11 == 14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program not found"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors programInferenceProgramNotFoundForMethod:](_ANEErrors, "programInferenceProgramNotFoundForMethod:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11 != 15)
    {
      +[_ANEErrors programInferenceOtherErrorForMethod:](_ANEErrors, "programInferenceOtherErrorForMethod:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program Inference timeout"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors timeoutErrorForMethod:](_ANEErrors, "timeoutErrorForMethod:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

LABEL_9:
  return v14;
}

- (BOOL)processRequest:(id)a3 model:(id)a4 qos:(unsigned int)a5 qIndex:(unint64_t)a6 modelStringID:(unint64_t)a7 options:(id)a8 returnValue:(unsigned int *)a9 error:(id *)a10
{
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  char v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  BOOL v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  unsigned int j;
  void *v41;
  uint64_t v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int k;
  void *v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  uint64_t *v71;
  uint64_t m;
  uint64_t n;
  void *v74;
  BOOL v75;
  void *v76;
  void *v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  unint64_t v84;
  NSObject *v85;
  void *v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  unint64_t v94;
  NSObject *v95;
  _DWORD *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  id v100;
  id v101;
  void *v102;
  uint64_t v103;
  void *v104;
  _QWORD *v105;
  unsigned int v106;
  NSObject *v107;
  NSObject *v108;
  uint64_t ii;
  void *v111;
  void *v112;
  unsigned int v113;
  id v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  const char *aSelector;
  _BOOL4 v124;
  void *context;
  int v126;
  void *v127;
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  void *v132;
  id v133;
  id v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t *v137;
  _BYTE *v138;
  const char *v139;
  uint64_t v140;
  int v141;
  BOOL v142;
  _DWORD v143[4];
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  char v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  int v164;
  void *v165;
  __int16 v166;
  unsigned int v167;
  __int16 v168;
  id v169;
  _BYTE v170[24];
  char v171;
  _BYTE v172[128];
  int v173;
  id v174;
  __int16 v175;
  _BYTE v176[14];
  __int16 v177;
  uint64_t v178;
  __int16 v179;
  id v180;
  int v181;
  _QWORD v182[770];
  int v183;
  int v184;
  int v185;
  char v186;
  char v187;
  uint64_t v188;
  uint64_t v189;
  int v190;
  uint64_t v191;

  v10 = MEMORY[0x1E0C80A78](self, a2, a3, a4, *(_QWORD *)&a5, a6, a7, a8);
  v12 = v11;
  v122 = v14;
  aSelector = v13;
  v16 = v15;
  v126 = v17;
  v19 = v18;
  v127 = (void *)v10;
  v191 = *MEMORY[0x1E0C80C00];
  v21 = v20;
  v22 = v19;
  v128 = v12;
  v158 = 0;
  v159 = &v158;
  v160 = 0x3032000000;
  v161 = __Block_byref_object_copy_;
  v162 = __Block_byref_object_dispose_;
  v163 = 0;
  v154 = 0;
  v155 = &v154;
  v156 = 0x2020000000;
  v157 = 1;
  context = (void *)MEMORY[0x1D824DB90]();
  v129 = v22;
  v23 = objc_msgSend(v21, "validate");
  *((_BYTE *)v155 + 24) = v23;
  if ((v23 & 1) == 0)
  {
LABEL_12:
    v31 = 0;
    goto LABEL_83;
  }
  v24 = dispatch_time(0, 10000000000);
  objc_msgSend(v21, "completionHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v124 = 0;
  }
  else
  {
    objc_msgSend(v21, "sharedEvents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v26 == 0;

  }
  +[_ANELog common](_ANELog, "common");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(aSelector);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = 138412802;
    v174 = v111;
    v175 = 2112;
    *(_QWORD *)v176 = v129;
    *(_WORD *)&v176[8] = 1024;
    *(_DWORD *)&v176[10] = v124;
    _os_log_debug_impl(&dword_1D3352000, v27, OS_LOG_TYPE_DEBUG, "%@ ANEProgramProcessRequestDirect() for lModel %@ waitForResults is %d", (uint8_t *)&v173, 0x1Cu);

  }
  if (!v124)
  {
    objc_msgSend(v127, "requestsInFlight");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_semaphore_wait(v28, v24) == 0;

    if (!v29)
    {
      +[_ANELog common](_ANELog, "common");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v114 = (id)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend(v127, "queueDepth");
        v116 = objc_msgSend(v127, "currentAsyncRequestsInFlight");
        v173 = 138413314;
        v174 = v114;
        v175 = 1024;
        *(_DWORD *)v176 = 15;
        *(_WORD *)&v176[4] = 2048;
        *(_QWORD *)&v176[6] = v115;
        v177 = 2048;
        v178 = v116;
        v179 = 2112;
        v180 = v129;
        _os_log_error_impl(&dword_1D3352000, v30, OS_LOG_TYPE_ERROR, "%@: Async Request could not be queued - timed out ret=0x%xself.queueDepth=%ld : self.currentAsyncRequestsInFlight=%ld lModel=%@", (uint8_t *)&v173, 0x30u);

      }
      goto LABEL_12;
    }
    objc_msgSend(v127, "setCurrentAsyncRequestsInFlight:", objc_msgSend(v127, "currentAsyncRequestsInFlight") + 1);
  }
  bzero(&v173, 0x3030uLL);
  v150 = 0;
  v151 = &v150;
  v152 = 0x2020000000;
  v153 = 0;
  objc_msgSend(v128, "objectForKeyedSubscript:", kANEFPerformanceStatsMaskKey[0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v32;
  if (v32)
  {
    if ((objc_msgSend(v32, "unsignedIntValue") & 4) != 0)
    {
      v149 = 0u;
      v148 = 0u;
      v147 = 0u;
      v146 = 0u;
      objc_msgSend(v21, "perfStatsArray");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v146, v172, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v147;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v147 != v35)
              objc_enumerationMutation(v33);
            v37 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
            if (objc_msgSend(v37, "statType") == 2)
            {
              objc_msgSend(v37, "stats");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v189 = objc_msgSend(v38, "ioSurface");

            }
          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v146, v172, 16);
        }
        while (v34);
      }

    }
    LODWORD(v32) = +[_ANEPerformanceStats driverMaskForANEFMask:](_ANEPerformanceStats, "driverMaskForANEFMask:", objc_msgSend(v121, "unsignedIntValue"));
  }
  v190 = (int)v32;
  *((_DWORD *)v151 + 6) = (_DWORD)v32;
  objc_msgSend(v21, "inputArray");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v174) = objc_msgSend(v39, "count");

  for (j = 0; ; j = v42 + 1)
  {
    objc_msgSend(v21, "inputArray");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = j;
    v43 = objc_msgSend(v41, "count") > (unint64_t)j;

    if (!v43)
      break;
    objc_msgSend(v21, "inputArray");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(id *)((char *)&v174 + 24 * v42 + 4) = (id)objc_msgSend(v45, "ioSurface");

    objc_msgSend(v21, "inputIndexArray");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)&v176[24 * v42 + 2] = objc_msgSend(v47, "unsignedIntegerValue");

    objc_msgSend(v21, "inputArray");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", v42);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "startOffset");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)&v177 + 6 * v42) = objc_msgSend(v50, "unsignedIntegerValue");

  }
  objc_msgSend(v21, "outputArray");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = objc_msgSend(v51, "count");

  for (k = 0; ; k = v54 + 1)
  {
    objc_msgSend(v21, "outputArray");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = k;
    v55 = objc_msgSend(v53, "count") > (unint64_t)k;

    if (!v55)
      break;
    objc_msgSend(v21, "outputArray");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectAtIndexedSubscript:", v54);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v182[3 * v54] = objc_msgSend(v57, "ioSurface");

    objc_msgSend(v21, "outputIndexArray");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", v54);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v182[3 * v54 + 1]) = objc_msgSend(v59, "unsignedIntegerValue");

    objc_msgSend(v21, "outputArray");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectAtIndexedSubscript:", v54);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "startOffset");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v182[3 * v54 + 2]) = objc_msgSend(v62, "unsignedIntegerValue");

  }
  objc_msgSend(v21, "weightsBuffer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63 == 0;

  if (!v64)
  {
    objc_msgSend(v21, "weightsBuffer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = objc_msgSend(v65, "ioSurface");

  }
  objc_msgSend(v21, "procedureIndex");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v66, "unsignedIntegerValue");

  v182[769] = objc_msgSend(v127, "programHandle");
  v183 = v16;
  v185 = v126;
  v184 = 0;
  objc_msgSend(v128, "objectForKeyedSubscript:", kANEFDisableIOFencesUseSharedEventsKey[0]);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v67;
  if (v67)
  {
    v186 = objc_msgSend(v67, "BOOLValue");
    +[_ANELog common](_ANELog, "common");
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "BOOLValue");
      -[_ANEProgramForEvaluation processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:].cold.2();
    }

  }
  else
  {
    v186 = 0;
  }
  objc_msgSend(v128, "objectForKeyedSubscript:", kANEFEnableFWToFWSignal[0]);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v69;
  if (v69)
  {
    v187 = objc_msgSend(v69, "BOOLValue");
    +[_ANELog common](_ANELog, "common");
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "BOOLValue");
      -[_ANEProgramForEvaluation processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:].cold.1();
    }

  }
  else
  {
    v187 = 0;
  }
  v71 = &v145;
  for (m = 2; m != 514; m += 8)
    *(_QWORD *)&v143[m] = 0;
  for (n = 514; n != 1026; n += 8)
    *(_QWORD *)&v143[n] = 0;
  objc_msgSend(v21, "sharedEvents");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74 == 0;

  if (v75)
  {
    v96 = 0;
  }
  else
  {
    bzero(v143, 0x1008uLL);
    objc_msgSend(v21, "sharedEvents");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "signalEvents");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "count");
    v143[1] = v78;
    if (v78)
    {
      v79 = 0;
      v80 = v78;
      v117 = 134218240;
      do
      {
        objc_msgSend(v77, "objectAtIndexedSubscript:", v79, v117);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "sharedEvent");
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = (void *)*v71;
        *v71 = v82;

        v71[1] = objc_msgSend(v81, "value");
        v84 = objc_msgSend(v81, "eventType");
        if (v84 >= 6)
        {
          +[_ANELog common](_ANELog, "common");
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v170 = v117;
            *(_QWORD *)&v170[4] = v84;
            *(_WORD *)&v170[12] = 2048;
            *(_QWORD *)&v170[14] = 0;
            _os_log_error_impl(&dword_1D3352000, v85, OS_LOG_TYPE_ERROR, "Unknown _ANESignalEventType=%lu using (%lu)", v170, 0x16u);
          }

          LODWORD(v84) = 0;
        }
        *((_DWORD *)v71 + 4) = v84;
        *((_DWORD *)v71 + 5) = objc_msgSend(v81, "symbolIndex");
        v71[3] = objc_msgSend(v81, "agentMask");

        ++v79;
        v71 += 4;
      }
      while (v80 != v79);
    }
    objc_msgSend(v76, "waitEvents");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "count");
    v143[0] = v87;
    if (v87)
    {
      v88 = 0;
      v89 = v87;
      v90 = &v144;
      v118 = 134218240;
      do
      {
        objc_msgSend(v86, "objectAtIndexedSubscript:", v88, v118);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "sharedEvent");
        v92 = objc_claimAutoreleasedReturnValue();
        v93 = (void *)*(v90 - 1);
        *(v90 - 1) = v92;

        *v90 = objc_msgSend(v91, "value");
        v94 = objc_msgSend(v91, "eventType");
        if (v94 >= 3)
        {
          +[_ANELog common](_ANELog, "common");
          v95 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v170 = v118;
            *(_QWORD *)&v170[4] = v94;
            *(_WORD *)&v170[12] = 2048;
            *(_QWORD *)&v170[14] = 0;
            _os_log_error_impl(&dword_1D3352000, v95, OS_LOG_TYPE_ERROR, "Unknown _ANEWaitEventType=%lu using (%lu)", v170, 0x16u);
          }

          LODWORD(v94) = 0;
        }
        *((_DWORD *)v90 + 2) = v94;

        ++v88;
        v90 += 4;
      }
      while (v89 != v88);
    }

    v96 = v143;
  }
  objc_msgSend(v21, "completionHandler");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)v155 + 24) = 1;
  kdebug_trace();
  *(_QWORD *)v170 = 0;
  *(_QWORD *)&v170[8] = v170;
  *(_QWORD *)&v170[16] = 0x2020000000;
  v171 = 0;
  objc_msgSend(v127, "controller", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v98, "device");
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __100___ANEProgramForEvaluation_processRequest_model_qos_qIndex_modelStringID_options_returnValue_error___block_invoke;
  v130[3] = &unk_1E95160E0;
  v139 = aSelector;
  v141 = v126;
  v135 = &v154;
  v136 = &v158;
  v100 = v129;
  v131 = v100;
  v132 = v127;
  v137 = &v150;
  v133 = v21;
  v140 = v122;
  v101 = v97;
  v142 = v124;
  v134 = v101;
  v138 = v170;
  objc_msgSend(v133, "transactionHandle");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "unsignedIntegerValue");
  objc_msgSend(v133, "transactionHandle");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v130;
  if (v99 && *(_QWORD *)v99)
    v106 = (*(uint64_t (**)(uint64_t, int *, _QWORD *, _DWORD *, _BOOL4, uint64_t, BOOL))(*(_QWORD *)v99 + 32))(v99, &v173, v105, v96, v124, v103, v104 != 0);
  else
    v106 = 2;

  *a9 = v106;
  if (*a9)
  {
    if (!*(_BYTE *)(*(_QWORD *)&v170[8] + 24))
    {
      objc_msgSend(v127, "requestsInFlight");
      v107 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v107);

      objc_msgSend(v127, "setCurrentAsyncRequestsInFlight:", objc_msgSend(v127, "currentAsyncRequestsInFlight") - 1);
    }
    +[_ANELog common](_ANELog, "common");
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = *a9;
      v164 = 138412802;
      v165 = v112;
      v166 = 1024;
      v167 = v113;
      v168 = 2112;
      v169 = v100;
      _os_log_error_impl(&dword_1D3352000, v108, OS_LOG_TYPE_ERROR, "%@: Could not process request ret=0x%x lModel=%@", (uint8_t *)&v164, 0x1Cu);

    }
  }
  else if (v124 && !*((_BYTE *)v155 + 24))
  {
    *a9 = 18;
  }

  _Block_object_dispose(v170, 8);
  for (ii = 1018; ii != 506; ii -= 8)

  do
  {

    ii -= 8;
  }
  while (ii != -6);

  _Block_object_dispose(&v150, 8);
  v31 = 1;
LABEL_83:

  objc_autoreleasePoolPop(context);
  if (v31)
  {
    if (a10)
      *a10 = objc_retainAutorelease((id)v159[5]);
    LOBYTE(v31) = *a9 == 0;
  }
  _Block_object_dispose(&v154, 8);
  _Block_object_dispose(&v158, 8);

  return v31;
}

- (BOOL)processOutputSet:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  _BYTE v31[24];
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1D824DB90]();
  +[_ANELog common](_ANELog, "common");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = v20;
    v30 = 2048;
    *(_QWORD *)v31 = v10;
    *(_WORD *)&v31[8] = 2112;
    *(_QWORD *)&v31[10] = v11;
    _os_log_debug_impl(&dword_1D3352000, v13, OS_LOG_TYPE_DEBUG, "-----> %@: processOutputSet() outputSet=%p lModel=%@ : ", buf, 0x20u);

  }
  v24 = objc_msgSend(v10, "procedureIndex", -[_ANEProgramForEvaluation programHandle](self, "programHandle"));
  v25 = objc_msgSend(v10, "setIndex");
  v26 = objc_msgSend(v10, "signalValue");
  v27 = objc_msgSend(v10, "signalNotRequired");
  BYTE1(v27) = objc_msgSend(v10, "isOpenLoop");
  -[_ANEProgramForEvaluation controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "device");
  if (v15 && *(_QWORD *)v15)
  {
    v16 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v15 + 40))(v15, &v23);

    if (!v16)
    {
      v17 = 1;
      goto LABEL_11;
    }
  }
  else
  {

    v16 = 2;
  }
  +[_ANELog common](_ANELog, "common");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[_ANEProgramForEvaluation programHandle](self, "programHandle");
    *(_DWORD *)buf = 138413314;
    v29 = v21;
    v30 = 1024;
    *(_DWORD *)v31 = v16;
    *(_WORD *)&v31[4] = 2112;
    *(_QWORD *)&v31[6] = v11;
    *(_WORD *)&v31[14] = 2048;
    *(_QWORD *)&v31[16] = v22;
    v32 = 2048;
    v33 = v26;
    _os_log_error_impl(&dword_1D3352000, v18, OS_LOG_TYPE_ERROR, "%@: Could not process output set enqueue request ret=0x%x lModel=%@ programHandle=%llu signalValue=%llu", buf, 0x30u);

  }
  v17 = 0;
LABEL_11:
  objc_autoreleasePoolPop(v12);
  if (a6)
    *a6 = 0;

  return v17;
}

- (BOOL)processInputBuffers:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  unsigned int i;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  unsigned int j;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  NSObject *v33;
  void *v35;
  void *v36;
  unint64_t v37;
  id v38;
  void *v39;
  _QWORD *v41;
  void *context;
  id v43;
  id v44;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  _BYTE v50[14];
  __int16 v51;
  unint64_t v52;
  _BYTE v53[12];
  _BYTE v54[10];
  __int16 v55;
  id v56;
  _QWORD v57[258];

  v57[256] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v44 = a4;
  v43 = a5;
  context = (void *)MEMORY[0x1D824DB90]();
  +[_ANELog common](_ANELog, "common");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v53 = 138412802;
    *(_QWORD *)&v53[4] = v35;
    *(_WORD *)v54 = 2048;
    *(_QWORD *)&v54[2] = v8;
    v55 = 2112;
    v56 = v44;
    _os_log_debug_impl(&dword_1D3352000, v9, OS_LOG_TYPE_DEBUG, "-----> %@: processInputBuffers() inputBuffers=%p lModel=%@ : ", v53, 0x20u);

  }
  bzero(&v54[4], 0xBF8uLL);
  *(_QWORD *)v53 = -[_ANEProgramForEvaluation programHandle](self, "programHandle");
  *(_DWORD *)&v53[8] = objc_msgSend(v8, "procedureIndex");
  v57[255] = objc_msgSend(v8, "executionDelay");
  objc_msgSend(v8, "inputBufferInfoIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (unint64_t)objc_msgSend(v10, "count") > 0xFF;

  if (v11)
  {
    +[_ANELog common](_ANELog, "common");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputBufferInfoIndex");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = v38;
      v49 = 2048;
      *(_QWORD *)v50 = objc_msgSend(v39, "count");
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)&v50[10] = 255;
      _os_log_error_impl(&dword_1D3352000, v12, OS_LOG_TYPE_ERROR, "%@: inputBuffers inputBufferInfoIndex=%lu exceeds max=%d", buf, 0x1Cu);

    }
  }
  objc_msgSend(v8, "inputBufferInfoIndex", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v54 = objc_msgSend(v13, "count");

  for (i = 0; ; i = v16 + 1)
  {
    objc_msgSend(v8, "inputBufferInfoIndex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = i;
    v17 = objc_msgSend(v15, "count") > (unint64_t)i;

    if (!v17)
      break;
    objc_msgSend(v8, "inputBufferInfoIndex");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");
    *(_DWORD *)&v54[4 * v16 + 4] = v20;

    +[_ANELog common](_ANELog, "common");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v22;
      v49 = 1024;
      *(_DWORD *)v50 = v20;
      _os_log_debug_impl(&dword_1D3352000, v21, OS_LOG_TYPE_DEBUG, "-----> %@: processInputBuffers() inputBufferInfoIndex value is %d ", buf, 0x12u);

    }
  }
  for (j = 0; ; j = v25 + 1)
  {
    objc_msgSend(v8, "inputFreeValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = j;
    v26 = objc_msgSend(v24, "count") > (unint64_t)j;

    if (!v26)
      break;
    objc_msgSend(v8, "inputFreeValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v57[v25] = objc_msgSend(v28, "unsignedIntegerValue");

  }
  -[_ANEProgramForEvaluation controller](self, "controller");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "device");
  if (v30 && *(_QWORD *)v30)
  {
    v31 = (*(uint64_t (**)(uint64_t, _BYTE *))(*(_QWORD *)v30 + 48))(v30, v53);

    if (!v31)
    {
      v32 = 1;
      goto LABEL_23;
    }
  }
  else
  {

    v31 = 2;
  }
  +[_ANELog common](_ANELog, "common");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[_ANEProgramForEvaluation programHandle](self, "programHandle");
    *(_DWORD *)buf = 138413058;
    v48 = v36;
    v49 = 1024;
    *(_DWORD *)v50 = v31;
    *(_WORD *)&v50[4] = 2112;
    *(_QWORD *)&v50[6] = v44;
    v51 = 2048;
    v52 = v37;
    _os_log_error_impl(&dword_1D3352000, v33, OS_LOG_TYPE_ERROR, "%@: Could not process input ready request ret=0x%x lModel=%@ programHandle=%llu", buf, 0x26u);

  }
  v32 = 0;
LABEL_23:
  objc_autoreleasePoolPop(context);
  if (v41)
    *v41 = 0;

  return v32;
}

- (void)setProgramHandle:(unint64_t)a3
{
  self->_programHandle = a3;
}

- (unint64_t)intermediateBufferHandle
{
  return self->_intermediateBufferHandle;
}

- (void)setIntermediateBufferHandle:(unint64_t)a3
{
  self->_intermediateBufferHandle = a3;
}

- (char)queueDepth
{
  return self->_queueDepth;
}

- (OS_dispatch_semaphore)requestsInFlight
{
  return self->_requestsInFlight;
}

- (int64_t)currentAsyncRequestsInFlight
{
  return self->_currentAsyncRequestsInFlight;
}

- (void)setCurrentAsyncRequestsInFlight:(int64_t)a3
{
  self->_currentAsyncRequestsInFlight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsInFlight, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

- (void)processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1D3352000, "-----> %@: ANEProgramProcessRequestDirect() enableFWToFWSignal option not nil value is %d ", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_1(&dword_1D3352000, "-----> %@: ANEProgramProcessRequestDirect() disableIOFences option not nil value is %d ", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
