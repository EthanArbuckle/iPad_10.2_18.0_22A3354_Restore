@implementation VNCIContextManager

- (VNCIContextManager)init
{
  VNCIContextManager *v2;
  VNCIContextManager *v3;
  VNCIContextManager *v4;
  id *v5;
  VNCIContextsHandler *cpuContextsHandler;
  NSMutableDictionary *v7;
  NSMutableDictionary *gpuContextsHandlers;
  objc_super v10;
  objc_super v11;

  v10.receiver = self;
  v10.super_class = (Class)VNCIContextManager;
  v2 = -[VNCIContextManager init](&v10, sel_init);
  if (!v2)
    return 0;
  v11.receiver = v2;
  v11.super_class = (Class)VNCIContextManager;
  v3 = -[VNCIContextManager init](&v11, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_maxContextsCount = 4;
    v5 = -[VNCIContextsHandler initWithMaxCount:metalDevice:]((id *)[VNCIContextsHandler alloc], v3->_maxContextsCount, 0);
    cpuContextsHandler = v4->_cpuContextsHandler;
    v4->_cpuContextsHandler = (VNCIContextsHandler *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    gpuContextsHandlers = v4->_gpuContextsHandlers;
    v4->_gpuContextsHandlers = v7;

    v4->_gpuHandlersLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuContextsHandlers, 0);
  objc_storeStrong((id *)&self->_cpuContextsHandler, 0);
}

void __44__VNCIContextManager_releaseCachedResources__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[VNCIContextsHandler releaseCachedResources](a3);
}

- (id)waitAndGetAvailableContextForComputeDevice:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  if (v5)
  {
    if (+[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", v5))
    {
      -[VNCIContextManager waitAndGetAvailableContextForCPUAndReturnError:](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[VNComputeDeviceUtilities metalDeviceForComputeDevice:](VNComputeDeviceUtilities, "metalDeviceForComputeDevice:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        +[VNProcessingDevice defaultMetalDevice](VNProcessingDevice, "defaultMetalDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "metalDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[VNCIContextManager waitAndGetAvailableContextForMetalDevice:error:](a1, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a3)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("computeDevice"));
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)waitAndGetAvailableContextForCPUAndReturnError:(uint64_t)a1
{
  -[VNCIContextsHandler waitAndGetAvailableContextReturnError:](*(_QWORD *)(a1 + 8));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)waitAndGetAvailableContextForMetalDevice:(uint64_t)a1 error:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v3, "registryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[VNCIContextsHandler initWithMaxCount:metalDevice:]((id *)[VNCIContextsHandler alloc], *(_QWORD *)(a1 + 32), v3);
    objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:");
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  -[VNCIContextsHandler waitAndGetAvailableContextReturnError:]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)waitAndGetAvailableContextFromOptions:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_ComputeStageDeviceAssignments"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VNComputeStageMain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[VNCIContextManager waitAndGetAvailableContextForComputeDevice:error:]((uint64_t)a1, v8, a3);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[VNProcessingDevice defaultMetalDevice](VNProcessingDevice, "defaultMetalDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metalDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        -[VNCIContextManager waitAndGetAvailableContextForMetalDevice:error:]((uint64_t)a1, v10);
      else
        -[VNCIContextManager waitAndGetAvailableContextForCPUAndReturnError:]((uint64_t)a1);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return a1;
}

- (void)releaseContext:(uint64_t)a1
{
  id *v3;
  id WeakRetained;
  id *v5;
  id *v6;
  id *v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained(v3 + 2);
      v5 = v7;
      if (WeakRetained)
      {
        v6 = v5;
        os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
        if ((objc_msgSend(*((id *)WeakRetained + 5), "containsObject:", v6) & 1) != 0)
        {
          objc_msgSend(*((id *)WeakRetained + 4), "addObject:", v6);
          objc_msgSend(*((id *)WeakRetained + 5), "removeObject:", v6);
          os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
          dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 2));
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
        }
      }
    }
    else
    {
      WeakRetained = 0;
    }

    v3 = v7;
  }

}

- (uint64_t)performBlock:(void *)a3 usingAvailableContextForComputeDevice:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  uint64_t (**v10)(id, id, _QWORD *);
  id v11;
  uint64_t v12;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    -[VNCIContextManager waitAndGetAvailableContextForComputeDevice:error:](a1, v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (uint64_t (**)(id, id, _QWORD *))v7;
      v11 = v9;
      v12 = v10[2](v10, v11, a4);
      -[VNCIContextManager releaseContext:](a1, v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
