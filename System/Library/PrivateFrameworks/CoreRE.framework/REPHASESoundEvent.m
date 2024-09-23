@implementation REPHASESoundEvent

- (REPHASESoundEvent)initWithSoundEventFactory:(id)a3 phaseQueue:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  REPHASESoundEvent *v8;
  uint64_t v9;
  PHASESoundEvent *soundEvent;
  void *v11;
  id soundEventFactory;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  v8 = -[REPHASESoundEvent initWithEngine:source:listener:audioSession:phaseQueue:](self, "initWithEngine:source:listener:audioSession:phaseQueue:", 0, 0, 0, 0, v7);
  if (v8)
  {
    v6[2](v6);
    v9 = objc_claimAutoreleasedReturnValue();
    soundEvent = v8->_soundEvent;
    v8->_soundEvent = (PHASESoundEvent *)v9;

    v11 = _Block_copy(v6);
    soundEventFactory = v8->_soundEventFactory;
    v8->_soundEventFactory = v11;

  }
  return v8;
}

- (REPHASESoundEvent)initWithEngine:(id)a3 source:(id)a4 listener:(id)a5 audioSession:(id)a6 phaseQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  REPHASESoundEvent *v17;
  REPHASESoundEvent *v18;
  PHASESoundEvent *soundEvent;
  PHASEExternalOutputStreamController *externalStreamController;
  re::audio::REPHASESoundPrepareState *v21;
  shared_ptr<re::audio::REPHASESoundPrepareState> v22;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  id v30;
  shared_ptr<re::audio::REPHASESoundPrepareState> v31;
  objc_super v32;

  v30 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)REPHASESoundEvent;
  v17 = -[REPHASESoundEvent init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    atomic_store(0, (unsigned __int8 *)&v17->_isStopping);
    soundEvent = v17->_soundEvent;
    v17->_soundEvent = 0;

    externalStreamController = v18->_externalStreamController;
    v18->_externalStreamController = 0;

    atomic_store(9uLL, &v18->_state.__a_.__a_value);
    objc_storeStrong((id *)&v18->_engine, a3);
    objc_storeStrong((id *)&v18->_source, a4);
    objc_storeStrong((id *)&v18->_listener, a5);
    objc_storeStrong((id *)&v18->_audioSession, a6);
    *(int32x2_t *)&v18->_cachedPlaybackSpeed = vdup_n_s32(0x7FC00000u);
    v18->_cachedDirectSendLevel = NAN;
    v18->_soundEventPlayed = 0;
    re::audio::REPHASESoundPrepareState::create(v21, &v31);
    v22 = v31;
    v31 = (shared_ptr<re::audio::REPHASESoundPrepareState>)0;
    cntrl = (std::__shared_weak_count *)v18->_prepareState.__cntrl_;
    v18->_prepareState = v22;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v25 = __ldaxr(p_shared_owners);
      while (__stlxr(v25 - 1, p_shared_owners));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v26 = (std::__shared_weak_count *)v31.__cntrl_;
    if (v31.__cntrl_)
    {
      v27 = (unint64_t *)((char *)v31.__cntrl_ + 8);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    atomic_store(0, (unint64_t *)&v18->_latestSeekTarget);
    objc_storeStrong((id *)&v18->_phaseQueue, a7);
    atomic_store(1u, (unsigned __int8 *)&v18->_shouldExecuteCommand);
  }

  return v18;
}

- (REPHASESoundEvent)initWithEngine:(id)a3 soundEventAsset:(id)a4 source:(id)a5 listener:(id)a6 mixerParameters:(id)a7 audioSession:(id)a8 phaseQueue:(id)a9 outError:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  REPHASESoundEvent *v22;
  REPHASESoundEvent *v23;
  id v24;
  void *v25;
  uint64_t v26;
  PHASESoundEvent *soundEvent;
  void *v28;
  id v30;

  v16 = a3;
  v30 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = -[REPHASESoundEvent initWithEngine:source:listener:audioSession:phaseQueue:](self, "initWithEngine:source:listener:audioSession:phaseQueue:", v16, v17, v18, v20, v21);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_mixerParameters, a7);
    objc_storeStrong((id *)&v23->_soundEventAsset, a4);
    v24 = objc_alloc(MEMORY[0x24BDE32C8]);
    objc_msgSend(v30, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "initWithEngine:assetIdentifier:mixerParameters:error:", v16, v25, v19, a10);
    soundEvent = v23->_soundEvent;
    v23->_soundEvent = (PHASESoundEvent *)v26;

    -[REPHASESoundEvent soundEvent](v23, "soundEvent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {

      v23 = 0;
    }
  }

  return v23;
}

+ (void)controllerWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 normalizationMode:(int)a8 targetLUFS:(double)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 callback:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint8_t buf[16];

  v31 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a12;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3298]), "initWithValue:minimum:maximum:identifier:", CFSTR("gain"), 1.0, 0.0, 4.0);
  v25 = objc_opt_respondsToSelector();
  if ((v25 & 1) != 0)
  {
    v26 = (void *)MEMORY[0x24BDE3260];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = a8 == 1;
    objc_msgSend(v26, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:targetLKFS:calibrationMode:level:callback:", v31, v19, v24, v20, v21, v22, a11, 0, v30, v27, a10, v23);

  }
  else
  {
    v28 = *re::audioLogObjects((re *)v25);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_224FE9000, v28, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStreamController does not support target LKFS", buf, 2u);
    }
    LOBYTE(v29) = a8 == 1;
    objc_msgSend(MEMORY[0x24BDE3260], "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:normalize:calibrationMode:level:callback:", v31, v19, v24, v20, v21, v22, a11, v29, a10, v23);
  }

}

+ (void)eventWithEngine:(id)a3 streamUUID:(id)a4 mixerDefinition:(id)a5 source:(id)a6 listener:(id)a7 normalizationMode:(int)a8 targetLUFS:(double)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 audioSession:(id)a12 phaseQueue:(id)a13 callback:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  REPHASESoundEvent *v26;
  REPHASESoundEvent *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v32;
  id v33;
  id v34;
  _QWORD aBlock[4];
  REPHASESoundEvent *v36;
  id v37;

  v20 = a3;
  v34 = a4;
  v33 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v32 = v23;
  v26 = -[REPHASESoundEvent initWithEngine:source:listener:audioSession:phaseQueue:]([REPHASESoundEvent alloc], "initWithEngine:source:listener:audioSession:phaseQueue:", v20, v21, v22, v23, v24);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __175__REPHASESoundEvent_eventWithEngine_streamUUID_mixerDefinition_source_listener_normalizationMode_targetLUFS_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke;
  aBlock[3] = &unk_24ED3D850;
  v27 = v26;
  v36 = v27;
  v28 = v25;
  v37 = v28;
  v29 = _Block_copy(aBlock);
  LODWORD(v30) = a10;
  +[REPHASESoundEvent controllerWithEngine:streamUUID:mixerDefinition:source:listener:normalizationMode:targetLUFS:calibrationMode:calibrationLevel:callback:](REPHASESoundEvent, "controllerWithEngine:streamUUID:mixerDefinition:source:listener:normalizationMode:targetLUFS:calibrationMode:calibrationLevel:callback:", v20, v34, v33, v21, v22, a8, a9, a11, v30, v29);

}

void __175__REPHASESoundEvent_eventWithEngine_streamUUID_mixerDefinition_source_listener_normalizationMode_targetLUFS_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  re *v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a2;
  v7 = a3;
  v8 = *re::audioLogObjects(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_224FE9000, v8, OS_LOG_TYPE_DEBUG, "PHASEExternalOutputStreamController created", v9, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setExternalStream:", 0);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)eventWithEngine:(id)a3 streamUUID:(id)a4 maximumFramesToRender:(unsigned int)a5 audioFormat:(id)a6 audioUnit:(id)a7 renderBlock:(id)a8 mixerDefinition:(id)a9 source:(id)a10 listener:(id)a11 group:(id)a12 normalizationMode:(int)a13 calibrationMode:(int)a14 calibrationLevel:(double)a15 audioSession:(id)a16 phaseQueue:(id)a17 callback:(id)a18
{
  id v23;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  REPHASESoundEvent *v32;
  std::__shared_weak_count *v33;
  std::__shared_weak_count *v34;
  unsigned int v35;
  std::__shared_weak_count_vtbl *v36;
  unint64_t *p_shared_owners;
  REPHASESoundEvent *v38;
  id v39;
  uint64_t v40;
  _QWORD *v41;
  std::__shared_weak_count_vtbl *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  REPHASESoundEvent *v48;
  unint64_t v49;
  void *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  unint64_t v78;
  _QWORD v79[4];
  REPHASESoundEvent *v80;
  _QWORD *v81;
  std::__shared_weak_count *v82;
  _QWORD v83[4];
  id v84;
  REPHASESoundEvent *v85;
  id v86;
  _QWORD *v87;
  std::__shared_weak_count *v88;
  unsigned int v89;
  _QWORD aBlock[4];
  id v91;
  _QWORD *v92;
  std::__shared_weak_count *v93;
  uint64_t *v94;
  char v95;

  v23 = a3;
  v76 = a4;
  v72 = a6;
  v78 = (unint64_t)a7;
  v24 = (unint64_t)a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = v23;
  v73 = a12;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v77 = v28;
  v75 = v25;
  v74 = v27;
  v70 = v30;
  v71 = v29;
  v32 = -[REPHASESoundEvent initWithEngine:source:listener:audioSession:phaseQueue:]([REPHASESoundEvent alloc], "initWithEngine:source:listener:audioSession:phaseQueue:", v28, v26, v27, v29, v30);
  v33 = (std::__shared_weak_count *)operator new(0x48uLL);
  v34 = v33;
  v35 = v78 != 0;
  if (v24)
    ++v35;
  if (v25)
    v36 = (std::__shared_weak_count_vtbl *)(v35 + 1);
  else
    v36 = (std::__shared_weak_count_vtbl *)v35;
  v33->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v33->__shared_owners_;
  v33->__shared_weak_owners_ = 0;
  v33->__vftable = (std::__shared_weak_count_vtbl *)&off_24ED3DA80;
  v38 = v32;
  v39 = v31;
  v34[1].__vftable = v36;
  v34[1].__shared_weak_owners_ = 0;
  v34[2].__vftable = 0;
  v34[1].__shared_owners_ = 0;
  v94 = &v34[1].__shared_owners_;
  v95 = 0;
  if ((_DWORD)v36)
  {
    v40 = 8 * (_QWORD)v36;
    v41 = operator new(8 * (_QWORD)v36);
    v34[1].__shared_owners_ = (uint64_t)v41;
    v34[1].__shared_weak_owners_ = (uint64_t)v41;
    v42 = (std::__shared_weak_count_vtbl *)&v41[(_QWORD)v36];
    v34[2].__vftable = v42;
    do
    {
      *v41++ = 0;
      v40 -= 8;
    }
    while (v40);
    v34[1].__shared_weak_owners_ = (uint64_t)v42;
  }
  v34[2].__shared_owners_ = (uint64_t)v38;
  v34[2].__shared_weak_owners_ = (uint64_t)_Block_copy(v39);

  v43 = 0;
  v92 = &v34[1].__vftable;
  v93 = v34;
  if (v78 | v24)
  {
    v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3268]), "initWithStreamType:format:maximumFramesToRender:", 0, v72, a5);
    v67 = v39;
    if (v78)
    {
      objc_msgSend((id)v78, "renderBlock");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke;
      aBlock[3] = &unk_24ED3D878;
      v91 = v44;
      v46 = v44;
      v47 = _Block_copy(aBlock);

      v24 = (unint64_t)v47;
    }
    else
    {
      v45 = MEMORY[0x24BDAC760];
    }
    v83[0] = v45;
    v83[1] = 3321888768;
    v83[2] = __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_2;
    v83[3] = &unk_24ED3D8A0;
    v84 = (id)v78;
    v89 = a5;
    v48 = v38;
    v85 = v48;
    v43 = (id)v24;
    v86 = v43;
    v87 = &v34[1].__vftable;
    v88 = v34;
    do
      v49 = __ldxr(p_shared_owners);
    while (__stxr(v49 + 1, p_shared_owners));
    v50 = _Block_copy(v83);
    objc_msgSend(MEMORY[0x24BDE3258], "streamWithEngine:uuid:definition:startsPaused:delegate:renderBlock:callback:", v28, v76, v68, 1, v48, v43, v50);

    v51 = v88;
    v39 = v67;
    if (v88)
    {
      v52 = (unint64_t *)&v88->__shared_owners_;
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }

  }
  v54 = (void *)v78;
  v55 = v75;
  if (v75)
  {
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3298]), "initWithValue:minimum:maximum:identifier:", CFSTR("gain"), 1.0, 0.0, 4.0);
    v57 = (void *)MEMORY[0x24BDE3260];
    v79[0] = MEMORY[0x24BDAC760];
    v79[1] = 3321888768;
    v79[2] = __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_26;
    v79[3] = &unk_24ED3D8D8;
    v80 = v38;
    v81 = v92;
    v82 = v93;
    if (v93)
    {
      v58 = (unint64_t *)&v93->__shared_owners_;
      do
        v59 = __ldxr(v58);
      while (__stxr(v59 + 1, v58));
    }
    LOBYTE(v66) = a13 == 1;
    v55 = v75;
    objc_msgSend(v57, "controllerWithEngine:streamUUID:gainMetaParameterDefinition:mixerDefinition:source:listener:group:normalize:calibrationMode:level:callback:", v77, v76, v56, v75, v26, v74, a15, v73, v66, a14, v79);
    v60 = v82;
    v54 = (void *)v78;
    if (v82)
    {
      v61 = (unint64_t *)&v82->__shared_owners_;
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }

  }
  v63 = v93;
  if (v93)
  {
    v64 = (unint64_t *)&v93->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }

}

uint64_t __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  int v4;

  v4 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a2 = (v4 & 0x10) != 0;
  return result;
}

void __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  re *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  re *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
LABEL_6:
    if (v7)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = *(void **)(a1 + 32);
  if (!v8)
  {
    v7 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "setMaximumFramesToRender:", *(unsigned int *)(a1 + 72));
  v9 = *(void **)(a1 + 32);
  v16 = 0;
  v10 = objc_msgSend(v9, "allocateRenderResourcesAndReturnError:", &v16);
  v11 = (re *)v16;
  v7 = v11;
  if ((v10 & 1) != 0)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "setExternalStream:", v5);
    objc_msgSend(*(id *)(a1 + 40), "setAudioUnit:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setRenderBlock:", *(_QWORD *)(a1 + 48));
    goto LABEL_12;
  }
  v12 = *re::audioLogObjects(v11);
  v6 = (re *)os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (!(_DWORD)v6)
    goto LABEL_6;
  *(_DWORD *)buf = 138412290;
  v20 = v7;
  _os_log_error_impl(&dword_224FE9000, v12, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStream unable to allocate AU: %@", buf, 0xCu);
  if (!v7)
  {
LABEL_7:
    v13 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18 = CFSTR("unknown error");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -210, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:
  v15 = *re::audioLogObjects(v6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_error_impl(&dword_224FE9000, v15, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStream failed creation %@", buf, 0xCu);
  }
LABEL_12:
  re::MultipleCallbackManager<REPHASESoundEvent>::complete(*(unint64_t **)(a1 + 56), v7);

}

void __226__REPHASESoundEvent_eventWithEngine_streamUUID_maximumFramesToRender_audioFormat_audioUnit_renderBlock_mixerDefinition_source_listener_group_normalizationMode_calibrationMode_calibrationLevel_audioSession_phaseQueue_callback___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v6;
  re *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    if (!v7)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BDD0FC8];
      v15[0] = CFSTR("unknown error");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -210, v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = *re::audioLogObjects(v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_224FE9000, v11, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Prepare] PHASEExternalOutputStreamController failed creation %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), a2);
    v8 = 0;
  }
  re::MultipleCallbackManager<REPHASESoundEvent>::complete(*(unint64_t **)(a1 + 40), v8);

}

- (void)dealloc
{
  objc_super v3;

  -[REPHASESoundEvent stopAndDestroy](self, "stopAndDestroy");
  v3.receiver = self;
  v3.super_class = (Class)REPHASESoundEvent;
  -[REPHASESoundEvent dealloc](&v3, sel_dealloc);
}

- (void)stream:(id)a3 didInvalidateWithError:(id)a4
{
  re *v4;
  NSObject *v5;
  int v6;
  re *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (re *)a4;
  v5 = *re::audioLogObjects(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_224FE9000, v5, OS_LOG_TYPE_ERROR, "Could not create PHASEExternalOutputStream: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (unint64_t)changeToState:(unint64_t)a3
{
  atomic<REAudioPlaybackState> *p_state;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  int v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t Instance;
  uint64_t v14;
  re::AudioManagerTelemetryReporter *v15;
  uint64_t v16;
  REPHASESoundPrepareState *ptr;
  int v18;
  uint64_t v19;
  int v21;
  void **v22;
  void **v23;
  void **v24;
  void *__p[2];
  char v26;
  void *v27[2];
  char v28;
  _BYTE block[24];
  void **v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  p_state = &self->_state;
  v6 = atomic_load(&self->_state.__a_.__a_value);
  v7 = __ldaxr(&self->_state.__a_.__a_value);
  if (v7 == v6)
  {
    if (!__stlxr(a3, &p_state->__a_.__a_value))
      goto LABEL_10;
  }
  else
  {
    __clrex();
  }
  do
  {
    while (1)
    {
      v6 = v7;
      v7 = __ldaxr(&p_state->__a_.__a_value);
      if (v7 == v6)
        break;
      __clrex();
    }
  }
  while (__stlxr(a3, &p_state->__a_.__a_value));
LABEL_10:
  v8 = (id)*re::audioLogObjects((re *)self);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    re::audio::nameForPlaybackState(v6, v27);
    v21 = v28;
    v22 = (void **)v27[0];
    re::audio::nameForPlaybackState(a3, __p);
    v23 = v27;
    if (v21 < 0)
      v23 = v22;
    if (v26 >= 0)
      v24 = __p;
    else
      v24 = (void **)__p[0];
    *(_DWORD *)block = 138412802;
    *(_QWORD *)&block[4] = self;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = v23;
    *(_WORD *)&block[22] = 2080;
    v30 = v24;
    _os_log_debug_impl(&dword_224FE9000, v8, OS_LOG_TYPE_DEBUG, "%@ changed state from %s to %s", block, 0x20u);
    if (v26 < 0)
      operator delete(__p[0]);
    if (v28 < 0)
      operator delete(v27[0]);
  }

  -[REPHASESoundEvent playbackStateChangeHandler](self, "playbackStateChangeHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v6 == a3;
  else
    v10 = 1;
  v11 = !v10;

  if (v11)
  {
    -[REPHASESoundEvent playbackStateChangeHandler](self, "playbackStateChangeHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, v6, a3);

  }
  if (a3 == 1 && !-[REPHASESoundEvent soundEventPlayed](self, "soundEventPlayed"))
  {
    Instance = re::AudioManagerTelemetryReporter::getInstance((re::AudioManagerTelemetryReporter *)-[REPHASESoundEvent setSoundEventPlayed:](self, "setSoundEventPlayed:", 1));
    v14 = MEMORY[0x24BDAC760];
    *(_QWORD *)block = MEMORY[0x24BDAC760];
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___ZN2re29AudioManagerTelemetryReporter22reportSoundEventPlayedEv_block_invoke;
    v30 = (void **)&__block_descriptor_40_e5_v8__0l;
    v31 = Instance;
    dispatch_async((dispatch_queue_t)re::AudioManagerTelemetryReporter::m_managerQueue, block);
    v16 = re::AudioManagerTelemetryReporter::getInstance(v15);
    ptr = self->_prepareState.__ptr_;
    v18 = *((_DWORD *)ptr + 53);
    v19 = *((_QWORD *)ptr + 27);
    *(_QWORD *)block = v14;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___ZN2re29AudioManagerTelemetryReporter31updateCalibrationModeStatisticsE22REAudioCalibrationModed_block_invoke;
    v30 = (void **)&__block_descriptor_52_e5_v8__0l;
    v31 = v16;
    v33 = v18;
    v32 = v19;
    dispatch_async((dispatch_queue_t)re::AudioManagerTelemetryReporter::m_managerQueue, block);
  }
  return v6;
}

- (BOOL)changeFromExpectedState:(unint64_t)a3 toState:(unint64_t)a4
{
  atomic<REAudioPlaybackState> *p_state;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL4 v14;
  int v16;
  void **v17;
  void **v18;
  void **v19;
  int v20;
  void **v21;
  void **v22;
  void **v23;
  void *__p[2];
  char v25;
  void *v26[2];
  char v27;
  uint8_t buf[4];
  REPHASESoundEvent *v29;
  __int16 v30;
  void **v31;
  __int16 v32;
  void **v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  p_state = &self->_state;
  while (1)
  {
    v8 = __ldaxr(&p_state->__a_.__a_value);
    if (v8 != a3)
      break;
    if (!__stlxr(a4, &p_state->__a_.__a_value))
    {
      v9 = 1;
      goto LABEL_6;
    }
  }
  v9 = 0;
  __clrex();
LABEL_6:
  v10 = (id)*re::audioLogObjects((re *)self);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!v9)
  {
    if (v11)
    {
      re::audio::nameForPlaybackState(v8, v26);
      v20 = v27;
      v21 = (void **)v26[0];
      re::audio::nameForPlaybackState(a4, __p);
      v22 = v26;
      if (v20 < 0)
        v22 = v21;
      if (v25 >= 0)
        v23 = __p;
      else
        v23 = (void **)__p[0];
      *(_DWORD *)buf = 138412802;
      v29 = self;
      v30 = 2080;
      v31 = v22;
      v32 = 2080;
      v33 = v23;
      _os_log_debug_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEBUG, "%@ state was not changed from expected state %s to %s", buf, 0x20u);
      if (v25 < 0)
        operator delete(__p[0]);
      if (v27 < 0)
        operator delete(v26[0]);
    }
    goto LABEL_17;
  }
  if (v11)
  {
    re::audio::nameForPlaybackState(a3, v26);
    v16 = v27;
    v17 = (void **)v26[0];
    re::audio::nameForPlaybackState(a4, __p);
    v18 = v26;
    if (v16 < 0)
      v18 = v17;
    if (v25 >= 0)
      v19 = __p;
    else
      v19 = (void **)__p[0];
    *(_DWORD *)buf = 138412802;
    v29 = self;
    v30 = 2080;
    v31 = v18;
    v32 = 2080;
    v33 = v19;
    _os_log_debug_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEBUG, "%@ changed state from %s to %s", buf, 0x20u);
    if (v25 < 0)
      operator delete(__p[0]);
    if (v27 < 0)
      operator delete(v26[0]);
  }

  -[REPHASESoundEvent playbackStateChangeHandler](self, "playbackStateChangeHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a3 != a4 && v12 != 0;

  if (v14)
  {
    -[REPHASESoundEvent playbackStateChangeHandler](self, "playbackStateChangeHandler");
    v10 = objc_claimAutoreleasedReturnValue();
    ((void (*)(NSObject *, unint64_t, unint64_t))v10[2].isa)(v10, a3, a4);
LABEL_17:

  }
  return v9;
}

- (BOOL)_start
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *p_p;
  const char *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  void *v19;
  BOOL v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  char v35;
  id v36;
  re *v37;
  NSObject *v38;
  void *v39;
  BOOL v40;
  char v41;
  void *v42;
  void *v43;
  double v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  _BOOL4 v48;
  NSObject *v49;
  id v51;
  _QWORD v52[5];
  id v53;
  void *__p;
  std::__shared_weak_count *v55;
  char v56;
  _BYTE location[32];
  __int128 v58;
  __int128 v59;
  int buf;
  _BYTE buf_4[18];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = *((unsigned __int8 *)self->_prepareState.__ptr_ + 208);
  v4 = (id)*re::audioLogObjects((re *)self);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5)
      goto LABEL_14;
    v6 = *((_QWORD *)self->_prepareState.__ptr_ + 3);
    -[REPHASESoundEvent sourcePose](self, "sourcePose");
    *(_OWORD *)location = v7;
    *(_OWORD *)&location[16] = v8;
    v58 = v9;
    v59 = v10;
    re::audio::stringFromPose((re::audio *)location, &__p);
    if (v56 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    buf = 134218243;
    *(_QWORD *)buf_4 = v6;
    *(_WORD *)&buf_4[8] = 2085;
    *(_QWORD *)&buf_4[10] = p_p;
    v12 = "-[REPHASESoundEvent _start] starting event for token %llu, pose=%{sensitive}s";
  }
  else
  {
    if (!v5)
      goto LABEL_14;
    v13 = *((_QWORD *)self->_prepareState.__ptr_ + 3);
    -[REPHASESoundEvent sourcePose](self, "sourcePose");
    *(_OWORD *)location = v14;
    *(_OWORD *)&location[16] = v15;
    v58 = v16;
    v59 = v17;
    re::audio::stringFromPose((re::audio *)location, &__p);
    if (v56 >= 0)
      v18 = &__p;
    else
      v18 = __p;
    buf = 134218242;
    *(_QWORD *)buf_4 = v13;
    *(_WORD *)&buf_4[8] = 2080;
    *(_QWORD *)&buf_4[10] = v18;
    v12 = "-[REPHASESoundEvent _start] starting event for token %llu, pose=%s";
  }
  _os_log_impl(&dword_224FE9000, v4, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&buf, 0x16u);
  if (v56 < 0)
    operator delete(__p);
LABEL_14:

  -[REPHASESoundEvent soundEvent](self, "soundEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
  {
    v31 = 0;
  }
  else
  {
    if (re::internal::enableSignposts(0, 0))
    {
      -[REPHASESoundEvent prepareState](self, "prepareState");
      -[REPHASESoundEvent prepareState](self, "prepareState");
      -[REPHASESoundEvent prepareState](self, "prepareState");
      kdebug_trace();
      v21 = *(std::__shared_weak_count **)&buf_4[4];
      if (*(_QWORD *)&buf_4[4])
      {
        v22 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      v24 = v55;
      if (v55)
      {
        p_shared_owners = (unint64_t *)&v55->__shared_owners_;
        do
          v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      v27 = *(std::__shared_weak_count **)&location[8];
      if (*(_QWORD *)&location[8])
      {
        v28 = (unint64_t *)(*(_QWORD *)&location[8] + 8);
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
    objc_initWeak((id *)location, self);
    -[REPHASESoundEvent soundEvent](self, "soundEvent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __27__REPHASESoundEvent__start__block_invoke;
    v52[3] = &unk_24ED3D960;
    objc_copyWeak(&v53, (id *)location);
    v52[4] = self;
    objc_msgSend(v30, "startWithCompletion:", v52);

    objc_destroyWeak(&v53);
    objc_destroyWeak((id *)location);
    v31 = 1;
  }
  -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31;
  if (v32)
  {

    -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v35 = objc_msgSend(v34, "startAndReturnError:", &v51);
    v36 = v51;

    if ((v35 & 1) != 0)
    {
      v31 = 1;
    }
    else
    {
      v38 = *re::audioLogObjects(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = self;
        *(_WORD *)&location[12] = 2112;
        *(_QWORD *)&location[14] = v36;
        _os_log_error_impl(&dword_224FE9000, v38, OS_LOG_TYPE_ERROR, "%@ start failed with %@", location, 0x16u);
      }
      v31 = 0;
    }

    v33 = 1;
  }
  -[REPHASESoundEvent externalStream](self, "externalStream");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    if (v31)
      v40 = 1;
    else
      v40 = v33 == 0;
    v41 = !v40;

    if ((v41 & 1) == 0)
    {
      -[REPHASESoundEvent externalStream](self, "externalStream");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "resume");

LABEL_51:
      if (self->_stationaryTime.__engaged_)
        self->_stationaryTime.__engaged_ = 0;
      -[REPHASESoundEvent changeToState:](self, "changeToState:", 1);
      -[REPHASESoundEvent observer](self, "observer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[REPHASESoundEvent prepareState](self, "prepareState");
      LODWORD(v44) = *(_DWORD *)(*(_QWORD *)location + 200);
      objc_msgSend(v43, "soundDidStartOrResume:withGain:", self, v44);
      v45 = *(std::__shared_weak_count **)&location[8];
      if (*(_QWORD *)&location[8])
      {
        v46 = (unint64_t *)(*(_QWORD *)&location[8] + 8);
        do
          v47 = __ldaxr(v46);
        while (__stlxr(v47 - 1, v46));
        if (!v47)
        {
          ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
          std::__shared_weak_count::__release_weak(v45);
        }
      }

      LOBYTE(v48) = 1;
      return v48;
    }
  }
  else if (v31 && v33)
  {
    goto LABEL_51;
  }
  v49 = *re::audioLogObjects((re *)v39);
  v48 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
  if (v48)
  {
    *(_DWORD *)location = 138412290;
    *(_QWORD *)&location[4] = self;
    _os_log_error_impl(&dword_224FE9000, v49, OS_LOG_TYPE_ERROR, "Failed to start %@", location, 0xCu);
    LOBYTE(v48) = 0;
  }
  return v48;
}

void __27__REPHASESoundEvent__start__block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  re *WeakRetained;
  re *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];
  id v11[2];
  uint8_t buf[4];
  re *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 40);
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      v14 = 2048;
      v15 = a2;
      _os_log_debug_impl(&dword_224FE9000, v7, OS_LOG_TYPE_DEBUG, "%@ received sound event completion callback with reason %ld", buf, 0x16u);
    }
    v8 = *((_QWORD *)v6 + 26);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__REPHASESoundEvent__start__block_invoke_29;
    block[3] = &unk_24ED3D938;
    objc_copyWeak(v11, v4);
    v9 = *(_QWORD *)(a1 + 32);
    v11[1] = a2;
    block[4] = v9;
    dispatch_async(v8, block);
    objc_destroyWeak(v11);
  }

}

void __27__REPHASESoundEvent__start__block_invoke_29(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  unsigned __int8 v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  re *v35;
  NSObject *v36;
  _QWORD v37[4];
  unsigned __int8 *v38;
  id v39;
  std::__shared_weak_count *v40;
  int buf;
  _BYTE buf_4[18];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_50;
  atomic_store(0, WeakRetained + 65);
  v4 = *(_QWORD *)(a1 + 48);
  switch(v4)
  {
    case 2:
      v8 = *re::audioLogObjects((re *)WeakRetained);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        buf = 138412290;
        *(_QWORD *)buf_4 = v3;
        _os_log_impl(&dword_224FE9000, v8, OS_LOG_TYPE_DEFAULT, "%@ killed.", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_15;
    case 1:
      v9 = atomic_load(WeakRetained + 64);
      v10 = *re::audioLogObjects((re *)WeakRetained);
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if ((v9 & 1) == 0)
      {
        if (v11)
        {
          buf = 138412290;
          *(_QWORD *)buf_4 = v3;
          v7 = 2;
          _os_log_debug_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEBUG, "%@ finished playing.", (uint8_t *)&buf, 0xCu);
          v6 = 1;
          goto LABEL_16;
        }
        break;
      }
      if (v11)
      {
        buf = 138412290;
        *(_QWORD *)buf_4 = v3;
        _os_log_debug_impl(&dword_224FE9000, v10, OS_LOG_TYPE_DEBUG, "%@ stopped.", (uint8_t *)&buf, 0xCu);
      }
LABEL_15:
      v6 = 0;
      v7 = 0;
      goto LABEL_16;
    case 0:
      v5 = *re::audioLogObjects((re *)WeakRetained);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        buf = 138412290;
        *(_QWORD *)buf_4 = v3;
        _os_log_error_impl(&dword_224FE9000, v5, OS_LOG_TYPE_ERROR, "%@ finished with error.", (uint8_t *)&buf, 0xCu);
      }
      v6 = 0;
      v7 = 5;
      goto LABEL_16;
  }
  v6 = 1;
  v7 = 2;
LABEL_16:
  if (re::internal::enableSignposts(0, 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "prepareState");
    objc_msgSend(*(id *)(a1 + 32), "soundEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ioStartHostTime");
    objc_msgSend(*(id *)(a1 + 32), "soundEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preparedHostTime");
    objc_msgSend(*(id *)(a1 + 32), "prepareState");
    kdebug_trace();
    if (v40)
    {
      p_shared_owners = &v40->__shared_owners_;
      do
        v15 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v15 - 1, (unint64_t *)p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }

    v16 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v17 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
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
  if (re::internal::enableSignposts(0, 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "prepareState");
    objc_msgSend(*(id *)(a1 + 32), "prepareState");
    kdebug_trace();
    if (v40)
    {
      v19 = &v40->__shared_owners_;
      do
        v20 = __ldaxr((unint64_t *)v19);
      while (__stlxr(v20 - 1, (unint64_t *)v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    v21 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(_QWORD *)&buf_4[4])
    {
      v22 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
  objc_msgSend(v3, "changeToState:", v7);
  if (!v6)
    goto LABEL_49;
  if (!*(_BYTE *)(*((_QWORD *)v3 + 37) + 103))
  {
    v24 = *((_QWORD *)v3 + 25);
    if (v24)
    {
      (*(void (**)(void))(v24 + 16))();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v27 = (void *)*((_QWORD *)v3 + 30);
      *((_QWORD *)v3 + 30) = v25;
    }
    else
    {
      v28 = objc_alloc(MEMORY[0x24BDE32C8]);
      v29 = *((_QWORD *)v3 + 9);
      objc_msgSend(*((id *)v3 + 13), "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *((_QWORD *)v3 + 12);
      v39 = 0;
      v31 = objc_msgSend(v28, "initWithEngine:assetIdentifier:mixerParameters:error:", v29, v27, v30, &v39);
      v26 = v39;
      v32 = (void *)*((_QWORD *)v3 + 30);
      *((_QWORD *)v3 + 30) = v31;

    }
    objc_msgSend(v3, "soundEvent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    if (v34)
    {
      v36 = *re::audioLogObjects(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        buf = 138412546;
        *(_QWORD *)buf_4 = v3;
        *(_WORD *)&buf_4[8] = 2112;
        *(_QWORD *)&buf_4[10] = v26;
        _os_log_error_impl(&dword_224FE9000, v36, OS_LOG_TYPE_ERROR, "%@ failed to re-create after completion, error: %@", (uint8_t *)&buf, 0x16u);
      }
      objc_msgSend(v3, "changeToState:", 5);
    }
    else
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __27__REPHASESoundEvent__start__block_invoke_30;
      v37[3] = &unk_24ED3D910;
      v38 = v3;
      objc_msgSend(v38, "prepareWithCompletion:", v37);

    }
LABEL_49:
    atomic_store(1u, v3 + 65);
  }
LABEL_50:

}

void __27__REPHASESoundEvent__start__block_invoke_30(uint64_t a1, void *a2)
{
  re *v3;
  re *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  re *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *re::audioLogObjects(v3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_224FE9000, v5, OS_LOG_TYPE_ERROR, "%@ failed to re-prepare after completion: %@", (uint8_t *)&v7, 0x16u);
    }
  }

}

- (BOOL)_resume
{
  REPHASESoundEvent *v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  double v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  _BYTE buf[22];
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x24BDAC8D0];
  v3 = atomic_load(&self->_state.__a_.__a_value);
  switch(v3)
  {
    case 0uLL:
    case 2uLL:
    case 5uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
      v4 = (id)*re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        -[REPHASESoundEvent prepareState](v2, "prepareState");
        v19 = *(_QWORD *)(v25 + 24);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v3;
        _os_log_error_impl(&dword_224FE9000, v4, OS_LOG_TYPE_ERROR, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, can't resume from this state %llu: ", buf, 0x16u);
        if (v26)
        {
          p_shared_owners = &v26->__shared_owners_;
          do
            v21 = __ldaxr((unint64_t *)p_shared_owners);
          while (__stlxr(v21 - 1, (unint64_t *)p_shared_owners));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
        }
      }

      LOBYTE(self) = 0;
      break;
    case 1uLL:
    case 0xBuLL:
      v5 = (id)*re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[REPHASESoundEvent prepareState](v2, "prepareState");
        v22 = *(_QWORD *)(v25 + 24);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v3;
        _os_log_debug_impl(&dword_224FE9000, v5, OS_LOG_TYPE_DEBUG, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, do nothing for redundant calls to resume, just report success. state %llu: ", buf, 0x16u);
        std::shared_ptr<re::AssetManager>::~shared_ptr[abi:nn180100]((uint64_t)&v25);
      }
      goto LABEL_20;
    case 3uLL:
      v6 = (id)*re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[REPHASESoundEvent prepareState](v2, "prepareState");
        v23 = *(_QWORD *)(v25 + 24);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 3;
        _os_log_debug_impl(&dword_224FE9000, v6, OS_LOG_TYPE_DEBUG, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, resume the sound event. state %llu: ", buf, 0x16u);
        std::shared_ptr<re::AssetManager>::~shared_ptr[abi:nn180100]((uint64_t)&v25);
      }

      -[REPHASESoundEvent soundEvent](v2, "soundEvent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == 0;

      if (!v8)
      {
        -[REPHASESoundEvent soundEvent](v2, "soundEvent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "resume");

      }
      -[REPHASESoundEvent externalStream](v2, "externalStream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

      if (!v11)
      {
        -[REPHASESoundEvent externalStream](v2, "externalStream");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "resume");

      }
      if (v2->_stationaryTime.__engaged_)
        v2->_stationaryTime.__engaged_ = 0;
      -[REPHASESoundEvent changeToState:](v2, "changeToState:", 1);
      -[REPHASESoundEvent observer](v2, "observer");
      v5 = objc_claimAutoreleasedReturnValue();
      -[REPHASESoundEvent prepareState](v2, "prepareState");
      LODWORD(v13) = *(_DWORD *)(*(_QWORD *)buf + 200);
      -[NSObject soundDidStartOrResume:withGain:](v5, "soundDidStartOrResume:withGain:", v2, v13);
      v14 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
LABEL_20:

      LOBYTE(self) = 1;
      break;
    case 4uLL:
      v17 = (id)*re::audioLogObjects((re *)self);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        -[REPHASESoundEvent prepareState](v2, "prepareState");
        v24 = *(_QWORD *)(v25 + 24);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 4;
        _os_log_debug_impl(&dword_224FE9000, v17, OS_LOG_TYPE_DEBUG, "[RE/PHASE] [Resume] REPHASESoundEvent: playbackToken %llu, start the sound event. state %llu: ", buf, 0x16u);
        std::shared_ptr<re::AssetManager>::~shared_ptr[abi:nn180100]((uint64_t)&v25);
      }

      LOBYTE(self) = -[REPHASESoundEvent _start](v2, "_start");
      break;
    default:
      return self & 1;
  }
  return self & 1;
}

- (BOOL)_pause
{
  unint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = atomic_load(&self->_state.__a_.__a_value);
  if (v2 - 3 < 2)
    return 1;
  if (v2 == 1)
  {
    -[REPHASESoundEvent soundEvent](self, "soundEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[REPHASESoundEvent soundEvent](self, "soundEvent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pause");

    }
    -[REPHASESoundEvent externalStream](self, "externalStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[REPHASESoundEvent externalStream](self, "externalStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pause");

    }
    -[REPHASESoundEvent changeToState:](self, "changeToState:", 3);
    -[REPHASESoundEvent observer](self, "observer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "soundDidPause:", self);

    return 1;
  }
  return 0;
}

- (BOOL)_stopAndDestroy
{
  void *v3;
  void *v4;
  PHASESoundEvent *soundEvent;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHASEExternalOutputStreamController *externalStreamController;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  PHASEExternalOutputStream *externalStream;

  atomic_store(1u, (unsigned __int8 *)&self->_isStopping);
  -[REPHASESoundEvent soundEvent](self, "soundEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[REPHASESoundEvent soundEvent](self, "soundEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAndInvalidate");

    soundEvent = self->_soundEvent;
    self->_soundEvent = 0;

  }
  if (self->_soundEventAsset)
  {
    -[PHASEEngine assetRegistry](self->_engine, "assetRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASESoundEventNodeAsset identifier](self->_soundEventAsset, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterAssetWithIdentifier:completion:", v7, 0);

  }
  -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAndInvalidate");

    externalStreamController = self->_externalStreamController;
    self->_externalStreamController = 0;

  }
  -[REPHASESoundEvent externalStream](self, "externalStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[REPHASESoundEvent externalStream](self, "externalStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    -[REPHASESoundEvent externalStream](self, "externalStream");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) != 0)
      objc_msgSend(v14, "stopAndInvalidate");
    else
      objc_msgSend(v14, "pause");

    externalStream = self->_externalStream;
    self->_externalStream = 0;

  }
  -[REPHASESoundEvent changeToState:](self, "changeToState:", 0);
  return 1;
}

- (BOOL)_seekToTime:(double)a3
{
  unint64_t v5;
  void *v7;
  re *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13[3];
  uint8_t buf[4];
  REPHASESoundEvent *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = atomic_load(&self->_state.__a_.__a_value);
  if (v5 > 0xD)
    goto LABEL_7;
  if (((1 << v5) & 0x3E25) != 0)
    return 0;
  if (((1 << v5) & 0x18) == 0
    || !self->_stationaryTime.__engaged_
    || vabdd_f64(self->_stationaryTime.var0.__val_, a3) >= 0.0000208333333)
  {
LABEL_7:
    -[REPHASESoundEvent soundEvent](self, "soundEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v9 = *re::audioLogObjects(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v15 = self;
        v16 = 2048;
        v17 = a3;
        _os_log_impl(&dword_224FE9000, v9, OS_LOG_TYPE_INFO, "%@ seeking to %5.3f", buf, 0x16u);
      }
      v10 = -[REPHASESoundEvent changeToState:](self, "changeToState:", 12);
      atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_latestSeekTarget);
      objc_initWeak((id *)buf, self);
      -[REPHASESoundEvent soundEvent](self, "soundEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __33__REPHASESoundEvent__seekToTime___block_invoke;
      v12[3] = &unk_24ED3D988;
      objc_copyWeak(v13, (id *)buf);
      v13[1] = *(id *)&a3;
      v13[2] = v10;
      objc_msgSend(v11, "seekToTime:completion:", v12, a3);

      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
      return 0;
    }
  }
  return 1;
}

void __33__REPHASESoundEvent__seekToTime___block_invoke(uint64_t a1, uint64_t a2)
{
  char *WeakRetained;
  char *v5;
  re *v6;
  uint64_t v7;
  void **v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  re *v23;
  re *v24;
  NSObject *v25;
  void *v26;
  _BYTE v27[40];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_21;
  if (a2 != 2)
  {
    v14 = *re::audioLogObjects((re *)WeakRetained);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 138412290;
      *(_QWORD *)&v27[4] = v5;
      _os_log_error_impl(&dword_224FE9000, v14, OS_LOG_TYPE_ERROR, "%@ failed to seek.", v27, 0xCu);
    }
    goto LABEL_16;
  }
  std::recursive_mutex::lock((std::recursive_mutex *)(WeakRetained + 112));
  v7 = *((_QWORD *)v5 + 6);
  if (v7)
  {
    v8 = (void **)*((_QWORD *)v5 + 2);
    v9 = *((_QWORD *)v5 + 5);
    v10 = *(uint64_t *)((char *)v8 + ((v9 >> 5) & 0x7FFFFFFFFFFFFF8));
    v11 = v9;
    v12 = (int *)(v10 + 16 * v9);
    if (*v12 == 2 && *(double *)(v10 + 16 * v9 + 8) == *(double *)(a1 + 40))
    {
      v13 = v9 + 1;
      *((_QWORD *)v5 + 5) = v13;
      *((_QWORD *)v5 + 6) = v7 - 1;
      if (v13 >= 0x200)
      {
        operator delete(*v8);
        *((_QWORD *)v5 + 2) += 8;
        *((_QWORD *)v5 + 5) -= 256;
      }
      if (*(_QWORD *)(a1 + 48) != 1)
      {
        *((_QWORD *)v5 + 22) = *(_QWORD *)(a1 + 40);
        v5[184] = 1;
      }
      goto LABEL_15;
    }
    v15 = *re::audioLogObjects(v6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *v12;
      v17 = *(_QWORD *)(v10 + 16 * v11 + 8);
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v27 = 138413058;
      *(_QWORD *)&v27[4] = v5;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = v16;
      *(_WORD *)&v27[18] = 2048;
      *(_QWORD *)&v27[20] = v17;
      *(_WORD *)&v27[28] = 2048;
      *(_QWORD *)&v27[30] = v18;
      v19 = "%@ unexpected command %d, %0.2f at front of queue after seek to %0.2f";
      v20 = v15;
      v21 = 38;
LABEL_23:
      _os_log_error_impl(&dword_224FE9000, v20, OS_LOG_TYPE_ERROR, v19, v27, v21);
    }
  }
  else
  {
    v22 = *re::audioLogObjects(v6);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 138412290;
      *(_QWORD *)&v27[4] = v5;
      v19 = "%@ unexpectedly empty command queue after seek";
      v20 = v22;
      v21 = 12;
      goto LABEL_23;
    }
  }
LABEL_15:
  std::recursive_mutex::unlock((std::recursive_mutex *)(v5 + 112));
LABEL_16:
  v23 = (re *)objc_msgSend(v5, "changeToState:", *(_QWORD *)(a1 + 48), *(_OWORD *)v27, *(_QWORD *)&v27[16], *(_OWORD *)&v27[24], v28);
  v24 = v23;
  if (v23 != (re *)12)
  {
    v25 = *re::audioLogObjects(v23);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v27 = 138412546;
      *(_QWORD *)&v27[4] = v5;
      *(_WORD *)&v27[12] = 2048;
      *(_QWORD *)&v27[14] = v24;
      _os_log_error_impl(&dword_224FE9000, v25, OS_LOG_TYPE_ERROR, "%@ finished seeking in unexpected state %llu", v27, 0x16u);
    }
  }
  if (a2 == 2)
  {
    objc_msgSend(v5, "observer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "soundDidSeek:toTime:", v5, *(double *)(a1 + 40));

    objc_msgSend(v5, "updateCommandQueue");
  }
LABEL_21:

}

- (id)mixer
{
  void *v2;
  void *v3;
  void *v4;

  -[PHASESoundEvent mixers](self->_soundEvent, "mixers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateCommandQueue
{
  recursive_mutex *p_commandQueueMutex;

  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  -[REPHASESoundEvent _updateCommandQueue](self, "_updateCommandQueue");
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (void)_updateCommandQueue
{
  unsigned __int8 v2;
  unint64_t start;
  uint64_t v5;
  int v6;
  unint64_t value;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldExecuteCommand);
  if ((v2 & 1) != 0 && self->_commandQueue.c.__size_.__value_)
  {
    start = self->_commandQueue.c.__start_;
    do
    {
      v5 = *(uint64_t *)((char *)self->_commandQueue.c.__map_.__begin_ + ((start >> 5) & 0x7FFFFFFFFFFFFF8));
      v6 = *(_DWORD *)(v5 + 16 * start);
      if (v6)
      {
        if (v6 == 2)
        {
          if (!-[REPHASESoundEvent _seekToTime:](self, "_seekToTime:", *(double *)(v5 + 16 * start + 8)))return;
        }
        else if (v6 != 1 || !-[REPHASESoundEvent _pause](self, "_pause"))
        {
          return;
        }
      }
      else if (!-[REPHASESoundEvent _resume](self, "_resume"))
      {
        return;
      }
      value = self->_commandQueue.c.__size_.__value_ - 1;
      start = self->_commandQueue.c.__start_ + 1;
      self->_commandQueue.c.__start_ = start;
      self->_commandQueue.c.__size_.__value_ = value;
      if (start >= 0x200)
      {
        operator delete(*(void **)self->_commandQueue.c.__map_.__begin_);
        ++self->_commandQueue.c.__map_.__begin_;
        value = self->_commandQueue.c.__size_.__value_;
        start = self->_commandQueue.c.__start_ - 256;
        self->_commandQueue.c.__start_ = start;
      }
    }
    while (value);
  }
}

- (void)prepareWithCompletion:(id)a3
{
  void *v4;
  uint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  float v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  re *v18;
  float v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v38;
  double v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  void *v43;
  double v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  void *v48;
  double v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  int v61;
  unint64_t *v62;
  unint64_t v63;
  void *v64;
  BOOL v65;
  void *v66;
  std::__shared_weak_count *v67;
  CMTimeFlags v68;
  CMTimeEpoch v69;
  unint64_t *v70;
  unint64_t v71;
  _BOOL4 v72;
  unint64_t *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  int v77;
  id v78;
  re *v79;
  re *v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  NSObject *v84;
  double Seconds;
  re *v86;
  NSObject *v87;
  void *v88;
  re *v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  NSObject *v93;
  void *v94;
  BOOL v95;
  NSObject *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  _QWORD v105[4];
  id v106[2];
  CMTime time;
  CMTime time2;
  CMTime time1;
  uint64_t v110;
  std::__shared_weak_count *v111;
  uint64_t v112;
  std::__shared_weak_count *v113;
  _QWORD aBlock[5];
  id v115;
  id v116[2];
  std::__shared_weak_count *v117;
  id location;
  uint64_t v119;
  const __CFString *v120;
  _BYTE buf[22];
  __int16 v122;
  double v123;
  __int16 v124;
  double v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  CMTimeValue v130;
  std::__shared_weak_count *v131;
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v101 = a3;
  -[REPHASESoundEvent playbackStateChangeHandler](self, "playbackStateChangeHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[REPHASESoundEvent prepareState](self, "prepareState");
    -[REPHASESoundEvent setPlaybackStateChangeHandler:](self, "setPlaybackStateChangeHandler:", *(_QWORD *)(*(_QWORD *)buf + 328));
    if (*(_QWORD *)&buf[8])
    {
      v73 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v74 = __ldaxr(v73);
      while (__stlxr(v74 - 1, v73));
      if (!v74)
      {
        (*(void (**)(_QWORD))(**(_QWORD **)&buf[8] + 16))(*(_QWORD *)&buf[8]);
        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
      }
    }
  }
  objc_initWeak(&location, self);
  if (re::internal::enableSignposts(0, 0))
  {
    -[REPHASESoundEvent prepareState](self, "prepareState");
    -[REPHASESoundEvent prepareState](self, "prepareState");
    -[REPHASESoundEvent prepareState](self, "prepareState");
    kdebug_trace();
    if (v117)
    {
      p_shared_owners = &v117->__shared_owners_;
      do
        v6 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v6 - 1, (unint64_t *)p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
        std::__shared_weak_count::__release_weak(v117);
      }
    }
    v7 = v131;
    if (v131)
    {
      v8 = (unint64_t *)&v131->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v10 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v11 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  v13 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__REPHASESoundEvent_prepareWithCompletion___block_invoke;
  aBlock[3] = &unk_24ED3D9B0;
  objc_copyWeak(v116, &location);
  aBlock[4] = self;
  v102 = v101;
  v115 = v102;
  v103 = _Block_copy(aBlock);
  -[REPHASESoundEvent prepareState](self, "prepareState");
  v14 = __exp10f(*(float *)(*(_QWORD *)buf + 188) / 20.0);
  v15 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v16 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  -[REPHASESoundEvent prepareState](self, "prepareState");
  v19 = __exp10f(*(float *)(*(_QWORD *)buf + 192) / 20.0);
  v20 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v21 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = (id)*re::audioLogObjects(v18);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[REPHASESoundEvent prepareState](self, "prepareState");
    v24 = *(float *)(v130 + 200);
    -[REPHASESoundEvent prepareState](self, "prepareState");
    v25 = *((float *)v116[1] + 49);
    -[REPHASESoundEvent prepareState](self, "prepareState");
    v26 = *(_QWORD *)(v112 + 24);
    -[REPHASESoundEvent prepareState](self, "prepareState");
    v27 = *(_QWORD *)(v110 + 64);
    *(_DWORD *)buf = 134219264;
    *(double *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v14;
    v122 = 2048;
    v123 = v19;
    v124 = 2048;
    v125 = v25;
    v126 = 2048;
    v127 = v26;
    v128 = 2048;
    v129 = v27;
    _os_log_impl(&dword_224FE9000, v23, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] REPHASESoundEvent preparing with gain=%.2f, reverb=%.2f, direct=%.2f, rate=%.2f for token=%llu, assetID=%llu", buf, 0x3Eu);
    if (v111)
    {
      v28 = &v111->__shared_owners_;
      do
        v29 = __ldaxr((unint64_t *)v28);
      while (__stlxr(v29 - 1, (unint64_t *)v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
        std::__shared_weak_count::__release_weak(v111);
      }
    }
    if (v113)
    {
      v30 = &v113->__shared_owners_;
      do
        v31 = __ldaxr((unint64_t *)v30);
      while (__stlxr(v31 - 1, (unint64_t *)v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
        std::__shared_weak_count::__release_weak(v113);
      }
    }
    v32 = v117;
    if (v117)
    {
      v33 = &v117->__shared_owners_;
      do
        v34 = __ldaxr((unint64_t *)v33);
      while (__stlxr(v34 - 1, (unint64_t *)v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    v35 = v131;
    if (v131)
    {
      v36 = (unint64_t *)&v131->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }

  -[REPHASESoundEvent paramForKey:](self, "paramForKey:", CFSTR("reverbSend"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v38;
  if (v38)
  {
    -[REPHASESoundEvent prepareState](self, "prepareState");
    LODWORD(v39) = *(_DWORD *)(*(_QWORD *)buf + 188);
    -[REPHASESoundEvent setCachedReverbSendLevel:](self, "setCachedReverbSendLevel:", v39);
    v40 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v41 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    objc_msgSend(v38, "fadeToValue:duration:", v14, 0.0);
  }
  -[REPHASESoundEvent paramForKey:](self, "paramForKey:", CFSTR("directSend"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[REPHASESoundEvent prepareState](self, "prepareState");
    LODWORD(v44) = *(_DWORD *)(*(_QWORD *)buf + 192);
    -[REPHASESoundEvent setCachedDirectSendLevel:](self, "setCachedDirectSendLevel:", v44);
    v45 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v46 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    objc_msgSend(v43, "fadeToValue:duration:", v19, 0.0);
  }
  -[REPHASESoundEvent paramForKey:](self, "paramForKey:", CFSTR("rate"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[REPHASESoundEvent prepareState](self, "prepareState");
    LODWORD(v49) = *(_DWORD *)(*(_QWORD *)buf + 196);
    -[REPHASESoundEvent setCachedPlaybackSpeed:](self, "setCachedPlaybackSpeed:", v49);
    v50 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v51 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v52 = __ldaxr(v51);
      while (__stlxr(v52 - 1, v51));
      if (!v52)
      {
        ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
        std::__shared_weak_count::__release_weak(v50);
      }
    }
    -[REPHASESoundEvent prepareState](self, "prepareState");
    objc_msgSend(v48, "fadeToValue:duration:", *(float *)(*(_QWORD *)buf + 196), 0.0);
    v53 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v54 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
  }
  -[REPHASESoundEvent paramForKey:](self, "paramForKey:", CFSTR("gain"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    -[REPHASESoundEvent prepareState](self, "prepareState");
    objc_msgSend(v56, "fadeToValue:duration:", *(float *)(*(_QWORD *)buf + 200), 0.0);
    v57 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v58 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
  }
  -[REPHASESoundEvent prepareState](self, "prepareState");
  v60 = *(std::__shared_weak_count **)&buf[8];
  v61 = *(unsigned __int8 *)(*(_QWORD *)buf + 102);
  if (*(_QWORD *)&buf[8])
  {
    v62 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  -[REPHASESoundEvent soundEvent](self, "soundEvent");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64 == 0;

  if (!v65)
  {
    -[REPHASESoundEvent changeToState:](self, "changeToState:", 10);
    -[REPHASESoundEvent soundEvent](self, "soundEvent");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "prepareWithCompletion:", v103);

    -[REPHASESoundEvent prepareState](self, "prepareState");
    v67 = *(std::__shared_weak_count **)&buf[8];
    v130 = *(_QWORD *)(*(_QWORD *)buf + 224);
    v68 = *(_DWORD *)(*(_QWORD *)buf + 236);
    LODWORD(v131) = *(_DWORD *)(*(_QWORD *)buf + 232);
    v69 = *(_QWORD *)(*(_QWORD *)buf + 240);
    if (!*(_QWORD *)&buf[8])
      goto LABEL_90;
    v70 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
      if ((v68 & 1) == 0)
      {
LABEL_91:
        v72 = 0;
        if (v61)
          goto LABEL_112;
LABEL_111:
        if (!v72)
        {
LABEL_126:
          v78 = 0;
          goto LABEL_135;
        }
LABEL_112:
        std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
        if (v72)
        {
          time.value = v130;
          time.timescale = (int)v131;
          time.flags = v68;
          time.epoch = v69;
          Seconds = CMTimeGetSeconds(&time);
          v87 = (id)*re::audioLogObjects(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = Seconds;
            _os_log_impl(&dword_224FE9000, v87, OS_LOG_TYPE_DEFAULT, "%@ seeking to initial target %0.2f", buf, 0x16u);
          }

          atomic_store(*(unint64_t *)&Seconds, (unint64_t *)&self->_latestSeekTarget);
          -[REPHASESoundEvent soundEvent](self, "soundEvent");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = v13;
          v105[1] = 3221225472;
          v105[2] = __43__REPHASESoundEvent_prepareWithCompletion___block_invoke_44;
          v105[3] = &unk_24ED3D9D8;
          objc_copyWeak(v106, &location);
          v106[1] = *(id *)&Seconds;
          objc_msgSend(v88, "seekToTime:completion:", v105, Seconds);

          objc_destroyWeak(v106);
        }
        if (v61)
        {
          v89 = (re *)-[REPHASESoundEvent prepareState](self, "prepareState");
          v90 = *(std::__shared_weak_count **)&buf[8];
          *(_BYTE *)(*(_QWORD *)buf + 102) = 0;
          if (v90)
          {
            v91 = (unint64_t *)&v90->__shared_owners_;
            do
              v92 = __ldaxr(v91);
            while (__stlxr(v92 - 1, v91));
            if (!v92)
            {
              ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
              std::__shared_weak_count::__release_weak(v90);
            }
          }
          v93 = (id)*re::audioLogObjects(v89);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_224FE9000, v93, OS_LOG_TYPE_DEFAULT, "%@ force start", buf, 0xCu);
          }

          -[REPHASESoundEvent _start](self, "_start");
        }
        std::recursive_mutex::unlock((std::recursive_mutex *)&self->_commandQueueMutex);
        goto LABEL_126;
      }
    }
    else
    {
LABEL_90:
      if ((v68 & 1) == 0)
        goto LABEL_91;
    }
    time1.value = v130;
    time1.timescale = (int)v131;
    time1.flags = v68;
    time1.epoch = v69;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    v72 = CMTimeCompare(&time1, &time2) != 0;
    if (v61)
      goto LABEL_112;
    goto LABEL_111;
  }
  -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0;
    v77 = objc_msgSend(v76, "prepareAndReturnError:", &v104);
    v78 = v104;

    if (!v77)
    {
      v96 = (id)*re::audioLogObjects(v79);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        -[REPHASESoundEvent prepareState](self, "prepareState");
        v99 = *(_QWORD *)(v130 + 24);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v99;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v78;
        _os_log_error_impl(&dword_224FE9000, v96, OS_LOG_TYPE_ERROR, "external stream controller %llu failed with error: %@", buf, 0x16u);
        std::shared_ptr<re::AssetManager>::~shared_ptr[abi:nn180100]((uint64_t)&v130);
      }

      (*((void (**)(id, id))v102 + 2))(v102, v78);
      goto LABEL_135;
    }
    if (v61)
    {
      v80 = (re *)-[REPHASESoundEvent prepareState](self, "prepareState");
      v81 = *(std::__shared_weak_count **)&buf[8];
      *(_BYTE *)(*(_QWORD *)buf + 102) = 0;
      if (v81)
      {
        v82 = (unint64_t *)&v81->__shared_owners_;
        do
          v83 = __ldaxr(v82);
        while (__stlxr(v83 - 1, v82));
        if (!v83)
        {
          ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
          std::__shared_weak_count::__release_weak(v81);
        }
      }
      v84 = (id)*re::audioLogObjects(v80);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_224FE9000, v84, OS_LOG_TYPE_DEFAULT, "%@ force start", buf, 0xCu);
      }

      -[REPHASESoundEvent _start](self, "_start");
    }
  }
  else
  {
    v78 = 0;
  }
  -[REPHASESoundEvent externalStream](self, "externalStream");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v94 == 0;

  if (!v95)
  {
    -[REPHASESoundEvent changeToState:](self, "changeToState:", 4);
    -[REPHASESoundEvent updateCommandQueue](self, "updateCommandQueue");
LABEL_134:
    -[REPHASESoundEvent changeToState:](self, "changeToState:", 4);
    -[REPHASESoundEvent updateCommandQueue](self, "updateCommandQueue");
    (*((void (**)(id, _QWORD))v102 + 2))(v102, 0);
    goto LABEL_135;
  }
  if (v75)
    goto LABEL_134;
  if (!v78)
  {
    v97 = (void *)MEMORY[0x24BDD1540];
    v119 = *MEMORY[0x24BDD0FC8];
    v120 = CFSTR("unknown error preparing REPHASESoundEvent");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -210, v98);
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*((void (**)(id, id))v102 + 2))(v102, v78);
LABEL_135:

  objc_destroyWeak(v116);
  objc_destroyWeak(&location);

}

void __43__REPHASESoundEvent_prepareWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  re *WeakRetained;
  re *v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  std::__shared_weak_count *v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  void *v26;
  int buf;
  _BYTE buf_4[12];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (re *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *re::audioLogObjects(WeakRetained);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*((_QWORD *)v5 + 37) + 24);
      buf = 134217984;
      *(_QWORD *)buf_4 = v7;
      _os_log_impl(&dword_224FE9000, v6, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] REPHASESoundEvent prepareWithCompletion callback invoked for token=%llu", (uint8_t *)&buf, 0xCu);
    }
    if (a2 == 1)
    {
      v8 = re::internal::enableSignposts(0, 0);
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "prepareState");
        -[re soundEvent](v5, "soundEvent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "preparedHostTime");
        objc_msgSend(*(id *)(a1 + 32), "prepareState");
        objc_msgSend(*(id *)(a1 + 32), "prepareState");
        kdebug_trace();
        if (v23)
        {
          p_shared_owners = (unint64_t *)&v23->__shared_owners_;
          do
            v11 = __ldaxr(p_shared_owners);
          while (__stlxr(v11 - 1, p_shared_owners));
          if (!v11)
          {
            ((void (*)())v23->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v23);
          }
        }
        if (v24)
        {
          v12 = (unint64_t *)&v24->__shared_owners_;
          do
            v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)())v24->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v24);
          }
        }

        v14 = *(std::__shared_weak_count **)&buf_4[4];
        if (*(_QWORD *)&buf_4[4])
        {
          v15 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 8);
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
      v17 = *re::audioLogObjects((re *)v8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(*((_QWORD *)v5 + 37) + 24);
        buf = 134217984;
        *(_QWORD *)buf_4 = v18;
        _os_log_impl(&dword_224FE9000, v17, OS_LOG_TYPE_DEFAULT, "[RE/PHASE] [Prepare] REPHASESoundEvent prepareWithCompletion success for token=%llu", (uint8_t *)&buf, 0xCu);
      }
      v19 = 0;
      if (-[re changeFromExpectedState:toState:](v5, "changeFromExpectedState:toState:", 10, 4))
      {
        *((_QWORD *)v5 + 22) = 0;
        *((_BYTE *)v5 + 184) = 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to prepare PHASESoundEvent with reason %ld"), a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD0FC8];
      v26 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.re.internal"), -210, v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[re changeToState:](v5, "changeToState:", 5);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (!v19)
      -[re updateCommandQueue](v5, "updateCommandQueue");

  }
}

void __43__REPHASESoundEvent_prepareWithCompletion___block_invoke_44(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      objc_msgSend(WeakRetained, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "soundDidSeek:toTime:", v5, *(double *)(a1 + 40));

    }
    else
    {
      v7 = *re::audioLogObjects((re *)WeakRetained);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412546;
        v9 = v5;
        v10 = 2048;
        v11 = a2;
        _os_log_error_impl(&dword_224FE9000, v7, OS_LOG_TYPE_ERROR, "%@ failed to seek from: %ld", (uint8_t *)&v8, 0x16u);
      }
    }
  }

}

- (void)pause
{
  recursive_mutex *p_commandQueueMutex;
  int v4;

  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  v4 = 1;
  std::deque<REPHASESoundEventCommandState>::emplace_back<REPHASESoundEventCommand>(&self->_commandQueue.c.__map_.__first_, &v4);
  -[REPHASESoundEvent _updateCommandQueue](self, "_updateCommandQueue");
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (void)resume
{
  recursive_mutex *p_commandQueueMutex;
  int v4;

  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  v4 = 0;
  std::deque<REPHASESoundEventCommandState>::emplace_back<REPHASESoundEventCommand>(&self->_commandQueue.c.__map_.__first_, &v4);
  -[REPHASESoundEvent _updateCommandQueue](self, "_updateCommandQueue");
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (void)stopAndDestroy
{
  recursive_mutex *p_commandQueueMutex;

  p_commandQueueMutex = &self->_commandQueueMutex;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  -[REPHASESoundEvent _stopAndDestroy](self, "_stopAndDestroy");
  std::recursive_mutex::unlock((std::recursive_mutex *)p_commandQueueMutex);
}

- (BOOL)seekToTime:(double)a3
{
  double v3;
  NSObject *v5;
  REPHASESoundEventCommandState **end;
  REPHASESoundEventCommandState **begin;
  uint64_t v8;
  unint64_t value;
  unint64_t v10;
  uint64_t v11;
  uint8_t v13[16];

  v3 = a3;
  if (a3 < 0.0)
  {
    v5 = *re::audioLogObjects((re *)self);
    v3 = 0.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_224FE9000, v5, OS_LOG_TYPE_ERROR, "PHASE Seeking < 0, not supported. Capping to 0", v13, 2u);
    }
  }
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_commandQueueMutex);
  end = self->_commandQueue.c.__map_.__end_;
  begin = self->_commandQueue.c.__map_.__begin_;
  if (end == begin)
    v8 = 0;
  else
    v8 = 32 * ((char *)end - (char *)begin) - 1;
  value = self->_commandQueue.c.__size_.__value_;
  v10 = value + self->_commandQueue.c.__start_;
  if (v8 == v10)
  {
    std::deque<REPHASESoundEventCommandState>::__add_back_capacity(&self->_commandQueue.c.__map_.__first_);
    value = self->_commandQueue.c.__size_.__value_;
    begin = self->_commandQueue.c.__map_.__begin_;
    v10 = self->_commandQueue.c.__start_ + value;
  }
  v11 = *(uint64_t *)((char *)begin + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v10;
  *(_DWORD *)v11 = 2;
  *(double *)(v11 + 8) = v3;
  self->_commandQueue.c.__size_.__value_ = value + 1;
  -[REPHASESoundEvent _updateCommandQueue](self, "_updateCommandQueue");
  std::recursive_mutex::unlock((std::recursive_mutex *)&self->_commandQueueMutex);
  return 1;
}

- (unint64_t)state
{
  return atomic_load(&self->_state.__a_.__a_value);
}

- (double)latestSeekTarget
{
  return COERCE_DOUBLE(atomic_load((unint64_t *)&self->_latestSeekTarget));
}

- (id)paramForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[REPHASESoundEvent soundEvent](self, "soundEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[REPHASESoundEvent soundEvent](self, "soundEvent");
  else
    -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metaParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;

  -[REPHASESoundEvent externalStream](self, "externalStream");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[REPHASESoundEvent externalStream](self, "externalStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[REPHASESoundEvent prepareState](self, "prepareState");
      v9 = *(_QWORD *)(v27 + 24);
      -[REPHASESoundEvent prepareState](self, "prepareState");
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<REPHASESoundEvent: %p, stream=%@, controller=%@, token=%llu, assetID=%llu>"), self, v7, v8, v9, *(_QWORD *)(v25 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        p_shared_owners = (unint64_t *)&v26->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)())v26->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      if (v28)
      {
        v13 = (unint64_t *)&v28->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)())v28->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v28);
        }
      }

      goto LABEL_31;
    }
  }
  -[REPHASESoundEvent soundEvent](self, "soundEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[REPHASESoundEvent soundEvent](self, "soundEvent");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[REPHASESoundEvent externalStreamController](self, "externalStreamController");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[REPHASESoundEvent externalStream](self, "externalStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_21;
      -[REPHASESoundEvent externalStream](self, "externalStream");
      v16 = objc_claimAutoreleasedReturnValue();
    }
  }
  v7 = (void *)v16;
LABEL_21:
  v18 = (void *)MEMORY[0x24BDD17C8];
  -[REPHASESoundEvent prepareState](self, "prepareState");
  v19 = *(_QWORD *)(v27 + 24);
  -[REPHASESoundEvent prepareState](self, "prepareState");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<REPHASESoundEvent: %p, object=%@, token=%llu, assetID=%llu>"), self, v7, v19, *(_QWORD *)(v25 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v20 = (unint64_t *)&v26->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)())v26->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  if (v28)
  {
    v22 = (unint64_t *)&v28->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)())v28->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v28);
    }
  }
LABEL_31:

  return v10;
}

- (double)sourcePose
{
  void *v1;
  double result;

  v1 = *(void **)(a1 + 80);
  if (!v1)
    return 0.0;
  objc_msgSend(v1, "worldTransform");
  return result;
}

- (REPHASESoundEventObserver)observer
{
  return (REPHASESoundEventObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (shared_ptr<re::audio::REPHASESoundPrepareState>)prepareState
{
  REPHASESoundPrepareState **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<re::audio::REPHASESoundPrepareState> result;

  cntrl = self->_prepareState.__cntrl_;
  *v2 = self->_prepareState.__ptr_;
  v2[1] = (REPHASESoundPrepareState *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (REPHASESoundPrepareState *)self;
  return result;
}

- (void)setPrepareState:(shared_ptr<re::audio::REPHASESoundPrepareState>)a3
{
  __shared_weak_count *v3;
  REPHASESoundPrepareState *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(REPHASESoundPrepareState **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_prepareState.__cntrl_;
  self->_prepareState.__ptr_ = v4;
  self->_prepareState.__cntrl_ = v3;
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

- (PHASESoundEvent)soundEvent
{
  return self->_soundEvent;
}

- (PHASEExternalOutputStreamController)externalStreamController
{
  return self->_externalStreamController;
}

- (AVAudioSession)audioSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 256, 1);
}

- (float)cachedPlaybackSpeed
{
  return self->_cachedPlaybackSpeed;
}

- (void)setCachedPlaybackSpeed:(float)a3
{
  self->_cachedPlaybackSpeed = a3;
}

- (float)cachedReverbSendLevel
{
  return self->_cachedReverbSendLevel;
}

- (void)setCachedReverbSendLevel:(float)a3
{
  self->_cachedReverbSendLevel = a3;
}

- (float)cachedDirectSendLevel
{
  return self->_cachedDirectSendLevel;
}

- (void)setCachedDirectSendLevel:(float)a3
{
  self->_cachedDirectSendLevel = a3;
}

- (BOOL)soundEventPlayed
{
  return self->_soundEventPlayed;
}

- (void)setSoundEventPlayed:(BOOL)a3
{
  self->_soundEventPlayed = a3;
}

- (PHASEExternalOutputStream)externalStream
{
  return self->_externalStream;
}

- (void)setExternalStream:(id)a3
{
  objc_storeStrong((id *)&self->_externalStream, a3);
}

- (AUAudioUnit)audioUnit
{
  return self->_audioUnit;
}

- (void)setAudioUnit:(id)a3
{
  objc_storeStrong((id *)&self->_audioUnit, a3);
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (void)setRenderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)playbackStateChangeHandler
{
  return self->_playbackStateChangeHandler;
}

- (void)setPlaybackStateChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  REPHASESoundEventCommandState **begin;
  REPHASESoundEventCommandState **end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  REPHASESoundEventCommandState **v9;
  REPHASESoundEventCommandState **v10;
  REPHASESoundEventCommandState **first;

  std::shared_ptr<re::AssetManager>::~shared_ptr[abi:nn180100]((uint64_t)&self->_prepareState);
  objc_storeStrong(&self->_playbackStateChangeHandler, 0);
  objc_storeStrong(&self->_renderBlock, 0);
  objc_storeStrong((id *)&self->_audioUnit, 0);
  objc_storeStrong((id *)&self->_externalStream, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_externalStreamController, 0);
  objc_storeStrong((id *)&self->_soundEvent, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_phaseQueue, 0);
  objc_storeStrong(&self->_soundEventFactory, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_commandQueueMutex);
  objc_storeStrong((id *)&self->_soundEventAsset, 0);
  objc_storeStrong((id *)&self->_mixerParameters, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  begin = self->_commandQueue.c.__map_.__begin_;
  end = self->_commandQueue.c.__map_.__end_;
  self->_commandQueue.c.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_commandQueue.c.__map_.__end_;
      begin = self->_commandQueue.c.__map_.__begin_ + 1;
      self->_commandQueue.c.__map_.__begin_ = begin;
      v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v6 = v5 >> 3;
  if (v6 == 1)
  {
    v7 = 128;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = 256;
LABEL_7:
    self->_commandQueue.c.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_commandQueue.c.__map_.__begin_;
    v9 = self->_commandQueue.c.__map_.__end_;
    if (v9 != v10)
      self->_commandQueue.c.__map_.__end_ = (REPHASESoundEventCommandState **)((char *)v9
                                                                             + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_commandQueue.c.__map_.__first_;
  if (first)
    operator delete(first);
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_commandQueue.c.__start_ = 0u;
  *(_OWORD *)&self->_commandQueue.c.__map_.__end_ = 0u;
  *(_OWORD *)&self->_commandQueue.c.__map_.__first_ = 0u;
  MEMORY[0x227693124](&self->_commandQueueMutex, a2);
  self->_stationaryTime.var0.__null_state_ = 0;
  self->_stationaryTime.__engaged_ = 0;
  self->_prepareState.__ptr_ = 0;
  self->_prepareState.__cntrl_ = 0;
  return self;
}

@end
