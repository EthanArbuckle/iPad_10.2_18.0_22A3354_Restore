@implementation AUAudioUnit_XPC

- (void)_setComponentInstance:(OpaqueAudioComponentInstance *)a3
{
  *((_QWORD *)self + 90) = a3;
}

- (void)_doOpen:(id)a3 completion:(id)a4
{
  id *v7;
  int v8;
  void *v9;
  unsigned __int8 v10;
  char *v11;
  char *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void **v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  AUCrashHandler *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t *v31;
  void *v32;
  uint64_t *v33;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t *v40;
  void *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  id v45;
  int v46;
  int v47;
  AUAudioUnitBusArray_XPC *v48;
  void *v49;
  AUAudioUnitBusArray_XPC *v50;
  uint64_t *j;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  std::__shared_weak_count *v70;
  std::__shared_weak_count *v71;
  std::__shared_weak_count *v72;
  std::__shared_weak_count *v73;
  std::__shared_weak_count *v74;
  std::recursive_mutex *v75;
  unint64_t *p_shared_owners;
  unint64_t v77;
  std::__shared_weak_count *v78;
  std::__shared_weak_count *v79;
  std::__shared_weak_count *v80;
  unint64_t *v81;
  unint64_t v82;
  _QWORD *v83;
  _QWORD *v84;
  unint64_t *v85;
  unint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  unint64_t *v96;
  unint64_t v97;
  __int128 v98;
  uint64_t v99;
  std::__shared_weak_count *v100;
  _OWORD *v101;
  __int128 v102;
  std::__shared_weak_count *v103;
  unint64_t *v104;
  unint64_t v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  id v112;
  id v113;
  id v114;
  void (**v115)(id, id);
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  char v124[20];
  _QWORD v125[4];
  id v126;
  void *__p[2];
  unsigned __int8 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  void *v131;
  uint64_t v132;
  char v133;
  uint64_t *v134;
  id v135;
  __int16 v136;
  id v137;
  id v138;
  __int16 v139;
  _DWORD v140[5];
  id location[2];
  void *v142;
  id *v143;
  _BYTE v144[24];
  uint64_t *v145;
  _QWORD v146[3];
  uint64_t *v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v114 = a3;
  v115 = (void (**)(id, id))a4;
  v7 = (id *)((char *)self + 576);
  objc_storeStrong((id *)self + 72, a3);
  v8 = _os_feature_enabled_impl();
  v9 = (void *)MEMORY[0x1E0C809B0];
  if (!v8)
    goto LABEL_32;
  objc_initWeak(location, self);
  if ((v10 & 1) == 0
  {
    _ZGRZ38__AUAudioUnit_XPC__doOpen_completion__E23crashHandlerDisableList_[0] = (uint64_t)operator new(0x20uLL);
    unk_1EE168528 = xmmword_18F116FF0;
    strcpy((char *)_ZGRZ38__AUAudioUnit_XPC__doOpen_completion__E23crashHandlerDisableList_[0], "com.apple.audio.SandboxHelper");
    qword_1EE168538 = (uint64_t)operator new(0x20uLL);
    xmmword_1EE168540 = xmmword_18F117000;
    strcpy((char *)qword_1EE168538, "com.apple.audio.InfoHelper");
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor, 0, &dword_18EE07000);
    -[AUAudioUnit_XPC _doOpen:completion:]::crashHandlerDisableList = (uint64_t)_ZGRZ38__AUAudioUnit_XPC__doOpen_completion__E23crashHandlerDisableList_;
    qword_1EE168510 = 2;
  }
  v11 = (char *)getprogname();
  std::string::basic_string[abi:ne180100]<0>(&v131, v11);
  v12 = (char *)getprogname();
  std::string::basic_string[abi:ne180100]<0>(__p, v12);
  v13 = v128;
  if (!qword_1EE168510)
  {
LABEL_22:
    v21 = 0;
    if ((v13 & 0x80) == 0)
      goto LABEL_25;
LABEL_27:
    operator delete(__p[0]);
    if ((v21 & 1) != 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  v14 = -[AUAudioUnit_XPC _doOpen:completion:]::crashHandlerDisableList;
  v15 = -[AUAudioUnit_XPC _doOpen:completion:]::crashHandlerDisableList + 24 * qword_1EE168510;
  if ((v128 & 0x80u) == 0)
    v16 = v128;
  else
    v16 = (unint64_t)__p[1];
  if ((v128 & 0x80u) == 0)
    v17 = __p;
  else
    v17 = (void **)__p[0];
  while (1)
  {
    v18 = *(unsigned __int8 *)(v14 + 23);
    if ((v18 & 0x80u) == 0)
      v19 = (void *)*(unsigned __int8 *)(v14 + 23);
    else
      v19 = *(void **)(v14 + 8);
    if (v19 != (void *)v16)
      goto LABEL_21;
    if ((v18 & 0x80) != 0)
      break;
    if (!*(_BYTE *)(v14 + 23))
      goto LABEL_24;
    v20 = 0;
    while (*(unsigned __int8 *)(v14 + v20) == *((unsigned __int8 *)v17 + v20))
    {
      if (v18 == ++v20)
        goto LABEL_24;
    }
LABEL_21:
    v14 += 24;
    if (v14 == v15)
      goto LABEL_22;
  }
  if (memcmp(*(const void **)v14, v17, *(_QWORD *)(v14 + 8)))
    goto LABEL_21;
LABEL_24:
  v21 = 1;
  if ((v13 & 0x80) != 0)
    goto LABEL_27;
LABEL_25:
  if ((v21 & 1) == 0)
  {
LABEL_28:
    v22 = [AUCrashHandler alloc];
    -[AUAudioUnit_XPC XPCListenerEndpoint](self, "XPCListenerEndpoint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v125[0] = v9;
    v125[1] = 3321888768;
    v125[2] = __38__AUAudioUnit_XPC__doOpen_completion___block_invoke;
    v125[3] = &__block_descriptor_40_ea8_32c40_ZTSN5caulk8weak_refI15AUAudioUnit_XPCEE_e22_v16__0__NSDictionary_8l;
    objc_copyWeak(&v126, location);
    v24 = -[AUCrashHandler initWithEndpoint:withCrashBlock:](v22, "initWithEndpoint:withCrashBlock:", v23, v125);
    v25 = (void *)*((_QWORD *)self + 93);
    *((_QWORD *)self + 93) = v24;

    objc_destroyWeak(&v126);
  }
LABEL_29:
  if (v133 < 0)
    operator delete(v131);
  objc_destroyWeak(location);
LABEL_32:
  v26 = *v7;
  location[0] = &off_1E29163C8;
  location[1] = &v131;
  v143 = location;
  v27 = v26;
  v131 = v27;
  v28 = (uint64_t)v143;
  if (v143)
  {
    if (v143 != location)
    {
      v28 = (*((uint64_t (**)(id *))*v143 + 2))(v143);
      goto LABEL_35;
    }
    v134 = &v132;
    (*((void (**)(id *, uint64_t *))location[0] + 3))(location, &v132);
  }
  else
  {
LABEL_35:
    v134 = (uint64_t *)v28;
  }

  v29 = v143;
  if (v143 == location)
  {
    v30 = 4;
    v29 = location;
LABEL_41:
    (*((void (**)(void))*v29 + v30))();
  }
  else if (v143)
  {
    v30 = 5;
    goto LABEL_41;
  }
  v135 = 0;
  v136 = 0;
  v138 = 0;
  v137 = 0;
  v139 = 0;
  memset(v140, 0, sizeof(v140));
  v31 = v134;
  if (!v134)
  {
    v147 = 0;
    v32 = v131;
    location[0] = v9;
    location[1] = (id)3321888768;
    v142 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJbbU8__strongP7NSArrayS7_bbimmEE10sync_proxyEv_block_invoke;
    v143 = (id *)&__block_descriptor_64_ea8_32c79_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbbU8__strongP7NSArrayS6_bbimmEEEEEE_e17_v16__0__NSError_8l;
    v33 = (uint64_t *)v144;
    goto LABEL_50;
  }
  if (v134 == &v132)
  {
    v147 = v146;
    (*(void (**)(uint64_t *, _QWORD *))(v132 + 24))(&v132, v146);
    v31 = v147;
  }
  else
  {
    v31 = (uint64_t *)(*(uint64_t (**)(void))(*v134 + 16))();
    v147 = v31;
  }
  v32 = v131;
  location[0] = v9;
  location[1] = (id)3321888768;
  v142 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJbbU8__strongP7NSArrayS7_bbimmEE10sync_proxyEv_block_invoke;
  v143 = (id *)&__block_descriptor_64_ea8_32c79_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbbU8__strongP7NSArrayS6_bbimmEEEEEE_e17_v16__0__NSError_8l;
  v33 = (uint64_t *)v144;
  if (v31)
  {
    if (v31 != v146)
    {
      v31 = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*v31 + 16))(v31);
      goto LABEL_50;
    }
    v145 = (uint64_t *)v144;
    (*(void (**)(_QWORD *, _BYTE *))(v146[0] + 24))(v146, v144);
  }
  else
  {
LABEL_50:
    v145 = v31;
  }
  objc_msgSend(v32, "synchronousRemoteObjectProxyWithErrorHandler:", location);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v145 == (uint64_t *)v144)
  {
    v35 = 4;
LABEL_55:
    (*(void (**)(uint64_t *))(*v33 + 8 * v35))(v33);
  }
  else if (v145)
  {
    v35 = 5;
    v33 = v145;
    goto LABEL_55;
  }
  v36 = v147;
  if (v147 == v146)
  {
    v37 = 4;
    v36 = v146;
LABEL_60:
    (*(void (**)(void))(*v36 + 8 * v37))();
  }
  else if (v147)
  {
    v37 = 5;
    goto LABEL_60;
  }
  -[AUAudioUnit componentDescription](self, "componentDescription");
  -[AUAudioUnit_XPC auInstanceUUID](self, "auInstanceUUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v134;
  if (!v134)
  {
    v147 = 0;
    location[0] = v9;
    location[1] = (id)3321888768;
    v142 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJbbU8__strongP7NSArrayS7_bbimmEE5replyEv_block_invoke;
    v143 = (id *)&__block_descriptor_64_ea8_32c79_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbbU8__strongP7NSArrayS6_bbimmEEEEEE_e62_v68__0__NSError_8B16B20__NSArray_24__NSArray_32B40B44i48Q52Q60l;
    v40 = (uint64_t *)v144;
    goto LABEL_69;
  }
  if (v134 == &v132)
  {
    v147 = v146;
    (*(void (**)(uint64_t *, _QWORD *))(v132 + 24))(&v132, v146);
    v39 = v147;
  }
  else
  {
    v39 = (uint64_t *)(*(uint64_t (**)(void))(*v134 + 16))();
    v147 = v39;
  }
  location[0] = v9;
  location[1] = (id)3321888768;
  v142 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJbbU8__strongP7NSArrayS7_bbimmEE5replyEv_block_invoke;
  v143 = (id *)&__block_descriptor_64_ea8_32c79_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbbU8__strongP7NSArrayS6_bbimmEEEEEE_e62_v68__0__NSError_8B16B20__NSArray_24__NSArray_32B40B44i48Q52Q60l;
  v40 = (uint64_t *)v144;
  if (v39)
  {
    if (v39 != v146)
    {
      v39 = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*v39 + 16))(v39);
      goto LABEL_69;
    }
    v145 = (uint64_t *)v144;
    (*(void (**)(_QWORD *, _BYTE *))(v146[0] + 24))(v146, v144);
  }
  else
  {
LABEL_69:
    v145 = v39;
  }
  v41 = _Block_copy(location);
  if (v145 == (uint64_t *)v144)
  {
    v42 = 4;
LABEL_74:
    (*(void (**)(uint64_t *))(*v40 + 8 * v42))(v40);
  }
  else if (v145)
  {
    v42 = 5;
    v40 = v145;
    goto LABEL_74;
  }
  v43 = v147;
  if (v147 == v146)
  {
    v44 = 4;
    v43 = v146;
LABEL_79:
    (*(void (**)(void))(*v43 + 8 * v44))();
  }
  else if (v147)
  {
    v44 = 5;
    goto LABEL_79;
  }
  objc_msgSend(v34, "open:instanceUUID:reply:", v124, v38, v41);

  v45 = v135;
  if (v45)
  {
    v115[2](v115, v45);
    goto LABEL_181;
  }
  *((_WORD *)self + 376) = v136;
  v112 = v137;
  v113 = v138;
  v46 = v139;
  v47 = HIBYTE(v139);
  *((_DWORD *)self + 182) = v140[0];
  *(int32x2_t *)((char *)self + 732) = vmovn_s64(*(int64x2_t *)&v140[1]);
  v48 = -[AUAudioUnitBusArray_XPC initWithOwner:scope:busses:countWritable:]([AUAudioUnitBusArray_XPC alloc], "initWithOwner:scope:busses:countWritable:", self, 1, v112, v46 != 0);
  v49 = (void *)*((_QWORD *)self + 103);
  *((_QWORD *)self + 103) = v48;

  v50 = -[AUAudioUnitBusArray_XPC initWithOwner:scope:busses:countWritable:]([AUAudioUnitBusArray_XPC alloc], "initWithOwner:scope:busses:countWritable:", self, 2, v113, v47 != 0);
  LOBYTE(j) = 64;
  v52 = (void *)*((_QWORD *)self + 104);
  *((_QWORD *)self + 104) = v50;

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v53 = *((id *)self + 103);
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v121 != v55)
          objc_enumerationMutation(v53);
        v57 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_storeWeak((id *)(v57 + 112), self);
        objc_storeWeak((id *)(v57 + 120), *v7);
      }
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
    }
    while (v54);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v58 = *((id *)self + 104);
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != (uint64_t *)v59; j = (uint64_t *)((char *)j + 1))
      {
        if (*(_QWORD *)v117 != v60)
          objc_enumerationMutation(v58);
        v61 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)j);
        objc_storeWeak((id *)(v61 + 112), self);
        objc_storeWeak((id *)(v61 + 120), *v7);
      }
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
    }
    while (v59);
  }

  {
    auoop::RenderPipePoolManager::instance(void)::global = 0;
    qword_1EE145A18 = 0;
    qword_1EE145A20 = 0;
    qword_1EE145A10 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&auoop::RenderPipePoolManager::instance(void)::global);
  v63 = *((_DWORD *)self + 182);
  v65 = qword_1EE145A10;
  v64 = qword_1EE145A18;
  if (qword_1EE145A10 == qword_1EE145A18)
    goto LABEL_145;
  v66 = (_QWORD *)qword_1EE145A10;
  while (1)
  {
    v67 = v66[1];
    if (!v67 || *(_QWORD *)(v67 + 8) == -1)
      break;
    v66 += 2;
    if (v66 == (_QWORD *)qword_1EE145A18)
      goto LABEL_121;
  }
  if (v66 != (_QWORD *)qword_1EE145A18)
  {
    j = v66 + 2;
    if (v66 + 2 != (_QWORD *)qword_1EE145A18)
    {
      do
      {
        v68 = j[1];
        if (v68 && *(_QWORD *)(v68 + 8) != -1)
        {
          v69 = *j;
          *j = 0;
          j[1] = 0;
          v70 = (std::__shared_weak_count *)v66[1];
          *v66 = v69;
          v66[1] = v68;
          if (v70)
            std::__shared_weak_count::__release_weak(v70);
          v66 += 2;
        }
        j += 2;
      }
      while (j != (uint64_t *)v64);
      v65 = qword_1EE145A10;
      v64 = qword_1EE145A18;
    }
  }
  if (v66 == (_QWORD *)v64)
  {
LABEL_121:
    v66 = (_QWORD *)v64;
    goto LABEL_122;
  }
  while ((_QWORD *)v64 != v66)
  {
    v71 = *(std::__shared_weak_count **)(v64 - 8);
    if (v71)
      std::__shared_weak_count::__release_weak(v71);
    v64 -= 16;
  }
  qword_1EE145A18 = (uint64_t)v66;
  v65 = qword_1EE145A10;
LABEL_122:
  if ((_QWORD *)v65 == v66)
    goto LABEL_145;
  while (1)
  {
    v72 = *(std::__shared_weak_count **)(v65 + 8);
    if (v72)
    {
      v73 = std::__shared_weak_count::lock(v72);
      if (v73)
      {
        v74 = v73;
        v75 = *(std::recursive_mutex **)v65;
        if (*(_QWORD *)v65)
        {
          std::recursive_mutex::lock(*(std::recursive_mutex **)v65);
          LOBYTE(j) = *(_DWORD *)v75[1].__m_.__opaque == v63 && v75[1].__m_.__opaque[4] == 0;
          std::recursive_mutex::unlock(v75);
        }
        p_shared_owners = (unint64_t *)&v74->__shared_owners_;
        do
          v77 = __ldaxr(p_shared_owners);
        while (__stlxr(v77 - 1, p_shared_owners));
        if (!v77)
        {
          ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
          std::__shared_weak_count::__release_weak(v74);
        }
        if (((v75 != 0) & j) != 0)
          break;
      }
    }
    v65 += 16;
    if ((_QWORD *)v65 == v66)
    {
      v65 = (uint64_t)v66;
      break;
    }
  }
  if (v65 == qword_1EE145A18
    || (location[0] = 0, location[1] = 0, (v78 = *(std::__shared_weak_count **)(v65 + 8)) == 0)
    || (v79 = std::__shared_weak_count::lock(v78), (location[1] = v79) == 0))
  {
LABEL_145:
    v83 = operator new(0xD8uLL);
    v83[1] = 0;
    v83[2] = 0;
    *v83 = &off_1E2917B78;
    MEMORY[0x193FFE25C](v83 + 3);
    *((_BYTE *)v83 + 128) = 0;
    v83[11] = v83 + 3;
    *((_DWORD *)v83 + 24) = v63;
    v83[13] = 0;
    *((_BYTE *)v83 + 100) = 0;
    *((_BYTE *)v83 + 200) = 0;
    v83[14] = 0;
    v83[15] = 0;
    v83[26] = objc_opt_new();
    location[0] = v83 + 3;
    location[1] = v83;
    v84 = (_QWORD *)qword_1EE145A18;
    if (qword_1EE145A18 < (unint64_t)qword_1EE145A20)
    {
      *(id *)qword_1EE145A18 = location[0];
      v84[1] = v83;
      v85 = v83 + 2;
      do
        v86 = __ldxr(v85);
      while (__stxr(v86 + 1, v85));
      v87 = (uint64_t)(v84 + 2);
      qword_1EE145A18 = (uint64_t)(v84 + 2);
      goto LABEL_169;
    }
    v88 = (_QWORD *)qword_1EE145A10;
    v89 = (qword_1EE145A18 - qword_1EE145A10) >> 4;
    v90 = v89 + 1;
    if ((unint64_t)(v89 + 1) >> 60)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v91 = qword_1EE145A20 - qword_1EE145A10;
    if ((qword_1EE145A20 - qword_1EE145A10) >> 3 > v90)
      v90 = v91 >> 3;
    if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF0)
      v92 = 0xFFFFFFFFFFFFFFFLL;
    else
      v92 = v90;
    if (v92 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v93 = (char *)operator new(16 * v92);
    v94 = &v93[16 * v89];
    v95 = (char *)location[1];
    *(_OWORD *)v94 = *(_OWORD *)location;
    if (v95)
    {
      v96 = (unint64_t *)(v95 + 16);
      do
        v97 = __ldxr(v96);
      while (__stxr(v97 + 1, v96));
      v84 = (_QWORD *)qword_1EE145A18;
    }
    v87 = (uint64_t)(v94 + 16);
    if (v84 == v88)
    {
      qword_1EE145A10 = (uint64_t)v94;
      qword_1EE145A18 = (uint64_t)(v94 + 16);
      qword_1EE145A20 = (uint64_t)&v93[16 * v92];
      if (!v88)
        goto LABEL_169;
    }
    else
    {
      do
      {
        v98 = *((_OWORD *)v84 - 1);
        v84 -= 2;
        *((_OWORD *)v94 - 1) = v98;
        v94 -= 16;
        *v84 = 0;
        v84[1] = 0;
      }
      while (v84 != v88);
      v99 = qword_1EE145A10;
      v88 = (_QWORD *)qword_1EE145A18;
      qword_1EE145A10 = (uint64_t)v94;
      qword_1EE145A18 = v87;
      qword_1EE145A20 = (uint64_t)&v93[16 * v92];
      if (v88 != (_QWORD *)v99)
      {
        do
        {
          v100 = (std::__shared_weak_count *)*(v88 - 1);
          if (v100)
            std::__shared_weak_count::__release_weak(v100);
          v88 -= 2;
        }
        while (v88 != (_QWORD *)v99);
        v88 = (_QWORD *)v99;
      }
      if (!v88)
        goto LABEL_169;
    }
    operator delete(v88);
LABEL_169:
    qword_1EE145A18 = v87;
    goto LABEL_170;
  }
  location[0] = *(id *)v65;
  if (!location[0])
  {
    v80 = v79;
    v81 = (unint64_t *)&v79->__shared_owners_;
    do
      v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v80);
    }
    goto LABEL_145;
  }
LABEL_170:
  v101 = (_OWORD *)((char *)self + 872);
  v102 = *(_OWORD *)location;
  location[0] = 0;
  location[1] = 0;
  v103 = (std::__shared_weak_count *)*((_QWORD *)self + 110);
  *v101 = v102;
  if (v103)
  {
    v104 = (unint64_t *)&v103->__shared_owners_;
    do
      v105 = __ldaxr(v104);
    while (__stlxr(v105 - 1, v104));
    if (!v105)
    {
      ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
      std::__shared_weak_count::__release_weak(v103);
    }
  }
  v106 = (std::__shared_weak_count *)location[1];
  if (location[1])
  {
    v107 = (unint64_t *)((char *)location[1] + 8);
    do
      v108 = __ldaxr(v107);
    while (__stlxr(v108 - 1, v107));
    if (!v108)
    {
      ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
      std::__shared_weak_count::__release_weak(v106);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&auoop::RenderPipePoolManager::instance(void)::global);
  v109 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
  AURegistrationServerConnection::RegisterExtensionProcess(v109);
  v115[2](v115, 0);

  v45 = 0;
LABEL_181:

  v110 = &v132;
  if (v134 == &v132)
  {
    v111 = 4;
LABEL_185:
    (*(void (**)(void))(*v110 + 8 * v111))();
  }
  else if (v134)
  {
    v111 = 5;
    v110 = v134;
    goto LABEL_185;
  }

}

- (void)_invalidatePipePoolAndUser
{
  char *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5[2];
  id location;

  v2 = (char *)self + 888;
  if (*((_BYTE *)self + 960))
    atomic_store(1u, (unsigned __int8 *)self + 952);
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AUAudioUnit_XPC__invalidatePipePoolAndUser__block_invoke;
  block[3] = &unk_1E2922218;
  objc_copyWeak(v5, &location);
  v5[1] = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (id)_getInvalidationNotificationInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("audioUnit");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *((_QWORD *)self + 90));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("AUAudioUnit");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("Service PID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)self + 182));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("Host PID");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)didInvalidate
{
  void *v3;
  int64_t v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  -[AUAudioUnit_XPC _invalidatePipePoolAndUser](self, "_invalidatePipePoolAndUser");
  -[AUAudioUnit_XPC _getInvalidationNotificationInfo](self, "_getInvalidationNotificationInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (*((_QWORD *)self + 93))
    v4 = 10000000000;
  else
    v4 = 0;
  v5 = dispatch_time(0, v4);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __32__AUAudioUnit_XPC_didInvalidate__block_invoke;
  block[3] = &unk_1E28FFB00;
  objc_copyWeak(&v10, &location);
  v9 = v3;
  v7 = v3;
  dispatch_after(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)didCrash:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  AUAudioUnit_XPC *val;
  void *v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  void *v25;
  AudioComponentDescription v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  -[AUAudioUnit_XPC _invalidatePipePoolAndUser](self, "_invalidatePipePoolAndUser");
  val = self;
  -[AUAudioUnit_XPC _getInvalidationNotificationInfo](self, "_getInvalidationNotificationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v20 = v5;
  if (v21)
  {
    objc_msgSend(v21, "valueForKey:", CFSTR("Path"));
    v6 = objc_claimAutoreleasedReturnValue();
    v17 = v6;
    if (v6)
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Executable Path"), v6);
    objc_msgSend(v5, "valueForKey:", CFSTR("Descriptions"), v17);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      v10 = (void *)MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "getValue:", &v26);
          if (kAUExtensionScope)
          {
            v12 = *(id *)kAUExtensionScope;
            if (!v12)
              continue;
          }
          else
          {
            v13 = v10;
            v12 = v10;
          }
          v14 = v12;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            CAFormatter::CAFormatter((CAFormatter *)&v25, &v26);
            *(_DWORD *)buf = 136315650;
            v32 = "AUAudioUnit_XPC.mm";
            v33 = 1024;
            v34 = 632;
            v35 = 2080;
            v36 = v25;
            _os_log_impl(&dword_18EE07000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Crashed AU possible component description: %s", buf, 0x1Cu);
            if (v25)
              free(v25);
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v8);
    }

  }
  objc_initWeak((id *)buf, val);
  dispatch_get_global_queue(0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __28__AUAudioUnit_XPC_didCrash___block_invoke;
  block[3] = &unk_1E28FFB00;
  objc_copyWeak(&v24, (id *)buf);
  v23 = v20;
  v16 = v20;
  dispatch_async(v15, block);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;
  void *v13;
  _BYTE v14[24];
  _BYTE *v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*((_QWORD *)self + 93);
  *((_QWORD *)self + 93) = 0;

  v4 = (void *)*((_QWORD *)self + 121);
  if (v4)
  {
    objc_msgSend(v4, "setRemoteParameterSynchronizerXPCConnection:", *((_QWORD *)self + 72));
    v5 = (void *)*((_QWORD *)self + 121);
    *((_QWORD *)self + 121) = 0;

  }
  v6 = (void *)*((_QWORD *)self + 72);
  if (v6)
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v13, v6);
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "close:", &__block_literal_global_144);

    v8 = v15;
    if (v15 == v14)
    {
      v9 = 4;
      v8 = v14;
    }
    else
    {
      if (!v15)
      {
LABEL_9:

        goto LABEL_10;
      }
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
    goto LABEL_9;
  }
LABEL_10:
  v10 = (void *)*((_QWORD *)self + 103);
  *((_QWORD *)self + 103) = 0;

  v11 = (void *)*((_QWORD *)self + 104);
  *((_QWORD *)self + 104) = 0;

  v12.receiver = self;
  v12.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit dealloc](&v12, sel_dealloc);
}

- (void)_parameterTreeChanged
{
  void *v3;
  void *v4;

  v3 = (void *)*((_QWORD *)self + 121);
  if (v3)
  {
    objc_msgSend(v3, "setRemoteParameterSynchronizerXPCConnection:", 0);
    v4 = (void *)*((_QWORD *)self + 121);
    *((_QWORD *)self + 121) = 0;

  }
}

- (id)inputBusses
{
  if (-[AUAudioUnit_XPC isLocalCachingDisabled](self, "isLocalCachingDisabled"))
    -[AUAudioUnit_XPC _refreshBusses:](self, "_refreshBusses:", 1);
  return *((id *)self + 103);
}

- (id)outputBusses
{
  if (-[AUAudioUnit_XPC isLocalCachingDisabled](self, "isLocalCachingDisabled"))
    -[AUAudioUnit_XPC _refreshBusses:](self, "_refreshBusses:", 2);
  return *((id *)self + 104);
}

- (BOOL)_setBusCount:(unint64_t)a3 scope:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v18;
  _BYTE v19[24];
  _BYTE *v20;
  id v21;
  id v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x1E0C80C00];
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v18, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBusCount:scope:reply:", a3, v6, v10);

  v11 = v22;
  v12 = v21;
  v13 = v12;
  if (a5)
    *a5 = objc_retainAutorelease(v12);
  if (v11)
    -[AUAudioUnit_XPC propertiesChanged:](self, "propertiesChanged:", v11);
  v14 = v13;

  v15 = v20;
  if (v20 == v19)
  {
    v16 = 4;
    v15 = v19;
    goto LABEL_9;
  }
  if (v20)
  {
    v16 = 5;
LABEL_9:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

  return v14 == 0;
}

- (void)setMusicalContextBlock:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit setMusicalContextBlock:](&v8, sel_setMusicalContextBlock_, v4);
  v5 = (char *)self + 888;
  if (*((_BYTE *)self + 960))
  {
    -[AUAudioUnit musicalContextBlock](self, "musicalContextBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUAudioUnit transportStateBlock](self, "transportStateBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    auoop::RenderPipeUser::setV3HostCallbacks((uint64_t)v5, v6, v7);

  }
}

- (void)setTransportStateBlock:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit setTransportStateBlock:](&v8, sel_setTransportStateBlock_, v4);
  v5 = (char *)self + 888;
  if (*((_BYTE *)self + 960))
  {
    -[AUAudioUnit musicalContextBlock](self, "musicalContextBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUAudioUnit transportStateBlock](self, "transportStateBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    auoop::RenderPipeUser::setV3HostCallbacks((uint64_t)v5, v6, v7);

  }
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t (***p_aBlock)();
  uint64_t v19;
  char *v20;
  void *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  id v37;
  int v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  const void *v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  unsigned int v47;
  id v48;
  AUOOPRenderingClient *v49;
  uint64_t v50;
  unint64_t v51;
  const void *v52;
  uint64_t v53;
  unsigned int v54;
  double v55;
  unint64_t v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  int v62;
  BOOL v63;
  BOOL v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  int v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  int v84;
  void *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _DWORD *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  signed int v100;
  int v101;
  uint64_t *v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  _QWORD *v119;
  uint64_t *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  uint64_t *v126;
  char *v127;
  uint64_t *v128;
  uint64_t v129;
  _QWORD *v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  void *v136;
  int v137;
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  unsigned __int8 v142;
  uint64_t v143;
  unint64_t v144;
  id v145;
  uint64_t v146;
  unint64_t v147;
  _DWORD *v148;
  unint64_t v149;
  id v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  id *v154;
  void *v155;
  id *v156;
  uint64_t v157;
  id *v158;
  uint64_t v159;
  uint64_t v160;
  caulk::mach::details *v161;
  void *v162;
  id v163;
  id *v164;
  id *v165;
  void *v166;
  uint64_t v167;
  id *v168;
  uint64_t v169;
  id v170;
  id v171;
  id v172;
  char v173;
  uint64_t v174;
  int v175;
  NSObject *v176;
  id v177;
  int v178;
  int v179;
  uint64_t v180;
  _QWORD *v181;
  uint64_t v182;
  id v183;
  std::recursive_mutex *v184;
  uint64_t v185;
  uint64_t v186;
  auoop *v187;
  uint64_t v188;
  os_unfair_lock_s **v189;
  _QWORD *v190;
  uint64_t v191;
  void **v192;
  void *v193;
  void (**v194)(_QWORD, _QWORD);
  __int128 v195;
  void (**v196)(_QWORD, _QWORD);
  id v197;
  __int128 v198;
  uint64_t v199;
  id v200;
  NSObject *v201;
  void *v202;
  id v204;
  unsigned int v205;
  unsigned int v206;
  uint64_t v207;
  void *v208;
  void *v209;
  BOOL v210;
  BOOL v211;
  id v212;
  id v213;
  id v214;
  unint64_t v215;
  unint64_t v216;
  id v217;
  BOOL v218;
  BOOL v219;
  int v220;
  int v221;
  void *v222;
  id v223;
  void *__p;
  AUOOPRenderingClient *v225;
  uint64_t *v226;
  id v227;
  int v228;
  std::recursive_mutex *v229;
  id v230;
  __int16 v231;
  objc_super v232;
  uint64_t v233;
  char v234;
  _QWORD v235[3];
  id v236;
  caulk::mach::details *v237;
  id v238;
  void (**v239)(_QWORD, _QWORD);
  __int128 v240;
  __int128 v241;
  _BYTE v242[24];
  char v243;
  char v244;
  uint64_t (**aBlock)();
  __int128 v246;
  __int128 v247;
  __int128 v248;
  char *v249;
  __int128 v250;
  _BYTE v251[32];
  _BYTE v252[49];
  int v253;
  _BYTE buf[24];
  char *v255;
  _QWORD v256[3];
  id *v257;
  id v258[3];
  id *v259;
  uint64_t v260;

  v260 = *MEMORY[0x1E0C80C00];
  if (-[AUAudioUnit renderResourcesAllocated](self, "renderResourcesAllocated"))
    return 1;
  -[AUAudioUnit musicalContextBlock](self, "musicalContextBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnit transportStateBlock](self, "transportStateBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnit MIDIOutputEventBlock](self, "MIDIOutputEventBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnit MIDIOutputEventListBlock](self, "MIDIOutputEventListBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 != 0;
  v11 = v6 != 0;
  v12 = v8 != 0;
  v13 = v9 != 0;

  v14 = (void *)*((_QWORD *)self + 72);
  aBlock = &off_1E29164A0;
  *(_QWORD *)&v246 = v251;
  *(_QWORD *)&v247 = &aBlock;
  v15 = v14;
  *(_QWORD *)v251 = v15;
  v16 = &v251[8];
  v17 = v247;
  if (!(_QWORD)v247)
    goto LABEL_6;
  if ((uint64_t (***)())v247 != &aBlock)
  {
    v17 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v247 + 16))(v247);
LABEL_6:
    *(_QWORD *)v252 = v17;
    goto LABEL_8;
  }
  *(_QWORD *)v252 = &v251[8];
  ((void (*)(uint64_t (***)(), _BYTE *))aBlock[3])(&aBlock, &v251[8]);
LABEL_8:

  p_aBlock = (uint64_t (***)())v247;
  if ((uint64_t (***)())v247 == &aBlock)
  {
    v19 = 4;
    p_aBlock = &aBlock;
  }
  else
  {
    if (!(_QWORD)v247)
      goto LABEL_13;
    v19 = 5;
  }
  (*p_aBlock)[v19]();
LABEL_13:
  v253 = 0;
  memset(&v252[8], 0, 41);
  v20 = *(char **)v252;
  if (!*(_QWORD *)v252)
  {
    *(_QWORD *)&v241 = 0;
    v21 = *(void **)v251;
    aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
    *(_QWORD *)&v246 = 3321888768;
    *((_QWORD *)&v246 + 1) = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJmmmU8__strongP6NSDatabjEE10sync_proxyEv_block_invoke;
    *(_QWORD *)&v247 = &__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJmmmU8__strongP6NSDatabjEEEEEE_e17_v16__0__NSError_8l;
    v22 = (char *)&v247 + 8;
LABEL_21:
    v249 = v20;
    goto LABEL_22;
  }
  if (*(_BYTE **)v252 == &v251[8])
  {
    *(_QWORD *)&v241 = &v239;
    (*(void (**)(_BYTE *, _QWORD))(*(_QWORD *)&v251[8] + 24))(&v251[8], &v239);
    v20 = (char *)v241;
  }
  else
  {
    v20 = (char *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)v252 + 16))(*(_QWORD *)v252);
    *(_QWORD *)&v241 = v20;
  }
  v21 = *(void **)v251;
  aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
  *(_QWORD *)&v246 = 3321888768;
  *((_QWORD *)&v246 + 1) = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJmmmU8__strongP6NSDatabjEE10sync_proxyEv_block_invoke;
  *(_QWORD *)&v247 = &__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJmmmU8__strongP6NSDatabjEEEEEE_e17_v16__0__NSError_8l;
  v22 = (char *)&v247 + 8;
  if (!v20)
    goto LABEL_21;
  if (v20 != (char *)&v239)
  {
    v20 = (char *)(*(uint64_t (**)(char *))(*(_QWORD *)v20 + 16))(v20);
    goto LABEL_21;
  }
  v249 = (char *)&v247 + 8;
  ((void (**)(_QWORD, char *))v239)[3](&v239, (char *)&v247 + 8);
LABEL_22:
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v249 == (char *)&v247 + 8)
  {
    v24 = 4;
  }
  else
  {
    if (!v249)
      goto LABEL_27;
    v24 = 5;
    v22 = v249;
  }
  (*(void (**)(char *))(*(_QWORD *)v22 + 8 * v24))(v22);
LABEL_27:
  v25 = (_QWORD *)v241;
  if ((void (***)(_QWORD, _QWORD))v241 == &v239)
  {
    v26 = 4;
    v25 = &v239;
  }
  else
  {
    if (!(_QWORD)v241)
      goto LABEL_32;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_32:
  v27 = *(char **)v252;
  if (!*(_QWORD *)v252)
  {
    *(_QWORD *)&v241 = 0;
    aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
    *(_QWORD *)&v246 = 3321888768;
    *((_QWORD *)&v246 + 1) = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJmmmU8__strongP6NSDatabjEE5replyEv_block_invoke;
    *(_QWORD *)&v247 = &__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJmmmU8__strongP6NSDatabjEEEEEE_e43_v56__0__NSError_8Q16Q24Q32__NSData_40B48I52l;
    v28 = (char *)&v247 + 8;
LABEL_40:
    v249 = v27;
    goto LABEL_41;
  }
  if (*(_BYTE **)v252 == &v251[8])
  {
    *(_QWORD *)&v241 = &v239;
    (*(void (**)(_BYTE *, _QWORD))(*(_QWORD *)&v251[8] + 24))(&v251[8], &v239);
    v27 = (char *)v241;
  }
  else
  {
    v27 = (char *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)v252 + 16))(*(_QWORD *)v252);
    *(_QWORD *)&v241 = v27;
  }
  aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
  *(_QWORD *)&v246 = 3321888768;
  *((_QWORD *)&v246 + 1) = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJmmmU8__strongP6NSDatabjEE5replyEv_block_invoke;
  *(_QWORD *)&v247 = &__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJmmmU8__strongP6NSDatabjEEEEEE_e43_v56__0__NSError_8Q16Q24Q32__NSData_40B48I52l;
  v28 = (char *)&v247 + 8;
  if (!v27)
    goto LABEL_40;
  if (v27 != (char *)&v239)
  {
    v27 = (char *)(*(uint64_t (**)(char *))(*(_QWORD *)v27 + 16))(v27);
    goto LABEL_40;
  }
  v249 = (char *)&v247 + 8;
  ((void (**)(_QWORD, char *))v239)[3](&v239, (char *)&v247 + 8);
LABEL_41:
  v29 = _Block_copy(&aBlock);
  v30 = (v11 || 2 * v10) | (unint64_t)(4 * v12) | (8 * v13);
  if (v249 == (char *)&v247 + 8)
  {
    v31 = 4;
  }
  else
  {
    if (!v249)
      goto LABEL_46;
    v31 = 5;
    v28 = v249;
  }
  (*(void (**)(char *))(*(_QWORD *)v28 + 8 * v31))(v28);
LABEL_46:
  v32 = (_QWORD *)v241;
  if ((void (***)(_QWORD, _QWORD))v241 == &v239)
  {
    v33 = 4;
    v32 = &v239;
  }
  else
  {
    if (!(_QWORD)v241)
      goto LABEL_51;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_51:
  objc_msgSend(v23, "initialize:reply:", v30, v29);

  v34 = *(_DWORD *)&v252[16];
  v35 = *(_DWORD *)&v252[24];
  v36 = *(_QWORD *)&v252[32];
  v37 = *(id *)&v252[40];
  v38 = v253;
  v39 = *(id *)&v252[8];
  if (v39)
  {
    v40 = v39;
    if (a3)
      *a3 = objc_retainAutorelease(v39);
    -[AUAudioUnit setRenderResourcesAllocated:](self, "setRenderResourcesAllocated:", 0);

    if (*(_BYTE **)v252 == &v251[8])
    {
      v41 = 4;
    }
    else
    {
      if (!*(_QWORD *)v252)
      {
LABEL_62:

        v5 = 0;
        goto LABEL_344;
      }
      v41 = 5;
      v16 = *(_QWORD **)v252;
    }
    (*(void (**)(_QWORD *))(*v16 + 8 * v41))(v16);
    goto LABEL_62;
  }
  v228 = v38;
  v230 = v37;

  if (*(_BYTE **)v252 == &v251[8])
  {
    v42 = 4;
  }
  else
  {
    if (!*(_QWORD *)v252)
      goto LABEL_67;
    v42 = 5;
    v16 = *(_QWORD **)v252;
  }
  (*(void (**)(_QWORD *))(*v16 + 8 * v42))(v16);
LABEL_67:

  if (v36 <= 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10875, 0);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_343;
    }
    goto LABEL_73;
  }
  v232.receiver = self;
  v232.super_class = (Class)AUAudioUnit_XPC;
  if (!-[AUAudioUnit allocateRenderResourcesAndReturnError:](&v232, sel_allocateRenderResourcesAndReturnError_, a3))
  {
LABEL_73:
    v5 = 0;
    goto LABEL_343;
  }
  v227 = objc_retainAutorelease(v37);
  v43 = (const void *)objc_msgSend(v227, "bytes");
  v44 = objc_msgSend(v227, "length");
  if (v44 >= 0x28)
  {
    v46 = v44 / 0x28;
    v45 = std::__allocate_at_least[abi:ne180100]<std::allocator<ISOLoudnessInfo>>(v44 / 0x28);
    memmove(v45, v43, 40 * v46);
  }
  else
  {
    v45 = 0;
  }
  __p = v45;
  v47 = -[AUAudioUnit MIDIOutputBufferSizeHint](self, "MIDIOutputBufferSizeHint");
  v48 = v227;
  LOBYTE(aBlock) = 1;
  v246 = 0u;
  v247 = 0u;
  v248 = 0u;
  v49 = (AUOOPRenderingClient *)v48;
  v249 = (char *)v49;
  *(_QWORD *)&v250 = 0;
  *((_QWORD *)&v250 + 1) = __PAIR64__(v47, v34);
  if ((AUOOPRenderingClient::NeverTimesOut(v49) & 1) == 0)
    LOBYTE(aBlock) = 0;
  -[AUOOPRenderingClient bytes](v49, "bytes");
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(40 * (-[AUOOPRenderingClient length](v49, "length") / 0x28uLL)) >> 3) != (_DWORD)v36 + v35)
    goto LABEL_348;
  v50 = -[AUOOPRenderingClient bytes](v49, "bytes");
  v51 = -[AUOOPRenderingClient length](v49, "length");
  if (!(40 * (v51 / 0x28)))
  {
    v52 = 0;
    v53 = 0;
    goto LABEL_154;
  }
  v54 = 0;
  v55 = 0.0;
  v56 = v50 + 40 * (v51 / 0x28);
  do
  {
    if (v54 == v35)
      *(_QWORD *)&v250 = *(_QWORD *)v50;
    if (*(_DWORD *)(v50 + 8) == 1819304813 && *(_DWORD *)(v50 + 20) == 1)
    {
      v57 = *(_DWORD *)(v50 + 24);
      if (v57 == *(_DWORD *)(v50 + 16))
      {
        v58 = *(_DWORD *)(v50 + 32);
        if (v57 >= v58 >> 3)
        {
          v59 = *(_DWORD *)(v50 + 28);
          if (v59)
          {
            v60 = *(_DWORD *)(v50 + 12);
            if ((v60 & 0x20) != 0 || (v63 = v57 == v57 / v59 * v59, v57 /= v59, v63))
            {
              v61 = 0;
              if ((v60 & 2) == 0 && 8 * v57 == v58)
              {
                if ((v60 & 1) != 0)
                {
                  if ((v60 & 0x1F84) != 0)
                    goto LABEL_148;
                  if (v57 == 4)
                    v61 = 1;
                  else
                    v61 = 4 * (v57 == 8);
                }
                else if ((v60 & 4) != 0)
                {
                  v62 = (v60 >> 7) & 0x3F;
                  if (v62 == 24 && v57 == 4)
                  {
                    v61 = 3;
                  }
                  else if (v62 || v57 != 4)
                  {
                    v63 = v57 == 2 && v62 == 0;
                    if (v63)
                      v61 = 2;
                    else
                      v61 = 0;
                  }
                  else
                  {
                    v61 = 5;
                  }
                }
                else
                {
                  v61 = 0;
                }
              }
              v64 = (*(_DWORD *)(v50 + 12) & 0x20) == 0;
              v225 = v49;
              if (v54 >= v35)
              {
                v67 = v248;
                if ((unint64_t)v248 >= *((_QWORD *)&v248 + 1))
                {
                  v219 = (*(_DWORD *)(v50 + 12) & 0x20) == 0;
                  v221 = v61;
                  v73 = *((_QWORD *)&v247 + 1);
                  v216 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v248 - *((_QWORD *)&v247 + 1)) >> 2);
                  v74 = v216 + 1;
                  if (v216 + 1 > 0x1555555555555555)
LABEL_354:
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  if (0x5555555555555556 * ((uint64_t)(*((_QWORD *)&v248 + 1) - *((_QWORD *)&v247 + 1)) >> 2) > v74)
                    v74 = 0x5555555555555556 * ((uint64_t)(*((_QWORD *)&v248 + 1) - *((_QWORD *)&v247 + 1)) >> 2);
                  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v248 + 1) - *((_QWORD *)&v247 + 1)) >> 2) >= 0xAAAAAAAAAAAAAAALL)
                    v75 = 0x1555555555555555;
                  else
                    v75 = v74;
                  if (v75)
                    v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<auoop::RenderPipeConfig::CompactFormat>>(v75);
                  else
                    v76 = 0;
                  v81 = v75 + 12 * v216;
                  *(_DWORD *)v81 = v221;
                  *(_DWORD *)(v81 + 4) = v59;
                  *(_BYTE *)(v81 + 8) = v219;
                  *(_WORD *)(v81 + 9) = 0;
                  *(_BYTE *)(v81 + 11) = 0;
                  v82 = v81;
                  if (v67 != v73)
                  {
                    do
                    {
                      v83 = *(_QWORD *)(v67 - 12);
                      v67 -= 12;
                      v84 = *(_DWORD *)(v67 + 8);
                      *(_QWORD *)(v82 - 12) = v83;
                      v82 -= 12;
                      *(_DWORD *)(v82 + 8) = v84;
                    }
                    while (v67 != v73);
                    v67 = *((_QWORD *)&v247 + 1);
                  }
                  v68 = v81 + 12;
                  *((_QWORD *)&v247 + 1) = v82;
                  *((_QWORD *)&v248 + 1) = v75 + 12 * v76;
                  if (v67)
                    operator delete((void *)v67);
                }
                else
                {
                  *(_DWORD *)v248 = v61;
                  *(_DWORD *)(v67 + 4) = v59;
                  *(_BYTE *)(v67 + 8) = v64;
                  *(_WORD *)(v67 + 9) = 0;
                  v68 = v67 + 12;
                  *(_BYTE *)(v67 + 11) = 0;
                }
                *(_QWORD *)&v248 = v68;
              }
              else
              {
                v65 = *((_QWORD *)&v246 + 1);
                if (*((_QWORD *)&v246 + 1) >= (unint64_t)v247)
                {
                  v218 = (*(_DWORD *)(v50 + 12) & 0x20) == 0;
                  v220 = v61;
                  v69 = v246;
                  v215 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v246 + 1) - v246) >> 2);
                  v70 = v215 + 1;
                  if (v215 + 1 > 0x1555555555555555)
                    goto LABEL_354;
                  if (0x5555555555555556 * ((uint64_t)(v247 - v246) >> 2) > v70)
                    v70 = 0x5555555555555556 * ((uint64_t)(v247 - v246) >> 2);
                  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v247 - v246) >> 2) >= 0xAAAAAAAAAAAAAAALL)
                    v71 = 0x1555555555555555;
                  else
                    v71 = v70;
                  if (v71)
                    v71 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<auoop::RenderPipeConfig::CompactFormat>>(v71);
                  else
                    v72 = 0;
                  v77 = v71 + 12 * v215;
                  *(_DWORD *)v77 = v220;
                  *(_DWORD *)(v77 + 4) = v59;
                  *(_BYTE *)(v77 + 8) = v218;
                  *(_WORD *)(v77 + 9) = 0;
                  *(_BYTE *)(v77 + 11) = 0;
                  v78 = v77;
                  if (v65 != v69)
                  {
                    do
                    {
                      v79 = *(_QWORD *)(v65 - 12);
                      v65 -= 12;
                      v80 = *(_DWORD *)(v65 + 8);
                      *(_QWORD *)(v78 - 12) = v79;
                      v78 -= 12;
                      *(_DWORD *)(v78 + 8) = v80;
                    }
                    while (v65 != v69);
                    v65 = v246;
                  }
                  v66 = v77 + 12;
                  *(_QWORD *)&v246 = v78;
                  *(_QWORD *)&v247 = v71 + 12 * v72;
                  if (v65)
                    operator delete((void *)v65);
                }
                else
                {
                  **((_DWORD **)&v246 + 1) = v61;
                  *(_DWORD *)(v65 + 4) = v59;
                  *(_BYTE *)(v65 + 8) = v64;
                  *(_WORD *)(v65 + 9) = 0;
                  v66 = v65 + 12;
                  *(_BYTE *)(v65 + 11) = 0;
                }
                *((_QWORD *)&v246 + 1) = v66;
              }
              v49 = v225;
            }
          }
        }
      }
    }
LABEL_148:
    if (v55 == 0.0)
    {
      v55 = *(double *)v50;
    }
    else if (*(double *)v50 != v55)
    {
      LOBYTE(aBlock) = 0;
    }
    ++v54;
    v50 += 40;
  }
  while (v50 != v56);
  v52 = (const void *)*((_QWORD *)&v247 + 1);
  v53 = v248;
LABEL_154:
  if (0xAAAAAAAAAAAAAAABLL * ((v53 - (uint64_t)v52) >> 2) > 1)
    LOBYTE(aBlock) = 0;

  v85 = (void *)*((_QWORD *)self + 72);
  v217 = -[AUAudioUnit musicalContextBlock](self, "musicalContextBlock");
  v214 = -[AUAudioUnit transportStateBlock](self, "transportStateBlock");
  v213 = -[AUAudioUnit MIDIOutputEventBlock](self, "MIDIOutputEventBlock");
  v212 = -[AUAudioUnit MIDIOutputEventListBlock](self, "MIDIOutputEventListBlock");
  v211 = -[AUAudioUnit isRenderingOffline](self, "isRenderingOffline");
  -[AUAudioUnit componentDescription](self, "componentDescription");
  v210 = *(_DWORD *)v251 == 1635085673;
  v86 = *((_QWORD *)self + 109);
  std::recursive_mutex::lock((std::recursive_mutex *)v86);
  v226 = (uint64_t *)(v86 + 64);
  v87 = *(uint64_t **)(v86 + 80);
  v88 = *(uint64_t **)(v86 + 88);
  v229 = (std::recursive_mutex *)v86;
  if (v87 == v88)
  {
LABEL_176:
    v222 = v85;
    v96 = *v226;
    v97 = operator new();
    v251[0] = (_BYTE)aBlock;
    memset(&v251[8], 0, 24);
    std::vector<auoop::RenderPipeConfig::CompactFormat>::__init_with_size[abi:ne180100]<auoop::RenderPipeConfig::CompactFormat*,auoop::RenderPipeConfig::CompactFormat*>(&v251[8], (const void *)v246, *((uint64_t *)&v246 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v246 + 1) - v246) >> 2));
    memset(v252, 0, 24);
    std::vector<auoop::RenderPipeConfig::CompactFormat>::__init_with_size[abi:ne180100]<auoop::RenderPipeConfig::CompactFormat*,auoop::RenderPipeConfig::CompactFormat*>(v252, v52, v53, 0xAAAAAAAAAAAAAAABLL * ((v53 - (uint64_t)v52) >> 2));
    v98 = v249;
    *(_OWORD *)&v252[32] = v250;
    *(_QWORD *)v97 = v96;
    *(_BYTE *)(v97 + 8) = v251[0];
    *(_OWORD *)(v97 + 16) = *(_OWORD *)&v251[8];
    *(_QWORD *)(v97 + 32) = *(_QWORD *)&v251[24];
    memset(&v251[8], 0, 24);
    *(_OWORD *)(v97 + 40) = *(_OWORD *)v252;
    v99 = *(_QWORD *)&v252[16];
    memset(v252, 0, 32);
    *(_QWORD *)(v97 + 56) = v99;
    *(_QWORD *)(v97 + 64) = v98;
    *(_OWORD *)(v97 + 72) = v250;
    *(_QWORD *)(v97 + 88) = 0;
    v100 = std::thread::hardware_concurrency();
    if (v100 <= 256)
      v101 = 256;
    else
      v101 = v100;
    *(_DWORD *)(v97 + 96) = v101;
    caulk::semaphore::semaphore((caulk::semaphore *)(v97 + 100));
    *(_QWORD *)(v97 + 120) = 0;
    *(_QWORD *)(v97 + 128) = 0;
    *(_QWORD *)(v97 + 136) = 0;
    v102 = (uint64_t *)(v97 + 136);
    v103 = *(int *)(v97 + 96);
    if ((_DWORD)v103)
    {
      if ((v103 & 0x80000000) != 0)
        goto LABEL_351;
      v256[0] = v97 + 136;
      *(_QWORD *)buf = std::__allocate_at_least[abi:ne180100]<std::allocator<KVOAggregator::Record>>(v103);
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      *(_QWORD *)&buf[16] = *(_QWORD *)buf;
      v255 = (char *)(*(_QWORD *)buf + 32 * v104);
      std::vector<auoop::PipeSubPool::PipeSlot>::__swap_out_circular_buffer((uint64_t *)(v97 + 120), buf);
      std::__split_buffer<auoop::PipeSubPool::PipeSlot>::~__split_buffer((uint64_t)buf);
      v103 = *(int *)(v97 + 96);
      v105 = *(_QWORD *)(v97 + 120);
      v106 = *(char **)(v97 + 128);
    }
    else
    {
      v105 = 0;
      v106 = 0;
    }
    v107 = (uint64_t)&v106[-v105] >> 5;
    if (v103 <= v107)
    {
      if (v103 < v107)
      {
        v116 = (char *)(v105 + 32 * v103);
        while (v106 != v116)
        {
          v117 = *((_QWORD *)v106 - 3);
          *((_QWORD *)v106 - 3) = 0;
          if (v117)
            std::default_delete<AUOOPRenderingClient>::operator()[abi:ne180100](v117);
          v106 -= 32;
        }
        *(_QWORD *)(v97 + 128) = v116;
      }
      goto LABEL_200;
    }
    v108 = v103 - v107;
    v109 = *v102;
    if (v103 - v107 <= (*v102 - (uint64_t)v106) >> 5)
    {
      bzero(v106, 32 * v108);
      *(_QWORD *)(v97 + 128) = &v106[32 * v108];
LABEL_200:
      v87 = *(uint64_t **)&v229[1].__m_.__opaque[16];
      v118 = *(_QWORD *)&v229[1].__m_.__opaque[24];
      v85 = v222;
      if ((unint64_t)v87 >= v118)
      {
        v120 = *(uint64_t **)&v229[1].__m_.__opaque[8];
        v121 = v87 - v120;
        v122 = v121 + 1;
        if ((unint64_t)(v121 + 1) >> 61)
          std::vector<float>::__throw_length_error[abi:ne180100]();
        v123 = v118 - (_QWORD)v120;
        if (v123 >> 2 > v122)
          v122 = v123 >> 2;
        if ((unint64_t)v123 >= 0x7FFFFFFFFFFFFFF8)
          v124 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v124 = v122;
        if (v124)
        {
          if (v124 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v125 = (char *)operator new(8 * v124);
          v120 = *(uint64_t **)&v229[1].__m_.__opaque[8];
          v87 = *(uint64_t **)&v229[1].__m_.__opaque[16];
        }
        else
        {
          v125 = 0;
        }
        v127 = &v125[8 * v124];
        v126 = (uint64_t *)&v125[8 * v121];
        *v126 = v97;
        v119 = v126 + 1;
        v128 = v126;
        if (v87 != v120)
        {
          v128 = v126;
          do
          {
            v129 = *--v87;
            *v87 = 0;
            *--v128 = v129;
          }
          while (v87 != v120);
        }
        v130 = *(_QWORD **)&v229[1].__m_.__opaque[8];
        v131 = *(_QWORD **)&v229[1].__m_.__opaque[16];
        *(_QWORD *)&v229[1].__m_.__opaque[8] = v128;
        *(_QWORD *)&v229[1].__m_.__opaque[16] = v119;
        *(_QWORD *)&v229[1].__m_.__opaque[24] = v127;
        while (v131 != v130)
        {
          v133 = *--v131;
          v132 = v133;
          *v131 = 0;
          if (v133)
            std::default_delete<auoop::PipeSubPool>::operator()[abi:ne180100](v132);
        }
        if (v130)
          operator delete(v130);
        v87 = v126;
      }
      else
      {
        *v87 = v97;
        v119 = v87 + 1;
      }
      *(_QWORD *)&v229[1].__m_.__opaque[16] = v119;
      goto LABEL_223;
    }
    if (!(v103 >> 59))
    {
      v256[0] = v97 + 136;
      v110 = v109 - v105;
      v111 = v110 >> 4;
      if (v110 >> 4 <= v103)
        v111 = v103;
      if ((unint64_t)v110 >= 0x7FFFFFFFFFFFFFE0)
        v112 = 0x7FFFFFFFFFFFFFFLL;
      else
        v112 = v111;
      v113 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<KVOAggregator::Record>>(v112);
      v114 = &v113[32 * v107];
      *(_QWORD *)buf = v113;
      *(_QWORD *)&buf[8] = v114;
      v255 = &v113[32 * v115];
      bzero(v114, 32 * v108);
      *(_QWORD *)&buf[16] = &v114[32 * v108];
      std::vector<auoop::PipeSubPool::PipeSlot>::__swap_out_circular_buffer((uint64_t *)(v97 + 120), buf);
      std::__split_buffer<auoop::PipeSubPool::PipeSlot>::~__split_buffer((uint64_t)buf);
      goto LABEL_200;
    }
LABEL_351:
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  while (2)
  {
    v89 = *v87;
    if (!*(_BYTE *)(*v87 + 8))
      goto LABEL_175;
    v91 = *(_QWORD *)(v89 + 16);
    v90 = *(_QWORD *)(v89 + 24);
    if (v90 - v91 != *((_QWORD *)&v246 + 1) - (_QWORD)v246)
      goto LABEL_175;
    if (v91 != v90)
    {
      v92 = v246;
      while (*(_DWORD *)v91 == *(_DWORD *)v92
           && *(_DWORD *)(v91 + 4) == *(_DWORD *)(v92 + 4)
           && *(unsigned __int8 *)(v91 + 8) == *(unsigned __int8 *)(v92 + 8))
      {
        v91 += 12;
        v92 += 12;
        if (v91 == v90)
          goto LABEL_165;
      }
LABEL_175:
      if (++v87 == v88)
        goto LABEL_176;
      continue;
    }
    break;
  }
LABEL_165:
  v94 = *(_QWORD *)(v89 + 40);
  v93 = *(_QWORD *)(v89 + 48);
  if (v93 - v94 != v53 - (_QWORD)v52)
    goto LABEL_175;
  if (v94 != v93)
  {
    v95 = v52;
    while (*(_DWORD *)v94 == *v95
         && *(_DWORD *)(v94 + 4) == v95[1]
         && *(unsigned __int8 *)(v94 + 8) == *((unsigned __int8 *)v95 + 8))
    {
      v94 += 12;
      v95 += 3;
      if (v94 == v93)
        goto LABEL_172;
    }
    goto LABEL_175;
  }
LABEL_172:
  if (*(double *)(v89 + 72) != *(double *)&v250
    || *(_DWORD *)(v89 + 80) < DWORD2(v250)
    || *(_DWORD *)(v89 + 84) < HIDWORD(v250))
  {
    goto LABEL_175;
  }
  if (v87 == v88)
    goto LABEL_176;
LABEL_223:
  v134 = *v87;
  v135 = v85;
  v136 = v135;
  v137 = *(_DWORD *)(v134 + 88);
  v138 = *(_DWORD *)(v134 + 92);
  *(_DWORD *)(v134 + 88) = v137 + 1;
  if (*(_DWORD *)(v134 + 96) > v137)
    v139 = v137 + 1;
  else
    v139 = *(_DWORD *)(v134 + 96);
  v223 = v135;
  if (v138 >= v139)
  {
LABEL_312:

    v186 = objc_msgSend(*(id *)&v229[2].__m_.__opaque[48], "count");
    v187 = (auoop *)objc_msgSend(*(id *)&v229[2].__m_.__opaque[48], "addObject:", v223);
    if (v186)
    {
LABEL_321:
      *(_QWORD *)&v251[16] = v223;
      *(_QWORD *)&v251[24] = v217;
      *(_QWORD *)v252 = v214;
      *(_QWORD *)&v252[8] = v213;
      *(_QWORD *)&v252[16] = v212;
      *(_DWORD *)&v252[24] = v228;
      v252[28] = v211;
      v252[29] = v210;
      *(_WORD *)&v252[30] = v231;
      v252[32] = 0;
      *(_QWORD *)v251 = 0;
      *(_QWORD *)&v251[8] = self;
      v239 = (void (**)(_QWORD, _QWORD))v134;
      *(_QWORD *)&v240 = self;
      *((_QWORD *)&v240 + 1) = v223;
      *(_QWORD *)&v241 = v217;
      *((_QWORD *)&v241 + 1) = v214;
      *(_QWORD *)v242 = v213;
      *(_QWORD *)&v242[8] = v212;
      *(_DWORD *)&v242[16] = v228;
      v242[20] = v211;
      v242[21] = v210;
      *(_WORD *)&v242[22] = v231;
      v243 = 0;
      v244 = 1;
      auoop::RenderPipeUser::~RenderPipeUser((auoop::RenderPipeUser *)v251);
      v184 = v229;
      goto LABEL_322;
    }
    v188 = auoop::gWorkgroupManager(v187);
    v189 = (os_unfair_lock_s **)&v229[1].__m_.__opaque[32];
    if (v229[2].__m_.__opaque[40])
    {
      auoop::WorkgroupPropagator::~WorkgroupPropagator(v189);
      v229[2].__m_.__opaque[40] = 0;
    }
    *(_QWORD *)v251 = &off_1E2915F48;
    *(_QWORD *)&v251[8] = v226;
    *(_QWORD *)&v251[24] = v251;
    auoop::WorkgroupPropagator::WorkgroupPropagator((uint64_t)v189, v188, (uint64_t)v251);
    v190 = *(_QWORD **)&v251[24];
    if (*(_BYTE **)&v251[24] == v251)
    {
      v191 = 4;
      v190 = v251;
    }
    else
    {
      if (!*(_QWORD *)&v251[24])
      {
LABEL_320:
        v229[2].__m_.__opaque[40] = 1;
        goto LABEL_321;
      }
      v191 = 5;
    }
    (*(void (**)(void))(*v190 + 8 * v191))();
    goto LABEL_320;
  }
LABEL_227:
  v141 = *(_QWORD *)(v134 + 120);
  v140 = *(_QWORD *)(v134 + 128);
  while (1)
  {
    if (v141 == v140)
      goto LABEL_227;
    if (!*(_QWORD *)(v141 + 8))
    {
      do
        v142 = __ldaxr((unsigned __int8 *)v141);
      while (__stlxr(1u, (unsigned __int8 *)v141));
      if ((v142 & 1) == 0)
        break;
    }
    v141 += 32;
  }
  *(_QWORD *)(v141 + 24) = pthread_self();
  v143 = objc_msgSend(*(id *)(v134 + 64), "bytes");
  v144 = objc_msgSend(*(id *)(v134 + 64), "length");
  v235[0] = v143;
  v235[1] = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(40 * (v144 / 0x28)) >> 3);
  v235[2] = *(_QWORD *)(v134 + 80);
  v145 = v136;
  v204 = v145;
  v146 = operator new();
  *(_BYTE *)v146 = 0;
  *(_BYTE *)(v146 + 1) = AUOOPRenderingClient::NeverTimesOut((AUOOPRenderingClient *)v146);
  *(_BYTE *)(v146 + 2) = 0;
  v147 = AUOOPSharedMemory::InitializationParams::requiredByteSize((AUOOPSharedMemory::InitializationParams *)v235);
  MEMORY[0x193FFDCBC](v146 + 8, v147 + 16, 0);
  *(_QWORD *)(v146 + 32) = caulk::ipc::mapped_memory::get_raw_ptr((caulk::ipc::mapped_memory *)(v146 + 8), 0);
  *(_QWORD *)(v146 + 40) = caulk::ipc::mapped_memory::get_raw_ptr((caulk::ipc::mapped_memory *)(v146 + 8), 0) + 8;
  *(_QWORD *)(v146 + 48) = caulk::ipc::mapped_memory::get_raw_ptr((caulk::ipc::mapped_memory *)(v146 + 8), 0x10uLL);
  *(_WORD *)(v146 + 56) = 1;
  *(_QWORD *)(v146 + 64) = os_eventlink_create();
  *(_DWORD *)(v146 + 72) = 0;
  atomic_store(1u, *(unsigned int **)(v146 + 32));
  atomic_store(0, *(unsigned int **)(v146 + 40));
  *(_QWORD *)(v146 + 80) = 0;
  v148 = *(_DWORD **)(v146 + 48);
  v149 = *(_QWORD *)(v146 + 16) - 16;
  *(_BYTE *)(v146 + 104) = 0;
  *(_BYTE *)(v146 + 136) = 0;
  *(_QWORD *)(v146 + 88) = 0;
  *(_QWORD *)(v146 + 96) = 0;
  AUOOPSharedMemory::init2(v146 + 80, (AUOOPSharedMemory::InitializationParams *)v235, v148, v149);
  *(_DWORD *)(v146 + 144) = 0;
  *(_QWORD *)(v146 + 152) = 0;
  caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)(v146 + 160));
  caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)(v146 + 164));
  *(_OWORD *)(v146 + 212) = 0u;
  *(_OWORD *)(v146 + 200) = 0u;
  *(_OWORD *)(v146 + 184) = 0u;
  *(_OWORD *)(v146 + 168) = 0u;
  *(_QWORD *)(v146 + 232) = 0xC1E0000000000000;
  *(_DWORD *)(v146 + 240) = 0;
  if (initInterAppAudioLogging::once != -1)
    dispatch_once(&initInterAppAudioLogging::once, &__block_literal_global_10577);
  if (!gCADefaultDeferredLog && gDefaultDeferredLogOnce != -1)
    dispatch_once(&gDefaultDeferredLogOnce, &__block_literal_global_4295);
  audioipc::eventlink_primitive::activate();
  *(_QWORD *)buf = &off_1E2916458;
  *(_QWORD *)&buf[8] = v251;
  v255 = buf;
  v150 = v145;
  *(_QWORD *)v251 = v150;
  v151 = (uint64_t)v255;
  if (v255)
  {
    if (v255 != buf)
    {
      v151 = (*(uint64_t (**)(void))(*(_QWORD *)v255 + 16))();
      goto LABEL_239;
    }
    *(_QWORD *)v252 = &v251[8];
    (*(void (**)(_BYTE *))(*(_QWORD *)buf + 24))(buf);
  }
  else
  {
LABEL_239:
    *(_QWORD *)v252 = v151;
  }
  v208 = v150;

  v152 = v255;
  if (v255 == buf)
  {
    v153 = 4;
    v152 = buf;
LABEL_245:
    (*(void (**)(void))(*(_QWORD *)v152 + 8 * v153))();
  }
  else if (v255)
  {
    v153 = 5;
    goto LABEL_245;
  }
  *(_QWORD *)&v252[8] = 0;
  *(_DWORD *)&v252[16] = 0;
  v154 = *(id **)v252;
  if (!*(_QWORD *)v252)
  {
    v259 = 0;
    v155 = *(void **)v251;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3321888768;
    *(_QWORD *)&buf[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJjEE10sync_proxyEv_block_invoke;
    v255 = (char *)&__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJjEEEEEE_e17_v16__0__NSError_8l;
    v156 = (id *)v256;
    goto LABEL_254;
  }
  if (*(_BYTE **)v252 == &v251[8])
  {
    v259 = v258;
    (*(void (**)(_BYTE *, id *))(*(_QWORD *)&v251[8] + 24))(&v251[8], v258);
    v154 = v259;
  }
  else
  {
    v154 = (id *)(*(uint64_t (**)(void))(**(_QWORD **)v252 + 16))();
    v259 = v154;
  }
  v155 = *(void **)v251;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJjEE10sync_proxyEv_block_invoke;
  v255 = (char *)&__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJjEEEEEE_e17_v16__0__NSError_8l;
  v156 = (id *)v256;
  if (v154)
  {
    if (v154 != v258)
    {
      v154 = (id *)(*((uint64_t (**)(id *))*v154 + 2))(v154);
      goto LABEL_254;
    }
    v257 = (id *)v256;
    (*((void (**)(id *, _QWORD *))v258[0] + 3))(v258, v256);
  }
  else
  {
LABEL_254:
    v257 = v154;
  }
  objc_msgSend(v155, "synchronousRemoteObjectProxyWithErrorHandler:", buf, v204);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  if (v257 == v256)
  {
    v157 = 4;
LABEL_259:
    (*((void (**)(id *))*v156 + v157))(v156);
  }
  else if (v257)
  {
    v157 = 5;
    v156 = v257;
    goto LABEL_259;
  }
  v158 = v259;
  if (v259 == v258)
  {
    v159 = 4;
    v158 = v258;
LABEL_264:
    (*((void (**)(void))*v158 + v159))();
  }
  else if (v259)
  {
    v159 = 5;
    goto LABEL_264;
  }
  v160 = getpid();
  v207 = *(_QWORD *)(v134 + 64);
  v205 = *(_DWORD *)(v134 + 84);
  v206 = *(_DWORD *)(v134 + 80);
  audioipc::eventlink_primitive::ipc_resources((audioipc::eventlink_primitive *)&v236, v146 + 64);
  caulk::ipc::mapped_memory::create_xpc_object((caulk::ipc::mapped_memory *)(v146 + 8));
  v161 = v237;
  v238 = v161;
  if (!v161)
    v238 = xpc_null_create();

  *(_QWORD *)buf = &v236;
  *(_QWORD *)&buf[8] = "sharedMemory";
  applesauce::xpc::dict::object_proxy::operator=(v258, (uint64_t)buf, &v238);

  caulk::mach::details::release_os_object(v237, v162);
  v163 = v236;
  v164 = *(id **)v252;
  if (!*(_QWORD *)v252)
  {
    v259 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3321888768;
    *(_QWORD *)&buf[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJjEE5replyEv_block_invoke;
    v255 = (char *)&__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJjEEEEEE_e20_v20__0__NSError_8I16l;
    v165 = (id *)v256;
    goto LABEL_275;
  }
  if (*(_BYTE **)v252 == &v251[8])
  {
    v259 = v258;
    (*(void (**)(_BYTE *, id *))(*(_QWORD *)&v251[8] + 24))(&v251[8], v258);
    v164 = v259;
  }
  else
  {
    v164 = (id *)(*(uint64_t (**)(void))(**(_QWORD **)v252 + 16))();
    v259 = v164;
  }
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJjEE5replyEv_block_invoke;
  v255 = (char *)&__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJjEEEEEE_e20_v20__0__NSError_8I16l;
  v165 = (id *)v256;
  if (v164)
  {
    if (v164 != v258)
    {
      v164 = (id *)(*((uint64_t (**)(id *))*v164 + 2))(v164);
      goto LABEL_275;
    }
    v257 = (id *)v256;
    (*((void (**)(id *, _QWORD *))v258[0] + 3))(v258, v256);
  }
  else
  {
LABEL_275:
    v257 = v164;
  }
  v166 = _Block_copy(buf);
  if (v257 == v256)
  {
    v167 = 4;
LABEL_280:
    (*((void (**)(id *))*v165 + v167))(v165);
  }
  else if (v257)
  {
    v167 = 5;
    v165 = v257;
    goto LABEL_280;
  }
  v168 = v259;
  if (v259 == v258)
  {
    v169 = 4;
    v168 = v258;
LABEL_285:
    (*((void (**)(void))*v168 + v169))();
  }
  else if (v259)
  {
    v169 = 5;
    goto LABEL_285;
  }
  objc_msgSend(v209, "createRenderPipe:formats:maxFrames:midiOutSizeHint:resources:reply:", v160, v207, v206, v205, v163, v166);

  v170 = v236;
  v236 = 0;

  v171 = *(id *)&v252[8];
  v172 = v171;
  if (v171)
  {
    v173 = 0;
    v174 = v146;
    v146 = (uint64_t)v171;
    goto LABEL_299;
  }
  v175 = *(_DWORD *)&v252[16];
  if (kAUExtensionScope)
  {
    v176 = *(id *)kAUExtensionScope;
    if (!v176)
      goto LABEL_297;
  }
  else
  {
    v176 = MEMORY[0x1E0C81028];
    v177 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AUOOPRenderPipePool.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 170;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v175;
    _os_log_impl(&dword_18EE07000, v176, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Host obtained render pipe %d", buf, 0x18u);
  }

LABEL_297:
  if (*(_BYTE *)v146)
LABEL_348:
    std::terminate();
  v174 = 0;
  v178 = -1431655765 * ((*(_QWORD *)(v134 + 48) - *(_QWORD *)(v134 + 40)) >> 2);
  v179 = *(_DWORD *)(v134 + 80);
  v180 = *(_QWORD *)(v134 + 72);
  *(_DWORD *)(v146 + 216) = -1431655765 * ((*(_QWORD *)(v134 + 24) - *(_QWORD *)(v134 + 16)) >> 2);
  *(_DWORD *)(v146 + 220) = v178;
  *(_DWORD *)(v146 + 144) = v175;
  *(_DWORD *)(v146 + 224) = v179;
  *(_QWORD *)(v146 + 152) = v180;
  v173 = 1;
  *(_BYTE *)v146 = 1;
LABEL_299:
  v233 = v146;
  v234 = v173;

  v181 = &v251[8];
  if (*(_BYTE **)v252 == &v251[8])
  {
    v182 = 4;
LABEL_303:
    (*(void (**)(void))(*v181 + 8 * v182))();
  }
  else if (*(_QWORD *)v252)
  {
    v182 = 5;
    v181 = *(_QWORD **)v252;
    goto LABEL_303;
  }

  if (v174)
    std::default_delete<AUOOPRenderingClient>::operator()[abi:ne180100](v174);

  if (!v172)
  {
    v233 = 0;
    v185 = *(_QWORD *)(v141 + 8);
    *(_QWORD *)(v141 + 8) = v146;
    if (v185)
      std::default_delete<AUOOPRenderingClient>::operator()[abi:ne180100](v185);
    __dmb(0xBu);
    atomic_store(0, (unsigned __int8 *)v141);
    caulk::__expected_detail::base<std::unique_ptr<AUOOPRenderingClient>,NSError * {__strong}>::~base((uint64_t)&v233);
    v136 = v223;
    caulk::semaphore::signal((caulk::semaphore *)(v134 + 100));
    ++*(_DWORD *)(v134 + 92);
    goto LABEL_312;
  }
  v183 = (id)v146;
  caulk::__expected_detail::base<std::unique_ptr<AUOOPRenderingClient>,NSError * {__strong}>::~base((uint64_t)&v233);

  v239 = (void (**)(_QWORD, _QWORD))v183;
  v244 = 0;
  v184 = v229;
  if (!v229)
  {
    v5 = 0;
    goto LABEL_325;
  }
LABEL_322:
  std::recursive_mutex::unlock(v184);
  v5 = v244 != 0;
  if (v244)
  {
    v192 = (void **)((char *)self + 888);
    if (*((_BYTE *)self + 960))
    {
      v193 = *v192;
      v194 = v239;
      v195 = v241;
      *((_OWORD *)self + 56) = v240;
      *((_OWORD *)self + 57) = v195;
      *((_OWORD *)self + 58) = *(_OWORD *)v242;
      *(_QWORD *)((char *)self + 942) = *(_QWORD *)&v242[14];
    }
    else
    {
      v193 = 0;
      v194 = v239;
      v198 = v241;
      *((_OWORD *)self + 56) = v240;
      *((_OWORD *)self + 57) = v198;
      *((_OWORD *)self + 58) = *(_OWORD *)v242;
      *((_QWORD *)self + 118) = *(_QWORD *)&v242[16];
      *((_BYTE *)self + 952) = 0;
      *((_BYTE *)self + 960) = 1;
    }
    v239 = (void (**)(_QWORD, _QWORD))v193;
    *v192 = v194;
    v199 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
    AURegistrationServerConnection::WakeExtension((AURegistrationServerConnection *)*(unsigned int *)(v199 + 48), *((_DWORD *)self + 182), 2);
    goto LABEL_337;
  }
LABEL_325:
  v196 = v239;
  if (!kAUExtensionScope)
  {
    v197 = (id)MEMORY[0x1E0C81028];
    v200 = MEMORY[0x1E0C81028];
    goto LABEL_331;
  }
  v197 = *(id *)kAUExtensionScope;
  if (v197)
  {
LABEL_331:
    v201 = v197;
    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v196, "description");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v251 = 136315650;
      *(_QWORD *)&v251[4] = "AUAudioUnit_XPC.mm";
      *(_WORD *)&v251[12] = 1024;
      *(_DWORD *)&v251[14] = 812;
      *(_WORD *)&v251[18] = 2112;
      *(_QWORD *)&v251[20] = v202;
      _os_log_impl(&dword_18EE07000, v201, OS_LOG_TYPE_ERROR, "%25s:%-5d render pipe user creation failure (%@)", v251, 0x1Cu);

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease(v196);
  -[AUAudioUnit deallocateRenderResources](self, "deallocateRenderResources");

LABEL_337:
  caulk::__expected_detail::base<auoop::RenderPipeUser,NSError * {__strong}>::~base((auoop::RenderPipeUser *)&v239);

  if (*((_QWORD *)&v247 + 1))
    operator delete(*((void **)&v247 + 1));
  if ((_QWORD)v246)
    operator delete((void *)v246);
  if (__p)
    operator delete(__p);
LABEL_343:
  v37 = v230;
LABEL_344:

  return v5;
}

- (void)internalDeallocateRenderResources
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  objc_super v8;
  void *v9;
  _BYTE v10[24];
  _BYTE *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
  AURegistrationServerConnection::WakeExtension((AURegistrationServerConnection *)*(unsigned int *)(v3 + 48), *((_DWORD *)self + 182), 3);
  if (*((_BYTE *)self + 960))
  {
    auoop::RenderPipeUser::~RenderPipeUser((auoop::RenderPipeUser *)((char *)self + 888));
    *(_BYTE *)(v4 + 72) = 0;
  }
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v9, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uninitialize:", &__block_literal_global_153);

  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit internalDeallocateRenderResources](&v8, sel_internalDeallocateRenderResources);

  v6 = v11;
  if (v11 == v10)
  {
    v7 = 4;
    v6 = v10;
    goto LABEL_7;
  }
  if (v11)
  {
    v7 = 5;
LABEL_7:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }

}

- (void)remoteReset
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD *v9;
  void *v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*((_QWORD *)self + 72);
  v8[0] = &off_1E2913638;
  v8[1] = &__block_literal_global_156;
  v9 = v8;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v10, v2, (uint64_t)v8);
  v3 = v9;
  if (v9 == v8)
  {
    v4 = 4;
    v3 = v8;
  }
  else
  {
    if (!v9)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset:", &__block_literal_global_157);

  v6 = v12;
  if (v12 == v11)
  {
    v7 = 4;
    v6 = v11;
    goto LABEL_10;
  }
  if (v12)
  {
    v7 = 5;
LABEL_10:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit reset](&v3, sel_reset);
  -[AUAudioUnit_XPC remoteReset](self, "remoteReset");
}

- (id)internalRenderBlock
{
  char v3;
  void *v6;
  void *v7;
  _QWORD v10[5];
  char v11;
  int v12;

  -[AUAudioUnit componentDescription](self, "componentDescription");
  v3 = 1;
  if (v12 <= 1635085669)
  {
    if (v12 != 1635083896 && v12 != 1635084142)
      goto LABEL_15;
  }
  else if (((v12 - 1635085670) > 0xF || ((1 << (v12 - 102)) & 0x8009) == 0) && v12 != 1635086188)
  {
LABEL_15:
    v3 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__AUAudioUnit_XPC_internalRenderBlock__block_invoke;
  v10[3] = &__block_descriptor_41_e433_i60__0_I8r__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_16I24q28__AudioBufferList_I_1_AudioBuffer_II_v___36r__AURenderEvent__AURenderEventHeader___AURenderEvent_qCC__AUParameterEvent___AURenderEvent_qC_3C_IQf__AUMIDIEvent___AURenderEvent_qCCSC_3C___AUMIDIEventList___AURenderEvent_qCCC_MIDIEventList_iI_1_MIDIEventPacket_QI_64I______44___i___I__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_Iq__AudioBufferList_I_1_AudioBuffer_II_v____52l;
  v10[4] = (char *)self + 888;
  v11 = v3;
  v6 = _Block_copy(v10);
  v7 = _Block_copy(v6);

  return v7;
}

- (id)_getValueForProperty:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v15;
  _BYTE v16[24];
  _BYTE *v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_message(&v15, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_proxy(&v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::reply((uint64_t)&v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForProperty:propagateError:reply:", v6, a4 != 0, v8);

  v9 = v19;
  v10 = v9;
  if (a4)
  {
    v10 = v9;
    if (v18)
    {
      *a4 = objc_retainAutorelease(v18);
      v10 = v19;
    }
  }
  v11 = v9;

  v12 = v17;
  if (v17 == v16)
  {
    v13 = 4;
    v12 = v16;
    goto LABEL_8;
  }
  if (v17)
  {
    v13 = 5;
LABEL_8:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }

  return v11;
}

- (id)_getValueForKey:(id)a3
{
  void *v4;
  void *v5;

  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnit_XPC _getValueForProperty:error:](self, "_getValueForProperty:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setValue:(id)a3 forProperty:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[24];
  _BYTE *v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v15, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forProperty:propagateError:reply:", v8, v9, a5 != 0, v11);

  v12 = v19;
  if (v12)
    -[AUAudioUnit_XPC propertiesChanged:](self, "propertiesChanged:", v12);
  if (a5 && v18)
    *a5 = objc_retainAutorelease(v18);

  v13 = v17;
  if (v17 == v16)
  {
    v14 = 4;
    v13 = v16;
    goto LABEL_10;
  }
  if (v17)
  {
    v14 = 5;
LABEL_10:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v11;
  _BYTE v12[24];
  _BYTE *v13;
  id v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_message(&v11, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_proxy(&v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::reply((uint64_t)&v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:reply:", v4, v6);

  v7 = v15;
  v8 = v13;
  if (v13 == v12)
  {
    v9 = 4;
    v8 = v12;
    goto LABEL_5;
  }
  if (v13)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

  return v7;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  _BYTE v15[24];
  _BYTE *v16;
  id v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v14, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:reply:", v6, v7, v9);

  v10 = v18;
  if (v10)
  {
    -[AUAudioUnit_XPC propertiesChanged:](self, "propertiesChanged:", v10);
    v11 = v18;
  }
  else
  {
    v11 = 0;
  }

  v12 = v16;
  if (v16 == v15)
  {
    v13 = 4;
    v12 = v15;
    goto LABEL_8;
  }
  if (v16)
  {
    v13 = 5;
LABEL_8:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }

}

- (void)_refreshBusses:(unsigned int)a3
{
  uint64_t v3;
  void **v5;
  void *v6;
  void *v7;
  id v8;
  int *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  id v23;
  _BYTE v24[24];
  _BYTE *v25;
  id v26;
  id v27;
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void **)caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v23, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getBusses:reply:", v3, v7);

  v8 = v27;
  v9 = &OBJC_IVAR___AUAudioUnit_XPC__outputBusses;
  if ((_DWORD)v3 == 1)
    v9 = &OBJC_IVAR___AUAudioUnit_XPC__inputBusses;
  v10 = *(id *)((char *)self + *v9);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_storeWeak((id *)(v15 + 112), self);
        objc_storeWeak((id *)(v15 + 120), *((id *)self + 72));
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  objc_msgSend(v10, "replaceBusses:", v11, (_QWORD)v18);
  v16 = v25;
  if (v25 == v24)
  {
    v17 = 4;
    v16 = v24;
    goto LABEL_14;
  }
  if (v25)
  {
    v17 = 5;
LABEL_14:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }

}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  std::recursive_mutex *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  objc_super v20;
  _QWORD v21[3];
  _QWORD *v22;
  void *v23;
  _BYTE v24[24];
  _BYTE *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit_XPC addObserver:forKeyPath:options:context:](&v20, sel_addObserver_forKeyPath_options_context_, a3, v10, a5, a6);
  v11 = (std::recursive_mutex *)((char *)self + 584);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)self + 72);
  v21[0] = &off_1E2913638;
  v21[1] = &__block_literal_global_162;
  v22 = v21;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v23, v13, (uint64_t)v21);
  v14 = v22;
  if (v22 == v21)
  {
    v15 = 4;
    v14 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_6:
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addPropertyObserver:context:reply:", v12, a6, v17);

  v18 = v25;
  if (v25 == v24)
  {
    v19 = 4;
    v18 = v24;
    goto LABEL_10;
  }
  if (v25)
  {
    v19 = 5;
LABEL_10:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }

  std::recursive_mutex::unlock(v11);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  objc_super v17;
  _QWORD v18[3];
  _QWORD *v19;
  void *v20;
  _BYTE v21[24];
  _BYTE *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  *((_BYTE *)self + 754) = 1;
  v17.receiver = self;
  v17.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit_XPC removeObserver:forKeyPath:context:](&v17, sel_removeObserver_forKeyPath_context_, a3, v8, a5);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)self + 72);
  v18[0] = &off_1E2913638;
  v18[1] = &__block_literal_global_163;
  v19 = v18;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v20, v10, (uint64_t)v18);
  v11 = v19;
  if (v19 == v18)
  {
    v12 = 4;
    v11 = v18;
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_6:
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removePropertyObserver:context:reply:", v9, a5, v14);

  *((_BYTE *)self + 754) = 0;
  v15 = v22;
  if (v22 == v21)
  {
    v16 = 4;
    v15 = v21;
    goto LABEL_10;
  }
  if (v22)
  {
    v16 = 5;
LABEL_10:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 584));
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6;
  std::recursive_mutex *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[3];
  _QWORD *v18;
  void *v19;
  _BYTE v20[24];
  _BYTE *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnit_XPC;
  -[AUAudioUnit_XPC removeObserver:forKeyPath:](&v16, sel_removeObserver_forKeyPath_, a3, v6);
  if (!*((_BYTE *)self + 754))
  {
    v7 = (std::recursive_mutex *)((char *)self + 584);
    std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
    +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)self + 72);
    v17[0] = &off_1E2913638;
    v17[1] = &__block_literal_global_164;
    v18 = v17;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v19, v9, (uint64_t)v17);
    v10 = v18;
    if (v18 == v17)
    {
      v11 = 4;
      v10 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_7;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_7:
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removePropertyObserver:context:reply:", v8, 0, v13);

    v14 = v21;
    if (v21 == v20)
    {
      v15 = 4;
      v14 = v20;
    }
    else
    {
      if (!v21)
      {
LABEL_12:

        std::recursive_mutex::unlock(v7);
        goto LABEL_13;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_12;
  }
LABEL_13:

}

- (id)_getBus:(unsigned int)a3 scope:(unsigned int)a4 error:(id *)a5
{
  int *v7;
  id v8;
  void *v9;
  void *v10;

  if (a4 == 1)
  {
    v7 = &OBJC_IVAR___AUAudioUnit_XPC__inputBusses;
  }
  else
  {
    if (a4 != 2)
    {
      v8 = 0;
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10866, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v9 = 0;
        *a5 = v10;
        goto LABEL_13;
      }
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
    v7 = &OBJC_IVAR___AUAudioUnit_XPC__outputBusses;
  }
  v8 = *(id *)((char *)self + *v7);
  if (objc_msgSend(v8, "count") <= (unint64_t)a3)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10877, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v9;
}

- (void)propertiesChanged:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  std::recursive_mutex *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v12;
  v13 = (std::recursive_mutex *)((char *)self + 584);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v14 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = *(unsigned int *)(v9 + 20);
        if ((_DWORD)v10)
        {
          -[AUAudioUnit_XPC _getBus:scope:error:](self, "_getBus:scope:error:", *(unsigned int *)(v9 + 24), v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "propertyChanged:", v9);

        }
        else if ((objc_msgSend(*(id *)(v9 + 8), "isEqualToString:", CFSTR("inputBusses")) & 1) != 0)
        {
          v6 = 1;
        }
        else if ((objc_msgSend(*(id *)(v9 + 8), "isEqualToString:", CFSTR("outputBusses")) & 1) != 0)
        {
          v14 = 1;
        }
        else
        {
          if (objc_msgSend(*(id *)(v9 + 8), "isEqualToString:", CFSTR("parameterTree")))
            -[AUAudioUnit_XPC _parameterTreeChanged](self, "_parameterTreeChanged");
          -[AUAudioUnit_XPC willChangeValueForKey:](self, "willChangeValueForKey:", *(_QWORD *)(v9 + 8));
          -[AUAudioUnit_XPC didChangeValueForKey:](self, "didChangeValueForKey:", *(_QWORD *)(v9 + 8));
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);

    std::recursive_mutex::unlock(v13);
    if ((v6 & 1) != 0)
      -[AUAudioUnit_XPC _refreshBusses:](self, "_refreshBusses:", 1);
    if ((v14 & 1) != 0)
      -[AUAudioUnit_XPC _refreshBusses:](self, "_refreshBusses:", 2);
  }
  else
  {

    std::recursive_mutex::unlock(v13);
  }

}

- (id)parameterTree
{
  id *v2;
  id v3;
  id v4;
  std::mutex *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t (***v12)();
  uint64_t v13;
  _QWORD *v14;
  uint64_t (**v15)();
  id v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[3];
  _QWORD *v41;
  id v42;
  id obj;
  uint64_t (**aBlock)();
  uint64_t v45;
  void *v46;
  id *p_aBlock;
  _BYTE v48[24];
  _BYTE *v49;
  _QWORD v50[3];
  _QWORD *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = (id *)((char *)self + 968);
  v3 = (id)*((_QWORD *)self + 121);
  if (v3)
    goto LABEL_2;
  v6 = (std::mutex *)((char *)self + 760);
  std::mutex::lock((std::mutex *)((char *)self + 760));
  v4 = *v2;
  if (*v2)
  {
    v7 = v4;
LABEL_59:
    std::mutex::unlock(v6);
    return v4;
  }
  v8 = (void *)*((_QWORD *)self + 72);
  aBlock = &off_1E2916188;
  v45 = (uint64_t)&v39;
  p_aBlock = (id *)&aBlock;
  v9 = v8;
  v39 = v9;
  v10 = v40;
  v11 = (uint64_t)p_aBlock;
  if (!p_aBlock)
    goto LABEL_8;
  if (p_aBlock != (id *)&aBlock)
  {
    v11 = (*((uint64_t (**)(id *))*p_aBlock + 2))(p_aBlock);
LABEL_8:
    v41 = (_QWORD *)v11;
    goto LABEL_10;
  }
  v41 = v40;
  ((void (*)(uint64_t (***)(), _QWORD *))aBlock[3])(&aBlock, v40);
LABEL_10:

  v12 = (uint64_t (***)())p_aBlock;
  if (p_aBlock == (id *)&aBlock)
  {
    v13 = 4;
    v12 = &aBlock;
  }
  else
  {
    if (!p_aBlock)
      goto LABEL_15;
    v13 = 5;
  }
  (*v12)[v13]();
LABEL_15:
  v42 = 0;
  obj = 0;
  v14 = v41;
  v15 = (uint64_t (**)())MEMORY[0x1E0C809B0];
  if (!v41)
  {
    v51 = 0;
    v16 = v39;
    aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
    v45 = 3321888768;
    v46 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP15AUParameterTreeEE10sync_proxyEv_block_invoke;
    p_aBlock = (id *)&__block_descriptor_64_ea8_32c78_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP15AUParameterTreeEEEEEE_e17_v16__0__NSError_8l;
    v17 = v48;
LABEL_23:
    v49 = v14;
    goto LABEL_24;
  }
  if (v41 == v40)
  {
    v51 = v50;
    (*(void (**)(_QWORD *, _QWORD *))(v40[0] + 24))(v40, v50);
    v14 = v51;
  }
  else
  {
    v14 = (_QWORD *)(*(uint64_t (**)(void))(*v41 + 16))();
    v51 = v14;
  }
  v16 = v39;
  aBlock = v15;
  v45 = 3321888768;
  v46 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP15AUParameterTreeEE10sync_proxyEv_block_invoke;
  p_aBlock = (id *)&__block_descriptor_64_ea8_32c78_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP15AUParameterTreeEEEEEE_e17_v16__0__NSError_8l;
  v17 = v48;
  if (!v14)
    goto LABEL_23;
  if (v14 != v50)
  {
    v14 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
    goto LABEL_23;
  }
  v49 = v48;
  (*(void (**)(_QWORD *, _BYTE *))(v50[0] + 24))(v50, v48);
LABEL_24:
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49 == v48)
  {
    v19 = 4;
  }
  else
  {
    if (!v49)
      goto LABEL_29;
    v19 = 5;
    v17 = v49;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_29:
  v20 = v51;
  if (v51 == v50)
  {
    v21 = 4;
    v20 = v50;
  }
  else
  {
    if (!v51)
      goto LABEL_34;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_34:
  v22 = v41;
  if (!v41)
  {
    v51 = 0;
    aBlock = v15;
    v45 = 3321888768;
    v46 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP15AUParameterTreeEE5replyEv_block_invoke;
    p_aBlock = (id *)&__block_descriptor_64_ea8_32c78_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP15AUParameterTreeEEEEEE_e37_v24__0__NSError_8__AUParameterTree_16l;
    v23 = v48;
LABEL_42:
    v49 = v22;
    goto LABEL_43;
  }
  if (v41 == v40)
  {
    v51 = v50;
    (*(void (**)(_QWORD *, _QWORD *))(v40[0] + 24))(v40, v50);
    v22 = v51;
  }
  else
  {
    v22 = (_QWORD *)(*(uint64_t (**)(void))(*v41 + 16))();
    v51 = v22;
  }
  aBlock = v15;
  v45 = 3321888768;
  v46 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP15AUParameterTreeEE5replyEv_block_invoke;
  p_aBlock = (id *)&__block_descriptor_64_ea8_32c78_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP15AUParameterTreeEEEEEE_e37_v24__0__NSError_8__AUParameterTree_16l;
  v23 = v48;
  if (!v22)
    goto LABEL_42;
  if (v22 != v50)
  {
    v22 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v22 + 16))(v22);
    goto LABEL_42;
  }
  v49 = v48;
  (*(void (**)(_QWORD *, _BYTE *))(v50[0] + 24))(v50, v48);
LABEL_43:
  v24 = _Block_copy(&aBlock);
  if (v49 == v48)
  {
    v25 = 4;
  }
  else
  {
    if (!v49)
      goto LABEL_48;
    v25 = 5;
    v23 = v49;
  }
  (*(void (**)(_QWORD *))(*v23 + 8 * v25))(v23);
LABEL_48:
  v26 = v51;
  if (v51 == v50)
  {
    v27 = 4;
    v26 = v50;
  }
  else
  {
    if (!v51)
      goto LABEL_53;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_53:
  objc_msgSend(v18, "getParameterTree:", v24);

  objc_storeStrong(v2, obj);
  v28 = v42;

  if (v41 == v40)
  {
    v29 = 4;
  }
  else
  {
    if (!v41)
      goto LABEL_58;
    v29 = 5;
    v10 = v41;
  }
  (*(void (**)(_QWORD *))(*v10 + 8 * v29))(v10);
LABEL_58:

  if (v28)
    goto LABEL_59;
  objc_initWeak((id *)&aBlock, *((id *)self + 72));
  v37[0] = v15;
  v37[1] = 3221225472;
  v37[2] = __32__AUAudioUnit_XPC_parameterTree__block_invoke;
  v37[3] = &unk_1E2920830;
  objc_copyWeak(&v38, (id *)&aBlock);
  objc_msgSend(*v2, "setImplementorValueProvider:", v37);
  v35[0] = v15;
  v35[1] = 3221225472;
  v35[2] = __32__AUAudioUnit_XPC_parameterTree__block_invoke_2;
  v35[3] = &unk_1E2920858;
  objc_copyWeak(&v36, (id *)&aBlock);
  objc_msgSend(*v2, "setImplementorStringFromValueCallback:", v35);
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __32__AUAudioUnit_XPC_parameterTree__block_invoke_3;
  v33[3] = &unk_1E2920880;
  objc_copyWeak(&v34, (id *)&aBlock);
  objc_msgSend(*v2, "setImplementorValueFromStringCallback:", v33);
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __32__AUAudioUnit_XPC_parameterTree__block_invoke_4;
  v31[3] = &unk_1E29208A8;
  objc_copyWeak(&v32, (id *)&aBlock);
  objc_msgSend(*v2, "setImplementorDisplayNameWithLengthCallback:", v31);
  objc_msgSend(*v2, "setRemoteParameterSynchronizerXPCConnection:", *((_QWORD *)self + 72));
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)&aBlock);
  std::mutex::unlock(v6);
  v3 = *v2;
LABEL_2:
  v4 = v3;
  return v4;
}

- (float)getV2Parameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  float v8;
  _QWORD *v9;
  uint64_t v10;
  void *v12;
  _BYTE v13[24];
  _BYTE *v14;
  id v15;
  float v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x1E0C80C00];
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_message((uint64_t)&v12, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_proxy(&v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::reply((uint64_t)&v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getParameter:sequenceNumber:reply:", a3, v4, v7);

  v8 = v16;
  v9 = v14;
  if (v14 == v13)
  {
    v10 = 4;
    v9 = v13;
    goto LABEL_5;
  }
  if (v14)
  {
    v10 = 5;
LABEL_5:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }

  return v8;
}

- (id)parametersForOverviewWithCount:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t (***v8)();
  uint64_t v9;
  _QWORD *v10;
  uint64_t (**v11)();
  id v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v27;
  _QWORD v28[3];
  _QWORD *v29;
  id v30;
  id v31;
  uint64_t (**aBlock)();
  uint64_t v33;
  void *v34;
  uint64_t (***p_aBlock)();
  _BYTE v36[24];
  _BYTE *v37;
  _QWORD v38[3];
  _QWORD *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void *)*((_QWORD *)self + 72);
  aBlock = &off_1E29162F0;
  v33 = (uint64_t)&v27;
  p_aBlock = &aBlock;
  v5 = v4;
  v27 = v5;
  v6 = v28;
  v7 = (uint64_t)p_aBlock;
  if (!p_aBlock)
    goto LABEL_4;
  if (p_aBlock != &aBlock)
  {
    v7 = (*p_aBlock)[2]();
LABEL_4:
    v29 = (_QWORD *)v7;
    goto LABEL_6;
  }
  v29 = v28;
  ((void (*)(uint64_t (***)(), _QWORD *))aBlock[3])(&aBlock, v28);
LABEL_6:

  v8 = p_aBlock;
  if (p_aBlock == &aBlock)
  {
    v9 = 4;
    v8 = &aBlock;
  }
  else
  {
    if (!p_aBlock)
      goto LABEL_11;
    v9 = 5;
  }
  (*v8)[v9]();
LABEL_11:
  v30 = 0;
  v31 = 0;
  v10 = v29;
  v11 = (uint64_t (**)())MEMORY[0x1E0C809B0];
  if (!v29)
  {
    v39 = 0;
    v12 = v27;
    aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
    v33 = 3321888768;
    v34 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE10sync_proxyEv_block_invoke;
    p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e17_v16__0__NSError_8l;
    v13 = v36;
LABEL_19:
    v37 = v10;
    goto LABEL_20;
  }
  if (v29 == v28)
  {
    v39 = v38;
    (*(void (**)(_QWORD *, _QWORD *))(v28[0] + 24))(v28, v38);
    v10 = v39;
  }
  else
  {
    v10 = (_QWORD *)(*(uint64_t (**)(void))(*v29 + 16))();
    v39 = v10;
  }
  v12 = v27;
  aBlock = v11;
  v33 = 3321888768;
  v34 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE10sync_proxyEv_block_invoke;
  p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e17_v16__0__NSError_8l;
  v13 = v36;
  if (!v10)
    goto LABEL_19;
  if (v10 != v38)
  {
    v10 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v10 + 16))(v10);
    goto LABEL_19;
  }
  v37 = v36;
  (*(void (**)(_QWORD *, _BYTE *))(v38[0] + 24))(v38, v36);
LABEL_20:
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock, v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37 == v36)
  {
    v15 = 4;
  }
  else
  {
    if (!v37)
      goto LABEL_25;
    v15 = 5;
    v13 = v37;
  }
  (*(void (**)(_QWORD *))(*v13 + 8 * v15))(v13);
LABEL_25:
  v16 = v39;
  if (v39 == v38)
  {
    v17 = 4;
    v16 = v38;
  }
  else
  {
    if (!v39)
      goto LABEL_30;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_30:
  v18 = v29;
  if (!v29)
  {
    v39 = 0;
    aBlock = v11;
    v33 = 3321888768;
    v34 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE5replyEv_block_invoke;
    p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
    v19 = v36;
LABEL_38:
    v37 = v18;
    goto LABEL_39;
  }
  if (v29 == v28)
  {
    v39 = v38;
    (*(void (**)(_QWORD *, _QWORD *))(v28[0] + 24))(v28, v38);
    v18 = v39;
  }
  else
  {
    v18 = (_QWORD *)(*(uint64_t (**)(void))(*v29 + 16))();
    v39 = v18;
  }
  aBlock = v11;
  v33 = 3321888768;
  v34 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE5replyEv_block_invoke;
  p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
  v19 = v36;
  if (!v18)
    goto LABEL_38;
  if (v18 != v38)
  {
    v18 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v18 + 16))(v18);
    goto LABEL_38;
  }
  v37 = v36;
  (*(void (**)(_QWORD *, _BYTE *))(v38[0] + 24))(v38, v36);
LABEL_39:
  v20 = _Block_copy(&aBlock);
  if (v37 == v36)
  {
    v21 = 4;
  }
  else
  {
    if (!v37)
      goto LABEL_44;
    v21 = 5;
    v19 = v37;
  }
  (*(void (**)(_QWORD *))(*v19 + 8 * v21))(v19);
LABEL_44:
  v22 = v39;
  if (v39 == v38)
  {
    v23 = 4;
    v22 = v38;
  }
  else
  {
    if (!v39)
      goto LABEL_49;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_49:
  objc_msgSend(v14, "parametersForOverviewWithCount:reply:", a3, v20);

  v24 = v31;
  if (v29 == v28)
  {
    v25 = 4;
    goto LABEL_53;
  }
  if (v29)
  {
    v25 = 5;
    v6 = v29;
LABEL_53:
    (*(void (**)(_QWORD *))(*v6 + 8 * v25))(v6);
  }

  return v24;
}

- (id)supportedViewConfigurations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t (***v9)();
  uint64_t v10;
  _QWORD *v11;
  uint64_t (**v12)();
  id v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v28;
  _QWORD v29[3];
  _QWORD *v30;
  id v31;
  id v32;
  uint64_t (**aBlock)();
  uint64_t v34;
  void *v35;
  uint64_t (***p_aBlock)();
  _BYTE v37[24];
  _BYTE *v38;
  _QWORD v39[3];
  _QWORD *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*((_QWORD *)self + 72);
  aBlock = &off_1E29160B0;
  v34 = (uint64_t)&v28;
  p_aBlock = &aBlock;
  v6 = v5;
  v28 = v6;
  v7 = v29;
  v8 = (uint64_t)p_aBlock;
  if (!p_aBlock)
    goto LABEL_4;
  if (p_aBlock != &aBlock)
  {
    v8 = (*p_aBlock)[2]();
LABEL_4:
    v30 = (_QWORD *)v8;
    goto LABEL_6;
  }
  v30 = v29;
  ((void (*)(uint64_t (***)(), _QWORD *))aBlock[3])(&aBlock, v29);
LABEL_6:

  v9 = p_aBlock;
  if (p_aBlock == &aBlock)
  {
    v10 = 4;
    v9 = &aBlock;
  }
  else
  {
    if (!p_aBlock)
      goto LABEL_11;
    v10 = 5;
  }
  (*v9)[v10]();
LABEL_11:
  v31 = 0;
  v32 = 0;
  v11 = v30;
  v12 = (uint64_t (**)())MEMORY[0x1E0C809B0];
  if (!v30)
  {
    v40 = 0;
    v13 = v28;
    aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
    v34 = 3321888768;
    v35 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP10NSIndexSetEE10sync_proxyEv_block_invoke;
    p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP10NSIndexSetEEEEEE_e17_v16__0__NSError_8l;
    v14 = v37;
LABEL_19:
    v38 = v11;
    goto LABEL_20;
  }
  if (v30 == v29)
  {
    v40 = v39;
    (*(void (**)(_QWORD *, _QWORD *))(v29[0] + 24))(v29, v39);
    v11 = v40;
  }
  else
  {
    v11 = (_QWORD *)(*(uint64_t (**)(void))(*v30 + 16))();
    v40 = v11;
  }
  v13 = v28;
  aBlock = v12;
  v34 = 3321888768;
  v35 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP10NSIndexSetEE10sync_proxyEv_block_invoke;
  p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP10NSIndexSetEEEEEE_e17_v16__0__NSError_8l;
  v14 = v37;
  if (!v11)
    goto LABEL_19;
  if (v11 != v39)
  {
    v11 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v11 + 16))(v11);
    goto LABEL_19;
  }
  v38 = v37;
  (*(void (**)(_QWORD *, _BYTE *))(v39[0] + 24))(v39, v37);
LABEL_20:
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 == v37)
  {
    v16 = 4;
  }
  else
  {
    if (!v38)
      goto LABEL_25;
    v16 = 5;
    v14 = v38;
  }
  (*(void (**)(_QWORD *))(*v14 + 8 * v16))(v14);
LABEL_25:
  v17 = v40;
  if (v40 == v39)
  {
    v18 = 4;
    v17 = v39;
  }
  else
  {
    if (!v40)
      goto LABEL_30;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_30:
  v19 = v30;
  if (!v30)
  {
    v40 = 0;
    aBlock = v12;
    v34 = 3321888768;
    v35 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP10NSIndexSetEE5replyEv_block_invoke;
    p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP10NSIndexSetEEEEEE_e32_v24__0__NSError_8__NSIndexSet_16l;
    v20 = v37;
LABEL_38:
    v38 = v19;
    goto LABEL_39;
  }
  if (v30 == v29)
  {
    v40 = v39;
    (*(void (**)(_QWORD *, _QWORD *))(v29[0] + 24))(v29, v39);
    v19 = v40;
  }
  else
  {
    v19 = (_QWORD *)(*(uint64_t (**)(void))(*v30 + 16))();
    v40 = v19;
  }
  aBlock = v12;
  v34 = 3321888768;
  v35 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP10NSIndexSetEE5replyEv_block_invoke;
  p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP10NSIndexSetEEEEEE_e32_v24__0__NSError_8__NSIndexSet_16l;
  v20 = v37;
  if (!v19)
    goto LABEL_38;
  if (v19 != v39)
  {
    v19 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v19 + 16))(v19);
    goto LABEL_38;
  }
  v38 = v37;
  (*(void (**)(_QWORD *, _BYTE *))(v39[0] + 24))(v39, v37);
LABEL_39:
  v21 = _Block_copy(&aBlock);
  if (v38 == v37)
  {
    v22 = 4;
  }
  else
  {
    if (!v38)
      goto LABEL_44;
    v22 = 5;
    v20 = v38;
  }
  (*(void (**)(_QWORD *))(*v20 + 8 * v22))(v20);
LABEL_44:
  v23 = v40;
  if (v40 == v39)
  {
    v24 = 4;
    v23 = v39;
  }
  else
  {
    if (!v40)
      goto LABEL_49;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_49:
  objc_msgSend(v15, "supportedViewConfigurations:reply:", v4, v21);

  v25 = v32;
  if (v30 == v29)
  {
    v26 = 4;
    goto LABEL_53;
  }
  if (v30)
  {
    v26 = 5;
    v7 = v30;
LABEL_53:
    (*(void (**)(_QWORD *))(*v7 + 8 * v26))(v7);
  }

  return v25;
}

- (void)selectViewConfiguration:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  void *v14;
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*((_QWORD *)self + 72);
  v12[0] = &off_1E2913638;
  v12[1] = &__block_literal_global_175;
  v13 = v12;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v14, v5, (uint64_t)v12);
  v6 = v13;
  if (v13 == v12)
  {
    v7 = 4;
    v6 = v12;
  }
  else
  {
    if (!v13)
      goto LABEL_6;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectViewConfiguration:reply:", v4, v9);

  v10 = v16;
  if (v16 == v15)
  {
    v11 = 4;
    v10 = v15;
    goto LABEL_10;
  }
  if (v16)
  {
    v11 = 5;
LABEL_10:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }

}

- (BOOL)providesUserInterface
{
  void *v2;
  BOOL v3;

  -[AUAudioUnit cachedViewController](self, "cachedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)profileStateForCable:(unsigned __int8)a3 channel:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t (***v10)();
  uint64_t v11;
  _QWORD *v12;
  uint64_t (**v13)();
  id v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v29;
  _QWORD v30[3];
  _QWORD *v31;
  id v32;
  id v33;
  uint64_t (**aBlock)();
  uint64_t v35;
  void *v36;
  uint64_t (***p_aBlock)();
  _BYTE v38[24];
  _BYTE *v39;
  _QWORD v40[3];
  _QWORD *v41;
  uint64_t v42;

  v4 = a4;
  v5 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = (void *)*((_QWORD *)self + 72);
  aBlock = &off_1E29161D0;
  v35 = (uint64_t)&v29;
  p_aBlock = &aBlock;
  v7 = v6;
  v29 = v7;
  v8 = v30;
  v9 = (uint64_t)p_aBlock;
  if (!p_aBlock)
    goto LABEL_4;
  if (p_aBlock != &aBlock)
  {
    v9 = (*p_aBlock)[2]();
LABEL_4:
    v31 = (_QWORD *)v9;
    goto LABEL_6;
  }
  v31 = v30;
  ((void (*)(uint64_t (***)(), _QWORD *))aBlock[3])(&aBlock, v30);
LABEL_6:

  v10 = p_aBlock;
  if (p_aBlock == &aBlock)
  {
    v11 = 4;
    v10 = &aBlock;
  }
  else
  {
    if (!p_aBlock)
      goto LABEL_11;
    v11 = 5;
  }
  (*v10)[v11]();
LABEL_11:
  v32 = 0;
  v33 = 0;
  v12 = v31;
  v13 = (uint64_t (**)())MEMORY[0x1E0C809B0];
  if (!v31)
  {
    v41 = 0;
    v14 = v29;
    aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
    v35 = 3321888768;
    v36 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP18MIDICIProfileStateEE10sync_proxyEv_block_invoke;
    p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP18MIDICIProfileStateEEEEEE_e17_v16__0__NSError_8l;
    v15 = v38;
LABEL_19:
    v39 = v12;
    goto LABEL_20;
  }
  if (v31 == v30)
  {
    v41 = v40;
    (*(void (**)(_QWORD *, _QWORD *))(v30[0] + 24))(v30, v40);
    v12 = v41;
  }
  else
  {
    v12 = (_QWORD *)(*(uint64_t (**)(void))(*v31 + 16))();
    v41 = v12;
  }
  v14 = v29;
  aBlock = v13;
  v35 = 3321888768;
  v36 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP18MIDICIProfileStateEE10sync_proxyEv_block_invoke;
  p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP18MIDICIProfileStateEEEEEE_e17_v16__0__NSError_8l;
  v15 = v38;
  if (!v12)
    goto LABEL_19;
  if (v12 != v40)
  {
    v12 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v12 + 16))(v12);
    goto LABEL_19;
  }
  v39 = v38;
  (*(void (**)(_QWORD *, _BYTE *))(v40[0] + 24))(v40, v38);
LABEL_20:
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock, v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39 == v38)
  {
    v17 = 4;
  }
  else
  {
    if (!v39)
      goto LABEL_25;
    v17 = 5;
    v15 = v39;
  }
  (*(void (**)(_QWORD *))(*v15 + 8 * v17))(v15);
LABEL_25:
  v18 = v41;
  if (v41 == v40)
  {
    v19 = 4;
    v18 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_30;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_30:
  v20 = v31;
  if (!v31)
  {
    v41 = 0;
    aBlock = v13;
    v35 = 3321888768;
    v36 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP18MIDICIProfileStateEE5replyEv_block_invoke;
    p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP18MIDICIProfileStateEEEEEE_e40_v24__0__NSError_8__MIDICIProfileState_16l;
    v21 = v38;
LABEL_38:
    v39 = v20;
    goto LABEL_39;
  }
  if (v31 == v30)
  {
    v41 = v40;
    (*(void (**)(_QWORD *, _QWORD *))(v30[0] + 24))(v30, v40);
    v20 = v41;
  }
  else
  {
    v20 = (_QWORD *)(*(uint64_t (**)(void))(*v31 + 16))();
    v41 = v20;
  }
  aBlock = v13;
  v35 = 3321888768;
  v36 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP18MIDICIProfileStateEE5replyEv_block_invoke;
  p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP18MIDICIProfileStateEEEEEE_e40_v24__0__NSError_8__MIDICIProfileState_16l;
  v21 = v38;
  if (!v20)
    goto LABEL_38;
  if (v20 != v40)
  {
    v20 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v20 + 16))(v20);
    goto LABEL_38;
  }
  v39 = v38;
  (*(void (**)(_QWORD *, _BYTE *))(v40[0] + 24))(v40, v38);
LABEL_39:
  v22 = _Block_copy(&aBlock);
  if (v39 == v38)
  {
    v23 = 4;
  }
  else
  {
    if (!v39)
      goto LABEL_44;
    v23 = 5;
    v21 = v39;
  }
  (*(void (**)(_QWORD *))(*v21 + 8 * v23))(v21);
LABEL_44:
  v24 = v41;
  if (v41 == v40)
  {
    v25 = 4;
    v24 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_49;
    v25 = 5;
  }
  (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_49:
  objc_msgSend(v16, "profileStateForCable:channel:reply:", v5, v4, v22);

  v26 = v33;
  if (v31 == v30)
  {
    v27 = 4;
    goto LABEL_53;
  }
  if (v31)
  {
    v27 = 5;
    v8 = v31;
LABEL_53:
    (*(void (**)(_QWORD *))(*v8 + 8 * v27))(v8);
  }

  return v26;
}

- (BOOL)enableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v18;
  _BYTE v19[24];
  _BYTE *v20;
  id v21;
  uint64_t v22;

  v7 = a5;
  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v18, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enableProfile:cable:onChannel:reply:", v10, v8, v7, v12);

  v13 = v21;
  v14 = v13;
  if (v13 && a6)
    *a6 = objc_retainAutorelease(v13);

  v15 = v20;
  if (v20 == v19)
  {
    v16 = 4;
    v15 = v19;
    goto LABEL_8;
  }
  if (v20)
  {
    v16 = 5;
LABEL_8:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

  return v14 == 0;
}

- (BOOL)disableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v18;
  _BYTE v19[24];
  _BYTE *v20;
  id v21;
  uint64_t v22;

  v7 = a5;
  v8 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v18, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "disableProfile:cable:onChannel:reply:", v10, v8, v7, v12);

  v13 = v21;
  v14 = v13;
  if (v13 && a6)
    *a6 = objc_retainAutorelease(v13);

  v15 = v20;
  if (v20 == v19)
  {
    v16 = 4;
    v15 = v19;
    goto LABEL_8;
  }
  if (v20)
  {
    v16 = 5;
LABEL_8:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

  return v14 == 0;
}

- (void)invalidateAllParameters
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)*((_QWORD *)self + 121);
  if (v2)
  {
    objc_msgSend(v2, "allParameters", (_QWORD)v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "setLocalValueStale:", 1, (_QWORD)v7);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_setState:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  -[AUAudioUnit_XPC invalidateAllParameters](self, "invalidateAllParameters");
  +[AUAudioUnitProperty propertyWithKey:](AUAudioUnitProperty, "propertyWithKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnit_XPC _setValue:forProperty:error:](self, "_setValue:forProperty:error:", v10, v9, a5);

}

- (void)setFullState:(id)a3
{
  -[AUAudioUnit_XPC _setState:forKey:error:](self, "_setState:forKey:error:", a3, CFSTR("fullState"), 0);
}

- (void)setFullStateForDocument:(id)a3
{
  -[AUAudioUnit_XPC _setState:forKey:error:](self, "_setState:forKey:error:", a3, CFSTR("fullStateForDocument"), 0);
}

- (void)setCurrentPreset:(id)a3
{
  -[AUAudioUnit_XPC _setState:forKey:error:](self, "_setState:forKey:error:", a3, CFSTR("currentPreset"), 0);
}

- (BOOL)saveUserPreset:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  void *v14;
  _BYTE v15[24];
  _BYTE *v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v14, *((void **)self + 72));
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUAudioUnit fullStateForDocument](self, "fullStateForDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveUserPreset:state:reply:", v6, v8, v9);

    if (a4)
      *a4 = objc_retainAutorelease(v17);
    LOBYTE(a4) = v17 == 0;

    v10 = v16;
    if (v16 == v15)
    {
      v11 = 4;
      v10 = v15;
    }
    else
    {
      if (!v16)
      {
LABEL_11:

        goto LABEL_12;
      }
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
    goto LABEL_11;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v12;

    LOBYTE(a4) = 0;
  }
LABEL_12:

  return (char)a4;
}

- (BOOL)deleteUserPreset:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v13;
  _BYTE v14[24];
  _BYTE *v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v13, *((void **)self + 72));
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteUserPreset:reply:", v6, v8);

    if (a4)
      *a4 = objc_retainAutorelease(v16);
    LOBYTE(a4) = v16 == 0;

    v9 = v15;
    if (v15 == v14)
    {
      v10 = 4;
      v9 = v14;
    }
    else
    {
      if (!v15)
      {
LABEL_11:

        goto LABEL_12;
      }
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
    goto LABEL_11;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v11;

    LOBYTE(a4) = 0;
  }
LABEL_12:

  return (char)a4;
}

- (id)presetStateFor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  uint64_t (***v12)();
  uint64_t v13;
  _QWORD *v14;
  uint64_t (**v15)();
  id v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v31;
  _QWORD v32[3];
  _QWORD *v33;
  id v34;
  id v35;
  uint64_t (**aBlock)();
  uint64_t v37;
  void *v38;
  uint64_t (***p_aBlock)();
  _BYTE v40[24];
  _BYTE *v41;
  _QWORD v42[3];
  _QWORD *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
  {
    v7 = (void *)*((_QWORD *)self + 72);
    aBlock = &off_1E2916140;
    v37 = (uint64_t)&v31;
    p_aBlock = &aBlock;
    v8 = v7;
    v31 = v8;
    v9 = v32;
    v10 = (uint64_t)p_aBlock;
    if (p_aBlock)
    {
      if (p_aBlock == &aBlock)
      {
        v33 = v32;
        ((void (*)(uint64_t (***)(), _QWORD *))aBlock[3])(&aBlock, v32);
LABEL_9:

        v12 = p_aBlock;
        if (p_aBlock == &aBlock)
        {
          v13 = 4;
          v12 = &aBlock;
        }
        else
        {
          if (!p_aBlock)
            goto LABEL_14;
          v13 = 5;
        }
        (*v12)[v13]();
LABEL_14:
        v34 = 0;
        v35 = 0;
        v14 = v33;
        v15 = (uint64_t (**)())MEMORY[0x1E0C809B0];
        if (v33)
        {
          if (v33 == v32)
          {
            v43 = v42;
            (*(void (**)(_QWORD *, _QWORD *))(v32[0] + 24))(v32, v42);
            v14 = v43;
          }
          else
          {
            v14 = (_QWORD *)(*(uint64_t (**)(void))(*v33 + 16))();
            v43 = v14;
          }
          v16 = v31;
          aBlock = v15;
          v37 = 3321888768;
          v38 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEE10sync_proxyEv_block_invoke;
          p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c101_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEEEE_e17_v16__0__NSError_8l;
          v17 = v40;
          if (v14)
          {
            if (v14 == v42)
            {
              v41 = v40;
              (*(void (**)(_QWORD *, _BYTE *))(v42[0] + 24))(v42, v40);
LABEL_23:
              objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock, v31);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41 == v40)
              {
                v19 = 4;
              }
              else
              {
                if (!v41)
                  goto LABEL_28;
                v19 = 5;
                v17 = v41;
              }
              (*(void (**)(_QWORD *))(*v17 + 8 * v19))(v17);
LABEL_28:
              v20 = v43;
              if (v43 == v42)
              {
                v21 = 4;
                v20 = v42;
              }
              else
              {
                if (!v43)
                  goto LABEL_33;
                v21 = 5;
              }
              (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_33:
              v22 = v33;
              if (v33)
              {
                if (v33 == v32)
                {
                  v43 = v42;
                  (*(void (**)(_QWORD *, _QWORD *))(v32[0] + 24))(v32, v42);
                  v22 = v43;
                }
                else
                {
                  v22 = (_QWORD *)(*(uint64_t (**)(void))(*v33 + 16))();
                  v43 = v22;
                }
                aBlock = v15;
                v37 = 3321888768;
                v38 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEE5replyEv_block_invoke;
                p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c101_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEEEE_e34_v24__0__NSError_8__NSDictionary_16l;
                v23 = v40;
                if (v22)
                {
                  if (v22 == v42)
                  {
                    v41 = v40;
                    (*(void (**)(_QWORD *, _BYTE *))(v42[0] + 24))(v42, v40);
LABEL_42:
                    v24 = _Block_copy(&aBlock);
                    if (v41 == v40)
                    {
                      v25 = 4;
                    }
                    else
                    {
                      if (!v41)
                        goto LABEL_47;
                      v25 = 5;
                      v23 = v41;
                    }
                    (*(void (**)(_QWORD *))(*v23 + 8 * v25))(v23);
LABEL_47:
                    v26 = v43;
                    if (v43 == v42)
                    {
                      v27 = 4;
                      v26 = v42;
                    }
                    else
                    {
                      if (!v43)
                        goto LABEL_52;
                      v27 = 5;
                    }
                    (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_52:
                    objc_msgSend(v18, "presetStateFor:reply:", v6, v24);

                    if (a4)
                      *a4 = objc_retainAutorelease(v34);
                    v28 = v35;
                    if (v34)
                      a4 = 0;
                    else
                      a4 = (id *)v35;

                    if (v33 == v32)
                    {
                      v29 = 4;
                    }
                    else
                    {
                      if (!v33)
                      {
LABEL_62:

                        goto LABEL_63;
                      }
                      v29 = 5;
                      v9 = v33;
                    }
                    (*(void (**)(_QWORD *))(*v9 + 8 * v29))(v9);
                    goto LABEL_62;
                  }
                  v22 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v22 + 16))(v22);
                }
              }
              else
              {
                v43 = 0;
                aBlock = v15;
                v37 = 3321888768;
                v38 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEE5replyEv_block_invoke;
                p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c101_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEEEE_e34_v24__0__NSError_8__NSDictionary_16l;
                v23 = v40;
              }
              v41 = v22;
              goto LABEL_42;
            }
            v14 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
          }
        }
        else
        {
          v43 = 0;
          v16 = v31;
          aBlock = (uint64_t (**)())MEMORY[0x1E0C809B0];
          v37 = 3321888768;
          v38 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEE10sync_proxyEv_block_invoke;
          p_aBlock = (uint64_t (***)())&__block_descriptor_64_ea8_32c101_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEEEE_e17_v16__0__NSError_8l;
          v17 = v40;
        }
        v41 = v14;
        goto LABEL_23;
      }
      v10 = (*p_aBlock)[2]();
    }
    v33 = (_QWORD *)v10;
    goto LABEL_9;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10850, 0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v11;

    a4 = 0;
  }
LABEL_63:

  return a4;
}

- (id)userPresets
{
  void *v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  id *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  id v32;
  _QWORD v33[3];
  _QWORD *v34;
  id v35;
  id obj;
  _BYTE aBlock[32];
  _BYTE v38[24];
  _BYTE *v39;
  _QWORD v40[3];
  _QWORD *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!-[AUAudioUnit supportsUserPresets](self, "supportsUserPresets"))
    return MEMORY[0x1E0C9AA60];
  v3 = (void *)*((_QWORD *)self + 72);
  *(_QWORD *)aBlock = &off_1E29162A8;
  *(_QWORD *)&aBlock[8] = &v32;
  *(_QWORD *)&aBlock[24] = aBlock;
  v4 = v3;
  v32 = v4;
  v5 = v33;
  v6 = *(_QWORD *)&aBlock[24];
  if (!*(_QWORD *)&aBlock[24])
    goto LABEL_5;
  if (*(_BYTE **)&aBlock[24] != aBlock)
  {
    v6 = (*(uint64_t (**)(void))(**(_QWORD **)&aBlock[24] + 16))();
LABEL_5:
    v34 = (_QWORD *)v6;
    goto LABEL_8;
  }
  v34 = v33;
  (*(void (**)(_BYTE *, _QWORD *))(*(_QWORD *)aBlock + 24))(aBlock, v33);
LABEL_8:

  v8 = *(_QWORD **)&aBlock[24];
  if (*(_BYTE **)&aBlock[24] == aBlock)
  {
    v9 = 4;
    v8 = aBlock;
  }
  else
  {
    if (!*(_QWORD *)&aBlock[24])
      goto LABEL_13;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_13:
  v35 = 0;
  obj = 0;
  v10 = v34;
  v11 = MEMORY[0x1E0C809B0];
  if (!v34)
  {
    v41 = 0;
    v12 = v32;
    *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
    *(_QWORD *)&aBlock[8] = 3321888768;
    *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP17AUAudioUnitPresetEEE10sync_proxyEv_block_invoke;
    *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c91_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEEEE_e17_v16__0__NSError_8l;
    v13 = v38;
LABEL_21:
    v39 = v10;
    goto LABEL_22;
  }
  if (v34 == v33)
  {
    v41 = v40;
    (*(void (**)(_QWORD *, _QWORD *))(v33[0] + 24))(v33, v40);
    v10 = v41;
  }
  else
  {
    v10 = (_QWORD *)(*(uint64_t (**)(void))(*v34 + 16))();
    v41 = v10;
  }
  v12 = v32;
  *(_QWORD *)aBlock = v11;
  *(_QWORD *)&aBlock[8] = 3321888768;
  *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP17AUAudioUnitPresetEEE10sync_proxyEv_block_invoke;
  *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c91_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEEEE_e17_v16__0__NSError_8l;
  v13 = v38;
  if (!v10)
    goto LABEL_21;
  if (v10 != v40)
  {
    v10 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v10 + 16))(v10);
    goto LABEL_21;
  }
  v39 = v38;
  (*(void (**)(_QWORD *, _BYTE *))(v40[0] + 24))(v40, v38);
LABEL_22:
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", aBlock);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39 == v38)
  {
    v15 = 4;
  }
  else
  {
    if (!v39)
      goto LABEL_27;
    v15 = 5;
    v13 = v39;
  }
  (*(void (**)(_QWORD *))(*v13 + 8 * v15))(v13);
LABEL_27:
  v16 = v41;
  if (v41 == v40)
  {
    v17 = 4;
    v16 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_32;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_32:
  v18 = v34;
  if (!v34)
  {
    v41 = 0;
    *(_QWORD *)aBlock = v11;
    *(_QWORD *)&aBlock[8] = 3321888768;
    *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP17AUAudioUnitPresetEEE5replyEv_block_invoke;
    *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c91_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
    v19 = v38;
LABEL_40:
    v39 = v18;
    goto LABEL_41;
  }
  if (v34 == v33)
  {
    v41 = v40;
    (*(void (**)(_QWORD *, _QWORD *))(v33[0] + 24))(v33, v40);
    v18 = v41;
  }
  else
  {
    v18 = (_QWORD *)(*(uint64_t (**)(void))(*v34 + 16))();
    v41 = v18;
  }
  *(_QWORD *)aBlock = v11;
  *(_QWORD *)&aBlock[8] = 3321888768;
  *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP17AUAudioUnitPresetEEE5replyEv_block_invoke;
  *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c91_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
  v19 = v38;
  if (!v18)
    goto LABEL_40;
  if (v18 != v40)
  {
    v18 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v18 + 16))(v18);
    goto LABEL_40;
  }
  v39 = v38;
  (*(void (**)(_QWORD *, _BYTE *))(v40[0] + 24))(v40, v38);
LABEL_41:
  v20 = _Block_copy(aBlock);
  if (v39 == v38)
  {
    v21 = 4;
  }
  else
  {
    if (!v39)
      goto LABEL_46;
    v21 = 5;
    v19 = v39;
  }
  (*(void (**)(_QWORD *))(*v19 + 8 * v21))(v19);
LABEL_46:
  v22 = v41;
  if (v41 == v40)
  {
    v23 = 4;
    v22 = v40;
  }
  else
  {
    if (!v41)
      goto LABEL_51;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_51:
  objc_msgSend(v14, "loadUserPresets:", v20);

  v24 = (id *)((char *)self + 976);
  objc_storeStrong(v24, obj);
  v25 = v35;
  if (!v35)
  {
    v27 = *v24;
    goto LABEL_61;
  }
  if (!kAUExtensionScope)
  {
    v26 = (id)MEMORY[0x1E0C81028];
    v28 = MEMORY[0x1E0C81028];
    goto LABEL_57;
  }
  v26 = *(id *)kAUExtensionScope;
  if (v26)
  {
LABEL_57:
    v29 = v26;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = v25;
      *(_DWORD *)aBlock = 136315650;
      *(_QWORD *)&aBlock[4] = "AUAudioUnit_XPC.mm";
      *(_WORD *)&aBlock[12] = 1024;
      *(_DWORD *)&aBlock[14] = 1306;
      *(_WORD *)&aBlock[18] = 2112;
      *(_QWORD *)&aBlock[20] = v30;
      _os_log_impl(&dword_18EE07000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to load user presets: %@", aBlock, 0x1Cu);

    }
  }
  v27 = (id)MEMORY[0x1E0C9AA60];
LABEL_61:

  if (v34 == v33)
  {
    v31 = 4;
    goto LABEL_65;
  }
  if (v34)
  {
    v31 = 5;
    v5 = v34;
LABEL_65:
    (*(void (**)(_QWORD *))(*v5 + 8 * v31))(v5);
  }

  return v27;
}

- (BOOL)isLoadedInProcess
{
  return 0;
}

- (int)remoteProcessIdentifier
{
  return objc_msgSend(*((id *)self + 72), "processIdentifier");
}

- ($115C4C562B26FF47E01F9F4EA65B5887)remoteProcessAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)*((_QWORD *)self + 72);
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)messageChannelFor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  AUMessageChannel_XPC *v28;
  id v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  id v34;
  _QWORD v35[3];
  _QWORD *v36;
  id v37;
  id v38;
  _BYTE aBlock[32];
  _BYTE v40[24];
  _BYTE *v41;
  _QWORD v42[3];
  _QWORD *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*((_QWORD *)self + 72);
  *(_QWORD *)aBlock = &off_1E2916218;
  *(_QWORD *)&aBlock[8] = &v34;
  *(_QWORD *)&aBlock[24] = aBlock;
  v6 = v5;
  v34 = v6;
  v7 = v35;
  v8 = *(_QWORD *)&aBlock[24];
  if (!*(_QWORD *)&aBlock[24])
    goto LABEL_4;
  if (*(_BYTE **)&aBlock[24] != aBlock)
  {
    v8 = (*(uint64_t (**)(void))(**(_QWORD **)&aBlock[24] + 16))();
LABEL_4:
    v36 = (_QWORD *)v8;
    goto LABEL_6;
  }
  v36 = v35;
  (*(void (**)(_BYTE *, _QWORD *))(*(_QWORD *)aBlock + 24))(aBlock, v35);
LABEL_6:

  v9 = *(_QWORD **)&aBlock[24];
  if (*(_BYTE **)&aBlock[24] == aBlock)
  {
    v10 = 4;
    v9 = aBlock;
  }
  else
  {
    if (!*(_QWORD *)&aBlock[24])
      goto LABEL_11;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_11:
  v37 = 0;
  v38 = 0;
  v11 = v36;
  v12 = MEMORY[0x1E0C809B0];
  if (!v36)
  {
    v43 = 0;
    v13 = v34;
    *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
    *(_QWORD *)&aBlock[8] = 3321888768;
    *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP21NSXPCListenerEndpointEE10sync_proxyEv_block_invoke;
    *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c84_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP21NSXPCListenerEndpointEEEEEE_e17_v16__0__NSError_8l;
    v14 = v40;
LABEL_19:
    v41 = v11;
    goto LABEL_20;
  }
  if (v36 == v35)
  {
    v43 = v42;
    (*(void (**)(_QWORD *, _QWORD *))(v35[0] + 24))(v35, v42);
    v11 = v43;
  }
  else
  {
    v11 = (_QWORD *)(*(uint64_t (**)(void))(*v36 + 16))();
    v43 = v11;
  }
  v13 = v34;
  *(_QWORD *)aBlock = v12;
  *(_QWORD *)&aBlock[8] = 3321888768;
  *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP21NSXPCListenerEndpointEE10sync_proxyEv_block_invoke;
  *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c84_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP21NSXPCListenerEndpointEEEEEE_e17_v16__0__NSError_8l;
  v14 = v40;
  if (!v11)
    goto LABEL_19;
  if (v11 != v42)
  {
    v11 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v11 + 16))(v11);
    goto LABEL_19;
  }
  v41 = v40;
  (*(void (**)(_QWORD *, _BYTE *))(v42[0] + 24))(v42, v40);
LABEL_20:
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", aBlock);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 == v40)
  {
    v16 = 4;
  }
  else
  {
    if (!v41)
      goto LABEL_25;
    v16 = 5;
    v14 = v41;
  }
  (*(void (**)(_QWORD *))(*v14 + 8 * v16))(v14);
LABEL_25:
  v17 = v43;
  if (v43 == v42)
  {
    v18 = 4;
    v17 = v42;
  }
  else
  {
    if (!v43)
      goto LABEL_30;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_30:
  v19 = v36;
  if (!v36)
  {
    v43 = 0;
    *(_QWORD *)aBlock = v12;
    *(_QWORD *)&aBlock[8] = 3321888768;
    *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP21NSXPCListenerEndpointEE5replyEv_block_invoke;
    *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c84_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP21NSXPCListenerEndpointEEEEEE_e43_v24__0__NSError_8__NSXPCListenerEndpoint_16l;
    v20 = v40;
LABEL_38:
    v41 = v19;
    goto LABEL_39;
  }
  if (v36 == v35)
  {
    v43 = v42;
    (*(void (**)(_QWORD *, _QWORD *))(v35[0] + 24))(v35, v42);
    v19 = v43;
  }
  else
  {
    v19 = (_QWORD *)(*(uint64_t (**)(void))(*v36 + 16))();
    v43 = v19;
  }
  *(_QWORD *)aBlock = v12;
  *(_QWORD *)&aBlock[8] = 3321888768;
  *(_QWORD *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP21NSXPCListenerEndpointEE5replyEv_block_invoke;
  *(_QWORD *)&aBlock[24] = &__block_descriptor_64_ea8_32c84_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP21NSXPCListenerEndpointEEEEEE_e43_v24__0__NSError_8__NSXPCListenerEndpoint_16l;
  v20 = v40;
  if (!v19)
    goto LABEL_38;
  if (v19 != v42)
  {
    v19 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v19 + 16))(v19);
    goto LABEL_38;
  }
  v41 = v40;
  (*(void (**)(_QWORD *, _BYTE *))(v42[0] + 24))(v42, v40);
LABEL_39:
  v21 = _Block_copy(aBlock);
  if (v41 == v40)
  {
    v22 = 4;
  }
  else
  {
    if (!v41)
      goto LABEL_44;
    v22 = 5;
    v20 = v41;
  }
  (*(void (**)(_QWORD *))(*v20 + 8 * v22))(v20);
LABEL_44:
  v23 = v43;
  if (v43 == v42)
  {
    v24 = 4;
    v23 = v42;
  }
  else
  {
    if (!v43)
      goto LABEL_49;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_49:
  objc_msgSend(v15, "getCustomMessageChannelFor:reply:", v4, v21);

  v25 = v38;
  v26 = v25;
  v27 = v37;
  if (!v37)
  {
    if (v25)
    {
      v28 = -[AUMessageChannel_XPC initWithListenerEndpoint:]([AUMessageChannel_XPC alloc], "initWithListenerEndpoint:", v25);
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  if (!kAUExtensionScope)
  {
    v28 = (AUMessageChannel_XPC *)MEMORY[0x1E0C81028];
    v29 = MEMORY[0x1E0C81028];
    goto LABEL_56;
  }
  v28 = (AUMessageChannel_XPC *)*(id *)kAUExtensionScope;
  if (v28)
  {
LABEL_56:
    v30 = v28;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = v27;
      *(_DWORD *)aBlock = 136315650;
      *(_QWORD *)&aBlock[4] = "AUAudioUnit_XPC.mm";
      *(_WORD *)&aBlock[12] = 1024;
      *(_DWORD *)&aBlock[14] = 1334;
      *(_WORD *)&aBlock[18] = 2112;
      *(_QWORD *)&aBlock[20] = v31;
      _os_log_impl(&dword_18EE07000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to receive messageChannel with error: %@", aBlock, 0x1Cu);

    }
LABEL_59:
    v28 = 0;
  }
LABEL_60:

  if (v36 == v35)
  {
    v32 = 4;
    goto LABEL_64;
  }
  if (v36)
  {
    v32 = 5;
    v7 = v36;
LABEL_64:
    (*(void (**)(_QWORD *))(*v7 + 8 * v32))(v7);
  }

  return v28;
}

- (void)synthesizeSpeechRequest:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  void *v14;
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AUAudioUnit componentDescription](self, "componentDescription");
  if ((_DWORD)v14 == 1635087216)
  {
    v5 = (void *)*((_QWORD *)self + 72);
    v12[0] = &off_1E2913638;
    v12[1] = &__block_literal_global_183;
    v13 = v12;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v14, v5, (uint64_t)v12);
    v6 = v13;
    if (v13 == v12)
    {
      v7 = 4;
      v6 = v12;
    }
    else
    {
      if (!v13)
        goto LABEL_7;
      v7 = 5;
    }
    (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_7:
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synthesizeSpeechRequest:reply:", v4, v9);

    v10 = v16;
    if (v16 == v15)
    {
      v11 = 4;
      v10 = v15;
    }
    else
    {
      if (!v16)
      {
LABEL_12:

        goto LABEL_13;
      }
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
    goto LABEL_12;
  }
LABEL_13:

}

- (void)cancelSpeechRequest
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  void *v12;
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AUAudioUnit componentDescription](self, "componentDescription");
  if ((_DWORD)v12 == 1635087216)
  {
    v3 = (void *)*((_QWORD *)self + 72);
    v10[0] = &off_1E2913638;
    v10[1] = &__block_literal_global_184;
    v11 = v10;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v12, v3, (uint64_t)v10);
    v4 = v11;
    if (v11 == v10)
    {
      v5 = 4;
      v4 = v10;
    }
    else
    {
      if (!v11)
        goto LABEL_7;
      v5 = 5;
    }
    (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_7:
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelSpeechRequest:", v7);

    v8 = v14;
    if (v14 == v13)
    {
      v9 = 4;
      v8 = v13;
    }
    else
    {
      if (!v14)
      {
LABEL_12:

        return;
      }
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
    goto LABEL_12;
  }
}

- (id)speechVoices
{
  void *v3;
  void *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v9;
  _BYTE v10[24];
  _BYTE *v11;
  id v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AUAudioUnit componentDescription](self, "componentDescription");
  if ((_DWORD)v9 != 1635087216)
    return MEMORY[0x1E0C9AA60];
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v9, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getSpeechVoices:", v4);

  v5 = v13;
  v6 = v11;
  if (v11 == v10)
  {
    v7 = 4;
    v6 = v10;
    goto LABEL_7;
  }
  if (v11)
  {
    v7 = 5;
LABEL_7:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }

  return v5;
}

- (id)XPCListenerEndpoint
{
  return (id)objc_msgSend(*((id *)self + 72), "endpoint");
}

- (id)audioUnitInstanceUUID
{
  void *v2;
  void *v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v8;
  _BYTE v9[24];
  _BYTE *v10;
  id v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_message(&v8, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_proxy(&v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::reply((uint64_t)&v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retrieveInstanceUUID:", v3);

  v4 = v12;
  v5 = v10;
  if (v10 == v9)
  {
    v6 = 4;
    v5 = v9;
    goto LABEL_5;
  }
  if (v10)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }

  return v4;
}

- (BOOL)isLocalCachingDisabled
{
  BOOL *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v8;
  _BYTE v9[24];
  _BYTE *v10;
  id v11;
  unsigned __int8 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (BOOL *)self + 984;
  if (*((_BYTE *)self + 985))
    return *v2;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_message((uint64_t)&v8, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_proxy(&v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::reply((uint64_t)&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localCachingDisabled:newValue:reply:", 0, 0, v4);

  *(_WORD *)v2 = v12 | 0x100;
  v5 = v10;
  if (v10 == v9)
  {
    v6 = 4;
    v5 = v9;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_7:

  if (!v2[1])
    std::__throw_bad_optional_access[abi:ne180100]();
  return *v2;
}

- (void)setLocalCachingDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _BYTE v9[24];
  _BYTE *v10;
  id v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  *((_WORD *)self + 492) = a3 | 0x100;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_message((uint64_t)&v8, *((void **)self + 72));
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_proxy(&v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::reply((uint64_t)&v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localCachingDisabled:newValue:reply:", 1, v3, v5);

  v6 = v10;
  if (v10 == v9)
  {
    v7 = 4;
    v6 = v9;
    goto LABEL_5;
  }
  if (v10)
  {
    v7 = 5;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }

}

- (NSUUID)auInstanceUUID
{
  return (NSUUID *)*((_QWORD *)self + 124);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_storeStrong((id *)self + 124, 0);
  objc_storeStrong((id *)self + 122, 0);
  objc_storeStrong((id *)self + 121, 0);
  if (*((_BYTE *)self + 960))
    auoop::RenderPipeUser::~RenderPipeUser((auoop::RenderPipeUser *)((char *)self + 888));
  std::shared_ptr<MP4OTISpecificBase>::~shared_ptr[abi:ne180100]((uint64_t)self + 872);
  v3 = *((_QWORD *)self + 106);
  if (v3)
  {
    v4 = *((_QWORD *)self + 107);
    v5 = (void *)*((_QWORD *)self + 106);
    if (v4 != v3)
    {
      do
      {
        v6 = v4 - 32;

        v4 = v6;
      }
      while (v6 != v3);
      v5 = (void *)*((_QWORD *)self + 106);
    }
    *((_QWORD *)self + 107) = v3;
    operator delete(v5);
  }
  v7 = *((_QWORD *)self + 105);
  *((_QWORD *)self + 105) = 0;
  if (v7)
    MEMORY[0x193FFE460](v7, 0x80C40803F642BLL);
  objc_storeStrong((id *)self + 104, 0);
  objc_storeStrong((id *)self + 103, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 760));
  objc_storeStrong((id *)self + 93, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 656));
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 584));
  objc_storeStrong((id *)self + 72, 0);
}

- (id).cxx_construct
{
  MEMORY[0x193FFE25C]((char *)self + 584, a2);
  *((_QWORD *)self + 82) = 850045863;
  *(_OWORD *)((char *)self + 664) = 0u;
  *(_OWORD *)((char *)self + 680) = 0u;
  *(_OWORD *)((char *)self + 696) = 0u;
  *((_QWORD *)self + 89) = 0;
  *((_QWORD *)self + 95) = 850045863;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 49) = 0u;
  *((_OWORD *)self + 50) = 0u;
  *((_QWORD *)self + 102) = 0;
  *((_QWORD *)self + 105) = 0;
  *((_QWORD *)self + 107) = 0;
  *((_QWORD *)self + 108) = 0;
  *((_QWORD *)self + 106) = 0;
  *((_QWORD *)self + 109) = 0;
  *((_QWORD *)self + 110) = 0;
  *((_BYTE *)self + 888) = 0;
  *((_BYTE *)self + 960) = 0;
  *((_WORD *)self + 492) = 0;
  return self;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
