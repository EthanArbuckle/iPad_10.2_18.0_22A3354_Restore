@implementation VNCIContextsHandler

- (id)initWithMaxCount:(void *)a3 metalDevice:
{
  id v6;
  id *v7;
  dispatch_semaphore_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;

  v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)VNCIContextsHandler;
    v7 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 1, a3);
      v8 = dispatch_semaphore_create(a2);
      v9 = a1[2];
      a1[2] = v8;

      *((_DWORD *)a1 + 6) = 0;
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = a1[4];
      a1[4] = v10;

      v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v13 = a1[5];
      a1[5] = v12;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseContexts, 0);
  objc_storeStrong((id *)&self->_freeContexts, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

- (void)releaseCachedResources
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    os_unfair_lock_unlock(v2);
  }
}

- (VNCIContext)waitAndGetAvailableContextReturnError:(uint64_t)a1
{
  VNCIContext *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  VNCIContext *v13;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (VNCIContext *)0;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 16), 0xFFFFFFFFFFFFFFFFLL);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v2 = (VNCIContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 8);
    v4 = (void *)MEMORY[0x1E0C9DD90];
    v5 = *MEMORY[0x1E0C9DF58];
    if (v3)
    {
      v17[0] = MEMORY[0x1E0C9AAA0];
      v6 = *MEMORY[0x1E0C9DF88];
      v16[0] = v5;
      v16[1] = v6;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("VNCIContextsHandler_MetalRegistryID_%llu"), objc_msgSend(*(id *)(a1 + 8), "registryID"));
      v17[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contextWithMTLDevice:options:", v3, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = *MEMORY[0x1E0C9DFB8];
      v18[0] = *MEMORY[0x1E0C9DF58];
      v18[1] = v10;
      v19[0] = MEMORY[0x1E0C9AAA0];
      v19[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contextWithOptions:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v2 = [VNCIContext alloc];
    v11 = (id)a1;
    v12 = v9;
    if (v2)
    {
      v15.receiver = v2;
      v15.super_class = (Class)VNCIContext;
      v13 = (VNCIContext *)objc_msgSendSuper2(&v15, sel_init);
      v2 = v13;
      if (v13)
      {
        objc_storeWeak((id *)&v13->_handler, v11);
        objc_storeStrong((id *)&v2->_ciContext, v9);
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  return v2;
}

@end
