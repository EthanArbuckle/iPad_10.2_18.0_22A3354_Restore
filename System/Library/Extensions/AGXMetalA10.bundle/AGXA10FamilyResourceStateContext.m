@implementation AGXA10FamilyResourceStateContext

- (AGXA10FamilyResourceStateContext)initWithCommandBuffer:(id)a3
{
  return -[AGXA10FamilyResourceStateContext initWithCommandBuffer:descriptor:](self, "initWithCommandBuffer:descriptor:", a3, 0);
}

- (AGXA10FamilyResourceStateContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  uint64_t v10[6];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AGXA10FamilyResourceStateContext;
  v6 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v11, sel_initWithCommandBuffer_);
  if (v6)
  {
    v7 = malloc_type_calloc(0x1950uLL, 1uLL, 0xFEF93785uLL);
    *((_QWORD *)v6 + 11) = v7;
    if (v7)
    {
      v10[2] = objc_msgSend(a3, "commandBufferStorage", objc_msgSend(a3, "device"), a3);
      v10[3] = (uint64_t)v6;
      v10[4] = objc_msgSend(a3, "globalTraceObjectID");
      v10[5] = objc_msgSend(v6, "globalTraceObjectID");
      v8 = (_QWORD *)AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BlitDispatchContext(*((_QWORD *)v6 + 11), v10, 0, (MTLResourceStatePassDescriptor *)a4);
      *v8 = &off_2503FFFE8;
      v8[808] = v8[183];
      v8[809] = 0;
    }
    else
    {
      objc_msgSend(v6, "endEncoding");

      return 0;
    }
  }
  return (AGXA10FamilyResourceStateContext *)v6;
}

- (void)endEncoding
{
  uint64_t v3;
  unint64_t *v4;
  _QWORD *impl;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  objc_super v11;

  if (self->_impl)
  {
    v3 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]), "device");
    v4 = (unint64_t *)(v3 + 816);
    impl = self->_impl;
    v6 = impl[228];
    v7 = impl[229];
    do
      v8 = __ldaxr(v4);
    while (__stlxr(v8 | v6, v4));
    v9 = (unint64_t *)(v3 + 824);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 | v7, v9));
    AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::commit((uint64_t)self->_impl);
    AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~BlitDispatchContext((_QWORD *)self->_impl);
    free(self->_impl);
    self->_impl = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)AGXA10FamilyResourceStateContext;
  -[IOGPUMetalCommandEncoder endEncoding](&v11, sel_endEncoding);
}

- (void)updateFence:(id)a3
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;

  impl = self->_impl;
  if (impl[186])
    MTLResourceListAddResource();
  v5 = impl[223];
  if (!v5)
  {
    v5 = operator new();
    v6 = *(_QWORD *)(impl[183] + 808) + 6192;
    bzero((void *)v5, 0x208uLL);
    *(_QWORD *)(v5 + 520) = v6;
    *(_DWORD *)(v5 + 528) = 0;
    impl[223] = v5;
  }
  AGX::FenceList::insertFence((AGX::FenceList *)v5, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x24BE51630]));
}

- (void)waitForFence:(id)a3
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;

  impl = self->_impl;
  if (impl[186])
    MTLResourceListAddResource();
  v5 = impl[224];
  if (!v5)
  {
    v5 = operator new();
    v6 = *(_QWORD *)(impl[183] + 808) + 6192;
    bzero((void *)v5, 0x208uLL);
    *(_QWORD *)(v5 + 520) = v6;
    *(_DWORD *)(v5 + 528) = 0;
    impl[224] = v5;
  }
  AGX::FenceList::insertFence((AGX::FenceList *)v5, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x24BE51630]));
}

@end
