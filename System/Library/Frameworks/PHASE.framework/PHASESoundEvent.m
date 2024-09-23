@implementation PHASESoundEvent

- (PHASESoundEvent)init
{
  -[PHASESoundEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASESoundEvent)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 mixerParameters:(id)a5 error:(id *)a6
{
  PHASESoundEvent *v10;
  PHASESoundEvent *v11;
  AVAudioSession *audioSession;
  void *v13;
  void *v14;
  shared_ptr<Phase::ActionTreeObject> v15;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  NSDictionary *mixers;
  NSDictionary *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_weak_owners;
  unint64_t v32;
  id v33;
  Phase *v34;
  NSString *v35;
  uint64_t StringHashId;
  ActionTreeObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  id v45;
  Phase *v46;
  NSString *v47;
  uint64_t v48;
  ActionTreeObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  ActionTreeObject *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  ActionTreeObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  ActionTreeObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  ActionTreeObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  ActionTreeObject *v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void *v94;
  Phase::Logger *v95;
  NSObject *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  Phase::Logger *v101;
  NSObject *v102;
  id v103;
  uint64_t v104;
  PHASESoundEvent *v105;
  uint64_t v106;
  void *v107;
  Phase::Logger *v108;
  NSObject *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t *v113;
  unint64_t v114;
  _DWORD *v115;
  NSObject *v116;
  uint64_t v117;
  unint64_t *v118;
  unint64_t v119;
  unint64_t *v120;
  unint64_t v121;
  id WeakRetained;
  uint64_t v123;
  NSDictionary *metaParameters;
  uint64_t v125;
  NSDictionary *pushStreamNodes;
  uint64_t v127;
  NSDictionary *pullStreamNodes;
  Phase::Logger *v129;
  NSObject *v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  Phase *v134;
  NSString *v135;
  uint64_t v136;
  NSObject *v138;
  std::logic_error *exception;
  Phase::Logger *InstancePtr;
  NSObject *v141;
  std::runtime_error *v142;
  id *location;
  Phase::ActionTreeManager *v144;
  id v145;
  id v146;
  id v147;
  PHASESoundEventNodeAsset *v148;
  id obj;
  id v150;
  ActionTreeObject *ptr;
  std::__shared_weak_count *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  objc_super v157;
  ActionTreeObject *v158;
  std::__shared_weak_count *v159;
  BOOL v160;
  unint64_t v161;
  uint64_t v162;
  void *v163;
  _BYTE buf[40];
  uint64_t v165;
  _BYTE v166[144];
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  uint8_t v171[4];
  const char *v172;
  __int16 v173;
  int v174;
  __int16 v175;
  unint64_t v176;
  __int16 v177;
  uint64_t v178;
  uint64_t v179;

  v179 = *MEMORY[0x24BDAC8D0];
  obj = a3;
  v145 = a4;
  v147 = a4;
  v146 = a5;
  if (a6)
    *a6 = 0;
  v157.receiver = self;
  v157.super_class = (Class)PHASESoundEvent;
  v10 = -[PHASESoundEvent init](&v157, sel_init);
  v11 = v10;
  if (!v10)
  {
    v93 = *MEMORY[0x24BDD0FC8];
    v162 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASESoundEventNodeAsset not registered"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = v94;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
    v148 = (PHASESoundEventNodeAsset *)objc_claimAutoreleasedReturnValue();

    v96 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v95)
                                                                                        + 432)));
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      -[PHASESoundEventNodeAsset objectForKeyedSubscript:](v148, "objectForKeyedSubscript:", v93);
      v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v98 = objc_msgSend(v97, "UTF8String");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "PHASESoundEvent.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 270;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v98;
      _os_log_impl(&dword_2164CC000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925665, v148);
      v105 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_110;
    }
LABEL_109:
    v105 = 0;
    goto LABEL_110;
  }
  location = (id *)&v10->_engine;
  objc_storeWeak((id *)&v10->_engine, obj);
  v11->_startCalled = 0;
  v11->_renderingState = 0;
  v11->_prepareState = 0;
  audioSession = v11->_audioSession;
  v11->_audioSession = 0;

  if (!obj)
  {
    v99 = *MEMORY[0x24BDD0FC8];
    v169 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASE not initialized"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = v100;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
    v148 = (PHASESoundEventNodeAsset *)objc_claimAutoreleasedReturnValue();

    v102 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v101)
                                                                                         + 432)));
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      -[PHASESoundEventNodeAsset objectForKeyedSubscript:](v148, "objectForKeyedSubscript:", v99);
      v103 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v104 = objc_msgSend(v103, "UTF8String");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "PHASESoundEvent.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 144;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v104;
      _os_log_impl(&dword_2164CC000, v102, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    goto LABEL_81;
  }
  v144 = (Phase::ActionTreeManager *)Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(obj, "implementation") + 48), 7);
  objc_msgSend(obj, "assetRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "assetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetForIdentifier:", v14);
  v148 = (PHASESoundEventNodeAsset *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v106 = *MEMORY[0x24BDD0FC8];
    v167 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SoundEventNodeAsset not registered"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = v107;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
    v102 = objc_claimAutoreleasedReturnValue();

    v109 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v108)
                                                                                         + 432)));
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      -[NSObject objectForKeyedSubscript:](v102, "objectForKeyedSubscript:", v106);
      v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v111 = objc_msgSend(v110, "UTF8String");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "PHASESoundEvent.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 158;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v111;
      _os_log_impl(&dword_2164CC000, v109, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925665, v102);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_81:

    goto LABEL_109;
  }
  Phase::ActionTreeManager::AllocateActionTreeObject(v148, v11, buf);
  v15 = *(shared_ptr<Phase::ActionTreeObject> *)buf;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  cntrl = (std::__shared_weak_count *)v11->_actionTreeObject.__cntrl_;
  v11->_actionTreeObject = v15;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v19 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  -[PHASESoundEvent internalGetActionTreeMixersWithMixerParameters:actionTreeAsset:outError:](v11, "internalGetActionTreeMixersWithMixerParameters:actionTreeAsset:outError:", v146, *((_QWORD *)v11->_actionTreeObject.__ptr_ + 3), a6);
  v22 = objc_claimAutoreleasedReturnValue();
  mixers = v11->_mixers;
  v11->_mixers = (NSDictionary *)v22;

  v24 = v11->_mixers;
  if (!v24)
    goto LABEL_109;
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  -[NSDictionary allValues](v24, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v25;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v153, v166, 16);
  if (!v26)
    goto LABEL_69;
  v27 = *(_QWORD *)v154;
  do
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v154 != v27)
        objc_enumerationMutation(v150);
      v29 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
      v30 = (std::__shared_weak_count *)v11->_actionTreeObject.__cntrl_;
      ptr = v11->_actionTreeObject.__ptr_;
      v152 = v30;
      if (v30)
      {
        p_shared_weak_owners = (unint64_t *)&v30->__shared_weak_owners_;
        do
          v32 = __ldxr(p_shared_weak_owners);
        while (__stxr(v32 + 1, p_shared_weak_owners));
      }
      objc_msgSend(v29, "setWeakActionTreeObject:", &ptr);
      if (v152)
        std::__shared_weak_count::__release_weak(v152);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v29;
        objc_msgSend(v33, "identifier");
        v34 = (Phase *)objc_claimAutoreleasedReturnValue();
        StringHashId = Phase::GetStringHashId(v34, v35);

        v37 = v11->_actionTreeObject.__ptr_;
        objc_msgSend(v33, "source");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "geoEntityHandle");
        v40 = *((_QWORD *)v37 + 3);
        v41 = *(unsigned int *)(v40 + 96);
        if ((_DWORD)v41)
        {
          v42 = 0;
          v43 = *(_QWORD **)(v40 + 104);
          v44 = 96 * v41;
          while (*v43 != StringHashId)
          {
            v43 += 743;
            v42 += 96;
            if (v44 == v42)
              goto LABEL_40;
          }
          *(_QWORD *)(*((_QWORD *)v37 + 10) + v42 + 24) = v39;
        }
LABEL_40:

        v57 = v11->_actionTreeObject.__ptr_;
        objc_msgSend(v33, "listener");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "geoEntityHandle");
        v60 = *((_QWORD *)v57 + 3);
        v61 = *(unsigned int *)(v60 + 96);
        if ((_DWORD)v61)
        {
          v62 = 0;
          v63 = *(_QWORD **)(v60 + 104);
          v64 = 96 * v61;
          while (*v63 != StringHashId)
          {
            v63 += 743;
            v62 += 96;
            if (v64 == v62)
              goto LABEL_46;
          }
          *(_QWORD *)(*((_QWORD *)v57 + 10) + v62 + 32) = v59;
        }
LABEL_46:

        v65 = v11->_actionTreeObject.__ptr_;
        v66 = objc_msgSend(v33, "sourceDirectivityModel");
        v67 = *((_QWORD *)v65 + 3);
        v68 = *(unsigned int *)(v67 + 96);
        if ((_DWORD)v68)
        {
          v69 = 0;
          v70 = *(_QWORD **)(v67 + 104);
          v71 = 96 * v68;
          while (*v70 != StringHashId)
          {
            v70 += 743;
            v69 += 96;
            if (v71 == v69)
              goto LABEL_52;
          }
          *(_QWORD *)(*((_QWORD *)v65 + 10) + v69 + 40) = v66;
        }
LABEL_52:
        v72 = v11->_actionTreeObject.__ptr_;
        v73 = objc_msgSend(v33, "listenerDirectivityModel");
        v74 = *((_QWORD *)v72 + 3);
        v75 = *(unsigned int *)(v74 + 96);
        if ((_DWORD)v75)
        {
          v76 = 0;
          v77 = *(_QWORD **)(v74 + 104);
          v78 = 96 * v75;
          while (*v77 != StringHashId)
          {
            v77 += 743;
            v76 += 96;
            if (v78 == v76)
              goto LABEL_58;
          }
          *(_QWORD *)(*((_QWORD *)v72 + 10) + v76 + 48) = v73;
        }
LABEL_58:
        v79 = v11->_actionTreeObject.__ptr_;
        v80 = objc_msgSend(v33, "distanceModel");
        v81 = *((_QWORD *)v79 + 3);
        v82 = *(unsigned int *)(v81 + 96);
        if ((_DWORD)v82)
        {
          v83 = 0;
          v84 = *(_QWORD **)(v81 + 104);
          v85 = 96 * v82;
          while (*v84 != StringHashId)
          {
            v84 += 743;
            v83 += 96;
            if (v85 == v83)
              goto LABEL_66;
          }
          *(_QWORD *)(*((_QWORD *)v79 + 10) + v83 + 56) = v80;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v45 = v29;
        objc_msgSend(v45, "identifier");
        v46 = (Phase *)objc_claimAutoreleasedReturnValue();
        v48 = Phase::GetStringHashId(v46, v47);

        v49 = v11->_actionTreeObject.__ptr_;
        objc_msgSend(v45, "listener");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "geoEntityHandle");
        v52 = *((_QWORD *)v49 + 3);
        v53 = *(unsigned int *)(v52 + 96);
        if ((_DWORD)v53)
        {
          v54 = 0;
          v55 = *(_QWORD **)(v52 + 104);
          v56 = 96 * v53;
          while (*v55 != v48)
          {
            v55 += 743;
            v54 += 96;
            if (v56 == v54)
              goto LABEL_65;
          }
          *(_QWORD *)(*((_QWORD *)v49 + 10) + v54 + 32) = v51;
        }
LABEL_65:

        v86 = (uint64_t)v11->_actionTreeObject.__ptr_;
        objc_msgSend(v45, "orientation");
        *(_OWORD *)buf = v87;
        Phase::ActionTreeObject::SetAmbientOrientation(v86, v48, buf);
      }
LABEL_66:

    }
    v25 = v150;
    v26 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v153, v166, 16);
  }
  while (v26);
LABEL_69:

  v88 = v11->_actionTreeObject.__ptr_;
  v89 = (std::__shared_weak_count *)v11->_actionTreeObject.__cntrl_;
  if (v89)
  {
    v90 = (unint64_t *)&v89->__shared_owners_;
    do
      v91 = __ldxr(v90);
    while (__stxr(v91 + 1, v90));
    v158 = v88;
    v159 = v89;
    do
      v92 = __ldxr(v90);
    while (__stxr(v92 + 1, v90));
  }
  else
  {
    v158 = v11->_actionTreeObject.__ptr_;
    v159 = 0;
  }
  if (*((int *)v144 + 4) <= 0)
  {
    v138 = objc_retainAutorelease(**((id **)v144 + 3));
    if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "Commandable.hpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 132;
      _os_log_impl(&dword_2164CC000, v138, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B0] + 16);
  }
  v112 = **((_QWORD **)v144 + 1);
  *(_QWORD *)buf = v144;
  *(_QWORD *)&buf[8] = Phase::ActionTreeManager::RegisterActionTreeInstance;
  *(_QWORD *)&buf[16] = 0;
  *(_QWORD *)&buf[24] = v88;
  *(_QWORD *)&buf[32] = v89;
  if (v89)
  {
    v113 = (unint64_t *)&v89->__shared_owners_;
    do
      v114 = __ldxr(v113);
    while (__stxr(v114 + 1, v113));
  }
  v161 = 0;
  v160 = 1;
  v115 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v112, 48, &v161, &v160);
  if (!v115)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v141 = objc_retainAutorelease(**(id **)(v112 + 48));
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v171 = 136315394;
      v172 = "CommandQueue.hpp";
      v173 = 1024;
      v174 = 100;
      _os_log_impl(&dword_2164CC000, v141, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\",
        v171,
        0x12u);
    }
    v142 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v142, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v160)
  {
    v116 = objc_retainAutorelease(**(id **)(v112 + 48));
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v171 = 136315906;
      v172 = "CommandQueue.hpp";
      v173 = 1024;
      v174 = 89;
      v175 = 2048;
      v176 = v161;
      v177 = 2048;
      v178 = 48;
      _os_log_impl(&dword_2164CC000, v116, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", v171, 0x26u);
    }
  }
  *(_QWORD *)v115 = &off_24D57FA78;
  v117 = *(_QWORD *)&buf[16];
  *(_OWORD *)(v115 + 2) = *(_OWORD *)buf;
  *((_QWORD *)v115 + 3) = v117;
  *((_QWORD *)v115 + 4) = v88;
  *((_QWORD *)v115 + 5) = v89;
  *(_QWORD *)&buf[24] = 0;
  *(_QWORD *)&buf[32] = 0;
  Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v112, 48);
  atomic_store(0, (unsigned __int8 *)(v112 + 40));
  if (v89)
  {
    v118 = (unint64_t *)&v89->__shared_owners_;
    do
      v119 = __ldaxr(v118);
    while (__stlxr(v119 - 1, v118));
    if (!v119)
    {
      ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
      std::__shared_weak_count::__release_weak(v89);
    }
  }
  if (v89)
  {
    v120 = (unint64_t *)&v89->__shared_owners_;
    do
      v121 = __ldaxr(v120);
    while (__stlxr(v121 - 1, v120));
    if (!v121)
    {
      ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
      std::__shared_weak_count::__release_weak(v89);
    }
  }
  WeakRetained = objc_loadWeakRetained(location);
  objc_msgSend(WeakRetained, "addSoundEvent:", v11);

  objc_storeStrong((id *)&v11->_protoType, v145);
  -[PHASESoundEvent internalGetActionTreeMetaParameters](v11, "internalGetActionTreeMetaParameters");
  v123 = objc_claimAutoreleasedReturnValue();
  metaParameters = v11->_metaParameters;
  v11->_metaParameters = (NSDictionary *)v123;

  -[PHASESoundEvent internalGetActionTreePushStreamNodes:](v11, "internalGetActionTreePushStreamNodes:", v147);
  v125 = objc_claimAutoreleasedReturnValue();
  pushStreamNodes = v11->_pushStreamNodes;
  v11->_pushStreamNodes = (NSDictionary *)v125;

  -[PHASESoundEvent internalGetActionTreePullStreamNodes:](v11, "internalGetActionTreePullStreamNodes:", v147);
  v127 = objc_claimAutoreleasedReturnValue();
  pullStreamNodes = v11->_pullStreamNodes;
  v11->_pullStreamNodes = (NSDictionary *)v127;

  v130 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v129)
                                                                                       + 432)));
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    v131 = *(_QWORD *)v11->_actionTreeObject.__ptr_;
    -[PHASEAsset identifier](v148, "identifier");
    v132 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v133 = objc_msgSend(v132, "UTF8String");
    -[PHASEAsset identifier](v148, "identifier");
    v134 = (Phase *)objc_claimAutoreleasedReturnValue();
    v136 = Phase::GetStringHashId(v134, v135);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "PHASESoundEvent.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 264;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v131;
    *(_WORD *)&buf[28] = 2080;
    *(_QWORD *)&buf[30] = v133;
    *(_WORD *)&buf[38] = 2048;
    v165 = v136;
    _os_log_impl(&dword_2164CC000, v130, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (sound event: %llu) - initialized (asset: %s (%llu))", buf, 0x30u);

  }
  v105 = v11;
LABEL_110:

  return v105;
}

- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PHASEMixerParameters *v10;
  PHASESoundEvent *v11;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(PHASEMixerParameters);
  v11 = -[PHASESoundEvent initWithEngine:soundPrototype:mixerParameters:error:](self, "initWithEngine:soundPrototype:mixerParameters:error:", v8, v9, v10, a5);

  return v11;
}

- (PHASESoundEvent)initWithEngine:(id)a3 soundPrototype:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  PHASEMixerParameters *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  PHASESoundEvent *v21;
  PHASESoundEvent *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v23 = self;
  v30 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(PHASEMixerParameters);
  objc_msgSend(v11, "mixerInformation");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v19, "mixerType", v23) == 1)
        {
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHASEMixerParameters addSpatialMixerParametersWithIdentifier:source:listener:](v14, "addSpatialMixerParametersWithIdentifier:source:listener:", v20, v12, v13);
        }
        else
        {
          if (objc_msgSend(v19, "mixerType") != 2)
            continue;
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHASEMixerParameters addAmbientMixerParametersWithIdentifier:listener:](v14, "addAmbientMixerParametersWithIdentifier:listener:", v20, v13);
        }

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v21 = -[PHASESoundEvent initWithEngine:soundPrototype:mixerParameters:error:](v23, "initWithEngine:soundPrototype:mixerParameters:error:", v24, v11, v14, a7);
  return v21;
}

- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 mixerParameters:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  PHASESoundPrototype *v13;
  PHASESoundEvent *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[PHASESoundPrototype initWithEngine:actionTreeRootNode:error:]([PHASESoundPrototype alloc], "initWithEngine:actionTreeRootNode:error:", v10, v11, a6);
  v14 = -[PHASESoundEvent initWithEngine:soundPrototype:mixerParameters:error:](self, "initWithEngine:soundPrototype:mixerParameters:error:", v10, v13, v12, a6);

  return v14;
}

- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PHASESoundPrototype *v10;
  PHASESoundEvent *v11;

  v8 = a3;
  v9 = a4;
  v10 = -[PHASESoundPrototype initWithEngine:actionTreeRootNode:error:]([PHASESoundPrototype alloc], "initWithEngine:actionTreeRootNode:error:", v8, v9, a5);
  v11 = -[PHASESoundEvent initWithEngine:soundPrototype:error:](self, "initWithEngine:soundPrototype:error:", v8, v10, a5);

  return v11;
}

- (PHASESoundEvent)initWithEngine:(id)a3 rootNode:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PHASESoundPrototype *v16;
  PHASESoundEvent *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[PHASESoundPrototype initWithEngine:actionTreeRootNode:error:]([PHASESoundPrototype alloc], "initWithEngine:actionTreeRootNode:error:", v12, v13, a7);
  v17 = -[PHASESoundEvent initWithEngine:soundPrototype:source:listener:error:](self, "initWithEngine:soundPrototype:source:listener:error:", v12, v16, v14, v15, a7);

  return v17;
}

- (PHASESoundEvent)initWithEngine:(PHASEEngine *)engine assetIdentifier:(NSString *)assetIdentifier mixerParameters:(PHASEMixerParameters *)mixerParameters error:(NSError *)error
{
  PHASEEngine *v10;
  NSString *v11;
  PHASEMixerParameters *v12;
  PHASESoundPrototype *v13;
  PHASESoundEvent *v14;

  v10 = engine;
  v11 = assetIdentifier;
  v12 = mixerParameters;
  v13 = -[PHASESoundPrototype initWithEngine:registeredActionTreeIdentifier:error:]([PHASESoundPrototype alloc], "initWithEngine:registeredActionTreeIdentifier:error:", v10, v11, error);
  v14 = -[PHASESoundEvent initWithEngine:soundPrototype:mixerParameters:error:](self, "initWithEngine:soundPrototype:mixerParameters:error:", v10, v13, v12, error);

  return v14;
}

- (PHASESoundEvent)initWithEngine:(PHASEEngine *)engine assetIdentifier:(NSString *)assetIdentifier error:(NSError *)error
{
  PHASEEngine *v8;
  NSString *v9;
  PHASESoundPrototype *v10;
  PHASESoundEvent *v11;

  v8 = engine;
  v9 = assetIdentifier;
  v10 = -[PHASESoundPrototype initWithEngine:registeredActionTreeIdentifier:error:]([PHASESoundPrototype alloc], "initWithEngine:registeredActionTreeIdentifier:error:", v8, v9, error);
  v11 = -[PHASESoundEvent initWithEngine:soundPrototype:error:](self, "initWithEngine:soundPrototype:error:", v8, v10, error);

  return v11;
}

- (PHASESoundEvent)initWithEngine:(id)a3 assetIdentifier:(id)a4 source:(id)a5 listener:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PHASESoundPrototype *v16;
  PHASESoundEvent *v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[PHASESoundPrototype initWithEngine:registeredActionTreeIdentifier:error:]([PHASESoundPrototype alloc], "initWithEngine:registeredActionTreeIdentifier:error:", v12, v13, a7);
  v17 = -[PHASESoundEvent initWithEngine:soundPrototype:source:listener:error:](self, "initWithEngine:soundPrototype:source:listener:error:", v12, v16, v14, v15, a7);

  return v17;
}

- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 mixerParameters:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  PHASESoundEvent *v13;

  v10 = a3;
  v11 = a5;
  objc_msgSend(a4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PHASESoundEvent initWithEngine:assetIdentifier:mixerParameters:error:](self, "initWithEngine:assetIdentifier:mixerParameters:error:", v10, v12, v11, a6);

  return v13;
}

- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 outError:(id *)a5
{
  id v8;
  void *v9;
  PHASESoundEvent *v10;

  v8 = a3;
  objc_msgSend(a4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHASESoundEvent initWithEngine:assetIdentifier:error:](self, "initWithEngine:assetIdentifier:error:", v8, v9, a5);

  return v10;
}

- (PHASESoundEvent)initWithEngine:(id)a3 registeredSoundEventNodeAsset:(id)a4 source:(id)a5 listener:(id)a6 outError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  PHASESoundEvent *v16;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  objc_msgSend(a4, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PHASESoundEvent initWithEngine:registeredSoundEventNodeAssetUID:source:listener:outError:](self, "initWithEngine:registeredSoundEventNodeAssetUID:source:listener:outError:", v12, v15, v13, v14, a7);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ActionTreeObject *ptr;
  _QWORD *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0
    && (ptr = self->_actionTreeObject.__ptr_, v6 = (_QWORD *)v4[4], *(_QWORD *)ptr == *v6)
    && *((_QWORD *)ptr + 1) == v6[1];

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  ActionTreeObject *ptr;
  unint64_t result;

  v2 = 0;
  ptr = self->_actionTreeObject.__ptr_;
  result = 0xCBF29CE484222325;
  do
    result = 0x100000001B3 * (result ^ *((char *)ptr + v2++));
  while (v2 != 16);
  return result;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__PHASESoundEvent_prepareWithCompletionHandler___block_invoke;
  v6[3] = &unk_24D57F9A8;
  v7 = v4;
  v5 = v4;
  -[PHASESoundEvent prepareWithCompletion:](self, "prepareWithCompletion:", v6);

}

uint64_t __48__PHASESoundEvent_prepareWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)prepareWithCompletion:(void *)handler
{
  void (**v4)(void *, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  Phase::Logger *v10;
  NSObject *v11;
  id v12;
  Phase::Logger *InstancePtr;
  Phase::Logger *v14;
  uint64_t v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  int v19;
  _QWORD v20[5];
  void (**v21)(void *, _QWORD);
  uint8_t buf[4];
  PHASESoundEvent *v23;
  __int16 v24;
  _BYTE v25[14];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = handler;
  if (-[PHASESoundEvent prepareState](self, "prepareState"))
  {
    v5 = *MEMORY[0x24BDD0FC8];
    v26 = *MEMORY[0x24BDD0FC8];
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[PHASESoundPrototype assetIdentifier](self->_protoType, "assetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("prepare called multiple times on %@ asset %@:"), self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10)
                                                                                        + 432)));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v5);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = (PHASESoundEvent *)"PHASESoundEvent.mm";
      v24 = 1024;
      *(_DWORD *)v25 = 506;
      *(_WORD *)&v25[4] = 2080;
      *(_QWORD *)&v25[6] = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (v4)
      v4[2](v4, 0);

  }
  else if (-[PHASESoundEvent validateAudioSessionWithError:](self, "validateAudioSessionWithError:", 0))
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr((Phase::Logger *)-[PHASESoundEvent setPrepareState:](self, "setPrepareState:", 1));
    if (*((_BYTE *)InstancePtr + 440))
    {
      v14 = (Phase::Logger *)objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(InstancePtr)
                                                                                               + 432)));
      v15 = Phase::Logger::GetInstancePtr(v14);
      v16 = os_signpost_id_generate(**(os_log_t **)(v15 + 432));
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v17 = v16;
        if (os_signpost_enabled((os_log_t)v14))
        {
          v18 = *(_QWORD *)self->_actionTreeObject.__ptr_;
          v19 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
          *(_DWORD *)buf = 134218496;
          v23 = self;
          v24 = 2048;
          *(_QWORD *)v25 = v18;
          *(_WORD *)&v25[8] = 1024;
          *(_DWORD *)&v25[10] = v19;
          _os_signpost_emit_with_name_impl(&dword_2164CC000, (os_log_t)v14, OS_SIGNPOST_EVENT, v17, "Phase_SoundEvent_Prepare", "SoundEvent@%p: %llu Prepare Called on AudioSessionId 0x%x", buf, 0x1Cu);
        }
      }

    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __41__PHASESoundEvent_prepareWithCompletion___block_invoke;
    v20[3] = &unk_24D57F9D0;
    v20[4] = self;
    v21 = v4;
    -[PHASESoundEvent internalPrepareActionTreeWithCompletionBlock:](self, "internalPrepareActionTreeWithCompletionBlock:", v20);

  }
  else
  {
    if (v4)
      v4[2](v4, 0);
    -[PHASESoundEvent stopAndInvalidate](self, "stopAndInvalidate");
  }

}

void __41__PHASESoundEvent_prepareWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  Phase::Logger *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v5, "setPrepareState:", 2);
    if (a2 == 1 && (a3 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "registerTapSources");
  }
  v7 = *(Phase::Logger **)(a1 + 40);
  if (v7)
    v7 = (Phase::Logger *)(*((uint64_t (**)(Phase::Logger *, uint64_t))v7 + 2))(v7, a2);
  v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 432));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 136315906;
    v11 = "PHASESoundEvent.mm";
    v12 = 1024;
    v13 = 555;
    v14 = 2112;
    v15 = v9;
    v16 = 2048;
    v17 = a2;
    _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ prepare completed with result: %ld", (uint8_t *)&v10, 0x26u);
  }
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  if (a3)
    *a3 = 0;
  -[PHASESoundEvent prepareWithCompletion:](self, "prepareWithCompletion:", 0);
  return 1;
}

- (void)startWithCompletion:(void *)handler
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  id v7;
  Phase::Logger *InstancePtr;
  Phase::Logger *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  int v14;
  _QWORD v15[5];
  void (**v16)(_QWORD, _QWORD);
  uint8_t buf[4];
  PHASESoundEvent *v18;
  __int16 v19;
  _BYTE v20[14];
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = handler;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_startCalled)
  {
    v6 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v4)
                                                                                       + 432)));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PHASESoundPrototype assetIdentifier](self->_protoType, "assetIdentifier");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315906;
      v18 = (PHASESoundEvent *)"PHASESoundEvent.mm";
      v19 = 1024;
      *(_DWORD *)v20 = 584;
      *(_WORD *)&v20[4] = 2112;
      *(_QWORD *)&v20[6] = self;
      v21 = 2080;
      v22 = objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Start called multiple times for %@ with asset %s already", buf, 0x26u);

    }
    if (v5)
      v5[2](v5, 0);
  }
  else
  {
    if (!self->_prepareState)
      -[PHASESoundEvent prepareWithCompletion:](self, "prepareWithCompletion:", 0);
    self->_startCalled = 1;
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr((Phase::Logger *)-[PHASESoundEvent setRenderingState:](self, "setRenderingState:", 1));
    if (*((_BYTE *)InstancePtr + 440))
    {
      v9 = (Phase::Logger *)objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(InstancePtr)
                                                                                              + 432)));
      v10 = Phase::Logger::GetInstancePtr(v9);
      v11 = os_signpost_id_generate(**(os_log_t **)(v10 + 432));
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v12 = v11;
        if (os_signpost_enabled((os_log_t)v9))
        {
          v13 = *(_QWORD *)self->_actionTreeObject.__ptr_;
          v14 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
          *(_DWORD *)buf = 134218496;
          v18 = self;
          v19 = 2048;
          *(_QWORD *)v20 = v13;
          *(_WORD *)&v20[8] = 1024;
          *(_DWORD *)&v20[10] = v14;
          _os_signpost_emit_with_name_impl(&dword_2164CC000, (os_log_t)v9, OS_SIGNPOST_EVENT, v12, "Phase_SoundEvent_Start", "SoundEvent@%p: %llu Start Called on AudioSessionId 0x%x", buf, 0x1Cu);
        }
      }

    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __39__PHASESoundEvent_startWithCompletion___block_invoke;
    v15[3] = &unk_24D57F9F8;
    v15[4] = self;
    v16 = v5;
    -[PHASESoundEvent internalStartActionTreeWithCompletionBlock:](self, "internalStartActionTreeWithCompletionBlock:", v15);

  }
}

void __39__PHASESoundEvent_startWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  Phase::Logger *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setRenderingState:", 0);
  v4 = *(Phase::Logger **)(a1 + 40);
  if (v4)
    v4 = (Phase::Logger *)(*((uint64_t (**)(Phase::Logger *, uint64_t))v4 + 2))(v4, a2);
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v4) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136315906;
    v8 = "PHASESoundEvent.mm";
    v9 = 1024;
    v10 = 620;
    v11 = 2112;
    v12 = v6;
    v13 = 2048;
    v14 = a2;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ completed with result: %ld", (uint8_t *)&v7, 0x26u);
  }
}

- (BOOL)startAndReturnError:(id *)a3
{
  if (a3)
    *a3 = 0;
  -[PHASESoundEvent startWithCompletion:](self, "startWithCompletion:", 0);
  return 1;
}

- (BOOL)startWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__PHASESoundEvent_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D57F9A8;
  v8 = v4;
  v5 = v4;
  -[PHASESoundEvent startWithCompletion:](self, "startWithCompletion:", v7);

  return 1;
}

uint64_t __46__PHASESoundEvent_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)startWithCompletionBlock:(id)a3
{
  -[PHASESoundEvent startWithCompletion:](self, "startWithCompletion:", a3);
  return 1;
}

- (void)prepareWithSessionIOBinding:(id)a3 completion:(id)a4
{
  id v6;
  Phase::Logger *v7;
  Phase::Logger *v8;
  AVAudioSession *audioSession;
  AVAudioSession *v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  void *v14;
  AVAudioSession *v15;
  AVAudioSession *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  PHASESoundEvent *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (Phase::Logger *)a4;
  v8 = v7;
  audioSession = self->_audioSession;
  if (!audioSession
    || (objc_msgSend(v6, "session"),
        v10 = (AVAudioSession *)objc_claimAutoreleasedReturnValue(),
        v10,
        audioSession == v10))
  {
    v13 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315906;
      v18 = "PHASESoundEvent.mm";
      v19 = 1024;
      v20 = 666;
      v21 = 2112;
      v22 = self;
      v23 = 1024;
      v24 = objc_msgSend(v14, "opaqueSessionID");
      _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Preparing %@, associated with audio sessionId 0x%x", (uint8_t *)&v17, 0x22u);

    }
    objc_msgSend(v6, "session");
    v15 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    v16 = self->_audioSession;
    self->_audioSession = v15;

    -[PHASESoundEvent prepareWithCompletion:](self, "prepareWithCompletion:", v8);
  }
  else
  {
    v11 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
      v17 = 136315906;
      v18 = "PHASESoundEvent.mm";
      v19 = 1024;
      v20 = 657;
      v21 = 2112;
      v22 = self;
      v23 = 1024;
      v24 = v12;
      _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ already assigned an audio sessionId 0x%x", (uint8_t *)&v17, 0x22u);
    }

    if (v8)
      (*((void (**)(Phase::Logger *, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)pause
{
  JUMPOUT(0x2199F9D70);
}

- (void)resume
{
  JUMPOUT(0x2199F9D70);
}

- (void)stopAndInvalidate
{
  JUMPOUT(0x2199F9D70);
}

- (void)registerTapSources
{
  PHASEEngine **p_engine;
  id WeakRetained;
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  UniqueObjectId *begin;
  vector<Phase::UniqueObjectId, std::allocator<Phase::UniqueObjectId>> *p_submixIds;
  UniqueObjectId *v12;
  UniqueObjectId *v13;
  id v14;
  uint64_t v15;
  Phase::TapSourceRegistry *v16;
  pid_t v17;
  AVAudioSession *audioSession;
  CachedTapInfo *p_cachedTapInfo;
  id v20;
  UniqueObjectId *v21;
  __int128 v22;

  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    v20 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)p_engine);
    if (objc_msgSend(v5, "implementation"))
    {
      v6 = objc_loadWeakRetained((id *)p_engine);
      v7 = *(unsigned __int8 *)(objc_msgSend(v6, "implementation") + 528);

      if (!v7)
      {
        v8 = objc_loadWeakRetained((id *)p_engine);
        v9 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v8, "implementation") + 48), 7);

        Phase::ActionTreeManager::GetAllValidSubmixIds(v9, *(_QWORD *)self->_actionTreeObject.__ptr_, *((_QWORD *)self->_actionTreeObject.__ptr_ + 1), (char **)&v21);
        p_submixIds = &self->_submixIds;
        begin = self->_submixIds.__begin_;
        if (begin)
        {
          self->_submixIds.__end_ = begin;
          operator delete(begin);
          p_submixIds->__begin_ = 0;
          self->_submixIds.__end_ = 0;
          self->_submixIds.__end_cap_.__value_ = 0;
        }
        v12 = v21;
        self->_submixIds.__begin_ = v21;
        v13 = (UniqueObjectId *)v22;
        *(_OWORD *)&self->_submixIds.__end_ = v22;
        if (v12 != v13)
        {
          if (self->_prepareState != 2)
            std::terminate();
          v14 = objc_loadWeakRetained((id *)p_engine);
          v15 = objc_msgSend(v14, "implementation");
          v16 = (Phase::TapSourceRegistry *)Phase::Controller::TaskManager::GetService<Phase::TapSourceRegistry>(*(Phase::Logger **)(v15 + 96), *(_QWORD *)(v15 + 104));

          if (v16)
          {
            v17 = getpid();
            audioSession = self->_audioSession;
            p_cachedTapInfo = &self->_cachedTapInfo;
            Phase::TapSourceRegistry::CacheTapInfo(v16, v17, audioSession, p_cachedTapInfo);
            Phase::TapSourceRegistry::RegisterTapSource(v16, 0, p_submixIds, (void **)p_cachedTapInfo);
            Phase::TapSourceRegistry::RegisterTapSource(v16, 1, p_submixIds, (void **)p_cachedTapInfo);
          }
        }
      }
    }
    else
    {

    }
  }
}

- (void)unregisterTapSources
{
  vector<Phase::UniqueObjectId, std::allocator<Phase::UniqueObjectId>> *p_submixIds;
  PHASEEngine **p_engine;
  id WeakRetained;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  Phase::Logger *v10;
  void **p_cachedTapInfo;
  id v12;
  id v13;

  p_submixIds = &self->_submixIds;
  if (self->_submixIds.__begin_ != self->_submixIds.__end_)
  {
    p_engine = &self->_engine;
    WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
    if (WeakRetained)
    {
      v12 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)p_engine);
      if (objc_msgSend(v6, "implementation"))
      {
        v7 = objc_loadWeakRetained((id *)p_engine);
        v8 = *(unsigned __int8 *)(objc_msgSend(v7, "implementation") + 528);

        if (!v8)
        {
          v13 = objc_loadWeakRetained((id *)p_engine);
          v9 = objc_msgSend(v13, "implementation");
          v10 = (Phase::Logger *)Phase::Controller::TaskManager::GetService<Phase::TapSourceRegistry>(*(Phase::Logger **)(v9 + 96), *(_QWORD *)(v9 + 104));

          if (v10)
          {
            p_cachedTapInfo = (void **)&self->_cachedTapInfo;
            Phase::TapSourceRegistry::UnregisterTapSource(v10, 0, p_submixIds, p_cachedTapInfo);
            Phase::TapSourceRegistry::UnregisterTapSource(v10, 1, p_submixIds, p_cachedTapInfo);
          }
        }
      }
      else
      {

      }
    }
  }
}

- (void)setMetaParameter:(id)a3 value:(double)a4 withTimeInterval:(double)a5
{
  id v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  ActionTreeObject *ptr;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  unsigned int v16;
  unsigned __int8 *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  PHASESoundEvent *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (*((_BYTE *)self->_actionTreeObject.__ptr_ + 144))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

    if (WeakRetained)
    {
      v10 = objc_loadWeakRetained((id *)&self->_engine);
      v11 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v10, "implementation") + 48), 7);

      ptr = self->_actionTreeObject.__ptr_;
      v13 = *(_QWORD *)ptr;
      v14 = *((_QWORD *)ptr + 1);
      v15 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      if (v15 && (v16 = *v15, *v15))
      {
        v17 = v15 + 1;
        v18 = 0xCBF29CE484222325;
        do
        {
          v18 = 0x100000001B3 * (v18 ^ v16);
          v19 = *v17++;
          v16 = v19;
        }
        while (v19);
      }
      else
      {
        v18 = 0;
      }
      v20 = Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::ActionTreeManager,BOOL,Phase::UniqueObjectId,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v11, v13, v14, v18, 1, *(uint64_t *)&a4, a5);
      if ((v20 & 1) == 0)
      {
        v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v20) + 432));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315650;
          v23 = "PHASESoundEvent.mm";
          v24 = 1024;
          v25 = 825;
          v26 = 2112;
          v27 = self;
          _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ Command buffer full.  Unable to set MetaParameter.  Consider having fewer sound event API calls in a given frame", (uint8_t *)&v22, 0x1Cu);
        }
      }
    }
  }

}

- (void)setMetaParameter:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  ActionTreeObject *ptr;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  unsigned int v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  PHASESoundEvent *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (*((_BYTE *)self->_actionTreeObject.__ptr_ + 144))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)&self->_engine);
      v10 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v9, "implementation") + 48), 7);

      v11 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      if (v11 && (v12 = *v11, *v11))
      {
        v13 = 0xCBF29CE484222325;
        v14 = v11 + 1;
        do
        {
          v13 = 0x100000001B3 * (v13 ^ v12);
          v15 = *v14++;
          v12 = v15;
        }
        while (v15);
      }
      else
      {
        v13 = 0;
      }
      ptr = self->_actionTreeObject.__ptr_;
      v17 = *(_QWORD *)ptr;
      v18 = *((_QWORD *)ptr + 1);
      v19 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v19 && (v20 = *v19, *v19))
      {
        v21 = 0xCBF29CE484222325;
        v22 = v19 + 1;
        do
        {
          v21 = 0x100000001B3 * (v21 ^ v20);
          v23 = *v22++;
          v20 = v23;
        }
        while (v23);
      }
      else
      {
        v21 = 0;
      }
      v24 = Phase::Commandable<128,Phase::LockFreeQueueMPSC>::CallAsync<Phase::ActionTreeManager,BOOL,Phase::UniqueObjectId,unsigned long long,Phase::InputMetaParamType,Phase::MetaParamValue,double>(v10, v17, v18, v21, 2, v13, 0.0);
      if ((v24 & 1) == 0)
      {
        v25 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v24) + 432));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = 136315650;
          v27 = "PHASESoundEvent.mm";
          v28 = 1024;
          v29 = 846;
          v30 = 2112;
          v31 = self;
          _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ Command buffer full.  Unable to set MetaParameter.  Consider having fewer sound event API calls in a given frame", (uint8_t *)&v26, 0x1Cu);
        }
      }
    }
  }

}

- (PHASERenderingState)renderingState
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
    return self->_renderingState;
  else
    return 0;
}

- (PHASESoundEventPrepareState)prepareState
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
    return self->_prepareState;
  else
    return 2;
}

- (BOOL)indefinite
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return WeakRetained && (v4 = *((_QWORD *)self->_actionTreeObject.__ptr_ + 3)) != 0 && *(_BYTE *)(v4 + 112) == 0;
}

- (void)internalCleanup
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Phase::Logger *v13;
  NSObject *v14;
  uint64_t v15;
  PHASERenderingState v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSDictionary allValues](self->_mixers, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
            if (objc_msgSend(v9, "sourceDirectivityModel"))
            {
              v10 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 312))(v10, objc_msgSend(v9, "sourceDirectivityModel"));
            }
            if (objc_msgSend(v9, "listenerDirectivityModel"))
            {
              v11 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v11 + 312))(v11, objc_msgSend(v9, "listenerDirectivityModel"));
            }
            if (objc_msgSend(v9, "distanceModel"))
            {
              v12 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 320))(v12, objc_msgSend(v9, "distanceModel"));
            }

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v5);
    }

    v13 = -[PHASESoundEvent renderingState](self, "renderingState");
    if (v13)
    {
      v14 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v13)
                                                                                          + 432)));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)self->_actionTreeObject.__ptr_;
        v16 = -[PHASESoundEvent renderingState](self, "renderingState");
        if ((unint64_t)v16 > PHASERenderingStatePaused)
          v17 = "<not found>";
        else
          v17 = off_24D57FBC0[v16];
        *(_DWORD *)buf = 136315906;
        v23 = "PHASESoundEvent.mm";
        v24 = 1024;
        v25 = 930;
        v26 = 2048;
        v27 = v15;
        v28 = 2080;
        v29 = v17;
        _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d (sound event: %llu) - the sound event state should be stopped prior to its teardown. (rendering state: %s)", buf, 0x26u);
      }

      -[PHASESoundEvent setRenderingState:](self, "setRenderingState:", 0);
    }
    -[PHASESoundEvent unregisterTapSources](self, "unregisterTapSources");
    objc_msgSend(WeakRetained, "removeSoundEvent:", self);
  }

}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (BOOL)validateAudioSessionWithError:(id *)a3
{
  AVAudioSession *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  AVAudioSession *v15;
  AVAudioSession *v16;
  BOOL v17;
  AVAudioSession *v18;
  BOOL v19;
  uint64_t v20;
  AVAudioSession *audioSession;
  BOOL v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  Phase::Logger *v29;
  NSObject *v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  Phase::Logger *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  id *v44;
  NSDictionary *obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = self->_audioSession;
  if (a3)
    *a3 = 0;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = self->_mixers;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (!v7)
  {
LABEL_21:

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v5 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v5;
    audioSession = self->_audioSession;
    self->_audioSession = v5;
    v22 = 1;
    goto LABEL_33;
  }
  v44 = a3;
  obj = v6;
  v8 = *(_QWORD *)v47;
LABEL_5:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v47 != v8)
      objc_enumerationMutation(obj);
    -[NSDictionary objectForKey:](self->_mixers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v9));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "parent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        break;
    }
LABEL_19:

    if (++v9 == v7)
    {
      v6 = obj;
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
      if (!v7)
        goto LABEL_21;
      goto LABEL_5;
    }
  }
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    objc_msgSend(v12, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
      goto LABEL_18;
    if (v5)
      break;
    objc_msgSend(v12, "session");
    v5 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    objc_msgSend(v12, "parent");
    v20 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v20;
    if (!v20)
      goto LABEL_19;
  }
  v15 = self->_audioSession;
  if (v15)
  {
    objc_msgSend(v12, "session");
    v16 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    v17 = v15 == v16;

    if (!v17)
    {
      v34 = *MEMORY[0x24BDD0FC8];
      v58 = *MEMORY[0x24BDD0FC8];
      v35 = (void *)MEMORY[0x24BDD17C8];
      v36 = -[AVAudioSession opaqueSessionID](self->_audioSession, "opaqueSessionID");
      objc_msgSend(v12, "session");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("A PHASESoundEvent cannot prepare with a session IO binding (sessionID=%u) that disagrees with its PHASESource's root object's audio session (sessionID=%u)"), v36, objc_msgSend(v37, "opaqueSessionID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v39)
                                                                                          + 432)));
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v28, "objectForKeyedSubscript:", v34);
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = objc_msgSend(v41, "UTF8String");
        *(_DWORD *)buf = 136315650;
        v53 = "PHASESoundEvent.mm";
        v54 = 1024;
        v55 = 993;
        v56 = 2080;
        v57 = v42;
        _os_log_impl(&dword_2164CC000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

      }
      if (v44)
        goto LABEL_31;
      goto LABEL_32;
    }
  }
  objc_msgSend(v12, "session");
  v18 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  v19 = v5 == v18;

  if (v19)
    goto LABEL_18;
  v23 = *MEMORY[0x24BDD0FC8];
  v50 = *MEMORY[0x24BDD0FC8];
  v24 = (void *)MEMORY[0x24BDD17C8];
  v25 = -[AVAudioSession opaqueSessionID](v5, "opaqueSessionID");
  objc_msgSend(v12, "session");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("A PHASESoundEvent cannot have multiple PHASESources with different session root objects (sessionIDs %u and %u)"), v25, objc_msgSend(v26, "opaqueSessionID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v29)
                                                                                      + 432)));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v28, "objectForKeyedSubscript:", v23);
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "UTF8String");
    *(_DWORD *)buf = 136315650;
    v53 = "PHASESoundEvent.mm";
    v54 = 1024;
    v55 = 1012;
    v56 = 2080;
    v57 = v33;
    _os_log_impl(&dword_2164CC000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

  }
  if (v44)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925668, v28);
    *v44 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_32:

  v22 = 0;
  audioSession = (AVAudioSession *)obj;
LABEL_33:

  return v22;
}

- (BOOL)internalPrepareActionTreeWithCompletionBlock:(id)a3
{
  id v4;
  id WeakRetained;
  AVAudioSession *audioSession;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _DWORD *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Phase::Logger *v19;
  NSObject *v20;
  id v21;
  NSObject *v23;
  std::logic_error *exception;
  Phase::Logger *InstancePtr;
  NSObject *v26;
  std::runtime_error *v27;
  __int128 v28;
  _QWORD aBlock[6];
  _QWORD v30[4];
  BOOL v31;
  unint64_t v32;
  _BYTE v33[32];
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    audioSession = self->_audioSession;
    if (!audioSession)
      std::terminate();
    *((_DWORD *)self->_actionTreeObject.__ptr_ + 81) = -[AVAudioSession opaqueSessionID](audioSession, "opaqueSessionID");
    *(_QWORD *)v33 = 0;
    *(_QWORD *)&v33[8] = v33;
    *(_QWORD *)&v33[16] = 0x3032000000;
    *(_QWORD *)&v33[24] = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    v35 = (id)objc_msgSend(v4, "copy");
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = &self->_preparedHostTime;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PHASESoundEvent_internalPrepareActionTreeWithCompletionBlock___block_invoke;
    aBlock[3] = &unk_24D57FA20;
    aBlock[4] = v30;
    aBlock[5] = v33;
    v7 = _Block_copy(aBlock);
    v8 = objc_loadWeakRetained((id *)&self->_engine);
    v9 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v8, "implementation") + 48), 7);

    v28 = *(_OWORD *)self->_actionTreeObject.__ptr_;
    v10 = _Block_copy(v7);
    if (*(int *)(v9 + 16) <= 0)
    {
      v23 = objc_retainAutorelease(**(id **)(v9 + 24));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "Commandable.hpp";
        v40 = 1024;
        v41 = 132;
        _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
      }
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B0] + 16);
    }
    v11 = v10;
    v12 = **(_QWORD **)(v9 + 8);
    v32 = 0;
    v31 = 1;
    v13 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v12, 64, &v32, &v31);
    if (!v13)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v26 = objc_retainAutorelease(**(id **)(v12 + 48));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "CommandQueue.hpp";
        v40 = 1024;
        v41 = 100;
        _os_log_impl(&dword_2164CC000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      v27 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v27, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v31)
    {
      v14 = objc_retainAutorelease(**(id **)(v12 + 48));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v39 = "CommandQueue.hpp";
        v40 = 1024;
        v41 = 89;
        v42 = 2048;
        v43 = v32;
        v44 = 2048;
        v45 = 64;
        _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v13 = &off_24D57FB40;
    *((_QWORD *)v13 + 1) = v9;
    *((_QWORD *)v13 + 2) = Phase::ActionTreeManager::PrepareActionTree;
    *((_QWORD *)v13 + 3) = 0;
    *((_OWORD *)v13 + 2) = v28;
    *((_QWORD *)v13 + 6) = -[PHASESoundEvent internalPrepareActionTreeWithCompletionBlock:]::$_3::__invoke;
    *((_QWORD *)v13 + 7) = v11;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v12, 64);
    atomic_store(0, (unsigned __int8 *)(v12 + 40));
    v15 = 1;

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v33, 8);

  }
  else
  {
    v16 = *MEMORY[0x24BDD0FC8];
    v36 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASE not initialized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19)
                                                                                        + 432)));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", v16);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)v33 = 136315650;
      *(_QWORD *)&v33[4] = "PHASESoundEvent.mm";
      *(_WORD *)&v33[12] = 1024;
      *(_DWORD *)&v33[14] = 1049;
      *(_WORD *)&v33[18] = 2080;
      *(_QWORD *)&v33[20] = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", v33, 0x1Cu);

    }
    (*((void (**)(id, _QWORD, uint64_t))v4 + 2))(v4, 0, 1);

    v15 = 0;
  }

  return v15;
}

uint64_t __64__PHASESoundEvent_internalPrepareActionTreeWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

- (BOOL)internalStartActionTreeWithCompletionBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _DWORD *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  Phase::Logger *v18;
  NSObject *v19;
  id v20;
  NSObject *v22;
  std::logic_error *exception;
  Phase::Logger *InstancePtr;
  NSObject *v25;
  std::runtime_error *v26;
  __int128 v27;
  _QWORD aBlock[6];
  _QWORD v29[4];
  BOOL v30;
  unint64_t v31;
  _BYTE v32[32];
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    *(_QWORD *)v32 = 0;
    *(_QWORD *)&v32[8] = v32;
    *(_QWORD *)&v32[16] = 0x3032000000;
    *(_QWORD *)&v32[24] = __Block_byref_object_copy__0;
    v33 = __Block_byref_object_dispose__0;
    v34 = (id)objc_msgSend(v4, "copy");
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = &self->_ioStartHostTime;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PHASESoundEvent_internalStartActionTreeWithCompletionBlock___block_invoke;
    aBlock[3] = &unk_24D57FA48;
    aBlock[4] = v29;
    aBlock[5] = v32;
    v6 = _Block_copy(aBlock);
    v7 = objc_loadWeakRetained((id *)&self->_engine);
    v8 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v7, "implementation") + 48), 7);

    v27 = *(_OWORD *)self->_actionTreeObject.__ptr_;
    v9 = _Block_copy(v6);
    if (*(int *)(v8 + 16) <= 0)
    {
      v22 = objc_retainAutorelease(**(id **)(v8 + 24));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "Commandable.hpp";
        v39 = 1024;
        v40 = 132;
        _os_log_impl(&dword_2164CC000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
      }
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B0] + 16);
    }
    v10 = v9;
    v11 = **(_QWORD **)(v8 + 8);
    v31 = 0;
    v30 = 1;
    v12 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v11, 64, &v31, &v30);
    if (!v12)
    {
      InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      v25 = objc_retainAutorelease(**(id **)(v11 + 48));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "CommandQueue.hpp";
        v39 = 1024;
        v40 = 100;
        _os_log_impl(&dword_2164CC000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\",
          buf,
          0x12u);
      }
      v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v26, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v30)
    {
      v13 = objc_retainAutorelease(**(id **)(v11 + 48));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v38 = "CommandQueue.hpp";
        v39 = 1024;
        v40 = 89;
        v41 = 2048;
        v42 = v31;
        v43 = 2048;
        v44 = 64;
        _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(_QWORD *)v12 = &off_24D57FB68;
    *((_QWORD *)v12 + 1) = v8;
    *((_QWORD *)v12 + 2) = Phase::ActionTreeManager::StartActionTree;
    *((_QWORD *)v12 + 3) = 0;
    *((_OWORD *)v12 + 2) = v27;
    *((_QWORD *)v12 + 6) = -[PHASESoundEvent internalStartActionTreeWithCompletionBlock:]::$_4::__invoke;
    *((_QWORD *)v12 + 7) = v10;
    Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v11, 64);
    atomic_store(0, (unsigned __int8 *)(v11 + 40));
    v14 = 1;

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v32, 8);

  }
  else
  {
    v15 = *MEMORY[0x24BDD0FC8];
    v35 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASE not initialized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v18)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", v15);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)v32 = 136315650;
      *(_QWORD *)&v32[4] = "PHASESoundEvent.mm";
      *(_WORD *)&v32[12] = 1024;
      *(_DWORD *)&v32[14] = 1106;
      *(_WORD *)&v32[18] = 2080;
      *(_QWORD *)&v32[20] = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", v32, 0x1Cu);

    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);

    v14 = 0;
  }

  return v14;
}

uint64_t __62__PHASESoundEvent_internalStartActionTreeWithCompletionBlock___block_invoke(uint64_t a1, _QWORD *a2)
{
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

- (id)getActionTreeMetaParameterNames
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "assetRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *((_QWORD *)self->_actionTreeObject.__ptr_ + 3);
  if (*(_DWORD *)(v6 + 64))
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(v5, "getString:", *(_QWORD *)(*(_QWORD *)(v6 + 72) + v7));
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

      }
      ++v8;
      v6 = *((_QWORD *)self->_actionTreeObject.__ptr_ + 3);
      v7 += 464;
    }
    while (v8 < *(unsigned int *)(v6 + 64));
  }

  return v3;
}

- (id)internalGetActionTreeMetaParameters
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  ActionTreeObject *ptr;
  uint64_t v11;
  int v12;
  PHASENumberMetaParameter *v13;
  void *v14;
  PHASENumberMetaParameter *v15;
  PHASENumberMetaParameter *v16;
  void *v17;
  const char *v18;
  const char *v19;
  PHASEStringMetaParameter *v20;
  void *v21;
  void *v22;
  PHASEStringMetaParameter *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "assetRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *((_QWORD *)self->_actionTreeObject.__ptr_ + 3);
  if (*(_DWORD *)(v6 + 64))
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = objc_msgSend(v5, "getStringEmpty:", *(_QWORD *)(*(_QWORD *)(v6 + 72) + v7));
      ptr = self->_actionTreeObject.__ptr_;
      if (!v9)
        goto LABEL_16;
      v11 = *(_QWORD *)(*((_QWORD *)ptr + 3) + 72);
      if (*(_DWORD *)(v11 + v7 + 8) != 1)
        goto LABEL_16;
      v12 = *(_DWORD *)(v11 + v7 + 12);
      if (v12 == 2)
        break;
      if (v12 == 1)
      {
        v13 = [PHASENumberMetaParameter alloc];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PHASENumberMetaParameter initWithUID:value:rangeMin:rangeMax:delegate:](v13, "initWithUID:value:rangeMin:rangeMax:delegate:", v14, self, *(double *)(v11 + v7 + 48), *(double *)(v11 + v7 + 32), *(double *)(v11 + v7 + 40));

        v16 = v15;
        -[PHASEMetaParameter identifier](v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v17);
LABEL_15:

        ptr = self->_actionTreeObject.__ptr_;
      }
LABEL_16:
      ++v8;
      v6 = *((_QWORD *)ptr + 3);
      v7 += 464;
      if (v8 >= *(unsigned int *)(v6 + 64))
        goto LABEL_17;
    }
    if (*(_QWORD *)(v11 + v7 + 48))
      v18 = (const char *)objc_msgSend(v5, "getStringEmpty:");
    else
      v18 = "";
    if (v18)
      v19 = v18;
    else
      v19 = "";
    v20 = [PHASEStringMetaParameter alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PHASEStringMetaParameter initWithUID:value:delegate:](v20, "initWithUID:value:delegate:", v21, v22, self);

    v16 = v23;
    -[PHASEMetaParameter identifier](v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, v17);
    goto LABEL_15;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)internalGetActionTreeMixersWithMixerParameters:(id)a3 actionTreeAsset:(const void *)a4 outError:(id *)a5
{
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  NSString *v20;
  uint64_t v21;
  unint64_t v22;
  PHASESpatialMixer *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  id WeakRetained;
  _BOOL4 v33;
  void *v34;
  id v35;
  id v36;
  BOOL v37;
  void *v38;
  char v39;
  void *v40;
  int v41;
  NSString *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  _BYTE *v55;
  id v56;
  uint64_t v57;
  PHASEAmbientMixer *v58;
  void *v59;
  id v60;
  PHASEAmbientMixer *v61;
  PHASESpatialMixer *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  PHASEChannelMixer *v74;
  uint64_t v75;
  void *v76;
  Phase::Logger *v77;
  NSObject *v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  Phase::Logger *v83;
  NSObject *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  Phase::Logger *v90;
  NSObject *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  Phase::Logger *v96;
  NSObject *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  Phase::Logger *v102;
  NSObject *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  Phase::Logger *v108;
  NSObject *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  Phase::Logger *v114;
  NSObject *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  Phase::Logger *v120;
  NSObject *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  Phase::Logger *v126;
  NSObject *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  Phase::Logger *v132;
  NSObject *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  Phase::Logger *v138;
  NSObject *v139;
  id v140;
  uint64_t v141;
  id *v143;
  id v144;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t i;
  __int128 v152;
  void *v153;
  id *location;
  Phase *v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint8_t v180[128];
  uint8_t buf[4];
  const char *v182;
  __int16 v183;
  int v184;
  __int16 v185;
  uint64_t v186;
  uint64_t v187;
  _QWORD v188[4];

  v188[1] = *MEMORY[0x24BDAC8D0];
  v144 = a3;
  objc_msgSend(v144, "parameterDictionary");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = 0;
  v143 = a5;
  if (v144 && objc_msgSend(v150, "count") || (v7 = *((unsigned int *)a4 + 24), !(_DWORD)v7))
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v150, "count"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    objc_msgSend(v150, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v9;
    v146 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
    if (v146)
    {
      v147 = *(_QWORD *)v157;
      location = (id *)&self->_engine;
      while (2)
      {
        for (i = 0; i != v146; ++i)
        {
          if (*(_QWORD *)v157 != v147)
            objc_enumerationMutation(v9);
          v155 = *(Phase **)(*((_QWORD *)&v156 + 1) + 8 * i);
          objc_msgSend(v150, "objectForKeyedSubscript:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = v10;
          v11 = objc_msgSend(v10, "mixerType");
          if (v11 == 1)
          {
            objc_msgSend(v10, "source");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v27
              || (objc_msgSend(v10, "listener"),
                  v28 = (void *)objc_claimAutoreleasedReturnValue(),
                  v29 = v28 == 0,
                  v28,
                  v27,
                  v29))
            {
              v87 = *MEMORY[0x24BDD0FC8];
              v178 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: Sound instance spatial mixer dictionary not complete for mixer %@"), v155);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v179 = v88;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v91 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v90)
                                                                                                  + 432)));
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v87);
                v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v93 = objc_msgSend(v92, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1285;
                v185 = 2080;
                v186 = v93;
                _os_log_impl(&dword_2164CC000, v91, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
              {
LABEL_104:
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925668, v89);
                *v143 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_105:

              v80 = 0;
              v72 = v153;
              goto LABEL_106;
            }
            objc_msgSend(v153, "listener");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "engine");
            v31 = (id)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained(location);
            v33 = v31 == WeakRetained;

            if (!v33)
            {
              v112 = *MEMORY[0x24BDD0FC8];
              v176 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is from a different engine instance"), v155);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v177 = v113;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v115 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v114) + 432));
              if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v112);
                v116 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v117 = objc_msgSend(v116, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1300;
                v185 = 2080;
                v186 = v117;
                _os_log_impl(&dword_2164CC000, v115, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            objc_msgSend(v153, "source");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "engine");
            v35 = (id)objc_claimAutoreleasedReturnValue();
            v36 = objc_loadWeakRetained(location);
            v37 = v35 == v36;

            if (!v37)
            {
              v124 = *MEMORY[0x24BDD0FC8];
              v174 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: PHASESource on mixer %@ is from a different engine instance"), v155);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              v175 = v125;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v127 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v126) + 432));
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v124);
                v128 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v129 = objc_msgSend(v128, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1315;
                v185 = 2080;
                v186 = v129;
                _os_log_impl(&dword_2164CC000, v127, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            objc_msgSend(v153, "source");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "isConnectedToRoot");

            if ((v39 & 1) == 0)
            {
              v130 = *MEMORY[0x24BDD0FC8];
              v172 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: PHASESource on mixer %@ is not connected to the scene"), v155);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              v173 = v131;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v133 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v132) + 432));
              if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v130);
                v134 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v135 = objc_msgSend(v134, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1330;
                v185 = 2080;
                v186 = v135;
                _os_log_impl(&dword_2164CC000, v133, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            objc_msgSend(v153, "listener");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isConnectedToRoot");

            if (!v41)
            {
              v136 = *MEMORY[0x24BDD0FC8];
              v170 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is not connected to the scene"), v155);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              v171 = v137;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v139 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v138) + 432));
              if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v136);
                v140 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v141 = objc_msgSend(v140, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1345;
                v185 = 2080;
                v186 = v141;
                _os_log_impl(&dword_2164CC000, v139, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            if (*((_DWORD *)a4 + 24))
            {
              v43 = 0;
              v44 = 0;
              v45 = 0;
              v46 = 0;
              v47 = 1456;
              do
              {
                v48 = *((_QWORD *)a4 + 13);
                if (*(_QWORD *)(v48 + v47 - 1448) == 1)
                {
                  v49 = *(_QWORD *)(v48 + v47 - 1456);
                  if (v49 == Phase::GetStringHashId(v155, v42))
                  {
                    v50 = (_BYTE *)(v48 + v47);
                    if (*v50)
                    {
                      v51 = objc_loadWeakRetained(location);
                      v52 = objc_msgSend(v51, "implementation");
                      v44 = (*(uint64_t (**)(_QWORD, _BYTE *, _QWORD))(**(_QWORD **)(v52 + 368) + 48))(*(_QWORD *)(v52 + 368), v50, 0);

                    }
                    if (*(v50 - 1008))
                    {
                      v53 = objc_loadWeakRetained(location);
                      v54 = objc_msgSend(v53, "implementation");
                      v46 = (*(uint64_t (**)(_QWORD, _BYTE *, uint64_t))(**(_QWORD **)(v54 + 368) + 48))(*(_QWORD *)(v54 + 368), v50 - 1008, 1);

                    }
                    v55 = v50 - 1424;
                    if (*(v50 - 1424))
                    {
                      v56 = objc_loadWeakRetained(location);
                      v57 = objc_msgSend(v56, "implementation");
                      v45 = (*(uint64_t (**)(_QWORD, _BYTE *))(**(_QWORD **)(v57 + 368) + 56))(*(_QWORD *)(v57 + 368), v55);

                    }
                  }
                }
                ++v43;
                v47 += 5944;
              }
              while (v43 < *((unsigned int *)a4 + 24));
            }
            else
            {
              v46 = 0;
              v45 = 0;
              v44 = 0;
            }
            v62 = [PHASESpatialMixer alloc];
            v63 = objc_alloc_init(MEMORY[0x24BDBCE30]);
            objc_msgSend(v153, "source");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "listener");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[PHASESpatialMixer initWithIdentifier:spatialModelerSends:source:listener:sourceDirectivityModel:listenerDirectivityModel:distanceModel:](v62, "initWithIdentifier:spatialModelerSends:source:listener:sourceDirectivityModel:listenerDirectivityModel:distanceModel:", v155, v63, v64, v65, v44, v46, v45);

            objc_msgSend(v149, "setObject:forKey:", v23, v155);
          }
          else
          {
            if (v11 != 2)
            {
              v94 = *MEMORY[0x24BDD0FC8];
              v162 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: Sound instance invalid spatial mixer type for mixer %@"), v155);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v163 = v95;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v97 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v96)
                                                                                                  + 432)));
              if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v94);
                v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v99 = objc_msgSend(v98, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1469;
                v185 = 2080;
                v186 = v99;
                _os_log_impl(&dword_2164CC000, v97, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            objc_msgSend(v10, "listener");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "engine");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = objc_loadWeakRetained(location);
            v15 = v13 == v14;

            if (!v15)
            {
              v100 = *MEMORY[0x24BDD0FC8];
              v168 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is from a different engine instance"), v155);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v169 = v101;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v103 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v102) + 432));
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v100);
                v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v105 = objc_msgSend(v104, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1401;
                v185 = 2080;
                v186 = v105;
                _os_log_impl(&dword_2164CC000, v103, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            objc_msgSend(v153, "listener");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16 == 0;

            if (v17)
            {
              v106 = *MEMORY[0x24BDD0FC8];
              v166 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: Sound instance ambient mixer dictionary not complete for mixer %@"), v155);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v167 = v107;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v109 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v108) + 432));
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v106);
                v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v111 = objc_msgSend(v110, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1416;
                v185 = 2080;
                v186 = v111;
                _os_log_impl(&dword_2164CC000, v109, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            objc_msgSend(v153, "listener");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isConnectedToRoot");

            if (!v19)
            {
              v118 = *MEMORY[0x24BDD0FC8];
              v164 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: PHASEListener on mixer %@ is not connected to the scene"), v155);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              v165 = v119;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              v121 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v120) + 432));
              if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", v118);
                v122 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v123 = objc_msgSend(v122, "UTF8String");
                *(_DWORD *)buf = 136315650;
                v182 = "PHASESoundEvent.mm";
                v183 = 1024;
                v184 = 1431;
                v185 = 2080;
                v186 = v123;
                _os_log_impl(&dword_2164CC000, v121, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

              }
              if (v143)
                goto LABEL_104;
              goto LABEL_105;
            }
            if (*((_DWORD *)a4 + 24))
            {
              v21 = 0;
              v22 = 0;
              v23 = 0;
              *(_QWORD *)&v152 = 0;
              do
              {
                v24 = *((_QWORD *)a4 + 13);
                if (*(_QWORD *)(v24 + v21 + 8) == 2)
                {
                  v25 = *(_QWORD *)(v24 + v21);
                  if (v25 == Phase::GetStringHashId(v155, v20))
                  {
                    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", *(unsigned int *)(v24 + v21 + 32));

                    v152 = *(_OWORD *)(v24 + v21 + 36);
                    v23 = (PHASESpatialMixer *)v26;
                  }
                }
                ++v22;
                v21 += 5944;
              }
              while (v22 < *((unsigned int *)a4 + 24));
            }
            else
            {
              v23 = 0;
              *(_QWORD *)&v152 = 0;
            }
            v58 = [PHASEAmbientMixer alloc];
            objc_msgSend(v153, "listener");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_loadWeakRetained(location);
            v61 = -[PHASEAmbientMixer initWithIdentifier:listener:inputChannelLayout:orientation:engine:actionTreeObjectId:](v58, "initWithIdentifier:listener:inputChannelLayout:orientation:engine:actionTreeObjectId:", v155, v59, v23, v60, *(_QWORD *)self->_actionTreeObject.__ptr_, *((_QWORD *)self->_actionTreeObject.__ptr_ + 1), *(double *)&v152);

            objc_msgSend(v149, "setObject:forKey:", v61, v155);
          }

          v9 = v148;
        }
        v146 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
        if (v146)
          continue;
        break;
      }
    }

    v66 = objc_loadWeakRetained((id *)&self->_engine);
    objc_msgSend(v66, "assetRegistry");
    v148 = (void *)objc_claimAutoreleasedReturnValue();

    if (v148)
    {
      v67 = *((unsigned int *)a4 + 24);
      if ((_DWORD)v67)
      {
        v68 = 0;
        v69 = 0;
        v70 = 0;
        do
        {
          v71 = *((_QWORD *)a4 + 13);
          if (*(_QWORD *)(v71 + v68 + 8) == 3)
          {
            v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", *(unsigned int *)(v71 + v68 + 32));

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v148, "getStringEmpty:", *(_QWORD *)(v71 + v68)));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = -[PHASEChannelMixer initWithIdentifier:inputChannelLayout:]([PHASEChannelMixer alloc], "initWithIdentifier:inputChannelLayout:", v73, v72);
            objc_msgSend(v149, "setObject:forKey:", v74, v73);

            v67 = *((unsigned int *)a4 + 24);
            v70 = v72;
          }
          else
          {
            v72 = v70;
          }
          ++v69;
          v68 += 5944;
        }
        while (v69 < v67);
      }
      else
      {
        v72 = 0;
      }
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v149);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v81 = *MEMORY[0x24BDD0FC8];
      v160 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHASE Engine initialization error"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = v82;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v84 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v83)
                                                                                          + 432)));
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v72, "objectForKeyedSubscript:", v81);
        v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v86 = objc_msgSend(v85, "UTF8String");
        *(_DWORD *)buf = 136315650;
        v182 = "PHASESoundEvent.mm";
        v183 = 1024;
        v184 = 1484;
        v185 = 2080;
        v186 = v86;
        _os_log_impl(&dword_2164CC000, v84, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

      }
      if (v143)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925669, v72);
        v148 = 0;
        v80 = 0;
        *v143 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v148 = 0;
        v80 = 0;
      }
    }
LABEL_106:

  }
  else
  {
    v8 = (_QWORD *)(*((_QWORD *)a4 + 13) + 8);
    while ((unint64_t)(*v8 - 1) > 1)
    {
      v8 += 743;
      if (!--v7)
        goto LABEL_9;
    }
    v75 = *MEMORY[0x24BDD0FC8];
    v187 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to initialize PHASESoundEvent: Missing required spatial/ambient mixer parameters"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v188[0] = v76;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v188, &v187, 1);
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v77)
                                                                                        + 432)));
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v149, "objectForKeyedSubscript:", v75);
      v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v182 = "PHASESoundEvent.mm";
      v183 = 1024;
      v184 = 1256;
      v185 = 2080;
      v186 = objc_msgSend(v79, "UTF8String");
      _os_log_impl(&dword_2164CC000, v78, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
    if (v143)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346925668, v149);
      v80 = 0;
      *v143 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v80 = 0;
    }
  }

  return v80;
}

- (id)internalGetActionTreePushStreamNodes:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  ActionTreeObject *ptr;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PHASEPushStreamNode *v20;
  uint64_t v21;
  id v22;
  PHASESoundEvent *v23;
  ActionTreeObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  PHASEPushStreamNode *v29;
  void *v30;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id *location;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  location = (id *)&self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "assetRegistry");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  ptr = self->_actionTreeObject.__ptr_;
  v8 = *((_QWORD *)ptr + 3);
  if (*(_DWORD *)(v8 + 40))
  {
    v9 = 0;
    v33 = v4;
    v34 = v5;
    do
    {
      v10 = *(unsigned int *)(*(_QWORD *)(v8 + 56) + 4 * v9);
      if (*(_DWORD *)(*(_QWORD *)(v8 + 88) + v10) == 9)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v37, "getString:", v11));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10 + *(_QWORD *)(*((_QWORD *)self->_actionTreeObject.__ptr_ + 3) + 88);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v37, "getString:", *(_QWORD *)(v12 + 16)));
        v39 = objc_claimAutoreleasedReturnValue();
        -[PHASESoundEvent mixers](self, "mixers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v39);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_loadWeakRetained(location);
        objc_msgSend(v14, "assetRegistry");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "assetIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "assetForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v18 = (void *)v39;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "streamNodeFormats");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v40);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = [PHASEPushStreamNode alloc];
          v21 = v12 + 8;
          v22 = objc_loadWeakRetained(location);
          v23 = self;
          v24 = self->_actionTreeObject.__ptr_;
          v26 = *(_QWORD *)v24;
          v25 = *((_QWORD *)v24 + 1);
          v27 = *(unsigned __int8 *)(v21 + 56);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(v21 + 64));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v32) = v27 != 0;
          v29 = -[PHASEStreamNode initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:](v20, "initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:", v22, v26, v25, v11, v38, v35, v32, v28);

          v5 = v34;
          objc_msgSend(v34, "setObject:forKey:", v29, v40);
          self = v23;

          v4 = v33;
          v18 = (void *)v39;
        }

        ptr = self->_actionTreeObject.__ptr_;
      }
      ++v9;
      v8 = *((_QWORD *)ptr + 3);
    }
    while (v9 < *(unsigned int *)(v8 + 40));
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)internalGetActionTreePullStreamNodes:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  ActionTreeObject *ptr;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PHASEPullStreamNode *v20;
  uint64_t v21;
  id v22;
  PHASESoundEvent *v23;
  ActionTreeObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  PHASEPullStreamNode *v29;
  void *v30;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id *location;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  location = (id *)&self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(WeakRetained, "assetRegistry");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  ptr = self->_actionTreeObject.__ptr_;
  v8 = *((_QWORD *)ptr + 3);
  if (*(_DWORD *)(v8 + 40))
  {
    v9 = 0;
    v33 = v4;
    v34 = v5;
    do
    {
      v10 = *(unsigned int *)(*(_QWORD *)(v8 + 56) + 4 * v9);
      if (*(_DWORD *)(*(_QWORD *)(v8 + 88) + v10) == 12)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v37, "getString:", v11));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10 + *(_QWORD *)(*((_QWORD *)self->_actionTreeObject.__ptr_ + 3) + 88);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v37, "getString:", *(_QWORD *)(v12 + 16)));
        v39 = objc_claimAutoreleasedReturnValue();
        -[PHASESoundEvent mixers](self, "mixers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v39);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_loadWeakRetained(location);
        objc_msgSend(v14, "assetRegistry");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "assetIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "assetForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v18 = (void *)v39;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "streamNodeFormats");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v40);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = [PHASEPullStreamNode alloc];
          v21 = v12 + 8;
          v22 = objc_loadWeakRetained(location);
          v23 = self;
          v24 = self->_actionTreeObject.__ptr_;
          v26 = *(_QWORD *)v24;
          v25 = *((_QWORD *)v24 + 1);
          v27 = *(unsigned __int8 *)(v21 + 56);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(v21 + 64));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v32) = v27 != 0;
          v29 = -[PHASEStreamNode initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:](v20, "initWithEngine:actionTreeUniqueId:nodeStringHashId:mixer:format:normalize:targetLKFS:", v22, v26, v25, v11, v38, v35, v32, v28);

          v5 = v34;
          objc_msgSend(v34, "setObject:forKey:", v29, v40);
          self = v23;

          v4 = v33;
          v18 = (void *)v39;
        }

        ptr = self->_actionTreeObject.__ptr_;
      }
      ++v9;
      v8 = *((_QWORD *)ptr + 3);
    }
    while (v9 < *(unsigned int *)(v8 + 40));
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)seekToTime:(double)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__PHASESoundEvent_seekToTime_completionHandler___block_invoke;
  v9[3] = &unk_24D57F9A8;
  v10 = v6;
  v7 = v6;
  -[PHASESoundEvent seekToTime:completion:](self, "seekToTime:completion:", v9, a3);

  return 1;
}

uint64_t __48__PHASESoundEvent_seekToTime_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)seekToTime:(double)a3 completionBlock:(id)a4
{
  -[PHASESoundEvent seekToTime:completion:](self, "seekToTime:completion:", a4, a3);
  return 1;
}

- (void)seekToTime:(double)time completion:(void *)handler
{
  Phase::Logger *v7;
  NSObject *v8;
  _BOOL8 v9;
  id WeakRetained;
  _BOOL4 v11;
  Phase::Logger *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  uint64_t v19;
  ActionTreeObject *ptr;
  uint64_t v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _DWORD *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  std::logic_error *exception;
  Phase::Logger *InstancePtr;
  NSObject *v36;
  std::runtime_error *v37;
  BOOL v38;
  unint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = handler;
  v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7) + 432));
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    *(_DWORD *)buf = 136315906;
    v41 = "PHASESoundEvent.mm";
    v42 = 1024;
    v43 = 1627;
    v44 = 2112;
    v45 = (unint64_t)self;
    v46 = 2048;
    v47 = *(_QWORD *)&time;
    _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ seekToTime %f", buf, 0x26u);
  }
  if (!*((_BYTE *)self->_actionTreeObject.__ptr_ + 144))
  {
    if (!v7)
      goto LABEL_21;
    v31 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v9) + 432));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "PHASESoundEvent.mm";
      v42 = 1024;
      v43 = 1633;
      v44 = 2112;
      v45 = (unint64_t)self;
      v32 = "%25s:%-5d seekToTime: %@ Invalid sound event instance";
LABEL_19:
      _os_log_impl(&dword_2164CC000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x1Cu);
    }
LABEL_20:
    (*((void (**)(Phase::Logger *, _QWORD))v7 + 2))(v7, 0);
    goto LABEL_21;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = WeakRetained == 0;

  if (v11)
  {
    if (!v7)
      goto LABEL_21;
    v31 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v12) + 432));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "PHASESoundEvent.mm";
      v42 = 1024;
      v43 = 1643;
      v44 = 2112;
      v45 = (unint64_t)self;
      v32 = "%25s:%-5d seekToTime: %@ PHASE not initialized";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (!self->_prepareState)
    -[PHASESoundEvent prepareWithCompletion:](self, "prepareWithCompletion:", 0);
  v13 = (void *)-[Phase::Logger copy](v7, "copy");
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = PHASEGetPropertyBounded<double>(v15, v16, time, 0.0, 1.79769313e308);

  v18 = objc_loadWeakRetained((id *)&self->_engine);
  v19 = Phase::Controller::TaskManager::GetService<Phase::ActionTreeManager>((Phase::Logger *)(objc_msgSend(v18, "implementation") + 48), 7);

  ptr = self->_actionTreeObject.__ptr_;
  v21 = *(_QWORD *)ptr;
  v22 = *((_QWORD *)ptr + 1);
  v23 = objc_loadWeakRetained((id *)&self->_engine);
  objc_msgSend(v23, "unitsPerSecond");
  v25 = v24;
  v26 = _Block_copy(v13);
  if (*(int *)(v19 + 16) <= 0)
  {
    v33 = objc_retainAutorelease(**(id **)(v19 + 24));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "Commandable.hpp";
      v42 = 1024;
      v43 = 132;
      _os_log_impl(&dword_2164CC000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.", buf, 0x12u);
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "PRECONDITION: pQueueId >= 0 && pQueueId < mQueueCount is false.");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B0] + 16);
  }
  v27 = v26;
  v28 = **(_QWORD **)(v19 + 8);
  v39 = 0;
  v38 = 1;
  v29 = Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v28, 72, &v39, &v38);
  if (!v29)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v36 = objc_retainAutorelease(**(id **)(v28 + 48));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "CommandQueue.hpp";
      v42 = 1024;
      v43 = 100;
      _os_log_impl(&dword_2164CC000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\",
        buf,
        0x12u);
    }
    v37 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v37, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v38)
  {
    v30 = objc_retainAutorelease(**(id **)(v28 + 48));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v41 = "CommandQueue.hpp";
      v42 = 1024;
      v43 = 89;
      v44 = 2048;
      v45 = v39;
      v46 = 2048;
      v47 = 72;
      _os_log_impl(&dword_2164CC000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *(_QWORD *)v29 = &off_24D57FB90;
  *((_QWORD *)v29 + 1) = v19;
  *((_QWORD *)v29 + 2) = Phase::ActionTreeManager::SeekActionTree;
  *((_QWORD *)v29 + 3) = 0;
  *((_QWORD *)v29 + 4) = v21;
  *((_QWORD *)v29 + 5) = v22;
  *((double *)v29 + 6) = v17 * v25;
  *((_QWORD *)v29 + 7) = -[PHASESoundEvent seekToTime:completion:]::$_5::__invoke;
  *((_QWORD *)v29 + 8) = v27;
  Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v28, 72);
  atomic_store(0, (unsigned __int8 *)(v28 + 40));

LABEL_21:
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<PHASESoundEvent: %p, uniqueID=%llu>"), self, *(_QWORD *)self->_actionTreeObject.__ptr_);
}

- (id)engine
{
  return objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setPrepareState:(int64_t)a3
{
  Phase::Logger *InstancePtr;
  NSObject *v6;
  unint64_t prepareState;
  const char *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr((Phase::Logger *)self);
  if (*((_BYTE *)InstancePtr + 1552))
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(InstancePtr) + 432));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      prepareState = self->_prepareState;
      if (prepareState > 2)
        v8 = "<not found>";
      else
        v8 = off_24D57FBA8[prepareState];
      v9 = *(_QWORD *)self->_actionTreeObject.__ptr_;
      if ((unint64_t)a3 > 2)
        v10 = "<not found>";
      else
        v10 = off_24D57FBA8[a3];
      v11 = 136316162;
      v12 = "PHASESoundEvent.mm";
      v13 = 1024;
      v14 = 1696;
      v15 = 2048;
      v16 = v9;
      v17 = 2080;
      v18 = v8;
      v19 = 2080;
      v20 = v10;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (sound event: %llu) - prepare state changed from '%s' to '%s'", (uint8_t *)&v11, 0x30u);
    }
  }
  self->_prepareState = a3;
}

- (void)setRenderingState:(int64_t)a3
{
  PHASESoundEvent *v4;
  Phase::Logger *v5;
  Phase::Logger *InstancePtr;
  NSObject *v7;
  unint64_t renderingState;
  const char *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  v5 = (Phase::Logger *)objc_sync_enter(v4);
  InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(v5);
  if (*((_BYTE *)InstancePtr + 1552))
  {
    if (v4->_renderingState != a3)
    {
      v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(InstancePtr) + 432));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        renderingState = v4->_renderingState;
        if (renderingState > 2)
          v9 = "<not found>";
        else
          v9 = off_24D57FBC0[renderingState];
        v10 = *(_QWORD *)v4->_actionTreeObject.__ptr_;
        if ((unint64_t)a3 > 2)
          v11 = "<not found>";
        else
          v11 = off_24D57FBC0[a3];
        v12 = 136316162;
        v13 = "PHASESoundEvent.mm";
        v14 = 1024;
        v15 = 1711;
        v16 = 2048;
        v17 = v10;
        v18 = 2080;
        v19 = v9;
        v20 = 2080;
        v21 = v11;
        _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d (sound event: %llu) - rendering state changed from '%s' to '%s'", (uint8_t *)&v12, 0x30u);
      }
    }
  }
  v4->_renderingState = a3;
  objc_sync_exit(v4);

}

- (void)getActionTreeObject
{
  return self->_actionTreeObject.__ptr_;
}

- (unint64_t)preparedHostTime
{
  return self->_preparedHostTime;
}

- (unint64_t)ioStartHostTime
{
  return self->_ioStartHostTime;
}

- (NSDictionary)metaParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSDictionary)mixers
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (NSDictionary)pushStreamNodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (NSDictionary)pullStreamNodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)isIndefinite
{
  return self->_isIndefinite;
}

- (void).cxx_destruct
{
  UniqueObjectId *begin;

  objc_storeStrong((id *)&self->_pullStreamNodes, 0);
  objc_storeStrong((id *)&self->_pushStreamNodes, 0);
  objc_storeStrong((id *)&self->_mixers, 0);
  objc_storeStrong((id *)&self->_metaParameters, 0);

  objc_storeStrong((id *)&self->_audioSession, 0);
  begin = self->_submixIds.__begin_;
  if (begin)
  {
    self->_submixIds.__end_ = begin;
    operator delete(begin);
  }
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&self->_actionTreeObject);
  objc_storeStrong((id *)&self->_protoType, 0);
  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (void)internalPrepareActionTreeWithCompletionBlock:(uint64_t)a3
{
  if (a6)
  {
    a6[2](a6, a3, a4, a5);

  }
}

- (void)internalStartActionTreeWithCompletionBlock:(uint64_t)a3
{
  if (a5)
  {
    a5[2](a5, a3, a4);

  }
}

- (void)seekToTime:(uint64_t)a3 completion:(void *)(a4
{
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  Phase::Logger *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    a4[2](a4, a3);

  }
  v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(a1) + 432));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315906;
    v9 = "PHASESoundEvent.mm";
    v10 = 1024;
    v11 = 1663;
    v12 = 2048;
    v13 = a1;
    v14 = 2048;
    v15 = a3;
    _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d PHASESoundEvent %llu seekToTime completed with result %ld", (uint8_t *)&v8, 0x26u);
  }
}

- (uint64_t)pause
{
  return Phase::ActionTreeManager::PauseActionTree(a1[1], a1[2], a1[3]);
}

- (uint64_t)resume
{
  return Phase::ActionTreeManager::UnPauseActionTree(a1[1], a1[2], a1[3]);
}

- (uint64_t)stopAndInvalidate
{
  return Phase::ActionTreeManager::StopActionTree(a1[1], a1[2], a1[3], PHASESoundEventPrepareHandlerReasonPrepared, PHASESoundEventStartHandlerReasonFinishedPlaying);
}

@end
