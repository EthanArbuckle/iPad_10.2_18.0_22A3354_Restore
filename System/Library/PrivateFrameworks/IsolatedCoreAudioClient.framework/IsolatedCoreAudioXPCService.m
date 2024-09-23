@implementation IsolatedCoreAudioXPCService

- (IsolatedCoreAudioXPCService)init
{
  NSObject *v3;
  IsolatedCoreAudioXPCService *v4;
  char *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  uint64_t (**v11)();
  _BYTE *v12;
  uint64_t v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v22;
  std::__shared_weak_count *v23;
  char *v24;
  std::__shared_weak_count *v25;
  objc_super v26;
  _BYTE buf[12];
  __int16 v28;
  int v29;
  _BYTE *shared_weak_owners;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    v28 = 1024;
    v29 = 16;
    _os_log_impl(&dword_240186000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - Normal INIT", buf, 0x12u);
  }

  v26.receiver = self;
  v26.super_class = (Class)IsolatedCoreAudioXPCService;
  v4 = -[IsolatedCoreAudioXPCService init](&v26, sel_init);
  if (v4)
  {
    v5 = (char *)operator new(0x50uLL);
    *((_QWORD *)v5 + 1) = 0;
    *((_QWORD *)v5 + 2) = 0;
    *(_QWORD *)v5 = &off_251076CD8;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *((_QWORD *)v5 + 7) = 0;
    *((_QWORD *)v5 + 8) = 0;
    *((_DWORD *)v5 + 14) = 1065353216;
    *((_QWORD *)v5 + 9) = 0;
    v24 = v5 + 24;
    v25 = (std::__shared_weak_count *)v5;
    -[IsolatedCoreAudioXPCService setMServerSideSwitchboard:](v4, "setMServerSideSwitchboard:", &v24);
    v6 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    -[IsolatedCoreAudioXPCService mServerSideSwitchboard](v4, "mServerSideSwitchboard");
    v9 = (std::__shared_weak_count *)operator new(0xA8uLL);
    v9->__shared_owners_ = 0;
    v10 = (unint64_t *)&v9->__shared_owners_;
    v9->__shared_weak_owners_ = 0;
    v9->__vftable = (std::__shared_weak_count_vtbl *)&off_251076BC0;
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251076230;
    *(_OWORD *)&v9[1].__shared_owners_ = 0u;
    v9[2].std::__shared_count = 0u;
    LODWORD(v9[2].__shared_weak_owners_) = 1065353216;
    v9[3].__vftable = (std::__shared_weak_count_vtbl *)850045863;
    *(_OWORD *)&v9[3].__shared_owners_ = 0u;
    v9[4].std::__shared_count = 0u;
    *(_OWORD *)&v9[4].__shared_weak_owners_ = 0u;
    v9[5].__shared_owners_ = 0;
    v9[6].__shared_weak_owners_ = 0;
    v11 = &off_2510759D0;
    *(_QWORD *)buf = &off_2510759D0;
    shared_weak_owners = buf;
    std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()>::__clone((uint64_t)buf, &v9[5].__shared_weak_owners_);
    shared_weak_owners = (_BYTE *)v9[6].__shared_weak_owners_;
    v12 = shared_weak_owners;
    v9[6].__shared_weak_owners_ = (uint64_t)&v9[5].__shared_weak_owners_;
    if (v12 == buf)
    {
      v13 = 4;
      v12 = buf;
    }
    else
    {
      if (!v12)
      {
        do
LABEL_14:
          v14 = __ldxr(v10);
        while (__stxr(v14 + 1, v10));
        v15 = *(std::__shared_weak_count **)(v22 + 48);
        *(_QWORD *)(v22 + 40) = v9 + 1;
        *(_QWORD *)(v22 + 48) = v9;
        if (v15)
        {
          v16 = (unint64_t *)&v15->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
            std::__shared_weak_count::__release_weak(v15);
          }
        }
        do
          v18 = __ldaxr(v10);
        while (__stlxr(v18 - 1, v10));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
        if (v23)
        {
          v19 = (unint64_t *)&v23->__shared_owners_;
          do
            v20 = __ldaxr(v19);
          while (__stlxr(v20 - 1, v19));
          if (!v20)
          {
            ((void (*)())v23->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v23);
          }
        }
        return v4;
      }
      v11 = *(uint64_t (***)())v12;
      v13 = 5;
    }
    ((void (*)(_BYTE *))v11[v13])(v12);
    goto LABEL_14;
  }
  return v4;
}

- (void)checkInForIsolatedAudioSharedResources:(unsigned int)a3 with:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unsigned int **v11;
  std::__shared_weak_count_vtbl *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  std::__shared_weak_count_vtbl *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int *v35;
  std::__shared_weak_count *shared_owners;
  unint64_t *v37;
  unint64_t v38;
  uint64_t *v39;
  unint64_t *v40;
  unint64_t v41;
  NSObject *v42;
  unsigned int *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unsigned int v47;
  unint64_t *v48;
  unint64_t v49;
  unsigned int *v50;
  unsigned int *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint8x8_t v56;
  void **v57;
  void *i;
  unint64_t v59;
  float v60;
  float v61;
  _BOOL8 v62;
  unint64_t v63;
  unint64_t v64;
  size_t v65;
  _QWORD *v66;
  unint64_t v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  uint64_t *v78;
  unint64_t v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  unint64_t *v83;
  unint64_t v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  unsigned int ***v94;
  uint64_t v95;
  unint64_t *v96;
  unint64_t v97;
  _QWORD *v98;
  char *v99;
  unint64_t *v100;
  _QWORD *v101;
  uint64_t v102;
  std::__shared_weak_count *v103;
  unint64_t *v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  std::__shared_weak_count *v108;
  unint64_t *v109;
  unint64_t v110;
  std::__shared_weak_count *v111;
  uint64_t *v112;
  unint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  unint64_t *v116;
  uint64_t v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  std::__shared_weak_count *v121;
  unint64_t *v122;
  unint64_t v123;
  NSObject *v124;
  std::__shared_weak_count *v125;
  uint64_t v126;
  unint64_t *v127;
  unint64_t v128;
  std::__shared_weak_count *v129;
  unint64_t *v130;
  unint64_t v131;
  NSObject *v132;
  void *v133;
  NSObject *v134;
  void *v135;
  NSObject *v136;
  NSObject *v137;
  IsolatedCoreAudioXPCService *v138;
  void (**v139)(_QWORD, _QWORD, _QWORD);
  unsigned int **v140;
  IsolatedCoreAudioXPCService *v141;
  void (**v142)(_QWORD, _QWORD, _QWORD);
  uint64_t v143;
  std::__shared_weak_count *v144;
  std::__shared_weak_count *v145;
  unsigned int **v146;
  std::__shared_weak_count *v147;
  unint64_t v148;
  std::__shared_weak_count *v149;
  _BYTE v150[18];
  _BYTE v151[18];
  __int16 v152;
  unsigned int v153;
  unint64_t v154;
  __int128 v155;
  unint64_t *v156;
  _BYTE buf[24];
  _BYTE *v158;
  _QWORD v159[5];

  v4 = *(_QWORD *)&a3;
  v159[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  sIsolatedCoreAudioLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 30;
    _os_log_impl(&dword_240186000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkInForIsolatedAudioSharedResources", buf, 0x12u);
  }

  v142 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](self, "mServerSideSwitchboard");
  (*(void (**)(unint64_t *__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(v143 + 40) + 16))(&v148, *(_QWORD *)(v143 + 40), v4);
  v141 = self;
  v8 = (std::__shared_weak_count *)operator new(0x58uLL);
  v9 = v8;
  v8->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__shared_weak_owners_ = 0;
  v8->__vftable = (std::__shared_weak_count_vtbl *)&off_251076C30;
  v11 = (unsigned int **)&v8[1];
  v12 = (std::__shared_weak_count_vtbl *)v148;
  v13 = v149;
  *(_QWORD *)buf = v148;
  *(_QWORD *)&buf[8] = v149;
  if (v149)
  {
    v14 = (unint64_t *)&v149->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
    v8[1].__vftable = v12;
    v8[1].__shared_owners_ = (uint64_t)v13;
    do
      v16 = __ldxr(v14);
    while (__stxr(v16 + 1, v14));
  }
  else
  {
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v148;
    v8[1].__shared_owners_ = 0;
  }
  v17 = (std::__shared_weak_count_vtbl *)operator new(0x60uLL);
  v17->~__shared_weak_count_0 = 0;
  v17->__on_zero_shared = 0;
  v17->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&off_251076C68;
  ServerIOThreadResources::ServerIOThreadResources((ServerIOThreadResources *)&v17->__get_deleter);
  v9[2].__shared_owners_ = (uint64_t)&off_251076518;
  v9[1].__shared_weak_owners_ = v18;
  v9[2].__vftable = v17;
  v9[3].__shared_owners_ = (uint64_t)&v9[2].__shared_owners_;
  if (v13)
  {
    v19 = (unint64_t *)&v13->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v140 = v11;
  v146 = v11;
  v147 = v9;
  v22 = v148;
  v21 = v149;
  v154 = v148;
  *(_QWORD *)&v155 = v149;
  if (v149)
  {
    v23 = (unint64_t *)&v149->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  v25 = *(_QWORD *)(v143 + 40);
  v26 = *(unint64_t **)(v143 + 48);
  *((_QWORD *)&v155 + 1) = v25;
  v156 = v26;
  if (v26)
  {
    v27 = v26 + 1;
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  v29 = (unint64_t)&v155 + 8;
  v158 = 0;
  v30 = operator new(0x28uLL);
  *v30 = &off_251076990;
  v30[1] = v22;
  v154 = 0;
  *(_QWORD *)&v155 = 0;
  v30[2] = v21;
  v30[3] = v25;
  v30[4] = v26;
  *((_QWORD *)&v155 + 1) = 0;
  v156 = 0;
  v158 = v30;
  std::function<void ()(void)>::operator=(&v9[2].__shared_owners_, (uint64_t)buf);
  v31 = v158;
  v32 = v4;
  if (v158 == buf)
  {
    v33 = 4;
    v31 = buf;
    goto LABEL_25;
  }
  if (v158)
  {
    v33 = 5;
LABEL_25:
    (*(void (**)(void))(*v31 + 8 * v33))();
  }
  v145 = v9;
  do
    v34 = __ldxr(p_shared_owners);
  while (__stxr(v34 + 1, p_shared_owners));
  v35 = (unsigned int *)v9[1].__vftable;
  shared_owners = (std::__shared_weak_count *)v9[1].__shared_owners_;
  if (shared_owners)
  {
    v37 = (unint64_t *)&shared_owners->__shared_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
    v39 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((_QWORD *)v143, *v35);
    v40 = (unint64_t *)&shared_owners->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))shared_owners->__on_zero_shared)(shared_owners);
      std::__shared_weak_count::__release_weak(shared_owners);
    }
  }
  else
  {
    v39 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>((_QWORD *)v143, *v35);
  }
  if (v39)
  {
    v42 = sIsolatedCoreAudioLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = *v140;
      v44 = (std::__shared_weak_count *)v140[1];
      if (v44)
      {
        v45 = (unint64_t *)&v44->__shared_owners_;
        do
          v46 = __ldxr(v45);
        while (__stxr(v46 + 1, v45));
      }
      v47 = *v43;
      *(_DWORD *)v151 = 136315650;
      *(_QWORD *)&v151[4] = "ServerSideAudioSwitchboard.cpp";
      *(_WORD *)&v151[12] = 1024;
      *(_DWORD *)&v151[14] = 92;
      v152 = 1024;
      v153 = v47;
      _os_log_impl(&dword_240186000, v42, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideAudioSwitchboard::addClient - Client %u already present in map!", v151, 0x18u);
      if (v44)
      {
        v48 = (unint64_t *)&v44->__shared_owners_;
        do
          v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
          std::__shared_weak_count::__release_weak(v44);
        }
      }
    }
  }
  v50 = *v140;
  v51 = v140[1];
  *(_QWORD *)v150 = *v140;
  *(_QWORD *)&v150[8] = v51;
  if (v51)
  {
    v52 = (unint64_t *)(v51 + 2);
    do
      v53 = __ldxr(v52);
    while (__stxr(v53 + 1, v52));
  }
  v54 = *v50;
  v55 = *(_QWORD *)(v143 + 8);
  if (v55)
  {
    v56 = (uint8x8_t)vcnt_s8((int8x8_t)v55);
    v56.i16[0] = vaddlv_u8(v56);
    if (v56.u32[0] > 1uLL)
    {
      v29 = *v50;
      if (v55 <= v54)
        v29 = v54 % v55;
    }
    else
    {
      v29 = ((_DWORD)v55 - 1) & v54;
    }
    v57 = *(void ***)(*(_QWORD *)v143 + 8 * v29);
    if (v57)
    {
      for (i = *v57; i; i = *(void **)i)
      {
        v59 = *((_QWORD *)i + 1);
        if (v59 == v54)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v54)
          {
            v138 = v141;
            v139 = v142;
            goto LABEL_88;
          }
        }
        else
        {
          if (v56.u32[0] > 1uLL)
          {
            if (v59 >= v55)
              v59 %= v55;
          }
          else
          {
            v59 &= v55 - 1;
          }
          if (v59 != v29)
            break;
        }
      }
    }
  }
  i = operator new(0x28uLL);
  *(_QWORD *)v151 = i;
  *(_QWORD *)&v151[8] = v143 + 16;
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v54;
  *((_DWORD *)i + 4) = v54;
  *((_QWORD *)i + 3) = 0;
  *((_QWORD *)i + 4) = 0;
  v151[16] = 1;
  v60 = (float)(unint64_t)(*(_QWORD *)(v143 + 24) + 1);
  v61 = *(float *)(v143 + 32);
  if (!v55 || (float)(v61 * (float)v55) < v60)
  {
    v62 = 1;
    if (v55 >= 3)
      v62 = (v55 & (v55 - 1)) != 0;
    v63 = v62 | (2 * v55);
    v64 = vcvtps_u32_f32(v60 / v61);
    if (v63 <= v64)
      v65 = v64;
    else
      v65 = v63;
    std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<ServerSideUniqueClient>>>>::__rehash<true>(v143, v65);
    v55 = *(_QWORD *)(v143 + 8);
    if ((v55 & (v55 - 1)) != 0)
    {
      if (v55 <= v54)
        v29 = v54 % v55;
      else
        v29 = v54;
    }
    else
    {
      v29 = ((_DWORD)v55 - 1) & v54;
    }
  }
  v66 = *(_QWORD **)(*(_QWORD *)v143 + 8 * v29);
  if (v66)
  {
    *(_QWORD *)i = *v66;
    v138 = v141;
    v139 = v142;
LABEL_86:
    *v66 = i;
    goto LABEL_87;
  }
  *(_QWORD *)i = *(_QWORD *)(v143 + 16);
  *(_QWORD *)(v143 + 16) = i;
  *(_QWORD *)(*(_QWORD *)v143 + 8 * v29) = v143 + 16;
  v138 = v141;
  v139 = v142;
  if (*(_QWORD *)i)
  {
    v67 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v55 & (v55 - 1)) != 0)
    {
      if (v67 >= v55)
        v67 %= v55;
    }
    else
    {
      v67 &= v55 - 1;
    }
    v66 = (_QWORD *)(*(_QWORD *)v143 + 8 * v67);
    goto LABEL_86;
  }
LABEL_87:
  *(_QWORD *)v151 = 0;
  ++*(_QWORD *)(v143 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,void *>>>>::reset[abi:ne180100]((uint64_t)v151);
LABEL_88:
  if (v145)
  {
    v68 = (unint64_t *)&v145->__shared_owners_;
    do
      v69 = __ldxr(v68);
    while (__stxr(v69 + 1, v68));
  }
  v70 = (std::__shared_weak_count *)*((_QWORD *)i + 4);
  *((_QWORD *)i + 3) = v140;
  *((_QWORD *)i + 4) = v145;
  if (v70)
  {
    v71 = (unint64_t *)&v70->__shared_owners_;
    do
      v72 = __ldaxr(v71);
    while (__stlxr(v72 - 1, v71));
    if (!v72)
    {
      ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
      std::__shared_weak_count::__release_weak(v70);
    }
  }
  v73 = *(std::__shared_weak_count **)&v150[8];
  if (*(_QWORD *)&v150[8])
  {
    v74 = (unint64_t *)(*(_QWORD *)&v150[8] + 8);
    do
      v75 = __ldaxr(v74);
    while (__stlxr(v75 - 1, v74));
    if (!v75)
    {
      ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
      std::__shared_weak_count::__release_weak(v73);
    }
  }
  if (v145)
  {
    v76 = (unint64_t *)&v145->__shared_owners_;
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v145->__on_zero_shared)(v145);
      std::__shared_weak_count::__release_weak(v145);
    }
  }
  if (v147)
  {
    v78 = &v147->__shared_owners_;
    do
      v79 = __ldaxr((unint64_t *)v78);
    while (__stlxr(v79 - 1, (unint64_t *)v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v147->__on_zero_shared)(v147);
      std::__shared_weak_count::__release_weak(v147);
    }
  }
  v80 = v149;
  if (v149)
  {
    v81 = (unint64_t *)&v149->__shared_owners_;
    do
      v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }
  if (v144)
  {
    v83 = (unint64_t *)&v144->__shared_owners_;
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      ((void (*)())v144->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v144);
    }
  }
  sIsolatedCoreAudioLog();
  v85 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 37;
    _os_log_impl(&dword_240186000, v85, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkInForIsolatedAudioSharedResources - after adding client", buf, 0x12u);
  }

  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](v138, "mServerSideSwitchboard");
  v86 = *(_QWORD *)v150;
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v150, v32);
  if (!buf[16])
    std::__throw_bad_optional_access[abi:ne180100]();
  *(_OWORD *)v151 = *(_OWORD *)buf;
  v87 = *(_QWORD *)(v86 + 40);
  v88 = *(std::__shared_weak_count **)(*(_QWORD *)buf + 8);
  v148 = **(_QWORD **)buf;
  v149 = v88;
  if (v88)
  {
    v89 = (unint64_t *)&v88->__shared_owners_;
    do
      v90 = __ldxr(v89);
    while (__stxr(v90 + 1, v89));
  }
  (*(void (**)(uint64_t, unint64_t *))(*(_QWORD *)v87 + 24))(v87, &v148);
  v91 = v149;
  if (v149)
  {
    v92 = (unint64_t *)&v149->__shared_owners_;
    do
      v93 = __ldaxr(v92);
    while (__stlxr(v93 - 1, v92));
    if (!v93)
    {
      ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
      std::__shared_weak_count::__release_weak(v91);
    }
  }
  v94 = *(unsigned int ****)v151;
  v95 = *(_QWORD *)(*(_QWORD *)v151 + 24);
  *(_QWORD *)buf = *(_QWORD *)(*(_QWORD *)v151 + 16);
  *(_QWORD *)&buf[8] = v95;
  if (v95)
  {
    v96 = (unint64_t *)(v95 + 8);
    do
      v97 = __ldxr(v96);
    while (__stxr(v97 + 1, v96));
  }
  v98 = &buf[16];
  std::__function::__value_func<void ()(CoreAudioTimestamp)>::__value_func[abi:ne180100]((uint64_t)&buf[16], (uint64_t)(v94 + 4));
  v156 = 0;
  v99 = (char *)operator new(0x38uLL);
  v100 = (unint64_t *)v99;
  *(_QWORD *)v99 = &off_251076728;
  *(_OWORD *)(v99 + 8) = *(_OWORD *)buf;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  if (!v159[0])
  {
    v101 = v99 + 48;
    goto LABEL_139;
  }
  if ((_BYTE *)v159[0] != &buf[16])
  {
    v101 = v159;
    *((_QWORD *)v99 + 6) = v159[0];
LABEL_139:
    *v101 = 0;
    goto LABEL_141;
  }
  *((_QWORD *)v99 + 6) = v99 + 24;
  (*(void (**)(_BYTE *))(*(_QWORD *)&buf[16] + 24))(&buf[16]);
LABEL_141:
  v156 = v100;
  if ((_BYTE *)v159[0] == &buf[16])
  {
    v102 = 4;
    goto LABEL_145;
  }
  if (v159[0])
  {
    v102 = 5;
    v98 = (_QWORD *)v159[0];
LABEL_145:
    (*(void (**)(_QWORD *))(*v98 + 8 * v102))(v98);
  }
  v103 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v104 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v105 = __ldaxr(v104);
    while (__stlxr(v105 - 1, v104));
    if (!v105)
    {
      ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
      std::__shared_weak_count::__release_weak(v103);
    }
  }
  v106 = *(_QWORD *)(v86 + 40);
  v107 = (uint64_t)v156;
  if (!v156)
    goto LABEL_154;
  if (v156 != &v154)
  {
    v107 = (*(uint64_t (**)(void))(*v156 + 16))();
LABEL_154:
    v158 = (_BYTE *)v107;
    goto LABEL_156;
  }
  v158 = buf;
  (*(void (**)(unint64_t *, _BYTE *))(v154 + 24))(&v154, buf);
LABEL_156:
  v108 = (std::__shared_weak_count *)v94[1];
  v146 = *v94;
  v147 = v108;
  if (v108)
  {
    v109 = (unint64_t *)&v108->__shared_owners_;
    do
      v110 = __ldxr(v109);
    while (__stxr(v110 + 1, v109));
  }
  (*(void (**)(uint64_t, _BYTE *, unsigned int ***))(*(_QWORD *)v106 + 32))(v106, buf, &v146);
  v111 = v147;
  if (v147)
  {
    v112 = &v147->__shared_owners_;
    do
      v113 = __ldaxr((unint64_t *)v112);
    while (__stlxr(v113 - 1, (unint64_t *)v112));
    if (!v113)
    {
      ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
      std::__shared_weak_count::__release_weak(v111);
    }
  }
  v114 = v158;
  if (v158 == buf)
  {
    v115 = 4;
    v114 = buf;
  }
  else
  {
    if (!v158)
      goto LABEL_169;
    v115 = 5;
  }
  (*(void (**)(void))(*v114 + 8 * v115))();
LABEL_169:
  v116 = v156;
  if (v156 == &v154)
  {
    v117 = 4;
    v116 = &v154;
    goto LABEL_173;
  }
  if (v156)
  {
    v117 = 5;
LABEL_173:
    (*(void (**)(void))(*v116 + 8 * v117))();
  }
  v118 = *(std::__shared_weak_count **)&v151[8];
  if (*(_QWORD *)&v151[8])
  {
    v119 = (unint64_t *)(*(_QWORD *)&v151[8] + 8);
    do
      v120 = __ldaxr(v119);
    while (__stlxr(v120 - 1, v119));
    if (!v120)
    {
      ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
      std::__shared_weak_count::__release_weak(v118);
    }
  }
  v121 = *(std::__shared_weak_count **)&v150[8];
  if (*(_QWORD *)&v150[8])
  {
    v122 = (unint64_t *)(*(_QWORD *)&v150[8] + 8);
    do
      v123 = __ldaxr(v122);
    while (__stlxr(v123 - 1, v122));
    if (!v123)
    {
      ((void (*)(std::__shared_weak_count *))v121->__on_zero_shared)(v121);
      std::__shared_weak_count::__release_weak(v121);
    }
  }
  sIsolatedCoreAudioLog();
  v124 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 39;
    _os_log_impl(&dword_240186000, v124, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkInForIsolatedAudioSharedResources - after registering", buf, 0x12u);
  }

  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](v138, "mServerSideSwitchboard");
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v151, v32);
  if (!buf[16])
    std::__throw_bad_optional_access[abi:ne180100]();
  v125 = *(std::__shared_weak_count **)&buf[8];
  v126 = *(_QWORD *)(*(_QWORD *)buf + 16);
  *(_BYTE *)(v126 + 64) = 1;
  v154 = **(unsigned int **)(v126 + 24) | ((unint64_t)**(unsigned int **)(v126 + 8) << 32);
  v155 = *(_OWORD *)(v126 + 48);
  if (v125)
  {
    v127 = (unint64_t *)&v125->__shared_owners_;
    do
      v128 = __ldaxr(v127);
    while (__stlxr(v128 - 1, v127));
    if (!v128)
    {
      ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
      std::__shared_weak_count::__release_weak(v125);
    }
  }
  v129 = *(std::__shared_weak_count **)&v151[8];
  if (*(_QWORD *)&v151[8])
  {
    v130 = (unint64_t *)(*(_QWORD *)&v151[8] + 8);
    do
      v131 = __ldaxr(v130);
    while (__stlxr(v131 - 1, v130));
    if (!v131)
    {
      ((void (*)(std::__shared_weak_count *))v129->__on_zero_shared)(v129);
      std::__shared_weak_count::__release_weak(v129);
    }
  }
  sIsolatedCoreAudioLog();
  v132 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 41;
    _os_log_impl(&dword_240186000, v132, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkInForIsolatedAudioSharedResources - after exporting", buf, 0x12u);
  }

  +[IOThreadXPCSemaphoreTransporter semaphores:](IOThreadXPCSemaphoreTransporter, "semaphores:", &v154);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  sIsolatedCoreAudioLog();
  v134 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 43;
    _os_log_impl(&dword_240186000, v134, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkInForIsolatedAudioSharedResources - after allocating semaphore transporter", buf, 0x12u);
  }

  +[IOThreadXPCMappedMemoryTransporter memory:](IOThreadXPCMappedMemoryTransporter, "memory:", &v155);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  sIsolatedCoreAudioLog();
  v136 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 45;
    _os_log_impl(&dword_240186000, v136, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkInForIsolatedAudioSharedResources - after allocating memory transporter", buf, 0x12u);
  }

  ((void (**)(_QWORD, void *, void *))v139)[2](v139, v133, v135);
  sIsolatedCoreAudioLog();
  v137 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v150 = 136315394;
    *(_QWORD *)&v150[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&v150[12] = 1024;
    *(_DWORD *)&v150[14] = 53;
    _os_log_impl(&dword_240186000, v137, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - after to reply in checkInForIsolatedAudioSharedResources", v150, 0x12u);
  }

}

- (void)checkOutForIsolatedAudioSharedResources:(unsigned int)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unsigned int v33[2];
  std::__shared_weak_count *v34;
  _BYTE buf[18];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 58;
    _os_log_impl(&dword_240186000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkOutForIsolatedAudioSharedResources", buf, 0x12u);
  }

  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](self, "mServerSideSwitchboard");
  v6 = *(_QWORD *)v33;
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v33, a3);
  if (buf[16])
  {
    v7 = *(_QWORD *)(*(_QWORD *)v33 + 40);
    v8 = *(std::__shared_weak_count **)(*(_QWORD *)buf + 8);
    v31 = **(_QWORD **)buf;
    v32 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 64))(v7, &v31);
    v11 = v32;
    if (v32)
    {
      v12 = (unint64_t *)&v32->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    if (!buf[16])
      std::__throw_bad_optional_access[abi:ne180100]();
    v14 = *(uint64_t **)buf;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)buf + 16) + 64) = 0;
    v15 = *(_QWORD *)(v6 + 40);
    v17 = *v14;
    v16 = (std::__shared_weak_count *)v14[1];
    v29 = v17;
    v30 = v16;
    if (v16)
    {
      v18 = (unint64_t *)&v16->__shared_owners_;
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v15 + 40))(v15, &v29);
    v20 = v30;
    if (v30)
    {
      v21 = (unint64_t *)&v30->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    if (buf[16])
    {
      v23 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v24 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
    }
  }
  v26 = v34;
  if (v34)
  {
    v27 = (unint64_t *)&v34->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

- (void)getWorkgroupForIsolatedAudio:(unsigned int)a3 with:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  OS_os_workgroup *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  _BYTE buf[18];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  sIsolatedCoreAudioLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 71;
    _os_log_impl(&dword_240186000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - getWorkgroupForIsolatedAudio", buf, 0x12u);
  }

  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](self, "mServerSideSwitchboard");
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, v24, a3);
  if (!buf[16])
    std::__throw_bad_optional_access[abi:ne180100]();
  v23 = *(_OWORD *)buf;
  v8 = *(_QWORD *)(v24 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)buf + 8);
  *(_QWORD *)buf = **(_QWORD **)buf;
  *(_QWORD *)&buf[8] = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = (void *)(*(uint64_t (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 72))(v8, buf);
  v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (*((_QWORD *)&v23 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v23 + 1) + 16))(*((_QWORD *)&v23 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v23 + 1));
    }
  }
  v18 = v12;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)())v25->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  IOThreadWorkgroup::IOThreadWorkgroup((IOThreadWorkgroup *)buf, v18);
  +[IOThreadXPCWorkgroupTransporter transporter:](IOThreadXPCWorkgroupTransporter, "transporter:", buf, (_QWORD)v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)buf;
  *(_QWORD *)buf = 0;
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);

  v6[2](v6, v21);
}

- (void)startIsolatedAudioForUseCase:(unsigned int)a3 with:(id)a4
{
  void (**v6)(id, uint64_t);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unsigned int v25[2];
  std::__shared_weak_count *v26;
  _BYTE buf[18];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  sIsolatedCoreAudioLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 90;
    _os_log_impl(&dword_240186000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - Start", buf, 0x12u);
  }

  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](self, "mServerSideSwitchboard");
  v8 = *(_QWORD *)v25;
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v25, a3);
  if (buf[16])
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)buf + 16) + 64))
    {
      v9 = *(_QWORD *)(v8 + 40);
      v10 = *(std::__shared_weak_count **)(*(_QWORD *)buf + 8);
      v23 = **(_QWORD **)buf;
      v24 = v10;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      v13 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v9 + 48))(v9, &v23);
      v14 = v24;
      if (v24)
      {
        v15 = (unint64_t *)&v24->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
    }
    else
    {
      v13 = 4;
    }
    if (buf[16])
    {
      v17 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v18 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
    }
  }
  else
  {
    v13 = 4;
  }
  v20 = v26;
  if (v26)
  {
    v21 = (unint64_t *)&v26->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v6[2](v6, v13);

}

- (void)startIsolatedAudioForUseCase:(unsigned int)a3 atTime:(unint64_t)a4 with:(id)a5
{
  void (**v8)(id, uint64_t);
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unsigned int v27[2];
  std::__shared_weak_count *v28;
  _BYTE buf[18];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, uint64_t))a5;
  sIsolatedCoreAudioLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 107;
    _os_log_impl(&dword_240186000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - StartAtTime", buf, 0x12u);
  }

  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](self, "mServerSideSwitchboard");
  v10 = *(_QWORD *)v27;
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v27, a3);
  if (buf[16])
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)buf + 16) + 64))
    {
      v11 = *(_QWORD *)(v10 + 40);
      v12 = *(std::__shared_weak_count **)(*(_QWORD *)buf + 8);
      v25 = **(_QWORD **)buf;
      v26 = v12;
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
      }
      v15 = (*(uint64_t (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v11 + 56))(v11, &v25, a4);
      v16 = v26;
      if (v26)
      {
        v17 = (unint64_t *)&v26->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
    }
    else
    {
      v15 = 4;
    }
    if (buf[16])
    {
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
    }
  }
  else
  {
    v15 = 4;
  }
  v22 = v28;
  if (v28)
  {
    v23 = (unint64_t *)&v28->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v8[2](v8, v15);

}

- (void)stopIsolatedAudioForUseCase:(unsigned int)a3 with:(id)a4
{
  void (**v6)(id, uint64_t);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unsigned int v25[2];
  std::__shared_weak_count *v26;
  _BYTE buf[18];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  sIsolatedCoreAudioLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 124;
    _os_log_impl(&dword_240186000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - Stop", buf, 0x12u);
  }

  -[IsolatedCoreAudioXPCService mServerSideSwitchboard](self, "mServerSideSwitchboard");
  v8 = *(_QWORD *)v25;
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v25, a3);
  if (buf[16])
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)buf + 16) + 64))
    {
      v9 = *(_QWORD *)(v8 + 40);
      v10 = *(std::__shared_weak_count **)(*(_QWORD *)buf + 8);
      v23 = **(_QWORD **)buf;
      v24 = v10;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      v13 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v9 + 64))(v9, &v23);
      v14 = v24;
      if (v24)
      {
        v15 = (unint64_t *)&v24->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
    }
    else
    {
      v13 = 4;
    }
    if (buf[16])
    {
      v17 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v18 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
    }
  }
  else
  {
    v13 = 4;
  }
  v20 = v26;
  if (v26)
  {
    v21 = (unint64_t *)&v26->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v6[2](v6, v13);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  sIsolatedCoreAudioLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 141;
    _os_log_impl(&dword_240186000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - Listener", buf, 0x12u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v16 = __Block_byref_object_copy__177;
  v17 = __Block_byref_object_dispose__178;
  v7 = v5;
  v18 = v7;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256FD9AC8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__IsolatedCoreAudioXPCService_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_251076F38;
  v14[4] = buf;
  objc_msgSend(v7, "setInterruptionHandler:", v14);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__IsolatedCoreAudioXPCService_listener_shouldAcceptNewConnection___block_invoke_17;
  v13[3] = &unk_251076F60;
  v13[4] = self;
  v13[5] = buf;
  objc_msgSend(v7, "setInvalidationHandler:", v13);
  -[IsolatedCoreAudioXPCService connections](self, "connections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  -[IsolatedCoreAudioXPCService connections](self, "connections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v7);

  objc_sync_exit(v10);
  objc_msgSend(v7, "resume");
  _Block_object_dispose(buf, 8);

  return 1;
}

- (shared_ptr<ServerSideAudioSwitchboard>)mServerSideSwitchboard
{
  ServerSideAudioSwitchboard **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<ServerSideAudioSwitchboard> result;

  cntrl = self->_mServerSideSwitchboard.__cntrl_;
  *v2 = self->_mServerSideSwitchboard.__ptr_;
  v2[1] = (ServerSideAudioSwitchboard *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ServerSideAudioSwitchboard *)self;
  return result;
}

- (void)setMServerSideSwitchboard:(shared_ptr<ServerSideAudioSwitchboard>)a3
{
  __shared_weak_count *v3;
  ServerSideAudioSwitchboard *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(ServerSideAudioSwitchboard **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_mServerSideSwitchboard.__cntrl_;
  self->_mServerSideSwitchboard.__ptr_ = v4;
  self->_mServerSideSwitchboard.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  std::shared_ptr<HALUseCase>::~shared_ptr[abi:ne180100]((uint64_t)&self->_mServerSideSwitchboard);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

uint64_t __66__IsolatedCoreAudioXPCService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "IsolatedCoreAudioXPCService.mm";
    v6 = 1024;
    v7 = 147;
    _os_log_impl(&dword_240186000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - interruptionHandler", (uint8_t *)&v4, 0x12u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
}

void __66__IsolatedCoreAudioXPCService_listener_shouldAcceptNewConnection___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  sIsolatedCoreAudioLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "IsolatedCoreAudioXPCService.mm";
    v7 = 1024;
    v8 = 152;
    _os_log_impl(&dword_240186000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - invalidationHandler", (uint8_t *)&v5, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "connections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  objc_sync_exit(v3);
}

@end
