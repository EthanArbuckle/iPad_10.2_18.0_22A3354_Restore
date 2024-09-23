@implementation AUAudioUnitV2Bridge

- (unsigned)_elementCount:(unsigned int)a3
{
  UInt32 ioDataSize;
  unsigned int outData;

  outData = 0;
  ioDataSize = 4;
  AudioUnitGetProperty(self->_audioUnit, 0xBu, a3, 0, &outData, &ioDataSize);
  return outData;
}

- (BOOL)_elementCountWritable:(unsigned int)a3
{
  Boolean outWritable;
  UInt32 outDataSize;

  outDataSize = 0;
  outWritable = 0;
  AudioUnitGetPropertyInfo(self->_audioUnit, 0xBu, a3, 0, &outDataSize, &outWritable);
  return outWritable != 0;
}

- (BOOL)_setElementCount:(unsigned int)a3 count:(unsigned int)a4 error:(id *)a5
{
  OSStatus v6;
  OSStatus v7;
  id v8;
  unsigned int inData;

  inData = a4;
  v6 = AudioUnitSetProperty(self->_audioUnit, 0xBu, a3, 0, &inData, 4u);
  v7 = v6;
  if (a5)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v6, 0);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v8;

    }
    else
    {
      *a5 = 0;
    }
  }
  return v7 == 0;
}

- (void)_rebuildBusses:(unsigned int)a3
{
  uint64_t v3;
  int *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  AUV2BridgeBus *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  if (a3 == 1)
  {
    v5 = &OBJC_IVAR___AUAudioUnitV2Bridge__inputBusses;
  }
  else
  {
    if (a3 != 2)
      __assert_rtn("-[AUAudioUnitV2Bridge _rebuildBusses:]", "AUAudioUnitV2Bridge.mm", 508, "0");
    v5 = &OBJC_IVAR___AUAudioUnitV2Bridge__outputBusses;
  }
  v10 = *(id *)((char *)&self->super.super.isa + *v5);
  v6 = (void *)objc_opt_new();
  v7 = -[AUAudioUnitV2Bridge _elementCount:](self, "_elementCount:", v3);
  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = -[AUV2BridgeBus initWithOwner:au:scope:element:]([AUV2BridgeBus alloc], "initWithOwner:au:scope:element:", self, self->_audioUnit, v3, v8);
      objc_msgSend(v6, "addObject:", v9);

      v8 = (v8 + 1);
    }
    while (v7 != (_DWORD)v8);
  }
  objc_msgSend(v10, "replaceBusses:", v6);

}

- (int)enableBus:(unsigned int)a3 scope:(unsigned int)a4 enable:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  AUAudioUnitV2Bridge_Renderer *value;
  uint64_t (*v8)(AUAudioUnitV2Bridge_Renderer *, void *, unsigned int *, const AudioTimeStamp *, int, uint64_t, AudioBufferList *);
  AUAudioUnitV2Bridge_Renderer *v9;
  int result;
  _QWORD v11[4];

  if (a4 != 1)
    return 0;
  v11[2] = v5;
  v11[3] = v6;
  value = self->_renderer.__ptr_.__value_;
  v8 = AUAudioUnitV2Bridge_Renderer::renderInputProc;
  if (a5)
  {
    v9 = self->_renderer.__ptr_.__value_;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v11[0] = v8;
  v11[1] = v9;
  result = AudioUnitSetProperty(*(AudioUnit *)value, 0x17u, 1u, a3, v11, 0x10u);
  if (!result)
    return 0;
  return result;
}

- (void)_notifyParameterChange:(unint64_t)a3
{
  int v3;
  OpaqueAudioComponentInstance *audioUnit;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[4];
  id v8;
  int v9;
  OpaqueAudioComponentInstance *v10;
  int v11;
  int v12;
  int v13;
  id location;

  v3 = a3;
  audioUnit = self->_audioUnit;
  v5 = a3 >> 61;
  v6 = HIDWORD(a3) & 0x1FFFFFFF;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AUAudioUnitV2Bridge__notifyParameterChange___block_invoke;
  v7[3] = &unk_1E2921738;
  objc_copyWeak(&v8, &location);
  v9 = 0;
  v10 = audioUnit;
  v11 = v3;
  v12 = v5;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_buildNewParameterTree
{
  NSObject *parameterTreeRebuildQueue;
  id v3;
  NSObject *v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v9[3];
  void *__p;
  _BYTE *v11;
  uint64_t v12;
  id v13;
  AUAudioUnitV2Bridge *v14;
  _BYTE block[24];
  void *v16;
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = self;
  __p = 0;
  v11 = 0;
  v12 = 0;
  parameterTreeRebuildQueue = self->_parameterTreeRebuildQueue;
  v9[0] = &v13;
  v9[1] = &v14;
  v9[2] = &__p;
  *(_QWORD *)block = MEMORY[0x1E0C809B0];
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = ___ZN10applesauce8dispatch2v19sync_implIZ45__AUAudioUnitV2Bridge__buildNewParameterTree_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  v16 = &__block_descriptor_40_e5_v8__0l;
  v17 = v9;
  dispatch_sync(parameterTreeRebuildQueue, block);
  if (v13)
  {
    v3 = v13;
    goto LABEL_13;
  }
  if (!kAUExtensionScope)
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v4 = *(id *)kAUExtensionScope;
  if (v4)
  {
LABEL_7:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)block = 136315650;
      *(_QWORD *)&block[4] = "AUAudioUnitV2Bridge.mm";
      *(_WORD *)&block[12] = 1024;
      *(_DWORD *)&block[14] = 667;
      *(_WORD *)&block[18] = 1024;
      *(_DWORD *)&block[20] = (unint64_t)(v11 - (_BYTE *)__p) >> 3;
      _os_log_impl(&dword_18EE07000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d Suppressed redundant parameter tree rebuilding; %d dirty values",
        block,
        0x18u);
    }

  }
  v6 = __p;
  v7 = v11;
  if (__p == v11)
  {
    v3 = 0;
    if (!__p)
      goto LABEL_15;
    goto LABEL_14;
  }
  do
    -[AUAudioUnitV2Bridge _notifyParameterChange:](v14, "_notifyParameterChange:", *v6++);
  while (v6 != v7);
  v3 = 0;
LABEL_13:
  v6 = __p;
  if (__p)
  {
LABEL_14:
    v11 = v6;
    operator delete(v6);
  }
LABEL_15:

  return v3;
}

- (void)_invalidateParameterTree:(unsigned int)a3
{
  int v3;
  atomic<unsigned int> *p_eventsTriggeringParameterTreeInvalidation;
  unsigned int v5;
  NSObject *parameterTreeRebuildQueue;
  _QWORD v7[2];
  id v8;
  AUAudioUnitV2Bridge *v9;
  _QWORD block[5];

  v9 = self;
  if (a3 <= 0xB && ((1 << a3) & 0x818) != 0)
    v3 = 2;
  else
    v3 = 1;
  p_eventsTriggeringParameterTreeInvalidation = &self->_eventsTriggeringParameterTreeInvalidation;
  do
    v5 = __ldaxr(&p_eventsTriggeringParameterTreeInvalidation->__a_.__a_value);
  while (__stlxr(v5 | v3, &p_eventsTriggeringParameterTreeInvalidation->__a_.__a_value));
  if (v9->_cachedParameterTree)
  {
    -[AUAudioUnitV2Bridge _buildNewParameterTree](v9, "_buildNewParameterTree");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[AUAudioUnitV2Bridge willChangeValueForKey:](v9, "willChangeValueForKey:", CFSTR("parameterTree"));
      parameterTreeRebuildQueue = v9->_parameterTreeRebuildQueue;
      v7[0] = &v9;
      v7[1] = &v8;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN10applesauce8dispatch2v19sync_implIZ48__AUAudioUnitV2Bridge__invalidateParameterTree__E3__2EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v7;
      dispatch_sync(parameterTreeRebuildQueue, block);
      -[AUAudioUnitV2Bridge didChangeValueForKey:](v9, "didChangeValueForKey:", CFSTR("parameterTree"));

    }
  }
}

- (void)init2
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *parameterTreeRebuildQueue;
  AUV2BridgeBusArray *v5;
  AUV2BridgeBusArray *inputBusses;
  AUV2BridgeBusArray *v7;
  AUV2BridgeBusArray *outputBusses;
  uint64_t v9;
  AUAudioUnitV2Bridge_Renderer *value;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("parameterTreeBuilderQueue", 0);
  parameterTreeRebuildQueue = self->_parameterTreeRebuildQueue;
  self->_parameterTreeRebuildQueue = v3;

  v5 = -[AUV2BridgeBusArray initWithOwner:scope:]([AUV2BridgeBusArray alloc], "initWithOwner:scope:", self, 1);
  inputBusses = self->_inputBusses;
  self->_inputBusses = v5;

  v7 = -[AUV2BridgeBusArray initWithOwner:scope:]([AUV2BridgeBusArray alloc], "initWithOwner:scope:", self, 2);
  outputBusses = self->_outputBusses;
  self->_outputBusses = v7;

  -[AUAudioUnitV2Bridge _rebuildBusses:](self, "_rebuildBusses:", 1);
  -[AUAudioUnitV2Bridge _rebuildBusses:](self, "_rebuildBusses:", 2);
  AudioUnitAddPropertyListener(self->_audioUnit, 0xBu, (AudioUnitPropertyListenerProc)ElementCountPropertyListener, self);
  AudioUnitAddPropertyListener(self->_audioUnit, 3u, (AudioUnitPropertyListenerProc)ParameterListPropertyListener, self);
  AudioUnitAddPropertyListener(self->_audioUnit, 4u, (AudioUnitPropertyListenerProc)ParameterListPropertyListener, self);
  v9 = operator new();
  *(_QWORD *)v9 = self->_audioUnit;
  *(_QWORD *)(v9 + 8) = &caulk::inplace_function_detail::vtable<int,unsigned int *,AudioTimeStamp const*,unsigned int,long,AudioBufferList *>::empty;
  *(_QWORD *)(v9 + 48) = &caulk::inplace_function_detail::vtable<BOOL,double *,double *,long *,double *,long *,double *>::empty;
  *(_QWORD *)(v9 + 88) = &caulk::inplace_function_detail::vtable<BOOL,unsigned long *,double *,double *,double *>::empty;
  value = self->_renderer.__ptr_.__value_;
  self->_renderer.__ptr_.__value_ = (AUAudioUnitV2Bridge_Renderer *)v9;
  if (value)
    std::default_delete<AUAudioUnitV2Bridge_Renderer>::operator()[abi:ne180100](value);
  atomic_store(0, (unsigned __int8 *)&self->_willSetFullState);
}

- (AUAudioUnitV2Bridge)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  AUAudioUnitV2Bridge *v8;
  AudioComponent Next;
  uint64_t v10;
  int v11;
  OpaqueAudioComponentInstance *v12;
  id v13;
  AUAudioUnitV2Bridge *v14;
  objc_super v16;
  AudioComponentDescription v17;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;

  v6 = *(_QWORD *)&a4;
  v17 = *a3;
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitV2Bridge;
  v8 = -[AUAudioUnit initWithComponentDescription:options:error:](&v16, sel_initWithComponentDescription_options_error_, &v17);
  if (!v8)
    goto LABEL_14;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  Next = AudioComponentFindNext(0, a3);
  if (!Next || (v10 = (**(uint64_t (***)(AudioComponent))Next)(Next)) == 0)
  {
    v11 = -3000;
    *((_DWORD *)v28 + 6) = -3000;
    if (!a5)
    {
LABEL_11:
      v12 = 0;
      goto LABEL_12;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v13;

    goto LABEL_11;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = ___Z21instantiateV2BridgeAURK25AudioComponentDescriptionjPU15__autoreleasingP7NSError_block_invoke;
  v18[3] = &unk_1E2920E10;
  v18[4] = &v23;
  v18[5] = &v27;
  v18[6] = &v19;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v10 + 88))(v10, v6, 1, v18);
  if (!*((_BYTE *)v20 + 24))
    __assert_rtn("instantiateV2BridgeAU", "AUAudioUnit.mm", 363, "replied");
  _Block_object_dispose(&v19, 8);
  if (!*((_DWORD *)v28 + 6))
  {
    v12 = (OpaqueAudioComponentInstance *)v24[3];
    _Block_object_dispose(&v23, 8);
    goto LABEL_12;
  }
  _Block_object_dispose(&v23, 8);
  if (!a5)
    goto LABEL_11;
  v11 = *((_DWORD *)v28 + 6);
  if (v11)
    goto LABEL_10;
  v12 = 0;
  *a5 = 0;
LABEL_12:
  _Block_object_dispose(&v27, 8);
  v8->_audioUnit = v12;
  if (!v12)
  {
    v14 = 0;
    goto LABEL_16;
  }
  v8->_audioUnitIsOwned = 1;
  -[AUAudioUnitV2Bridge init2](v8, "init2");
LABEL_14:
  v14 = v8;
LABEL_16:

  return v14;
}

- (AUAudioUnitV2Bridge)initWithAudioUnit:(OpaqueAudioComponentInstance *)a3 description:(AudioComponentDescription *)a4
{
  AUAudioUnitV2Bridge *v5;
  AUAudioUnitV2Bridge *v6;
  objc_super v8;
  AudioComponentDescription v9;

  v9 = *a4;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnitV2Bridge;
  v5 = -[AUAudioUnit initWithComponentDescription:options:error:](&v8, sel_initWithComponentDescription_options_error_, &v9, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_audioUnit = a3;
    v5->_audioUnitIsOwned = 0;
    -[AUAudioUnitV2Bridge init2](v5, "init2");
  }
  return v6;
}

- (AudioUnit)audioUnit
{
  return self->_audioUnit;
}

- (void)invalidateAudioUnit
{
  JUMPOUT(0x193FFE460);
}

- (void)dealloc
{
  objc_super v3;

  -[AUAudioUnitV2Bridge invalidateAudioUnit](self, "invalidateAudioUnit");
  v3.receiver = self;
  v3.super_class = (Class)AUAudioUnitV2Bridge;
  -[AUAudioUnit dealloc](&v3, sel_dealloc);
}

- (id)inputBusses
{
  return self->_inputBusses;
}

- (id)outputBusses
{
  return self->_outputBusses;
}

- (id)internalRenderBlock
{
  AUAudioUnitV2Bridge_Renderer *value;
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  value = self->_renderer.__ptr_.__value_;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___ZN28AUAudioUnitV2Bridge_Renderer11renderBlockEv_block_invoke;
  aBlock[3] = &__block_descriptor_40_e433_i60__0_I8r__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_16I24q28__AudioBufferList_I_1_AudioBuffer_II_v___36r__AURenderEvent__AURenderEventHeader___AURenderEvent_qCC__AUParameterEvent___AURenderEvent_qC_3C_IQf__AUMIDIEvent___AURenderEvent_qCCSC_3C___AUMIDIEventList___AURenderEvent_qCCC_MIDIEventList_iI_1_MIDIEventPacket_QI_64I______44___i___I__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_Iq__AudioBufferList_I_1_AudioBuffer_II_v____52l;
  aBlock[4] = value;
  v3 = _Block_copy(aBlock);
  v4 = _Block_copy(v3);

  return v4;
}

- (void)deliverV2Parameters:(const AURenderEvent *)a3
{
  const AURenderEvent *next;

  if (a3)
  {
    next = a3;
    do
    {
      if (next->head.eventType == AURenderEventParameter)
      {
        if (next->MIDIEventsList.eventList.packet[0].wordCount)
          AudioUnitSetParameter(self->_audioUnit, next->parameter.parameterAddress, next->parameter.parameterAddress >> 61, HIDWORD(next->parameter.parameterAddress) & 0x1FFFFFFF, next->parameter.value, 0);
      }
      next = next->head.next;
    }
    while (next);
  }
}

- (id)MIDIOutputEventBlock
{
  return _Block_copy(self->_MIDIOutputEventBlock);
}

- (id)MIDIOutputEventListBlock
{
  return _Block_copy(self->_MIDIOutputEventListBlock);
}

- (void)setMIDIOutputEventBlock:(id)a3
{
  id v4;
  void *v5;
  id MIDIOutputEventBlock;
  BOOL v7;
  void *v8;
  id v9;
  id v10;
  uint64_t (*v11)(void *, const AudioTimeStamp *, unsigned __int8, const MIDIPacketList *);
  id v12;

  v4 = a3;
  v5 = v4;
  MIDIOutputEventBlock = self->_MIDIOutputEventBlock;
  if (MIDIOutputEventBlock)
    v7 = MIDIOutputEventBlock == v4;
  else
    v7 = 1;
  if (!v7)
  {
    self->_MIDIOutputEventBlock = 0;

  }
  v8 = (void *)objc_msgSend(v5, "copy");
  v9 = self->_MIDIOutputEventBlock;
  self->_MIDIOutputEventBlock = v8;

  v10 = self->_MIDIOutputEventBlock;
  if (v10)
  {
    v11 = _auV2midiOutCallback;
    v12 = v10;
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  AudioUnitSetProperty(self->_audioUnit, 0x30u, 0, 0, &v11, 0x10u);

}

- (void)setMIDIOutputEventListBlock:(id)a3
{
  id v4;
  id *p_MIDIOutputEventListBlock;
  id MIDIOutputEventListBlock;
  BOOL v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = a3;
  p_MIDIOutputEventListBlock = &self->_MIDIOutputEventListBlock;
  MIDIOutputEventListBlock = self->_MIDIOutputEventListBlock;
  v10 = v4;
  if (MIDIOutputEventListBlock)
    v7 = MIDIOutputEventListBlock == v4;
  else
    v7 = 1;
  if (!v7)
  {
    *p_MIDIOutputEventListBlock = 0;

  }
  v8 = objc_msgSend(v10, "copy");
  v9 = *p_MIDIOutputEventListBlock;
  *p_MIDIOutputEventListBlock = (id)v8;

  AudioUnitSetProperty(self->_audioUnit, 0x3Fu, 0, 0, &self->_MIDIOutputEventListBlock, 8u);
}

- (void)setMusicalContextBlock:(id)a3
{
  id v4;
  AUAudioUnitV2Bridge_Renderer *value;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnitV2Bridge;
  -[AUAudioUnit setMusicalContextBlock:](&v8, sel_setMusicalContextBlock_, v4);
  value = self->_renderer.__ptr_.__value_;
  -[AUAudioUnit musicalContextBlock](self, "musicalContextBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnit transportStateBlock](self, "transportStateBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AUAudioUnitV2Bridge_Renderer::prepareHostCallbacks((uint64_t)value, v6, v7);

}

- (void)setTransportStateBlock:(id)a3
{
  id v4;
  AUAudioUnitV2Bridge_Renderer *value;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnitV2Bridge;
  -[AUAudioUnit setTransportStateBlock:](&v8, sel_setTransportStateBlock_, v4);
  value = self->_renderer.__ptr_.__value_;
  -[AUAudioUnit musicalContextBlock](self, "musicalContextBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUAudioUnit transportStateBlock](self, "transportStateBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AUAudioUnitV2Bridge_Renderer::prepareHostCallbacks((uint64_t)value, v6, v7);

}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  _BOOL4 v5;
  OSStatus v6;
  id v7;
  AUAudioUnitV2Bridge_Renderer *value;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AUAudioUnitV2Bridge;
  v5 = -[AUAudioUnit allocateRenderResourcesAndReturnError:](&v12, sel_allocateRenderResourcesAndReturnError_);
  if (v5)
  {
    v6 = AudioUnitInitialize(self->_audioUnit);
    if (v6)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v6, 0);
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a3 = v7;

      }
      LOBYTE(v5) = 0;
    }
    else
    {
      value = self->_renderer.__ptr_.__value_;
      -[AUAudioUnit musicalContextBlock](self, "musicalContextBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AUAudioUnit transportStateBlock](self, "transportStateBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AUAudioUnitV2Bridge_Renderer::prepareHostCallbacks((uint64_t)value, v9, v10);

      if (a3)
        *a3 = 0;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)internalDeallocateRenderResources
{
  objc_super v3;

  AudioUnitUninitialize(self->_audioUnit);
  -[AUAudioUnitV2Bridge setMIDIOutputEventBlock:](self, "setMIDIOutputEventBlock:", 0);
  -[AUAudioUnitV2Bridge setMIDIOutputEventListBlock:](self, "setMIDIOutputEventListBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AUAudioUnitV2Bridge;
  -[AUAudioUnit internalDeallocateRenderResources](&v3, sel_internalDeallocateRenderResources);
}

- (id)parametersForOverviewWithCount:(int64_t)a3
{
  char *v5;
  char *v6;
  void *v7;
  char *v8;
  void *v9;
  UInt32 ioDataSize;

  ioDataSize = 24 * a3;
  if (a3)
  {
    if ((unint64_t)a3 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v5 = (char *)operator new(24 * a3);
    bzero(v5, 24 * ((24 * a3 - 24) / 0x18uLL) + 24);
    v6 = &v5[24 * ((24 * a3 - 24) / 0x18uLL) + 24];
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  if (AudioUnitGetProperty(self->_audioUnit, 0x39u, 0, 0, v5, &ioDataSize))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    if (v5 != v6)
    {
      v8 = v5;
      do
      {
        if (*(_QWORD *)v8)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", ((unint64_t)*((unsigned int *)v8 + 3) << 61) | ((unint64_t)(*((_DWORD *)v8 + 4) & 0x1FFFFFFF) << 32) | *((unsigned int *)v8 + 2));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v9);

        }
        v8 += 24;
      }
      while (v8 != v6);
    }
  }
  if (v5)
    operator delete(v5);
  return v7;
}

- (void)reset
{
  AudioUnitReset(self->_audioUnit, 0, 0);
}

- (void)_createEventListenerQueue
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *eventListenerQueue;

  if (!self->_eventListenerQueue)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("AUAudioUnitV2Bridge.eventListener", 0);
    eventListenerQueue = self->_eventListenerQueue;
    self->_eventListenerQueue = v3;

  }
}

- (id)_createParameterTree
{
  NSObject *eventListenerQueue;
  OpaqueAudioComponentInstance *audioUnit;
  uint64_t i;
  std::vector<unsigned int>::size_type v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int64x2_t v16;
  UInt32 *v17;
  std::vector<unsigned int>::pointer begin;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned int *v23;
  unsigned int *v24;
  unsigned int *j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  id v35;
  double v36;
  id v37;
  id v38;
  uint64_t v39;
  char *v40;
  int v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int64x2_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int64x2_t v70;
  char *v71;
  uint64_t *v72;
  char *v73;
  __int128 v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  int v86;
  int v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  unsigned int v99;
  uint64_t v100;
  AUAudioUnitV2Bridge *v102;
  OpaqueAudioComponentInstance *v103;
  void *v104;
  std::vector<unsigned int>::pointer end;
  unsigned int *v106;
  id v107;
  unsigned int v108;
  _QWORD v109[5];
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[5];
  _QWORD v113[5];
  AUAudioUnitV2Bridge *v114;
  AudioUnit inUnit;
  _QWORD inBlock[4];
  id v117;
  __int128 v118;
  char *v119;
  std::vector<unsigned int> v120;
  UInt32 outDataSize;
  UInt32 ioDataSize;
  uint64_t v123;
  int64x2_t v124;
  char *v125;
  char **v126;
  uint64_t v127;
  int64x2_t v128;
  char *v129;
  char **v130;
  unsigned int *outData;
  int64x2_t v132;
  UInt32 *v133;
  id *v134;
  unint64_t *v135;
  int v136;
  UInt32 v137[2];
  id v138;
  unint64_t v139;
  int v140;
  id location[2];
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  if (!self->_audioUnit)
  {
    v97 = 0;
    return v97;
  }
  -[AUAudioUnitV2Bridge _createEventListenerQueue](self, "_createEventListenerQueue");
  if (!self->_parameterListener)
  {
    objc_initWeak(location, self);
    eventListenerQueue = self->_eventListenerQueue;
    inBlock[0] = MEMORY[0x1E0C809B0];
    inBlock[1] = 3221225472;
    inBlock[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke;
    inBlock[3] = &unk_1E2921760;
    objc_copyWeak(&v117, location);
    AUEventListenerCreateWithDispatchQueue(&self->_parameterListener, 0.0, 0.0, eventListenerQueue, inBlock);
    objc_destroyWeak(&v117);
    objc_destroyWeak(location);
  }
  v114 = self;
  inUnit = -[AUAudioUnitV2Bridge audioUnit](v114, "audioUnit");
  v102 = v114;

  audioUnit = self->_audioUnit;
  v104 = (void *)objc_opt_new();
  v103 = audioUnit;
  for (i = 0; i != 8; ++i)
  {
    v108 = -[AUAudioUnitV2Bridge _elementCount:](v114, "_elementCount:", i);
    if (!i || v108)
    {
      outDataSize = 4;
      if (!AudioUnitGetPropertyInfo(inUnit, 3u, i, 0, &outDataSize, 0) && outDataSize >= 4)
      {
        v7 = (unint64_t)outDataSize >> 2;
        std::vector<unsigned int>::vector(&v120, v7);
        if (!AudioUnitGetProperty(inUnit, 3u, i, 0, v120.__begin_, &outDataSize))
        {
          v118 = 0uLL;
          v119 = 0;
          v134 = (id *)&v119;
          v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v7);
          v10 = *((_QWORD *)&v118 + 1);
          v11 = v118;
          if (*((_QWORD *)&v118 + 1) == (_QWORD)v118)
          {
            v16 = vdupq_n_s64(*((unint64_t *)&v118 + 1));
            v12 = v8;
          }
          else
          {
            v12 = v8;
            do
            {
              v13 = *(_QWORD *)(v10 - 24);
              v10 -= 24;
              v14 = *(_DWORD *)(v10 + 8);
              *((_QWORD *)v12 - 3) = v13;
              v12 -= 24;
              *((_DWORD *)v12 + 2) = v14;
              v15 = *(_QWORD *)(v10 + 16);
              *(_QWORD *)(v10 + 16) = 0;
              *((_QWORD *)v12 + 2) = v15;
            }
            while (v10 != v11);
            v16 = (int64x2_t)v118;
          }
          *(_QWORD *)&v118 = v12;
          *((_QWORD *)&v118 + 1) = v8;
          v132 = v16;
          v17 = (UInt32 *)v119;
          v119 = &v8[24 * v9];
          v133 = v17;
          outData = (unsigned int *)v16.i64[0];
          std::__split_buffer<ParameterTreeBuilder::ClumpableParam>::~__split_buffer((uint64_t)&outData);
          begin = v120.__begin_;
          end = v120.__end_;
          if (v120.__begin_ != v120.__end_)
          {
            v19 = 0;
            while (1)
            {
              v20 = *begin;
              v147 = 0;
              v145 = 0u;
              v146 = 0u;
              v143 = 0u;
              v144 = 0u;
              *(_OWORD *)location = 0u;
              v142 = 0u;
              ioDataSize = 104;
              if (!AudioUnitGetProperty(inUnit, 4u, i, v20, location, &ioDataSize))
                break;
LABEL_72:
              if (++begin == end)
                goto LABEL_73;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v147 & 0x8000000) != 0)
            {
              if ((v147 & 0x10) != 0)
                v107 = (id)*((_QWORD *)&v145 + 1);
              else
                v107 = *((id *)&v145 + 1);
            }
            else if (LOBYTE(location[0]))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", location);
              v107 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v107 = 0;
            }
            if ((_DWORD)v146 == 1)
            {
              outData = 0;
              ioDataSize = 8;
              AudioUnitGetProperty(inUnit, 0x10u, i, v20, &outData, &ioDataSize);
              v106 = outData;
            }
            else
            {
              v106 = 0;
            }
            v137[0] = 0;
            v22 = 0;
            if (!AudioUnitGetPropertyInfo(inUnit, 0x2Du, i, v20, v137, 0) && v137[0])
            {
              outData = 0;
              v132 = 0uLL;
              std::vector<AUDependentParameter>::resize((char **)&outData, (unint64_t)v137[0] >> 3);
              v23 = outData;
              if (AudioUnitGetProperty(inUnit, 0x2Du, i, v20, outData, v137))
              {
                v22 = 0;
              }
              else
              {
                std::vector<AUDependentParameter>::resize((char **)&outData, (unint64_t)v137[0] >> 3);
                v22 = (void *)objc_opt_new();
                v23 = outData;
                v24 = (unsigned int *)v132.i64[0];
                for (j = outData; j != v24; j += 2)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", j[1] | ((unint64_t)*j << 61));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "addObject:", v26);

                }
              }
              if (v23)
              {
                v132.i64[0] = (uint64_t)v23;
                operator delete(v23);
              }
            }
            LODWORD(outData) = 0;
            AudioUnitGetParameter(inUnit, v20, i, 0, (AudioUnitParameterValue *)&outData);
            v27 = (i << 61) | v20;
            v28 = v147 & 0xF7FFFFEF;
            v29 = (void *)*((_QWORD *)&v144 + 1);
            if ((_DWORD)v146 != 26)
              v29 = 0;
            v30 = v29;
            LODWORD(v32) = DWORD2(v146);
            LODWORD(v31) = DWORD1(v146);
            +[AUParameterTree createParameterWithIdentifier:name:address:min:max:unit:unitName:flags:valueStrings:dependentParameters:](AUParameterTree, "createParameterWithIdentifier:name:address:min:max:unit:unitName:flags:valueStrings:dependentParameters:", v21, v107, v27, v146, v30, v28, v31, v32, v106, v22);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v34) = HIDWORD(v146);
            objc_msgSend(v33, "set_defaultValue:", v34);
            objc_msgSend(v33, "set_originalOrder:", v19);
            v35 = v33;

            LODWORD(v36) = (_DWORD)outData;
            objc_msgSend(v35, "setValue:", v36);
            if ((v147 & 0x100000) != 0)
            {
              objc_msgSend(v35, "set_clumpID:", v145);
              v41 = v145;
              v42 = v35;
              v43 = v42;
              v44 = *((_QWORD *)&v118 + 1);
              if (*((_QWORD *)&v118 + 1) < (unint64_t)v119)
              {
                **((_DWORD **)&v118 + 1) = v41;
                *(_BYTE *)(v44 + 4) = 1;
                *(_DWORD *)(v44 + 8) = v19;
                v40 = (char *)(v44 + 24);
                *(_QWORD *)(v44 + 16) = v42;
                goto LABEL_71;
              }
              v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v118 + 1) - v118) >> 3);
              v59 = v58 + 1;
              if (v58 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * ((uint64_t)&v119[-v118] >> 3) > v59)
                v59 = 0x5555555555555556 * ((uint64_t)&v119[-v118] >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v119[-v118] >> 3) >= 0x555555555555555)
                v60 = 0xAAAAAAAAAAAAAAALL;
              else
                v60 = v59;
              v126 = &v119;
              v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v60);
              v63 = &v61[24 * v58];
              *(_DWORD *)v63 = v41;
              v63[4] = 1;
              *((_DWORD *)v63 + 2) = v19;
              *((_QWORD *)v63 + 2) = v43;
              v64 = *((_QWORD *)&v118 + 1);
              v65 = v118;
              if (*((_QWORD *)&v118 + 1) == (_QWORD)v118)
              {
                v70 = vdupq_n_s64(*((unint64_t *)&v118 + 1));
                v66 = &v61[24 * v58];
              }
              else
              {
                v66 = &v61[24 * v58];
                do
                {
                  v67 = *(_QWORD *)(v64 - 24);
                  v64 -= 24;
                  v68 = *(_DWORD *)(v64 + 8);
                  *((_QWORD *)v66 - 3) = v67;
                  v66 -= 24;
                  *((_DWORD *)v66 + 2) = v68;
                  v69 = *(_QWORD *)(v64 + 16);
                  *(_QWORD *)(v64 + 16) = 0;
                  *((_QWORD *)v66 + 2) = v69;
                }
                while (v64 != v65);
                v70 = (int64x2_t)v118;
              }
              v40 = v63 + 24;
              *(_QWORD *)&v118 = v66;
              *((_QWORD *)&v118 + 1) = v63 + 24;
              v124 = v70;
              v73 = v119;
              v119 = &v61[24 * v62];
              v125 = v73;
              v123 = v70.i64[0];
              v72 = &v123;
            }
            else
            {
              v37 = v35;
              v38 = v37;
              v39 = *((_QWORD *)&v118 + 1);
              if (*((_QWORD *)&v118 + 1) < (unint64_t)v119)
              {
                **((_BYTE **)&v118 + 1) = 0;
                *(_BYTE *)(v39 + 4) = 0;
                *(_DWORD *)(v39 + 8) = v19;
                v40 = (char *)(v39 + 24);
                *(_QWORD *)(v39 + 16) = v37;
LABEL_71:
                *((_QWORD *)&v118 + 1) = v40;

                v19 = (v19 + 1);
                goto LABEL_72;
              }
              v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v118 + 1) - v118) >> 3);
              v46 = v45 + 1;
              if (v45 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * ((uint64_t)&v119[-v118] >> 3) > v46)
                v46 = 0x5555555555555556 * ((uint64_t)&v119[-v118] >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v119[-v118] >> 3) >= 0x555555555555555)
                v47 = 0xAAAAAAAAAAAAAAALL;
              else
                v47 = v46;
              v130 = &v119;
              v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v47);
              v50 = &v48[24 * v45];
              *v50 = 0;
              v50[4] = 0;
              *((_DWORD *)v50 + 2) = v19;
              *((_QWORD *)v50 + 2) = v38;
              v51 = *((_QWORD *)&v118 + 1);
              v52 = v118;
              if (*((_QWORD *)&v118 + 1) == (_QWORD)v118)
              {
                v57 = vdupq_n_s64(*((unint64_t *)&v118 + 1));
                v53 = &v48[24 * v45];
              }
              else
              {
                v53 = &v48[24 * v45];
                do
                {
                  v54 = *(_QWORD *)(v51 - 24);
                  v51 -= 24;
                  v55 = *(_DWORD *)(v51 + 8);
                  *((_QWORD *)v53 - 3) = v54;
                  v53 -= 24;
                  *((_DWORD *)v53 + 2) = v55;
                  v56 = *(_QWORD *)(v51 + 16);
                  *(_QWORD *)(v51 + 16) = 0;
                  *((_QWORD *)v53 + 2) = v56;
                }
                while (v51 != v52);
                v57 = (int64x2_t)v118;
              }
              v40 = v50 + 24;
              *(_QWORD *)&v118 = v53;
              *((_QWORD *)&v118 + 1) = v50 + 24;
              v128 = v57;
              v71 = v119;
              v119 = &v48[24 * v49];
              v129 = v71;
              v127 = v57.i64[0];
              v72 = &v127;
            }
            std::__split_buffer<ParameterTreeBuilder::ClumpableParam>::~__split_buffer((uint64_t)v72);
            goto LABEL_71;
          }
LABEL_73:
          if ((_QWORD)v118 != *((_QWORD *)&v118 + 1))
          {
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ParameterTreeBuilder::ClumpableParam *,false>(v118, *((uint64_t **)&v118 + 1), 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v118 + 1) - v118) >> 3)), 1);
            v140 = i;
            v74 = v118;
            v75 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v118 + 1) - v118) >> 3);
            v139 = v75;
            v138 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v75);
            *(_QWORD *)v137 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v75);
            v136 = -1;
            outData = (unsigned int *)&v136;
            v132.i64[0] = (uint64_t)&v114;
            v132.i64[1] = (uint64_t)&v140;
            v133 = v137;
            v134 = &v138;
            v135 = &v139;
            if (*((_QWORD *)&v74 + 1) != (_QWORD)v74)
            {
              v76 = v118;
              if (*(_BYTE *)(v118 + 4))
              {
                v77 = 0;
              }
              else
              {
                v78 = 0;
                v79 = 1;
                do
                {
                  v77 = v79;
                  objc_msgSend(v138, "addObject:", *(_QWORD *)(v76 + v78 + 16));
                  v75 = v139;
                  if (v77 >= v139)
                    break;
                  v76 = v118;
                  v80 = *(unsigned __int8 *)(v118 + v78 + 28);
                  v79 = v77 + 1;
                  v78 += 24;
                }
                while (!v80);
              }
              if (v77 < v75)
              {
                v81 = v118;
                v82 = 24 * v77;
                v83 = v77;
                do
                {
                  if (v83 > v77)
                  {
                    v84 = *(unsigned __int8 *)(v81 + v82 - 20);
                    if (!*(_BYTE *)(v81 + v82 + 4) || v84 == 0)
                    {
                      v87 = v84 != 0;
                      v86 = *(unsigned __int8 *)(v81 + v82 + 4) != 0;
                    }
                    else
                    {
                      v86 = *(_DWORD *)(v81 + v82);
                      v87 = *(_DWORD *)(v81 + v82 - 24);
                    }
                    if (v86 != v87)
                    {
                      ParameterTreeBuilder::buildClumpedElementNodes(unsigned int,std::vector<ParameterTreeBuilder::ClumpableParam> const&)::{lambda(void)#1}::operator()(&outData);
                      v81 = v118;
                    }
                  }
                  objc_msgSend(*(id *)v137, "addObject:", *(_QWORD *)(v81 + v82 + 16));
                  v81 = v118;
                  v136 = *(_DWORD *)(v118 + v82);
                  ++v83;
                  v82 += 24;
                }
                while (v83 < v139);
              }
            }
            if (objc_msgSend(*(id *)v137, "count"))
              ParameterTreeBuilder::buildClumpedElementNodes(unsigned int,std::vector<ParameterTreeBuilder::ClumpableParam> const&)::{lambda(void)#1}::operator()(&outData);
            v88 = v138;

            v89 = v88;
            v90 = v89;
            if (v108 >= 2)
            {
              v90 = (void *)objc_opt_new();
              v91 = 0;
              v92 = 0;
              do
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v91);
                v93 = (id)objc_claimAutoreleasedReturnValue();
                if ((_DWORD)v91)
                {
                  +[AUParameterTree createGroupFromTemplate:identifier:name:addressOffset:](AUParameterTree, "createGroupFromTemplate:identifier:name:addressOffset:", v92, v93, v93, (unint64_t)(v91 & 0x1FFFFFFF) << 32);
                  v94 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  +[AUParameterTree createGroupWithIdentifier:name:children:](AUParameterTree, "createGroupWithIdentifier:name:children:", v93, v93, v89);
                  v94 = (id)objc_claimAutoreleasedReturnValue();

                  v92 = v94;
                }
                objc_msgSend(v90, "addObject:", v94);

                v91 = (v91 + 1);
              }
              while (v108 != (_DWORD)v91);

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", gScopeNames[i]);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            +[AUParameterTree createGroupWithIdentifier:name:children:](AUParameterTree, "createGroupWithIdentifier:name:children:", v95, v95, v90);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "addObject:", v96);

          }
          outData = (unsigned int *)&v118;
          std::vector<ParameterTreeBuilder::ClumpableParam>::__destroy_vector::operator()[abi:ne180100]((void ***)&outData);
        }
        if (v120.__begin_)
        {
          v120.__end_ = v120.__begin_;
          operator delete(v120.__begin_);
        }
        continue;
      }
    }
  }
  +[AUParameterTree createTreeWithChildren:](AUParameterTree, "createTreeWithChildren:", v104);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v98 = MEMORY[0x1E0C809B0];
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v113[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_57;
  v113[3] = &__block_descriptor_40_e24_v20__0__AUParameter_8f16l;
  v113[4] = v103;
  objc_msgSend(v97, "setImplementorValueObserver:", v113);
  v112[0] = v98;
  v112[1] = 3221225472;
  v112[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_60;
  v112[3] = &__block_descriptor_40_e21_f16__0__AUParameter_8l;
  v112[4] = v103;
  objc_msgSend(v97, "setImplementorValueProvider:", v112);
  v111[0] = v98;
  v111[1] = 3221225472;
  v111[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_63;
  v111[3] = &__block_descriptor_40_e36___NSString_24__0__AUParameter_8r_f16l;
  v111[4] = v103;
  objc_msgSend(v97, "setImplementorStringFromValueCallback:", v111);
  v110[0] = v98;
  v110[1] = 3221225472;
  v110[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_2;
  v110[3] = &__block_descriptor_40_e34_f24__0__AUParameter_8__NSString_16l;
  v110[4] = v103;
  objc_msgSend(v97, "setImplementorValueFromStringCallback:", v110);
  v109[0] = v98;
  v109[1] = 3221225472;
  v109[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_3;
  v109[3] = &__block_descriptor_40_e38___NSString_24__0__AUParameterNode_8q16l;
  v109[4] = v103;
  objc_msgSend(v97, "setImplementorDisplayNameWithLengthCallback:", v109);
  v99 = atomic_load(&v102->_eventsTriggeringParameterTreeInvalidation.__a_.__a_value);
  if (v99 <= 1)
    v100 = 1;
  else
    v100 = v99;
  objc_msgSend(v97, "set_autoCreatedForV2AU:", v100);

  return v97;
}

- (id)parameterTree
{
  AUParameterTree *cachedParameterTree;
  NSObject *parameterTreeRebuildQueue;
  _QWORD v6[2];
  id v7;
  AUAudioUnitV2Bridge *v8;
  _QWORD block[5];

  v8 = self;
  cachedParameterTree = self->_cachedParameterTree;
  if (!cachedParameterTree)
  {
    -[AUAudioUnitV2Bridge _buildNewParameterTree](self, "_buildNewParameterTree");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    parameterTreeRebuildQueue = self->_parameterTreeRebuildQueue;
    v6[0] = &v8;
    v6[1] = &v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN10applesauce8dispatch2v19sync_implIZ36__AUAudioUnitV2Bridge_parameterTree_E3__5EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v6;
    dispatch_sync(parameterTreeRebuildQueue, block);

    cachedParameterTree = v8->_cachedParameterTree;
  }
  return cachedParameterTree;
}

- (id)channelCapabilities
{
  void *v3;
  __int16 *v4;
  __int16 *v5;
  unint64_t v6;
  __int16 *v7;
  void *v8;
  UInt32 outDataSize;

  outDataSize = 0;
  v3 = 0;
  if (!AudioUnitGetPropertyInfo(self->_audioUnit, 0xDu, 0, 0, &outDataSize, 0))
  {
    if (outDataSize >= 2)
    {
      v6 = (unint64_t)outDataSize >> 1;
      v4 = (__int16 *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v6);
      bzero(v4, 2 * v6);
      v5 = &v4[v6];
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    if (AudioUnitGetProperty(self->_audioUnit, 0xDu, 0, 0, v4, &outDataSize))
    {
      v3 = 0;
    }
    else
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5 - v4);
      if (v4 != v5)
      {
        v7 = v4;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v8);

          ++v7;
        }
        while (v7 != v5);
      }
    }
    if (v4)
      operator delete(v4);
  }
  return v3;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  AUAudioUnitProperties *v11;
  NSString *v12;
  _DWORD *v13;
  AUListenerBase *eventListener;
  NSObject *eventListenerQueue;
  objc_super v16;
  _QWORD inBlock[5];
  AudioUnitEvent inEvent;
  void (*v19)(uint64_t);
  AUAudioUnitV2Bridge *v20;

  v10 = a3;
  v11 = (AUAudioUnitProperties *)a4;
  v13 = AUAudioUnitProperties::infoForKey(v11, v12);
  if (v13)
  {
    AudioUnitAddPropertyListener(self->_audioUnit, v13[5], (AudioUnitPropertyListenerProc)V2BridgePropertyListener, self);
  }
  else if (-[AUAudioUnitProperties isEqualToString:](v11, "isEqualToString:", CFSTR("allParameterValues")))
  {
    eventListener = self->_eventListener;
    if (!eventListener)
    {
      -[AUAudioUnitV2Bridge _createEventListenerQueue](self, "_createEventListenerQueue");
      *(_QWORD *)&inEvent.mEventType = 0;
      inEvent.mArgument.mParameter.mAudioUnit = (AudioUnit)&inEvent;
      *(_QWORD *)&inEvent.mArgument.mProperty.mPropertyID = 0x3032000000;
      *(_QWORD *)&inEvent.mArgument.mProperty.mElement = __Block_byref_object_copy__7758;
      v19 = __Block_byref_object_dispose__7759;
      v20 = self;
      eventListenerQueue = v20->_eventListenerQueue;
      inBlock[0] = MEMORY[0x1E0C809B0];
      inBlock[1] = 3221225472;
      inBlock[2] = __62__AUAudioUnitV2Bridge_addObserver_forKeyPath_options_context___block_invoke;
      inBlock[3] = &unk_1E2921828;
      inBlock[4] = &inEvent;
      AUEventListenerCreateWithDispatchQueue(&self->_eventListener, 0.05, 0.05, eventListenerQueue, inBlock);
      _Block_object_dispose(&inEvent, 8);

      eventListener = self->_eventListener;
    }
    inEvent.mEventType = kAudioUnitEvent_ParameterValueChange;
    inEvent.mArgument.mParameter.mAudioUnit = self->_audioUnit;
    *(_QWORD *)&inEvent.mArgument.mProperty.mPropertyID = 0xFFFFFFFFLL;
    inEvent.mArgument.mParameter.mElement = 0;
    AUEventListenerAddEventType(eventListener, v10, &inEvent);
  }
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitV2Bridge;
  -[AUAudioUnitV2Bridge addObserver:forKeyPath:options:context:](&v16, sel_addObserver_forKeyPath_options_context_, v10, v11, a5, a6);

}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8;
  AUAudioUnitProperties *v9;
  NSString *v10;
  _DWORD *v11;
  objc_super v12;
  AudioUnitEvent inEvent;

  v8 = a3;
  v9 = (AUAudioUnitProperties *)a4;
  self->_removingObserverWithContext = 1;
  v11 = AUAudioUnitProperties::infoForKey(v9, v10);
  if (v11)
  {
    AudioUnitRemovePropertyListenerWithUserData(self->_audioUnit, v11[5], (AudioUnitPropertyListenerProc)V2BridgePropertyListener, self);
  }
  else if (-[AUAudioUnitProperties isEqualToString:](v9, "isEqualToString:", CFSTR("allParameterValues")))
  {
    inEvent.mEventType = kAudioUnitEvent_ParameterValueChange;
    *(_OWORD *)&inEvent.mArgument.mParameter.mAudioUnit = (unint64_t)self->_audioUnit;
    inEvent.mArgument.mParameter.mElement = 0;
    AUEventListenerRemoveEventType(self->_eventListener, v8, &inEvent);
  }
  v12.receiver = self;
  v12.super_class = (Class)AUAudioUnitV2Bridge;
  -[AUAudioUnitV2Bridge removeObserver:forKeyPath:context:](&v12, sel_removeObserver_forKeyPath_context_, v8, v9, a5);
  self->_removingObserverWithContext = 0;

}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6;
  AUAudioUnitProperties *v7;
  NSString *v8;
  AUAudioUnitProperties *v9;
  _DWORD *v10;
  objc_super v11;
  AudioUnitEvent inEvent;

  v6 = a3;
  v7 = (AUAudioUnitProperties *)a4;
  v9 = v7;
  if (!self->_removingObserverWithContext)
  {
    v10 = AUAudioUnitProperties::infoForKey(v7, v8);
    if (v10)
    {
      AudioUnitRemovePropertyListenerWithUserData(self->_audioUnit, v10[5], (AudioUnitPropertyListenerProc)V2BridgePropertyListener, self);
    }
    else if (-[AUAudioUnitProperties isEqualToString:](v9, "isEqualToString:", CFSTR("allParameterValues")))
    {
      inEvent.mEventType = kAudioUnitEvent_ParameterValueChange;
      *(_OWORD *)&inEvent.mArgument.mParameter.mAudioUnit = (unint64_t)self->_audioUnit;
      inEvent.mArgument.mParameter.mElement = 0;
      AUEventListenerRemoveEventType(self->_eventListener, v6, &inEvent);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AUAudioUnitV2Bridge;
  -[AUAudioUnitV2Bridge removeObserver:forKeyPath:](&v11, sel_removeObserver_forKeyPath_, v6, v9);

}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  OSStatus v5;
  void (**inData)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  inData = v4;
  if (-[AUAudioUnitV2Bridge providesUserInterface](self, "providesUserInterface"))
  {
    v5 = AudioUnitSetProperty(self->_audioUnit, 0x38u, 0, 0, &inData, 8u);
    v4 = inData;
    if (v5)
    {
      inData[2](inData, 0);
      v4 = inData;
    }
  }
  else
  {
    v4[2](v4, 0);
  }

}

- (BOOL)providesUserInterface
{
  OSStatus PropertyInfo;
  BOOL result;
  BOOL v4;
  Boolean outWritable;
  UInt32 outDataSize;

  outDataSize = 0;
  outWritable = 0;
  PropertyInfo = AudioUnitGetPropertyInfo(self->_audioUnit, 0x38u, 0, 0, &outDataSize, &outWritable);
  result = 0;
  if (PropertyInfo)
    v4 = 0;
  else
    v4 = outDataSize == 8;
  if (v4)
    return outWritable != 0;
  return result;
}

- (void)setFullState:(id)a3
{
  const __CFDictionary *v4;

  v4 = (const __CFDictionary *)a3;
  -[AUAudioUnit flushEventSchedule](self, "flushEventSchedule");
  setStateAndNotify(v4, self, 0);

}

- (void)setFullStateForDocument:(id)a3
{
  const __CFDictionary *v4;

  v4 = (const __CFDictionary *)a3;
  -[AUAudioUnit flushEventSchedule](self, "flushEventSchedule");
  if (setStateAndNotify(v4, self, 50))
    setStateAndNotify(v4, self, 0);

}

- (void)setCurrentPreset:(id)a3
{
  AUAudioUnitPreset *v4;

  v4 = (AUAudioUnitPreset *)a3;
  -[AUAudioUnit flushEventSchedule](self, "flushEventSchedule");
  setPresentPresetAndNotify(self, v4);

}

- (id)_valueForProperty:(id)a3 error:(id *)a4
{
  id v6;
  OSStatus PropertyInfo;
  id v8;
  NSString *v9;
  uint64_t v10;
  _QWORD *v11;
  OpaqueAudioComponentInstance *v12;
  _QWORD *v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  NSObject *v19;
  id v20;
  id v21;
  Boolean outWritable[8];
  UInt32 outDataSize;
  const char *v24;
  __int16 v25;
  int v26;
  _BYTE v27[24];
  _BYTE *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(*((id *)v6 + 1), "isEqualToString:", CFSTR("_v2fwd_PropertySize")))
  {
    outDataSize = 0;
    outWritable[0] = 0;
    PropertyInfo = AudioUnitGetPropertyInfo(self->_audioUnit, *((_DWORD *)v6 + 4), *((_DWORD *)v6 + 5), *((_DWORD *)v6 + 6), &outDataSize, outWritable);
    if (a4)
    {
      if (PropertyInfo)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], PropertyInfo, 0);
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v8;

      }
      else
      {
        *a4 = 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", outDataSize);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (!objc_msgSend(*((id *)v6 + 1), "isEqualToString:", CFSTR("_v2bridge_providesUserInterface")))
  {
    v11 = AUAudioUnitProperties::infoForKey(*((AUAudioUnitProperties **)v6 + 1), v9);
    if (!v11)
    {
      -[AUAudioUnitV2Bridge valueForKey:](self, "valueForKey:", *((_QWORD *)v6 + 1));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if ((objc_msgSend(*((id *)v6 + 1), "isEqualToString:", CFSTR("fullState")) & 1) == 0
      && !objc_msgSend(*((id *)v6 + 1), "isEqualToString:", CFSTR("fullStateForDocument")))
    {
      std::function<objc_object * ()(OpaqueAudioComponentInstance *,NSError * {__autoreleasing}*)>::operator()(v11[14], (uint64_t)-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), (uint64_t)a4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    *(_QWORD *)outWritable = 0;
    v12 = -[AUAudioUnitV2Bridge audioUnit](self, "audioUnit", 0);
    v13 = operator new(0x28uLL);
    *v13 = &off_1E29137E8;
    v13[1] = v12;
    v13[2] = outWritable;
    v13[3] = v11;
    v13[4] = &v21;
    v28 = v13;
    v14 = dispatch_to_main_queue_with_timeout((uint64_t)v27);
    v15 = v28;
    if (v28 == v27)
    {
      v16 = 4;
      v15 = v27;
    }
    else
    {
      if (!v28)
        goto LABEL_20;
      v16 = 5;
    }
    (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_20:
    *a4 = objc_retainAutorelease(*(id *)outWritable);
    if ((v14 & 1) == 0)
    {
      if (kInterAppAudioScope)
      {
        v19 = *(id *)kInterAppAudioScope;
        if (!v19)
          goto LABEL_29;
      }
      else
      {
        v19 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        outDataSize = 136315394;
        v24 = "AUAudioUnitV2Bridge.mm";
        v25 = 1024;
        v26 = 1781;
        _os_log_impl(&dword_18EE07000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d getState: failed to execute on the main queue. Falling back to secondary thread.", (uint8_t *)&outDataSize, 0x12u);
      }

    }
LABEL_29:
    v17 = v21;

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AUAudioUnitV2Bridge providesUserInterface](self, "providesUserInterface"));
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v17 = (id)v10;
LABEL_16:

  return v17;
}

- (void)_setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  AUAudioUnitProperties *v8;
  int v9;
  NSString *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  id v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  OpaqueAudioComponentInstance *audioUnit;

  v16 = (const __CFDictionary *)a3;
  v8 = (AUAudioUnitProperties *)a4;
  if (-[AUAudioUnitProperties isEqualToString:](v8, "isEqualToString:", CFSTR("fullStateForDocument")))
  {
    v9 = setStateAndNotify(v16, self, 50);
    if (a5)
    {
      if (v9)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if (-[AUAudioUnitProperties isEqualToString:](v8, "isEqualToString:", CFSTR("fullState")))
  {
    v9 = setStateAndNotify(v16, self, 0);
    if (a5)
    {
      if (v9)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if (-[AUAudioUnitProperties isEqualToString:](v8, "isEqualToString:", CFSTR("currentPreset")))
  {
    v9 = setPresentPresetAndNotify(self, (AUAudioUnitPreset *)v16);
    if (a5)
    {
      if (v9)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v15 = objc_retainAutorelease(v11);
        *a5 = v15;

        goto LABEL_20;
      }
LABEL_19:
      *a5 = 0;
    }
  }
  else
  {
    v12 = AUAudioUnitProperties::infoForKey(v8, v10);
    if (!v12)
    {
      -[AUAudioUnitV2Bridge setValue:forKey:](self, "setValue:forKey:", v16, v8);
      goto LABEL_20;
    }
    audioUnit = self->_audioUnit;
    v17 = v16;
    v13 = v12[18];
    if (!v13)
      std::__throw_bad_function_call[abi:ne180100]();
    v14 = (*(uint64_t (**)(uint64_t, OpaqueAudioComponentInstance **, const __CFDictionary **))(*(_QWORD *)v13 + 48))(v13, &audioUnit, &v17);

    if (a5)
    {
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      goto LABEL_19;
    }
  }
LABEL_20:

}

- (id)osWorkgroup
{
  OSStatus Property;
  BOOL v3;
  UInt32 ioDataSize;
  id outData;

  outData = 0;
  ioDataSize = 8;
  Property = AudioUnitGetProperty(-[AUAudioUnitV2Bridge audioUnit](self, "audioUnit"), 0x7DFu, 0, 0, &outData, &ioDataSize);
  if (outData)
    v3 = Property == 0;
  else
    v3 = 0;
  if (v3)
    return outData;
  else
    return 0;
}

- (void).cxx_destruct
{
  AUAudioUnitV2Bridge_Renderer *value;

  objc_storeStrong(&self->_MIDIOutputEventListBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventBlock, 0);
  value = self->_renderer.__ptr_.__value_;
  self->_renderer.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<AUAudioUnitV2Bridge_Renderer>::operator()[abi:ne180100](value);
  objc_storeStrong((id *)&self->_cachedParameterTree, 0);
  objc_storeStrong((id *)&self->_outputBusses, 0);
  objc_storeStrong((id *)&self->_inputBusses, 0);
  objc_storeStrong((id *)&self->_parameterTreeRebuildQueue, 0);
  objc_storeStrong((id *)&self->_eventListenerQueue, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 601) = 0;
  *((_DWORD *)self + 151) = 0;
  *((_QWORD *)self + 82) = 0;
  return self;
}

- (void)_valueForProperty:error:
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id obj;

  v3 = (id *)a1[2];
  v2 = a1[3];
  v4 = a1[1];
  if (v3)
  {
    obj = *v3;
    std::function<objc_object * ()(OpaqueAudioComponentInstance *,NSError * {__autoreleasing}*)>::operator()(*(_QWORD *)(v2 + 112), v4, (uint64_t)&obj);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v3, obj);
  }
  else
  {
    std::function<objc_object * ()(OpaqueAudioComponentInstance *,NSError * {__autoreleasing}*)>::operator()(*(_QWORD *)(v2 + 112), v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void **)a1[4];
  v7 = *v6;
  *v6 = (void *)v5;

}

- (__n128)_valueForProperty:error:
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E29137E8;
  result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t __62__AUAudioUnitV2Bridge_addObserver_forKeyPath_options_context___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_DWORD *)(a3 + 16) == -1)
  {
    v3 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "willChangeValueForKey:", CFSTR("allParameterValues"));
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 40), "didChangeValueForKey:", CFSTR("allParameterValues"));
  }
  return result;
}

void __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke(uint64_t a1, void *a2, int *a3, float a4)
{
  id v7;
  unsigned __int8 *WeakRetained;
  double v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if ((*a3 - 1) >= 2)
  {
    if (*a3)
    {
      if (kAUExtensionScope)
      {
        v13 = *(id *)kAUExtensionScope;
        if (!v13)
          goto LABEL_15;
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v14 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = *a3;
        v16 = 136315650;
        v17 = "AUAudioUnitV2Bridge.mm";
        v18 = 1024;
        v19 = 1293;
        v20 = 1024;
        v21 = v15;
        _os_log_impl(&dword_18EE07000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d AUEventListener encountered unknown AUEventType: %d", (uint8_t *)&v16, 0x18u);
      }

    }
    else
    {
      v11 = atomic_load(WeakRetained + 601);
      if ((v11 & 1) != 0)
        v12 = 8;
      else
        v12 = 4;
      *(float *)&v9 = a4;
      objc_msgSend(v7, "setValue:originator:", v12, v9);
    }
  }
  else
  {
    *(float *)&v9 = a4;
    objc_msgSend(v7, "setValue:originator:atHostTime:eventType:", 4, 0, v9);
  }
LABEL_15:

}

void __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_57(uint64_t a1, void *a2, AudioUnitParameterValue a3)
{
  id v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  OSStatus v10;
  NSObject *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  OSStatus v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(v5, "address");
  v7 = v6;
  v8 = v6 >> 61;
  v9 = HIDWORD(v6) & 0x1FFFFFFF;
  v10 = AudioUnitSetParameter(*(AudioUnit *)(a1 + 32), v6, v6 >> 61, v9, a3, 0);
  if (v10)
  {
    if (kAUExtensionScope)
    {
      v11 = *(id *)kAUExtensionScope;
      if (!v11)
        goto LABEL_9;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316418;
      v14 = "AUAudioUnitV2Bridge.mm";
      v15 = 1024;
      v16 = 1312;
      v17 = 1024;
      v18 = v7;
      v19 = 1024;
      v20 = v8;
      v21 = 1024;
      v22 = v9;
      v23 = 1024;
      v24 = v10;
      _os_log_impl(&dword_18EE07000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d AUParameterSet %d (%d/%d): err %d", (uint8_t *)&v13, 0x2Au);
    }

  }
LABEL_9:

}

float __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  OSStatus Parameter;
  NSObject *v9;
  id v10;
  float v11;
  AudioUnitParameterValue outValue;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  OSStatus v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  outValue = 0.0;
  v4 = objc_msgSend(v3, "address");
  v5 = v4;
  v6 = v4 >> 61;
  v7 = HIDWORD(v4) & 0x1FFFFFFF;
  Parameter = AudioUnitGetParameter(*(AudioUnit *)(a1 + 32), v4, v4 >> 61, v7, &outValue);
  if (Parameter)
  {
    if (kAUExtensionScope)
    {
      v9 = *(id *)kAUExtensionScope;
      if (!v9)
        goto LABEL_9;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v15 = "AUAudioUnitV2Bridge.mm";
      v16 = 1024;
      v17 = 1322;
      v18 = 1024;
      v19 = v5;
      v20 = 1024;
      v21 = v6;
      v22 = 1024;
      v23 = v7;
      v24 = 1024;
      v25 = Parameter;
      _os_log_impl(&dword_18EE07000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioGetParameter %d (%d/%d): err %d", buf, 0x2Au);
    }

  }
LABEL_9:
  v11 = outValue;

  return v11;
}

id __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_63(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  OSStatus Property;
  BOOL v8;
  void *v9;
  UInt32 ioDataSize;
  _QWORD outData[2];
  void *v13;

  v5 = a2;
  v6 = objc_msgSend(v5, "address");
  outData[1] = a3;
  v13 = 0;
  ioDataSize = 24;
  outData[0] = v6;
  Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x21u, v6 >> 61, HIDWORD(v6) & 0x1FFFFFFF, outData, &ioDataSize);
  if (v13)
    v8 = Property == 0;
  else
    v8 = 0;
  if (v8)
    v9 = v13;
  else
    v9 = 0;

  return v9;
}

float __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  float v8;
  UInt32 ioDataSize;
  _QWORD outData[2];
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "address");
  outData[1] = v6;
  v12 = 0;
  ioDataSize = 24;
  outData[0] = v7;
  AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x26u, v7 >> 61, HIDWORD(v7) & 0x1FFFFFFF, outData, &ioDataSize);
  v8 = *(float *)&v12;

  return v8;
}

id __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  unint64_t v6;
  OSStatus Property;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  UInt32 ioDataSize;
  _DWORD outData[2];
  void *v16;

  v5 = a2;
  outData[0] = 0;
  v16 = 0;
  outData[1] = a3;
  ioDataSize = 16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "address");
    outData[0] = v6;
    Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x22u, v6 >> 61, HIDWORD(v6) & 0x1FFFFFFF, outData, &ioDataSize);
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("clump_"));

    if (!v9)
    {
      v12 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringFromIndex:", 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    outData[0] = objc_msgSend(v11, "intValue");

    Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x23u, 0, 0, outData, &ioDataSize);
  }
  if (Property)
    v12 = 0;
  else
    v12 = v16;
LABEL_9:

  return v12;
}

- (_QWORD)invalidateAudioUnit
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2913758;
  result[1] = v3;
  return result;
}

- (uint64_t)invalidateAudioUnit
{
  return AudioComponentInstanceDispose(*(AudioComponentInstance *)(a1 + 8));
}

void __46__AUAudioUnitV2Bridge__notifyParameterChange___block_invoke(uint64_t a1)
{
  AUEventListenerRef *WeakRetained;

  WeakRetained = (AUEventListenerRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    AUEventListenerNotify(WeakRetained[74], 0, (const AudioUnitEvent *)(a1 + 40));

}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  unsigned __int8 v4;
  char v5;

  v3 = a3;
  if ((v4 & 1) == 0
  {
    +[AUAudioUnitV2Bridge automaticallyNotifiesObserversForKey:]::autoNotifying = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("fullState"), CFSTR("fullStateForDocument"), CFSTR("currentPreset"), 0);
  }
  v5 = objc_msgSend((id)+[AUAudioUnitV2Bridge automaticallyNotifiesObserversForKey:]::autoNotifying, "containsObject:", v3);

  return v5;
}

@end
