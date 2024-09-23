@implementation AGXA10FamilyRenderContext

- (AGXA10FamilyRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  return -[AGXA10FamilyRenderContext initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:](self, "initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:", a3, a4, 0, 0);
}

- (AGXA10FamilyRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4 subEncoderIndex:(unint64_t)a5 framebuffer:(void *)a6
{
  AGXA10FamilyRenderContext *v9;
  unint64_t *v10;
  NSObject *v11;
  unint64_t v12;
  int v13;
  unsigned int v14;
  _QWORD *v15;
  uint64_t *p_impl;
  int v17;
  unsigned int v18;
  BOOL v19;
  BOOL parallelSubContext;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  _OWORD *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  unsigned int v52;
  float v53;
  float v54;
  float v55;
  uint64_t v56;
  uint64_t v57;
  uint64x2_t v58;
  uint64_t v59;
  float64x2_t v60;
  float64x2_t v61;
  int64x2_t v62;
  unint64_t v63;
  float v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  unsigned int *v79;
  _DWORD *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  AGXMTLCounterSampleBuffer *v85;
  unsigned int v86;
  unsigned int v87;
  int v88;
  unsigned int v89;
  int v90;
  int v91;
  int v92;
  void *v93;
  void *v94;
  AGXMTLCounterSampleBuffer *v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  int v100;
  int v101;
  int v102;
  void *v103;
  void *v104;
  AGXMTLCounterSampleBuffer *v105;
  unsigned int v106;
  unsigned int v107;
  int v108;
  unsigned int v109;
  int v110;
  int v111;
  int v112;
  void *v113;
  void *v114;
  AGXMTLCounterSampleBuffer *v115;
  unsigned int v116;
  unsigned int v117;
  int v118;
  unsigned int v119;
  int v120;
  int v121;
  int v122;
  uint64_t v123;
  int8x8_t v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const float *v130;
  float32x4_t v131;
  float *v132;
  uint64_t v133;
  uint64_t v134;
  uint32x2_t *v135;
  float32x2_t v136;
  uint32x2_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  AGX::CounterSamplingContextGen1 *v143;
  uint64_t *v144;
  unsigned int *v145;
  unsigned int *v146;
  _OWORD *v147;
  objc_super v149;
  uint64_t block;
  uint64_t v151;
  void (*v152)(uint64_t);
  uint64_t *p_block;
  unint64_t *v154;
  _QWORD v155[3];
  _QWORD *v156;
  _QWORD v157[3];
  _QWORD *v158;
  _QWORD v159[5];
  float32x4x2_t v160;
  float32x4x2_t v161;

  v159[3] = *MEMORY[0x24BDAC8D0];
  v149.receiver = self;
  v149.super_class = (Class)AGXA10FamilyRenderContext;
  v9 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v149, sel_initWithCommandBuffer_);
  if (!v9)
    goto LABEL_111;
  v10 = (unint64_t *)objc_msgSend(a3, "device");
  if (*(_BYTE *)(objc_msgSend(a4, "_descriptorPrivate") + 43))
  {
    v11 = v10[109];
    if (v11)
    {
      block = MEMORY[0x24BDAC760];
      v151 = 3221225472;
      v152 = ___ZN13AGXATelemetry16disableTelemetryEv_block_invoke;
      p_block = (uint64_t *)&__block_descriptor_40_e5_v8__0l;
      v154 = v10 + 102;
      dispatch_sync(v11, &block);
    }
  }
  v9->parallelSubContext = objc_msgSend(a3, "ownedByParallelEncoder");
  v12 = v10[101];
  if (!a6)
  {
    v157[0] = 0;
    v155[0] = 0;
    objc_msgSend(a4, "validate:width:height:", v10, v157, v155);
    if (!v157[0] || !v155[0] || *(_QWORD *)(v12 + 5936) < 0xF28uLL)
      goto LABEL_111;
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 5948));
    v17 = *(_DWORD *)(v12 + 5944);
    if (v17)
    {
      v18 = v17 - 1;
      *(_DWORD *)(v12 + 5944) = v18;
      a6 = *(void **)(v12 + 8 * v18 + 5952);
      os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 5948));
      if (a6)
      {
        bzero(a6, *(_QWORD *)(v12 + 5936));
LABEL_35:
        AGX::FramebufferDriverConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::FramebufferDriverConfigGen2((uint64_t)&block, a4, *(_DWORD *)(v10[101] + 6684), *(_WORD *)(v12 + 6226) & 0x1F);
        AGX::FramebufferGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::FramebufferGen2((uint64_t)a6, v10, *((_QWORD *)a3 + 86), &block, v157[0], v155[0], 0);
        v9->_framebuffer = a6;
        goto LABEL_6;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 5948));
    }
    a6 = malloc_type_calloc(*(_QWORD *)(v12 + 5936), 1uLL, 0xC8454162uLL);
    if (!a6)
      goto LABEL_111;
    goto LABEL_35;
  }
LABEL_6:
  if (*(_QWORD *)(v12 + 5712) >> 3 <= 0xA74uLL)
  {
    v9->_impl = 0;
    goto LABEL_111;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 5724));
  v13 = *(_DWORD *)(v12 + 5720);
  if (v13)
  {
    v14 = v13 - 1;
    *(_DWORD *)(v12 + 5720) = v14;
    v15 = *(_QWORD **)(v12 + 8 * v14 + 5728);
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 5724));
    if (v15)
    {
      bzero(v15, *(_QWORD *)(v12 + 5712));
      p_impl = (uint64_t *)&v9->_impl;
      v9->_impl = v15;
      goto LABEL_18;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 5724));
  }
  v15 = malloc_type_calloc(*(_QWORD *)(v12 + 5712), 1uLL, 0xC8454162uLL);
  p_impl = (uint64_t *)&v9->_impl;
  v9->_impl = v15;
  if (!v15)
  {
LABEL_111:
    -[AGXA10FamilyRenderContext endEncoding](v9, "endEncoding");

    return 0;
  }
LABEL_18:
  v144 = p_impl;
  v19 = a5 == 0;
  parallelSubContext = v9->parallelSubContext;
  v21 = objc_msgSend(a3, "commandBufferStorage");
  v22 = objc_msgSend(a3, "globalTraceObjectID");
  v23 = -[IOGPUMetalCommandEncoder globalTraceObjectID](v9, "globalTraceObjectID");
  v147 = v15 + 185;
  if (AGX::RenderPDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once != -1)
    dispatch_once(&AGX::RenderPDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once, &__block_literal_global_3771);
  v15[2] = &AGX::RenderPDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::databuffer_configs;
  *v15 = a3;
  v15[1] = v21;
  v15[3] = v10;
  v15[4] = v21;
  v24 = *(_QWORD *)(v21 + 768);
  v15[177] = 0;
  *((_OWORD *)v15 + 89) = 0u;
  *((_DWORD *)v15 + 360) = 0;
  v15[5] = v24;
  v15[6] = v21 + 144;
  v15[181] = *(_QWORD *)(v21 + 784);
  v15[183] = v21;
  v15[184] = v21 + 64;
  *((_BYTE *)v15 + 1504) = 0;
  *((_BYTE *)v15 + 1545) = 0;
  v15[197] = v22;
  v15[198] = v23;
  v15[199] = *((_QWORD *)a3 + 86) + 21;
  *((_OWORD *)v15 + 100) = 0u;
  v15[182] = v10;
  v25 = *(_OWORD *)(v21 + 728);
  *v147 = v25;
  v15[187] = v21 + 144;
  v15[194] = *(_QWORD *)(v21 + 48);
  v15[195] = *(_QWORD *)(v21 + 56);
  *((_DWORD *)v15 + 377) = v23;
  *(_QWORD *)((char *)v15 + 1516) = 0xFFFFFFFF00000000;
  *((_DWORD *)v15 + 385) = 0;
  *((_BYTE *)v15 + 1544) = 0;
  v26 = (_OWORD *)(v10[101] + 5336);
  *(_OWORD *)(v15 + 203) = *v26;
  *(_OWORD *)(v15 + 205) = v26[1];
  v27 = v10[101];
  *(_OWORD *)(v15 + 207) = xmmword_232D73480;
  v15[211] = *(_QWORD *)(v27 + 5328);
  v15[212] = *(_QWORD *)(*(_QWORD *)(v27 + 6840) + 8);
  *((_DWORD *)v15 + 426) = *(_DWORD *)(v27 + 5204);
  v15[217] = a6;
  v28 = v10[101];
  v15[219] = v15 + 207;
  v15[220] = v21 + 144;
  v15[221] = *((_QWORD *)&v25 + 1);
  v15[222] = v15 + 2;
  v15[226] = 0;
  *((_DWORD *)v15 + 454) = 0;
  v15[228] = 0;
  v15[229] = 0;
  v29 = MEMORY[0x24BDAC760];
  block = MEMORY[0x24BDAC760];
  v151 = 3221225472;
  v152 = ___ZN3AGX34RenderIndirectExecutionContextGen1INS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE20getVDMPatchUpVariantEPNS1_6DeviceE_block_invoke;
  p_block = (uint64_t *)&__block_descriptor_40_e5_v8__0l;
  v154 = (unint64_t *)v28;
  if (AGX::RenderIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getVDMPatchUpVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred != -1)
    dispatch_once(&AGX::RenderIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getVDMPatchUpVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred, &block);
  v30 = *(_QWORD *)(v28 + 6312);
  v31 = AGX::RenderIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getVDMPatchUpVariant(AGX::G9::Device *)::execute_indirect_pipeline;
  v32 = *(_DWORD *)(AGX::RenderIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getVDMPatchUpVariant(AGX::G9::Device *)::execute_indirect_pipeline
                  + 40);
  if (v32 > *(_DWORD *)v30)
  {
    *(_DWORD *)v30 = v32;
    *(_BYTE *)(v30 + 24) = 1;
  }
  v15[223] = v31;
  block = v29;
  v151 = 3221225472;
  v152 = ___ZN3AGX34RenderIndirectExecutionContextGen1INS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE24getRangeExecutionVariantEPNS1_6DeviceE_block_invoke;
  p_block = (uint64_t *)&__block_descriptor_40_e5_v8__0l;
  v154 = (unint64_t *)v28;
  if (AGX::RenderIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getRangeExecutionVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred != -1)
    dispatch_once(&AGX::RenderIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getRangeExecutionVariant(AGX::G9::Device *)::execute_indirect_stateless_shaders_pred, &block);
  v15[224] = AGX::RenderIndirectExecutionContextGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getRangeExecutionVariant(AGX::G9::Device *)::range_execution_pipeline;
  *(_DWORD *)(v15[219] + 64) = 0;
  v15[231] = v15;
  *((_DWORD *)v15 + 466) = 0;
  *((_BYTE *)v15 + 1868) = 1;
  v15[230] = &off_250402370;
  v33 = *((_DWORD *)a6 + 544);
  v34 = (*((_DWORD *)a6 + 545) + 31) >> 5;
  *((_DWORD *)v15 + 469) = 0x2000000;
  *((_DWORD *)v15 + 470) = ((((v33 << 13) + 253952) & 0xFFFC0000) - 0x40000) | (v34 - 1);
  *((_DWORD *)v15 + 471) = 0;
  *((_DWORD *)v15 + 472) = -1073741824;
  v15[237] = &off_2504024A8;
  v15[238] = v15;
  v15[240] = v15 + 237;
  v15[241] = &off_2504024F0;
  v15[242] = v15;
  v15[244] = v15 + 241;
  v158 = v157;
  v157[0] = &off_2504024A8;
  v157[1] = v15;
  v156 = v155;
  v155[0] = &off_2504024F0;
  v155[1] = v15;
  v35 = v15 + 246;
  v15[249] = 0;
  v36 = v15 + 250;
  v15[253] = 0;
  v15[245] = 0;
  p_block = &block;
  std::__function::__func<AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::{lambda(void)#1},std::allocator<AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::{lambda(void)#1}>,AGX::G9::NopGeometryPipelineContext * ()(void)>::__clone((uint64_t)v157, &block);
  if (v15 + 246 == &block)
  {
LABEL_37:
    v40 = p_block;
    goto LABEL_38;
  }
  v39 = p_block;
  v40 = (uint64_t *)v15[249];
  if (p_block == &block)
  {
    if (v40 != v35)
    {
      (*(void (**)(uint64_t *, _QWORD *))(block + 24))(&block, v15 + 246);
      (*(void (**)(uint64_t *))(*p_block + 32))(p_block);
      v40 = (uint64_t *)v15[249];
      p_block = v40;
      v15[249] = v35;
      goto LABEL_38;
    }
    (*(void (**)(uint64_t *, _QWORD *))(block + 24))(&block, v159);
    (*(void (**)(uint64_t *))(*p_block + 32))(p_block);
    p_block = 0;
    (*(void (**)(_QWORD, uint64_t *))(*(_QWORD *)v15[249] + 24))(v15[249], &block);
    (*(void (**)(_QWORD))(*(_QWORD *)v15[249] + 32))(v15[249]);
    v15[249] = 0;
    p_block = &block;
    (*(void (**)(_QWORD *, _QWORD *))(v159[0] + 24))(v159, v15 + 246);
    (*(void (**)(_QWORD *))(v159[0] + 32))(v159);
    v15[249] = v35;
    goto LABEL_37;
  }
  if (v40 == v35)
  {
    v40 = &block;
    (*(void (**)(_QWORD *, uint64_t *))(v15[246] + 24))(v15 + 246, &block);
    (*(void (**)(_QWORD))(*(_QWORD *)v15[249] + 32))(v15[249]);
    v15[249] = p_block;
    p_block = &block;
    v41 = 4;
    goto LABEL_42;
  }
  p_block = (uint64_t *)v15[249];
  v15[249] = v39;
LABEL_38:
  if (v40 == &block)
  {
    v41 = 4;
    v40 = &block;
  }
  else
  {
    if (!v40)
      goto LABEL_43;
    v41 = 5;
  }
LABEL_42:
  (*(void (**)(uint64_t *))(*v40 + 8 * v41))(v40);
LABEL_43:
  v42 = (uint64_t)v156;
  if (!v156)
  {
LABEL_46:
    p_block = (uint64_t *)v42;
    goto LABEL_48;
  }
  if (v156 != v155)
  {
    v42 = (*(uint64_t (**)(_QWORD *))(*v156 + 16))(v156);
    goto LABEL_46;
  }
  p_block = &block;
  (*(void (**)(_QWORD *, uint64_t *))(v155[0] + 24))(v155, &block);
LABEL_48:
  if (v36 != &block)
  {
    v43 = p_block;
    v44 = (uint64_t *)v15[253];
    if (p_block == &block)
    {
      if (v44 == v36)
      {
        (*(void (**)(uint64_t *, _QWORD *))(block + 24))(&block, v159);
        (*(void (**)(uint64_t *))(*p_block + 32))(p_block);
        p_block = 0;
        (*(void (**)(_QWORD, uint64_t *))(*(_QWORD *)v15[253] + 24))(v15[253], &block);
        (*(void (**)(_QWORD))(*(_QWORD *)v15[253] + 32))(v15[253]);
        v15[253] = 0;
        p_block = &block;
        (*(void (**)(_QWORD *, _QWORD *))(v159[0] + 24))(v159, v15 + 250);
        (*(void (**)(_QWORD *))(v159[0] + 32))(v159);
      }
      else
      {
        (*(void (**)(uint64_t *, _QWORD *))(block + 24))(&block, v15 + 250);
        (*(void (**)(uint64_t *))(*p_block + 32))(p_block);
        p_block = (uint64_t *)v15[253];
      }
      v15[253] = v36;
    }
    else if (v44 == v36)
    {
      (*(void (**)(_QWORD *, uint64_t *))(v15[250] + 24))(v15 + 250, &block);
      (*(void (**)(_QWORD))(*(_QWORD *)v15[253] + 32))(v15[253]);
      v15[253] = p_block;
      p_block = &block;
    }
    else
    {
      p_block = (uint64_t *)v15[253];
      v15[253] = v43;
    }
  }
  v45 = p_block;
  if (p_block == &block)
  {
    v46 = 4;
    v45 = &block;
  }
  else
  {
    if (!p_block)
      goto LABEL_62;
    v46 = 5;
  }
  (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_62:
  v47 = v156;
  if (v156 == v155)
  {
    v48 = 4;
    v47 = v155;
  }
  else
  {
    if (!v156)
      goto LABEL_67;
    v48 = 5;
  }
  (*(void (**)(void))(*v47 + 8 * v48))();
LABEL_67:
  v49 = v158;
  if (v158 == v157)
  {
    v50 = 4;
    v49 = v157;
    goto LABEL_71;
  }
  if (v158)
  {
    v50 = 5;
LABEL_71:
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*v49 + 8 * v50))(v49, v37, v38);
  }
  v51 = 0;
  *((_BYTE *)v15 + 2033) = v19;
  *((_BYTE *)v15 + 2040) = 0;
  *((_BYTE *)v15 + 2048) = 0;
  *((_BYTE *)v15 + 2056) = 0;
  *((_BYTE *)v15 + 2060) = 0;
  *((_WORD *)v15 + 1032) = 0;
  *((_BYTE *)v15 + 2066) = 0;
  *((_DWORD *)v15 + 517) = 3072;
  v52 = HIDWORD(*((_QWORD *)a6 + 272));
  v53 = (float)*((_QWORD *)a6 + 272);
  v15[259] = vshr_n_u32((uint32x2_t)vadd_s32(*(int32x2_t *)((char *)a6 + 2176), (int32x2_t)-1), 5uLL);
  v54 = v53 * 0.5;
  v55 = (float)v52 * 0.5;
  *((float *)v15 + 520) = v54;
  *((float *)v15 + 521) = v54;
  *((float *)v15 + 522) = v55;
  *((float *)v15 + 523) = -v55;
  v15[262] = 0x3F80000000000000;
  v15[263] = 32;
  *((_DWORD *)v15 + 529) = 2162688;
  *((_DWORD *)v15 + 531) = 1184;
  *((_DWORD *)v15 + 530) = 507307272;
  *((_OWORD *)v15 + 133) = xmmword_232D73530;
  v15[268] = 3840;
  *(_OWORD *)(v15 + 269) = xmmword_232D73530;
  v15[271] = 3840;
  v15[272] = 0x20000;
  v15[273] = 0xE0000000E000000;
  v15[274] = (char *)v15 + 2068;
  *((_DWORD *)v15 + 562) = 0;
  *((_DWORD *)v15 + 564) = 0;
  *((_WORD *)v15 + 1132) = 1;
  *((_BYTE *)v15 + 2266) = 1;
  v56 = *((_QWORD *)a6 + 272);
  v57 = HIDWORD(v56);
  *((_DWORD *)v15 + 563) = v56;
  *((_DWORD *)v15 + 565) = HIDWORD(v56);
  v58.i64[0] = v56;
  v58.i64[1] = HIDWORD(v56);
  v59 = v56;
  *((_BYTE *)v15 + 2276) = 0;
  *(_QWORD *)((char *)v15 + 2268) = 1;
  v15[285] = v15;
  v60 = vcvtq_f64_u64(v58);
  v61 = (float64x2_t)vdupq_n_s64(0x41EFFFFFFFE00000uLL);
  v62 = vshlq_n_s64((int64x2_t)vcvtq_u64_f64(vrndpq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v60, v61), (int8x16_t)v61, (int8x16_t)v60))), 0x20uLL);
  do
    *(int64x2_t *)&v15[2 * v51++ + 275] = v62;
  while (v51 < *((unsigned int *)v15 + 567));
  v63 = 0;
  v64 = (float)v59 * 0.5;
  *((float *)v15 + 520) = v64 + 0.0;
  *((float *)v15 + 521) = v64;
  *((float *)v15 + 522) = (float)((float)v57 * 0.5) + 0.0;
  *((float *)v15 + 523) = -(float)((float)v57 * 0.5);
  v15[262] = 0x3F80000000000000;
  *((_DWORD *)v15 + 568) = 1;
  v65 = v59 << 32;
  v66 = v57 << 32;
  v67 = v15 + 278;
  do
  {
    *(v67 - 1) = v65;
    *v67 = v66;
    ++v63;
    v67 += 2;
  }
  while (v63 < *((unsigned int *)v15 + 568));
  *((_BYTE *)v15 + 2288) = 1;
  *(_QWORD *)((char *)v15 + 2388) = 0;
  *((_BYTE *)v15 + 2400) = 0;
  v15[301] = 0;
  v15[309] = 0;
  v15[313] = 0;
  *(_OWORD *)(v15 + 291) = 0u;
  *(_OWORD *)(v15 + 293) = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  v15[314] = _D0;
  v15[315] = 0;
  *((_BYTE *)v15 + 2528) = 1;
  *((_BYTE *)v15 + 2531) = 1;
  *((_DWORD *)v15 + 633) = -1;
  *((_BYTE *)v15 + 2540) = 0;
  *((_DWORD *)v15 + 636) = 1;
  v73 = v15[182];
  v74 = *(_QWORD *)(v73 + 808);
  v75 = *(_QWORD *)(v74 + 5488);
  v15[324] = v74;
  v15[325] = v75;
  *((_DWORD *)v15 + 646) = 0;
  *((_BYTE *)v15 + 2608) = 0;
  v76 = *(_QWORD *)(v73 + 808);
  v77 = *(_QWORD *)(v76 + 5496);
  v15[328] = v76;
  v15[329] = v77;
  *((_DWORD *)v15 + 654) = 0;
  *((_BYTE *)v15 + 2640) = 0;
  v15[331] = 0;
  *((_OWORD *)v15 + 569) = xmmword_232D73730;
  *((_DWORD *)v15 + 2835) = 1065353216;
  v15[1418] = 0x100000001;
  *(_QWORD *)((char *)v15 + 14628) = -3229614080;
  *((_OWORD *)v15 + 765) = xmmword_232D73730;
  *((_DWORD *)v15 + 3659) = 1065353216;
  v15[2644] = 0;
  *((_DWORD *)v15 + 5290) = 0;
  v15[2656] = 0;
  *((_BYTE *)v15 + 21256) = parallelSubContext;
  v78 = objc_msgSend(a4, "pointCoordYFlipEnabled", v15 + 245, v15 + 241, v15 + 237);
  v15[2660] = -1;
  v79 = (unsigned int *)(v15 + 2660);
  *((_BYTE *)v15 + 21258) = v78;
  *(_QWORD *)((char *)v15 + 21260) = 1;
  v15[2659] = 0;
  v15[2661] = -1;
  v80 = v15 + 2661;
  v81 = (void *)objc_msgSend(a4, "sampleBufferAttachments");
  v82 = v81;
  if (v81)
  {
    v83 = (void *)objc_msgSend(v81, "_descriptorAtIndex:", 0);
    v84 = v83;
    v143 = (AGX::CounterSamplingContextGen1 *)(v15 + 2659);
    v145 = (unsigned int *)v15 + 5323;
    v146 = (unsigned int *)v15 + 5321;
    if (v83)
    {
      v85 = (AGXMTLCounterSampleBuffer *)objc_msgSend(v83, "sampleBuffer");
      v86 = objc_msgSend(v84, "startOfVertexSampleIndex");
      v87 = objc_msgSend(v84, "endOfVertexSampleIndex");
      v88 = objc_msgSend(v84, "startOfFragmentSampleIndex");
      v89 = objc_msgSend(v84, "endOfFragmentSampleIndex");
      if (v85)
      {
        *v79 = v86;
        *v146 = v87;
        *v80 = v88;
        *v145 = v89;
        v90 = AGX::CounterSamplingContextGen1::validateSampleIndex(v85, v79);
        v91 = AGX::CounterSamplingContextGen1::validateSampleIndex(v85, v146);
        v92 = AGX::CounterSamplingContextGen1::validateSampleIndex(v85, (unsigned int *)v15 + 5322);
        if ((v90 | v91 | v92 | AGX::CounterSamplingContextGen1::validateSampleIndex(v85, v145)) == 1)
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(v143, v85);
      }
    }
    v93 = (void *)objc_msgSend(v82, "_descriptorAtIndex:", 1);
    v94 = v93;
    if (v93)
    {
      v95 = (AGXMTLCounterSampleBuffer *)objc_msgSend(v93, "sampleBuffer");
      v96 = objc_msgSend(v94, "startOfVertexSampleIndex");
      v97 = objc_msgSend(v94, "endOfVertexSampleIndex");
      v98 = objc_msgSend(v94, "startOfFragmentSampleIndex");
      v99 = objc_msgSend(v94, "endOfFragmentSampleIndex");
      if (v95)
      {
        *v79 = v96;
        *v146 = v97;
        *v80 = v98;
        *v145 = v99;
        v100 = AGX::CounterSamplingContextGen1::validateSampleIndex(v95, v79);
        v101 = AGX::CounterSamplingContextGen1::validateSampleIndex(v95, v146);
        v102 = AGX::CounterSamplingContextGen1::validateSampleIndex(v95, (unsigned int *)v15 + 5322);
        if ((v100 | v101 | v102 | AGX::CounterSamplingContextGen1::validateSampleIndex(v95, v145)) == 1)
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(v143, v95);
      }
    }
    v103 = (void *)objc_msgSend(v82, "_descriptorAtIndex:", 2);
    v104 = v103;
    if (v103)
    {
      v105 = (AGXMTLCounterSampleBuffer *)objc_msgSend(v103, "sampleBuffer");
      v106 = objc_msgSend(v104, "startOfVertexSampleIndex");
      v107 = objc_msgSend(v104, "endOfVertexSampleIndex");
      v108 = objc_msgSend(v104, "startOfFragmentSampleIndex");
      v109 = objc_msgSend(v104, "endOfFragmentSampleIndex");
      if (v105)
      {
        *v79 = v106;
        *v146 = v107;
        *v80 = v108;
        *v145 = v109;
        v110 = AGX::CounterSamplingContextGen1::validateSampleIndex(v105, v79);
        v111 = AGX::CounterSamplingContextGen1::validateSampleIndex(v105, v146);
        v112 = AGX::CounterSamplingContextGen1::validateSampleIndex(v105, (unsigned int *)v15 + 5322);
        if ((v110 | v111 | v112 | AGX::CounterSamplingContextGen1::validateSampleIndex(v105, v145)) == 1)
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(v143, v105);
      }
    }
    v113 = (void *)objc_msgSend(v82, "_descriptorAtIndex:", 3);
    v114 = v113;
    if (v113)
    {
      v115 = (AGXMTLCounterSampleBuffer *)objc_msgSend(v113, "sampleBuffer");
      v116 = objc_msgSend(v114, "startOfVertexSampleIndex");
      v117 = objc_msgSend(v114, "endOfVertexSampleIndex");
      v118 = objc_msgSend(v114, "startOfFragmentSampleIndex");
      v119 = objc_msgSend(v114, "endOfFragmentSampleIndex");
      if (v115)
      {
        *v79 = v116;
        *v146 = v117;
        *v80 = v118;
        *v145 = v119;
        v120 = AGX::CounterSamplingContextGen1::validateSampleIndex(v115, v79);
        v121 = AGX::CounterSamplingContextGen1::validateSampleIndex(v115, v146);
        v122 = AGX::CounterSamplingContextGen1::validateSampleIndex(v115, (unsigned int *)v15 + 5322);
        if ((v120 | v121 | v122 | AGX::CounterSamplingContextGen1::validateSampleIndex(v115, v145)) == 1)
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(v143, v115);
      }
    }
  }
  *((_OWORD *)v15 + 1334) = 0u;
  *((_OWORD *)v15 + 1337) = xmmword_232D737D0;
  AGX::FramebufferGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::addAPIResources(v15[217], v15[185], v15[186]);
  v123 = v15[217];
  *((_WORD *)v15 + 1152) = *(_WORD *)(v123 + 3112);
  v124 = vand_s8(*(int8x8_t *)((char *)v15 + 2156), (int8x8_t)0xF8FFFFFFFC1FFFFFLL);
  *(int8x8_t *)((char *)v15 + 2156) = vorr_s8(v124, (int8x8_t)0x200000);
  v125 = v15[271] & 0xF8FFFFFF;
  *((_DWORD *)v15 + 540) = v124.i32[1] | 0x100000;
  *((_DWORD *)v15 + 542) = v125 | 0x100000;
  v126 = v15[2644];
  *((_DWORD *)v15 + 545) &= 0xFFDEFFFF;
  v15[2644] = v126 | 0x5F500000000004;
  *((_DWORD *)v15 + 5290) = 1;
  LODWORD(v126) = *(_DWORD *)(*(_QWORD *)(v15[182] + 808) + 6684);
  *((_BYTE *)v15 + 2382) = WORD1(v126) > 8u;
  *((_BYTE *)v15 + 2384) = v126 > 0xAFFFF;
  v15[401] = v15 + 338;
  v15[402] = v15 + 1138;
  v15[801] = v15 + 738;
  v15[802] = v15 + 1530;
  v127 = *(unsigned int *)(v123 + 2184);
  if (!(_DWORD)v127)
    goto LABEL_101;
  if (v127 >= 4)
  {
    v129 = 0;
    v128 = v127 & 0xFFFFFFFC;
    v130 = (const float *)(v123 + 2192);
    v131 = (float32x4_t)vdupq_n_s32(0x3D800000u);
    do
    {
      v160 = vld2q_f32(v130);
      v130 += 8;
      v161.val[0] = vmulq_f32(vcvtq_f32_u32((uint32x4_t)v160.val[0]), v131);
      v161.val[1] = vmulq_f32(vcvtq_f32_u32((uint32x4_t)v160.val[1]), v131);
      v132 = (float *)v15 + (v129 & 0xFFFFFFF8) + 3504;
      vst2q_f32(v132, v161);
      v129 += 8;
    }
    while (((2 * v127) & 0x1FFFFFFF8) != v129);
    if (v128 == v127)
      goto LABEL_101;
  }
  else
  {
    v128 = 0;
  }
  v133 = v127 - v128;
  v134 = 2 * v128;
  v135 = (uint32x2_t *)(v123 + 8 * v128 + 2192);
  v136 = (float32x2_t)vdup_n_s32(0x3D800000u);
  do
  {
    v137 = *v135++;
    *(float32x2_t *)((char *)v15 + 4 * (v134 & 0xFFFFFFFE) + 14016) = vmul_f32(vcvt_f32_u32(v137), v136);
    v134 += 2;
    --v133;
  }
  while (v133);
LABEL_101:
  v15[2643] |= 0x40uLL;
  *((_DWORD *)v15 + 3618) = 0;
  *((_DWORD *)v15 + 3662) = 0;
  *((_DWORD *)v15 + 2838) = 0;
  v138 = objc_msgSend(a4, "threadgroupMemoryLength");
  v139 = 80;
  if (!v138)
    v139 = 0;
  *(_QWORD *)((char *)v15 + ((v139 >> 3) & 8) + 21392) |= 1 << (v139 & 0x10);
  if ((unint64_t)objc_msgSend(a4, "renderTargetArrayLength") >= 2)
    v15[2675] |= 0x80000uLL;
  v140 = objc_msgSend(a4, "rasterizationRateMap");
  if (v140)
  {
    if (*(_QWORD *)v147)
      MTLResourceListAddResource();
    v15[2656] = v140;
    v15[2675] |= 0x200000uLL;
  }
  v141 = v15[182];
  v15[2654] = *(_QWORD *)(v141 + 808) + 5594;
  v15[2655] = *(_QWORD *)(*(_QWORD *)(v141 + 808) + 5600);
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::beginRenderPass(*v144);
  return v9;
}

- (AGXA10FamilyRenderContext)initWithCommandBuffer:(id)a3 dummyDescriptor:(id)a4
{
  return -[AGXA10FamilyRenderContext initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:](self, "initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:", a3, a4, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[AGXA10FamilyRenderContext destroyImpl](self, "destroyImpl");
  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyRenderContext;
  -[_MTLCommandEncoder dealloc](&v3, sel_dealloc);
}

- (void)destroyImpl
{
  os_unfair_lock_s *v3;
  char *impl;
  const void **i;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  void **v66;
  void **v67;
  void *v68;
  void *v69;
  uint64_t os_unfair_lock_opaque;
  void *framebuffer;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t);
  void *v77;
  uint64_t v78;
  uint64_t v79;

  v3 = *(os_unfair_lock_s **)(-[_MTLCommandEncoder device](self, "device") + 808);
  impl = (char *)self->_impl;
  if (impl)
  {
    for (i = (const void **)(impl + 2648); ; _Block_release(i[1]))
    {
      i = (const void **)*i;
      if (!i)
        break;
    }
    v6 = *((_QWORD *)impl + 2650);
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 512);
      if (v7)
      {
        v8 = MEMORY[0x24BDAC760];
        do
        {
          v9 = *(_QWORD *)(v6 + 520);
          v10 = *(_QWORD *)(v6 + 8 * __clz(__rbit64(v7)));
          v11 = *(NSObject **)(v9 + 16);
          v74 = v8;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v9;
          v79 = v10;
          dispatch_sync(v11, &v74);
          v7 = (*(_QWORD *)(v6 + 512) - 1) & *(_QWORD *)(v6 + 512);
          *(_QWORD *)(v6 + 512) = v7;
        }
        while (v7);
      }
      MEMORY[0x234927ECC](v6, 0x1020C40C758419CLL);
    }
    v12 = *((_QWORD *)impl + 2646);
    if (v12)
    {
      v13 = *(_QWORD *)(v12 + 512);
      if (v13)
      {
        v14 = MEMORY[0x24BDAC760];
        do
        {
          v15 = *(_QWORD *)(v12 + 520);
          v16 = *(_QWORD *)(v12 + 8 * __clz(__rbit64(v13)));
          v17 = *(NSObject **)(v15 + 16);
          v74 = v14;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v15;
          v79 = v16;
          dispatch_sync(v17, &v74);
          v13 = (*(_QWORD *)(v12 + 512) - 1) & *(_QWORD *)(v12 + 512);
          *(_QWORD *)(v12 + 512) = v13;
        }
        while (v13);
      }
      MEMORY[0x234927ECC](v12, 0x1020C40C758419CLL);
    }
    v18 = *((_QWORD *)impl + 2651);
    if (v18)
    {
      v19 = *(_QWORD *)(v18 + 512);
      if (v19)
      {
        v20 = MEMORY[0x24BDAC760];
        do
        {
          v21 = *(_QWORD *)(v18 + 520);
          v22 = *(_QWORD *)(v18 + 8 * __clz(__rbit64(v19)));
          v23 = *(NSObject **)(v21 + 16);
          v74 = v20;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v21;
          v79 = v22;
          dispatch_sync(v23, &v74);
          v19 = (*(_QWORD *)(v18 + 512) - 1) & *(_QWORD *)(v18 + 512);
          *(_QWORD *)(v18 + 512) = v19;
        }
        while (v19);
      }
      MEMORY[0x234927ECC](v18, 0x1020C40C758419CLL);
    }
    v24 = *((_QWORD *)impl + 2647);
    if (v24)
    {
      v25 = *(_QWORD *)(v24 + 512);
      if (v25)
      {
        v26 = MEMORY[0x24BDAC760];
        do
        {
          v27 = *(_QWORD *)(v24 + 520);
          v28 = *(_QWORD *)(v24 + 8 * __clz(__rbit64(v25)));
          v29 = *(NSObject **)(v27 + 16);
          v74 = v26;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v27;
          v79 = v28;
          dispatch_sync(v29, &v74);
          v25 = (*(_QWORD *)(v24 + 512) - 1) & *(_QWORD *)(v24 + 512);
          *(_QWORD *)(v24 + 512) = v25;
        }
        while (v25);
      }
      MEMORY[0x234927ECC](v24, 0x1020C40C758419CLL);
    }
    v30 = *((_QWORD *)impl + 2652);
    if (v30)
    {
      v31 = *(_QWORD *)(v30 + 512);
      if (v31)
      {
        v32 = MEMORY[0x24BDAC760];
        do
        {
          v33 = *(_QWORD *)(v30 + 520);
          v34 = *(_QWORD *)(v30 + 8 * __clz(__rbit64(v31)));
          v35 = *(NSObject **)(v33 + 16);
          v74 = v32;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v33;
          v79 = v34;
          dispatch_sync(v35, &v74);
          v31 = (*(_QWORD *)(v30 + 512) - 1) & *(_QWORD *)(v30 + 512);
          *(_QWORD *)(v30 + 512) = v31;
        }
        while (v31);
      }
      MEMORY[0x234927ECC](v30, 0x1020C40C758419CLL);
    }
    v36 = *((_QWORD *)impl + 2648);
    if (v36)
    {
      v37 = *(_QWORD *)(v36 + 512);
      if (v37)
      {
        v38 = MEMORY[0x24BDAC760];
        do
        {
          v39 = *(_QWORD *)(v36 + 520);
          v40 = *(_QWORD *)(v36 + 8 * __clz(__rbit64(v37)));
          v41 = *(NSObject **)(v39 + 16);
          v74 = v38;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v39;
          v79 = v40;
          dispatch_sync(v41, &v74);
          v37 = (*(_QWORD *)(v36 + 512) - 1) & *(_QWORD *)(v36 + 512);
          *(_QWORD *)(v36 + 512) = v37;
        }
        while (v37);
      }
      MEMORY[0x234927ECC](v36, 0x1020C40C758419CLL);
    }
    v42 = *((_QWORD *)impl + 2653);
    if (v42)
    {
      v43 = *(_QWORD *)(v42 + 512);
      if (v43)
      {
        v44 = MEMORY[0x24BDAC760];
        do
        {
          v45 = *(_QWORD *)(v42 + 520);
          v46 = *(_QWORD *)(v42 + 8 * __clz(__rbit64(v43)));
          v47 = *(NSObject **)(v45 + 16);
          v74 = v44;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v45;
          v79 = v46;
          dispatch_sync(v47, &v74);
          v43 = (*(_QWORD *)(v42 + 512) - 1) & *(_QWORD *)(v42 + 512);
          *(_QWORD *)(v42 + 512) = v43;
        }
        while (v43);
      }
      MEMORY[0x234927ECC](v42, 0x1020C40C758419CLL);
    }
    v48 = *((_QWORD *)impl + 2649);
    if (v48)
    {
      v49 = *(_QWORD *)(v48 + 512);
      if (v49)
      {
        v50 = MEMORY[0x24BDAC760];
        do
        {
          v51 = *(_QWORD *)(v48 + 520);
          v52 = *(_QWORD *)(v48 + 8 * __clz(__rbit64(v49)));
          v53 = *(NSObject **)(v51 + 16);
          v74 = v50;
          v75 = 3221225472;
          v76 = ___ZN3AGX14FenceGroupPool17releaseFenceGroupEPNS_10FenceGroupE_block_invoke;
          v77 = &__block_descriptor_48_e5_v8__0l;
          v78 = v51;
          v79 = v52;
          dispatch_sync(v53, &v74);
          v49 = (*(_QWORD *)(v48 + 512) - 1) & *(_QWORD *)(v48 + 512);
          *(_QWORD *)(v48 + 512) = v49;
        }
        while (v49);
      }
      MEMORY[0x234927ECC](v48, 0x1020C40C758419CLL);
    }

    v54 = (_QWORD *)*((_QWORD *)impl + 331);
    if (v54)
    {
      do
      {
        v55 = (_QWORD *)*v54;
        operator delete(v54);
        v54 = v55;
      }
      while (v55);
    }
    *((_QWORD *)impl + 331) = 0;
    v56 = impl + 2000;
    v74 = *((_QWORD *)impl + 245);
    v57 = *((_QWORD *)impl + 253);
    if (!v57)
    {
      std::__throw_bad_function_call[abi:nn180100]();
      __break(1u);
      return;
    }
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v57 + 48))(v57, &v74);
    v58 = (_QWORD *)*((_QWORD *)impl + 253);
    if (v58 == v56)
    {
      v59 = 4;
    }
    else
    {
      if (!v58)
        goto LABEL_53;
      v59 = 5;
      v56 = (_QWORD *)*((_QWORD *)impl + 253);
    }
    (*(void (**)(_QWORD *))(*v56 + 8 * v59))(v56);
LABEL_53:
    v60 = (char *)*((_QWORD *)impl + 249);
    if (v60 == impl + 1968)
    {
      v61 = 4;
      v60 = impl + 1968;
    }
    else
    {
      if (!v60)
        goto LABEL_58;
      v61 = 5;
    }
    (*(void (**)(char *))(*(_QWORD *)v60 + 8 * v61))(v60);
LABEL_58:
    v62 = (char *)*((_QWORD *)impl + 244);
    if (v62 == impl + 1928)
    {
      v63 = 4;
      v62 = impl + 1928;
    }
    else
    {
      if (!v62)
        goto LABEL_63;
      v63 = 5;
    }
    (*(void (**)(char *))(*(_QWORD *)v62 + 8 * v63))(v62);
LABEL_63:
    v64 = (char *)*((_QWORD *)impl + 240);
    if (v64 == impl + 1896)
    {
      v65 = 4;
      v64 = impl + 1896;
    }
    else
    {
      if (!v64)
      {
LABEL_68:
        v66 = (void **)*((_QWORD *)impl + 177);
        v67 = (void **)*((_QWORD *)impl + 178);
        if (v66 != v67)
        {
          do
          {
            v68 = *v66++;
            free(v68);
          }
          while (v66 != v67);
          v66 = (void **)*((_QWORD *)impl + 177);
        }
        if (v66)
        {
          *((_QWORD *)impl + 178) = v66;
          operator delete(v66);
        }
        v69 = self->_impl;
        if (v69)
        {
          os_unfair_lock_lock(v3 + 1431);
          os_unfair_lock_opaque = v3[1430]._os_unfair_lock_opaque;
          if (os_unfair_lock_opaque > 7)
          {
            os_unfair_lock_unlock(v3 + 1431);
            free(v69);
          }
          else
          {
            v3[1430]._os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
            *(_QWORD *)&v3[2 * os_unfair_lock_opaque + 1432]._os_unfair_lock_opaque = v69;
            os_unfair_lock_unlock(v3 + 1431);
          }
        }
        self->_impl = 0;
        goto LABEL_78;
      }
      v65 = 5;
    }
    (*(void (**)(char *))(*(_QWORD *)v64 + 8 * v65))(v64);
    goto LABEL_68;
  }
LABEL_78:
  framebuffer = self->_framebuffer;
  if (framebuffer)
  {
    AGX::Framebuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~Framebuffer((uint64_t)framebuffer);
    v72 = self->_framebuffer;
    if (v72)
    {
      os_unfair_lock_lock(v3 + 1487);
      v73 = v3[1486]._os_unfair_lock_opaque;
      if (v73 > 7)
      {
        os_unfair_lock_unlock(v3 + 1487);
        free(v72);
      }
      else
      {
        v3[1486]._os_unfair_lock_opaque = v73 + 1;
        *(_QWORD *)&v3[2 * v73 + 1488]._os_unfair_lock_opaque = v72;
        os_unfair_lock_unlock(v3 + 1487);
      }
    }
    self->_framebuffer = 0;
  }
}

- (void)endEncoding
{
  uint64_t v3;
  _BYTE *v4;
  objc_super v5;

  v3 = (int)*MEMORY[0x24BDDD860];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
    MTLReportFailure();
  if (self->_impl && !self->parallelSubContext)
  {
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    if ((objc_msgSend(v4, "disableDeferredEndEncoding") & 1) != 0 || v4[728])
      -[AGXA10FamilyRenderContext deferredEndEncoding:](self, "deferredEndEncoding:", 0);
    else
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setPreviousRenderCommandEncoder:", self);
  }
  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilyRenderContext;
  -[IOGPUMetalCommandEncoder endEncoding](&v5, sel_endEncoding);
}

- (void)deferredEndEncoding:(id)a3
{
  void *impl;
  int8x8_t *v5;
  __int32 v6;
  __int32 v7;
  __int32 v8;
  __int32 v9;
  unsigned int v10;
  char v11;
  int v12;
  double v13;

  impl = self->_impl;
  v5 = (int8x8_t *)*((_QWORD *)impl + 217);
  v6 = v5[456].i32[1];
  v7 = v5[455].i32[0];
  v8 = v5[456].i32[0];
  v9 = v5[455].i32[1];
  LOWORD(v10) = v6 & ~(v8 | v7 | v9);
  if ((v6 & ~(v8 | v7 | v9)) == 0)
    goto LABEL_13;
  if (((unsigned __int16)v6 & (unsigned __int16)~(v8 | v7 | v9) & 0x100) == 0)
  {
    if (((unsigned __int16)v6 & (unsigned __int16)~(v8 | v7 | v9) & 0x200) == 0)
      goto LABEL_4;
LABEL_7:
    v7 &= ~0x200u;
    v5[455].i32[0] = v7;
    v8 &= ~0x200u;
    v5[456].i32[0] = v8;
    v9 |= 0x200u;
    v5[455].i32[1] = v9;
    v5[389].i16[2] |= 8u;
    v10 = v10;
    if (!(_BYTE)v10)
      goto LABEL_13;
    goto LABEL_10;
  }
  v7 &= ~0x100u;
  v5[455].i32[0] = v7;
  v8 &= ~0x100u;
  v5[456].i32[0] = v8;
  v9 |= 0x100u;
  v5[455].i32[1] = v9;
  v5[389].i16[2] |= 2u;
  if ((v10 & 0x200) != 0)
    goto LABEL_7;
LABEL_4:
  v10 = v10;
  if (!(_BYTE)v10)
    goto LABEL_13;
  do
  {
LABEL_10:
    v11 = __clz(__rbit32(v10));
    v12 = 1 << v11;
    if (((1 << v11) & v6) != 0)
    {
      v5[183] = vand_s8(v5[183], (int8x8_t)vdup_n_s32(~(257 << v11)));
      v7 &= ~v12;
      v5[455].i32[0] = v7;
      v8 &= ~v12;
      v5[456].i32[0] = v8;
      v9 |= v12;
      v5[455].i32[1] = v9;
    }
    v10 ^= v12;
  }
  while (v10);
  impl = self->_impl;
LABEL_13:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::endRenderPassCommon((uint64_t)impl, 1, 0, 1);
  v13 = AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::commitCommon((uint64_t)impl, 1);
  self->_user_draw_token_offset = *((_DWORD *)self->_impl + 384);
  -[AGXA10FamilyRenderContext destroyImpl](self, "destroyImpl", v13);
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::memoryBarrier((uint64_t)self->_impl, a4, a5);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::memoryBarrier((uint64_t)self->_impl, a5, a6);
}

- (void)setRenderPipelineState:(id)a3
{
  _QWORD *impl;

  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setRenderPipelineStateCommon((uint64_t)impl, (uint64_t)a3 + 144);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5;
  _QWORD *impl;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _DWORD *v18;
  int v19;

  v5 = a5;
  impl = self->_impl;
  v9 = a4 + 15;
  v10 = (a4 + 15) | 0xF;
  v11 = impl[20];
  v12 = v11 + v10;
  if (v11 + v10 <= impl[19])
  {
LABEL_2:
    impl[21] = v12;
    goto LABEL_3;
  }
  v19 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 2, 3, 0);
  v11 = impl[20];
  if (v19)
  {
    v12 = v11 + v10;
    if (v11 + v10 > impl[19])
      abort();
    goto LABEL_2;
  }
LABEL_3:
  v13 = v9 & 0xFFFFFFFFFFFFFFF0;
  v14 = (char *)((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (unint64_t)&v14[impl[22]];
  impl[20] = &v14[v13];
  memcpy(v14, a3, a4);
  v16 = *(_QWORD *)(impl[5] + 224) + (int)*MEMORY[0x24BE51650];
  impl[2620] |= 1 << v5;
  impl[2644] |= 0x40uLL;
  v17 = &impl[v5];
  v17[403] = v15;
  v17[466] = v13;
  v17[1927] = v16;
  if (v5 <= 0x1E)
    *((_DWORD *)impl + v5 + 2839) = 0;
  v18 = (_DWORD *)impl + v5;
  v18[2870] = a4;
  v18[2933] = a4;
  v18[2996] = v15 >> 8;
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unsigned int v6;
  int v7;
  _QWORD *impl;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _DWORD *v20;
  int v21;

  v6 = a6;
  v7 = a5;
  impl = self->_impl;
  v11 = a4 + 15;
  v12 = (a4 + 15) | 0xF;
  v13 = impl[20];
  v14 = v13 + v12;
  if (v13 + v12 <= impl[19])
  {
LABEL_2:
    impl[21] = v14;
    goto LABEL_3;
  }
  v21 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 2, 3, 0);
  v13 = impl[20];
  if (v21)
  {
    v14 = v13 + v12;
    if (v13 + v12 > impl[19])
      abort();
    goto LABEL_2;
  }
LABEL_3:
  v15 = v11 & 0xFFFFFFFFFFFFFFF0;
  v16 = (char *)((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (unint64_t)&v16[impl[22]];
  impl[20] = &v16[v15];
  memcpy(v16, a3, a4);
  v18 = *(_QWORD *)(impl[5] + 224) + (int)*MEMORY[0x24BE51650];
  impl[2620] |= 1 << v6;
  impl[2644] |= 0x40uLL;
  v19 = &impl[v6];
  v19[403] = v17;
  v19[466] = v15;
  v19[1927] = v18;
  if (v6 <= 0x1E)
    *((_DWORD *)impl + v6 + 2839) = v7;
  v20 = (_DWORD *)impl + v6;
  v20[2870] = a4;
  v20[2933] = a4;
  v20[2996] = v17 >> 8;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5;
  _QWORD *impl;
  int *v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  _DWORD *v14;
  _QWORD *v15;
  char *v16;

  v5 = a5;
  impl = self->_impl;
  if (a3)
  {
    v7 = (int *)MEMORY[0x24BE51650];
    v8 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v9 = *((_QWORD *)v8 + 1);
    v12 = v8 + 16;
    v10 = *((_QWORD *)v8 + 2);
    v11 = *((_QWORD *)v12 + 1);
    v13 = &impl[a5];
    v13[2116] = v9;
    v13[2368] = v11;
    v13[403] = v9 + a4;
    v13[466] = (v10 & 0xFFFFFFFFFFFFFFLL) - a4;
    v13[338] = v11 + a4;
    v14 = (_DWORD *)impl + a5;
    v14[2870] = v10;
    v14[2933] = v10;
    v14[2996] = v9 >> 8;
    v13[1927] = (char *)a3 + *v7;
    if (impl[185])
      MTLResourceListAddResource();
  }
  else
  {
    v15 = &impl[a5];
    v15[1927] = 0;
    v15[403] = 0;
    v15[466] = 0;
    v15[338] = 0;
    v15[2116] = 0;
    v15[2368] = 0;
    v16 = (char *)impl + 4 * a5;
    *((_DWORD *)v16 + 2870) = 0;
    *((_DWORD *)v16 + 2933) = 0;
  }
  if (v5 <= 0x1E)
    *((_DWORD *)impl + v5 + 2839) = 0;
  impl[2620] |= 1 << v5;
  impl[2623] |= 1 << v5;
  impl[2644] |= 0xC0uLL;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unsigned int v6;
  int v7;
  _QWORD *impl;
  int *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  _DWORD *v16;
  char v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;

  v6 = a6;
  v7 = a5;
  impl = self->_impl;
  if (a3)
  {
    v9 = (int *)MEMORY[0x24BE51650];
    v10 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v11 = *((_QWORD *)v10 + 1);
    v14 = v10 + 16;
    v12 = *((_QWORD *)v10 + 2);
    v13 = *((_QWORD *)v14 + 1);
    v15 = &impl[a6];
    v15[2116] = v11;
    v15[2368] = v13;
    v15[403] = v11 + a4;
    v15[466] = (v12 & 0xFFFFFFFFFFFFFFLL) - a4;
    v15[338] = v13 + a4;
    v16 = (_DWORD *)impl + a6;
    v16[2870] = v12;
    v16[2933] = v12;
    v16[2996] = v11 >> 8;
    v15[1927] = (char *)a3 + *v9;
    if (impl[185])
      MTLResourceListAddResource();
    if (v6 < 0x1F)
      goto LABEL_5;
LABEL_7:
    v17 = v6;
    goto LABEL_8;
  }
  v18 = &impl[a6];
  v18[1927] = 0;
  v18[403] = 0;
  v18[466] = 0;
  v18[338] = 0;
  v18[2116] = 0;
  v18[2368] = 0;
  v19 = (char *)impl + 4 * a6;
  *((_DWORD *)v19 + 2870) = 0;
  *((_DWORD *)v19 + 2933) = 0;
  if (a6 >= 0x1F)
    goto LABEL_7;
LABEL_5:
  v17 = v6;
  *((_DWORD *)impl + v6 + 2839) = v7;
LABEL_8:
  v20 = 1 << v17;
  impl[2620] |= v20;
  impl[2623] |= v20;
  impl[2644] |= 0xC0uLL;
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _DWORD *impl;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  impl = self->_impl;
  v5 = &impl[2 * a4];
  v6 = v5[2368];
  v7 = v5[403];
  v8 = v5[466];
  v9 = v5[2116] + a3;
  v5[403] = v9;
  v5[466] = v7 - v9 + v8;
  v5[338] = v6 + a3;
  impl[a4 + 2933] = impl[a4 + 2870];
  if (a4 <= 0x1E)
    impl[a4 + 2839] = 0;
  *((_QWORD *)impl + 2620) |= 1 << a4;
  *((_QWORD *)impl + 2644) |= 0x40uLL;
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _DWORD *impl;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  impl = self->_impl;
  v6 = &impl[2 * a5];
  v7 = v6[2368];
  v8 = v6[403];
  v9 = v6[466];
  v10 = v6[2116] + a3;
  v6[403] = v10;
  v6[466] = v8 - v10 + v9;
  v6[338] = v7 + a3;
  impl[a5 + 2933] = impl[a5 + 2870];
  if (a5 <= 0x1E)
    impl[a5 + 2839] = a4;
  *((_QWORD *)impl + 2620) |= 1 << a5;
  *((_QWORD *)impl + 2644) |= 0x40uLL;
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setVertexProgramBuffers((unint64_t)self->_impl, (uint64_t *)a3, (uint64_t *)a4, a5.location, a5.length, 0);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setVertexProgramBuffers((unint64_t)self->_impl, (uint64_t *)a3, (uint64_t *)a4, a6.location, a6.length, (uint64_t *)a5);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  int v4;
  char *impl;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int8x16_t v23;

  v4 = a4;
  impl = (char *)self->_impl;
  if (a3)
  {
    v7 = *((_QWORD *)a3 + 67);
    v8 = a4;
    *(_QWORD *)&impl[8 * a4 + 16424] = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v9 = &impl[56 * a4];
    v10 = *(_OWORD *)(v7 + 72);
    v11 = *(_OWORD *)(v7 + 88);
    v12 = *(_OWORD *)(v7 + 104);
    *((_QWORD *)v9 + 1146) = *(_QWORD *)(v7 + 120);
    *((_OWORD *)v9 + 572) = v12;
    *((_OWORD *)v9 + 571) = v11;
    *((_OWORD *)v9 + 570) = v10;
    v13 = 1 << a4;
    *((_QWORD *)impl + 1357) |= 1 << a4;
    *((_QWORD *)impl + 1358) &= ~(1 << a4);
    v14 = v7 + 400;
    v15 = (uint64_t)&impl[24 * a4 + 4248];
    v16 = *(_OWORD *)(v7 + 400);
    *(_QWORD *)(v15 + 16) = *(_QWORD *)(v7 + 416);
    *(_OWORD *)v15 = v16;
    v17 = (uint64_t)&impl[24 * (a4 + 31) + 4248];
    v18 = *(_QWORD *)(v7 + 440);
    *(_OWORD *)v17 = *(_OWORD *)(v14 + 24);
    *(_QWORD *)(v17 + 16) = v18;
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    v19 = *((_QWORD *)a3 + 67);
  }
  else
  {
    *((_QWORD *)impl + 2625) |= 0x10uLL;
    v8 = a4;
    *(_QWORD *)&impl[8 * a4 + 16424] = 0;
    v20 = &impl[56 * a4];
    bzero(v20 + 9120, 0x38uLL);
    v19 = 0;
    *((_DWORD *)v20 + 2292) = 0;
    v13 = 1 << v4;
    *(int8x16_t *)(impl + 10856) = vandq_s8(*(int8x16_t *)(impl + 10856), (int8x16_t)vdupq_n_s64(~(1 << v4)));
    v21 = (uint64_t)&impl[24 * v8 + 4248];
    *(_OWORD *)v21 = xmmword_232D73C80;
    *(_QWORD *)(v21 + 16) = 0;
    v22 = (uint64_t)&impl[24 * (v4 + 31) + 4248];
    *(_OWORD *)v22 = xmmword_232D73C80;
    *(_QWORD *)(v22 + 16) = 0;
  }
  *(_QWORD *)&impl[8 * v8 + 10872] = v19;
  *((_QWORD *)impl + 2621) |= v13;
  *((_QWORD *)impl + 2644) |= 0x140uLL;
  v23 = (int8x16_t)vdupq_n_s64(0x10uLL);
  v23.i64[0] = v13;
  *((int8x16_t *)impl + 1312) = vorrq_s8(*((int8x16_t *)impl + 1312), v23);
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  int location;
  const void **v6;
  char *impl;
  uint64_t length_low;
  const void **v9;
  char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char v26;
  int8x16_t v27;
  char v28;
  char v29;

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
    v10 = impl + 4248;
    v28 = v4;
    v29 = location;
    v11 = location;
    do
    {
      v21 = *v6;
      v22 = &impl[56 * v11];
      v23 = &impl[8 * v11];
      if (*v6)
      {
        v12 = v21[67];
        v13 = (uint64_t)&impl[24 * v11 + 4248];
        v14 = *(_QWORD *)(v12 + 416);
        *(_OWORD *)v13 = *(_OWORD *)(v12 + 400);
        *(_QWORD *)(v13 + 16) = v14;
        v15 = (uint64_t)&impl[24 * (v11 + 31) + 4248];
        v16 = *(_QWORD *)(v12 + 440);
        *(_OWORD *)v15 = *(_OWORD *)(v12 + 424);
        *(_QWORD *)(v15 + 16) = v16;
        *((_QWORD *)v23 + 2053) = (char *)v21 + (int)*MEMORY[0x24BE51650];
        v17 = *(_OWORD *)(v12 + 72);
        v18 = *(_OWORD *)(v12 + 88);
        v19 = *(_OWORD *)(v12 + 104);
        *((_QWORD *)v22 + 1146) = *(_QWORD *)(v12 + 120);
        *((_OWORD *)v22 + 572) = v19;
        *((_OWORD *)v22 + 571) = v18;
        *((_OWORD *)v22 + 570) = v17;
        *((_QWORD *)impl + 1357) |= 1 << v11;
        *((_QWORD *)impl + 1358) &= ~(1 << v11);
        v20 = v21[67];
      }
      else
      {
        *((_QWORD *)v23 + 2053) = 0;
        bzero(v22 + 9120, 0x38uLL);
        v20 = 0;
        *((_DWORD *)v22 + 2292) = 0;
        *(int8x16_t *)(impl + 10856) = vandq_s8(*(int8x16_t *)(impl + 10856), (int8x16_t)vdupq_n_s64(~(1 << v11)));
        v24 = &v10[24 * v11];
        *(_OWORD *)v24 = xmmword_232D73C80;
        *((_QWORD *)v24 + 2) = 0;
        v25 = &v10[24 * (v11 + 31)];
        *(_OWORD *)v25 = xmmword_232D73C80;
        *((_QWORD *)v25 + 2) = 0;
      }
      *(_QWORD *)&impl[8 * v11++ + 10872] = v20;
      ++v6;
      --v4;
    }
    while (v4);
    v26 = v28;
    LOBYTE(location) = v29;
  }
  else
  {
    v26 = 0;
  }
  *((_QWORD *)impl + 2621) |= ~(-1 << v26) << location;
  *((_QWORD *)impl + 2644) |= 0x140uLL;
  v27 = (int8x16_t)vdupq_n_s64(0x10uLL);
  v27.i64[0] = ~(-1 << v26) << location;
  *((int8x16_t *)impl + 1312) = vorrq_s8(*((int8x16_t *)impl + 1312), v27);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
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
    impl[v4 + 717] = *((_QWORD *)a3 + 15) & 0xFFFFFFFFFF8FFFFFLL;
  }
  else
  {
    v7 = 0;
    v8 = v4;
    impl[v4 + 717] = 0;
  }
  impl[v8 + 1390] = v7;
  impl[2622] |= 1 << v8;
  impl[2644] |= 0x40uLL;
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length;
  unsigned int location;
  const void **v6;
  _QWORD *impl;
  uint64_t length_low;
  const void **v9;
  char v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  uint64_t v14;

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
    v11 = length;
    v12 = location;
    do
    {
      v13 = *v6;
      v14 = (uint64_t)&impl[v12 + 338];
      if (*v6)
      {
        v13 += 6;
        *(_QWORD *)(v14 + 3032) = v13[9] & 0xFFFFFFFFFF8FFFFFLL;
      }
      else
      {
        *(_QWORD *)(v14 + 3032) = 0;
      }
      impl[v12++ + 1390] = v13;
      ++v6;
      --v11;
    }
    while (v11);
  }
  else
  {
    v10 = 0;
  }
  impl[2622] |= ~(-1 << v10) << location;
  impl[2644] |= 0x40uLL;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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
    impl[v6 + 717] = *((_QWORD *)a3 + 15) & 0xFFFFFFFFFF800000 | ((unint64_t)v18 << 10) & 0x3FFFF8FFC00 | v16 & 0xFF8003FF;
  }
  else
  {
    v11 = 0;
    v19 = v6;
    impl[v6 + 717] = 0;
  }
  impl[v19 + 1390] = v11;
  impl[2622] |= 1 << v19;
  impl[2644] |= 0x40uLL;
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _QWORD *impl;
  uint64_t length_low;
  unsigned int v11;
  char *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  float v22;
  float v23;
  char length;
  char location;

  impl = self->_impl;
  length = a6.length;
  location = a6.location;
  if (LODWORD(a6.length))
  {
    length_low = LODWORD(a6.length);
    v11 = a6.location;
    do
    {
      v14 = *a3;
      if (impl[185])
        MTLResourceListAddResource();
      v15 = (uint64_t)&impl[v11 + 338];
      if (v14)
      {
        v16 = *a4;
        if (*a4 > *a5)
          v16 = *a5;
        v12 = (char *)(v14 + 6);
        v17 = v16 * 64.0;
        v18 = *a5 * 64.0;
        if (v17 <= 896.0)
          v19 = v17;
        else
          v19 = 896.0;
        if (v17 >= 0.0)
          v20 = v19;
        else
          v20 = 0.0;
        v21 = v20 & 0xFF8003FF;
        if (v18 <= 896.0)
          v22 = *a5 * 64.0;
        else
          v22 = 896.0;
        if (v18 >= 0.0)
          v23 = v22;
        else
          v23 = 0.0;
        *(_QWORD *)(v15 + 3032) = v14[15] & 0xFFFFFFFFFF800000 | ((unint64_t)v23 << 10) & 0x3FFFF8FFC00 | v21;
      }
      else
      {
        v12 = 0;
        *(_QWORD *)(v15 + 3032) = 0;
      }
      v13 = &impl[v11++];
      v13[1390] = v12;
      ++a5;
      ++a4;
      ++a3;
      --length_low;
    }
    while (length_low);
  }
  impl[2622] |= ~(-1 << length) << location;
  impl[2644] |= 0x40uLL;
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  if (a3)
  {
    if (*((_QWORD *)self->_impl + 185))
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  int v6;
  int v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  void *impl;
  uint64_t v12;

  v6 = a6 & 1 | 4;
  if ((a6 & 6) == 0)
    v6 = a6 & 1;
  v7 = v6 | 2;
  if ((a6 & 1) == 0)
    v7 = 0;
  v8 = a6 & 1 | 0xC;
  if ((a6 & 6) != 0)
  {
    v9 = 1;
  }
  else
  {
    v8 = v7;
    v9 = 0;
  }
  v10 = (a6 & 1) != 0 && (a5 & 7) != 0;
  if ((((a5 & 7) != 0) & v9) != 0)
    v10 |= 4u;
  impl = self->_impl;
  if ((a5 & 2) != 0)
    v12 = v8;
  else
    v12 = v10;
  AGX::ContextCommon<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::useResourcesCommon((uint64_t)impl, a3, a4, v12, v12);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  if (a3)
  {
    if (*((_QWORD *)self->_impl + 185))
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  __int16 v5;
  void *impl;
  __int16 v7;

  if ((a5 & 7) != 0)
    v5 = 5;
  else
    v5 = 0;
  impl = self->_impl;
  if ((a5 & 2) != 0)
    v7 = 13;
  else
    v7 = v5;
  AGX::ContextCommon<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::useResourcesCommon((uint64_t)impl, a3, a4, 5, v7);
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
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

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  AGX::ContextCommon<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::useHeaps((uint64_t)self->_impl, (uint64_t)a3, a4);
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

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  _DWORD *impl;
  int v6;

  impl = self->_impl;
  v6 = impl[381];
  impl[382] = v6;
  if (LODWORD(a4.length))
  {
    AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::executeCommandsInBufferCommon((uint64_t)impl);
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
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::executeCommandsInBufferCommon((uint64_t)impl);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)setViewport:(id *)a3
{
  unint64_t v3;
  char *impl;
  float64x2_t *p_var2;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  int32x2_t v9;
  unint64_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float *v17;
  double var2;
  float v19;
  float v20;
  double var3;
  float v22;
  float v23;
  double var5;
  double var4;
  float v26;
  float v27;
  double var1;
  float var0;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;

  v3 = 0;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 567) = 1;
  p_var2 = (float64x2_t *)&a3->var2;
  v6 = (float64x2_t)vdupq_n_s64(0x41EFFFFFFFE00000uLL);
  do
  {
    v7 = p_var2[-1];
    v8 = vaddq_f64(v7, *p_var2);
    v9 = vmovn_s64((int64x2_t)vmvnq_s8(vorrq_s8((int8x16_t)vcgtq_f64(v7, v8), (int8x16_t)vcgeq_f64(v8, v7))));
    if ((vorr_s8((int8x8_t)v9, (int8x8_t)vdup_lane_s32(v9, 1)).u8[0] & 1) != 0)
      v10 = -1;
    else
      v10 = 0;
    v11 = (int8x16_t)vdupq_n_s64(v10);
    v12 = vbicq_s8((int8x16_t)v7, v11);
    v13 = vbicq_s8((int8x16_t)v8, v11);
    v14 = (int8x16_t)vcltzq_f64(*p_var2);
    v15 = (float64x2_t)vbslq_s8(v14, v12, v13);
    v16 = (float64x2_t)vbslq_s8(v14, v13, v12);
    *(int64x2_t *)&impl[16 * v3++ + 2200] = vsliq_n_s64((int64x2_t)vcvtq_u64_f64((float64x2_t)vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v16, v6), (int8x16_t)v6, (int8x16_t)v16), (int8x16_t)vcltzq_f64(v16))), (int64x2_t)vcvtq_u64_f64(vrndpq_f64((float64x2_t)vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v15, v6), (int8x16_t)v6, (int8x16_t)v15), (int8x16_t)vcltzq_f64(v15)))), 0x20uLL);
    p_var2 += 3;
  }
  while (v3 < *((unsigned int *)impl + 567));
  v17 = (float *)*((_QWORD *)impl + 274);
  var2 = a3->var2;
  if (var2 >= -3.40282347e38)
  {
    if (var2 <= 3.40282347e38)
    {
      v20 = var2;
      v19 = v20 * 0.5;
    }
    else
    {
      v19 = 1.7014e38;
    }
  }
  else
  {
    v19 = -1.7014e38;
  }
  var3 = a3->var3;
  if (var3 >= -3.40282347e38)
  {
    if (var3 <= 3.40282347e38)
    {
      v23 = var3;
      v22 = v23 * 0.5;
    }
    else
    {
      v22 = 1.7014e38;
    }
  }
  else
  {
    v22 = -1.7014e38;
  }
  var4 = a3->var4;
  var5 = a3->var5;
  v26 = -3.4028e38;
  v27 = 3.4028e38;
  var1 = a3->var1;
  if (a3->var0 <= 3.40282347e38)
  {
    var0 = a3->var0;
    v27 = var0;
  }
  if (a3->var0 >= -3.40282347e38)
    v26 = v27;
  v17[3] = v19 + v26;
  v17[4] = v19;
  v30 = -3.4028e38;
  v31 = 3.4028e38;
  if (var1 <= 3.40282347e38)
  {
    v32 = var1;
    v31 = v32;
  }
  if (var1 >= -3.40282347e38)
    v30 = v31;
  v33 = var5 - var4;
  v17[5] = v22 + v30;
  v17[6] = -v22;
  v34 = var4;
  v17[7] = v34;
  v17[8] = v33;
  *((_QWORD *)impl + 2644) |= 0x81200000000000uLL;
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  unsigned int v4;
  _QWORD *impl;

  v4 = a4;
  impl = self->_impl;
  AGX::ClipRectContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setViewports((uint64_t)(impl + 274), &a3->var0, a4);
  impl[2644] |= 0x81200000000000uLL;
  if (v4 >= 2)
    impl[2675] |= 0x100000uLL;
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  unsigned __int8 *impl;
  unsigned int v4;
  BOOL v5;
  int8x16_t v7;
  uint64_t v8;

  impl = (unsigned __int8 *)self->_impl;
  *((_QWORD *)impl + 292) = a3;
  v4 = *((_DWORD *)impl + 540) & 0xF0000000;
  if (v4)
    v5 = v4 == 1610612736;
  else
    v5 = 1;
  if (v5 || v4 == 1342177280)
  {
    *((_DWORD *)impl + 3660) = 0;
    v7.i32[0] = impl[2344];
    v7.i32[1] = *((_DWORD *)impl + 546);
    v7.i32[2] = impl[2348];
    v7.i32[3] = *((_DWORD *)impl + 547);
    *(int8x16_t *)(impl + 2136) = vorrq_s8(vandq_s8(*(int8x16_t *)(impl + 2136), (int8x16_t)xmmword_232D73C90), v7);
    v8 = *((_QWORD *)impl + 2644);
    *((_DWORD *)impl + 531) = *((_DWORD *)impl + 582) & 0xFFFEFFFF | ((_DWORD)a3 << 16) | *((_DWORD *)impl + 531) & 0xFFFEFFFC;
    *((_QWORD *)impl + 2644) = v8 | 0x2100000000000;
  }
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  int8x8_t v4;
  _DWORD *impl;
  uint8x8_t v6;
  int v7;
  __int32 v8;
  uint64_t v9;
  uint64_t v10;

  impl = self->_impl;
  v4.i32[0] = (unsigned __int16)a4;
  v6 = (uint8x8_t)vcnt_s8(v4);
  v6.i16[0] = vaddlv_u8(v6);
  if (a3 == 1)
    v7 = (unsigned __int16)a4;
  else
    v7 = ~(-1 << a4);
  if (a3 == 1)
    v8 = v6.i32[0];
  else
    v8 = a4;
  impl[2837] = v7;
  impl[636] = v8;
  impl[2836] = v8;
  v9 = *((_QWORD *)impl + 2644);
  *((_QWORD *)impl + 2644) = v9 | 0x40;
  *((_QWORD *)impl + 2625) |= 0x80uLL;
  v10 = *((_QWORD *)impl + 334);
  if (v10)
  {
    impl[545] = impl[545] & 0xFBFF00 | *(_DWORD *)(v10 + 3600) & 0xFF0400FF;
    *((_QWORD *)impl + 2644) = v9 | 0x44;
  }
  if (*((_QWORD *)impl + 245))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setAmplificationCount(unsigned int,MTLVertexAmplificationViewMapping const*)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  int v4;
  _QWORD *impl;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;

  v4 = a3;
  impl = self->_impl;
  if (a4)
  {
    v6 = 8 * a3;
    memcpy(impl + 2663, a4, v6);
  }
  else
  {
    impl[2663] = impl[2662];
    v6 = 8 * a3;
  }
  v7 = (v6 + 15) | 0xF;
  v8 = impl[20];
  v9 = v8 + v7;
  if ((unint64_t)(v8 + v7) <= impl[19])
  {
LABEL_5:
    impl[21] = v9;
    goto LABEL_6;
  }
  v16 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 2, 3, 0);
  v8 = impl[20];
  if (v16)
  {
    v9 = v8 + v7;
    if ((unint64_t)(v8 + v7) > impl[19])
      abort();
    goto LABEL_5;
  }
LABEL_6:
  v10 = (v6 + 15) & 0xFFFFFFFF0;
  v11 = (char *)((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (unint64_t)&v11[impl[22]];
  impl[20] = &v11[v10];
  memcpy(v11, impl + 2663, v6);
  v13 = *(_QWORD *)(impl[5] + 224) + (int)*MEMORY[0x24BE51650];
  impl[2620] |= 0x400000000000000uLL;
  v14 = impl[2644];
  impl[2644] = v14 | 0x40;
  impl[461] = v12;
  impl[524] = v10;
  impl[1985] = v13;
  *((_DWORD *)impl + 2928) = v6;
  *((_DWORD *)impl + 2991) = v6;
  *((_DWORD *)impl + 3054) = v12 >> 8;
  *((_DWORD *)impl + 636) = v4;
  *((_DWORD *)impl + 2836) = v4;
  impl[2625] |= 0x80uLL;
  *((_DWORD *)impl + 5290) &= ~4u;
  v15 = impl[334];
  if (v15)
  {
    *((_DWORD *)impl + 545) = *((_DWORD *)impl + 545) & 0xFBFF00 | *(_DWORD *)(v15 + 3600) & 0xFF0400FF;
    impl[2644] = v14 | 0x44;
  }
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setAmplificationCount(unsigned int,MTLVertexAmplificationViewMapping const*)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setCullMode:(unint64_t)a3
{
  _QWORD *impl;

  impl = self->_impl;
  impl[291] = a3;
  *((_DWORD *)impl + 531) = a3 & 0xFFFEFFFF | (*((_DWORD *)impl + 584) << 16) | *((_DWORD *)impl + 531) & 0xFFFEFFFC;
  impl[2644] |= 0x2000000000000uLL;
}

- (void)setDepthClipMode:(unint64_t)a3
{
  _QWORD *impl;
  uint64_t v4;

  impl = self->_impl;
  impl[315] = a3;
  *((_DWORD *)impl + 531) = *((_DWORD *)impl + 531) & 0xFFFFF3FF | (1024 << a3);
  *((_BYTE *)impl + 2276) = a3 == 1;
  impl[2644] |= 0x2000000000000uLL;
  v4 = 0x200000000000000;
  if (a3 != 1)
    v4 = 1;
  impl[2674] |= v4;
}

- (void)setLineWidth:(float)a3
{
  float *impl;

  impl = (float *)self->_impl;
  if (impl[628] != a3)
  {
    impl[628] = a3;
    *((_QWORD *)impl + 2644) |= 0x100000000000uLL;
  }
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  float *impl;
  uint64_t v6;

  impl = (float *)self->_impl;
  if (impl[578] != a3 || impl[579] != a4 || impl[580] != a5)
  {
    impl[578] = a3;
    impl[579] = a4;
    impl[580] = a5;
    v6 = *((_QWORD *)impl + 2644);
    if (a3 == 0.0 && a4 == 0.0)
    {
      *((_QWORD *)impl + 2644) = v6 & 0xFFFFBFFFFFFFFFFFLL;
    }
    else
    {
      *((_QWORD *)impl + 2644) = v6 | 0x400000000000;
      *((_QWORD *)impl + 2674) |= 0x400000000000000uLL;
    }
  }
}

- (void)setScissorRect:(id *)a3
{
  unint64_t v3;
  _DWORD *impl;
  int64x2_t *p_var2;

  v3 = 0;
  impl = self->_impl;
  impl[568] = 1;
  p_var2 = (int64x2_t *)&a3->var2;
  do
  {
    *(int64x2_t *)&impl[4 * v3++ + 554] = vsliq_n_s64(p_var2[-1], vaddq_s64(*p_var2, p_var2[-1]), 0x20uLL);
    p_var2 += 2;
  }
  while (v3 < impl[568]);
  *((_QWORD *)impl + 2644) |= 0x200000000000uLL;
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  _DWORD *impl;
  unint64_t v5;
  int64x2_t *p_var2;

  impl = self->_impl;
  impl[568] = a4;
  if ((_DWORD)a4)
  {
    v5 = 0;
    p_var2 = (int64x2_t *)&a3->var2;
    do
    {
      *(int64x2_t *)&impl[4 * v5++ + 554] = vsliq_n_s64(p_var2[-1], vaddq_s64(*p_var2, p_var2[-1]), 0x20uLL);
      p_var2 += 2;
    }
    while (v5 < impl[568]);
  }
  *((_QWORD *)impl + 2644) |= 0x200000000000uLL;
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  _QWORD *impl;
  unint64_t v4;

  impl = self->_impl;
  if (impl[313] != a3)
    impl[2644] |= 0x100000000000uLL;
  impl[313] = a3;
  v4 = 73;
  if (a3 != 1)
    v4 = 0;
  *(_QWORD *)((char *)impl + ((v4 >> 3) & 8) + 21392) |= 1 << (v4 & 0x3F);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unsigned int v5;
  _QWORD *impl;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _DWORD *v18;
  int v19;

  v5 = a5;
  impl = self->_impl;
  v9 = a4 + 15;
  v10 = (a4 + 15) | 0xF;
  v11 = impl[24];
  v12 = v11 + v10;
  if (v11 + v10 > impl[23])
  {
    v19 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 2, 4, 0);
    v11 = impl[24];
    if (!v19)
      goto LABEL_3;
    v12 = v11 + v10;
    if (v11 + v10 > impl[23])
      abort();
  }
  impl[25] = v12;
LABEL_3:
  v13 = v9 & 0xFFFFFFFFFFFFFFF0;
  v14 = (char *)((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (unint64_t)&v14[impl[26]];
  impl[24] = &v14[v13];
  memcpy(v14, a3, a4);
  v16 = *(_QWORD *)(impl[5] + 288) + (int)*MEMORY[0x24BE51650];
  impl[2638] |= 1 << v5;
  impl[2644] |= 0x1000000000uLL;
  v17 = &impl[v5];
  v17[803] = v15;
  v17[866] = v13;
  v17[1990] = v16;
  v18 = (_DWORD *)impl + v5;
  v18[3663] = a4;
  v18[3726] = a4;
  v18[3789] = v15 >> 8;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _QWORD *impl;
  int *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  _QWORD *v13;
  _DWORD *v14;
  _QWORD *v15;
  char *v16;

  impl = self->_impl;
  if (a3)
  {
    v6 = (int *)MEMORY[0x24BE51650];
    v7 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v8 = *((_QWORD *)v7 + 1);
    v11 = v7 + 16;
    v9 = *((_QWORD *)v7 + 2);
    v10 = *((_QWORD *)v11 + 1);
    v12 = a5;
    v13 = &impl[a5];
    v13[2305] = v8;
    v13[2557] = v10;
    v13[803] = v8 + a4;
    v13[866] = (v9 & 0xFFFFFFFFFFFFFFLL) - a4;
    v13[738] = v10 + a4;
    v14 = (_DWORD *)impl + a5;
    v14[3663] = v9;
    v14[3726] = v9;
    v14[3789] = v8 >> 8;
    v13[1990] = (char *)a3 + *v6;
    if (impl[185])
      MTLResourceListAddResource();
  }
  else
  {
    v15 = &impl[a5];
    v15[1990] = 0;
    v15[803] = 0;
    v12 = a5;
    v15[866] = 0;
    v15[738] = 0;
    v15[2305] = 0;
    v15[2557] = 0;
    v16 = (char *)impl + 4 * a5;
    *((_DWORD *)v16 + 3663) = 0;
    *((_DWORD *)v16 + 3726) = 0;
  }
  impl[2638] |= 1 << v12;
  impl[2641] |= 1 << v12;
  impl[2644] |= 0x3000000000uLL;
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _DWORD *impl;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  impl = self->_impl;
  v5 = &impl[2 * a4];
  v6 = v5[2557];
  v7 = v5[803];
  v8 = v5[866];
  v9 = v5[2305] + a3;
  v5[803] = v9;
  v5[866] = v7 - v9 + v8;
  v5[738] = v6 + a3;
  impl[a4 + 3726] = impl[a4 + 3663];
  *((_QWORD *)impl + 2638) |= 1 << a4;
  *((_QWORD *)impl + 2644) |= 0x1000000000uLL;
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  unsigned int length;
  unsigned int location;
  const void **v8;
  _QWORD *impl;
  uint64_t length_low;
  const void **v11;
  _QWORD *v12;
  char v13;
  int *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  _DWORD *v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;

  length = a5.length;
  location = a5.location;
  v8 = a3;
  impl = self->_impl;
  if (LODWORD(a5.length) && impl[185])
  {
    length_low = LODWORD(a5.length);
    v11 = a3;
    do
    {
      if (*v11)
        MTLResourceListAddResource();
      ++v11;
      --length_low;
    }
    while (length_low);
  }
  if (length)
  {
    v12 = impl + 738;
    v13 = length;
    v14 = (int *)MEMORY[0x24BE51650];
    v15 = length;
    v16 = location;
    do
    {
      v19 = (char *)*v8;
      v20 = (_DWORD *)impl + v16;
      if (*v8)
      {
        v21 = &v19[*v14];
        v22 = *((_QWORD *)v21 + 1);
        v25 = v21 + 16;
        v23 = *((_QWORD *)v21 + 2);
        v24 = *((_QWORD *)v25 + 1);
        v26 = *a4;
        v27 = v16;
        v28 = &impl[v27];
        v28[803] = *a4 + v22;
        v28[866] = (v23 & 0xFFFFFFFFFFFFFFLL) - v26;
        v12[v27] = v24 + v26;
        v28[2305] = v22;
        v28[2557] = v24;
        v20[3663] = v23;
        v20[3726] = v23;
        v20[3789] = v22 >> 8;
        v28[1990] = &v19[*v14];
      }
      else
      {
        v17 = v16;
        v18 = &impl[v17];
        v18[1990] = 0;
        v18[803] = 0;
        v18[866] = 0;
        v12[v17] = 0;
        v18[2305] = 0;
        v18[2557] = 0;
        v20[3663] = 0;
        v20[3726] = 0;
      }
      ++v16;
      ++a4;
      ++v8;
      --v15;
    }
    while (v15);
  }
  else
  {
    v13 = 0;
  }
  v29 = ~(-1 << v13) << location;
  impl[2638] |= v29;
  impl[2641] |= v29;
  impl[2644] |= 0x3000000000uLL;
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  int v4;
  char *impl;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int8x16_t v23;

  v4 = a4;
  impl = (char *)self->_impl;
  if (a3)
  {
    v7 = *((_QWORD *)a3 + 67);
    v8 = a4;
    *(_QWORD *)&impl[8 * a4 + 16672] = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v9 = &impl[56 * a4];
    v10 = *(_OWORD *)(v7 + 72);
    v11 = *(_OWORD *)(v7 + 88);
    v12 = *(_OWORD *)(v7 + 104);
    *((_QWORD *)v9 + 1538) = *(_QWORD *)(v7 + 120);
    *((_OWORD *)v9 + 768) = v12;
    *((_OWORD *)v9 + 767) = v11;
    *((_OWORD *)v9 + 766) = v10;
    v13 = 1 << a4;
    *((_QWORD *)impl + 1749) |= 1 << a4;
    *((_QWORD *)impl + 1750) &= ~(1 << a4);
    v14 = v7 + 400;
    v15 = (uint64_t)&impl[24 * a4 + 7448];
    v16 = *(_OWORD *)(v7 + 400);
    *(_QWORD *)(v15 + 16) = *(_QWORD *)(v7 + 416);
    *(_OWORD *)v15 = v16;
    v17 = (uint64_t)&impl[24 * (a4 + 31) + 7448];
    v18 = *(_QWORD *)(v7 + 440);
    *(_OWORD *)v17 = *(_OWORD *)(v14 + 24);
    *(_QWORD *)(v17 + 16) = v18;
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    v19 = *((_QWORD *)a3 + 67);
  }
  else
  {
    *((_QWORD *)impl + 2643) |= 0x10uLL;
    v8 = a4;
    *(_QWORD *)&impl[8 * a4 + 16672] = 0;
    v20 = &impl[56 * a4];
    bzero(v20 + 12256, 0x38uLL);
    v19 = 0;
    *((_DWORD *)v20 + 3076) = 0;
    v13 = 1 << v4;
    *(int8x16_t *)(impl + 13992) = vandq_s8(*(int8x16_t *)(impl + 13992), (int8x16_t)vdupq_n_s64(~(1 << v4)));
    v21 = (uint64_t)&impl[24 * v8 + 7448];
    *(_OWORD *)v21 = xmmword_232D73CA0;
    *(_QWORD *)(v21 + 16) = 0;
    v22 = (uint64_t)&impl[24 * (v4 + 31) + 7448];
    *(_OWORD *)v22 = xmmword_232D73CA0;
    *(_QWORD *)(v22 + 16) = 0;
  }
  *(_QWORD *)&impl[8 * v8 + 14080] = v19;
  *((_QWORD *)impl + 2639) |= v13;
  *((_QWORD *)impl + 2644) |= 0x5000000000uLL;
  v23 = (int8x16_t)vdupq_n_s64(0x10uLL);
  v23.i64[0] = v13;
  *((int8x16_t *)impl + 1321) = vorrq_s8(*((int8x16_t *)impl + 1321), v23);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  unsigned int v6;
  int v8;
  _QWORD *impl;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  int8x16_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;

  v6 = a6;
  v8 = a4;
  impl = self->_impl;
  if (a3)
  {
    v11 = *((_QWORD *)a3 + 67);
    v12 = a4;
    impl[a4 + 2084] = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v13 = &impl[7 * a4];
    v14 = *(_OWORD *)(v11 + 72);
    v15 = *(_OWORD *)(v11 + 88);
    v16 = *(_OWORD *)(v11 + 104);
    v13[1538] = *(_QWORD *)(v11 + 120);
    *((_OWORD *)v13 + 768) = v16;
    *((_OWORD *)v13 + 767) = v15;
    *((_OWORD *)v13 + 766) = v14;
    v17 = 1 << a4;
    impl[1749] |= 1 << a4;
    impl[1750] &= ~(1 << a4);
    v18 = (uint64_t)&impl[3 * a4 + 931];
    v19 = *(_OWORD *)(v11 + 400);
    *(_QWORD *)(v18 + 16) = *(_QWORD *)(v11 + 416);
    *(_OWORD *)v18 = v19;
    v20 = (uint64_t)&impl[3 * (a4 + 31) + 931];
    v21 = *(_QWORD *)(v11 + 440);
    *(_OWORD *)v20 = *(_OWORD *)(v11 + 424);
    *(_QWORD *)(v20 + 16) = v21;
    if (impl[185])
    {
      MTLResourceListAddResource();
      if (impl[185])
        MTLResourceListAddResource();
    }
    if (*(_DWORD *)(*(_QWORD *)(v11 + 208) + 24) >= 2u)
      AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v11, 0, 0, 0, 1u);
    impl[v6 + 1117] = *((_QWORD *)a5 + 15);
    impl[2639] |= v17;
    impl[2642] |= v17;
    impl[2640] |= 1 << v6;
    impl[2644] |= 0x5000000000uLL;
    impl[v12 + 1760] = *((_QWORD *)a3 + 67);
  }
  else
  {
    v22 = a4;
    v23 = a4;
    impl[v23 + 2084] = 0;
    v24 = (uint64_t)&impl[7 * a4 + 1530];
    bzero((void *)(v24 + 16), 0x38uLL);
    v25 = *(int8x16_t *)(impl + 1749);
    *(_DWORD *)(v24 + 64) = 0;
    *(int8x16_t *)(impl + 1749) = vandq_s8(v25, (int8x16_t)vdupq_n_s64(~(1 << v8)));
    v26 = (uint64_t)&impl[3 * v22 + 931];
    *(_OWORD *)v26 = xmmword_232D73CA0;
    *(_QWORD *)(v26 + 16) = 0;
    v27 = (uint64_t)&impl[3 * (v8 + 31) + 931];
    *(_OWORD *)v27 = xmmword_232D73CA0;
    *(_QWORD *)(v27 + 16) = 0;
    impl[v23 + 1760] = 0;
    if (!a5)
    {
      v28 = 0;
      goto LABEL_10;
    }
  }
  v28 = (char *)a5 + 48;
LABEL_10:
  impl[v6 + 1791] = v28;
  impl[2643] |= 0x10uLL;
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  int location;
  const void **v6;
  char *impl;
  uint64_t length_low;
  const void **v9;
  char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char v26;
  int8x16_t v27;
  char v28;
  char v29;

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
    v10 = impl + 7448;
    v28 = v4;
    v29 = location;
    v11 = location;
    do
    {
      v21 = *v6;
      v22 = &impl[56 * v11];
      v23 = &impl[8 * v11];
      if (*v6)
      {
        v12 = v21[67];
        v13 = (uint64_t)&impl[24 * v11 + 7448];
        v14 = *(_QWORD *)(v12 + 416);
        *(_OWORD *)v13 = *(_OWORD *)(v12 + 400);
        *(_QWORD *)(v13 + 16) = v14;
        v15 = (uint64_t)&impl[24 * (v11 + 31) + 7448];
        v16 = *(_QWORD *)(v12 + 440);
        *(_OWORD *)v15 = *(_OWORD *)(v12 + 424);
        *(_QWORD *)(v15 + 16) = v16;
        *((_QWORD *)v23 + 2084) = (char *)v21 + (int)*MEMORY[0x24BE51650];
        v17 = *(_OWORD *)(v12 + 72);
        v18 = *(_OWORD *)(v12 + 88);
        v19 = *(_OWORD *)(v12 + 104);
        *((_QWORD *)v22 + 1538) = *(_QWORD *)(v12 + 120);
        *((_OWORD *)v22 + 768) = v19;
        *((_OWORD *)v22 + 767) = v18;
        *((_OWORD *)v22 + 766) = v17;
        *((_QWORD *)impl + 1749) |= 1 << v11;
        *((_QWORD *)impl + 1750) &= ~(1 << v11);
        v20 = v21[67];
      }
      else
      {
        *((_QWORD *)v23 + 2084) = 0;
        bzero(v22 + 12256, 0x38uLL);
        v20 = 0;
        *((_DWORD *)v22 + 3076) = 0;
        *(int8x16_t *)(impl + 13992) = vandq_s8(*(int8x16_t *)(impl + 13992), (int8x16_t)vdupq_n_s64(~(1 << v11)));
        v24 = &v10[24 * v11];
        *(_OWORD *)v24 = xmmword_232D73CA0;
        *((_QWORD *)v24 + 2) = 0;
        v25 = &v10[24 * (v11 + 31)];
        *(_OWORD *)v25 = xmmword_232D73CA0;
        *((_QWORD *)v25 + 2) = 0;
      }
      *(_QWORD *)&impl[8 * v11++ + 14080] = v20;
      ++v6;
      --v4;
    }
    while (v4);
    v26 = v28;
    LOBYTE(location) = v29;
  }
  else
  {
    v26 = 0;
  }
  *((_QWORD *)impl + 2639) |= ~(-1 << v26) << location;
  *((_QWORD *)impl + 2644) |= 0x5000000000uLL;
  v27 = (int8x16_t)vdupq_n_s64(0x10uLL);
  v27.i64[0] = ~(-1 << v26) << location;
  *((int8x16_t *)impl + 1321) = vorrq_s8(*((int8x16_t *)impl + 1321), v27);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
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
    impl[v4 + 1117] = *((_QWORD *)a3 + 15);
  }
  else
  {
    v7 = 0;
    v8 = v4;
    impl[v4 + 1117] = 0;
  }
  impl[v8 + 1791] = v7;
  impl[2640] |= 1 << v8;
  impl[2644] |= 0x1000000000uLL;
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  unsigned int length;
  unsigned int location;
  const void **v6;
  _QWORD *impl;
  uint64_t length_low;
  const void **v9;
  char v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  uint64_t v14;

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
    v11 = length;
    v12 = location;
    do
    {
      v13 = *v6;
      v14 = (uint64_t)&impl[v12 + 738];
      if (*v6)
      {
        v13 += 6;
        *(_QWORD *)(v14 + 3032) = v13[9];
      }
      else
      {
        *(_QWORD *)(v14 + 3032) = 0;
      }
      impl[v12++ + 1791] = v13;
      ++v6;
      --v11;
    }
    while (v11);
  }
  else
  {
    v10 = 0;
  }
  impl[2640] |= ~(-1 << v10) << location;
  impl[2644] |= 0x1000000000uLL;
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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
    impl[v6 + 1117] = *((_QWORD *)a3 + 15) & 0xFFFFFFFFFFF00000 | ((unint64_t)v18 << 10) | v16 & 0xFFF003FF;
  }
  else
  {
    v11 = 0;
    v19 = v6;
    impl[v6 + 1117] = 0;
  }
  impl[v19 + 1791] = v11;
  impl[2640] |= 1 << v19;
  impl[2644] |= 0x1000000000uLL;
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _QWORD *impl;
  _QWORD *v10;
  uint64_t length_low;
  unsigned int v12;
  char *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  unsigned int v19;
  float v20;
  uint64_t v21;
  _QWORD *v22;
  char length;
  char location;

  impl = self->_impl;
  length = a6.length;
  location = a6.location;
  if (LODWORD(a6.length))
  {
    v10 = impl + 738;
    length_low = LODWORD(a6.length);
    v12 = a6.location;
    do
    {
      v22 = *a3;
      if (impl[185])
        MTLResourceListAddResource();
      if (v22)
      {
        v13 = (char *)(v22 + 6);
        v14 = *a4;
        if (*a4 > *a5)
          v14 = *a5;
        v15 = v14 * 64.0;
        v16 = *a5 * 64.0;
        if (v15 <= 896.0)
          v17 = v15;
        else
          v17 = 896.0;
        if (v15 >= 0.0)
          v18 = v17;
        else
          v18 = 0.0;
        v19 = v18;
        if (v16 <= 896.0)
          v20 = *a5 * 64.0;
        else
          v20 = 896.0;
        if (v16 < 0.0)
          v20 = 0.0;
        v21 = v12;
        v10[v12 + 379] = v22[15] & 0xFFFFFFFFFFF00000 | ((unint64_t)v20 << 10) | v19 & 0xFFF003FF;
      }
      else
      {
        v13 = 0;
        v21 = v12;
        v10[v12 + 379] = 0;
      }
      ++v12;
      impl[v21 + 1791] = v13;
      ++a5;
      ++a4;
      ++a3;
      --length_low;
    }
    while (length_low);
  }
  impl[2640] |= ~(-1 << length) << location;
  impl[2644] |= 0x1000000000uLL;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  char *impl;
  int8x16_t v7;

  impl = (char *)self->_impl;
  *((float *)impl + 3653) = a3;
  *((float *)impl + 3654) = a4;
  *((float *)impl + 3655) = a5;
  v7 = *(int8x16_t *)(impl + 21144);
  *((float *)impl + 3656) = a6;
  *(int8x16_t *)(impl + 21144) = vorrq_s8(v7, (int8x16_t)xmmword_232D73CB0);
}

- (void)setAlphaTestReferenceValue:(float)a3
{
  char *impl;
  int8x16_t v4;

  impl = (char *)self->_impl;
  v4 = *(int8x16_t *)(impl + 21144);
  *((float *)impl + 3659) = a3;
  *(int8x16_t *)(impl + 21144) = vorrq_s8(v4, (int8x16_t)xmmword_232D73CC0);
}

- (void)setPointSize:(float)a3
{
  float *impl;

  impl = (float *)self->_impl;
  if (impl[629] != a3)
  {
    impl[629] = a3;
    *((_QWORD *)impl + 2644) |= 0x100000000000uLL;
  }
}

- (void)setViewportTransformEnabled:(BOOL)a3
{
  _QWORD *impl;
  int v4;

  impl = self->_impl;
  impl[2644] |= 0x2000000000000uLL;
  if (a3)
    v4 = 0;
  else
    v4 = 64;
  *((_DWORD *)impl + 531) = *((_DWORD *)impl + 531) & 0xFFFFFFBF | v4;
}

- (void)setProvokingVertexMode:(unint64_t)a3
{
  _QWORD *impl;
  uint64_t v4;
  unsigned int v5;

  impl = self->_impl;
  v4 = impl[2644];
  impl[2644] = v4 | 0x2000000000001;
  if (impl[335])
  {
    impl[2644] = v4 | 0x2001000000003;
    impl[2643] |= 0x400uLL;
  }
  if (a3 == 1)
    v5 = 2;
  else
    v5 = 1;
  if (!a3)
    v5 = 0;
  *((_DWORD *)impl + 634) = v5;
  *((_DWORD *)impl + 531) = dword_232D767C4[v5] | *((_DWORD *)impl + 531) & 0xFFFFFE7F;
  *((_DWORD *)impl + 3852) = a3 == 2;
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3
{
  _BYTE *impl;

  impl = self->_impl;
  impl[2531] = a3;
  *((_DWORD *)impl + 633) = -1;
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4
{
  _BYTE *impl;

  impl = self->_impl;
  impl[2531] = a3;
  *((_DWORD *)impl + 633) = a4;
}

- (void)setDepthStencilState:(id)a3
{
  char *impl;
  uint64_t v4;
  int8x8_t v5;
  int8x8_t v6;
  int8x8_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  __int16 v14;

  impl = (char *)self->_impl;
  v4 = *(_QWORD *)((char *)a3 + 76);
  *((_QWORD *)impl + 273) = v4;
  v5 = *(int8x8_t *)(impl + 2140);
  *(int8x8_t *)(impl + 2132) = vorr_s8(vand_s8(*(int8x8_t *)(impl + 2132), (int8x8_t)0xFFD1FFFFFFF3FFFFLL), *(int8x8_t *)((char *)a3 + 64));
  v6 = vand_s8(v5, (int8x8_t)0xFFD1FFFFF0000000);
  v5.i32[0] = v4;
  v5.i32[1] = *((_DWORD *)a3 + 18);
  *(int8x8_t *)(impl + 2140) = vorr_s8(v6, v5);
  *((_DWORD *)impl + 537) = *((_DWORD *)impl + 537) & 0xF0000000 | HIDWORD(v4);
  v7 = vorr_s8(vand_s8(*(int8x8_t *)(impl + 2156), (int8x8_t)0xFFD1FFFFFFF3FFFFLL), *(int8x8_t *)((char *)a3 + 64));
  *(int8x8_t *)(impl + 2156) = v7;
  v8 = *((_DWORD *)impl + 542);
  v9 = *((_DWORD *)a3 + 18);
  v10 = *((_QWORD *)impl + 335);
  if (v10 && (v11 = *(unsigned __int8 *)(v10 + 3230), v11 != 3))
    v12 = byte_232D767D0[v11];
  else
    v12 = 255;
  v13 = v12 >> (((unsigned __int32)v7.i32[1] >> 17) & 7);
  *((_DWORD *)impl + 540) = v7.i32[1] & 0xFFEFFFFF | ((v13 & 1) << 20);
  *((_DWORD *)impl + 542) = v8 & 0xFFC1FFFF | v9 & 0xFFEFFFFF | ((v13 & 1) << 20);
  *((_QWORD *)impl + 2644) |= 0x100000000000uLL;
  v14 = *((_WORD *)a3 + 28);
  *((_WORD *)impl + 1153) = v14;
  *((_WORD *)impl + 1152) |= v14;
  *((_WORD *)impl + 1154) = *((_WORD *)a3 + 29);
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  _DWORD *impl;
  unsigned int v4;

  impl = self->_impl;
  if (a3 >= 0xFF)
    v4 = 255;
  else
    v4 = a3;
  impl[586] = v4;
  impl[587] = v4;
  *((_BYTE *)impl + 2136) = v4;
  *((_BYTE *)impl + 2144) = v4;
  *((_QWORD *)impl + 2644) |= 0x100000000000uLL;
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  _DWORD *impl;
  unsigned int v5;
  unsigned int v6;

  impl = self->_impl;
  if (a3 >= 0xFF)
    v5 = 255;
  else
    v5 = a3;
  impl[586] = v5;
  if (a4 >= 0xFF)
    v6 = 255;
  else
    v6 = a4;
  impl[587] = v6;
  *((_BYTE *)impl + 2136) = v5;
  *((_BYTE *)impl + 2144) = v6;
  *((_QWORD *)impl + 2644) |= 0x100000000000uLL;
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  char *impl;
  uint64_t v5;
  char v6;
  unsigned int *v7;
  unsigned int v8;

  impl = (char *)self->_impl;
  *((_WORD *)impl + 1190) = a4 >> 2;
  *((_WORD *)impl + 1066) = (a4 >> 2) | (((_DWORD)a3 == 1) << 14) | (((_DWORD)a3 != 0) << 15);
  v5 = *((_QWORD *)impl + 2644);
  *((_QWORD *)impl + 2644) = v5 | 0x100000000000;
  if (a3 && impl[2382])
  {
    *((_QWORD *)impl + 2644) = v5 | 0x20100000000000;
    *((_QWORD *)impl + 2675) |= 0x80uLL;
  }
  v6 = impl[2383] | (a3 != 0);
  impl[2383] = v6;
  if (v6)
  {
    v7 = (unsigned int *)(impl + 21160);
    v8 = *((_DWORD *)impl + 5290);
    if ((v8 & 2) != 0)
    {
      if (*(_QWORD *)(*((_QWORD *)impl + 217) + 2944))
      {
        IOGPUResourceListAddResource();
        v8 = *v7;
      }
      *v7 = v8 & 0xFFFFFFFD;
    }
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  AGX::Framebuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setColorStoreAction(*((_QWORD *)self->_impl + 217), a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  _QWORD *impl;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  impl = self->_impl;
  v4 = impl[217];
  if ((*(_BYTE *)(v4 + 3653) & 1) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        *(_DWORD *)(v4 + 3648) &= ~0x100u;
        LODWORD(v6) = *(_QWORD *)(v4 + 3640) & 0xFFFFFEFF;
        HIDWORD(v6) = (*(_QWORD *)(v4 + 3640) | 0x10000000100uLL) >> 32;
        *(_QWORD *)(v4 + 3640) = v6;
        v7 = *(_WORD *)(v4 + 3116) | 2;
        goto LABEL_9;
      case 1uLL:
      case 5uLL:
        v5 = *(_DWORD *)(v4 + 3648) & 0xFFFFFEFF;
        goto LABEL_7;
      case 2uLL:
        *(_DWORD *)(v4 + 3648) |= 0x100u;
        *(_QWORD *)(v4 + 3640) &= 0xFFFFFEFFFFFFFEFFLL;
        goto LABEL_8;
      case 3uLL:
        v5 = *(_DWORD *)(v4 + 3648) | 0x100;
LABEL_7:
        *(_DWORD *)(v4 + 3648) = v5;
        LODWORD(v8) = *(_QWORD *)(v4 + 3640) | 0x100;
        HIDWORD(v8) = (*(_QWORD *)(v4 + 3640) & 0xFFFFFEFFFFFFFEFFLL) >> 32;
        *(_QWORD *)(v4 + 3640) = v8;
LABEL_8:
        v7 = *(_WORD *)(v4 + 3116) & 0xFFFD;
LABEL_9:
        *(_WORD *)(v4 + 3116) = v7;
        break;
      default:
        break;
    }
  }
  v9 = 0x1000000000000000;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v9 = 1;
  impl[2674] |= v9;
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  _QWORD *impl;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  impl = self->_impl;
  v4 = impl[217];
  if ((*(_BYTE *)(v4 + 3653) & 2) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        *(_DWORD *)(v4 + 3648) &= ~0x200u;
        LODWORD(v5) = *(_QWORD *)(v4 + 3640) & 0xFFFFFDFF;
        HIDWORD(v5) = (*(_QWORD *)(v4 + 3640) | 0x20000000200uLL) >> 32;
        *(_QWORD *)(v4 + 3640) = v5;
        v6 = *(_WORD *)(v4 + 3116) | 8;
        goto LABEL_9;
      case 1uLL:
        v7 = *(_DWORD *)(v4 + 3648) & 0xFFFFFDFF;
        goto LABEL_7;
      case 2uLL:
        *(_DWORD *)(v4 + 3648) |= 0x200u;
        *(_QWORD *)(v4 + 3640) &= 0xFFFFFDFFFFFFFDFFLL;
        goto LABEL_8;
      case 3uLL:
        v7 = *(_DWORD *)(v4 + 3648) | 0x200;
LABEL_7:
        *(_DWORD *)(v4 + 3648) = v7;
        LODWORD(v8) = *(_QWORD *)(v4 + 3640) | 0x200;
        HIDWORD(v8) = (*(_QWORD *)(v4 + 3640) & 0xFFFFFDFFFFFFFDFFLL) >> 32;
        *(_QWORD *)(v4 + 3640) = v8;
LABEL_8:
        v6 = *(_WORD *)(v4 + 3116) & 0xFFF7;
LABEL_9:
        *(_WORD *)(v4 + 3116) = v6;
        break;
      default:
        break;
    }
  }
  v9 = 0x2000000000000000;
  if (a3 != 1)
    v9 = 1;
  impl[2674] |= v9;
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  unint64_t *impl;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  impl = (unint64_t *)self->_impl;
  if (a3)
    v8 = *((_QWORD *)a3 + 67);
  else
    v8 = 0;
  v9 = (_DWORD *)impl[217];
  v10 = impl[185];
  v11 = 2 * a7;
  *(_QWORD *)&v9[v11 + 528] = v8;
  *(_QWORD *)&v9[v11 + 492] = a3;
  v9[746] |= 1 << a7;
  AGX::Framebuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::configurePBE((uint64_t)v9, v8, a5, a6, a4, (uint64_t)(v9 + 86), (uint64_t)&v9[a7 + 86], a7, 1, (v9[750] & (1 << a7)) != 0, (v9[749] & (1 << a7)) != 0, (v9[914] & (1 << a7)) != 0);
  IOGPUResourceListAddResource();
  if (v10)
    MTLResourceListAddResource();
  if (!*(_QWORD *)(impl[187] + 520))
  {
    if (*(_BYTE *)(impl[217] + 2989) || *((_BYTE *)impl + 2060))
    {
      v12 = impl[194] - impl[196];
      *(_DWORD *)(v12 + 12) = 1;
      if ((*(_BYTE *)(v12 + 8) & 4) != 0)
        **(_BYTE **)(*impl + 688) = 1;
    }
    else
    {
      AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 2644, 0, 1);
    }
  }
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  _QWORD *impl;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  impl = self->_impl;
  if (a3)
    v7 = *((_QWORD *)a3 + 67);
  else
    v7 = 0;
  v8 = impl[217];
  v9 = impl[185];
  *(_QWORD *)(v8 + 3808) = a3;
  *(_QWORD *)(v8 + 3824) = v7;
  *(_QWORD *)(v8 + 3856) = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v7, a4, a6, a5, 0);
  *(_DWORD *)(v8 + 3872) = 1;
  if (v9)
    MTLResourceListAddResource();
  IOGPUResourceListAddResource();
  if (!*(_QWORD *)(impl[187] + 520))
  {
    if (*(_BYTE *)(impl[217] + 2989) || *((_BYTE *)impl + 2060))
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 2644, 0, 1);
  }
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  unsigned int v6;
  _QWORD *impl;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;

  v6 = a5;
  impl = self->_impl;
  if (a3)
    v8 = *((_QWORD *)a3 + 67);
  else
    v8 = 0;
  v9 = impl[217];
  v10 = impl[185];
  *(_QWORD *)(v9 + 3816) = a3;
  *(_QWORD *)(v9 + 3832) = v8;
  v11 = *(_QWORD *)(v8 + 208);
  v12 = *(_DWORD *)(v11 + 24) >= 2u && *(_DWORD *)(v11 + 80) != 0;
  *(_QWORD *)(v9 + 3864) = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v8, a4, a6, v6, v12);
  *(_DWORD *)(v9 + 3876) = 1;
  if (v10)
    MTLResourceListAddResource();
  IOGPUResourceListAddResource();
  if (!*(_QWORD *)(impl[187] + 520))
  {
    if (*(_BYTE *)(impl[217] + 2989) || *((_BYTE *)impl + 2060))
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 2644, 0, 1);
  }
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  _QWORD *impl;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;

  impl = self->_impl;
  if (a3)
    v9 = *((_QWORD *)a3 + 67);
  else
    v9 = 0;
  v10 = (_DWORD *)impl[217];
  v11 = impl[185];
  v12 = 2 * a8;
  *(_QWORD *)&v10[v12 + 528] = v9;
  *(_QWORD *)&v10[v12 + 492] = a3;
  v10[746] |= 1 << a8;
  AGX::Framebuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::configurePBE((uint64_t)v10, v9, a5, a6, a4, (uint64_t)(v10 + 86), (uint64_t)&v10[a8 + 86], a8, 1, (v10[750] & (1 << a8)) != 0, a7, (v10[914] & (1 << a8)) != 0);
  IOGPUResourceListAddResource();
  if (v11)
    MTLResourceListAddResource();
  if (!*(_QWORD *)(impl[187] + 520))
  {
    if (*(_BYTE *)(impl[217] + 2989) || *((_BYTE *)impl + 2060))
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 2644, 0, 1);
  }
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  _QWORD *impl;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  impl = self->_impl;
  if (a3)
    v8 = *((_QWORD *)a3 + 67);
  else
    v8 = 0;
  v9 = impl[217];
  v10 = impl[185];
  *(_QWORD *)(v9 + 3808) = a3;
  *(_QWORD *)(v9 + 3824) = v8;
  *(_QWORD *)(v9 + 3856) = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v8, a4, a6, a5, 0);
  *(_DWORD *)(v9 + 3872) = 1;
  if (v10)
    MTLResourceListAddResource();
  IOGPUResourceListAddResource();
  if (!*(_QWORD *)(impl[187] + 520))
  {
    if (*(_BYTE *)(impl[217] + 2989) || *((_BYTE *)impl + 2060))
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 2644, 0, 1);
  }
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  unsigned int v7;
  _QWORD *impl;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  v7 = a5;
  impl = self->_impl;
  if (a3)
    v9 = *((_QWORD *)a3 + 67);
  else
    v9 = 0;
  v10 = impl[217];
  v11 = impl[185];
  *(_QWORD *)(v10 + 3816) = a3;
  *(_QWORD *)(v10 + 3832) = v9;
  v12 = *(_QWORD *)(v9 + 208);
  v13 = *(_DWORD *)(v12 + 24) >= 2u && *(_DWORD *)(v12 + 80) != 0;
  *(_QWORD *)(v10 + 3864) = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v9, a4, a6, v7, v13);
  *(_DWORD *)(v10 + 3876) = 1;
  if (v11)
    MTLResourceListAddResource();
  IOGPUResourceListAddResource();
  if (!*(_QWORD *)(impl[187] + 520))
  {
    if (*(_BYTE *)(impl[217] + 2989) || *((_BYTE *)impl + 2060))
      fwrite("Failed to satisfy render split.\n", 0x20uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::restartRenderPass((uint64_t)impl, impl + 2644, 0, 1);
  }
}

- (void)setDepthCleared
{
  _QWORD *impl;

  impl = self->_impl;
  if ((impl[288] & 1) == 0)
    *(_WORD *)(impl[217] + 3114) |= 1u;
}

- (void)setStencilCleared
{
  _QWORD *impl;

  impl = self->_impl;
  if ((impl[288] & 4) == 0)
    *(_WORD *)(impl[217] + 3114) |= 4u;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  int v5;
  int v6;
  char *impl;
  int v10;
  _BOOL8 v11;
  _DWORD *v12;
  _DWORD *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int *v18;
  int v19;

  v5 = a5;
  v6 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  if (impl[2384])
    v10 = a4;
  else
    v10 = 0;
  v11 = *((_DWORD *)impl + 430) != 0;
  *((_DWORD *)impl + 430) = 0;
  if (((*(_QWORD *)(*((_QWORD *)impl + 334) + 1288) | *(_QWORD *)(*((_QWORD *)impl + 334) + 1264) | *(_QWORD *)(*((_QWORD *)impl + 334) + 2832)) & 0x700000000000) == 0)
  {
    *((_QWORD *)impl + 2644) |= v11;
    if (!impl[2529])
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)impl + 2620) |= 0x700000000000uLL;
  *((_QWORD *)impl + 2644) |= v11 | 0x40;
  *((_QWORD *)impl + 449) = 0;
  v12 = (_DWORD *)*((_QWORD *)impl + 20);
  v13 = v12 + 2;
  if ((unint64_t)(v12 + 2) <= *((_QWORD *)impl + 19))
    goto LABEL_6;
  v19 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
  v12 = (_DWORD *)*((_QWORD *)impl + 20);
  if (v19)
  {
    v13 = v12 + 2;
    if ((unint64_t)(v12 + 2) > *((_QWORD *)impl + 19))
      abort();
LABEL_6:
    *((_QWORD *)impl + 21) = v13;
  }
  v14 = (char *)v12 + *((_QWORD *)impl + 22);
  *((_QWORD *)impl + 20) = v12 + 2;
  *((_QWORD *)impl + 447) = v14;
  *((_QWORD *)impl + 448) = v14 + 4;
  *v12 = v10;
  v12[1] = 0;
  v15 = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + (int)*MEMORY[0x24BE51650];
  *((_QWORD *)impl + 1972) = v15;
  *((_QWORD *)impl + 1971) = v15;
  if (impl[2529])
  {
LABEL_8:
    impl[2529] = 0;
    *((_QWORD *)impl + 2644) |= 1uLL;
  }
LABEL_9:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)(impl + 2704), (_QWORD *)impl + 738, (uint64_t)(impl + 20960), 0);
  v16 = 4 * a3;
  v17 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v16) | 0x6E440000;
  LODWORD(v16) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v16);
  v18 = (int *)*((_QWORD *)impl + 8);
  *v18 = v17;
  v18[1] = v5;
  v18[2] = 0;
  v18[3] = v6;
  v18[4] = v16;
  *((_QWORD *)impl + 8) = v18 + 5;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  int v6;
  int v7;
  int v8;
  char *impl;
  int v12;
  _BOOL8 v13;
  _DWORD *v14;
  _DWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int *v20;
  int v21;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  if (impl[2384])
    v12 = a4;
  else
    v12 = 0;
  v13 = *((_DWORD *)impl + 430) != 0;
  *((_DWORD *)impl + 430) = 0;
  if (((*(_QWORD *)(*((_QWORD *)impl + 334) + 1288) | *(_QWORD *)(*((_QWORD *)impl + 334) + 1264) | *(_QWORD *)(*((_QWORD *)impl + 334) + 2832)) & 0x700000000000) == 0)
  {
    *((_QWORD *)impl + 2644) |= v13;
    if (!impl[2529])
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)impl + 2620) |= 0x700000000000uLL;
  *((_QWORD *)impl + 2644) |= v13 | 0x40;
  *((_QWORD *)impl + 449) = 0;
  v14 = (_DWORD *)*((_QWORD *)impl + 20);
  v15 = v14 + 2;
  if ((unint64_t)(v14 + 2) <= *((_QWORD *)impl + 19))
    goto LABEL_6;
  v21 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
  v14 = (_DWORD *)*((_QWORD *)impl + 20);
  if (v21)
  {
    v15 = v14 + 2;
    if ((unint64_t)(v14 + 2) > *((_QWORD *)impl + 19))
      abort();
LABEL_6:
    *((_QWORD *)impl + 21) = v15;
  }
  v16 = (char *)v14 + *((_QWORD *)impl + 22);
  *((_QWORD *)impl + 20) = v14 + 2;
  *((_QWORD *)impl + 447) = v16;
  *((_QWORD *)impl + 448) = v16 + 4;
  *v14 = v12;
  v14[1] = 0;
  v17 = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + (int)*MEMORY[0x24BE51650];
  *((_QWORD *)impl + 1972) = v17;
  *((_QWORD *)impl + 1971) = v17;
  if (impl[2529])
  {
LABEL_8:
    impl[2529] = 0;
    *((_QWORD *)impl + 2644) |= 1uLL;
  }
LABEL_9:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)(impl + 2704), (_QWORD *)impl + 738, (uint64_t)(impl + 20960), 0);
  v18 = 4 * a3;
  v19 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v18) | 0x6E440000;
  LODWORD(v18) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v18);
  v20 = (int *)*((_QWORD *)impl + 8);
  *v20 = v19;
  v20[1] = v7;
  v20[2] = v6 - 1;
  v20[3] = v8;
  v20[4] = v18;
  *((_QWORD *)impl + 8) = v20 + 5;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  int v7;
  int v8;
  int v9;
  int v10;
  char *impl;
  int v14;
  int v15;
  _BOOL8 v16;
  _DWORD *v17;
  _DWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int *v23;
  int v24;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  if (impl[2384])
    v14 = a4;
  else
    v14 = 0;
  v15 = a7 != 0;
  v16 = *((_DWORD *)impl + 430) != v15;
  *((_DWORD *)impl + 430) = v15;
  if (((*(_QWORD *)(*((_QWORD *)impl + 334) + 1288) | *(_QWORD *)(*((_QWORD *)impl + 334) + 1264) | *(_QWORD *)(*((_QWORD *)impl + 334) + 2832)) & 0x700000000000) == 0)
  {
    *((_QWORD *)impl + 2644) |= v16;
    if (!impl[2529])
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_QWORD *)impl + 2620) |= 0x700000000000uLL;
  *((_QWORD *)impl + 2644) |= v16 | 0x40;
  *((_QWORD *)impl + 449) = a7;
  v17 = (_DWORD *)*((_QWORD *)impl + 20);
  v18 = v17 + 2;
  if ((unint64_t)(v17 + 2) <= *((_QWORD *)impl + 19))
    goto LABEL_6;
  v24 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
  v17 = (_DWORD *)*((_QWORD *)impl + 20);
  if (v24)
  {
    v18 = v17 + 2;
    if ((unint64_t)(v17 + 2) > *((_QWORD *)impl + 19))
      abort();
LABEL_6:
    *((_QWORD *)impl + 21) = v18;
  }
  v19 = (char *)v17 + *((_QWORD *)impl + 22);
  *((_QWORD *)impl + 20) = v17 + 2;
  *((_QWORD *)impl + 447) = v19;
  *((_QWORD *)impl + 448) = v19 + 4;
  *v17 = v14;
  v17[1] = v7;
  v20 = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + (int)*MEMORY[0x24BE51650];
  *((_QWORD *)impl + 1972) = v20;
  *((_QWORD *)impl + 1971) = v20;
  if (impl[2529])
  {
LABEL_8:
    impl[2529] = 0;
    *((_QWORD *)impl + 2644) |= 1uLL;
  }
LABEL_9:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)(impl + 2704), (_QWORD *)impl + 738, (uint64_t)(impl + 20960), 0);
  v21 = 4 * a3;
  v22 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v21) | 0x6E440000;
  LODWORD(v21) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v21);
  v23 = (int *)*((_QWORD *)impl + 8);
  *v23 = v22;
  v23[1] = v9;
  v23[2] = v8 - 1;
  v23[3] = v10;
  v23[4] = v21;
  *((_QWORD *)impl + 8) = v23 + 5;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (BOOL)isMemorylessRender
{
  return *(_BYTE *)(*((_QWORD *)self->_impl + 217) + 2989);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  unsigned int v7;
  int v10;
  char *impl;
  _BOOL8 v14;
  int *v15;
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;

  v7 = a7;
  v10 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  v14 = *((_DWORD *)impl + 430) != 0;
  *((_DWORD *)impl + 430) = 0;
  v15 = (int *)MEMORY[0x24BE51650];
  if (((*(_QWORD *)(*((_QWORD *)impl + 334) + 1288) | *(_QWORD *)(*((_QWORD *)impl + 334) + 1264) | *(_QWORD *)(*((_QWORD *)impl + 334) + 2832)) & 0x700000000000) != 0)
  {
    *((_QWORD *)impl + 2620) |= 0x700000000000uLL;
    *((_QWORD *)impl + 2644) |= v14 | 0x40;
    *((_QWORD *)impl + 449) = 0;
    v16 = (_QWORD *)*((_QWORD *)impl + 20);
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) > *((_QWORD *)impl + 19))
    {
      v28 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      v16 = (_QWORD *)*((_QWORD *)impl + 20);
      if (!v28)
      {
LABEL_4:
        v18 = (char *)v16 + *((_QWORD *)impl + 22);
        *((_QWORD *)impl + 20) = v16 + 1;
        *((_QWORD *)impl + 447) = v18;
        *((_QWORD *)impl + 448) = v18 + 4;
        *v16 = 0;
        v19 = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + *v15;
        *((_QWORD *)impl + 1972) = v19;
        *((_QWORD *)impl + 1971) = v19;
        if (impl[2529])
          goto LABEL_6;
        goto LABEL_5;
      }
      v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) > *((_QWORD *)impl + 19))
        abort();
    }
    *((_QWORD *)impl + 21) = v17;
    goto LABEL_4;
  }
  *((_QWORD *)impl + 2644) |= v14;
  if (!impl[2529])
  {
LABEL_5:
    impl[2529] = 1;
    *((_QWORD *)impl + 2644) |= 1uLL;
  }
LABEL_6:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  v20 = *(_QWORD *)((char *)a6 + *v15 + 8);
  if (*((id *)impl + 319) != a6)
  {
    IOGPUResourceListAddResource();
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    *((_QWORD *)impl + 319) = a6;
  }
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)(impl + 2704), (_QWORD *)impl + 738, (uint64_t)(impl + 20960), 0);
  if (*(_BYTE *)(*((_QWORD *)impl + 217) + 2932))
  {
    if (a3 - 2 >= 7)
      v21 = 0x10000000;
    else
      v21 = qword_232D77DB0[a3 - 2];
  }
  else
  {
    v21 = 268435488;
    if (!impl[2531])
      v21 = 0x10000000;
  }
  LODWORD(v22) = *((_DWORD *)impl + 633);
  if (v22 >= 0xFFFF)
    v23 = 0xFFFF;
  else
    v23 = *((_DWORD *)impl + 633);
  if (a5 == 1)
    v22 = v22;
  else
    v22 = v23;
  v24 = v20 + v7;
  v25 = v21 | *(_QWORD *)(*((_QWORD *)impl + 334)
                        + 16 * (impl[2528] | (2 * *((_DWORD *)impl + 634)))
                        + 3432) & 0xE23FFFFFLL | (v22 << 32);
  v26 = *((_QWORD *)impl + 8);
  *(_QWORD *)v26 = v25;
  v27 = 4 * a3;
  LODWORD(v25) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v27) | AGX::VDMEncoderGen1<kAGXRevG9>::IndexTypeToVDMCTRLType[a5] | 0x7E400000 | HIDWORD(v24);
  LODWORD(v27) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v27);
  *(_DWORD *)(v26 + 8) = v25;
  *(_DWORD *)(v26 + 12) = v24;
  *(_DWORD *)(v26 + 16) = v10;
  *(_DWORD *)(v26 + 20) = 0;
  *(_DWORD *)(v26 + 24) = 0;
  *(_DWORD *)(v26 + 28) = v27;
  *((_QWORD *)impl + 8) = v26 + 32;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  int v8;
  unsigned int v9;
  int v12;
  char *impl;
  _BOOL8 v16;
  int *v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;

  v8 = a8;
  v9 = a7;
  v12 = a4;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  v16 = *((_DWORD *)impl + 430) != 0;
  *((_DWORD *)impl + 430) = 0;
  v17 = (int *)MEMORY[0x24BE51650];
  if (((*(_QWORD *)(*((_QWORD *)impl + 334) + 1288) | *(_QWORD *)(*((_QWORD *)impl + 334) + 1264) | *(_QWORD *)(*((_QWORD *)impl + 334) + 2832)) & 0x700000000000) != 0)
  {
    *((_QWORD *)impl + 2620) |= 0x700000000000uLL;
    *((_QWORD *)impl + 2644) |= v16 | 0x40;
    *((_QWORD *)impl + 449) = 0;
    v18 = (_QWORD *)*((_QWORD *)impl + 20);
    v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) > *((_QWORD *)impl + 19))
    {
      v31 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      v18 = (_QWORD *)*((_QWORD *)impl + 20);
      if (!v31)
      {
LABEL_4:
        v20 = (char *)v18 + *((_QWORD *)impl + 22);
        *((_QWORD *)impl + 20) = v18 + 1;
        *((_QWORD *)impl + 447) = v20;
        *((_QWORD *)impl + 448) = v20 + 4;
        *v18 = 0;
        v21 = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + *v17;
        *((_QWORD *)impl + 1972) = v21;
        *((_QWORD *)impl + 1971) = v21;
        if (impl[2529])
          goto LABEL_6;
        goto LABEL_5;
      }
      v19 = v18 + 1;
      if ((unint64_t)(v18 + 1) > *((_QWORD *)impl + 19))
        abort();
    }
    *((_QWORD *)impl + 21) = v19;
    goto LABEL_4;
  }
  *((_QWORD *)impl + 2644) |= v16;
  if (!impl[2529])
  {
LABEL_5:
    impl[2529] = 1;
    *((_QWORD *)impl + 2644) |= 1uLL;
  }
LABEL_6:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  v22 = *(_QWORD *)((char *)a6 + *v17 + 8);
  if (*((id *)impl + 319) != a6)
  {
    IOGPUResourceListAddResource();
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    *((_QWORD *)impl + 319) = a6;
  }
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)(impl + 2704), (_QWORD *)impl + 738, (uint64_t)(impl + 20960), 0);
  if (*(_BYTE *)(*((_QWORD *)impl + 217) + 2932))
  {
    if (a3 - 2 >= 7)
      v23 = 0x10000000;
    else
      v23 = qword_232D77DB0[a3 - 2];
  }
  else
  {
    v23 = 268435488;
    if (!impl[2531])
      v23 = 0x10000000;
  }
  LODWORD(v24) = *((_DWORD *)impl + 633);
  if (v24 >= 0xFFFF)
    v25 = 0xFFFF;
  else
    v25 = *((_DWORD *)impl + 633);
  if (a5 == 1)
    v24 = v24;
  else
    v24 = v25;
  v26 = v22 + v9;
  v27 = v23 | *(_QWORD *)(*((_QWORD *)impl + 334)
                        + 16 * (impl[2528] | (2 * *((_DWORD *)impl + 634)))
                        + 3432) & 0xE23FFFFFLL | (v24 << 32);
  v28 = *((_QWORD *)impl + 8);
  *(_QWORD *)v28 = v27;
  v29 = 4 * a3;
  v30 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v29) | AGX::VDMEncoderGen1<kAGXRevG9>::IndexTypeToVDMCTRLType[a5] | 0x7E400000 | HIDWORD(v26);
  LODWORD(v29) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v29);
  *(_DWORD *)(v28 + 8) = v30;
  *(_DWORD *)(v28 + 12) = v26;
  *(_DWORD *)(v28 + 16) = v12;
  *(_QWORD *)(v28 + 20) = (v8 - 1);
  *(_DWORD *)(v28 + 28) = v29;
  *((_QWORD *)impl + 8) = v28 + 32;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  unsigned int v10;
  char *impl;
  int v16;
  _BOOL8 v17;
  int *v18;
  _DWORD *v19;
  _DWORD *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;

  v33 = a8;
  v34 = a4;
  v10 = a7;
  impl = (char *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  v16 = a10 != 0;
  v17 = *((_DWORD *)impl + 430) != v16;
  *((_DWORD *)impl + 430) = v16;
  v18 = (int *)MEMORY[0x24BE51650];
  if (((*(_QWORD *)(*((_QWORD *)impl + 334) + 1288) | *(_QWORD *)(*((_QWORD *)impl + 334) + 1264) | *(_QWORD *)(*((_QWORD *)impl + 334) + 2832)) & 0x700000000000) != 0)
  {
    *((_QWORD *)impl + 2620) |= 0x700000000000uLL;
    *((_QWORD *)impl + 2644) |= v17 | 0x40;
    *((_QWORD *)impl + 449) = a10;
    v19 = (_DWORD *)*((_QWORD *)impl + 20);
    v20 = v19 + 2;
    if ((unint64_t)(v19 + 2) > *((_QWORD *)impl + 19))
    {
      v32 = AGX::DataBufferAllocator<34ul>::growNoInline(impl + 16, 3, 0);
      v19 = (_DWORD *)*((_QWORD *)impl + 20);
      if (!v32)
      {
LABEL_4:
        v21 = (char *)v19 + *((_QWORD *)impl + 22);
        *((_QWORD *)impl + 20) = v19 + 2;
        *((_QWORD *)impl + 447) = v21;
        *((_QWORD *)impl + 448) = v21 + 4;
        *v19 = a9;
        v19[1] = a10;
        v22 = *(_QWORD *)(*((_QWORD *)impl + 5) + 224) + *v18;
        *((_QWORD *)impl + 1972) = v22;
        *((_QWORD *)impl + 1971) = v22;
        if (impl[2529])
          goto LABEL_6;
        goto LABEL_5;
      }
      v20 = v19 + 2;
      if ((unint64_t)(v19 + 2) > *((_QWORD *)impl + 19))
        abort();
    }
    *((_QWORD *)impl + 21) = v20;
    goto LABEL_4;
  }
  *((_QWORD *)impl + 2644) |= v17;
  if (!impl[2529])
  {
LABEL_5:
    impl[2529] = 1;
    *((_QWORD *)impl + 2644) |= 1uLL;
  }
LABEL_6:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  v23 = *(_QWORD *)((char *)a6 + *v18 + 8);
  if (*((id *)impl + 319) != a6)
  {
    IOGPUResourceListAddResource();
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    *((_QWORD *)impl + 319) = a6;
  }
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)(impl + 2704), (_QWORD *)impl + 738, (uint64_t)(impl + 20960), 0);
  if (*(_BYTE *)(*((_QWORD *)impl + 217) + 2932))
  {
    if (a3 - 2 >= 7)
      v24 = 0x10000000;
    else
      v24 = qword_232D77DB0[a3 - 2];
  }
  else
  {
    v24 = 268435488;
    if (!impl[2531])
      v24 = 0x10000000;
  }
  LODWORD(v25) = *((_DWORD *)impl + 633);
  if (v25 >= 0xFFFF)
    v26 = 0xFFFF;
  else
    v26 = *((_DWORD *)impl + 633);
  if (a5 == 1)
    v25 = v25;
  else
    v25 = v26;
  v27 = v23 + v10;
  v28 = v24 | *(_QWORD *)(*((_QWORD *)impl + 334)
                        + 16 * (impl[2528] | (2 * *((_DWORD *)impl + 634)))
                        + 3432) & 0xE23FFFFFLL | (v25 << 32);
  v29 = *((_QWORD *)impl + 8);
  *(_QWORD *)v29 = v28;
  v30 = 4 * a3;
  v31 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v30) | AGX::VDMEncoderGen1<kAGXRevG9>::IndexTypeToVDMCTRLType[a5] | 0x7E400000 | HIDWORD(v27);
  LODWORD(v30) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v30);
  *(_DWORD *)(v29 + 8) = v31;
  *(_DWORD *)(v29 + 12) = v27;
  *(_DWORD *)(v29 + 16) = v34;
  *(_DWORD *)(v29 + 20) = v33 - 1;
  *(_DWORD *)(v29 + 24) = a9;
  *(_DWORD *)(v29 + 28) = v30;
  *((_QWORD *)impl + 8) = v29 + 32;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  unsigned int v5;
  void *impl;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int *v14;
  char *v15;
  char *v16;

  v5 = a5;
  impl = self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeIndirectNonindexedParameters((uint64_t)impl, (uint64_t)a4, a5);
  if (*((_BYTE *)impl + 2529))
  {
    *((_BYTE *)impl + 2529) = 0;
    *((_QWORD *)impl + 2644) |= 1uLL;
  }
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  v10 = *(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 8);
  if (*((id *)impl + 320) != a4)
  {
    IOGPUResourceListAddResource();
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    *((_QWORD *)impl + 320) = a4;
  }
  v11 = v10 + v5;
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)impl + 2704, (_QWORD *)impl + 738, (uint64_t)impl + 20960, 0);
  *((_QWORD *)impl + 2675) |= 1uLL;
  v12 = 4 * a3;
  v13 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v12) | 0x60C40000;
  LODWORD(v12) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v12);
  v14 = (unsigned int *)*((_QWORD *)impl + 8);
  v15 = (char *)v14 + *((_QWORD *)impl + 10);
  *((_QWORD *)impl + 8) = v14 + 12;
  v16 = v15 + 32;
  v15 += 48;
  *v14 = HIDWORD(v16) | 0x8D000000;
  v14[1] = v16 & 0xFFFFFFFC;
  v14[2] = (unint64_t)(v11 + 4) >> 32;
  v14[3] = (v11 + 4) & 0xFFFFFFFE;
  v14[4] = HIDWORD(v15) | 0x8A000000;
  v14[5] = v15 & 0xFFFFFFFC;
  v14[6] = (unint64_t)(v11 + 6) >> 32;
  v14[7] = (v11 + 6) & 0xFFFFFFFE;
  v14[8] = v13;
  v14[9] = HIDWORD(v11);
  v14[10] = v11 & 0xFFFFFFFC;
  v14[11] = v12;
  *((_BYTE *)impl + 1544) = 0;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  unsigned int v8;
  unsigned __int8 *impl;
  int *v15;
  char *v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  unsigned int v39;

  v8 = a8;
  v39 = a6;
  impl = (unsigned __int8 *)self->_impl;
  *((_DWORD *)impl + 382) = *((_DWORD *)impl + 381);
  v15 = (int *)MEMORY[0x24BE51650];
  v16 = (char *)a7 + (int)*MEMORY[0x24BE51650];
  v17 = *((_QWORD *)v16 + 1);
  v18 = *((_DWORD *)impl + 430) != 2;
  *((_DWORD *)impl + 430) = 2;
  if (((*(_QWORD *)(*((_QWORD *)impl + 334) + 1288) | *(_QWORD *)(*((_QWORD *)impl + 334) + 1264) | *(_QWORD *)(*((_QWORD *)impl + 334) + 2832)) & 0x700000000000) != 0)
  {
    *((_QWORD *)impl + 2620) |= 0x700000000000uLL;
    v19 = *((_QWORD *)impl + 2644) | v18 | 0x40;
    *((_QWORD *)impl + 2644) = v19;
    v20 = v17 + a8;
    *((_QWORD *)impl + 447) = v20 + 12;
    *((_QWORD *)impl + 448) = v20 + 16;
    *((int64x2_t *)impl + 255) = vaddq_s64(*((int64x2_t *)impl + 255), (int64x2_t)xmmword_232D73CD0);
    *((_QWORD *)impl + 1972) = v16;
    *((_QWORD *)impl + 1971) = v16;
    if (impl[2529])
      goto LABEL_4;
    goto LABEL_3;
  }
  v19 = *((_QWORD *)impl + 2644) | v18;
  *((_QWORD *)impl + 2644) = v19;
  if (!impl[2529])
  {
LABEL_3:
    impl[2529] = 1;
    *((_QWORD *)impl + 2644) = v19 | 1;
  }
LABEL_4:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType((uint64_t)impl, a3);
  v21 = *v15;
  v22 = *(_QWORD *)((char *)a5 + v21 + 8);
  if (*((id *)impl + 319) != a5)
  {
    IOGPUResourceListAddResource();
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    *((_QWORD *)impl + 319) = a5;
    v21 = *v15;
  }
  v23 = *(_QWORD *)((char *)a7 + v21 + 8);
  if (*((id *)impl + 320) != a7)
  {
    IOGPUResourceListAddResource();
    if (*((_QWORD *)impl + 185))
      MTLResourceListAddResource();
    *((_QWORD *)impl + 320) = a7;
  }
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState((uint64_t)impl, *((int8x16_t **)impl + 334), *((int8x16_t **)impl + 335), (uint64_t)(impl + 2704), (_QWORD *)impl + 738, (uint64_t)(impl + 20960), 0);
  if (*(_BYTE *)(*((_QWORD *)impl + 217) + 2932))
  {
    if (a3 - 2 >= 7)
      v24 = 0x10000000;
    else
      v24 = qword_232D77DB0[a3 - 2];
  }
  else
  {
    v24 = 0x10000000;
    if (impl[2531])
      v24 = 268435488;
  }
  v25 = *((_DWORD *)impl + 633);
  if (v25 >= 0xFFFF)
    LODWORD(v26) = 0xFFFF;
  else
    LODWORD(v26) = *((_DWORD *)impl + 633);
  if (a4 == 1)
    v26 = v25;
  else
    v26 = v26;
  v27 = v23 + v8;
  v28 = v22 + v39;
  v29 = v24 | *(_QWORD *)(*((_QWORD *)impl + 334)
                        + 16 * (impl[2528] | (2 * *((_DWORD *)impl + 634)))
                        + 3432) & 0xE23FFFFFLL | (v26 << 32);
  v30 = *((_QWORD *)impl + 8);
  *(_QWORD *)v30 = v29;
  *((_QWORD *)impl + 2675) |= 1uLL;
  v31 = 4 * a3;
  v32 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v31) | AGX::VDMEncoderGen1<kAGXRevG9>::IndexTypeToVDMCTRLType[a4] | 0x70C00000 | HIDWORD(v28);
  v33 = HIDWORD(v27);
  v34 = v27 & 0xFFFFFFFC;
  LODWORD(v31) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v31);
  v35 = *((_QWORD *)impl + 10) + v30 + 8;
  *((_QWORD *)impl + 8) = v30 + 60;
  v36 = v35 + 32;
  v35 += 52;
  v37 = (v27 + 4) >> 32;
  v38 = (v27 + 4) & 0xFFFFFFFE;
  v27 += 6;
  *(_DWORD *)(v30 + 8) = HIDWORD(v36) | 0x8D000000;
  *(_DWORD *)(v30 + 12) = v36 & 0xFFFFFFFC;
  *(_DWORD *)(v30 + 16) = v37;
  *(_DWORD *)(v30 + 20) = v38;
  *(_DWORD *)(v30 + 24) = HIDWORD(v35) | 0x8A000000;
  *(_DWORD *)(v30 + 28) = v35 & 0xFFFFFFFC;
  *(_DWORD *)(v30 + 32) = HIDWORD(v27);
  *(_DWORD *)(v30 + 36) = v27 & 0xFFFFFFFE;
  *(_DWORD *)(v30 + 40) = v32;
  *(_DWORD *)(v30 + 44) = v28;
  *(_DWORD *)(v30 + 48) = v33;
  *(_DWORD *)(v30 + 52) = v34;
  *(_DWORD *)(v30 + 56) = v31;
  impl[1544] = 0;
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  char v4;
  _QWORD *impl;
  int *v7;
  AGX::FenceList *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  v7 = (int *)MEMORY[0x24BE51630];
  if ((v4 & 1) != 0)
  {
    v8 = (AGX::FenceList *)impl[2646];
    if (!v8)
    {
      v13 = operator new();
      v14 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v13, 0x208uLL);
      v8 = (AGX::FenceList *)v13;
      *(_QWORD *)(v13 + 520) = v14;
      *(_DWORD *)(v13 + 528) = 0;
      impl[2646] = v13;
    }
    AGX::FenceList::insertFence(v8, *(unsigned __int16 *)((char *)a3 + *v7));
  }
  if ((v4 & 6) != 0)
  {
    v9 = impl[2647];
    if (!v9)
    {
      v9 = operator new();
      v12 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v9, 0x208uLL);
      *(_QWORD *)(v9 + 520) = v12;
      *(_DWORD *)(v9 + 528) = 0;
      impl[2647] = v9;
    }
    AGX::FenceList::insertFence((AGX::FenceList *)v9, *(unsigned __int16 *)((char *)a3 + *v7));
  }
  if ((v4 & 8) != 0)
  {
    v10 = impl[2648];
    if (!v10)
    {
      v10 = operator new();
      v15 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v10, 0x208uLL);
      *(_QWORD *)(v10 + 520) = v15;
      *(_DWORD *)(v10 + 528) = 0;
      impl[2648] = v10;
    }
    AGX::FenceList::insertFence((AGX::FenceList *)v10, *(unsigned __int16 *)((char *)a3 + *v7));
  }
  if ((v4 & 0x10) != 0)
  {
    v11 = impl[2649];
    if (!v11)
    {
      v11 = operator new();
      v16 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v11, 0x208uLL);
      *(_QWORD *)(v11 + 520) = v16;
      *(_DWORD *)(v11 + 528) = 0;
      impl[2649] = v11;
    }
    AGX::FenceList::insertFence((AGX::FenceList *)v11, *(unsigned __int16 *)((char *)a3 + *v7));
  }
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  char v4;
  _QWORD *impl;
  int *v7;
  AGX::FenceList *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  impl = self->_impl;
  if (impl[185])
    MTLResourceListAddResource();
  v7 = (int *)MEMORY[0x24BE51630];
  if ((v4 & 1) != 0)
  {
    v8 = (AGX::FenceList *)impl[2650];
    if (!v8)
    {
      v13 = operator new();
      v14 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v13, 0x208uLL);
      v8 = (AGX::FenceList *)v13;
      *(_QWORD *)(v13 + 520) = v14;
      *(_DWORD *)(v13 + 528) = 0;
      impl[2650] = v13;
    }
    AGX::FenceList::insertFence(v8, *(unsigned __int16 *)((char *)a3 + *v7));
  }
  if ((v4 & 6) != 0)
  {
    v9 = impl[2651];
    if (!v9)
    {
      v9 = operator new();
      v12 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v9, 0x208uLL);
      *(_QWORD *)(v9 + 520) = v12;
      *(_DWORD *)(v9 + 528) = 0;
      impl[2651] = v9;
    }
    AGX::FenceList::insertFence((AGX::FenceList *)v9, *(unsigned __int16 *)((char *)a3 + *v7));
  }
  if ((v4 & 8) != 0)
  {
    v10 = impl[2652];
    if (!v10)
    {
      v10 = operator new();
      v15 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v10, 0x208uLL);
      *(_QWORD *)(v10 + 520) = v15;
      *(_DWORD *)(v10 + 528) = 0;
      impl[2652] = v10;
    }
    AGX::FenceList::insertFence((AGX::FenceList *)v10, *(unsigned __int16 *)((char *)a3 + *v7));
  }
  if ((v4 & 0x10) != 0)
  {
    v11 = impl[2653];
    if (!v11)
    {
      v11 = operator new();
      v16 = *(_QWORD *)(impl[182] + 808) + 6192;
      bzero((void *)v11, 0x208uLL);
      *(_QWORD *)(v11 + 520) = v16;
      *(_DWORD *)(v11 + 528) = 0;
      impl[2653] = v11;
    }
    AGX::FenceList::insertFence((AGX::FenceList *)v11, *(unsigned __int16 *)((char *)a3 + *v7));
  }
}

- (void)setTessellationFactorScale:(float)a3
{
  *((float *)self->_impl + 464) = a3;
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  int v5;
  _QWORD *impl;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  v5 = a5;
  impl = self->_impl;
  if (a3)
  {
    v7 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v8 = *((_QWORD *)v7 + 2) & 0xFFFFFFFFFFFFFFLL;
    v9 = (_QWORD *)impl[231];
    v9[438] = *((_QWORD *)v7 + 1) + a4;
    v9[501] = v8;
    v9[1962] = v7;
    v10 = (_QWORD *)impl[231];
    if (v10[185])
    {
      MTLResourceListAddResource();
      v10 = (_QWORD *)impl[231];
    }
  }
  else
  {
    *(_QWORD *)(impl[231] + 15696) = 0;
    v10 = (_QWORD *)impl[231];
    v10[438] = 0;
    v10[501] = 0;
  }
  v10[2620] |= 0x800000000uLL;
  v10[2623] |= 0x800000000uLL;
  v10[2644] |= 0xC0uLL;
  *((_DWORD *)impl + 465) = v5;
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  _DWORD *impl;

  impl = self->_impl;
  impl[382] = impl[381];
  impl[2831] = a3;
  impl[2822] = a6 != 0;
  impl[2820] = a9;
  *((_QWORD *)impl + 2625) |= 0x20uLL;
  *((_QWORD *)impl + 2644) |= 0x40uLL;
  AGX::SWTessellationContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawPatches((uint64_t)(impl + 460), (uint64_t)a2, a4, a5, (uint64_t)a6, a7, 0, 0, a8, a9);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  _DWORD *impl;
  int v8;

  impl = self->_impl;
  v8 = impl[381];
  impl[382] = v8;
  impl[2831] = a3;
  impl[2822] = a4 != 0;
  *((_QWORD *)impl + 2625) |= 0x20uLL;
  *((_QWORD *)impl + 2644) |= 0x40uLL;
  impl[383] = v8;
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  _DWORD *impl;

  impl = self->_impl;
  impl[382] = impl[381];
  impl[2831] = a3;
  impl[2822] = a6 != 0;
  impl[2820] = a11;
  *((_QWORD *)impl + 2625) |= 0x20uLL;
  *((_QWORD *)impl + 2644) |= 0x40uLL;
  AGX::SWTessellationContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawPatches((uint64_t)(impl + 460), (uint64_t)a2, a4, a5, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, a11);
  *((_DWORD *)self->_impl + 383) = *((_DWORD *)self->_impl + 381);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  _DWORD *impl;
  int v10;

  impl = self->_impl;
  v10 = impl[381];
  impl[382] = v10;
  impl[2831] = a3;
  impl[2822] = a4 != 0;
  *((_QWORD *)impl + 2625) |= 0x20uLL;
  *((_QWORD *)impl + 2644) |= 0x40uLL;
  impl[383] = v10;
}

- (unint64_t)tileWidth
{
  return *(unsigned int *)(*((_QWORD *)self->_impl + 217) + 2964);
}

- (unint64_t)tileHeight
{
  return *(unsigned int *)(*((_QWORD *)self->_impl + 217) + 2968);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  _DWORD *impl;
  int v4;

  impl = self->_impl;
  v4 = impl[381];
  impl[382] = v4;
  *((_BYTE *)impl + 2065) = 1;
  *((_QWORD *)impl + 2675) |= 0x2000uLL;
  *((_QWORD *)impl + 2644) |= 0x5F700000000004uLL;
  impl[383] = v4;
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  _DWORD *impl;
  int v5;

  impl = self->_impl;
  v5 = impl[381];
  impl[382] = v5;
  *((_BYTE *)impl + 2065) = 1;
  *((_QWORD *)impl + 2675) |= 0x2000uLL;
  *((_QWORD *)impl + 2644) |= 0x5F700000000004uLL;
  impl[383] = v5;
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  _DWORD *impl;
  int v6;

  impl = self->_impl;
  v6 = impl[381];
  impl[382] = v6;
  *((_BYTE *)impl + 2065) = 1;
  *((_QWORD *)impl + 2675) |= 0x2000uLL;
  *((_QWORD *)impl + 2644) |= 0x5F700000000004uLL;
  impl[383] = v6;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  *((_DWORD *)self->_impl + a5 + 3618) = 0;
}

- (void)addSplitHandler:(id)a3
{
  _QWORD *impl;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = __Block_byref_object_copy__3761;
  v8[4] = __Block_byref_object_dispose__3762;
  v8[5] = self;
  impl = self->_impl;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__AGXA10FamilyRenderContext_addSplitHandler___block_invoke;
  v7[3] = &unk_2504022C0;
  v7[4] = a3;
  v7[5] = v8;
  v4 = _Block_copy(v7);
  v5 = impl[331];
  v6 = operator new(0x10uLL);
  *v6 = v5;
  v6[1] = v4;
  impl[331] = v6;
  _Block_object_dispose(v8, 8);
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
  return self->_user_draw_token_offset;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  MTLReportFailure();
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5 dm:(unsigned int)a6
{
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Please use setMTLCounterSampleLocationWithBuffer:vertexStartIndex:vertexEndIndex:fragmentStartIndex:fragmentEndIndex:\n", "agxa_render_objc.mm", 1299, "-[AGXA10FamilyRenderContext setMTLCounterSampleLocationWithBuffer:startIndex:endIndex:dm:]");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "agxa_render_objc.mm";
    v11 = 1024;
    v12 = 1299;
    v13 = 2080;
    v14 = "-[AGXA10FamilyRenderContext setMTLCounterSampleLocationWithBuffer:startIndex:endIndex:dm:]";
    _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Please use setMTLCounterSampleLocationWithBuffer:vertexStartIndex:vertexEndIndex:fragmentStartIndex:fragmentEndIndex:\n", buf, 0x1Cu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "agxa_render_objc.mm";
    v11 = 1024;
    v12 = 1299;
    v13 = 2080;
    v14 = "-[AGXA10FamilyRenderContext setMTLCounterSampleLocationWithBuffer:startIndex:endIndex:dm:]";
    _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Please use setMTLCounterSampleLocationWithBuffer:vertexStartIndex:vertexEndIndex:fragmentStartIndex:fragmentEndIndex:\n", buf, 0x1Cu);
  }
  -[AGXA10FamilyRenderContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 vertexStartIndex:(unsigned int)a4 vertexEndIndex:(unsigned int)a5 fragmentStartIndex:(unsigned int)a6 fragmentEndIndex:(unsigned int)a7
{
  unsigned int *impl;
  char v9;
  char v10;
  char v11;
  int v12;

  if (!a3)
    return 0;
  impl = (unsigned int *)self->_impl;
  impl[5320] = a4;
  impl[5321] = a5;
  impl[5322] = a6;
  impl[5323] = a7;
  v9 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 5320);
  v10 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 5321);
  v11 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 5322);
  v12 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 5323);
  return ((v9 & 1) != 0 || (v10 & 1) != 0 || (v11 & 1) != 0 || v12)
      && AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(impl + 5318), (AGXMTLCounterSampleBuffer *)a3);
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  _QWORD *impl;
  _QWORD *v5;
  char v6;
  int *v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  _DWORD *v14;
  _QWORD *v15;
  char *v16;

  impl = self->_impl;
  v5 = impl + 338;
  v6 = a4;
  impl[a4 + 403] = 0;
  if (a3)
  {
    v7 = (int *)MEMORY[0x24BE51650];
    v8 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v9 = *((_QWORD *)v8 + 1);
    v12 = v8 + 16;
    v10 = *((_QWORD *)v8 + 2);
    v11 = *((_QWORD *)v12 + 1);
    v13 = &impl[a4];
    v13[2116] = v9;
    v13[2368] = v11;
    v13[466] = v10 & 0xFFFFFFFFFFFFFFLL;
    v5[a4] = v11;
    v14 = (_DWORD *)impl + a4;
    v14[2870] = v10;
    v14[2933] = v10;
    v14[2996] = v9 >> 8;
    v13[1927] = (char *)a3 + *v7;
    if (impl[185])
      MTLResourceListAddResource();
  }
  else
  {
    v15 = &impl[a4];
    v15[1927] = 0;
    v5[a4] = 0;
    v15[466] = 0;
    v15[2116] = 0;
    v15[2368] = 0;
    v16 = (char *)impl + 4 * a4;
    *((_DWORD *)v16 + 2870) = 0;
    *((_DWORD *)v16 + 2933) = 0;
  }
  impl[2620] |= 1 << v6;
  impl[2623] |= 1 << v6;
  impl[2644] |= 0xC0uLL;
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  unsigned int location;
  int *v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  _QWORD *impl;
  _QWORD *v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  _DWORD *v20;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = (int *)MEMORY[0x24BE51650];
    do
    {
      v11 = (char *)*a3;
      impl = self->_impl;
      v13 = impl + 338;
      impl[location + 403] = 0;
      if (v11)
      {
        v14 = &v11[*v8];
        v15 = *((_QWORD *)v14 + 1);
        v18 = v14 + 16;
        v16 = *((_QWORD *)v14 + 2);
        v17 = *((_QWORD *)v18 + 1);
        v19 = &impl[location];
        v19[2116] = v15;
        v19[2368] = v17;
        v19[466] = v16 & 0xFFFFFFFFFFFFFFLL;
        v13[location] = v17;
        v20 = (_DWORD *)impl + location;
        v20[2870] = v16;
        v20[2933] = v16;
        v20[2996] = v15 >> 8;
        v19[1927] = &v11[*v8];
        if (impl[185])
          MTLResourceListAddResource();
      }
      else
      {
        v9 = &impl[location];
        v9[1927] = 0;
        v13[location] = 0;
        v9[466] = 0;
        v9[2116] = 0;
        v9[2368] = 0;
        v10 = (char *)impl + 4 * location;
        *((_DWORD *)v10 + 2870) = 0;
        *((_DWORD *)v10 + 2933) = 0;
      }
      impl[2620] |= 1 << location;
      impl[2623] |= 1 << location;
      impl[2644] |= 0xC0uLL;
      ++location;
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  _QWORD *impl;
  _QWORD *v5;
  char v6;
  int *v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  _DWORD *v14;
  _QWORD *v15;
  char *v16;

  impl = self->_impl;
  v5 = impl + 738;
  v6 = a4;
  impl[a4 + 803] = 0;
  if (a3)
  {
    v7 = (int *)MEMORY[0x24BE51650];
    v8 = (char *)a3 + (int)*MEMORY[0x24BE51650];
    v9 = *((_QWORD *)v8 + 1);
    v12 = v8 + 16;
    v10 = *((_QWORD *)v8 + 2);
    v11 = *((_QWORD *)v12 + 1);
    v13 = &impl[a4];
    v13[2305] = v9;
    v13[2557] = v11;
    v13[866] = v10 & 0xFFFFFFFFFFFFFFLL;
    v5[a4] = v11;
    v14 = (_DWORD *)impl + a4;
    v14[3663] = v10;
    v14[3726] = v10;
    v14[3789] = v9 >> 8;
    v13[1990] = (char *)a3 + *v7;
    if (impl[185])
      MTLResourceListAddResource();
  }
  else
  {
    v15 = &impl[a4];
    v15[1990] = 0;
    v5[a4] = 0;
    v15[866] = 0;
    v15[2305] = 0;
    v15[2557] = 0;
    v16 = (char *)impl + 4 * a4;
    *((_DWORD *)v16 + 3663) = 0;
    *((_DWORD *)v16 + 3726) = 0;
  }
  impl[2638] |= 1 << v6;
  impl[2641] |= 1 << v6;
  impl[2644] |= 0x3000000000uLL;
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  unsigned int location;
  int *v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  _QWORD *impl;
  _QWORD *v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  _DWORD *v20;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = (int *)MEMORY[0x24BE51650];
    do
    {
      v11 = (char *)*a3;
      impl = self->_impl;
      v13 = impl + 738;
      impl[location + 803] = 0;
      if (v11)
      {
        v14 = &v11[*v8];
        v15 = *((_QWORD *)v14 + 1);
        v18 = v14 + 16;
        v16 = *((_QWORD *)v14 + 2);
        v17 = *((_QWORD *)v18 + 1);
        v19 = &impl[location];
        v19[2305] = v15;
        v19[2557] = v17;
        v19[866] = v16 & 0xFFFFFFFFFFFFFFLL;
        v13[location] = v17;
        v20 = (_DWORD *)impl + location;
        v20[3663] = v16;
        v20[3726] = v16;
        v20[3789] = v15 >> 8;
        v19[1990] = &v11[*v8];
        if (impl[185])
          MTLResourceListAddResource();
      }
      else
      {
        v9 = &impl[location];
        v9[1990] = 0;
        v13[location] = 0;
        v9[866] = 0;
        v9[2305] = 0;
        v9[2557] = 0;
        v10 = (char *)impl + 4 * location;
        *((_DWORD *)v10 + 3663) = 0;
        *((_DWORD *)v10 + 3726) = 0;
      }
      impl[2638] |= 1 << location;
      impl[2641] |= 1 << location;
      impl[2644] |= 0x3000000000uLL;
      ++location;
      ++a3;
      --length;
    }
    while (length);
  }
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  _QWORD *impl;
  uint64_t v5;

  if (a4.length)
  {
    impl = self->_impl;
    if (impl[245])
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v5 = impl[249];
    if (!v5)
      v5 = std::__throw_bad_function_call[abi:nn180100]();
    impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, NSUInteger))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4.location);
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  }
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  _QWORD *impl;
  uint64_t v5;

  if (a4.length)
  {
    impl = self->_impl;
    if (impl[245])
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v5 = impl[249];
    if (!v5)
      v5 = std::__throw_bad_function_call[abi:nn180100]();
    impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, NSUInteger))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4.location);
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramVisibleFunctionTable(AGXA10FamilyVisibleFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AGXA10FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setVertexIntersectionFunctionTable:atBufferIndex:](&v7, sel_setVertexIntersectionFunctionTable_atBufferIndex_, a3, a4);
  }
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXA10FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setVertexIntersectionFunctionTables:withBufferRange:](&v8, sel_setVertexIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AGXA10FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setFragmentIntersectionFunctionTable:atBufferIndex:](&v7, sel_setFragmentIntersectionFunctionTable_atBufferIndex_, a3, a4);
  }
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXA10FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setFragmentIntersectionFunctionTables:withBufferRange:](&v8, sel_setFragmentIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v7.receiver = self;
    v7.super_class = (Class)AGXA10FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setTileIntersectionFunctionTable:atBufferIndex:](&v7, sel_setTileIntersectionFunctionTable_atBufferIndex_, a3, a4);
  }
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    v8.receiver = self;
    v8.super_class = (Class)AGXA10FamilyRenderContext;
    -[IOGPUMetalRenderCommandEncoder setTileIntersectionFunctionTables:withBufferRange:](&v8, sel_setTileIntersectionFunctionTables_withBufferRange_, a3, location, length);
  }
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v8;

  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) == 0)
  {
    impl = self->_impl;
    if (impl[245])
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v8 = impl[249];
    if (!v8)
      v8 = std::__throw_bad_function_call[abi:nn180100]();
    impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  }
  -[AGXA10FamilyRenderContext setObjectVisibleFunctionTable:atBufferIndex:](self, "setObjectVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _QWORD *impl;
  uint64_t v16;
  _QWORD v17[2];

  length = a4.length;
  location = a4.location;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = -[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation");
  if ((v8 & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](v8);
    v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    v11 = (char *)v17 - v10;
    if (length)
    {
      v12 = (_QWORD *)((char *)v17 - v10);
      v13 = length;
      do
      {
        v14 = (void *)*a3++;
        *v12++ = objc_msgSend(v14, "visibleFunctionTable");
        --v13;
      }
      while (v13);
    }
    -[AGXA10FamilyRenderContext setObjectVisibleFunctionTables:withBufferRange:](self, "setObjectVisibleFunctionTables:withBufferRange:", v11, location, length);
  }
  else if (length)
  {
    impl = self->_impl;
    if (impl[245])
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v16 = impl[249];
    if (!v16)
      v16 = std::__throw_bad_function_call[abi:nn180100]();
    impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 48))(v16);
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  }
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v8;

  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) == 0)
  {
    impl = self->_impl;
    if (impl[245])
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v8 = impl[249];
    if (!v8)
      v8 = std::__throw_bad_function_call[abi:nn180100]();
    impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  }
  -[AGXA10FamilyRenderContext setMeshVisibleFunctionTable:atBufferIndex:](self, "setMeshVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _QWORD *impl;
  uint64_t v16;
  _QWORD v17[2];

  length = a4.length;
  location = a4.location;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = -[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation");
  if ((v8 & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](v8);
    v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    v11 = (char *)v17 - v10;
    if (length)
    {
      v12 = (_QWORD *)((char *)v17 - v10);
      v13 = length;
      do
      {
        v14 = (void *)*a3++;
        *v12++ = objc_msgSend(v14, "visibleFunctionTable");
        --v13;
      }
      while (v13);
    }
    -[AGXA10FamilyRenderContext setMeshVisibleFunctionTables:withBufferRange:](self, "setMeshVisibleFunctionTables:withBufferRange:", v11, location, length);
  }
  else if (length)
  {
    impl = self->_impl;
    if (impl[245])
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v16 = impl[249];
    if (!v16)
      v16 = std::__throw_bad_function_call[abi:nn180100]();
    impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 48))(v16);
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramIntersectionFunctionTable(AGXA10FamilyUserIntersectionFunctionTable *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4;
  _QWORD *impl;
  char v8;
  _QWORD *v9;
  uint64_t v10;
  int *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  os_unfair_lock_s *v16;
  _QWORD *v17;
  char *v18;

  v4 = a4;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    impl = self->_impl;
    if (a3)
    {
      v8 = v4;
      v9 = &impl[v4];
      v9[403] = *((unsigned int *)a3 + 80);
      v10 = objc_msgSend(a3, "buffer");
      v11 = (int *)MEMORY[0x24BE51650];
      v12 = *(_QWORD *)(v10 + (int)*MEMORY[0x24BE51650] + 8);
      v13 = *(_QWORD *)(objc_msgSend(a3, "buffer") + *v11 + 24);
      v14 = *(_QWORD *)(objc_msgSend(a3, "buffer") + *v11 + 16);
      v9[2116] = v12;
      v9[2368] = v13;
      v9[466] = v14 & 0xFFFFFFFFFFFFFFLL;
      v9[338] = v13;
      v15 = (_DWORD *)impl + v4;
      v15[2870] = v14;
      v15[2933] = v14;
      v15[2996] = v12 >> 8;
      v9[1927] = objc_msgSend(a3, "buffer") + *v11;
      objc_msgSend(a3, "buffer");
      if (impl[185])
        MTLResourceListAddResource();
      v16 = (os_unfair_lock_s *)(*((_QWORD *)a3 + 41) + 40);
      os_unfair_lock_lock(v16);
      os_unfair_lock_unlock(v16);
      objc_msgSend(a3, "buffer");
    }
    else
    {
      v17 = &impl[v4];
      v17[1927] = 0;
      v17[403] = 0;
      v8 = v4;
      v17[466] = 0;
      v17[338] = 0;
      v17[2116] = 0;
      v17[2368] = 0;
      v18 = (char *)impl + 4 * v4;
      *((_DWORD *)v18 + 2870) = 0;
      *((_DWORD *)v18 + 2933) = 0;
    }
    impl[2620] |= 1 << v8;
    impl[2623] |= 1 << v8;
    impl[2644] |= 0xC0uLL;
  }
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  unsigned int v4;
  _QWORD *impl;
  char v8;
  _QWORD *v9;
  uint64_t v10;
  int *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  os_unfair_lock_s *v16;
  _QWORD *v17;
  char *v18;

  v4 = a4;
  if (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation"))
  {
    impl = self->_impl;
    if (a3)
    {
      v8 = v4;
      v9 = &impl[v4];
      v9[803] = *((unsigned int *)a3 + 80);
      v10 = objc_msgSend(a3, "buffer");
      v11 = (int *)MEMORY[0x24BE51650];
      v12 = *(_QWORD *)(v10 + (int)*MEMORY[0x24BE51650] + 8);
      v13 = *(_QWORD *)(objc_msgSend(a3, "buffer") + *v11 + 24);
      v14 = *(_QWORD *)(objc_msgSend(a3, "buffer") + *v11 + 16);
      v9[2305] = v12;
      v9[2557] = v13;
      v9[866] = v14 & 0xFFFFFFFFFFFFFFLL;
      v9[738] = v13;
      v15 = (_DWORD *)impl + v4;
      v15[3663] = v14;
      v15[3726] = v14;
      v15[3789] = v12 >> 8;
      v9[1990] = objc_msgSend(a3, "buffer") + *v11;
      objc_msgSend(a3, "buffer");
      if (impl[185])
        MTLResourceListAddResource();
      v16 = (os_unfair_lock_s *)(*((_QWORD *)a3 + 41) + 40);
      os_unfair_lock_lock(v16);
      os_unfair_lock_unlock(v16);
      objc_msgSend(a3, "buffer");
    }
    else
    {
      v17 = &impl[v4];
      v17[1990] = 0;
      v17[803] = 0;
      v8 = v4;
      v17[866] = 0;
      v17[738] = 0;
      v17[2305] = 0;
      v17[2557] = 0;
      v18 = (char *)impl + 4 * v4;
      *((_DWORD *)v18 + 3663) = 0;
      *((_DWORD *)v18 + 3726) = 0;
    }
    impl[2638] |= 1 << v8;
    impl[2641] |= 1 << v8;
    impl[2644] |= 0x3000000000uLL;
  }
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device", a3, a4), "requiresRaytracingEmulation");
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  int v5;
  _QWORD *impl;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = -[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device", a3, a4), "requiresRaytracingEmulation");
  impl = self->_impl;
  v7 = impl[245];
  if (v5)
  {
    if (v7)
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v8 = impl[249];
    if (v8)
    {
      impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    }
  }
  else
  {
    if (v7)
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v9 = impl[249];
    if (v9)
    {
LABEL_10:
      impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 48))(v9);
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    }
  }
  v9 = std::__throw_bad_function_call[abi:nn180100]();
  goto LABEL_10;
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  int v5;
  _QWORD *impl;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = -[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device", a3, a4), "requiresRaytracingEmulation");
  impl = self->_impl;
  v7 = impl[245];
  if (v5)
  {
    if (v7)
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v8 = impl[249];
    if (v8)
    {
      impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    }
  }
  else
  {
    if (v7)
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    v9 = impl[249];
    if (v9)
    {
LABEL_10:
      impl[245] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 48))(v9);
      AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramAccelerationStructure(AGXA10FamilyRayTracingAccelerationStructureSW *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    }
  }
  v9 = std::__throw_bad_function_call[abi:nn180100]();
  goto LABEL_10;
}

- (void)drawMeshThreadgroups:(id *)a3
{
  if (*((_QWORD *)self->_impl + 245))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawMeshThreadgroups(MTLSize)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  if (*((_QWORD *)self->_impl + 245))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::hasObjectStage(void)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  if (*((_QWORD *)self->_impl + 245))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::hasObjectStage(void)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  if (*((_QWORD *)self->_impl + 245))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::hasObjectStage(void)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _QWORD *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBufferBytes(void const*,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v6 = impl[249];
  if (!v6)
    v6 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void *, unint64_t, unint64_t))(*(_QWORD *)v6 + 48))(v6, a2, a3, a4, a5);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBufferBytes(void const*,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _QWORD *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBuffer(AGXA10FamilyBuffer *,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v6 = impl[249];
  if (!v6)
    v6 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t, unint64_t))(*(_QWORD *)v6 + 48))(v6, a2, a3, a4, a5);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBuffer(AGXA10FamilyBuffer *,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBufferOffset(unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, unint64_t, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBufferOffset(unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  _QWORD *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBuffers(AGXA10FamilyBuffer const**,unsigned long const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v6 = impl[249];
  if (!v6)
    v6 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, const unint64_t *, NSUInteger, NSUInteger))(*(_QWORD *)v6 + 48))(v6, a2, a3, a4, a5.location, a5.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramBuffers(AGXA10FamilyBuffer const**,unsigned long const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramTexture(AGXA10FamilyTexture *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramTexture(AGXA10FamilyTexture *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramTextures(AGXA10FamilyTexture const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, NSUInteger, NSUInteger))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4.location, a4.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramTextures(AGXA10FamilyTexture const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSampler(AGXA10FamilySampler *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSampler(AGXA10FamilySampler *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSamplers(AGXA10FamilySampler const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, NSUInteger, NSUInteger))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4.location, a4.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSamplers(AGXA10FamilySampler const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  _QWORD *impl;
  uint64_t v7;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSamplerWithLODOverride(AGXA10FamilySampler *,float,float,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v7 = impl[249];
  if (!v7)
    v7 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t, __n128, __n128))(*(_QWORD *)v7 + 48))(v7, a2, a3, a6, *(__n128 *)&a4, *(__n128 *)&a5);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSamplerWithLODOverride(AGXA10FamilySampler *,float,float,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _QWORD *impl;
  uint64_t v7;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSamplersWithLODOverrides(AGXA10FamilySampler const**,float const*,float const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v7 = impl[249];
  if (!v7)
    v7 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, const float *, const float *, NSUInteger, NSUInteger))(*(_QWORD *)v7 + 48))(v7, a2, a3, a4, a5, a6.location, a6.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectProgramSamplersWithLODOverrides(AGXA10FamilySampler const**,float const*,float const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectThreadgroupMemoryLength(unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, unint64_t, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setObjectThreadgroupMemoryLength(unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _QWORD *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBufferBytes(void const*,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v6 = impl[249];
  if (!v6)
    v6 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void *, unint64_t, unint64_t))(*(_QWORD *)v6 + 48))(v6, a2, a3, a4, a5);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBufferBytes(void const*,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  _QWORD *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBuffer(AGXA10FamilyBuffer *,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v6 = impl[249];
  if (!v6)
    v6 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t, unint64_t))(*(_QWORD *)v6 + 48))(v6, a2, a3, a4, a5);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBuffer(AGXA10FamilyBuffer *,unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBufferOffset(unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, unint64_t, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBufferOffset(unsigned long,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  _QWORD *impl;
  uint64_t v6;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBuffers(AGXA10FamilyBuffer const**,unsigned long const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v6 = impl[249];
  if (!v6)
    v6 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, const unint64_t *, NSUInteger, NSUInteger))(*(_QWORD *)v6 + 48))(v6, a2, a3, a4, a5.location, a5.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramBuffers(AGXA10FamilyBuffer const**,unsigned long const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramTexture(AGXA10FamilyTexture *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramTexture(AGXA10FamilyTexture *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramTextures(AGXA10FamilyTexture const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, NSUInteger, NSUInteger))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4.location, a4.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramTextures(AGXA10FamilyTexture const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSampler(AGXA10FamilySampler *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSampler(AGXA10FamilySampler *,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  _QWORD *impl;
  uint64_t v5;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSamplers(AGXA10FamilySampler const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v5 = impl[249];
  if (!v5)
    v5 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, NSUInteger, NSUInteger))(*(_QWORD *)v5 + 48))(v5, a2, a3, a4.location, a4.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSamplers(AGXA10FamilySampler const**,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  _QWORD *impl;
  uint64_t v7;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSamplerWithLODOverride(AGXA10FamilySampler *,float,float,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v7 = impl[249];
  if (!v7)
    v7 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, id, unint64_t, __n128, __n128))(*(_QWORD *)v7 + 48))(v7, a2, a3, a6, *(__n128 *)&a4, *(__n128 *)&a5);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSamplerWithLODOverride(AGXA10FamilySampler *,float,float,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  _QWORD *impl;
  uint64_t v7;

  impl = self->_impl;
  if (impl[245])
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSamplersWithLODOverrides(AGXA10FamilySampler const**,float const*,float const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  v7 = impl[249];
  if (!v7)
    v7 = std::__throw_bad_function_call[abi:nn180100]();
  impl[245] = (*(uint64_t (**)(uint64_t, SEL, const void **, const float *, const float *, NSUInteger, NSUInteger))(*(_QWORD *)v7 + 48))(v7, a2, a3, a4, a5, a6.location, a6.length);
  AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setMeshProgramSamplersWithLODOverrides(AGXA10FamilySampler const**,float const*,float const*,unsigned int,unsigned int)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
}

uint64_t __45__AGXA10FamilyRenderContext_addSplitHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)getImpl
{
  return self->_impl;
}

@end
