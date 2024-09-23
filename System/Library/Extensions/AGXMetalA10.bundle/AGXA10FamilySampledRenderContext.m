@implementation AGXA10FamilySampledRenderContext

- (AGXA10FamilySampledRenderContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4 subEncoderIndex:(unint64_t)a5 framebuffer:(void *)a6 programInfoBuffer:(id *)a7 capacity:(unint64_t)a8
{
  unsigned int v8;
  AGXA10FamilySampledRenderContext *v10;
  unsigned int *v11;
  id *v12;
  _QWORD *impl;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  objc_super v41;

  v8 = a8;
  v41.receiver = self;
  v41.super_class = (Class)AGXA10FamilySampledRenderContext;
  v10 = -[AGXA10FamilyRenderContext initWithCommandBuffer:descriptor:subEncoderIndex:framebuffer:](&v41, sel_initWithCommandBuffer_descriptor_subEncoderIndex_framebuffer_, a3, a4, a5, a6);
  if (v10)
  {
    v11 = (unsigned int *)malloc_type_calloc(0x48uLL, 1uLL, 0xB2D29C5uLL);
    v10->_sampled_impl = v11;
    if (v11)
    {
      v12 = (id *)v11;
      impl = v10->super._impl;
      *(_QWORD *)v11 = 0;
      *((_QWORD *)v11 + 1) = 0;
      *((_QWORD *)v11 + 2) = 0;
      *((_QWORD *)v11 + 3) = a7;
      v11[9] = 0;
      v11[10] = 0;
      v11[8] = v8;
      *((_QWORD *)v11 + 6) = impl;
      *((_QWORD *)v11 + 7) = 0;
      v14 = *impl;
      *((_BYTE *)v11 + 64) = *(_BYTE *)(*impl + 728);
      *((_BYTE *)v11 + 65) = *(_BYTE *)(v14 + 729);
      v15 = *(_QWORD *)(impl[182] + 808);
      v16 = (unsigned __int8 *)(v15 + 6376);
      if (!*(_BYTE *)(v15 + 6376))
      {
        v17 = (unsigned int *)(v15 + 6380);
LABEL_7:
        v18 = *v17;
        if (*v17 == -2)
          v19 = 0;
        else
          v19 = v18 + 1;
        do
        {
          v20 = __ldaxr(v17);
          if (v20 != v18)
          {
            __clrex();
            goto LABEL_7;
          }
        }
        while (__stlxr(v19, v17));
        *((_DWORD *)impl + 377) = v18;
        *((_BYTE *)impl + 1512) = 1;
        impl = (_QWORD *)*((_QWORD *)v11 + 6);
      }
      v21 = impl[217];
      v22 = *(_QWORD *)(v21 + 3120);
      if (v22)
      {
        v23 = *((_QWORD *)v11 + 3) + 24 * v11[9];
        v24 = *v16;
        *(_BYTE *)v23 = 100;
        v25 = *(_DWORD *)(*((_QWORD *)v11 + 6) + 1508);
        if (v24)
        {
          v26 = -156;
        }
        else
        {
          v26 = (v25 << 8) | 0x64;
          v25 = -1;
        }
        *(_DWORD *)v23 = v26;
        *(_DWORD *)(v23 + 4) = v25;
        *(_QWORD *)(v23 + 8) = *(_QWORD *)(v22 + 488);
        *(_QWORD *)(v23 + 16) = *(_QWORD *)(v22 + 712) + *(_QWORD *)(v22 + 488);
        v11[9] = (v11[9] + 1) % v11[8];
        v21 = *(_QWORD *)(*((_QWORD *)v11 + 6) + 1736);
      }
      v27 = *(_QWORD *)(v21 + 3592);
      if (v27)
      {
        v28 = *((_QWORD *)v11 + 3) + 24 * v11[9];
        v29 = *v16;
        *(_BYTE *)v28 = 101;
        v30 = *(_DWORD *)(*((_QWORD *)v11 + 6) + 1508);
        if (v29)
        {
          v31 = -155;
        }
        else
        {
          v31 = (v30 << 8) | 0x65;
          v30 = -1;
        }
        *(_DWORD *)v28 = v31;
        *(_DWORD *)(v28 + 4) = v30;
        *(_QWORD *)(v28 + 8) = *(_QWORD *)(v27 + 168);
        *(_QWORD *)(v28 + 16) = *(_QWORD *)(v27 + 344) + *(_QWORD *)(v27 + 168);
        v11[9] = (v11[9] + 1) % v11[8];
      }
      if (*((_BYTE *)v11 + 64))
      {
        *((_QWORD *)v11 + 1) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v12[2] = objc_alloc_init(MEMORY[0x24BDBCED8]);
        *v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if (v22)
        {
          v32 = *(_QWORD *)(v22 + 400);
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", *(_QWORD *)(v22 + 536), *(_QWORD *)(v22 + 712));
          v34 = objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", v33, v32, *(unsigned int *)(v22 + 392));

          v35 = (id)objc_msgSend(v12[2], "objectForKey:", CFSTR("bgo"));
          if (!v35)
          {
            v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v12[2], "setObject:forKeyedSubscript:", v35, CFSTR("bgo"));
          }
          objc_msgSend(v35, "addObject:", v34);
          objc_msgSend(*v12, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7F0]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", *(_QWORD *)(v22 + 488), *(_QWORD *)(v22 + 712), v32, CFSTR("bgo")));
        }
        if (v27)
        {
          v36 = *(_QWORD *)(v27 + 112);
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", *(_QWORD *)(v27 + 192), *(_QWORD *)(v27 + 344));
          v38 = objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E0]), "initWithBinary:uniqueIdentifier:debugIdentifier:", v37, v36, *(unsigned int *)(v27 + 108));

          v39 = (id)objc_msgSend(v12[2], "objectForKey:", CFSTR("eot"));
          if (!v39)
          {
            v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v12[2], "setObject:forKeyedSubscript:", v39, CFSTR("eot"));
          }
          objc_msgSend(v39, "addObject:", v38);
          objc_msgSend(*v12, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7F0]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", *(_QWORD *)(v27 + 168), *(_QWORD *)(v27 + 344), v36, CFSTR("eot")));
        }
      }
    }
    else
    {
      -[AGXA10FamilyRenderContext endEncoding](v10, "endEncoding");

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  id *sampled_impl;
  objc_super v4;

  sampled_impl = (id *)self->_sampled_impl;
  if (sampled_impl)
  {

    free(self->_sampled_impl);
    self->_sampled_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilySampledRenderContext;
  -[AGXA10FamilyRenderContext dealloc](&v4, sel_dealloc);
}

- (void)setRenderPipelineState:(id)a3
{
  *((_QWORD *)self->_sampled_impl + 7) = a3;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawPrimitives((uint64_t)self->_sampled_impl, a3, a4, a5, 0, 1);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawPrimitives((uint64_t)self->_sampled_impl, a3, a4, a5, 0, a6);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawPrimitives((uint64_t)self->_sampled_impl, a3, a4, a5, a7, a6);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawIndexedPrimitives((uint64_t)self->_sampled_impl, a3, a4, 0, 1, a5, (uint64_t)a6, a7, 0);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawIndexedPrimitives((uint64_t)self->_sampled_impl, a3, a4, 0, a8, a5, (uint64_t)a6, a7, 0);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  void *sampled_impl;
  uint64_t v4;
  id v5;

  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v4 = *((_QWORD *)sampled_impl + 6);
  *(_BYTE *)(v4 + 2065) = 1;
  *(_QWORD *)(v4 + 21400) |= 0x2000uLL;
  *(_QWORD *)(v4 + 21152) |= 0x5F700000000004uLL;
  if (*((_BYTE *)sampled_impl + 64))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v5);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v5);
  }
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  void *sampled_impl;
  uint64_t v5;
  id v6;

  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v5 = *((_QWORD *)sampled_impl + 6);
  *(_BYTE *)(v5 + 2065) = 1;
  *(_QWORD *)(v5 + 21400) |= 0x2000uLL;
  *(_QWORD *)(v5 + 21152) |= 0x5F700000000004uLL;
  if (*((_BYTE *)sampled_impl + 64))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v6);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v6);
  }
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  void *sampled_impl;
  uint64_t v6;
  id v7;

  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v6 = *((_QWORD *)sampled_impl + 6);
  *(_BYTE *)(v6 + 2065) = 1;
  *(_QWORD *)(v6 + 21400) |= 0x2000uLL;
  *(_QWORD *)(v6 + 21152) |= 0x5F700000000004uLL;
  if (*((_BYTE *)sampled_impl + 64))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v7);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v7);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawIndexedPrimitives((uint64_t)self->_sampled_impl, a3, a4, a10, a8, a5, (uint64_t)a6, a7, a9);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  unsigned int v5;
  void *sampled_impl;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int *v14;
  char *v15;
  char *v16;
  id v17;

  v5 = a5;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v9 = *((_QWORD *)sampled_impl + 6);
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeIndirectNonindexedParameters(v9, (uint64_t)a4, v5);
  if (*(_BYTE *)(v9 + 2529))
  {
    *(_BYTE *)(v9 + 2529) = 0;
    *(_QWORD *)(v9 + 21152) |= 1uLL;
  }
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType(v9, a3);
  v10 = *(_QWORD *)((char *)a4 + *MEMORY[0x24BE51650] + 8);
  if (*(id *)(v9 + 2560) != a4)
  {
    IOGPUResourceListAddResource();
    if (*(_QWORD *)(v9 + 1480))
      MTLResourceListAddResource();
    *(_QWORD *)(v9 + 2560) = a4;
  }
  v11 = v10 + v5;
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState(v9, *(int8x16_t **)(v9 + 2672), *(int8x16_t **)(v9 + 2680), v9 + 2704, (_QWORD *)(v9 + 5904), v9 + 20960, 0);
  *(_QWORD *)(v9 + 21400) |= 1uLL;
  v12 = 4 * a3;
  v13 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v12) | 0x60C40000;
  LODWORD(v12) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v12);
  v14 = *(unsigned int **)(v9 + 64);
  v15 = (char *)v14 + *(_QWORD *)(v9 + 80);
  *(_QWORD *)(v9 + 64) = v14 + 12;
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
  *(_BYTE *)(v9 + 1544) = 0;
  if (*((_BYTE *)sampled_impl + 64))
  {
    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v17);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v17);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  unsigned int v8;
  unsigned int v10;
  void *sampled_impl;
  uint64_t v15;
  int *v16;
  char *v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  id v40;

  v8 = a8;
  v10 = a6;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v15 = *((_QWORD *)sampled_impl + 6);
  v16 = (int *)MEMORY[0x24BE51650];
  v17 = (char *)a7 + (int)*MEMORY[0x24BE51650];
  v18 = *((_QWORD *)v17 + 1);
  v19 = *(_DWORD *)(v15 + 1720) != 2;
  *(_DWORD *)(v15 + 1720) = 2;
  if (((*(_QWORD *)(*(_QWORD *)(v15 + 2672) + 1288) | *(_QWORD *)(*(_QWORD *)(v15 + 2672) + 1264) | *(_QWORD *)(*(_QWORD *)(v15 + 2672) + 2832)) & 0x700000000000) != 0)
  {
    *(_QWORD *)(v15 + 20960) |= 0x700000000000uLL;
    v20 = *(_QWORD *)(v15 + 21152) | v19 | 0x40;
    *(_QWORD *)(v15 + 21152) = v20;
    v21 = v18 + v8;
    *(_QWORD *)(v15 + 3576) = v21 + 12;
    *(_QWORD *)(v15 + 3584) = v21 + 16;
    *(int64x2_t *)(v15 + 4080) = vaddq_s64(*(int64x2_t *)(v15 + 4080), (int64x2_t)xmmword_232D73CD0);
    *(_QWORD *)(v15 + 15776) = v17;
    *(_QWORD *)(v15 + 15768) = v17;
    if (*(_BYTE *)(v15 + 2529))
      goto LABEL_4;
    goto LABEL_3;
  }
  v20 = *(_QWORD *)(v15 + 21152) | v19;
  *(_QWORD *)(v15 + 21152) = v20;
  if (!*(_BYTE *)(v15 + 2529))
  {
LABEL_3:
    *(_BYTE *)(v15 + 2529) = 1;
    *(_QWORD *)(v15 + 21152) = v20 | 1;
  }
LABEL_4:
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeISPPrimitiveType(v15, a3);
  v22 = *v16;
  v23 = *(_QWORD *)((char *)a5 + v22 + 8);
  if (*(id *)(v15 + 2552) != a5)
  {
    IOGPUResourceListAddResource();
    if (*(_QWORD *)(v15 + 1480))
      MTLResourceListAddResource();
    *(_QWORD *)(v15 + 2552) = a5;
    v22 = *v16;
  }
  v24 = *(_QWORD *)((char *)a7 + v22 + 8);
  if (*(id *)(v15 + 2560) != a7)
  {
    IOGPUResourceListAddResource();
    if (*(_QWORD *)(v15 + 1480))
      MTLResourceListAddResource();
    *(_QWORD *)(v15 + 2560) = a7;
  }
  AGX::RenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeAndEmitRenderState(v15, *(int8x16_t **)(v15 + 2672), *(int8x16_t **)(v15 + 2680), v15 + 2704, (_QWORD *)(v15 + 5904), v15 + 20960, 0);
  if (*(_BYTE *)(*(_QWORD *)(v15 + 1736) + 2932))
  {
    if (a3 - 2 >= 7)
      v25 = 0x10000000;
    else
      v25 = qword_232D77DB0[a3 - 2];
  }
  else
  {
    v25 = 0x10000000;
    if (*(_BYTE *)(v15 + 2531))
      v25 = 268435488;
  }
  v26 = *(_DWORD *)(v15 + 2532);
  if (v26 >= 0xFFFF)
    LODWORD(v27) = 0xFFFF;
  else
    LODWORD(v27) = *(_DWORD *)(v15 + 2532);
  if (a4 == 1)
    v27 = v26;
  else
    v27 = v27;
  v28 = v24 + v8;
  v29 = v23 + v10;
  v30 = v25 | *(_QWORD *)(*(_QWORD *)(v15 + 2672)
                        + 16 * (*(unsigned __int8 *)(v15 + 2528) | (2 * *(_DWORD *)(v15 + 2536)))
                        + 3432) & 0xE23FFFFFLL | (v27 << 32);
  v31 = *(_QWORD *)(v15 + 64);
  *(_QWORD *)v31 = v30;
  *(_QWORD *)(v15 + 21400) |= 1uLL;
  v32 = 4 * a3;
  v33 = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToVDMCTRLType + v32) | AGX::VDMEncoderGen1<kAGXRevG9>::IndexTypeToVDMCTRLType[a4] | 0x70C00000 | HIDWORD(v29);
  v34 = HIDWORD(v28);
  v35 = v28 & 0xFFFFFFFC;
  LODWORD(v32) = *(_DWORD *)((char *)&AGX::VDMEncoderGen1<kAGXRevG9>::PrimitiveTypeToSplitCount + v32);
  v36 = *(_QWORD *)(v15 + 80) + v31 + 8;
  *(_QWORD *)(v15 + 64) = v31 + 60;
  v37 = v36 + 32;
  v36 += 52;
  v38 = (v28 + 4) >> 32;
  v39 = (v28 + 4) & 0xFFFFFFFE;
  v28 += 6;
  *(_DWORD *)(v31 + 8) = HIDWORD(v37) | 0x8D000000;
  *(_DWORD *)(v31 + 12) = v37 & 0xFFFFFFFC;
  *(_DWORD *)(v31 + 16) = v38;
  *(_DWORD *)(v31 + 20) = v39;
  *(_DWORD *)(v31 + 24) = HIDWORD(v36) | 0x8A000000;
  *(_DWORD *)(v31 + 28) = v36 & 0xFFFFFFFC;
  *(_DWORD *)(v31 + 32) = HIDWORD(v28);
  *(_DWORD *)(v31 + 36) = v28 & 0xFFFFFFFE;
  *(_DWORD *)(v31 + 40) = v33;
  *(_DWORD *)(v31 + 44) = v29;
  *(_DWORD *)(v31 + 48) = v34;
  *(_DWORD *)(v31 + 52) = v35;
  *(_DWORD *)(v31 + 56) = v32;
  *(_BYTE *)(v15 + 1544) = 0;
  if (*((_BYTE *)sampled_impl + 64))
  {
    v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v40);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v40);
  }
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  unsigned int v9;
  unsigned int v12;
  int v13;
  int v14;
  void *sampled_impl;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v9 = a8;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v16 = *((_QWORD *)sampled_impl + 6);
  *(_DWORD *)(v16 + 11324) = v14;
  *(_DWORD *)(v16 + 11288) = a6 != 0;
  *(_DWORD *)(v16 + 11280) = a9;
  *(_QWORD *)(v16 + 21000) |= 0x20uLL;
  *(_QWORD *)(v16 + 21152) |= 0x40uLL;
  AGX::SWTessellationContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawPatches(v16 + 1840, v17, v13, v12, (uint64_t)a6, a7, 0, 0, v9, a9);
  if (*((_BYTE *)sampled_impl + 64))
  {
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v18);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v18);
  }
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  int v8;
  void *sampled_impl;
  uint64_t v10;
  id v11;

  v8 = a3;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v10 = *((_QWORD *)sampled_impl + 6);
  *(_DWORD *)(v10 + 11324) = v8;
  *(_DWORD *)(v10 + 11288) = a4 != 0;
  *(_QWORD *)(v10 + 21000) |= 0x20uLL;
  *(_QWORD *)(v10 + 21152) |= 0x40uLL;
  if (*((_BYTE *)sampled_impl + 64))
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v11);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v11);
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  unsigned int v14;
  int v15;
  int v16;
  void *sampled_impl;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v14 = a5;
  v15 = a4;
  v16 = a3;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v18 = *((_QWORD *)sampled_impl + 6);
  *(_DWORD *)(v18 + 11324) = v16;
  *(_DWORD *)(v18 + 11288) = a6 != 0;
  *(_DWORD *)(v18 + 11280) = a11;
  *(_QWORD *)(v18 + 21000) |= 0x20uLL;
  *(_QWORD *)(v18 + 21152) |= 0x40uLL;
  AGX::SWTessellationContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::drawPatches(v18 + 1840, v19, v15, v14, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, a11);
  if (*((_BYTE *)sampled_impl + 64))
  {
    v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v20);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v20);
  }
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  int v10;
  void *sampled_impl;
  uint64_t v12;
  id v13;

  v10 = a3;
  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  v12 = *((_QWORD *)sampled_impl + 6);
  *(_DWORD *)(v12 + 11324) = v10;
  *(_DWORD *)(v12 + 11288) = a4 != 0;
  *(_QWORD *)(v12 + 21000) |= 0x20uLL;
  *(_QWORD *)(v12 + 21152) |= 0x40uLL;
  if (*((_BYTE *)sampled_impl + 64))
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v13);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v13);
  }
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  void *sampled_impl;
  id v6;

  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  if (*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 1960))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::hasObjectStage(void)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  if (*((_BYTE *)sampled_impl + 64))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v6);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v6);
  }
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  void *sampled_impl;
  id v6;

  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  if (*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 1960))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::hasObjectStage(void)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  if (*((_BYTE *)sampled_impl + 64))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v6);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v6);
  }
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  void *sampled_impl;
  id v7;

  sampled_impl = self->_sampled_impl;
  AGX::SampledRenderContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
  if (*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 1960))
    AGX::NopGeometryPipelineContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::hasObjectStage(void)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
  if (*((_BYTE *)sampled_impl + 64))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AGX::RenderPipeline<AGX::G9::ObjClasses,AGX::G9::Classes,AGX::G9::Encoders>::appendProgramAddressTables(*(_QWORD *)(*((_QWORD *)sampled_impl + 6) + 2688), v7);
    objc_msgSend(*((id *)sampled_impl + 1), "addObject:", v7);
  }
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilySampledRenderContext;
  -[AGXA10FamilyRenderContext endEncoding](&v4, sel_endEncoding);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E8]), "initWithEncoderMappings:perInvocationMappings:internalMappings:", *(_QWORD *)self->_sampled_impl, *((_QWORD *)self->_sampled_impl + 1), *((_QWORD *)self->_sampled_impl + 2));
}

- (void)destroyImpl
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AGXA10FamilySampledRenderContext;
  -[AGXA10FamilyRenderContext destroyImpl](&v2, sel_destroyImpl);
}

@end
