@implementation AVAudioEngine

- (AVAudioEngine)init
{
  AVAudioEngine *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  objc_super v8;

  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v8.receiver = self;
  v8.super_class = (Class)AVAudioEngine;
  v3 = -[AVAudioEngine init](&v8, sel_init);
  if (v3)
  {
    v4 = operator new();
    *(_QWORD *)v4 = v3;
    v5 = operator new();
    *(_QWORD *)v5 = v4;
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_DWORD *)(v5 + 120) = 0;
    caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)(v5 + 124));
    *(_QWORD *)(v5 + 216) = 0;
    *(_BYTE *)(v5 + 128) = 0;
    *(_QWORD *)(v5 + 136) = v5 + 136;
    *(_QWORD *)(v5 + 144) = v5 + 136;
    *(_QWORD *)(v5 + 152) = 0;
    *(_QWORD *)(v5 + 160) = v5 + 160;
    *(_QWORD *)(v5 + 168) = v5 + 160;
    *(_QWORD *)(v5 + 176) = 0;
    *(_DWORD *)(v5 + 184) = 0;
    *(_OWORD *)(v5 + 192) = xmmword_19B85A320;
    *(_BYTE *)(v5 + 208) = 0;
    *(_QWORD *)(v5 + 224) = 0;
    *(_BYTE *)(v5 + 232) = 0;
    v6 = (_QWORD *)operator new();
    v6[1] = 0;
    v6[2] = 0;
    *v6 = v6 + 1;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_QWORD *)(v5 + 8) = v6;
    *(_QWORD *)(v4 + 8) = v5;
    *(_DWORD *)(v4 + 80) = 0;
    *(_QWORD *)(v4 + 88) = 0;
    *(_BYTE *)(v4 + 96) = 0;
    *(_QWORD *)(v4 + 104) = 0;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_BYTE *)(v4 + 64) = 0;
    MEMORY[0x1A1AC5AE4](v4 + 112);
    *(_QWORD *)(v4 + 176) = 0;
    *(_DWORD *)(v4 + 184) = 0;
    caulk::pooled_semaphore_mutex::pooled_semaphore_mutex((caulk::pooled_semaphore_mutex *)(v4 + 188));
    if (AVAudioEngineImpl::AVAudioEngineImpl(AVAudioEngine *)::sOnce != -1)
      dispatch_once(&AVAudioEngineImpl::AVAudioEngineImpl(AVAudioEngine *)::sOnce, &__block_literal_global_103);
    *(_QWORD *)(v4 + 72) = dispatch_queue_create("engine", 0);
    *(_QWORD *)(v4 + 24) = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (*(_BYTE *)(*(_QWORD *)(v4 + 8) + 187))
      *(_QWORD *)(v4 + 16) = 0;
    AVAudioEngineImpl::UpdateIONodes((AVAudioEngineImpl *)v4);
    v3->_impl = (void *)v4;
  }
  return v3;
}

- (void)dealloc
{
  char *impl;
  AVAudioNode *v4;
  AVAudioNode *v5;
  AVAudioNode *v6;
  AVAudioNode *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;
  NSError *v12;

  impl = (char *)self->_impl;
  if (impl)
  {
    v12 = 0;
    AVAudioEngineImpl::Stop((AVAudioEngineImpl *)impl, &v12);
    std::unique_ptr<AVAEBlock<AVAudioEngineManualRenderingStatus({block_pointer})(unsigned int,AudioBufferList *,int *)>>::reset[abi:ne180100]((const void ***)impl + 13, 0);
    v4 = (AVAudioNode *)*((_QWORD *)impl + 5);
    if (v4)
    {
      AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)impl + 1), v4, 0, &v12);
      AVAudioEngineImpl::DetachNode((id *)impl, *((AVAudioNode **)impl + 5), 1, &v12);
      *((_QWORD *)impl + 5) = 0;
    }
    v5 = (AVAudioNode *)*((_QWORD *)impl + 4);
    if (v5)
    {
      AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)impl + 1), v5, 1, &v12);
      AVAudioEngineImpl::DetachNode((id *)impl, *((AVAudioNode **)impl + 4), 1, &v12);
      *((_QWORD *)impl + 4) = 0;
    }
    v6 = (AVAudioNode *)*((_QWORD *)impl + 6);
    if (v6)
    {
      AVAudioEngineImpl::DetachNode((id *)impl, v6, 1, &v12);
      *((_QWORD *)impl + 6) = 0;
    }
    while (1)
    {
      v7 = (AVAudioNode *)objc_msgSend(*((id *)impl + 3), "anyObject");
      if (!v7)
        break;
      AVAudioEngineImpl::DetachNode((id *)impl, v7, 0, &v12);
    }
    std::recursive_mutex::lock((std::recursive_mutex *)(impl + 112));
    std::unique_ptr<AVAudioEngineGraph>::reset[abi:ne180100]((uint64_t *)impl + 1);
    std::recursive_mutex::unlock((std::recursive_mutex *)(impl + 112));
    v8 = *((_QWORD *)impl + 7);
    *((_QWORD *)impl + 7) = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);

    v9 = (void *)*((_QWORD *)impl + 11);
    if (v9)
      dispatch_block_cancel(v9);
    dispatch_sync(*((dispatch_queue_t *)impl + 9), &__block_literal_global_105);

    dispatch_release(*((dispatch_object_t *)impl + 9));
    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(impl + 112));
    std::unique_ptr<AVAEBlock<AVAudioEngineManualRenderingStatus({block_pointer})(unsigned int,AudioBufferList *,int *)>>::reset[abi:ne180100]((const void ***)impl + 13, 0);
    v10 = *((_QWORD *)impl + 7);
    *((_QWORD *)impl + 7) = 0;
    if (v10)
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
    std::unique_ptr<AVAudioEngineGraph>::reset[abi:ne180100]((uint64_t *)impl + 1);
    MEMORY[0x1A1AC5BD4](impl, 0x10A0C40461284F8);
  }
  v11.receiver = self;
  v11.super_class = (Class)AVAudioEngine;
  -[AVAudioEngine dealloc](&v11, sel_dealloc);
}

- (void)attachNode:(AVAudioNode *)node
{
  std::recursive_mutex *v5;

  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  AVAudioEngineImpl::AttachNode((AVAudioEngineImpl *)self->_impl, node, 0);
  std::recursive_mutex::unlock(v5);
}

- (void)detachNode:(AVAudioNode *)node
{
  std::recursive_mutex *v5;

  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  AVAudioEngineImpl::DetachNode((id *)self->_impl, node, 0, 0);
  std::recursive_mutex::unlock(v5);
}

- (AVAudioOutputNode)outputNode
{
  std::recursive_mutex *v3;
  AVAudioOutputNode *OutputNode;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  OutputNode = (AVAudioOutputNode *)AVAudioEngineImpl::GetOutputNode((AVAudioEngineImpl *)self->_impl);
  std::recursive_mutex::unlock(v3);
  return OutputNode;
}

- (AVAudioInputNode)inputNode
{
  std::recursive_mutex *v3;
  void *impl;
  void *v5;
  int v6;
  int v7;
  char v8;
  NSObject *v9;
  AVAudioInputNode *v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = self->_impl;
  v5 = (void *)*((_QWORD *)impl + 4);
  if (v5)
  {
    v6 = *(unsigned __int8 *)(*((_QWORD *)impl + 1) + 187);
    v7 = objc_msgSend(*((id *)impl + 4), "isInManualRenderingMode");
    v8 = v7 ^ 1;
    if (!v6)
      v8 = 1;
    if ((v8 & 1) != 0)
    {
      if (v7 == (v6 != 0))
        goto LABEL_14;
    }
    else if (objc_msgSend(v5, "manualRenderingMode") == *(_QWORD *)(*((_QWORD *)impl + 1) + 192))
    {
      goto LABEL_14;
    }
  }
  AVAudioEngineImpl::UpdateInputNode((uint64_t)impl, 1);
  if (!*((_QWORD *)impl + 4))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "AVAEInternal.h";
      v14 = 1024;
      v15 = 71;
      v16 = 2080;
      v17 = "AVAudioEngine.mm";
      v18 = 1024;
      v19 = 665;
      v20 = 2080;
      v21 = "GetInputNode";
      v22 = 2080;
      v23 = "_inputNode != nil";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "_inputNode != nil");
  }
LABEL_14:
  v10 = (AVAudioInputNode *)*((_QWORD *)impl + 4);
  std::recursive_mutex::unlock(v3);
  return v10;
}

- (AVAudioMixerNode)mainMixerNode
{
  std::recursive_mutex *v3;
  AVAudioEngineImpl *impl;
  AVAudioMixerNode *v5;
  AVAudioNode *OutputNode;
  NSObject *v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (AVAudioEngineImpl *)self->_impl;
  v5 = (AVAudioMixerNode *)*((_QWORD *)impl + 6);
  if (!v5)
  {
    OutputNode = (AVAudioNode *)AVAudioEngineImpl::GetOutputNode(impl);
    v5 = objc_alloc_init(AVAudioMixerNode);
    AVAudioEngineImpl::AttachNode(impl, &v5->super, 1);

    if (AVAudioEngineImpl::Connect((id *)impl, &v5->super, OutputNode, 0, 0, 0))
    {
      *((_QWORD *)impl + 6) = v5;
    }
    else
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)impl;
        v10 = 136315650;
        v11 = "AVAudioEngine.mm";
        v12 = 1024;
        v13 = 680;
        v14 = 2048;
        v15 = v8;
        _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine#%p: error: couldn't connect mixer to output node!", (uint8_t *)&v10, 0x1Cu);
      }
      AVAudioEngineImpl::DetachNode((id *)impl, &v5->super, 1, 0);
      v5 = 0;
    }
  }
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (void)connect:(AVAudioNode *)node1 to:(AVAudioNode *)node2 fromBus:(AVAudioNodeBus)bus1 toBus:(AVAudioNodeBus)bus2 format:(AVAudioFormat *)format
{
  std::recursive_mutex *v13;

  v13 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v13);
  AVAudioEngineImpl::Connect((id *)self->_impl, node1, node2, bus1, bus2, format);
  std::recursive_mutex::unlock(v13);
}

- (void)connect:(AVAudioNode *)node1 to:(AVAudioNode *)node2 format:(AVAudioFormat *)format
{
  std::recursive_mutex *v9;
  id *impl;
  uint64_t v11;

  v9 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v9);
  impl = (id *)self->_impl;
  if (node2 && (objc_opt_respondsToSelector() & 1) != 0)
    v11 = -[AVAudioNode nextAvailableInputBus](node2, "nextAvailableInputBus");
  else
    v11 = 0;
  AVAudioEngineImpl::Connect(impl, node1, node2, 0, v11, format);
  std::recursive_mutex::unlock(v9);
}

- (void)connect:(AVAudioNode *)sourceNode toConnectionPoints:(NSArray *)destNodes fromBus:(AVAudioNodeBus)sourceBus format:(AVAudioFormat *)format
{
  std::recursive_mutex *v11;

  v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMultipleOutputs((id *)self->_impl, sourceNode, destNodes, sourceBus, format);
  std::recursive_mutex::unlock(v11);
}

- (void)disconnectNodeInput:(AVAudioNode *)node bus:(AVAudioNodeBus)bus
{
  std::recursive_mutex *v7;
  void *impl;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  AVAudioEngineGraph *v13;
  NSObject *v14;
  AVAudioNodeImplBase *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  _BYTE v27[24];
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  impl = self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(char **)impl;
    *(_DWORD *)buf = 136316162;
    v21 = "AVAudioEngine.mm";
    v22 = 1024;
    v23 = 1015;
    v24 = 2048;
    v25 = v10;
    v26 = 2048;
    *(_QWORD *)v27 = bus;
    *(_WORD *)&v27[8] = 2048;
    *(_QWORD *)&v27[10] = node;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect input bus: %lu on node: %p", buf, 0x30u);
  }
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "AVAEInternal.h";
      v22 = 1024;
      v23 = 71;
      v24 = 2080;
      v25 = "AVAudioEngine.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 1017;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(_QWORD *)&v27[16] = "node != nil";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "node != nil");
  }
  if ((objc_msgSend(*((id *)impl + 3), "containsObject:", node) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "AVAEInternal.h";
      v22 = 1024;
      v23 = 71;
      v24 = 2080;
      v25 = "AVAudioEngine.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 1018;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(_QWORD *)&v27[16] = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "[_nodes containsObject: node]");
  }
  v13 = (AVAudioEngineGraph *)*((_QWORD *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "AVAEInternal.h";
      v22 = 1024;
      v23 = 71;
      v24 = 2080;
      v25 = "AVAudioEngineGraph.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 2662;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(_QWORD *)&v27[16] = "inDestAVNode";
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inDestAVNode");
  }
  v15 = -[AVAudioNode impl](node, "impl");
  if (!v15)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "AVAEInternal.h";
      v22 = 1024;
      v23 = 71;
      v24 = 2080;
      v25 = "AVAudioEngineGraph.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 2665;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(_QWORD *)&v27[16] = "inDestImpl";
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inDestImpl");
  }
  v17 = (*(uint64_t (**)(AVAudioNodeImplBase *, AVAudioNodeBus))(*(_QWORD *)v15 + 240))(v15, bus);
  v18 = AVAudioEngineGraph::_DisconnectInput(v13, v15, v17);
  if ((_DWORD)v18)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v19 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v21 = "AVAEInternal.h";
      v22 = 1024;
      v23 = 104;
      v24 = 2080;
      v25 = "AVAudioEngine.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 1020;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(_QWORD *)&v27[16] = "_graph->DisconnectInput(node, bus)";
      v28 = 1024;
      v29 = v18;
      _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v18);
  }
  std::recursive_mutex::unlock(v7);
}

- (void)disconnectNodeOutput:(AVAudioNode *)node bus:(AVAudioNodeBus)bus
{
  std::recursive_mutex *v7;
  void *impl;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  NSObject *v12;
  AVAudioEngineGraph *v13;
  NSObject *v14;
  AVAudioNodeImplBase *v15;
  NSObject *v16;
  uint64_t v17;
  std::recursive_mutex *v18;
  NSObject *v19;
  uint64_t NodeFromMap;
  uint64_t v21;
  NSObject *v22;
  _BYTE buf[12];
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  _BYTE v29[24];
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  impl = self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(char **)impl;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVAudioEngine.mm";
    v24 = 1024;
    v25 = 1025;
    v26 = 2048;
    v27 = v10;
    v28 = 2048;
    *(_QWORD *)v29 = bus;
    *(_WORD *)&v29[8] = 2048;
    *(_QWORD *)&v29[10] = node;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect output bus: %lu on node: %p", buf, 0x30u);
  }
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioEngine.mm";
      v28 = 1024;
      *(_DWORD *)v29 = 1027;
      *(_WORD *)&v29[4] = 2080;
      *(_QWORD *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(_QWORD *)&v29[16] = "node != nil";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "node != nil");
  }
  if ((objc_msgSend(*((id *)impl + 3), "containsObject:", node) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioEngine.mm";
      v28 = 1024;
      *(_DWORD *)v29 = 1028;
      *(_WORD *)&v29[4] = 2080;
      *(_QWORD *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(_QWORD *)&v29[16] = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "[_nodes containsObject: node]");
  }
  v13 = (AVAudioEngineGraph *)*((_QWORD *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioEngineGraph.mm";
      v28 = 1024;
      *(_DWORD *)v29 = 2785;
      *(_WORD *)&v29[4] = 2080;
      *(_QWORD *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(_QWORD *)&v29[16] = "inSrcAVNode";
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inSrcAVNode");
  }
  v15 = -[AVAudioNode impl](node, "impl");
  if (!v15)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioEngineGraph.mm";
      v28 = 1024;
      *(_DWORD *)v29 = 2788;
      *(_WORD *)&v29[4] = 2080;
      *(_QWORD *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(_QWORD *)&v29[16] = "inSrcImpl";
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inSrcImpl");
  }
  v17 = (*(uint64_t (**)(AVAudioNodeImplBase *, AVAudioNodeBus))(*(_QWORD *)v15 + 240))(v15, bus);
  v18 = (std::recursive_mutex *)(*(_QWORD *)v13 + 112);
  std::recursive_mutex::lock(v18);
  if (!AVAudioEngineGraph::IsNodeInGraph(v13, v15))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v19 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "AVAEInternal.h";
      v24 = 1024;
      v25 = 71;
      v26 = 2080;
      v27 = "AVAudioEngineGraph.mm";
      v28 = 1024;
      *(_DWORD *)v29 = 2798;
      *(_WORD *)&v29[4] = 2080;
      *(_QWORD *)&v29[6] = "_DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(_QWORD *)&v29[16] = "IsNodeInGraph(inSrcImpl)";
      _os_log_impl(&dword_19B733000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "IsNodeInGraph(inSrcImpl)");
  }
  NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v13, v15);
  *(_QWORD *)buf = 0;
  *(_DWORD *)&buf[8] = -1;
  if (((*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _BYTE *))(*(_QWORD *)NodeFromMap + 40))(NodeFromMap, 0, v17, buf) & 1) != 0)
  {
    v21 = AVAudioEngineGraph::_DisconnectInput(v13, *(AVAudioNodeImplBase **)(*(_QWORD *)buf + 24), *(unsigned int *)&buf[8]);
    std::recursive_mutex::unlock(v18);
    if ((_DWORD)v21)
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v22 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = "AVAEInternal.h";
        v24 = 1024;
        v25 = 104;
        v26 = 2080;
        v27 = "AVAudioEngine.mm";
        v28 = 1024;
        *(_DWORD *)v29 = 1030;
        *(_WORD *)&v29[4] = 2080;
        *(_QWORD *)&v29[6] = "DisconnectOutput";
        *(_WORD *)&v29[14] = 2080;
        *(_QWORD *)&v29[16] = "_graph->DisconnectOutput(node, bus)";
        v30 = 1024;
        v31 = v21;
        _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v21);
    }
  }
  else
  {
    std::recursive_mutex::unlock(v18);
  }
  std::recursive_mutex::unlock(v7);
}

- (void)disconnectNodeInput:(AVAudioNode *)node
{
  void *impl;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  AVAudioEngineGraph *v10;
  NSObject *v11;
  AVAudioNodeImplBase *v12;
  NSObject *v13;
  std::recursive_mutex *v14;
  NSObject *v15;
  uint64_t NodeFromMap;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  std::recursive_mutex *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v22 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v22);
  impl = self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(char **)impl;
    *(_DWORD *)buf = 136315906;
    v27 = "AVAudioEngine.mm";
    v28 = 1024;
    v29 = 1035;
    v30 = 2048;
    v31 = v7;
    v32 = 2048;
    *(_QWORD *)v33 = node;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect all inputs on node: %p", buf, 0x26u);
  }
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngine.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 1037;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllInputs";
      v34 = 2080;
      v35 = "node != nil";
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "node != nil");
  }
  if ((objc_msgSend(*((id *)impl + 3), "containsObject:", node) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngine.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 1038;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllInputs";
      v34 = 2080;
      v35 = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "[_nodes containsObject: node]");
  }
  v10 = (AVAudioEngineGraph *)*((_QWORD *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngineGraph.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 2812;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllInputs";
      v34 = 2080;
      v35 = "inAVNode";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inAVNode");
  }
  v12 = -[AVAudioNode impl](node, "impl");
  if (!v12)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngineGraph.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 2815;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllInputs";
      v34 = 2080;
      v35 = "inImpl";
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inImpl");
  }
  v14 = (std::recursive_mutex *)(*(_QWORD *)v10 + 112);
  std::recursive_mutex::lock(v14);
  if (!AVAudioEngineGraph::IsNodeInGraph(v10, v12))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngineGraph.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 2820;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllInputs";
      v34 = 2080;
      v35 = "IsNodeInGraph(inImpl)";
      _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "IsNodeInGraph(inImpl)");
  }
  NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v10, v12);
  v23 = (uint64_t)&v23;
  v24 = &v23;
  v25 = 0;
  AUGraphNodeBase::GetValidConnections(NodeFromMap, 1, &v23);
  v17 = v24;
  if (v24 == &v23)
  {
    v18 = 0;
  }
  else
  {
    v18 = 0;
    do
    {
      v19 = AVAudioEngineGraph::_DisconnectInput(v10, *(AVAudioNodeImplBase **)(v17[4] + 24), *((unsigned int *)v17 + 10));
      if ((_DWORD)v19)
      {
        if (AVAudioEngineLogCategory(void)::once != -1)
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
        v20 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v27 = "AVAEInternal.h";
          v28 = 1024;
          v29 = 104;
          v30 = 2080;
          v31 = "AVAudioEngineGraph.mm";
          v32 = 1024;
          *(_DWORD *)v33 = 2832;
          *(_WORD *)&v33[4] = 2080;
          *(_QWORD *)&v33[6] = "DisconnectAllInputs";
          v34 = 2080;
          v35 = "tmpErr = _DisconnectInput(conn.destNode->NodeImpl(), conn.destBus)";
          v36 = 1024;
          v37 = v19;
          _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v19);
        v18 = v19;
      }
      v17 = (uint64_t *)v17[1];
    }
    while (v17 != &v23);
  }
  std::__list_imp<AUGraphConnection>::clear(&v23);
  std::recursive_mutex::unlock(v14);
  if ((_DWORD)v18)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v21 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 104;
      v30 = 2080;
      v31 = "AVAudioEngine.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 1040;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllInputs";
      v34 = 2080;
      v35 = "_graph->DisconnectAllInputs(node)";
      v36 = 1024;
      v37 = v18;
      _os_log_impl(&dword_19B733000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v18);
  }
  std::recursive_mutex::unlock(v22);
}

- (void)disconnectNodeOutput:(AVAudioNode *)node
{
  void *impl;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  AVAudioEngineGraph *v10;
  NSObject *v11;
  AVAudioNodeImplBase *v12;
  NSObject *v13;
  std::recursive_mutex *v14;
  NSObject *v15;
  uint64_t NodeFromMap;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  std::recursive_mutex *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v22 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v22);
  impl = self->_impl;
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngine.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 1045;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllOutputs";
      v34 = 2080;
      v35 = "node != nil";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "node != nil");
  }
  if ((objc_msgSend(*((id *)impl + 3), "containsObject:", node) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngine.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 1046;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllOutputs";
      v34 = 2080;
      v35 = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "[_nodes containsObject: node]");
  }
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(char **)impl;
    *(_DWORD *)buf = 136315906;
    v27 = "AVAudioEngine.mm";
    v28 = 1024;
    v29 = 1048;
    v30 = 2048;
    v31 = v9;
    v32 = 2048;
    *(_QWORD *)v33 = node;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect all outputs on node: %p", buf, 0x26u);
  }
  v10 = (AVAudioEngineGraph *)*((_QWORD *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngineGraph.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 2841;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllOutputs";
      v34 = 2080;
      v35 = "inAVNode";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inAVNode");
  }
  v12 = -[AVAudioNode impl](node, "impl");
  if (!v12)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngineGraph.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 2844;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllOutputs";
      v34 = 2080;
      v35 = "inImpl";
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "inImpl");
  }
  v14 = (std::recursive_mutex *)(*(_QWORD *)v10 + 112);
  std::recursive_mutex::lock(v14);
  if (!AVAudioEngineGraph::IsNodeInGraph(v10, v12))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 71;
      v30 = 2080;
      v31 = "AVAudioEngineGraph.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 2849;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllOutputs";
      v34 = 2080;
      v35 = "IsNodeInGraph(inImpl)";
      _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "IsNodeInGraph(inImpl)");
  }
  NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v10, v12);
  v23 = (uint64_t)&v23;
  v24 = &v23;
  v25 = 0;
  AUGraphNodeBase::GetValidConnections(NodeFromMap, 0, &v23);
  v17 = v24;
  if (v24 == &v23)
  {
    v18 = 0;
  }
  else
  {
    v18 = 0;
    do
    {
      v19 = AVAudioEngineGraph::_DisconnectInput(v10, *(AVAudioNodeImplBase **)(v17[4] + 24), *((unsigned int *)v17 + 10));
      if ((_DWORD)v19)
      {
        if (AVAudioEngineLogCategory(void)::once != -1)
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
        v20 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v27 = "AVAEInternal.h";
          v28 = 1024;
          v29 = 104;
          v30 = 2080;
          v31 = "AVAudioEngineGraph.mm";
          v32 = 1024;
          *(_DWORD *)v33 = 2861;
          *(_WORD *)&v33[4] = 2080;
          *(_QWORD *)&v33[6] = "DisconnectAllOutputs";
          v34 = 2080;
          v35 = "tmpErr = _DisconnectInput(conn.destNode->NodeImpl(), conn.destBus)";
          v36 = 1024;
          v37 = v19;
          _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v19);
        v18 = v19;
      }
      v17 = (uint64_t *)v17[1];
    }
    while (v17 != &v23);
  }
  std::__list_imp<AUGraphConnection>::clear(&v23);
  std::recursive_mutex::unlock(v14);
  if ((_DWORD)v18)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v21 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      v27 = "AVAEInternal.h";
      v28 = 1024;
      v29 = 104;
      v30 = 2080;
      v31 = "AVAudioEngine.mm";
      v32 = 1024;
      *(_DWORD *)v33 = 1050;
      *(_WORD *)&v33[4] = 2080;
      *(_QWORD *)&v33[6] = "DisconnectAllOutputs";
      v34 = 2080;
      v35 = "_graph->DisconnectAllOutputs(node)";
      v36 = 1024;
      v37 = v18;
      _os_log_impl(&dword_19B733000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v18);
  }
  std::recursive_mutex::unlock(v22);
}

- (BOOL)startAndReturnError:(NSError *)outError
{
  std::recursive_mutex *v5;
  char *impl;
  NSObject *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  NSError *v14;
  AVAudioIOUnit *v15;
  char CanPerformIO;
  uint64_t v18;
  _BYTE v19[12];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (char *)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)impl;
    v9 = (unsigned __int8 *)*((_QWORD *)impl + 1);
    if (v9)
    {
      v10 = v9[208];
      v9 += 184;
      if (v10)
        v9 = (unsigned __int8 *)(impl + 64);
      LODWORD(v9) = *v9;
    }
    *(_DWORD *)v19 = 136315906;
    *(_QWORD *)&v19[4] = "AVAudioEngine.mm";
    v20 = 1024;
    v21 = 1168;
    v22 = 2048;
    v23 = v8;
    v24 = 1024;
    v25 = (int)v9;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: start, was running %d", v19, 0x22u);
  }
  v11 = *((_QWORD *)impl + 1);
  if (v11)
  {
    v12 = *(_BYTE *)(v11 + 208) ? impl + 64 : (char *)(v11 + 184);
    if (*v12)
    {
      v13 = 1;
      impl[64] = 1;
      if (outError)
        *outError = 0;
      goto LABEL_25;
    }
  }
  *(_QWORD *)v19 = 0;
  AVAudioEngineImpl::Initialize((AVAudioEngineImpl *)impl, (NSError **)v19);
  v14 = *(NSError **)v19;
  if (!*(_QWORD *)v19)
  {
    v15 = (AVAudioIOUnit *)*((_QWORD *)impl + 7);
    if (!v15)
    {
LABEL_22:
      AVAudioEngineGraph::Start(*((AVAudioNodeImplBase ***)impl + 1), (NSError **)v19);
      v14 = *(NSError **)v19;
      goto LABEL_23;
    }
    if (*((_QWORD *)impl + 5))
    {
      CanPerformIO = AVAudioIOUnit::CanPerformIO(v15, 0);
      if (!*((_QWORD *)impl + 4))
        goto LABEL_21;
    }
    else
    {
      v18 = *((_QWORD *)impl + 4);
      CanPerformIO = v18 != 0;
      if (!v18)
      {
LABEL_21:
        _AVAE_CheckAndReturnErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 1255, "CheckCanPerformIO", "canPerformIO", CanPerformIO, 560227702, (NSError **)v19);
        v14 = *(NSError **)v19;
        if (*(_QWORD *)v19)
          goto LABEL_23;
        goto LABEL_22;
      }
    }
    CanPerformIO &= AVAudioIOUnit::CanPerformIO(*((AVAudioIOUnit **)impl + 7), 1);
    goto LABEL_21;
  }
LABEL_23:
  v13 = v14 == 0;
  impl[64] = v14 == 0;
  if (outError)
    *outError = v14;
LABEL_25:
  std::recursive_mutex::unlock(v5);
  return v13;
}

- (void)prepare
{
  std::recursive_mutex *v3;
  NSObject *v4;
  int v5;
  NSError *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  AVAudioEngine *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v6 = 0;
  AVAudioEngineImpl::Initialize((AVAudioEngineImpl *)self->_impl, &v6);
  if (v6)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      v5 = -[NSError code](v6, "code");
      *(_DWORD *)buf = 136315906;
      v8 = "AVAudioEngine.mm";
      v9 = 1024;
      v10 = 188;
      v11 = 2048;
      v12 = self;
      v13 = 1024;
      v14 = v5;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine@%p: could not initialize, error = %d", buf, 0x22u);
    }
  }
  std::recursive_mutex::unlock(v3);
}

- (void)pause
{
  std::recursive_mutex *v3;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AVAudioEngineImpl::Pause((AVAudioEngineImpl *)self->_impl, 0);
  std::recursive_mutex::unlock(v3);
}

- (void)reset
{
  std::recursive_mutex *v3;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AVAudioEngineImpl::Reset((AVAudioEngineImpl *)self->_impl);
  std::recursive_mutex::unlock(v3);
}

- (void)stop
{
  std::recursive_mutex *v3;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AVAudioEngineImpl::Stop((AVAudioEngineImpl *)self->_impl, 0);
  std::recursive_mutex::unlock(v3);
}

- (AVAudioConnectionPoint)inputConnectionPointForNode:(AVAudioNode *)node inputBus:(AVAudioNodeBus)bus
{
  std::recursive_mutex *v7;
  AVAudioConnectionPoint *InputConnectionPointForNode;

  v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  InputConnectionPointForNode = AVAudioEngineImpl::GetInputConnectionPointForNode((AVAudioEngineImpl *)self->_impl, node, bus);
  std::recursive_mutex::unlock(v7);
  return InputConnectionPointForNode;
}

- (NSArray)outputConnectionPointsForNode:(AVAudioNode *)node outputBus:(AVAudioNodeBus)bus
{
  std::recursive_mutex *v7;
  NSArray *OutputConnectionPointsForNode;

  v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  OutputConnectionPointsForNode = (NSArray *)AVAudioEngineImpl::GetOutputConnectionPointsForNode((AVAudioEngineImpl *)self->_impl, node, bus);
  std::recursive_mutex::unlock(v7);
  return OutputConnectionPointsForNode;
}

- (id)description
{
  std::recursive_mutex *v3;
  AVAudioEngineGraph *v4;
  std::recursive_mutex *v5;
  FILE *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t *v10;
  uint64_t *v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t **v14;
  BOOL v15;
  unint64_t v16;
  uint64_t **v17;
  uint64_t **v18;
  _OWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t NodeFromMap;
  char *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD *i;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  FILE *v40;
  int v41;
  void **v42;
  double v43;
  int16x8_t v44;
  void **p_p;
  uint64_t v46;
  void **v47;
  uint64_t v48;
  _QWORD *j;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  FILE *v55;
  int v56;
  void **v57;
  double v58;
  int16x8_t v59;
  void **v60;
  uint64_t v61;
  void **v62;
  uint64_t v63;
  const char *v64;
  uint64_t **v65;
  uint64_t *v66;
  uint64_t **v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  void *v74;
  void *v75;
  std::recursive_mutex *v77;
  std::recursive_mutex *v78;
  FILE *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  CAStreamBasicDescription v83;
  uint64_t **v84;
  uint64_t *v85;
  uint64_t v86;
  FILE *__stream;
  void *__p;
  FILE **p_stream;
  uint64_t ***v90;
  void **v91;
  char v92[16];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v4 = (AVAudioEngineGraph *)*((_QWORD *)self->_impl + 1);
  if (!v4)
  {
    v29 = CFSTR("<AVAudioEngine: nil graph>");
    goto LABEL_112;
  }
  v5 = (std::recursive_mutex *)(*(_QWORD *)v4 + 112);
  v78 = v3;
  std::recursive_mutex::lock(v5);
  v77 = v5;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  v6 = funopen(&v79, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
  v79 = v6;
  __stream = v6;
  fprintf(v6, "\n________ %s ________\n", "GraphDescription");
  fprintf(v6, "AVAudioEngineGraph %p: initialized = %d, running = %d, number of nodes = %d\n", v4, *((unsigned __int8 *)v4 + 185), *((unsigned __int8 *)v4 + 184), *(_QWORD *)(*((_QWORD *)v4 + 1) + 16));
  v7 = (_QWORD *)*((_QWORD *)v4 + 1);
  v85 = 0;
  v86 = 0;
  v84 = &v85;
  v8 = v7 + 1;
  v9 = (_QWORD *)*v7;
  if ((_QWORD *)*v7 != v7 + 1)
  {
    do
    {
      v10 = v9 + 4;
      v11 = v85;
      v12 = &v85;
      if (v84 == &v85)
        goto LABEL_9;
      v13 = v85;
      v14 = &v85;
      if (v85)
      {
        do
        {
          v12 = (uint64_t **)v13;
          v13 = (uint64_t *)v13[1];
        }
        while (v13);
      }
      else
      {
        do
        {
          v12 = (uint64_t **)v14[2];
          v15 = *v12 == (uint64_t *)v14;
          v14 = v12;
        }
        while (v15);
      }
      v16 = *v10;
      if ((unint64_t)v12[4] < *v10)
      {
LABEL_9:
        if (v85)
          v17 = v12;
        else
          v17 = &v85;
        if (v85)
          v18 = v12 + 1;
        else
          v18 = &v85;
      }
      else
      {
        v17 = &v85;
        v18 = &v85;
        if (v85)
        {
          v18 = &v85;
          while (1)
          {
            while (1)
            {
              v17 = (uint64_t **)v11;
              v22 = v11[4];
              if (v16 >= v22)
                break;
              v11 = *v17;
              v18 = v17;
              if (!*v17)
                goto LABEL_16;
            }
            if (v22 >= v16)
              break;
            v18 = v17 + 1;
            v11 = v17[1];
            if (!v11)
              goto LABEL_16;
          }
        }
      }
      if (!*v18)
      {
LABEL_16:
        v19 = operator new(0x30uLL);
        v19[2] = *(_OWORD *)v10;
        *(_QWORD *)v19 = 0;
        *((_QWORD *)v19 + 1) = 0;
        *((_QWORD *)v19 + 2) = v17;
        *v18 = (uint64_t *)v19;
        if (*v84)
        {
          v84 = (uint64_t **)*v84;
          v19 = *v18;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v85, (uint64_t *)v19);
        ++v86;
      }
      v20 = (_QWORD *)v9[1];
      if (v20)
      {
        do
        {
          v21 = v20;
          v20 = (_QWORD *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          v21 = (_QWORD *)v9[2];
          v15 = *v21 == (_QWORD)v9;
          v9 = v21;
        }
        while (!v15);
      }
      v9 = v21;
    }
    while (v21 != v8);
    v7 = (_QWORD *)*((_QWORD *)v4 + 1);
    v9 = (_QWORD *)*v7;
  }
  v23 = v7 + 1;
  if (v9 != v23)
  {
    do
    {
      *(_DWORD *)(v9[5] + 32) &= 0xFFFFFFE7;
      v24 = (_QWORD *)v9[1];
      if (v24)
      {
        do
        {
          v25 = v24;
          v24 = (_QWORD *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (_QWORD *)v9[2];
          v15 = *v25 == (_QWORD)v9;
          v9 = v25;
        }
        while (!v15);
      }
      v9 = v25;
    }
    while (v25 != v23);
  }
  if (AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 3)))
  {
    fwrite("\n\t ******** output chain ********\n", 0x22uLL, 1uLL, __stream);
    NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 3));
    *(_QWORD *)v92 = &off_1E3BE5B78;
    *(_QWORD *)&v92[8] = &__stream;
    *(_QWORD *)&v93 = &v84;
    *((_QWORD *)&v93 + 1) = v92;
    AUGraphParser::TraverseGraphNodesBFS(1, NodeFromMap, 0, (uint64_t)v92);
    v27 = (char *)*((_QWORD *)&v93 + 1);
    if (*((char **)&v93 + 1) == v92)
    {
      v28 = 4;
      v27 = v92;
    }
    else
    {
      if (!*((_QWORD *)&v93 + 1))
        goto LABEL_48;
      v28 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v27 + 8 * v28))();
  }
LABEL_48:
  if (!AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 2)))
    goto LABEL_54;
  fwrite("\n\t ******** input chain ********\n", 0x21uLL, 1uLL, __stream);
  v30 = AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 2));
  *(_QWORD *)v92 = &off_1E3BE5BC0;
  *(_QWORD *)&v92[8] = &__stream;
  *(_QWORD *)&v93 = &v84;
  *((_QWORD *)&v93 + 1) = v92;
  AUGraphParser::TraverseGraphNodesBFS(0, v30, 0, (uint64_t)v92);
  v31 = (char *)*((_QWORD *)&v93 + 1);
  if (*((char **)&v93 + 1) == v92)
  {
    v32 = 4;
    v31 = v92;
  }
  else
  {
    if (!*((_QWORD *)&v93 + 1))
      goto LABEL_54;
    v32 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v31 + 8 * v32))();
LABEL_54:
  if (*((_QWORD *)v4 + 19))
  {
    fwrite("\n\t ******** pending connections - output ********\n", 0x32uLL, 1uLL, __stream);
    for (i = (_QWORD *)*((_QWORD *)v4 + 18); i != (_QWORD *)((char *)v4 + 136); i = (_QWORD *)i[1])
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      *(_OWORD *)v92 = 0u;
      v93 = 0u;
      v35 = i + 2;
      v34 = i[2];
      memset(&v83, 0, sizeof(v83));
      if (v34)
      {
        v36 = 6;
      }
      else
      {
        v34 = i[4];
        if (!v34)
          goto LABEL_62;
        v36 = 9;
      }
      v37 = (void *)(*(uint64_t (**)(void))(**(_QWORD **)(v34 + 24) + 8 * v36))();
      if (v37)
      {
        v38 = objc_msgSend(v37, "streamDescription");
        v39 = *(_OWORD *)(v38 + 16);
        *(_OWORD *)&v83.var0 = *(_OWORD *)v38;
        *(_OWORD *)&v83.var3 = v39;
        *(_QWORD *)&v83.var7 = *(_QWORD *)(v38 + 32);
      }
LABEL_62:
      v40 = __stream;
      AVAudioEngineGraph::ConnAsString(&__p, (uint64_t)v4, (uint64_t)(i + 2));
      v41 = SHIBYTE(v90);
      v42 = (void **)__p;
      CAStreamBasicDescription::AsString(&v83, v92, 0x100uLL, v43, v44);
      if (v41 >= 0)
        p_p = &__p;
      else
        p_p = v42;
      fprintf(v40, "\n\t %s, [%s]\n", (const char *)p_p, v92);
      if (SHIBYTE(v90) < 0)
        operator delete(__p);
      v46 = *v35;
      if (!*v35)
        continue;
      __p = &off_1E3BE5C08;
      p_stream = &__stream;
      v90 = &v84;
      v91 = &__p;
      AUGraphParser::TraverseGraphNodesBFS(1, v46, 0, (uint64_t)&__p);
      v47 = v91;
      if (v91 == &__p)
      {
        v47 = &__p;
        v48 = 4;
        goto LABEL_72;
      }
      if (v91)
      {
        v48 = 5;
LABEL_72:
        (*((void (**)(void))*v47 + v48))();
      }
    }
  }
  if (*((_QWORD *)v4 + 22))
  {
    fwrite("\n\t ******** pending connections - input ********\n", 0x31uLL, 1uLL, __stream);
    for (j = (_QWORD *)*((_QWORD *)v4 + 21); j != (_QWORD *)((char *)v4 + 160); j = (_QWORD *)j[1])
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      *(_OWORD *)v92 = 0u;
      v93 = 0u;
      v50 = j[2];
      memset(&v83, 0, sizeof(v83));
      if (v50)
      {
        v51 = 6;
      }
      else
      {
        v50 = j[4];
        if (!v50)
          goto LABEL_82;
        v51 = 9;
      }
      v52 = (void *)(*(uint64_t (**)(void))(**(_QWORD **)(v50 + 24) + 8 * v51))();
      if (v52)
      {
        v53 = objc_msgSend(v52, "streamDescription");
        v54 = *(_OWORD *)(v53 + 16);
        *(_OWORD *)&v83.var0 = *(_OWORD *)v53;
        *(_OWORD *)&v83.var3 = v54;
        *(_QWORD *)&v83.var7 = *(_QWORD *)(v53 + 32);
      }
LABEL_82:
      v55 = __stream;
      AVAudioEngineGraph::ConnAsString(&__p, (uint64_t)v4, (uint64_t)(j + 2));
      v56 = SHIBYTE(v90);
      v57 = (void **)__p;
      CAStreamBasicDescription::AsString(&v83, v92, 0x100uLL, v58, v59);
      if (v56 >= 0)
        v60 = &__p;
      else
        v60 = v57;
      fprintf(v55, "\n\t %s, [%s]\n", (const char *)v60, v92);
      if (SHIBYTE(v90) < 0)
        operator delete(__p);
      v61 = j[4];
      if (!v61)
        continue;
      __p = &off_1E3BE5C50;
      p_stream = &__stream;
      v90 = &v84;
      v91 = &__p;
      AUGraphParser::TraverseGraphNodesBFS(0, v61, 0, (uint64_t)&__p);
      v62 = v91;
      if (v91 == &__p)
      {
        v62 = &__p;
        v63 = 4;
        goto LABEL_92;
      }
      if (v91)
      {
        v63 = 5;
LABEL_92:
        (*((void (**)(void))*v62 + v63))();
      }
    }
  }
  if (v86)
  {
    fwrite("\n\t ******** other nodes ********\n", 0x21uLL, 1uLL, __stream);
    v65 = v84;
    if (v84 != &v85)
    {
      do
      {
        AUGraphNodeBase::PrintNodeObject((AUGraphNodeBase *)v65[5], __stream, v64);
        v66 = v65[1];
        if (v66)
        {
          do
          {
            v67 = (uint64_t **)v66;
            v66 = (uint64_t *)*v66;
          }
          while (v66);
        }
        else
        {
          do
          {
            v67 = (uint64_t **)v65[2];
            v15 = *v67 == (uint64_t *)v65;
            v65 = v67;
          }
          while (!v15);
        }
        v65 = v67;
      }
      while (v67 != &v85);
    }
  }
  v68 = (_QWORD *)*((_QWORD *)v4 + 1);
  v71 = (_QWORD *)*v68;
  v69 = v68 + 1;
  v70 = v71;
  v3 = v78;
  if (v71 != v69)
  {
    do
    {
      *(_DWORD *)(v70[5] + 32) &= 0xFFFFFFE7;
      v72 = (_QWORD *)v70[1];
      if (v72)
      {
        do
        {
          v73 = v72;
          v72 = (_QWORD *)*v72;
        }
        while (v72);
      }
      else
      {
        do
        {
          v73 = (_QWORD *)v70[2];
          v15 = *v73 == (_QWORD)v70;
          v70 = v73;
        }
        while (!v15);
      }
      v70 = v73;
    }
    while (v73 != v69);
  }
  fwrite("______________________________________\n\n", 0x28uLL, 1uLL, __stream);
  std::__tree<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::__map_value_compare<AUGraphNodeBaseV3 *,std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::less<AUGraphNodeBaseV3 *>,true>,std::allocator<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>>>::destroy(v85);
  fflush(v79);
  v74 = v80;
  if (!v80)
  {
    v74 = malloc_type_malloc(1uLL, 0xC3C60566uLL);
    v80 = v74;
  }
  *((_BYTE *)v74 + v81) = 0;
  v75 = v80;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  fclose(v79);
  free(v80);
  std::recursive_mutex::unlock(v77);
  v29 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v75);
  free(v75);
LABEL_112:
  std::recursive_mutex::unlock(v3);
  return (id)v29;
}

- (void)setMusicSequence:(MusicSequence)musicSequence
{
  std::recursive_mutex *v5;
  _QWORD *v6;
  std::recursive_mutex *v7;
  uint64_t v8;
  OpaqueMusicSequence *v9;
  MusicSequence *v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  v6 = (_QWORD *)*((_QWORD *)self->_impl + 1);
  v7 = (std::recursive_mutex *)(*v6 + 112);
  std::recursive_mutex::lock(v7);
  v8 = v6[10];
  if (!v8)
  {
    v8 = operator new();
    *(_QWORD *)v8 = v6;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 8) = 0u;
    v10 = (MusicSequence *)(v8 + 8);
    v6[10] = v8;
    if (musicSequence)
      goto LABEL_6;
LABEL_20:
    std::recursive_mutex::unlock(v7);
    goto LABEL_21;
  }
  v10 = (MusicSequence *)(v8 + 8);
  v9 = *(OpaqueMusicSequence **)(v8 + 8);
  if (v9 == musicSequence)
    goto LABEL_20;
  if (v9)
  {
    MusicSequenceSetAudioGraph();
    *v10 = 0;
  }
LABEL_6:
  if (!musicSequence)
    goto LABEL_20;
  if (!*(_QWORD *)(v8 + 16))
  {
    v11 = (_QWORD *)operator new();
    *(_QWORD *)(v8 + 16) = v11;
    *v11 = v8;
    v11[1] = AUGraphSequencerInterface::IsGraphRunning;
    v11[2] = AUGraphSequencerInterface::RegisterAUStatusCallback;
    v11[3] = AUGraphSequencerInterface::RegisterRenderCallback;
    v11[4] = AUGraphSequencerInterface::UnregisterRenderCallback;
    v11[5] = AUGraphSequencerInterface::GetDefaultMusicDevice;
    v11[6] = AUGraphSequencerInterface::GetOutputAudioUnit;
  }
  v12 = MusicSequenceSetAudioGraph();
  if (!(_DWORD)v12)
  {
    *v10 = musicSequence;
    goto LABEL_20;
  }
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    v16 = "AVAEInternal.h";
    v17 = 1024;
    v18 = 104;
    v19 = 2080;
    v20 = "AVAudioEngineGraph.mm";
    v21 = 1024;
    v22 = 4496;
    v23 = 2080;
    v24 = "SetSequence";
    v25 = 2080;
    v26 = "err = MusicSequenceSetAudioGraph(inSequence, _seqGraphImpl)";
    v27 = 1024;
    v28 = v12;
    _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v12);
  std::recursive_mutex::unlock(v7);
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    v16 = "AVAEInternal.h";
    v17 = 1024;
    v18 = 104;
    v19 = 2080;
    v20 = "AVAudioEngine.mm";
    v21 = 1024;
    v22 = 1538;
    v23 = 2080;
    v24 = "SetSequence";
    v25 = 2080;
    v26 = "_graph->SetSequence(inSequence)";
    v27 = 1024;
    v28 = v12;
    _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("error %d"), v12);
LABEL_21:
  std::recursive_mutex::unlock(v5);
}

- (MusicSequence)musicSequence
{
  std::recursive_mutex *v3;
  _QWORD *v4;
  std::recursive_mutex *v5;
  uint64_t v6;
  OpaqueMusicSequence *v7;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v4 = (_QWORD *)*((_QWORD *)self->_impl + 1);
  v5 = (std::recursive_mutex *)(*v4 + 112);
  std::recursive_mutex::lock(v5);
  v6 = v4[10];
  if (v6)
    v7 = *(OpaqueMusicSequence **)(v6 + 8);
  else
    v7 = 0;
  std::recursive_mutex::unlock(v5);
  std::recursive_mutex::unlock(v3);
  return v7;
}

- (void)implementation
{
  return self->_impl;
}

- (BOOL)isRunning
{
  std::recursive_mutex *v3;
  char *impl;
  uint64_t v5;
  int v6;
  _BYTE *v7;
  _BYTE *v8;
  BOOL v9;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (char *)self->_impl;
  v5 = *((_QWORD *)impl + 1);
  if (v5)
  {
    v6 = *(unsigned __int8 *)(v5 + 208);
    v7 = (_BYTE *)(v5 + 184);
    v8 = impl + 64;
    if (!v6)
      v8 = v7;
    v9 = *v8 != 0;
  }
  else
  {
    v9 = 0;
  }
  std::recursive_mutex::unlock(v3);
  return v9;
}

- (BOOL)isAutoShutdownEnabled
{
  std::recursive_mutex *v3;
  uint64_t v4;
  BOOL v5;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v4 = *((_QWORD *)self->_impl + 1);
  if (v4)
    v5 = *(_BYTE *)(v4 + 208) != 0;
  else
    v5 = 0;
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (void)setAutoShutdownEnabled:(BOOL)autoShutdownEnabled
{
  int v3;
  std::recursive_mutex *v5;
  AVAudioEngineGraph *v6;
  std::recursive_mutex *v7;

  v3 = autoShutdownEnabled;
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  v6 = (AVAudioEngineGraph *)*((_QWORD *)self->_impl + 1);
  v7 = (std::recursive_mutex *)(*(_QWORD *)v6 + 112);
  std::recursive_mutex::lock(v7);
  if (*((unsigned __int8 *)v6 + 208) != v3)
  {
    *((_BYTE *)v6 + 208) = v3;
    AVAudioEngineGraph::MonitorState(v6);
  }
  std::recursive_mutex::unlock(v7);
  std::recursive_mutex::unlock(v5);
}

- (BOOL)isInManualRenderingMode
{
  AVAudioEngine *v2;
  std::recursive_mutex *v3;

  v2 = self;
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  LOBYTE(v2) = *(_BYTE *)(*((_QWORD *)v2->_impl + 1) + 187);
  std::recursive_mutex::unlock(v3);
  return (char)v2;
}

- (AVAudioEngineManualRenderingMode)manualRenderingMode
{
  std::recursive_mutex *v3;
  AVAudioEngineManualRenderingMode v4;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v4 = *(_QWORD *)(*((_QWORD *)self->_impl + 1) + 192);
  std::recursive_mutex::unlock(v3);
  return v4;
}

- (AVAudioFormat)manualRenderingFormat
{
  std::recursive_mutex *v3;
  AVAudioFormat *ManualRenderingFormat;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  ManualRenderingFormat = AVAudioEngineImpl::GetManualRenderingFormat((AVAudioEngineImpl *)self->_impl);
  std::recursive_mutex::unlock(v3);
  return ManualRenderingFormat;
}

- (AVAudioFrameCount)manualRenderingMaximumFrameCount
{
  std::recursive_mutex *v3;
  AVAudioEngineImpl *impl;
  AVAudioFrameCount v5;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (AVAudioEngineImpl *)self->_impl;
  if (*(_BYTE *)(*((_QWORD *)impl + 1) + 187))
    v5 = objc_msgSend((id)AVAudioEngineImpl::GetOutputNode(impl), "manualRenderingMaximumFrameCount");
  else
    v5 = 0;
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (AVAudioFramePosition)manualRenderingSampleTime
{
  std::recursive_mutex *v3;
  uint64_t v4;
  AVAudioFramePosition v5;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v4 = *((_QWORD *)self->_impl + 1);
  if (*(_BYTE *)(v4 + 187))
    v5 = *(_QWORD *)(v4 + 200);
  else
    v5 = 0;
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (BOOL)enableManualRenderingMode:(AVAudioEngineManualRenderingMode)mode format:(AVAudioFormat *)pcmFormat maximumFrameCount:(AVAudioFrameCount)maximumFrameCount error:(NSError *)outError
{
  uint64_t v7;
  std::recursive_mutex *v11;
  char *impl;
  void *v13;
  NSError *v14;
  double v15;
  uint64_t v16;
  char v17;
  BOOL v18;
  NSError *v19;

  v7 = *(_QWORD *)&maximumFrameCount;
  v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  impl = (char *)self->_impl;
  v13 = (void *)*((_QWORD *)impl + 5);
  if (!v13 || !objc_msgSend(v13, "isVoiceProcessingEnabled"))
  {
    if (!pcmFormat
      || !(_DWORD)v7
      || (-[AVAudioFormat sampleRate](pcmFormat, "sampleRate"), v15 <= 0.0)
      || !-[AVAudioFormat channelCount](pcmFormat, "channelCount"))
    {
      if (outError)
      {
        v14 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), -10851, 0);
        goto LABEL_20;
      }
LABEL_21:
      v18 = 0;
      goto LABEL_26;
    }
    std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)(impl + 112), (uint64_t)(impl + 176));
    v16 = *((_QWORD *)impl + 1);
    if (!*(_BYTE *)(v16 + 187) || *(_QWORD *)(v16 + 192) != mode)
    {
      if ((AVAudioEngineGraph::SetManualRenderingMode((AVAudioEngineGraph *)v16, 1, mode, outError) & 1) == 0)
      {
        v18 = 0;
LABEL_25:
        caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock((uint64_t)(impl + 176));
        std::recursive_mutex::unlock((std::recursive_mutex *)(impl + 112));
        goto LABEL_26;
      }
      if (*(_BYTE *)(*((_QWORD *)impl + 1) + 187))
        *((_QWORD *)impl + 2) = 0;
      AVAudioEngineImpl::UpdateIONodes((AVAudioEngineImpl *)impl);
    }
    v17 = objc_msgSend((id)AVAudioEngineImpl::GetOutputNode((AVAudioEngineImpl *)impl), "setManualRenderingPCMFormat:maximumFrameCount:", pcmFormat, v7);
    v18 = v17;
    if (outError)
    {
      if ((v17 & 1) != 0)
        v19 = 0;
      else
        v19 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), -10868, 0);
      *outError = v19;
    }
    goto LABEL_25;
  }
  if (!outError)
    goto LABEL_21;
  v14 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), -80800, 0);
LABEL_20:
  v18 = 0;
  *outError = v14;
LABEL_26:
  std::recursive_mutex::unlock(v11);
  return v18;
}

- (void)disableManualRenderingMode
{
  std::recursive_mutex *v3;
  char *impl;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (char *)self->_impl;
  if (*(_BYTE *)(*((_QWORD *)impl + 1) + 187))
  {
    std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)(impl + 112), (uint64_t)(impl + 176));
    AVAudioEngineImpl::Stop((AVAudioEngineImpl *)impl, 0);
    AVAudioEngineImpl::Reset((AVAudioEngineImpl *)impl);
    AVAudioEngineGraph::SetManualRenderingMode(*((AVAudioEngineGraph **)impl + 1), 0, AVAudioEngineManualRenderingModeRealtime, 0);
    if (*(_BYTE *)(*((_QWORD *)impl + 1) + 187))
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)impl;
        v7 = 136315650;
        v8 = "AVAudioEngine.mm";
        v9 = 1024;
        v10 = 1335;
        v11 = 2048;
        v12 = v6;
        _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine@%p: could not disable manual rendering mode", (uint8_t *)&v7, 0x1Cu);
      }
    }
    if (*(_BYTE *)(*((_QWORD *)impl + 1) + 187))
      *((_QWORD *)impl + 2) = 0;
    AVAudioEngineImpl::UpdateIONodes((AVAudioEngineImpl *)impl);
    caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock((uint64_t)(impl + 176));
    std::recursive_mutex::unlock((std::recursive_mutex *)(impl + 112));
  }
  std::recursive_mutex::unlock(v3);
}

- (AVAudioEngineManualRenderingBlock)manualRenderingBlock
{
  std::recursive_mutex *v3;
  char *impl;
  const void **v5;
  const void ***v6;
  const void **v7;
  void *v8;
  _QWORD v10[6];

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (char *)self->_impl;
  v6 = (const void ***)(impl + 104);
  v5 = (const void **)*((_QWORD *)impl + 13);
  if (!v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = ___ZN17AVAudioEngineImpl23GetManualRenderingBlockEv_block_invoke;
    v10[3] = &__block_descriptor_48_e55_q28__0I8__AudioBufferList_I_1_AudioBuffer_II_v___12_i20l;
    v10[4] = impl;
    v10[5] = impl;
    v7 = (const void **)operator new();
    *v7 = 0;
    *v7 = _Block_copy(v10);
    std::unique_ptr<AVAEBlock<AVAudioEngineManualRenderingStatus({block_pointer})(unsigned int,AudioBufferList *,int *)>>::reset[abi:ne180100](v6, v7);
    v5 = *v6;
  }
  v8 = (void *)*v5;
  std::recursive_mutex::unlock(v3);
  return v8;
}

- (AVAudioEngineManualRenderingStatus)renderOffline:(AVAudioFrameCount)numberOfFrames toBuffer:(AVAudioPCMBuffer *)buffer error:(NSError *)outError
{
  uint64_t v7;
  std::recursive_mutex *v9;
  _QWORD *impl;
  AVAudioNodeImplBase **v11;
  std::recursive_mutex *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  NSError *v17;
  AVAudioEngineManualRenderingStatus v18;
  AudioBufferList *v20;
  int v21;

  v7 = *(_QWORD *)&numberOfFrames;
  v9 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v9);
  impl = self->_impl;
  if (outError)
    *outError = 0;
  v11 = (AVAudioNodeImplBase **)impl[1];
  v12 = (std::recursive_mutex *)((char *)*v11 + 112);
  std::recursive_mutex::lock(v12);
  v21 = 0;
  if (!*((_BYTE *)v11 + 187) || v11[24])
  {
    v13 = 0;
    v14 = 0;
    v15 = -80800;
LABEL_6:
    v21 = v15;
    goto LABEL_7;
  }
  if (!buffer || -[AVAudioPCMBuffer frameCapacity](buffer, "frameCapacity") < v7)
  {
    v13 = 0;
    v14 = 0;
    v15 = -50;
    goto LABEL_6;
  }
  -[AVAudioPCMBuffer setFrameLength:](buffer, "setFrameLength:", v7);
  v20 = -[AVAudioBuffer mutableAudioBufferList](buffer, "mutableAudioBufferList");
  v13 = AVAudioEngineGraph::RenderToABL(v11, v7, v20, &v21);
  v14 = 0;
  if (!v21 && v20)
  {
    if (v20->mNumberBuffers)
    {
      if (v20->mBuffers[0].mDataByteSize)
        v14 = v7;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
  }
LABEL_7:
  -[AVAudioPCMBuffer setFrameLength:](buffer, "setFrameLength:", v14);
  v16 = v21;
  if (outError)
  {
    if (v21)
    {
      v17 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), v21, 0);
      v16 = v21;
    }
    else
    {
      v17 = 0;
    }
    *outError = v17;
  }
  std::recursive_mutex::unlock(v12);
  if (v16)
    v18 = AVAudioEngineManualRenderingStatusError;
  else
    v18 = v13;
  std::recursive_mutex::unlock(v9);
  return v18;
}

- (id)audioSession
{
  std::recursive_mutex *v3;
  id AudioSession;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AudioSession = AVAudioEngineImpl::GetAudioSession((AVAudioEngineImpl *)self->_impl);
  std::recursive_mutex::unlock(v3);
  return AudioSession;
}

- (void)setAudioSession:(id)a3
{
  std::recursive_mutex *v5;
  AVAudioEngineImpl *impl;
  AVAudioSession *v7;
  uint64_t v8;
  AVAudioSession *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  AVAudioIOUnit *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (AVAudioEngineImpl *)self->_impl;
  if (a3)
  {
    v10 = objc_msgSend(a3, "opaqueSessionID");
    if (*(_BYTE *)(*((_QWORD *)impl + 1) + 187))
    {
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)impl;
        v22 = 136315906;
        v23 = "AVAudioEngine.mm";
        v24 = 1024;
        v25 = 527;
        v26 = 2048;
        v27 = v12;
        v28 = 1024;
        v29 = v10;
        v13 = "%25s:%-5d Engine@%p: not associating with an audio session (0x%x) in manual rendering mode";
LABEL_7:
        v14 = v11;
        v15 = OS_LOG_TYPE_DEFAULT;
        v16 = 34;
LABEL_12:
        _os_log_impl(&dword_19B733000, v14, v15, v13, (uint8_t *)&v22, v16);
      }
    }
    else
    {
      v19 = (void *)*((_QWORD *)impl + 2);
      if (!v19 || objc_msgSend(v19, "opaqueSessionID") != v10)
      {
        v21 = (AVAudioIOUnit *)*((_QWORD *)impl + 7);
        if (v21)
        {
          if (AVAudioIOUnit::OverrideAudioSession(v21, (AVAudioSession *)a3))
            goto LABEL_13;
        }
        else
        {
          AVAudioEngineImpl::GetIOUnit(impl, (AVAudioSession *)a3, v7, v8, v9);
        }
        *((_QWORD *)impl + 2) = a3;
        goto LABEL_13;
      }
      if (AVAudioEngineLogCategory(void)::once != -1)
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
      v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)impl;
        v22 = 136315906;
        v23 = "AVAudioEngine.mm";
        v24 = 1024;
        v25 = 534;
        v26 = 2048;
        v27 = v20;
        v28 = 1024;
        v29 = v10;
        v13 = "%25s:%-5d Engine@%p: already associated with audio session (0x%x), no-op";
        goto LABEL_7;
      }
    }
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)impl;
      v22 = 136315650;
      v23 = "AVAudioEngine.mm";
      v24 = 1024;
      v25 = 519;
      v26 = 2048;
      v27 = v18;
      v13 = "%25s:%-5d Engine@%p: cannot associate with a nil audio session";
      v14 = v17;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 28;
      goto LABEL_12;
    }
  }
LABEL_13:
  std::recursive_mutex::unlock(v5);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode to:(AVAudioNode *)destinationNode format:(AVAudioFormat *)format block:(AUMIDIOutputEventBlock)tapBlock
{
  std::recursive_mutex *v11;

  v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNode, format, (uint64_t)tapBlock, 0);
  std::recursive_mutex::unlock(v11);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode toNodes:(NSArray *)destinationNodes format:(AVAudioFormat *)format block:(AUMIDIOutputEventBlock)tapBlock
{
  std::recursive_mutex *v11;

  v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNodes, format, (uint64_t)tapBlock, 0);
  std::recursive_mutex::unlock(v11);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode to:(AVAudioNode *)destinationNode format:(AVAudioFormat *)format eventListBlock:(AUMIDIEventListBlock)tapBlock
{
  std::recursive_mutex *v11;

  v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNode, format, (uint64_t)tapBlock, 1);
  std::recursive_mutex::unlock(v11);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode toNodes:(NSArray *)destinationNodes format:(AVAudioFormat *)format eventListBlock:(AUMIDIEventListBlock)tapBlock
{
  std::recursive_mutex *v11;

  v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNodes, format, (uint64_t)tapBlock, 1);
  std::recursive_mutex::unlock(v11);
}

- (void)disconnectMIDI:(AVAudioNode *)sourceNode from:(AVAudioNode *)destinationNode
{
  std::recursive_mutex *v7;
  AVAudioEngineGraph **impl;
  NSObject *v9;
  AVAudioEngineGraph *v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v10 = *impl;
    *(_DWORD *)buf = 136316162;
    v13 = "AVAudioEngine.mm";
    v14 = 1024;
    v15 = 1088;
    v16 = 2048;
    v17 = (char *)v10;
    v18 = 2048;
    *(_QWORD *)v19 = sourceNode;
    *(_WORD *)&v19[8] = 2048;
    *(_QWORD *)&v19[10] = destinationNode;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI node: %p from node: %p", buf, 0x30u);
  }
  if (!sourceNode || !destinationNode)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "AVAEInternal.h";
      v14 = 1024;
      v15 = 71;
      v16 = 2080;
      v17 = "AVAudioEngine.mm";
      v18 = 1024;
      *(_DWORD *)v19 = 1090;
      *(_WORD *)&v19[4] = 2080;
      *(_QWORD *)&v19[6] = "DisconnectMIDI";
      *(_WORD *)&v19[14] = 2080;
      *(_QWORD *)&v19[16] = "sourceNode != nil && destNode != nil";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "sourceNode != nil && destNode != nil");
  }
  AVAudioEngineGraph::DisconnectMIDI(impl[1], sourceNode, (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", destinationNode, 0));
  std::recursive_mutex::unlock(v7);
}

- (void)disconnectMIDI:(AVAudioNode *)sourceNode fromNodes:(NSArray *)destinationNodes
{
  AVAudioEngineGraph **impl;
  NSObject *v7;
  AVAudioEngineGraph *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  std::recursive_mutex *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  _BYTE v27[24];
  uint8_t v28[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v14 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v14);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v8 = *impl;
    *(_DWORD *)buf = 136316162;
    v21 = "AVAudioEngine.mm";
    v22 = 1024;
    v23 = 1097;
    v24 = 2048;
    v25 = (char *)v8;
    v26 = 2048;
    *(_QWORD *)v27 = sourceNode;
    *(_WORD *)&v27[8] = 2080;
    *(_QWORD *)&v27[10] = -[NSString UTF8String](-[NSArray description](destinationNodes, "description"), "UTF8String");
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI node: %p from nodes: %s", buf, 0x30u);
  }
  if (!sourceNode || !destinationNodes || !-[NSArray count](destinationNodes, "count"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "AVAEInternal.h";
      v22 = 1024;
      v23 = 71;
      v24 = 2080;
      v25 = "AVAudioEngine.mm";
      v26 = 1024;
      *(_DWORD *)v27 = 1099;
      *(_WORD *)&v27[4] = 2080;
      *(_QWORD *)&v27[6] = "DisconnectMIDI";
      *(_WORD *)&v27[14] = 2080;
      *(_QWORD *)&v27[16] = "sourceNode != nil && destNodes != nil && destNodes.count > 0";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "sourceNode != nil && destNodes != nil && destNodes.count > 0");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](destinationNodes, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(destinationNodes);
        if (!*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (AVAudioEngineLogCategory(void)::once != -1)
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
          v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v28 = 136316418;
            v29 = "AVAEInternal.h";
            v30 = 1024;
            v31 = 71;
            v32 = 2080;
            v33 = "AVAudioEngine.mm";
            v34 = 1024;
            v35 = 1101;
            v36 = 2080;
            v37 = "DisconnectMIDI";
            v38 = 2080;
            v39 = "object && [object isKindOfClass: [AVAudioNode class]]";
            _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v28, 0x36u);
          }
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "object && [object isKindOfClass: [AVAudioNode class]]");
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](destinationNodes, "countByEnumeratingWithState:objects:count:", &v16, buf, 16);
    }
    while (v10);
  }
  AVAudioEngineGraph::DisconnectMIDI(impl[1], sourceNode, destinationNodes);
  std::recursive_mutex::unlock(v14);
}

- (void)disconnectMIDIInput:(AVAudioNode *)node
{
  std::recursive_mutex *v5;
  AVAudioEngineGraph **impl;
  NSObject *v7;
  AVAudioEngineGraph *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v8 = *impl;
    *(_DWORD *)buf = 136315906;
    v11 = "AVAudioEngine.mm";
    v12 = 1024;
    v13 = 1109;
    v14 = 2048;
    v15 = (char *)v8;
    v16 = 2048;
    *(_QWORD *)v17 = node;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI inputs on node: %p", buf, 0x26u);
  }
  if (node)
  {
    AVAudioEngineGraph::DisconnectAllMIDIInputs(impl[1], node);
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      v12 = 1024;
      v13 = 71;
      v14 = 2080;
      v15 = "AVAudioEngine.mm";
      v16 = 1024;
      *(_DWORD *)v17 = 1111;
      *(_WORD *)&v17[4] = 2080;
      *(_QWORD *)&v17[6] = "DisconnectAllMIDIInputs";
      v18 = 2080;
      v19 = "node != nil";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "node != nil");
    AVAudioEngineGraph::DisconnectAllMIDIInputs(impl[1], 0);
  }
  std::recursive_mutex::unlock(v5);
}

- (void)disconnectMIDIOutput:(AVAudioNode *)node
{
  std::recursive_mutex *v5;
  AVAudioEngineGraph **impl;
  NSObject *v7;
  AVAudioEngineGraph *v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1)
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
  v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v8 = *impl;
    *(_DWORD *)buf = 136315906;
    v11 = "AVAudioEngine.mm";
    v12 = 1024;
    v13 = 1118;
    v14 = 2048;
    v15 = (char *)v8;
    v16 = 2048;
    *(_QWORD *)v17 = node;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI outputs on node: %p", buf, 0x26u);
  }
  if (node)
  {
    AVAudioEngineGraph::DisconnectAllMIDIOutputs(impl[1], node);
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      v12 = 1024;
      v13 = 71;
      v14 = 2080;
      v15 = "AVAudioEngine.mm";
      v16 = 1024;
      *(_DWORD *)v17 = 1120;
      *(_WORD *)&v17[4] = 2080;
      *(_QWORD *)&v17[6] = "DisconnectAllMIDIOutputs";
      v18 = 2080;
      v19 = "node != nil";
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "node != nil");
    AVAudioEngineGraph::DisconnectAllMIDIOutputs(impl[1], 0);
  }
  std::recursive_mutex::unlock(v5);
}

- (NSSet)attachedNodes
{
  std::recursive_mutex *v3;
  NSSet *v4;

  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v4 = (NSSet *)(id)objc_msgSend(*((id *)self->_impl + 3), "copy");
  std::recursive_mutex::unlock(v3);
  return v4;
}

@end
