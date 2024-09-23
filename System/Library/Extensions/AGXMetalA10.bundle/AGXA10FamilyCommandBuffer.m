@implementation AGXA10FamilyCommandBuffer

- (void)dealloc
{
  MTLDevice *v3;
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  self->_previousComputeCommandEncoder = 0;
  self->_previousBlitCommandEncoder = 0;
  -[AGXA10FamilyRenderContext deferredEndEncoding:](self->_previousRenderCommandEncoder, "deferredEndEncoding:", 0);

  self->_previousRenderCommandEncoder = 0;
  v3 = -[IOGPUMetalCommandBuffer device](self, "device");
  impl = self->_impl;
  if (impl)
  {
    v5 = *((_QWORD *)v3 + 101);
    v6 = impl[5];
    v7 = impl[6];
    impl[5] = 0;
    impl[6] = 0;
    if (v6 > 0 || v7 >= 1)
    {
      if (v6)
      {
        do
        {
          v9 = __ldaxr(&AGX::BackgroundObjectProgramVariant<AGX::G9::Encoders,AGX::G9::Classes>::liveUberVariantUses);
          v10 = v9 - v6;
        }
        while (__stlxr(v10, &AGX::BackgroundObjectProgramVariant<AGX::G9::Encoders,AGX::G9::Classes>::liveUberVariantUses));
        if (!v10)
        {
          v11 = *(NSObject **)(v5 + 6984);
          v12 = dispatch_time(0, 1000000000);
          dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
      }
      if (v7)
      {
        do
        {
          v13 = __ldaxr(&AGX::EndOfTileProgramVariant<AGX::G9::Encoders,AGX::G9::Classes>::liveUberVariantUses);
          v14 = v13 - v7;
        }
        while (__stlxr(v14, &AGX::EndOfTileProgramVariant<AGX::G9::Encoders,AGX::G9::Classes>::liveUberVariantUses));
        if (!v14)
        {
          v15 = *(NSObject **)(v5 + 6992);
          v16 = dispatch_time(0, 1000000000);
          dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        }
      }
      impl = self->_impl;
    }
    v17 = (void *)impl[9];
    if (!v17 || (impl[10] = v17, operator delete(v17), (impl = self->_impl) != 0))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 5644));
      v18 = *(unsigned int *)(v5 + 5640);
      if (v18 > 7)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 5644));
        free(impl);
      }
      else
      {
        *(_DWORD *)(v5 + 5640) = v18 + 1;
        *(_QWORD *)(v5 + 8 * v18 + 5648) = impl;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 5644));
      }
    }
    self->_impl = 0;
  }
  objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD838]), "device"), "alertCommandBufferActivityComplete");
  v19 = (int)*MEMORY[0x24BDDD818];

  *(Class *)((char *)&self->super.super.super.super.isa + v19) = 0;
  v20.receiver = self;
  v20.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer dealloc](&v20, sel_dealloc);
}

- (unint64_t)getSupportedAndEnabledErrorOptions
{
  MTLDevice *v3;

  v3 = -[IOGPUMetalCommandBuffer device](self, "device");
  return *(_QWORD *)(*((_QWORD *)v3 + 101) + 6792) & -[_MTLCommandBuffer errorOptions](self, "errorOptions");
}

- (void)commit
{
  MTLDevice *v3;
  MTLCommandQueue *v4;
  MTLCommandQueue *v5;
  unint64_t *v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  _BYTE *impl;
  int v16;
  int v17;
  unsigned __int8 v18;
  id *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  vector<AGXA10FamilyTexture *, std::allocator<AGXA10FamilyTexture *>> *p_texturesToEvaluate;
  unsigned __int8 v31;
  id *begin;
  __end_cap_ **var0;
  uint64_t v34;
  _BYTE *v35;
  int v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  objc_super v48;
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  objc_super v58;
  _QWORD v59[5];
  uint64_t block;
  uint64_t v61;
  void (*v62)(uint64_t);
  void *v63;
  unint64_t *v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer validate](&v58, sel_validate);
  v3 = -[IOGPUMetalCommandBuffer device](self, "device");
  v4 = -[_MTLCommandBuffer commandQueue](self, "commandQueue");
  v5 = v4;
  v6 = (unint64_t *)((char *)v3 + 816);
  v7 = *((_DWORD *)v4 + 111);
  v8 = (unsigned int *)((char *)v3 + 864);
  if (v7 <= 1)
    v7 = 1;
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 | v7, v8));
  v11 = self->_telemetryUsage.usage[0];
  v10 = self->_telemetryUsage.usage[1];
  do
    v12 = __ldaxr(v6);
  while (__stlxr(v12 | v11, v6));
  v13 = (unint64_t *)((char *)v3 + 824);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 | v10, v13));
  if (!*((_BYTE *)v4 + 968))
  {
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken[0] != -1)
      dispatch_once(AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken, &__block_literal_global_5209);
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::shouldCapture)
    {
      v25 = atomic_load(AGXATelemetry::backtracesCaptured);
      if (v25 <= 9)
      {
        v26 = MEMORY[0x24BDAC760];
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = ___ZN13AGXATelemetry26telemetryEmitBacktraceInfoEPK26AGXATelemetryBacktraceInfo_block_invoke;
        v59[3] = &__block_descriptor_40_e5_v8__0l;
        v59[4] = (char *)v3 + 816;
        if (AGXATelemetry::telemetryEmitBacktraceInfo(AGXATelemetryBacktraceInfo const*)::onceToken != -1)
          dispatch_once(&AGXATelemetry::telemetryEmitBacktraceInfo(AGXATelemetryBacktraceInfo const*)::onceToken, v59);
        v27 = malloc_type_malloc(0x208uLL, 0x1080040751F5E6CuLL);
        v28 = v27;
        if (v27)
        {
          memcpy(v27, (char *)v5 + 448, 0x208uLL);
          v29 = v6[9];
          block = v26;
          v61 = 3221225472;
          v62 = ___ZN13AGXATelemetry26telemetryEmitBacktraceInfoEPK26AGXATelemetryBacktraceInfo_block_invoke_2;
          v63 = &__block_descriptor_48_e5_v8__0l;
          v64 = v6;
          v65 = v28;
          dispatch_async(v29, &block);
        }
        *((_BYTE *)v5 + 968) = 1;
      }
    }
  }
  impl = self->_impl;
  if (impl[20])
  {
    impl[20] = 1;
    v16 = *((_DWORD *)impl + 4);
    v17 = *((_DWORD *)v5 + 243);
    if (v16 != v17)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        impl[20] = 1;
        LODWORD(block) = 67109376;
        HIDWORD(block) = v16;
        LOWORD(v61) = 1024;
        *(_DWORD *)((char *)&v61 + 2) = v17;
        _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: MTLComputeEncoder encoded with priority %u, but MTLCommandQueue is currently set to priority %u, could result in suboptimal perf or higher than expected memory footprint!\n", (uint8_t *)&block, 0xEu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v35 = self->_impl;
        v35[20] = 1;
        LODWORD(v35) = *((_DWORD *)v35 + 4);
        v36 = *((_DWORD *)v5 + 243);
        LODWORD(block) = 67109376;
        HIDWORD(block) = (_DWORD)v35;
        LOWORD(v61) = 1024;
        *(_DWORD *)((char *)&v61 + 2) = v36;
        _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: MTLComputeEncoder encoded with priority %u, but MTLCommandQueue is currently set to priority %u, could result in suboptimal perf or higher than expected memory footprint!\n", (uint8_t *)&block, 0xEu);
      }
    }
  }
  {
    -[AGXA10FamilyCommandBuffer commit]::dcmp_check_mode = 0;
  }
  if (-[AGXA10FamilyCommandBuffer commit]::dcmp_check_mode)
  {
    p_texturesToEvaluate = &self->texturesToEvaluate;
    if (self->texturesToEvaluate.__begin_ != self->texturesToEvaluate.var0)
    {
      v47 = -[AGXA10FamilyCommandBuffer blitCommandEncoder](self, "blitCommandEncoder");
      if ((v31 & 1) == 0
      {
        -[AGXA10FamilyCommandBuffer commit]::dcmp_check_pixel_format = 0;
      }
      if (!v47)
        abort();
      begin = (id *)p_texturesToEvaluate->__begin_;
      var0 = self->texturesToEvaluate.var0;
      if (p_texturesToEvaluate->__begin_ != var0)
      {
        v34 = -[AGXA10FamilyCommandBuffer commit]::dcmp_check_pixel_format;
        do
        {
          v37 = *begin;
          if (!(_DWORD)v34 || objc_msgSend(*begin, "pixelFormat") == v34)
          {
            if (objc_msgSend(v37, "pixelFormat") == 550 && objc_msgSend(v37, "iosurface"))
            {
              v38 = (void *)objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 554, objc_msgSend(v37, "width"), objc_msgSend(v37, "height"), 0);
              objc_msgSend(v38, "setUsage:", objc_msgSend(v37, "usage"));
              objc_msgSend(v38, "setStorageMode:", objc_msgSend(v37, "storageMode"));
              v39 = (id)objc_msgSend((id)objc_msgSend(v37, "device"), "newTextureWithDescriptor:iosurface:plane:", v38, objc_msgSend(v37, "iosurface"), 0);
              objc_msgSend(v38, "setPixelFormat:", 1);
              v40 = (id)objc_msgSend((id)objc_msgSend(v37, "device"), "newTextureWithDescriptor:iosurface:plane:", v38, objc_msgSend(v37, "iosurface"), 1);
              memset(v57, 0, sizeof(v57));
              v41 = objc_msgSend(v37, "width");
              v42 = objc_msgSend(v37, "height");
              v56[0] = v41;
              v56[1] = v42;
              v56[2] = 1;
              memset(v55, 0, sizeof(v55));
              objc_msgSend(v47, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v39, 0, 0, v57, v56, v39, 0, 0, v55);
              memset(v54, 0, sizeof(v54));
              v43 = objc_msgSend(v37, "width");
              v44 = objc_msgSend(v37, "height");
              v53[0] = v43;
              v53[1] = v44;
              v53[2] = 1;
              memset(v52, 0, sizeof(v52));
              objc_msgSend(v47, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v40, 0, 0, v54, v53, v40, 0, 0, v52);
            }
            else
            {
              memset(v51, 0, sizeof(v51));
              v45 = objc_msgSend(v37, "width");
              v46 = objc_msgSend(v37, "height");
              v50[0] = v45;
              v50[1] = v46;
              v50[2] = 1;
              memset(v49, 0, sizeof(v49));
              objc_msgSend(v47, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v37, 0, 0, v51, v50, v37, 0, 0, v49);
            }
          }
          ++begin;
        }
        while (begin != (id *)var0);
      }
      objc_msgSend(v47, "endEncoding");
    }
  }
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  if ((-[AGXA10FamilyCommandBuffer getSupportedAndEnabledErrorOptions](self, "getSupportedAndEnabledErrorOptions") & 1) != 0)
  {
    v19 = (id *)self->_impl;
    objc_msgSend(v19[1], "allocDebugBuffer");
    block = 0;
    v59[0] = 0;
    objc_msgSend(v19[1], "getDebugBufferPointerStart:end:", &block, v59);
    v20 = objc_msgSend(v19[1], "commandBufferStorage");
    if (block)
    {
      if (v59[0])
      {
        v21 = v59[0] - block;
        if (v59[0] - block >= 1)
        {
          if ((v22 = (16 * (((unint64_t)(2 * *(_DWORD *)(v20 + 840)) >> 1) & 0x7FFFFFFF)) | 8,
                v22 > v21)
            && ((objc_msgSend(v19[1], "growDebugBuffer:", (v22 - v21)),
                 objc_msgSend(v19[1], "getDebugBufferPointerStart:end:", &block, v59),
                 v21 = v59[0] - block,
                 block)
              ? (v23 = v59[0] == 0)
              : (v23 = 1),
                !v23 ? (v24 = 0) : (v24 = 1),
                (v24 & 1) != 0)
            || (uint64_t)v21 < (uint64_t)v22)
          {
            AGX::CommandBuffer<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::prepareDebugBufferForSubmission(void)::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion _debugBufferStart __ nullptr && debugBufferEnd __ nullptr && ptrDelta(debugBufferStart_ debugBufferEnd) __ static_cast_intptr_t_(requiredDebugBufferSize)_]();
          }
        }
      }
    }
  }
  v48.receiver = self;
  v48.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer commit](&v48, sel_commit);
}

- (void)commitWithDeadline:(unint64_t)a3
{
  -[AGXA10FamilyCommandBuffer setDeadline:](self, "setDeadline:", a3);
  -[AGXA10FamilyCommandBuffer setDeadline_namespace_id:](self, "setDeadline_namespace_id:", *((unsigned int *)self->_impl + 16));
  -[AGXA10FamilyCommandBuffer commit](self, "commit");
}

- (void)getDriverEncoderInfoData:(id)a3
{
  _QWORD *impl;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  float *v9;
  int8x8_t v10;
  uint8x8_t v11;
  unint64_t v12;
  uint64_t v13;
  void **v14;
  float *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  float *v23;
  float *v24;
  unint64_t v25;
  unint64_t v26;
  float *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  int8x8_t v34;
  uint8x8_t v35;
  unint64_t v36;
  uint64_t ***v37;
  uint64_t **v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  _QWORD *v48;
  _QWORD *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  uint64_t v56;
  float *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, _QWORD *);
  void (*v60)(uint64_t);
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  int v64;
  _OWORD v65[8];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  impl = self->_impl;
  v56 = 0;
  v57 = (float *)&v56;
  v58 = 0x5812000000;
  v59 = __Block_byref_object_copy__493;
  v60 = __Block_byref_object_dispose__494;
  v61 = 0u;
  v62 = 0u;
  v63 = 0;
  v64 = 1065353216;
  v5 = (void *)impl[1];
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = ___ZNK3AGX13CommandBufferINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE39processDebugBufferAndUpdateEncoderInfosEP7NSArrayIPU38objcproto27MTLCommandBufferEncoderInfo11objc_objectE_block_invoke;
  v55[3] = &unk_2504001E0;
  v55[4] = &v56;
  *(_QWORD *)&v65[0] = 0;
  *(_QWORD *)&v51 = 0;
  objc_msgSend(v5, "getDebugBufferPointerStart:end:", v65, &v51);
  if (*(_QWORD *)&v65[0] && (_QWORD)v51 && (uint64_t)(v51 - *(_QWORD *)&v65[0]) >= 8)
    ___ZNK3AGX13CommandBufferINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE39processDebugBufferAndUpdateEncoderInfosEP7NSArrayIPU38objcproto27MTLCommandBufferEncoderInfo11objc_objectE_block_invoke((uint64_t)v55, *(unsigned int **)&v65[0], v51 - *(_QWORD *)&v65[0]);
  v7 = impl[9];
  v6 = impl[10];
LABEL_7:
  while (v7 != v6)
  {
    if (**(_BYTE **)v7)
    {
      v7 += 24;
      continue;
    }
    v8 = *(_QWORD *)(v7 + 16);
    v9 = v57;
    v10 = *(int8x8_t *)(v57 + 14);
    if (!*(_QWORD *)&v10)
      goto LABEL_29;
    v11 = (uint8x8_t)vcnt_s8(v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v12 = *(_QWORD *)(v7 + 16);
      if (v8 >= *(_QWORD *)&v10)
        v12 = v8 % *(_QWORD *)&v10;
    }
    else
    {
      v12 = (*(_QWORD *)&v10 - 1) & v8;
    }
    v13 = *((_QWORD *)v57 + 6);
    v14 = *(void ***)(v13 + 8 * v12);
    if (!v14 || (v15 = (float *)*v14) == 0)
    {
LABEL_29:
      v19 = v7 + 24;
      while (v19 != v6)
      {
        v20 = *(_QWORD *)(v19 + 16);
        v19 += 24;
        if (v20 != v8)
        {
          v7 = v19 - 24;
          goto LABEL_7;
        }
      }
      break;
    }
    v16 = *(_QWORD *)&v10 - 1;
    if (v11.u32[0] < 2uLL)
    {
      while (1)
      {
        v17 = *((_QWORD *)v15 + 1);
        if (v17 == v8)
        {
          if (*((_QWORD *)v15 + 2) == v8)
            goto LABEL_33;
        }
        else if ((v17 & v16) != v12)
        {
          goto LABEL_29;
        }
        v15 = *(float **)v15;
        if (!v15)
          goto LABEL_29;
      }
    }
    while (1)
    {
      v18 = *((_QWORD *)v15 + 1);
      if (v18 == v8)
        break;
      if (v18 >= *(_QWORD *)&v10)
        v18 %= *(_QWORD *)&v10;
      if (v18 != v12)
        goto LABEL_29;
LABEL_24:
      v15 = *(float **)v15;
      if (!v15)
        goto LABEL_29;
    }
    if (*((_QWORD *)v15 + 2) != v8)
      goto LABEL_24;
LABEL_33:
    if (v11.u32[0] > 1uLL)
    {
      v21 = *(_QWORD *)(v7 + 16);
      if (v8 >= *(_QWORD *)&v10)
        v21 = v8 % *(_QWORD *)&v10;
    }
    else
    {
      v21 = v16 & v8;
    }
    v22 = *((_BYTE *)v15 + 24);
    v23 = *(float **)(v13 + 8 * v21);
    do
    {
      v24 = v23;
      v23 = *(float **)v23;
    }
    while (v23 != v15);
    if (v24 == v57 + 16)
      goto LABEL_50;
    v25 = *((_QWORD *)v24 + 1);
    if (v11.u32[0] > 1uLL)
    {
      if (v25 >= *(_QWORD *)&v10)
        v25 %= *(_QWORD *)&v10;
    }
    else
    {
      v25 &= v16;
    }
    if (v25 != v21)
    {
LABEL_50:
      if (!*(_QWORD *)v15)
        goto LABEL_51;
      v26 = *(_QWORD *)(*(_QWORD *)v15 + 8);
      if (v11.u32[0] > 1uLL)
      {
        if (v26 >= *(_QWORD *)&v10)
          v26 %= *(_QWORD *)&v10;
      }
      else
      {
        v26 &= v16;
      }
      if (v26 != v21)
LABEL_51:
        *(_QWORD *)(v13 + 8 * v21) = 0;
    }
    v27 = *(float **)v15;
    if (*(_QWORD *)v15)
    {
      v28 = *((_QWORD *)v27 + 1);
      if (v11.u32[0] > 1uLL)
      {
        if (v28 >= *(_QWORD *)&v10)
          v28 %= *(_QWORD *)&v10;
      }
      else
      {
        v28 &= v16;
      }
      if (v28 != v21)
      {
        *(_QWORD *)(*((_QWORD *)v9 + 6) + 8 * v28) = v24;
        v27 = *(float **)v15;
      }
    }
    *(_QWORD *)v24 = v27;
    *(_QWORD *)v15 = 0;
    --*((_QWORD *)v9 + 9);
    operator delete(v15);
    *(_QWORD *)&v65[0] = *(_QWORD *)(v7 + 8);
    BYTE8(v65[0]) = v22;
    std::__hash_table<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,AGXSDebugBuffer::KickStatus>>(v57 + 12, *(unint64_t *)&v65[0], v65);
    v7 += 24;
    v6 = impl[10];
    if (v7 == v6)
      break;
    while (*(_QWORD *)(v7 + 16) == v8)
    {
      if (!**(_BYTE **)v7)
      {
        *(_QWORD *)&v65[0] = *(_QWORD *)(v7 + 8);
        BYTE8(v65[0]) = 0;
        std::__hash_table<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,AGXSDebugBuffer::KickStatus>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,AGXSDebugBuffer::KickStatus>>(v57 + 12, *(unint64_t *)&v65[0], v65);
        v6 = impl[10];
      }
      v7 += 24;
      if (v7 == v6)
        goto LABEL_64;
    }
  }
LABEL_64:
  if (*((_QWORD *)v57 + 9))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v29 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    if (!v29)
      goto LABEL_105;
    v30 = *(_QWORD *)v52;
    while (1)
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(a3);
        v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v31);
        v33 = objc_msgSend(v32, "uniqueID");
        v34 = *(int8x8_t *)(v57 + 14);
        if (!*(_QWORD *)&v34)
          goto LABEL_90;
        v35 = (uint8x8_t)vcnt_s8(v34);
        v35.i16[0] = vaddlv_u8(v35);
        if (v35.u32[0] > 1uLL)
        {
          v36 = v33;
          if (v33 >= *(_QWORD *)&v34)
            v36 = v33 % *(_QWORD *)&v34;
        }
        else
        {
          v36 = (*(_QWORD *)&v34 - 1) & v33;
        }
        v37 = *(uint64_t ****)(*((_QWORD *)v57 + 6) + 8 * v36);
        if (!v37 || (v38 = *v37) == 0)
        {
LABEL_90:
          v42 = 1;
          goto LABEL_91;
        }
        if (v35.u32[0] < 2uLL)
        {
          v39 = *(_QWORD *)&v34 - 1;
          while (1)
          {
            v41 = v38[1];
            if (v41 == (uint64_t *)v33)
            {
              if (v38[2] == (uint64_t *)v33)
                goto LABEL_93;
            }
            else if (((unint64_t)v41 & v39) != v36)
            {
              goto LABEL_90;
            }
            v38 = (uint64_t **)*v38;
            if (!v38)
              goto LABEL_90;
          }
        }
        while (1)
        {
          v40 = (unint64_t)v38[1];
          if (v40 == v33)
            break;
          if (v40 >= *(_QWORD *)&v34)
            v40 %= *(_QWORD *)&v34;
          if (v40 != v36)
            goto LABEL_90;
LABEL_80:
          v38 = (uint64_t **)*v38;
          if (!v38)
            goto LABEL_90;
        }
        if (v38[2] != (uint64_t *)v33)
          goto LABEL_80;
LABEL_93:
        v43 = *((unsigned __int8 *)v38 + 24);
        if (v43 >= 4)
          v42 = 0;
        else
          v42 = qword_232D76160[v43];
LABEL_91:
        objc_msgSend(v32, "setErrorState:", v42);
        ++v31;
      }
      while (v31 != v29);
      v44 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      v29 = v44;
      if (!v44)
        goto LABEL_105;
    }
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "setErrorState:", 1);
      }
      v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v45);
  }
LABEL_105:
  _Block_object_dispose(&v56, 8);
  v48 = (_QWORD *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    do
    {
      v49 = (_QWORD *)*v48;
      operator delete(v48);
      v48 = v49;
    }
    while (v49);
  }
  v50 = (void *)*((_QWORD *)&v61 + 1);
  *((_QWORD *)&v61 + 1) = 0;
  if (v50)
    operator delete(v50);
}

- (AGXA10FamilyCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  AGXA10FamilyCommandBuffer *v5;
  AGXA10FamilyCommandBuffer *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  _BYTE *v12;
  int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AGXA10FamilyCommandBuffer;
  v5 = -[IOGPUMetalCommandBuffer initWithQueue:retainedReferences:](&v15, sel_initWithQueue_retainedReferences_, a3, a4);
  v6 = v5;
  if (v5)
  {
    v7 = -[_MTLCommandBuffer commandQueue](v5, "commandQueue");
    v8 = (_QWORD *)objc_msgSend(a3, "device");
    v9 = v8[101];
    if (*(_QWORD *)(v9 + 5632) <= 0x67uLL)
    {
      v6->_impl = 0;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v9 + 5644));
      v10 = *(_DWORD *)(v9 + 5640);
      if (v10)
      {
        v11 = v10 - 1;
        *(_DWORD *)(v9 + 5640) = v11;
        v12 = *(_BYTE **)(v9 + 8 * v11 + 5648);
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 5644));
        if (v12)
        {
          bzero(v12, *(_QWORD *)(v9 + 5632));
          v6->_impl = v12;
LABEL_8:
          v13 = *(_DWORD *)(v7 + 972);
          *v12 = 1;
          *((_QWORD *)v12 + 1) = v6;
          *((_DWORD *)v12 + 4) = v13;
          v12[20] = 0;
          *((_QWORD *)v12 + 6) = 0;
          *((_QWORD *)v12 + 7) = 0;
          *((_QWORD *)v12 + 5) = 0;
          *((_DWORD *)v12 + 16) = 0;
          *((_QWORD *)v12 + 10) = 0;
          *((_QWORD *)v12 + 11) = 0;
          *((_QWORD *)v12 + 9) = 0;
          v12[96] = 0;
LABEL_11:
          objc_msgSend(v8, "alertCommandBufferActivityStart");
          v6->deadline = 0;
          v6->deadline_namespace_id = 0;
          return v6;
        }
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 5644));
      }
      v12 = malloc_type_calloc(*(_QWORD *)(v9 + 5632), 1uLL, 0xC8454162uLL);
      v6->_impl = v12;
      if (v12)
        goto LABEL_8;
    }
    -[AGXA10FamilyCommandBuffer commit](v6, "commit");

    v6 = 0;
    goto LABEL_11;
  }
  return v6;
}

- (id)blitCommandEncoderCommon:(id)a3
{
  unsigned __int8 v5;
  unsigned __int8 v6;
  char v7;
  AGXA10FamilyBlitContext *previousBlitCommandEncoder;
  char *impl;
  _BOOL4 v10;
  char *v11;
  char *v12;
  AGXA10FamilyBlitContext *v13;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  int v19;

  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  if ((v5 & 1) == 0
  {
    -[AGXA10FamilyCommandBuffer blitCommandEncoderCommon:]::disableBlitEncoderRecycling = -[AGXA10FamilyCommandBuffer isBlitEncoderCoalescingDisabled](self, "isBlitEncoderCoalescingDisabled");
  }
  if ((v6 & 1) == 0
  {
    -[AGXA10FamilyCommandBuffer blitCommandEncoderCommon:]::disableEncoderRecycling = -[AGXA10FamilyCommandBuffer isEncoderCoalescingDisabled](self, "isEncoderCoalescingDisabled");
  }
  v7 = -[AGXA10FamilyCommandBuffer getSupportedAndEnabledErrorOptions](self, "getSupportedAndEnabledErrorOptions");
  previousBlitCommandEncoder = self->_previousBlitCommandEncoder;
  if (previousBlitCommandEncoder)
  {
    impl = (char *)previousBlitCommandEncoder->_impl;
    v10 = impl == 0;
    if (impl)
      v11 = impl;
    else
      v11 = 0;
    if (impl)
      v12 = impl + 1800;
    else
      v12 = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v10 = 1;
  }
  AGX::BlitCounterSamplingContextGen1::BlitCounterSamplingContextGen1((AGX::BlitCounterSamplingContextGen1 *)&v17, (MTLBlitPassDescriptor *)a3, 0);
  if (-[AGXA10FamilyCommandBuffer blitCommandEncoderCommon:]::disableBlitEncoderRecycling | -[AGXA10FamilyCommandBuffer blitCommandEncoderCommon:]::disableEncoderRecycling
    || (-[MTLDevice disableBlitEncoderCoalescing](-[IOGPUMetalCommandBuffer device](self, "device"), "disableBlitEncoderCoalescing") & 1) != 0|| ((v10 | -[MTLDevice disableEncoderCoalescing](-[IOGPUMetalCommandBuffer device](self, "device"), "disableEncoderCoalescing")) & 1) != 0|| (v15 = *((_QWORD *)v11 + 223)) != 0 && *(_DWORD *)(v15 + 528)|| (v7 & 1) != 0|| !v12|| *(_QWORD *)v12 && (*(_QWORD *)v12 != v17 ? (v16 = v17 == 0) : (v16 = 1), !v16)|| v18 != -1|| *((_DWORD *)v12 + 3) != -1)
  {
    -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
    v13 = -[AGXA10FamilyBlitContext initWithCommandBuffer:descriptor:]([AGXA10FamilyBlitContext alloc], "initWithCommandBuffer:descriptor:", self, a3);
  }
  else
  {
    if (v17)
      *(_QWORD *)v12 = v17;
    if (v19 != -1)
      *((_DWORD *)v12 + 3) = v19;
    v13 = -[AGXA10FamilyBlitContext reInitWithCommandBuffer:](self->_previousBlitCommandEncoder, "reInitWithCommandBuffer:", self);
  }
  return v13;
}

- (id)blitCommandEncoder
{
  return -[AGXA10FamilyCommandBuffer blitCommandEncoderCommon:](self, "blitCommandEncoderCommon:", 0);
}

- (id)resourceStateCommandEncoder
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  return -[AGXA10FamilyResourceStateContext initWithCommandBuffer:descriptor:]([AGXA10FamilyResourceStateContext alloc], "initWithCommandBuffer:descriptor:", self, 0);
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  return -[AGXA10FamilyResourceStateContext initWithCommandBuffer:descriptor:]([AGXA10FamilyResourceStateContext alloc], "initWithCommandBuffer:descriptor:", self, a3);
}

- (id)_accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  objc_super v6;
  objc_super v7;

  self->_telemetryUsage.usage[0] |= 0x80uLL;
  if ((-[MTLDevice buildBVHForRIA](-[IOGPUMetalCommandBuffer device](self, "device"), "buildBVHForRIA") & 1) != 0)
  {
    if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
      MTLReportFailure();
    -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
    return -[AGXA10FamilyRayTracingGPUBuilder initWithCommandBuffer:descriptor:]([AGXA10FamilyRayTracingGPUBuilder alloc], "initWithCommandBuffer:descriptor:", self, a3);
  }
  else if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AGXA10FamilyCommandBuffer;
    return -[_MTLCommandBuffer accelerationStructureCommandEncoderWithDescriptor:](&v6, sel_accelerationStructureCommandEncoderWithDescriptor_, a3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AGXA10FamilyCommandBuffer;
    return -[_MTLCommandBuffer accelerationStructureCommandEncoder](&v7, sel_accelerationStructureCommandEncoder);
  }
}

- (id)accelerationStructureCommandEncoder
{
  return -[AGXA10FamilyCommandBuffer _accelerationStructureCommandEncoderWithDescriptor:](self, "_accelerationStructureCommandEncoderWithDescriptor:", 0);
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  AGXA10FamilyRenderContext *previousRenderCommandEncoder;
  unsigned __int8 v6;
  unsigned __int8 v8;
  uint64_t i;
  void *v10;
  int v11;
  id v12;
  int v13;
  int64_t BaseAddressOfPlane;

  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  previousRenderCommandEncoder = self->_previousRenderCommandEncoder;
  if (previousRenderCommandEncoder)
  {
    -[AGXA10FamilyRenderContext deferredEndEncoding:](previousRenderCommandEncoder, "deferredEndEncoding:", a3);

    self->_previousRenderCommandEncoder = 0;
  }
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  if ((v6 & 1) == 0
  {
    -[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode = 0;
  }
  if (-[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode)
  {
    if ((v8 & 1) == 0
    {
      -[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::induce_corruption = 0;
    }
    for (i = 0; i != 8; ++i)
    {
      v13 = -[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode;
      if (-[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode == 1)
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture")&& objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"), "iosurface"))
        {
          if (!-[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::induce_corruption)
            goto LABEL_11;
          BaseAddressOfPlane = (int64_t)IOSurfaceGetBaseAddressOfPlane((IOSurfaceRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"), "iosurface"), 0);
          goto LABEL_10;
        }
        v13 = -[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::dcmp_check_mode;
      }
      if (v13 != 2
        || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"))
      {
        continue;
      }
      if (-[AGXA10FamilyCommandBuffer renderCommandEncoderWithDescriptor:]::induce_corruption
        && AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(*(_QWORD *)(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture")+ 536), 0, 0, 0))
      {
        BaseAddressOfPlane = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(*(_QWORD *)(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture")+ 536), 0, 0, 0);
LABEL_10:
        v10 = (void *)BaseAddressOfPlane;
        v11 = getpagesize();
        memset(v10, 222, v11);
      }
LABEL_11:
      v12 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture");
      std::vector<AGXA10FamilyTexture *>::push_back[abi:nn180100]((uint64_t)&self->texturesToEvaluate, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "objectAtIndexedSubscript:", i), "texture"));
    }
  }
  return -[AGXA10FamilyRenderContext initWithCommandBuffer:descriptor:]([AGXA10FamilyRenderContext alloc], "initWithCommandBuffer:descriptor:", self, a3);
}

- (id)subRenderCommandEncoderWithDescriptor:(id)a3 subEncoderIndex:(unint64_t)a4 framebuffer:(void *)a5
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  return -[AGXA10FamilyRenderContext initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:]([AGXA10FamilyRenderContext alloc], "initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:", self, a3, a4, a5);
}

- (BOOL)isComputeEncoderCoalescingDisabled
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  BOOL v6;

  v2 = (const __CFString *)*MEMORY[0x24BDBD590];
  v3 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSynchronize(CFSTR("com.apple.Metal"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  v4 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("disableComputeEncoderCoalescing"), CFSTR("com.apple.Metal"), v2, v3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFBooleanGetValue(v4) != 0;
  CFRelease(v5);
  return v6;
}

- (BOOL)isBlitEncoderCoalescingDisabled
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  BOOL v6;

  v2 = (const __CFString *)*MEMORY[0x24BDBD590];
  v3 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSynchronize(CFSTR("com.apple.Metal"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  v4 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("disableBlitEncoderCoalescing"), CFSTR("com.apple.Metal"), v2, v3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFBooleanGetValue(v4) != 0;
  CFRelease(v5);
  return v6;
}

- (BOOL)isEncoderCoalescingDisabled
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  BOOL v6;

  v2 = (const __CFString *)*MEMORY[0x24BDBD590];
  v3 = (const __CFString *)*MEMORY[0x24BDBD588];
  CFPreferencesSynchronize(CFSTR("com.apple.Metal"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  v4 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("disableEncoderCoalescing"), CFSTR("com.apple.Metal"), v2, v3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFBooleanGetValue(v4) != 0;
  CFRelease(v5);
  return v6;
}

- (BOOL)tryCoalescingPreviousComputeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3 nextEncoderClass:(Class)a4
{
  AGXA10FamilyComputeContext *previousComputeCommandEncoder;
  unsigned __int8 v8;
  unsigned __int8 v9;
  _BYTE *impl;
  MTLDevice *v11;
  MTLDevice *v12;
  uint64_t v13;
  uint64_t v17;
  int v18;
  int v19;

  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  previousComputeCommandEncoder = self->_previousComputeCommandEncoder;
  if (previousComputeCommandEncoder)
  {
    LODWORD(previousComputeCommandEncoder) = -[AGXA10FamilyComputeContext isMemberOfClass:](previousComputeCommandEncoder, "isMemberOfClass:", a4);
    if ((_DWORD)previousComputeCommandEncoder)
    {
      if ((v8 & 1) == 0
      {
        -[AGXA10FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableComputeEncoderRecycling = -[AGXA10FamilyCommandBuffer isComputeEncoderCoalescingDisabled](self, "isComputeEncoderCoalescingDisabled");
      }
      if ((v9 & 1) == 0
      {
        -[AGXA10FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableEncoderRecycling = -[AGXA10FamilyCommandBuffer isEncoderCoalescingDisabled](self, "isEncoderCoalescingDisabled");
      }
      impl = self->_previousComputeCommandEncoder->_impl;
      AGX::ComputeCounterSamplingContextGen1::ComputeCounterSamplingContextGen1((AGX::ComputeCounterSamplingContextGen1 *)&v17, (MTLComputePassDescriptor *)a3->var4);
      v11 = -[IOGPUMetalCommandBuffer device](self, "device");
      if (-[AGXA10FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableComputeEncoderRecycling | -[AGXA10FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:]::disableEncoderRecycling
        || impl[1744]
        || *((_DWORD *)impl + 1796))
      {
        goto LABEL_10;
      }
      v12 = v11;
      v13 = *((_QWORD *)impl + 911);
      if (v13)
      {
        if (v13 != v17 && v17 != 0 || v18 != -1)
          goto LABEL_10;
      }
      else if (v18 != -1)
      {
        goto LABEL_10;
      }
      if (*((_DWORD *)impl + 1825) == -1
        && (-[MTLDevice disableComputeEncoderCoalescing](v11, "disableComputeEncoderCoalescing") & 1) == 0
        && (-[MTLDevice disableEncoderCoalescing](v12, "disableEncoderCoalescing") & 1) == 0
        && a3->var7)
      {
        if (v17)
          *((_QWORD *)impl + 911) = v17;
        if (v18 != -1)
          *((_DWORD *)impl + 1824) = v18;
        if (v19 != -1)
          *((_DWORD *)impl + 1825) = v19;
        if (*((_DWORD *)impl + 434) == 1 || *((_DWORD *)impl + 1796) >= 2u)
          *((_WORD *)impl + 3780) = 0;
        *((_QWORD *)impl + 217) = 0;
        LOBYTE(previousComputeCommandEncoder) = 1;
        return (char)previousComputeCommandEncoder;
      }
LABEL_10:
      LOBYTE(previousComputeCommandEncoder) = 0;
    }
  }
  return (char)previousComputeCommandEncoder;
}

- (id)computeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3
{
  __int128 v5;
  AGXA10FamilyComputeContext *v6;
  AGXA10FamilyComputeContext *v7;
  __int128 v8;
  _OWORD v10[3];
  uint64_t v11;
  _OWORD v12[3];
  uint64_t v13;

  v5 = *(_OWORD *)&a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v5;
  v12[2] = *(_OWORD *)&a3->var4;
  v13 = *(_QWORD *)&a3->var7;
  if (-[AGXA10FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:](self, "tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:", v12, objc_opt_class()))
  {
    v6 = -[AGXA10FamilyComputeContext reInitWithCommandBuffer:](self->_previousComputeCommandEncoder, "reInitWithCommandBuffer:", self);
  }
  else
  {
    -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
    v7 = [AGXA10FamilyComputeContext alloc];
    v8 = *(_OWORD *)&a3->var2;
    v10[0] = *(_OWORD *)&a3->var0;
    v10[1] = v8;
    v10[2] = *(_OWORD *)&a3->var4;
    v11 = *(_QWORD *)&a3->var7;
    v6 = -[AGXA10FamilyComputeContext initWithCommandBuffer:config:](v7, "initWithCommandBuffer:config:", self, v10);
  }
  return v6;
}

- (id)computeCommandEncoder
{
  _BYTE *impl;
  int v4;
  _QWORD v6[3];
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  __int16 v11;

  impl = self->_impl;
  impl[20] = 1;
  v4 = *((_DWORD *)impl + 4);
  v6[0] = -[IOGPUMetalCommandBuffer device](self, "device");
  v6[1] = self;
  v6[2] = 0;
  v7 = 0;
  v8 = 0;
  v9 = v4;
  v10 = 0;
  v11 = 1;
  return -[AGXA10FamilyCommandBuffer computeCommandEncoderWithConfig:](self, "computeCommandEncoderWithConfig:", v6);
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  MTLDevice *v5;
  _BYTE *impl;
  int v7;
  _BOOL4 v8;
  _QWORD v10[3];
  _BOOL4 v11;
  uint64_t v12;
  int v13;
  int v14;
  __int16 v15;

  v5 = -[IOGPUMetalCommandBuffer device](self, "device");
  impl = self->_impl;
  impl[20] = 1;
  v7 = *((_DWORD *)impl + 4);
  v8 = a3 == 1 && (*(_BYTE *)(*((_QWORD *)v5 + 101) + 6225) & 0x10) == 0;
  v10[0] = v5;
  v10[1] = self;
  v10[2] = 0;
  v11 = v8;
  v12 = 0;
  v13 = v7;
  v14 = 0;
  v15 = 1;
  return -[AGXA10FamilyCommandBuffer computeCommandEncoderWithConfig:](self, "computeCommandEncoderWithConfig:", v10);
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  MTLDevice *v5;
  _BYTE *impl;
  int v7;
  _BOOL4 v8;
  _QWORD v10[3];
  _BOOL4 v11;
  id v12;
  int v13;
  int v14;
  char v15;
  char v16;

  v5 = -[IOGPUMetalCommandBuffer device](self, "device");
  impl = self->_impl;
  impl[20] = 1;
  v7 = *((_DWORD *)impl + 4);
  v8 = objc_msgSend(a3, "dispatchType") == 1 && (*(_BYTE *)(*((_QWORD *)v5 + 101) + 6225) & 0x10) == 0;
  v10[0] = v5;
  v10[1] = self;
  v10[2] = 0;
  v11 = v8;
  v12 = a3;
  v13 = v7;
  v14 = objc_msgSend(a3, "substreamCount");
  v15 = objc_msgSend(a3, "allowCommandEncoderCoalescing");
  v16 = 0;
  return -[AGXA10FamilyCommandBuffer computeCommandEncoderWithConfig:](self, "computeCommandEncoderWithConfig:", v10);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer encodeWaitForEvent:value:](&v6, sel_encodeWaitForEvent_value_, a3, a4);
  objc_msgSend(a3, "_encodeIOGPUKernelWaitEventCommandArgs:value:timeout:", &v5, 0, 0);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer encodeWaitForEvent:value:timeout:](&v7, sel_encodeWaitForEvent_value_timeout_, a3, a4, *(_QWORD *)&a5);
  objc_msgSend(a3, "_encodeIOGPUKernelWaitEventCommandArgs:value:timeout:", &v6, 0, 0);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer encodeSignalEvent:value:](&v6, sel_encodeSignalEvent_value_, a3, a4);
  objc_msgSend(a3, "_encodeIOGPUKernelSignalEventCommandArgs:value:", &v5, 0);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  _BYTE v6[24];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer encodeSignalEvent:value:agentMask:](&v7, sel_encodeSignalEvent_value_agentMask_, a3, a4, a5);
  objc_msgSend(a3, "_encodeIOGPUKernelSignalEventAgentCommandArgs:value:agentMask:", v6, 0, 0);
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  return -[AGXA10FamilyThreadedRenderPass initWithCommandBuffer:renderPassDescriptor:]([AGXA10FamilyThreadedRenderPass alloc], "initWithCommandBuffer:renderPassDescriptor:", self, a3);
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  uint64_t v9;

  v9 = *(_QWORD *)(-[IOGPUMetalCommandBuffer device](self, "device") + 808);
  if (!*(_BYTE *)(v9 + 6376) && !*(_QWORD *)(v9 + 6368))
    MTLReportFailure();
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  return -[AGXA10FamilySampledRenderContext initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:programInfoBuffer:capacity:]([AGXA10FamilySampledRenderContext alloc], "initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:programInfoBuffer:capacity:", self, a3, 0, 0, a4, a5);
}

- (id)sampledSubRenderCommandEncoderWithDescriptor:(id)a3 subEncoderIndex:(unint64_t)a4 framebuffer:(void *)a5 programInfoBuffer:(id *)a6 capacity:(unint64_t)a7
{
  uint64_t v13;

  v13 = *(_QWORD *)(-[IOGPUMetalCommandBuffer device](self, "device") + 808);
  if (!*(_BYTE *)(v13 + 6376) && !*(_QWORD *)(v13 + 6368))
    MTLReportFailure();
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  return -[AGXA10FamilySampledRenderContext initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:programInfoBuffer:capacity:]([AGXA10FamilySampledRenderContext alloc], "initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:programInfoBuffer:capacity:", self, a3, a4, a5, a6, a7);
}

- (id)sampledComputeCommandEncoderWithConfig:(EncoderComputeServiceConfig *)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  uint64_t v9;
  __int128 v10;
  AGXA10FamilySampledComputeContext *v11;
  AGXA10FamilySampledComputeContext *v12;
  __int128 v13;
  _OWORD v15[3];
  uint64_t v16;
  _OWORD v17[3];
  uint64_t v18;

  v9 = *(_QWORD *)(-[IOGPUMetalCommandBuffer device](self, "device") + 808);
  if (!*(_BYTE *)(v9 + 6376) && !*(_QWORD *)(v9 + 6368))
    MTLReportFailure();
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  if (self->_captureProgramAddressTable)
    a3->var8 = 1;
  v10 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v10;
  v17[2] = *(_OWORD *)&a3->var4;
  v18 = *(_QWORD *)&a3->var7;
  if (-[AGXA10FamilyCommandBuffer tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:](self, "tryCoalescingPreviousComputeCommandEncoderWithConfig:nextEncoderClass:", v17, objc_opt_class()))
  {
    v11 = (AGXA10FamilySampledComputeContext *)-[AGXA10FamilyComputeContext reInitWithCommandBuffer:programInfoBuffer:capacity:](self->_previousComputeCommandEncoder, "reInitWithCommandBuffer:programInfoBuffer:capacity:", self, a4, a5);
  }
  else
  {
    -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
    v12 = [AGXA10FamilySampledComputeContext alloc];
    v13 = *(_OWORD *)&a3->var2;
    v15[0] = *(_OWORD *)&a3->var0;
    v15[1] = v13;
    v15[2] = *(_OWORD *)&a3->var4;
    v16 = *(_QWORD *)&a3->var7;
    v11 = -[AGXA10FamilySampledComputeContext initWithCommandBuffer:config:programInfoBuffer:capacity:](v12, "initWithCommandBuffer:config:programInfoBuffer:capacity:", self, v15, a4, a5);
  }
  return v11;
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  _BYTE *impl;
  int v8;
  _QWORD v10[3];
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  __int16 v15;

  impl = self->_impl;
  impl[20] = 1;
  v8 = *((_DWORD *)impl + 4);
  v10[0] = -[IOGPUMetalCommandBuffer device](self, "device");
  v10[1] = self;
  v10[2] = 0;
  v11 = 0;
  v12 = 0;
  v13 = v8;
  v14 = 0;
  v15 = 0;
  return -[AGXA10FamilyCommandBuffer sampledComputeCommandEncoderWithConfig:programInfoBuffer:capacity:](self, "sampledComputeCommandEncoderWithConfig:programInfoBuffer:capacity:", v10, a3, a4);
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  MTLDevice *v9;
  _BYTE *impl;
  int v11;
  _BOOL4 v12;
  _QWORD v14[3];
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  int v18;
  __int16 v19;

  v9 = -[IOGPUMetalCommandBuffer device](self, "device");
  impl = self->_impl;
  impl[20] = 1;
  v11 = *((_DWORD *)impl + 4);
  v12 = a3 == 1 && (*(_BYTE *)(*((_QWORD *)v9 + 101) + 6225) & 0x10) == 0;
  v14[0] = v9;
  v14[1] = self;
  v14[2] = 0;
  v15 = v12;
  v16 = 0;
  v17 = v11;
  v18 = 0;
  v19 = 1;
  return -[AGXA10FamilyCommandBuffer sampledComputeCommandEncoderWithConfig:programInfoBuffer:capacity:](self, "sampledComputeCommandEncoderWithConfig:programInfoBuffer:capacity:", v14, a4, a5);
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  MTLDevice *v9;
  _BYTE *impl;
  int v11;
  _BOOL4 v12;
  _QWORD v14[3];
  _BOOL4 v15;
  id v16;
  int v17;
  int v18;
  char v19;
  char v20;

  v9 = -[IOGPUMetalCommandBuffer device](self, "device");
  impl = self->_impl;
  impl[20] = 1;
  v11 = *((_DWORD *)impl + 4);
  v12 = objc_msgSend(a3, "dispatchType") == 1 && (*(_BYTE *)(*((_QWORD *)v9 + 101) + 6225) & 0x10) == 0;
  v14[0] = v9;
  v14[1] = self;
  v14[2] = 0;
  v15 = v12;
  v16 = a3;
  v17 = v11;
  v18 = objc_msgSend(a3, "substreamCount");
  v19 = objc_msgSend(a3, "allowCommandEncoderCoalescing");
  v20 = 0;
  return -[AGXA10FamilyCommandBuffer sampledComputeCommandEncoderWithConfig:programInfoBuffer:capacity:](self, "sampledComputeCommandEncoderWithConfig:programInfoBuffer:capacity:", v14, a4, a5);
}

- (void)setPreviousBlitCommandEncoder:(id)a3
{
  self->_previousBlitCommandEncoder = (AGXA10FamilyBlitContext *)a3;
}

- (void)setPreviousComputeCommandEncoder:(id)a3
{
  self->_previousComputeCommandEncoder = (AGXA10FamilyComputeContext *)a3;
}

- (void)setPreviousRenderCommandEncoder:(id)a3
{
  self->_previousRenderCommandEncoder = (AGXA10FamilyRenderContext *)a3;
}

- (void)commitEncoder
{
  AGXA10FamilyBlitContext *previousBlitCommandEncoder;
  AGXA10FamilyComputeContext *previousComputeCommandEncoder;
  AGXA10FamilyRenderContext *previousRenderCommandEncoder;

  previousBlitCommandEncoder = self->_previousBlitCommandEncoder;
  previousComputeCommandEncoder = self->_previousComputeCommandEncoder;
  previousRenderCommandEncoder = self->_previousRenderCommandEncoder;
  if (previousBlitCommandEncoder)
  {
    -[AGXA10FamilyBlitContext deferredEndEncoding](previousBlitCommandEncoder, "deferredEndEncoding");

    self->_previousBlitCommandEncoder = 0;
  }
  if (previousComputeCommandEncoder)
  {
    -[AGXA10FamilyComputeContext deferredEndEncoding](self->_previousComputeCommandEncoder, "deferredEndEncoding");

    self->_previousComputeCommandEncoder = 0;
  }
  if (previousRenderCommandEncoder)
  {
    -[AGXA10FamilyRenderContext deferredEndEncoding:](self->_previousRenderCommandEncoder, "deferredEndEncoding:", 0);

    self->_previousRenderCommandEncoder = 0;
  }
}

- (void)reserveKernelCommandBufferSpace:(unint64_t)a3
{
  IOGPUMetalCommandBufferStorage *v5;
  void *result;
  char *var6;
  void *v8;

  v5 = -[IOGPUMetalCommandBuffer commandBufferStorage](self, "commandBufferStorage");
  result = v5->var5;
  var6 = v5->var6;
  v8 = result;
  if (var6 - (_BYTE *)result < a3)
  {
    -[IOGPUMetalCommandBuffer growKernelCommandBuffer:](self, "growKernelCommandBuffer:", a3);
    -[IOGPUMetalCommandBuffer getCurrentKernelCommandBufferPointer:end:](self, "getCurrentKernelCommandBufferPointer:end:", &v8, &var6);
    result = v8;
  }
  v5->var5 = (char *)result + a3;
  return result;
}

- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7;
  unsigned int v8;
  id *impl;
  __int16 v10;
  uint64_t v11;

  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  if (a4)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      impl = (id *)self->_impl;
      v10 = *((_WORD *)a3[v7] + 4);
      v11 = objc_msgSend(impl[1], "reserveKernelCommandBufferSpace:", 16);
      *(_QWORD *)v11 = 0x1000010002;
      *(_WORD *)(v11 + 8) = v10;
      objc_msgSend(impl[1], "commandBufferStorage");
      IOGPUMetalCommandBufferStorageBeginKernelCommands();
      IOGPUMetalCommandBufferStorageEndKernelCommands();
      v7 = v8++;
    }
    while (v7 < a4);
  }
}

- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  unint64_t v9;
  unsigned int v10;
  _WORD *v11;
  __int16 v12;
  id *impl;
  uint64_t v14;

  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder");
  if (a5 && a3 == 1)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = a4[v9];
      if (v11)
      {
        v12 = v11[4];
        impl = (id *)self->_impl;
        v14 = objc_msgSend(impl[1], "reserveKernelCommandBufferSpace:", 16);
        *(_QWORD *)v14 = 0x1000010002;
        *(_WORD *)(v14 + 8) = v12;
        objc_msgSend(impl[1], "commandBufferStorage");
        IOGPUMetalCommandBufferStorageBeginKernelCommands();
        IOGPUMetalCommandBufferStorageEndKernelCommands();
      }
      v9 = v10++;
    }
    while (v9 < a5);
  }
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  __int16 v6;
  id *impl;
  uint64_t v11;

  v6 = a6;
  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder", a3, a4);
  if (a3)
  {
    impl = (id *)self->_impl;
    v11 = objc_msgSend(impl[1], "reserveKernelCommandBufferSpace:", 48);
    *(_QWORD *)v11 = 0x3000010003;
    *(_QWORD *)(v11 + 8) = a5;
    *(_WORD *)(v11 + 40) = v6;
    *(_DWORD *)(v11 + 42) = -1;
    *(_WORD *)(v11 + 46) = -1;
    objc_msgSend(impl[1], "commandBufferStorage");
    IOGPUMetalCommandBufferStorageBeginKernelCommands();
    IOGPUMetalCommandBufferStorageEndKernelCommands();
  }
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  id *impl;
  uint64_t v13;
  __int16 v14;

  if (*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[AGXA10FamilyCommandBuffer commitEncoder](self, "commitEncoder", a3, a4);
  if (a3)
  {
    impl = (id *)self->_impl;
    v13 = objc_msgSend(impl[1], "reserveKernelCommandBufferSpace:", 48);
    *(_QWORD *)v13 = 0x3000010003;
    if (a7)
    {
      *(_QWORD *)(v13 + 8) = *a5;
      *(_WORD *)(v13 + 40) = *a6;
      if (a7 != 1)
      {
        *(_QWORD *)(v13 + 16) = a5[1];
        *(_WORD *)(v13 + 42) = a6[1];
        if (a7 > 2)
        {
          *(_QWORD *)(v13 + 24) = a5[2];
          *(_WORD *)(v13 + 44) = a6[2];
          if (a7 == 3)
          {
            v14 = -1;
          }
          else
          {
            *(_QWORD *)(v13 + 32) = a5[3];
            v14 = *((_WORD *)a6 + 12);
          }
          goto LABEL_12;
        }
LABEL_11:
        v14 = -1;
        *(_WORD *)(v13 + 44) = -1;
LABEL_12:
        *(_WORD *)(v13 + 46) = v14;
        objc_msgSend(impl[1], "commandBufferStorage");
        IOGPUMetalCommandBufferStorageBeginKernelCommands();
        IOGPUMetalCommandBufferStorageEndKernelCommands();
        return;
      }
    }
    else
    {
      *(_WORD *)(v13 + 40) = -1;
    }
    *(_WORD *)(v13 + 42) = -1;
    goto LABEL_11;
  }
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3 substreamCount:(unsigned int)a4
{
  MTLDevice *v7;
  _BYTE *impl;
  int v9;
  _BOOL4 v10;
  _QWORD v12[3];
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  __int16 v17;

  v7 = -[IOGPUMetalCommandBuffer device](self, "device");
  impl = self->_impl;
  impl[20] = 1;
  v9 = *((_DWORD *)impl + 4);
  v10 = a3 == 1 && (*(_BYTE *)(*((_QWORD *)v7 + 101) + 6225) & 0x10) == 0;
  v12[0] = v7;
  v12[1] = self;
  v12[2] = 0;
  v13 = v10;
  v14 = 0;
  v15 = v9;
  v16 = a4;
  v17 = 1;
  return -[AGXA10FamilyCommandBuffer computeCommandEncoderWithConfig:](self, "computeCommandEncoderWithConfig:", v12);
}

- (void)fillCommandBufferArgs:(IOGPUCommandQueueCommandBufferArgs *)a3 commandQueue:(id)a4
{
  objc_super v7;

  *(_QWORD *)&a3[1].var2 = -[AGXA10FamilyCommandBuffer deadline](self, "deadline");
  a3[1].var0 = -[AGXA10FamilyCommandBuffer deadline_namespace_id](self, "deadline_namespace_id");
  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyCommandBuffer;
  -[IOGPUMetalCommandBuffer fillCommandBufferArgs:commandQueue:](&v7, sel_fillCommandBufferArgs_commandQueue_, a3, a4);
}

- (BOOL)disableDeferredEndEncoding
{
  return self->_disableDeferredEndEncoding;
}

- (void)setDisableDeferredEndEncoding:(BOOL)a3
{
  self->_disableDeferredEndEncoding = a3;
}

- (unint64_t)deadline
{
  return self->deadline;
}

- (void)setDeadline:(unint64_t)a3
{
  self->deadline = a3;
}

- (unsigned)deadline_namespace_id
{
  return self->deadline_namespace_id;
}

- (void)setDeadline_namespace_id:(unsigned int)a3
{
  self->deadline_namespace_id = a3;
}

- (void).cxx_destruct
{
  vector<AGXA10FamilyTexture *, std::allocator<AGXA10FamilyTexture *>> *p_texturesToEvaluate;
  __end_ **begin;

  p_texturesToEvaluate = &self->texturesToEvaluate;
  begin = self->texturesToEvaluate.__begin_;
  if (begin)
  {
    p_texturesToEvaluate->var0 = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 84) = 0;
  *((_QWORD *)self + 85) = 0;
  *((_QWORD *)self + 89) = 0;
  *((_QWORD *)self + 90) = 0;
  *((_QWORD *)self + 88) = 0;
  return self;
}

@end
