@implementation AGXA10FamilyThreadedRenderPass

- (AGXA10FamilyThreadedRenderPass)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  AGXA10FamilyThreadedRenderPass *v6;
  unint64_t *v7;
  RenderContext **begin;
  RenderContext **end;
  char *v10;
  uint64_t v11;
  RenderContext **v12;
  RenderContext **v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  RenderContext **v17;
  uint64_t v18;
  __int128 v19;
  RenderContext *v20;
  __end_ **v21;
  __end_cap_ **var0;
  char *v23;
  uint64_t v24;
  __end_cap_ **v25;
  __end_ **v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  __end_cap_ **v30;
  uint64_t v31;
  __int128 v32;
  __end_ *v33;
  void *v34;
  _QWORD *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;
  uint64_t v45[202];

  v44.receiver = self;
  v44.super_class = (Class)AGXA10FamilyThreadedRenderPass;
  v6 = -[IOGPUMetalParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:](&v44, sel_initWithCommandBuffer_renderPassDescriptor_);
  if (!v6)
    return v6;
  v42 = 0;
  v43 = 0;
  v7 = (unint64_t *)objc_msgSend(a3, "device");
  objc_msgSend(a4, "validate:width:height:", v7, &v43, &v42);
  v6->dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Metal.ParallelRenderCommandEncoder", 0);
  begin = v6->_subRenderCommandEncoders.__begin_;
  if ((RenderContext **)((char *)v6->_subRenderCommandEncoders.__end_cap_.__value_ - (char *)begin) <= (RenderContext **)0x7F)
  {
    end = v6->_subRenderCommandEncoders.__end_;
    v10 = (char *)operator new(0x80uLL);
    v11 = (char *)end - (char *)begin;
    v12 = (RenderContext **)&v10[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF8];
    v13 = v12;
    if (end == begin)
      goto LABEL_11;
    if ((unint64_t)(v11 - 8) >= 0x58)
    {
      v13 = (RenderContext **)&v10[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF8];
      if ((char *)end - v10 - (v11 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
      {
        v14 = v11 >> 3;
        v15 = ((unint64_t)(v11 - 8) >> 3) + 1;
        v16 = &v10[8 * v14 - 16];
        v17 = end - 2;
        v18 = v15 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v19 = *(_OWORD *)v17;
          *((_OWORD *)v16 - 1) = *((_OWORD *)v17 - 1);
          *(_OWORD *)v16 = v19;
          v16 -= 32;
          v17 -= 4;
          v18 -= 4;
        }
        while (v18);
        v13 = &v12[-(v15 & 0x3FFFFFFFFFFFFFFCLL)];
        end -= v15 & 0x3FFFFFFFFFFFFFFCLL;
        if (v15 == (v15 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_11:
          v6->_subRenderCommandEncoders.__begin_ = v13;
          v6->_subRenderCommandEncoders.__end_ = v12;
          v6->_subRenderCommandEncoders.__end_cap_.__value_ = (RenderContext **)(v10 + 128);
          if (begin)
            operator delete(begin);
          goto LABEL_13;
        }
      }
    }
    else
    {
      v13 = (RenderContext **)&v10[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v20 = *--end;
      *--v13 = v20;
    }
    while (end != begin);
    goto LABEL_11;
  }
LABEL_13:
  v21 = v6->_subOBJCRenderCommandEncoders.__begin_;
  if ((id *)((char *)v6->_subOBJCRenderCommandEncoders.var1.__value_ - (char *)v21) <= (id *)0x7F)
  {
    var0 = v6->_subOBJCRenderCommandEncoders.var0;
    v23 = (char *)operator new(0x80uLL);
    v24 = (char *)var0 - (char *)v21;
    v25 = (__end_cap_ **)&v23[((char *)var0 - (char *)v21) & 0xFFFFFFFFFFFFFFF8];
    v26 = v25;
    if (var0 == v21)
      goto LABEL_22;
    if ((unint64_t)(v24 - 8) >= 0x58)
    {
      v26 = (__end_ **)&v23[((char *)var0 - (char *)v21) & 0xFFFFFFFFFFFFFFF8];
      if ((char *)var0 - v23 - (v24 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
      {
        v27 = v24 >> 3;
        v28 = ((unint64_t)(v24 - 8) >> 3) + 1;
        v29 = &v23[8 * v27 - 16];
        v30 = var0 - 2;
        v31 = v28 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v32 = *(_OWORD *)v30;
          *((_OWORD *)v29 - 1) = *((_OWORD *)v30 - 1);
          *(_OWORD *)v29 = v32;
          v29 -= 32;
          v30 -= 4;
          v31 -= 4;
        }
        while (v31);
        v26 = &v25[-(v28 & 0x3FFFFFFFFFFFFFFCLL)];
        var0 -= v28 & 0x3FFFFFFFFFFFFFFCLL;
        if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_22:
          v6->_subOBJCRenderCommandEncoders.__begin_ = v26;
          v6->_subOBJCRenderCommandEncoders.var0 = v25;
          v6->_subOBJCRenderCommandEncoders.var1.__value_ = (id *)(v23 + 128);
          if (v21)
            operator delete(v21);
          goto LABEL_24;
        }
      }
    }
    else
    {
      v26 = (__end_ **)&v23[((char *)var0 - (char *)v21) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v33 = *--var0;
      *--v26 = v33;
    }
    while (var0 != v21);
    goto LABEL_22;
  }
LABEL_24:
  v34 = malloc_type_calloc(0x1508uLL, 1uLL, 0x99EF825DuLL);
  v6->_impl = v34;
  if (v34)
  {
    v35 = v34;
    v36 = v43;
    v37 = v42;
    v38 = objc_msgSend(a3, "commandBufferStorage");
    if (AGX::RenderPDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once != -1)
      dispatch_once(&AGX::RenderPDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::dataBufferConfigs(AGXGPUCoreConfig const&)::once, &__block_literal_global_3850);
    *v35 = &AGX::RenderPDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::databuffer_configs;
    v35[1] = v7;
    v35[2] = v38;
    v39 = *(_QWORD *)(v38 + 768);
    *((_DWORD *)v35 + 356) = 0;
    v35[177] = 0;
    v35[176] = 0;
    v35[175] = 0;
    v35[3] = v39;
    v35[4] = v38 + 144;
    v35[179] = *(_QWORD *)(v38 + 784);
    v40 = *((_QWORD *)a3 + 86);
    AGX::FramebufferDriverConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::FramebufferDriverConfigGen2((uint64_t)v45, a4, *(_DWORD *)(v7[101] + 6684), 0);
    AGX::FramebufferGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::FramebufferGen2((uint64_t)(v35 + 180), v7, v40, v45, v36, v37, 0);
    v35[672] = 0;
    v35[671] = 64;
  }
  else
  {
    -[AGXA10FamilyThreadedRenderPass endEncoding](v6, "endEncoding");

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  void *impl;
  void **v4;
  void **v5;
  void *v6;
  NSObject *dispatchQueue;
  objc_super v8;

  impl = self->_impl;
  if (impl)
  {
    AGX::Framebuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~Framebuffer((uint64_t)impl + 1440);
    v4 = (void **)*((_QWORD *)impl + 175);
    v5 = (void **)*((_QWORD *)impl + 176);
    if (v4 != v5)
    {
      do
      {
        v6 = *v4++;
        free(v6);
      }
      while (v4 != v5);
      v4 = (void **)*((_QWORD *)impl + 175);
    }
    if (v4)
    {
      *((_QWORD *)impl + 176) = v4;
      operator delete(v4);
    }
    free(self->_impl);
    self->_impl = 0;
  }
  dispatchQueue = self->dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  v8.receiver = self;
  v8.super_class = (Class)AGXA10FamilyThreadedRenderPass;
  -[_MTLParallelRenderCommandEncoder dealloc](&v8, sel_dealloc);
}

- (id)renderCommandEncoder
{
  id v3;
  void *v4;
  id v5;
  NSObject *dispatchQueue;
  _QWORD v8[6];

  v3 = -[IOGPUMetalParallelRenderCommandEncoder _renderCommandEncoderCommon](self, "_renderCommandEncoderCommon");
  v4 = (void *)objc_msgSend(v3, "subRenderCommandEncoderWithDescriptor:subEncoderIndex:framebuffer:", *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD980]), *(char **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD960]) - 1, (char *)self->_impl + 1440);
  v5 = v4;
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
  {
    -[_MTLParallelRenderCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(v4, "globalTraceObjectID");
    kdebug_trace();
  }
  if (v4)
  {
    dispatchQueue = self->dispatchQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__AGXA10FamilyThreadedRenderPass_renderCommandEncoder__block_invoke;
    v8[3] = &unk_2504028B0;
    v8[4] = self;
    v8[5] = v4;
    dispatch_sync(dispatchQueue, v8);
  }
  return v4;
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  id v7;
  void *v8;
  id v9;
  NSObject *dispatchQueue;
  _QWORD v12[6];

  v7 = -[IOGPUMetalParallelRenderCommandEncoder _renderCommandEncoderCommon](self, "_renderCommandEncoderCommon");
  v8 = (void *)objc_msgSend(v7, "sampledSubRenderCommandEncoderWithDescriptor:subEncoderIndex:framebuffer:programInfoBuffer:capacity:", *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD980]), *(char **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD960]) - 1, (char *)self->_impl + 1440, a3, a4);
  v9 = v8;
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
  {
    -[_MTLParallelRenderCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(v8, "globalTraceObjectID");
    kdebug_trace();
  }
  if (v8)
  {
    dispatchQueue = self->dispatchQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __92__AGXA10FamilyThreadedRenderPass_sampledRenderCommandEncoderWithProgramInfoBuffer_capacity___block_invoke;
    v12[3] = &unk_2504028B0;
    v12[4] = self;
    v12[5] = v8;
    dispatch_sync(dispatchQueue, v12);
  }
  return v8;
}

- (void)endEncoding
{
  void *v3;
  uint64_t v4;
  unint64_t *v5;
  _QWORD *impl;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *dispatchQueue;
  void *v13;
  void **v14;
  void **v15;
  void *v16;
  objc_super v17;
  _QWORD block[5];

  if (!*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD960]))
  {
    v3 = (void *)MEMORY[0x234928298]();
    objc_msgSend(-[AGXA10FamilyThreadedRenderPass renderCommandEncoder](self, "renderCommandEncoder"), "endEncoding");
    objc_autoreleasePoolPop(v3);
  }
  v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD950]), "device");
  v5 = (unint64_t *)(v4 + 816);
  impl = self->_impl;
  v7 = impl[671];
  v8 = impl[672];
  do
    v9 = __ldaxr(v5);
  while (__stlxr(v9 | v7, v5));
  v10 = (unint64_t *)(v4 + 824);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 | v8, v10));
  dispatchQueue = self->dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__AGXA10FamilyThreadedRenderPass_endEncoding__block_invoke;
  block[3] = &unk_2504028D8;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v13 = self->_impl;
  AGX::Framebuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~Framebuffer((uint64_t)v13 + 1440);
  v14 = (void **)*((_QWORD *)v13 + 175);
  v15 = (void **)*((_QWORD *)v13 + 176);
  if (v14 != v15)
  {
    do
    {
      v16 = *v14++;
      free(v16);
    }
    while (v14 != v15);
    v14 = (void **)*((_QWORD *)v13 + 175);
  }
  if (v14)
  {
    *((_QWORD *)v13 + 176) = v14;
    operator delete(v14);
  }
  free(self->_impl);
  self->_impl = 0;
  v17.receiver = self;
  v17.super_class = (Class)AGXA10FamilyThreadedRenderPass;
  -[IOGPUMetalParallelRenderCommandEncoder endEncoding](&v17, sel_endEncoding);
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (a4 <= 7)
    AGX::Framebuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::setColorStoreAction((uint64_t)self->_impl + 1440, a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  _DWORD *impl;
  unsigned int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  impl = self->_impl;
  if ((*((_BYTE *)impl + 5093) & 1) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        impl[1272] &= ~0x100u;
        LODWORD(v5) = *((_QWORD *)impl + 635) & 0xFFFFFEFF;
        HIDWORD(v5) = (*((_QWORD *)impl + 635) | 0x10000000100uLL) >> 32;
        *((_QWORD *)impl + 635) = v5;
        v6 = *((_WORD *)impl + 2278) | 2;
        goto LABEL_9;
      case 1uLL:
      case 5uLL:
        v4 = impl[1272] & 0xFFFFFEFF;
        goto LABEL_7;
      case 2uLL:
        impl[1272] |= 0x100u;
        *((_QWORD *)impl + 635) &= 0xFFFFFEFFFFFFFEFFLL;
        goto LABEL_8;
      case 3uLL:
        v4 = impl[1272] | 0x100;
LABEL_7:
        impl[1272] = v4;
        LODWORD(v7) = *((_QWORD *)impl + 635) | 0x100;
        HIDWORD(v7) = (*((_QWORD *)impl + 635) & 0xFFFFFEFFFFFFFEFFLL) >> 32;
        *((_QWORD *)impl + 635) = v7;
LABEL_8:
        v6 = impl[1139] & 0xFFFD;
LABEL_9:
        *((_WORD *)impl + 2278) = v6;
        break;
      default:
        break;
    }
  }
  v8 = 0x1000000000000000;
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v8 = 1;
  *((_QWORD *)impl + 671) |= v8;
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  _DWORD *impl;
  uint64_t v4;
  __int16 v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  impl = self->_impl;
  if ((*((_BYTE *)impl + 5093) & 2) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        impl[1272] &= ~0x200u;
        LODWORD(v4) = *((_QWORD *)impl + 635) & 0xFFFFFDFF;
        HIDWORD(v4) = (*((_QWORD *)impl + 635) | 0x20000000200uLL) >> 32;
        *((_QWORD *)impl + 635) = v4;
        v5 = *((_WORD *)impl + 2278) | 8;
        goto LABEL_9;
      case 1uLL:
        v6 = impl[1272] & 0xFFFFFDFF;
        goto LABEL_7;
      case 2uLL:
        impl[1272] |= 0x200u;
        *((_QWORD *)impl + 635) &= 0xFFFFFDFFFFFFFDFFLL;
        goto LABEL_8;
      case 3uLL:
        v6 = impl[1272] | 0x200;
LABEL_7:
        impl[1272] = v6;
        LODWORD(v7) = *((_QWORD *)impl + 635) | 0x200;
        HIDWORD(v7) = (*((_QWORD *)impl + 635) & 0xFFFFFDFFFFFFFDFFLL) >> 32;
        *((_QWORD *)impl + 635) = v7;
LABEL_8:
        v5 = impl[1139] & 0xFFF7;
LABEL_9:
        *((_WORD *)impl + 2278) = v5;
        break;
      default:
        break;
    }
  }
  v8 = 0x2000000000000000;
  if (a3 != 1)
    v8 = 1;
  *((_QWORD *)impl + 671) |= v8;
}

- (BOOL)isMemorylessRender
{
  return *((_BYTE *)self->_impl + 4429);
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5
{
  return 0;
}

- (void).cxx_destruct
{
  vector<AGX::G9::RenderContext *, std::allocator<AGX::G9::RenderContext *>> *p_subRenderCommandEncoders;
  RenderContext **begin;
  __end_ **v5;

  p_subRenderCommandEncoders = &self->_subRenderCommandEncoders;
  begin = self->_subRenderCommandEncoders.__begin_;
  if (begin)
  {
    p_subRenderCommandEncoders->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_subOBJCRenderCommandEncoders.__begin_;
  if (v5)
  {
    self->_subOBJCRenderCommandEncoders.var0 = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 30) = 0;
  return self;
}

void __45__AGXA10FamilyThreadedRenderPass_endEncoding__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _DWORD *v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  _QWORD *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  BOOL v35;
  int v36;
  unsigned int *v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _WORD *v43;
  unsigned int *v44;
  unsigned int v45;
  int v46;
  unsigned int *v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t *v50;
  unsigned int v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  unint64_t v57;
  int v58;
  void **v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  _DWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  unint64_t v70;
  _QWORD *v71;
  int v72;
  BOOL v73;
  _DWORD *v74;
  unint64_t v75;
  _BOOL4 v76;
  _QWORD *v77;
  char *v78;
  int v79;
  const void *v80;
  size_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const void *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int v92;
  unint64_t v93;
  unint64_t v94;
  BOOL v95;
  unint64_t v96;
  _DWORD *v97;
  unint64_t v98;
  AGX::FenceList *v99;
  uint64_t v100;
  uint64_t v101;
  AGX::FenceList *v102;
  uint64_t v103;
  uint64_t v104;
  AGX::FenceList *v105;
  uint64_t v106;
  uint64_t v107;
  AGX::FenceList *v108;
  uint64_t v109;
  uint64_t v110;
  AGX::FenceList *v111;
  uint64_t v112;
  uint64_t v113;
  AGX::FenceList *v114;
  uint64_t v115;
  uint64_t v116;
  AGX::FenceList *v117;
  uint64_t v118;
  uint64_t v119;
  AGX::FenceList *v120;
  uint64_t v121;
  uint64_t v122;
  _DWORD *v123;
  unint64_t v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t *v129;
  _DWORD *v130;
  _OWORD *v131;
  __int128 v132;
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BOOL4 v138;
  double v139;
  void *v140;
  int v141;
  unsigned int *v142;
  _QWORD *v143;
  _QWORD *v144;
  size_t v145;
  int v146;
  void *v147;
  unsigned int v148;
  uint64_t v149;
  int v150;
  uint64_t v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  id *v157;
  void *v158;
  size_t v159;
  _QWORD *v160;
  id *v161;
  _QWORD *v162;
  BOOL v163;
  int v164;
  BOOL v165;
  int v166;
  unsigned int v167;
  int v168;
  unint64_t v169;
  unsigned int v170;
  int v171;
  BOOL v172;
  int v173;
  BOOL v174;
  _QWORD *v175;
  unsigned int v176;
  int v177;
  BOOL v178;
  int v179;
  BOOL v180;
  _QWORD *v181;
  BOOL v182;
  int v183;
  BOOL v184;
  int v185;
  int v186;
  uint64_t v187;
  _QWORD *v188;
  unint64_t v189;
  unsigned int v190;
  uint64_t v191;
  _QWORD *v192;
  _QWORD *v193;
  _QWORD *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  unint64_t v200;
  uint64_t v201;
  uint64_t v202;
  _QWORD *v203;
  _DWORD *v204;
  _DWORD *v205;
  unint64_t v206;
  unint64_t v207;
  _QWORD *v208;
  int v209;
  uint64_t *v210;
  uint64_t v211;
  _QWORD v212[2];
  unsigned int *v213;
  uint64_t v214;
  uint64_t v215;

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + (int)*MEMORY[0x24BDDD950]);
  v197 = *(_QWORD *)(v2 + (int)*MEMORY[0x24BDDD958]);
  v4 = *(_QWORD *)(v2 + 240);
  v5 = *(_QWORD *)(v2 + (int)*MEMORY[0x24BDDD960]);
  v198 = *(_QWORD *)(v2 + 200);
  AGX::FramebufferGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::finalizeStoreActions(v198 + 1440);
  v207 = v5;
  if (v5)
  {
    v211 = v4;
    v201 = v198 + 5320;
    v203 = (_QWORD *)(v198 + 5336);
    objc_msgSend(v3, "getCurrentKernelCommandBufferStart:current:end:");
    v6 = 0;
    v196 = v1;
    v199 = v3;
    v210 = (uint64_t *)(v198 + 5328);
    while (1)
    {
      v9 = v211;
      if (v6 >= v207)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = *(_QWORD *)(v211 + 8 * v6);
      v202 = v17 + 21257;
      v195 = v17 + 16;
      v200 = v6;
      v18 = v6;
      v208 = (_QWORD *)v17;
      while (1)
      {
        v19 = *(_QWORD **)(v9 + 8 * v18);
        v20 = (_DWORD *)v19 + 5315;
        if ((_QWORD *)v17 == v19)
        {
          v40 = *(_QWORD *)(v17 + 320);
          v41 = *(_QWORD *)(*(_QWORD *)(v17 + 40) + 536);
          v42 = *(_QWORD *)(v17 + 288);
          if (!v42)
          {
            v192 = v16;
            v193 = *(_QWORD **)(v9 + 8 * v18);
            v205 = (_DWORD *)v19 + 5315;
            v190 = v13;
            v51 = v15;
            v52 = v14;
            v53 = v12;
            v54 = v10;
            v55 = v11;
            AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v195);
            v42 = *(_QWORD *)(v17 + 288);
            if (!v42)
            {
              AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v195);
              v42 = 0;
            }
            v11 = v55;
            v10 = v54;
            v12 = v53;
            v14 = v52;
            v15 = v51;
            v16 = v192;
            v19 = v193;
            v17 = (uint64_t)v208;
            v13 = v190;
            v20 = v205;
          }
          v13 += (unint64_t)(v40 - v41) >> 3;
          v15 -= 1431655765 * ((unint64_t)(v42 - *(_QWORD *)(*(_QWORD *)(v17 + 40) + 472)) >> 2);
          v9 = v211;
          if (!v16)
            goto LABEL_38;
LABEL_36:
          if (v16 != v19)
          {
            v49 = *(_QWORD *)v19[333];
            v50 = (unint64_t *)v16[8];
            v16[8] = v50 + 1;
            *v50 = __ROR8__(v49, 32) & 0xFFFFFFFC7FFFFFFFLL | 0x80000000;
          }
          goto LABEL_38;
        }
        v204 = (_DWORD *)v19 + 5315;
        if (*v20 > 1u)
          break;
        v21 = *(_QWORD **)(v9 + 8 * v18);
        v22 = v11;
        v23 = v10;
        v24 = v12;
        v25 = v14;
        v26 = v15;
        v27 = v13;
        v28 = v16;
        v29 = IOGPUResourceListMergeLists();
        v16 = v28;
        v13 = v27;
        v15 = v26;
        v14 = v25;
        v12 = v24;
        v10 = v23;
        v11 = v22;
        if (!v29)
          break;
        v19 = v21;
        v30 = v21[40];
        v31 = *(_QWORD *)(v21[5] + 536);
        v32 = v21[36];
        if (!v32)
        {
          v191 = v21[40];
          AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v21 + 2);
          v32 = v21[36];
          if (!v32)
          {
            AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v21 + 2);
            v32 = 0;
          }
          v11 = v22;
          v10 = v23;
          v12 = v24;
          v14 = v25;
          v15 = v26;
          v19 = v21;
          v13 = v27;
          v16 = v28;
          v30 = v191;
        }
        v33 = v13 + ((unint64_t)(v30 - v31) >> 3);
        v34 = v15 - 1431655765 * ((unint64_t)(v32 - *(_QWORD *)(v19[5] + 472)) >> 2);
        v35 = !HIWORD(v33) && HIWORD(v34) == 0;
        v9 = v211;
        if (!v35)
          break;
        v36 = *((_DWORD *)v19 + 594);
        if (v36 == 1)
        {
          v43 = (_WORD *)v19[56];
          *v43 = *((_WORD *)v19 + 1190);
          v19[56] = v43 + 1;
          *((_DWORD *)v19 + 594) = 2;
          *(_DWORD *)(v19[295] + 8) = 2;
          v17 = (uint64_t)v208;
          v39 = *((_DWORD *)v19 + 606);
          if (v39)
            goto LABEL_30;
        }
        else
        {
          v17 = (uint64_t)v208;
          if (!v36)
          {
            v37 = (unsigned int *)v19[294];
            if (v37)
            {
              v38 = v19[296] & 0xFFFFFFFC;
              *v37 = *((_DWORD *)v19 + 593) | 0x80000000;
              v37[1] = v38;
              v19[294] = 0;
              v19[296] = 0;
              ++*((_DWORD *)v19 + 384);
            }
          }
          v39 = *((_DWORD *)v19 + 606);
          if (v39)
          {
LABEL_30:
            *(_DWORD *)(v19[302] + 8) = v39;
            goto LABEL_31;
          }
        }
        v44 = (unsigned int *)v19[301];
        if (!v44)
          goto LABEL_30;
        v45 = v19[304] & 0xFFFFFFFC;
        *v44 = *((_DWORD *)v19 + 609) | 0x80000000;
        v44[1] = v45;
        v19[301] = 0;
        v19[304] = 0;
        ++*((_DWORD *)v19 + 384);
LABEL_31:
        v20 = v204;
        v46 = *((_DWORD *)v19 + 622);
        if (v46 || (v47 = (unsigned int *)v19[309]) == 0)
        {
          *(_DWORD *)(v19[310] + 8) = v46;
        }
        else
        {
          v48 = v19[312] & 0xFFFFFFFC;
          *v47 = *((_DWORD *)v19 + 625) | 0x80000000;
          v47[1] = v48;
          v19[309] = 0;
          v19[312] = 0;
        }
        v13 = v33;
        v15 = v34;
        if (v16)
          goto LABEL_36;
LABEL_38:
        if (*((_DWORD *)v19 + 646) <= v14)
        {
          v12 = v12 || *((_BYTE *)v19 + 2608) != 0;
        }
        else
        {
          v12 = 1;
          v14 = *((unsigned int *)v19 + 646);
        }
        if (*((_DWORD *)v19 + 654) <= v10)
        {
          v11 = v11 || *((_BYTE *)v19 + 2640) != 0;
        }
        else
        {
          v11 = 1;
          v10 = *((unsigned int *)v19 + 654);
        }
        *(_BYTE *)(v17 + 2065) |= *((_BYTE *)v19 + 2065);
        *(_BYTE *)(v17 + 2032) |= *((_BYTE *)v19 + 2032);
        *(_WORD *)(v17 + 2306) = *((_WORD *)v19 + 1153);
        *(_WORD *)(v17 + 2304) |= *((_WORD *)v19 + 1152);
        *(_BYTE *)(v17 + 2383) |= *((_BYTE *)v19 + 2383);
        if ((_QWORD *)v17 != v19)
        {
          *(_DWORD *)(v202 + 7) += v20[1];
          *(_DWORD *)(v17 + 1540) += *((_DWORD *)v19 + 385);
          *(_BYTE *)(v17 + 1544) &= *((_BYTE *)v19 + 1544);
        }
        *((_BYTE *)v19 + 2033) = *(_BYTE *)(v17 + 2033);
        ++v18;
        v16 = v19;
        if (v207 == v18)
        {
          v57 = v207;
          v56 = v200;
          goto LABEL_63;
        }
      }
      v56 = v200;
      v17 = (uint64_t)v208;
      if (v18 == v200)
        v19 = v208;
      else
        v19 = v16;
      if (v18 == v200)
        v57 = v200 + 1;
      else
        v57 = v18;
LABEL_63:
      v58 = *(_BYTE *)v202 != 0;
      v59 = (void **)(v198 + 5328);
      v206 = v57;
      if (v57 - v56 < 2)
      {
        v69 = v19;
        goto LABEL_86;
      }
      v60 = *(_QWORD *)(v17 + 320);
      v61 = 8 * (v13 - ((unint64_t)(v60 - *(_QWORD *)(*(_QWORD *)(v17 + 40) + 536)) >> 3));
      if ((unint64_t)(v60 + v61) <= *(_QWORD *)(v17 + 312))
      {
        *(_QWORD *)(v17 + 328) = v60 + v61;
        goto LABEL_66;
      }
      v162 = v19;
      v163 = v11;
      v164 = v10;
      v165 = v12;
      v166 = v14;
      v167 = v15;
      v168 = AGX::DataBufferAllocator<34ul>::growNoInline(v195, 8, 1);
      v19 = v162;
      v17 = (uint64_t)v208;
      v15 = v167;
      LODWORD(v14) = v166;
      v12 = v165;
      LODWORD(v10) = v164;
      v11 = v163;
      if (v168)
      {
        v169 = v208[40] + v61;
        if (v169 <= v208[39])
        {
          v208[41] = v169;
          *(_QWORD *)(v208[333] + 720) = *(_QWORD *)(v208[5] + 512)
                                         + *(_QWORD *)(v208[5] + 536)
                                         - *(_QWORD *)(v208[5] + 520);
          goto LABEL_66;
        }
LABEL_195:
        abort();
      }
LABEL_66:
      v62 = *(_QWORD *)(v17 + 288);
      v63 = v62;
      if (!v62)
      {
        v194 = v19;
        v170 = v15;
        v171 = v14;
        v172 = v12;
        v173 = v10;
        v174 = v11;
        AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v195);
        v62 = *(_QWORD *)(v17 + 288);
        if (v62)
        {
          v63 = *(_QWORD *)(v17 + 288);
        }
        else
        {
          AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v195);
          v63 = 0;
          v62 = *(_QWORD *)(v17 + 288);
        }
        v11 = v174;
        LODWORD(v10) = v173;
        v12 = v172;
        LODWORD(v14) = v171;
        v15 = v170;
        v19 = v194;
      }
      v64 = *(_QWORD *)(*(_QWORD *)(v17 + 40) + 472);
      if (!v62)
      {
        v175 = v19;
        v176 = v15;
        v177 = v14;
        v178 = v12;
        v179 = v10;
        v180 = v11;
        if (!AGX::DataBufferAllocator<34ul>::growNoInline(v195, 7, 0))
          goto LABEL_195;
        v62 = v208[36];
        v11 = v180;
        LODWORD(v10) = v179;
        v12 = v178;
        LODWORD(v14) = v177;
        v15 = v176;
        v19 = v175;
        v17 = (uint64_t)v208;
      }
      v65 = 12 * (v15 + 1431655765 * ((unint64_t)(v63 - v64) >> 2));
      v66 = v62 + v65;
      if (v66 > *(_QWORD *)(v17 + 280))
      {
        v181 = v19;
        v182 = v11;
        v183 = v10;
        v184 = v12;
        v185 = v14;
        v186 = AGX::DataBufferAllocator<34ul>::growNoInline(v195, 7, 1);
        v19 = v181;
        LODWORD(v14) = v185;
        v12 = v184;
        LODWORD(v10) = v183;
        v11 = v182;
        v59 = (void **)(v198 + 5328);
        if (v186)
        {
          v187 = *(_QWORD *)(v17 + 288);
          if ((unint64_t)(v187 + v65) > *(_QWORD *)(v17 + 280))
            goto LABEL_195;
          *(_QWORD *)(v17 + 296) = v187 + v65;
          if (!v187)
          {
            AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v195);
            v19 = v181;
            LODWORD(v14) = v185;
            v12 = v184;
            LODWORD(v10) = v183;
            v11 = v182;
          }
          *(_QWORD *)(*(_QWORD *)(v17 + 2664) + 728) = *(_QWORD *)(*(_QWORD *)(v17 + 40) + 448)
                                                       + *(_QWORD *)(*(_QWORD *)(v17 + 40) + 472)
                                                       - *(_QWORD *)(*(_QWORD *)(v17 + 40) + 456);
        }
      }
      else
      {
        *(_QWORD *)(v17 + 296) = v66;
        v59 = (void **)(v198 + 5328);
      }
      v67 = (_DWORD *)(v17 + 2584);
      if (v14 > *(_DWORD *)(v17 + 2584))
      {
        *v67 = v14;
        v68 = v211;
        goto LABEL_74;
      }
      v68 = v211;
      v70 = v200;
      if (*(_BYTE *)(v17 + 2608))
      {
LABEL_74:
        *(_BYTE *)(v17 + 2608) = 1;
        goto LABEL_75;
      }
      *(_BYTE *)(v17 + 2608) = v12;
      if (v12)
      {
LABEL_75:
        v71 = v19;
        v72 = v10;
        v73 = v11;
        if (AGX::SpillInfoGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocateUSCSpillBuffer((uint64_t)v67, (_QWORD *)(*(_QWORD *)(v17 + 2664) + 184), *(_QWORD *)(v17 + 1488), (uint64_t)&v213))
        {
          IOGPUResourceListAddResource();
        }
        v70 = v200;
        v11 = v73;
        LODWORD(v10) = v72;
        v19 = v71;
      }
      v74 = (_DWORD *)(v17 + 2616);
      v69 = v19;
      if (v10 > *(_DWORD *)(v17 + 2616))
      {
        *v74 = v10;
        goto LABEL_81;
      }
      if (*(_BYTE *)(v17 + 2640))
      {
LABEL_81:
        *(_BYTE *)(v17 + 2640) = 1;
        goto LABEL_82;
      }
      *(_BYTE *)(v17 + 2640) = v11;
      if (v11)
      {
LABEL_82:
        if (AGX::SpillInfoGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocateUSCSpillBuffer((uint64_t)v74, (_QWORD *)(*(_QWORD *)(v17 + 2664) + 1000), *(_QWORD *)(v17 + 1488), (uint64_t)&v213))
        {
          IOGPUResourceListAddResource();
        }
        v70 = v200;
      }
      v75 = v70 + 1;
      if (v70 + 1 < v57)
      {
        do
        {
          v77 = *(_QWORD **)(v68 + 8 * v75);
          v78 = *(char **)(v17 + 320);
          v79 = *(_DWORD *)(*(_QWORD *)(v17 + 40) + 536);
          v80 = *(const void **)(v77[5] + 536);
          v81 = (v77[40] - (_QWORD)v80) & 0x7FFFFFFF8;
          if (v81)
          {
            *(_QWORD *)(v17 + 320) = &v78[v81];
            memcpy(v78, v80, v81);
          }
          v82 = *(_QWORD *)(v17 + 288);
          if (!v82)
          {
            AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v195);
            v82 = *(_QWORD *)(v17 + 288);
            if (!v82)
              AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v195);
          }
          v209 = v58;
          v83 = *(_QWORD *)(*(_QWORD *)(v17 + 40) + 472);
          v84 = v77[36];
          if (!v84)
          {
            AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v77 + 2);
            v84 = v77[36];
            if (!v84)
            {
              AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v77 + 2);
              v84 = 0;
            }
          }
          v85 = v77[5];
          v86 = *(const void **)(v85 + 472);
          v87 = -1431655765 * ((unint64_t)(v84 - (_QWORD)v86) >> 2);
          if ((_DWORD)v87)
          {
            if (!v77[36])
            {
              AGX::DataBufferAllocator<34ul>::initializeOnDemandDataBufferSlow(v77 + 2);
              v86 = *(const void **)(v77[5] + 472);
            }
            v88 = *(char **)(v17 + 288);
            *(_QWORD *)(v17 + 288) = &v88[12 * v87];
            memcpy(v88, v86, 12 * v87);
            v85 = v77[5];
          }
          v89 = *(_QWORD *)(v85 + 600);
          v90 = v77[44];
          v91 = v90 - v89;
          if (v90 == v89)
            goto LABEL_110;
          v92 = ((_DWORD)v78 - v79) >> 3;
          v93 = v91 >> 3;
          if (v93 <= 1)
            v94 = 1;
          else
            v94 = v93;
          if (v94 >= 2 && (v89 + 4 + 8 * (v94 - 1) >= v89 + 4 ? (v95 = (v94 - 1) >> 61 == 0) : (v95 = 0), v95))
          {
            v96 = v94 & 0xFFFFFFFFFFFFFFFELL;
            v123 = (_DWORD *)(v89 + 12);
            v124 = v94 & 0xFFFFFFFFFFFFFFFELL;
            do
            {
              v125 = (*v123 - 1431633920 * ((unint64_t)(v82 - v83) >> 2)) & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)v123 + v92);
              *(v123 - 2) = (*(v123 - 2) - 1431633920 * ((unint64_t)(v82 - v83) >> 2)) & 0xFFFF0000 | (unsigned __int16)(*(v123 - 2) + v92);
              *v123 = v125;
              v123 += 4;
              v124 -= 2;
            }
            while (v124);
            if (v94 == v96)
              goto LABEL_110;
          }
          else
          {
            v96 = 0;
          }
          v97 = (_DWORD *)(v89 + 8 * v96 + 4);
          v98 = v94 - v96;
          do
          {
            *v97 = (*v97 - 1431633920 * ((unint64_t)(v82 - v83) >> 2)) & 0xFFFF0000 | (unsigned __int16)(*(_WORD *)v97 + v92);
            v97 += 2;
            --v98;
          }
          while (v98);
LABEL_110:
          v99 = (AGX::FenceList *)v77[2646];
          v59 = (void **)(v198 + 5328);
          if (v99)
          {
            v100 = *(_QWORD *)(v17 + 21168);
            if (!v100)
            {
              v100 = operator new();
              v101 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v100, 0x208uLL);
              *(_QWORD *)(v100 + 520) = v101;
              *(_DWORD *)(v100 + 528) = 0;
              *(_QWORD *)(v17 + 21168) = v100;
              v99 = (AGX::FenceList *)v77[2646];
            }
            AGX::FenceList::merge((AGX::FenceList *)v100, v99);
          }
          v102 = (AGX::FenceList *)v77[2650];
          if (v102)
          {
            v103 = *(_QWORD *)(v17 + 21200);
            if (!v103)
            {
              v103 = operator new();
              v104 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v103, 0x208uLL);
              *(_QWORD *)(v103 + 520) = v104;
              *(_DWORD *)(v103 + 528) = 0;
              *(_QWORD *)(v17 + 21200) = v103;
              v102 = (AGX::FenceList *)v77[2650];
            }
            AGX::FenceList::merge((AGX::FenceList *)v103, v102);
          }
          v105 = (AGX::FenceList *)v77[2647];
          if (v105)
          {
            v106 = *(_QWORD *)(v17 + 21176);
            if (!v106)
            {
              v106 = operator new();
              v107 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v106, 0x208uLL);
              *(_QWORD *)(v106 + 520) = v107;
              *(_DWORD *)(v106 + 528) = 0;
              *(_QWORD *)(v17 + 21176) = v106;
              v105 = (AGX::FenceList *)v77[2647];
            }
            AGX::FenceList::merge((AGX::FenceList *)v106, v105);
          }
          v108 = (AGX::FenceList *)v77[2651];
          if (v108)
          {
            v109 = *(_QWORD *)(v17 + 21208);
            if (!v109)
            {
              v109 = operator new();
              v110 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v109, 0x208uLL);
              *(_QWORD *)(v109 + 520) = v110;
              *(_DWORD *)(v109 + 528) = 0;
              *(_QWORD *)(v17 + 21208) = v109;
              v108 = (AGX::FenceList *)v77[2651];
            }
            AGX::FenceList::merge((AGX::FenceList *)v109, v108);
          }
          v111 = (AGX::FenceList *)v77[2648];
          if (v111)
          {
            v112 = *(_QWORD *)(v17 + 21184);
            if (!v112)
            {
              v112 = operator new();
              v113 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v112, 0x208uLL);
              *(_QWORD *)(v112 + 520) = v113;
              *(_DWORD *)(v112 + 528) = 0;
              *(_QWORD *)(v17 + 21184) = v112;
              v111 = (AGX::FenceList *)v77[2648];
            }
            AGX::FenceList::merge((AGX::FenceList *)v112, v111);
          }
          v114 = (AGX::FenceList *)v77[2652];
          if (v114)
          {
            v115 = *(_QWORD *)(v17 + 21216);
            if (!v115)
            {
              v115 = operator new();
              v116 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v115, 0x208uLL);
              *(_QWORD *)(v115 + 520) = v116;
              *(_DWORD *)(v115 + 528) = 0;
              *(_QWORD *)(v17 + 21216) = v115;
              v114 = (AGX::FenceList *)v77[2652];
            }
            AGX::FenceList::merge((AGX::FenceList *)v115, v114);
          }
          v117 = (AGX::FenceList *)v77[2649];
          if (v117)
          {
            v118 = *(_QWORD *)(v17 + 21192);
            if (!v118)
            {
              v118 = operator new();
              v119 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v118, 0x208uLL);
              *(_QWORD *)(v118 + 520) = v119;
              *(_DWORD *)(v118 + 528) = 0;
              *(_QWORD *)(v17 + 21192) = v118;
              v117 = (AGX::FenceList *)v77[2649];
            }
            AGX::FenceList::merge((AGX::FenceList *)v118, v117);
          }
          v120 = (AGX::FenceList *)v77[2653];
          if (v120)
          {
            v121 = *(_QWORD *)(v17 + 21224);
            if (!v121)
            {
              v121 = operator new();
              v122 = *(_QWORD *)(*(_QWORD *)(v17 + 1456) + 808) + 6192;
              bzero((void *)v121, 0x208uLL);
              *(_QWORD *)(v121 + 520) = v122;
              *(_DWORD *)(v121 + 528) = 0;
              *(_QWORD *)(v17 + 21224) = v121;
              v120 = (AGX::FenceList *)v77[2653];
            }
            AGX::FenceList::merge((AGX::FenceList *)v121, v120);
          }
          v68 = v211;
          v58 = v209 | (*(_BYTE *)(*(_QWORD *)(v211 + 8 * v75++) + 21257) != 0);
          v57 = v206;
        }
        while (v75 != v206);
      }
LABEL_86:
      v76 = (v58 & 1) == 0 && *(_BYTE *)(v198 + 4431) != 0;
      if ((*(_QWORD *)(v198 + 4464) & 0xFFFFFFFFFELL) != 0)
        *(_QWORD *)(v198 + 4448) = *(_QWORD *)(v198 + 4448) & 0xFFFFFFFFFFFFFFFELL | v76;
      v126 = v69[128];
      v127 = v69[130] + v126;
      v69[128] = v126 + 12;
      v128 = *(_QWORD *)((char *)v69 + 1876);
      *(_DWORD *)(v126 + 8) = *((_DWORD *)v69 + 471);
      *(_QWORD *)v126 = v128;
      v129 = (unint64_t *)v69[8];
      v69[8] = v129 + 1;
      *v129 = __ROR8__(v127, 32) & 0xFFFFFFFC000000FFLL | 0x300;
      v130 = (_DWORD *)v69[8];
      v69[8] = v130 + 1;
      *v130 = *((_DWORD *)v69 + 472);
      if (v57 < v207)
      {
        v131 = *(_OWORD **)(v17 + 2664);
        v132 = *(_OWORD *)((char *)v131 + 1368);
        v131[42] = *(_OWORD *)((char *)v131 + 1352);
        v131[43] = v132;
        v131[44] = *(_OWORD *)((char *)v131 + 1384);
        v133 = *(_QWORD *)(v17 + 2664);
        *(_BYTE *)(v133 + 1578) = 0;
        v134 = *(_OWORD *)(v133 + 1416);
        *(_OWORD *)(v133 + 496) = *(_OWORD *)(v133 + 1400);
        *(_OWORD *)(v133 + 512) = v134;
        v135 = *(_OWORD *)(v133 + 1512);
        *(_OWORD *)(v133 + 592) = *(_OWORD *)(v133 + 1496);
        *(_OWORD *)(v133 + 608) = v135;
        v136 = *(_OWORD *)(v133 + 1480);
        *(_OWORD *)(v133 + 560) = *(_OWORD *)(v133 + 1464);
        *(_OWORD *)(v133 + 576) = v136;
        v137 = *(_OWORD *)(v133 + 1448);
        *(_OWORD *)(v133 + 528) = *(_OWORD *)(v133 + 1432);
        *(_OWORD *)(v133 + 544) = v137;
      }
      v138 = v57 >= v207;
      AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::endRenderPassCommon(v17, v138, 0, 0);
      v139 = AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::commitCommon(v17, v138);
      v140 = *(void **)(v197 + 8 * v200);
      objc_msgSend(v140, "getCurrentKernelCommandBufferStart:current:end:", &v213, &v214, &v215, v139);
      v142 = v213;
      v141 = v214;
      v143 = (_QWORD *)objc_msgSend(v140, "commandBufferStorage");
      v144 = v143;
      if (v143[8])
      {
        v145 = v143[10] - v143[9];
        v212[0] = objc_msgSend(v199, "commandBufferStorage");
        v212[1] = v212[0] + 64;
        v146 = *(_DWORD *)(v212[0] + 80) - *(_DWORD *)(v212[0] + 72);
        v147 = (void *)AGX::SidebandBufferAllocator::allocate((AGX::SidebandBufferAllocator *)v212, v145, 8u, 0);
        memcpy(v147, (const void *)v144[9], v145);
      }
      else
      {
        v146 = 0;
      }
      v148 = v141 - (_DWORD)v142;
      if (v142[1] >= v141 - (int)v142)
      {
        v158 = *v59;
        v159 = (v141 - (_DWORD)v142);
        if ((unint64_t)*v59 + v148 <= *v203)
        {
          v1 = v196;
          v160 = v199;
        }
        else
        {
          v160 = v199;
          objc_msgSend(v199, "setCurrentKernelCommandBufferPointer:");
          objc_msgSend(v199, "growKernelCommandBuffer:", v159);
          objc_msgSend(v199, "getCurrentKernelCommandBufferStart:current:end:", v201, v59, v203);
          v158 = *v59;
          v1 = v196;
        }
        objc_msgSend(v160, "beginSegment:", v158);
        objc_msgSend(v160, "ioGPUResourceList");
        objc_msgSend(v140, "ioGPUResourceList");
        IOGPUResourceListMergeLists();
        memcpy(*v59, v213, v159);
        v161 = (id *)v160[86];
        v7 = *(unsigned __int8 *)v161;
        if (*(_BYTE *)v161)
        {
          if ((objc_msgSend(v161[1], "ownedByParallelEncoder") & 1) != 0)
          {
            v7 = 0;
          }
          else
          {
            *(_BYTE *)v161 = 0;
            v7 = 4;
          }
        }
        v8 = *v59;
        v8[2] = v7;
        *v59 = (char *)v8 + v159;
        objc_msgSend(v160, "setCurrentKernelCommandBufferPointer:");
        *(_DWORD *)(*(_QWORD *)(objc_msgSend(v160, "commandBufferStorage") + 128) + 16) = v146;
        objc_msgSend(v160, "endCurrentSegment");
      }
      else
      {
        v149 = v144[15];
        v150 = *(_DWORD *)(v149 + 8);
        v1 = v196;
        if (v150)
        {
          v151 = v149 + 16;
          do
          {
            v154 = *(unsigned int *)(v151 + 28);
            v155 = v142[1];
            v156 = *v59;
            if ((unint64_t)*v59 + v155 > *v203)
            {
              objc_msgSend(v199, "setCurrentKernelCommandBufferPointer:");
              objc_msgSend(v199, "growKernelCommandBuffer:", v155);
              objc_msgSend(v199, "getCurrentKernelCommandBufferStart:current:end:", v201, v59, v203);
              v156 = *v59;
            }
            objc_msgSend(v199, "beginSegment:", v156);
            objc_msgSend(v199, "ioGPUResourceList");
            IOGPUResourceListMerge();
            memcpy(*v59, v142, v142[1]);
            v157 = (id *)v199[86];
            v152 = *(unsigned __int8 *)v157;
            if (*(_BYTE *)v157)
            {
              if ((objc_msgSend(v157[1], "ownedByParallelEncoder") & 1) != 0)
              {
                v152 = 0;
              }
              else
              {
                *(_BYTE *)v157 = 0;
                v152 = 4;
              }
            }
            v153 = *v210;
            *(_DWORD *)(v153 + 8) = v152;
            *v210 = v142[1] + v153;
            objc_msgSend(v199, "setCurrentKernelCommandBufferPointer:");
            *(_DWORD *)(*(_QWORD *)(objc_msgSend(v199, "commandBufferStorage") + 128) + 16) = v146;
            objc_msgSend(v199, "endCurrentSegment");
            v142 = (unsigned int *)((char *)v142 + v142[1]);
            v151 += 32 + (v154 << 6);
            v59 = (void **)(v198 + 5328);
            --v150;
          }
          while (v150);
        }
      }
      v6 = v206;
    }
  }
  v188 = *(_QWORD **)(v1 + 32);
  if (v188[28] != v188[27])
  {
    v189 = 0;
    do
    {
      *(_QWORD *)(v188[30] + 8 * v189) = 0;

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 216) + 8 * v189++) = 0;
      v188 = *(_QWORD **)(v1 + 32);
    }
    while (v189 < (uint64_t)(v188[28] - v188[27]) >> 3);
  }
  v188[31] = v188[30];
  *(_QWORD *)(*(_QWORD *)(v1 + 32) + 224) = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 216);
}

void __92__AGXA10FamilyThreadedRenderPass_sampledRenderCommandEncoderWithProgramInfoBuffer_capacity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  _QWORD *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  uint64_t *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  _OWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;

  v2 = *(_QWORD *)(a1 + 32) + 216;
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 224);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  v5 = v4;
  if ((unint64_t)v4 >= v3)
  {
    v7 = *(_BYTE **)v2;
    v8 = (uint64_t)v4 - *(_QWORD *)v2;
    v9 = v8 >> 3;
    v10 = (v8 >> 3) + 1;
    if (v10 >> 61)
      goto LABEL_48;
    v11 = v3 - (_QWORD)v7;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 61)
        goto LABEL_49;
      v13 = operator new(8 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *v14 = *(_QWORD *)(a1 + 40);
    v6 = v14 + 1;
    if (v4 == (_QWORD *)v7)
    {
      v7 = v4;
    }
    else
    {
      v16 = (char *)v4 - v7 - 8;
      if (v16 < 0x58)
        goto LABEL_52;
      if ((unint64_t)((char *)v4 - v13 - v8) < 0x20)
        goto LABEL_52;
      v17 = (v16 >> 3) + 1;
      v5 = &v4[-(v17 & 0x3FFFFFFFFFFFFFFCLL)];
      v18 = &v13[8 * v9 - 16];
      v19 = (__int128 *)(v4 - 2);
      v20 = v17 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v21 = *v19;
        *(v18 - 1) = *(v19 - 1);
        *v18 = v21;
        v18 -= 2;
        v19 -= 2;
        v20 -= 4;
      }
      while (v20);
      v14 -= v17 & 0x3FFFFFFFFFFFFFFCLL;
      if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_52:
        do
        {
          v22 = *--v5;
          *--v14 = v22;
        }
        while (v5 != (_QWORD *)v7);
        v7 = *(_BYTE **)v2;
      }
    }
    *(_QWORD *)v2 = v14;
    *(_QWORD *)(v2 + 8) = v6;
    *(_QWORD *)(v2 + 16) = v15;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *v4 = *(_QWORD *)(a1 + 40);
    v6 = v4 + 1;
  }
  *(_QWORD *)(v2 + 8) = v6;
  v23 = *(_QWORD *)(a1 + 32) + 240;
  v24 = objc_msgSend(*(id *)(a1 + 40), "getImpl");
  v25 = v24;
  v27 = *(uint64_t **)(v23 + 8);
  v26 = *(_QWORD *)(v23 + 16);
  if ((unint64_t)v27 < v26)
  {
    *v27 = v24;
    v28 = v27 + 1;
    goto LABEL_47;
  }
  v29 = *(uint64_t **)v23;
  v30 = (uint64_t)v27 - *(_QWORD *)v23;
  v31 = v30 >> 3;
  v32 = (v30 >> 3) + 1;
  if (v32 >> 61)
LABEL_48:
    abort();
  v33 = v26 - (_QWORD)v29;
  if (v33 >> 2 > v32)
    v32 = v33 >> 2;
  if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
    v34 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v34 = v32;
  if (!v34)
  {
    v35 = 0;
    goto LABEL_36;
  }
  if (v34 >> 61)
LABEL_49:
    std::__throw_bad_array_new_length[abi:nn180100]();
  v35 = operator new(8 * v34);
LABEL_36:
  v36 = (uint64_t *)&v35[8 * v31];
  v37 = &v35[8 * v34];
  *v36 = v25;
  v28 = v36 + 1;
  if (v27 == v29)
  {
    v29 = v27;
  }
  else
  {
    v38 = (char *)v27 - (char *)v29 - 8;
    if (v38 < 0x58)
      goto LABEL_53;
    if ((unint64_t)((char *)v27 - v35 - v30) < 0x20)
      goto LABEL_53;
    v39 = (v38 >> 3) + 1;
    v40 = &v35[8 * v31 - 16];
    v41 = v27 - 2;
    v42 = v39 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v43 = *(_OWORD *)v41;
      *(v40 - 1) = *((_OWORD *)v41 - 1);
      *v40 = v43;
      v40 -= 2;
      v41 -= 4;
      v42 -= 4;
    }
    while (v42);
    v36 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    v27 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_53:
      do
      {
        v44 = *--v27;
        *--v36 = v44;
      }
      while (v27 != v29);
      v29 = *(uint64_t **)v23;
    }
  }
  *(_QWORD *)v23 = v36;
  *(_QWORD *)(v23 + 8) = v28;
  *(_QWORD *)(v23 + 16) = v37;
  if (v29)
    operator delete(v29);
LABEL_47:
  *(_QWORD *)(v23 + 8) = v28;
}

void __54__AGXA10FamilyThreadedRenderPass_renderCommandEncoder__block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  _QWORD *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  uint64_t *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  _OWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;

  v2 = *(_QWORD *)(a1 + 32) + 216;
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 224);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  v5 = v4;
  if ((unint64_t)v4 >= v3)
  {
    v7 = *(_BYTE **)v2;
    v8 = (uint64_t)v4 - *(_QWORD *)v2;
    v9 = v8 >> 3;
    v10 = (v8 >> 3) + 1;
    if (v10 >> 61)
      goto LABEL_48;
    v11 = v3 - (_QWORD)v7;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 61)
        goto LABEL_49;
      v13 = operator new(8 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *v14 = *(_QWORD *)(a1 + 40);
    v6 = v14 + 1;
    if (v4 == (_QWORD *)v7)
    {
      v7 = v4;
    }
    else
    {
      v16 = (char *)v4 - v7 - 8;
      if (v16 < 0x58)
        goto LABEL_52;
      if ((unint64_t)((char *)v4 - v13 - v8) < 0x20)
        goto LABEL_52;
      v17 = (v16 >> 3) + 1;
      v5 = &v4[-(v17 & 0x3FFFFFFFFFFFFFFCLL)];
      v18 = &v13[8 * v9 - 16];
      v19 = (__int128 *)(v4 - 2);
      v20 = v17 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v21 = *v19;
        *(v18 - 1) = *(v19 - 1);
        *v18 = v21;
        v18 -= 2;
        v19 -= 2;
        v20 -= 4;
      }
      while (v20);
      v14 -= v17 & 0x3FFFFFFFFFFFFFFCLL;
      if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_52:
        do
        {
          v22 = *--v5;
          *--v14 = v22;
        }
        while (v5 != (_QWORD *)v7);
        v7 = *(_BYTE **)v2;
      }
    }
    *(_QWORD *)v2 = v14;
    *(_QWORD *)(v2 + 8) = v6;
    *(_QWORD *)(v2 + 16) = v15;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *v4 = *(_QWORD *)(a1 + 40);
    v6 = v4 + 1;
  }
  *(_QWORD *)(v2 + 8) = v6;
  v23 = *(_QWORD *)(a1 + 32) + 240;
  v24 = objc_msgSend(*(id *)(a1 + 40), "getImpl");
  v25 = v24;
  v27 = *(uint64_t **)(v23 + 8);
  v26 = *(_QWORD *)(v23 + 16);
  if ((unint64_t)v27 < v26)
  {
    *v27 = v24;
    v28 = v27 + 1;
    goto LABEL_47;
  }
  v29 = *(uint64_t **)v23;
  v30 = (uint64_t)v27 - *(_QWORD *)v23;
  v31 = v30 >> 3;
  v32 = (v30 >> 3) + 1;
  if (v32 >> 61)
LABEL_48:
    abort();
  v33 = v26 - (_QWORD)v29;
  if (v33 >> 2 > v32)
    v32 = v33 >> 2;
  if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
    v34 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v34 = v32;
  if (!v34)
  {
    v35 = 0;
    goto LABEL_36;
  }
  if (v34 >> 61)
LABEL_49:
    std::__throw_bad_array_new_length[abi:nn180100]();
  v35 = operator new(8 * v34);
LABEL_36:
  v36 = (uint64_t *)&v35[8 * v31];
  v37 = &v35[8 * v34];
  *v36 = v25;
  v28 = v36 + 1;
  if (v27 == v29)
  {
    v29 = v27;
  }
  else
  {
    v38 = (char *)v27 - (char *)v29 - 8;
    if (v38 < 0x58)
      goto LABEL_53;
    if ((unint64_t)((char *)v27 - v35 - v30) < 0x20)
      goto LABEL_53;
    v39 = (v38 >> 3) + 1;
    v40 = &v35[8 * v31 - 16];
    v41 = v27 - 2;
    v42 = v39 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v43 = *(_OWORD *)v41;
      *(v40 - 1) = *((_OWORD *)v41 - 1);
      *v40 = v43;
      v40 -= 2;
      v41 -= 4;
      v42 -= 4;
    }
    while (v42);
    v36 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    v27 -= v39 & 0x3FFFFFFFFFFFFFFCLL;
    if (v39 != (v39 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_53:
      do
      {
        v44 = *--v27;
        *--v36 = v44;
      }
      while (v27 != v29);
      v29 = *(uint64_t **)v23;
    }
  }
  *(_QWORD *)v23 = v36;
  *(_QWORD *)(v23 + 8) = v28;
  *(_QWORD *)(v23 + 16) = v37;
  if (v29)
    operator delete(v29);
LABEL_47:
  *(_QWORD *)(v23 + 8) = v28;
}

@end
