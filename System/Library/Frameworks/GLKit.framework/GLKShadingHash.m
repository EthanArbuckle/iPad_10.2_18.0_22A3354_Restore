@implementation GLKShadingHash

- (GLKShadingHash)init
{
  GLKShadingHash *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GLKShadingHash;
  v2 = -[GLKShadingHash init](&v4, sel_init);
  if (v2)
  {
    v2->_vshQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GLKShadingHashVsh", 0);
    v2->_fshQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GLKShadingHashFsh", 0);
    v2->_compiledVshs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->_compiledFshs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v2;
}

- (void)purgeAllShaders
{
  uint64_t v3;
  NSObject *vshQueue;
  NSObject *fshQueue;
  _QWORD v6[5];
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__GLKShadingHash_purgeAllShaders__block_invoke;
  block[3] = &unk_24C848408;
  block[4] = self;
  dispatch_sync(vshQueue, block);
  fshQueue = self->_fshQueue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __33__GLKShadingHash_purgeAllShaders__block_invoke_2;
  v6[3] = &unk_24C848408;
  v6[4] = self;
  dispatch_sync(fshQueue, v6);
}

uint64_t __33__GLKShadingHash_purgeAllShaders__block_invoke(uint64_t a1)
{
  void *v2;
  void *i;
  void *v4;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectEnumerator");
  for (i = v2; ; v2 = i)
  {
    v4 = (void *)objc_msgSend(v2, "nextObject");
    if (!v4)
      break;
    glDeleteShader(objc_msgSend(v4, "intValue"));
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

uint64_t __33__GLKShadingHash_purgeAllShaders__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *i;
  void *v4;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectEnumerator");
  for (i = v2; ; v2 = i)
  {
    v4 = (void *)objc_msgSend(v2, "nextObject");
    if (!v4)
      break;
    glDeleteShader(objc_msgSend(v4, "intValue"));
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
}

- (void)setCompiledVsh:(id)a3 forKey:(id)a4
{
  NSObject *vshQueue;
  _QWORD block[7];

  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__GLKShadingHash_setCompiledVsh_forKey___block_invoke;
  block[3] = &unk_24C848430;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(vshQueue, block);
}

uint64_t __40__GLKShadingHash_setCompiledVsh_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[5], a1[6]);
}

- (id)compiledVshForKey:(id)a3
{
  NSObject *vshQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__GLKShadingHash_compiledVshForKey___block_invoke;
  block[3] = &unk_24C8480D8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(vshQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __36__GLKShadingHash_compiledVshForKey___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)setCompiledFsh:(id)a3 forKey:(id)a4
{
  NSObject *fshQueue;
  _QWORD block[7];

  fshQueue = self->_fshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__GLKShadingHash_setCompiledFsh_forKey___block_invoke;
  block[3] = &unk_24C848430;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(fshQueue, block);
}

uint64_t __40__GLKShadingHash_setCompiledFsh_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:", a1[5], a1[6]);
}

- (id)compiledFshForKey:(id)a3
{
  NSObject *fshQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  fshQueue = self->_fshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__GLKShadingHash_compiledFshForKey___block_invoke;
  block[3] = &unk_24C8480D8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(fshQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __36__GLKShadingHash_compiledFshForKey___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *vshQueue;
  NSObject *fshQueue;
  objc_super v6;
  _QWORD v7[5];
  _QWORD block[5];

  v3 = MEMORY[0x24BDAC760];
  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__GLKShadingHash_dealloc__block_invoke;
  block[3] = &unk_24C848408;
  block[4] = self;
  dispatch_sync(vshQueue, block);
  dispatch_release((dispatch_object_t)self->_vshQueue);
  fshQueue = self->_fshQueue;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __25__GLKShadingHash_dealloc__block_invoke_2;
  v7[3] = &unk_24C848408;
  v7[4] = self;
  dispatch_sync(fshQueue, v7);
  dispatch_release((dispatch_object_t)self->_fshQueue);
  v6.receiver = self;
  v6.super_class = (Class)GLKShadingHash;
  -[GLKShadingHash dealloc](&v6, sel_dealloc);
}

void __25__GLKShadingHash_dealloc__block_invoke(uint64_t a1)
{

}

void __25__GLKShadingHash_dealloc__block_invoke_2(uint64_t a1)
{

}

@end
