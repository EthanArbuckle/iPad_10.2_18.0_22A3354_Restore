@implementation AGXA10FamilyRayTracingGPUBuilder

- (unint64_t)globalTraceObjectID
{
  return -[MTLComputeCommandEncoderSPI globalTraceObjectID](self->_computeEncoder, "globalTraceObjectID");
}

- (void)substreamSynchronizeDescriptor:(id)a3 access:(unint64_t)a4
{
  void *v7;
  _DWORD *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t j;

  v7 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
  {
    if ((unint64_t)(objc_msgSend(a3, "instanceDescriptorType") - 3) > 1)
    {
      -[AGXA10FamilyRayTracingGPUBuilder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", objc_msgSend(a3, "instancedAccelerationStructures"), a4);
      return;
    }
    progressBins = self->_progressBins;
    if (!progressBins)
      return;
    computeEncoder = self->_computeEncoder;
    if (!*((_BYTE *)progressBins + 48))
    {
      v10 = *((unsigned __int16 *)progressBins + 21);
      v11 = progressBins[35];
      progressBins[35] = v11 + 1;
      -[MTLComputeCommandEncoderSPI signalProgress:](computeEncoder, "signalProgress:", v11);
      if (*((_WORD *)progressBins + 20))
      {
        v12 = 0;
        do
        {
          -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v12);
          -[MTLComputeCommandEncoderSPI waitForProgress:](computeEncoder, "waitForProgress:", v11);
          v12 = (v12 + 1);
        }
        while (v12 < *((unsigned __int16 *)progressBins + 20));
      }
      -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v10);
      if (*((_QWORD *)progressBins + 22))
      {
        v13 = (_QWORD *)*((_QWORD *)progressBins + 21);
        if (v13)
        {
          do
          {
            v14 = (_QWORD *)*v13;
            operator delete(v13);
            v13 = v14;
          }
          while (v14);
        }
        *((_QWORD *)progressBins + 21) = 0;
        v15 = *((_QWORD *)progressBins + 20);
        if (v15)
        {
          for (i = 0; i != v15; ++i)
            *(_QWORD *)(*((_QWORD *)progressBins + 19) + 8 * i) = 0;
        }
LABEL_29:
        *((_QWORD *)progressBins + 22) = 0;
        return;
      }
      return;
    }
LABEL_18:
    -[MTLComputeCommandEncoderSPI endVirtualSubstream](computeEncoder, "endVirtualSubstream");
    -[MTLComputeCommandEncoderSPI beginVirtualSubstream](computeEncoder, "beginVirtualSubstream");
    return;
  }
  v17 = (void *)objc_opt_class();
  if (!objc_msgSend(v17, "isSubclassOfClass:", objc_opt_class()))
    return;
  progressBins = self->_progressBins;
  if (!progressBins)
    return;
  computeEncoder = self->_computeEncoder;
  if (*((_BYTE *)progressBins + 48))
    goto LABEL_18;
  v18 = *((unsigned __int16 *)progressBins + 21);
  v19 = progressBins[35];
  progressBins[35] = v19 + 1;
  -[MTLComputeCommandEncoderSPI signalProgress:](computeEncoder, "signalProgress:", v19);
  if (*((_WORD *)progressBins + 20))
  {
    v20 = 0;
    do
    {
      -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v20);
      -[MTLComputeCommandEncoderSPI waitForProgress:](computeEncoder, "waitForProgress:", v19);
      v20 = (v20 + 1);
    }
    while (v20 < *((unsigned __int16 *)progressBins + 20));
  }
  -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v18);
  if (*((_QWORD *)progressBins + 22))
  {
    v21 = (_QWORD *)*((_QWORD *)progressBins + 21);
    if (v21)
    {
      do
      {
        v22 = (_QWORD *)*v21;
        operator delete(v21);
        v21 = v22;
      }
      while (v22);
    }
    *((_QWORD *)progressBins + 21) = 0;
    v23 = *((_QWORD *)progressBins + 20);
    if (v23)
    {
      for (j = 0; j != v23; ++j)
        *(_QWORD *)(*((_QWORD *)progressBins + 19) + 8 * j) = 0;
    }
    goto LABEL_29;
  }
}

- (void)substreamSynchronizeAccelerationStructures:(id)a3 access:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *progressBins;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        progressBins = self->_progressBins;
        v12 = objc_msgSend(v10, "buffer");
        v13 = objc_msgSend(v10, "bufferOffset");
        v14 = objc_msgSend(v10, "size");
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __86__AGXA10FamilyRayTracingGPUBuilder_substreamSynchronizeAccelerationStructures_access___block_invoke;
        v16[3] = &unk_250402128;
        v16[4] = self;
        ProgressBinsSynchronizeBufferAccessRange((uint64_t)progressBins, v12, v13, v14, a4, (uint64_t)v16);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
}

- (AGXA10FamilyRayTracingGPUBuilder)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  AGXA10FamilyRayTracingGPUBuilder *v6;
  id v7;
  unsigned int v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  unsigned __int8 v12;
  _DWORD *v13;
  unsigned __int8 v14;
  _DWORD *v15;
  unsigned __int8 v16;
  _DWORD *v17;
  unsigned __int8 v18;
  _DWORD *v19;
  unsigned __int8 v20;
  _DWORD *v21;
  unsigned __int8 v22;
  int v23;
  int v24;
  int v25;
  _OWORD *v26;
  __int128 v27;
  _BYTE *progressBins;
  _DWORD *v29;
  _DWORD *v30;
  MTLDevice *device;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unsigned int v33;
  int *v34;
  uint64_t v35;
  void *v36;
  os_unfair_lock_s *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int *v44;
  const void *v45;
  unsigned int v46;
  uint64_t v47;
  BVHTopDownBuilder *v48;
  int v50;
  int v51;
  _DWORD *v52;
  int v53;
  _DWORD *v54;
  int v55;
  _DWORD *v56;
  int v57;
  int v58;
  objc_super v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)AGXA10FamilyRayTracingGPUBuilder;
  v6 = -[_MTLObjectWithLabel init](&v59, sel_init);
  if (!v6)
    return v6;
  v6->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
  v6->_commandBuffer = (MTLCommandBuffer *)a3;
  v7 = (id)objc_msgSend(a4, "convertToComputePassDescriptor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = -[MTLDevice maximumComputeSubstreams](v6->_device, "maximumComputeSubstreams");
    if (!a4)
      goto LABEL_4;
LABEL_7:
    v9 = objc_msgSend(a4, "enableSubstreams") ^ 1;
    if (v8 < 2)
      goto LABEL_25;
LABEL_8:
    if ((v9 & 1) == 0)
    {
      if (v8 >= 3)
        v10 = 3;
      else
        v10 = v8;
      v11 = operator new();
      *(_OWORD *)(v11 + 56) = 0u;
      *(_OWORD *)(v11 + 72) = 0u;
      *(_OWORD *)(v11 + 96) = 0u;
      *(_DWORD *)(v11 + 88) = 1065353216;
      *(_OWORD *)(v11 + 112) = 0u;
      *(_DWORD *)(v11 + 128) = 1065353216;
      *(_OWORD *)(v11 + 152) = 0u;
      *(_OWORD *)(v11 + 168) = 0u;
      *(_DWORD *)(v11 + 184) = 1065353216;
      v13 = &unk_255FF8000;
      if ((v12 & 1) == 0)
      {
        v13 = &unk_255FF8000;
        if (v50)
        {
          ADSCommandProgressBins::ADSCommandProgressBins(unsigned int,unsigned int,float,float,float,float,float,float)::envBufferBaseCost = 1141434171;
          v13 = &unk_255FF8000;
        }
      }
      v15 = &unk_255FF8000;
      if ((v14 & 1) == 0)
      {
        v15 = &unk_255FF8000;
        v13 = &unk_255FF8000;
        if (v51)
        {
          ADSCommandProgressBins::ADSCommandProgressBins(unsigned int,unsigned int,float,float,float,float,float,float)::envBufferCost = 968629184;
          v15 = (_DWORD *)&unk_255FF8000;
          v13 = &unk_255FF8000;
        }
      }
      v17 = &unk_255FF8000;
      if ((v16 & 1) == 0)
      {
        v52 = v15;
        v17 = &unk_255FF8000;
        v15 = v52;
        v13 = (_DWORD *)&unk_255FF8000;
        if (v53)
        {
          ADSCommandProgressBins::ADSCommandProgressBins(unsigned int,unsigned int,float,float,float,float,float,float)::envPrimitiveBaseCost = 1073378809;
          v17 = (_DWORD *)&unk_255FF8000;
          v15 = v52;
          v13 = (_DWORD *)&unk_255FF8000;
        }
      }
      v19 = &unk_255FF8000;
      if ((v18 & 1) == 0)
      {
        v54 = v15;
        v19 = &unk_255FF8000;
        v17 = (_DWORD *)&unk_255FF8000;
        v15 = v54;
        v13 = (_DWORD *)&unk_255FF8000;
        if (v55)
        {
          ADSCommandProgressBins::ADSCommandProgressBins(unsigned int,unsigned int,float,float,float,float,float,float)::envPrimitiveCost = 971874877;
          v19 = (_DWORD *)&unk_255FF8000;
          v17 = (_DWORD *)&unk_255FF8000;
          v15 = v54;
          v13 = (_DWORD *)&unk_255FF8000;
        }
      }
      v21 = &unk_255FF8000;
      if ((v20 & 1) == 0)
      {
        v56 = v15;
        v21 = &unk_255FF8000;
        v19 = (_DWORD *)&unk_255FF8000;
        v17 = (_DWORD *)&unk_255FF8000;
        v15 = v56;
        v13 = (_DWORD *)&unk_255FF8000;
        if (v57)
        {
          ADSCommandProgressBins::ADSCommandProgressBins(unsigned int,unsigned int,float,float,float,float,float,float)::envRefitBaseCost = 1039355271;
          v21 = (_DWORD *)&unk_255FF8000;
          v19 = (_DWORD *)&unk_255FF8000;
          v17 = (_DWORD *)&unk_255FF8000;
          v15 = v56;
          v13 = (_DWORD *)&unk_255FF8000;
        }
      }
      if ((v22 & 1) == 0)
      {
        v21 = (_DWORD *)&unk_255FF8000;
        v19 = (_DWORD *)&unk_255FF8000;
        v17 = (_DWORD *)&unk_255FF8000;
        v15 = (_DWORD *)&unk_255FF8000;
        v13 = (_DWORD *)&unk_255FF8000;
        if (v58)
        {
          ADSCommandProgressBins::ADSCommandProgressBins(unsigned int,unsigned int,float,float,float,float,float,float)::envRefitCost = 921525729;
          v21 = (_DWORD *)&unk_255FF8000;
          v19 = (_DWORD *)&unk_255FF8000;
          v17 = (_DWORD *)&unk_255FF8000;
          v15 = (_DWORD *)&unk_255FF8000;
          v13 = (_DWORD *)&unk_255FF8000;
        }
      }
      v23 = v15[590];
      *(_DWORD *)v11 = v13[586];
      *(_DWORD *)(v11 + 4) = v23;
      v24 = v19[598];
      *(_DWORD *)(v11 + 8) = v17[594];
      *(_DWORD *)(v11 + 12) = v24;
      v25 = ADSCommandProgressBins::ADSCommandProgressBins(unsigned int,unsigned int,float,float,float,float,float,float)::envRefitCost;
      *(_DWORD *)(v11 + 16) = v21[602];
      *(_DWORD *)(v11 + 20) = v25;
      *(_QWORD *)(v11 + 24) = 0;
      *(_QWORD *)(v11 + 32) = 0;
      *(_WORD *)(v11 + 40) = v10;
      *(_WORD *)(v11 + 42) = 0;
      *(_DWORD *)(v11 + 140) = 0;
      v26 = (_OWORD *)operator new[]();
      *(_QWORD *)(v11 + 144) = v26;
      *(_QWORD *)&v27 = -1;
      *((_QWORD *)&v27 + 1) = -1;
      *v26 = v27;
      v26[1] = v27;
      v26[2] = v27;
      v26[3] = v27;
      v26[4] = v27;
      v26[5] = v27;
      v26[6] = v27;
      v26[7] = v27;
      v26[8] = v27;
      v26[9] = v27;
      v26[10] = v27;
      v26[11] = v27;
      v26[12] = v27;
      v26[13] = v27;
      v26[14] = v27;
      v26[15] = v27;
      v26[16] = v27;
      v26[17] = v27;
      v26[18] = v27;
      v26[19] = v27;
      v26[20] = v27;
      v26[21] = v27;
      v26[22] = v27;
      v26[23] = v27;
      v26[24] = v27;
      v26[25] = v27;
      v26[26] = v27;
      v26[27] = v27;
      v26[28] = v27;
      v26[29] = v27;
      v26[30] = v27;
      v26[31] = v27;
      *(_DWORD *)(v11 + 136) = 128;
      v6->_progressBins = (void *)v11;
      if (-[MTLDevice supportsVirtualSubstreams](v6->_device, "supportsVirtualSubstreams"))
      {
        progressBins = v6->_progressBins;
        if (progressBins)
          progressBins[48] = 1;
        v6->virtualSubstreamsEnabled = 1;
      }
      if (!v7)
        v7 = objc_alloc_init(MEMORY[0x24BDDD540]);
      objc_msgSend(v7, "setSubstreamCount:", *((unsigned __int16 *)v6->_progressBins + 20));
    }
    goto LABEL_25;
  }
  v8 = 0;
  if (a4)
    goto LABEL_7;
LABEL_4:
  LOBYTE(v9) = 0;
  if (v8 >= 2)
    goto LABEL_8;
LABEL_25:
  if (v7)
  {
    v6->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)objc_msgSend(a3, "computeCommandEncoderWithDescriptor:", v7);

  }
  else
  {
    v6->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)-[MTLCommandBuffer computeCommandEncoder](v6->_commandBuffer, "computeCommandEncoder");
  }
  v29 = malloc_type_calloc(0x28uLL, 1uLL, 0x20789CCCuLL);
  v30 = v29;
  v6->_impl = v29;
  if (v29)
  {
    device = v6->_device;
    computeEncoder = v6->_computeEncoder;
    *(_QWORD *)v29 = device;
    *((_QWORD *)v29 + 1) = computeEncoder;
    *((_QWORD *)v29 + 2) = 0;
    *((_QWORD *)v29 + 3) = 0;
    v29[8] = 0;
    if ((computeEncoder & 1) == 0
    {
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
    }
    v33 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride & ~(AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride >> 31);
    v30[8] = v33;
    v34 = &OBJC_IVAR___BVHTopDownBuilder__library;
    if (v33 >= 2)
    {
      v35 = *(_QWORD *)(*(_QWORD *)v30 + 808);
      v36 = (void *)atomic_load((unint64_t *)(v35 + 6808));
      if (!v36)
      {
        v37 = (os_unfair_lock_s *)(v35 + 6672);
        os_unfair_lock_lock((os_unfair_lock_t)(v35 + 6672));
        v36 = *(void **)(v35 + 6808);
        if (!v36)
        {
          if (v30[8] < 2u)
          {
            v36 = 0;
          }
          else
          {
            v60 = xmmword_232D73A90;
            v61 = xmmword_232D73AA0;
            v62 = xmmword_232D73AB0;
            v63 = xmmword_232D73AC0;
            v64 = xmmword_232D73AD0;
            v65 = xmmword_232D73AE0;
            v66 = xmmword_232D73AF0;
            v67 = xmmword_232D73B00;
            v68 = 0x14F8000014ECLL;
            v36 = (void *)objc_msgSend(*(id *)v30, "newBufferWithLength:options:", 5380, 0);
            v38 = objc_msgSend(v36, "contents");
            v39 = 0;
            v40 = v67;
            *(_OWORD *)(v38 + 96) = v66;
            *(_OWORD *)(v38 + 112) = v40;
            *(_QWORD *)(v38 + 128) = v68;
            v41 = v63;
            *(_OWORD *)(v38 + 32) = v62;
            *(_OWORD *)(v38 + 48) = v41;
            v42 = v65;
            *(_OWORD *)(v38 + 64) = v64;
            *(_OWORD *)(v38 + 80) = v42;
            v43 = v61;
            v44 = &dword_250401EC8;
            *(_OWORD *)v38 = v60;
            *(_OWORD *)(v38 + 16) = v43;
            do
            {
              v45 = (const void *)*((_QWORD *)v44 - 1);
              v46 = *v44;
              v44 += 4;
              memcpy((void *)(v38 + *((unsigned int *)&v60 + v39++)), v45, v46);
            }
            while (v39 != 34);
            v37 = (os_unfair_lock_s *)(v35 + 6672);
            v34 = &OBJC_IVAR___BVHTopDownBuilder__library;
          }
          atomic_store((unint64_t)v36, (unint64_t *)(v35 + 6808));
        }
        os_unfair_lock_unlock(v37);
      }
      *((_QWORD *)v30 + 2) = v36;
    }
    v47 = *(_QWORD *)((char *)device + v34[66]);
    v48 = (BVHTopDownBuilder *)atomic_load((unint64_t *)(v47 + 6816));
    if (!v48)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v47 + 6676));
      v48 = *(BVHTopDownBuilder **)(v47 + 6816);
      if (!v48)
      {
        v48 = -[BVHTopDownBuilder initWithDevice:]([BVHTopDownBuilder alloc], "initWithDevice:", device);
        atomic_store((unint64_t)v48, (unint64_t *)(v47 + 6816));
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v47 + 6676));
    }
    *((_QWORD *)v30 + 3) = v48;
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v30 + 1) + 88) + 1545) = 1;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  _QWORD *progressBins;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *impl;
  objc_super v15;

  progressBins = self->_progressBins;
  if (progressBins)
  {
    v4 = progressBins[18];
    if (v4)
      MEMORY[0x234927EB4](v4, 0x1000C8052888210);
    v5 = (_QWORD *)progressBins[21];
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        operator delete(v5);
        v5 = v6;
      }
      while (v6);
    }
    v7 = (void *)progressBins[19];
    progressBins[19] = 0;
    if (v7)
      operator delete(v7);
    v8 = (_QWORD *)progressBins[14];
    if (v8)
    {
      do
      {
        v9 = (_QWORD *)*v8;
        operator delete(v8);
        v8 = v9;
      }
      while (v9);
    }
    v10 = (void *)progressBins[12];
    progressBins[12] = 0;
    if (v10)
      operator delete(v10);
    v11 = (_QWORD *)progressBins[9];
    if (v11)
    {
      do
      {
        v12 = (_QWORD *)*v11;
        operator delete(v11);
        v11 = v12;
      }
      while (v12);
    }
    v13 = (void *)progressBins[7];
    progressBins[7] = 0;
    if (v13)
      operator delete(v13);
    MEMORY[0x234927ECC](progressBins, 0x10B0C404C6F8B55);
  }

  impl = self->_impl;
  if (impl)
  {
    free(impl);
    self->_impl = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)AGXA10FamilyRayTracingGPUBuilder;
  -[_MTLCommandEncoder dealloc](&v15, sel_dealloc);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)endEncoding
{
  -[AGXA10FamilyRayTracingGPUBuilder _endVirtualSubstream](self, "_endVirtualSubstream");
  -[MTLComputeCommandEncoderSPI endEncoding](self->_computeEncoder, "endEncoding");

  self->_device = 0;
  self->_commandBuffer = 0;
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilyRayTracingGPUBuilder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  -[MTLComputeCommandEncoderSPI setLabel:](self->_computeEncoder, "setLabel:", a3);
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  char v9;
  unsigned __int8 v10;
  void *BVHDescriptor;
  _QWORD *v12;
  _QWORD *v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t PrimitiveCountFromDescriptor;
  float v22;
  float v23;
  unint64_t v24;
  uint64_t v25;
  unsigned __int16 v26;
  float v27;
  unint64_t v28;
  float v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  float *v35;
  uint64_t v36;
  uint64_t *v37;
  int v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t **v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *context;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD __src[87];
  _QWORD __dst[3];
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  _QWORD v138[3];
  int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  int v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  int v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  int v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  int v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  int v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  int v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  int v207;
  _QWORD v208[5];
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  uint64_t v214;

  v9 = objc_msgSend(a4, "isInstanceDescriptor");
  context = (void *)MEMORY[0x234928298]();
  if ((v10 & 1) == 0
  {
    -[AGXA10FamilyRayTracingGPUBuilder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]::riaBvhGen = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen();
  }
  BVHDescriptor = (void *)AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createBVHDescriptor(a4, 0, -[AGXA10FamilyRayTracingGPUBuilder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]::riaBvhGen);
  v214 = 0;
  LOBYTE(v208[0]) = 0;
  v208[1] = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::calcRiaBvhSize((unint64_t)BVHDescriptor, a4, -[AGXA10FamilyRayTracingGPUBuilder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]::riaBvhGen, (unint64_t *)&v214);
  v208[2] = 0;
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  v138[0] = 0;
  v138[1] = -1;
  v138[2] = -1;
  v139 = 0;
  v140 = 0;
  v141 = -1;
  v142 = -1;
  v143 = 0;
  v144 = 0;
  v145 = -1;
  v146 = -1;
  v147 = 0;
  v148 = 0;
  v149 = -1;
  v150 = -1;
  v151 = 0;
  v154 = -1;
  v152 = 0;
  v153 = -1;
  v155 = 0;
  v156 = 0;
  v157 = -1;
  v158 = -1;
  v159 = 0;
  v160 = 0;
  v161 = -1;
  v162 = -1;
  v163 = 0;
  v164 = 0;
  v165 = -1;
  v166 = -1;
  v167 = 0;
  v168 = 0;
  v169 = -1;
  v170 = -1;
  v171 = 0;
  v174 = -1;
  v172 = 0;
  v173 = -1;
  v175 = 0;
  v176 = 0;
  v177 = -1;
  v178 = -1;
  v179 = 0;
  v180 = 0;
  v181 = -1;
  v182 = -1;
  v183 = 0;
  v184 = 0;
  v185 = -1;
  v186 = -1;
  v187 = 0;
  v188 = 0;
  v189 = -1;
  v190 = -1;
  v191 = 0;
  v194 = -1;
  v192 = 0;
  v193 = -1;
  v195 = 0;
  v198 = -1;
  v196 = 0;
  v197 = -1;
  v199 = 0;
  v200 = 0;
  v202 = -1;
  v201 = -1;
  v203 = 0;
  v204 = 0;
  v206 = -1;
  v205 = -1;
  v207 = 0;
  __dst[0] = 0;
  __dst[1] = -1;
  __dst[2] = -1;
  v54 = 0;
  v55 = 0;
  v56 = -1;
  v57 = -1;
  v58 = 0;
  v59 = 0;
  v60 = -1;
  v61 = -1;
  v62 = 0;
  v63 = 0;
  v64 = -1;
  v65 = -1;
  v66 = 0;
  v69 = -1;
  v67 = 0;
  v68 = -1;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  v73 = -1;
  v74 = -1;
  v75 = 0;
  v76 = 0;
  v77 = -1;
  v78 = -1;
  v79 = 0;
  v80 = 0;
  v81 = -1;
  v82 = -1;
  v83 = 0;
  v86 = -1;
  v84 = 0;
  v85 = -1;
  v87 = 0;
  v90 = -1;
  v88 = 0;
  v89 = -1;
  v91 = 0;
  v92 = 0;
  v93 = -1;
  v94 = -1;
  v95 = 0;
  v96 = 0;
  v97 = -1;
  v98 = -1;
  v99 = 0;
  v100 = 0;
  v101 = -1;
  v102 = -1;
  v103 = 0;
  v104 = 0;
  v105 = -1;
  v106 = -1;
  v107 = 0;
  v110 = -1;
  v108 = 0;
  v109 = -1;
  v111 = 0;
  v112 = 0;
  v115 = -1;
  v113 = 0;
  v114 = -1;
  v116 = 0;
  v117 = 0;
  v119 = -1;
  v118 = -1;
  v120 = 0;
  v121 = 0;
  v123 = -1;
  v122 = -1;
  v124 = 0;
  v125 = 0;
  v127 = -1;
  v126 = -1;
  v128 = 0;
  v129 = 0;
  v130 = 0;
  v132 = -1;
  v131 = -1;
  v133 = 0;
  v134 = 0;
  v136 = -1;
  v135 = -1;
  v137 = 0;
  if (objc_msgSend(BVHDescriptor, "buildAlgorithm") - 1 > 1)
  {
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocateTopDownScratch(__src, (uint64_t)self->_device, (unint64_t)BVHDescriptor, a4, v208, v214);
    v12 = __dst;
    v13 = __dst;
    v14 = 696;
  }
  else
  {
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocatePLOCScratch(__src, (unint64_t)BVHDescriptor, v208);
    v12 = v138;
    v13 = v138;
    v14 = 576;
  }
  memcpy(v13, __src, v14);
  v15 = *((_QWORD *)&v210 + 1);
  if (*((_QWORD *)&v210 + 1) <= *((_QWORD *)&v211 + 1))
    v15 = *((_QWORD *)&v211 + 1);
  if (v15 <= *((_QWORD *)&v212 + 1))
    v16 = *((_QWORD *)&v212 + 1);
  else
    v16 = v15;
  v17 = v9;
  if ((v9 & 1) != 0)
  {
    -[AGXA10FamilyRayTracingGPUBuilder _endVirtualSubstream](self, "_endVirtualSubstream");
  }
  else
  {
    v18 = *((_QWORD *)&v213 + 1);
    -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
    progressBins = (float *)self->_progressBins;
    if (progressBins)
    {
      v46 = v18 + ((v16 + 63) & 0xFFFFFFFFFFFFFFC0) + 64;
      computeEncoder = self->_computeEncoder;
      PrimitiveCountFromDescriptor = ProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
      v22 = progressBins[2];
      v23 = progressBins[3];
      v24 = *((unsigned __int16 *)progressBins + 20);
      if (v24 < 2)
      {
        v26 = 0;
      }
      else
      {
        v25 = 0;
        v26 = 0;
        v27 = progressBins[6];
        v28 = v24 - 1;
        do
        {
          v29 = progressBins[v25++ + 7];
          if (v29 < v27)
          {
            v26 = v25;
            v27 = v29;
          }
        }
        while (v28 != v25);
      }
      *((_WORD *)progressBins + 21) = v26;
      progressBins[11] = v22 + (float)(v23 * (float)PrimitiveCountFromDescriptor);
      -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v26);
      v30 = self->_progressBins;
      v31 = objc_msgSend(a3, "buffer");
      v32 = objc_msgSend(a3, "bufferOffset");
      v33 = objc_msgSend(a3, "size");
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __108__AGXA10FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke;
      v51[3] = &unk_250402128;
      v51[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v30, v31, v32, v33, 1, (uint64_t)v51);
      -[AGXA10FamilyRayTracingGPUBuilder substreamSynchronizeDescriptor:access:](self, "substreamSynchronizeDescriptor:access:", a4, 0);
      v34 = self->_progressBins;
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __108__AGXA10FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke_2;
      v50[3] = &unk_250402128;
      v50[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v34, (unint64_t)a5, a6, v46, 1, (uint64_t)v50);
    }
  }
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeBuildAndEncodeRiaBvh((id *)self->_impl, (unint64_t)BVHDescriptor, (uint64_t)v208, (uint64_t)v12, a3, a4, a5, a6);
  objc_autoreleasePoolPop(context);
  if ((v17 & 1) == 0)
  {
    v35 = (float *)self->_progressBins;
    if (v35)
    {
      v36 = *((unsigned __int16 *)v35 + 21);
      v35[v36 + 6] = v35[11] + v35[v36 + 6];
      v35[11] = 0.0;
      if (*((_BYTE *)v35 + 48))
      {
        v37 = (uint64_t *)*((_QWORD *)v35 + 9);
        if (v37)
        {
          v38 = *((_DWORD *)v35 + 35);
          do
          {
            *((_DWORD *)v37 + 8) = v38;
            *((_DWORD *)v37 + 9) = v36;
            v37 = (uint64_t *)*v37;
          }
          while (v37);
        }
        std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v35 + 12, (_QWORD *)v35 + 7);
        ++*((_DWORD *)v35 + 35);
      }
      else if (*((_QWORD *)v35 + 22))
      {
        v39 = *((unsigned int *)v35 + 35);
        *((_DWORD *)v35 + 35) = v39 + 1;
        v40 = (_QWORD *)*((_QWORD *)v35 + 21);
        if (v40)
        {
          v41 = *((_QWORD *)v35 + 18);
          v42 = (uint64_t **)*((_QWORD *)v35 + 21);
          do
          {
            *(_DWORD *)(v41 + 4 * *((unsigned int *)v42 + 4)) = v39;
            v42 = (uint64_t **)*v42;
          }
          while (v42);
          do
          {
            v43 = (_QWORD *)*v40;
            operator delete(v40);
            v40 = v43;
          }
          while (v43);
        }
        *((_QWORD *)v35 + 21) = 0;
        v44 = *((_QWORD *)v35 + 20);
        if (v44)
        {
          for (i = 0; i != v44; ++i)
            *(_QWORD *)(*((_QWORD *)v35 + 19) + 8 * i) = 0;
        }
        *((_QWORD *)v35 + 22) = 0;
        if ((v39 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
          -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v39);
      }
    }
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  float *v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t **v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t i;
  _QWORD v35[5];
  _QWORD v36[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v11 = *((unsigned __int16 *)progressBins + 20);
    if (v11 < 2)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = progressBins[6];
      v15 = v11 - 1;
      do
      {
        v16 = progressBins[v12++ + 7];
        if (v16 < v14)
        {
          v13 = v12;
          v14 = v16;
        }
      }
      while (v15 != v12);
    }
    v17 = *progressBins + (float)(progressBins[1] * 8.0);
    *((_WORD *)progressBins + 21) = v13;
    progressBins[11] = v17;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v13);
    v18 = self->_progressBins;
    v19 = objc_msgSend(a3, "buffer");
    v20 = objc_msgSend(a3, "bufferOffset");
    v21 = objc_msgSend(a3, "size");
    v22 = MEMORY[0x24BDAC760];
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __92__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke;
    v36[3] = &unk_250402128;
    v36[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v18, v19, v20, v21, 0, (uint64_t)v36);
    v23 = self->_progressBins;
    v35[0] = v22;
    v35[1] = 3221225472;
    v35[2] = __92__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke_2;
    v35[3] = &unk_250402128;
    v35[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, (unint64_t)a4, a5, 4, 1, (uint64_t)v35);
  }
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeWriteCompactedSize((uint64_t)self->_impl, a3, (uint64_t)a4, a5, 33);
  v24 = (float *)self->_progressBins;
  if (v24)
  {
    v25 = *((unsigned __int16 *)v24 + 21);
    v24[v25 + 6] = v24[11] + v24[v25 + 6];
    v24[11] = 0.0;
    if (*((_BYTE *)v24 + 48))
    {
      v26 = (uint64_t *)*((_QWORD *)v24 + 9);
      if (v26)
      {
        v27 = *((_DWORD *)v24 + 35);
        do
        {
          *((_DWORD *)v26 + 8) = v27;
          *((_DWORD *)v26 + 9) = v25;
          v26 = (uint64_t *)*v26;
        }
        while (v26);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v24 + 12, (_QWORD *)v24 + 7);
      ++*((_DWORD *)v24 + 35);
    }
    else if (*((_QWORD *)v24 + 22))
    {
      v28 = *((unsigned int *)v24 + 35);
      *((_DWORD *)v24 + 35) = v28 + 1;
      v29 = (_QWORD *)*((_QWORD *)v24 + 21);
      if (v29)
      {
        v30 = *((_QWORD *)v24 + 18);
        v31 = (uint64_t **)*((_QWORD *)v24 + 21);
        do
        {
          *(_DWORD *)(v30 + 4 * *((unsigned int *)v31 + 4)) = v28;
          v31 = (uint64_t **)*v31;
        }
        while (v31);
        do
        {
          v32 = (_QWORD *)*v29;
          operator delete(v29);
          v29 = v32;
        }
        while (v32);
      }
      *((_QWORD *)v24 + 21) = 0;
      v33 = *((_QWORD *)v24 + 20);
      if (v33)
      {
        for (i = 0; i != v33; ++i)
          *(_QWORD *)(*((_QWORD *)v24 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v24 + 22) = 0;
      if ((v28 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v28);
    }
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  float *progressBins;
  unint64_t v12;
  MTLComputeCommandEncoderSPI *computeEncoder;
  float v14;
  float v15;
  unint64_t v16;
  uint64_t v17;
  unsigned __int16 v18;
  float v19;
  unint64_t v20;
  float v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  float *v28;
  uint64_t v29;
  uint64_t *v30;
  int v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t **v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD v41[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    if (a6 == 33)
      v12 = 4;
    else
      v12 = 8;
    computeEncoder = self->_computeEncoder;
    v14 = *progressBins;
    v15 = progressBins[1];
    v16 = *((unsigned __int16 *)progressBins + 20);
    if (v16 < 2)
    {
      v18 = 0;
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v19 = progressBins[6];
      v20 = v16 - 1;
      do
      {
        v21 = progressBins[v17++ + 7];
        if (v21 < v19)
        {
          v18 = v17;
          v19 = v21;
        }
      }
      while (v20 != v17);
    }
    *((_WORD *)progressBins + 21) = v18;
    progressBins[11] = v14 + (float)(v15 * (float)v12);
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v18, v12);
    v22 = self->_progressBins;
    v23 = objc_msgSend(a3, "buffer");
    v24 = objc_msgSend(a3, "bufferOffset");
    v25 = objc_msgSend(a3, "size");
    v26 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __105__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke;
    v41[3] = &unk_250402128;
    v41[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v22, v23, v24, v25, 0, (uint64_t)v41);
    v27 = self->_progressBins;
    v40[0] = v26;
    v40[1] = 3221225472;
    v40[2] = __105__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke_2;
    v40[3] = &unk_250402128;
    v40[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v27, (unint64_t)a4, a5, v39, 1, (uint64_t)v40);
  }
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeWriteCompactedSize((uint64_t)self->_impl, a3, (uint64_t)a4, a5, a6);
  v28 = (float *)self->_progressBins;
  if (v28)
  {
    v29 = *((unsigned __int16 *)v28 + 21);
    v28[v29 + 6] = v28[11] + v28[v29 + 6];
    v28[11] = 0.0;
    if (*((_BYTE *)v28 + 48))
    {
      v30 = (uint64_t *)*((_QWORD *)v28 + 9);
      if (v30)
      {
        v31 = *((_DWORD *)v28 + 35);
        do
        {
          *((_DWORD *)v30 + 8) = v31;
          *((_DWORD *)v30 + 9) = v29;
          v30 = (uint64_t *)*v30;
        }
        while (v30);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v28 + 12, (_QWORD *)v28 + 7);
      ++*((_DWORD *)v28 + 35);
    }
    else if (*((_QWORD *)v28 + 22))
    {
      v32 = *((unsigned int *)v28 + 35);
      *((_DWORD *)v28 + 35) = v32 + 1;
      v33 = (_QWORD *)*((_QWORD *)v28 + 21);
      if (v33)
      {
        v34 = *((_QWORD *)v28 + 18);
        v35 = (uint64_t **)*((_QWORD *)v28 + 21);
        do
        {
          *(_DWORD *)(v34 + 4 * *((unsigned int *)v35 + 4)) = v32;
          v35 = (uint64_t **)*v35;
        }
        while (v35);
        do
        {
          v36 = (_QWORD *)*v33;
          operator delete(v33);
          v33 = v36;
        }
        while (v36);
      }
      *((_QWORD *)v28 + 21) = 0;
      v37 = *((_QWORD *)v28 + 20);
      if (v37)
      {
        for (i = 0; i != v37; ++i)
          *(_QWORD *)(*((_QWORD *)v28 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v28 + 22) = 0;
      if ((v32 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v32);
    }
  }
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  unint64_t v7;
  id v8;
  unint64_t v9;
  MTLComputeCommandEncoderSPI *computeEncoder;
  float *progressBins;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  float *v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t **v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t i;
  _QWORD v36[5];
  _QWORD v37[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  if (self->_progressBins)
  {
    v7 = objc_msgSend(a3, "size");
    if (v7 >= objc_msgSend(a4, "size"))
      v8 = a4;
    else
      v8 = a3;
    v9 = objc_msgSend(v8, "size");
    computeEncoder = self->_computeEncoder;
    progressBins = (float *)self->_progressBins;
    v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = progressBins[6];
      v16 = v12 - 1;
      do
      {
        v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          v14 = v13;
          v15 = v17;
        }
      }
      while (v16 != v13);
    }
    v18 = *progressBins + (float)(progressBins[1] * (float)v9);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v14);
    v19 = self->_progressBins;
    v20 = objc_msgSend(a3, "buffer");
    v21 = objc_msgSend(a3, "bufferOffset");
    v22 = objc_msgSend(a3, "size");
    v23 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __86__AGXA10FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke;
    v37[3] = &unk_250402128;
    v37[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 0, (uint64_t)v37);
    v24 = self->_progressBins;
    v36[0] = v23;
    v36[1] = 3221225472;
    v36[2] = __86__AGXA10FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v36[3] = &unk_250402128;
    v36[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v24, objc_msgSend(a4, "buffer"), objc_msgSend(a4, "bufferOffset"), objc_msgSend(a4, "size"), 1, (uint64_t)v36);
  }
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeCopy((uint64_t)self->_impl, a3, a4);
  v25 = (float *)self->_progressBins;
  if (v25)
  {
    v26 = *((unsigned __int16 *)v25 + 21);
    v25[v26 + 6] = v25[11] + v25[v26 + 6];
    v25[11] = 0.0;
    if (*((_BYTE *)v25 + 48))
    {
      v27 = (uint64_t *)*((_QWORD *)v25 + 9);
      if (v27)
      {
        v28 = *((_DWORD *)v25 + 35);
        do
        {
          *((_DWORD *)v27 + 8) = v28;
          *((_DWORD *)v27 + 9) = v26;
          v27 = (uint64_t *)*v27;
        }
        while (v27);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v25 + 12, (_QWORD *)v25 + 7);
      ++*((_DWORD *)v25 + 35);
    }
    else if (*((_QWORD *)v25 + 22))
    {
      v29 = *((unsigned int *)v25 + 35);
      *((_DWORD *)v25 + 35) = v29 + 1;
      v30 = (_QWORD *)*((_QWORD *)v25 + 21);
      if (v30)
      {
        v31 = *((_QWORD *)v25 + 18);
        v32 = (uint64_t **)*((_QWORD *)v25 + 21);
        do
        {
          *(_DWORD *)(v31 + 4 * *((unsigned int *)v32 + 4)) = v29;
          v32 = (uint64_t **)*v32;
        }
        while (v32);
        do
        {
          v33 = (_QWORD *)*v30;
          operator delete(v30);
          v30 = v33;
        }
        while (v33);
      }
      *((_QWORD *)v25 + 21) = 0;
      v34 = *((_QWORD *)v25 + 20);
      if (v34)
      {
        for (i = 0; i != v34; ++i)
          *(_QWORD *)(*((_QWORD *)v25 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v25 + 22) = 0;
      if ((v29 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v29);
    }
  }
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  unint64_t v7;
  id v8;
  unint64_t v9;
  MTLComputeCommandEncoderSPI *computeEncoder;
  float *progressBins;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  float *v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t **v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t i;
  _QWORD v36[5];
  _QWORD v37[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  if (self->_progressBins)
  {
    v7 = objc_msgSend(a3, "size");
    if (v7 >= objc_msgSend(a4, "size"))
      v8 = a4;
    else
      v8 = a3;
    v9 = objc_msgSend(v8, "size");
    computeEncoder = self->_computeEncoder;
    progressBins = (float *)self->_progressBins;
    v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = progressBins[6];
      v16 = v12 - 1;
      do
      {
        v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          v14 = v13;
          v15 = v17;
        }
      }
      while (v16 != v13);
    }
    v18 = *progressBins + (float)(progressBins[1] * (float)v9);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v14);
    v19 = self->_progressBins;
    v20 = objc_msgSend(a3, "buffer");
    v21 = objc_msgSend(a3, "bufferOffset");
    v22 = objc_msgSend(a3, "size");
    v23 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __96__AGXA10FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke;
    v37[3] = &unk_250402128;
    v37[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 0, (uint64_t)v37);
    v24 = self->_progressBins;
    v36[0] = v23;
    v36[1] = 3221225472;
    v36[2] = __96__AGXA10FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v36[3] = &unk_250402128;
    v36[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v24, objc_msgSend(a4, "buffer"), objc_msgSend(a4, "bufferOffset"), objc_msgSend(a4, "size"), 1, (uint64_t)v36);
  }
  -[AGXA10FamilyRayTracingGPUBuilder copyAccelerationStructure:toAccelerationStructure:](self, "copyAccelerationStructure:toAccelerationStructure:", a3, a4);
  v25 = (float *)self->_progressBins;
  if (v25)
  {
    v26 = *((unsigned __int16 *)v25 + 21);
    v25[v26 + 6] = v25[11] + v25[v26 + 6];
    v25[11] = 0.0;
    if (*((_BYTE *)v25 + 48))
    {
      v27 = (uint64_t *)*((_QWORD *)v25 + 9);
      if (v27)
      {
        v28 = *((_DWORD *)v25 + 35);
        do
        {
          *((_DWORD *)v27 + 8) = v28;
          *((_DWORD *)v27 + 9) = v26;
          v27 = (uint64_t *)*v27;
        }
        while (v27);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v25 + 12, (_QWORD *)v25 + 7);
      ++*((_DWORD *)v25 + 35);
    }
    else if (*((_QWORD *)v25 + 22))
    {
      v29 = *((unsigned int *)v25 + 35);
      *((_DWORD *)v25 + 35) = v29 + 1;
      v30 = (_QWORD *)*((_QWORD *)v25 + 21);
      if (v30)
      {
        v31 = *((_QWORD *)v25 + 18);
        v32 = (uint64_t **)*((_QWORD *)v25 + 21);
        do
        {
          *(_DWORD *)(v31 + 4 * *((unsigned int *)v32 + 4)) = v29;
          v32 = (uint64_t **)*v32;
        }
        while (v32);
        do
        {
          v33 = (_QWORD *)*v30;
          operator delete(v30);
          v30 = v33;
        }
        while (v33);
      }
      *((_QWORD *)v25 + 21) = 0;
      v34 = *((_QWORD *)v25 + 20);
      if (v34)
      {
        for (i = 0; i != v34; ++i)
          *(_QWORD *)(*((_QWORD *)v25 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v25 + 22) = 0;
      if ((v29 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v29);
    }
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  -[AGXA10FamilyRayTracingGPUBuilder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:](self, "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:", a3, a4, a5, a6, a7, -1);
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  MTLAttributeFormat v8;
  char v9;
  unsigned __int8 v13;
  MTLDevice *device;
  id v15;
  void *v16;
  uint64_t v17;
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t PrimitiveCountFromDescriptor;
  unint64_t v21;
  uint64_t v22;
  unsigned __int16 v23;
  float v24;
  unint64_t v25;
  float v26;
  float v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *impl;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  MTLAttributeFormat v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t BVHDescriptor;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unsigned __int8 v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  int v61;
  char v62;
  int v63;
  int v64;
  unsigned int v65;
  int v66;
  char v67;
  int v68;
  unsigned int v69;
  int v70;
  int v71;
  int v72;
  BOOL v73;
  int v74;
  int v75;
  int v76;
  int v77;
  BOOL v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  unsigned int v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  char v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  void *v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  MTLAttributeFormat v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  void *v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  MTLAttributeFormat v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int v149;
  unint64_t v150;
  unint64_t v151;
  BOOL v152;
  int v153;
  int v154;
  unsigned int v155;
  _QWORD *v156;
  uint64_t *v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  BOOL v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  int v167;
  uint64_t v168;
  int v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t Pipeline;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  unsigned int v186;
  _BOOL8 v187;
  uint64_t v188;
  BOOL v189;
  int v190;
  unsigned int j;
  int v192;
  unint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  unsigned int v200;
  int v201;
  float *v202;
  uint64_t v203;
  uint64_t *v204;
  int v205;
  unint64_t v206;
  void *v207;
  void *v208;
  unsigned int v209;
  unint64_t v210;
  unsigned int v211;
  unsigned int v212;
  int v213;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  _QWORD *v220;
  uint64_t v221;
  uint64_t v222;
  _QWORD *v223;
  uint64_t v224;
  uint64_t v225;
  int v226;
  int v227;
  uint64_t v228;
  int v229;
  uint64_t v230;
  _QWORD *v231;
  uint64_t v232;
  uint64_t **v233;
  _QWORD *v234;
  uint64_t v235;
  uint64_t k;
  _QWORD *v237;
  unint64_t v238;
  uint64_t i;
  unsigned int v240;
  int v241;
  BOOL v242;
  int v243;
  int v244;
  int CoarseCurveTestMode;
  int v246;
  int v247;
  unint64_t v248;
  void *v249;
  int v250;
  int v251;
  char v252;
  int v253;
  BOOL v254;
  int v255;
  int v256;
  _QWORD *v257;
  int v258;
  int v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  int v263;
  uint64_t v264;
  int v265;
  _BOOL4 v266;
  uint64_t v267;
  void *context;
  char v269;
  int v270;
  int v271;
  char *v273;
  int v274;
  void *v275;
  uint64_t v276;
  unsigned int v277;
  uint64_t v278;
  int v279;
  MTLAccelerationStructureDescriptor *v280;
  unsigned int v281;
  _QWORD *v282;
  _QWORD *v283;
  unsigned int v284;
  unint64_t v285;
  int v286;
  int v287;
  _QWORD *v288;
  _QWORD v289[5];
  _QWORD v290[5];
  uint64_t v291[4];
  uint64_t v292[4];
  unsigned int v293;
  void *__p[3];
  void *v295[3];
  uint64_t v296;
  unint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  _QWORD *v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  MTLAttributeFormat v305;
  uint64_t v306;
  uint64_t v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  unint64_t v312;
  uint64_t *v313;
  uint64_t v314;
  char *v315;
  uint64_t v316;

  v9 = a8;
  v316 = *MEMORY[0x24BDAC8D0];
  if ((v13 & 1) == 0
  {
    -[AGXA10FamilyRayTracingGPUBuilder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:]::forceBuildOnRefit = 0;
  }
  if (-[AGXA10FamilyRayTracingGPUBuilder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:]::forceBuildOnRefit)
  {
    v312 = 0;
    v313 = 0;
    v314 = 0;
    device = self->_device;
    if (device)
      -[MTLDevice accelerationStructureSizesWithDescriptor:](device, "accelerationStructureSizesWithDescriptor:", a4, a4, a5, a6, a7);
    v15 = a5;
    if (v312 > objc_msgSend(a3, "size"))
      v15 = (id)-[MTLDevice newAccelerationStructureWithSize:](self->_device, "newAccelerationStructureWithSize:", v312);
    v16 = (void *)objc_msgSend((id)-[MTLComputeCommandEncoderSPI device](self->_computeEncoder, "device"), "newBufferWithLength:options:", v313, 32);
    -[AGXA10FamilyRayTracingGPUBuilder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:](self, "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:", v15, a4, v16, 0);
    if (v15 != a5)
      -[AGXA10FamilyRayTracingGPUBuilder copyAndCompactAccelerationStructure:toAccelerationStructure:](self, "copyAndCompactAccelerationStructure:toAccelerationStructure:", v15, a5);

  }
  v280 = (MTLAccelerationStructureDescriptor *)a4;
  v269 = objc_msgSend(a4, "isInstanceDescriptor", a3, a4, a5, a6, a7);
  if ((v269 & 1) != 0)
  {
    v17 = -[AGXA10FamilyRayTracingGPUBuilder _endVirtualSubstream](self, "_endVirtualSubstream");
  }
  else
  {
    v17 = -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
    progressBins = (float *)self->_progressBins;
    if (progressBins)
    {
      computeEncoder = self->_computeEncoder;
      PrimitiveCountFromDescriptor = ProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
      v21 = *((unsigned __int16 *)progressBins + 20);
      if (v21 < 2)
      {
        v23 = 0;
      }
      else
      {
        v22 = 0;
        v23 = 0;
        v24 = progressBins[6];
        v25 = v21 - 1;
        do
        {
          v26 = progressBins[v22++ + 7];
          if (v26 < v24)
          {
            v23 = v22;
            v24 = v26;
          }
        }
        while (v25 != v22);
      }
      v27 = progressBins[4] + (float)(progressBins[5] * (float)PrimitiveCountFromDescriptor);
      *((_WORD *)progressBins + 21) = v23;
      progressBins[11] = v27;
      -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v23);
      v28 = self->_progressBins;
      v29 = objc_msgSend(a3, "buffer");
      v30 = objc_msgSend(a3, "bufferOffset");
      v31 = objc_msgSend(a3, "size");
      v32 = MEMORY[0x24BDAC760];
      v290[0] = MEMORY[0x24BDAC760];
      v290[1] = 3221225472;
      v8 = (MTLAttributeFormat)&unk_250402128;
      v290[2] = __128__AGXA10FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke;
      v290[3] = &unk_250402128;
      v290[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v28, v29, v30, v31, 0, (uint64_t)v290);
      v33 = self->_progressBins;
      v289[0] = v32;
      v289[1] = 3221225472;
      v289[2] = __128__AGXA10FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_2;
      v289[3] = &unk_250402128;
      v289[4] = self;
      ProgressBinsSynchronizeBufferAccessRange((uint64_t)v33, objc_msgSend(a5, "buffer"), objc_msgSend(a5, "bufferOffset"), objc_msgSend(a5, "size"), 1, (uint64_t)v289);
      v17 = -[AGXA10FamilyRayTracingGPUBuilder substreamSynchronizeDescriptor:access:](self, "substreamSynchronizeDescriptor:access:", v280, 0);
    }
  }
  context = (void *)MEMORY[0x234928298](v17);
  impl = self->_impl;
  objc_msgSend(a5, "accelerationStructureUniqueIdentifier");
  v35 = a3;
  if (a5)
  {
    v35 = a3;
    if (objc_msgSend(a5, "buffer"))
    {
      if (a3 != a5)
      {
        v36 = objc_msgSend(a3, "buffer");
        if (v36 != objc_msgSend(a5, "buffer")
          || (v37 = objc_msgSend(a3, "bufferOffset"), v37 != objc_msgSend(a5, "bufferOffset")))
        {
          AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeCopy((uint64_t)impl, a3, a5);
        }
      }
      v35 = a5;
    }
  }
  v270 = -[MTLAccelerationStructureDescriptor isInstanceDescriptor](v280, "isInstanceDescriptor");
  if ((((v9 & 3) == 0) & ~v270) != 0)
    goto LABEL_221;
  v273 = (char *)objc_msgSend(a3, "buffer");
  v262 = objc_msgSend(a3, "bufferOffset");
  objc_msgSend(v273, "contents");
  v261 = objc_msgSend(v273, "gpuAddress");
  objc_msgSend(v273, "length");
  v260 = (int)*MEMORY[0x24BE51650];
  objc_msgSend(*((id *)impl + 1), "useResource:usage:", v273, 1);
  v38 = (void *)objc_msgSend(v35, "buffer");
  v39 = objc_msgSend(v35, "bufferOffset");
  v40 = objc_msgSend(v38, "contents");
  v41 = objc_msgSend(v38, "gpuAddress");
  v42 = objc_msgSend(v38, "length");
  v43 = (uint64_t)v38 + (int)*MEMORY[0x24BE51650];
  v296 = v41 + v39;
  v297 = v39 + v40;
  v298 = v42;
  v299 = v43;
  objc_msgSend(*((id *)impl + 1), "useResource:usage:", v38, 2);
  BVHDescriptor = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::createBVHDescriptor(v280, 1, *((_DWORD *)impl + 8));
  v278 = BVHDescriptor;
  if (BVHDescriptor)
    v266 = *(_BYTE *)(BVHDescriptor + 83) != 0;
  else
    v266 = 0;
  v45 = *(_QWORD **)(*((_QWORD *)impl + 1) + 88);
  v46 = v45[20];
  v47 = v46 + 143;
  if ((unint64_t)(v46 + 143) <= v45[19])
    goto LABEL_32;
  v258 = AGX::DataBufferAllocator<34ul>::growNoInline(v45 + 2, 3, 0);
  v46 = v45[20];
  if (v258)
  {
    v47 = v46 + 143;
    if ((unint64_t)(v46 + 143) > v45[19])
      abort();
LABEL_32:
    v45[21] = v47;
  }
  v48 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  v51 = v48 + v45[22];
  v45[20] = v48 + 128;
  v49 = *(_QWORD *)(v45[5] + 224) + (int)*MEMORY[0x24BE51650];
  *(_OWORD *)v48 = 0u;
  *(_OWORD *)(v48 + 16) = 0u;
  *(_OWORD *)(v48 + 32) = 0u;
  *(_OWORD *)(v48 + 48) = 0u;
  *(_OWORD *)(v48 + 64) = 0u;
  *(_QWORD *)(v48 + 80) = 1;
  *(_QWORD *)(v48 + 88) = 0;
  *(_DWORD *)(v48 + 96) = -1;
  *(_QWORD *)(v48 + 100) = 0;
  *(_QWORD *)(v48 + 108) = 0;
  v50 = *(_QWORD *)(*((_QWORD *)impl + 1) + 88);
  *(_QWORD *)(v50 + 6112) = v51;
  *(_QWORD *)(*(_QWORD *)(v50 + 1792) + 592) = v51;
  *(_QWORD *)(v50 + 5336) = v49;
  *(_QWORD *)(v50 + 7136) |= 0x80uLL;
  *(_DWORD *)(v50 + 7152) |= 1u;
  v264 = v9 & 1;
  *(_BYTE *)(v48 + 101) = v9 & 1;
  *(_BYTE *)(v48 + 102) = (v9 & 2) != 0;
  LOBYTE(v51) = v278;
  if (v278)
    v51 = ((unint64_t)objc_msgSend(*(id *)(v278 + 48), "usage") >> 1) & 1;
  *(_BYTE *)(v48 + 103) = v51;
  v285 = v48;
  v53 = v278;
  if ((v52 & 1) == 0
  {
    shouldUpdateOpacityAndShaderTableOffsets(void)::updateOpacityAndShaderTableOffsets = dyld_program_sdk_at_least() ^ 1;
    v53 = v278;
  }
  *(_BYTE *)(v48 + 107) = shouldUpdateOpacityAndShaderTableOffsets(void)::updateOpacityAndShaderTableOffsets;
  if (v53)
  {
    if ((objc_msgSend(*(id *)(v53 + 48), "usage") & 1) != 0)
    {
      LOBYTE(v54) = 1;
      v53 = v278;
    }
    else
    {
      v53 = v278;
      v54 = ((unint64_t)objc_msgSend(*(id *)(v278 + 48), "usage") >> 1) & 1;
    }
  }
  else
  {
    LOBYTE(v54) = 0;
  }
  *(_BYTE *)(v48 + 106) = v54;
  memset(v295, 0, sizeof(v295));
  memset(__p, 0, sizeof(__p));
  if ((v270 & 1) != 0)
  {
    v55 = (void *)objc_opt_class();
    if (objc_msgSend(v55, "isSubclassOfClass:", objc_opt_class()))
    {
      v56 = -[MTLAccelerationStructureDescriptor motionTransformType](v280, "motionTransformType");
      switch(-[MTLAccelerationStructureDescriptor instanceDescriptorType](v280, "instanceDescriptorType"))
      {
        case 0:
          *(_DWORD *)(v48 + 88) = 128;
          v286 = 35;
          v287 = 34;
          break;
        case 1:
          *(_DWORD *)(v48 + 88) = 128;
          v286 = 37;
          v287 = 36;
          break;
        case 2:
          *(_DWORD *)(v48 + 88) = 48;
          v72 = -[MTLAccelerationStructureDescriptor motionTransformType](v280, "motionTransformType");
          v73 = v56 == 1;
          if (v56 == 1)
            v82 = 43;
          else
            v82 = 41;
          v286 = v82;
          v75 = 40;
          v76 = 42;
          goto LABEL_85;
        case 3:
          *(_DWORD *)(v48 + 88) = 128;
          v286 = 39;
          v287 = 38;
          break;
        case 4:
          *(_DWORD *)(v48 + 88) = 48;
          v72 = -[MTLAccelerationStructureDescriptor motionTransformType](v280, "motionTransformType");
          v73 = v56 == 1;
          if (v56 == 1)
            v74 = 47;
          else
            v74 = 45;
          v286 = v74;
          v75 = 44;
          v76 = 46;
LABEL_85:
          if (v73)
            v75 = v76;
          v287 = v75;
          *(_DWORD *)(v48 + 84) = v72;
          break;
        default:
          v286 = -1;
          v287 = -1;
          break;
      }
    }
    else
    {
      v59 = -[MTLAccelerationStructureDescriptor motionTransformType](v280, "motionTransformType");
      switch(-[MTLAccelerationStructureDescriptor instanceDescriptorType](v280, "instanceDescriptorType"))
      {
        case 0:
          *(_DWORD *)(v48 + 88) = 128;
          v286 = 35;
          v287 = 34;
          break;
        case 1:
          *(_DWORD *)(v48 + 88) = 128;
          v286 = 37;
          v287 = 36;
          break;
        case 2:
          *(_DWORD *)(v48 + 88) = 48;
          v77 = -[MTLAccelerationStructureDescriptor motionTransformType](v280, "motionTransformType");
          v78 = v59 == 1;
          if (v59 == 1)
            v83 = 43;
          else
            v83 = 41;
          v286 = v83;
          v80 = 40;
          v81 = 42;
          goto LABEL_92;
        case 3:
          *(_DWORD *)(v48 + 88) = 128;
          v286 = 39;
          v287 = 38;
          break;
        case 4:
          *(_DWORD *)(v48 + 88) = 48;
          v77 = -[MTLAccelerationStructureDescriptor motionTransformType](v280, "motionTransformType");
          v78 = v59 == 1;
          if (v59 == 1)
            v79 = 47;
          else
            v79 = 45;
          v286 = v79;
          v80 = 44;
          v81 = 46;
LABEL_92:
          if (v78)
            v80 = v81;
          v287 = v80;
          *(_DWORD *)(v48 + 84) = v77;
          break;
        default:
          v286 = -1;
          v287 = -1;
          break;
      }
    }
    *(_DWORD *)(v48 + 96) = 0;
    *(_DWORD *)(v48 + 56) = 1;
    v281 = 0;
    v61 = 0;
    *(_BYTE *)(v48 + 104) = -[MTLAccelerationStructureDescriptor instanceTransformationMatrixLayout](v280, "instanceTransformationMatrixLayout") == 1;
    v263 = -1;
    v265 = -1;
    v70 = -1;
LABEL_103:
    v62 = 0;
    v84 = v61;
    v71 = *(_DWORD *)(v48 + 88);
    v61 = v70;
LABEL_104:
    *(_DWORD *)(v48 + 92) = v71;
    v259 = v84;
    goto LABEL_105;
  }
  if (objc_msgSend((id)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors"), "count"))
  {
    v281 = objc_msgSend((id)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors"), "count");
    if (v53 && *(_QWORD *)(v53 + 40))
    {
      v57 = 0;
      v58 = 0;
      do
      {
        if (v58 <= objc_msgSend((id)objc_msgSend((id)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors"), "objectAtIndexedSubscript:", v57), "primitiveDataElementSize"))v58 = objc_msgSend((id)objc_msgSend((id)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors"), "objectAtIndexedSubscript:", v57), "primitiveDataElementSize");
        ++v57;
      }
      while (*(_QWORD *)(v53 + 40) > v57);
      v60 = v58 != 0;
    }
    else
    {
      v60 = 0;
    }
    *(_DWORD *)(v48 + 96) = 1;
    *(_DWORD *)(v48 + 56) = -[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount");
    if ((unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") >= 2)
    {
      -[MTLAccelerationStructureDescriptor motionStartTime](v280, "motionStartTime");
      *(_DWORD *)(v48 + 64) = v63;
      -[MTLAccelerationStructureDescriptor motionEndTime](v280, "motionEndTime");
      *(_DWORD *)(v48 + 68) = v64;
      *(_DWORD *)(v48 + 72) = -[MTLAccelerationStructureDescriptor motionStartBorderMode](v280, "motionStartBorderMode");
      *(_DWORD *)(v48 + 76) = -[MTLAccelerationStructureDescriptor motionEndBorderMode](v280, "motionEndBorderMode");
      *(_DWORD *)(v48 + 60) = 64;
    }
    -[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount");
    *(_DWORD *)(v48 + 80) = 1;
    if (v53)
    {
      v65 = *(_DWORD *)(v278 + 128);
      if (v65 > 7)
      {
        if (!v60)
        {
          v61 = 0;
          v84 = 0;
          v71 = 4;
          *(_DWORD *)(v48 + 88) = 4;
          v263 = -1;
          v62 = 1;
          v265 = -1;
          v286 = -1;
          v287 = -1;
          goto LABEL_104;
        }
        v70 = 0;
        v286 = -1;
        v287 = -1;
        v265 = -1;
        v263 = -1;
        goto LABEL_301;
      }
      v66 = 1 << v65;
      if ((v66 & 0xD2) != 0)
      {
        if ((unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") <= 1)
        {
          v67 = 0;
          v265 = -1;
          v68 = 1;
          v286 = 29;
          v287 = 28;
          v69 = 36;
        }
        else
        {
          v67 = 0;
          v265 = -1;
          v68 = 1;
          v286 = 91;
          v287 = 90;
          v69 = 64;
        }
        v71 = 4;
        v70 = 1;
LABEL_298:
        v263 = -1;
        goto LABEL_299;
      }
      if ((v66 & 9) == 0)
      {
        if ((unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") <= 1)
        {
          CoarseCurveTestMode = getCoarseCurveTestMode(v280);
          if (CoarseCurveTestMode == 1)
            v69 = 64;
          else
            v69 = 24;
          if (CoarseCurveTestMode == 1)
            v246 = 32;
          else
            v246 = 30;
          if (CoarseCurveTestMode == 1)
            v247 = 33;
          else
            v247 = 31;
          v286 = v247;
          v287 = v246;
        }
        else
        {
          v286 = 93;
          v287 = 92;
          v69 = 32;
        }
        v248 = *(_DWORD *)(v48 + 56) * v281;
        if ((_DWORD)v248)
        {
          std::vector<unsigned long long>::__append((uint64_t)__p, v248);
          v249 = __p[0];
        }
        else
        {
          v249 = 0;
        }
        AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::calculateCurveControlPointTotalSizeAndOffsets<true>(v278, v280, (uint64_t)v249);
        v67 = 0;
        v68 = 0;
        v265 = -1;
        v70 = 2;
        v71 = 4;
        goto LABEL_298;
      }
      if (*(_DWORD *)(v278 + 132) == 2)
        -[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount");
    }
    if ((unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") <= 1)
    {
      v241 = v278;
      if (v278)
        v241 = *(_DWORD *)(v278 + 132);
      v68 = 0;
      v70 = 0;
      v242 = v241 == 2;
      v69 = 48;
      if (v241 == 2)
        v243 = 50;
      else
        v243 = 48;
      v265 = v243;
      if (v242)
        v244 = 49;
      else
        v244 = -1;
      v263 = v244;
      v67 = 1;
      v286 = 27;
      v287 = 26;
      v71 = 64;
    }
    else
    {
      v68 = 0;
      v70 = 0;
      v263 = -1;
      v265 = 94;
      v67 = 1;
      v286 = 89;
      v69 = 88;
      v71 = 128;
      v287 = 88;
    }
LABEL_299:
    if (!v60)
    {
      if (v69 >= 0x21)
      {
        if (v69 >= 0x31)
        {
          if (v69 >= 0x41)
          {
            v61 = 0;
            v253 = 96;
          }
          else
          {
            v253 = 64;
            v61 = 0;
          }
        }
        else
        {
          v253 = 48;
          v61 = 0;
        }
      }
      else
      {
        v253 = 32;
        v61 = 0;
      }
      *(_DWORD *)(v48 + 88) = v253;
      if ((v67 & 1) != 0)
      {
        v62 = 1;
        v84 = 0;
        goto LABEL_104;
      }
      goto LABEL_103;
    }
    if ((v67 & 1) == 0)
    {
      v252 = 0;
      if (v68)
      {
        v254 = (unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") > 1;
        v255 = 48;
        v256 = 96;
      }
      else
      {
        v254 = (unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") > 1;
        v255 = 32;
        v256 = 48;
      }
      if (v254)
        v255 = v256;
      *(_DWORD *)(v48 + 88) = v255;
LABEL_318:
      if (v281)
      {
        std::vector<unsigned long long>::__append((uint64_t)v295, v281);
        v257 = v295[0];
      }
      else
      {
        v257 = 0;
      }
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::calculateOutOfLinePerPrimitiveDataTotalSizeAndOffsets<true>(v278, v280, v257);
      v61 = 1;
      if ((v252 & 1) != 0)
      {
        v259 = 1;
        v61 = 0;
        v62 = 1;
        goto LABEL_105;
      }
      goto LABEL_103;
    }
LABEL_301:
    if ((unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") <= 1)
      v250 = 64;
    else
      v250 = 96;
    *(_DWORD *)(v48 + 88) = v250;
    if ((unint64_t)-[MTLAccelerationStructureDescriptor motionKeyframeCount](v280, "motionKeyframeCount") <= 1)
      v251 = 96;
    else
      v251 = 128;
    *(_DWORD *)(v48 + 92) = v251;
    v252 = 1;
    goto LABEL_318;
  }
  v61 = 0;
  v281 = 0;
  v259 = 0;
  v263 = -1;
  v62 = 1;
  v265 = -1;
  v286 = -1;
  v287 = -1;
LABEL_105:
  v85 = *((_DWORD *)impl + 8);
  if ((v86 & 1) == 0
  {
  }
  if (v85 <= 1)
    v62 = 0;
  if ((v87 & 1) == 0
  {
  }
  *(_BYTE *)(v48 + 100) = v62;
  if (*(_DWORD *)(v48 + 56) < 3u)
    v88 = v62;
  else
    v88 = 0;
  *(_BYTE *)(v48 + 105) = v88;
  if ((-[MTLAccelerationStructureDescriptor isInstanceDescriptor](v280, "isInstanceDescriptor") & 1) != 0)
  {
    v312 = (unint64_t)impl;
    v313 = &v296;
    v89 = (void *)objc_opt_class();
    if (objc_msgSend(v89, "isSubclassOfClass:", objc_opt_class()))
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeCopyMotionTransforms(MTLAccelerationStructureDescriptor *,AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BuilderBuffer const&)::{lambda(AGX::G9::Encoders *)#1}::operator()<MTLIndirectInstanceAccelerationStructureDescriptor>((uint64_t *)&v312, v280);
    else
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeCopyMotionTransforms(MTLAccelerationStructureDescriptor *,AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BuilderBuffer const&)::{lambda(AGX::G9::Encoders *)#1}::operator()<MTLInstanceAccelerationStructureDescriptor>((uint64_t *)&v312, v280);
    v92 = (void *)objc_opt_class();
    if (objc_msgSend(v92, "isSubclassOfClass:", objc_opt_class()))
    {
      v93 = (void *)-[MTLAccelerationStructureDescriptor instanceDescriptorBuffer](v280, "instanceDescriptorBuffer");
      v94 = -[MTLAccelerationStructureDescriptor instanceDescriptorBufferOffset](v280, "instanceDescriptorBufferOffset");
      objc_msgSend(v93, "contents");
      v95 = objc_msgSend(v93, "gpuAddress");
      objc_msgSend(v93, "length");
      objc_msgSend(*((id *)impl + 1), "useResource:usage:", v93, 1);
      *(_QWORD *)(v48 + 24) = v95 + v94;
      *(_DWORD *)(v48 + 108) = -[MTLAccelerationStructureDescriptor instanceDescriptorStride](v280, "instanceDescriptorStride");
      if ((-[MTLAccelerationStructureDescriptor usage](v280, "usage") & 4) != 0)
        v96 = -1;
      else
        v96 = 255;
      *(_DWORD *)(v48 + 112) = v96;
    }
    else
    {
      v119 = (void *)-[MTLAccelerationStructureDescriptor instanceDescriptorBuffer](v280, "instanceDescriptorBuffer");
      v120 = -[MTLAccelerationStructureDescriptor instanceDescriptorBufferOffset](v280, "instanceDescriptorBufferOffset");
      objc_msgSend(v119, "contents");
      v121 = objc_msgSend(v119, "gpuAddress");
      objc_msgSend(v119, "length");
      objc_msgSend(*((id *)impl + 1), "useResource:usage:", v119, 1);
      *(_QWORD *)(v48 + 24) = v121 + v120;
      *(_DWORD *)(v48 + 108) = -[MTLAccelerationStructureDescriptor instanceDescriptorStride](v280, "instanceDescriptorStride");
      if ((-[MTLAccelerationStructureDescriptor usage](v280, "usage") & 4) != 0)
        v122 = -1;
      else
        v122 = 255;
      *(_DWORD *)(v48 + 112) = v122;
      v123 = (void *)-[MTLAccelerationStructureDescriptor instancedAccelerationStructures](v280, "instancedAccelerationStructures");
      v124 = objc_msgSend(v123, "count");
      v125 = v124;
      if (v124 <= 1)
        v126 = 1;
      else
        v126 = v124;
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)&v304, (uint64_t)impl, 8 * v126, 0);
      if (v125)
      {
        v40 = MTLAttributeFormatInvalid;
        v8 = v305;
        do
        {
          v127 = (void *)objc_msgSend(v123, "objectAtIndexedSubscript:", v40);
          v128 = objc_msgSend((id)objc_msgSend(v127, "buffer"), "gpuAddress");
          *(_QWORD *)(v8 + 8 * v40++) = objc_msgSend(v127, "bufferOffset") + v128;
        }
        while (v125 != v40);
      }
      v129 = objc_msgSend(v123, "count");
      if ((unint64_t)objc_msgSend(v123, "count") < 2)
        v130 = 4;
      else
        v130 = 4 * objc_msgSend(v123, "count");
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BuilderBufferForPrivateAllocation(&v300, (uint64_t)impl, v130, 0);
      if (v129)
      {
        v40 = MTLAttributeFormatInvalid;
        v237 = v301;
        do
        {
          *((_DWORD *)v237 + v40) = *(_DWORD *)(objc_msgSend(v123, "objectAtIndexedSubscript:", v40) + 344);
          ++v40;
        }
        while (v129 != v40);
      }
      v238 = v304;
      *(_QWORD *)(v48 + 40) = v300;
      *(_QWORD *)(v48 + 48) = v238;
      v310 = 0u;
      v311 = 0u;
      v308 = 0u;
      v309 = 0u;
      for (i = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v308, &v312, 16);
            i;
            i = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v308, &v312, 16))
      {
        objc_msgSend(*((id *)impl + 1), "useResources:count:usage:", *((_QWORD *)&v308 + 1), i, 1);
      }
    }
  }
  else
  {
    v90 = (void *)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors");
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::newGeometryBuffer((uint64_t)&v312, (uint64_t)impl, v278, (void *)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors"), 0);
    *(_QWORD *)(v48 + 16) = v312;
    if (objc_msgSend(v90, "count"))
    {
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)&v308, (uint64_t)impl, objc_msgSend((id)v278, "resourceBufferLength"), 0);
      v91 = v308;
      objc_msgSend((id)v278, "setResourceBufferContents:resourceBufferAddress:instanceBoundingBoxBufferAddress:useResourcesOnEncoder:", *((_QWORD *)&v308 + 1), (_QWORD)v308, 0, *((_QWORD *)impl + 1));
      *(_QWORD *)(v48 + 8) = v91;
    }
  }
  *(_QWORD *)v48 = v296;
  v97 = *((_QWORD *)impl + 2);
  if (v97)
  {
    *(_QWORD *)(v48 + 32) = *(_QWORD *)(v97 + (int)*MEMORY[0x24BE51650] + 8);
    objc_msgSend(*((id *)impl + 1), "useResource:usage:");
  }
  objc_msgSend(*((id *)impl + 1), "setThreadgroupMemoryLength:atIndex:", 1536, 0);
  v271 = v61;
  if (v278 && v61 == 2 && (v9 & 1) != 0)
  {
    v98 = *(void **)(v278 + 48);
    v99 = *(_DWORD *)(v278 + 128);
    if (v99 == 2)
    {
      v131 = objc_msgSend(v98, "geometryDescriptors");
      if (v281)
      {
        v132 = (void *)v131;
        v40 = MTLAttributeFormatInvalid;
        v276 = v281;
        v283 = __p[0];
        do
        {
          v133 = (void *)objc_msgSend(v132, "objectAtIndexedSubscript:", v40);
          v134 = (char *)objc_msgSend(v133, "controlPointBuffer");
          v135 = objc_msgSend(v133, "controlPointBufferOffset");
          v136 = objc_msgSend(v134, "contents");
          v137 = objc_msgSend(v134, "gpuAddress");
          v138 = objc_msgSend(v134, "length");
          v139 = &v134[*MEMORY[0x24BE51650]];
          v312 = v137 + v135;
          v313 = (uint64_t *)(v135 + v136);
          v314 = v138;
          v315 = v139;
          objc_msgSend(*((id *)impl + 1), "useResource:usage:", v134, 1);
          LODWORD(v134) = objc_msgSend(v133, "controlPointStride");
          v8 = objc_msgSend(v133, "controlPointFormat");
          v140 = (char *)objc_msgSend(v133, "radiusBuffer");
          v141 = objc_msgSend(v133, "radiusBufferOffset");
          v142 = objc_msgSend(v140, "contents");
          v143 = objc_msgSend(v140, "gpuAddress");
          v144 = objc_msgSend(v140, "length");
          v145 = &v140[*MEMORY[0x24BE51650]];
          *(_QWORD *)&v308 = v143 + v141;
          *((_QWORD *)&v308 + 1) = v141 + v142;
          *(_QWORD *)&v309 = v144;
          *((_QWORD *)&v309 + 1) = v145;
          objc_msgSend(*((id *)impl + 1), "useResource:usage:", v140, 1);
          LODWORD(v140) = objc_msgSend(v133, "radiusStride");
          v146 = objc_msgSend(v133, "radiusFormat");
          v147 = objc_msgSend(v133, "controlPointCount");
          v148 = v296 + v283[v40];
          v304 = v296 + 152;
          v305 = v297 + 152;
          v306 = v298;
          v307 = v299;
          AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeCopyControlPoints((uint64_t)impl, &v312, (int)v134, v8, &v308, (int)v140, v146, v147, v148, v299, (uint64_t *)&v304);
          ++v40;
          v48 = v285;
        }
        while (v276 != v40);
      }
    }
    else if (v99 == 5)
    {
      v275 = (void *)objc_msgSend(v98, "geometryDescriptors");
      if (v281)
      {
        v100 = 0;
        v267 = v281;
        v282 = __p[0];
        do
        {
          v101 = objc_msgSend(v275, "objectAtIndexedSubscript:", v100);
          if (*(_DWORD *)(v48 + 56))
          {
            v102 = (void *)v101;
            v103 = 0;
            do
            {
              v104 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "controlPointBuffers"), "objectAtIndexedSubscript:", v103), "buffer");
              v105 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "controlPointBuffers"), "objectAtIndexedSubscript:", v103), "offset");
              v106 = objc_msgSend(v104, "contents");
              v107 = objc_msgSend(v104, "gpuAddress");
              v108 = objc_msgSend(v104, "length");
              v109 = &v104[*MEMORY[0x24BE51650]];
              v312 = v107 + v105;
              v313 = (uint64_t *)(v105 + v106);
              v314 = v108;
              v315 = v109;
              objc_msgSend(*((id *)impl + 1), "useResource:usage:", v104, 1);
              v8 = objc_msgSend(v102, "controlPointStride");
              v110 = objc_msgSend(v102, "controlPointFormat");
              v111 = (char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "radiusBuffers"), "objectAtIndexedSubscript:", v103), "buffer");
              v112 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "radiusBuffers"), "objectAtIndexedSubscript:", v103), "offset");
              v113 = objc_msgSend(v111, "contents");
              v114 = objc_msgSend(v111, "gpuAddress");
              v115 = objc_msgSend(v111, "length");
              v116 = &v111[*MEMORY[0x24BE51650]];
              *(_QWORD *)&v308 = v114 + v112;
              *((_QWORD *)&v308 + 1) = v112 + v113;
              *(_QWORD *)&v309 = v115;
              *((_QWORD *)&v309 + 1) = v116;
              objc_msgSend(*((id *)impl + 1), "useResource:usage:", v111, 1);
              LODWORD(v111) = objc_msgSend(v102, "radiusStride");
              v40 = objc_msgSend(v102, "radiusFormat");
              v117 = objc_msgSend(v102, "controlPointCount");
              v48 = v285;
              v118 = v296 + v282[v103 + v100 * *(unsigned int *)(v285 + 56)];
              v304 = v296 + 152;
              v305 = v297 + 152;
              v306 = v298;
              v307 = v299;
              AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeCopyControlPoints((uint64_t)impl, &v312, v8, v110, &v308, (int)v111, v40, v117, v118, v299, (uint64_t *)&v304);
              ++v103;
            }
            while (v103 < *(unsigned int *)(v285 + 56));
          }
          ++v100;
        }
        while (v100 != v267);
      }
    }
  }
  if (v266)
  {
    v149 = 1;
  }
  else
  {
    v149 = *(_DWORD *)(v48 + 56) - 1;
    if (v149 <= 1)
      v149 = 1;
  }
  v277 = v149;
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
    IOGPUDeviceTraceEvent();
  if (v278)
    v150 = *(_QWORD *)(v278 + 16);
  else
    v150 = 0;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)impl + 808) + 5204) <= 0x1Eu)
    v151 = 6;
  else
    v151 = 7;
  if (v264)
    v152 = v265 == -1;
  else
    v152 = 1;
  v153 = !v152;
  if (*((_DWORD *)impl + 8) >= 2u)
    v154 = v153;
  else
    v154 = 0;
  v284 = v150 - 1;
  v279 = v154;
  v293 = v150 - 1 + v154;
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)&v312, (uint64_t)impl, 24 * v293, 1);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BuilderBufferForPrivateAllocation((uint64_t *)&v308, (uint64_t)impl, 32 * v293, 0);
  v155 = v293;
  if (!v293)
    goto LABEL_192;
  v156 = (_QWORD *)*((_QWORD *)impl + 1);
  v40 = v156[11];
  if ((_DWORD)v150 != 1)
  {
    v158 = v312;
    v157 = v313;
    v159 = (v150 - 1);
    v160 = *((_QWORD *)&v308 + 1);
    v161 = 4 * v159 + 128;
    do
    {
      v162 = v159-- >= v151;
      v163 = 3 * v159;
      v164 = v158 + v163 * 8;
      v165 = &v157[v163];
      *(_OWORD *)v165 = xmmword_232D73B10;
      v165[2] = 0x100000001;
      v166 = v160 + 32 * v159;
      *(_QWORD *)v166 = v164;
      *(_QWORD *)(v166 + 8) = 120;
      if (v162)
        v167 = 1;
      else
        v167 = 8;
      *(_QWORD *)(v166 + 16) = v161;
      *(_DWORD *)(v166 + 24) = v167;
      v161 -= 4;
    }
    while ((_DWORD)v159);
  }
  if ((v279 & 1) != 0)
  {
    v168 = v155 - 1;
    if (v150 >= 0x14 || v263 == -1)
      v170 = 1;
    else
      v170 = 4;
    v171 = *((_QWORD *)&v308 + 1);
    v172 = v168 + 2 * v168;
    v173 = v172 * 8 + v312;
    v174 = &v313[v172];
    *(_OWORD *)v174 = xmmword_232D73B10;
    v174[2] = 0x100000001;
    v175 = v171 + 32 * v168;
    *(_QWORD *)v175 = v173;
    *(_QWORD *)(v175 + 8) = 120;
    *(_QWORD *)(v175 + 16) = 4 * v284;
    *(_DWORD *)(v175 + 24) = v170;
  }
  objc_msgSend(v156, "setBytes:length:atIndex:", &v293, 4, 1);
  v176 = *((_QWORD *)impl + 1);
  v177 = *(_QWORD *)(v176 + 88);
  *(_QWORD *)(v177 + 6056) = v261 + v262;
  *(_QWORD *)(*(_QWORD *)(v177 + 1792) + 536) = v261 + v262;
  *(_QWORD *)(v177 + 5280) = &v273[v260];
  *(_QWORD *)(v177 + 7136) |= 1uLL;
  *(_DWORD *)(v177 + 7152) |= 1u;
  v178 = *(_QWORD *)(v176 + 88);
  v179 = v308;
  v180 = *((_QWORD *)&v309 + 1);
  *(_QWORD *)(v178 + 6072) = v308;
  *(_QWORD *)(*(_QWORD *)(v178 + 1792) + 552) = v179;
  *(_QWORD *)(v178 + 5296) = v180;
  *(_QWORD *)(v178 + 7136) |= 4uLL;
  *(_DWORD *)(v178 + 7152) |= 1u;
  Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 106, 0);
  v182 = *(_QWORD *)(v40 + 1776);
  *(_QWORD *)(v40 + 1776) = Pipeline;
  v183 = *(_QWORD *)(Pipeline + 16);
  *(_BYTE *)(v40 + 1745) = *(_BYTE *)(v183 + 216);
  *(_BYTE *)(v40 + 1746) = *(_BYTE *)(v183 + 1992);
  if (*(_DWORD *)(v40 + 1736) == 1)
  {
    if (!*(_BYTE *)(v40 + 7672))
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v40 + 1624), (_QWORD *)(v40 + 16));
      v240 = *(_DWORD *)(v40 + 7316);
      if (*(_DWORD *)(v40 + 7312) < v240)
        *(_DWORD *)(v40 + 7312) = v240;
      *(_DWORD *)(v40 + 7316) = 0;
      if (!v182)
        goto LABEL_192;
      goto LABEL_191;
    }
    v184 = *(_QWORD *)(v40 + 7688);
    if (*(_QWORD *)(v40 + 7680) != v184)
    {
      *(_BYTE *)(v184 - 8) = 1;
      *(_BYTE *)(v184 - 7) = *(_BYTE *)(*(_QWORD *)(v40 + 1768) + 458);
    }
  }
  if (v182)
  {
LABEL_191:
    *(_QWORD *)(v40 + 1776) = v182;
    v185 = *(_QWORD *)(v182 + 16);
    *(_BYTE *)(v40 + 1745) = *(_BYTE *)(v185 + 216);
    *(_BYTE *)(v40 + 1746) = *(_BYTE *)(v185 + 1992);
  }
LABEL_192:
  v186 = 0;
  v187 = !v266;
  v188 = v187 | 0x100;
  v189 = v150 >= 0x14 || v263 == -1;
  v190 = v265;
  if (!v189)
    v190 = v263;
  v274 = v190;
  do
  {
    for (j = v284; j; --j)
    {
      v304 = __PAIR64__(j, v186);
      objc_msgSend(*((id *)impl + 1), "setBytes:length:atIndex:", &v304, 8, 8);
      if (j >= v151)
        v192 = v286;
      else
        v192 = v287;
      v193 = v8 & 0xFFFFFFFFFFFF0000 | v187;
      v8 = v193 | 0x100;
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v192, v193 | 0x100);
    }
    v304 = v186;
    objc_msgSend(*((id *)impl + 1), "setBytes:length:atIndex:", &v304, 8, 8);
    v194 = *(_QWORD *)(*((_QWORD *)impl + 1) + 88);
    v150 = v150 & 0xFFFFFFFFFFFF0000 | v188;
    v195 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v287, v150);
    v196 = *(_QWORD *)(v194 + 1776);
    *(_QWORD *)(v194 + 1776) = v195;
    v197 = *(_QWORD *)(v195 + 16);
    *(_BYTE *)(v194 + 1745) = *(_BYTE *)(v197 + 216);
    *(_BYTE *)(v194 + 1746) = *(_BYTE *)(v197 + 1992);
    if (*(_DWORD *)(v194 + 1736) != 1)
      goto LABEL_208;
    if (*(_BYTE *)(v194 + 7672))
    {
      v198 = *(_QWORD *)(v194 + 7688);
      if (*(_QWORD *)(v194 + 7680) != v198)
      {
        *(_BYTE *)(v198 - 8) = 1;
        *(_BYTE *)(v198 - 7) = *(_BYTE *)(*(_QWORD *)(v194 + 1768) + 458);
      }
LABEL_208:
      if (!v196)
        goto LABEL_210;
LABEL_209:
      *(_QWORD *)(v194 + 1776) = v196;
      v199 = *(_QWORD *)(v196 + 16);
      *(_BYTE *)(v194 + 1745) = *(_BYTE *)(v199 + 216);
      *(_BYTE *)(v194 + 1746) = *(_BYTE *)(v199 + 1992);
      goto LABEL_210;
    }
    AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v194 + 1624), (_QWORD *)(v194 + 16));
    v200 = *(_DWORD *)(v194 + 7316);
    if (*(_DWORD *)(v194 + 7312) < v200)
      *(_DWORD *)(v194 + 7312) = v200;
    *(_DWORD *)(v194 + 7316) = 0;
    if (v196)
      goto LABEL_209;
LABEL_210:
    if (v279)
    {
      v40 = v40 & 0xFFFFFFFFFFFF0000 | v188;
      AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v274, v40);
    }
    ++v186;
  }
  while (v186 != v277);
  v201 = v271;
  if ((v270 & 1) == 0 && *(_BYTE *)(v285 + 102) && v259)
  {
    v206 = 0;
    v288 = v295[0];
    while (1)
    {
      if (objc_msgSend((id)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors"), "count") <= v206)goto LABEL_217;
      v207 = (void *)objc_msgSend((id)-[MTLAccelerationStructureDescriptor geometryDescriptors](v280, "geometryDescriptors"), "objectAtIndexedSubscript:", v206);
      v208 = v207;
      if (v201 == 1)
        v209 = objc_msgSend(v207, "boundingBoxCount");
      else
        v209 = v201 ? objc_msgSend(v207, "segmentCount") : objc_msgSend(v207, "triangleCount");
      v210 = v209;
      if (v209)
        break;
LABEL_232:
      ++v206;
    }
    v211 = objc_msgSend(v208, "primitiveDataElementSize");
    v212 = v211;
    if (v211 < 2)
    {
      v213 = 1;
    }
    else if (v211 > 0x10)
    {
      v213 = 32;
    }
    else
    {
      v213 = 1 << -__clz(v211 - 1);
    }
    v214 = (char *)objc_msgSend(v208, "primitiveDataBuffer");
    v215 = objc_msgSend(v208, "primitiveDataBufferOffset");
    v216 = objc_msgSend(v214, "contents");
    v217 = objc_msgSend(v214, "gpuAddress");
    v218 = objc_msgSend(v214, "length");
    v219 = &v214[*MEMORY[0x24BE51650]];
    v304 = v217 + v215;
    v305 = v215 + v216;
    v306 = v218;
    v307 = (uint64_t)v219;
    objc_msgSend(*((id *)impl + 1), "useResource:usage:", v214, 1);
    v220 = *(_QWORD **)(*((_QWORD *)impl + 1) + 88);
    v221 = v220[20];
    v222 = v221 + 31;
    if ((unint64_t)(v221 + 31) > v220[19])
    {
      v229 = AGX::DataBufferAllocator<34ul>::growNoInline(v220 + 2, 3, 0);
      v221 = v220[20];
      if (v229)
      {
        v222 = v221 + 31;
        if ((unint64_t)(v221 + 31) > v220[19])
          abort();
        goto LABEL_245;
      }
    }
    else
    {
LABEL_245:
      v220[21] = v222;
    }
    v223 = (_QWORD *)((v221 + 15) & 0xFFFFFFFFFFFFFFF0);
    v224 = (int)*MEMORY[0x24BE51650];
    v300 = (uint64_t)v223 + v220[22];
    v301 = v223;
    *v223 = 0;
    v220[20] = v223 + 2;
    v225 = *(_QWORD *)(v220[5] + 224) + v224;
    v302 = 8;
    v303 = v225;
    v226 = objc_msgSend(v208, "primitiveDataStride");
    v227 = objc_msgSend(v208, "primitiveDataElementSize");
    v228 = v288[v206];
    v292[0] = v296 + v228;
    v292[1] = v228 + v297;
    v292[2] = v298;
    v292[3] = v299;
    v291[0] = v296 + 136;
    v291[1] = v297 + 136;
    v291[2] = v298;
    v291[3] = v299;
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeStridedCopy((uint64_t)impl, (uint64_t *)&v304, &v300, v226, (_QWORD *)v210, 1u, v227, v292, v291, (v212 + v213 - 1) & -v213);
    v201 = v271;
    goto LABEL_232;
  }
LABEL_217:
  if (__p[0])
    operator delete(__p[0]);
  if (v295[0])
    operator delete(v295[0]);
LABEL_221:
  objc_autoreleasePoolPop(context);
  if ((v269 & 1) == 0)
  {
    v202 = (float *)self->_progressBins;
    if (v202)
    {
      v203 = *((unsigned __int16 *)v202 + 21);
      v202[v203 + 6] = v202[11] + v202[v203 + 6];
      v202[11] = 0.0;
      if (*((_BYTE *)v202 + 48))
      {
        v204 = (uint64_t *)*((_QWORD *)v202 + 9);
        if (v204)
        {
          v205 = *((_DWORD *)v202 + 35);
          do
          {
            *((_DWORD *)v204 + 8) = v205;
            *((_DWORD *)v204 + 9) = v203;
            v204 = (uint64_t *)*v204;
          }
          while (v204);
        }
        std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v202 + 12, (_QWORD *)v202 + 7);
        ++*((_DWORD *)v202 + 35);
      }
      else if (*((_QWORD *)v202 + 22))
      {
        v230 = *((unsigned int *)v202 + 35);
        *((_DWORD *)v202 + 35) = v230 + 1;
        v231 = (_QWORD *)*((_QWORD *)v202 + 21);
        if (v231)
        {
          v232 = *((_QWORD *)v202 + 18);
          v233 = (uint64_t **)*((_QWORD *)v202 + 21);
          do
          {
            *(_DWORD *)(v232 + 4 * *((unsigned int *)v233 + 4)) = v230;
            v233 = (uint64_t **)*v233;
          }
          while (v233);
          do
          {
            v234 = (_QWORD *)*v231;
            operator delete(v231);
            v231 = v234;
          }
          while (v234);
        }
        *((_QWORD *)v202 + 21) = 0;
        v235 = *((_QWORD *)v202 + 20);
        if (v235)
        {
          for (k = 0; k != v235; ++k)
            *(_QWORD *)(*((_QWORD *)v202 + 19) + 8 * k) = 0;
        }
        *((_QWORD *)v202 + 22) = 0;
        if ((v230 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
          -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v230);
      }
    }
  }
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *impl;
  _QWORD *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t Pipeline;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float *v45;
  uint64_t v46;
  uint64_t *v47;
  int v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t **v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t i;
  unsigned int v56;
  _QWORD v57[5];
  _QWORD v58[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v11 = *((unsigned __int16 *)progressBins + 20);
    if (v11 < 2)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = progressBins[6];
      v15 = v11 - 1;
      do
      {
        v16 = progressBins[v12++ + 7];
        if (v16 < v14)
        {
          v13 = v12;
          v14 = v16;
        }
      }
      while (v15 != v12);
    }
    v17 = *progressBins + (float)(progressBins[1] * 8.0);
    *((_WORD *)progressBins + 21) = v13;
    progressBins[11] = v17;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v13);
    v18 = self->_progressBins;
    v19 = objc_msgSend(a3, "buffer");
    v20 = objc_msgSend(a3, "bufferOffset");
    v21 = objc_msgSend(a3, "size");
    v22 = MEMORY[0x24BDAC760];
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __103__AGXA10FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke;
    v58[3] = &unk_250402128;
    v58[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v18, v19, v20, v21, 0, (uint64_t)v58);
    v23 = self->_progressBins;
    v57[0] = v22;
    v57[1] = 3221225472;
    v57[2] = __103__AGXA10FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke_2;
    v57[3] = &unk_250402128;
    v57[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, (unint64_t)a4, a5, 4, 1, (uint64_t)v57);
  }
  impl = self->_impl;
  v25 = (_QWORD *)*((_QWORD *)impl + 1);
  v26 = v25[11];
  objc_msgSend(v25, "useResource:usage:", a3, 1);
  v27 = (char *)objc_msgSend(a3, "buffer");
  v28 = objc_msgSend(a3, "bufferOffset");
  objc_msgSend(v27, "contents");
  v29 = v28 + objc_msgSend(v27, "gpuAddress");
  objc_msgSend(v27, "length");
  v30 = (int *)MEMORY[0x24BE51650];
  v31 = &v27[*MEMORY[0x24BE51650]];
  v32 = a5;
  v33 = v29 + 64;
  objc_msgSend(*((id *)impl + 1), "useResource:usage:", v27, 1);
  objc_msgSend(a4, "contents");
  v34 = objc_msgSend(a4, "gpuAddress");
  objc_msgSend(a4, "length");
  v35 = (char *)a4 + *v30;
  v36 = v34 + v32;
  objc_msgSend(*((id *)impl + 1), "useResource:usage:", a4, 1);
  v37 = *((_QWORD *)impl + 1);
  v38 = *(_QWORD *)(v37 + 88);
  *(_QWORD *)(v38 + 6056) = v33;
  *(_QWORD *)(*(_QWORD *)(v38 + 1792) + 536) = v33;
  *(_QWORD *)(v38 + 5280) = v31;
  *(_QWORD *)(v38 + 7136) |= 1uLL;
  *(_DWORD *)(v38 + 7152) |= 1u;
  v39 = *(_QWORD *)(v37 + 88);
  *(_QWORD *)(v39 + 6064) = v36;
  *(_QWORD *)(*(_QWORD *)(v39 + 1792) + 544) = v36;
  *(_QWORD *)(v39 + 5288) = v35;
  *(_QWORD *)(v39 + 7136) |= 2uLL;
  *(_DWORD *)(v39 + 7152) |= 1u;
  Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 115, 0);
  v41 = *(_QWORD *)(v26 + 1776);
  *(_QWORD *)(v26 + 1776) = Pipeline;
  v42 = *(_QWORD *)(Pipeline + 16);
  *(_BYTE *)(v26 + 1745) = *(_BYTE *)(v42 + 216);
  *(_BYTE *)(v26 + 1746) = *(_BYTE *)(v42 + 1992);
  if (*(_DWORD *)(v26 + 1736) != 1)
  {
LABEL_14:
    if (!v41)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (*(_BYTE *)(v26 + 7672))
  {
    v43 = *(_QWORD *)(v26 + 7688);
    if (*(_QWORD *)(v26 + 7680) != v43)
    {
      *(_BYTE *)(v43 - 8) = 1;
      *(_BYTE *)(v43 - 7) = *(_BYTE *)(*(_QWORD *)(v26 + 1768) + 458);
    }
    goto LABEL_14;
  }
  AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v26 + 1624), (_QWORD *)(v26 + 16));
  v56 = *(_DWORD *)(v26 + 7316);
  if (*(_DWORD *)(v26 + 7312) < v56)
    *(_DWORD *)(v26 + 7312) = v56;
  *(_DWORD *)(v26 + 7316) = 0;
  if (v41)
  {
LABEL_15:
    *(_QWORD *)(v26 + 1776) = v41;
    v44 = *(_QWORD *)(v41 + 16);
    *(_BYTE *)(v26 + 1745) = *(_BYTE *)(v44 + 216);
    *(_BYTE *)(v26 + 1746) = *(_BYTE *)(v44 + 1992);
  }
LABEL_16:
  v45 = (float *)self->_progressBins;
  if (v45)
  {
    v46 = *((unsigned __int16 *)v45 + 21);
    v45[v46 + 6] = v45[11] + v45[v46 + 6];
    v45[11] = 0.0;
    if (*((_BYTE *)v45 + 48))
    {
      v47 = (uint64_t *)*((_QWORD *)v45 + 9);
      if (v47)
      {
        v48 = *((_DWORD *)v45 + 35);
        do
        {
          *((_DWORD *)v47 + 8) = v48;
          *((_DWORD *)v47 + 9) = v46;
          v47 = (uint64_t *)*v47;
        }
        while (v47);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v45 + 12, (_QWORD *)v45 + 7);
      ++*((_DWORD *)v45 + 35);
    }
    else if (*((_QWORD *)v45 + 22))
    {
      v49 = *((unsigned int *)v45 + 35);
      *((_DWORD *)v45 + 35) = v49 + 1;
      v50 = (_QWORD *)*((_QWORD *)v45 + 21);
      if (v50)
      {
        v51 = *((_QWORD *)v45 + 18);
        v52 = (uint64_t **)*((_QWORD *)v45 + 21);
        do
        {
          *(_DWORD *)(v51 + 4 * *((unsigned int *)v52 + 4)) = v49;
          v52 = (uint64_t **)*v52;
        }
        while (v52);
        do
        {
          v53 = (_QWORD *)*v50;
          operator delete(v50);
          v50 = v53;
        }
        while (v53);
      }
      *((_QWORD *)v45 + 21) = 0;
      v54 = *((_QWORD *)v45 + 20);
      if (v54)
      {
        for (i = 0; i != v54; ++i)
          *(_QWORD *)(*((_QWORD *)v45 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v45 + 22) = 0;
      if ((v49 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v49);
    }
  }
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  float v16;
  unint64_t v17;
  float v18;
  float v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *impl;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t Pipeline;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t **v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t i;
  unsigned int v52;
  _QWORD v53[5];
  _QWORD v54[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v13 = *((unsigned __int16 *)progressBins + 20);
    if (v13 < 2)
    {
      v15 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v16 = progressBins[6];
      v17 = v13 - 1;
      do
      {
        v18 = progressBins[v14++ + 7];
        if (v18 < v16)
        {
          v15 = v14;
          v16 = v18;
        }
      }
      while (v17 != v14);
    }
    v19 = *progressBins + (float)(progressBins[1] * 8.0);
    *((_WORD *)progressBins + 21) = v15;
    progressBins[11] = v19;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v15);
    v20 = self->_progressBins;
    v21 = objc_msgSend(a3, "length");
    v22 = MEMORY[0x24BDAC760];
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __122__AGXA10FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke;
    v54[3] = &unk_250402128;
    v54[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v20, (unint64_t)a3, a4, v21 - a4, 0, (uint64_t)v54);
    v23 = self->_progressBins;
    v53[0] = v22;
    v53[1] = 3221225472;
    v53[2] = __122__AGXA10FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke_2;
    v53[3] = &unk_250402128;
    v53[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, (unint64_t)a5, a6, 4, 1, (uint64_t)v53);
  }
  impl = self->_impl;
  v25 = *(_QWORD *)(*((_QWORD *)impl + 1) + 88);
  objc_msgSend(a3, "contents");
  v26 = objc_msgSend(a3, "gpuAddress");
  objc_msgSend(a3, "length");
  v27 = (int *)MEMORY[0x24BE51650];
  v28 = (char *)a3 + (int)*MEMORY[0x24BE51650];
  v29 = v26 + a4;
  objc_msgSend(*((id *)impl + 1), "useResource:usage:", a3, 1);
  objc_msgSend(a5, "contents");
  v30 = objc_msgSend(a5, "gpuAddress");
  objc_msgSend(a5, "length");
  v31 = (char *)a5 + *v27;
  v32 = v30 + a6;
  objc_msgSend(*((id *)impl + 1), "useResource:usage:", a5, 1);
  v33 = *((_QWORD *)impl + 1);
  v34 = *(_QWORD *)(v33 + 88);
  *(_QWORD *)(v34 + 6056) = v29;
  *(_QWORD *)(*(_QWORD *)(v34 + 1792) + 536) = v29;
  *(_QWORD *)(v34 + 5280) = v28;
  *(_QWORD *)(v34 + 7136) |= 1uLL;
  *(_DWORD *)(v34 + 7152) |= 1u;
  v35 = *(_QWORD *)(v33 + 88);
  *(_QWORD *)(v35 + 6064) = v32;
  *(_QWORD *)(*(_QWORD *)(v35 + 1792) + 544) = v32;
  *(_QWORD *)(v35 + 5288) = v31;
  *(_QWORD *)(v35 + 7136) |= 2uLL;
  *(_DWORD *)(v35 + 7152) |= 1u;
  Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 116, 0);
  v37 = *(_QWORD *)(v25 + 1776);
  *(_QWORD *)(v25 + 1776) = Pipeline;
  v38 = *(_QWORD *)(Pipeline + 16);
  *(_BYTE *)(v25 + 1745) = *(_BYTE *)(v38 + 216);
  *(_BYTE *)(v25 + 1746) = *(_BYTE *)(v38 + 1992);
  if (*(_DWORD *)(v25 + 1736) != 1)
  {
LABEL_14:
    if (!v37)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (*(_BYTE *)(v25 + 7672))
  {
    v39 = *(_QWORD *)(v25 + 7688);
    if (*(_QWORD *)(v25 + 7680) != v39)
    {
      *(_BYTE *)(v39 - 8) = 1;
      *(_BYTE *)(v39 - 7) = *(_BYTE *)(*(_QWORD *)(v25 + 1768) + 458);
    }
    goto LABEL_14;
  }
  AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v25 + 1624), (_QWORD *)(v25 + 16));
  v52 = *(_DWORD *)(v25 + 7316);
  if (*(_DWORD *)(v25 + 7312) < v52)
    *(_DWORD *)(v25 + 7312) = v52;
  *(_DWORD *)(v25 + 7316) = 0;
  if (v37)
  {
LABEL_15:
    *(_QWORD *)(v25 + 1776) = v37;
    v40 = *(_QWORD *)(v37 + 16);
    *(_BYTE *)(v25 + 1745) = *(_BYTE *)(v40 + 216);
    *(_BYTE *)(v25 + 1746) = *(_BYTE *)(v40 + 1992);
  }
LABEL_16:
  v41 = (float *)self->_progressBins;
  if (v41)
  {
    v42 = *((unsigned __int16 *)v41 + 21);
    v41[v42 + 6] = v41[11] + v41[v42 + 6];
    v41[11] = 0.0;
    if (*((_BYTE *)v41 + 48))
    {
      v43 = (uint64_t *)*((_QWORD *)v41 + 9);
      if (v43)
      {
        v44 = *((_DWORD *)v41 + 35);
        do
        {
          *((_DWORD *)v43 + 8) = v44;
          *((_DWORD *)v43 + 9) = v42;
          v43 = (uint64_t *)*v43;
        }
        while (v43);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v41 + 12, (_QWORD *)v41 + 7);
      ++*((_DWORD *)v41 + 35);
    }
    else if (*((_QWORD *)v41 + 22))
    {
      v45 = *((unsigned int *)v41 + 35);
      *((_DWORD *)v41 + 35) = v45 + 1;
      v46 = (_QWORD *)*((_QWORD *)v41 + 21);
      if (v46)
      {
        v47 = *((_QWORD *)v41 + 18);
        v48 = (uint64_t **)*((_QWORD *)v41 + 21);
        do
        {
          *(_DWORD *)(v47 + 4 * *((unsigned int *)v48 + 4)) = v45;
          v48 = (uint64_t **)*v48;
        }
        while (v48);
        do
        {
          v49 = (_QWORD *)*v46;
          operator delete(v46);
          v46 = v49;
        }
        while (v49);
      }
      *((_QWORD *)v41 + 21) = 0;
      v50 = *((_QWORD *)v41 + 20);
      if (v50)
      {
        for (i = 0; i != v50; ++i)
          *(_QWORD *)(*((_QWORD *)v41 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v41 + 22) = 0;
      if ((v45 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v45);
    }
  }
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id *impl;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  float *v37;
  uint64_t v38;
  uint64_t *v39;
  int v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t **v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t i;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[4];
  uint64_t v51[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v11 = objc_msgSend(a3, "size");
    v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = progressBins[6];
      v16 = v12 - 1;
      do
      {
        v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          v14 = v13;
          v15 = v17;
        }
      }
      while (v16 != v13);
    }
    v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v14);
    v19 = self->_progressBins;
    v20 = objc_msgSend(a3, "buffer");
    v21 = objc_msgSend(a3, "bufferOffset");
    v22 = objc_msgSend(a3, "size");
    v23 = MEMORY[0x24BDAC760];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __108__AGXA10FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke;
    v49[3] = &unk_250402128;
    v49[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 0, (uint64_t)v49);
    v24 = self->_progressBins;
    v48[0] = v23;
    v48[1] = 3221225472;
    v48[2] = __108__AGXA10FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke_2;
    v48[3] = &unk_250402128;
    v48[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v24, (unint64_t)a4, a5, objc_msgSend(a3, "size"), 1, (uint64_t)v48);
  }
  impl = (id *)self->_impl;
  objc_msgSend(impl[1], "useResource:usage:", a3, 1);
  v26 = (void *)objc_msgSend(a3, "buffer");
  v27 = objc_msgSend(a3, "bufferOffset");
  v28 = objc_msgSend(v26, "contents");
  v29 = objc_msgSend(v26, "gpuAddress");
  v30 = objc_msgSend(v26, "length");
  v31 = (int *)MEMORY[0x24BE51650];
  v32 = (uint64_t)v26 + (int)*MEMORY[0x24BE51650];
  v51[0] = v29 + v27;
  v51[1] = v27 + v28;
  v51[2] = v30;
  v51[3] = v32;
  objc_msgSend(impl[1], "useResource:usage:", v26, 1);
  v33 = objc_msgSend(a4, "contents");
  v34 = objc_msgSend(a4, "gpuAddress");
  v35 = objc_msgSend(a4, "length");
  v36 = (char *)a4 + *v31;
  v50[0] = v34 + a5;
  v50[1] = v33 + a5;
  v50[2] = v35;
  v50[3] = v36;
  objc_msgSend(impl[1], "useResource:usage:", a4, 1);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeSerialize_impl(impl, v51, 0, v50);
  v37 = (float *)self->_progressBins;
  if (v37)
  {
    v38 = *((unsigned __int16 *)v37 + 21);
    v37[v38 + 6] = v37[11] + v37[v38 + 6];
    v37[11] = 0.0;
    if (*((_BYTE *)v37 + 48))
    {
      v39 = (uint64_t *)*((_QWORD *)v37 + 9);
      if (v39)
      {
        v40 = *((_DWORD *)v37 + 35);
        do
        {
          *((_DWORD *)v39 + 8) = v40;
          *((_DWORD *)v39 + 9) = v38;
          v39 = (uint64_t *)*v39;
        }
        while (v39);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v37 + 12, (_QWORD *)v37 + 7);
      ++*((_DWORD *)v37 + 35);
    }
    else if (*((_QWORD *)v37 + 22))
    {
      v41 = *((unsigned int *)v37 + 35);
      *((_DWORD *)v37 + 35) = v41 + 1;
      v42 = (_QWORD *)*((_QWORD *)v37 + 21);
      if (v42)
      {
        v43 = *((_QWORD *)v37 + 18);
        v44 = (uint64_t **)*((_QWORD *)v37 + 21);
        do
        {
          *(_DWORD *)(v43 + 4 * *((unsigned int *)v44 + 4)) = v41;
          v44 = (uint64_t **)*v44;
        }
        while (v44);
        do
        {
          v45 = (_QWORD *)*v42;
          operator delete(v42);
          v42 = v45;
        }
        while (v45);
      }
      *((_QWORD *)v37 + 21) = 0;
      v46 = *((_QWORD *)v37 + 20);
      if (v46)
      {
        for (i = 0; i != v46; ++i)
          *(_QWORD *)(*((_QWORD *)v37 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v37 + 22) = 0;
      if ((v41 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v41);
    }
  }
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v13;
  float v14;
  float v15;
  unint64_t v16;
  uint64_t v17;
  unsigned __int16 v18;
  float v19;
  unint64_t v20;
  float v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id *impl;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  float *v40;
  uint64_t v41;
  uint64_t *v42;
  int v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t **v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t i;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[4];
  uint64_t v54[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v13 = objc_msgSend(a3, "size");
    v14 = *progressBins;
    v15 = progressBins[1];
    v16 = *((unsigned __int16 *)progressBins + 20);
    if (v16 < 2)
    {
      v18 = 0;
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v19 = progressBins[6];
      v20 = v16 - 1;
      do
      {
        v21 = progressBins[v17++ + 7];
        if (v21 < v19)
        {
          v18 = v17;
          v19 = v21;
        }
      }
      while (v20 != v17);
    }
    *((_WORD *)progressBins + 21) = v18;
    progressBins[11] = v14 + (float)(v15 * (float)v13);
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v18);
    v22 = self->_progressBins;
    v23 = objc_msgSend(a3, "buffer");
    v24 = objc_msgSend(a3, "bufferOffset");
    v25 = objc_msgSend(a3, "size");
    v26 = MEMORY[0x24BDAC760];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __139__AGXA10FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke;
    v52[3] = &unk_250402128;
    v52[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v22, v23, v24, v25, 0, (uint64_t)v52);
    -[AGXA10FamilyRayTracingGPUBuilder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", a4, 0);
    v27 = self->_progressBins;
    v51[0] = v26;
    v51[1] = 3221225472;
    v51[2] = __139__AGXA10FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke_2;
    v51[3] = &unk_250402128;
    v51[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v27, (unint64_t)a5, a6, objc_msgSend(a3, "size"), 1, (uint64_t)v51);
  }
  impl = (id *)self->_impl;
  objc_msgSend(impl[1], "useResource:usage:", a3, 1);
  v29 = (void *)objc_msgSend(a3, "buffer");
  v30 = objc_msgSend(a3, "bufferOffset");
  v31 = objc_msgSend(v29, "contents");
  v32 = objc_msgSend(v29, "gpuAddress");
  v33 = objc_msgSend(v29, "length");
  v34 = (int *)MEMORY[0x24BE51650];
  v35 = (uint64_t)v29 + (int)*MEMORY[0x24BE51650];
  v54[0] = v32 + v30;
  v54[1] = v30 + v31;
  v54[2] = v33;
  v54[3] = v35;
  objc_msgSend(impl[1], "useResource:usage:", v29, 1);
  v36 = objc_msgSend(a5, "contents");
  v37 = objc_msgSend(a5, "gpuAddress");
  v38 = objc_msgSend(a5, "length");
  v39 = (char *)a5 + *v34;
  v53[0] = v37 + a6;
  v53[1] = v36 + a6;
  v53[2] = v38;
  v53[3] = v39;
  objc_msgSend(impl[1], "useResource:usage:", a5, 1);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeSerialize_impl(impl, v54, a4, v53);
  v40 = (float *)self->_progressBins;
  if (v40)
  {
    v41 = *((unsigned __int16 *)v40 + 21);
    v40[v41 + 6] = v40[11] + v40[v41 + 6];
    v40[11] = 0.0;
    if (*((_BYTE *)v40 + 48))
    {
      v42 = (uint64_t *)*((_QWORD *)v40 + 9);
      if (v42)
      {
        v43 = *((_DWORD *)v40 + 35);
        do
        {
          *((_DWORD *)v42 + 8) = v43;
          *((_DWORD *)v42 + 9) = v41;
          v42 = (uint64_t *)*v42;
        }
        while (v42);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v40 + 12, (_QWORD *)v40 + 7);
      ++*((_DWORD *)v40 + 35);
    }
    else if (*((_QWORD *)v40 + 22))
    {
      v44 = *((unsigned int *)v40 + 35);
      *((_DWORD *)v40 + 35) = v44 + 1;
      v45 = (_QWORD *)*((_QWORD *)v40 + 21);
      if (v45)
      {
        v46 = *((_QWORD *)v40 + 18);
        v47 = (uint64_t **)*((_QWORD *)v40 + 21);
        do
        {
          *(_DWORD *)(v46 + 4 * *((unsigned int *)v47 + 4)) = v44;
          v47 = (uint64_t **)*v47;
        }
        while (v47);
        do
        {
          v48 = (_QWORD *)*v45;
          operator delete(v45);
          v45 = v48;
        }
        while (v48);
      }
      *((_QWORD *)v40 + 21) = 0;
      v49 = *((_QWORD *)v40 + 20);
      if (v49)
      {
        for (i = 0; i != v49; ++i)
          *(_QWORD *)(*((_QWORD *)v40 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v40 + 22) = 0;
      if ((v44 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v44);
    }
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  float *v26;
  uint64_t v27;
  uint64_t *v28;
  int v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t **v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t i;
  _QWORD v37[5];
  _QWORD v38[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v11 = objc_msgSend(a3, "size");
    v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = progressBins[6];
      v16 = v12 - 1;
      do
      {
        v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          v14 = v13;
          v15 = v17;
        }
      }
      while (v16 != v13);
    }
    v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v14);
    v19 = self->_progressBins;
    v20 = objc_msgSend(a3, "buffer");
    v21 = objc_msgSend(a3, "bufferOffset");
    v22 = objc_msgSend(a3, "size");
    v23 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __112__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke;
    v38[3] = &unk_250402128;
    v38[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v19, v20, v21, v22, 1, (uint64_t)v38);
    v24 = self->_progressBins;
    v37[0] = v23;
    v37[1] = 3221225472;
    v37[2] = __112__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke_2;
    v37[3] = &unk_250402128;
    v37[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v24, (unint64_t)a4, a5, objc_msgSend(a3, "size"), 0, (uint64_t)v37);
  }
  v25 = (void *)objc_opt_new();
  -[AGXA10FamilyRayTracingGPUBuilder deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:](self, "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:", a3, a4, a5, v25);

  v26 = (float *)self->_progressBins;
  if (v26)
  {
    v27 = *((unsigned __int16 *)v26 + 21);
    v26[v27 + 6] = v26[11] + v26[v27 + 6];
    v26[11] = 0.0;
    if (*((_BYTE *)v26 + 48))
    {
      v28 = (uint64_t *)*((_QWORD *)v26 + 9);
      if (v28)
      {
        v29 = *((_DWORD *)v26 + 35);
        do
        {
          *((_DWORD *)v28 + 8) = v29;
          *((_DWORD *)v28 + 9) = v27;
          v28 = (uint64_t *)*v28;
        }
        while (v28);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v26 + 12, (_QWORD *)v26 + 7);
      ++*((_DWORD *)v26 + 35);
    }
    else if (*((_QWORD *)v26 + 22))
    {
      v30 = *((unsigned int *)v26 + 35);
      *((_DWORD *)v26 + 35) = v30 + 1;
      v31 = (_QWORD *)*((_QWORD *)v26 + 21);
      if (v31)
      {
        v32 = *((_QWORD *)v26 + 18);
        v33 = (uint64_t **)*((_QWORD *)v26 + 21);
        do
        {
          *(_DWORD *)(v32 + 4 * *((unsigned int *)v33 + 4)) = v30;
          v33 = (uint64_t **)*v33;
        }
        while (v33);
        do
        {
          v34 = (_QWORD *)*v31;
          operator delete(v31);
          v31 = v34;
        }
        while (v34);
      }
      *((_QWORD *)v26 + 21) = 0;
      v35 = *((_QWORD *)v26 + 20);
      if (v35)
      {
        for (i = 0; i != v35; ++i)
          *(_QWORD *)(*((_QWORD *)v26 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v26 + 22) = 0;
      if ((v30 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v30);
    }
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v13;
  float v14;
  float v15;
  unint64_t v16;
  uint64_t v17;
  unsigned __int16 v18;
  float v19;
  unint64_t v20;
  float v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id *impl;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  float *v42;
  uint64_t v43;
  uint64_t *v44;
  int v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t **v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t i;
  unint64_t v53;
  uint64_t v54;
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[4];
  uint64_t v58[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v13 = objc_msgSend(a3, "size");
    v14 = *progressBins;
    v15 = progressBins[1];
    v16 = *((unsigned __int16 *)progressBins + 20);
    if (v16 < 2)
    {
      v18 = 0;
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v19 = progressBins[6];
      v20 = v16 - 1;
      do
      {
        v21 = progressBins[v17++ + 7];
        if (v21 < v19)
        {
          v18 = v17;
          v19 = v21;
        }
      }
      while (v20 != v17);
    }
    *((_WORD *)progressBins + 21) = v18;
    progressBins[11] = v14 + (float)(v15 * (float)v13);
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v18, a6);
    v22 = self->_progressBins;
    v23 = objc_msgSend(a3, "buffer");
    v24 = objc_msgSend(a3, "bufferOffset");
    v25 = objc_msgSend(a3, "size");
    v26 = MEMORY[0x24BDAC760];
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __143__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke;
    v56[3] = &unk_250402128;
    v56[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v22, v23, v24, v25, 1, (uint64_t)v56);
    -[AGXA10FamilyRayTracingGPUBuilder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", a4, 0);
    v27 = self->_progressBins;
    v55[0] = v26;
    v55[1] = 3221225472;
    v55[2] = __143__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke_2;
    v55[3] = &unk_250402128;
    v55[4] = self;
    a6 = v53;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v27, (unint64_t)a5, v53, objc_msgSend(a3, "size"), 0, (uint64_t)v55);
  }
  impl = (id *)self->_impl;
  v54 = objc_msgSend(a3, "accelerationStructureUniqueIdentifier");
  objc_msgSend(impl[1], "useResource:usage:", a3, 2);
  v29 = a6;
  v30 = (void *)objc_msgSend(a3, "buffer");
  v31 = objc_msgSend(a3, "bufferOffset");
  v32 = objc_msgSend(v30, "contents");
  v33 = objc_msgSend(v30, "gpuAddress");
  v34 = objc_msgSend(v30, "length");
  v35 = a4;
  v36 = (int *)MEMORY[0x24BE51650];
  v37 = (uint64_t)v30 + (int)*MEMORY[0x24BE51650];
  v58[0] = v33 + v31;
  v58[1] = v31 + v32;
  v58[2] = v34;
  v58[3] = v37;
  objc_msgSend(impl[1], "useResource:usage:", v30, 2);
  v38 = objc_msgSend(a5, "contents");
  v39 = objc_msgSend(a5, "gpuAddress");
  v40 = objc_msgSend(a5, "length");
  v41 = (char *)a5 + *v36;
  v57[0] = v39 + v29;
  v57[1] = v38 + v29;
  v57[2] = v40;
  v57[3] = v41;
  objc_msgSend(impl[1], "useResource:usage:", a5, 1);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeDeserialize_impl((uint64_t)impl, v58, v35, v57, v54);
  v42 = (float *)self->_progressBins;
  if (v42)
  {
    v43 = *((unsigned __int16 *)v42 + 21);
    v42[v43 + 6] = v42[11] + v42[v43 + 6];
    v42[11] = 0.0;
    if (*((_BYTE *)v42 + 48))
    {
      v44 = (uint64_t *)*((_QWORD *)v42 + 9);
      if (v44)
      {
        v45 = *((_DWORD *)v42 + 35);
        do
        {
          *((_DWORD *)v44 + 8) = v45;
          *((_DWORD *)v44 + 9) = v43;
          v44 = (uint64_t *)*v44;
        }
        while (v44);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v42 + 12, (_QWORD *)v42 + 7);
      ++*((_DWORD *)v42 + 35);
    }
    else if (*((_QWORD *)v42 + 22))
    {
      v46 = *((unsigned int *)v42 + 35);
      *((_DWORD *)v42 + 35) = v46 + 1;
      v47 = (_QWORD *)*((_QWORD *)v42 + 21);
      if (v47)
      {
        v48 = *((_QWORD *)v42 + 18);
        v49 = (uint64_t **)*((_QWORD *)v42 + 21);
        do
        {
          *(_DWORD *)(v48 + 4 * *((unsigned int *)v49 + 4)) = v46;
          v49 = (uint64_t **)*v49;
        }
        while (v49);
        do
        {
          v50 = (_QWORD *)*v47;
          operator delete(v47);
          v47 = v50;
        }
        while (v50);
      }
      *((_QWORD *)v42 + 21) = 0;
      v51 = *((_QWORD *)v42 + 20);
      if (v51)
      {
        for (i = 0; i != v51; ++i)
          *(_QWORD *)(*((_QWORD *)v42 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v42 + 22) = 0;
      if ((v46 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v46);
    }
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  float v16;
  unint64_t v17;
  float v18;
  float v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id *impl;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  float *v38;
  uint64_t v39;
  uint64_t *v40;
  int v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t **v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[4];
  uint64_t v53[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream", a3, a4, a5, a6);
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v12 = objc_msgSend(a3, "size");
    v13 = *((unsigned __int16 *)progressBins + 20);
    if (v13 < 2)
    {
      v15 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v16 = progressBins[6];
      v17 = v13 - 1;
      do
      {
        v18 = progressBins[v14++ + 7];
        if (v18 < v16)
        {
          v15 = v14;
          v16 = v18;
        }
      }
      while (v17 != v14);
    }
    v19 = *progressBins + (float)(progressBins[1] * (float)v12);
    *((_WORD *)progressBins + 21) = v15;
    progressBins[11] = v19;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v15);
    v20 = self->_progressBins;
    v21 = objc_msgSend(a3, "buffer");
    v22 = objc_msgSend(a3, "bufferOffset");
    v23 = objc_msgSend(a3, "size");
    v24 = MEMORY[0x24BDAC760];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __127__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v51[3] = &unk_250402128;
    v51[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v20, v21, v22, v23, 1, (uint64_t)v51);
    v25 = self->_progressBins;
    v50[0] = v24;
    v50[1] = 3221225472;
    v50[2] = __127__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v50[3] = &unk_250402128;
    v50[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v25, (unint64_t)a4, a5, objc_msgSend(a3, "size"), 0, (uint64_t)v50);
  }
  impl = (id *)self->_impl;
  v49 = objc_msgSend(a3, "accelerationStructureUniqueIdentifier");
  objc_msgSend(impl[1], "useResource:usage:", a3, 2);
  v27 = (void *)objc_msgSend(a3, "buffer");
  v28 = objc_msgSend(a3, "bufferOffset");
  v29 = objc_msgSend(v27, "contents");
  v30 = objc_msgSend(v27, "gpuAddress");
  v31 = objc_msgSend(v27, "length");
  v32 = (int *)MEMORY[0x24BE51650];
  v33 = (uint64_t)v27 + (int)*MEMORY[0x24BE51650];
  v53[0] = v30 + v28;
  v53[1] = v28 + v29;
  v53[2] = v31;
  v53[3] = v33;
  objc_msgSend(impl[1], "useResource:usage:", v27, 2);
  v34 = objc_msgSend(a4, "contents");
  v35 = objc_msgSend(a4, "gpuAddress");
  v36 = objc_msgSend(a4, "length");
  v37 = (char *)a4 + *v32;
  v52[0] = v35 + a5;
  v52[1] = v34 + a5;
  v52[2] = v36;
  v52[3] = v37;
  objc_msgSend(impl[1], "useResource:usage:", a4, 1);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeDeserialize_impl((uint64_t)impl, v53, 0, v52, v49);
  v38 = (float *)self->_progressBins;
  if (v38)
  {
    v39 = *((unsigned __int16 *)v38 + 21);
    v38[v39 + 6] = v38[11] + v38[v39 + 6];
    v38[11] = 0.0;
    if (*((_BYTE *)v38 + 48))
    {
      v40 = (uint64_t *)*((_QWORD *)v38 + 9);
      if (v40)
      {
        v41 = *((_DWORD *)v38 + 35);
        do
        {
          *((_DWORD *)v40 + 8) = v41;
          *((_DWORD *)v40 + 9) = v39;
          v40 = (uint64_t *)*v40;
        }
        while (v40);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v38 + 12, (_QWORD *)v38 + 7);
      ++*((_DWORD *)v38 + 35);
    }
    else if (*((_QWORD *)v38 + 22))
    {
      v42 = *((unsigned int *)v38 + 35);
      *((_DWORD *)v38 + 35) = v42 + 1;
      v43 = (_QWORD *)*((_QWORD *)v38 + 21);
      if (v43)
      {
        v44 = *((_QWORD *)v38 + 18);
        v45 = (uint64_t **)*((_QWORD *)v38 + 21);
        do
        {
          *(_DWORD *)(v44 + 4 * *((unsigned int *)v45 + 4)) = v42;
          v45 = (uint64_t **)*v45;
        }
        while (v45);
        do
        {
          v46 = (_QWORD *)*v43;
          operator delete(v43);
          v43 = v46;
        }
        while (v46);
      }
      *((_QWORD *)v38 + 21) = 0;
      v47 = *((_QWORD *)v38 + 20);
      if (v47)
      {
        for (i = 0; i != v47; ++i)
          *(_QWORD *)(*((_QWORD *)v38 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v38 + 22) = 0;
      if ((v42 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v42);
    }
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  unint64_t v7;
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v14;
  float v15;
  float v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int16 v19;
  float v20;
  unint64_t v21;
  float v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id *impl;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  float *v43;
  uint64_t v44;
  uint64_t *v45;
  int v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t **v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t i;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[4];
  uint64_t v59[5];

  v7 = a6;
  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream", a3, a4, a5, a6, a7);
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v14 = objc_msgSend(a3, "size");
    v15 = *progressBins;
    v16 = progressBins[1];
    v17 = *((unsigned __int16 *)progressBins + 20);
    if (v17 < 2)
    {
      v19 = 0;
    }
    else
    {
      v18 = 0;
      v19 = 0;
      v20 = progressBins[6];
      v21 = v17 - 1;
      do
      {
        v22 = progressBins[v18++ + 7];
        if (v22 < v20)
        {
          v19 = v18;
          v20 = v22;
        }
      }
      while (v21 != v18);
    }
    *((_WORD *)progressBins + 21) = v19;
    progressBins[11] = v15 + (float)(v16 * (float)v14);
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v19, v7);
    v23 = self->_progressBins;
    v24 = objc_msgSend(a3, "buffer");
    v25 = objc_msgSend(a3, "bufferOffset");
    v26 = objc_msgSend(a3, "size");
    v27 = MEMORY[0x24BDAC760];
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __158__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v57[3] = &unk_250402128;
    v57[4] = self;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v23, v24, v25, v26, 1, (uint64_t)v57);
    -[AGXA10FamilyRayTracingGPUBuilder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", a4, 0);
    v28 = self->_progressBins;
    v56[0] = v27;
    v56[1] = 3221225472;
    v56[2] = __158__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v56[3] = &unk_250402128;
    v56[4] = self;
    v7 = v54;
    ProgressBinsSynchronizeBufferAccessRange((uint64_t)v28, (unint64_t)a5, v54, objc_msgSend(a3, "size"), 0, (uint64_t)v56);
  }
  impl = (id *)self->_impl;
  v55 = objc_msgSend(a3, "accelerationStructureUniqueIdentifier");
  objc_msgSend(impl[1], "useResource:usage:", a3, 2);
  v30 = v7;
  v31 = (void *)objc_msgSend(a3, "buffer");
  v32 = objc_msgSend(a3, "bufferOffset");
  v33 = objc_msgSend(v31, "contents");
  v34 = objc_msgSend(v31, "gpuAddress");
  v35 = objc_msgSend(v31, "length");
  v36 = a4;
  v37 = (int *)MEMORY[0x24BE51650];
  v38 = (uint64_t)v31 + (int)*MEMORY[0x24BE51650];
  v59[0] = v34 + v32;
  v59[1] = v32 + v33;
  v59[2] = v35;
  v59[3] = v38;
  objc_msgSend(impl[1], "useResource:usage:", v31, 2);
  v39 = objc_msgSend(a5, "contents");
  v40 = objc_msgSend(a5, "gpuAddress");
  v41 = objc_msgSend(a5, "length");
  v42 = (char *)a5 + *v37;
  v58[0] = v40 + v30;
  v58[1] = v39 + v30;
  v58[2] = v41;
  v58[3] = v42;
  objc_msgSend(impl[1], "useResource:usage:", a5, 1);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeDeserialize_impl((uint64_t)impl, v59, v36, v58, v55);
  v43 = (float *)self->_progressBins;
  if (v43)
  {
    v44 = *((unsigned __int16 *)v43 + 21);
    v43[v44 + 6] = v43[11] + v43[v44 + 6];
    v43[11] = 0.0;
    if (*((_BYTE *)v43 + 48))
    {
      v45 = (uint64_t *)*((_QWORD *)v43 + 9);
      if (v45)
      {
        v46 = *((_DWORD *)v43 + 35);
        do
        {
          *((_DWORD *)v45 + 8) = v46;
          *((_DWORD *)v45 + 9) = v44;
          v45 = (uint64_t *)*v45;
        }
        while (v45);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v43 + 12, (_QWORD *)v43 + 7);
      ++*((_DWORD *)v43 + 35);
    }
    else if (*((_QWORD *)v43 + 22))
    {
      v47 = *((unsigned int *)v43 + 35);
      *((_DWORD *)v43 + 35) = v47 + 1;
      v48 = (_QWORD *)*((_QWORD *)v43 + 21);
      if (v48)
      {
        v49 = *((_QWORD *)v43 + 18);
        v50 = (uint64_t **)*((_QWORD *)v43 + 21);
        do
        {
          *(_DWORD *)(v49 + 4 * *((unsigned int *)v50 + 4)) = v47;
          v50 = (uint64_t **)*v50;
        }
        while (v50);
        do
        {
          v51 = (_QWORD *)*v48;
          operator delete(v48);
          v48 = v51;
        }
        while (v51);
      }
      *((_QWORD *)v43 + 21) = 0;
      v52 = *((_QWORD *)v43 + 20);
      if (v52)
      {
        for (i = 0; i != v52; ++i)
          *(_QWORD *)(*((_QWORD *)v43 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v43 + 22) = 0;
      if ((v47 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v47);
    }
  }
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingGPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingGPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  BOOL result;
  unint64_t v8;
  float *progressBins;
  uint64_t v10;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  void *v19;
  void *v20;
  id *impl;
  unsigned __int8 v22;
  uint64_t v23;
  unint64_t Pipeline;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  MTLCommandBuffer *commandBuffer;
  float *v47;
  uint64_t v48;
  uint64_t *v49;
  int v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t **v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t i;
  _QWORD v58[6];
  _QWORD v59[5];
  _QWORD v60[5];

  result = 0;
  if (!a3 || !a4)
    return result;
  if ((unint64_t)(objc_msgSend(a4, "version") - 256) > 5)
    return 0;
  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  v8 = -[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 64, 0);
  progressBins = (float *)self->_progressBins;
  v10 = MEMORY[0x24BDAC760];
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = progressBins[6];
      v16 = v12 - 1;
      do
      {
        v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          v14 = v13;
          v15 = v17;
        }
      }
      while (v16 != v13);
    }
    v18 = *progressBins + (float)(progressBins[1] * 64.0);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v14);
    v19 = self->_progressBins;
    v60[0] = v10;
    v60[1] = 3221225472;
    v60[2] = __94__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke;
    v60[3] = &unk_250402128;
    v60[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v19, objc_msgSend(a3, "buffer"), 0, (uint64_t)v60);
    v20 = self->_progressBins;
    v59[0] = v10;
    v59[1] = 3221225472;
    v59[2] = __94__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_2;
    v59[3] = &unk_250402128;
    v59[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v20, v8, 1, (uint64_t)v59);
  }
  impl = (id *)self->_impl;
  v22 = objc_msgSend(a4, "version");
  objc_msgSend(impl[1], "useResource:usage:", a3, 1);
  v23 = *((_QWORD *)impl[1] + 11);
  Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, dword_232D76854[v22], 0);
  v25 = objc_msgSend(a3, "buffer");
  v26 = objc_msgSend(a3, "bufferOffset");
  v27 = (int *)MEMORY[0x24BE51650];
  if (v25)
  {
    v28 = v25 + (int)*MEMORY[0x24BE51650];
    v29 = *(_QWORD *)(v28 + 8);
    v30 = *(_QWORD *)(v28 + 24);
    LODWORD(v28) = *(_DWORD *)(v28 + 16);
    *(_QWORD *)(v23 + 6056) = v29;
    *(_QWORD *)(v23 + 6576) = v30;
    v31 = *(_QWORD **)(v23 + 1792);
    v31[67] = v29 + v26;
    *v31 = v30 + v26;
    *(_DWORD *)(v23 + 4352) = v28;
    *(_DWORD *)(v23 + 4612) = v28;
    *(_DWORD *)(v23 + 4872) = v29 >> 8;
    *(_QWORD *)(v23 + 5280) = v25 + *v27;
    *(_QWORD *)(v23 + 7136) |= 1uLL;
    *(_DWORD *)(v23 + 7152) |= 1u;
    if (*(_QWORD *)(v23 + 1480))
      MTLResourceListAddResource();
    *(_DWORD *)(v23 + 4212) = 0;
    if (v8)
      goto LABEL_18;
  }
  else
  {
    v37 = *(_QWORD *)(v23 + 1752);
    *(_QWORD *)(v23 + 6056) = v37;
    *(_QWORD *)(v23 + 6576) = 0;
    v38 = *(_QWORD **)(v23 + 1792);
    v38[67] = v37;
    *v38 = 0;
    *(_DWORD *)(v23 + 4352) = 0;
    *(_DWORD *)(v23 + 4612) = 0;
    *(_DWORD *)(v23 + 4872) = *(_QWORD *)(v23 + 1752) >> 8;
    *(_QWORD *)(v23 + 5280) = 0;
    *(_DWORD *)(v23 + 4212) = 0;
    if (v8)
    {
LABEL_18:
      v32 = v8 + *v27;
      v33 = *(_QWORD *)(v32 + 8);
      v34 = *(_QWORD *)(v32 + 24);
      v35 = *(_DWORD *)(v32 + 16);
      *(_QWORD *)(v23 + 6064) = v33;
      *(_QWORD *)(v23 + 6584) = v34;
      v36 = *(_QWORD *)(v23 + 1792);
      *(_QWORD *)(v36 + 544) = v33;
      *(_QWORD *)(v36 + 8) = v34;
      *(_DWORD *)(v23 + 4356) = v35;
      *(_DWORD *)(v23 + 4616) = v35;
      *(_DWORD *)(v23 + 4876) = v33 >> 8;
      *(_QWORD *)(v23 + 5288) = v32;
      *(_QWORD *)(v23 + 7136) |= 2uLL;
      *(_DWORD *)(v23 + 7152) |= 1u;
      if (*(_QWORD *)(v23 + 1480))
        MTLResourceListAddResource();
      goto LABEL_22;
    }
  }
  v39 = *(_QWORD *)(v23 + 1752);
  *(_QWORD *)(v23 + 6064) = v39;
  *(_QWORD *)(v23 + 6584) = 0;
  v40 = *(_QWORD *)(v23 + 1792);
  *(_QWORD *)(v40 + 544) = v39;
  *(_QWORD *)(v40 + 8) = 0;
  *(_DWORD *)(v23 + 4356) = 0;
  *(_DWORD *)(v23 + 4616) = 0;
  *(_DWORD *)(v23 + 4876) = *(_QWORD *)(v23 + 1752) >> 8;
  *(_QWORD *)(v23 + 5288) = 0;
LABEL_22:
  v41 = *(_QWORD *)(v23 + 1776);
  *(_DWORD *)(v23 + 4216) = 0;
  *(_QWORD *)(v23 + 1776) = Pipeline;
  v42 = *(_QWORD *)(Pipeline + 16);
  *(_BYTE *)(v23 + 1745) = *(_BYTE *)(v42 + 216);
  *(_BYTE *)(v23 + 1746) = *(_BYTE *)(v42 + 1992);
  if (*(_DWORD *)(v23 + 1736) == 1)
  {
    if (*(_BYTE *)(v23 + 7672))
    {
      v43 = *(_QWORD *)(v23 + 7688);
      if (*(_QWORD *)(v23 + 7680) != v43)
      {
        *(_BYTE *)(v43 - 8) = 1;
        *(_BYTE *)(v43 - 7) = *(_BYTE *)(*(_QWORD *)(v23 + 1768) + 458);
      }
    }
    else
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v23 + 1624), (_QWORD *)(v23 + 16));
      v44 = *(_DWORD *)(v23 + 7316);
      if (*(_DWORD *)(v23 + 7312) < v44)
        *(_DWORD *)(v23 + 7312) = v44;
      *(_DWORD *)(v23 + 7316) = 0;
    }
  }
  if (v41)
  {
    *(_QWORD *)(v23 + 1776) = v41;
    v45 = *(_QWORD *)(v41 + 16);
    *(_BYTE *)(v23 + 1745) = *(_BYTE *)(v45 + 216);
    *(_BYTE *)(v23 + 1746) = *(_BYTE *)(v45 + 1992);
  }
  commandBuffer = self->_commandBuffer;
  v58[0] = v10;
  v58[1] = 3221225472;
  v58[2] = __94__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_3;
  v58[3] = &unk_250402150;
  v58[4] = v8;
  v58[5] = a4;
  -[MTLCommandBuffer addCompletedHandler:](commandBuffer, "addCompletedHandler:", v58);
  v47 = (float *)self->_progressBins;
  if (v47)
  {
    v48 = *((unsigned __int16 *)v47 + 21);
    v47[v48 + 6] = v47[11] + v47[v48 + 6];
    v47[11] = 0.0;
    if (*((_BYTE *)v47 + 48))
    {
      v49 = (uint64_t *)*((_QWORD *)v47 + 9);
      if (v49)
      {
        v50 = *((_DWORD *)v47 + 35);
        do
        {
          *((_DWORD *)v49 + 8) = v50;
          *((_DWORD *)v49 + 9) = v48;
          v49 = (uint64_t *)*v49;
        }
        while (v49);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v47 + 12, (_QWORD *)v47 + 7);
      ++*((_DWORD *)v47 + 35);
    }
    else if (*((_QWORD *)v47 + 22))
    {
      v51 = *((unsigned int *)v47 + 35);
      *((_DWORD *)v47 + 35) = v51 + 1;
      v52 = (_QWORD *)*((_QWORD *)v47 + 21);
      if (v52)
      {
        v53 = *((_QWORD *)v47 + 18);
        v54 = (uint64_t **)*((_QWORD *)v47 + 21);
        do
        {
          *(_DWORD *)(v53 + 4 * *((unsigned int *)v54 + 4)) = v51;
          v54 = (uint64_t **)*v54;
        }
        while (v54);
        do
        {
          v55 = (_QWORD *)*v52;
          operator delete(v52);
          v52 = v55;
        }
        while (v55);
      }
      *((_QWORD *)v47 + 21) = 0;
      v56 = *((_QWORD *)v47 + 20);
      if (v56)
      {
        for (i = 0; i != v56; ++i)
          *(_QWORD *)(*((_QWORD *)v47 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v47 + 22) = 0;
      if ((v51 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v51);
    }
  }
  return 1;
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  BOOL result;
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *impl;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t Pipeline;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  int *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  int *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unsigned int v115;
  uint64_t v116;
  float *v117;
  uint64_t v118;
  uint64_t *v119;
  int v120;
  uint64_t v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t **v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t i;
  int v128;
  AGXA10FamilyRayTracingGPUBuilder *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  char *v148;
  _QWORD v149[5];
  _QWORD v150[5];
  _QWORD v151[5];
  _QWORD v152[5];
  _QWORD v153[5];
  _QWORD v154[5];
  _QWORD v155[5];
  _QWORD v156[5];
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  _QWORD *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169[4];
  uint64_t v170;
  __int128 v171;
  __int128 v172;

  result = 0;
  if (!a3 || !a4)
    return result;
  if ((unint64_t)(objc_msgSend(a4, "version") - 256) > 5)
    return 0;
  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v10 = objc_msgSend(a3, "size");
    v11 = *((unsigned __int16 *)progressBins + 20);
    if (v11 < 2)
    {
      v13 = 0;
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = progressBins[6];
      v15 = v11 - 1;
      do
      {
        v16 = progressBins[v12++ + 7];
        if (v16 < v14)
        {
          v13 = v12;
          v14 = v16;
        }
      }
      while (v15 != v12);
    }
    v17 = *progressBins + (float)(progressBins[1] * (float)v10);
    *((_WORD *)progressBins + 21) = v13;
    progressBins[11] = v17;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v13);
    v18 = self->_progressBins;
    v19 = objc_msgSend(a3, "buffer");
    v20 = MEMORY[0x24BDAC760];
    v156[0] = MEMORY[0x24BDAC760];
    v156[1] = 3221225472;
    v156[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke;
    v156[3] = &unk_250402128;
    v156[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v18, v19, 0, (uint64_t)v156);
    if (objc_msgSend(a4, "innerNodeBuffer"))
    {
      v21 = self->_progressBins;
      v155[0] = v20;
      v155[1] = 3221225472;
      v155[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_2;
      v155[3] = &unk_250402128;
      v155[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v21, objc_msgSend(a4, "innerNodeBuffer"), 1, (uint64_t)v155);
    }
    if (objc_msgSend(a4, "leafNodeBuffer"))
    {
      v22 = self->_progressBins;
      v154[0] = v20;
      v154[1] = 3221225472;
      v154[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_3;
      v154[3] = &unk_250402128;
      v154[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v22, objc_msgSend(a4, "leafNodeBuffer"), 1, (uint64_t)v154);
    }
    if (objc_msgSend(a4, "primitiveBuffer"))
    {
      v23 = self->_progressBins;
      v153[0] = v20;
      v153[1] = 3221225472;
      v153[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_4;
      v153[3] = &unk_250402128;
      v153[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v23, objc_msgSend(a4, "primitiveBuffer"), 1, (uint64_t)v153);
    }
    if (objc_msgSend(a4, "geometryBuffer"))
    {
      v24 = self->_progressBins;
      v152[0] = v20;
      v152[1] = 3221225472;
      v152[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_5;
      v152[3] = &unk_250402128;
      v152[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v24, objc_msgSend(a4, "geometryBuffer"), 1, (uint64_t)v152);
    }
    if (objc_msgSend(a4, "instanceTransformBuffer"))
    {
      v25 = self->_progressBins;
      v151[0] = v20;
      v151[1] = 3221225472;
      v151[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_6;
      v151[3] = &unk_250402128;
      v151[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v25, objc_msgSend(a4, "instanceTransformBuffer"), 1, (uint64_t)v151);
    }
    if (objc_msgSend(a4, "perPrimitiveDataBuffer"))
    {
      v26 = self->_progressBins;
      v150[0] = v20;
      v150[1] = 3221225472;
      v150[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_7;
      v150[3] = &unk_250402128;
      v150[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v26, objc_msgSend(a4, "perPrimitiveDataBuffer"), 1, (uint64_t)v150);
    }
    if (objc_msgSend(a4, "controlPointBuffer"))
    {
      v27 = self->_progressBins;
      v149[0] = v20;
      v149[1] = 3221225472;
      v149[2] = __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_8;
      v149[3] = &unk_250402128;
      v149[4] = self;
      ProgressBinsSynchronizeBufferAccess((uint64_t)v27, objc_msgSend(a4, "controlPointBuffer"), 1, (uint64_t)v149);
    }
  }
  v129 = self;
  impl = (id *)self->_impl;
  v142 = objc_msgSend(a4, "headerBuffer");
  v134 = objc_msgSend(a4, "headerBufferOffset");
  v29 = objc_msgSend(a4, "innerNodeBuffer");
  v30 = objc_msgSend(a4, "innerNodeBufferOffset");
  v140 = objc_msgSend(a4, "leafNodeBuffer");
  v133 = objc_msgSend(a4, "leafNodeBufferOffset");
  v138 = objc_msgSend(a4, "primitiveBuffer");
  v132 = objc_msgSend(a4, "primitiveBufferOffset");
  v137 = objc_msgSend(a4, "geometryBuffer");
  v131 = objc_msgSend(a4, "geometryBufferOffset");
  v136 = objc_msgSend(a4, "instanceTransformBuffer");
  v130 = objc_msgSend(a4, "instanceTransformBufferOffset");
  v31 = objc_msgSend(a4, "perPrimitiveDataBuffer");
  v32 = objc_msgSend(a4, "perPrimitiveDataBufferOffset");
  v148 = (char *)objc_msgSend(a4, "controlPointBuffer");
  v33 = objc_msgSend(a4, "controlPointBufferOffset");
  v34 = objc_msgSend(a4, "version");
  v35 = v34;
  v170 = v34;
  objc_msgSend(impl[1], "useResource:usage:", a3, 1);
  v36 = objc_msgSend(a3, "buffer");
  v37 = objc_msgSend(a3, "bufferOffset");
  v144 = dword_232D7686C[v35];
  v38 = impl[1];
  v39 = v38[11];
  v146 = v37;
  v147 = (void *)v36;
  objc_msgSend(v38, "setBuffer:offset:atIndex:", v36);
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v142, v134, 10);
  v143 = v29;
  v135 = v30;
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v29, v30, 11);
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v140, v133, 12);
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v138, v132, 13);
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v137, v131, 14);
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v136, v130, 15);
  v141 = (char *)v31;
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v31, v32, 16);
  v139 = v33;
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v148, v33, 17);
  v171 = 0uLL;
  *(_QWORD *)&v172 = 0;
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocateInline((uint64_t)&v171, (uint64_t)impl[1], 48, 1);
  v41 = *((_QWORD *)&v171 + 1);
  v40 = v172;
  v42 = impl[1];
  v43 = v42[11];
  *(_QWORD *)(v43 + 6128) = *((_QWORD *)&v171 + 1);
  *(_QWORD *)(*(_QWORD *)(v43 + 1792) + 608) = v41;
  *(_QWORD *)(v43 + 5352) = v40;
  *(_QWORD *)(v43 + 7136) |= 0x200uLL;
  *(_DWORD *)(v43 + 7152) |= 1u;
  objc_msgSend(v42, "setBytes:length:atIndex:", &v170, 8, 8);
  Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, v144, 0);
  v45 = *(_QWORD *)(v39 + 1776);
  *(_QWORD *)(v39 + 1776) = Pipeline;
  v46 = *(_QWORD *)(Pipeline + 16);
  *(_BYTE *)(v39 + 1745) = *(_BYTE *)(v46 + 216);
  *(_BYTE *)(v39 + 1746) = *(_BYTE *)(v46 + 1992);
  if (*(_DWORD *)(v39 + 1736) == 1)
  {
    if (*(_BYTE *)(v39 + 7672))
    {
      v47 = *(_QWORD *)(v39 + 7688);
      if (*(_QWORD *)(v39 + 7680) != v47)
      {
        *(_BYTE *)(v47 - 8) = 1;
        *(_BYTE *)(v47 - 7) = *(_BYTE *)(*(_QWORD *)(v39 + 1768) + 458);
      }
    }
    else
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v39 + 1624), (_QWORD *)(v39 + 16));
      v48 = *(_DWORD *)(v39 + 7316);
      if (*(_DWORD *)(v39 + 7312) < v48)
        *(_DWORD *)(v39 + 7312) = v48;
      *(_DWORD *)(v39 + 7316) = 0;
    }
  }
  if (v45)
  {
    *(_QWORD *)(v39 + 1776) = v45;
    v49 = *(_QWORD *)(v45 + 16);
    *(_BYTE *)(v39 + 1745) = *(_BYTE *)(v49 + 216);
    *(_BYTE *)(v39 + 1746) = *(_BYTE *)(v49 + 1992);
  }
  v50 = *((_QWORD *)impl[1] + 11);
  v51 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 132, 0);
  v52 = *(_QWORD *)(v50 + 1776);
  *(_QWORD *)(v50 + 1776) = v51;
  v53 = *(_QWORD *)(v51 + 16);
  *(_BYTE *)(v50 + 1745) = *(_BYTE *)(v53 + 216);
  *(_BYTE *)(v50 + 1746) = *(_BYTE *)(v53 + 1992);
  if (*(_DWORD *)(v50 + 1736) == 1)
  {
    if (*(_BYTE *)(v50 + 7672))
    {
      v54 = *(_QWORD *)(v50 + 7688);
      if (*(_QWORD *)(v50 + 7680) != v54)
      {
        *(_BYTE *)(v54 - 8) = 1;
        *(_BYTE *)(v54 - 7) = *(_BYTE *)(*(_QWORD *)(v50 + 1768) + 458);
      }
    }
    else
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v50 + 1624), (_QWORD *)(v50 + 16));
      v55 = *(_DWORD *)(v50 + 7316);
      if (*(_DWORD *)(v50 + 7312) < v55)
        *(_DWORD *)(v50 + 7312) = v55;
      *(_DWORD *)(v50 + 7316) = 0;
    }
  }
  if (v52)
  {
    *(_QWORD *)(v50 + 1776) = v52;
    v56 = *(_QWORD *)(v52 + 16);
    *(_BYTE *)(v50 + 1745) = *(_BYTE *)(v56 + 216);
    *(_BYTE *)(v50 + 1746) = *(_BYTE *)(v56 + 1992);
  }
  v57 = *((_QWORD *)impl[1] + 11);
  v58 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 133, 0);
  v59 = *(_QWORD *)(v57 + 1776);
  *(_QWORD *)(v57 + 1776) = v58;
  v60 = *(_QWORD *)(v58 + 16);
  *(_BYTE *)(v57 + 1745) = *(_BYTE *)(v60 + 216);
  *(_BYTE *)(v57 + 1746) = *(_BYTE *)(v60 + 1992);
  if (*(_DWORD *)(v57 + 1736) == 1)
  {
    if (*(_BYTE *)(v57 + 7672))
    {
      v61 = *(_QWORD *)(v57 + 7688);
      if (*(_QWORD *)(v57 + 7680) != v61)
      {
        *(_BYTE *)(v61 - 8) = 1;
        *(_BYTE *)(v61 - 7) = *(_BYTE *)(*(_QWORD *)(v57 + 1768) + 458);
      }
    }
    else
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v57 + 1624), (_QWORD *)(v57 + 16));
      v62 = *(_DWORD *)(v57 + 7316);
      if (*(_DWORD *)(v57 + 7312) < v62)
        *(_DWORD *)(v57 + 7312) = v62;
      *(_DWORD *)(v57 + 7316) = 0;
    }
  }
  if (v59)
  {
    *(_QWORD *)(v57 + 1776) = v59;
    v63 = *(_QWORD *)(v59 + 16);
    *(_BYTE *)(v57 + 1745) = *(_BYTE *)(v63 + 216);
    *(_BYTE *)(v57 + 1746) = *(_BYTE *)(v63 + 1992);
  }
  v64 = v41 + 8;
  v145 = v41;
  v65 = v41 + 16;
  v66 = 31;
  do
  {
    objc_msgSend(impl[1], "setBytes:length:atIndex:", &v170, 8, 8);
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 57, 0);
    v171 = 0u;
    v172 = 0u;
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v64, v40, (uint64_t *)&v171, 1, 0);
    v67 = *((_QWORD *)impl[1] + 11);
    v68 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 131, 0);
    v69 = *(_QWORD *)(v67 + 1776);
    *(_QWORD *)(v67 + 1776) = v68;
    v70 = *(_QWORD *)(v68 + 16);
    *(_BYTE *)(v67 + 1745) = *(_BYTE *)(v70 + 216);
    *(_BYTE *)(v67 + 1746) = *(_BYTE *)(v70 + 1992);
    if (*(_DWORD *)(v67 + 1736) != 1)
      goto LABEL_60;
    if (*(_BYTE *)(v67 + 7672))
    {
      v71 = *(_QWORD *)(v67 + 7688);
      if (*(_QWORD *)(v67 + 7680) != v71)
      {
        *(_BYTE *)(v71 - 8) = 1;
        *(_BYTE *)(v71 - 7) = *(_BYTE *)(*(_QWORD *)(v67 + 1768) + 458);
      }
LABEL_60:
      if (!v69)
        goto LABEL_62;
LABEL_61:
      *(_QWORD *)(v67 + 1776) = v69;
      v72 = *(_QWORD *)(v69 + 16);
      *(_BYTE *)(v67 + 1745) = *(_BYTE *)(v72 + 216);
      *(_BYTE *)(v67 + 1746) = *(_BYTE *)(v72 + 1992);
      goto LABEL_62;
    }
    AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v67 + 1624), (_QWORD *)(v67 + 16));
    v85 = *(_DWORD *)(v67 + 7316);
    if (*(_DWORD *)(v67 + 7312) < v85)
      *(_DWORD *)(v67 + 7312) = v85;
    *(_DWORD *)(v67 + 7316) = 0;
    if (v69)
      goto LABEL_61;
LABEL_62:
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 64, 0);
    v171 = 0u;
    v172 = 0u;
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v65, v40, (uint64_t *)&v171, 1, 0);
    v73 = *((_QWORD *)impl[1] + 11);
    v74 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 132, 0);
    v75 = *(_QWORD *)(v73 + 1776);
    *(_QWORD *)(v73 + 1776) = v74;
    v76 = *(_QWORD *)(v74 + 16);
    *(_BYTE *)(v73 + 1745) = *(_BYTE *)(v76 + 216);
    *(_BYTE *)(v73 + 1746) = *(_BYTE *)(v76 + 1992);
    if (*(_DWORD *)(v73 + 1736) != 1)
      goto LABEL_66;
    if (*(_BYTE *)(v73 + 7672))
    {
      v77 = *(_QWORD *)(v73 + 7688);
      if (*(_QWORD *)(v73 + 7680) != v77)
      {
        *(_BYTE *)(v77 - 8) = 1;
        *(_BYTE *)(v77 - 7) = *(_BYTE *)(*(_QWORD *)(v73 + 1768) + 458);
      }
LABEL_66:
      if (!v75)
        goto LABEL_68;
LABEL_67:
      *(_QWORD *)(v73 + 1776) = v75;
      v78 = *(_QWORD *)(v75 + 16);
      *(_BYTE *)(v73 + 1745) = *(_BYTE *)(v78 + 216);
      *(_BYTE *)(v73 + 1746) = *(_BYTE *)(v78 + 1992);
      goto LABEL_68;
    }
    AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v73 + 1624), (_QWORD *)(v73 + 16));
    v86 = *(_DWORD *)(v73 + 7316);
    if (*(_DWORD *)(v73 + 7312) < v86)
      *(_DWORD *)(v73 + 7312) = v86;
    *(_DWORD *)(v73 + 7316) = 0;
    if (v75)
      goto LABEL_67;
LABEL_68:
    v79 = *((_QWORD *)impl[1] + 11);
    v80 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 133, 0);
    v81 = *(_QWORD *)(v79 + 1776);
    *(_QWORD *)(v79 + 1776) = v80;
    v82 = *(_QWORD *)(v80 + 16);
    *(_BYTE *)(v79 + 1745) = *(_BYTE *)(v82 + 216);
    *(_BYTE *)(v79 + 1746) = *(_BYTE *)(v82 + 1992);
    if (*(_DWORD *)(v79 + 1736) != 1)
      goto LABEL_72;
    if (*(_BYTE *)(v79 + 7672))
    {
      v83 = *(_QWORD *)(v79 + 7688);
      if (*(_QWORD *)(v79 + 7680) != v83)
      {
        *(_BYTE *)(v83 - 8) = 1;
        *(_BYTE *)(v83 - 7) = *(_BYTE *)(*(_QWORD *)(v79 + 1768) + 458);
      }
LABEL_72:
      if (!v81)
        goto LABEL_55;
LABEL_73:
      *(_QWORD *)(v79 + 1776) = v81;
      v84 = *(_QWORD *)(v81 + 16);
      *(_BYTE *)(v79 + 1745) = *(_BYTE *)(v84 + 216);
      *(_BYTE *)(v79 + 1746) = *(_BYTE *)(v84 + 1992);
      goto LABEL_55;
    }
    AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v79 + 1624), (_QWORD *)(v79 + 16));
    v87 = *(_DWORD *)(v79 + 7316);
    if (*(_DWORD *)(v79 + 7312) < v87)
      *(_DWORD *)(v79 + 7312) = v87;
    *(_DWORD *)(v79 + 7316) = 0;
    if (v81)
      goto LABEL_73;
LABEL_55:
    --v66;
  }
  while (v66);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, dword_232D76884[v170], 0);
  v171 = 0u;
  v172 = 0u;
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v145 + 20, v40, (uint64_t *)&v171, 1, 0);
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 124, 0);
  v171 = 0u;
  v172 = 0u;
  AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::dispatchWithIndirectThreadCountExtended((uint64_t)impl, v145 + 44, v40, (uint64_t *)&v171, 1, 0);
  v88 = (_QWORD *)*((_QWORD *)impl[1] + 11);
  v89 = v88[20];
  v90 = v89 + 31;
  if ((unint64_t)(v89 + 31) <= v88[19])
    goto LABEL_87;
  v128 = AGX::DataBufferAllocator<34ul>::growNoInline(v88 + 2, 3, 0);
  v89 = v88[20];
  if (v128)
  {
    v90 = v89 + 31;
    if ((unint64_t)(v89 + 31) > v88[19])
      abort();
LABEL_87:
    v88[21] = v90;
  }
  v91 = (_QWORD *)((v89 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = (int *)MEMORY[0x24BE51650];
  v93 = (int)*MEMORY[0x24BE51650];
  *(_QWORD *)&v171 = (char *)v91 + v88[22];
  *((_QWORD *)&v171 + 1) = v91;
  *v91 = 0;
  v88[20] = v91 + 2;
  v94 = *(_QWORD *)(v88[5] + 224) + v93;
  *(_QWORD *)&v172 = 8;
  *((_QWORD *)&v172 + 1) = v94;
  v95 = objc_msgSend(v147, "contents");
  v96 = objc_msgSend(v147, "gpuAddress");
  v97 = objc_msgSend(v147, "length");
  v98 = (uint64_t)v147 + *v92;
  v99 = (_QWORD *)(v96 + v146);
  v100 = v146 + v95;
  v169[0] = v96 + v146;
  v169[1] = v146 + v95;
  v169[2] = v97;
  v169[3] = v98;
  objc_msgSend(impl[1], "useResource:usage:", v147, 1);
  if (v141)
  {
    v161 = 0;
    v162 = 0;
    v163 = 0;
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocateInline((uint64_t)&v161, (uint64_t)impl[1], 8, 1);
    v165 = v162;
    v166 = v161;
    v167 = 8;
    v168 = v163;
    v161 = v99 + 5;
    v162 = v100 + 40;
    v163 = v97;
    v164 = v98;
    v157 = v99 + 14;
    v158 = v100 + 112;
    v159 = v97;
    v160 = v98;
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeStridedCopy((uint64_t)impl, (uint64_t *)&v161, (uint64_t *)&v157, 8, (_QWORD *)1, 1u, 8, &v165, (uint64_t *)&v171, 8);
    v161 = v99 + 17;
    v162 = v100 + 136;
    v163 = v97;
    v164 = v98;
    v101 = objc_msgSend(v141, "contents");
    v102 = objc_msgSend(v141, "gpuAddress");
    v103 = objc_msgSend(v141, "length");
    v104 = &v141[*MEMORY[0x24BE51650]];
    v157 = (_QWORD *)(v102 + v32);
    v158 = v32 + v101;
    v159 = v103;
    v160 = (uint64_t)v104;
    objc_msgSend(impl[1], "useResource:usage:", v141, 1);
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeStridedCopy((uint64_t)impl, v169, (uint64_t *)&v161, 4, &v165, 0, 4, (uint64_t *)&v157, (uint64_t *)&v171, 4);
  }
  v105 = (int *)MEMORY[0x24BE51650];
  if (v148)
  {
    v161 = 0;
    v162 = 0;
    v163 = 0;
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocateInline((uint64_t)&v161, (uint64_t)impl[1], 8, 1);
    v165 = v162;
    v166 = v161;
    v167 = 8;
    v168 = v163;
    *v161 = 0;
    v161 = v99 + 1;
    v162 = v100 + 8;
    v163 = v97;
    v164 = v98;
    v157 = v99 + 14;
    v158 = v100 + 112;
    v159 = v97;
    v160 = v98;
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeStridedCopy((uint64_t)impl, (uint64_t *)&v161, (uint64_t *)&v157, 4, (_QWORD *)1, 1u, 4, &v165, (uint64_t *)&v171, 4);
    v161 = v99 + 19;
    v162 = v100 + 152;
    v163 = v97;
    v164 = v98;
    v106 = objc_msgSend(v148, "contents");
    v107 = objc_msgSend(v148, "gpuAddress");
    v108 = objc_msgSend(v148, "length");
    v109 = &v148[*v105];
    v157 = (_QWORD *)(v107 + v139);
    v158 = v139 + v106;
    v159 = v108;
    v160 = (uint64_t)v109;
    objc_msgSend(impl[1], "useResource:usage:", v148, 1);
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeStridedCopy((uint64_t)impl, v169, (uint64_t *)&v161, 16, &v165, 0, 16, (uint64_t *)&v157, (uint64_t *)&v171, 16);
  }
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v147, v146, 7);
  objc_msgSend(impl[1], "setBuffer:offset:atIndex:", v143, v135, 11);
  v110 = *((_QWORD *)impl[1] + 11);
  v111 = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 134, 0);
  v112 = *(_QWORD *)(v110 + 1776);
  *(_QWORD *)(v110 + 1776) = v111;
  v113 = *(_QWORD *)(v111 + 16);
  *(_BYTE *)(v110 + 1745) = *(_BYTE *)(v113 + 216);
  *(_BYTE *)(v110 + 1746) = *(_BYTE *)(v113 + 1992);
  if (*(_DWORD *)(v110 + 1736) == 1)
  {
    if (*(_BYTE *)(v110 + 7672))
    {
      v114 = *(_QWORD *)(v110 + 7688);
      if (*(_QWORD *)(v110 + 7680) != v114)
      {
        *(_BYTE *)(v114 - 8) = 1;
        *(_BYTE *)(v114 - 7) = *(_BYTE *)(*(_QWORD *)(v110 + 1768) + 458);
      }
    }
    else
    {
      AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v110 + 1624), (_QWORD *)(v110 + 16));
      v115 = *(_DWORD *)(v110 + 7316);
      if (*(_DWORD *)(v110 + 7312) < v115)
        *(_DWORD *)(v110 + 7312) = v115;
      *(_DWORD *)(v110 + 7316) = 0;
    }
  }
  if (v112)
  {
    *(_QWORD *)(v110 + 1776) = v112;
    v116 = *(_QWORD *)(v112 + 16);
    *(_BYTE *)(v110 + 1745) = *(_BYTE *)(v116 + 216);
    *(_BYTE *)(v110 + 1746) = *(_BYTE *)(v116 + 1992);
  }
  v117 = (float *)v129->_progressBins;
  if (v117)
  {
    v118 = *((unsigned __int16 *)v117 + 21);
    v117[v118 + 6] = v117[11] + v117[v118 + 6];
    v117[11] = 0.0;
    if (*((_BYTE *)v117 + 48))
    {
      v119 = (uint64_t *)*((_QWORD *)v117 + 9);
      if (v119)
      {
        v120 = *((_DWORD *)v117 + 35);
        do
        {
          *((_DWORD *)v119 + 8) = v120;
          *((_DWORD *)v119 + 9) = v118;
          v119 = (uint64_t *)*v119;
        }
        while (v119);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v117 + 12, (_QWORD *)v117 + 7);
      ++*((_DWORD *)v117 + 35);
    }
    else if (*((_QWORD *)v117 + 22))
    {
      v121 = *((unsigned int *)v117 + 35);
      *((_DWORD *)v117 + 35) = v121 + 1;
      v122 = (_QWORD *)*((_QWORD *)v117 + 21);
      if (v122)
      {
        v123 = *((_QWORD *)v117 + 18);
        v124 = (uint64_t **)*((_QWORD *)v117 + 21);
        do
        {
          *(_DWORD *)(v123 + 4 * *((unsigned int *)v124 + 4)) = v121;
          v124 = (uint64_t **)*v124;
        }
        while (v124);
        do
        {
          v125 = (_QWORD *)*v122;
          operator delete(v122);
          v122 = v125;
        }
        while (v125);
      }
      *((_QWORD *)v117 + 21) = 0;
      v126 = *((_QWORD *)v117 + 20);
      if (v126)
      {
        for (i = 0; i != v126; ++i)
          *(_QWORD *)(*((_QWORD *)v117 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v117 + 22) = 0;
      if ((v121 & 0x80000000) == 0 && !v129->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](v129->_computeEncoder, "signalProgress:", v121);
    }
  }
  return 1;
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingGPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  -[AGXA10FamilyRayTracingGPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id *impl;
  uint64_t v24;
  uint64_t v25;
  unint64_t Pipeline;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t **v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t i;
  unsigned int v52;
  int v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  _QWORD v58[5];
  _QWORD v59[5];

  -[AGXA10FamilyRayTracingGPUBuilder _beginVirtualSubstream](self, "_beginVirtualSubstream");
  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v11 = objc_msgSend(a3, "size");
    v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = progressBins[6];
      v16 = v12 - 1;
      do
      {
        v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          v14 = v13;
          v15 = v17;
        }
      }
      while (v16 != v13);
    }
    v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v14);
    v19 = self->_progressBins;
    v20 = objc_msgSend(a3, "buffer");
    v21 = MEMORY[0x24BDAC760];
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __96__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke;
    v59[3] = &unk_250402128;
    v59[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v19, v20, 0, (uint64_t)v59);
    v22 = self->_progressBins;
    v58[0] = v21;
    v58[1] = 3221225472;
    v58[2] = __96__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke_2;
    v58[3] = &unk_250402128;
    v58[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v22, (unint64_t)a4, 1, (uint64_t)v58);
  }
  impl = (id *)self->_impl;
  objc_msgSend(impl[1], "useResource:usage:", a3, 1);
  v54 = (void *)objc_msgSend(a3, "buffer");
  v24 = objc_msgSend(a3, "bufferOffset");
  v25 = *((_QWORD *)impl[1] + 11);
  Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 120, 0);
  v27 = (_QWORD *)*((_QWORD *)impl[1] + 11);
  v28 = v27[20];
  v29 = v28 + 63;
  v57 = a4;
  v55 = Pipeline;
  v56 = a5;
  if ((unint64_t)(v28 + 63) > v27[19])
  {
    v53 = AGX::DataBufferAllocator<34ul>::growNoInline(v27 + 2, 3, 0);
    v28 = v27[20];
    if (!v53)
      goto LABEL_12;
    v29 = v28 + 63;
    if ((unint64_t)(v28 + 63) > v27[19])
      abort();
  }
  v27[21] = v29;
LABEL_12:
  v30 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  v31 = v27[22];
  v27[20] = v30 + 48;
  v32 = *(_QWORD *)(v27[5] + 224);
  v33 = (int)*MEMORY[0x24BE51650];
  *(_QWORD *)(v30 + 32) = 0;
  *(_OWORD *)v30 = 0u;
  *(_OWORD *)(v30 + 16) = 0u;
  if ((v34 & 1) == 0
  {
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
  }
  *(_DWORD *)(v30 + 28) = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::kBvhChipCodes[AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride & ~(AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride >> 31)];
  if ((v35 & 1) == 0
  {
    AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
  }
  v36 = v30 + v31;
  *(_QWORD *)(v30 + 32) = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::kBvhVersions[AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride & ~(AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride >> 31)] & 0x1FFFFFFF;
  *(_QWORD *)v30 = objc_msgSend(v54, "gpuAddress") + v24;
  objc_msgSend(impl[1], "useResource:usage:", v54, 1);
  *(_QWORD *)(v30 + 8) = objc_msgSend(v57, "gpuAddress") + v56;
  objc_msgSend(impl[1], "useResource:usage:", v57, 2);
  *(_QWORD *)(v25 + 6240) = v36;
  *(_QWORD *)(*(_QWORD *)(v25 + 1792) + 720) = v36;
  *(_QWORD *)(v25 + 5464) = v32 + v33;
  *(_QWORD *)(v25 + 7136) |= 0x800000uLL;
  *(_DWORD *)(v25 + 7152) |= 1u;
  v37 = *(_QWORD *)(v25 + 1776);
  *(_QWORD *)(v25 + 1776) = v55;
  v38 = *(_QWORD *)(v55 + 16);
  *(_BYTE *)(v25 + 1745) = *(_BYTE *)(v38 + 216);
  *(_BYTE *)(v25 + 1746) = *(_BYTE *)(v38 + 1992);
  if (*(_DWORD *)(v25 + 1736) != 1)
  {
LABEL_18:
    if (!v37)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (*(_BYTE *)(v25 + 7672))
  {
    v39 = *(_QWORD *)(v25 + 7688);
    if (*(_QWORD *)(v25 + 7680) != v39)
    {
      *(_BYTE *)(v39 - 8) = 1;
      *(_BYTE *)(v39 - 7) = *(_BYTE *)(*(_QWORD *)(v25 + 1768) + 458);
    }
    goto LABEL_18;
  }
  AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v25 + 1624), (_QWORD *)(v25 + 16));
  v52 = *(_DWORD *)(v25 + 7316);
  if (*(_DWORD *)(v25 + 7312) < v52)
    *(_DWORD *)(v25 + 7312) = v52;
  *(_DWORD *)(v25 + 7316) = 0;
  if (v37)
  {
LABEL_19:
    *(_QWORD *)(v25 + 1776) = v37;
    v40 = *(_QWORD *)(v37 + 16);
    *(_BYTE *)(v25 + 1745) = *(_BYTE *)(v40 + 216);
    *(_BYTE *)(v25 + 1746) = *(_BYTE *)(v40 + 1992);
  }
LABEL_20:
  v41 = (float *)self->_progressBins;
  if (v41)
  {
    v42 = *((unsigned __int16 *)v41 + 21);
    v41[v42 + 6] = v41[11] + v41[v42 + 6];
    v41[11] = 0.0;
    if (*((_BYTE *)v41 + 48))
    {
      v43 = (uint64_t *)*((_QWORD *)v41 + 9);
      if (v43)
      {
        v44 = *((_DWORD *)v41 + 35);
        do
        {
          *((_DWORD *)v43 + 8) = v44;
          *((_DWORD *)v43 + 9) = v42;
          v43 = (uint64_t *)*v43;
        }
        while (v43);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v41 + 12, (_QWORD *)v41 + 7);
      ++*((_DWORD *)v41 + 35);
    }
    else if (*((_QWORD *)v41 + 22))
    {
      v45 = *((unsigned int *)v41 + 35);
      *((_DWORD *)v41 + 35) = v45 + 1;
      v46 = (_QWORD *)*((_QWORD *)v41 + 21);
      if (v46)
      {
        v47 = *((_QWORD *)v41 + 18);
        v48 = (uint64_t **)*((_QWORD *)v41 + 21);
        do
        {
          *(_DWORD *)(v47 + 4 * *((unsigned int *)v48 + 4)) = v45;
          v48 = (uint64_t **)*v48;
        }
        while (v48);
        do
        {
          v49 = (_QWORD *)*v46;
          operator delete(v46);
          v46 = v49;
        }
        while (v49);
      }
      *((_QWORD *)v41 + 21) = 0;
      v50 = *((_QWORD *)v41 + 20);
      if (v50)
      {
        for (i = 0; i != v50; ++i)
          *(_QWORD *)(*((_QWORD *)v41 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v41 + 22) = 0;
      if ((v45 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v45);
    }
  }
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  float *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  float v15;
  unint64_t v16;
  float v17;
  float v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id *impl;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t Pipeline;
  int *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float *v46;
  uint64_t v47;
  uint64_t *v48;
  int v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t **v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t i;
  unsigned int v57;
  _QWORD v58[5];
  _QWORD v59[5];

  progressBins = (float *)self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    v11 = objc_msgSend(a3, "size");
    v12 = *((unsigned __int16 *)progressBins + 20);
    if (v12 < 2)
    {
      v14 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = progressBins[6];
      v16 = v12 - 1;
      do
      {
        v17 = progressBins[v13++ + 7];
        if (v17 < v15)
        {
          v14 = v13;
          v15 = v17;
        }
      }
      while (v16 != v13);
    }
    v18 = *progressBins + (float)(progressBins[1] * (float)v11);
    *((_WORD *)progressBins + 21) = v14;
    progressBins[11] = v18;
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", v14);
    v19 = self->_progressBins;
    v20 = objc_msgSend(a3, "buffer");
    v21 = MEMORY[0x24BDAC760];
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __93__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke;
    v59[3] = &unk_250402128;
    v59[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v19, v20, 0, (uint64_t)v59);
    v22 = self->_progressBins;
    v58[0] = v21;
    v58[1] = 3221225472;
    v58[2] = __93__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke_2;
    v58[3] = &unk_250402128;
    v58[4] = self;
    ProgressBinsSynchronizeBufferAccess((uint64_t)v22, (unint64_t)a4, 1, (uint64_t)v58);
  }
  impl = (id *)self->_impl;
  objc_msgSend(impl[1], "useResource:usage:", a3, 1);
  v24 = objc_msgSend(a3, "buffer");
  v25 = objc_msgSend(a3, "bufferOffset");
  v26 = *((_QWORD *)impl[1] + 11);
  Pipeline = AGX::RayTracingGPUBuilderGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::getOrCreatePipeline((uint64_t)impl, 65, 0);
  v28 = (int *)MEMORY[0x24BE51650];
  if (v24)
  {
    v29 = v24 + (int)*MEMORY[0x24BE51650];
    v30 = *(_QWORD *)(v29 + 8);
    v31 = *(_QWORD *)(v29 + 24);
    LODWORD(v29) = *(_DWORD *)(v29 + 16);
    *(_QWORD *)(v26 + 6056) = v30;
    *(_QWORD *)(v26 + 6576) = v31;
    v32 = *(_QWORD **)(v26 + 1792);
    v32[67] = v30 + v25;
    *v32 = v31 + v25;
    *(_DWORD *)(v26 + 4352) = v29;
    *(_DWORD *)(v26 + 4612) = v29;
    *(_DWORD *)(v26 + 4872) = v30 >> 8;
    *(_QWORD *)(v26 + 5280) = v24 + *v28;
    *(_QWORD *)(v26 + 7136) |= 1uLL;
    *(_DWORD *)(v26 + 7152) |= 1u;
    if (*(_QWORD *)(v26 + 1480))
      MTLResourceListAddResource();
    *(_DWORD *)(v26 + 4212) = 0;
    if (a4)
      goto LABEL_14;
LABEL_17:
    v40 = *(_QWORD *)(v26 + 1752);
    *(_QWORD *)(v26 + 6064) = v40;
    *(_QWORD *)(v26 + 6584) = 0;
    v41 = *(_QWORD *)(v26 + 1792);
    *(_QWORD *)(v41 + 544) = v40;
    *(_QWORD *)(v41 + 8) = 0;
    *(_DWORD *)(v26 + 4356) = 0;
    *(_DWORD *)(v26 + 4616) = 0;
    *(_DWORD *)(v26 + 4876) = *(_QWORD *)(v26 + 1752) >> 8;
    *(_QWORD *)(v26 + 5288) = 0;
    goto LABEL_18;
  }
  v38 = *(_QWORD *)(v26 + 1752);
  *(_QWORD *)(v26 + 6056) = v38;
  *(_QWORD *)(v26 + 6576) = 0;
  v39 = *(_QWORD **)(v26 + 1792);
  v39[67] = v38;
  *v39 = 0;
  *(_DWORD *)(v26 + 4352) = 0;
  *(_DWORD *)(v26 + 4612) = 0;
  *(_DWORD *)(v26 + 4872) = *(_QWORD *)(v26 + 1752) >> 8;
  *(_QWORD *)(v26 + 5280) = 0;
  *(_DWORD *)(v26 + 4212) = 0;
  if (!a4)
    goto LABEL_17;
LABEL_14:
  v33 = (char *)a4 + *v28;
  v34 = *((_QWORD *)v33 + 1);
  v35 = *((_QWORD *)v33 + 3);
  v36 = *((_DWORD *)v33 + 4);
  *(_QWORD *)(v26 + 6064) = v34;
  *(_QWORD *)(v26 + 6584) = v35;
  v37 = *(_QWORD *)(v26 + 1792);
  *(_QWORD *)(v37 + 544) = v34 + a5;
  *(_QWORD *)(v37 + 8) = v35 + a5;
  *(_DWORD *)(v26 + 4356) = v36;
  *(_DWORD *)(v26 + 4616) = v36;
  *(_DWORD *)(v26 + 4876) = v34 >> 8;
  *(_QWORD *)(v26 + 5288) = v33;
  *(_QWORD *)(v26 + 7136) |= 2uLL;
  *(_DWORD *)(v26 + 7152) |= 1u;
  if (*(_QWORD *)(v26 + 1480))
    MTLResourceListAddResource();
LABEL_18:
  v42 = *(_QWORD *)(v26 + 1776);
  *(_DWORD *)(v26 + 4216) = 0;
  *(_QWORD *)(v26 + 1776) = Pipeline;
  v43 = *(_QWORD *)(Pipeline + 16);
  *(_BYTE *)(v26 + 1745) = *(_BYTE *)(v43 + 216);
  *(_BYTE *)(v26 + 1746) = *(_BYTE *)(v43 + 1992);
  if (*(_DWORD *)(v26 + 1736) != 1)
    goto LABEL_22;
  if (*(_BYTE *)(v26 + 7672))
  {
    v44 = *(_QWORD *)(v26 + 7688);
    if (*(_QWORD *)(v26 + 7680) != v44)
    {
      *(_BYTE *)(v44 - 8) = 1;
      *(_BYTE *)(v44 - 7) = *(_BYTE *)(*(_QWORD *)(v26 + 1768) + 458);
    }
LABEL_22:
    if (!v42)
      goto LABEL_24;
    goto LABEL_23;
  }
  AGX::ComputePDSStateLoader<AGX::G9::Encoders,AGX::G9::Classes>::barrier((uint64_t *)(v26 + 1624), (_QWORD *)(v26 + 16));
  v57 = *(_DWORD *)(v26 + 7316);
  if (*(_DWORD *)(v26 + 7312) < v57)
    *(_DWORD *)(v26 + 7312) = v57;
  *(_DWORD *)(v26 + 7316) = 0;
  if (v42)
  {
LABEL_23:
    *(_QWORD *)(v26 + 1776) = v42;
    v45 = *(_QWORD *)(v42 + 16);
    *(_BYTE *)(v26 + 1745) = *(_BYTE *)(v45 + 216);
    *(_BYTE *)(v26 + 1746) = *(_BYTE *)(v45 + 1992);
  }
LABEL_24:
  v46 = (float *)self->_progressBins;
  if (v46)
  {
    v47 = *((unsigned __int16 *)v46 + 21);
    v46[v47 + 6] = v46[11] + v46[v47 + 6];
    v46[11] = 0.0;
    if (*((_BYTE *)v46 + 48))
    {
      v48 = (uint64_t *)*((_QWORD *)v46 + 9);
      if (v48)
      {
        v49 = *((_DWORD *)v46 + 35);
        do
        {
          *((_DWORD *)v48 + 8) = v49;
          *((_DWORD *)v48 + 9) = v47;
          v48 = (uint64_t *)*v48;
        }
        while (v48);
      }
      std::__hash_table<std::__hash_value_type<objc_object  {objcproto9MTLBuffer}*,ADSCommandProgressBins::BufferUsage>,std::__unordered_map_hasher<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::hash<objc_object  {objcproto9MTLBuffer}>,std::equal_to<objc_object  {objcproto9MTLBuffer}>,true>,std::__unordered_map_equal<objc_object  {objcproto9MTLBuffer},ADSCommandProgressBins::BufferUsage,std::equal_to,std::hash,true>,std::allocator<ADSCommandProgressBins::BufferUsage>>::__node_handle_merge_multi[abi:nn180100]<std::allocator<ADSCommandProgressBins::BufferUsage>>((_QWORD *)v46 + 12, (_QWORD *)v46 + 7);
      ++*((_DWORD *)v46 + 35);
    }
    else if (*((_QWORD *)v46 + 22))
    {
      v50 = *((unsigned int *)v46 + 35);
      *((_DWORD *)v46 + 35) = v50 + 1;
      v51 = (_QWORD *)*((_QWORD *)v46 + 21);
      if (v51)
      {
        v52 = *((_QWORD *)v46 + 18);
        v53 = (uint64_t **)*((_QWORD *)v46 + 21);
        do
        {
          *(_DWORD *)(v52 + 4 * *((unsigned int *)v53 + 4)) = v50;
          v53 = (uint64_t **)*v53;
        }
        while (v53);
        do
        {
          v54 = (_QWORD *)*v51;
          operator delete(v51);
          v51 = v54;
        }
        while (v54);
      }
      *((_QWORD *)v46 + 21) = 0;
      v55 = *((_QWORD *)v46 + 20);
      if (v55)
      {
        for (i = 0; i != v55; ++i)
          *(_QWORD *)(*((_QWORD *)v46 + 19) + 8 * i) = 0;
      }
      *((_QWORD *)v46 + 22) = 0;
      if ((v50 & 0x80000000) == 0 && !self->virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v50);
    }
  }
}

- (void)insertDebugSignpost:(id)a3
{
  -[MTLComputeCommandEncoderSPI insertDebugSignpost:](self->_computeEncoder, "insertDebugSignpost:", a3);
}

- (void)popDebugGroup
{
  -[MTLComputeCommandEncoderSPI popDebugGroup](self->_computeEncoder, "popDebugGroup");
}

- (void)pushDebugGroup:(id)a3
{
  -[MTLComputeCommandEncoderSPI pushDebugGroup:](self->_computeEncoder, "pushDebugGroup:", a3);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[MTLComputeCommandEncoderSPI sampleCountersInBuffer:atSampleIndex:withBarrier:](self->_computeEncoder, "sampleCountersInBuffer:atSampleIndex:withBarrier:", a3, a4, a5);
}

- (void)updateFence:(id)a3
{
  -[MTLComputeCommandEncoderSPI updateFence:](self->_computeEncoder, "updateFence:", a3);
}

- (void)useHeap:(id)a3
{
  -[MTLComputeCommandEncoderSPI useHeap:](self->_computeEncoder, "useHeap:", a3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  -[MTLComputeCommandEncoderSPI useHeaps:count:](self->_computeEncoder, "useHeaps:count:", a3, a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLComputeCommandEncoderSPI useResource:usage:](self->_computeEncoder, "useResource:usage:", a3, a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  -[MTLComputeCommandEncoderSPI useResources:count:usage:](self->_computeEncoder, "useResources:count:usage:", a3, a4, a5);
}

- (void)waitForFence:(id)a3
{
  -[MTLComputeCommandEncoderSPI waitForFence:](self->_computeEncoder, "waitForFence:", a3);
}

- (void)_beginVirtualSubstream
{
  if (self->virtualSubstreamOpen)
  {
    -[MTLComputeCommandEncoderSPI nextVirtualSubstream](self->_computeEncoder, "nextVirtualSubstream");
  }
  else if (self->virtualSubstreamsEnabled)
  {
    -[MTLComputeCommandEncoderSPI beginVirtualSubstream](self->_computeEncoder, "beginVirtualSubstream");
    self->virtualSubstreamOpen = 1;
  }
}

- (void)_endVirtualSubstream
{
  _QWORD *progressBins;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t i;

  if (self->virtualSubstreamOpen)
  {
    -[MTLComputeCommandEncoderSPI endVirtualSubstream](self->_computeEncoder, "endVirtualSubstream");
    self->virtualSubstreamOpen = 0;
    progressBins = self->_progressBins;
    if (progressBins)
    {
      if (progressBins[15])
      {
        v4 = (_QWORD *)progressBins[14];
        if (v4)
        {
          do
          {
            v5 = (_QWORD *)*v4;
            operator delete(v4);
            v4 = v5;
          }
          while (v5);
        }
        progressBins[14] = 0;
        v6 = progressBins[13];
        if (v6)
        {
          for (i = 0; i != v6; ++i)
            *(_QWORD *)(progressBins[12] + 8 * i) = 0;
        }
        progressBins[15] = 0;
      }
      progressBins[3] = 0;
      progressBins[4] = 0;
      *((_WORD *)progressBins + 21) = 0;
      *((_DWORD *)progressBins + 35) = 0;
    }
  }
}

uint64_t __93__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __93__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __96__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __96__AGXA10FamilyRayTracingGPUBuilder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_5(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_6(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_7(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __89__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_8(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __94__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __94__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

void __94__AGXA10FamilyRayTracingGPUBuilder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "contents");
  objc_msgSend(*(id *)(a1 + 40), "setHeaderBufferSize:", *v2);
  objc_msgSend(*(id *)(a1 + 40), "setInnerNodeBufferSize:", v2[1]);
  objc_msgSend(*(id *)(a1 + 40), "setLeafNodeBufferSize:", v2[2]);
  objc_msgSend(*(id *)(a1 + 40), "setPrimitiveBufferSize:", v2[3]);
  objc_msgSend(*(id *)(a1 + 40), "setGeometryBufferSize:", v2[4]);
  objc_msgSend(*(id *)(a1 + 40), "setInstanceTransformBufferSize:", v2[5]);
  objc_msgSend(*(id *)(a1 + 40), "setPerPrimitiveDataBufferSize:", v2[6]);
  objc_msgSend(*(id *)(a1 + 40), "setControlPointBufferSize:", v2[7]);

}

uint64_t __158__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __158__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __127__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __127__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __143__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __143__AGXA10FamilyRayTracingGPUBuilder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __112__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __112__AGXA10FamilyRayTracingGPUBuilder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __139__AGXA10FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __139__AGXA10FamilyRayTracingGPUBuilder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __108__AGXA10FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __108__AGXA10FamilyRayTracingGPUBuilder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __122__AGXA10FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __122__AGXA10FamilyRayTracingGPUBuilder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __103__AGXA10FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __103__AGXA10FamilyRayTracingGPUBuilder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __128__AGXA10FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __128__AGXA10FamilyRayTracingGPUBuilder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __96__AGXA10FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __96__AGXA10FamilyRayTracingGPUBuilder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __86__AGXA10FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __86__AGXA10FamilyRayTracingGPUBuilder_copyAccelerationStructure_toAccelerationStructure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __105__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __105__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __92__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __92__AGXA10FamilyRayTracingGPUBuilder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __108__AGXA10FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __108__AGXA10FamilyRayTracingGPUBuilder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

uint64_t __86__AGXA10FamilyRayTracingGPUBuilder_substreamSynchronizeAccelerationStructures_access___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  if (!*(_BYTE *)(v4 + 128))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "waitForVirtualSubstream:", v2);
}

@end
