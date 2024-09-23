@implementation IOGPUMetalIOCommandBuffer

- (IOGPUMetalIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5
{
  _BOOL8 v5;
  IOGPUMetalIOCommandBuffer *v9;
  IOGPUMetalIOCommandQueue *v10;
  IOGPUMetalDeviceShmem *Shmem;
  uint64_t v12;
  IOGPUIOKernelCommandListHeader *commandListHeader;
  dispatch_group_t v14;
  NSMutableArray *v15;
  objc_super v17;

  v5 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalIOCommandBuffer initWithQueue:resourceList:retained:].cold.1();
  v17.receiver = self;
  v17.super_class = (Class)IOGPUMetalIOCommandBuffer;
  v9 = -[_MTLIOCommandBuffer initWithQueue:resourceList:retained:](&v17, sel_initWithQueue_resourceList_retained_, a3, a4, v5);
  if (v9)
  {
    v9->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v10 = (IOGPUMetalIOCommandQueue *)a3;
    v9->_queue = v10;
    IOGPUIOCommandQueueCreateIOCommandBuffer((uint64_t)v10->_ioCommandQueueRef, &v9->_commandBufferID, &v9->_globalTraceObjectID);
    if (!v9->_commandBufferID)
      goto LABEL_9;
    Shmem = (IOGPUMetalDeviceShmem *)IOGPUMetalDeviceShmemPoolCreateShmem(*((_QWORD *)v9->_device + 92));
    v9->_ioKernelCommandShmem = Shmem;
    if (!Shmem)
      goto LABEL_9;
    v9->_ioKernelCommandShmemStart = (char *)Shmem->_virtualAddress;
    v9->_ioKernelCommandShmemEnd = (char *)v9->_ioKernelCommandShmem->_virtualAddress
                                 + v9->_ioKernelCommandShmem->_shmemSize;
    v9->_ioKernelCommandShmemCurrent = (char *)v9->_ioKernelCommandShmem->_virtualAddress;
    v9->_commandListHeader = (IOGPUIOKernelCommandListHeader *)v9->_ioKernelCommandShmemStart;
    v12 = (uint64_t)(v9->_ioKernelCommandShmemCurrent + 8);
    v9->_ioKernelCommandShmemCurrent = (char *)v12;
    LODWORD(v12) = v12 - LODWORD(v9->_ioKernelCommandShmemStart);
    commandListHeader = v9->_commandListHeader;
    commandListHeader->var0 = v12;
    commandListHeader->var1 = v12;
    v14 = dispatch_group_create();
    v9->_ioCompletionGroup = (OS_dispatch_group *)v14;
    if (!v14)
      goto LABEL_9;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9->_stagingBuffers = v15;
    if (v15)
    {
      if (*(_DWORD *)__globalGPUCommPage)
        IOGPUDeviceTraceEvent();
    }
    else
    {
LABEL_9:

      return 0;
    }
  }
  return v9;
}

- (IOGPUMetalIOCommandBuffer)initWithQueue:(id)a3
{
  return -[IOGPUMetalIOCommandBuffer initWithQueue:resourceList:retained:](self, "initWithQueue:resourceList:retained:", a3, 0, 0);
}

- (void)dealloc
{
  NSObject *ioCompletionGroup;
  MTLBlitCommandEncoder *gpuBlitEncoder;
  MTLCommandBuffer *gpuCommandBuffer;
  os_unfair_lock_s *ioKernelCommandShmem;
  objc_super v7;

  ioCompletionGroup = self->_ioCompletionGroup;
  if (ioCompletionGroup)
  {
    dispatch_release(ioCompletionGroup);
    self->_ioCompletionGroup = 0;
  }

  self->_stagingBuffers = 0;
  gpuBlitEncoder = self->_gpuBlitEncoder;
  if (gpuBlitEncoder)
  {
    -[MTLBlitCommandEncoder endEncoding](gpuBlitEncoder, "endEncoding");

    self->_gpuBlitEncoder = 0;
  }
  gpuCommandBuffer = self->_gpuCommandBuffer;
  if (gpuCommandBuffer)
  {

    self->_gpuCommandBuffer = 0;
  }
  ioKernelCommandShmem = (os_unfair_lock_s *)self->_ioKernelCommandShmem;
  if (ioKernelCommandShmem)
  {
    IOGPUMetalDeviceShmemRelease(ioKernelCommandShmem);
    self->_ioKernelCommandShmem = 0;
  }
  IOGPUIOCommandQueueDestroyIOCommandBuffer(self->_queue->_ioCommandQueueRef, self->_commandBufferID);
  self->_commandBufferID = 0;

  self->_queue = 0;
  self->_device = 0;
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalIOCommandBuffer;
  -[_MTLIOCommandBuffer dealloc](&v7, sel_dealloc);
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  objc_class *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  objc_class *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  void *v21;
  vector<IOGPUIOCommandQueueCommandBufferCallbackBlock, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *p_commandCallbackBlocks;
  Class isa;
  NSString *label;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  void *v31;
  char *v32;
  NSString *v33;
  Class v34;
  ?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *begin;
  uint64_t v36;
  uint64_t v37;
  unsigned int *p_notificationCount;
  unsigned int v39;
  _QWORD v40[12];

  v11 = (objc_class *)objc_msgSend(a5, "stagingBufferSize:offset:", a4, a6);
  v12 = (int)*MEMORY[0x24BDDD8B8];
  v13 = (int)*MEMORY[0x24BDDD8C8];
  if (*(Class *)((char *)&self->super.super.super.isa + v13) >= v11)
  {
    v14 = *(Class *)((char *)&self->super.super.super.isa + v12);
  }
  else
  {
    v14 = -[_MTLIOCommandBuffer getReusableScratchBuffer:](self, "getReusableScratchBuffer:", v11);
    if (!v14)
    {
      v31 = (void *)-[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:](-[_MTLIOCommandQueue scratchBufferAllocator](self->_queue, "scratchBufferAllocator"), "newScratchBufferWithMinimumSize:", v11);
      v14 = v31;
      if (!v31 || objc_msgSend((id)objc_msgSend(v31, "buffer"), "allocatedSize") < (unint64_t)v11)
      {

        *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8F0]) = (Class)1;
        return;
      }
      MTLResourceListAddResource();

    }
    v15 = (objc_class *)objc_msgSend((id)objc_msgSend(v14, "buffer"), "allocatedSize");
    *(Class *)((char *)&self->super.super.super.isa + v13) = v15;
    if (v15 < v11)
      -[IOGPUMetalIOCommandBuffer loadBytes:size:sourceHandle:sourceHandleOffset:].cold.1();
    *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8C0]) = 0;
    *(Class *)((char *)&self->super.super.super.isa + v12) = (Class)v14;
  }
  v16 = -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:](self, "getCommandBufferBytes:", 56);
  *v16 = 0x3800000000;
  bzero(v16 + 1, 0x30uLL);
  *((_DWORD *)v16 + 2) = objc_msgSend(a5, "vnioID");
  if (v11)
  {
    v16[2] = objc_msgSend(a5, "getHandleOffset:offset:", a4, a6);
    v16[3] = v11;
    v17 = objc_msgSend((id)objc_msgSend(v14, "buffer"), "contents");
    v18 = (int)*MEMORY[0x24BDDD8C0];
    v19 = *(char **)((char *)&self->super.super.super.isa + v18) + v17;
    v20 = -[IOGPUMetalIOCommandQueue globalTraceObjectID](self->_queue, "globalTraceObjectID");
    v16[4] = v19;
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke;
    v40[3] = &unk_24CC3FC90;
    v40[4] = self;
    v40[5] = a5;
    v40[6] = v20;
    v40[7] = a3;
    v40[8] = a4;
    v40[9] = a6;
    v40[10] = v19;
    v40[11] = v11;
    v21 = _Block_copy(v40);
    v16[6] = v21;
    p_commandCallbackBlocks = &self->_commandCallbackBlocks;
    isa = self[1].super.super.super.isa;
    label = self[1].super.super._label;
    if (isa >= (Class)label)
    {
      v26 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
      if ((unint64_t)(v26 + 1) >> 61)
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      v27 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
      v28 = v27 >> 2;
      if (v27 >> 2 <= (unint64_t)(v26 + 1))
        v28 = v26 + 1;
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
        v29 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v29 = v28;
      if (v29)
      {
        v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v29);
        v21 = (void *)v16[6];
      }
      else
      {
        v30 = 0;
      }
      v32 = &v30[8 * v26];
      v33 = (NSString *)&v30[8 * v29];
      *(_QWORD *)v32 = v21;
      v25 = (objc_class *)(v32 + 8);
      begin = p_commandCallbackBlocks->__begin_;
      v34 = self[1].super.super.super.isa;
      if (v34 != p_commandCallbackBlocks->__begin_)
      {
        do
        {
          v36 = *((_QWORD *)v34 - 1);
          v34 = (Class)((char *)v34 - 8);
          *((_QWORD *)v32 - 1) = v36;
          v32 -= 8;
        }
        while (v34 != begin);
        v34 = p_commandCallbackBlocks->__begin_;
      }
      p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v32;
      self[1].super.super.super.isa = v25;
      self[1].super.super._label = v33;
      if (v34)
        operator delete(v34);
    }
    else
    {
      *(_QWORD *)isa = v21;
      v25 = (Class)((char *)isa + 8);
    }
    v37 = *(uint64_t *)((char *)&self->super.super.super.isa + v18);
    self[1].super.super.super.isa = v25;
    *(Class *)((char *)&self->super.super.super.isa + v18) = (objc_class *)((char *)v11 + v37);
    *(Class *)((char *)&self->super.super.super.isa + v13) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                              + v13)
                                                                   - (unint64_t)v11);
    p_notificationCount = &self->_notificationCount;
    do
      v39 = __ldaxr(p_notificationCount);
    while (__stlxr(v39 + 1, p_notificationCount));
  }
  else
  {
    v16[2] = a6;
    v16[3] = a4;
    v16[4] = a3;
  }
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8E8]))
    MTLResourceListAddResource();
}

void __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2 == 3)
  {
    v17 = v2;
    v18 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 410))
    {
      *(_QWORD *)(v5 + (int)*MEMORY[0x24BDDD8F0]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      v7 = objc_msgSend(*(id *)(v5 + 304), "getDecompressionQueue");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke_2;
      v10[3] = &unk_24CC3FC68;
      v11 = *(_OWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = v8;
      v14 = *(_OWORD *)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 88);
      v15 = *(_QWORD *)(a1 + 80);
      v16 = v9;
      dispatch_group_async(v6, v7, v10);
    }
  }
}

unint64_t __76__IOGPUMetalIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset___block_invoke_2(uint64_t a1)
{
  unint64_t result;

  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEventStart();
  result = objc_msgSend(*(id *)(a1 + 40), "decompress:size:offset:stagingBuffer:stagingBufferSize:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  if (result == -1 || result < *(_QWORD *)(a1 + 64))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BDDD8F0]) = 2;
  if (*(_DWORD *)__globalGPUCommPage)
    return IOGPUDeviceTraceEventEnd();
  return result;
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  _QWORD *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  vector<IOGPUIOCommandQueueCommandBufferCallbackBlock, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *p_commandCallbackBlocks;
  Class isa;
  NSString *label;
  objc_class *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  char *v47;
  NSString *v48;
  Class v49;
  ?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *begin;
  uint64_t v51;
  unsigned int *p_notificationCount;
  unsigned int v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  MTLCommandBuffer *v57;
  MTLBlitCommandEncoder *v58;
  objc_class *v59;
  MTLBlitCommandEncoder *gpuBlitEncoder;
  MTLBlitCommandEncoder *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  objc_class *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD aBlock[14];

  v68 = objc_msgSend(a3, "storageMode");
  if (v68 == 2)
    v12 = a5;
  else
    v12 = 0;
  v13 = objc_msgSend(a6, "stagingBufferSize:offset:", a5, a7);
  v14 = v12 + v13;
  v15 = (int)*MEMORY[0x24BDDD8B8];
  v67 = (int)*MEMORY[0x24BDDD8C8];
  if (*(Class *)((char *)&self->super.super.super.isa + v67) >= (Class)(v12 + v13))
  {
    v66 = *(Class *)((char *)&self->super.super.super.isa + v15);
  }
  else
  {
    v16 = -[_MTLIOCommandBuffer getReusableScratchBuffer:](self, "getReusableScratchBuffer:", v14);
    if (!v16)
    {
      v43 = (void *)-[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:](-[_MTLIOCommandQueue scratchBufferAllocator](self->_queue, "scratchBufferAllocator"), "newScratchBufferWithMinimumSize:", v14);
      v44 = v43;
      if (!v43
        || (v45 = v43, v46 = objc_msgSend((id)objc_msgSend(v43, "buffer"), "allocatedSize"), v44 = v45, v46 < v14))
      {

        *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8F0]) = (Class)1;
        return;
      }
      MTLResourceListAddResource();

      v16 = (objc_class *)v45;
    }
    v17 = v16;
    v18 = (objc_class *)objc_msgSend((id)-[objc_class buffer](v16, "buffer"), "allocatedSize");
    *(Class *)((char *)&self->super.super.super.isa + v67) = v18;
    if ((unint64_t)v18 < v14)
      -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:].cold.1();
    *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8C0]) = 0;
    v66 = v17;
    *(Class *)((char *)&self->super.super.super.isa + v15) = v17;
  }
  v19 = -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:](self, "getCommandBufferBytes:", 56);
  *v19 = 0x3800000000;
  bzero(v19 + 1, 0x30uLL);
  *((_DWORD *)v19 + 2) = objc_msgSend(a6, "vnioID");
  if (v13)
  {
    v63 = v12 + v13;
    v64 = a4;
    v20 = a6;
    v21 = a5;
    v19[2] = objc_msgSend(a6, "getHandleOffset:offset:", a5, a7);
    v19[3] = v13;
    v22 = objc_msgSend((id)-[objc_class buffer](v66, "buffer"), "contents");
    v23 = (int)*MEMORY[0x24BDDD8C0];
    v24 = *(char **)((char *)&self->super.super.super.isa + v23) + v12 + v22;
    if (v68 == 2)
    {
      v25 = objc_msgSend((id)-[objc_class buffer](v66, "buffer"), "contents");
      v26 = *(unint64_t *)((char *)&self->super.super.super.isa + v23);
    }
    else
    {
      v25 = objc_msgSend(a3, "contents");
      v26 = v64;
    }
    v30 = v25 + v26;
    v31 = -[IOGPUMetalIOCommandQueue globalTraceObjectID](self->_queue, "globalTraceObjectID");
    v32 = objc_msgSend(v20, "globalTraceObjectID");
    v19[4] = v24;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke;
    aBlock[3] = &unk_24CC3FCE0;
    aBlock[6] = v31;
    aBlock[7] = v32;
    aBlock[4] = self;
    aBlock[5] = v20;
    aBlock[8] = v30;
    aBlock[9] = v21;
    a5 = v21;
    aBlock[10] = a7;
    aBlock[11] = v24;
    aBlock[12] = v13;
    v33 = _Block_copy(aBlock);
    v19[6] = v33;
    p_commandCallbackBlocks = &self->_commandCallbackBlocks;
    isa = self[1].super.super.super.isa;
    label = self[1].super.super._label;
    if (isa >= (Class)label)
    {
      v38 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
      a4 = v64;
      if ((unint64_t)(v38 + 1) >> 61)
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      v39 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
      v40 = v39 >> 2;
      if (v39 >> 2 <= (unint64_t)(v38 + 1))
        v40 = v38 + 1;
      if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
        v41 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v41 = v40;
      v29 = a3;
      if (v41)
      {
        v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v41);
        v33 = (void *)v19[6];
      }
      else
      {
        v42 = 0;
      }
      v14 = v63;
      v47 = &v42[8 * v38];
      v48 = (NSString *)&v42[8 * v41];
      *(_QWORD *)v47 = v33;
      v37 = (objc_class *)(v47 + 8);
      begin = p_commandCallbackBlocks->__begin_;
      v49 = self[1].super.super.super.isa;
      if (v49 != p_commandCallbackBlocks->__begin_)
      {
        do
        {
          v51 = *((_QWORD *)v49 - 1);
          v49 = (Class)((char *)v49 - 8);
          *((_QWORD *)v47 - 1) = v51;
          v47 -= 8;
        }
        while (v49 != begin);
        v49 = p_commandCallbackBlocks->__begin_;
      }
      p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v47;
      self[1].super.super.super.isa = v37;
      self[1].super.super._label = v48;
      if (v49)
        operator delete(v49);
    }
    else
    {
      *(_QWORD *)isa = v33;
      v37 = (Class)((char *)isa + 8);
      a4 = v64;
      v29 = a3;
      v14 = v63;
    }
    self[1].super.super.super.isa = v37;
    p_notificationCount = &self->_notificationCount;
    do
      v53 = __ldaxr(p_notificationCount);
    while (__stlxr(v53 + 1, p_notificationCount));
  }
  else
  {
    v19[2] = a7;
    v19[3] = a5;
    if (v68 == 2)
    {
      v27 = objc_msgSend((id)-[objc_class buffer](v66, "buffer"), "contents");
      v28 = *(char **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8C0]) + v27;
      v29 = a3;
    }
    else
    {
      v29 = a3;
      v28 = (char *)(objc_msgSend(a3, "contents") + a4);
    }
    v19[4] = v28;
  }
  if (v68 == 2)
  {
    v54 = v14;
    if (self->_hasFollowOnGPUWork)
    {
      v55 = a5;
    }
    else
    {
      v55 = a5;
      v57 = (MTLCommandBuffer *)(id)-[MTLCommandQueue commandBuffer](-[_MTLIOCommandQueue gpuQueue](self->_queue, "gpuQueue"), "commandBuffer");
      self->_gpuCommandBuffer = v57;
      if (!v57)
        -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:].cold.2();
      v58 = (MTLBlitCommandEncoder *)(id)-[MTLCommandBuffer blitCommandEncoder](v57, "blitCommandEncoder");
      self->_gpuBlitEncoder = v58;
      if (!v58)
        -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:].cold.3();
      self->_hasFollowOnGPUWork = 1;
    }
    v59 = v66;
    gpuBlitEncoder = self->_gpuBlitEncoder;
    if (!gpuBlitEncoder)
    {
      v61 = (MTLBlitCommandEncoder *)(id)-[MTLCommandBuffer blitCommandEncoder](self->_gpuCommandBuffer, "blitCommandEncoder");
      v59 = v66;
      gpuBlitEncoder = v61;
      self->_gpuBlitEncoder = v61;
      if (!v61)
        -[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:].cold.4();
    }
    v62 = -[objc_class buffer](v59, "buffer");
    v56 = (int)*MEMORY[0x24BDDD8C0];
    -[MTLBlitCommandEncoder copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:](gpuBlitEncoder, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v62, *(Class *)((char *)&self->super.super.super.isa + v56), v29, a4, v55);
    v14 = v54;
  }
  else
  {
    v56 = (int)*MEMORY[0x24BDDD8C0];
  }
  *(Class *)((char *)&self->super.super.super.isa + v56) = (Class)(*(char **)((char *)&self->super.super.super.isa + v56)
                                                                 + v14);
  *(Class *)((char *)&self->super.super.super.isa + v67) = (Class)(*(char **)((char *)&self->super.super.super.isa + v67)
                                                                 - v14);
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8E8]))
  {
    MTLResourceListAddResource();
    MTLResourceListAddResource();
  }
}

void __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  __int128 v8;
  uint64_t v9;
  _QWORD block[4];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2 == 3)
  {
    v17 = v2;
    v18 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 410))
    {
      *(_QWORD *)(v5 + (int)*MEMORY[0x24BDDD8F0]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      v7 = objc_msgSend(*(id *)(v5 + 304), "getDecompressionQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke_2;
      block[3] = &unk_24CC3FCB8;
      v8 = *(_OWORD *)(a1 + 32);
      v12 = *(_OWORD *)(a1 + 48);
      v11 = v8;
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(_OWORD *)(a1 + 72);
      v9 = *(_QWORD *)(a1 + 96);
      v15 = *(_QWORD *)(a1 + 88);
      v16 = v9;
      dispatch_group_async(v6, v7, block);
    }
  }
}

unint64_t __84__IOGPUMetalIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset___block_invoke_2(uint64_t a1)
{
  unint64_t result;

  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEventStart();
  result = objc_msgSend(*(id *)(a1 + 40), "decompress:size:offset:stagingBuffer:stagingBufferSize:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
  if (result == -1 || result < *(_QWORD *)(a1 + 72))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BDDD8F0]) = 2;
  if (*(_DWORD *)__globalGPUCommPage)
    return IOGPUDeviceTraceEventEnd();
  return result;
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  unint64_t i;
  uint64_t v14;
  unint64_t v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t *v33;
  void *v34;
  vector<IOGPUIOCommandQueueCommandBufferCallbackBlock, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *p_commandCallbackBlocks;
  Class isa;
  NSString *label;
  objc_class *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  unint64_t *v48;
  unint64_t *v49;
  unint64_t *v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  char *v54;
  Class v55;
  ?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *begin;
  uint64_t v57;
  unsigned int *p_notificationCount;
  unsigned int v59;
  MTLCommandBuffer *v60;
  MTLBlitCommandEncoder *v61;
  MTLBlitCommandEncoder *gpuBlitEncoder;
  uint64_t v63;
  unint64_t v64;
  void **v65;
  void **v66;
  void *v67;
  vector<IOGPUIOCommandQueueCommandBufferCallbackBlock, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *v68;
  Class v69;
  NSString *v70;
  objc_class *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  NSString *v78;
  Class v79;
  ?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *v80;
  uint64_t v81;
  unsigned int *v82;
  unsigned int v83;
  int v84;
  const char *v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v93;
  objc_class *v95;
  _QWORD v97[8];
  void *__p;
  void *v99;
  uint64_t v100;
  __int128 v101;
  unint64_t v102;
  __int128 v103;
  uint64_t v104;
  _QWORD aBlock[13];
  unint64_t *v106;
  unint64_t *v107;
  unint64_t v108;
  __int128 v109;
  uint64_t v110;
  __int128 v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;

  v113 = 0;
  v114 = 0;
  v111 = *(_OWORD *)&a9->var0;
  v112 = 0;
  v109 = *(_OWORD *)&a6->var0;
  v110 = 1;
  MTLCalculateSourceBufferSizeAndAlignment();
  v106 = 0;
  v107 = 0;
  v108 = 0;
  v87 = -[IOGPUMetalIOCommandQueue globalTraceObjectID](self->_queue, "globalTraceObjectID");
  v86 = objc_msgSend(a10, "globalTraceObjectID");
  if (a6->var2)
  {
    for (i = 0; i < a6->var2; ++i)
    {
      v14 = objc_msgSend(a10, "stagingBufferSize:offset:", v114, a11);
      v15 = v113;
      v16 = (objc_class *)(v114 + v113 + v14);
      v17 = (int)*MEMORY[0x24BDDD8B8];
      v18 = (int)*MEMORY[0x24BDDD8C8];
      v95 = v16;
      v93 = v18;
      if (*(Class *)((char *)&self->super.super.super.isa + v18) >= v16)
      {
        v19 = *(Class *)((char *)&self->super.super.super.isa + v17);
        v22 = (int)*MEMORY[0x24BDDD8C0];
      }
      else
      {
        v19 = -[_MTLIOCommandBuffer getReusableScratchBuffer:](self, "getReusableScratchBuffer:", v16);
        if (!v19)
        {
          v20 = (void *)-[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:](-[_MTLIOCommandQueue scratchBufferAllocator](self->_queue, "scratchBufferAllocator"), "newScratchBufferWithMinimumSize:", v16);
          v19 = v20;
          if (!v20 || objc_msgSend((id)objc_msgSend(v20, "buffer"), "allocatedSize") < (unint64_t)v16)
          {

            *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8F0]) = (Class)1;
            goto LABEL_82;
          }
          MTLResourceListAddResource();

        }
        v21 = (objc_class *)objc_msgSend((id)objc_msgSend(v19, "buffer"), "allocatedSize");
        *(Class *)((char *)&self->super.super.super.isa + v18) = v21;
        if (v21 < v16)
          __assert_rtn("-[IOGPUMetalIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 534, "_currentStagingBufferRemainingBytes >= paddedStagingBufferSize");
        v22 = (int)*MEMORY[0x24BDDD8C0];
        *(Class *)((char *)&self->super.super.super.isa + v22) = 0;
        *(Class *)((char *)&self->super.super.super.isa + v17) = (Class)v19;
        v15 = v113;
      }
      v23 = *(uint64_t *)((char *)&self->super.super.super.isa + v22);
      v24 = -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:](self, "getCommandBufferBytes:", 56);
      *v24 = 0x3800000000;
      bzero(v24 + 1, 0x30uLL);
      v25 = (v23 + v15 - 1) / v15 * v15;
      *((_DWORD *)v24 + 2) = objc_msgSend(a10, "vnioID");
      if (v14)
      {
        v24[2] = objc_msgSend(a10, "getHandleOffset:offset:", v114, a11);
        v24[3] = v14;
        v26 = objc_msgSend((id)objc_msgSend(v19, "buffer"), "contents");
        v27 = v114;
        v28 = objc_msgSend((id)objc_msgSend(v19, "buffer"), "contents");
        v29 = v26 + v25 + v27;
        v30 = v28 + v25;
        v24[4] = v29;
        if (a6->var2 < 2)
        {
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke;
          aBlock[3] = &unk_24CC3FCE0;
          aBlock[6] = v87;
          aBlock[7] = v86;
          aBlock[4] = self;
          aBlock[5] = a10;
          aBlock[8] = v28 + v25;
          aBlock[9] = v114;
          aBlock[10] = a11;
          aBlock[11] = v29;
          aBlock[12] = v14;
          v34 = _Block_copy(aBlock);
          v24[6] = v34;
          p_commandCallbackBlocks = &self->_commandCallbackBlocks;
          isa = self[1].super.super.super.isa;
          label = self[1].super.super._label;
          if (isa >= (Class)label)
          {
            v43 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
            if ((unint64_t)(v43 + 1) >> 61)
              std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
            v44 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
            v45 = v44 >> 2;
            if (v44 >> 2 <= (unint64_t)(v43 + 1))
              v45 = v43 + 1;
            if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
              v46 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v46 = v45;
            if (v46)
            {
              v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v46);
              v34 = (void *)v24[6];
            }
            else
            {
              v47 = 0;
            }
            v54 = &v47[8 * v43];
            *(_QWORD *)v54 = v34;
            v38 = (objc_class *)(v54 + 8);
            begin = p_commandCallbackBlocks->__begin_;
            v55 = self[1].super.super.super.isa;
            if (v55 != p_commandCallbackBlocks->__begin_)
            {
              do
              {
                v57 = *((_QWORD *)v55 - 1);
                v55 = (Class)((char *)v55 - 8);
                *((_QWORD *)v54 - 1) = v57;
                v54 -= 8;
              }
              while (v55 != begin);
              v55 = p_commandCallbackBlocks->__begin_;
            }
            p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v54;
            self[1].super.super.super.isa = v38;
            self[1].super.super._label = (NSString *)&v47[8 * v46];
            if (v55)
              operator delete(v55);
          }
          else
          {
            *(_QWORD *)isa = v34;
            v38 = (Class)((char *)isa + 8);
          }
          self[1].super.super.super.isa = v38;
          p_notificationCount = &self->_notificationCount;
          do
            v59 = __ldaxr(p_notificationCount);
          while (__stlxr(v59 + 1, p_notificationCount));
        }
        else
        {
          v88 = v25;
          v31 = v114;
          v32 = v107;
          if ((unint64_t)v107 >= v108)
          {
            v39 = 0xCCCCCCCCCCCCCCCDLL * (v107 - v106);
            v40 = v39 + 1;
            if (v39 + 1 > 0x666666666666666)
              std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
            if (0x999999999999999ALL * ((uint64_t)(v108 - (_QWORD)v106) >> 3) > v40)
              v40 = 0x999999999999999ALL * ((uint64_t)(v108 - (_QWORD)v106) >> 3);
            if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v108 - (_QWORD)v106) >> 3) >= 0x333333333333333)
              v41 = 0x666666666666666;
            else
              v41 = v40;
            if (v41)
              v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IOGPUIODecompressionArgs>>((uint64_t)&v108, v41);
            else
              v42 = 0;
            v48 = (unint64_t *)&v42[40 * v39];
            *v48 = v30;
            v48[1] = v31;
            v48[2] = a11;
            v48[3] = v29;
            v48[4] = v14;
            v50 = v106;
            v49 = v107;
            v51 = (char *)v48;
            if (v107 == v106)
            {
              v25 = v88;
            }
            else
            {
              v25 = v88;
              do
              {
                v52 = *(_OWORD *)(v49 - 5);
                v53 = *(_OWORD *)(v49 - 3);
                *((_QWORD *)v51 - 1) = *(v49 - 1);
                *(_OWORD *)(v51 - 24) = v53;
                *(_OWORD *)(v51 - 40) = v52;
                v51 -= 40;
                v49 -= 5;
              }
              while (v49 != v50);
              v49 = v50;
            }
            v33 = v48 + 5;
            v106 = (unint64_t *)v51;
            v107 = v48 + 5;
            v108 = (unint64_t)&v42[40 * v41];
            if (v49)
              operator delete(v49);
          }
          else
          {
            *v107 = v30;
            v32[1] = v31;
            v32[2] = a11;
            v32[3] = v29;
            v33 = v32 + 5;
            v32[4] = v14;
            v25 = v88;
          }
          v107 = v33;
        }
      }
      else
      {
        v24[2] = a11;
        v24[3] = v95;
        v24[4] = *(char **)((char *)&self->super.super.super.isa + v22)
               + objc_msgSend((id)objc_msgSend(v19, "buffer"), "contents");
      }
      if (!self->_hasFollowOnGPUWork)
      {
        v60 = (MTLCommandBuffer *)(id)-[MTLCommandQueue commandBuffer](-[_MTLIOCommandQueue gpuQueue](self->_queue, "gpuQueue"), "commandBuffer");
        self->_gpuCommandBuffer = v60;
        if (!v60)
        {
          v84 = 627;
          v85 = "_gpuCommandBuffer";
          goto LABEL_90;
        }
        v61 = (MTLBlitCommandEncoder *)(id)-[MTLCommandBuffer blitCommandEncoder](v60, "blitCommandEncoder");
        self->_gpuBlitEncoder = v61;
        if (!v61)
        {
          v84 = 629;
LABEL_89:
          v85 = "_gpuBlitEncoder";
LABEL_90:
          __assert_rtn("-[IOGPUMetalIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", v84, v85);
        }
        self->_hasFollowOnGPUWork = 1;
      }
      gpuBlitEncoder = self->_gpuBlitEncoder;
      if (!gpuBlitEncoder)
      {
        gpuBlitEncoder = (MTLBlitCommandEncoder *)(id)-[MTLCommandBuffer blitCommandEncoder](self->_gpuCommandBuffer, "blitCommandEncoder");
        self->_gpuBlitEncoder = gpuBlitEncoder;
        if (!gpuBlitEncoder)
        {
          v84 = 637;
          goto LABEL_89;
        }
      }
      v63 = objc_msgSend(v19, "buffer");
      v103 = *(_OWORD *)&a6->var0;
      v104 = 1;
      v64 = a9->var2 + i;
      v101 = *(_OWORD *)&a9->var0;
      v102 = v64;
      -[MTLBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](gpuBlitEncoder, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v63, v25, a7, a8, &v103, a3, a4, a5, &v101);
      *(Class *)((char *)&self->super.super.super.isa + v22) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                + v22)
                                                                     + (unint64_t)v95);
      *(Class *)((char *)&self->super.super.super.isa + v93) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                + v93)
                                                                     - (unint64_t)v95);
      a11 += a8;
    }
  }
  if (v107 != v106)
  {
    v65 = -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:](self, "getCommandBufferBytes:", 24);
    *v65 = (void *)0x1800000001;
    v66 = v65 + 1;
    bzero(v65 + 1, 0x10uLL);
    v97[0] = MEMORY[0x24BDAC760];
    v97[1] = 3321888768;
    v97[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_3;
    v97[3] = &unk_24CC3F3E8;
    v97[4] = self;
    v97[6] = v87;
    v97[7] = v86;
    __p = 0;
    v99 = 0;
    v100 = 0;
    std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(&__p, v106, (uint64_t)v107, 0xCCCCCCCCCCCCCCCDLL * (v107 - v106));
    v97[5] = a10;
    v67 = _Block_copy(v97);
    *v66 = v67;
    v68 = &self->_commandCallbackBlocks;
    v69 = self[1].super.super.super.isa;
    v70 = self[1].super.super._label;
    if (v69 >= (Class)v70)
    {
      v72 = (v69 - v68->__begin_) >> 3;
      if ((unint64_t)(v72 + 1) >> 61)
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      v73 = (char *)v70 - (char *)v68->__begin_;
      v74 = v73 >> 2;
      if (v73 >> 2 <= (unint64_t)(v72 + 1))
        v74 = v72 + 1;
      if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8)
        v75 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v75 = v74;
      if (v75)
      {
        v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v75);
        v67 = *v66;
      }
      else
      {
        v76 = 0;
      }
      v77 = &v76[8 * v72];
      v78 = (NSString *)&v76[8 * v75];
      *(_QWORD *)v77 = v67;
      v71 = (objc_class *)(v77 + 8);
      v80 = v68->__begin_;
      v79 = self[1].super.super.super.isa;
      if (v79 != v68->__begin_)
      {
        do
        {
          v81 = *((_QWORD *)v79 - 1);
          v79 = (Class)((char *)v79 - 8);
          *((_QWORD *)v77 - 1) = v81;
          v77 -= 8;
        }
        while (v79 != v80);
        v79 = v68->__begin_;
      }
      v68->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v77;
      self[1].super.super.super.isa = v71;
      self[1].super.super._label = v78;
      if (v79)
        operator delete(v79);
    }
    else
    {
      *(_QWORD *)v69 = v67;
      v71 = (Class)((char *)v69 + 8);
    }
    self[1].super.super.super.isa = v71;
    v82 = &self->_notificationCount;
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 + 1, v82));
    if (__p)
    {
      v99 = __p;
      operator delete(__p);
    }
  }
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8E8]))
  {
    MTLResourceListAddResource();
    MTLResourceListAddResource();
  }
LABEL_82:
  if (v106)
  {
    v107 = v106;
    operator delete(v106);
  }
}

void __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  __int128 v8;
  uint64_t v9;
  _QWORD block[4];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2 == 3)
  {
    v17 = v2;
    v18 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 410))
    {
      *(_QWORD *)(v5 + (int)*MEMORY[0x24BDDD8F0]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      v7 = objc_msgSend(*(id *)(v5 + 304), "getDecompressionQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_2;
      block[3] = &unk_24CC3FCB8;
      v8 = *(_OWORD *)(a1 + 32);
      v12 = *(_OWORD *)(a1 + 48);
      v11 = v8;
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(_OWORD *)(a1 + 72);
      v9 = *(_QWORD *)(a1 + 96);
      v15 = *(_QWORD *)(a1 + 88);
      v16 = v9;
      dispatch_group_async(v6, v7, block);
    }
  }
}

unint64_t __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_2(uint64_t a1)
{
  unint64_t result;

  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEventStart();
  result = objc_msgSend(*(id *)(a1 + 40), "decompress:size:offset:stagingBuffer:stagingBufferSize:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
  if (result == -1 || result < *(_QWORD *)(a1 + 72))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BDDD8F0]) = 2;
  if (*(_DWORD *)__globalGPUCommPage)
    return IOGPUDeviceTraceEventEnd();
  return result;
}

void __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const void *v8;
  uint64_t v9;
  _QWORD block[6];
  __int128 v11;
  void *__p;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a2 == 3)
  {
    v15 = v2;
    v16 = v3;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 410))
    {
      *(_QWORD *)(v5 + (int)*MEMORY[0x24BDDD8F0]) = 1;
    }
    else
    {
      v6 = *(NSObject **)(v5 + 376);
      v7 = objc_msgSend(*(id *)(v5 + 304), "getDecompressionQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3321888768;
      block[2] = __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_4;
      block[3] = &unk_24CC3F3B0;
      block[4] = *(_QWORD *)(a1 + 32);
      v11 = *(_OWORD *)(a1 + 48);
      v13 = 0;
      v14 = 0;
      v8 = *(const void **)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 72);
      __p = 0;
      std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(&__p, v8, v9, 0xCCCCCCCCCCCCCCCDLL * ((v9 - (uint64_t)v8) >> 3));
      block[5] = *(_QWORD *)(a1 + 40);
      dispatch_group_async(v6, v7, block);
      if (__p)
      {
        v13 = __p;
        operator delete(__p);
      }
    }
  }
}

unint64_t __146__IOGPUMetalIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset___block_invoke_4(unint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;

  v1 = result;
  if (*(_DWORD *)__globalGPUCommPage)
    result = IOGPUDeviceTraceEventStart();
  v2 = -858993459 * ((*(_QWORD *)(v1 + 72) - *(_QWORD *)(v1 + 64)) >> 3);
  if ((_DWORD)v2)
  {
    v3 = 0;
    v4 = 40 * v2;
    while (1)
    {
      v5 = (_QWORD *)(*(_QWORD *)(v1 + 64) + v3);
      v6 = v5[1];
      result = objc_msgSend(*(id *)(v1 + 40), "decompress:size:offset:stagingBuffer:stagingBufferSize:", *v5, v6, v5[2], v5[3], v5[4]);
      if (result == -1 || result < v6)
        break;
      v3 += 40;
      if (v4 == v3)
        goto LABEL_11;
    }
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + (int)*MEMORY[0x24BDDD8F0]) = 2;
  }
LABEL_11:
  if (*(_DWORD *)__globalGPUCommPage)
    return IOGPUDeviceTraceEventEnd();
  return result;
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;

  v12 = *a6;
  v11 = *a9;
  -[IOGPUMetalIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](self, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", a3, a4, a5, &v12, a7, a8, &v11, a10, a11);
}

- (void)barrierComplete:(int64_t)a3
{
  IOGPUIOCommandQueueIOCommandBufferBarrierComplete(self->_queue->_ioCommandQueueRef, self->_commandBufferID, a3);
}

- (void)addBarrier
{
  _BYTE *v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  MTLBlitCommandEncoder *gpuBlitEncoder;
  MTLCommandBuffer *gpuCommandBuffer;
  uint64_t v9;
  MTLCommandBuffer *v10;
  unsigned int *p_notificationCount;
  unsigned int v12;
  unsigned int lastBarrierNotificationCount;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  vector<IOGPUIOCommandQueueCommandBufferCallbackBlock, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *p_commandCallbackBlocks;
  Class isa;
  NSString *label;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  NSString *v28;
  Class v29;
  ?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *begin;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD aBlock[8];
  _QWORD v34[5];

  v3 = -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:](self, "getCommandBufferBytes:", 24);
  *(_QWORD *)v3 = 0x1800000001;
  v4 = v3 + 8;
  bzero(v3 + 8, 0x10uLL);
  if (self->_hasFollowOnGPUWork)
  {
    v5 = -[IOGPUMetalIOCommandQueue globalTraceObjectID](self->_queue, "globalTraceObjectID");
    v6 = -[MTLCommandBuffer globalTraceObjectID](self->_gpuCommandBuffer, "globalTraceObjectID");
    gpuBlitEncoder = self->_gpuBlitEncoder;
    if (gpuBlitEncoder)
    {
      -[MTLBlitCommandEncoder endEncoding](gpuBlitEncoder, "endEncoding");

      self->_gpuBlitEncoder = 0;
    }
    gpuCommandBuffer = self->_gpuCommandBuffer;
    v9 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke;
    v34[3] = &unk_24CC3FD08;
    v34[4] = self;
    -[MTLCommandBuffer addCompletedHandler:](gpuCommandBuffer, "addCompletedHandler:", v34);
    v10 = self->_gpuCommandBuffer;
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_2;
    aBlock[3] = &unk_24CC3FD58;
    aBlock[4] = self;
    aBlock[5] = v10;
    aBlock[6] = v5;
    aBlock[7] = v6;
    *((_QWORD *)v3 + 1) = _Block_copy(aBlock);
    v3[16] = 1;
    p_notificationCount = &self->_notificationCount;
    do
      v12 = __ldaxr(p_notificationCount);
    while (__stlxr(v12 + 1, p_notificationCount));

    self->_gpuCommandBuffer = 0;
    self->_hasFollowOnGPUWork = 0;
  }
  else
  {
    lastBarrierNotificationCount = self->_lastBarrierNotificationCount;
    v14 = &self->_notificationCount;
    v15 = atomic_load(&self->_notificationCount);
    if (lastBarrierNotificationCount != v15)
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_4;
      v32[3] = &unk_24CC3FD80;
      v32[4] = self;
      *((_QWORD *)v3 + 1) = _Block_copy(v32);
      v3[16] = 1;
      do
        v16 = __ldaxr(v14);
      while (__stlxr(v16 + 1, v14));
      v17 = atomic_load(v14);
      self->_lastBarrierNotificationCount = v17;
    }
  }
  p_commandCallbackBlocks = &self->_commandCallbackBlocks;
  isa = self[1].super.super.super.isa;
  label = self[1].super.super._label;
  if (isa >= (Class)label)
  {
    v22 = (isa - p_commandCallbackBlocks->__begin_) >> 3;
    if ((unint64_t)(v22 + 1) >> 61)
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    v23 = (char *)label - (char *)p_commandCallbackBlocks->__begin_;
    v24 = v23 >> 2;
    if (v23 >> 2 <= (unint64_t)(v22 + 1))
      v24 = v22 + 1;
    if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
      v25 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v25 = v24;
    if (v25)
      v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&self[1].super.super._label, v25);
    else
      v26 = 0;
    v27 = &v26[8 * v22];
    v28 = (NSString *)&v26[8 * v25];
    *(_QWORD *)v27 = *v4;
    v21 = (objc_class *)(v27 + 8);
    begin = p_commandCallbackBlocks->__begin_;
    v29 = self[1].super.super.super.isa;
    if (v29 != p_commandCallbackBlocks->__begin_)
    {
      do
      {
        v31 = *((_QWORD *)v29 - 1);
        v29 = (Class)((char *)v29 - 8);
        *((_QWORD *)v27 - 1) = v31;
        v27 -= 8;
      }
      while (v29 != begin);
      v29 = p_commandCallbackBlocks->__begin_;
    }
    p_commandCallbackBlocks->__begin_ = (?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *)v27;
    self[1].super.super.super.isa = v21;
    self[1].super.super._label = v28;
    if (v29)
      operator delete(v29);
  }
  else
  {
    *(_QWORD *)isa = *v4;
    v21 = (Class)((char *)isa + 8);
  }
  self[1].super.super.super.isa = v21;
  -[_MTLIOCommandBuffer reuseActiveScratchBuffers](self, "reuseActiveScratchBuffers");
}

uint64_t __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  if (objc_msgSend(a2, "status") == 4)
    v3 = 3;
  else
    v3 = 2;
  return objc_msgSend(v2, "barrierComplete:", v3);
}

void __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  __int128 v10;

  if (a2 != 3)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 410))
    {
      v7 = (int)*MEMORY[0x24BDDD8F0];
      *(_QWORD *)(v3 + v7) = 1;
      objc_msgSend(*(id *)(a1 + 32), "barrierComplete:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + v7));
      if (*(_DWORD *)__globalGPUCommPage)
        IOGPUDeviceTraceEvent();
    }
    else
    {
      v4 = *(NSObject **)(v3 + 376);
      v5 = objc_msgSend(*(id *)(v3 + 304), "getDecompressionQueue");
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_3;
      v8[3] = &unk_24CC3FD30;
      v6 = *(_OWORD *)(a1 + 48);
      v9 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
      v10 = v6;
      dispatch_group_async(v4, v5, v8);
    }
  }
}

uint64_t __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "commit");
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
  result = objc_msgSend(*(id *)(a1 + 32), "waitUntilCompleted");
  if (*(_DWORD *)__globalGPUCommPage)
    return IOGPUDeviceTraceEvent();
  return result;
}

void __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[9];

  if (a2 != 3)
  {
    block[7] = v2;
    block[8] = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 376);
    v7 = objc_msgSend(*(id *)(v5 + 304), "getDecompressionQueue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_5;
    block[3] = &unk_24CC3F880;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_group_async(v6, v7, block);
  }
}

uint64_t __39__IOGPUMetalIOCommandBuffer_addBarrier__block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "barrierComplete:", 3);
  if (*(_DWORD *)__globalGPUCommPage)
    return IOGPUDeviceTraceEvent();
  return result;
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  _QWORD *v7;

  v7 = -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:](self, "getCommandBufferBytes:", 24);
  bzero(v7 + 1, 0x10uLL);
  *((_DWORD *)v7 + 2) = objc_msgSend(a3, "eventPort");
  v7[2] = a4;
  *v7 = 0x1800000003;
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8E8]))
    MTLResourceListAddResource();
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  _QWORD *v7;

  -[IOGPUMetalIOCommandBuffer addBarrier](self, "addBarrier");
  v7 = -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:](self, "getCommandBufferBytes:", 24);
  bzero(v7 + 1, 0x10uLL);
  *((_DWORD *)v7 + 2) = objc_msgSend(a3, "eventPort");
  v7[2] = a4;
  *v7 = 0x1800000002;
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD8E8]))
    MTLResourceListAddResource();
}

- (void)enqueue
{
  uint64_t v2;

  v2 = (int)*MEMORY[0x24BDDD8D0];
  if (!*((_BYTE *)&self->super.super.super.isa + v2))
  {
    *((_BYTE *)&self->super.super.super.isa + v2) = 1;
    -[IOGPUMetalIOCommandQueue enqueueCommandBuffer:](self->_queue, "enqueueCommandBuffer:", self);
  }
}

- (void)commit
{
  if (self->_committed)
    MTLReportFailure();
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
  -[_MTLIOCommandBuffer clearScratchBufferLists](self, "clearScratchBufferLists");
  -[IOGPUMetalIOCommandBuffer enqueue](self, "enqueue");
  self->_committed = 1;
  -[IOGPUMetalIOCommandQueue commitCommandBuffer:](self->_queue, "commitCommandBuffer:", self);
}

- (BOOL)isCommitted
{
  return self->_committed;
}

- (void)didCompleteWithStatus:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLBlitCommandEncoder *gpuBlitEncoder;
  MTLCommandBuffer *gpuCommandBuffer;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  objc_super v14;
  _QWORD v15[7];

  v5 = -[IOGPUMetalIOCommandQueue globalTraceObjectID](self->_queue, "globalTraceObjectID");
  v6 = -[MTLCommandBuffer globalTraceObjectID](self->_gpuCommandBuffer, "globalTraceObjectID");
  dispatch_group_wait((dispatch_group_t)self->_ioCompletionGroup, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (int)*MEMORY[0x24BDDD8F0];
  if (!*(Class *)((char *)&self->super.super.super.isa + v7))
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)a3;
  if (self->_hasFollowOnGPUWork)
  {
    if (self->_tryCancel)
      *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)1;
    if (!-[IOGPUMetalIOCommandBuffer hasFollowOnWork](self, "hasFollowOnWork"))
      -[IOGPUMetalIOCommandBuffer didCompleteWithStatus:].cold.2();
    if (*(Class *)((char *)&self->super.super.super.isa + v7) == (Class)3)
    {
      gpuBlitEncoder = self->_gpuBlitEncoder;
      if (gpuBlitEncoder)
      {
        -[MTLBlitCommandEncoder endEncoding](gpuBlitEncoder, "endEncoding");

        self->_gpuBlitEncoder = 0;
      }
      gpuCommandBuffer = self->_gpuCommandBuffer;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __51__IOGPUMetalIOCommandBuffer_didCompleteWithStatus___block_invoke;
      v15[3] = &unk_24CC3FDA8;
      v15[4] = self;
      v15[5] = v5;
      v15[6] = v6;
      -[MTLCommandBuffer addCompletedHandler:](gpuCommandBuffer, "addCompletedHandler:", v15);
      -[MTLCommandBuffer commit](self->_gpuCommandBuffer, "commit");
      if (*(_DWORD *)__globalGPUCommPage)
        goto LABEL_18;
    }
    else
    {
      -[IOGPUMetalIOCommandQueue commandBufferComplete](self->_queue, "commandBufferComplete");
      v12 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
      v14.receiver = self;
      v14.super_class = (Class)IOGPUMetalIOCommandBuffer;
      -[_MTLIOCommandBuffer didCompleteWithStatus:](&v14, sel_didCompleteWithStatus_, v12);
      if (*(_DWORD *)__globalGPUCommPage)
LABEL_18:
        IOGPUDeviceTraceEvent();
    }
  }
  else
  {
    if (atomic_load(&self->_notificationCount))
    {
      if (!-[IOGPUMetalIOCommandBuffer hasFollowOnWork](self, "hasFollowOnWork"))
        -[IOGPUMetalIOCommandBuffer didCompleteWithStatus:].cold.1();
      -[IOGPUMetalIOCommandQueue commandBufferComplete](self->_queue, "commandBufferComplete");
    }
    v11 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    v13.receiver = self;
    v13.super_class = (Class)IOGPUMetalIOCommandBuffer;
    -[_MTLIOCommandBuffer didCompleteWithStatus:](&v13, sel_didCompleteWithStatus_, v11);
    if (*(_DWORD *)__globalGPUCommPage)
      goto LABEL_18;
  }

  self->_stagingBuffers = 0;
}

id __51__IOGPUMetalIOCommandBuffer_didCompleteWithStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id result;
  objc_super v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "commandBufferComplete");
  if (objc_msgSend(a2, "status") == 4)
    v4 = 3;
  else
    v4 = 2;
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)IOGPUMetalIOCommandBuffer;
  result = objc_msgSendSuper2(&v6, sel_didCompleteWithStatus_, v4);
  if (*(_DWORD *)__globalGPUCommPage)
    return (id)IOGPUDeviceTraceEvent();
  return result;
}

- (void)tryCancel
{
  if (!self->_tryCancel)
  {
    self->_tryCancel = 1;
    IOGPUIOCommandQueueTryCancelIOCommandBuffer(self->_queue->_ioCommandQueueRef, self->_commandBufferID);
  }
}

- (void)growKernelCommandBuffer:(unsigned int)a3
{
  IOGPUMetalDeviceShmem *ioKernelCommandShmem;
  char *ioKernelCommandShmemStart;
  char *ioKernelCommandShmemCurrent;
  char *ioKernelCommandShmemEnd;
  unsigned int v8;
  unsigned int v9;
  uint64_t pool;
  unsigned int v11;
  IOGPUMetalDeviceShmem *Shmem;
  uint64_t shmemSize;
  char *virtualAddress;
  void *v15;

  ioKernelCommandShmem = self->_ioKernelCommandShmem;
  if (!ioKernelCommandShmem)
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.1();
  ioKernelCommandShmemStart = self->_ioKernelCommandShmemStart;
  if (!ioKernelCommandShmemStart
    || (ioKernelCommandShmemCurrent = self->_ioKernelCommandShmemCurrent) == 0
    || (ioKernelCommandShmemEnd = self->_ioKernelCommandShmemEnd) == 0)
  {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.2();
  }
  if (ioKernelCommandShmemEnd < ioKernelCommandShmemStart)
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.3();
  v8 = (_DWORD)ioKernelCommandShmemCurrent - (_DWORD)ioKernelCommandShmemStart;
  if (ioKernelCommandShmemCurrent < ioKernelCommandShmemStart)
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.4();
  v9 = a3 + (_DWORD)ioKernelCommandShmemEnd - (_DWORD)ioKernelCommandShmemStart + 8;
  pool = (uint64_t)ioKernelCommandShmem->_priv.pool;
  v11 = *(_DWORD *)(pool + 48);
  while (v11 < v9)
  {
    if (v11 >= 0x200000)
      v11 += 0x100000;
    else
      v11 *= 2;
  }
  -[IOGPUMetalDeviceShmemPool setShmemSize:](ioKernelCommandShmem->_priv.pool, "setShmemSize:");
  Shmem = (IOGPUMetalDeviceShmem *)IOGPUMetalDeviceShmemPoolCreateShmem(pool);
  self->_ioKernelCommandShmem = Shmem;
  if (!Shmem)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.5((uint64_t)self);
    abort();
  }
  shmemSize = Shmem->_shmemSize;
  virtualAddress = (char *)Shmem->_virtualAddress;
  self->_ioKernelCommandShmemStart = virtualAddress;
  if (shmemSize < v9)
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.6();
  self->_ioKernelCommandShmemEnd = &virtualAddress[shmemSize];
  v15 = ioKernelCommandShmem->_virtualAddress;
  if (!v15)
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.7();
  if (shmemSize <= v8)
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:].cold.8();
  memcpy(self->_ioKernelCommandShmemStart, v15, v8);
  IOGPUMetalDeviceShmemRelease((os_unfair_lock_s *)ioKernelCommandShmem);
  self->_ioKernelCommandShmemCurrent = &self->_ioKernelCommandShmemStart[v8];
  self->_commandListHeader = (IOGPUIOKernelCommandListHeader *)self->_ioKernelCommandShmemStart;
}

- (void)getCommandBufferBytes:(unsigned int)a3
{
  char *ioKernelCommandShmemStart;
  void *result;
  char *ioKernelCommandShmemEnd;
  uint64_t v7;

  if (a3 <= 7)
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:].cold.1();
  if (!self->_ioKernelCommandShmem)
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:].cold.2();
  ioKernelCommandShmemStart = self->_ioKernelCommandShmemStart;
  if (!ioKernelCommandShmemStart
    || (result = self->_ioKernelCommandShmemCurrent) == 0
    || (ioKernelCommandShmemEnd = self->_ioKernelCommandShmemEnd) == 0)
  {
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:].cold.3();
  }
  if (ioKernelCommandShmemEnd < ioKernelCommandShmemStart)
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:].cold.4();
  if (result < ioKernelCommandShmemStart)
    -[IOGPUMetalIOCommandBuffer getCommandBufferBytes:].cold.5();
  v7 = a3;
  if (ioKernelCommandShmemEnd - (_BYTE *)result < a3)
  {
    -[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:](self, "growKernelCommandBuffer:");
    result = self->_ioKernelCommandShmemCurrent;
  }
  self->_ioKernelCommandShmemCurrent = (char *)result + v7;
  self->_commandListHeader->var1 = (_DWORD)result + v7 - LODWORD(self->_ioKernelCommandShmemStart);
  return result;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  unint64_t globalTraceObjectID;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalIOCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = -[MTLDevice deviceRef](self->_device, "deviceRef");
    globalTraceObjectID = self->_globalTraceObjectID;
    v7 = (int)*MEMORY[0x24BDDD8D8];
    v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, globalTraceObjectID, v8);
  }
}

- (BOOL)hasFollowOnWork
{
  unsigned int v3;

  if (self->_hasFollowOnGPUWork)
    return 1;
  v3 = atomic_load(&self->_notificationCount);
  return v3 != 0;
}

- (BOOL)validateNotificationCount
{
  unsigned int *p_notificationCount;
  unsigned int v3;
  NSObject *completionQueueDispatch;
  _QWORD block[5];

  p_notificationCount = &self->_notificationCount;
  v3 = atomic_load(&self->_notificationCount);
  if (v3 >= 0x2000)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[IOGPUMetalIOCommandBuffer validateNotificationCount].cold.1(p_notificationCount);
    completionQueueDispatch = self->_queue->_completionQueueDispatch;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__IOGPUMetalIOCommandBuffer_validateNotificationCount__block_invoke;
    block[3] = &unk_24CC3F880;
    block[4] = self;
    dispatch_async(completionQueueDispatch, block);
  }
  return v3 < 0x2000;
}

id __54__IOGPUMetalIOCommandBuffer_validateNotificationCount__block_invoke(uint64_t a1)
{
  objc_super v3;

  objc_msgSend(*(id *)(a1 + 32), "completeCommandCallbackBlocks");
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)IOGPUMetalIOCommandBuffer;
  return objc_msgSendSuper2(&v3, sel_didCompleteWithStatus_, 2);
}

- (void)completeCommandCallbackBlocks
{
  vector<IOGPUIOCommandQueueCommandBufferCallbackBlock, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *p_commandCallbackBlocks;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);

  p_commandCallbackBlocks = &self->_commandCallbackBlocks;
  v3 = self[1].super.super.super.isa - self->_commandCallbackBlocks.__begin_;
  if ((v3 & 0x7FFFFFFF8) != 0)
  {
    v4 = 0;
    v5 = (v3 >> 3);
    do
    {
      v6 = (void (**)(_QWORD, _QWORD))*((_QWORD *)p_commandCallbackBlocks->__begin_ + v4);
      v6[2](v6, 3);
      _Block_release(v6);
      ++v4;
    }
    while (v5 != v4);
  }
}

- (void).cxx_destruct
{
  vector<IOGPUIOCommandQueueCommandBufferCallbackBlock, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *p_commandCallbackBlocks;
  ?)"__end_"^(?)"__end_cap_"{__compressed_pair<IOGPUIOCommandQueueCommandBufferCallbackBlock *, std::allocator<IOGPUIOCommandQueueCommandBufferCallbackBlock>> *begin;

  p_commandCallbackBlocks = &self->_commandCallbackBlocks;
  begin = self->_commandCallbackBlocks.__begin_;
  if (begin)
  {
    p_commandCallbackBlocks[1].__begin_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 52) = 0;
  return self;
}

- (void)initWithQueue:resourceList:retained:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer initWithQueue:resourceList:retained:]", "IOGPUMetalIOCommandBuffer.mm", 42, "[queue isKindOfClass:[IOGPUMetalIOCommandQueue class]]");
}

- (void)loadBytes:size:sourceHandle:sourceHandleOffset:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer loadBytes:size:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 193, "_currentStagingBufferRemainingBytes >= staging_buffer_size");
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 326, "_currentStagingBufferRemainingBytes >= staging_buffer_size");
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.2()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 431, "_gpuCommandBuffer");
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.3()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 433, "_gpuBlitEncoder");
}

- (void)loadBuffer:offset:size:sourceHandle:sourceHandleOffset:.cold.4()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]", "IOGPUMetalIOCommandBuffer.mm", 441, "_gpuBlitEncoder");
}

- (void)didCompleteWithStatus:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer didCompleteWithStatus:]", "IOGPUMetalIOCommandBuffer.mm", 1226, "[self hasFollowOnWork]");
}

- (void)didCompleteWithStatus:.cold.2()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer didCompleteWithStatus:]", "IOGPUMetalIOCommandBuffer.mm", 1170, "[self hasFollowOnWork]");
}

- (void)growKernelCommandBuffer:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1253, "_ioKernelCommandShmem");
}

- (void)growKernelCommandBuffer:.cold.2()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1254, "_ioKernelCommandShmemStart && _ioKernelCommandShmemCurrent && _ioKernelCommandShmemEnd");
}

- (void)growKernelCommandBuffer:.cold.3()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1255, "_ioKernelCommandShmemEnd >= _ioKernelCommandShmemStart");
}

- (void)growKernelCommandBuffer:.cold.4()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1256, "_ioKernelCommandShmemCurrent >= _ioKernelCommandShmemStart");
}

- (void)growKernelCommandBuffer:(uint64_t)a1 .cold.5(uint64_t a1)
{
  int v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 392);
  v2 = 136315394;
  v3 = "-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]";
  v4 = 1024;
  v5 = v1;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s: Failed to Allocate Shmem to grow IOCommandBuffer [commandBufferID: %u]", (uint8_t *)&v2, 0x12u);
}

- (void)growKernelCommandBuffer:.cold.6()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1294, "bytesAllocated >= newSpaceRequired");
}

- (void)growKernelCommandBuffer:.cold.7()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1299, "lastKernelCommandShmem->_virtualAddress");
}

- (void)growKernelCommandBuffer:.cold.8()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer growKernelCommandBuffer:]", "IOGPUMetalIOCommandBuffer.mm", 1300, "currentBytesInUse < bytesAllocated");
}

- (void)getCommandBufferBytes:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1314, "byteCount >= sizeof(sIOGPUIOKernelCommand)");
}

- (void)getCommandBufferBytes:.cold.2()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1316, "_ioKernelCommandShmem");
}

- (void)getCommandBufferBytes:.cold.3()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1317, "_ioKernelCommandShmemStart && _ioKernelCommandShmemCurrent && _ioKernelCommandShmemEnd");
}

- (void)getCommandBufferBytes:.cold.4()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1318, "_ioKernelCommandShmemEnd >= _ioKernelCommandShmemStart");
}

- (void)getCommandBufferBytes:.cold.5()
{
  __assert_rtn("-[IOGPUMetalIOCommandBuffer getCommandBufferBytes:]", "IOGPUMetalIOCommandBuffer.mm", 1319, "_ioKernelCommandShmemCurrent >= _ioKernelCommandShmemStart");
}

- (void)validateNotificationCount
{
  unsigned int v1;
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = atomic_load(a1);
  v2[0] = 67109376;
  v2[1] = v1;
  v3 = 1024;
  v4 = 0x2000;
  _os_log_error_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "IOCommandBuffer NotificationCount(%u) >= IOQueue MaxNotificationDepth(%d)", (uint8_t *)v2, 0xEu);
}

@end
