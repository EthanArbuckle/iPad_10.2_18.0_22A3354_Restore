@implementation AGXA10FamilyComputeContext

- (AGXA10FamilyComputeContext)initWithCommandBuffer:(id)a3 config:(EncoderComputeServiceConfig *)a4
{
  AGXA10FamilyComputeContext *v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  char *v10;
  char *v11;
  _QWORD *var0;
  _QWORD *var1;
  unsigned int var6;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  _QWORD *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *p_impl;
  int v44;
  int var5;
  MTLComputePassDescriptor *var4;
  objc_super v47;
  uint64_t block;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  uint64_t v52;

  v47.receiver = self;
  v47.super_class = (Class)AGXA10FamilyComputeContext;
  v6 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v47, sel_initWithCommandBuffer_);
  if (!v6)
    return v6;
  v7 = *(_QWORD *)(objc_msgSend(a3, "device") + 808);
  if (*(_QWORD *)(v7 + 5712) >> 6 <= 0x78uLL)
  {
    v6->_impl = 0;
    goto LABEL_44;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 5724));
  v8 = *(_DWORD *)(v7 + 5720);
  if (v8)
  {
    v9 = v8 - 1;
    *(_DWORD *)(v7 + 5720) = v9;
    v10 = *(char **)(v7 + 8 * v9 + 5728);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 5724));
    if (v10)
    {
      bzero(v10, *(_QWORD *)(v7 + 5712));
      p_impl = (uint64_t *)&v6->_impl;
      v6->_impl = v10;
      goto LABEL_9;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 5724));
  }
  v11 = (char *)malloc_type_calloc(*(_QWORD *)(v7 + 5712), 1uLL, 0xC8454162uLL);
  v6->_impl = v11;
  if (!v11)
  {
LABEL_44:
    -[AGXA10FamilyComputeContext endEncoding](v6, "endEncoding");

    return 0;
  }
  v10 = v11;
  p_impl = (uint64_t *)&v6->_impl;
LABEL_9:
  a4->var2 = v6;
  var0 = a4->var0;
  var1 = a4->var1;
  var4 = (MTLComputePassDescriptor *)a4->var4;
  var6 = a4->var6;
  var5 = a4->var5;
  v44 = *(_QWORD *)&a4->var3;
  -[_MTLCommandEncoder numThisEncoder](v6, "numThisEncoder");
  v15 = objc_msgSend(var1, "commandBufferStorage");
  v16 = objc_msgSend(var1, "globalTraceObjectID");
  v17 = -[IOGPUMetalCommandEncoder globalTraceObjectID](v6, "globalTraceObjectID");
  if (AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once != -1)
    dispatch_once(&AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once, &__block_literal_global_694);
  *(_QWORD *)v10 = var1;
  *((_QWORD *)v10 + 1) = v15;
  *((_QWORD *)v10 + 2) = &AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::databuffer_configs;
  *((_QWORD *)v10 + 3) = var0;
  *((_QWORD *)v10 + 4) = v15;
  v18 = *(_QWORD *)(v15 + 768);
  *((_QWORD *)v10 + 177) = 0;
  *((_OWORD *)v10 + 89) = 0u;
  *((_DWORD *)v10 + 360) = 0;
  *((_QWORD *)v10 + 5) = v18;
  *((_QWORD *)v10 + 6) = v15 + 144;
  *((_QWORD *)v10 + 181) = *(_QWORD *)(v15 + 784);
  *((_QWORD *)v10 + 183) = v15;
  *((_QWORD *)v10 + 184) = v15 + 64;
  v10[1504] = 0;
  v10[1545] = 0;
  *((_QWORD *)v10 + 197) = v16;
  *((_QWORD *)v10 + 198) = v17;
  *((_QWORD *)v10 + 199) = var1[86] + 21;
  *((_OWORD *)v10 + 100) = 0u;
  *((_QWORD *)v10 + 182) = var0;
  v19 = *(_OWORD *)(v15 + 728);
  *(_OWORD *)(v10 + 1480) = v19;
  *((_QWORD *)v10 + 187) = v15 + 144;
  *((_QWORD *)v10 + 194) = *(_QWORD *)(v15 + 48);
  *((_QWORD *)v10 + 195) = *(_QWORD *)(v15 + 56);
  *((_DWORD *)v10 + 377) = v17;
  *(_QWORD *)(v10 + 1516) = 0xFFFFFFFF00000000;
  *((_DWORD *)v10 + 385) = 0;
  v10[1544] = 0;
  *((_QWORD *)v10 + 203) = var0[101] + 5328;
  v20 = (_OWORD *)(var0[101] + 5336);
  *((_OWORD *)v10 + 102) = *v20;
  *((_OWORD *)v10 + 103) = v20[1];
  v21 = var0[101];
  *((_QWORD *)v10 + 208) = v10 + 1624;
  *((_QWORD *)v10 + 209) = v10 + 16;
  *((_QWORD *)v10 + 210) = v15 + 144;
  *((_QWORD *)v10 + 211) = *((_QWORD *)&v19 + 1);
  v22 = MEMORY[0x24BDAC760];
  block = MEMORY[0x24BDAC760];
  v49 = 3221225472;
  v50 = ___ZN3AGX35ComputeIndirectExecutionContextGen1INS_2G98EncodersENS1_7ClassesENS1_10ObjClassesENS1_28EncoderComputeServiceClassesEE20getCDMPatchUpVariantEPNS1_6DeviceE_block_invoke;
  v51 = &__block_descriptor_40_e5_v8__0l;
  v52 = v21;
  if (AGX::ComputeIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::getCDMPatchUpVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred != -1)
    dispatch_once(&AGX::ComputeIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::getCDMPatchUpVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred, &block);
  *((_QWORD *)v10 + 212) = AGX::ComputeIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::getCDMPatchUpVariant(AGX::G9::Device *)::execute_indirect_pipeline;
  block = v22;
  v49 = 3221225472;
  v50 = ___ZN3AGX35ComputeIndirectExecutionContextGen1INS_2G98EncodersENS1_7ClassesENS1_10ObjClassesENS1_28EncoderComputeServiceClassesEE27getCDMRangeExecutionVariantEPNS1_6DeviceE_block_invoke;
  v51 = &__block_descriptor_40_e5_v8__0l;
  v52 = v21;
  if (AGX::ComputeIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::getCDMRangeExecutionVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred[0] != -1)
    dispatch_once(AGX::ComputeIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::getCDMRangeExecutionVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred, &block);
  *((_QWORD *)v10 + 213) = AGX::ComputeIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::getCDMRangeExecutionVariant(AGX::G9::Device *)::range_execution_pipeline;
  *((_QWORD *)v10 + 225) = 0;
  *((_DWORD *)v10 + 452) = -1;
  v10[1812] = 0;
  bzero(v10 + 1816, 0x8C8uLL);
  *((_DWORD *)v10 + 1017) = 1;
  bzero(v10 + 4072, 0x424uLL);
  *((_DWORD *)v10 + 1788) = 0;
  *((_OWORD *)v10 + 446) = 0u;
  *((_QWORD *)v10 + 895) = 0;
  v10[7172] = 0;
  *((_QWORD *)v10 + 897) = 0;
  *(_OWORD *)(v10 + 7208) = 0u;
  *(_OWORD *)(v10 + 7096) = 0u;
  *((_QWORD *)v10 + 900) = v10 + 7208;
  *((_OWORD *)v10 + 452) = 0u;
  v23 = *(_QWORD *)(*((_QWORD *)v10 + 182) + 808);
  v24 = *(_QWORD *)(v23 + 5504);
  *((_QWORD *)v10 + 907) = v23;
  *((_QWORD *)v10 + 908) = v24;
  *((_DWORD *)v10 + 1812) = 0;
  v10[7272] = 0;
  AGX::ComputeCounterSamplingContextGen1::ComputeCounterSamplingContextGen1((AGX::ComputeCounterSamplingContextGen1 *)(v10 + 7288), var4);
  v25 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v10 + 688) + 96);
  v10[7304] = v25;
  if (v25)
    v26 = 0;
  else
    v26 = var5 == 2;
  v27 = v26;
  v10[7305] = v27;
  *((_DWORD *)v10 + 1827) = var5;
  v28 = *((_QWORD *)v10 + 182);
  v29 = *((_QWORD *)v10 + 187);
  *((_QWORD *)v10 + 915) = *(_QWORD *)(v28 + 808);
  *((_QWORD *)v10 + 916) = v10 + 16;
  *((_QWORD *)v10 + 917) = v10 + 1624;
  *((_QWORD *)v10 + 918) = v29;
  v10[7352] = 0;
  v10[7376] = 0;
  v10[7384] = 0;
  v10[7408] = 0;
  v10[7416] = 0;
  v10[7440] = 0;
  v10[7448] = 0;
  v10[7472] = 0;
  v10[7480] = 0;
  v10[7504] = 0;
  *(_OWORD *)(v10 + 7512) = 0u;
  *(_OWORD *)(v10 + 7528) = 0u;
  *(_OWORD *)(v10 + 7544) = 0u;
  v10[7568] = 0;
  v10[7576] = 0;
  *(_OWORD *)(v10 + 7608) = 0u;
  *((_QWORD *)v10 + 958) = 0;
  *((_QWORD *)v10 + 957) = 4;
  v10[7672] = 0;
  *((_QWORD *)v10 + 967) = 0;
  *((_OWORD *)v10 + 480) = 0u;
  *((_OWORD *)v10 + 481) = 0u;
  *((_OWORD *)v10 + 482) = 0u;
  v10[7562] |= 1u;
  *((_QWORD *)v10 + 217) = 0;
  *((_QWORD *)v10 + 219) = 0;
  v30 = *(_QWORD *)(v28 + 808);
  if (*(_QWORD *)(v30 + 5792) < 0xCB0uLL)
  {
    v33 = 0;
    goto LABEL_27;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v30 + 5804));
  v31 = *(_DWORD *)(v30 + 5800);
  if (!v31)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v30 + 5804));
    goto LABEL_26;
  }
  v32 = v31 - 1;
  *(_DWORD *)(v30 + 5800) = v32;
  v33 = *(_QWORD **)(v30 + 8 * v32 + 5808);
  os_unfair_lock_unlock((os_unfair_lock_t)(v30 + 5804));
  if (!v33)
  {
LABEL_26:
    v33 = malloc_type_calloc(*(_QWORD *)(v30 + 5792), 1uLL, 0xC8454162uLL);
    goto LABEL_27;
  }
  bzero(v33, *(_QWORD *)(v30 + 5792));
LABEL_27:
  bzero(v33, 0xCB0uLL);
  *((_QWORD *)v10 + 224) = v33;
  v33[65] = v33;
  *(_QWORD *)(*((_QWORD *)v10 + 224) + 528) = v10 + 1800;
  *((_DWORD *)v10 + 434) = 0;
  *((_DWORD *)v10 + 1796) = var6;
  v34 = 16;
  if (v44 == 1)
    v34 = 8;
  *((_QWORD *)v10 + 957) |= v34;
  v35 = v10[7376];
  *((_QWORD *)v10 + 919) = v10;
  *((_QWORD *)v10 + 920) = AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::handleControlFlowFailure;
  *((_QWORD *)v10 + 921) = 0;
  if (!v35)
    v10[7376] = 1;
  v36 = v10[7408];
  *((_QWORD *)v10 + 923) = v10;
  *((_QWORD *)v10 + 924) = AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::handleFirstControlFlowPrologue;
  *((_QWORD *)v10 + 925) = 0;
  if (!v36)
    v10[7408] = 1;
  v37 = v10[7440];
  *((_QWORD *)v10 + 927) = v10;
  *((_QWORD *)v10 + 928) = AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::handleLastControlFlowEpilogue;
  *((_QWORD *)v10 + 929) = 0;
  if (!v37)
    v10[7440] = 1;
  v38 = v10[7472];
  *((_QWORD *)v10 + 931) = v10;
  *((_QWORD *)v10 + 932) = AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::handleControlFlowPrologue;
  *((_QWORD *)v10 + 933) = 0;
  if (!v38)
    v10[7472] = 1;
  v39 = v10[7504];
  *((_QWORD *)v10 + 935) = v10;
  *((_QWORD *)v10 + 936) = AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::handleControlFlowEpilogue;
  *((_QWORD *)v10 + 937) = 0;
  if (!v39)
    v10[7504] = 1;
  v40 = *((_QWORD *)v10 + 182);
  *((_QWORD *)v10 + 215) = *(_QWORD *)(v40 + 808) + 5594;
  *((_QWORD *)v10 + 216) = *(_QWORD *)(*(_QWORD *)(v40 + 808) + 5600);
  *((_WORD *)v10 + 3780) = 0;
  v41 = *p_impl;
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
  {
    IOGPUDeviceTraceEvent();
    v41 = *p_impl;
  }
  AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::beginComputePass(v41, 0);
  if ((objc_msgSend(*(id *)((char *)&v6->super.super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]), "getSupportedAndEnabledErrorOptions") & 1) != 0)v6->_markerID = -[IOGPUMetalCommandEncoder globalTraceObjectID](v6, "globalTraceObjectID");
  return v6;
}

- (void)destroyImpl
{
  os_unfair_lock_s *v3;
  void *impl;
  void *v5;
  os_unfair_lock_s *v6;
  uint64_t os_unfair_lock_opaque;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  void **v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t v35;
  uint64_t v36;

  if (!self->_impl)
    return;
  v3 = *(os_unfair_lock_s **)(-[_MTLCommandEncoder device](self, "device") + 808);
  impl = self->_impl;
  v5 = (void *)*((_QWORD *)impl + 224);
  if (!v5)
  {
LABEL_5:
    v8 = *((_QWORD *)impl + 889);
    if (!v8)
      goto LABEL_6;
    goto LABEL_28;
  }
  v6 = *(os_unfair_lock_s **)(*((_QWORD *)impl + 182) + 808);
  os_unfair_lock_lock(v6 + 1451);
  os_unfair_lock_opaque = v6[1450]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque <= 0xF)
  {
    v6[1450]._os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
    *(_QWORD *)&v6[2 * os_unfair_lock_opaque + 1452]._os_unfair_lock_opaque = v5;
    os_unfair_lock_unlock(v6 + 1451);
    goto LABEL_5;
  }
  os_unfair_lock_unlock(v6 + 1451);
  free(v5);
  v8 = *((_QWORD *)impl + 889);
  if (!v8)
  {
LABEL_6:
    v9 = *((_QWORD *)impl + 890);
    if (!v9)
      goto LABEL_7;
LABEL_32:
    v26 = *(_QWORD *)(v9 + 512);
    if (v26)
    {
      v27 = MEMORY[0x24BDAC760];
      do
      {
        v28 = *(_QWORD *)(v9 + 520);
        v29 = *(_QWORD *)(v9 + 8 * __clz(__rbit64(v26)));
        v30 = *(NSObject **)(v28 + 16);
        v31 = v27;
        v32 = 3221225472;
        v33 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
        v34 = &__block_descriptor_48_e5_v8__0l;
        v35 = v28;
        v36 = v29;
        dispatch_sync(v30, &v31);
        v26 = (*(_QWORD *)(v9 + 512) - 1) & *(_QWORD *)(v9 + 512);
        *(_QWORD *)(v9 + 512) = v26;
      }
      while (v26);
    }
    MEMORY[0x234927ECC](v9, 0x1020C40C758419CLL);
    v10 = *((_QWORD *)impl + 897);
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_28:
  v21 = *(_QWORD *)(v8 + 512);
  if (v21)
  {
    v22 = MEMORY[0x24BDAC760];
    do
    {
      v23 = *(_QWORD *)(v8 + 520);
      v24 = *(_QWORD *)(v8 + 8 * __clz(__rbit64(v21)));
      v25 = *(NSObject **)(v23 + 16);
      v31 = v22;
      v32 = 3221225472;
      v33 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
      v34 = &__block_descriptor_48_e5_v8__0l;
      v35 = v23;
      v36 = v24;
      dispatch_sync(v25, &v31);
      v21 = (*(_QWORD *)(v8 + 512) - 1) & *(_QWORD *)(v8 + 512);
      *(_QWORD *)(v8 + 512) = v21;
    }
    while (v21);
  }
  MEMORY[0x234927ECC](v8, 0x1020C40C758419CLL);
  v9 = *((_QWORD *)impl + 890);
  if (v9)
    goto LABEL_32;
LABEL_7:
  v10 = *((_QWORD *)impl + 897);
  if (v10)
LABEL_8:
    MEMORY[0x234927ECC](v10, 0xC400A2AC0F1);
LABEL_9:
  v11 = *((_QWORD *)impl + 963);
  if (v11)
  {
    v12 = *((_QWORD *)impl + 964);
    v13 = (void *)*((_QWORD *)impl + 963);
    if (v12 != v11)
    {
      do
      {
        v14 = *(void **)(v12 - 24);
        if (v14)
        {
          *(_QWORD *)(v12 - 16) = v14;
          operator delete(v14);
        }
        v12 -= 64;
      }
      while (v12 != v11);
      v13 = (void *)*((_QWORD *)impl + 963);
    }
    *((_QWORD *)impl + 964) = v11;
    operator delete(v13);
  }
  v15 = (void *)*((_QWORD *)impl + 960);
  if (v15)
  {
    *((_QWORD *)impl + 961) = v15;
    operator delete(v15);
  }
  std::deque<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::~deque[abi:nn180100]((uint64_t)impl + 7512);
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*((_QWORD **)impl + 901));
  v16 = (void **)*((_QWORD *)impl + 177);
  v17 = (void **)*((_QWORD *)impl + 178);
  if (v16 != v17)
  {
    do
    {
      v18 = *v16++;
      free(v18);
    }
    while (v16 != v17);
    v16 = (void **)*((_QWORD *)impl + 177);
  }
  if (v16)
  {
    *((_QWORD *)impl + 178) = v16;
    operator delete(v16);
  }
  v19 = self->_impl;
  if (v19)
  {
    os_unfair_lock_lock(v3 + 1431);
    v20 = v3[1430]._os_unfair_lock_opaque;
    if (v20 > 7)
    {
      os_unfair_lock_unlock(v3 + 1431);
      free(v19);
    }
    else
    {
      v3[1430]._os_unfair_lock_opaque = v20 + 1;
      *(_QWORD *)&v3[2 * v20 + 1432]._os_unfair_lock_opaque = v19;
      os_unfair_lock_unlock(v3 + 1431);
    }
  }
  self->_impl = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[AGXA10FamilyComputeContext destroyImpl](self, "destroyImpl");
  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyComputeContext;
  -[_MTLCommandEncoder dealloc](&v3, sel_dealloc);
}

- (void)endEncoding
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t *v6;
  _QWORD *impl;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  unsigned __int8 v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  int v20;
  _QWORD *v21;
  objc_super v22;

  if (self->_impl)
  {
    v3 = (int)*MEMORY[0x24BDDD860];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if (!v4)
    {
      MTLReportFailure();
      v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
    v5 = objc_msgSend(v4, "device");
    v6 = (unint64_t *)(v5 + 816);
    impl = self->_impl;
    v8 = impl[957];
    v9 = impl[958];
    do
      v10 = __ldaxr(v6);
    while (__stlxr(v10 | v8, v6));
    v11 = (unint64_t *)(v5 + 824);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 | v9, v11));
    v13 = self->_impl;
    if (*(_DWORD *)*MEMORY[0x24BE516B0])
    {
      IOGPUDeviceTraceEvent();
      v13 = self->_impl;
    }
    if ((v14 & 1) == 0)
    {
      v21 = v13;
      v13 = v21;
      if (v20)
      {
        AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::checkCoalescingMemoryThreshold(void)::coalescing_threshold_override = 0;
        v13 = v21;
      }
    }
    v15 = v13[187];
    v16 = *(_QWORD *)(v15 + 528);
    v17 = *(_QWORD *)(v15 + 520);
    v18 = AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::checkCoalescingMemoryThreshold(void)::coalescing_threshold_override;
    if (!AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::checkCoalescingMemoryThreshold(void)::coalescing_threshold_override)
      v18 = v16 >> 4;
    if (v16 - v17 >= v18
      || (-[AGXA10FamilyComputeContext dispatchType](self, "dispatchType"),
          v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3),
          v19[696]))
    {
      -[AGXA10FamilyComputeContext deferredEndEncoding](self, "deferredEndEncoding");
    }
    else
    {
      objc_msgSend(v19, "setPreviousComputeCommandEncoder:", self);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)AGXA10FamilyComputeContext;
  -[IOGPUMetalCommandEncoder endEncoding](&v22, sel_endEncoding);
}

- (void)deferredEndEncoding
{
  if (self->_impl)
  {
    if (-[IOGPUMetalCommandEncoder globalTraceObjectID](self, "globalTraceObjectID") != self->_markerID
      && (objc_msgSend(*(id *)self->_impl, "getSupportedAndEnabledErrorOptions") & 1) != 0)
    {
      AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::issueProgressMarkerDispatch((uint64_t)self->_impl, -[IOGPUMetalCommandEncoder globalTraceObjectID](self, "globalTraceObjectID"), self->_markerID);
    }
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::endComputePass((_QWORD *)self->_impl, 0);
  }
  -[AGXA10FamilyComputeContext destroyImpl](self, "destroyImpl");
}

- (id)reInitWithCommandBuffer:(id)a3
{
  _QWORD *impl;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *i;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;

  impl = self->_impl;
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
  {
    IOGPUDeviceTraceEvent();
    impl = self->_impl;
  }
  v6 = *(_QWORD *)(impl[182] + 808);
  *((_DWORD *)impl + 1792) = *(_DWORD *)(v6 + 4504);
  v7 = *(_QWORD **)(v6 + 5016);
  if (v7)
  {
    do
    {
      IOGPUResourceListAddResource();
      v7 = (_QWORD *)*v7;
    }
    while (v7);
    v6 = *(_QWORD *)(impl[182] + 808);
  }
  for (i = *(_QWORD **)(v6 + 4848); i; i = (_QWORD *)*i)
    IOGPUResourceListAddResource();
  v9 = (objc_class *)a3;
  v10 = (int)*MEMORY[0x24BDDD860];
  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = v9;
  v11 = *(_QWORD *)(*((_QWORD *)v9 + 82) + 96);
  -[IOGPUMetalCommandEncoder setLabel:](self, "setLabel:", &stru_2504033A8);
  v12 = self->_impl;
  if (v12[1796] >= 2u)
  {
    v12[1797] = 0;
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*((_QWORD **)v12 + 901));
    *((_QWORD *)v12 + 900) = v12 + 1802;
    *((_QWORD *)v12 + 902) = 0;
    *((_QWORD *)v12 + 901) = 0;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "setCurrentCommandEncoder:", self);
  if ((objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "getSupportedAndEnabledErrorOptions") & 1) != 0)
  {
    -[MTLDevice deviceRef](-[_MTLCommandEncoder device](self, "device"), "deviceRef");
    self->_markerID = IOGPUDeviceGetNextGlobalTraceID();
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::issueProgressMarkerDispatch((uint64_t)self->_impl, -[IOGPUMetalCommandEncoder globalTraceObjectID](self, "globalTraceObjectID"), v11);
  }
  objc_msgSend(a3, "setPreviousComputeCommandEncoder:", 0);
  return self;
}

- (unint64_t)getDriverUniqueID
{
  return self->_markerID;
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  *((_QWORD *)self->_impl + 219) = 0;
}

- (void)setComputePipelineState:(id)a3
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  impl[222] = (char *)a3 + 64;
  v5 = *((_QWORD *)a3 + 10);
  *((_BYTE *)impl + 1745) = *(_BYTE *)(v5 + 216);
  *((_BYTE *)impl + 1746) = *(_BYTE *)(v5 + 1992);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5;
  _DWORD *impl;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  int v16;

  v5 = a5;
  impl = self->_impl;
  if (a5 <= 0x22)
    impl[a5 + 1053] = 0;
  v9 = (a4 + 15) | 0xF;
  v10 = *((_QWORD *)impl + 20);
  v11 = v10 + v9;
  if (v10 + v9 > *((_QWORD *)impl + 19))
  {
    v16 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 4, 3, 0);
    v10 = *((_QWORD *)impl + 20);
    if (!v16)
      goto LABEL_5;
    v11 = v10 + v9;
    if (v10 + v9 > *((_QWORD *)impl + 19))
      abort();
  }
  *((_QWORD *)impl + 21) = v11;
LABEL_5:
  v12 = (char *)((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (unint64_t)&v12[*((_QWORD *)impl + 22)];
  *((_QWORD *)impl + 20) = &v12[(a4 + 15) & 0xFFFFFFFFFFFFFFF0];
  *((_QWORD *)impl + 892) |= 1 << v5;
  impl[1788] |= 1u;
  v14 = 2 * v5;
  *(_QWORD *)(*((_QWORD *)impl + 224) + v14 * 4 + 536) = v13;
  *(_QWORD *)&impl[v14 + 1320] = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + (int)*MEMORY[0x24BE51650];
  v15 = &impl[v5];
  v15[1088] = a4;
  v15[1153] = a4;
  v15[1218] = v13 >> 8;
  memcpy(v12, a3, a4);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unsigned int v6;
  _DWORD *impl;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;

  v6 = a6;
  impl = self->_impl;
  if (a6 <= 0x22)
    impl[a6 + 1053] = a5;
  v10 = (a4 + 15) | 0xF;
  v11 = *((_QWORD *)impl + 20);
  v12 = v11 + v10;
  if (v11 + v10 > *((_QWORD *)impl + 19))
  {
    v17 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 4, 3, 0);
    v11 = *((_QWORD *)impl + 20);
    if (!v17)
      goto LABEL_5;
    v12 = v11 + v10;
    if (v11 + v10 > *((_QWORD *)impl + 19))
      abort();
  }
  *((_QWORD *)impl + 21) = v12;
LABEL_5:
  v13 = (char *)((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (unint64_t)&v13[*((_QWORD *)impl + 22)];
  *((_QWORD *)impl + 20) = &v13[(a4 + 15) & 0xFFFFFFFFFFFFFFF0];
  *((_QWORD *)impl + 892) |= 1 << v6;
  impl[1788] |= 1u;
  v15 = 2 * v6;
  *(_QWORD *)(*((_QWORD *)impl + 224) + v15 * 4 + 536) = v14;
  *(_QWORD *)&impl[v15 + 1320] = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + (int)*MEMORY[0x24BE51650];
  v16 = &impl[v6];
  v16[1088] = a4;
  v16[1153] = a4;
  v16[1218] = v14 >> 8;
  memcpy(v13, a3, a4);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5;
  _QWORD *impl;
  int *v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _DWORD *v19;

  v5 = a5;
  impl = self->_impl;
  if (!a3)
  {
    v15 = impl[219];
    v16 = a5;
    v17 = &impl[v16];
    v17[757] = v15;
    v17[822] = 0;
    v18 = (_QWORD *)(impl[224] + v16 * 8);
    v18[67] = v15;
    *v18 = 0;
    v19 = (_DWORD *)impl + a5;
    v19[1088] = 0;
    v19[1153] = 0;
    v19[1218] = impl[219] >> 8;
    v17[660] = 0;
    if (a5 > 0x22)
      return;
    goto LABEL_5;
  }
  v7 = (int *)MEMORY[0x24BE51650];
  v8 = (char *)a3 + (int)*MEMORY[0x24BE51650];
  v9 = *((_QWORD *)v8 + 1);
  v10 = *((_QWORD *)v8 + 3);
  LODWORD(v8) = *((_DWORD *)v8 + 4);
  v11 = a5;
  v12 = &impl[v11];
  v12[757] = v9;
  v12[822] = v10;
  v13 = (_QWORD *)(impl[224] + v11 * 8);
  v13[67] = v9 + a4;
  *v13 = v10 + a4;
  v14 = (_DWORD *)impl + a5;
  v14[1088] = (_DWORD)v8;
  v14[1153] = (_DWORD)v8;
  v14[1218] = v9 >> 8;
  v12[660] = (char *)a3 + *v7;
  impl[892] |= 1 << a5;
  *((_DWORD *)impl + 1788) |= 1u;
  if (impl[185])
    MTLResourceListAddResource();
  if (v5 <= 0x22)
LABEL_5:
    *((_DWORD *)impl + v5 + 1053) = 0;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unsigned int v6;
  int v7;
  _QWORD *impl;
  int *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _DWORD *v21;

  v6 = a6;
  v7 = a5;
  impl = self->_impl;
  if (!a3)
  {
    v17 = impl[219];
    v18 = a6;
    v19 = &impl[v18];
    v19[757] = v17;
    v19[822] = 0;
    v20 = (_QWORD *)(impl[224] + v18 * 8);
    v20[67] = v17;
    *v20 = 0;
    v21 = (_DWORD *)impl + a6;
    v21[1088] = 0;
    v21[1153] = 0;
    v21[1218] = impl[219] >> 8;
    v19[660] = 0;
    if (a6 > 0x22)
      return;
    goto LABEL_5;
  }
  v9 = (int *)MEMORY[0x24BE51650];
  v10 = (char *)a3 + (int)*MEMORY[0x24BE51650];
  v11 = *((_QWORD *)v10 + 1);
  v12 = *((_QWORD *)v10 + 3);
  LODWORD(v10) = *((_DWORD *)v10 + 4);
  v13 = a6;
  v14 = &impl[v13];
  v14[757] = v11;
  v14[822] = v12;
  v15 = (_QWORD *)(impl[224] + v13 * 8);
  v15[67] = v11 + a4;
  *v15 = v12 + a4;
  v16 = (_DWORD *)impl + a6;
  v16[1088] = (_DWORD)v10;
  v16[1153] = (_DWORD)v10;
  v16[1218] = v11 >> 8;
  v14[660] = (char *)a3 + *v9;
  impl[892] |= 1 << a6;
  *((_DWORD *)impl + 1788) |= 1u;
  if (impl[185])
    MTLResourceListAddResource();
  if (v6 <= 0x22)
LABEL_5:
    *((_DWORD *)impl + v6 + 1053) = v7;
}

- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;
  int *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _DWORD *v11;
  _QWORD *v12;
  char *v13;

  impl = self->_impl;
  v5 = impl[224];
  *(_QWORD *)(v5 + 8 * a4 + 536) = 0;
  if (a3)
  {
    v6 = (int *)MEMORY[0x24BE51650];
    v7 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v8 = *((_QWORD *)v7 + 1);
    v9 = *((_QWORD *)v7 + 3);
    LODWORD(v7) = *((_DWORD *)v7 + 4);
    v10 = &impl[a4];
    v10[822] = v9;
    *(_QWORD *)(v5 + 8 * a4) = v9;
    v10[757] = v8;
    v11 = (_DWORD *)impl + a4;
    v11[1088] = (_DWORD)v7;
    v11[1153] = (_DWORD)v7;
    v11[1218] = v8 >> 8;
    v10[660] = (char *)a3 + *v6;
    impl[892] |= 1 << a4;
    *((_DWORD *)impl + 1788) |= 1u;
    if (impl[185])
      MTLResourceListAddResource();
  }
  else
  {
    v12 = &impl[a4];
    v12[660] = 0;
    *(_QWORD *)(v5 + 8 * a4) = 0;
    v12[757] = impl[219];
    v12[822] = 0;
    v13 = (char *)impl + 4 * a4;
    *((_DWORD *)v13 + 1088) = 0;
    *((_DWORD *)v13 + 1153) = 0;
  }
}

- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  unsigned int location;
  int *v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  _QWORD *impl;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _DWORD *v18;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = (int *)MEMORY[0x24BE51650];
    do
    {
      v11 = (char *)*a3;
      impl = self->_impl;
      v13 = impl[224];
      *(_QWORD *)(v13 + 8 * location + 536) = 0;
      if (v11)
      {
        v14 = &v11[*v8];
        v15 = *((_QWORD *)v14 + 1);
        v16 = *((_QWORD *)v14 + 3);
        LODWORD(v14) = *((_DWORD *)v14 + 4);
        v17 = &impl[location];
        v17[757] = v15;
        v17[822] = v16;
        *(_QWORD *)(v13 + 8 * location) = v16;
        v18 = (_DWORD *)impl + location;
        v18[1088] = (_DWORD)v14;
        v18[1153] = (_DWORD)v14;
        v18[1218] = v15 >> 8;
        v17[660] = &v11[*v8];
        impl[892] |= 1 << location;
        *((_DWORD *)impl + 1788) |= 1u;
        if (impl[185])
          MTLResourceListAddResource();
      }
      else
      {
        v9 = &impl[location];
        v9[660] = 0;
        *(_QWORD *)(v13 + 8 * location) = 0;
        v9[757] = impl[219];
        v9[822] = 0;
        v10 = (char *)impl + 4 * location;
        *((_DWORD *)v10 + 1088) = 0;
        *((_DWORD *)v10 + 1153) = 0;
      }
      ++location;
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;
  int *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _DWORD *v11;
  _QWORD *v12;
  char *v13;

  impl = self->_impl;
  v5 = impl[224];
  *(_QWORD *)(v5 + 8 * a4 + 536) = 0;
  if (a3)
  {
    v6 = (int *)MEMORY[0x24BE51650];
    v7 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v8 = *((_QWORD *)v7 + 1);
    v9 = *((_QWORD *)v7 + 3);
    LODWORD(v7) = *((_DWORD *)v7 + 4);
    v10 = &impl[a4];
    v10[822] = v9;
    *(_QWORD *)(v5 + 8 * a4) = v9;
    v10[757] = v8;
    v11 = (_DWORD *)impl + a4;
    v11[1088] = (_DWORD)v7;
    v11[1153] = (_DWORD)v7;
    v11[1218] = v8 >> 8;
    v10[660] = (char *)a3 + *v6;
    impl[892] |= 1 << a4;
    *((_DWORD *)impl + 1788) |= 1u;
    if (impl[185])
      MTLResourceListAddResource();
  }
  else
  {
    v12 = &impl[a4];
    v12[660] = 0;
    *(_QWORD *)(v5 + 8 * a4) = 0;
    v12[757] = impl[219];
    v12[822] = 0;
    v13 = (char *)impl + 4 * a4;
    *((_DWORD *)v13 + 1088) = 0;
    *((_DWORD *)v13 + 1153) = 0;
  }
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  unsigned int location;
  int *v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  _QWORD *impl;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _DWORD *v18;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = (int *)MEMORY[0x24BE51650];
    do
    {
      v11 = (char *)*a3;
      impl = self->_impl;
      v13 = impl[224];
      *(_QWORD *)(v13 + 8 * location + 536) = 0;
      if (v11)
      {
        v14 = &v11[*v8];
        v15 = *((_QWORD *)v14 + 1);
        v16 = *((_QWORD *)v14 + 3);
        LODWORD(v14) = *((_DWORD *)v14 + 4);
        v17 = &impl[location];
        v17[757] = v15;
        v17[822] = v16;
        *(_QWORD *)(v13 + 8 * location) = v16;
        v18 = (_DWORD *)impl + location;
        v18[1088] = (_DWORD)v14;
        v18[1153] = (_DWORD)v14;
        v18[1218] = v15 >> 8;
        v17[660] = &v11[*v8];
        impl[892] |= 1 << location;
        *((_DWORD *)impl + 1788) |= 1u;
        if (impl[185])
          MTLResourceListAddResource();
      }
      else
      {
        v9 = &impl[location];
        v9[660] = 0;
        *(_QWORD *)(v13 + 8 * location) = 0;
        v9[757] = impl[219];
        v9[822] = 0;
        v10 = (char *)impl + 4 * location;
        *((_DWORD *)v10 + 1088) = 0;
        *((_DWORD *)v10 + 1153) = 0;
      }
      ++location;
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AGXA10FamilyComputeContext;
    -[IOGPUMetalComputeCommandEncoder setIntersectionFunctionTable:atBufferIndex:](&v7, sel_setIntersectionFunctionTable_atBufferIndex_, a3, a4);
  }
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXA10FamilyComputeContext;
    -[IOGPUMetalComputeCommandEncoder setIntersectionFunctionTables:withBufferRange:](&v8, sel_setIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  impl = self->_impl;
  v5 = a4;
  v6 = impl[v5 + 822];
  v7 = impl[v5 + 757] + a3;
  v8 = (_QWORD *)(impl[224] + v5 * 8);
  v8[67] = v7;
  *v8 = v6 + a3;
  if (a4 <= 0x22)
    *((_DWORD *)impl + a4 + 1053) = 0;
  *((_DWORD *)impl + a4 + 1153) = *((_DWORD *)impl + a4 + 1088);
  *((_DWORD *)impl + 1788) |= 1u;
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _QWORD *impl;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  impl = self->_impl;
  v6 = a5;
  v7 = impl[v6 + 822];
  v8 = impl[v6 + 757] + a3;
  v9 = (_QWORD *)(impl[224] + v6 * 8);
  v9[67] = v8;
  *v9 = v7 + a3;
  if (a5 <= 0x22)
    *((_DWORD *)impl + a5 + 1053) = a4;
  *((_DWORD *)impl + a5 + 1153) = *((_DWORD *)impl + a5 + 1088);
  *((_DWORD *)impl + 1788) |= 1u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::setBuffers_impl<AGXBuffer>((uint64_t)self->_impl, (uint64_t *)a3, (uint64_t *)a4, a5.location, a5.length, 0);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::setBuffers_impl<AGXBuffer>((uint64_t)self->_impl, (uint64_t *)a3, (uint64_t *)a4, a6.location, a6.length, (uint64_t *)a5);
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4;
  _QWORD *impl;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  _DWORD *v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  char *v21;

  v4 = a4;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    impl = self->_impl;
    if (a3)
    {
      v8 = v4;
      v9 = v4;
      *(_QWORD *)(impl[224] + v9 * 8 + 536) = *((unsigned int *)a3 + 80);
      v10 = objc_msgSend(a3, "buffer");
      v11 = (int *)MEMORY[0x24BE51650];
      v12 = *(_QWORD *)(v10 + (int)*MEMORY[0x24BE51650] + 8);
      v13 = *(_QWORD *)(objc_msgSend(a3, "buffer") + *v11 + 24);
      v14 = *(_DWORD *)(objc_msgSend(a3, "buffer") + *v11 + 16);
      v15 = &impl[v9];
      v15[757] = v12;
      v15[822] = v13;
      v16 = (_DWORD *)impl + v4;
      v16[1088] = v14;
      v16[1153] = v14;
      v16[1218] = v12 >> 8;
      v15[660] = objc_msgSend(a3, "buffer") + *v11;
      objc_msgSend(a3, "buffer");
      if (impl[185])
        MTLResourceListAddResource();
      v17 = (os_unfair_lock_s *)(*((_QWORD *)a3 + 41) + 40);
      os_unfair_lock_lock(v17);
      os_unfair_lock_unlock(v17);
      objc_msgSend(a3, "buffer");
    }
    else
    {
      v8 = v4;
      v18 = v4;
      v19 = &impl[v18];
      v19[660] = 0;
      v20 = (_QWORD *)(impl[224] + v18 * 8);
      v20[67] = impl[219];
      *v20 = 0;
      v19[757] = impl[219];
      v19[822] = 0;
      v21 = (char *)impl + 4 * v4;
      *((_DWORD *)v21 + 1088) = 0;
      *((_DWORD *)v21 + 1153) = 0;
    }
    impl[892] |= 1 << v8;
    *((_DWORD *)impl + 1788) |= 1u;
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  int v4;
  char *impl;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  int *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int8x16_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a4;
  impl = (char *)self->_impl;
  if (a3)
  {
    v7 = *((_QWORD *)a3 + 67);
    v8 = a4;
    v9 = *((_QWORD *)impl + 224) + 24 * a4;
    v10 = *(_OWORD *)(v7 + 400);
    *(_QWORD *)(v9 + 1608) = *(_QWORD *)(v7 + 416);
    *(_OWORD *)(v9 + 1592) = v10;
    v11 = *((_QWORD *)impl + 224) + 24 * (a4 + 31);
    v12 = *(_OWORD *)(v7 + 424);
    *(_QWORD *)(v11 + 1608) = *(_QWORD *)(v7 + 440);
    v13 = (int *)MEMORY[0x24BE51650];
    *(_OWORD *)(v11 + 1592) = v12;
    *(_QWORD *)&impl[8 * a4 + 5800] = (char *)a3 + *v13;
    v14 = &impl[56 * a4];
    v15 = *(_OWORD *)(v7 + 72);
    v16 = *(_OWORD *)(v7 + 88);
    v17 = *(_OWORD *)(v7 + 104);
    *((_QWORD *)v14 + 240) = *(_QWORD *)(v7 + 120);
    *((_OWORD *)v14 + 119) = v17;
    *((_OWORD *)v14 + 118) = v16;
    *((_OWORD *)v14 + 117) = v15;
    v18 = 1 << a4;
    *((_QWORD *)impl + 451) |= 1 << a4;
    *((_QWORD *)impl + 452) &= ~(1 << a4);
    v19 = (unint64_t)*(unsigned __int8 *)(v7 + 381) << 8;
    v21 = v19 == 512 || v19 == 1024;
    *((_QWORD *)impl + 887) = (v21 << a4) | *((_QWORD *)impl + 887) & ~v18;
    *((_QWORD *)impl + 888) = *((_QWORD *)impl + 888) & ~v18 | ((unint64_t)(v19 == 768) << a4);
    *((_QWORD *)impl + 893) |= v18;
    *((_DWORD *)impl + 1788) |= 2u;
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    v22 = *((_QWORD *)a3 + 67);
  }
  else
  {
    v8 = a4;
    *(_QWORD *)&impl[8 * a4 + 5800] = 0;
    v23 = &impl[56 * a4];
    bzero(v23 + 1872, 0x38uLL);
    v22 = 0;
    *((_DWORD *)v23 + 480) = 0;
    v24 = (int8x16_t)vdupq_n_s64(~(1 << v4));
    *(int8x16_t *)(impl + 3608) = vandq_s8(*(int8x16_t *)(impl + 3608), v24);
    v25 = *((_QWORD *)impl + 224) + 24 * v8;
    *(_OWORD *)(v25 + 1592) = xmmword_232D736D0;
    *(_QWORD *)(v25 + 1608) = 0;
    v26 = *((_QWORD *)impl + 224) + 24 * (v4 + 31);
    *(_OWORD *)(v26 + 1592) = xmmword_232D736D0;
    *(_QWORD *)(v26 + 1608) = 0;
    *(int8x16_t *)(impl + 7096) = vandq_s8(*(int8x16_t *)(impl + 7096), v24);
  }
  *(_QWORD *)&impl[8 * v8 + 3680] = v22;
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  unsigned int location;
  const void **v6;
  char *impl;
  uint64_t length_low;
  const void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  char *v25;
  int8x16_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;

  LODWORD(v4) = a4.length;
  location = a4.location;
  v6 = a3;
  impl = (char *)self->_impl;
  if (LODWORD(a4.length) && *((_QWORD *)impl + 185))
  {
    length_low = LODWORD(a4.length);
    v9 = a3;
    do
    {
      if (*v9)
        MTLResourceListAddResource();
      ++v9;
      --length_low;
    }
    while (length_low);
  }
  if ((_DWORD)v4)
  {
    v4 = v4;
    v30 = v4;
    v31 = location;
    do
    {
      v23 = *v6;
      v24 = &impl[56 * location];
      v25 = &impl[8 * location];
      if (*v6)
      {
        v10 = v23[67];
        v11 = *((_QWORD *)impl + 224) + 24 * location;
        v12 = *(_QWORD *)(v10 + 416);
        *(_OWORD *)(v11 + 1592) = *(_OWORD *)(v10 + 400);
        *(_QWORD *)(v11 + 1608) = v12;
        v13 = *((_QWORD *)impl + 224) + 24 * (location + 31);
        v14 = *(_OWORD *)(v10 + 424);
        *(_QWORD *)(v13 + 1608) = *(_QWORD *)(v10 + 440);
        *(_OWORD *)(v13 + 1592) = v14;
        *((_QWORD *)v25 + 725) = (char *)v23 + (int)*MEMORY[0x24BE51650];
        v15 = *(_OWORD *)(v10 + 72);
        v16 = *(_OWORD *)(v10 + 88);
        v17 = *(_OWORD *)(v10 + 104);
        *((_QWORD *)v24 + 240) = *(_QWORD *)(v10 + 120);
        *((_OWORD *)v24 + 119) = v17;
        *((_OWORD *)v24 + 118) = v16;
        *((_OWORD *)v24 + 117) = v15;
        v18 = 1 << location;
        *((_QWORD *)impl + 451) |= 1 << location;
        *((_QWORD *)impl + 452) &= ~(1 << location);
        v19 = (unint64_t)*(unsigned __int8 *)(v10 + 381) << 8;
        v21 = v19 == 512 || v19 == 1024;
        *((_QWORD *)impl + 887) = (v21 << location) | *((_QWORD *)impl + 887) & ~v18;
        *((_QWORD *)impl + 888) = *((_QWORD *)impl + 888) & ~v18 | ((unint64_t)(v19 == 768) << location);
        v22 = v23[67];
      }
      else
      {
        *((_QWORD *)v25 + 725) = 0;
        bzero(v24 + 1872, 0x38uLL);
        v22 = 0;
        *((_DWORD *)v24 + 480) = 0;
        v26 = (int8x16_t)vdupq_n_s64(~(1 << location));
        *(int8x16_t *)(impl + 3608) = vandq_s8(*(int8x16_t *)(impl + 3608), v26);
        v27 = *((_QWORD *)impl + 224) + 24 * location;
        *(_OWORD *)(v27 + 1592) = xmmword_232D736D0;
        *(_QWORD *)(v27 + 1608) = 0;
        v28 = *((_QWORD *)impl + 224) + 24 * (location + 31);
        *(_OWORD *)(v28 + 1592) = xmmword_232D736D0;
        *(_QWORD *)(v28 + 1608) = 0;
        *(int8x16_t *)(impl + 7096) = vandq_s8(*(int8x16_t *)(impl + 7096), v26);
      }
      *(_QWORD *)&impl[8 * location++ + 3680] = v22;
      ++v6;
      --v4;
    }
    while (v4);
    v29 = v30;
    LOBYTE(location) = v31;
  }
  else
  {
    v29 = 0;
  }
  *((_QWORD *)impl + 893) |= ~(-1 << v29) << location;
  *((_DWORD *)impl + 1788) |= 2u;
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  unsigned int v4;
  _QWORD *impl;
  char *v7;
  uint64_t v8;

  v4 = a4;
  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  if (a3)
  {
    v7 = (char *)a3 + 48;
    v8 = v4;
    *(_QWORD *)(impl[224] + 8 * v4 + 3080) = *((_QWORD *)a3 + 15) & 0xFFFFFFFFFF8FFFFFLL;
  }
  else
  {
    v7 = 0;
    v8 = v4;
    *(_QWORD *)(impl[224] + 8 * v4 + 3080) = 0;
  }
  impl[v8 + 491] = v7;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length;
  unsigned int location;
  const void **v6;
  _QWORD *impl;
  uint64_t length_low;
  const void **v9;
  uint64_t v10;
  _QWORD *v11;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  impl = self->_impl;
  if (LODWORD(a4.length) && impl[185])
  {
    length_low = LODWORD(a4.length);
    v9 = a3;
    do
    {
      if (*v9)
        MTLResourceListAddResource();
      ++v9;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    v10 = length;
    do
    {
      v11 = *v6;
      if (*v6)
      {
        v11 += 6;
        *(_QWORD *)(impl[224] + 8 * location + 3080) = v11[9] & 0xFFFFFFFFFF8FFFFFLL;
      }
      else
      {
        *(_QWORD *)(impl[224] + 8 * location + 3080) = 0;
      }
      impl[location++ + 491] = v11;
      ++v6;
      --v10;
    }
    while (v10);
  }
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  unsigned int v6;
  _QWORD *impl;
  char *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  BOOL v17;
  float v18;
  uint64_t v19;

  v6 = a6;
  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  if (a3)
  {
    v11 = (char *)a3 + 48;
    if (a4 > a5)
      v12 = a5;
    else
      v12 = a4;
    v13 = v12 * 64.0;
    v14 = a5 * 64.0;
    v15 = 896.0;
    if (v13 <= 896.0)
      v16 = v13;
    else
      v16 = 896.0;
    v17 = v13 < 0.0;
    v18 = 0.0;
    if (v17)
      v16 = 0.0;
    if (v14 <= 896.0)
      v15 = a5 * 64.0;
    if (v14 >= 0.0)
      v18 = v15;
    v19 = v6;
    *(_QWORD *)(impl[224] + 8 * v6 + 3080) = *((_QWORD *)a3 + 15) & 0xFFFFFFFFFF800000 | ((unint64_t)v18 << 10) & 0x3FFFF8FFC00 | v16 & 0xFF8003FF;
  }
  else
  {
    v11 = 0;
    v19 = v6;
    *(_QWORD *)(impl[224] + 8 * v6 + 3080) = 0;
  }
  impl[v19 + 491] = v11;
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  uint64_t length_low;
  unsigned int location;
  _QWORD *impl;
  char *v12;
  char *v13;
  _QWORD *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  float v21;
  float v22;

  length_low = LODWORD(a6.length);
  if (LODWORD(a6.length))
  {
    location = a6.location;
    impl = self->_impl;
    do
    {
      v14 = *a3;
      if (impl[185])
        MTLResourceListAddResource();
      if (v14)
      {
        v15 = *a4;
        if (*a4 > *a5)
          v15 = *a5;
        v12 = (char *)(v14 + 6);
        v16 = v15 * 64.0;
        v17 = *a5 * 64.0;
        if (v16 <= 896.0)
          v18 = v16;
        else
          v18 = 896.0;
        if (v16 >= 0.0)
          v19 = v18;
        else
          v19 = 0.0;
        v20 = v19 & 0xFF8003FF;
        if (v17 <= 896.0)
          v21 = *a5 * 64.0;
        else
          v21 = 896.0;
        if (v17 >= 0.0)
          v22 = v21;
        else
          v22 = 0.0;
        *(_QWORD *)(impl[224] + 8 * location + 3080) = v14[15] & 0xFFFFFFFFFF800000 | ((unint64_t)v22 << 10) & 0x3FFFF8FFC00 | v20;
      }
      else
      {
        v12 = 0;
        *(_QWORD *)(impl[224] + 8 * location + 3080) = 0;
      }
      v13 = (char *)&impl[location++];
      *((_QWORD *)v13 + 491) = v12;
      ++a5;
      ++a4;
      ++a3;
      --length_low;
    }
    while (length_low);
  }
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  *((_DWORD *)self->_impl + a4 + 1284) = a3;
}

- (void)setImageBlockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("APINotSupported"), CFSTR("API is not supported"), 0), "raise");
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("APINotSupported"), CFSTR("API is not supported"), 0), "raise");
}

- (void)setStageInRegion:(id *)a3
{
  int32x4_t *impl;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int32x4_t v8;
  int v9;

  impl = (int32x4_t *)self->_impl;
  impl[474] = vuzp1q_s32(*(int32x4_t *)&a3->var0.var0, *(int32x4_t *)&a3->var0.var2);
  *(int32x2_t *)impl[475].i8 = vmovn_s64(*(int64x2_t *)&a3->var1.var1);
  v4 = impl[10].i64[0];
  v5 = v4 + 47;
  if ((unint64_t)(v4 + 47) > impl[9].i64[1])
  {
    v9 = AGX::DataBufferAllocator<34ul>::growNoInline(&impl[1], 3, 0);
    v4 = impl[10].i64[0];
    if (!v9)
      goto LABEL_3;
    v5 = v4 + 47;
    if ((unint64_t)(v4 + 47) > impl[9].i64[1])
      abort();
  }
  impl[10].i64[1] = v5;
LABEL_3:
  v6 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = v6 + impl[11].i64[0];
  impl[10].i64[0] = v6 + 32;
  impl[446].i64[0] |= 0x10000000000uLL;
  impl[447].i32[0] |= 1u;
  *(_QWORD *)(impl[112].i64[0] + 856) = v7;
  impl[350].i64[0] = *(_QWORD *)(impl[2].i64[1] + 224) + (int)*MEMORY[0x24BE51650];
  impl[282].i32[0] = 24;
  impl[298].i32[1] = 24;
  impl[314].i32[2] = v7 >> 8;
  v8 = impl[474];
  *(_QWORD *)(v6 + 16) = impl[475].i64[0];
  *(int32x4_t *)v6 = v8;
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  _QWORD *impl;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  impl = self->_impl;
  if (a3)
  {
    v5 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v6 = *((_QWORD *)v5 + 1);
    v7 = *((_QWORD *)v5 + 3);
    v8 = *((_DWORD *)v5 + 4);
    impl[797] = v6;
    impl[862] = v7;
    v9 = impl[224];
    *(_QWORD *)(v9 + 856) = v6 + a4;
    *(_QWORD *)(v9 + 320) = v7 + a4;
    *((_DWORD *)impl + 1128) = v8;
    *((_DWORD *)impl + 1193) = v8;
    *((_DWORD *)impl + 1258) = v6 >> 8;
    impl[700] = v5;
    impl[892] |= 0x10000000000uLL;
    *((_DWORD *)impl + 1788) |= 1u;
    if (impl[185])
      MTLResourceListAddResource();
  }
  else
  {
    v10 = impl[219];
    impl[797] = v10;
    impl[862] = 0;
    v11 = impl[224];
    *(_QWORD *)(v11 + 856) = v10;
    *(_QWORD *)(v11 + 320) = 0;
    *((_DWORD *)impl + 1128) = 0;
    *((_DWORD *)impl + 1193) = 0;
    *((_DWORD *)impl + 1258) = impl[219] >> 8;
    impl[700] = 0;
  }
  IOGPUResourceListAddResource();
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  _DWORD *impl;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;

  impl = self->_impl;
  impl[382] = impl[381];
  if (a4->var1 * a4->var0 * a4->var2 <= *(unsigned int *)(*((_QWORD *)impl + 222) + 224))
  {
    v7 = *a4;
    v6 = *a3;
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::executeKernel((uint64_t)impl, (__int128 *)&v7, (__int128 *)&v6);
    *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
  }
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  _DWORD *impl;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;

  impl = self->_impl;
  impl[382] = impl[381];
  if (a5->var1 * a5->var0 * a5->var2 <= *(unsigned int *)(*((_QWORD *)impl + 222) + 224))
  {
    v13 = *a5;
    v7 = (int)*MEMORY[0x24BE51650];
    v8 = *(_QWORD *)((char *)a3 + v7 + 8);
    v9 = v8 + a4;
    v10 = *(_QWORD *)((char *)a3 + v7 + 24);
    v11 = *(_DWORD *)((char *)a3 + v7 + 16);
    *((_QWORD *)impl + 792) = v8;
    *((_QWORD *)impl + 857) = v10;
    v12 = *((_QWORD *)impl + 224);
    *(_QWORD *)(v12 + 816) = v8 + a4;
    *(_QWORD *)(v12 + 280) = v10 + a4;
    impl[1123] = v11;
    impl[1188] = v11;
    impl[1253] = v8 >> 8;
    *((_QWORD *)impl + 695) = (char *)a3 + v7;
    *((_QWORD *)impl + 892) |= 0x800000000uLL;
    impl[1788] |= 1u;
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::executeKernelWithIndirectBufferCommon((uint64_t)impl, v9, (uint64_t *)&v13);
    *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
  }
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("APINotSupported"), CFSTR("API is not supported"), 0), "raise");
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("APINotSupported"), CFSTR("API is not supported"), 0), "raise");
}

- (void)encodeStartDoWhile
{
  _QWORD *impl;
  void (*v3)(_QWORD *, SEL);
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(_QWORD *, SEL);
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  impl = self->_impl;
  if (!impl[944] && *((_BYTE *)impl + 7408))
  {
    v3 = (void (*)(_QWORD *, SEL))impl[924];
    v4 = impl[925];
    v5 = (_QWORD *)(impl[923] + (v4 >> 1));
    if ((v4 & 1) != 0)
      v3 = *(void (**)(_QWORD *, SEL))(*v5 + v3);
    v3(v5, a2);
  }
  if (*((_BYTE *)impl + 7472))
  {
    v6 = (void (*)(_QWORD *, SEL))impl[932];
    v7 = impl[933];
    v8 = (_QWORD *)(impl[931] + (v7 >> 1));
    if ((v7 & 1) != 0)
      v6 = *(void (**)(_QWORD *, SEL))(*v8 + v6);
    v6(v8, a2);
  }
  v9 = impl[941];
  v10 = impl[940];
  v11 = 73 * ((v9 - v10) >> 3) - 1;
  v12 = v9 == v10;
  v13 = impl[916];
  v14 = *(_QWORD *)(v13 + 752);
  v15 = *(_QWORD *)(v13 + 768);
  if (v12)
    v11 = 0;
  v16 = impl[944] + impl[943];
  if (v11 == v16)
  {
    std::deque<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)(impl + 939));
    v10 = impl[940];
    v16 = impl[944] + impl[943];
  }
  v17 = *(_QWORD *)(v10 + 8 * (v16 / 0x49)) + 56 * (v16 % 0x49);
  *(_QWORD *)v17 = v14;
  *(_QWORD *)(v17 + 8) = v15 + v14;
  *(_DWORD *)(v17 + 48) = 3;
  ++impl[944];
}

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  _QWORD *impl;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *);
  uint64_t v19;
  _QWORD *v20;
  void (*v21)(_QWORD *);
  uint64_t v22;
  _QWORD *v23;
  BOOL result;
  uint64_t v25;
  _BYTE v26[32];
  _QWORD *v27;
  unsigned int v28;
  int v29;
  id v30;
  unint64_t v31;
  int v32;

  impl = self->_impl;
  if (a3)
  {
    if (impl[185])
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
    v10 = impl[944];
    if (v10
      && *(_DWORD *)(*(_QWORD *)(impl[940] + 8 * ((v10 + impl[943] - 1) / 0x49uLL))
                   + 56 * ((v10 + impl[943] - 1) % 0x49uLL)
                   + 48) == 3)
    {
      v30 = a3;
      v31 = a4;
      v32 = 2;
      v28 = a6;
      v29 = 1;
      AGX::ComputeControlFlowEmitterGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::emitPredicate((uint64_t)v26);
      v11 = impl[944] + impl[943] - 1;
      *v27 = *(_QWORD *)(*(_QWORD *)(impl[940] + 8 * (v11 / 0x49)) + 56 * (v11 % 0x49) + 8);
      v12 = impl[940];
      v13 = impl[941];
      v14 = 73 * ((v13 - v12) >> 3) - 1;
      v15 = v13 == v12;
      v16 = impl[944];
      v17 = impl[943];
      if (v15)
        v14 = 0;
      impl[944] = v16 - 1;
      if ((unint64_t)(v14 - (v16 + v17) + 1) >= 0x92)
      {
        operator delete(*(void **)(v13 - 8));
        impl[941] -= 8;
      }
      if (*((_BYTE *)impl + 7504))
      {
        v18 = (void (*)(_QWORD *))impl[936];
        v19 = impl[937];
        v20 = (_QWORD *)(impl[935] + (v19 >> 1));
        if ((v19 & 1) != 0)
          v18 = *(void (**)(_QWORD *))(*v20 + v18);
        v18(v20);
      }
      if (impl[944] || !*((_BYTE *)impl + 7440))
        return (*((_BYTE *)impl + 7562) & 2) == 0;
      v21 = (void (*)(_QWORD *))impl[928];
      v22 = impl[929];
      v23 = (_QWORD *)(impl[927] + (v22 >> 1));
      if ((v22 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      if (!*((_BYTE *)impl + 7376))
        return (*((_BYTE *)impl + 7562) & 2) == 0;
      v21 = (void (*)(_QWORD *))impl[920];
      v25 = impl[921];
      v23 = (_QWORD *)(impl[919] + (v25 >> 1));
      if ((v25 & 1) == 0)
      {
LABEL_18:
        v21(v23);
        return (*((_BYTE *)impl + 7562) & 2) == 0;
      }
    }
    v21 = *(void (**)(_QWORD *))(*v23 + v21);
    goto LABEL_18;
  }
  result = 0;
  *((_BYTE *)impl + 7562) |= 2u;
  return result;
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  _QWORD *impl;
  void (*v7)(_QWORD *);
  uint64_t v8;
  _QWORD *v9;
  void (*v10)(_QWORD *);
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  _OWORD v19[3];

  impl = self->_impl;
  if (a3)
  {
    if (impl[185])
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
    if (!impl[944] && *((_BYTE *)impl + 7408))
    {
      v7 = (void (*)(_QWORD *))impl[924];
      v8 = impl[925];
      v9 = (_QWORD *)(impl[923] + (v8 >> 1));
      if ((v8 & 1) != 0)
        v7 = *(void (**)(_QWORD *))(*v9 + v7);
      v7(v9);
    }
    if (*((_BYTE *)impl + 7472))
    {
      v10 = (void (*)(_QWORD *))impl[932];
      v11 = impl[933];
      v12 = (_QWORD *)(impl[931] + (v11 >> 1));
      if ((v11 & 1) != 0)
        v10 = *(void (**)(_QWORD *))(*v12 + v10);
      v10(v12);
    }
    AGX::ComputeControlFlowEmitterGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::emitPredicate((uint64_t)v19);
    v13 = impl[941];
    v14 = impl[940];
    v15 = 73 * ((v13 - v14) >> 3) - 1;
    if (v13 == v14)
      v15 = 0;
    v16 = impl[944] + impl[943];
    if (v15 == v16)
    {
      std::deque<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)(impl + 939));
      v14 = impl[940];
      v16 = impl[944] + impl[943];
    }
    v17 = *(_QWORD *)(v14 + 8 * (v16 / 0x49)) + 56 * (v16 % 0x49);
    v18 = v19[1];
    *(_OWORD *)v17 = v19[0];
    *(_OWORD *)(v17 + 16) = v18;
    *(_OWORD *)(v17 + 32) = v19[2];
    *(_DWORD *)(v17 + 48) = 2;
    ++impl[944];
  }
  else
  {
    *((_BYTE *)impl + 7562) |= 2u;
  }
}

- (BOOL)encodeEndWhile
{
  _QWORD *impl;
  uint64_t v3;
  _QWORD *v4;
  unint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *);
  uint64_t v17;
  _QWORD *v18;
  void (*v19)(_QWORD *);
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  int v24;

  impl = self->_impl;
  v3 = impl[944];
  if (!v3
    || *(_DWORD *)(*(_QWORD *)(impl[940] + 8 * ((v3 + impl[943] - 1) / 0x49uLL))
                 + 56 * ((v3 + impl[943] - 1) % 0x49uLL)
                 + 48) != 2)
  {
    if (!*((_BYTE *)impl + 7376))
      return (*((_BYTE *)impl + 7562) & 2) == 0;
    v19 = (void (*)(_QWORD *))impl[920];
    v23 = impl[921];
    v21 = (_QWORD *)(impl[919] + (v23 >> 1));
    if ((v23 & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  v4 = (_QWORD *)impl[916];
  v5 = (unint64_t *)v4[94];
  v6 = v4[96];
  if ((unint64_t)(v5 + 1) > v4[93])
  {
    v24 = AGX::DataBufferAllocator<34ul>::growNoInline(impl[916], 22, 0);
    v7 = (unint64_t *)v4[94];
    if (v24)
    {
      if ((unint64_t)(v7 + 1) > v4[93])
        abort();
      v4[95] = v7 + 1;
      *v5 = __ROR8__((char *)v7 + v4[96], 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
      v7 = (unint64_t *)v4[94];
    }
  }
  else
  {
    v4[95] = v5 + 1;
    v7 = v5;
  }
  *v7 = 0xADE17D00400000DELL;
  v4[94] = v7 + 1;
  v8 = impl[944] + impl[943] - 1;
  *v5 = __ROR8__(*(_QWORD *)(*(_QWORD *)(impl[940] + 8 * (v8 / 0x49)) + 56 * (v8 % 0x49) + 8), 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
  v9 = impl[944] + impl[943] - 1;
  **(_QWORD **)(*(_QWORD *)(impl[940] + 8 * (v9 / 0x49)) + 56 * (v9 % 0x49) + 32) = (char *)v5 + v6 + 8;
  v10 = impl[940];
  v11 = impl[941];
  v12 = 73 * ((v11 - v10) >> 3) - 1;
  v13 = v11 == v10;
  v14 = impl[944];
  v15 = impl[943];
  if (v13)
    v12 = 0;
  impl[944] = v14 - 1;
  if ((unint64_t)(v12 - (v14 + v15) + 1) >= 0x92)
  {
    operator delete(*(void **)(v11 - 8));
    impl[941] -= 8;
  }
  if (*((_BYTE *)impl + 7504))
  {
    v16 = (void (*)(_QWORD *))impl[936];
    v17 = impl[937];
    v18 = (_QWORD *)(impl[935] + (v17 >> 1));
    if ((v17 & 1) != 0)
      v16 = *(void (**)(_QWORD *))(*v18 + v16);
    v16(v18);
  }
  if (!impl[944] && *((_BYTE *)impl + 7440))
  {
    v19 = (void (*)(_QWORD *))impl[928];
    v20 = impl[929];
    v21 = (_QWORD *)(impl[927] + (v20 >> 1));
    if ((v20 & 1) == 0)
    {
LABEL_17:
      v19(v21);
      return (*((_BYTE *)impl + 7562) & 2) == 0;
    }
LABEL_16:
    v19 = *(void (**)(_QWORD *))(*v21 + v19);
    goto LABEL_17;
  }
  return (*((_BYTE *)impl + 7562) & 2) == 0;
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  _QWORD *impl;
  void (*v7)(_QWORD *);
  uint64_t v8;
  _QWORD *v9;
  void (*v10)(_QWORD *);
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  _OWORD v19[3];

  impl = self->_impl;
  if (a3)
  {
    if (impl[185])
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
    if (!impl[944] && *((_BYTE *)impl + 7408))
    {
      v7 = (void (*)(_QWORD *))impl[924];
      v8 = impl[925];
      v9 = (_QWORD *)(impl[923] + (v8 >> 1));
      if ((v8 & 1) != 0)
        v7 = *(void (**)(_QWORD *))(*v9 + v7);
      v7(v9);
    }
    if (*((_BYTE *)impl + 7472))
    {
      v10 = (void (*)(_QWORD *))impl[932];
      v11 = impl[933];
      v12 = (_QWORD *)(impl[931] + (v11 >> 1));
      if ((v11 & 1) != 0)
        v10 = *(void (**)(_QWORD *))(*v12 + v10);
      v10(v12);
    }
    AGX::ComputeControlFlowEmitterGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::emitPredicate((uint64_t)v19);
    v13 = impl[941];
    v14 = impl[940];
    v15 = 73 * ((v13 - v14) >> 3) - 1;
    if (v13 == v14)
      v15 = 0;
    v16 = impl[944] + impl[943];
    if (v15 == v16)
    {
      std::deque<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)(impl + 939));
      v14 = impl[940];
      v16 = impl[944] + impl[943];
    }
    v17 = *(_QWORD *)(v14 + 8 * (v16 / 0x49)) + 56 * (v16 % 0x49);
    v18 = v19[1];
    *(_OWORD *)v17 = v19[0];
    *(_OWORD *)(v17 + 16) = v18;
    *(_OWORD *)(v17 + 32) = v19[2];
    *(_DWORD *)(v17 + 48) = 0;
    ++impl[944];
  }
  else
  {
    *((_BYTE *)impl + 7562) |= 2u;
  }
}

- (void)encodeStartElse
{
  _QWORD *impl;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void (*v12)(_QWORD *);
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(_QWORD *);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD *);
  uint64_t v32;
  _QWORD *v33;
  int v34;

  impl = self->_impl;
  v3 = impl[944];
  if (!v3
    || (v4 = impl[943],
        v5 = v3 - 1 + v4,
        v6 = impl[940],
        v7 = *(_QWORD *)(v6 + 8 * (v5 / 0x49)),
        v8 = v5 % 0x49,
        *(_DWORD *)(v7 + 56 * (v5 % 0x49) + 48)))
  {
    if (*((_BYTE *)impl + 7376))
    {
      v31 = (void (*)(_QWORD *))impl[920];
      v32 = impl[921];
      v33 = (_QWORD *)(impl[919] + (v32 >> 1));
      if ((v32 & 1) != 0)
        v31 = *(void (**)(_QWORD *))(*v33 + v31);
      v31(v33);
    }
  }
  else
  {
    v9 = impl[941];
    v10 = *(_QWORD **)(v7 + 56 * v8 + 32);
    impl[944] = v3 - 1;
    if (v9 == v6)
      v11 = 0;
    else
      v11 = 73 * ((v9 - v6) >> 3) - 1;
    if ((unint64_t)(v11 - (v3 + v4) + 1) >= 0x92)
    {
      operator delete(*(void **)(v9 - 8));
      impl[941] -= 8;
    }
    if (*((_BYTE *)impl + 7504))
    {
      v12 = (void (*)(_QWORD *))impl[936];
      v13 = impl[937];
      v14 = (_QWORD *)(impl[935] + (v13 >> 1));
      if ((v13 & 1) != 0)
        v12 = *(void (**)(_QWORD *))(*v14 + v12);
      v12(v14);
    }
    if (*((_BYTE *)impl + 7472))
    {
      v15 = (void (*)(_QWORD *))impl[932];
      v16 = impl[933];
      v17 = (_QWORD *)(impl[931] + (v16 >> 1));
      if ((v16 & 1) != 0)
        v15 = *(void (**)(_QWORD *))(*v17 + v15);
      v15(v17);
    }
    v18 = (_QWORD *)impl[916];
    v19 = (unint64_t *)v18[94];
    v20 = v18[96];
    if ((unint64_t)(v19 + 1) > v18[93])
    {
      v34 = AGX::DataBufferAllocator<34ul>::growNoInline(impl[916], 22, 0);
      v21 = (unint64_t *)v18[94];
      if (v34)
      {
        if ((unint64_t)(v21 + 1) > v18[93])
          abort();
        v18[95] = v21 + 1;
        *v19 = __ROR8__((char *)v21 + v18[96], 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
        v21 = (unint64_t *)v18[94];
      }
    }
    else
    {
      v18[95] = v19 + 1;
      v21 = v19;
    }
    v22 = (char *)v19 + v20;
    *v21 = 0xADE17D00400000DELL;
    v18[94] = v21 + 1;
    v23 = impl[940];
    if (impl[941] == v23)
      v24 = 0;
    else
      v24 = 73 * ((impl[941] - v23) >> 3) - 1;
    v25 = impl[944] + impl[943];
    if (v24 == v25)
    {
      std::deque<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block,std::allocator<AGX::ControlFlowContext<AGX::G9::ComputeControlFlowEmitter,AGX::G9::ComputePDSStateLoader,AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::ControlFlowDelegate>::Block>>::__add_back_capacity((uint64_t)(impl + 939));
      v23 = impl[940];
      v25 = impl[944] + impl[943];
    }
    v26 = *(_QWORD *)(v23 + 8 * (v25 / 0x49)) + 56 * (v25 % 0x49);
    *(_QWORD *)v26 = v19;
    *(_QWORD *)(v26 + 8) = v22;
    *(_DWORD *)(v26 + 48) = 1;
    v27 = impl[944];
    v28 = v27 + 1;
    v29 = impl[943] + v27;
    v30 = *(_QWORD *)(impl[940] + 8 * (v29 / 0x49));
    impl[944] = v28;
    *v10 = *(_QWORD *)(v30 + 56 * (v29 % 0x49) + 8) + 8;
  }
}

- (BOOL)encodeEndIf
{
  _QWORD *impl;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *);
  uint64_t v17;
  _QWORD *v18;
  void (*v19)(_QWORD *);
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;

  impl = self->_impl;
  v3 = impl[944];
  if (!v3)
    goto LABEL_20;
  v4 = v3 + impl[943] - 1;
  v5 = *(_QWORD *)(impl[940] + 8 * (v4 / 0x49));
  v6 = v4 % 0x49;
  v7 = *(_DWORD *)(v5 + 56 * v6 + 48);
  if (v7 == 1)
  {
    v8 = *(unint64_t **)(v5 + 56 * v6);
    v9 = __ROR8__(*(_QWORD *)(impl[916] + 768) + *(_QWORD *)(impl[916] + 752), 32) & 0xFFFFFFFCBFFFFFFFLL | 0x40000000;
    goto LABEL_6;
  }
  if (v7)
  {
LABEL_20:
    if (!*((_BYTE *)impl + 7376))
      return (*((_BYTE *)impl + 7562) & 2) == 0;
    v19 = (void (*)(_QWORD *))impl[920];
    v23 = impl[921];
    v21 = (_QWORD *)(impl[919] + (v23 >> 1));
    if ((v23 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  v8 = *(unint64_t **)(v5 + 56 * v6 + 32);
  v9 = *(_QWORD *)(impl[916] + 768) + *(_QWORD *)(impl[916] + 752);
LABEL_6:
  *v8 = v9;
  v10 = impl[940];
  v11 = impl[941];
  v12 = 73 * ((v11 - v10) >> 3) - 1;
  v13 = v11 == v10;
  v14 = impl[944];
  v15 = impl[943];
  if (v13)
    v12 = 0;
  impl[944] = v14 - 1;
  if ((unint64_t)(v12 - (v14 + v15) + 1) >= 0x92)
  {
    operator delete(*(void **)(v11 - 8));
    impl[941] -= 8;
  }
  if (*((_BYTE *)impl + 7504))
  {
    v16 = (void (*)(_QWORD *))impl[936];
    v17 = impl[937];
    v18 = (_QWORD *)(impl[935] + (v17 >> 1));
    if ((v17 & 1) != 0)
      v16 = *(void (**)(_QWORD *))(*v18 + v16);
    v16(v18);
  }
  if (!impl[944] && *((_BYTE *)impl + 7440))
  {
    v19 = (void (*)(_QWORD *))impl[928];
    v20 = impl[929];
    v21 = (_QWORD *)(impl[927] + (v20 >> 1));
    if ((v20 & 1) == 0)
    {
LABEL_18:
      v19(v21);
      return (*((_BYTE *)impl + 7562) & 2) == 0;
    }
LABEL_17:
    v19 = *(void (**)(_QWORD *))(*v21 + v19);
    goto LABEL_18;
  }
  return (*((_BYTE *)impl + 7562) & 2) == 0;
}

- (void)setThreadgroupDistributionMode:(int64_t)a3
{
  __int16 v3;

  v3 = a3 == 1;
  if (a3 == 2)
    v3 = 2;
  *((_WORD *)self->_impl + 3780) = v3;
}

- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3
{
  *((_WORD *)self->_impl + 3780) = ((_WORD)a3 << 8) | 3;
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  _QWORD *impl;
  uint64_t v6;
  unsigned int v7;

  if (-[AGXA10FamilyComputeContext dispatchType](self, "dispatchType") == 1)
  {
    impl = self->_impl;
    if (*((_BYTE *)impl + 7672))
    {
      v6 = impl[961];
      if (impl[960] != v6)
      {
        *(_BYTE *)(v6 - 8) = 1;
        *(_BYTE *)(v6 - 7) = *(_BYTE *)(impl[221] + 458);
      }
    }
    else
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier(impl + 203, impl + 2);
      v7 = *((_DWORD *)impl + 1829);
      if (*((_DWORD *)impl + 1828) < v7)
        *((_DWORD *)impl + 1828) = v7;
      *((_DWORD *)impl + 1829) = 0;
    }
    *(_BYTE *)(impl[221] + 458) = 0;
  }
  -[_MTLCommandEncoder memoryBarrierNotificationWithScope:](self, "memoryBarrierNotificationWithScope:", a3);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v8;
  unsigned int v9;

  if (-[AGXA10FamilyComputeContext dispatchType](self, "dispatchType") == 1)
  {
    impl = self->_impl;
    if (*((_BYTE *)impl + 7672))
    {
      v8 = impl[961];
      if (impl[960] != v8)
      {
        *(_BYTE *)(v8 - 8) = 1;
        *(_BYTE *)(v8 - 7) = *(_BYTE *)(impl[221] + 458);
      }
    }
    else
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier(impl + 203, impl + 2);
      v9 = *((_DWORD *)impl + 1829);
      if (*((_DWORD *)impl + 1828) < v9)
        *((_DWORD *)impl + 1828) = v9;
      *((_DWORD *)impl + 1829) = 0;
    }
    *(_BYTE *)(impl[221] + 458) = 0;
  }
  -[_MTLCommandEncoder memoryBarrierNotificationWithResources:count:](self, "memoryBarrierNotificationWithResources:count:", a3, a4);
}

- (BOOL)parallelExecution
{
  return 0;
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  _DWORD *impl;
  int v6;

  impl = self->_impl;
  v6 = impl[381];
  impl[382] = v6;
  if (LODWORD(a4.length))
  {
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::executeCommandsInBufferCommon((uint64_t)impl);
    impl = self->_impl;
    v6 = impl[381];
  }
  impl[383] = v6;
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  _DWORD *impl;

  impl = self->_impl;
  impl[382] = impl[381];
  if (*((_QWORD *)impl + 185))
    MTLResourceListAddResource();
  IOGPUResourceListAddResource();
  AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::executeCommandsInBufferCommon((uint64_t)impl);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (unint64_t)dispatchType
{
  return *((_DWORD *)self->_impl + 434) == 1;
}

- (id)newKernelDebugInfo
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*((_QWORD *)self->_impl + 222) + 16);
  if (*(char *)(v2 + 895) < 0)
  {
    if (*(_QWORD *)(v2 + 880))
      goto LABEL_3;
    return 0;
  }
  if (!*(_BYTE *)(v2 + 895))
    return 0;
LABEL_3:
  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  if (*(char *)(v2 + 895) < 0)
  {
    v4 = *(_QWORD *)(v2 + 872);
    v5 = *(_QWORD *)(v2 + 880);
  }
  else
  {
    v4 = v2 + 872;
    v5 = *(unsigned __int8 *)(v2 + 895);
  }
  return (id)objc_msgSend(v3, "initWithBytes:length:", v4, v5);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  if (a3)
  {
    if (*((_QWORD *)self->_impl + 185))
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
  }
  -[AGXA10FamilyComputeContext dispatchType](self, "dispatchType");
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  AGX::ContextCommon<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::useResourcesCommon((uint64_t)self->_impl, a3, a4, a5 & 2 | ((a5 & 7) != 0), a5 & 2 | ((a5 & 7) != 0));
  -[AGXA10FamilyComputeContext dispatchType](self, "dispatchType");
}

- (void)useHeap:(id)a3
{
  _QWORD *impl;
  uint64_t i;

  impl = self->_impl;
  if (objc_msgSend(a3, "type") == 2)
  {
    for (i = *((_QWORD *)a3 + 7); i != *((_QWORD *)a3 + 8); i += 8)
    {
      if (impl[185])
        MTLResourceListAddResource();
      IOGPUResourceListAddResource();
    }
  }
  else if (a3)
  {
    if (impl[185])
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
  }
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  AGX::ContextCommon<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::useHeaps((uint64_t)self->_impl, (uint64_t)a3, a4);
}

- (void)useResidencySet:(id)a3
{
  if (*((_QWORD *)self->_impl + 185))
  {
    if (!a3)
      return;
    MTLResourceListAddResource();
  }
  else if (!a3)
  {
    return;
  }
  IOGPUResourceListAddResource();
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;

  if (a4)
  {
    v4 = a4;
    if (*((_QWORD *)self->_impl + 185))
    {
      do
      {
        if (*a3)
        {
          MTLResourceListAddResource();
          IOGPUResourceListAddResource();
        }
        ++a3;
        --v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        if (*a3)
          IOGPUResourceListAddResource();
        ++a3;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)updateFence:(id)a3
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;

  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  v5 = impl[889];
  if (!v5)
  {
    v5 = operator new();
    v6 = *(_QWORD *)(impl[182] + 808) + 6192;
    bzero((void *)v5, 0x208uLL);
    *(_QWORD *)(v5 + 520) = v6;
    *(_DWORD *)(v5 + 528) = 0;
    impl[889] = v5;
  }
  AGX::FenceList::insertFence((AGX::FenceList *)v5, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x24BE51630]));
  *((_BYTE *)impl + 1744) = 1;
}

- (void)waitForFence:(id)a3
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;

  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  v5 = impl[890];
  if (!v5)
  {
    v5 = operator new();
    v6 = *(_QWORD *)(impl[182] + 808) + 6192;
    bzero((void *)v5, 0x208uLL);
    *(_QWORD *)(v5 + 520) = v6;
    *(_DWORD *)(v5 + 528) = 0;
    impl[890] = v5;
  }
  AGX::FenceList::insertFence((AGX::FenceList *)v5, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x24BE51630]));
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  _DWORD *impl;

  impl = self->_impl;
  impl[379] = a3;
  impl[380] = a4;
}

- (BOOL)commandBatchIdRangeMin:(unsigned int *)a3 max:(unsigned int *)a4
{
  return AGX::ContextCommon<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::userDrawTokenIndex((uint64_t)self->_impl, a3, a4);
}

- (unsigned)commandBatchIdOffset
{
  return 0;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  MTLReportFailure();
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5
{
  unsigned int *impl;
  char v7;
  int v8;
  BOOL result;

  result = a3
        && ((impl = (unsigned int *)self->_impl,
             impl[1824] = a4,
             impl[1825] = a5,
             v7 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 1824),
             v8 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 1825),
             (v7 & 1) != 0)
         || v8)
        && AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(impl + 1822), (AGXMTLCounterSampleBuffer *)a3);
  return result;
}

- (unint64_t)nextVirtualSubstream
{
  return -1;
}

@end
