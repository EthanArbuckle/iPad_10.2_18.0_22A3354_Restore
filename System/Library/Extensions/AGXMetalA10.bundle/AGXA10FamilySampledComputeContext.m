@implementation AGXA10FamilySampledComputeContext

- (AGXA10FamilySampledComputeContext)initWithCommandBuffer:(id)a3 config:(EncoderComputeServiceConfig *)a4 programInfoBuffer:(id *)a5 capacity:(unint64_t)a6
{
  int v6;
  __int128 v8;
  AGXA10FamilySampledComputeContext *v9;
  char *v10;
  unsigned __int8 **impl;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  objc_super v20;
  _OWORD v21[3];
  uint64_t v22;

  v6 = a6;
  v8 = *(_OWORD *)&a4->var2;
  v21[0] = *(_OWORD *)&a4->var0;
  v21[1] = v8;
  v21[2] = *(_OWORD *)&a4->var4;
  v22 = *(_QWORD *)&a4->var7;
  v20.receiver = self;
  v20.super_class = (Class)AGXA10FamilySampledComputeContext;
  v9 = -[AGXA10FamilyComputeContext initWithCommandBuffer:config:](&v20, sel_initWithCommandBuffer_config_, a3, v21);
  if (v9)
  {
    v10 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x5F2CBA36uLL);
    v9->_sampled_impl = v10;
    impl = (unsigned __int8 **)v9->super._impl;
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = 0;
    *((_QWORD *)v10 + 2) = 0;
    *((_QWORD *)v10 + 3) = a5;
    *((_DWORD *)v10 + 9) = 0;
    *((_DWORD *)v10 + 10) = 0;
    *((_DWORD *)v10 + 8) = v6;
    *((_QWORD *)v10 + 6) = impl;
    v12 = *impl;
    v10[56] = (*impl)[728];
    *(_WORD *)(v10 + 57) = v12[729];
    v13 = *(_QWORD *)(objc_msgSend(v12, "device") + 808);
    if (*(_BYTE *)(v13 + 6376))
    {
      if (v10[56])
      {
LABEL_4:
        *(_QWORD *)v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        *((_QWORD *)v10 + 2) = objc_alloc_init(MEMORY[0x24BDBCED8]);
        *((_QWORD *)v10 + 1) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      }
    }
    else
    {
      v15 = *((_QWORD *)v10 + 6);
      v16 = (unsigned int *)(v13 + 6380);
LABEL_7:
      v17 = *v16;
      if (*v16 == -2)
        v18 = 0;
      else
        v18 = v17 + 1;
      do
      {
        v19 = __ldaxr(v16);
        if (v19 != v17)
        {
          __clrex();
          goto LABEL_7;
        }
      }
      while (__stlxr(v18, v16));
      *(_DWORD *)(v15 + 1508) = v17;
      *(_BYTE *)(v15 + 1512) = 1;
      if (v10[56])
        goto LABEL_4;
    }
  }
  return v9;
}

- (id)reInitWithCommandBuffer:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  int v5;
  _QWORD *sampled_impl;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)AGXA10FamilySampledComputeContext;
  -[AGXA10FamilyComputeContext reInitWithCommandBuffer:](&v10, sel_reInitWithCommandBuffer_, a3);
  sampled_impl = self->_sampled_impl;
  sampled_impl[3] = a4;
  *((_DWORD *)sampled_impl + 8) = v5;
  *((_DWORD *)sampled_impl + 9) = 0;
  return self;
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
  v4.super_class = (Class)AGXA10FamilySampledComputeContext;
  -[AGXA10FamilyComputeContext dealloc](&v4, sel_dealloc);
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  _QWORD *sampled_impl;
  id v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  if (a4->var1 * a4->var0 * a4->var2 <= *(unsigned int *)(*((_QWORD *)self->super._impl + 222) + 224))
  {
    sampled_impl = self->_sampled_impl;
    v11 = *a4;
    v10 = *a3;
    AGX::SampledComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::executeKernel(sampled_impl[6], (__int128 *)&v11, (__int128 *)&v10);
    if (*((_BYTE *)sampled_impl + 56))
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v6 = *(_QWORD **)(sampled_impl[6] + 1776);
      if (v6[2])
      {
        v7 = objc_alloc(MEMORY[0x24BDDD7F0]);
        objc_msgSend(v5, "addObject:", objc_msgSend(v7, "initWithMappedAddress:mappedSize:binaryUniqueId:type:", *(_QWORD *)(v6[2] + 512), *(_QWORD *)(v6[2] + 736), *(_QWORD *)(v6[2] + 424), CFSTR("compute"), *(_OWORD *)&v10.var0, v10.var2));
        v8 = v6[25];
        for (i = v6[26]; v8 != i; v8 += 16)
          objc_msgSend(v5, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7F0]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", 0, 0, 0, CFSTR("compute-dylib-resource")));
      }
      objc_msgSend((id)*sampled_impl, "addObject:", v5, *(_OWORD *)&v10.var0, v10.var2);
    }
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  if (LODWORD(a4.length))
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::executeCommandsInBufferCommon(*((_QWORD *)self->_sampled_impl + 6));
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  _QWORD *sampled_impl;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t i;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;

  if (a5->var1 * a5->var0 * a5->var2 <= *(unsigned int *)(*((_QWORD *)self->super._impl + 222) + 224))
  {
    sampled_impl = self->_sampled_impl;
    v19 = *a5;
    AGX::SampledComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::duplicateShaderAddresses((uint64_t)sampled_impl);
    v8 = sampled_impl[6];
    v9 = (int)*MEMORY[0x24BE51650];
    v10 = *(_QWORD *)((char *)a3 + v9 + 8);
    v11 = *(_QWORD *)((char *)a3 + v9 + 24);
    v12 = *(_DWORD *)((char *)a3 + v9 + 16);
    *(_QWORD *)(v8 + 6336) = v10;
    *(_QWORD *)(v8 + 6856) = v11;
    v13 = v10 + a4;
    v14 = *(_QWORD *)(v8 + 1792);
    *(_QWORD *)(v14 + 816) = v10 + a4;
    *(_QWORD *)(v14 + 280) = v11 + a4;
    *(_DWORD *)(v8 + 4492) = v12;
    *(_DWORD *)(v8 + 4752) = v12;
    *(_DWORD *)(v8 + 5012) = v10 >> 8;
    *(_QWORD *)(v8 + 5560) = (char *)a3 + v9;
    *(_QWORD *)(v8 + 7136) |= 0x800000000uLL;
    *(_DWORD *)(v8 + 7152) |= 1u;
    if (*(_QWORD *)(v8 + 1480))
      MTLResourceListAddResource();
    IOGPUResourceListAddResource();
    v20 = v19;
    AGX::ComputeContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses,AGX::G9::EncoderComputeServiceClasses>::executeKernelWithIndirectBufferCommon(v8, v13, (uint64_t *)&v20);
    if (*((_BYTE *)sampled_impl + 56))
    {
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v16 = *(_QWORD **)(sampled_impl[6] + 1776);
      if (v16[2])
      {
        objc_msgSend(v15, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7F0]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", *(_QWORD *)(v16[2] + 512), *(_QWORD *)(v16[2] + 736), *(_QWORD *)(v16[2] + 424), CFSTR("compute")));
        v17 = v16[25];
        for (i = v16[26]; v17 != i; v17 += 16)
          objc_msgSend(v15, "addObject:", objc_msgSend(objc_alloc(MEMORY[0x24BDDD7F0]), "initWithMappedAddress:mappedSize:binaryUniqueId:type:", 0, 0, 0, CFSTR("compute-dylib-resource")));
      }
      objc_msgSend((id)*sampled_impl, "addObject:", v15, *(_OWORD *)&v19.var0, v19.var2);
    }
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

- (id)endEncodingAndRetrieveProgramAddressTable
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilySampledComputeContext;
  -[AGXA10FamilyComputeContext endEncoding](&v4, sel_endEncoding);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDD7E8]), "initWithEncoderMappings:perInvocationMappings:internalMappings:", *((_QWORD *)self->_sampled_impl + 1), *(_QWORD *)self->_sampled_impl, *((_QWORD *)self->_sampled_impl + 2));
}

@end
