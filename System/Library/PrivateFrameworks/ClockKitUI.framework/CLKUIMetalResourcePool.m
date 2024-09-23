@implementation CLKUIMetalResourcePool

+ (id)bufferPoolWithLength:(unint64_t)a3 andOptions:(unint64_t)a4 expectedCountPerFrame:(unint64_t)a5
{
  CLKUIMetalResourcePool *v8;
  _QWORD v10[6];

  v8 = [CLKUIMetalResourcePool alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__CLKUIMetalResourcePool_bufferPoolWithLength_andOptions_expectedCountPerFrame___block_invoke;
  v10[3] = &__block_descriptor_48_e5__8__0l;
  v10[4] = a3;
  v10[5] = a4;
  return -[CLKUIMetalResourcePool initWithCreationBlock:expectedCountPerFrame:](v8, "initWithCreationBlock:expectedCountPerFrame:", v10, a5);
}

id __80__CLKUIMetalResourcePool_bufferPoolWithLength_andOptions_expectedCountPerFrame___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBufferWithLength:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v3;
}

+ (id)texturePoolWithDescriptor:(id)a3 expectedCountPerFrame:(unint64_t)a4
{
  id v5;
  CLKUIMetalResourcePool *v6;
  id v7;
  CLKUIMetalResourcePool *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = [CLKUIMetalResourcePool alloc];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__CLKUIMetalResourcePool_texturePoolWithDescriptor_expectedCountPerFrame___block_invoke;
  v10[3] = &unk_1E86E03D8;
  v11 = v5;
  v7 = v5;
  v8 = -[CLKUIMetalResourcePool initWithCreationBlock:expectedCountPerFrame:](v6, "initWithCreationBlock:expectedCountPerFrame:", v10, a4);

  return v8;
}

id __74__CLKUIMetalResourcePool_texturePoolWithDescriptor_expectedCountPerFrame___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newTextureWithDescriptor:", *(_QWORD *)(a1 + 32));

  return v3;
}

- (CLKUIMetalResourcePool)initWithCreationBlock:(id)a3 expectedCountPerFrame:(unint64_t)a4
{
  id v6;
  CLKUIMetalResourcePool *v7;
  void *v8;
  id creationBlock;
  dispatch_queue_t v10;
  OS_dispatch_queue *buffersQueue;
  uint64_t v12;
  NSMutableArray *resourcePool;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKUIMetalResourcePool;
  v7 = -[CLKUIMetalResourcePool init](&v15, sel_init);
  if (v7)
  {
    v8 = _Block_copy(v6);
    creationBlock = v7->_creationBlock;
    v7->_creationBlock = v8;

    v10 = dispatch_queue_create("CLKUIMetalResourcePoolQueue", 0);
    buffersQueue = v7->_buffersQueue;
    v7->_buffersQueue = (OS_dispatch_queue *)v10;

    v12 = objc_opt_new();
    resourcePool = v7->_resourcePool;
    v7->_resourcePool = (NSMutableArray *)v12;

    v7->_expectedCountPerFrame = a4;
  }

  return v7;
}

- (id)dequeueReusableResourceForUseOnCommandBuffer:(id)a3
{
  id v4;
  NSObject *buffersQueue;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  buffersQueue = self->_buffersQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke;
  block[3] = &unk_1E86E0400;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(buffersQueue, block);
  if (!v14[5])
  {
    (*((void (**)(void))self->_creationBlock + 2))();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v14[5];
    v14[5] = v7;

  }
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke_2;
  v11[3] = &unk_1E86E0428;
  v11[4] = self;
  v11[5] = &v13;
  objc_msgSend(v4, "addCompletedHandler:", v11);
  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

uint64_t __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeLastObject");
  }
  return result;
}

uint64_t __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "returnReusableResource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)dequeueReusableResource
{
  return -[CLKUIMetalResourcePool dequeueReusableResourceForUseOnCommandBuffer:](self, "dequeueReusableResourceForUseOnCommandBuffer:", 0);
}

- (void)returnReusableResource:(id)a3
{
  id v4;
  NSObject *buffersQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  buffersQueue = self->_buffersQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CLKUIMetalResourcePool_returnReusableResource___block_invoke;
  v7[3] = &unk_1E86E0450;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(buffersQueue, v7);

}

unint64_t __49__CLKUIMetalResourcePool_returnReusableResource___block_invoke(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (result < *(_QWORD *)(v3 + 24))
    return objc_msgSend(*(id *)(v3 + 16), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_resourcePool, 0);
  objc_storeStrong((id *)&self->_buffersQueue, 0);
}

@end
