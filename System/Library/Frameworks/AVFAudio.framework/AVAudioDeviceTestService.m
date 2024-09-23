@implementation AVAudioDeviceTestService

- (AVAudioDeviceTestService)init
{
  AVAudioDeviceTestService *v2;
  AVAudioDeviceTestService *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAudioDeviceTestService;
  v2 = -[AVAudioDeviceTestService init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AVAudioDeviceTestService setTestServiceSupportedOnHardware:](v2, "setTestServiceSupportedOnHardware:", 1);
    -[AVAudioDeviceTestService setExtensionHandle:](v3, "setExtensionHandle:", 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.avaudiodevietestservice.tones", v4);
    -[AVAudioDeviceTestService setToneQueue:](v3, "setToneQueue:", v5);

    v6 = (void *)os_transaction_create();
    -[AVAudioDeviceTestService setTransaction:](v3, "setTransaction:", v6);

  }
  return v3;
}

- (void)createAudioEngineAndProcessingChain:(id)a3 session:(id)a4 sourceNodeBlock:(id)a5
{
  NSObject *v8;
  void *v9;
  AVAudioSourceNode *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  NSObject *v27;
  AVAudioUnitEQ *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  BOOL v44;
  NSObject *v45;
  AVAudioUnitEQ *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  dispatch_semaphore_t v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  _BOOL4 v68;
  NSObject *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  BOOL v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  BOOL v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  BOOL v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  BOOL v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _BOOL4 v121;
  NSObject *v122;
  NSObject *v123;
  AVAudioFormat *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  _QWORD v129[4];
  NSObject *v130;
  AVAudioDeviceTestService *v131;
  __int128 v132;
  int v133;
  id v134;
  int inData;
  uint8_t buf[4];
  const char *v137;
  __int16 v138;
  int v139;
  __int16 v140;
  uint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v127 = a3;
  v128 = a4;
  v126 = a5;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v8 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v137 = "AVAudioDeviceTestService.mm";
    v138 = 1024;
    v139 = 171;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating audio engine and processing chain", buf, 0x12u);
  }

  v9 = (void *)objc_opt_new();
  -[AVAudioDeviceTestService setEngine:](self, "setEngine:", v9);

  if (v126)
  {
    v10 = -[AVAudioSourceNode initWithRenderBlock:]([AVAudioSourceNode alloc], "initWithRenderBlock:", v126);
    -[AVAudioDeviceTestService setSourceNode:](self, "setSourceNode:", v10);

  }
  -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    v13 = (void *)objc_opt_new();
    -[AVAudioDeviceTestService setPlayer:](self, "setPlayer:", v13);

  }
  if (!v128
    || (objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance"),
        v14 = (id)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == v128,
        v14,
        v15))
  {
    v22 = 0;
  }
  else
  {
    inData = objc_msgSend(v128, "opaqueSessionID");
    -[AVAudioDeviceTestService engine](self, "engine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "outputNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = AudioUnitSetProperty((AudioUnit)objc_msgSend(v17, "audioUnit"), 0x7E7u, 0, 0, &inData, 4u) == 0;

    if (!v18)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v19 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 197;
        _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to set session on engine", buf, 0x12u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0;
    v21 = objc_msgSend(v20, "setActive:error:", 0, &v134);
    v22 = v134;

    if ((v21 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v23 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v22, "code");
        *(_DWORD *)buf = 136315650;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 202;
        v140 = 2048;
        v141 = v24;
        _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d sharedInstance setActive %li", buf, 0x1Cu);
      }

    }
  }
  objc_msgSend(v127, "inputProcessingChain");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v27 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v137 = "AVAudioDeviceTestService.mm";
      v138 = 1024;
      v139 = 207;
      _os_log_impl(&dword_19B733000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting input processing chain", buf, 0x12u);
    }

    v28 = -[AVAudioUnitEQ initWithNumberOfBands:]([AVAudioUnitEQ alloc], "initWithNumberOfBands:", 1);
    -[AVAudioDeviceTestService setInputFilter:](self, "setInputFilter:", v28);

    -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bands");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFilterType:", 5);

    -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bands");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBypass:", 0);

    -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bands");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1157234688;
    objc_msgSend(v37, "setFrequency:", v38);

    -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bands");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = 4.0;
    objc_msgSend(v41, "setBandwidth:", v42);

  }
  objc_msgSend(v127, "outputProcessingChain");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 == 0;

  if (!v44)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v45 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v137 = "AVAudioDeviceTestService.mm";
      v138 = 1024;
      v139 = 225;
      _os_log_impl(&dword_19B733000, v45, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting output processing chain", buf, 0x12u);
    }

    v46 = -[AVAudioUnitEQ initWithNumberOfBands:]([AVAudioUnitEQ alloc], "initWithNumberOfBands:", 1);
    -[AVAudioDeviceTestService setOutputFilter:](self, "setOutputFilter:", v46);

    -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bands");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFilterType:", 5);

    -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bands");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setBypass:", 0);

    -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bands");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v56) = 1157234688;
    objc_msgSend(v55, "setFrequency:", v56);

    -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bands");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v60) = 4.0;
    objc_msgSend(v59, "setBandwidth:", v60);

  }
  v61 = dispatch_semaphore_create(0);
  v133 = 0;
  v132 = *(_OWORD *)"xmuaxmcmlppa";
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __88__AVAudioDeviceTestService_createAudioEngineAndProcessingChain_session_sourceNodeBlock___block_invoke;
  v129[3] = &unk_1E3BEBAE0;
  v62 = v61;
  v130 = v62;
  v131 = self;
  +[AVAudioUnit instantiateWithComponentDescription:options:completionHandler:](AVAudioUnit, "instantiateWithComponentDescription:options:completionHandler:", &v132, 0, v129);
  if (dispatch_semaphore_wait(v62, 0x3B9ACA00uLL))
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v63 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v137 = "AVAudioDeviceTestService.mm";
      v138 = 1024;
      v139 = 257;
      v64 = "%25s:%-5d Creating multichannel mixer took too long";
LABEL_41:
      _os_log_impl(&dword_19B733000, v63, OS_LOG_TYPE_ERROR, v64, buf, 0x12u);
      goto LABEL_117;
    }
    goto LABEL_117;
  }
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65 == 0;

  if (!v66)
  {
    -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v67 == 0;

    if (v68)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v72 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 271;
        _os_log_impl(&dword_19B733000, v72, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching player to engine", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService player](self, "player");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "attachNode:", v71);
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v69 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 268;
        _os_log_impl(&dword_19B733000, v69, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching sourceNode to engine", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "attachNode:", v71);
    }

    -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73 == 0;

    if (!v74)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v75 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 276;
        _os_log_impl(&dword_19B733000, v75, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching inputFilter to engine", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "attachNode:", v77);

    }
    -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v78 == 0;

    if (!v79)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v80 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 281;
        _os_log_impl(&dword_19B733000, v80, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching outputFilter to engine", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "attachNode:", v82);

    }
    -[AVAudioDeviceTestService engine](self, "engine");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "outputNode");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "outputFormatForBus:", 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "sampleRate");
    v87 = v86;

    if (v87 <= 0.0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v88 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 287;
        _os_log_impl(&dword_19B733000, v88, OS_LOG_TYPE_ERROR, "%25s:%-5d sampleRate for engine outputNode was <= 0. Setting to 44100", buf, 0x12u);
      }

      v87 = 44100.0;
    }
    v124 = -[AVAudioFormat initStandardFormatWithSampleRate:channels:]([AVAudioFormat alloc], "initStandardFormatWithSampleRate:channels:", 1, v87);
    if (!v124)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v89 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 293;
        _os_log_impl(&dword_19B733000, v89, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create internal format from engine output node", buf, 0x12u);
      }

    }
    -[AVAudioDeviceTestService inputFilter](self, "inputFilter", v124);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90 == 0;

    if (!v91)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v92 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 298;
        _os_log_impl(&dword_19B733000, v92, OS_LOG_TYPE_DEFAULT, "%25s:%-5d connecting inputFilter to inputNode", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService engine](self, "engine");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "inputNode");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "connect:to:format:", v95, v96, 0);

    }
    -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v97 == 0;

    if (!v98)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v99 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 303;
        _os_log_impl(&dword_19B733000, v99, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting sourceNode to channel mixer", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "connect:to:format:", v101, v102, v125);

    }
    -[AVAudioDeviceTestService engine](self, "engine");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService engine](self, "engine");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "outputNode");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService engine](self, "engine");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "outputNode");
    v108 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v108, "outputFormatForBus:", 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "connect:to:format:", v104, v106, v109);

    -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v108) = v110 == 0;

    if ((v108 & 1) != 0)
    {
      -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v120 == 0;

      if (!v121)
      {
LABEL_112:
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v123 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v137 = "AVAudioDeviceTestService.mm";
          v138 = 1024;
          v139 = 323;
          _os_log_impl(&dword_19B733000, v123, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Finished creating audio engine and processing chain", buf, 0x12u);
        }

        goto LABEL_117;
      }
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v122 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 320;
        _os_log_impl(&dword_19B733000, v122, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting player to channel mixer", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService player](self, "player");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "connect:to:format:", v118, v119, v125);
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v111 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 312;
        _os_log_impl(&dword_19B733000, v111, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting outputFilter to channel mixer", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
      v113 = objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "connect:to:format:", v113, v114, v125);

      -[AVAudioDeviceTestService player](self, "player");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v113) = v115 == 0;

      if ((v113 & 1) != 0)
        goto LABEL_112;
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v116 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v137 = "AVAudioDeviceTestService.mm";
        v138 = 1024;
        v139 = 316;
        _os_log_impl(&dword_19B733000, v116, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting player to output filter", buf, 0x12u);
      }

      -[AVAudioDeviceTestService engine](self, "engine");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService player](self, "player");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService outputFilter](self, "outputFilter");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "connect:to:format:", v118, v119, v125);
    }

    goto LABEL_112;
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v63 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v137 = "AVAudioDeviceTestService.mm";
    v138 = 1024;
    v139 = 261;
    v64 = "%25s:%-5d Failed to create multichannel mixer";
    goto LABEL_41;
  }
LABEL_117:

}

- (BOOL)setVolume:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  float v14;
  float v15;
  void *v16;
  BOOL v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "outputMode"))
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "volume");
      v9 = v8;
      objc_msgSend(v6, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136316162;
      v20 = "AVAudioDeviceTestService.mm";
      v21 = 1024;
      v22 = 333;
      v23 = 2048;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = CFSTR("Audio/Video");
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting volume %.2f for AS category %@, AVS category %@", (uint8_t *)&v19, 0x30u);

    }
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volume");
    v12 = objc_msgSend(v11, "setVolumeTo:forCategory:", CFSTR("Audio/Video"));
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v13 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "volume");
      v15 = v14;
      objc_msgSend(v6, "category");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136316162;
      v20 = "AVAudioDeviceTestService.mm";
      v21 = 1024;
      v22 = 329;
      v23 = 2048;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = CFSTR("PlayAndRecord");
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting volume %.2f for AS category %@, AVS category %@", (uint8_t *)&v19, 0x30u);

    }
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "volume");
    v12 = objc_msgSend(v11, "setVolumeTo:forCategory:", CFSTR("PlayAndRecord"));
  }
  v17 = v12;

  return v17;
}

- (BOOL)setVolume:(id)a3
{
  id v3;
  NSObject *v4;
  float v5;
  void *v6;
  char v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "volume");
    v9 = 136315650;
    v10 = "AVAudioDeviceTestService.mm";
    v11 = 1024;
    v12 = 340;
    v13 = 2048;
    v14 = v5;
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting volume to %.2f", (uint8_t *)&v9, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volume");
  v7 = objc_msgSend(v6, "setActiveCategoryVolumeTo:");

  return v7;
}

- (void)configureDataSources:(id)a3 session:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  unint64_t v15;
  void *j;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  char v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  char v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v46 = a4;
  objc_msgSend(v46, "availableInputs");
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v51;
    v9 = *MEMORY[0x1E0CFF118];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v11, "portType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v9);

        if (v13)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  v15 = 0;
  for (j = 0; ; j = v21)
  {
    objc_msgSend(v14, "dataSources");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") > v15;

    if (!v18)
      break;
    objc_msgSend(v14, "dataSources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    objc_msgSend(v5, "microphone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else
    {
      objc_msgSend(v21, "dataSourceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "intValue") == 1634495520;

      if (v24)
        goto LABEL_26;
    }
    objc_msgSend(v5, "microphone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (!v26)
    {
      switch((int)v15)
      {
        case 0:
          objc_msgSend(v5, "microphone");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("LeftBottom"));
          break;
        case 1:
          objc_msgSend(v5, "microphone");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Front"));
          break;
        case 2:
          objc_msgSend(v5, "microphone");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Back"));
          break;
        case 3:
          objc_msgSend(v5, "microphone");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("RightBottom"));

          if ((v30 & 1) == 0)
            goto LABEL_24;
          goto LABEL_26;
        default:
          goto LABEL_24;
      }
      if ((v28 & 1) != 0)
      {

LABEL_26:
        j = v21;
        break;
      }

    }
LABEL_24:

    ++v15;
  }
  v49 = 0;
  v31 = objc_msgSend(v14, "setPreferredDataSource:error:", j, &v49);
  v32 = v49;
  if ((v31 & 1) != 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v33 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "AVAudioDeviceTestService.mm";
      v56 = 1024;
      v57 = 391;
      v58 = 2112;
      v59 = (uint64_t)j;
      _os_log_impl(&dword_19B733000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using data source %@", buf, 0x1Cu);
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v34 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_msgSend(v32, "code");
      *(_DWORD *)buf = 136315650;
      v55 = "AVAudioDeviceTestService.mm";
      v56 = 1024;
      v57 = 389;
      v58 = 2048;
      v59 = v35;
      _os_log_impl(&dword_19B733000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredDataSource %li", buf, 0x1Cu);
    }

  }
  v48 = v32;
  v36 = objc_msgSend(v46, "setPreferredInput:error:", v14, &v48);
  v37 = v48;

  if ((v36 & 1) != 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v38 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "AVAudioDeviceTestService.mm";
      v56 = 1024;
      v57 = 398;
      v58 = 2112;
      v59 = (uint64_t)v14;
      _os_log_impl(&dword_19B733000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using port %@", buf, 0x1Cu);
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v39 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_msgSend(v37, "code");
      *(_DWORD *)buf = 136315650;
      v55 = "AVAudioDeviceTestService.mm";
      v56 = 1024;
      v57 = 396;
      v58 = 2048;
      v59 = v40;
      _os_log_impl(&dword_19B733000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredInput %li", buf, 0x1Cu);
    }

  }
  if (objc_msgSend(v5, "outputMode") == 1)
    v41 = 1936747378;
  else
    v41 = 0;
  v47 = v37;
  v42 = objc_msgSend(v46, "overrideOutputAudioPort:error:", v41, &v47);
  v43 = v47;

  if ((v42 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v44 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = objc_msgSend(v43, "code");
      *(_DWORD *)buf = 136315650;
      v55 = "AVAudioDeviceTestService.mm";
      v56 = 1024;
      v57 = 404;
      v58 = 2048;
      v59 = v45;
      _os_log_impl(&dword_19B733000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideOutputAudioPort %li", buf, 0x1Cu);
    }

  }
}

- (void)passExtensionToken:(id)a3
{
  id v4;
  AVAudioDeviceTestService *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v4)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v6 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "AVAudioDeviceTestService.mm";
      v12 = 1024;
      v13 = 423;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d extension token is null", buf, 0x12u);
    }
LABEL_13:
    exit(-9);
  }
  v9 = objc_retainAutorelease(v4);
  objc_msgSend(v9, "UTF8String");
  -[AVAudioDeviceTestService setExtensionHandle:](v5, "setExtensionHandle:", sandbox_extension_consume());
  if (-[AVAudioDeviceTestService extensionHandle](v5, "extensionHandle") < 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *__error();
      *(_DWORD *)buf = 136315650;
      v11 = "AVAudioDeviceTestService.mm";
      v12 = 1024;
      v13 = 417;
      v14 = 1024;
      v15 = v8;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to consume extension: %i", buf, 0x18u);
    }

    goto LABEL_13;
  }
  objc_sync_exit(v5);

}

- (BOOL)isOutputRouteBluetooth:(id)a3 session:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "routeForCategory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("HeadphonesBT"));

  return v8;
}

- (void)startWithSequence:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  AVAudioDeviceTestService *v8;
  __objc2_prot_list **p_prots;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __objc2_prot_list **v23;
  __objc2_prot_list **v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  char v28;
  __objc2_prot_list **v29;
  __objc2_prot_list **v30;
  char v31;
  __objc2_prot_list **v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  BOOL v39;
  void *v40;
  char v41;
  __objc2_prot_list **v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  int v55;
  NSObject *v56;
  int v57;
  _BOOL4 v58;
  NSObject *v59;
  void *v60;
  BOOL v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void (**v73)(id, _QWORD, void *);
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  AVAudioFile *v82;
  void *v83;
  __objc2_prot_list **v84;
  AVAudioPCMBuffer *v85;
  uint64_t v86;
  __objc2_prot_list **v87;
  AVAudioPCMBuffer *v88;
  NSObject *v89;
  float v90;
  float v91;
  id v92;
  void *v93;
  AVAudioPCMBuffer *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  AVAudioPCMBuffer *v105;
  void *v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  _BOOL4 v113;
  AVAudioFormat *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  AVAudioFormat *v123;
  AVAudioPCMBuffer *v124;
  AVAudioConverter *v125;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  AVAudioPCMBuffer *v132;
  AVAudioPCMBuffer *v133;
  unsigned int v134;
  double v135;
  double v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  void *v147;
  AVAudioPCMBuffer *v148;
  void *v149;
  void *v150;
  void *v151;
  NSObject *v152;
  int v153;
  void *v154;
  void (**v155)(id, _QWORD, void *);
  NSObject *v156;
  NSObject *v157;
  void *v158;
  uint64_t v159;
  void *v160;
  __objc2_prot_list **v161;
  __objc2_prot_list **v162;
  NSObject *v163;
  void *v164;
  void *v165;
  NSObject *v166;
  NSObject *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  void *v172;
  char v173;
  __objc2_prot_list **v174;
  NSObject *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  id v179;
  void (**v180)(_QWORD);
  NSObject *v181;
  NSObject *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  NSObject *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  void *v191;
  NSObject *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  void *v196;
  __objc2_prot_list **v197;
  AVAudioPCMBuffer *v198;
  AVAudioFormat *v199;
  void *v200;
  void (**v201)(id, _QWORD, void *);
  void *v202;
  AVAudioPCMBuffer *v203;
  AVAudioPCMBuffer *v204;
  AVAudioPCMBuffer *v205;
  dispatch_semaphore_t v206;
  AVAudioFile *v207;
  void (**v208)(id, _QWORD, void *);
  _QWORD v209[4];
  id v210;
  AVAudioDeviceTestService *v211;
  AVAudioPCMBuffer *v212;
  void (**v213)(id, _QWORD, void *);
  _BYTE *v214;
  __objc2_prot_list **v215;
  __objc2_prot_list **v216;
  _QWORD v217[4];
  NSObject *v218;
  id v219;
  _BYTE *v220;
  uint64_t *v221;
  uint64_t v222;
  uint64_t *v223;
  uint64_t v224;
  unsigned int v225;
  __objc2_prot_list **v226;
  _QWORD aBlock[4];
  AVAudioPCMBuffer *v228;
  __objc2_prot_list **v229;
  __objc2_prot_list **v230;
  _QWORD v231[4];
  id v232;
  _QWORD v233[4];
  id v234;
  _QWORD v235[5];
  __objc2_prot_list **v236;
  __objc2_prot_list **v237;
  __objc2_prot_list **v238;
  __objc2_prot_list **v239;
  id v240;
  uint8_t v241[4];
  const char *v242;
  __int16 v243;
  int v244;
  __int16 v245;
  uint64_t v246;
  __int16 v247;
  uint64_t v248;
  _BYTE buf[40];
  AVAudioPCMBuffer *v250;
  uint64_t v251;

  v251 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v208 = (void (**)(id, _QWORD, void *))a4;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 436;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d entering sequence", buf, 0x12u);
  }

  v8 = self;
  objc_sync_enter(v8);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  p_prots = &OBJC_PROTOCOL___NSMutableCopying.prots;
  v10 = getMSNMonitorBeginExceptionSymbolLoc(void)::ptr;
  *(_QWORD *)&buf[24] = getMSNMonitorBeginExceptionSymbolLoc(void)::ptr;
  if (!getMSNMonitorBeginExceptionSymbolLoc(void)::ptr)
  {
    v11 = MediaSafetyNetLibrary();
    v10 = dlsym(v11, "MSNMonitorBeginException");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v10;
    getMSNMonitorBeginExceptionSymbolLoc(void)::ptr = v10;
  }
  _Block_object_dispose(buf, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSNMonitorBeginException_soft(const char *)");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v185, CFSTR("AVAudioDeviceTestService.mm"), 47, CFSTR("%s"), dlerror());

    goto LABEL_173;
  }
  ((void (*)(const char *))v10)("audiotesting");
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v12 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 444;
    _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d starting sequence", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowAllBuiltInDataSources:", 1);
  if (objc_msgSend(v6, "priority"))
    v14 = objc_msgSend(v6, "priority");
  else
    v14 = 10;
  v240 = 0;
  v15 = objc_msgSend(v13, "setInterruptionPriority:error:", v14, &v240);
  p_prots = (__objc2_prot_list **)v240;
  if ((v15 & 1) != 0)
    goto LABEL_20;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    goto LABEL_174;
  while (1)
  {
    v16 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(p_prots, "code");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 454;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v17;
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d error setInterruptionPriority %li", buf, 0x1Cu);
    }

    generateAudioSelfTestError(-3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v208[2](v208, 0, v18);

LABEL_20:
    if (objc_msgSend(v6, "requiresBluetoothOutput"))
      v19 = 33;
    else
      v19 = 1;
    v20 = *MEMORY[0x1E0CFEFC0];
    v21 = *MEMORY[0x1E0CFF0A8];
    v239 = p_prots;
    v22 = objc_msgSend(v13, "setCategory:mode:options:error:", v20, v21, v19, &v239);
    v23 = v239;

    v24 = v23;
    if ((v22 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v25 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_msgSend(v23, "code");
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 464;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v26;
        _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d setCategory %li", buf, 0x1Cu);
      }

      generateAudioSelfTestError(-1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v208[2](v208, 0, v27);

    }
    v238 = v23;
    v28 = objc_msgSend(v13, "setActive:error:", 1, &v238);
    v29 = v238;

    v30 = v29;
    if ((v28 & 1) != 0)
    {
      v237 = v29;
      v31 = objc_msgSend(v13, "setPreferredIOBufferFrameSize:error:", 4096, &v237);
      v32 = v237;

      if ((v31 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v33 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = objc_msgSend(v32, "code");
          generateAudioSelfTestError(-1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "code");
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 491;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v34;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v36;
          _os_log_impl(&dword_19B733000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredIOBufferFrameSize (%li) with test error (%li)", buf, 0x26u);

        }
      }
      v206 = dispatch_semaphore_create(0);
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v37 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 496;
        _os_log_impl(&dword_19B733000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d configuring sequence", buf, 0x12u);
      }

      objc_msgSend(v6, "mode");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38 == 0;

      if (!v39)
      {
        objc_msgSend(v6, "mode");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v236 = v32;
        v41 = objc_msgSend(v13, "setMode:error:", v40, &v236);
        v42 = v236;

        if ((v41 & 1) == 0)
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1)
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
          v43 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v44 = objc_msgSend(v42, "code");
            generateAudioSelfTestError(-1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "code");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 500;
            *(_WORD *)&buf[18] = 2048;
            *(_QWORD *)&buf[20] = v44;
            *(_WORD *)&buf[28] = 2048;
            *(_QWORD *)&buf[30] = v46;
            _os_log_impl(&dword_19B733000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d setMode (%li) with test error (%li)", buf, 0x26u);

          }
        }
        v32 = v42;
      }
      -[AVAudioDeviceTestService configureDataSources:session:](v8, "configureDataSources:session:", v6, v13);
      -[AVAudioDeviceTestService createAudioEngineAndProcessingChain:session:sourceNodeBlock:](v8, "createAudioEngineAndProcessingChain:session:sourceNodeBlock:", v6, v13, 0);
      if (objc_msgSend(v6, "numberOfChannels"))
      {
        v47 = objc_msgSend(v6, "outputID");
        v48 = objc_msgSend(v6, "numberOfChannels");
      }
      else
      {
        v47 = objc_msgSend(v6, "outputID");
        v48 = 1;
      }
      -[AVAudioDeviceTestService configureMultiChannelMixerForOutputChannel:totalChannels:](v8, "configureMultiChannelMixerForOutputChannel:totalChannels:", v47, v48);
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v56 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = objc_msgSend(v6, "requiresBluetoothOutput");
        v58 = -[AVAudioDeviceTestService isOutputRouteBluetooth:session:](v8, "isOutputRouteBluetooth:session:", v6, v13);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 516;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v57;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v58;
        _os_log_impl(&dword_19B733000, v56, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Bluetooth setting: %d, Output route: %d", buf, 0x1Eu);
      }

      if (objc_msgSend(v6, "requiresBluetoothOutput")
        && !-[AVAudioDeviceTestService isOutputRouteBluetooth:session:](v8, "isOutputRouteBluetooth:session:", v6, v13))
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v96 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 519;
          _os_log_impl(&dword_19B733000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d Output route is not a bluetooth speaker", buf, 0x12u);
        }

        generateAudioSelfTestError(-7);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v208[2](v208, 0, v97);

      }
      else
      {
        if (-[AVAudioDeviceTestService setVolume:session:](v8, "setVolume:session:", v6, v13))
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1)
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
          v59 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 530;
            _os_log_impl(&dword_19B733000, v59, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting up observers", buf, 0x12u);
          }

          -[AVAudioDeviceTestService routeChangeObserver](v8, "routeChangeObserver");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60 == 0;

          if (!v61)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVAudioDeviceTestService routeChangeObserver](v8, "routeChangeObserver");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "removeObserver:", v63);

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = *MEMORY[0x1E0CFF180];
          v235[0] = MEMORY[0x1E0C809B0];
          v235[1] = 3221225472;
          v235[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke;
          v235[3] = &unk_1E3BEBB08;
          v235[4] = v8;
          objc_msgSend(v64, "addObserverForName:object:queue:usingBlock:", v65, v13, 0, v235);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVAudioDeviceTestService setRouteChangeObserver:](v8, "setRouteChangeObserver:", v66);

          -[AVAudioDeviceTestService interruptionObserver](v8, "interruptionObserver");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v67 == 0;

          if (!v68)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVAudioDeviceTestService interruptionObserver](v8, "interruptionObserver");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "removeObserver:", v70);

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = *MEMORY[0x1E0CFF000];
          v233[0] = MEMORY[0x1E0C809B0];
          v233[1] = 3221225472;
          v233[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_102;
          v233[3] = &unk_1E3BEBB30;
          v73 = v208;
          v234 = v73;
          objc_msgSend(v71, "addObserverForName:object:queue:usingBlock:", v72, v13, 0, v233);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVAudioDeviceTestService setInterruptionObserver:](v8, "setInterruptionObserver:", v74);

          -[AVAudioDeviceTestService mediaservicesLostObserver](v8, "mediaservicesLostObserver");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v72) = v75 == 0;

          if ((v72 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVAudioDeviceTestService mediaservicesLostObserver](v8, "mediaservicesLostObserver");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "removeObserver:", v77);

          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = *MEMORY[0x1E0CFF060];
          v231[0] = MEMORY[0x1E0C809B0];
          v231[1] = 3221225472;
          v231[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_103;
          v231[3] = &unk_1E3BEBB30;
          v201 = v73;
          v232 = v201;
          objc_msgSend(v78, "addObserverForName:object:queue:usingBlock:", v79, v13, 0, v231);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVAudioDeviceTestService setMediaservicesLostObserver:](v8, "setMediaservicesLostObserver:", v80);

          if (AVAudioDeviceTestServiceLog(void)::once != -1)
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
          v81 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 563;
            _os_log_impl(&dword_19B733000, v81, OS_LOG_TYPE_DEFAULT, "%25s:%-5d preparing for test", buf, 0x12u);
          }

          v82 = [AVAudioFile alloc];
          objc_msgSend(v6, "stimulusURL");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v230 = v32;
          v207 = -[AVAudioFile initForReading:error:](v82, "initForReading:error:", v83, &v230);
          v84 = v230;

          if (!v207 && v84)
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v187 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v84, "localizedDescription");
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              generateAudioSelfTestError(-9);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              v190 = objc_msgSend(v189, "code");
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 568;
              *(_WORD *)&buf[18] = 2112;
              *(_QWORD *)&buf[20] = v188;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = v190;
              _os_log_impl(&dword_19B733000, v187, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to read stimulus file (%@) with test error (%li)", buf, 0x26u);

            }
            generateAudioSelfTestError(-9);
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            v201[2](v201, 0, v191);

            exit(-9);
          }
          v85 = [AVAudioPCMBuffer alloc];
          -[AVAudioFile processingFormat](v207, "processingFormat");
          v86 = objc_claimAutoreleasedReturnValue();
          v204 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:](v85, "initWithPCMFormat:frameCapacity:", v86, -[AVAudioFile length](v207, "length"));

          v229 = v84;
          LOBYTE(v86) = -[AVAudioFile readIntoBuffer:error:](v207, "readIntoBuffer:error:", v204, &v229);
          v87 = (__objc2_prot_list **)v229;

          v30 = v87;
          if ((v86 & 1) != 0)
          {
            v88 = v204;
          }
          else
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v98 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v87, "localizedDescription");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 575;
              *(_WORD *)&buf[18] = 2112;
              *(_QWORD *)&buf[20] = v99;
              _os_log_impl(&dword_19B733000, v98, OS_LOG_TYPE_ERROR, "%25s:%-5d error reading stimulus file into buffer %@", buf, 0x1Cu);

            }
            v88 = 0;
          }
          v205 = v88;
          -[AVAudioBuffer format](v88, "format");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = objc_msgSend(v100, "channelCount") > 1;

          if (v101)
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v102 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
            {
              generateAudioSelfTestError(-6);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = objc_msgSend(v103, "code");
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 580;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v104;
              _os_log_impl(&dword_19B733000, v102, OS_LOG_TYPE_ERROR, "%25s:%-5d invalid stimulus buffer format %li", buf, 0x1Cu);

            }
            generateAudioSelfTestError(-6);
            v105 = (AVAudioPCMBuffer *)objc_claimAutoreleasedReturnValue();
            v201[2](v201, 0, v105);
            v55 = 1;
          }
          else
          {
            v198 = v205;
            -[AVAudioFile processingFormat](v207, "processingFormat");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "sampleRate");
            v108 = v107;
            -[AVAudioDeviceTestService engine](v8, "engine");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "inputNode");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "inputFormatForBus:", 0);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "sampleRate");
            v113 = v108 != v112;

            if (v113)
            {
              v114 = [AVAudioFormat alloc];
              -[AVAudioFile processingFormat](v207, "processingFormat");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "settings");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              v199 = -[AVAudioFormat initWithSettings:](v114, "initWithSettings:", v116);

              -[AVAudioFormat settings](v199, "settings");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              v202 = (void *)objc_msgSend(v117, "mutableCopy");

              v118 = (void *)MEMORY[0x1E0CB37E8];
              -[AVAudioDeviceTestService engine](v8, "engine");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "inputNode");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "inputFormatForBus:", 0);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "sampleRate");
              objc_msgSend(v118, "numberWithDouble:");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v202, "setObject:forKeyedSubscript:", v122, CFSTR("AVSampleRateKey"));

              objc_msgSend(v202, "setObject:forKeyedSubscript:", &unk_1E3BFCC98, CFSTR("AVNumberOfChannelsKey"));
              v123 = -[AVAudioFormat initWithSettings:]([AVAudioFormat alloc], "initWithSettings:", v202);
              v124 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]([AVAudioPCMBuffer alloc], "initWithPCMFormat:frameCapacity:", v123, -[AVAudioFile length](v207, "length"));
              v125 = -[AVAudioConverter initFromFormat:toFormat:]([AVAudioConverter alloc], "initFromFormat:toFormat:", v199, v123);
              aBlock[0] = MEMORY[0x1E0C809B0];
              aBlock[1] = 3221225472;
              aBlock[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_109;
              aBlock[3] = &unk_1E3BEBB58;
              v228 = v198;
              v126 = _Block_copy(aBlock);
              v226 = v30;
              v127 = -[AVAudioConverter convertToBuffer:error:withInputFromBlock:](v125, "convertToBuffer:error:withInputFromBlock:", v124, &v226, v126);
              v197 = v226;

              if (!v127)
              {
                if (AVAudioDeviceTestServiceLog(void)::once != -1)
                  dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
                v128 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
                if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v197, "localizedDescription");
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  generateAudioSelfTestError(-6);
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  v131 = objc_msgSend(v130, "code");
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 608;
                  *(_WORD *)&buf[18] = 2112;
                  *(_QWORD *)&buf[20] = v129;
                  *(_WORD *)&buf[28] = 2048;
                  *(_QWORD *)&buf[30] = v131;
                  _os_log_impl(&dword_19B733000, v128, OS_LOG_TYPE_ERROR, "%25s:%-5d error converting stimulus buffer format %@ - %li", buf, 0x26u);

                }
              }

              v30 = v197;
              v132 = v124;
            }
            else
            {
              v132 = 0;
            }
            v133 = v132;
            if (!v132)
              v132 = v198;
            v203 = v132;

            v222 = 0;
            v223 = &v222;
            v224 = 0x2020000000;
            v225 = 0;
            v134 = -[AVAudioPCMBuffer frameLength](v203, "frameLength");
            objc_msgSend(v13, "outputSampleRate");
            v136 = v135;
            -[AVAudioBuffer format](v203, "format");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "sampleRate");
            v139 = v138;
            objc_msgSend(v13, "outputLatency");
            v141 = v140;
            objc_msgSend(v13, "outputSampleRate");
            v143 = v142;
            objc_msgSend(v13, "outputSampleRate");
            v145 = v144;

            v225 = ((double)(v136 / v139 * (double)v134) + v141 * v143 + v145 * 0.5);
            -[AVAudioDeviceTestService engine](v8, "engine");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "inputNode");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "inputFormatForBus:", 0);
            v200 = (void *)objc_claimAutoreleasedReturnValue();

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            *(_QWORD *)&buf[24] = __Block_byref_object_copy__3052;
            *(_QWORD *)&buf[32] = __Block_byref_object_dispose__3053;
            v148 = [AVAudioPCMBuffer alloc];
            v250 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:](v148, "initWithPCMFormat:frameCapacity:", v200, *((unsigned int *)v223 + 6));
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setFrameLength:", 0);
            -[AVAudioDeviceTestService inputFilter](v8, "inputFilter");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            if (v149)
            {
              -[AVAudioDeviceTestService inputFilter](v8, "inputFilter");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              v151 = v150;
            }
            else
            {
              -[AVAudioDeviceTestService engine](v8, "engine");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v151, "inputNode");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[AVAudioDeviceTestService setNodeToCaptureData:](v8, "setNodeToCaptureData:", v150);
            if (!v149)

            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v152 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
            {
              v153 = *((_DWORD *)v223 + 6);
              *(_DWORD *)v241 = 136315650;
              v242 = "AVAudioDeviceTestService.mm";
              v243 = 1024;
              v244 = 626;
              v245 = 1024;
              LODWORD(v246) = v153;
              _os_log_impl(&dword_19B733000, v152, OS_LOG_TYPE_DEFAULT, "%25s:%-5d test length %i frames", v241, 0x18u);
            }

            -[AVAudioDeviceTestService nodeToCaptureData](v8, "nodeToCaptureData");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            v217[0] = MEMORY[0x1E0C809B0];
            v217[1] = 3221225472;
            v217[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_111;
            v217[3] = &unk_1E3BEBB80;
            v220 = buf;
            v155 = v201;
            v219 = v155;
            v221 = &v222;
            v156 = v206;
            v218 = v156;
            objc_msgSend(v154, "installTapOnBus:bufferSize:format:block:", 0, 4096, v200, v217);

            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v157 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v241 = 136315394;
              v242 = "AVAudioDeviceTestService.mm";
              v243 = 1024;
              v244 = 698;
              _os_log_impl(&dword_19B733000, v157, OS_LOG_TYPE_DEFAULT, "%25s:%-5d scheduling stimulus file", v241, 0x12u);
            }

            -[AVAudioDeviceTestService player](v8, "player");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "scheduleBuffer:atTime:options:completionHandler:", v203, 0, 2, &__block_literal_global_114);

            -[AVAudioDeviceTestService engine](v8, "engine");
            v159 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v159, "prepare");

            -[AVAudioDeviceTestService engine](v8, "engine");
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = v30;
            LOBYTE(v159) = objc_msgSend(v160, "startAndReturnError:", &v216);
            v161 = v216;

            v162 = v161;
            if ((v159 & 1) == 0)
            {
              if (AVAudioDeviceTestServiceLog(void)::once != -1)
                dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
              v192 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
              if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v161, "localizedDescription");
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                generateAudioSelfTestError(-10);
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                v195 = objc_msgSend(v194, "code");
                *(_DWORD *)v241 = 136315906;
                v242 = "AVAudioDeviceTestService.mm";
                v243 = 1024;
                v244 = 711;
                v245 = 2112;
                v246 = (uint64_t)v193;
                v247 = 2048;
                v248 = v195;
                _os_log_impl(&dword_19B733000, v192, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", v241, 0x26u);

              }
              generateAudioSelfTestError(-10);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              v155[2](v155, 0, v196);

              exit(-1);
            }
            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v163 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
            {
              -[AVAudioDeviceTestService engine](v8, "engine");
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v241 = 136315650;
              v242 = "AVAudioDeviceTestService.mm";
              v243 = 1024;
              v244 = 716;
              v245 = 2112;
              v246 = (uint64_t)v164;
              _os_log_impl(&dword_19B733000, v163, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@", v241, 0x1Cu);

            }
            -[AVAudioDeviceTestService player](v8, "player");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "play");

            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v166 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v241 = 136315394;
              v242 = "AVAudioDeviceTestService.mm";
              v243 = 1024;
              v244 = 720;
              _os_log_impl(&dword_19B733000, v166, OS_LOG_TYPE_DEFAULT, "%25s:%-5d waiting for sequence to finish", v241, 0x12u);
            }

            dispatch_semaphore_wait(v156, 0xFFFFFFFFFFFFFFFFLL);
            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v167 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v241 = 136315394;
              v242 = "AVAudioDeviceTestService.mm";
              v243 = 1024;
              v244 = 724;
              _os_log_impl(&dword_19B733000, v167, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sequence finished", v241, 0x12u);
            }

            -[AVAudioDeviceTestService nodeToCaptureData](v8, "nodeToCaptureData");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "removeTapOnBus:", 0);

            -[AVAudioDeviceTestService engine](v8, "engine");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            v170 = objc_msgSend(v169, "isRunning");

            if (v170)
            {
              -[AVAudioDeviceTestService player](v8, "player");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "stop");

              -[AVAudioDeviceTestService engine](v8, "engine");
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v172, "stop");

            }
            v215 = v162;
            v173 = objc_msgSend(v13, "setActive:error:", 0, &v215);
            v174 = (__objc2_prot_list **)v215;

            v30 = v174;
            if ((v173 & 1) == 0)
            {
              if (AVAudioDeviceTestServiceLog(void)::once != -1)
                dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
              v175 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
              if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
              {
                v176 = objc_msgSend(v174, "code");
                generateAudioSelfTestError(-11);
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                v178 = objc_msgSend(v177, "code");
                *(_DWORD *)v241 = 136315906;
                v242 = "AVAudioDeviceTestService.mm";
                v243 = 1024;
                v244 = 738;
                v245 = 2048;
                v246 = v176;
                v247 = 2048;
                v248 = v178;
                _os_log_impl(&dword_19B733000, v175, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", v241, 0x26u);

              }
            }
            -[AVAudioDeviceTestService cleanUpObservers](v8, "cleanUpObservers");
            v209[0] = MEMORY[0x1E0C809B0];
            v209[1] = 3221225472;
            v209[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_115;
            v209[3] = &unk_1E3BEBBF0;
            v214 = buf;
            v179 = v6;
            v210 = v179;
            v211 = v8;
            v105 = v203;
            v212 = v105;
            v213 = v155;
            v180 = (void (**)(_QWORD))_Block_copy(v209);
            if (objc_msgSend(v179, "processSequenceAsynchronously"))
            {
              dispatch_get_global_queue(2, 0);
              v181 = objc_claimAutoreleasedReturnValue();
              dispatch_async(v181, v180);

            }
            else
            {
              v180[2](v180);
            }

            _Block_object_dispose(buf, 8);
            _Block_object_dispose(&v222, 8);

            v55 = 0;
          }

          goto LABEL_160;
        }
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v89 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "volume");
          v91 = v90;
          objc_msgSend(v13, "category");
          v92 = (id)objc_claimAutoreleasedReturnValue();
          generateAudioSelfTestError(-7);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (AVAudioPCMBuffer *)objc_msgSend(v93, "code");
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 525;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v91;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v92;
          *(_WORD *)&buf[38] = 2048;
          v250 = v94;
          _os_log_impl(&dword_19B733000, v89, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to set volume %.2f for category %@ - (%li)", buf, 0x30u);

        }
        generateAudioSelfTestError(-7);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v208[2](v208, 0, v95);

      }
      v55 = 1;
      v30 = v32;
LABEL_160:
      v54 = v206;
      goto LABEL_161;
    }
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v49 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = objc_msgSend(v29, "code");
      generateAudioSelfTestError(-11);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "code");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 475;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v50;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v52;
      _os_log_impl(&dword_19B733000, v49, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", buf, 0x26u);

    }
    if (objc_msgSend(v29, "code") == 561145203)
    {
      -[AVAudioDeviceTestService setTestServiceSupportedOnHardware:](v8, "setTestServiceSupportedOnHardware:", 0);
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v53 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 479;
        _os_log_impl(&dword_19B733000, v53, OS_LOG_TYPE_ERROR, "%25s:%-5d running test on platform with inadequate hardware", buf, 0x12u);
      }
      generateAudioSelfTestError(-8);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v208[2](v208, 0, v54);
    }
    else
    {
      generateAudioSelfTestError(-11);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v208[2](v208, 0, v54);
    }
    v55 = 1;
LABEL_161:

    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v182 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 831;
      _os_log_impl(&dword_19B733000, v182, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sequence completed", buf, 0x12u);
    }

    if ((v55 | 2) != 2)
      goto LABEL_170;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    p_prots = &OBJC_PROTOCOL___NSMutableCopying.prots;
    v183 = getMSNMonitorEndExceptionSymbolLoc(void)::ptr;
    *(_QWORD *)&buf[24] = getMSNMonitorEndExceptionSymbolLoc(void)::ptr;
    if (!getMSNMonitorEndExceptionSymbolLoc(void)::ptr)
    {
      v184 = MediaSafetyNetLibrary();
      v183 = dlsym(v184, "MSNMonitorEndException");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v183;
      getMSNMonitorEndExceptionSymbolLoc(void)::ptr = v183;
    }
    _Block_object_dispose(buf, 8);
    if (v183)
      break;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSNMonitorEndException_soft(const char *)");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v186, CFSTR("AVAudioDeviceTestService.mm"), 48, CFSTR("%s"), dlerror());

LABEL_173:
    __break(1u);
LABEL_174:
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  }
  ((void (*)(const char *))v183)("audiotesting");
LABEL_170:
  objc_sync_exit(v8);

}

- (double)calculateCrossCorrelationPeakRelativeToSource:(id)a3 capture:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  vDSP_Length v10;
  const float *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  float v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "channelCount") == 1)
  {
    objc_msgSend(v6, "format");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "channelCount");

    if (v9 == 1)
    {
      v10 = objc_msgSend(v5, "frameLength");
      v11 = *(const float **)objc_msgSend(v5, "floatChannelData");
      v12 = malloc_type_malloc(8 * v10, 0x100004052888210uLL);
      bzero(v12, 8 * v10);
      v13 = 3 * v10 - 1;
      v14 = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
      bzero(v14, 4 * v13);
      if (v13 <= objc_msgSend(v6, "frameLength"))
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v18 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          generateAudioSelfTestError(-12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 4.8152e-34;
          v22 = "AVAudioDeviceTestService.mm";
          v23 = 1024;
          v24 = 855;
          v25 = 2048;
          v26 = objc_msgSend(v19, "code");
          _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d the length of the captured buffer needs to be greater (%li)", (uint8_t *)&v21, 0x1Cu);

        }
      }
      else
      {
        memcpy(v14, *(const void **)objc_msgSend(v6, "floatChannelData"), 4 * objc_msgSend(v6, "frameLength"));
      }
      vDSP_conv((const float *)v14, 1, v11, 1, (float *)v12, 1, 2 * v10, v10);
      v21 = 0.0;
      vDSP_maxv((const float *)v12, 1, &v21, 2 * v10);
      free(v14);
      free(v12);
      v17 = (float)(log10f(v21) * 10.0);
      goto LABEL_17;
    }
  }
  else
  {

  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v15 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    generateAudioSelfTestError(-12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 4.8152e-34;
    v22 = "AVAudioDeviceTestService.mm";
    v23 = 1024;
    v24 = 868;
    v25 = 2048;
    v26 = objc_msgSend(v16, "code");
    _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d the source file or captured buffers aren't signal channel files (%li)", (uint8_t *)&v21, 0x1Cu);

  }
  v17 = 0.0;
LABEL_17:

  return v17;
}

- (void)playbackTone:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AVAudioDeviceTestService *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[AVAudioDeviceTestService toneQueue](self, "toneQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke;
  block[3] = &unk_1E3BECE90;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)playback:(id)a3 filePath:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  float v11;
  float v12;
  void *v13;
  void *v14;
  AVAudioFile *v15;
  void *v16;
  id v17;
  AVAudioPCMBuffer *v18;
  void *v19;
  AVAudioPCMBuffer *v20;
  id v21;
  NSObject *v22;
  double v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  double v29;
  AVAudioPCMBuffer *v30;
  void *v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  _BOOL4 v53;
  AVAudioPCMBuffer *v54;
  AVAudioPCMBuffer *v55;
  AVAudioPCMBuffer *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  AVAudioFile *v66;
  void *v67;
  AVAudioFile *v68;
  id v69;
  NSObject *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  NSObject *v76;
  double v77;
  void *v78;
  NSObject *v79;
  double v80;
  NSObject *v81;
  double v82;
  void *v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  double v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void (**v91)(id, void *);
  dispatch_semaphore_t v92;
  void (**v93)(id, void *);
  id v94;
  AVAudioFile *v95;
  void *v96;
  id v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[4];
  NSObject *v101;
  void (**v102)(id, void *);
  id v103;
  id v104;
  uint8_t buf[4];
  const char *v106;
  __int16 v107;
  int v108;
  __int16 v109;
  double v110;
  __int16 v111;
  uint64_t v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v94 = a4;
  v96 = v8;
  v93 = (void (**)(id, void *))a5;
  -[AVAudioDeviceTestService checkSequenceValidity:completion:](self, "checkSequenceValidity:completion:", v8);
  -[AVAudioDeviceTestService hearingTestSession](self, "hearingTestSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    -[AVAudioDeviceTestService setupAudioSessionFor:playbackOnly:completion:](self, "setupAudioSessionFor:playbackOnly:completion:", v8, 0, v93);
  -[AVAudioDeviceTestService setupAudioEngineFor:sourceNodeBlock:](self, "setupAudioEngineFor:sourceNodeBlock:", v8, 0);
  if (!-[AVAudioDeviceTestService setVolume:](self, "setVolume:", v8))
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v10 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "volume");
      v12 = v11;
      generateAudioSelfTestError(-7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v106 = "AVAudioDeviceTestService.mm";
      v107 = 1024;
      v108 = 1030;
      v109 = 2048;
      v110 = v12;
      v111 = 2048;
      v112 = objc_msgSend(v13, "code");
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to set volume %.2f (%li)", buf, 0x26u);

    }
    generateAudioSelfTestError(-7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v93[2](v93, v14);

  }
  v15 = [AVAudioFile alloc];
  objc_msgSend(v96, "stimulusURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0;
  v95 = -[AVAudioFile initForReading:error:](v15, "initForReading:error:", v16, &v104);
  v17 = v104;

  if (!v95 && v17)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v81 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "localizedDescription");
      v82 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      generateAudioSelfTestError(-9);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "code");
      *(_DWORD *)buf = 136315906;
      v106 = "AVAudioDeviceTestService.mm";
      v107 = 1024;
      v108 = 1039;
      v109 = 2112;
      v110 = v82;
      v111 = 2048;
      v112 = v84;
      _os_log_impl(&dword_19B733000, v81, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to read stimulus file (%@) with test error (%li)", buf, 0x26u);

    }
    generateAudioSelfTestError(-9);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v93[2](v93, v85);

    exit(-9);
  }
  v18 = [AVAudioPCMBuffer alloc];
  -[AVAudioFile processingFormat](v95, "processingFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:](v18, "initWithPCMFormat:frameCapacity:", v19, -[AVAudioFile length](v95, "length"));

  v103 = v17;
  LOBYTE(v18) = -[AVAudioFile readIntoBuffer:error:](v95, "readIntoBuffer:error:", v20, &v103);
  v21 = v103;

  if ((v18 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v22 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "localizedDescription");
      v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v106 = "AVAudioDeviceTestService.mm";
      v107 = 1024;
      v108 = 1046;
      v109 = 2112;
      v110 = v23;
      _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d error reading stimulus file into buffer %@", buf, 0x1Cu);

    }
    v20 = 0;
  }
  -[AVAudioBuffer format](v20, "format");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "channelCount") > 1;

  if (!v25)
  {
    v30 = v20;
    goto LABEL_38;
  }
  objc_msgSend(v96, "microphone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (!v27)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v28 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v96, "microphone");
      v29 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v106 = "AVAudioDeviceTestService.mm";
      v107 = 1024;
      v108 = 1053;
      v109 = 2114;
      v110 = v29;
      _os_log_impl(&dword_19B733000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Multichannel file provided, will split into single channel buffers. { requestedMic=%{public}@ }", buf, 0x1Cu);

    }
    -[AVAudioPCMBuffer splitIntoSingleChannelBuffers](v20, "splitIntoSingleChannelBuffers");
    v30 = (AVAudioPCMBuffer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "microphone");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("LeftBottom"));

    if ((v32 & 1) != 0)
    {
      v33 = 0;
    }
    else
    {
      objc_msgSend(v96, "microphone");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("Front"));

      if ((v38 & 1) != 0)
      {
        v33 = 1;
      }
      else
      {
        objc_msgSend(v96, "microphone");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("Back"));

        if ((v40 & 1) != 0)
        {
          v33 = 2;
        }
        else
        {
          objc_msgSend(v96, "microphone");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("RightBottom"));

          if (!v42)
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1)
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
            v79 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v96, "microphone");
              v80 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 136315650;
              v106 = "AVAudioDeviceTestService.mm";
              v107 = 1024;
              v108 = 1066;
              v109 = 2114;
              v110 = v80;
              _os_log_impl(&dword_19B733000, v79, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid mic channel name. { providedName=%{public}@ }", buf, 0x1Cu);

            }
            generateAudioSelfTestError(-7);
            v58 = objc_claimAutoreleasedReturnValue();
            v93[2](v93, v58);
            v36 = v21;
            goto LABEL_66;
          }
          v33 = 3;
        }
      }
    }
    -[AVAudioPCMBuffer objectAtIndexedSubscript:](v30, "objectAtIndexedSubscript:", v33);
    v43 = objc_claimAutoreleasedReturnValue();

    v30 = (AVAudioPCMBuffer *)v43;
LABEL_38:
    if (v94)
    {
      -[AVAudioBuffer format](v20, "format");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "channelCount") == 1;

      if (v45)
      {
        -[AVAudioFile processingFormat](v95, "processingFormat");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "sampleRate");
        v48 = v47;
        -[AVAudioDeviceTestService engine](self, "engine");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "inputNode");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "inputFormatForBus:", 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "sampleRate");
        v53 = v48 != v52;

        if (v53)
        {
          -[AVAudioDeviceTestService convertBufferFor:sourceBuffer:](self, "convertBufferFor:sourceBuffer:", v95, v20);
          v54 = (AVAudioPCMBuffer *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = 0;
        }
        if (v54)
          v55 = v54;
        else
          v55 = v20;
        v56 = v55;

        v30 = v56;
      }
    }
    v92 = dispatch_semaphore_create(0);
    -[AVAudioDeviceTestService player](self, "player");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke;
    v100[3] = &unk_1E3BECD08;
    v91 = v93;
    v102 = v91;
    v58 = v92;
    v101 = v58;
    objc_msgSend(v57, "scheduleBuffer:atTime:options:completionHandler:", v30, 0, 2, v100);

    if (v94)
    {
      -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
      }
      else
      {
        -[AVAudioDeviceTestService engine](self, "engine");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "inputNode");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[AVAudioDeviceTestService setNodeToCaptureData:](self, "setNodeToCaptureData:", v60);
      if (!v59)

      -[AVAudioDeviceTestService engine](self, "engine");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "inputNode");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "inputFormatForBus:", 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v94);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = [AVAudioFile alloc];
      objc_msgSend(v64, "settings");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v21;
      v68 = -[AVAudioFile initForWriting:settings:error:](v66, "initForWriting:settings:error:", v65, v67, &v99);
      v69 = v99;

      v21 = v69;
      -[AVAudioDeviceTestService setInputTapFile:](self, "setInputTapFile:", v68);

      if (v69)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v70 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v69, "localizedDescription");
          v71 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315650;
          v106 = "AVAudioDeviceTestService.mm";
          v107 = 1024;
          v108 = 1112;
          v109 = 2112;
          v110 = v71;
          _os_log_impl(&dword_19B733000, v70, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create input tap file %@", buf, 0x1Cu);

        }
      }
      -[AVAudioDeviceTestService nodeToCaptureData](self, "nodeToCaptureData");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v98[0] = MEMORY[0x1E0C809B0];
      v98[1] = 3221225472;
      v98[2] = __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke_139;
      v98[3] = &unk_1E3BEBC40;
      v98[4] = self;
      objc_msgSend(v72, "installTapOnBus:bufferSize:format:block:", 0, 4096, v64, v98);

    }
    -[AVAudioDeviceTestService engine](self, "engine");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "prepare");

    -[AVAudioDeviceTestService engine](self, "engine");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v21;
    v75 = objc_msgSend(v74, "startAndReturnError:", &v97);
    v36 = v97;

    if ((v75 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v86 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v36, "localizedDescription");
        v87 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        generateAudioSelfTestError(-10);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "code");
        *(_DWORD *)buf = 136315906;
        v106 = "AVAudioDeviceTestService.mm";
        v107 = 1024;
        v108 = 1126;
        v109 = 2112;
        v110 = v87;
        v111 = 2048;
        v112 = v89;
        _os_log_impl(&dword_19B733000, v86, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", buf, 0x26u);

      }
      generateAudioSelfTestError(-10);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91[2](v91, v90);

      exit(-1);
    }
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v76 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      -[AVAudioDeviceTestService engine](self, "engine");
      v77 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v106 = "AVAudioDeviceTestService.mm";
      v107 = 1024;
      v108 = 1131;
      v109 = 2112;
      v110 = v77;
      _os_log_impl(&dword_19B733000, v76, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@", buf, 0x1Cu);

    }
    -[AVAudioDeviceTestService player](self, "player");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "play");

    dispatch_semaphore_wait(v58, 0xFFFFFFFFFFFFFFFFLL);
    -[AVAudioDeviceTestService stopPlayback](self, "stopPlayback");

LABEL_66:
    goto LABEL_67;
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v34 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v106 = "AVAudioDeviceTestService.mm";
    v107 = 1024;
    v108 = 1071;
    _os_log_impl(&dword_19B733000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid setup, cannot provide multichannel playback file without specifying mic channel.", buf, 0x12u);
  }
  generateAudioSelfTestError(-7);
  v35 = objc_claimAutoreleasedReturnValue();
  v93[2](v93, (void *)v35);
  v30 = (AVAudioPCMBuffer *)v35;
  v36 = v21;
LABEL_67:

}

- (void)stopPlayback
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v3 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "AVAudioDeviceTestService.mm";
    v9 = 1024;
    v10 = 1142;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Requesting to stop tone playback.", buf, 0x12u);
  }
  if (self->mPulseToneHandler.__ptr_.__value_)
  {
    -[AVAudioDeviceTestService toneQueue](self, "toneQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AVAudioDeviceTestService_stopPlayback__block_invoke;
    block[3] = &unk_1E3BECBE0;
    block[4] = self;
    dispatch_async(v4, block);

  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v5 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "AVAudioDeviceTestService.mm";
      v9 = 1024;
      v10 = 1161;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Stop tone playback requested, tone has already been stopped.", buf, 0x12u);
    }
    -[AVAudioDeviceTestService cleanUp](self, "cleanUp");
  }
}

- (void)startRecording:(id)a3 filePath:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  AVAudioFile *v13;
  void *v14;
  AVAudioFile *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v9 = (void (**)(id, void *))a5;
  -[AVAudioDeviceTestService checkSequenceValidity:completion:](self, "checkSequenceValidity:completion:", v8, v9);
  -[AVAudioDeviceTestService setupAudioSessionFor:playbackOnly:completion:](self, "setupAudioSessionFor:playbackOnly:completion:", v8, 0, v9);
  -[AVAudioDeviceTestService setupAudioEngineFor:sourceNodeBlock:](self, "setupAudioEngineFor:sourceNodeBlock:", v8, 0);
  -[AVAudioDeviceTestService engine](self, "engine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputFormatForBus:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v35);
  v33 = objc_claimAutoreleasedReturnValue();
  v13 = [AVAudioFile alloc];
  objc_msgSend(v12, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v15 = -[AVAudioFile initForWriting:settings:error:](v13, "initForWriting:settings:error:", v33, v14, &v39);
  v16 = v39;
  -[AVAudioDeviceTestService setInputTapFile:](self, "setInputTapFile:", v15);

  if (v16)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v17 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v41 = "AVAudioDeviceTestService.mm";
      v42 = 1024;
      v43 = 1196;
      v44 = 2112;
      v45 = v18;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create input tap file %@", buf, 0x1Cu);

    }
  }
  -[AVAudioDeviceTestService inputFilter](self, "inputFilter", v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[AVAudioDeviceTestService inputFilter](self, "inputFilter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
  }
  else
  {
    -[AVAudioDeviceTestService engine](self, "engine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "inputNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AVAudioDeviceTestService setNodeToCaptureData:](self, "setNodeToCaptureData:", v20);
  if (!v19)

  -[AVAudioDeviceTestService nodeToCaptureData](self, "nodeToCaptureData");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __63__AVAudioDeviceTestService_startRecording_filePath_completion___block_invoke;
  v37[3] = &unk_1E3BEBC90;
  v37[4] = self;
  v23 = v16;
  v38 = v23;
  objc_msgSend(v22, "installTapOnBus:bufferSize:format:block:", 0, 4096, v12, v37);

  -[AVAudioDeviceTestService engine](self, "engine");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v23;
  v25 = objc_msgSend(v24, "startAndReturnError:", &v36);
  v26 = v36;

  if ((v25 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v28 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v26, "localizedDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      generateAudioSelfTestError(-10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "code");
      *(_DWORD *)buf = 136315906;
      v41 = "AVAudioDeviceTestService.mm";
      v42 = 1024;
      v43 = 1209;
      v44 = 2112;
      v45 = v29;
      v46 = 2048;
      v47 = v31;
      _os_log_impl(&dword_19B733000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", buf, 0x26u);

    }
    generateAudioSelfTestError(-10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v32);

    exit(-1);
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v27 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v41 = "AVAudioDeviceTestService.mm";
    v42 = 1024;
    v43 = 1214;
    v44 = 2112;
    v45 = v35;
    _os_log_impl(&dword_19B733000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Started recording on server side %@", buf, 0x1Cu);
  }
  v9[2](v9, 0);

}

- (void)stopRecording:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[AVAudioDeviceTestService nodeToCaptureData](self, "nodeToCaptureData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTapOnBus:", 0);

  -[AVAudioDeviceTestService engine](self, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRunning");

  if (v7)
  {
    -[AVAudioDeviceTestService engine](self, "engine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stop");

  }
  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v10 = objc_msgSend(v9, "setActive:error:", 0, &v34);
  v11 = v34;

  if ((v10 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v12 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(v11, "code");
      generateAudioSelfTestError(-11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "code");
      *(_DWORD *)buf = 136315906;
      v36 = "AVAudioDeviceTestService.mm";
      v37 = 1024;
      v38 = 1229;
      v39 = 2048;
      v40 = v13;
      v41 = 2048;
      v42 = *(double *)&v15;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", buf, 0x26u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v11;
  objc_msgSend(v16, "setActive:error:", 0, &v33);
  v17 = v33;

  v18 = v17;
  if (v17)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v19 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v36 = "AVAudioDeviceTestService.mm";
      v37 = 1024;
      v38 = 1234;
      v39 = 2112;
      v40 = (uint64_t)v20;
      _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to reset audio session %@", buf, 0x1Cu);

    }
  }
  -[AVAudioDeviceTestService cleanUp](self, "cleanUp");
  -[AVAudioDeviceTestService inputTapFile](self, "inputTapFile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length") == 0;

  if (v22)
  {
    generateAudioSelfTestError(-13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v31);

  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v23 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[AVAudioDeviceTestService inputTapFile](self, "inputTapFile");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "url");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioDeviceTestService inputTapFile](self, "inputTapFile");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");
      -[AVAudioDeviceTestService inputTapFile](self, "inputTapFile");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "fileFormat");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sampleRate");
      *(_DWORD *)buf = 136315906;
      v36 = "AVAudioDeviceTestService.mm";
      v37 = 1024;
      v38 = 1242;
      v39 = 2112;
      v40 = (uint64_t)v25;
      v41 = 2048;
      v42 = (double)v27 / v30;
      _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopped recording on server side %@ (%f s)", buf, 0x26u);

    }
    -[AVAudioDeviceTestService setInputTapFile:](self, "setInputTapFile:", 0);
    v4[2](v4, 0);
  }

}

- (void)setupAudioSessionForHearingTest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AVAudioDeviceTestService toneQueue](self, "toneQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AVAudioDeviceTestService_setupAudioSessionForHearingTest___block_invoke;
  v7[3] = &unk_1E3BECD08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setupAudioSessionForHearingTestWithStatus:(id)a3 success:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVAudioDeviceTestService toneQueue](self, "toneQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVAudioDeviceTestService_setupAudioSessionForHearingTestWithStatus_success___block_invoke;
  block[3] = &unk_1E3BEBCB8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)stopAudioSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AVAudioDeviceTestService toneQueue](self, "toneQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__AVAudioDeviceTestService_stopAudioSession___block_invoke;
  v7[3] = &unk_1E3BECD08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)isMixerOutputEnabled
{
  CFPropertyListRef v2;
  BOOL v3;

  v2 = CFPreferencesCopyAppValue(CFSTR("mixer_output_enable"), CFSTR("com.apple.coreaudio.avaudiodevicetest"));
  if (!v2)
    return 0;
  v3 = v2 == (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
  CFRelease(v2);
  return v3;
}

- (BOOL)isPlaybackForTestEnabled
{
  CFPropertyListRef v2;
  BOOL v3;

  v2 = CFPreferencesCopyAppValue(CFSTR("playback_for_test"), CFSTR("com.apple.coreaudio.avaudiodevicetest"));
  if (!v2)
    return 0;
  v3 = v2 == (CFPropertyListRef)*MEMORY[0x1E0C9AE50];
  CFRelease(v2);
  return v3;
}

- (void)setupVolumeObserverForVolume:(float)a3 completion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  float v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id))a4;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t *)MEMORY[0x1E0D482B8];
  v27[0] = *MEMORY[0x1E0D482B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D48288];
  v20 = 0;
  objc_msgSend(v7, "setAttribute:forKey:error:", v9, v10, &v20);
  v11 = v20;

  if (v11)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v12 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "AVAudioDeviceTestService.mm";
      v23 = 1024;
      v24 = 1389;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to subscribe to system volume notification. { error=%@ }", buf, 0x1Cu);

    }
    v6[2](v6, v11);
  }
  else
  {
    -[AVAudioDeviceTestService removeSystemVolumeObserver](self, "removeSystemVolumeObserver");
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v14 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "AVAudioDeviceTestService.mm";
      v23 = 1024;
      v24 = 1396;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] setting up systemVolumeObserver", buf, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *v8;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__AVAudioDeviceTestService_setupVolumeObserverForVolume_completion___block_invoke;
    v18[3] = &__block_descriptor_36_e24_v16__0__NSNotification_8l;
    v19 = a3;
    objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", v16, 0, 0, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService setSystemVolumeObserver:](self, "setSystemVolumeObserver:", v17);

  }
}

- (void)resetVolume:(float)a3
{
  void *v4;
  id v5;
  float v6;
  float v7;
  float v8;
  NSObject *v10;
  void *v11;
  double v12;
  id v13;
  float v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14 = 0.0;
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "getActiveCategoryVolume:andName:", &v14, &v13);
  v5 = v13;

  v6 = vabds_f32(v14, a3);
  v7 = fabsf(v14 + a3);
  v8 = (float)(v7 * 0.00000011921) + (float)(v7 * 0.00000011921);
  if (v6 >= 1.1755e-38 && v6 > v8)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v10 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = "AVAudioDeviceTestService.mm";
      v17 = 1024;
      v18 = 1412;
      v19 = 2048;
      v20 = v14;
      v21 = 2048;
      v22 = a3;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Current volume is not as expected, updating volume. { current=%f, expected=%f, name=%@ }", buf, 0x30u);
    }
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v12 = a3;
    objc_msgSend(v11, "setActiveCategoryVolumeTo:", v12);

  }
}

- (void)checkSequenceValidity:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "frequency");
    if (v8 != 0.0 || (objc_msgSend(v7, "soundLevel"), v9 != 0.0) || (objc_msgSend(v7, "duration"), v10 != 0.0))
    {
      objc_msgSend(v7, "stimulusURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v12 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v21 = 136315394;
          v22 = "AVAudioDeviceTestService.mm";
          v23 = 1024;
          v24 = 1424;
          _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot set playback URL and tone on the same sequence", (uint8_t *)&v21, 0x12u);
        }
        generateAudioSelfTestError(-7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v13);

      }
    }
    objc_msgSend(v7, "frequency");
    if (v14 == 0.0 || (objc_msgSend(v7, "soundLevel"), v15 == 0.0) || (objc_msgSend(v7, "duration"), v16 == 0.0))
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v17 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315394;
        v22 = "AVAudioDeviceTestService.mm";
        v23 = 1024;
        v24 = 1429;
        _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot perform tone playback without setting all required parameters (frequency, soundLevel, and duration)", (uint8_t *)&v21, 0x12u);
      }
      generateAudioSelfTestError(-7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v18);

    }
  }
  if (objc_msgSend(v5, "requiresBluetoothOutput") && objc_msgSend(v5, "outputMode") == 1)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v19 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315394;
      v22 = "AVAudioDeviceTestService.mm";
      v23 = 1024;
      v24 = 1435;
      _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot request speaker output on Bluetooth route", (uint8_t *)&v21, 0x12u);
    }
    generateAudioSelfTestError(-7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v20);

  }
}

- (void)setupAudioSessionFor:(id)a3 playbackOnly:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  char v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  char v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  char v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v6 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v10, "category");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0CFEFC8];

    if (v12 == v13)
    {
      v22 = 0;
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v14 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v68 = "AVAudioDeviceTestService.mm";
        v69 = 1024;
        v70 = 1449;
        _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Updating current audio session category to playback only.", buf, 0x12u);
      }
      v66 = 0;
      v15 = objc_msgSend(v11, "setCategory:error:", v13, &v66);
      v16 = v66;
      if ((v15 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v17 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "localizedDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v68 = "AVAudioDeviceTestService.mm";
          v69 = 1024;
          v70 = 1452;
          v71 = 2112;
          v72 = (uint64_t)v18;
          _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set audio session category. { error=%@ }", buf, 0x1Cu);

        }
        generateAudioSelfTestError(-1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v19);

      }
      v20 = *MEMORY[0x1E0CFF0A8];
      v65 = v16;
      v21 = objc_msgSend(v11, "setMode:error:", v20, &v65);
      v22 = v65;

      if ((v21 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v23 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v22, "localizedDescription");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v68 = "AVAudioDeviceTestService.mm";
          v69 = 1024;
          v70 = 1457;
          v71 = 2112;
          v72 = (uint64_t)v24;
          _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set audio session mode. { error=%@ }", buf, 0x1Cu);

        }
        generateAudioSelfTestError(-1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v25);
LABEL_75:

      }
    }
  }
  else
  {
    v26 = objc_msgSend(v10, "allowAllBuiltInDataSources");
    if ((v26 & 1) == 0)
      objc_msgSend(v11, "setAllowAllBuiltInDataSources:", 1);
    if (!objc_msgSend(v8, "requiresBluetoothOutput")
      || (objc_msgSend(v11, "categoryOptions") & 0x20) != 0)
    {
      v27 = v26 ^ 1;
      if (objc_msgSend(v8, "outputMode") == 1)
      {
        v29 = objc_msgSend(v11, "categoryOptions") & 8;
        if (!v29)
          v27 = 1;
        v28 = v29 ^ 8;
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v27 = 1;
      v28 = 32;
    }
    objc_msgSend(v11, "category");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)*MEMORY[0x1E0CFEFC0];

    if (v30 == v31)
    {
      v22 = 0;
    }
    else
    {
      v64 = 0;
      v32 = objc_msgSend(v11, "setCategory:withOptions:error:", v31, v28, &v64);
      v22 = v64;
      if ((v32 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v33 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = objc_msgSend(v22, "code");
          *(_DWORD *)buf = 136315650;
          v68 = "AVAudioDeviceTestService.mm";
          v69 = 1024;
          v70 = 1483;
          v71 = 2048;
          v72 = v34;
          _os_log_impl(&dword_19B733000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d setCategory %li", buf, 0x1Cu);
        }

        generateAudioSelfTestError(-1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v35);

      }
      v27 = 1;
    }
    if (objc_msgSend(v11, "preferredIOBufferFrameSize") != 4096)
    {
      v63 = v22;
      v36 = objc_msgSend(v11, "setPreferredIOBufferFrameSize:error:", 4096, &v63);
      v37 = v63;

      if ((v36 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v38 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = objc_msgSend(v37, "code");
          generateAudioSelfTestError(-1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "code");
          *(_DWORD *)buf = 136315906;
          v68 = "AVAudioDeviceTestService.mm";
          v69 = 1024;
          v70 = 1500;
          v71 = 2048;
          v72 = v39;
          v73 = 2048;
          v74 = v41;
          _os_log_impl(&dword_19B733000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredIOBufferFrameSize (%li) with test error (%li)", buf, 0x26u);

        }
      }
      v27 = 1;
      v22 = v37;
    }
    objc_msgSend(v8, "mode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
      goto LABEL_57;
    objc_msgSend(v11, "mode");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v43 == v44;

    if (v45)
    {
LABEL_57:
      if ((v27 & 1) == 0 && (objc_msgSend(v11, "isActive") & 1) != 0)
        goto LABEL_76;
    }
    else
    {
      objc_msgSend(v8, "mode");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v22;
      v47 = objc_msgSend(v11, "setMode:error:", v46, &v62);
      v48 = v62;

      if ((v47 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v49 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = objc_msgSend(v48, "code");
          generateAudioSelfTestError(-1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "code");
          *(_DWORD *)buf = 136315906;
          v68 = "AVAudioDeviceTestService.mm";
          v69 = 1024;
          v70 = 1508;
          v71 = 2048;
          v72 = v50;
          v73 = 2048;
          v74 = v52;
          _os_log_impl(&dword_19B733000, v49, OS_LOG_TYPE_ERROR, "%25s:%-5d setMode (%li) with test error (%li)", buf, 0x26u);

        }
      }
      v22 = v48;
    }
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v53 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "AVAudioDeviceTestService.mm";
      v69 = 1024;
      v70 = 1515;
      _os_log_impl(&dword_19B733000, v53, OS_LOG_TYPE_INFO, "%25s:%-5d Audio session has changed, setting active.", buf, 0x12u);
    }
    v61 = v22;
    v54 = objc_msgSend(v11, "setActive:error:", 1, &v61);
    v55 = v61;

    v22 = v55;
    if ((v54 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v56 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = objc_msgSend(v55, "code");
        generateAudioSelfTestError(-11);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "code");
        *(_DWORD *)buf = 136315906;
        v68 = "AVAudioDeviceTestService.mm";
        v69 = 1024;
        v70 = 1518;
        v71 = 2048;
        v72 = v57;
        v73 = 2048;
        v74 = v59;
        _os_log_impl(&dword_19B733000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", buf, 0x26u);

      }
      if (objc_msgSend(v22, "code") == 561145203)
      {
        -[AVAudioDeviceTestService setTestServiceSupportedOnHardware:](self, "setTestServiceSupportedOnHardware:", 0);
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v60 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v68 = "AVAudioDeviceTestService.mm";
          v69 = 1024;
          v70 = 1522;
          _os_log_impl(&dword_19B733000, v60, OS_LOG_TYPE_ERROR, "%25s:%-5d running test on platform with inadequate hardware", buf, 0x12u);
        }
        generateAudioSelfTestError(-8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v25);
      }
      else
      {
        generateAudioSelfTestError(-11);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v25);
      }
      goto LABEL_75;
    }
    -[AVAudioDeviceTestService configureDataSources:session:](self, "configureDataSources:session:", v8, v11);
  }
LABEL_76:

}

- (BOOL)createAudioEngineAndPulseToneHandlerFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PulseTone *v24;
  uint64_t *p_mPulseToneHandler;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  const char *v31;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v30 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    v29 = 0;
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v33 = 136315394;
    v34 = "AVAudioDeviceTestService.mm";
    v35 = 1024;
    v36 = 1539;
    v31 = "%25s:%-5d Unable to create pulse tone from nil sequence";
LABEL_17:
    _os_log_impl(&dword_19B733000, v30, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v33, 0x12u);
    v29 = 0;
    goto LABEL_18;
  }
  v5 = (void *)objc_opt_new();
  -[AVAudioDeviceTestService setEngine:](self, "setEngine:", v5);

  if (!v5)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v30 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    v29 = 0;
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v33 = 136315394;
    v34 = "AVAudioDeviceTestService.mm";
    v35 = 1024;
    v36 = 1552;
    v31 = "%25s:%-5d Unable to create instance of AVAudioEngine";
    goto LABEL_17;
  }
  -[AVAudioDeviceTestService engine](self, "engine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputFormatForBus:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "sampleRate");
    v10 = v9;
    objc_msgSend(v4, "frequency");
    v12 = v11;
    objc_msgSend(v4, "soundLevel");
    v14 = v13;
    v15 = objc_msgSend(v4, "numberOfPulses");
    objc_msgSend(v4, "pulseDuration");
    v17 = v16;
    objc_msgSend(v4, "pauseDuration");
    v19 = v18;
    objc_msgSend(v4, "rampDuration");
    v21 = v20;
    objc_msgSend(v4, "startDelay");
    v23 = v22;
    v24 = (PulseTone *)operator new();
    PulseTone::PulseTone(v24, v10, v12, v14, v15, v17, v19, v21, v23);
    p_mPulseToneHandler = (uint64_t *)&self->mPulseToneHandler;
    std::unique_ptr<PulseTone>::reset[abi:ne180100](p_mPulseToneHandler, (uint64_t)v24);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(*p_mPulseToneHandler + 16);
    *(_QWORD *)(*p_mPulseToneHandler + 16) = v27;

    v29 = 1;
    goto LABEL_18;
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v30 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  v29 = 0;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 136315394;
    v34 = "AVAudioDeviceTestService.mm";
    v35 = 1024;
    v36 = 1549;
    v31 = "%25s:%-5d Unable to get output format for bus 0";
    goto LABEL_17;
  }
LABEL_18:

  return v29;
}

- (void)setupAudioEngineFor:(id)a3 sourceNodeBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioDeviceTestService createAudioEngineAndProcessingChain:session:sourceNodeBlock:](self, "createAudioEngineAndProcessingChain:session:sourceNodeBlock:", v8, v7, v6);

}

- (id)convertBufferFor:(id)a3 sourceBuffer:(id)a4
{
  AVAudioFormat *v6;
  void *v7;
  void *v8;
  AVAudioFormat *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AVAudioFormat *v17;
  AVAudioPCMBuffer *v18;
  AVAudioConverter *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v29;
  AVAudioFormat *v30;
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v29 = a4;
  v6 = [AVAudioFormat alloc];
  objc_msgSend(v31, "processingFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVAudioFormat initWithSettings:](v6, "initWithSettings:", v8);

  v30 = v9;
  -[AVAudioFormat settings](v9, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[AVAudioDeviceTestService engine](self, "engine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputFormatForBus:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleRate");
  objc_msgSend(v12, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("AVSampleRateKey"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E3BFCC98, CFSTR("AVNumberOfChannelsKey"));
  v17 = -[AVAudioFormat initWithSettings:]([AVAudioFormat alloc], "initWithSettings:", v11);
  v18 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]([AVAudioPCMBuffer alloc], "initWithPCMFormat:frameCapacity:", v17, objc_msgSend(v31, "length"));
  v19 = -[AVAudioConverter initFromFormat:toFormat:]([AVAudioConverter alloc], "initFromFormat:toFormat:", v30, v17);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__AVAudioDeviceTestService_convertBufferFor_sourceBuffer___block_invoke;
  aBlock[3] = &unk_1E3BEBB58;
  v20 = v29;
  v34 = v20;
  v21 = _Block_copy(aBlock);
  v32 = 0;
  v22 = -[AVAudioConverter convertToBuffer:error:withInputFromBlock:](v19, "convertToBuffer:error:withInputFromBlock:", v18, &v32, v21);
  v23 = v32;
  if (v22 == 3)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v24 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      generateAudioSelfTestError(-6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "code");
      *(_DWORD *)buf = 136315906;
      v36 = "AVAudioDeviceTestService.mm";
      v37 = 1024;
      v38 = 1588;
      v39 = 2112;
      v40 = v25;
      v41 = 2048;
      v42 = v27;
      _os_log_impl(&dword_19B733000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d error converting stimulus buffer format %@ - %li", buf, 0x26u);

    }
  }

  return v18;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v3 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "AVAudioDeviceTestService.mm";
    v14 = 1024;
    v15 = 1596;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d cleaning up observers and invalidating process assertion", buf, 0x12u);
  }
  -[AVAudioDeviceTestService extensionHandle](self, "extensionHandle");
  if (sandbox_extension_release())
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *__error();
      *(_DWORD *)buf = 136315650;
      v13 = "AVAudioDeviceTestService.mm";
      v14 = 1024;
      v15 = 1600;
      v16 = 1024;
      v17 = v5;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d couldn't release extension %i", buf, 0x18u);
    }

  }
  -[AVAudioDeviceTestService userVolumeBeforeHearingTest](self, "userVolumeBeforeHearingTest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (!v7)
  {
    -[AVAudioDeviceTestService userVolumeBeforeHearingTest](self, "userVolumeBeforeHearingTest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    -[AVAudioDeviceTestService resetVolume:](self, "resetVolume:");

  }
  -[AVAudioDeviceTestService cleanUpObservers](self, "cleanUpObservers");
  -[AVAudioDeviceTestService transaction](self, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
    -[AVAudioDeviceTestService setTransaction:](self, "setTransaction:", 0);
  v11.receiver = self;
  v11.super_class = (Class)AVAudioDeviceTestService;
  -[AVAudioDeviceTestService dealloc](&v11, sel_dealloc);
}

- (void)setupMultiChannelMixerForOutputChannel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t i;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  OpaqueAudioComponentInstance *v23;
  OSStatus v24;
  NSObject *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  OSStatus v32;
  _BYTE buf[18];
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputFormatForBus:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "channelCount");

  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputFormatForBus:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "channelCount");

  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v14 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputFormatForBus:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1619;
    v34 = 1024;
    v35 = objc_msgSend(v16, "channelCount");
    v36 = 1024;
    v37 = v10;
    _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mixer dimension %d x %d", buf, 0x1Eu);

  }
  v17 = (v13 * v10);
  v27 = 0;
  std::vector<float>::vector(buf, v17, &v27);
  if (v6)
  {
    for (i = 0; objc_msgSend(v6, "count") > i; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");

      if (v20 < v17)
      {
        v21 = *(_QWORD *)buf;
        do
        {
          *(_DWORD *)(v21 + 4 * (int)v20) = 1065353216;
          v20 += v10;
        }
        while (v20 < v17);
      }
    }
  }
  else if ((_DWORD)v17)
  {
    memset_pattern16(*(void **)buf, &unk_19B85A330, 4 * v17);
  }
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (OpaqueAudioComponentInstance *)objc_msgSend(v22, "audioUnit");
  v24 = AudioUnitSetProperty(v23, 0xBBEu, 1u, 0, *(const void **)buf, 4 * v17);

  if (v24)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v25 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = 136315650;
      v28 = "AVAudioDeviceTestService.mm";
      v29 = 1024;
      v30 = 1638;
      v31 = 1024;
      v32 = v24;
      _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioUnitSetProperty kAudioUnitProperty_MatrixLevels %i", (uint8_t *)&v27, 0x18u);
    }
    generateAudioSelfTestError(-10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v26);

  }
  if (*(_QWORD *)buf)
  {
    *(_QWORD *)&buf[8] = *(_QWORD *)buf;
    operator delete(*(void **)buf);
  }

}

- (void)configureMultiChannelMixerForOutputChannel:(int64_t)a3 totalChannels:(int64_t)a4
{
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  OpaqueAudioComponentInstance *v21;
  OSStatus v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *__b[3];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  OSStatus v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outputFormatForBus:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "channelCount");

  if (v10 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAudioDeviceTestService.mm"), 1645, CFSTR("the desired channel must not be greater than the number of channels"));

  }
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputFormatForBus:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "channelCount");

  if (v13 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAudioDeviceTestService.mm"), 1646, CFSTR("input format doesn't contain 1 channel"));

  }
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputFormatForBus:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "channelCount");
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "outputFormatForBus:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "channelCount") * v16;

  *(_DWORD *)buf = 0;
  std::vector<float>::vector(__b, v19, (int *)buf);
  if (a4 == 1)
  {
    *((_DWORD *)__b[0] + a3) = 1065353216;
  }
  else if (a4 >= 1)
  {
    memset_pattern16(__b[0], &unk_19B85A330, 4 * a4);
  }
  -[AVAudioDeviceTestService multichannelMixer](self, "multichannelMixer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (OpaqueAudioComponentInstance *)objc_msgSend(v20, "audioUnit");
  v22 = AudioUnitSetProperty(v21, 0xBBEu, 1u, 0, __b[0], 4 * v19);

  if (v22)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v23 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "AVAudioDeviceTestService.mm";
      v29 = 1024;
      v30 = 1665;
      v31 = 1024;
      v32 = v22;
      _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioUnitSetProperty kAudioUnitProperty_MatrixLevels %i", buf, 0x18u);
    }
  }
  if (__b[0])
  {
    __b[1] = __b[0];
    operator delete(__b[0]);
  }
}

- (void)setupObservers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v5 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "AVAudioDeviceTestService.mm";
    v49 = 1024;
    v50 = 1671;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Setting up observers", buf, 0x12u);
  }
  -[AVAudioDeviceTestService routeChangeObserver](self, "routeChangeObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService routeChangeObserver](self, "routeChangeObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", v9);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = *MEMORY[0x1E0CFF180];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __43__AVAudioDeviceTestService_setupObservers___block_invoke;
  v45[3] = &unk_1E3BEBD00;
  v45[4] = self;
  v13 = v4;
  v46 = v13;
  objc_msgSend((id)v10, "addObserverForName:object:queue:usingBlock:", v12, 0, 0, v45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioDeviceTestService setRouteChangeObserver:](self, "setRouteChangeObserver:", v14);

  -[AVAudioDeviceTestService interruptionObserver](self, "interruptionObserver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = v15 == 0;

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService interruptionObserver](self, "interruptionObserver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObserver:", v17);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CFF000];
  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __43__AVAudioDeviceTestService_setupObservers___block_invoke_159;
  v43[3] = &unk_1E3BEBD00;
  v43[4] = self;
  v20 = v13;
  v44 = v20;
  objc_msgSend((id)v18, "addObserverForName:object:queue:usingBlock:", v19, 0, 0, v43);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioDeviceTestService setInterruptionObserver:](self, "setInterruptionObserver:", v21);

  -[AVAudioDeviceTestService mediaservicesLostObserver](self, "mediaservicesLostObserver");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = v22 == 0;

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService mediaservicesLostObserver](self, "mediaservicesLostObserver");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObserver:", v24);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0CFF060];
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __43__AVAudioDeviceTestService_setupObservers___block_invoke_160;
  v41[3] = &unk_1E3BEBB30;
  v27 = v20;
  v42 = v27;
  objc_msgSend((id)v25, "addObserverForName:object:queue:usingBlock:", v26, 0, 0, v41);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioDeviceTestService setMediaservicesLostObserver:](self, "setMediaservicesLostObserver:", v28);

  -[AVAudioDeviceTestService mediaservicesResetObserver](self, "mediaservicesResetObserver");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = v29 == 0;

  if ((v25 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService mediaservicesResetObserver](self, "mediaservicesResetObserver");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeObserver:", v31);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0CFF068];
  v36 = v11;
  v37 = 3221225472;
  v38 = __43__AVAudioDeviceTestService_setupObservers___block_invoke_161;
  v39 = &unk_1E3BEBB30;
  v34 = v27;
  v40 = v34;
  objc_msgSend(v32, "addObserverForName:object:queue:usingBlock:", v33, 0, 0, &v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioDeviceTestService setMediaservicesResetObserver:](self, "setMediaservicesResetObserver:", v35, v36, v37, v38, v39);

}

- (id)stringForInterruptionReason:(unint64_t)a3
{
  if (a3 > 2)
    return &stru_1E3BED4C0;
  else
    return off_1E3BEBD38[a3];
}

- (id)stringForRouteChangeReason:(unint64_t)a3
{
  if (a3 > 8)
    return &stru_1E3BED4C0;
  else
    return off_1E3BEBD50[a3];
}

- (void)cleanUpObservers
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v3 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "AVAudioDeviceTestService.mm";
    v29 = 1024;
    v30 = 1768;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d cleaning up observers", buf, 0x12u);
  }
  -[AVAudioDeviceTestService routeChangeObserver](self, "routeChangeObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService routeChangeObserver](self, "routeChangeObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", v7);

  }
  -[AVAudioDeviceTestService interruptionObserver](self, "interruptionObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService interruptionObserver](self, "interruptionObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:", v11);

  }
  -[AVAudioDeviceTestService mediaservicesLostObserver](self, "mediaservicesLostObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService mediaservicesLostObserver](self, "mediaservicesLostObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObserver:", v15);

  }
  -[AVAudioDeviceTestService mediaservicesResetObserver](self, "mediaservicesResetObserver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService mediaservicesResetObserver](self, "mediaservicesResetObserver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObserver:", v19);

  }
  -[AVAudioDeviceTestService removeSystemVolumeObserver](self, "removeSystemVolumeObserver");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0D48288];
  v26 = 0;
  objc_msgSend(v21, "setAttribute:forKey:error:", 0, v22, &v26);
  v23 = v26;

  if (v23)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v24 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "AVAudioDeviceTestService.mm";
      v29 = 1024;
      v30 = 1793;
      v31 = 2114;
      v32 = v25;
      _os_log_impl(&dword_19B733000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to unsubscribe from AVSystemController volume notification. { error=%{public}@ }", buf, 0x1Cu);

    }
  }

}

- (void)removeSystemVolumeObserver
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[AVAudioDeviceTestService systemVolumeObserver](self, "systemVolumeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "AVAudioDeviceTestService.mm";
      v9 = 1024;
      v10 = 1800;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Removing systemVolumeObserver", (uint8_t *)&v7, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTestService systemVolumeObserver](self, "systemVolumeObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v6);

  }
}

- (void)cleanUp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t *p_mPulseToneHandler;
  PulseTone *value;

  -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVAudioDeviceTestService sourceNode](self, "sourceNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reset");

    -[AVAudioDeviceTestService setSourceNode:](self, "setSourceNode:", 0);
  }
  -[AVAudioDeviceTestService player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVAudioDeviceTestService player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");

    -[AVAudioDeviceTestService setPlayer:](self, "setPlayer:", 0);
  }
  -[AVAudioDeviceTestService engine](self, "engine");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[AVAudioDeviceTestService engine](self, "engine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRunning");

    if (v10)
    {
      -[AVAudioDeviceTestService engine](self, "engine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stop");

      -[AVAudioDeviceTestService engine](self, "engine");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reset");

      -[AVAudioDeviceTestService setEngine:](self, "setEngine:", 0);
    }
  }
  value = self->mPulseToneHandler.__ptr_.__value_;
  p_mPulseToneHandler = (uint64_t *)&self->mPulseToneHandler;
  if (value)
    std::unique_ptr<PulseTone>::reset[abi:ne180100](p_mPulseToneHandler, 0);
}

- (void)cancel
{
  void *v2;

  -[AVAudioDeviceTestService engine](self, "engine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

  exit(0);
}

- (AVAudioEngine)engine
{
  return (AVAudioEngine *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (AVAudioPlayerNode)player
{
  return (AVAudioPlayerNode *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (AVAudioUnitEQ)inputFilter
{
  return (AVAudioUnitEQ *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInputFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AVAudioUnitEQ)outputFilter
{
  return (AVAudioUnitEQ *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (AVAudioUnit)multichannelMixer
{
  return (AVAudioUnit *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMultichannelMixer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (AVAudioSession)currentSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (AVAudioNode)nodeToCaptureData
{
  return (AVAudioNode *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNodeToCaptureData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (AVAudioFile)inputTapFile
{
  return (AVAudioFile *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputTapFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (id)routeChangeObserver
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setRouteChangeObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (id)interruptionObserver
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setInterruptionObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (id)mediaservicesLostObserver
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setMediaservicesLostObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (id)mediaservicesResetObserver
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setMediaservicesResetObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (id)systemVolumeObserver
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setSystemVolumeObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)testServiceSupportedOnHardware
{
  return self->_testServiceSupportedOnHardware;
}

- (void)setTestServiceSupportedOnHardware:(BOOL)a3
{
  self->_testServiceSupportedOnHardware = a3;
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

- (AVAudioSourceNode)sourceNode
{
  return self->_sourceNode;
}

- (void)setSourceNode:(id)a3
{
  objc_storeStrong((id *)&self->_sourceNode, a3);
}

- (OS_dispatch_queue)toneQueue
{
  return self->_toneQueue;
}

- (void)setToneQueue:(id)a3
{
  objc_storeStrong((id *)&self->_toneQueue, a3);
}

- (NSNumber)userVolumeBeforeHearingTest
{
  return self->_userVolumeBeforeHearingTest;
}

- (void)setUserVolumeBeforeHearingTest:(id)a3
{
  objc_storeStrong((id *)&self->_userVolumeBeforeHearingTest, a3);
}

- (AVAudioSession)hearingTestSession
{
  return self->_hearingTestSession;
}

- (void)setHearingTestSession:(id)a3
{
  objc_storeStrong((id *)&self->_hearingTestSession, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_hearingTestSession, 0);
  objc_storeStrong((id *)&self->_userVolumeBeforeHearingTest, 0);
  objc_storeStrong((id *)&self->_toneQueue, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong(&self->_systemVolumeObserver, 0);
  objc_storeStrong(&self->_mediaservicesResetObserver, 0);
  objc_storeStrong(&self->_mediaservicesLostObserver, 0);
  objc_storeStrong(&self->_interruptionObserver, 0);
  objc_storeStrong(&self->_routeChangeObserver, 0);
  objc_storeStrong((id *)&self->_inputTapFile, 0);
  objc_storeStrong((id *)&self->_nodeToCaptureData, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_multichannelMixer, 0);
  objc_storeStrong((id *)&self->_outputFilter, 0);
  objc_storeStrong((id *)&self->_inputFilter, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  std::unique_ptr<PulseTone>::reset[abi:ne180100]((uint64_t *)&self->mPulseToneHandler, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFF198]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "stringForRouteChangeReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v8 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315906;
    v12 = "AVAudioDeviceTestService.mm";
    v13 = 1024;
    v14 = 1681;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d route change (%@) - %@", (uint8_t *)&v11, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFF020]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "stringForInterruptionReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v8 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    generateAudioSelfTestError(-3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "code");
    objc_msgSend(v3, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316162;
    v14 = "AVAudioDeviceTestService.mm";
    v15 = 1024;
    v16 = 1695;
    v17 = 2112;
    v18 = v7;
    v19 = 2048;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d interruption (%@) with test error (%li) - %@", (uint8_t *)&v13, 0x30u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    generateAudioSelfTestError(-4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "AVAudioDeviceTestService.mm";
    v10 = 1024;
    v11 = 1706;
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = objc_msgSend(v6, "code");
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd/audiomxd died (%@) with test error (%li)", (uint8_t *)&v8, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    generateAudioSelfTestError(-5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315906;
    v9 = "AVAudioDeviceTestService.mm";
    v10 = 1024;
    v11 = 1717;
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = objc_msgSend(v6, "code");
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd/audiomxd was reset (%@) with test error (%li)", (uint8_t *)&v8, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __58__AVAudioDeviceTestService_convertBufferFor_sourceBuffer___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

void __68__AVAudioDeviceTestService_setupVolumeObserverForVolume_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  void *v12;
  double v13;
  NSObject *v14;
  double v15;
  float v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D47ED0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v6 = *(float *)(a1 + 32);
  v8 = vabds_f32(v7, v6);
  v9 = fabsf(v7 + v6);
  v10 = (float)(v9 * 0.00000011921) + (float)(v9 * 0.00000011921);
  if (v8 >= 1.1755e-38 && v8 > v10)
  {
    objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = *(_DWORD *)(a1 + 32);
    objc_msgSend(v12, "setActiveCategoryVolumeTo:", v13);

    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v14 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "floatValue");
      v15 = *(float *)(a1 + 32);
      v17 = 136315906;
      v18 = "AVAudioDeviceTestService.mm";
      v19 = 1024;
      v20 = 1401;
      v21 = 2048;
      v22 = v16;
      v23 = 2048;
      v24 = v15;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Volume not as expected, updating volume. { current=%f, expected=%f }", (uint8_t *)&v17, 0x26u);
    }

  }
}

void __45__AVAudioDeviceTestService_stopAudioSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v2 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "AVAudioDeviceTestService.mm";
    v20 = 1024;
    v21 = 1334;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attempting to stop audio session for HearingTest.", buf, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isActive");

    if ((v6 & 1) == 0)
    {
LABEL_8:
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "AVAudioDeviceTestService.mm";
        v20 = 1024;
        v21 = 1339;
        _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Hearing test audio session is not active, cannot de-activate it.", buf, 0x12u);
      }
      v8 = 0;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "setActive:error:", 0, &v17);
  v10 = v17;

  if (v10)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v11 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v19 = "AVAudioDeviceTestService.mm";
      v20 = 1024;
      v21 = 1346;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed de-activate audio session. { error=%{public}@ }", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -14, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v14 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "AVAudioDeviceTestService.mm";
      v20 = 1024;
      v21 = 1349;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d De-activated audio session.", buf, 0x12u);
    }
    v8 = 0;
  }
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v15, "userVolumeBeforeHearingTest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  objc_msgSend(v15, "resetVolume:");

  objc_msgSend(*(id *)(a1 + 32), "cleanUpObservers");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_26:

}

void __78__AVAudioDeviceTestService_setupAudioSessionForHearingTestWithStatus_success___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  char v13;
  void *v14;
  char v15;
  id v16;
  char v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v2 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "AVAudioDeviceTestService.mm";
    v31 = 1024;
    v32 = 1293;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting up audio session with Playback category for HearingTest.", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHearingTestSession:", v3);

  objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CFEFC8];
  v28 = 0;
  v6 = objc_msgSend(v4, "setCategory:error:", v5, &v28);
  v7 = v28;

  if (v7)
    v8 = 0;
  else
    v8 = v6;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CFF0A8];
    v27 = 0;
    v11 = objc_msgSend(v9, "setMode:error:", v10, &v27);
    v12 = v27;

    if (v12)
      v13 = 0;
    else
      v13 = v11;
    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v15 = objc_msgSend(v14, "setActive:error:", 1, &v26);
      v16 = v26;

      if (v16)
        v17 = 0;
      else
        v17 = v15;
      if ((v17 & 1) != 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v18 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "AVAudioDeviceTestService.mm";
          v31 = 1024;
          v32 = 1323;
          _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setup and activated audio session for HearingTest.", buf, 0x12u);
        }
        objc_msgSend(*(id *)(a1 + 32), "setupObservers:", *(_QWORD *)(a1 + 40));
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v19 = 0;
      }
      else
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v24 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "localizedDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v30 = "AVAudioDeviceTestService.mm";
          v31 = 1024;
          v32 = 1317;
          v33 = 2114;
          v34 = v25;
          _os_log_impl(&dword_19B733000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set active. { error=%{public}@ }", buf, 0x1Cu);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -1, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v22 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "localizedDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v30 = "AVAudioDeviceTestService.mm";
        v31 = 1024;
        v32 = 1309;
        v33 = 2114;
        v34 = v23;
        _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode. { error=%{public}@ }", buf, 0x1Cu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v20 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "AVAudioDeviceTestService.mm";
      v31 = 1024;
      v32 = 1301;
      v33 = 2114;
      v34 = v21;
      _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set category. { error=%{public}@ }", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __60__AVAudioDeviceTestService_setupAudioSessionForHearingTest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v2 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "AVAudioDeviceTestService.mm";
    v25 = 1024;
    v26 = 1253;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting up audio session with Playback category for HearingTest.", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHearingTestSession:", v3);

  objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CFEFC8];
  v22 = 0;
  objc_msgSend(v4, "setCategory:error:", v5, &v22);
  v6 = v22;

  if (v6)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "AVAudioDeviceTestService.mm";
      v25 = 1024;
      v26 = 1261;
      v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set category. { error=%{public}@ }", buf, 0x1Cu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CFF0A8];
    v21 = 0;
    objc_msgSend(v10, "setMode:error:", v11, &v21);
    v12 = v21;

    if (v12)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
      v13 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "AVAudioDeviceTestService.mm";
        v25 = 1024;
        v26 = 1269;
        v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode. { error=%{public}@ }", buf, 0x1Cu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "hearingTestSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v15, "setActive:error:", 1, &v20);
      v16 = v20;

      if (v16)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v17 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "localizedDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v24 = "AVAudioDeviceTestService.mm";
          v25 = 1024;
          v26 = 1277;
          v27 = 2114;
          v28 = v18;
          _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set active. { error=%{public}@ }", buf, 0x1Cu);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -1, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v19 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "AVAudioDeviceTestService.mm";
          v25 = 1024;
          v26 = 1283;
          _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setup and activated audio session for HearingTest.", buf, 0x12u);
        }
        objc_msgSend(*(id *)(a1 + 32), "setupObservers:", *(_QWORD *)(a1 + 40));
        v9 = 0;
      }
    }
  }

}

void __63__AVAudioDeviceTestService_startRecording_filePath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "inputTapFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "writeFromBuffer:error:", v3, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v11 = "AVAudioDeviceTestService.mm";
      v12 = 1024;
      v13 = 1204;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing debug file %@", buf, 0x1Cu);

    }
  }

}

uint64_t __40__AVAudioDeviceTestService_stopPlayback__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v2 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "AVAudioDeviceTestService.mm";
    v12 = 1024;
    v13 = 1146;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Stop tone playback requested.", (uint8_t *)&v10, 0x12u);
  }
  v3 = *(_BYTE **)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
  {
    *v3 = 1;
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v10 = 136315650;
      v11 = "AVAudioDeviceTestService.mm";
      v12 = 1024;
      v13 = 1150;
      v14 = 2048;
      v15 = v5;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Tone has been stopped. { frequency=%f }", (uint8_t *)&v10, 0x1Cu);
    }
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8));
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v6 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "AVAudioDeviceTestService.mm";
      v12 = 1024;
      v13 = 1153;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Tone stop requested but, pulse tone handler is nil", (uint8_t *)&v10, 0x12u);
    }
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "userVolumeBeforeHearingTest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v7, "resetVolume:");

  objc_msgSend(*(id *)(a1 + 32), "removeSystemVolumeObserver");
  return objc_msgSend(*(id *)(a1 + 32), "cleanUp");
}

intptr_t __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v2 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "AVAudioDeviceTestService.mm";
    v6 = 1024;
    v7 = 1097;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d player finished", (uint8_t *)&v4, 0x12u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "inputTapFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "writeFromBuffer:error:", v3, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v11 = "AVAudioDeviceTestService.mm";
      v12 = 1024;
      v13 = 1118;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing debug file %@", buf, 0x1Cu);

    }
  }

}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  double v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  float v25;
  float v26;
  float v27;
  NSObject *v28;
  float v29;
  void (**v30)(id, _QWORD, void *);
  void *v31;
  id v32;
  int v33;
  int v34;
  double v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  AVAudioFile *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  AVAudioFile *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  AVAudioFile *v60;
  void *v61;
  char v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  float v67;
  float v68;
  uint64_t v69;
  double v70;
  dispatch_time_t v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  double v77;
  void (**v78)(id, _QWORD, void *);
  void *v79;
  int8x16_t v80;
  _QWORD block[4];
  int8x16_t v82;
  id v83;
  _BYTE *v84;
  id v85;
  _QWORD v86[4];
  AVAudioFile *v87;
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[5];
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  float v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  uint8_t v102[4];
  const char *v103;
  __int16 v104;
  int v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  double v109;
  __int16 v110;
  uint64_t v111;
  _BYTE buf[40];
  id v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v2 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "frequency");
    v4 = v3;
    objc_msgSend(a1[4], "volume");
    v6 = v5;
    objc_msgSend(a1[4], "duration");
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 879;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v4;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2048;
    v113 = v7;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Playback tone request. { frequency=%f, volume=%f, duration=%f }", buf, 0x30u);
  }

  v9 = a1[4];
  v8 = a1[5];
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_122;
  v100[3] = &unk_1E3BECCB8;
  v101 = a1[6];
  objc_msgSend(v8, "checkSequenceValidity:completion:", v9, v100);
  objc_msgSend(a1[5], "hearingTestSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = v10 == 0;

  if ((_DWORD)v8)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v11 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 888;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d HearingTest session not set, falling back to default playback session.", buf, 0x12u);
    }
    v13 = a1[4];
    v12 = a1[5];
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_124;
    v98[3] = &unk_1E3BECCB8;
    v99 = a1[6];
    objc_msgSend(v12, "setupAudioSessionFor:playbackOnly:completion:", v13, 1, v98);

  }
  objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0.0;
  if ((objc_msgSend(v14, "getActiveCategoryVolume:andName:", &v97, 0) & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v15 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 900;
      _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error getting current volume", buf, 0x12u);
    }
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v16 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 903;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v97;
    _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] CurrentVolume=%f", buf, 0x1Cu);
  }
  objc_msgSend(a1[5], "userVolumeBeforeHearingTest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v20 = v97;
    v21 = (void *)objc_msgSend(v19, "initWithFloat:", v20);
    objc_msgSend(a1[5], "setUserVolumeBeforeHearingTest:", v21);

  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v22 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[5], "userVolumeBeforeHearingTest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 909;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v24;
    _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] userVolumeBeforeHearingTest=%f", buf, 0x1Cu);

  }
  objc_msgSend(a1[4], "volume");
  v26 = vabds_f32(v97, v25);
  if (v26 >= 1.1755e-38)
  {
    v27 = fabsf(v25 + v97);
    if (v26 > (float)((float)(v27 * 0.00000011921) + (float)(v27 * 0.00000011921)))
    {
      objc_msgSend(a1[4], "volume");
      if ((objc_msgSend(v14, "setActiveCategoryVolumeTo:") & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
        v28 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(a1[4], "volume");
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 912;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v29;
          _os_log_impl(&dword_19B733000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to set category volume to %f", buf, 0x1Cu);
        }

        v30 = (void (**)(id, _QWORD, void *))a1[6];
        generateAudioSelfTestError(-15);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2](v30, 0, v31);

      }
    }
  }
  v32 = a1[5];
  objc_msgSend(a1[4], "volume");
  v34 = v33;
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_125;
  v95[3] = &unk_1E3BECCB8;
  v96 = a1[6];
  LODWORD(v35) = v34;
  objc_msgSend(v32, "setupVolumeObserverForVolume:completion:", v95, v35);
  if ((objc_msgSend(a1[5], "createAudioEngineAndPulseToneHandlerFor:", a1[4]) & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v36 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 924;
      _os_log_impl(&dword_19B733000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to create pulse tone handler", buf, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.avfaudio.devicetest.service"), -10, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();

  }
  objc_msgSend(a1[5], "hearingTestSession");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0;

  if (v39)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v40 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 930;
      _os_log_impl(&dword_19B733000, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No session already created.", buf, 0x12u);
    }
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_129;
    v92[3] = &unk_1E3BECE68;
    v41 = a1[6];
    v93 = a1[5];
    v94 = v41;
    objc_msgSend(v93, "setupObservers:", v92);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__3052;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__3053;
  v113 = (id)objc_msgSend(*(id *)(*((_QWORD *)a1[5] + 1) + 16), "copy");
  v43 = a1[4];
  v42 = a1[5];
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_130;
  v91[3] = &unk_1E3BEBC18;
  v91[4] = v42;
  objc_msgSend(v42, "setupAudioEngineFor:sourceNodeBlock:", v43, v91);
  v44 = a1[5];
  objc_msgSend(a1[4], "micBufferNumbers");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");
  if (v46)
  {
    objc_msgSend(a1[4], "micBufferNumbers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = 0;
  }
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_2;
  v89[3] = &unk_1E3BECCB8;
  v90 = a1[6];
  objc_msgSend(v44, "setupMultiChannelMixerForOutputChannel:completion:", v47, v89);
  if (v46)

  objc_msgSend(a1[5], "engine");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "prepare");

  if (objc_msgSend(a1[5], "isMixerOutputEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/tmp/multichannel_mixer_out.caf"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = [AVAudioFile alloc];
    objc_msgSend(a1[5], "engine");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "outputNode");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "outputFormatForBus:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "settings");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = 0;
    v55 = -[AVAudioFile initForWriting:settings:error:](v50, "initForWriting:settings:error:", v49, v54, &v88);
    v56 = v88;

    if (v56)
      (*((void (**)(void))a1[6] + 2))();
    objc_msgSend(a1[5], "multichannelMixer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "multichannelMixer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "outputFormatForBus:", 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_3;
    v86[3] = &unk_1E3BEBC40;
    v60 = v55;
    v87 = v60;
    objc_msgSend(v57, "installTapOnBus:bufferSize:format:block:", 0, 1024, v59, v86);

  }
  else
  {
    v56 = 0;
  }
  objc_msgSend(a1[5], "engine");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v56;
  v62 = objc_msgSend(v61, "startAndReturnError:", &v85);
  v63 = v85;

  if ((v62 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v74 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v63, "localizedDescription");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      generateAudioSelfTestError(-10);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = COERCE_DOUBLE(objc_msgSend(v76, "code"));
      *(_DWORD *)v102 = 136315906;
      v103 = "AVAudioDeviceTestService.mm";
      v104 = 1024;
      v105 = 976;
      v106 = 2112;
      v107 = v75;
      v108 = 2048;
      v109 = v77;
      _os_log_impl(&dword_19B733000, v74, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", v102, 0x26u);

    }
    v78 = (void (**)(id, _QWORD, void *))a1[6];
    generateAudioSelfTestError(-10);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2](v78, 0, v79);

    exit(-1);
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v64 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "frequency");
    v66 = v65;
    objc_msgSend(a1[4], "volume");
    v68 = v67;
    objc_msgSend(a1[4], "duration");
    *(_DWORD *)v102 = 136316162;
    v103 = "AVAudioDeviceTestService.mm";
    v104 = 1024;
    v105 = 981;
    v106 = 2048;
    v107 = v66;
    v108 = 2048;
    v109 = v68;
    v110 = 2048;
    v111 = v69;
    _os_log_impl(&dword_19B733000, v64, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Started playing back tone. { frequency=%f, volume=%f, duration=%f }", v102, 0x30u);
  }

  objc_msgSend(a1[4], "duration");
  v71 = dispatch_time(0, (uint64_t)(v70 * 1000000000.0));
  objc_msgSend(a1[5], "toneQueue");
  v72 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_137;
  block[3] = &unk_1E3BEBC68;
  v80 = *((int8x16_t *)a1 + 2);
  v73 = (id)v80.i64[0];
  v82 = vextq_s8(v80, v80, 8uLL);
  v84 = buf;
  v83 = a1[6];
  dispatch_after(v71, v72, block);

  _Block_object_dispose(buf, 8);
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_122(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "AVAudioDeviceTestService.mm";
      v7 = 1024;
      v8 = 933;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption detected, resetting observers.", (uint8_t *)&v5, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "cleanUpObservers");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_130(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int *a5)
{
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  double v13;
  int v14;
  double v15;
  float v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  double v21;
  int v22;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;

  v5 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 8);
  if (v5 && a4)
  {
    v6 = 0;
    v7 = a5 + 4;
    v8 = *a5;
    v9 = *((_QWORD *)v5 + 5);
    v10 = *((_DWORD *)v5 + 12);
    v11 = v5[80];
    v12 = a4;
    v13 = *((double *)v5 + 3) / *((double *)v5 + 9);
    while (1)
    {
      ++v9;
      v14 = v10 + 1;
      v15 = 0.0;
      if (!v11)
      {
        v20 = *((_DWORD *)v5 + 13);
        if (v20)
        {
          if (v10 < 0)
          {
            v11 = *v5;
            v5[80] = v11;
          }
          else
          {
            v21 = sin((v13 * (double)v9 + v13 * (double)v9) * 3.14159265) * *((double *)v5 + 4);
            v22 = *((_DWORD *)v5 + 14);
            if (v10 >= v22)
            {
              v25 = *((_DWORD *)v5 + 15);
              if (!v25 && !*v5)
              {
                v11 = 0;
                v10 = *((_DWORD *)v5 + 14);
                goto LABEL_26;
              }
              v26 = *((double *)v5 + 8);
              v27 = v26 + (double)v22;
              if (v27 <= (double)v14)
              {
                v10 = (int)-((double)v25 - v26);
                *((_DWORD *)v5 + 13) = (v20 & ~(v20 >> 31)) - 1;
                v11 = *v5;
                v5[80] = v11;
                goto LABEL_6;
              }
              v11 = 0;
              v24 = (v27 - (double)v14) / v26;
            }
            else
            {
              v23 = *((double *)v5 + 8);
              v11 = 0;
              if (v23 <= (double)v14)
              {
                ++v10;
LABEL_26:
                v15 = v21;
                goto LABEL_6;
              }
              v24 = (double)v14 / v23;
            }
            v15 = v21 * v24;
          }
        }
        else
        {
          v11 = 0;
        }
      }
      ++v10;
LABEL_6:
      if ((_DWORD)v8)
      {
        v17 = v7;
        v18 = v8;
        do
        {
          v19 = *(_QWORD *)v17;
          v17 += 4;
          v16 = v15;
          *(float *)(v19 + 4 * v6) = v16;
          --v18;
        }
        while (v18);
      }
      if (++v6 == v12)
      {
        *((_QWORD *)v5 + 5) = v9;
        *((_DWORD *)v5 + 12) = v10;
        return 0;
      }
    }
  }
  return 0;
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v9 = 0;
  v8 = objc_msgSend(v7, "writeFromBuffer:error:", v5, &v9);
  if (v9)
    __assert_rtn("-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke_3", "AVAudioDeviceTestService.mm", 970, "err == nil");
  if ((v8 & 1) == 0)
    __assert_rtn("-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke_3", "AVAudioDeviceTestService.mm", 971, "didWrite");

}

uint64_t __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_137(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v10 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "frequency");
      v12 = v11;
      objc_msgSend(*(id *)(a1 + 40), "volume");
      v14 = v13;
      objc_msgSend(*(id *)(a1 + 40), "duration");
      v26 = 136316162;
      v27 = "AVAudioDeviceTestService.mm";
      v28 = 1024;
      v29 = 985;
      v30 = 2048;
      v31 = v12;
      v32 = 2048;
      v33 = v14;
      v34 = 2048;
      v35 = v15;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone handler is nil { frequency=%f, volume=%f, duration=%f }", (uint8_t *)&v26, 0x30u);
    }
    goto LABEL_19;
  }
  if ((objc_msgSend(*(id *)(v2 + 16), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v10 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "frequency");
      v17 = v16;
      objc_msgSend(*(id *)(a1 + 40), "volume");
      v19 = v18;
      objc_msgSend(*(id *)(a1 + 40), "duration");
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
      v26 = 136316674;
      v27 = "AVAudioDeviceTestService.mm";
      v28 = 1024;
      v29 = 987;
      v30 = 2048;
      v31 = v17;
      v32 = 2048;
      v33 = v19;
      v34 = 2048;
      v35 = v22;
      v36 = 2112;
      v37 = v20;
      v38 = 2112;
      v39 = v21;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone IDs do not match. { frequency=%f, volume=%f, duration=%f, pulseToneID=%@, currID=%@ }", (uint8_t *)&v26, 0x44u);
    }
LABEL_19:

    goto LABEL_20;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3
    && objc_msgSend(*(id *)(v3 + 16), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "frequency");
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 40), "volume");
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 40), "duration");
      v26 = 136316162;
      v27 = "AVAudioDeviceTestService.mm";
      v28 = 1024;
      v29 = 989;
      v30 = 2048;
      v31 = v6;
      v32 = 2048;
      v33 = v8;
      v34 = 2048;
      v35 = v9;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Duration timer called, stopping tone. { frequency=%f, volume=%f, duration=%f }", (uint8_t *)&v26, 0x30u);
    }

    **(_BYTE **)(*(_QWORD *)(a1 + 32) + 8) = 1;
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8));
    objc_msgSend(*(id *)(a1 + 32), "cleanUp");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_20:
  v23 = *(void **)(a1 + 32);
  objc_msgSend(v23, "userVolumeBeforeHearingTest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  objc_msgSend(v23, "resetVolume:");

  return objc_msgSend(*(id *)(a1 + 32), "removeSystemVolumeObserver");
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFF198]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "stringForRouteChangeReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v8 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "AVAudioDeviceTestService.mm";
    v11 = 1024;
    v12 = 540;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d route change (%@)", (uint8_t *)&v9, 0x1Cu);
  }

}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    generateAudioSelfTestError(-3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315906;
    v10 = "AVAudioDeviceTestService.mm";
    v11 = 1024;
    v12 = 548;
    v13 = 2112;
    v14 = v5;
    v15 = 2048;
    v16 = objc_msgSend(v6, "code");
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d interruption (%@) with test error (%li)", (uint8_t *)&v9, 0x26u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  generateAudioSelfTestError(-3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  exit(-3);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v4 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    generateAudioSelfTestError(-4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315906;
    v10 = "AVAudioDeviceTestService.mm";
    v11 = 1024;
    v12 = 558;
    v13 = 2112;
    v14 = v5;
    v15 = 2048;
    v16 = objc_msgSend(v6, "code");
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd died (%@) with test error (%li)", (uint8_t *)&v9, 0x26u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  generateAudioSelfTestError(-4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  exit(-4);
}

id __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_109(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "averagePowerPerChannel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "AVAudioDeviceTestService.mm";
    v16 = 1024;
    v17 = 642;
    v18 = 2112;
    v19 = (uint64_t)v8;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d collecting input tap data %@", (uint8_t *)&v14, 0x1Cu);

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendDataFromBuffer:", v5) & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v9 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      generateAudioSelfTestError(-10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "code");
      v14 = 136315650;
      v15 = "AVAudioDeviceTestService.mm";
      v16 = 1024;
      v17 = 645;
      v18 = 2048;
      v19 = v11;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to read in from buffer - test error %li", (uint8_t *)&v14, 0x1Cu);

    }
    v12 = *(_QWORD *)(a1 + 40);
    generateAudioSelfTestError(-10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "frameLength") >= *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_115(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  unint64_t j;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD);
  unint64_t i;
  void *v22;
  NSObject *v23;
  NSObject *group;
  id obj;
  id obja;
  void *v27;
  _QWORD aBlock[5];
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  _BYTE *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v2 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 758;
    _os_log_impl(&dword_19B733000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d processing xcorr", buf, 0x12u);
  }
  group = dispatch_group_create();
  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INTERACTIVE, -1);
  v3 = objc_claimAutoreleasedReturnValue();
  v23 = dispatch_queue_create("com.apple.avfaudio.xcorr_queue", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "splitIntoSingleChannelBuffers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy__3052;
  v41 = __Block_byref_object_dispose__3053;
  v42 = (id)objc_opt_new();
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "micBufferNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(*(id *)(a1 + 32), "micBufferNumbers", v23, group),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count") == 0,
        v5,
        v4,
        v6))
  {
    for (i = 0; objc_msgSend(v27, "count", v23) > i; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "addObject:", v22);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "micBufferNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");

    obj = (id)v8;
  }
  for (j = 0; objc_msgSend(obj, "count") > j; ++j)
  {
    v10 = *(void **)(*(_QWORD *)&buf[8] + 40);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obja = obj;
  v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v35;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      for (k = 0; k != v12; ++k)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obja);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k);
        aBlock[0] = v14;
        aBlock[1] = 3221225472;
        aBlock[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_119;
        aBlock[3] = &unk_1E3BEBBC8;
        aBlock[4] = v16;
        v29 = v27;
        v17 = *(id *)(a1 + 32);
        v18 = *(_QWORD *)(a1 + 40);
        v19 = *(void **)(a1 + 48);
        v30 = v17;
        v31 = v18;
        v32 = v19;
        v33 = buf;
        v20 = (void (**)(_QWORD))_Block_copy(aBlock);
        if (objc_msgSend(*(id *)(a1 + 32), "parallelCrossCorrelationCalculation"))
          dispatch_group_async(group, v23, v20);
        else
          v20[2](v20);

      }
      v12 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "parallelCrossCorrelationCalculation"))
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  _Block_object_dispose(buf, 8);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_119(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  AVAudioDeviceTestResult *v8;
  uint64_t v9;
  void *v10;
  AVAudioDeviceTestResult *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (int)objc_msgSend(*(id *)(a1 + 32), "intValue");
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(objc_msgSend(v3, "audioBufferList") + 16), *(unsigned int *)(objc_msgSend(v3, "audioBufferList") + 12));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "calculateCrossCorrelationPeak"))
  {
    objc_msgSend(*(id *)(a1 + 56), "calculateCrossCorrelationPeakRelativeToSource:capture:", *(_QWORD *)(a1 + 64), v3);
    v6 = v5;
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "AVAudioDeviceTestService.mm";
      v15 = 1024;
      v16 = 789;
      v17 = 2048;
      v18 = v6;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d db %f", (uint8_t *)&v13, 0x1Cu);
    }
  }
  v8 = [AVAudioDeviceTestResult alloc];
  v9 = objc_msgSend(*(id *)(a1 + 48), "outputID");
  objc_msgSend(v3, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sampleRate");
  v11 = -[AVAudioDeviceTestResult initWithData:inputID:outputID:sampleRate:correlationValue:](v8, "initWithData:inputID:outputID:sampleRate:correlationValue:", v4, v2, v9);

  v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_sync_enter(v12);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v11, v2);
  objc_sync_exit(v12);

}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_113()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestServiceLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
  v0 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315394;
    v2 = "AVAudioDeviceTestService.mm";
    v3 = 1024;
    v4 = 702;
    _os_log_impl(&dword_19B733000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d player finished", (uint8_t *)&v1, 0x12u);
  }
}

void __88__AVAudioDeviceTestService_createAudioEngineAndProcessingChain_session_sourceNodeBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3006);
    v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestServiceLog(void)::category);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "AVAudioDeviceTestService.mm";
      v13 = 1024;
      v14 = 249;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Error instantiating AVAudioUnit: %@", (uint8_t *)&v11, 0x1Cu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setMultichannelMixer:", v5);
    objc_msgSend(*(id *)(a1 + 40), "engine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "multichannelMixer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attachNode:", v10);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
